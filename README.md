Car Sales and Inventory Management System

[Click here to read the documentation](docs/car_sales_project_report.pdf)

A centralized, full-stack DBMS designed to bridge the information gap in the Indian automobile market. This application provides a unified platform for Customers to book vehicles and for Dealers to manage real-time inventory and sales analytics.

Key Features

+ Role-Based Portals: Secure login system that dynamically redirects users to either a Customer or Dealer dashboard based on credentials.

+ Guided Booking Flow: A multi-step interface for customers to select manufacturers, models, and variants with real-time "In Stock" verification.

+ Live Inventory Search: Powerful dealer tools for filtering sales, test drives, and stock by VIN or model in real-time.

+ Sales Analytics: Interactive data visualization using Chart.js to track market leaders by manufacturer and body type.

Tech Stack:

+ Frontend: HTML5, Tailwind CSS, Vanilla JavaScript (Single-Page Application experience).

+ Backend: Node.js with Express.js (RESTful API with 15+ endpoints).

+ Database: SQLite (Relational model with 8 core tables ensuring data integrity).

+ Visualization: Chart.js.

Technical Challenges & Solutions
1. State Management & Asynchronous UI
To prevent the UI from freezing during data retrieval, I utilized the Fetch API for asynchronous calls and implemented global State Management to personalize the user portal without full page reloads.

2. Relational Integrity
I designed a schema that enforces strict business rules: a vehicle (VIN) cannot be sold twice, and bookings can only be made from active "In Stock" inventory.

3. Complex Search Filtering
Developed dynamic search endpoints that build complex SQL queries using JOIN and LIKE operators to filter results across multiple related tables simultaneously.

System Architecture

The system follows a 3-Tier Architecture:

+ Database: Structured relational data storage.

+ Backend: Logic execution and data serving via REST API.

+ Frontend Client: Dynamic rendering of HTML based on JSON data.

