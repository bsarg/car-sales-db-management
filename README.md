# DBMS Project - Car Dealer Management System

[Click here to read the documentation](car_sales_report.pdf)

A full-stack web application for managing car dealerships and customer interactions, built with Node.js, Express, SQLite, and vanilla HTML/CSS/JavaScript.

## Project Overview

This project implements a **Database Management System (DBMS)** for a car dealership platform that supports two types of users:
- **Dealers**: Can manage vehicle inventory and customer interactions
- **Customers**: Can browse available cars and manage their orders

## Tech Stack

### Backend
- **Runtime**: Node.js
- **Framework**: Express.js (v5.1.0)
- **Database**: SQLite3 (v5.1.7)
- **Middleware**: CORS (v2.8.5)

### Frontend
- **HTML5**
- **CSS3**
- **Vanilla JavaScript**

## Project Structure

```
dbms_project/
├── backend/
│   ├── server.js              # Express server and API endpoints
│   ├── cars.db                # SQLite database file
│   ├── SQLite.sql             # Database schema
│   ├── SQLite1.sql            # Additional database configurations
│   └── public/
│       └── images/            # Static images for the frontend
├── frontend/
│   └── index.html             # Main frontend application
├── package.json               # Project dependencies
└── README.md                  # This file
```

## Features

### Authentication
- User login with email and phone number verification
- Role-based authentication (Dealer/Customer)
- Secure credential validation against database

### API Endpoints
- `/api/login` - User authentication endpoint
- Additional endpoints for car and dealer management (to be documented)

### Database
- **Dealer Table**: Stores dealer information including name, email, and contact details
- **Customer Table**: Stores customer information including name, email, and phone number
- **Additional Tables**: For cars, orders, and transactions (see SQL schema files)

## Installation

### Prerequisites
- Node.js (v14 or higher)
- npm (v6 or higher)

### Setup Instructions

1. **Clone or navigate to the project directory**:
   ```bash
   cd dbms_project
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Start the server**:
   ```bash
   node backend/server.js
   ```
   
   The server will start on `http://localhost:3001`

4. **Access the frontend**:
   Open your browser and navigate to `http://localhost:3001`

## Usage

### For Dealers
1. Log in with your registered email and phone number
2. Access your dealer dashboard
3. Manage vehicle inventory
4. View and manage customer inquiries

### For Customers
1. Log in with your registered email and phone number
2. Browse available vehicles
3. Place orders or inquiries
4. Track your order status

## Database Setup

The SQLite database (`cars.db`) is initialized with schema defined in the SQL files:
- `SQLite.sql` - Primary schema
- `SQLite1.sql` - Additional configurations

To reinitialize the database, run the SQL schema files against the SQLite database.

## API Documentation

### Authentication Endpoint

**POST** `/api/login`

Request body:
```json
{
  "email": "user@example.com",
  "phone": "123-456-7890"
}
```

Response (Dealer):
```json
{
  "role": "dealer",
  "id": 1,
  "name": "John's Auto Dealership"
}
```

Response (Customer):
```json
{
  "role": "customer",
  "id": 1,
  "name": "Jane Doe"
}
```

## Troubleshooting

### Database Connection Issues
- Ensure the SQLite database file (`cars.db`) exists in the `backend/` directory
- Check file permissions
- Verify the database path in `server.js`

### Port Already in Use
- Change the `port` variable in `server.js` if port 3001 is already in use
- Ensure no other service is running on port 3001

### CORS Issues
- Verify CORS is properly configured for your frontend domain
- Check the CORS middleware in `server.js`

## Future Enhancements

- Add comprehensive error handling and logging
- Implement JWT authentication for enhanced security
- Add more API endpoints for CRUD operations
- Implement pagination for large datasets
- Add input validation and sanitization
- Create comprehensive API documentation (Swagger/OpenAPI)
- Add unit and integration tests

## License

This project is part of a database management systems course/assignment.

## Contact

For questions or issues related to this project, please refer to the project documentation or contact the development team.


