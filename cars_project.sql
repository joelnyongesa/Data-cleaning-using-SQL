--Data cleaning using SQL
--Dataset: Cars dataset from Google Data Analytics Program offered by Coursera.

--Check for fuel types column.
SELECT
  DISTINCT(fuel_type)
FROM
  cars.cars_info;
--From the results, there are two fuel types: Gas and Diesel.

--Now let us have a lok at the minimum and maximum lengths of the dataset
SELECT
  MIN(length) AS minimum_length,
  MAX(length) AS maximum_length
FROM
  cars.cars_info;
--From the results, the minimum length of the car in the dataset is 141, while the maximum length is 208.1

--Next, let us look at the rows containing NULL values for the missing number of doors.
SELECT
  *
FROM
  cars.cars_info
WHERE
  num_of_doors IS NULL;
--From the results, two cars (Mazda and Dodge) have missing number of doors. We can check with the client to confirm why the two had missing data of the same.

--Next, let us have a look at the distinct values for the num_of_cylinders column.
SELECT
  DISTINCT(num_of_cylinders)
FROM
  cars.cars_info;
--There are eight values in the num_of_cylinders column. However, they should be seven as two appears to be entered as tow to make 8 entries.

--Next, let us check at the minimum and maximum compression ratios
SELECT
  MIN(compression_ratio) AS minimum_compression_ratio,
  MAX(compression_ratio) AS maximum_compression_ratio
FROM
  cars.cars_info;
  --The minimum value is 7.0, while the max is 70.0

--The compression ratio should however be in the range 7-23, so let us check if the 70.0 value was mistakenly keyed in
SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  cars.cars_info
WHERE
  compression_ratio <> 70;
--Now, the min is 7 and the max is 23.

--Rows to delete: Those with compression ratio = 70
SELECT
  COUNT(*) AS rows_to_delete
FROM
  cars.cars_info
WHERE
  compression_ratio = 70;
--We only have one row to delete.

--Now let us take a look at the distinct drive wheels.
SELECT
  DISTINCT(drive_wheels)
FROM
  cars.cars_info;

--There appears to be two entries of 4wd. Let us see if there are trailing spaces.
SELECT
  DISTINCT(drive_wheels) AS drive_wheels,
  LENGTH(drive_wheels) AS length_of_string
FROM
  cars.cars_info;


--Let us finally take a look at the prices to see if they are within the specified range.
SELECT
  MIN(price) AS minimum_price,
  MAX(price) AS maximum_price
FROM
  cars.cars_info
--The prices lie within the range 0 and 45400