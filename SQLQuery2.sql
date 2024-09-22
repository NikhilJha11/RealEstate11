-- Sql Conceptual query --

--SELECT STATEMENT--
SELECT Name,City,Price_InLakhs,Total_Area From realEstate

-- TO Display All The Elements --
SELECT * FROM realEstate

-- TO SELECT DISTINCT VALUES FROM CITY --
SELECT DISTINCT City FROM realEstate

-- WHERE Clause --
SELECT * FROM realEstate
Where City='Mumbai';

SELECT Name,Price_InLakhs,Typeof_flat From realEstate
Where Typeof_flat='5 BHK';

-- Order by clause--
SELECT * FROM realEstate
ORDER BY Price_InLakhs ;

--AND Condition --

SELECT Name, Price_InLakhs, Typeof_flat 
FROM realEstate
WHERE City = 'Mumbai' 
  AND TRY_CAST(Price_InLakhs AS DECIMAL(10, 2)) < 10;

  -- or condition--
  SELECT * FROM realEstate
  where City='Mumbai' OR City='Delhi';

  -- NOT CONDITION 
  SELECT * From realEstate
  where NOT Balcony = 0;

  --NULL condition --
  SELECT Name,Price_InLakhs ,Baths ,Balcony From realEstate
  where Price_InLakhs IS NULL;

  --Removing Null From the tabel --
  Update realEstate
  SET Price_InLakhs=100
  where Price_InLakhs IS NULL;

  -- after this no null values exists in the table --

  SELECT * FROM realEstate

  -- Top elements to get from the table 
  SELECT TOP 30 * FROM realEstate
  WHERE City='Kolkata';

  -- SELECT MAX MIN FROM DATA --
  SELECT MAX(Price_InLakhs)from realEstate
  SELECT MIN(Price_InLakhs)from realEstate
  SELECT MAX(Baths)from realEstate
  SELECT MIN(Baths)from realEstate
  SELECT MAX(Total_Area)from realEstate
  SELECT MIN(Total_Area)from realEstate

  -- COUNT STATEMENT--
  SELECT COUNT(City) FROM realEstate
  where City='Mumbai';
  SELECT COUNT(City) FROM realEstate
  where City='Delhi';
  SELECT COUNT(City) FROM realEstate
  where City='Kolkata';
  SELECT COUNT(City) FROM realEstate
  where City='Bangalore';
  SELECT COUNT(City) FROM realEstate
  where City='Pune';

  -- adding a case condition --
  SELECT COUNT(Price_InLakhs) FROM realEstate
  Where Total_Area> 50 AND Total_Area<1000 AND City='Bangalore';

  --SUM fn--
  SELECT SUM(Baths) FROM realEstate
  Where Balcony=1;
  
  --Average Fn--
  SELECT * FROM realEstate
  WHERE Total_Area > (SELECT AVG(Total_Area) FROM realEstate);

  SELECT * FROM realEstate
  


  --Between fn--
  SELECT * From realEstate
  where Price_InLakhs Between 99 AND 199 ;

  -- To remove the decimal values from the price column --

  UPDATE realEstate
  SET Price_InLakhs = FLOOR(CAST(Price_InLakhs AS FLOAT))
  WHERE ISNUMERIC(Price_InLakhs) = 1
  AND Price_InLakhs LIKE '%.%';

  -- Convert the data type from nvarchar to int --
  ALTER TABLE RealEstate
  ALTER COLUMN Price_InLakhs Int;
  SELECT * From realEstate






  