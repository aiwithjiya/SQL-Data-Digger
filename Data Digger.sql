C - Create
R - Read | View |
U - Update
D - Delete

-- DATABASE
CREATE DATABASE ShopDB;
USE ShopDB;

-- 1. Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(100)
);

INSERT INTO Customers VALUES
(1, 'Alice', 'alice@gmail.com', 'Surat'),
(2, 'Bob', 'bob@gmail.com', 'Ahmedabad'),
(3, 'Charlie', 'charlie@gmail.com', 'Baroda'),
(4, 'David', 'david@gmail.com', 'Rajkot'),
(5, 'Alice', 'alice2@gmail.com', 'Mumbai');

SELECT * FROM Customers;

UPDATE Customers SET Address='Delhi' WHERE CustomerID=1;

DELETE FROM Customers WHERE CustomerID=5;

SELECT * FROM Customers WHERE Name='Alice';


-- 2. Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount INT
);

INSERT INTO Orders VALUES
(101, 1, '2024-07-01', 500),
(102, 2, '2024-07-10', 800),
(103, 1, '2024-08-01', 1200),
(104, 3, '2024-08-15', 300),
(105, 4, '2024-08-20', 700);

SELECT * FROM Orders WHERE CustomerID=1;

UPDATE Orders SET TotalAmount=900 WHERE OrderID=102;

DELETE FROM Orders WHERE OrderID=105;

SELECT * FROM Orders WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

SELECT 
MAX(TotalAmount) AS Highest,
MIN(TotalAmount) AS Lowest,
AVG(TotalAmount) AS Average
FROM Orders;


-- 3. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price INT,
    Stock INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 50000, 10),
(2, 'Mouse', 500, 50),
(3, 'Keyboard', 1500, 30),
(4, 'Mobile', 20000, 5),
(5, 'Headphones', 2000, 0);

SELECT * FROM Products ORDER BY Price DESC;

UPDATE Products SET Price=1800 WHERE ProductID=3;

DELETE FROM Products WHERE Stock=0;

SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

SELECT MAX(Price) AS Costly, MIN(Price) AS Cheapest FROM Products;


-- 4. OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal INT
);

INSERT INTO OrderDetails VALUES
(1, 101, 2, 2, 1000),
(2, 102, 1, 1, 50000),
(3, 103, 3, 3, 4500),
(4, 104, 2, 1, 500),
(5, 101, 3, 2, 3000);

SELECT * FROM OrderDetails WHERE OrderID=101;

SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;

SELECT ProductID, COUNT(*) AS TimesOrdered
FROM OrderDetails
GROUP BY ProductID
ORDER BY TimesOrdered DESC
LIMIT 3;

SELECT COUNT(*) FROM OrderDetails WHERE ProductID=2;