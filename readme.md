# BigRig Movers Database & SQL Analysis

**Name:** Jordan Lew
**Technologies:** Oracle SQL, MongoDB, Git, GitHub

## Project Overview

This project involved designing and working with a relational database for **BigRig Movers**, a fictional moving company.

The database was designed to manage key business information including customers, trucks, trailers and vehicle combinations, with additional database components developed to support the company's quotes, employees and moving jobs.

The project focuses on translating business requirements into a structured database and using SQL to retrieve, modify and analyse business data.

The original database was developed using the Monash University Oracle database environment. This repository contains the SQL and MongoDB scripts from the project; the university-hosted database itself is not publicly exposed.

## Database Design

The database uses a relational structure with separate tables for different business entities.

Some of the core entities include:

| Entity          | Purpose                                                                 |
| --------------- | ----------------------------------------------------------------------- |
| **Customer**    | Stores customer contact and address information                         |
| **Truck**       | Stores truck registration, kilometres, purchase and service information |
| **Trailer**     | Stores trailer identifiers, purchase costs and purchase dates           |
| **Combination** | Represents valid truck and trailer combinations                         |
| **Employee**    | Stores employee information and roles                                   |
| **Quote**       | Stores customer moving quotes                                           |
| **Job**         | Stores information relating to moving jobs                              |

The database uses **primary keys and foreign keys** to establish relationships between entities and maintain referential integrity.

For example, the `combination` table connects trucks and trailers using foreign keys referencing their respective tables.

### Simplified Structure

```text
                 ┌─────────────┐
                 │   Customer  │
                 └──────┬──────┘
                        │
                        ▼
                 ┌─────────────┐
                 │    Quote    │
                 └──────┬──────┘
                        │
                        ▼
                 ┌─────────────┐
                 │     Job     │
                 └─────────────┘

┌─────────────┐       ┌────────────────┐       ┌─────────────┐
│    Truck    │──────►│  Combination   │◄──────│   Trailer   │
└─────────────┘       └────────────────┘       └─────────────┘

                 ┌─────────────┐
                 │   Employee  │
                 └─────────────┘
```

## SQL Techniques

The project demonstrates practical SQL skills including:

* Creating relational database tables
* Defining primary keys
* Defining foreign keys
* Applying `NOT NULL` constraints
* Inserting test data
* Updating and modifying database records
* Joining multiple tables
* Filtering records with `WHERE`
* Sorting results with `ORDER BY`
* Grouping data with `GROUP BY`
* Aggregate functions
* Conditional logic
* Date handling and formatting
* Subqueries
* Business-rule implementation
* Referential integrity

The database also uses Oracle-specific data types such as `VARCHAR2`, `NUMBER` and `DATE`.

## Data Preparation

The project includes test data designed to represent different types of BigRig Movers customers, vehicles and business scenarios.

For example, the customer data includes both individual and business customers, as well as records where optional customer name fields are absent.

This helped test how the database handled different combinations of valid business data rather than relying on identical records.

## Business-Focused SQL Analysis

Rather than only retrieving individual records, the SQL component uses the database to answer business-focused questions.

Examples of the types of analysis included in the project are:

* Identifying customer and quote activity
* Analysing employee involvement in quotes and jobs
* Examining moving jobs
* Connecting jobs with vehicles and employees
* Aggregating business activity
* Filtering records based on specific business requirements
* Identifying relationships between quotes and completed jobs

The `T5-brm-select.sql` script contains the project's main SQL selection and analysis work.

## MongoDB Component

The project also includes a MongoDB component to demonstrate a document-oriented approach to storing and querying data.

The MongoDB implementation is contained in:

```text
T6-brm-mongo.mongodb.js
```

This provides experience working with both:

* **Relational databases** using Oracle SQL
* **Document databases** using MongoDB

## Project Files

| File                      | Purpose                               |
| ------------------------- | ------------------------------------- |
| `brm-schema-insert.sql`   | Initial BigRig Movers schema and data |
| `T1-brm-schema.sql`       | Database schema creation              |
| `T2-brm-insert.sql`       | Data insertion                        |
| `T3-brm-dm.sql`           | Database management/data manipulation |
| `T4-brm-mods.sql`         | Database modifications                |
| `T5-brm-select.sql`       | SQL queries and business analysis     |
| `T6-brm-json.sql`         | JSON-related database work            |
| `T6-brm-mongo.mongodb.js` | MongoDB implementation                |
| `readme.md`               | Project documentation                 |

## Setup

The original project was developed using an Oracle database hosted through the Monash University environment.

The repository does **not** contain database credentials or access to the original university database.

To recreate the relational database in a compatible Oracle environment:

### 1. Create the schema

Run:

```text
T1-brm-schema.sql
```

This creates the required tables, primary keys and database constraints.

### 2. Insert the data

Run:

```text
T2-brm-insert.sql
```

This populates the database with the project's test data.

### 3. Run the database operations

Run the relevant scripts:

```text
T3-brm-dm.sql
T4-brm-mods.sql
T5-brm-select.sql
T6-brm-json.sql
```

### 4. Explore MongoDB

Open:

```text
T6-brm-mongo.mongodb.js
```

in a MongoDB-compatible environment to explore the document-based component.

## Results & Reproducibility

No screenshots are included because the original Oracle database was hosted on the Monash University server and is no longer publicly accessible.

Instead, the repository provides the underlying **schema, test data and SQL scripts** so that the project can be inspected and, where an Oracle-compatible environment is available, recreated.

This keeps the project reproducible without exposing university database credentials or private database infrastructure.

## Skills Demonstrated

### Database Development

* Relational database design
* Entity relationships
* Primary and foreign keys
* Data integrity
* Constraints
* Test data design

### SQL & Data Analysis

* Multi-table joins
* Aggregation
* Filtering
* Sorting
* Grouping
* Subqueries
* Date manipulation
* Business-rule queries

### Other Technologies

* Oracle SQL
* MongoDB
* Git
* GitHub
* VS Code

## Key Takeaway

This project provided practical experience taking business requirements and translating them into a structured database, populating it with realistic test data, and using SQL to extract information relevant to business operations.

It also provided experience working across both **relational and document-oriented database systems** and managing database development work using Git.
