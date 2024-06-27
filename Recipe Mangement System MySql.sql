CREATE DATABASE RecipeManagementSystem;

USE RecipeManagementSystem;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Recipes (
    RecipeID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    Category VARCHAR(50),
    CreationDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Ingredients (
    IngredientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE RecipeIngredients (
    RecipeID INT,
    IngredientID INT,
    Quantity VARCHAR(50),
    PRIMARY KEY (RecipeID, IngredientID),
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    RecipeID INT,
    UserID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate DATETIME,
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Users (Username, Password, Email) VALUES
('ali_ahmed', '1122', 'aliahmed@gmail.com'),
('sara_khan', '1133', 'sarakhan@gmail.com'),
('ahmed_hussain', '1144', 'ahmedhussain@gmail.com'),
('fatima_zaidi', '1155', 'fatimazaidi@gmail.com'),
('bilal_shaikh', '1166', 'bilalshaikh@gmail.com'),
('aisha_rizvi', '1177', 'aisharizvi@gmail.com'),
('umer_farooqui', '1188', 'umerfarooqui@gmail.com'),
('amna_ali', '1111', 'amnaali@gmail.com'),
('kashif_mehmood', '1100', 'kashifmehmood@gmail.com'),
('sana_javed', '1234', 'sanajaved@gmail.com');

select * from users;

INSERT INTO Recipes (UserID, Title, Description, Category, CreationDate) VALUES
(1, 'Chicken Biryani', 'Aromatic and flavorful rice dish with marinated chicken.', 'Dinner', '2024-06-27 12:00:00'),
(2, 'Aloo Gosht', 'Tender mutton cooked with potatoes in a rich, spicy gravy.', 'Lunch', '2024-06-27 13:00:00'),
(3, 'Chapli Kebab', 'Spiced minced meat patties, typically served with naan.', 'Snack', '2024-06-27 14:00:00'),
(4, 'Haleem', 'A slow-cooked stew of meat, lentils, and spices.', 'Dinner', '2024-06-27 15:00:00'),
(5, 'Kheer', 'Creamy rice pudding flavored with cardamom and topped with nuts.', 'Dessert', '2024-06-27 16:00:00');

select * from Recipes;

INSERT INTO Ingredients (Name) VALUES
('Chicken'),
('Rice'),
('Tomato'),
('Onion'),
('Garlic'),
('Ginger'),
('Potato'),
('Green Chili'),
('Coriander'),
('Yogurt'),
('Cumin'),
('Turmeric'),
('Red Chili Powder'),
('Salt'),
('Oil');
 
select * from ingredients;
 
INSERT INTO RecipeIngredients (RecipeID, IngredientID, Quantity) VALUES
-- Chicken Biryani Ingredients
(1, 1, '1 kg'),  
(1, 2, '2 cups'), 
(1, 3, '3 pcs'),  
(1, 4, '2 pcs'),  
(1, 5, '4 cloves'), 
(1, 6, '2 tbsp'), 

-- Aloo Gosht Ingredients
(2, 1, '500 g'),  
(2, 7, '3 pcs'),  
(2, 4, '2 pcs'),  
(2, 5, '3 cloves'), 
(2, 6, '1 tbsp'), 
(2, 8, '2 pcs');

INSERT INTO Reviews (RecipeID, UserID, Rating, Comment, ReviewDate) VALUES
(1, 1, 5, 'Absolutely delicious! Best biryani I have ever had.', '2024-06-27 17:00:00'),
(2, 2, 4, 'Aloo Gosht was very tasty and the meat was tender.', '2024-06-27 17:30:00'),
(3, 3, 4, 'Chapli Kebab had a great flavor, loved it!', '2024-06-27 18:00:00'),
(4, 4, 5, 'Haleem was amazing, perfect blend of spices.', '2024-06-27 18:30:00'),
(5, 5, 4, 'Kheer was creamy and delicious, just the right amount of sweetness.', '2024-06-27 19:00:00'),
(1, 6, 5, 'This biryani recipe is my new favorite, highly recommend!', '2024-06-27 19:30:00'),
(2, 7, 3, 'Aloo Gosht was good, but a bit too spicy for my taste.', '2024-06-27 20:00:00'),
(3, 8, 4, 'Chapli Kebab were juicy and flavorful, perfect snack.', '2024-06-27 20:30:00'),
(4, 9, 5, 'Haleem was fantastic, slow-cooked to perfection.', '2024-06-27 21:00:00'),
(5, 10, 4, 'Kheer was very good, a bit thick but still tasty.', '2024-06-27 21:30:00');

select * from RecipeIngredients;

-- -----------------------------------------------Basic Queries for USERS------------------------------------------------

SELECT * FROM Users;

-- ORDER BY
SELECT * FROM Users ORDER BY Username;

-- WHERE
SELECT * FROM Users WHERE Username LIKE 'a%';

-- Update
UPDATE Users SET Password = '112233' WHERE UserID = 1;

-- Delete
-- Find reviews associated with UserID 6
SELECT * FROM Reviews WHERE UserID = 6;

-- Delete reviews associated with UserID 6
DELETE FROM Reviews WHERE UserID = 6;

-- Now delete the user with UserID 6 from Users table
DELETE FROM Users WHERE UserID = 6;


-- -----------------------------------------------Basic Queries for Recipes------------------------------------------------

SELECT * FROM Recipes;

-- ORDER BY
SELECT * FROM Recipes ORDER BY CreationDate DESC;

-- WHERE
SELECT * FROM Recipes WHERE Category = 'Dinner';

-- Update
UPDATE Recipes SET Category = 'Lunch' WHERE Title = 'Chicken Biryani';

-- Delete
-- Find reviews associated with RecipeID 4
SELECT * FROM Reviews WHERE RecipeID = 4;

-- Delete reviews associated with RecipeID 4
DELETE FROM Reviews WHERE RecipeID = 4;

-- Now delete the Recipe with RecipeID 4 from Recipes table
DELETE FROM Recipes WHERE RecipeID = 4;

-- -----------------------------------------------Basic Queries for Ingredients------------------------------------------------

SELECT * FROM Ingredients;

-- ORDER BY
SELECT * FROM Ingredients ORDER BY Name ASC;

-- WHERE
SELECT * FROM Ingredients WHERE Name LIKE 'G%';

-- Update
UPDATE Ingredients SET Name = 'Basmati Rice' WHERE IngredientID = 2;

-- Delete
-- Find reviews associated with IngredientID 5
SELECT * FROM RecipeIngredients WHERE IngredientID = 5;

-- Delete reviews associated with IngredientID 5
DELETE FROM RecipeIngredients WHERE IngredientID = 5;

-- Now delete the Ingredient with IngredientID 5 from Users table
DELETE FROM Ingredients WHERE IngredientID = 5;

-- -----------------------------------------------Basic Queries for RecipeIngredients------------------------------------------------

SELECT * FROM RecipeIngredients;

-- ORDER BY
SELECT * FROM RecipeIngredients ORDER BY RecipeID ASC;

-- WHERE
SELECT * FROM RecipeIngredients WHERE RecipeID = 2;

-- Update
UPDATE RecipeIngredients SET Quantity = '3 cups' WHERE RecipeID = 1 AND IngredientID = 2;

-- Delete
DELETE FROM RecipeIngredients WHERE RecipeID = 1 AND IngredientID = 2;

-- -----------------------------------------------Basic Queries for Reviews ------------------------------------------------

SELECT * FROM Reviews;

-- ORDER BY
SELECT * FROM Reviews ORDER BY ReviewID ASC;

-- WHERE
SELECT * FROM Reviews WHERE RecipeID = 1;

-- Update
UPDATE Reviews SET Comment = 'Delicious!' WHERE ReviewID = 2;

-- Delete
DELETE FROM Reviews WHERE ReviewID = 1;

-- ******************************* Join Query ********************************
-- Joining USERS and Reciped Table
SELECT r.RecipeID, r.Title, r.Description, r.Category, r.CreationDate, u.Username
FROM Recipes r
JOIN Users u ON r.UserID = u.UserID;

-- Joining RecipeIngredients, Recipes, and Ingredients tables
SELECT ri.RecipeID, r.Title AS RecipeTitle, i.Name AS IngredientName, ri.Quantity
FROM RecipeIngredients ri
JOIN Recipes r ON ri.RecipeID = r.RecipeID
JOIN Ingredients i ON ri.IngredientID = i.IngredientID;
 
 -- ******************************* Views ********************************
CREATE VIEW RecipeDetails AS
SELECT r.RecipeID, r.Title, r.Description, r.Category, r.CreationDate, u.Username AS OwnerUsername
FROM Recipes r
JOIN Users u ON r.UserID = u.UserID;

SELECT * FROM RecipeDetails;
-- for specific result
SELECT RecipeID, Title, OwnerUsername FROM RecipeDetails WHERE Category = 'Dessert';

DROP VIEW RecipeDetails;

