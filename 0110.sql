USE ShopDB;
GO

-- 1. ���������� �� ���������� ��������� ������ ������ � ������� ��������
SELECT 
    Products.ProdID, 
    Products.[Description], 
    SUM(OrderDetails.Qty) AS TotalQty
FROM Products
INNER JOIN OrderDetails ON Products.ProdID = OrderDetails.ProdID
GROUP BY Products.ProdID, Products.[Description]
ORDER BY TotalQty DESC;
GO

-- 2. ����� ����� ������ �� ������� �� �������
SELECT 
    Products.ProdID, 
    Products.[Description], 
    SUM(OrderDetails.TotalPrice) AS TotalSales
FROM Products
INNER JOIN OrderDetails ON Products.ProdID = OrderDetails.ProdID
GROUP BY Products.ProdID, Products.[Description];
GO

-- 3. ����� ���������� ������ �� ������� �� �����������
SELECT 
    Employees.FName, 
    Employees.LName, 
    Employees.MName, 
    COUNT(OrderDetails.OrderID) AS SalesCount
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Employees.FName, Employees.LName, Employees.MName;
GO

-- 4. ���������� ������ �� �������
SELECT 
    Customers.City, 
    COUNT(OrderDetails.OrderID) AS SalesCount
FROM Customers
JOIN Orders ON Customers.CustID = Orders.CustID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Customers.City;
GO

-- 5. ���� ������� �� ������� �� �����������
SELECT 
    Customers.FName, 
    Customers.LName, 
    Orders.OrderDate
FROM Customers
JOIN Orders ON Customers.CustID = Orders.CustID
ORDER BY Customers.LName, Customers.FName, Orders.OrderDate;
GO

-- 6. ��� �� ��������� ����� ����������� �����������
SELECT 
    Employees.FName AS SellerFName, 
    Employees.LName AS SellerLName,
    Customers.FName AS CustomerFName, 
    Customers.LName AS CustomerLName
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Orders.CustID = Customers.CustID
GROUP BY Employees.FName, Employees.LName, 
         Customers.FName, Customers.LName
ORDER BY Employees.LName, Customers.LName;
GO
