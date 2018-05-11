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
6 rows in set (0.14 sec)

MariaDB [(none)]> use ced22044s18;
ERROR 1049 (42000): Unknown database 'ced22044s18'
MariaDB [(none)]> use csd22044s18;
Database changed
MariaDB [csd22044s18]> show tables;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| customer              |
+-----------------------+
1 row in set (0.04 sec)

MariaDB [csd22044s18]> CREATE TABLE Persons (
    ->  ID integer(3) NOT NULL,
    ->  LastName varchar(255) NOT NULL,
    ->  FirstName varchar(255) NOT NULL,
    ->  Age integer(3),
    ->  CONSTRAINT UC_Person UNIQUE (ID)
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 6
MariaDB [csd22044s18]> CREATE TABLE Persons (
    ->  ID integer(3),
    ->  LastName varchar(255) NOT NULL,
    ->  FirstName varchar(255) NOT NULL,
    ->  Age integer(3),
    -> CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
    -> );
Query OK, 0 rows affected (0.50 sec)

MariaDB [csd22044s18]> CREATE TABLE Orders (
    ->  OrderID integer(3) NOT NULL,
    ->  OrderNumber integer(3) NOT NULL,
    ->  PersonID integer(3),
    ->  PRIMARY KEY (OrderID),
    ->  CONSTRAINT FK_PersonOrder FOREIGN KEY (P
    -> ersonID)
    ->  REFERENCES Persons(PersonID)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ersonID)
 REFERENCES Persons(PersonID)
)' at line 7
MariaDB [csd22044s18]> CREATE TABLE Orders (
    ->  OrderID integer(3) NOT NULL,
    ->  OrderNumber integer(3) NOT NULL,
    ->  PersonID integer(3),
    ->  PRIMARY KEY (OrderID),
    ->  CONSTRAINT FK_PersonOrder FOREIGN KEY (P
    -> ersonID)
    ->  REFERENCES Persons(PersonID)
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ersonID)
 REFERENCES Persons(PersonID)' at line 7
MariaDB [csd22044s18]> CREATE TABLE Orders (
    ->  OrderID integer(3) NOT NULL,
    ->  OrderNumber integer(3) NOT NULL,
    ->  PersonID integer(3),
    ->  PRIMARY KEY (OrderID),
    ->  CONSTRAINT FK_PersonOrder FOREIGN KEY (P
    -> ersonID)
    ->  REFERENCES Persons(ID)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ersonID)
 REFERENCES Persons(ID)
)' at line 7
MariaDB [csd22044s18]> CREATE TABLE Orders (
    ->  OrderID integer(3) NOT NULL,
    ->  OrderNumber integer(3) NOT NULL,
    ->  PersonID integer(3),
    ->  PRIMARY KEY (OrderID),
    ->  CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(ID)
    -> );
Query OK, 0 rows affected (0.25 sec)

MariaDB [csd22044s18]> SHOW INDEX FROM persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LastName    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.03 sec)

MariaDB [csd22044s18]> SHOW INDEX FROM orders;
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| orders |          0 | PRIMARY        |            1 | OrderID     | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| orders |          1 | FK_PersonOrder |            1 | PersonID    | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> DESC orders;
+-------------+--------+------+-----+---------+-------+
| Field       | Type   | Null | Key | Default | Extra |
+-------------+--------+------+-----+---------+-------+
| OrderID     | int(3) | NO   | PRI | NULL    |       |
| OrderNumber | int(3) | NO   |     | NULL    |       |
| PersonID    | int(3) | YES  | MUL | NULL    |       |
+-------------+--------+------+-----+---------+-------+
3 rows in set (0.05 sec)

MariaDB [csd22044s18]> CREATE TABLE c1 AS SELECT * FROM Customer;
Query OK, 10 rows affected (0.53 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> CREATE TABLE c2 AS SELECT name,postalcode FROM Customer WHERE city = "Toronto";
Query OK, 3 rows affected (0.16 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> DESC c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM c!;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '!' at line 1
MariaDB [csd22044s18]> SELECT * FROM c1;
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

MariaDB [csd22044s18]> DESC c2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| name       | varchar(50) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.02 sec)

MariaDB [csd22044s18]> SHOW TABLES;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| c1                    |
| c2                    |
| customer              |
| orders                |
| persons               |
+-----------------------+
5 rows in set (0.00 sec)

MariaDB [csd22044s18]> 
MariaDB [csd22044s18]> CREATE TABLE c3 LIKE Customer;
Query OK, 0 rows affected (0.16 sec)

MariaDB [csd22044s18]> DESC c3;
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
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> INSERT INTO c3 SELECT * FROM Customer;
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> SELECT * FROM C3; 
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

MariaDB [csd22044s18]> ALTER TABLE c3 ADD COLOUMN Country VARCHAR(100);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Country VARCHAR(100)' at line 1
MariaDB [csd22044s18]> ALTER TABLE c3 ADD COLUMN Country VARCHAR(100);
Query OK, 0 rows affected (0.33 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> DESC c3;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| custid     | varchar(5)   | NO   | PRI | NULL    |       |
| name       | varchar(50)  | YES  |     | NULL    |       |
| nickname   | varchar(10)  | YES  |     | NULL    |       |
| city       | varchar(20)  | YES  |     | NULL    |       |
| postalCode | varchar(10)  | YES  |     | NULL    |       |
| age        | int(3)       | YES  |     | NULL    |       |
| Country    | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE C3 MODIFY COLUMN Country VARCHAR(40);
Query OK, 10 rows affected (0.48 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| Country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE C3 MODIFY COLUMN country VARCHAR(40);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c3 CHANGE COLUMN postalCode ZipCode VARCHAR(10);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> DESC C3;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| custid   | varchar(5)  | NO   | PRI | NULL    |       |
| name     | varchar(50) | YES  |     | NULL    |       |
| nickname | varchar(10) | YES  |     | NULL    |       |
| city     | varchar(20) | YES  |     | NULL    |       |
| ZipCode  | varchar(10) | YES  |     | NULL    |       |
| age      | int(3)      | YES  |     | NULL    |       |
| country  | varchar(40) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c3 CHANGE COLUMN custid  CustomerId VARCHAR(5);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> desc c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerId | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| ZipCode    | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c3 DROP COLUMN NICKNAME;
Query OK, 0 rows affected (0.30 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerId | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| ZipCode    | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c3 MODIFY name VARCHAR NOT NULL;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'NOT NULL' at line 1
MariaDB [csd22044s18]> ALTER TABLE c3 MODIFY name VARCHAR(50) NOT NULL;
Query OK, 10 rows affected (1.75 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerId | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| ZipCode    | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c1 ADD PRIMARY KEY(custid);
Query OK, 0 rows affected (0.28 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> desc c1;
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
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c2 DROP PRIMARY KEY(custid);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(custid)' at line 1
MariaDB [csd22044s18]> DESC C2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| name       | varchar(50) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c2 ADD PRIMARY KEY(custid);
ERROR 1072 (42000): Key column 'custid' doesn't exist in table
MariaDB [csd22044s18]> DESC C2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| name       | varchar(50) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c2 ADD PRIMARY KEY(name);
Query OK, 3 rows affected (0.53 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> desc c2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| name       | varchar(50) | NO   | PRI | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c2 DROP PRIMARY KEY(name);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(name)' at line 1
MariaDB [csd22044s18]> ALTER TABLE c2 DROP PRIMARY KEY;
Query OK, 3 rows affected (0.48 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> desc c2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| name       | varchar(50) | NO   |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> SHOW INDEX FROM Persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LastName    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM c3;
+------------+-----------------+------------+---------+------+---------+
| CustomerId | name            | city       | ZipCode | age  | country |
+------------+-----------------+------------+---------+------+---------+
| C01        | Ashley          | WDC        | 321200  |   34 | NULL    |
| C02        | Bob Marley      | Toronto    | 100100  |   23 | NULL    |
| C03        | Cherlies Theron | New York   | 120134  |   20 | NULL    |
| C04        | Denial Jack     | Brazil     | 341020  |   25 | NULL    |
| C05        | Donna newman    | Toronto    | 130120  |   50 | NULL    |
| C06        | Eston M.        | Toronto    | 201023  |   65 | NULL    |
| C07        | Bobby Chacko    | New York   | 320300  |   70 | NULL    |
| C08        | Ashko Charles   | USA        | 421044  |   72 | NULL    |
| C09        | Tony Special    | GTA        | 418921  |   62 | NULL    |
| C10        | Jack Sp         | New Jersey | 102301  |   35 | NULL    |
+------------+-----------------+------------+---------+------+---------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> UPDATE C3 SET COUNTRY = 'USA';
Query OK, 10 rows affected (0.06 sec)
Rows matched: 10  Changed: 10  Warnings: 0

MariaDB [csd22044s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerId | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| ZipCode    | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM c3;
+------------+-----------------+------------+---------+------+---------+
| CustomerId | name            | city       | ZipCode | age  | country |
+------------+-----------------+------------+---------+------+---------+
| C01        | Ashley          | WDC        | 321200  |   34 | USA     |
| C02        | Bob Marley      | Toronto    | 100100  |   23 | USA     |
| C03        | Cherlies Theron | New York   | 120134  |   20 | USA     |
| C04        | Denial Jack     | Brazil     | 341020  |   25 | USA     |
| C05        | Donna newman    | Toronto    | 130120  |   50 | USA     |
| C06        | Eston M.        | Toronto    | 201023  |   65 | USA     |
| C07        | Bobby Chacko    | New York   | 320300  |   70 | USA     |
| C08        | Ashko Charles   | USA        | 421044  |   72 | USA     |
| C09        | Tony Special    | GTA        | 418921  |   62 | USA     |
| C10        | Jack Sp         | New Jersey | 102301  |   35 | USA     |
+------------+-----------------+------------+---------+------+---------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> UPDATE C3 SET COUNTRY = 'Canada' WHERE city = 'toronto','GTA';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''GTA'' at line 1
MariaDB [csd22044s18]> UPDATE C3 SET COUNTRY = 'Canada' WHERE city = ('toronto','GTA');
ERROR 1241 (21000): Operand should contain 1 column(s)
MariaDB [csd22044s18]> UPDATE C3 SET COUNTRY = 'Canada' WHERE city IN ('toronto','GTA');
Query OK, 4 rows affected (0.05 sec)
Rows matched: 4  Changed: 4  Warnings: 0

MariaDB [csd22044s18]> SELECT * FROM c3;
+------------+-----------------+------------+---------+------+---------+
| CustomerId | name            | city       | ZipCode | age  | country |
+------------+-----------------+------------+---------+------+---------+
| C01        | Ashley          | WDC        | 321200  |   34 | USA     |
| C02        | Bob Marley      | Toronto    | 100100  |   23 | Canada  |
| C03        | Cherlies Theron | New York   | 120134  |   20 | USA     |
| C04        | Denial Jack     | Brazil     | 341020  |   25 | USA     |
| C05        | Donna newman    | Toronto    | 130120  |   50 | Canada  |
| C06        | Eston M.        | Toronto    | 201023  |   65 | Canada  |
| C07        | Bobby Chacko    | New York   | 320300  |   70 | USA     |
| C08        | Ashko Charles   | USA        | 421044  |   72 | USA     |
| C09        | Tony Special    | GTA        | 418921  |   62 | Canada  |
| C10        | Jack Sp         | New Jersey | 102301  |   35 | USA     |
+------------+-----------------+------------+---------+------+---------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> UPDATE C3 SET COUNTRY = 'Brazil' WHERE city IN ('Brazil');
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> SELECT * FROM c3;
+------------+-----------------+------------+---------+------+---------+
| CustomerId | name            | city       | ZipCode | age  | country |
+------------+-----------------+------------+---------+------+---------+
| C01        | Ashley          | WDC        | 321200  |   34 | USA     |
| C02        | Bob Marley      | Toronto    | 100100  |   23 | Canada  |
| C03        | Cherlies Theron | New York   | 120134  |   20 | USA     |
| C04        | Denial Jack     | Brazil     | 341020  |   25 | Brazil  |
| C05        | Donna newman    | Toronto    | 130120  |   50 | Canada  |
| C06        | Eston M.        | Toronto    | 201023  |   65 | Canada  |
| C07        | Bobby Chacko    | New York   | 320300  |   70 | USA     |
| C08        | Ashko Charles   | USA        | 421044  |   72 | USA     |
| C09        | Tony Special    | GTA        | 418921  |   62 | Canada  |
| C10        | Jack Sp         | New Jersey | 102301  |   35 | USA     |
+------------+-----------------+------------+---------+------+---------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> UPDATE C3 SET COUNTRY = 'Brazil' WHERE city IN ('South America');
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

MariaDB [csd22044s18]> SELECT * FROM c3;
+------------+-----------------+------------+---------+------+---------+
| CustomerId | name            | city       | ZipCode | age  | country |
+------------+-----------------+------------+---------+------+---------+
| C01        | Ashley          | WDC        | 321200  |   34 | USA     |
| C02        | Bob Marley      | Toronto    | 100100  |   23 | Canada  |
| C03        | Cherlies Theron | New York   | 120134  |   20 | USA     |
| C04        | Denial Jack     | Brazil     | 341020  |   25 | Brazil  |
| C05        | Donna newman    | Toronto    | 130120  |   50 | Canada  |
| C06        | Eston M.        | Toronto    | 201023  |   65 | Canada  |
| C07        | Bobby Chacko    | New York   | 320300  |   70 | USA     |
| C08        | Ashko Charles   | USA        | 421044  |   72 | USA     |
| C09        | Tony Special    | GTA        | 418921  |   62 | Canada  |
| C10        | Jack Sp         | New Jersey | 102301  |   35 | USA     |
+------------+-----------------+------------+---------+------+---------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> UPDATE C3 SET COUNTRY = 'South America' WHERE city IN ('Brazil');
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd22044s18]> SELECT * FROM c3;
+------------+-----------------+------------+---------+------+---------------+
| CustomerId | name            | city       | ZipCode | age  | country       |
+------------+-----------------+------------+---------+------+---------------+
| C01        | Ashley          | WDC        | 321200  |   34 | USA           |
| C02        | Bob Marley      | Toronto    | 100100  |   23 | Canada        |
| C03        | Cherlies Theron | New York   | 120134  |   20 | USA           |
| C04        | Denial Jack     | Brazil     | 341020  |   25 | South America |
| C05        | Donna newman    | Toronto    | 130120  |   50 | Canada        |
| C06        | Eston M.        | Toronto    | 201023  |   65 | Canada        |
| C07        | Bobby Chacko    | New York   | 320300  |   70 | USA           |
| C08        | Ashko Charles   | USA        | 421044  |   72 | USA           |
| C09        | Tony Special    | GTA        | 418921  |   62 | Canada        |
| C10        | Jack Sp         | New Jersey | 102301  |   35 | USA           |
+------------+-----------------+------------+---------+------+---------------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM c2;
+--------------+------------+
| name         | postalcode |
+--------------+------------+
| Bob Marley   | 100100     |
| Donna newman | 130120     |
| Eston M.     | 201023     |
+--------------+------------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> DELETE FROM C2 WHERE NAME LIKE 'Bob%';
Query OK, 1 row affected (0.08 sec)

MariaDB [csd22044s18]> SELECT * FROM c2;
+--------------+------------+
| name         | postalcode |
+--------------+------------+
| Donna newman | 130120     |
| Eston M.     | 201023     |
+--------------+------------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> delete from c2;
Query OK, 2 rows affected (0.06 sec)

MariaDB [csd22044s18]> SELECT * FROM c2;
Empty set (0.00 sec)

MariaDB [csd22044s18]> DROP TABLE C2;
Query OK, 0 rows affected (0.19 sec)

MariaDB [csd22044s18]> SHOW TABLES;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| c1                    |
| c3                    |
| customer              |
| orders                |
| persons               |
+-----------------------+
5 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM C1;
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

MariaDB [csd22044s18]> UPDATE c1 SET custid = 1 WHERE age >=50;
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'
MariaDB [csd22044s18]> UPDATE c1 SET custid = 1 WHERE age >=50;
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'
MariaDB [csd22044s18]> DESC C1;
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
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> ALTER TABLE c1 DROP PRIMARY KEY(CUSTID);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(CUSTID)' at line 1
MariaDB [csd22044s18]> ALTER TABLE c1 DROP PRIMARY KEY(custid);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(custid)' at line 1
MariaDB [csd22044s18]> ALTER TABLE c1  DROP PRIMARY KEY;
Query OK, 10 rows affected (0.69 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> desc c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.02 sec)

MariaDB [csd22044s18]> UPDATE c1 SET custid = 1 WHERE age >=50;
Query OK, 5 rows affected (0.03 sec)
Rows matched: 5  Changed: 5  Warnings: 0

MariaDB [csd22044s18]> desc c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM C1;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | BM       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| 1      | Donna newman    | New      | Toronto    | 130120     |   50 |
| 1      | Eston M.        | M.       | Toronto    | 201023     |   65 |
| 1      | Bobby Chacko    | Chack    | New York   | 320300     |   70 |
| 1      | Ashko Charles   | AK       | USA        | 421044     |   72 |
| 1      | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd22044s18]> create table MOCK_DATA (
    -> employeid INT,
    -> first_name VARCHAR(50),
    -> last_name VARCHAR(50),
    -> email VARCHAR(50),
    -> gender VARCHAR(50),
    -> address VARCHAR(50),
    -> salary INT
    -> );
Query OK, 0 rows affected (0.19 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (1, 'Earle', 'Brown', 'ebrown0@huffingtonpost.com', 'Male', '0 Kropf Place', 3099);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (2, 'Reider', 'Bucktrout', 'rbucktrout1@merriam-webster.com', 'Male', '457 Dorton Way', 3465);
Query OK, 1 row affected (0.06 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (3, 'Lorry', 'Eatttok', 'leatttok2@bing.com', 'Male', '9 Corry Plaza', 3494);
Query OK, 1 row affected (0.11 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (4, 'Timotheus', 'Kirkam', 'tkirkam3@surveymonkey.com', 'Male', '96 Logan Center', 3568);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (5, 'Valeria', 'Pether', 'vpether4@blogtalkradio.com', 'Female', '6575 4th Lane', 2253);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (6, 'Germaine', 'MacMakin', 'gmacmakin5@nydailynews.com', 'Female', '11 Sauthoff Lane', 4186);
Query OK, 1 row affected (0.05 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (7, 'La verne', 'Cayet', 'lcayet6@wix.com', 'Female', '4 Cottonwood Way', 4840);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (8, 'Paton', 'Streather', 'pstreather7@skyrock.com', 'Male', '238 Gerald Lane', 1832);
Query OK, 1 row affected (0.01 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (9, 'Parker', 'Shenton', 'pshenton8@marriott.com', 'Male', '87776 Sunbrook Parkway', 2003);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (10, 'Sib', 'Feldberger', 'sfeldberger9@histats.com', 'Female', '23 Raven Junction', 2811);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (11, 'Jedediah', 'Cathee', 'jcatheea@tiny.cc', 'Male', '57 Nevada Hill', 3380);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (12, 'Norrie', 'Brownsea', 'nbrownseab@wufoo.com', 'Female', '64795 Morningstar Way', 3994);
Query OK, 1 row affected (0.01 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (13, 'Terra', 'Lammie', 'tlammiec@mail.ru', 'Female', '885 Melby Circle', 1496);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (14, 'Johnny', 'Avramovic', 'javramovicd@ihg.com', 'Male', '8 Dottie Court', 2970);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (15, 'Hestia', 'Kesper', 'hkespere@merriam-webster.com', 'Female', '13 Sutherland Avenue', 4013);
Query OK, 1 row affected (0.06 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (16, 'Corbet', 'Croasdale', 'ccroasdalef@skyrock.com', 'Male', '917 Bluejay Center', 4286);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (17, 'Billi', 'Stanyon', 'bstanyong@pcworld.com', 'Female', '53286 Forest Run Avenue', 1184);
Query OK, 1 row affected (0.01 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (18, 'Ruy', 'Joret', 'rjoreth@mit.edu', 'Male', '06 Grim Circle', 3481);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (19, 'Mabelle', 'Shilliday', 'mshillidayi@intel.com', 'Female', '326 Eggendart Way', 2569);
Query OK, 1 row affected (0.01 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (20, 'Pincas', 'Kempe', 'pkempej@aboutads.info', 'Male', '89682 Arizona Circle', 2772);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (21, 'Kellen', 'Ware', 'kwarek@typepad.com', 'Male', '98 Schmedeman Circle', 3947);
Query OK, 1 row affected (0.05 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (22, 'Noah', 'Robilliard', 'nrobilliardl@cdbaby.com', 'Male', '613 Pepper Wood Terrace', 4163);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (23, 'Wolfie', 'Anscombe', 'wanscombem@buzzfeed.com', 'Male', '231 Kennedy Avenue', 2386);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (24, 'Nickie', 'Bloomer', 'nbloomern@devhub.com', 'Female', '46 Drewry Point', 4087);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (25, 'Cristie', 'Wherry', 'cwherryo@nba.com', 'Female', '97936 Manley Point', 4041);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (26, 'Ced', 'Figures', 'cfiguresp@printfriendly.com', 'Male', '166 Meadow Vale Crossing', 2517);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (27, 'Gerrie', 'Eager', 'geagerq@myspace.com', 'Male', '25519 Village Parkway', 4575);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (28, 'Skye', 'Garlick', 'sgarlickr@cloudflare.com', 'Male', '4092 Hayes Parkway', 2548);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (29, 'Abeu', 'Rodman', 'arodmans@chron.com', 'Male', '81458 Hanson Center', 4761);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (30, 'Wallis', 'Stihl', 'wstihlt@a8.net', 'Male', '15844 Judy Point', 3212);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (31, 'Palmer', 'Saltrese', 'psaltreseu@cargocollective.com', 'Male', '75 Eggendart Place', 2071);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (32, 'Stavro', 'Corkitt', 'scorkittv@skype.com', 'Male', '49 Kipling Crossing', 4427);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (33, 'Oates', 'Fundell', 'ofundellw@spotify.com', 'Male', '96 Lerdahl Parkway', 2756);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (34, 'Noel', 'Gartan', 'ngartanx@ow.ly', 'Female', '6413 Jenifer Alley', 4512);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (35, 'Carolin', 'Heinsen', 'cheinseny@telegraph.co.uk', 'Female', '3396 Prentice Avenue', 3130);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (36, 'Gleda', 'Hickinbottom', 'ghickinbottomz@berkeley.edu', 'Female', '62 Carioca Terrace', 2137);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (37, 'Germaine', 'Varian', 'gvarian10@shutterfly.com', 'Female', '47 Badeau Point', 2205);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (38, 'Marnia', 'Coveney', 'mcoveney11@sogou.com', 'Female', '49 Lighthouse Bay Trail', 3227);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (39, 'Carey', 'Ecles', 'cecles12@globo.com', 'Male', '988 Sugar Hill', 1179);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (40, 'Sutton', 'Stopper', 'sstopper13@harvard.edu', 'Male', '83896 Veith Terrace', 2405);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (41, 'Daron', 'Piquard', 'dpiquard14@nature.com', 'Female', '5995 Ludington Terrace', 1285);
Query OK, 1 row affected (0.05 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (42, 'Skipper', 'O''Lennane', 'solennane15@army.mil', 'Male', '8 Anniversary Lane', 4844);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (43, 'Harper', 'Izakov', 'hizakov16@gizmodo.com', 'Male', '389 Vernon Way', 2324);
Query OK, 1 row affected (0.11 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (44, 'Cybil', 'Hospital', 'chospital17@flickr.com', 'Female', '45 Reindahl Alley', 3108);
Query OK, 1 row affected (0.05 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (45, 'Georges', 'Grossier', 'ggrossier18@squidoo.com', 'Male', '8837 Paget Plaza', 4501);
Query OK, 1 row affected (0.09 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (46, 'Merralee', 'Dagg', 'mdagg19@histats.com', 'Female', '809 Prentice Trail', 1809);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (47, 'Forester', 'Clink', 'fclink1a@latimes.com', 'Male', '5831 Paget Lane', 1264);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (48, 'Callida', 'Bushen', 'cbushen1b@mit.edu', 'Female', '82 Sullivan Plaza', 1964);
Query OK, 1 row affected (0.03 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (49, 'Fair', 'Wilkennson', 'fwilkennson1c@hatena.ne.jp', 'Male', '41697 Swallow Junction', 2409);
Query OK, 1 row affected (0.02 sec)

MariaDB [csd22044s18]> insert into MOCK_DATA (employeid, first_name, last_name, email, gender, address, salary) values (50, 'Daphna', 'Roon', 'droon1d@booking.com', 'Female', '6061 Scofield Alley', 1350);
Query OK, 1 row affected (0.05 sec)

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

MariaDB [csd22044s18]> desc mock_data;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| employeid  | int(11)     | YES  |     | NULL    |       |
| first_name | varchar(50) | YES  |     | NULL    |       |
| last_name  | varchar(50) | YES  |     | NULL    |       |
| email      | varchar(50) | YES  |     | NULL    |       |
| gender     | varchar(50) | YES  |     | NULL    |       |
| address    | varchar(50) | YES  |     | NULL    |       |
| salary     | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> select * from mock_data;
+-----------+------------+--------------+---------------------------------+--------+--------------------------+--------+
| employeid | first_name | last_name    | email                           | gender | address                  | salary |
+-----------+------------+--------------+---------------------------------+--------+--------------------------+--------+
|         1 | Earle      | Brown        | ebrown0@huffingtonpost.com      | Male   | 0 Kropf Place            |   3099 |
|         2 | Reider     | Bucktrout    | rbucktrout1@merriam-webster.com | Male   | 457 Dorton Way           |   3465 |
|         3 | Lorry      | Eatttok      | leatttok2@bing.com              | Male   | 9 Corry Plaza            |   3494 |
|         4 | Timotheus  | Kirkam       | tkirkam3@surveymonkey.com       | Male   | 96 Logan Center          |   3568 |
|         5 | Valeria    | Pether       | vpether4@blogtalkradio.com      | Female | 6575 4th Lane            |   2253 |
|         6 | Germaine   | MacMakin     | gmacmakin5@nydailynews.com      | Female | 11 Sauthoff Lane         |   4186 |
|         7 | La verne   | Cayet        | lcayet6@wix.com                 | Female | 4 Cottonwood Way         |   4840 |
|         8 | Paton      | Streather    | pstreather7@skyrock.com         | Male   | 238 Gerald Lane          |   1832 |
|         9 | Parker     | Shenton      | pshenton8@marriott.com          | Male   | 87776 Sunbrook Parkway   |   2003 |
|        10 | Sib        | Feldberger   | sfeldberger9@histats.com        | Female | 23 Raven Junction        |   2811 |
|        11 | Jedediah   | Cathee       | jcatheea@tiny.cc                | Male   | 57 Nevada Hill           |   3380 |
|        12 | Norrie     | Brownsea     | nbrownseab@wufoo.com            | Female | 64795 Morningstar Way    |   3994 |
|        13 | Terra      | Lammie       | tlammiec@mail.ru                | Female | 885 Melby Circle         |   1496 |
|        14 | Johnny     | Avramovic    | javramovicd@ihg.com             | Male   | 8 Dottie Court           |   2970 |
|        15 | Hestia     | Kesper       | hkespere@merriam-webster.com    | Female | 13 Sutherland Avenue     |   4013 |
|        16 | Corbet     | Croasdale    | ccroasdalef@skyrock.com         | Male   | 917 Bluejay Center       |   4286 |
|        17 | Billi      | Stanyon      | bstanyong@pcworld.com           | Female | 53286 Forest Run Avenue  |   1184 |
|        18 | Ruy        | Joret        | rjoreth@mit.edu                 | Male   | 06 Grim Circle           |   3481 |
|        19 | Mabelle    | Shilliday    | mshillidayi@intel.com           | Female | 326 Eggendart Way        |   2569 |
|        20 | Pincas     | Kempe        | pkempej@aboutads.info           | Male   | 89682 Arizona Circle     |   2772 |
|        21 | Kellen     | Ware         | kwarek@typepad.com              | Male   | 98 Schmedeman Circle     |   3947 |
|        22 | Noah       | Robilliard   | nrobilliardl@cdbaby.com         | Male   | 613 Pepper Wood Terrace  |   4163 |
|        23 | Wolfie     | Anscombe     | wanscombem@buzzfeed.com         | Male   | 231 Kennedy Avenue       |   2386 |
|        24 | Nickie     | Bloomer      | nbloomern@devhub.com            | Female | 46 Drewry Point          |   4087 |
|        25 | Cristie    | Wherry       | cwherryo@nba.com                | Female | 97936 Manley Point       |   4041 |
|        26 | Ced        | Figures      | cfiguresp@printfriendly.com     | Male   | 166 Meadow Vale Crossing |   2517 |
|        27 | Gerrie     | Eager        | geagerq@myspace.com             | Male   | 25519 Village Parkway    |   4575 |
|        28 | Skye       | Garlick      | sgarlickr@cloudflare.com        | Male   | 4092 Hayes Parkway       |   2548 |
|        29 | Abeu       | Rodman       | arodmans@chron.com              | Male   | 81458 Hanson Center      |   4761 |
|        30 | Wallis     | Stihl        | wstihlt@a8.net                  | Male   | 15844 Judy Point         |   3212 |
|        31 | Palmer     | Saltrese     | psaltreseu@cargocollective.com  | Male   | 75 Eggendart Place       |   2071 |
|        32 | Stavro     | Corkitt      | scorkittv@skype.com             | Male   | 49 Kipling Crossing      |   4427 |
|        33 | Oates      | Fundell      | ofundellw@spotify.com           | Male   | 96 Lerdahl Parkway       |   2756 |
|        34 | Noel       | Gartan       | ngartanx@ow.ly                  | Female | 6413 Jenifer Alley       |   4512 |
|        35 | Carolin    | Heinsen      | cheinseny@telegraph.co.uk       | Female | 3396 Prentice Avenue     |   3130 |
|        36 | Gleda      | Hickinbottom | ghickinbottomz@berkeley.edu     | Female | 62 Carioca Terrace       |   2137 |
|        37 | Germaine   | Varian       | gvarian10@shutterfly.com        | Female | 47 Badeau Point          |   2205 |
|        38 | Marnia     | Coveney      | mcoveney11@sogou.com            | Female | 49 Lighthouse Bay Trail  |   3227 |
|        39 | Carey      | Ecles        | cecles12@globo.com              | Male   | 988 Sugar Hill           |   1179 |
|        40 | Sutton     | Stopper      | sstopper13@harvard.edu          | Male   | 83896 Veith Terrace      |   2405 |
|        41 | Daron      | Piquard      | dpiquard14@nature.com           | Female | 5995 Ludington Terrace   |   1285 |
|        42 | Skipper    | O'Lennane    | solennane15@army.mil            | Male   | 8 Anniversary Lane       |   4844 |
|        43 | Harper     | Izakov       | hizakov16@gizmodo.com           | Male   | 389 Vernon Way           |   2324 |
|        44 | Cybil      | Hospital     | chospital17@flickr.com          | Female | 45 Reindahl Alley        |   3108 |
|        45 | Georges    | Grossier     | ggrossier18@squidoo.com         | Male   | 8837 Paget Plaza         |   4501 |
|        46 | Merralee   | Dagg         | mdagg19@histats.com             | Female | 809 Prentice Trail       |   1809 |
|        47 | Forester   | Clink        | fclink1a@latimes.com            | Male   | 5831 Paget Lane          |   1264 |
|        48 | Callida    | Bushen       | cbushen1b@mit.edu               | Female | 82 Sullivan Plaza        |   1964 |
|        49 | Fair       | Wilkennson   | fwilkennson1c@hatena.ne.jp      | Male   | 41697 Swallow Junction   |   2409 |
|        50 | Daphna     | Roon         | droon1d@booking.com             | Female | 6061 Scofield Alley      |   1350 |
+-----------+------------+--------------+---------------------------------+--------+--------------------------+--------+
50 rows in set (0.00 sec)

MariaDB [csd22044s18]> alter table mock_data add  primary key (employeid);
Query OK, 50 rows affected (0.71 sec)
Records: 50  Duplicates: 0  Warnings: 0

MariaDB [csd22044s18]> desc mock_data;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| employeid  | int(11)     | NO   | PRI | NULL    |       |
| first_name | varchar(50) | YES  |     | NULL    |       |
| last_name  | varchar(50) | YES  |     | NULL    |       |
| email      | varchar(50) | YES  |     | NULL    |       |
| gender     | varchar(50) | YES  |     | NULL    |       |
| address    | varchar(50) | YES  |     | NULL    |       |
| salary     | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

