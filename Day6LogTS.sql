MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| csd22044s18        |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
6 rows in set (0.03 sec)

MariaDB [(none)]> use scd22044s18;
ERROR 1049 (42000): Unknown database 'scd22044s18'
MariaDB [(none)]> use csd22044s18;
Database changed
MariaDB [csd22044s18]> show tables;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| c1                    |
| c3                    |
| customer              |
| mock_data             |
| orders                |
| persons               |
+-----------------------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM Customer ;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.08 sec)

MariaDB [csd22044s18]> SELECT * FROM Customer ORDER BY name,city ASC;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM Customer ORDER BY name desc ,city ASC;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM Customer ORDER BY custid DESC LIMIT 3;
+--------+---------------+----------+------------+------------+------+
| custid | name          | nickname | city       | postalCode | age  |
+--------+---------------+----------+------------+------------+------+
| C10    | Jack Sp       | Sparrow  | New Jersey | 102301     |   35 |
| C09    | Tony Special  | Specie   | GTA        | 418921     |   62 |
| C08    | Ashko Charles | AK       | USA        | 421044     |   72 |
+--------+---------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM Customer ORDER BY custid ASC LIMIT 3;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM Customer ORDER BY custid DESC LIMIT 3) T ORDER BY CUSTID ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ') T ORDER BY CUSTID ASC' at line 1
MariaDB [csd22044s18]> SELECT * FROM Customer ORDER BY custid DESC LIMIT 3) t  ORDER BY custid ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ') t  ORDER BY custid ASC' at line 1
MariaDB [csd22044s18]> SELECT * FROM(select * from  Customer ORDER BY custid DESC LIMIT 3) t  ORDER BY custid ASC;
+--------+---------------+----------+------------+------------+------+
| custid | name          | nickname | city       | postalCode | age  |
+--------+---------------+----------+------------+------------+------+
| C08    | Ashko Charles | AK       | USA        | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp       | Sparrow  | New Jersey | 102301     |   35 |
+--------+---------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM GROUP BY CITY;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'GROUP BY CITY' at line 1
MariaDB [csd22044s18]> SELECT COUNT (CITY) "NO OF customers" FROM Customer Group by city;
ERROR 1630 (42000): FUNCTION csd22044s18.COUNT does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
MariaDB [csd22044s18]> SELECT city  FROM customer  GROUP BY city;
+------------+
| city       |
+------------+
| Brazil     |
| GTA        |
| New Jersey |
| New York   |
| Toronto    |
| USA        |
| WDC        |
+------------+
7 rows in set (0.02 sec)

MariaDB [csd22044s18]> SELECT COUNT(CITY) "uniqe cities" FROM Customer Group by city;
+--------------+
| uniqe cities |
+--------------+
|            1 |
|            1 |
|            1 |
|            2 |
|            3 |
|            1 |
|            1 |
+--------------+
7 rows in set (0.02 sec)

MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers " FROM Customer Group by city;
+------------+------------------+
| city       | no of customers  |
+------------+------------------+
| Brazil     |                1 |
| GTA        |                1 |
| New Jersey |                1 |
| New York   |                2 |
| Toronto    |                3 |
| USA        |                1 |
| WDC        |                1 |
+------------+------------------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT distinct(city) from customer;
+------------+
| city       |
+------------+
| WDC        |
| Toronto    |
| New York   |
| Brazil     |
| USA        |
| GTA        |
| New Jersey |
+------------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers " FROM Customer where city LIKE 'New%'; 
+----------+------------------+
| city     | no of customers  |
+----------+------------------+
| New York |                3 |
+----------+------------------+
1 row in set (0.01 sec)

MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers " FROM Customer where city LIKE 'New%' GROUP BY City; 
+------------+------------------+
| city       | no of customers  |
+------------+------------------+
| New Jersey |                1 |
| New York   |                2 |
+------------+------------------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers "  GROUP BY City HAVING city 'NEW' OR city = 'Toronto';l; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'GROUP BY City HAVING city 'NEW' OR city = 'Toronto'' at line 1
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'l' at line 1
MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers "  GROUP BY City HAVING city 'NEW' OR city = 'Toronto'; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'GROUP BY City HAVING city 'NEW' OR city = 'Toronto'' at line 1
MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers " from cuntomers GROUP BY City HAVING city 'NEW' OR city = 'Toronto'; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''NEW' OR city = 'Toronto'' at line 1
MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers " from customer GROUP BY City HAVING city 'NEW' OR city = 'Toronto'; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''NEW' OR city = 'Toronto'' at line 1
MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers " from customers GROUP BY City HAVING city 'NEW%' OR city = 'Toronto'; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''NEW%' OR city = 'Toronto'' at line 1
MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers " from customer GROUP BY City HAVING city 'NEW%' OR city = 'Toronto'; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''NEW%' OR city = 'Toronto'' at line 1
MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers" from customer GROUP BY City HAVING city like 'NEW%' OR city = 'Toronto'; 
+------------+-----------------+
| city       | no of customers |
+------------+-----------------+
| New Jersey |               1 |
| New York   |               2 |
| Toronto    |               3 |
+------------+-----------------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers" from customer GROUP BY City HAVING count (city); 
ERROR 1630 (42000): FUNCTION csd22044s18.count does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers" from customer GROUP BY City HAVING count (city)>2; 
ERROR 1630 (42000): FUNCTION csd22044s18.count does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
MariaDB [csd22044s18]> SELECT city ,COUNT(CITY) "no of customers" from customer GROUP BY City HAVING count(city) > 2; 
+---------+-----------------+
| city    | no of customers |
+---------+-----------------+
| Toronto |               3 |
+---------+-----------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * customer  WHERE name REGEXP 'n$';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'customer  WHERE name REGEXP 'n$'' at line 1
MariaDB [csd22044s18]> SELECT * FROM customer  WHERE name REGEXP 'n$';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C05    | Donna newman    | New      | Toronto  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.03 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE name REGEXP '^D';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brazil  | 341020     |   25 |
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE postalcode REGEXP'^[0-9]'; ;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

ERROR: No query specified

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE postalcode REGEXP'^[A-Z]'; ;
Empty set (0.00 sec)

ERROR: No query specified

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE postalcode REGEXP '^[A*]'; 
Empty set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE postalcode REGEXP '^A*'; 
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE nickname REGEXP '^A*'; 
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.01 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE nickname REGEXP '^A+'; 
+--------+---------------+----------+------+------------+------+
| custid | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| C01    | Ashley        | Ash      | WDC  | 321200     |   34 |
| C08    | Ashko Charles | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE nickname REGEXP '^A?'; 
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE nickname REGEXP '^.{4}'; 
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE nickname REGEXP '^.{3}'; 
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE city REGEXP '^.{3}'; 
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE city REGEXP '^.{4}'; 
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE city rLIKE '^.{4}'; 
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE nickname REGEXP '^.{3}'; 
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer  WHERE nickname REGEXP '^.{7}'; 
+--------+---------+----------+------------+------------+------+
| custid | name    | nickname | city       | postalCode | age  |
+--------+---------+----------+------------+------------+------+
| C10    | Jack Sp | Sparrow  | New Jersey | 102301     |   35 |
+--------+---------+----------+------------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELWCT CURDATE();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SELWCT CURDATE()' at line 1
MariaDB [csd22044s18]> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2018-05-14 |
+------------+
1 row in set (0.01 sec)

MariaDB [csd22044s18]> ALTER TABLE customeR ADD COLUMN dob DATE;
Query OK, 0 rows affected (0.45 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> SELECT * FROM cUSTOMER;
+--------+-----------------+----------+------------+------------+------+------+
| custid | name            | nickname | city       | postalCode | age  | dob  |
+--------+-----------------+----------+------------+------------+------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 | NULL |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 | NULL |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 | NULL |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | NULL |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 | NULL |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 | NULL |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 | NULL |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | NULL |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | NULL |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 | NULL |
+--------+-----------------+----------+------------+------------+------+------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1991-01-10' WHERE custid = 'c01';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1995-03-12' WHERE custid = 'c02';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1993-08-12' WHERE custid = 'c03';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1999-01-10' WHERE custid = 'c04';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1990-07-90' WHERE custid = 'c05';
Query OK, 1 row affected, 1 warning (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 1

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1994-11-07' WHERE custid = 'c06';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1984-10-17' WHERE custid = 'c08';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1994-04-15' WHERE custid = 'c07';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1996-06-28' WHERE custid = 'c08';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1990-01-23' WHERE custid = 'c09';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1992-11-12' WHERE custid = 'c10';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1992-11-12' WHERE custid = 'c11';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

MariaDB [csd22044s18]> SELECT * FROM customers;
ERROR 1146 (42S02): Table 'csd22044s18.customers' doesn't exist
MariaDB [csd22044s18]> SELECT * FROM customer;
+--------+-----------------+----------+------------+------------+------+------------+
| custid | name            | nickname | city       | postalCode | age  | dob        |
+--------+-----------------+----------+------------+------------+------+------------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 | 1991-01-10 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 | 1995-03-12 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 | 1993-08-12 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | 1999-01-10 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 | 0000-00-00 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 | 1994-11-07 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 | 1994-04-15 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | 1996-06-28 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | 1990-01-23 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 | 1992-11-12 |
+--------+-----------------+----------+------------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT name ,dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE)
    -> ;
ERROR 1054 (42S22): Unknown column 'name' in 'field list'
MariaDB [csd22044s18]> SELECT name ,dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) "age" FROM customer;
+-----------------+------------+------+
| name            | dob        | age  |
+-----------------+------------+------+
| Ashley          | 1991-01-10 |   27 |
| Bob Marley      | 1995-03-12 |   23 |
| Cherlies Theron | 1993-08-12 |   24 |
| Denial Jack     | 1999-01-10 |   19 |
| Donna newman    | 0000-00-00 | NULL |
| Eston M.        | 1994-11-07 |   23 |
| Bobby Chacko    | 1994-04-15 |   24 |
| Ashko Charles   | 1996-06-28 |   21 |
| Tony Special    | 1990-01-23 |   28 |
| Jack Sp         | 1992-11-12 |   25 |
+-----------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> UPDATE CUSTOMER SET dob = '1998-01-12' WHERE custid = 'c05';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> SELECT * FROM customers;
ERROR 1146 (42S02): Table 'csd22044s18.customers' doesn't exist
MariaDB [csd22044s18]> SELECT * FROM customer;
+--------+-----------------+----------+------------+------------+------+------------+
| custid | name            | nickname | city       | postalCode | age  | dob        |
+--------+-----------------+----------+------------+------------+------+------------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 | 1991-01-10 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 | 1995-03-12 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 | 1993-08-12 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | 1999-01-10 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 | 1998-01-12 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 | 1994-11-07 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 | 1994-04-15 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | 1996-06-28 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | 1990-01-23 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 | 1992-11-12 |
+--------+-----------------+----------+------------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT name ,dob, TIMESTAMPDIFF(DAY,DOB,CURDATE())"age" FROM Customer;
+-----------------+------------+-------+
| name            | dob        | age   |
+-----------------+------------+-------+
| Ashley          | 1991-01-10 |  9986 |
| Bob Marley      | 1995-03-12 |  8464 |
| Cherlies Theron | 1993-08-12 |  9041 |
| Denial Jack     | 1999-01-10 |  7064 |
| Donna newman    | 1998-01-12 |  7427 |
| Eston M.        | 1994-11-07 |  8589 |
| Bobby Chacko    | 1994-04-15 |  8795 |
| Ashko Charles   | 1996-06-28 |  7990 |
| Tony Special    | 1990-01-23 | 10338 |
| Jack Sp         | 1992-11-12 |  9314 |
+-----------------+------------+-------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT name age (select name ,dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE())"age" FROM Customer)T WHERE T.AGE > 22;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(select name ,dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE())"age" FROM Customer)T WHERE ' at line 1
MariaDB [csd22044s18]> SELECT name,age (select name ,dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE())"age" FROM Customer)T WHERE T.AGE > 22;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'select name ,dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE())"age" FROM Customer)T WHERE T' at line 1
MariaDB [csd22044s18]> SELECT name age (select name , dob , TIMESTAMPDIFF(YEAR,DOB,CURDATE())"age" FROM Customer) T WHERE T.AGE = 22;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(select name , dob , TIMESTAMPDIFF(YEAR,DOB,CURDATE())"age" FROM Customer) T WHE' at line 1
MariaDB [csd22044s18]> SELECT name,age FROM  (select name , dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE())"age" FROM Customer) T WHERE T.AGE = 22;
Empty set (0.00 sec)

MariaDB [csd22044s18]> SELECT  name , dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) " AGE"  FROM Cutomer  HAVING AGE = 22;
ERROR 1146 (42S02): Table 'csd22044s18.cutomer' doesn't exist
MariaDB [csd22044s18]> SELECT  name , dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) " AGE"  FROM Customer  HAVING AGE = 22;
Empty set, 1 warning (0.00 sec)

MariaDB [csd22044s18]> SELECT  name , dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) "age"  FROM Customer  HAVING AGE = 22;
Empty set (0.00 sec)

MariaDB [csd22044s18]> SELECT  name , dob, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) "age"  FROM Customer  HAVING age = 22 ;
Empty set (0.00 sec)

MariaDB [csd22044s18]> SELECT  name , dob, TIMESTAMPDIFF(YEAR,dob,CURDATE()) "age"  FROM Customer  HAVING age = 22 ;
Empty set (0.00 sec)

MariaDB [csd22044s18]> SELECT  name , dob, TIMESTAMPDIFF(YEAR,dob,CURDATE()) "age"  FROM Customer  HAVING age > 22 ;
+-----------------+------------+------+
| name            | dob        | age  |
+-----------------+------------+------+
| Ashley          | 1991-01-10 |   27 |
| Bob Marley      | 1995-03-12 |   23 |
| Cherlies Theron | 1993-08-12 |   24 |
| Eston M.        | 1994-11-07 |   23 |
| Bobby Chacko    | 1994-04-15 |   24 |
| Tony Special    | 1990-01-23 |   28 |
| Jack Sp         | 1992-11-12 |   25 |
+-----------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT  name , dob, TIMESTAMPDIFF(YEAR,dob,CURDATE()) "age"  FROM Customer  HAVING age < 22 ;
+---------------+------------+------+
| name          | dob        | age  |
+---------------+------------+------+
| Denial Jack   | 1999-01-10 |   19 |
| Donna newman  | 1998-01-12 |   20 |
| Ashko Charles | 1996-06-28 |   21 |
+---------------+------------+------+
3 rows in set (0.00 sec)

