# **MySQL-CRUD-Normalization-Store-Database**

This repository contains the development of an exercise to create a MySQL database that includes the first, second, and third normal forms of SQL. The database solves a shop scenario with the following elements:

- The shop has products and suppliers
- The shop sells products and has customers
- The shop only has one seller, the owner
- Customers are not registered, but their document number and document type are requested to make the sale.

The exercise consists of two SQL scripts in two .sql files. When these scripts are executed in MySQL, they should perform the following tasks:

## First Script

The first script should:

- Create the required tables with the necessary relationships
- Fill the tables with pre-existing information to manipulate the database at the data level
- Perform two logical deletions and two physical deletions of sales made
- Modify three products in their name and the supplier who provides them

## Second Script

The second script should:

- Perform a SQL query to obtain the sold products by typing the document type and document number
- Query products by name, which should show who or who have been their suppliers
- (Optional) Create a query that allows you to see which product has been the most sold and in what quantities from highest to lowest
