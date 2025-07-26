# Database-homework



#  Chain Restaurant Supply & Sales Management System (Database Project)

This repository contains a comprehensive **relational database design** and implementation for a **nationwide chain of restaurants**. The system handles **ingredient supply**, **branch operations**, **menu management**, **order tracking**, **employee data**, and **customer interactions** across multiple cities and provinces.

---

##  Project Description

The project was developed as part of an academic assignment in database systems. It demonstrates skills in:

- Designing an ERD (Entity-Relationship Diagram)
- Creating normalized relational tables
- Enforcing data integrity with constraints
- Writing complex SQL with primary/foreign keys
- Inserting realistic sample data for testing

---

##  Database Structure

The database is named: `restoran_zanjirei`

It includes the following main entities:

###  Branches

- **Table**: `shoabat_restoran`
- Stores information about each branch, its location, and management.

###  Ingredient Supply

- **Table**: `tamin_mavad_ghazaii`
- Tracks delivery of food ingredients (e.g., meat, vegetables) to specific branches with date and time.

###  Food Items

- **Table**: `ghaza`
- Defines the food menu per branch along with prices.

###  Food Composition

- **Table**: `joziiat_ghaza`
- Maps dishes to their ingredients.

###  Customer Orders

- **Table**: `sefareshat`
- Stores orders, payment method (`cash`, `credit_card`, `online`), discounts, and timestamps.

###  Organization Orders

- **Table**: `sazmanha`
- Tracks contracts and group orders by companies or institutions.

###  Customer Ratings

- **Table**: `emtiazat`
- Customers rate food and service quality (scale: 0–10).

###  Employees

- **Table**: `manabe_ensani`
- Records staff info such as roles, salary, employment date, and work time.

###  Monthly Work Hours

- **Table**: `joziiat_saat_kari`
- Monthly breakdown of working hours for each employee.

###  Complaints

- **Table**: `shekayat`
- Logs customer complaints, categorized by food or service quality.

---

