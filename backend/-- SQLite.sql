-- SQLite
CREATE TABLE Manufacturer (
    manufacturer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    country_of_origin TEXT,
    headquarters_address TEXT
);

-- Table 2: Car_Model
-- Stores the specific models for each manufacturer 
CREATE TABLE Car_Model (
    model_id INTEGER PRIMARY KEY AUTOINCREMENT,
    manufacturer_id INTEGER NOT NULL,
    model_name TEXT NOT NULL,
    body_type TEXT CHECK(body_type IN ('SUV', 'Sedan', 'Hatchback', 'MUV', 'Coupe', 'Convertible')),
    year_launched INTEGER,
    FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id)
);

-- Table 3: Car_Variant
-- Stores the different versions of a model 
CREATE TABLE Car_Variant (
    variant_id INTEGER PRIMARY KEY AUTOINCREMENT,
    model_id INTEGER NOT NULL,
    variant_name TEXT NOT NULL,
    engine_type TEXT CHECK(engine_type IN ('Petrol', 'Diesel', 'Electric', 'Hybrid', 'CNG')),
    transmission_type TEXT CHECK(transmission_type IN ('Manual', 'Automatic', 'AMT', 'CVT', 'DCT')),
    fuel_capacity REAL, -- Using REAL for decimal values like liters or kWh
    seating_capacity INTEGER,
    ex_showroom_price INTEGER NOT NULL,
    color_options TEXT, -- Stored as a comma-separated string, e.g., "Red,Blue,White"
    FOREIGN KEY (model_id) REFERENCES Car_Model(model_id)
);

-- Table 4: Dealer
-- Stores information about the dealerships/showrooms.
CREATE TABLE Dealer (
    dealer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    dealer_name TEXT NOT NULL,
    address TEXT,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    pincode TEXT,
    contact_number TEXT,
    email TEXT UNIQUE
);

-- Table 5: Inventory
-- Represents the actual, physical cars available at a dealership.
CREATE TABLE Inventory (
    vin TEXT PRIMARY KEY, 
    variant_id INTEGER NOT NULL,
    dealer_id INTEGER NOT NULL,
    manufacture_date DATE,
    arrival_date DATE,
    status TEXT NOT NULL CHECK(status IN ('In Stock', 'Booked', 'Sold')),
    color TEXT NOT NULL,
    FOREIGN KEY (variant_id) REFERENCES Car_Variant(variant_id),
    FOREIGN KEY (dealer_id) REFERENCES Dealer(dealer_id)
);

-- Table 6: Customer
-- Stores details of buyers.
CREATE TABLE Customer (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT,
    phone_number TEXT NOT NULL UNIQUE,
    email TEXT UNIQUE,
    address TEXT,
    city TEXT,
    pincode TEXT
);

-- Table 7: Sale
-- Records a completed sales transaction.
CREATE TABLE Sale (
    sale_id INTEGER PRIMARY KEY AUTOINCREMENT,
    vin TEXT NOT NULL UNIQUE, -- Each car can only be sold once
    customer_id INTEGER NOT NULL,
    dealer_id INTEGER NOT NULL,
    sale_date DATE NOT NULL,
    final_on_road_price INTEGER NOT NULL,
    payment_mode TEXT CHECK(payment_mode IN ('Finance', 'Cash', 'Cheque', 'Online')),
    salesperson_name TEXT,
    FOREIGN KEY (vin) REFERENCES Inventory(vin),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (dealer_id) REFERENCES Dealer(dealer_id)
);

-- Table 8: Test_Drive
-- Tracks test drive appointments.
CREATE TABLE Test_Drive (
    test_drive_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    dealer_id INTEGER NOT NULL,
    variant_id INTEGER NOT NULL,
    booking_date DATE NOT NULL,
    drive_date_time DATETIME NOT NULL,
    status TEXT NOT NULL CHECK(status IN ('Scheduled', 'Completed', 'Cancelled', 'No Show')),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (dealer_id) REFERENCES Dealer(dealer_id),
    FOREIGN KEY (variant_id) REFERENCES Car_Variant(variant_id)
);

INSERT OR IGNORE INTO Manufacturer (name, country_of_origin, headquarters_address) VALUES
('Maruti Suzuki', 'India', 'New Delhi, Delhi, India'),
('Hyundai', 'South Korea', 'Gurugram, Haryana, India'),
('Tata', 'India', 'Mumbai, Maharashtra, India'),
('Mahindra', 'India', 'Mumbai, Maharashtra, India'),
('Kia', 'South Korea', 'Anantapur, Andhra Pradesh, India'),
('Renault', 'France', 'Chennai, Tamil Nadu, India'),
('Nissan', 'Japan', 'Gurugram, Haryana, India'),
('Volkswagen', 'Germany', 'Pune, Maharashtra, India'),
('Skoda', 'Czech Republic', 'Pune, Maharashtra, India'),
('Citroën', 'France', 'Chennai, Tamil Nadu, India'),
('MG', 'United Kingdom', 'Gurugram, Haryana, India'),
('Jeep', 'USA', 'Pune, Maharashtra, India');



-- Maruti Suzuki Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Brezza', 'SUV', 2016),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Swift', 'Hatchback', 2005),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Dzire', 'Sedan', 2008),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Grand Vitara', 'SUV', 2022),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Fronx', 'SUV', 2023),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Baleno', 'Hatchback', 2015),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Ertiga', 'MUV', 2012),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Wagon R', 'Hatchback', 1999),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Alto K10', 'Hatchback', 2010),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'XL6', 'MUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Celerio', 'Hatchback', 2014),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Ignis', 'Hatchback', 2017),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'S-Presso', 'SUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Invicto', 'MUV', 2023),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Maruti Suzuki'), 'Eeco', 'MUV', 2010);

-- Hyundai Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Grand i10 Nios', 'Hatchback', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Exter', 'SUV', 2023),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'i20', 'Hatchback', 2008),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Aura', 'Sedan', 2020),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Verna', 'Sedan', 2020),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Venue', 'SUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Creta', 'SUV', 2015),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Alcazar', 'SUV', 2021),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Elantra', 'Sedan', 2016),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Tucson', 'SUV', 2016),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Kona Electric', 'SUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Hyundai'), 'Ioniq 5', 'SUV', 2023);

-- Tata Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Tata'), 'Tiago', 'Hatchback', 2016),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Tata'), 'Tigor', 'Sedan', 2017),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Tata'), 'Nexon', 'SUV', 2017),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Tata'), 'Nexon EV', 'SUV', 2020),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Tata'), 'Punch', 'SUV', 2021),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Tata'), 'Harrier', 'SUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Tata'), 'Safari', 'MUV', 2021),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Tata'), 'Altroz', 'Hatchback', 2020);

-- Mahindra Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Mahindra'), 'Thar', 'SUV', 2010),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Mahindra'), 'XUV700', 'SUV', 2021),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Mahindra'), 'XUV300', 'SUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Mahindra'), 'XUV400 (EV)', 'SUV', 2022),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Mahindra'), 'Scorpio', 'SUV', 2002),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Mahindra'), 'Scorpio N', 'SUV', 2022),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Mahindra'), 'Bolero', 'SUV', 2000),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Mahindra'), 'Marazzo', 'MUV', 2018);

-- Kia Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Kia'), 'Sonet', 'SUV', 2020),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Kia'), 'Seltos', 'SUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Kia'), 'Carens', 'MUV', 2022),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Kia'), 'Carnival', 'MUV', 2020),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Kia'), 'EV6', 'SUV', 2022);

-- Renault Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Renault'), 'Kwid', 'Hatchback', 2015),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Renault'), 'Triber', 'MUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Renault'), 'Kiger', 'SUV', 2021),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Renault'), 'Duster', 'SUV', 2012);

-- Nissan Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Nissan'), 'Kicks', 'SUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Nissan'), 'Magnite', 'SUV', 2020);

-- Volkswagen Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Volkswagen'), 'Polo', 'Hatchback', 2002),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Volkswagen'), 'Virtus', 'Sedan', 2022),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Volkswagen'), 'Taigun', 'SUV', 2021),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Volkswagen'), 'T-Roc', 'SUV', 2023),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Volkswagen'), 'Tiguan', 'SUV', 2017);

-- Skoda Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Skoda'), 'Octavia', 'Sedan', 2002),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Skoda'), 'Kushaq', 'SUV', 2021),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Skoda'), 'Slavia', 'Sedan', 2022),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Skoda'), 'Kodiaq', 'SUV', 2018);

-- Citroën Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Citroën'), 'C3', 'Hatchback', 2022),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Citroën'), 'C3 Aircross', 'SUV', 2022);

-- MG Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'MG'), 'Hector', 'SUV', 2019),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'MG'), 'Hector Plus', 'MUV', 2020),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'MG'), 'Gloster', 'SUV', 2020),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'MG'), 'Astor', 'SUV', 2021),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'MG'), 'ZS EV', 'SUV', 2020),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'MG'), 'Comet EV', 'Hatchback', 2023),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'MG'), 'Windsor EV', 'Sedan', 2023);

-- Jeep Models
INSERT INTO Car_Model (manufacturer_id, model_name, body_type, year_launched) VALUES
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Jeep'), 'Compass', 'SUV', 2017),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Jeep'), 'Meridian', 'SUV', 2023),
((SELECT manufacturer_id FROM Manufacturer WHERE name = 'Jeep'), 'Avenger', 'SUV', 2023);

INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Brezza'), 'LXi', '1.5L Petrol Smart Hybrid', '5MT', 48, 5, 869000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Brezza'), 'VXI', '1.5L Petrol Smart Hybrid', '5MT', 48, 5, 975000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Brezza'), 'VXI AT', '1.5L Petrol Smart Hybrid', '6AT', 48, 5, 1115000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Brezza'), 'ZXi', '1.5L Petrol Smart Hybrid', '5MT', 48, 5, 1126000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Brezza'), 'ZXi AT', '1.5L Petrol Smart Hybrid', '6AT', 48, 5, 1282000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Brezza'), 'ZXi+', '1.5L Petrol Smart Hybrid', '5MT', 48, 5, 1258000, 'All colours'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Brezza'), 'ZXi+ AT', '1.5L Petrol Smart Hybrid', '6AT', 48, 5, 1414000, 'All colours');

-- Maruti Suzuki Swift Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Swift'), 'LXI', '1.2L Petrol DualJet', '5MT', 37, 5, 649000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Swift'), 'VXI', '1.2L Petrol DualJet', '5MT', 37, 5, 729000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Swift'), 'VXI AMT', '1.2L Petrol DualJet', 'AMT', 37, 5, 807000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Swift'), 'ZXi', '1.2L Petrol DualJet', '5MT', 37, 5, 829000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Swift'), 'ZXi AMT', '1.2L Petrol DualJet', 'AMT', 37, 5, 880000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Swift'), 'ZXi+', '1.2L Petrol DualJet', '5MT', 37, 5, 899000, 'All colours'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Swift'), 'ZXi+ AMT', '1.2L Petrol DualJet', 'AMT', 37, 5, 964000, 'All colours');

-- Maruti Suzuki Dzire Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Dzire'), 'LXi', '1.2L Petrol', '5MT', 37, 5, 684000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Dzire'), 'VXI', '1.2L Petrol', '5MT', 37, 5, 784000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Dzire'), 'VXI AMT', '1.2L Petrol', 'AMT', 37, 5, 842000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Dzire'), 'ZXi', '1.2L Petrol', '5MT', 37, 5, 854000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Dzire'), 'ZXi AMT', '1.2L Petrol', 'AMT', 37, 5, 912000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Dzire'), 'ZXi+', '1.2L Petrol', '5MT', 37, 5, 950000, 'All colours'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Dzire'), 'ZXi+ AMT', '1.2L Petrol', 'AMT', 37, 5, 1019000, 'All colours');

-- Maruti Suzuki Grand Vitara Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Grand Vitara'), 'Sigma', '1.5L Petrol Smart Hybrid', '5MT', 45, 5, 1070000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Grand Vitara'), 'Delta', '1.5L Petrol Smart Hybrid', '5MT', 45, 5, 1210000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Grand Vitara'), 'Zeta', '1.5L Petrol Smart Hybrid', '6AT', 45, 5, 1300000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Grand Vitara'), 'Zeta+', '1.5L Strong Hybrid', 'e-CVT', 35, 5, 1750000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Grand Vitara'), 'Alpha+', '1.5L Strong Hybrid', 'e-CVT', 35, 5, 1979000, 'Arctic White');

-- Maruti Suzuki Fronx Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Fronx'), 'Sigma', '1.2L Petrol', '5MT', 37, 5, 759000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Fronx'), 'Delta', '1.2L Petrol', 'AMT', 37, 5, 885000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Fronx'), 'Delta+', '1.0L Turbo Petrol Boosterjet', '5MT', 37, 5, 975000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Fronx'), 'Zeta', '1.0L Turbo Petrol Boosterjet', '6AT', 37, 5, 1150000, 'Arctic White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Fronx'), 'Alpha', '1.0L Turbo Petrol Boosterjet', '6AT', 37, 5, 1304000, 'Arctic White');

-- Maruti Suzuki Baleno Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Baleno'), 'Sigma', '1.2L Petrol DualJet', '5MT', 37, 5, 674000, 'Nexa Blue'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Baleno'), 'Delta', '1.2L Petrol DualJet', '5MT', 37, 5, 750000, 'Nexa Blue'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Baleno'), 'Zeta', '1.2L Petrol DualJet', '5MT', 37, 5, 835000, 'Nexa Blue'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Baleno'), 'Zeta AMT', '1.2L Petrol DualJet', 'AMT', 37, 5, 890000, 'Nexa Blue'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Baleno'), 'Alpha', '1.2L Petrol DualJet', 'AMT', 37, 5, 983000, 'Nexa Blue');

-- Maruti Suzuki Ertiga Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Ertiga'), 'LXi', '1.5L Petrol Smart Hybrid', '5MT', 45, 7, 912000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Ertiga'), 'VXi', '1.5L Petrol Smart Hybrid', '5MT', 45, 7, 1050000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Ertiga'), 'ZXi', '1.5L Petrol Smart Hybrid', '5MT', 45, 7, 1100000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Ertiga'), 'ZXi+', '1.5L Petrol Smart Hybrid', '6AT', 45, 7, 1341000, 'White, Silver');

-- Maruti Suzuki Wagon R Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Wagon R'), 'LXI', '1.0L Petrol', '5MT', 32, 5, 554000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Wagon R'), 'VXI', '1.0L Petrol', 'AMT', 32, 5, 645000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Wagon R'), 'ZXi', '1.2L Petrol', '5MT', 32, 5, 690000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Wagon R'), 'ZXi AMT', '1.2L Petrol', 'AMT', 32, 5, 730000, 'White, Silver');

-- Maruti Suzuki Alto K10 Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Alto K10'), 'Std', '1.0L Petrol', '5MT', 27, 4, 399000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Alto K10'), 'LXi', '1.0L Petrol', '5MT', 27, 5, 480000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Alto K10'), 'VXI', '1.0L Petrol', '5MT', 27, 5, 490000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Alto K10'), 'VXi+ AMT', '1.0L Petrol', 'AMT', 27, 5, 535000, 'White, Silver');

-- Maruti Suzuki XL6 Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'XL6'), 'Zeta', '1.5L Petrol Smart Hybrid', '5MT', 45, 6, 1150000, 'Nexa Blue'),
((SELECT model_id FROM Car_Model WHERE model_name = 'XL6'), 'Alpha', '1.5L Petrol Smart Hybrid', '6AT', 45, 6, 1400000, 'Nexa Blue');

-- Maruti Suzuki Celerio Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Celerio'), 'LXi', '1.0L Petrol', '5MT', 32, 5, 537000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Celerio'), 'VXi AMT', '1.0L Petrol', 'AMT', 32, 5, 623000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Celerio'), 'ZXi', '1.0L Petrol', '5MT', 32, 5, 635000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Celerio'), 'ZXi AMT', '1.0L Petrol', 'AMT', 32, 5, 694000, 'White, Silver');

-- Maruti Suzuki Ignis Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Ignis'), 'Sigma', '1.2L Petrol', '5MT', 32, 5, 584000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Ignis'), 'Delta', '1.2L Petrol', '5MT', 32, 5, 650000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Ignis'), 'Zeta', '1.2L Petrol', '5MT', 32, 5, 685000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Ignis'), 'Alpha AMT', '1.2L Petrol', 'AMT', 32, 5, 790000, 'White, Silver');

-- Maruti Suzuki S-Presso Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'S-Presso'), 'Std', '1.0L Petrol', '5MT', 27, 5, 425000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'S-Presso'), 'LXi', '1.0L Petrol', '5MT', 27, 5, 480000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'S-Presso'), 'VXI', '1.0L Petrol', '5MT', 27, 5, 515000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'S-Presso'), 'VXi+ AMT', '1.0L Petrol', 'AMT', 27, 5, 605000, 'White, Silver');

-- Maruti Suzuki Eeco Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Eeco'), '5-seater', '1.2L Petrol', '5MT', 40, 5, 532000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Eeco'), '7-seater', '1.2L Petrol', '5MT', 40, 7, 560000, 'White, Silver'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Eeco'), '5-seater CNG', '1.2L CNG', '5MT', 40, 5, 660000, 'White, Silver');

-- Maruti Suzuki Invicto Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Invicto'), 'Zeta+', '2.0L Petrol Strong Hybrid', 'e-CVT', 52, 7, 2480000, 'White, Black'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Invicto'), 'Alpha+', '2.0L Petrol Strong Hybrid', 'e-CVT', 52, 7, 2842000, 'White, Black');

DROP TABLE IF EXISTS Car_Variant;

--Create the new table without the CHECK constraint.
CREATE TABLE Car_Variant (
    variant_id INTEGER PRIMARY KEY AUTOINCREMENT,
    model_id INTEGER,
    variant_name TEXT NOT NULL,
    engine_type TEXT, -- The CHECK constraint has been removed
    transmission_type TEXT,
    fuel_capacity INTEGER,
    seating_capacity INTEGER,
    ex_showroom_price INTEGER,
    color_options TEXT,
    FOREIGN KEY (model_id) REFERENCES Car_Model(model_id)
);


DELETE FROM Car_Variant
WHERE model_id IN (
    -- This subquery finds all model_ids that belong to Hyundai
    SELECT cm.model_id
    FROM Car_Model cm
    JOIN Manufacturer m ON cm.manufacturer_id = m.manufacturer_id
    WHERE m.name = 'Hyundai'
);

-- Hyundai Grand i10 Nios Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Grand i10 Nios'), 'Era 1.2 MT', '1.2L Petrol', '5-speed Manual', 37, 5, 598000, 'Atlas White, Starry Night'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Grand i10 Nios'), 'Magna 1.2 MT', '1.2L Petrol', '5-speed Manual', 37, 5, 660000, 'Atlas White, Starry Night'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Grand i10 Nios'), 'Asta 1.2 AMT', '1.2L Petrol', 'AMT', 37, 5, 865000, 'Atlas White, Starry Night');

-- Hyundai Exter Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Exter'), 'EX', '1.2L Petrol', '5-speed Manual', 37, 5, 600000, 'Atlas White, Fiery Red'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Exter'), 'SX (O) AMT', '1.2L Petrol', 'AMT', 37, 5, 950000, 'Atlas White with Abyss Black');

-- Hyundai i20 Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'i20'), 'Magna 1.2 MT', '1.2L Petrol', '5-speed Manual', 40, 5, 704000, 'Amazon Grey, Fiery Red'),
((SELECT model_id FROM Car_Model WHERE model_name = 'i20'), 'Asta 1.0 Turbo DCT', '1.0L Turbo Petrol', '7-speed DCT', 40, 5, 1250000, 'Amazon Grey, Fiery Red');

-- Hyundai Aura Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Aura'), 'E 1.2 MT', '1.2L Petrol', '5-speed Manual', 37, 5, 648000, 'Fiery Red, Starry Night'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Aura'), 'SX 1.2 AMT', '1.2L Petrol', 'AMT', 37, 5, 840000, 'Fiery Red, Starry Night');

-- Hyundai Verna Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Verna'), 'S 1.5 MT', '1.5L Petrol (NA)', '5-speed Manual', 45, 5, 1100000, 'Titan Grey, Abyss Black'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Verna'), 'SX+ 1.5 IVT', '1.5L Petrol', 'IVT (CVT)', 45, 5, 1504000, 'Titan Grey, Abyss Black');

-- Hyundai Venue Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Venue'), 'E 1.2 MT', '1.2L Petrol', '5-speed Manual', 45, 5, 794000, 'Typhoon Silver, Titan Grey'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Venue'), 'SX(O) Turbo DCT', '1.0L Turbo Petrol', '7-speed DCT', 45, 5, 1280000, 'Typhoon Silver, Titan Grey');

-- Hyundai Creta Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Creta'), 'E 1.5 MT', '1.5L Petrol', '6-speed Manual', 60, 5, 1111000, 'Robust Emerald Pearl'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Creta'), 'SX Plus 1.5 Turbo DCT', '1.5L Turbo Petrol', '7-speed DCT', 50, 5, 1850000, 'Robust Emerald Pearl');

-- Hyundai Alcazar Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Alcazar'), 'Premium 2.0 MT 6-Seater', '2.0L Petrol', '6-speed Manual', 50, 6, 1499000, 'Abyss Black, Atlas White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Alcazar'), 'Prestige 2.0 AT 7-Seater', '2.0L Petrol', '6-speed Automatic', 50, 7, 1850000, 'Abyss Black, Atlas White');

-- Hyundai Tucson Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Tucson'), 'GLS 2.0 AT', '2.0L Petrol', '6-speed AT', 54, 5, 2999000, 'Starry Night, Abyss Black');

-- Hyundai Kona Electric Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Kona Electric'), 'Prime', 'Electric', 'Single-speed', 39, 5, 2350000, 'Atlas White, Abyss Black');

-- Hyundai Ioniq 5 Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Ioniq 5'), 'Launch Edition', 'Electric', 'Single-speed', 58, 5, 4500000, 'Ultimate Red, Gravity Gold');


-- =================================================================
-- Tata Variants
-- =================================================================

-- Tata Tiago Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Tiago'), 'XE 1.2 Revotron', '1.2L Petrol', '5-speed Manual', 35, 5, 564000, 'Daytona Grey, Midnight Plum'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Tiago'), 'XZ+ 1.2 Revotron AMT', '1.2L Petrol', '5-speed AMT', 35, 5, 790000, 'Daytona Grey, Midnight Plum'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Tiago'), 'XZ+ CNG', '1.2L Petrol+CNG', '5-speed Manual', 35, 5, 760000, 'Daytona Grey, Midnight Plum');

-- Tata Tigor Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Tigor'), 'XE 1.2 Revotron', '1.2L Petrol', '5-speed Manual', 35, 5, 629000, 'Daytona Grey, Arizona Blue'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Tigor'), 'XZ+ 1.2 Revotron AMT', '1.2L Petrol', '5-speed AMT', 35, 5, 870000, 'Daytona Grey, Arizona Blue'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Tigor'), 'XZ+ CNG', '1.2L Petrol+CNG', '5-speed Manual', 35, 5, 810000, 'Daytona Grey, Arizona Blue');

-- Tata Nexon Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Nexon'), 'Smart 1.2 Revotron', '1.2L Turbo Petrol', '6-speed Manual', 44, 5, 815000, 'Fearless Purple, Creative Ocean'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Nexon'), 'Pure 1.5 Revotorq', '1.5L Diesel', '6-speed Manual', 44, 5, 1000000, 'Fearless Purple, Creative Ocean'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Nexon'), 'Fearless+ 1.2 Revotron DCT', '1.2L Turbo Petrol', '7-speed DCA', 44, 5, 1350000, 'Fearless Purple, Creative Ocean');

-- Tata Nexon EV Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Nexon EV'), 'MR Creative+', 'Electric', 'Single-speed Auto', 30, 5, 1449000, 'Fearless Purple, Empowered Oxide'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Nexon EV'), 'LR Empowered+', 'Electric', 'Single-speed Auto', 41, 5, 1929000, 'Fearless Purple, Empowered Oxide');

-- Tata Punch Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Punch'), 'Pure 1.2 Revotron', '1.2L Petrol', '5-speed Manual', 37, 5, 613000, 'Calgary White, Tornado Blue'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Punch'), 'Accomplished 1.2 AMT', '1.2L Petrol', '5-speed AMT', 37, 5, 785000, 'Calgary White, Tornado Blue'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Punch'), 'Adventure CNG', '1.2L Petrol+CNG', '5-speed Manual', 37, 5, 710000, 'Calgary White, Tornado Blue');

-- Tata Punch EV Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Punch EV'), 'Smart MR', 'Electric', 'Single-speed', 25, 5, 1099000, 'Empowered Oxide, Seaweed Green'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Punch EV'), 'Empowered+ LR', 'Electric', 'Single-speed', 35, 5, 1449000, 'Empowered Oxide, Seaweed Green');

-- Tata Harrier Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Harrier'), 'Smart 2.0 Kryotec', '2.0L Diesel', '6-speed Manual', 50, 5, 1549000, 'Oberon Black, Lunar White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Harrier'), 'Fearless+ AT', '2.0L Diesel', '6-speed Automatic', 50, 5, 2449000, 'Oberon Black, Lunar White');

-- Tata Safari Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Safari'), 'Smart 2.0 Kryotec', '2.0L Diesel', '6-speed Manual', 50, 7, 1619000, 'Oberon Black, Lunar White'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Safari'), 'Accomplished+ AT', '2.0L Diesel', '6-speed Automatic', 50, 7, 2549000, 'Oberon Black, Lunar White');

-- Tata Altroz Variants
INSERT INTO Car_Variant (model_id, variant_name, engine_type, transmission_type, fuel_capacity, seating_capacity, ex_showroom_price, color_options) VALUES
((SELECT model_id FROM Car_Model WHERE model_name = 'Altroz'), 'XE 1.2 Revotron', '1.2L Petrol', '5-speed Manual', 37, 5, 660000, 'Opera Blue, Arcade Grey'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Altroz'), 'XZ+S iTurbo', '1.2L Turbo Petrol', '5-speed Manual', 37, 5, 990000, 'Opera Blue, Arcade Grey'),
((SELECT model_id FROM Car_Model WHERE model_name = 'Altroz'), 'XZ+O CNG', '1.2L Petrol+CNG', '5-speed Manual', 37, 5, 915000, 'Opera Blue, Arcade Grey');

-- Section 1: Dealer Data
-- Creating 2 dealers for each of the three main manufacturers.
INSERT INTO Dealer (dealer_name, address, city, state, pincode, contact_number, email) VALUES
('Nexa KR Puram', '123 Outer Ring Rd, Mahadevapura', 'Bengaluru', 'Karnataka', '560048', '9876543210', 'nexa.krpuram@maruti.com'),
('Arena Motors Mumbai', '456 Andheri West Link Rd', 'Mumbai', 'Maharashtra', '400053', '9876543211', 'arena.mumbai@maruti.com'),
('Capital Hyundai', '789 GST Road, Guindy', 'Chennai', 'Tamil Nadu', '600032', '9876543212', 'sales@capitalhyundai.in'),
('Trident Hyundai Delhi', '101 Connaught Place', 'New Delhi', 'Delhi', '110001', '9876543213', 'contact@tridentdelhi.com'),
('Prerana Motors Tata', '212 Hosur Road, Electronic City', 'Bengaluru', 'Karnataka', '560100', '9876543214', 'info@preranamotors.com'),
('Concorde Motors Tata Pune', '313 Pune-Satara Road', 'Pune', 'Maharashtra', '411009', '9876543215', 'pune@concordetata.com');

-- Section 2: Customer Data
-- Generating 60 random customer profiles.
INSERT INTO Customer (first_name, last_name, phone_number, email, address, city, pincode) VALUES
('Aarav', 'Sharma', '9988776601', 'aarav.sharma@email.com', '101 MG Road', 'Bengaluru', '560001'),
('Vihaan', 'Verma', '9988776602', 'vihaan.verma@email.com', '202 Park Street', 'Kolkata', '700016'),
('Vivaan', 'Singh', '9988776603', 'vivaan.singh@email.com', '303 Marine Drive', 'Mumbai', '400020'),
('Aditya', 'Kumar', '9988776604', 'aditya.kumar@email.com', '404 Anna Salai', 'Chennai', '600002'),
('Reyansh', 'Patel', '9988776605', 'reyansh.patel@email.com', '505 Ashram Road', 'Ahmedabad', '380009'),
('Ayaan', 'Gupta', '9988776606', 'ayaan.gupta@email.com', '606 Janpath', 'New Delhi', '110001'),
('Arjun', 'Reddy', '9988776607', 'arjun.reddy@email.com', '707 Banjara Hills', 'Hyderabad', '500034'),
('Sai', 'Rao', '9988776608', 'sai.rao@email.com', '808 FC Road', 'Pune', '411004'),
('Ishaan', 'Malhotra', '9988776609', 'ishaan.malhotra@email.com', '909 Koramangala', 'Bengaluru', '560095'),
('Anaya', 'Jain', '9988776610', 'anaya.jain@email.com', '111 Brigade Road', 'Bengaluru', '560025'),
('Saanvi', 'Mishra', '9988776611', 'saanvi.mishra@email.com', '212 Salt Lake', 'Kolkata', '700091'),
('Kiara', 'Chopra', '9988776612', 'kiara.chopra@email.com', '313 Juhu', 'Mumbai', '400049'),
('Diya', 'Mehta', '9988776613', 'diya.mehta@email.com', '414 T Nagar', 'Chennai', '600017'),
('Pari', 'Shah', '9988776614', 'pari.shah@email.com', '515 Satellite', 'Ahmedabad', '380015'),
('Myra', 'Aggarwal', '9988776615', 'myra.aggarwal@email.com', '616 Saket', 'New Delhi', '110017'),
('Aadhya', 'Iyer', '9988776616', 'aadhya.iyer@email.com', '717 Gachibowli', 'Hyderabad', '500032'),
('Anika', 'Naidu', '9988776617', 'anika.naidu@email.com', '818 Hinjewadi', 'Pune', '411057'),
('Riya', 'Kapoor', '9988776618', 'riya.kapoor@email.com', '919 Indiranagar', 'Bengaluru', '560038'),
('Kabir', 'Bose', '9988776619', 'kabir.bose@email.com', '121 Ballygunge', 'Kolkata', '700019'),
('Zoya', 'Khan', '9988776620', 'zoya.khan@email.com', '222 Bandra', 'Mumbai', '400050'),
('Rohan', 'Menon', '9988776621', 'rohan.menon@email.com', '323 Velachery', 'Chennai', '600042'),
('Advik', 'Pillai', '9988776622', 'advik.pillai@email.com', '424 Navrangpura', 'Ahmedabad', '380009'),
('Arnav', 'Joshi', '9988776623', 'arnav.joshi@email.com', '525 Hauz Khas', 'New Delhi', '110016'),
('Aryan', 'Nair', '9988776624', 'aryan.nair@email.com', '626 Jubilee Hills', 'Hyderabad', '500033'),
('Dhruv', 'Kulkarni', '9988776625', 'dhruv.kulkarni@email.com', '727 Kothrud', 'Pune', '411038'),
('Krishna', 'Murthy', '9988776626', 'krishna.murthy@email.com', '828 Jayanagar', 'Bengaluru', '560041'),
('Mohammed', 'Ali', '9988776627', 'mohammed.ali@email.com', '929 Howrah', 'Kolkata', '711101'),
('Ritvik', 'Desai', '9988776628', 'ritvik.desai@email.com', '131 Powai', 'Mumbai', '400076'),
('Shaurya', 'Prakash', '9988776629', 'shaurya.prakash@email.com', '232 Adyar', 'Chennai', '600020'),
('Veer', 'Trivedi', '9988776630', 'veer.trivedi@email.com', '333 Bodakdev', 'Ahmedabad', '380054'),
('Yuvan', 'Chauhan', '9988776631', 'yuvan.chauhan@email.com', '434 Lajpat Nagar', 'New Delhi', '110024'),
('Zara', 'Baig', '9988776632', 'zara.baig@email.com', '535 Madhapur', 'Hyderabad', '500081'),
('Shanaya', 'Das', '9988776633', 'shanaya.das@email.com', '636 Viman Nagar', 'Pune', '411014'),
('Aarohi', 'Pawar', '9988776634', 'aarohi.pawar@email.com', '737 Whitefield', 'Bengaluru', '560066'),
('Ira', 'Ghosh', '9988776635', 'ira.ghosh@email.com', '838 Alipore', 'Kolkata', '700027'),
('Neha', 'Soni', '9988776636', 'neha.soni@email.com', '939 Colaba', 'Mumbai', '400005'),
('Pooja', 'Nadar', '9988776637', 'pooja.nadar@email.com', '141 Mylapore', 'Chennai', '600004'),
('Alia', 'Bhatia', '9988776638', 'alia.bhatia@email.com', '242 Maninagar', 'Ahmedabad', '380008'),
('Ranbir', 'Anand', '9988776639', 'ranbir.anand@email.com', '343 Karol Bagh', 'New Delhi', '110005'),
('Deepika', 'Shetty', '9988776640', 'deepika.shetty@email.com', '444 Kondapur', 'Hyderabad', '500084'),
('Hrithik', 'Patil', '9988776641', 'hrithik.patil@email.com', '545 Baner', 'Pune', '411045'),
('Kareena', 'Rao', '9988776642', 'kareena.rao@email.com', '646 Marathahalli', 'Bengaluru', '560037'),
('Shahid', 'Dutta', '9988776643', 'shahid.dutta@email.com', '747 Park Circus', 'Kolkata', '700017'),
('Priyanka', 'Thakur', '9988776644', 'priyanka.thakur@email.com', '848 Worli', 'Mumbai', '400018'),
('Sameer', 'Sundaram', '9988776645', 'sameer.sundaram@email.com', '949 Besant Nagar', 'Chennai', '600090'),
('Tara', 'Vyas', '9988776646', 'tara.vyas@email.com', '151 Vastrapur', 'Ahmedabad', '380015'),
('Varun', 'Saxena', '9988776647', 'varun.saxena@email.com', '252 Dwarka', 'New Delhi', '110075'),
('Yash', 'Begum', '9988776648', 'yash.begum@email.com', '353 Secunderabad', 'Hyderabad', '500003'),
('Abhinav', 'Chavan', '9988776649', 'abhinav.chavan@email.com', '454 Deccan Gymkhana', 'Pune', '411004'),
('Bhavna', 'Gowda', '9988776650', 'bhavna.gowda@email.com', '555 HSR Layout', 'Bengaluru', '560102'),
('Chetan', 'Sarkar', '9988776651', 'chetan.sarkar@email.com', '656 New Town', 'Kolkata', '700156'),
('Divya', 'Tambe', '9988776652', 'divya.tambe@email.com', '757 Thane', 'Mumbai', '400601'),
('Esha', 'Krishnan', '9988776653', 'esha.krishnan@email.com', '858 Anna Nagar', 'Chennai', '600040'),
('Farhan', 'Pandey', '9988776654', 'farhan.pandey@email.com', '959 Gandhinagar', 'Ahmedabad', '382010'),
('Gauri', 'Rawat', '9988776655', 'gauri.rawat@email.com', '161 Noida', 'New Delhi', '201301'),
('Harsh', 'Hussain', '9988776656', 'harsh.hussain@email.com', '262 Begumpet', 'Hyderabad', '500016'),
('Ishita', 'Shinde', '9988776657', 'ishita.shinde@email.com', '363 Camp', 'Pune', '411001'),
('Jatin', 'Biswas', '9988776658', 'jatin.biswas@email.com', '464 BTM Layout', 'Bengaluru', '560076'),
('Kavya', 'Roy', '9988776659', 'kavya.roy@email.com', '565 Dum Dum', 'Kolkata', '700028'),
('Laksh', 'Yadav', '9988776660', 'laksh.yadav@email.com', '666 Chembur', 'Mumbai', '400071');

-- Section 3: Inventory Data
-- Populating inventory for all models across the 6 dealerships.
-- VINs are unique 17-character strings.
INSERT INTO Inventory (vin, variant_id, dealer_id, manufacture_date, arrival_date, status, color) VALUES
-- Maruti Inventory
('MA1B2C3D4E5F6G7H1', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi+'), 1, '2025-07-01', '2025-07-15', 'In Stock', 'Arctic White'),
('MA1B2C3D4E5F6G7H2', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), 1, '2025-07-02', '2025-07-16', 'In Stock', 'Nexa Blue'),
('MA1B2C3D4E5F6G7H3', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), 2, '2025-06-20', '2025-07-05', 'In Stock', 'Nexa Blue'),
('MA1B2C3D4E5F6G7H4', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'ZXi'), 2, '2025-08-01', '2025-08-15', 'In Stock', 'White'),
-- Hyundai Inventory
('HY1B2C3D4E5F6G7H1', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand i10 Nios' AND cv.variant_name = 'Asta 1.2 AMT'), 3, '2025-07-10', '2025-07-25', 'In Stock', 'Atlas White'),
('HY1B2C3D4E5F6G7H2', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Exter' AND cv.variant_name = 'SX (O) AMT'), 3, '2025-07-11', '2025-07-26', 'In Stock', 'Fiery Red'),
('HY1B2C3D4E5F6G7H3', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'i20' AND cv.variant_name = 'Asta 1.0 Turbo DCT'), 4, '2025-06-25', '2025-07-10', 'In Stock', 'Amazon Grey'),
('HY1B2C3D4E5F6G7H4', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Verna' AND cv.variant_name = 'SX+ 1.5 IVT'), 4, '2025-08-05', '2025-08-20', 'In Stock', 'Titan Grey'),
-- Tata Inventory
('TA1B2C3D4E5F6G7H1', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tigor' AND cv.variant_name = 'XZ+ 1.2 Revotron AMT'), 5, '2025-07-15', '2025-08-01', 'In Stock', 'Daytona Grey'),
('TA1B2C3D4E5F6G7H2', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Fearless+ 1.2 Revotron DCT'), 5, '2025-07-16', '2025-08-02', 'In Stock', 'Fearless Purple'),
('TA1B2C3D4E5F6G7H3', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon EV' AND cv.variant_name = 'LR Empowered+'), 6, '2025-06-30', '2025-07-15', 'In Stock', 'Empowered Oxide'),
('TA1B2C3D4E5F6G7H4', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), 6, '2025-08-10', '2025-08-25', 'In Stock', 'Oberon Black'),
-- More Inventory (30 cars to be sold)
('SLD1B2C3D4E5F6G701', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi+'), 1, '2025-05-01', '2025-05-15', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G702', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), 2, '2025-05-02', '2025-05-16', 'In Stock', 'Nexa Blue'),
('SLD1B2C3D4E5F6G703', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand i10 Nios' AND cv.variant_name = 'Asta 1.2 AMT'), 3, '2025-05-03', '2025-05-17', 'In Stock', 'Starry Night'),
('SLD1B2C3D4E5F6G704', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'i20' AND cv.variant_name = 'Asta 1.0 Turbo DCT'), 4, '2025-05-04', '2025-05-18', 'In Stock', 'Fiery Red'),
('SLD1B2C3D4E5F6G705', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tiago' AND cv.variant_name = 'XZ+ 1.2 Revotron AMT'), 5, '2025-05-05', '2025-05-19', 'In Stock', 'Midnight Plum'),
('SLD1B2C3D4E5F6G706', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Fearless+ 1.2 Revotron DCT'), 6, '2025-05-06', '2025-05-20', 'In Stock', 'Creative Ocean'),
('SLD1B2C3D4E5F6G707', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi+ AMT'), 1, '2025-05-07', '2025-05-21', 'In Stock', 'All colours'),
('SLD1B2C3D4E5F6G708', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand Vitara' AND cv.variant_name = 'Alpha+'), 2, '2025-05-08', '2025-05-22', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G709', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Exter' AND cv.variant_name = 'SX (O) AMT'), 3, '2025-05-09', '2025-05-23', 'In Stock', 'Atlas White with Abyss Black'),
('SLD1B2C3D4E5F6G710', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Verna' AND cv.variant_name = 'SX+ 1.5 IVT'), 4, '2025-05-10', '2025-05-24', 'In Stock', 'Abyss Black'),
('SLD1B2C3D4E5F6G711', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), 5, '2025-05-11', '2025-05-25', 'In Stock', 'Lunar White'),
('SLD1B2C3D4E5F6G712', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Accomplished+ AT'), 6, '2025-05-12', '2025-05-26', 'In Stock', 'Oberon Black'),
('SLD1B2C3D4E5F6G713', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Dzire' AND cv.variant_name = 'ZXi'), 1, '2025-05-13', '2025-05-27', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G714', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'ZXi'), 2, '2025-05-14', '2025-05-28', 'In Stock', 'Silve'),
('SLD1B2C3D4E5F6G715', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'SX Plus 1.5 Turbo DCT'), 3, '2025-05-15', '2025-05-29', 'In Stock', 'Robust Emerald Pearl'),
('SLD1B2C3D4E5F6G716', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Alcazar' AND cv.variant_name = 'Prestige 2.0 AT 7-Seater'), 4, '2025-05-16', '2025-05-30', 'In Stock', 'Abyss Black'),
('SLD1B2C3D4E5F6G717', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Pure 1.5 Revotorq'), 5, '2025-05-17', '2025-05-31', 'In Stock', 'Fearless Purple'),
('SLD1B2C3D4E5F6G718', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon EV' AND cv.variant_name = 'LR Empowered+'), 6, '2025-05-18', '2025-06-01', 'In Stock', 'Fearless Purple'),
('SLD1B2C3D4E5F6G719', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'LXI'), 1, '2025-05-19', '2025-06-02', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G720', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Fronx' AND cv.variant_name = 'Sigma'), 2, '2025-05-20', '2025-06-03', 'In Stock', 'Nexa Blue'),
('SLD1B2C3D4E5F6G721', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Kona Electric' AND cv.variant_name = 'Prime'), 3, '2025-05-21', '2025-06-04', 'In Stock', 'Atlas White'),
('SLD1B2C3D4E5F6G722', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ioniq 5' AND cv.variant_name = 'Launch Edition'), 4, '2025-05-22', '2025-06-05', 'In Stock', 'Ultimate Red'),
('SLD1B2C3D4E5F6G723', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tigor' AND cv.variant_name = 'XZ+ CNG'), 5, '2025-05-23', '2025-06-06', 'In Stock', 'Daytona Grey'),
('SLD1B2C3D4E5F6G724', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Punch' AND cv.variant_name = 'Adventure CNG'), 6, '2025-05-24', '2025-06-07', 'In Stock', 'Tornado Blue'),
('SLD1B2C3D4E5F6G725', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Wagon R' AND cv.variant_name = 'VXI'), 1, '2025-05-25', '2025-06-08', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G726', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Fronx' AND cv.variant_name = 'Delta'), 2, '2025-05-26', '2025-06-09', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G727', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Venue' AND cv.variant_name = 'E 1.2 MT'), 3, '2025-05-27', '2025-06-10', 'In Stock', 'Typhoon Silver'),
('SLD1B2C3D4E5F6G728', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tucson' AND cv.variant_name = 'GLS 2.0 AT'), 4, '2025-05-28', '2025-06-11', 'In Stock', 'Starry Night'),
('SLD1B2C3D4E5F6G729', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Altroz' AND cv.variant_name = 'XE 1.2 Revotron'), 5, '2025-05-29', '2025-06-12', 'In Stock', 'Opera Blue'),
('SLD1B2C3D4E5F6G730', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Smart 2.0 Kryotec'), 6, '2025-05-30', '2025-06-13', 'In Stock', 'Oberon Black');
-- Section 4: Sale Data
-- Creating 30 sale records, linking inventory to customers.
-- On-road price is estimated as ex-showroom + 18%.
INSERT INTO Sale (vin, customer_id, dealer_id, sale_date, final_on_road_price, payment_mode, salesperson_name) VALUES
('SLD1B2C3D4E5F6G701', 1, 1, '2025-06-15', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G701')), 'Finance', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G702', 2, 2, '2025-06-18', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G702')), 'Cash', 'Suresh Singh'),
('SLD1B2C3D4E5F6G703', 3, 3, '2025-06-20', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G703')), 'Online', 'Priya Sharma'),
('SLD1B2C3D4E5F6G704', 4, 4, '2025-06-22', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G704')), 'Finance', 'Amit Patel'),
('SLD1B2C3D4E5F6G705', 5, 5, '2025-06-25', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G705')), 'Cheque', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G706', 6, 6, '2025-06-28', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G706')), 'Finance', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G707', 7, 1, '2025-07-01', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G707')), 'Cash', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G708', 8, 2, '2025-07-03', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G708')), 'Online', 'Suresh Singh'),
('SLD1B2C3D4E5F6G709', 9, 3, '2025-07-05', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G709')), 'Finance', 'Priya Sharma'),
('SLD1B2C3D4E5F6G710', 10, 4, '2025-07-07', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G710')), 'Cash', 'Amit Patel'),
('SLD1B2C3D4E5F6G711', 11, 5, '2025-07-10', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G711')), 'Cheque', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G712', 12, 6, '2025-07-12', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G712')), 'Finance', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G713', 13, 1, '2025-07-15', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G713')), 'Online', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G714', 14, 2, '2025-07-18', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G714')), 'Cash', 'Suresh Singh'),
('SLD1B2C3D4E5F6G715', 15, 3, '2025-07-20', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G715')), 'Finance', 'Priya Sharma'),
('SLD1B2C3D4E5F6G716', 16, 4, '2025-07-22', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G716')), 'Cheque', 'Amit Patel'),
('SLD1B2C3D4E5F6G717', 17, 5, '2025-07-25', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G717')), 'Online', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G718', 18, 6, '2025-07-28', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G718')), 'Finance', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G719', 19, 1, '2025-08-01', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G719')), 'Cash', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G720', 20, 2, '2025-08-03', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G720')), 'Finance', 'Suresh Singh'),
('SLD1B2C3D4E5F6G721', 21, 3, '2025-08-05', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G721')), 'Online', 'Priya Sharma'),
('SLD1B2C3D4E5F6G722', 22, 4, '2025-08-07', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G722')), 'Cheque', 'Amit Patel'),
('SLD1B2C3D4E5F6G723', 23, 5, '2025-08-10', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G723')), 'Finance', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G724', 24, 6, '2025-08-12', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G724')), 'Cash', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G725', 25, 1, '2025-08-15', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G725')), 'Online', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G726', 26, 2, '2025-08-18', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G726')), 'Finance', 'Suresh Singh'),
('SLD1B2C3D4E5F6G727', 27, 3, '2025-08-20', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G727')), 'Cash', 'Priya Sharma'),
('SLD1B2C3D4E5F6G728', 28, 4, '2025-08-22', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G728')), 'Cheque', 'Amit Patel'),
('SLD1B2C3D4E5F6G729', 29, 5, '2025-08-25', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G729')), 'Finance', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G730', 30, 6, '2025-08-28', (SELECT ROUND(ex_showroom_price * 1.18) FROM Car_Variant WHERE variant_id = (SELECT variant_id FROM Inventory WHERE vin = 'SLD1B2C3D4E5F6G730')), 'Online', 'Vikram Rathore');

-- Section 5: Update Inventory Status
-- IMPORTANT: This updates the status of the 30 cars that were just sold.
UPDATE Inventory
SET status = 'Sold'
WHERE vin IN (
    'SLD1B2C3D4E5F6G701', 'SLD1B2C3D4E5F6G702', 'SLD1B2C3D4E5F6G703', 'SLD1B2C3D4E5F6G704', 'SLD1B2C3D4E5F6G705',
    'SLD1B2C3D4E5F6G706', 'SLD1B2C3D4E5F6G707', 'SLD1B2C3D4E5F6G708', 'SLD1B2C3D4E5F6G709', 'SLD1B2C3D4E5F6G710',
    'SLD1B2C3D4E5F6G711', 'SLD1B2C3D4E5F6G712', 'SLD1B2C3D4E5F6G713', 'SLD1B2C3D4E5F6G714', 'SLD1B2C3D4E5F6G715',
    'SLD1B2C3D4E5F6G716', 'SLD1B2C3D4E5F6G717', 'SLD1B2C3D4E5F6G718', 'SLD1B2C3D4E5F6G719', 'SLD1B2C3D4E5F6G720',
    'SLD1B2C3D4E5F6G721', 'SLD1B2C3D4E5F6G722', 'SLD1B2C3D4E5F6G723', 'SLD1B2C3D4E5F6G724', 'SLD1B2C3D4E5F6G725',
    'SLD1B2C3D4E5F6G726', 'SLD1B2C3D4E5F6G727', 'SLD1B2C3D4E5F6G728', 'SLD1B2C3D4E5F6G729', 'SLD1B2C3D4E5F6G730'
);

-- Section 6: Test Drive Data
-- Creating 20 test drive records with varied statuses.
INSERT INTO Test_Drive (customer_id, dealer_id, variant_id, booking_date, drive_date_time, status) VALUES
(31, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi+'), '2025-09-01', '2025-09-05 11:00:00', 'Completed'),
(32, 2, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), '2025-09-02', '2025-09-06 14:00:00', 'Completed'),
(33, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand i10 Nios' AND cv.variant_name = 'Asta 1.2 AMT'), '2025-09-03', '2025-09-08 10:00:00', 'Completed'),
(34, 4, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'i20' AND cv.variant_name = 'Asta 1.0 Turbo DCT'), '2025-09-04', '2025-09-09 16:00:00', 'Cancelled'),
(35, 5, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tiago' AND cv.variant_name = 'XZ+ 1.2 Revotron AMT'), '2025-09-05', '2025-09-10 12:00:00', 'No Show'),
(36, 6, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Fearless+ 1.2 Revotron DCT'), '2025-09-06', '2025-09-11 15:00:00', 'Completed'),
(37, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi+ AMT'), '2025-09-07', '2025-09-12 11:30:00', 'Completed'),
(38, 2, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand Vitara' AND cv.variant_name = 'Alpha+'), '2025-09-08', '2025-09-13 13:00:00', 'Scheduled'),
(39, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Exter' AND cv.variant_name = 'SX (O) AMT'), '2025-09-09', '2025-09-14 09:00:00', 'Scheduled'),
(40, 4, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Verna' AND cv.variant_name = 'SX+ 1.5 IVT'), '2025-09-10', '2025-09-16 17:00:00', 'Scheduled'),
(41, 5, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), '2025-09-11', '2025-09-17 10:30:00', 'Scheduled'),
(42, 6, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Accomplished+ AT'), '2025-09-12', '2025-09-18 14:30:00', 'Cancelled'),
(43, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Dzire' AND cv.variant_name = 'ZXi'), '2025-09-13', '2025-09-19 12:30:00', 'Completed'),
(44, 2, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'ZXi'), '2025-09-14', '2025-09-20 15:30:00', 'No Show'),
(45, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'SX Plus 1.5 Turbo DCT'), '2025-09-15', '2025-09-21 11:00:00', 'Scheduled'),
(46, 4, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Alcazar' AND cv.variant_name = 'Prestige 2.0 AT 7-Seater'), '2025-09-16', '2025-09-22 16:30:00', 'Scheduled'),
(47, 5, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Pure 1.5 Revotorq'), '2025-09-17', '2025-09-23 13:30:00', 'Completed'),
(48, 6, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon EV' AND cv.variant_name = 'LR Empowered+'), '2025-09-18', '2025-09-24 10:00:00', 'Completed'),
(49, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'LXI'), '2025-09-19', '2025-09-25 14:00:00', 'Scheduled'),
(50, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Kona Electric' AND cv.variant_name = 'Prime'), '2025-09-20', '2025-09-26 12:00:00', 'Scheduled');


