-- Active: 1729219861796@@127.0.0.1@3001@project@public

CREATE DATABASE Project;

CREATE TABLE Users (
    userID INT PRIMARY KEY,
    userName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    middleInit CHAR(1),
    lastName VARCHAR(50) NOT NULL
);

CREATE TABLE Vehicle (
    vinNum VARCHAR(17) PRIMARY KEY,
    year INT NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    trim_lvl VARCHAR(50),
    mileage INT NOT NULL,
    color VARCHAR(30),
    type VARCHAR(20)
);

CREATE TABLE Listing (
    sellerID INT,
    vinNum VARCHAR(17),
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    dateListed DATE NOT NULL,
    PRIMARY KEY (sellerID, vinNum),
    FOREIGN KEY (sellerID) REFERENCES Users(userID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (vinNum) REFERENCES Vehicle(vinNum) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Buyer (
    userID INT PRIMARY KEY,
    numOfPurchase INT DEFAULT 0,
    buyerRating FLOAT CHECK (buyerRating BETWEEN 1 AND 5),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Seller (
    userID INT PRIMARY KEY,
    numOfSale INT DEFAULT 0,
    sellerRating FLOAT CHECK (sellerRating BETWEEN 1 AND 5),
    financingOffered BOOLEAN,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE FinancingInfo (
    sellerID INT PRIMARY KEY,
    interestRate DECIMAL(3, 2) CHECK(interestRate BETWEEN 0 AND 100),
    FOREIGN KEY (sellerID) REFERENCES Seller(userID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Users (userID, userName, firstName, middleInit, lastName) VALUES
(1, 'john_doe', 'John', 'A', 'Doe'),
(2, 'jane_smith', 'Jane', 'B', 'Smith'),
(3, 'mark_johnson', 'Mark', 'C', 'Johnson'),
(4, 'lisa_brown', 'Lisa', 'D', 'Brown'),
(5, 'peter_parker', 'Peter', 'E', 'Parker'),
(6, 'clark_kent', 'Clark', 'F', 'Kent'),
(7, 'bruce_wayne', 'Bruce', 'G', 'Wayne'),
(8, 'tony_stark', 'Tony', 'H', 'Stark'),
(9, 'natasha_romanoff', 'Natasha', 'I', 'Romanoff'),
(10, 'diana_prince', 'Diana', 'J', 'Prince');

INSERT INTO Vehicle (vinNum, year, make, model, trim_lvl, mileage, color, type) VALUES
('1HGCM82633A123456', 2005, 'Honda', 'Accord', 'EX', 120000, 'Blue', '4-door'),
('1FTFW1ET0EKE12345', 2014, 'Ford', 'F-150', 'Lariat', 80000, 'Red', '4-door'),
('2FMDK3KC7DBA98765', 2013, 'Ford', 'Edge', 'SEL', 60000, 'Black', '4-door'),
('1C4RJFBGXEC123456', 2014, 'Jeep', 'Grand Cherokee', 'Limited', 70000, 'White', '4-door'),
('1N4AL3AP7EC123456', 2014, 'Nissan', 'Altima', '2.5 SV', 50000, 'Silver', '4-door'),
('1HGCR2F3XFA123456', 2015, 'Honda', 'Civic', 'LX', 30000, 'Gray', '4-door'),
('1GNEK13Z03J123456', 2003, 'Chevrolet', 'Tahoe', 'LT', 150000, 'Green', '4-door'),
('1ZVBP8AM1A1234567', 2010, 'Ford', 'Mustang', 'GT', 45000, 'Yellow', '2-door'),
('1FAHP2E84BG123456', 2011, 'Ford', 'Taurus', 'SEL', 70000, 'Blue', '4-door'),
('2C4RDGEG7ER123456', 2014, 'Chrysler', 'Town & Country', 'Limited', 80000, 'Brown', '4-door');

INSERT INTO Listing (sellerID, vinNum, price, description, dateListed) VALUES
(1, '1HGCM82633A123456', 8000.00, 'Well maintained Honda Accord.', '2023-10-01'),
(2, '1FTFW1ET0EKE12345', 25000.00, 'Great condition Ford F-150.', '2023-09-15'),
(3, '2FMDK3KC7DBA98765', 22000.00, 'Family-friendly Ford Edge.', '2023-08-20'),
(4, '1C4RJFBGXEC123456', 30000.00, 'Luxury Jeep Grand Cherokee.', '2023-07-30'),
(5, '1N4AL3AP7EC123456', 15000.00, 'Economical Nissan Altima.', '2023-06-25'),
(6, '1HGCR2F3XFA123456', 18000.00, 'Reliable Honda Civic.', '2023-10-10'),
(7, '1GNEK13Z03J123456', 15000.00, 'Spacious Chevrolet Tahoe.', '2023-10-05'),
(8, '1ZVBP8AM1A1234567', 30000.00, 'Classic Ford Mustang GT.', '2023-09-01'),
(9, '1FAHP2E84BG123456', 16000.00, 'Comfortable Ford Taurus.', '2023-09-12'),
(10, '2C4RDGEG7ER123456', 21000.00, 'Versatile Chrysler Town & Country.', '2023-09-20');

INSERT INTO Buyer (userID, numOfPurchase, buyerRating) VALUES
(1, 5, 4.5),
(2, 10, 4.8),
(3, 2, 4.0),
(4, 3, 4.2),
(5, 1, 5.0),
(6, 4, 3.8),
(7, 6, 4.1),
(8, 5, 4.7),
(9, 2, 4.6),
(10, 7, 4.9);

INSERT INTO Seller (userID, numOfSale, sellerRating, financingOffered) VALUES
(1, 10, 4.6, TRUE),
(2, 8, 4.9, FALSE),
(3, 5, 4.5, TRUE),
(4, 3, 4.3, FALSE),
(5, 7, 4.8, TRUE),
(6, 9, 4.1, FALSE),
(7, 4, 4.4, TRUE),
(8, 12, 4.7, FALSE),
(9, 5, 4.2, TRUE),
(10, 6, 4.5, FALSE);

INSERT INTO FinancingInfo (sellerID, interestRate) VALUES
(1, 3.5),
(3, 4.0),
(5, 3.0),
(7, 3.8),
(9, 4.5);

SELECT * FROM Vehicle WHERE mileage > 100000;

INSERT INTO Users (userID, userName, firstName, middleInit, lastName) 
VALUES (11, 'steve_rogers', 'Steve', 'T', 'Rogers');
SELECT * FROM Users WHERE userID = 11;

INSERT INTO Vehicle (vinNum, year, make, model, trim_lvl, mileage, color, type) 
VALUES ('1HGCM82633A987654', 2020, 'Honda', 'Accord', 'Sport', 15000, 'Black', '4-door');
SELECT * FROM Vehicle WHERE vinNum = '1HGCM82633A987654';

DELETE FROM Listing WHERE sellerID = 2 AND vinNum = '1FTFW1ET0EKE12345';
SELECT * FROM Listing WHERE SellerID = 2 AND vinNum = '1FTFW1ET0EKE12345';

UPDATE Listing 
SET price = 22000.00 
WHERE sellerID = 3 AND vinNum = '2FMDK3KC7DBA98765';
SELECT * FROM Listing WHERE sellerID = 3 AND vinNum = '2FMDK3KC7DBA98765';