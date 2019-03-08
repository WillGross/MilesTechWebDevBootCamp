--Will Gross
--Project 03 query
--3/7/19

--query creates a table that represents a create statment to generate my roles table sans the identity and primary key properties of 'id'
SELECT DISTINCT CONCAT('CREATE TABLE ', TABLE_NAME, ' (') FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'roles'
UNION ALL
SELECT CONCAT(
  CONCAT('  ', COLUMN_NAME, ' ', DATA_TYPE), 
  CASE 
    WHEN DATA_TYPE like 'varchar' THEN CONCAT( '(', CHARACTER_MAXIMUM_LENGTH, ')')
  END
  ,
  CASE
	WHEN COLUMN_NAME != 'description' THEN ','
	ELSE ')'
  END	
) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'roles'
;


