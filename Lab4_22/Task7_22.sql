--Create a 1NF
CREATE TABLE ORDER1NF(
    orderId VARCHAR(20),
    OrderDate DATE,
    CustID VARCHAR(20),
    CustName VARCHAR(100),
    CustEmail VARCHAR(100) UNIQUE,
    BookTitle VARCHAR(20),
    BookID VARCHAR(20) PRIMARY KEY,
    PublishedYear VARCHAR(20),
    Price INT,
    QTY INT,
    PRIMARY KEY (orderId,CustID,BookId)
  );

-- Decompose in to 2NF
Drop Table ORDER1NF;

CREATE TABLE ORDER2NF(
    orderId VARCHAR(20),
    OrderDate DATE,
    CustID VARCHAR(20),
    CustName VARCHAR(100),
    CustEmail VARCHAR(100) UNIQUE,
    PRIMARY KEY (orderId,CustID)
    );

 CREATE Table Book2nf(
    BookTitle VARCHAR(20),
    BookID VARCHAR(20) PRIMARY KEY,
    PublishedYear VARCHAR(20),
    Price INT,
    QTY INT,
    OrderId Varchar(20),
    FOREIGN Key (OrderId) REFERENCES order2nf(OrderId)
     );

-- Third Normalization form
Drop Table book2nf;
Drop Table order2nf;

CREATE Table Order3nf(
    OrderID Varchar(20) PRIMARY KEY,
    OrderDATE DATE
    );
    
CREATE TABLE Customer3nf(
    CustId VARCHAR(20) PRIMARY KEY,
    CustName VARCHAR(100),
    CustEmail VARCHAR(100) UNIQUE,
    OrderID VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Order3nf(OrderID)
    );
        
CREATE Table Book3nf(
    BookTitle VARCHAR(20),
    BookID VARCHAR(20) PRIMARY KEY,
    PublishedYear VARCHAR(20),
    Price INT,
    QTY INT,
    OrderID Varchar(20),
    CustId VARCHAR(20),
    FOREIGN Key (OrderID) REFERENCES Order3nf(OrderID),
    FOREIGN Key (CustId) REFERENCES  customer3nf(CustId)
     );

--Verification
SELECT o.OrderDate, c.CustName,c.CustEmail,b.BookTitle
From book3nf b
JOIN order3nf o ON b.OrderID= o.OrderID
JOIN customer3nf c ON b.CustID = c.CustId

ORDER BY c.CustEmail,o.OrderDATE