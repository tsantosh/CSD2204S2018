MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| csd22044s18        |
| information_schema |
| mysql              |
| newtb              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
7 rows in set (0.08 sec)

MariaDB [(none)]> use csd22044s18;
Database changed
MariaDB [csd22044s18]> show tables;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| c1                    |
| c3                    |
| copy                  |
| countries             |
| customer              |
| departments           |
| employees             |
| job_history           |
| jobs                  |
| locations             |
| manu                  |
| mock_data             |
| movie                 |
| newbooks              |
| orders                |
| persons               |
| products              |
| regions               |
+-----------------------+
18 rows in set (0.00 sec)

MariaDB [csd22044s18]> select * from products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
+------+-----------------+-------+--------------+
13 rows in set (0.08 sec)

MariaDB [csd22044s18]> CREATE OR REPLACE VIEW v4 AS SELECT first_name, last_name, salary FROM employees where salary > all ( select avg ( salary) from employees group by department_id);
Query OK, 0 rows affected (0.09 sec)

MariaDB [csd22044s18]> select * FROM V4;
+------------+-----------+----------+
| first_name | last_name | salary   |
+------------+-----------+----------+
| Steven     | King      | 24000.00 |
+------------+-----------+----------+
1 row in set (0.05 sec)

MariaDB [csd22044s18]> DROP VIEW V5;
ERROR 1051 (42S02): Unknown table 'csd22044s18.v5'
MariaDB [csd22044s18]> DROP VIEW IF EISTS V5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'EISTS V5' at line 1
MariaDB [csd22044s18]> DROP VIEW IF EXISTS V5;
Query OK, 0 rows affected, 1 warning (0.00 sec)

MariaDB [csd22044s18]> SHOW TABLES;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| c1                    |
| c3                    |
| copy                  |
| countries             |
| customer              |
| departments           |
| employees             |
| job_history           |
| jobs                  |
| locations             |
| manu                  |
| mock_data             |
| movie                 |
| newbooks              |
| orders                |
| persons               |
| products              |
| regions               |
| v4                    |
+-----------------------+
19 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM V1;
ERROR 1146 (42S02): Table 'csd22044s18.v1' doesn't exist
MariaDB [csd22044s18]> CREATE VIEW V1 AS SELECT * FROM PRODUCTS;
Query OK, 0 rows affected (0.02 sec)

MariaDB [csd22044s18]> SHOW VIEWS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'VIEWS' at line 1
MariaDB [csd22044s18]> SELECT * FROM VIEW1;
ERROR 1146 (42S02): Table 'csd22044s18.view1' doesn't exist
MariaDB [csd22044s18]> SELECT * FROM V1;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
+------+-----------------+-------+--------------+
13 rows in set (0.00 sec)

MariaDB [csd22044s18]> CREATE OR REPLACE VIEW v1 AS SELECT * FROM PRODUCTS WHERE price > 100;
Query OK, 0 rows affected (0.03 sec)

MariaDB [csd22044s18]> select * from v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> insert into v1 values(20,'usb port',89,2);
Query OK, 1 row affected (0.09 sec)

MariaDB [csd22044s18]> select * from v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> select * from v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> select * from products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
|   20 | usb port        |    89 |            2 |
+------+-----------------+-------+--------------+
14 rows in set (0.00 sec)

MariaDB [csd22044s18]> delete from v1 where code = 20;
Query OK, 0 rows affected (0.00 sec)

MariaDB [csd22044s18]> select * from v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd22044s18]> select name,price FROM PRODUCTS WHERE name like '%drive';
+------------+-------+
| name       | price |
+------------+-------+
| Hard drive |   240 |
| ZIP drive  |   150 |
| DVD drive  |   180 |
| CD drive   |    90 |
+------------+-------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> CREATE OR REPLACE VIEW V2 AS SELECT name, price FROM PRODUCTSWHERE nname LIKE  '%drive';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'LIKE  '%drive'' at line 1
MariaDB [csd22044s18]> CREATE OR REPLACE VIEW V2 AS SELECT name, price FROM PRODUCTS WHERE name LIKE  '%drive';
Query OK, 0 rows affected (0.03 sec)

MariaDB [csd22044s18]> select * from v2;
+------------+-------+
| name       | price |
+------------+-------+
| Hard drive |   240 |
| ZIP drive  |   150 |
| DVD drive  |   180 |
| CD drive   |    90 |
+------------+-------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> select* from manu;
+------+-------------------+
| Code | Name              |
+------+-------------------+
|    1 | Sony              |
|    2 | Creative Labs     |
|    3 | Hewlett-Packard   |
|    4 | Iomega            |
|    5 | Fujitsu           |
|    6 | Winchester        |
|    7 | moxDroid Labs Inc |
|    8 | Dell              |
|    9 | Bell Labs         |
+------+-------------------+
9 rows in set (0.00 sec)

MariaDB [csd22044s18]> CREATE OR REPLACE VIEW V4 AS SELECT first_name,last_name, salary FROM employees WHERE salary > all (select avg(salary) from employees Group by department_id);
Query OK, 0 rows affected (0.02 sec)

MariaDB [csd22044s18]> select products.code, products.name "products",manu.name "manufraturer" FROM manu INNER join PRODUCTSON PRODUCTS.MANUFACTURER = MANU.CODE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '.MANUFACTURER = MANU.CODE' at line 1
MariaDB [csd22044s18]> select products.code, products.name "products",manu.name "manufraturer" FROM manu INNER join PRODUCTS ON PRODUCTS.MANUFACTURER = MANU.CODE;
+------+-----------------+-------------------+
| code | products        | manufraturer      |
+------+-----------------+-------------------+
|    1 | Hard drive      | Fujitsu           |
|    2 | Memory          | Winchester        |
|    3 | ZIP drive       | Iomega            |
|    4 | Floppy disk     | Winchester        |
|    5 | Monitor         | Sony              |
|    6 | DVD drive       | Creative Labs     |
|    7 | CD drive        | Creative Labs     |
|    8 | Printer         | Hewlett-Packard   |
|    9 | Toner cartridge | Hewlett-Packard   |
|   10 | DVD burner      | Creative Labs     |
|   11 | Printer         | moxDroid Labs Inc |
|   12 | Toner cartridge | moxDroid Labs Inc |
|   13 | DVD burner      | moxDroid Labs Inc |
|   20 | usb port        | Creative Labs     |
+------+-----------------+-------------------+
14 rows in set (0.00 sec)

MariaDB [csd22044s18]> create or replace view v3 as select products.code, products.name "products",manu.name "manufraturer" FROM manu INNER join PRODUCTSON PRODUCTS.MANUFACTURER = MANU.CODE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '.MANUFACTURER = MANU.CODE' at line 1
MariaDB [csd22044s18]> create or replace view v3 as select products.code, products.name "products",manu.name "manufraturer" FROM manu INNER join PRODUCTS ON PRODUCTS.MANUFACTURER = MANU.CODE;
Query OK, 0 rows affected (0.03 sec)

MariaDB [csd22044s18]> drop view if exists v1;
Query OK, 0 rows affected (0.00 sec)

MariaDB [csd22044s18]> show tables;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| c1                    |
| c3                    |
| copy                  |
| countries             |
| customer              |
| departments           |
| employees             |
| job_history           |
| jobs                  |
| locations             |
| manu                  |
| mock_data             |
| movie                 |
| newbooks              |
| orders                |
| persons               |
| products              |
| regions               |
| v2                    |
| v3                    |
| v4                    |
+-----------------------+
21 rows in set (0.00 sec)

