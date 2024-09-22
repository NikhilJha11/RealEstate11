select * from realEstate


-- to replace the value from cr to lakhs --
UPDATE realEstate
SET Price = 
  CASE 
    WHEN Price LIKE '%Cr%' THEN 
      TRY_CAST(REPLACE(Price, 'Cr', '') AS DECIMAL(10, 2)) * 100
    WHEN Price LIKE '%L%' THEN 
      TRY_CAST(REPLACE(Price, 'L', '') AS DECIMAL(10, 2))
    ELSE 
      NULL
  END;

  SELECT Name ,Price ,Total_Area from realEstate
  -- Now all the values have been converted into lakhs  , now aim is to convert the column name from price to price_inlakhs --

  EXEC sp_rename 'realEstate.Price', 'Price_InLakhs', 'COLUMN';

  SELECT * FROM realEstate

  -- add column type of flat in table real estate 
  ALTER TABLE realEstate
  ADD Typeof_flat VARCHAR(50);  
  ALTER TABLE realEstate
  ADD Typeof_flat VARCHAR(20);  

  -- sql command to to get the type of flat , aim to take first 2 string/numeric value 
  UPDATE realEstate
  SET Typeof_flat = 
      LTRIM(RTRIM(SUBSTRING(Property_Title, 1, 
                          CASE 
                              WHEN CHARINDEX('BHK', Property_Title) > 0 THEN CHARINDEX('BHK', Property_Title) + 3
                              WHEN CHARINDEX('RK', Property_Title) > 0 THEN CHARINDEX('RK', Property_Title) + 2
                              ELSE 0
                          END)))
   WHERE CHARINDEX('BHK', Property_Title) > 0
   OR CHARINDEX('RK', Property_Title) > 0;

   -- to drop a column --

  ALTER TABLE realEstate
  DROP COLUMN Typeof_flat

  -- command to display the table as whole --
  SELECT * FROM realEstate

  --- to create a new column name city --

  ALTER TABLE realEstate
  ADD City NVARCHAR(30);

  -- Syntax to to get the last string from property title , aim to get the city name 

  UPDATE realEstate
  SET City = REVERSE(SUBSTRING(REVERSE(Property_Title), 1, CHARINDEX(' ', REVERSE(Property_Title) + ' ') - 1));














