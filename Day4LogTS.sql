MariaDB [(none)]> Use CSD22044S18
Database changed
MariaDB [CSD22044S18]> Show tables
    -> 
    -> Show tables;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Show tables' at line 3
MariaDB [CSD22044S18]> show tables;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| customer              |
+-----------------------+
1 row in set (0.00 sec)

MariaDB [CSD22044S18]> Desc Customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.03 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C01','Ashley','Ash','WDC','321200',34);
Query OK, 1 row affected (0.06 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C02','Bob Marley','BM','Toronto','100100',23);
Query OK, 1 row affected (0.05 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C03','Cherlies Theron','Cher','New York','120134',20);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C04','Denial Jack','DJ','Brazil','341020',25);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C05','Donna newman','New','Toronto','130120',50);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C06','Eston M.','M.','Toronto','201023',65);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C07','Bobby Chacko','Chack','New York','320300',70);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C08','Ashko Charles','AK','USA','421044',72);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C09','Tony Special','Specie','GTA','418921',62);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD22044S18]> Insert into customer Values ('C10','Jack Sp','Sparrow','New Jersey','102301',35);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD22044S18]> Select * from customer;
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

MariaDB [CSD22044S18]> Select name,nickname from customer;
+-----------------+----------+
| name            | nickname |
+-----------------+----------+
| Ashley          | Ash      |
| Bob Marley      | BM       |
| Cherlies Theron | Cher     |
| Denial Jack     | DJ       |
| Donna newman    | New      |
| Eston M.        | M.       |
| Bobby Chacko    | Chack    |
| Ashko Charles   | AK       |
| Tony Special    | Specie   |
| Jack Sp         | Sparrow  |
+-----------------+----------+
10 rows in set (0.00 sec)

MariaDB [CSD22044S18]> select city,postalcode from customer;
+------------+------------+
| city       | postalcode |
+------------+------------+
| WDC        | 321200     |
| Toronto    | 100100     |
| New York   | 120134     |
| Brazil     | 341020     |
| Toronto    | 130120     |
| Toronto    | 201023     |
| New York   | 320300     |
| USA        | 421044     |
| GTA        | 418921     |
| New Jersey | 102301     |
+------------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD22044S18]> Select * FROM Customer WHERE name = 'Ashley';
+--------+--------+----------+------+------------+------+
| custid | name   | nickname | city | postalCode | age  |
+--------+--------+----------+------+------------+------+
| C01    | Ashley | Ash      | WDC  | 321200     |   34 |
+--------+--------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD22044S18]> Select * FROM Customer WHERE nickname = 'ak';
+--------+---------------+----------+------+------------+------+
| custid | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| C08    | Ashko Charles | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD22044S18]> Select city  FROM Customer WHERE name  = 'Eston M.';
+---------+
| city    |
+---------+
| Toronto |
+---------+
1 row in set (0.00 sec)

MariaDB [CSD22044S18]> Select name,city  FROM Customer WHERE name  = 'Eston M.';
+----------+---------+
| name     | city    |
+----------+---------+
| Eston M. | Toronto |
+----------+---------+
1 row in set (0.00 sec)

MariaDB [CSD22044S18]> Select name,city FROM Customer WHERE city = 'toronto';
+--------------+---------+
| name         | city    |
+--------------+---------+
| Bob Marley   | Toronto |
| Donna newman | Toronto |
| Eston M.     | Toronto |
+--------------+---------+
3 rows in set (0.00 sec)

MariaDB [CSD22044S18]> Select name,city FROM Customer WHERE city != 'toronto';
+-----------------+------------+
| name            | city       |
+-----------------+------------+
| Ashley          | WDC        |
| Cherlies Theron | New York   |
| Denial Jack     | Brazil     |
| Bobby Chacko    | New York   |
| Ashko Charles   | USA        |
| Tony Special    | GTA        |
| Jack Sp         | New Jersey |
+-----------------+------------+
7 rows in set (0.00 sec)

MariaDB [CSD22044S18]> MariaDB [(none)]> use csd22044s18;
ERROR 1044 (42000): Access denied for user ''@'localhost' to database 'csd22044s18'
MariaDB [(none)]> show datebases;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'datebases' at line 1
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| test               |
+--------------------+
2 rows in set (0.00 sec)

MariaDB [(none)]> use Csd22044s18;
ERROR 1044 (42000): Access denied for user ''@'localhost' to database 'csd22044s18'
MariaDB [(none)]> MariaDB [(none)]> show databases;
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
6 rows in set (0.00 sec)

MariaDB [(none)]> use csd22044s18;
Database changed
MariaDB [csd22044s18]> show tables
    -> show tables;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'show tables' at line 2
MariaDB [csd22044s18]> show tables;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| customer              |
+-----------------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select * from customer Where Age = 50;
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select * from customer Where Age < 50;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
5 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select * from customer Where Age > 50;
+--------+---------------+----------+----------+------------+------+
| custid | name          | nickname | city     | postalCode | age  |
+--------+---------------+----------+----------+------------+------+
| C06    | Eston M.      | M.       | Toronto  | 201023     |   65 |
| C07    | Bobby Chacko  | Chack    | New York | 320300     |   70 |
| C08    | Ashko Charles | AK       | USA      | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA      | 418921     |   62 |
+--------+---------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select * from customer where name > 'Ashley';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select * from customer where name < 'Donna';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil   | 341020     |   25 |
| C07    | Bobby Chacko    | Chack    | New York | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select name,city  from customer where name = 'Ashley' or city = 'Toront';
+--------+------+
| name   | city |
+--------+------+
| Ashley | WDC  |
+--------+------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select name,city  from customer where name = 'Ashley' or city = 'Toronto';
+--------------+---------+
| name         | city    |
+--------------+---------+
| Ashley       | WDC     |
| Bob Marley   | Toronto |
| Donna newman | Toronto |
| Eston M.     | Toronto |
+--------------+---------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select name,city  from customer where city = 'new york or city ='toronto';
    '> 
    '> 
    '> 
    '> 
    '> 
    '> 
    '> Select name,city  from customer where city = 'new york' or city ='toronto';
    '> 
    '> 
    '> 
    '> Select name,city  from customer where city = 'new york' or city ='toronto'
    '> Select name,city  from customer where city = 'new york' or city ='toronto';
    '> MariaDB [(none)]> show databases;
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
6 rows in set (0.00 sec)

MariaDB [(none)]> use csd22044s18;
Database changed
MariaDB [csd22044s18]> show tables;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| customer              |
+-----------------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select name,city  from customer where city = 'new york' or city ='toronto';
+-----------------+----------+
| name            | city     |
+-----------------+----------+
| Bob Marley      | Toronto  |
| Cherlies Theron | New York |
| Donna newman    | Toronto  |
| Eston M.        | Toronto  |
| Bobby Chacko    | New York |
+-----------------+----------+
5 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select name,city  from customer where  city ='toronto' AND age > 50; 
+----------+---------+
| name     | city    |
+----------+---------+
| Eston M. | Toronto |
+----------+---------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select name,city  from customer where  city ='toronto' AND age < 50; 
+------------+---------+
| name       | city    |
+------------+---------+
| Bob Marley | Toronto |
+------------+---------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select * from customer Where city = 'Toronto';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C02    | Bob Marley   | BM       | Toronto | 100100     |   23 |
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
| C06    | Eston M.     | M.       | Toronto | 201023     |   65 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select (count)* from customer Where city = 'Toronto';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'from customer Where city = 'Toronto'' at line 1
MariaDB [csd22044s18]> Select COUNT(*) from customer Where city = 'Toronto';
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select COUNT(*) "No of customers in toronto" from customer Where city = 'Toronto';
+----------------------------+
| No of customers in toronto |
+----------------------------+
|                          3 |
+----------------------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select COUNT(*) "No of customers are more than 50 " from customer Where age > 50;
+-----------------------------------+
| No of customers are more than 50  |
+-----------------------------------+
|                                 4 |
+-----------------------------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select COUNT(*) "No of customers are more than 50 " from customer Where age < 50;
+-----------------------------------+
| No of customers are more than 50  |
+-----------------------------------+
|                                 5 |
+-----------------------------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select COUNT(*) "No of customers whose age is greater tha n30 and less than 70 " from customer Where age > 30  and age < 70 ;
+----------------------------------------------------------------+
| No of customers whose age is greater tha n30 and less than 70  |
+----------------------------------------------------------------+
|                                                              5 |
+----------------------------------------------------------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select * "No of customers whose age is greater tha n30 and less than 70 " from customer Where age > 30  and age < 70 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '"No of customers whose age is greater tha n30 and less than 70 " from customer W' at line 1
MariaDB [csd22044s18]> Select *  from customer Where age > 30  and age < 70 ;
+--------+--------------+----------+------------+------------+------+
| custid | name         | nickname | city       | postalCode | age  |
+--------+--------------+----------+------------+------------+------+
| C01    | Ashley       | Ash      | WDC        | 321200     |   34 |
| C05    | Donna newman | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.     | M.       | Toronto    | 201023     |   65 |
| C09    | Tony Special | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp      | Sparrow  | New Jersey | 102301     |   35 |
+--------+--------------+----------+------------+------------+------+
5 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where age > 30  and age < 70 ;
+--------+--------------+----------+------------+------------+------+
| custid | name         | nickname | city       | postalCode | age  |
+--------+--------------+----------+------------+------------+------+
| C01    | Ashley       | Ash      | WDC        | 321200     |   34 |
| C05    | Donna newman | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.     | M.       | Toronto    | 201023     |   65 |
| C09    | Tony Special | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp      | Sparrow  | New Jersey | 102301     |   35 |
+--------+--------------+----------+------------+------------+------+
5 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where age between 30 and 70 ;
+--------+--------------+----------+------------+------------+------+
| custid | name         | nickname | city       | postalCode | age  |
+--------+--------------+----------+------------+------------+------+
| C01    | Ashley       | Ash      | WDC        | 321200     |   34 |
| C05    | Donna newman | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.     | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko | Chack    | New York   | 320300     |   70 |
| C09    | Tony Special | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp      | Sparrow  | New Jersey | 102301     |   35 |
+--------+--------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where age not between 30 and 70 ;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C02    | Bob Marley      | BM       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil   | 341020     |   25 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where not age  between 30 and 70 ;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C02    | Bob Marley      | BM       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil   | 341020     |   25 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT name, age From Customer   | postalCode | age  |
    -> +--------+--------------+----------+------------+------------+------+
    -> | C01    | Ashley       | Ash      | WDC        | 321200     |   34 |
    -> | C05    | Donna newman | New      | Toronto    | 130120     |   50 |
    -> | C06    | Eston M.     | M.       | Toronto    | 201023     |   65 |
    -> | C07    | Bobby Chacko | Chack    | New York   | 320300
    -> ";
    "> 
    "> "";
    "> ";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '| postalCode | age  |
+--------+--------------+----------+------------+---------' at line 1
MariaDB [csd22044s18]> Select MAX(age) FROM Customer;
+----------+
| MAX(age) |
+----------+
|       72 |
+----------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select MIN(age) FROM Customer;
+----------+
| MIN(age) |
+----------+
|       20 |
+----------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select AVG(age) FROM Customer;
+----------+
| AVG(age) |
+----------+
|  45.6000 |
+----------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where name LIKE 'B%';
+--------+--------------+----------+----------+------------+------+
| custid | name         | nickname | city     | postalCode | age  |
+--------+--------------+----------+----------+------------+------+
| C02    | Bob Marley   | BM       | Toronto  | 100100     |   23 |
| C07    | Bobby Chacko | Chack    | New York | 320300     |   70 |
+--------+--------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where name NOT LIKE 'B%';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where name  LIKE '%N';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C05    | Donna newman    | New      | Toronto  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where name NOT LIKE '%N';
+--------+---------------+----------+------------+------------+------+
| custid | name          | nickname | city       | postalCode | age  |
+--------+---------------+----------+------------+------------+------+
| C01    | Ashley        | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley    | BM       | Toronto    | 100100     |   23 |
| C04    | Denial Jack   | DJ       | Brazil     | 341020     |   25 |
| C06    | Eston M.      | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko  | Chack    | New York   | 320300     |   70 |
| C08    | Ashko Charles | AK       | USA        | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp       | Sparrow  | New Jersey | 102301     |   35 |
+--------+---------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where city LIKE 'New%';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where city LIKE '__n%';
Empty set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where name LIKE '__n%';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brazil  | 341020     |   25 |
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
| C09    | Tony Special | Specie   | GTA     | 418921     |   62 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where name LIKE '__n%_a%';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brazil  | 341020     |   25 |
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
| C09    | Tony Special | Specie   | GTA     | 418921     |   62 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where name LIKE '__n_a%';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brazil  | 341020     |   25 |
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer LIMIT 3;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM Customers WHERE age IN (20, 25 ,6, 72); ;
ERROR 1146 (42S02): Table 'csd22044s18.customers' doesn't exist
ERROR: No query specified

MariaDB [csd22044s18]> SELECT * FROM Customer WHERE age IN (20, 25 ,6, 72); ;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil   | 341020     |   25 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

ERROR: No query specified

MariaDB [csd22044s18]> SELECT * FROM Customer Where city IN ('Toronto','GTA','USA','WDC');
+--------+---------------+----------+---------+------------+------+
| custid | name          | nickname | city    | postalCode | age  |
+--------+---------------+----------+---------+------------+------+
| C01    | Ashley        | Ash      | WDC     | 321200     |   34 |
| C02    | Bob Marley    | BM       | Toronto | 100100     |   23 |
| C05    | Donna newman  | New      | Toronto | 130120     |   50 |
| C06    | Eston M.      | M.       | Toronto | 201023     |   65 |
| C08    | Ashko Charles | AK       | USA     | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA     | 418921     |   62 |
+--------+---------------+----------+---------+------------+------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> Select *  from customer Where city LIKE 'n%';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C07    | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM Customer Where city LIKE ('T%','G%','U%','W%');
ERROR 1241 (21000): Operand should contain 1 column(s)
MariaDB [csd22044s18]> SELECT DISTINCT(city) 'UNIQUE CITIES' FROM Customer;
+---------------+
| UNIQUE CITIES |
+---------------+
| WDC           |
| Toronto       |
| New York      |
| Brazil        |
| USA           |
| GTA           |
| New Jersey    |
+---------------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT DISTINCT(city) AS 'UNIQUE CITIES' FROM Customer;
+---------------+
| UNIQUE CITIES |
+---------------+
| WDC           |
| Toronto       |
| New York      |
| Brazil        |
| USA           |
| GTA           |
| New Jersey    |
+---------------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT COUNT (DISTINCT(city)) AS 'UNIQUE CITIES' FROM Customer;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'DISTINCT(city)) AS 'UNIQUE CITIES' FROM Customer' at line 1
MariaDB [csd22044s18]> SELECT COUNT (DISTINCT(city)) AS 'UNIQUE CITIES' FROM Customer;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'DISTINCT(city)) AS 'UNIQUE CITIES' FROM Customer' at line 1
MariaDB [csd22044s18]> SELECT COUNT (DISTINCT(city)) 'UNIQUE CITIES' FROM Customer;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'DISTINCT(city)) 'UNIQUE CITIES' FROM Customer' at line 1
MariaDB [csd22044s18]> SELECT COUNT(DISTINCT(city)) 'unique' FROM customer;
+--------+
| unique |
+--------+
|      7 |
+--------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer ORDER BY name DESC;
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

MariaDB [csd22044s18]> SELECT * FROM customer ORDER BY name ASC;
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

MariaDB [csd22044s18]> SELECT * FROM customer ORDER BY age DESC LIMIT 1;
+--------+---------------+----------+------+------------+------+
| custid | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| C08    | Ashko Charles | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer ORDER BY age DESC LIMIT 2;
+--------+---------------+----------+----------+------------+------+
| custid | name          | nickname | city     | postalCode | age  |
+--------+---------------+----------+----------+------------+------+
| C08    | Ashko Charles | AK       | USA      | 421044     |   72 |
| C07    | Bobby Chacko  | Chack    | New York | 320300     |   70 |
+--------+---------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM customer ORDER BY age ASC LIMIT 2;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C02    | Bob Marley      | BM       | Toronto  | 100100     |   23 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM (SELECT * FROM Customer ORDER BY age DESC LIMIT 2) AS t ORDER BY age ASC LIMIT 1;
+--------+--------------+----------+----------+------------+------+
| custid | name         | nickname | city     | postalCode | age  |
+--------+--------------+----------+----------+------------+------+
| C07    | Bobby Chacko | Chack    | New York | 320300     |   70 |
+--------+--------------+----------+----------+------------+------+
1 row in set (0.01 sec)

MariaDB [csd22044s18]> SELECT * FROM (SELECT * FROM Customer ORDER BY age ASC LIMIT 2) AS t ORDER BY age DESC LIMIT 1;
+--------+------------+----------+---------+------------+------+
| custid | name       | nickname | city    | postalCode | age  |
+--------+------------+----------+---------+------------+------+
| C02    | Bob Marley | BM       | Toronto | 100100     |   23 |
+--------+------------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM (SELECT * FROM Customer ORDER BY age ASC LIMIT 2) AS t ORDER BY age DESC LIMIT 2;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C02    | Bob Marley      | BM       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT max(age)*100 from customer;
+--------------+
| max(age)*100 |
+--------------+
|         7200 |
+--------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELECT max(age)+10*20/2 from customer;
+------------------+
| max(age)+10*20/2 |
+------------------+
|         172.0000 |
+------------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELECT 400*9000 AS j ;
+---------+
| j       |
+---------+
| 3600000 |
+---------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> 