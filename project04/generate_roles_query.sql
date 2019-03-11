--Will Gross
--lab 04 query
--3/11/19


select * from INFORMATION_SCHEMA.KEY_COLUMN_USAGE;
select * from INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS;

--query creates a table that represents a create statment to generate my roles table sans the identity and primary key properties of 'id'
SELECT DISTINCT CONCAT('CREATE TABLE ', TABLE_NAME, ' (') FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'roles'
UNION ALL
SELECT CONCAT(
  CONCAT('  ', COLUMN_NAME, ' ', DATA_TYPE), 
  CASE 
    WHEN DATA_TYPE = 'varchar' THEN CONCAT( '(', CHARACTER_MAXIMUM_LENGTH, ')')
  END
  ,
  CASE
	WHEN COLUMN_NAME = 'description' THEN ');'
	ELSE ','
  END	
) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'roles'
;


