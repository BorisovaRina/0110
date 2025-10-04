USE ShopDB;
GO

-- 1. статистика по количеству проданных единиц товара в порядке убывания
SELECT 
    Products.ProdID, 
    Products.[Description], 
    SUM(OrderDetails.Qty) AS TotalQty
FROM Products
INNER JOIN OrderDetails ON Products.ProdID = OrderDetails.ProdID
GROUP BY Products.ProdID, Products.[Description]
ORDER BY TotalQty DESC;
GO

-- 2. общая сумму продаж по каждому из товаров
SELECT 
    Products.ProdID, 
    Products.[Description], 
    SUM(OrderDetails.TotalPrice) AS TotalSales
FROM Products
INNER JOIN OrderDetails ON Products.ProdID = OrderDetails.ProdID
GROUP BY Products.ProdID, Products.[Description];
GO

-- 3. общее количество продаж по каждому из сотрудников
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

-- 4. количество продаж по городам
SELECT 
    Customers.City, 
    COUNT(OrderDetails.OrderID) AS SalesCount
FROM Customers
JOIN Orders ON Customers.CustID = Orders.CustID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Customers.City;
GO

-- 5. даты покупок по каждому из покупателей
SELECT 
    Customers.FName, 
    Customers.LName, 
    Orders.OrderDate
FROM Customers
JOIN Orders ON Customers.CustID = Orders.CustID
ORDER BY Customers.LName, Customers.FName, Orders.OrderDate;
GO

-- 6. кто из продавцов каких покупателей обслуживает
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
