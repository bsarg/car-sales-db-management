const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const cors = require('cors');
const path = require('path');

const app = express();
const port = 3001;

// Middleware
app.use(cors());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());

// Database Connection
const dbPath = path.resolve(__dirname, 'cars.db');
const db = new sqlite3.Database(dbPath, (err) => {
    if (err) {
        console.error("Error connecting to the database:", err.message);
    } else {
        console.log("Successfully connected to the cars.db database.");
    }
});

// API Endpoints

// Authentication
app.post('/api/login', (req, res) => {
    const { email, phone } = req.body;
    if (!email || !phone) {
        return res.status(400).json({ message: 'Email and phone number are required.' });
    }
    const dealerSql = `SELECT * FROM Dealer WHERE email = ? AND contact_number = ?`;
    db.get(dealerSql, [email, phone], (err, dealer) => {
        if (err) { return res.status(500).json({ error: err.message }); }
        if (dealer) {
            return res.json({ role: 'dealer', id: dealer.dealer_id, name: dealer.dealer_name });
        } else {
            const customerSql = `SELECT * FROM Customer WHERE email = ? AND phone_number = ?`;
            db.get(customerSql, [email, phone], (err, customer) => {
                if (err) { return res.status(500).json({ error: err.message }); }
                if (customer) {
                    return res.json({ role: 'customer', id: customer.customer_id, name: `${customer.first_name} ${customer.last_name}` });
                } else {
                    return res.status(401).json({ message: 'Invalid credentials. User not found.' });
                }
            });
        }
    });
});

// Customer Portal

// Get a specific customer's details
app.get('/api/customers/:id', (req, res) => {
    const sql = `SELECT * FROM Customer WHERE customer_id = ?`;
    db.get(sql, [req.params.id], (err, row) => {
        if (err) {
            res.status(500).json({ "error": err.message });
            return;
        }
        res.json(row);
    });
});

// Get all manufacturers
app.get('/api/manufacturers', (req, res) => {
    const sql = `SELECT * FROM Manufacturer ORDER BY name`;
    db.all(sql, [], (err, rows) => {
        if (err) { res.status(500).json({ "error": err.message }); return; }
        res.json(rows);
    });
});

// Get all models for a manufacturer
app.get('/api/models/:manufacturerId', (req, res) => {
    const sql = `SELECT model_id, model_name, body_type, image_url FROM Car_Model WHERE manufacturer_id = ? ORDER BY model_name`;
    db.all(sql, [req.params.manufacturerId], (err, rows) => {
        if (err) { res.status(500).json({ "error": err.message }); return; }
        res.json(rows);
    });
});

// GET all variants for a model
app.get('/api/variants/:modelId', (req, res) => {
    const sql = `SELECT * FROM Car_Variant WHERE model_id = ? ORDER BY variant_name`;
    db.all(sql, [req.params.modelId], (err, rows) => {
        if (err) { res.status(500).json({ "error": err.message }); return; }
        res.json(rows);
    });
});

// Get available inventory for a variant
app.get('/api/inventory/:variantId', (req, res) => {
    const sql = `
        SELECT i.vin, i.color, d.dealer_name, d.city, d.state
        FROM Inventory i
        JOIN Dealer d ON i.dealer_id = d.dealer_id
        WHERE i.variant_id = ? AND i.status = 'In Stock'
    `;
    db.all(sql, [req.params.variantId], (err, rows) => {
        if (err) { res.status(500).json({ "error": err.message }); return; }
        res.json(rows);
    });
});

// Get details for a specific car in inventory
app.get('/api/inventory/car/:vin', (req, res) => {
    const sql = `
        SELECT i.vin, i.color, d.dealer_name, d.city, cv.variant_name, cv.ex_showroom_price, cm.model_name
        FROM Inventory i
        JOIN Dealer d ON i.dealer_id = d.dealer_id
        JOIN Car_Variant cv ON i.variant_id = cv.variant_id
        JOIN Car_Model cm ON cv.model_id = cm.model_id
        WHERE i.vin = ?
    `;
    db.get(sql, [req.params.vin], (err, row) => {
        if (err) { res.status(500).json({ "error": err.message }); return; }
        res.json(row);
    });
});

// POST to book a car
app.post('/api/book', (req, res) => {
    const { vin, customerId } = req.body;
    const getCarSql = `SELECT i.dealer_id, cv.ex_showroom_price, cm.model_name, cv.variant_name, d.dealer_name FROM Inventory i JOIN Car_Variant cv ON i.variant_id = cv.variant_id JOIN Car_Model cm ON cv.model_id = cm.model_id JOIN Dealer d ON i.dealer_id = d.dealer_id WHERE i.vin = ? AND i.status = 'In Stock'`;
    db.get(getCarSql, [vin], (err, car) => {
        if (err) { return res.status(500).json({ "error": err.message }); }
        if (!car) { return res.status(404).json({ "message": "Car not found or is already booked." }); }
        const saleDate = new Date().toISOString().split('T')[0];
        const onRoadPrice = Math.round(car.ex_showroom_price * 1.18);
        const insertSaleSql = `INSERT INTO Sale (vin, customer_id, dealer_id, sale_date, final_on_road_price, payment_mode) VALUES (?, ?, ?, ?, ?, ?)`;
        db.run(insertSaleSql, [vin, customerId, car.dealer_id, saleDate, onRoadPrice, 'Finance'], function (err) {
            if (err) { return res.status(500).json({ "error": err.message }); }
            const saleId = this.lastID;
            const updateInventorySql = `UPDATE Inventory SET status = 'Booked' WHERE vin = ?`;
            db.run(updateInventorySql, [vin], function (err) {
                if (err) { console.error("Failed to update inventory status for VIN:", vin); }
                res.json({ sale_id: saleId, vin: vin, dealer_name: car.dealer_name, model_name: car.model_name, variant_name: car.variant_name, final_on_road_price: onRoadPrice });
            });
        });
    });
});

// POST to book a test drive
app.post('/api/test-drives', (req, res) => {
    const { customerId, dealerId, variantId, driveDateTime } = req.body;
    const bookingDate = new Date().toISOString().split('T')[0];
    const sql = `INSERT INTO Test_Drive (customer_id, dealer_id, variant_id, booking_date, drive_date_time, status) VALUES (?, ?, ?, ?, ?, 'Scheduled')`;
    db.run(sql, [customerId, dealerId, variantId, bookingDate, driveDateTime], function(err) {
        if (err) { return res.status(500).json({ error: err.message }); }
        res.json({ test_drive_id: this.lastID, message: 'Test drive booked successfully!' });
    });
});

// GET all dealers (for test drive booking)
app.get('/api/dealers', (req, res) => {
    const sql = `SELECT dealer_id, dealer_name, city FROM Dealer`;
    db.all(sql, [], (err, rows) => {
        if (err) { res.status(500).json({ "error": err.message }); return; }
        res.json(rows);
    });
});


// DEALER PORTAL (WITH SEARCH)
app.get('/api/dealer/:dealerId/inventory', (req, res) => {
    const { search = '' } = req.query;
    const searchTerm = `%${search}%`;
    const sql = `
        SELECT i.vin, cm.model_name, cv.variant_name, i.color, i.status, i.arrival_date 
        FROM Inventory i 
        JOIN Car_Variant cv ON i.variant_id = cv.variant_id 
        JOIN Car_Model cm ON cv.model_id = cm.model_id 
        WHERE i.dealer_id = ? AND (
            i.vin LIKE ? OR
            cm.model_name LIKE ? OR
            cv.variant_name LIKE ? OR
            i.color LIKE ? OR
            i.status LIKE ?
        )
        ORDER BY i.arrival_date DESC`;
    db.all(sql, [req.params.dealerId, searchTerm, searchTerm, searchTerm, searchTerm, searchTerm], (err, rows) => { 
        if (err) { res.status(500).json({ "error": err.message }); return; } 
        res.json(rows); 
    });
});

app.get('/api/dealer/:dealerId/sales', (req, res) => {
    const { search = '' } = req.query;
    const searchTerm = `%${search}%`;
    const sql = `
        SELECT s.sale_id, s.sale_date, s.final_on_road_price, s.vin, 
               cm.model_name, cv.variant_name, 
               c.first_name, c.last_name 
        FROM Sale s 
        JOIN Inventory i ON s.vin = i.vin 
        JOIN Car_Variant cv ON i.variant_id = cv.variant_id 
        JOIN Car_Model cm ON cv.model_id = cm.model_id 
        JOIN Customer c ON s.customer_id = c.customer_id 
        WHERE s.dealer_id = ? AND (
            c.first_name LIKE ? OR
            c.last_name LIKE ? OR
            cm.model_name LIKE ? OR
            cv.variant_name LIKE ? OR
            s.vin LIKE ?
        )
        ORDER BY s.sale_date DESC`;
    db.all(sql, [req.params.dealerId, searchTerm, searchTerm, searchTerm, searchTerm, searchTerm], (err, rows) => { 
        if (err) { res.status(500).json({ "error": err.message }); return; } 
        res.json(rows); 
    });
});

app.get('/api/dealer/:dealerId/test-drives', (req, res) => {
    const { search = '' } = req.query;
    const searchTerm = `%${search}%`;
    const sql = `
        SELECT td.test_drive_id, td.drive_date_time, td.status, 
               cm.model_name, cv.variant_name, 
               c.first_name, c.last_name, c.phone_number 
        FROM Test_Drive td 
        JOIN Car_Variant cv ON td.variant_id = cv.variant_id 
        JOIN Car_Model cm ON cv.model_id = cm.model_id 
        JOIN Customer c ON td.customer_id = c.customer_id 
        WHERE td.dealer_id = ? AND (
            c.first_name LIKE ? OR
            c.last_name LIKE ? OR
            c.phone_number LIKE ? OR
            cm.model_name LIKE ? OR
            cv.variant_name LIKE ? OR
            td.status LIKE ?
        )
        ORDER BY td.drive_date_time DESC`;
    db.all(sql, [req.params.dealerId, searchTerm, searchTerm, searchTerm, searchTerm, searchTerm, searchTerm], (err, rows) => { 
        if (err) { res.status(500).json({ "error": err.message }); return; } 
        res.json(rows); 
    });
});


// ANALYTICS 
app.get('/api/analytics/sales-by-brand', (req, res) => {
    const sql = `SELECT m.name, COUNT(s.sale_id) as sales_count FROM Sale s JOIN Inventory i ON s.vin = i.vin JOIN Car_Variant cv ON i.variant_id = cv.variant_id JOIN Car_Model cm ON cv.model_id = cm.model_id JOIN Manufacturer m ON cm.manufacturer_id = m.manufacturer_id GROUP BY m.name ORDER BY sales_count DESC`;
    db.all(sql, [], (err, rows) => { if (err) { res.status(500).json({ "error": err.message }); return; } res.json(rows); });
});
app.get('/api/analytics/sales-by-body-type', (req, res) => {
    const sql = `SELECT cm.body_type, COUNT(s.sale_id) as sales_count FROM Sale s JOIN Inventory i ON s.vin = i.vin JOIN Car_Variant cv ON i.variant_id = cv.variant_id JOIN Car_Model cm ON cv.model_id = cm.model_id GROUP BY cm.body_type ORDER BY sales_count DESC`;
    db.all(sql, [], (err, rows) => { if (err) { res.status(500).json({ "error": err.message }); return; } res.json(rows); });
});


// Server Start
app.listen(port, () => {
    console.log(`Backend server is listening on http://localhost:${port}`);
});

