MariaDB [(none)]> cd  C:\xampp\mysql\bin
ERROR: Unknown command '\x'.
ERROR: Unknown command '\m'.
ERROR: Unknown command '\b'.
    -> cd C:\xampp\mysql\bin
ERROR: Unknown command '\x'.
ERROR: Unknown command '\m'.
ERROR: Unknown command '\b'.
    -> cd C:\xampp\mysql\bin;
ERROR: Unknown command '\x'.
ERROR: Unknown command '\m'.
ERROR: Unknown command '\b'.
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'cd  C:\xampp\mysql\bin
cd C:\xampp\mysql\bin
cd C:\xampp\mysql\bin' at line 1
MariaDB [(none)]> CREATE DATABASE CSD2204S18
    -> CREATE DATABASE CSD22044S18;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CREATE DATABASE CSD22044S18' at line 2
MariaDB [(none)]> CREATE DATABASE CSD22044S18;
Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]> SHOW DATABASES
    -> SHAW DATABASES;\
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SHAW DATABASES' at line 2
MariaDB [(none)]> SHAW DATABASES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SHAW DATABASES' at line 1
MariaDB [(none)]> SHOW DATABASES;
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

MariaDB [(none)]> CREATE TABLE Customer(
    -> custid VARCHAR(5) PRIMARY KEY ,
    -> name VARCHAR(50),
    -> nickname VARCHAR(10),
    -> city VARCHAR(20),
    -> postalCode VARCHAR(10),
    -> age INTERGER(3))
    -> USE CSD2204s18;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> USE CSD2204S18;
ERROR 1049 (42000): Unknown database 'csd2204s18'
MariaDB [(none)]> USE CSD2204S18;
ERROR 1049 (42000): Unknown database 'csd2204s18'
MariaDB [(none)]> SHOW DATABASES;
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

MariaDB [(none)]> USE CSD22044S18;
Database changed
MariaDB [CSD22044S18]> CREATE  TABLE Customer(
    -> custid VARCHAR(5) PRIMARY KEY ,
    -> name VARCHAR(50),
    -> nickname VARCHAR(10),
    -> city VARCHAR(20),
    -> postalCode VARCHAR(10),
    -> age INTERGER(3));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'INTERGER(3))' at line 7
MariaDB [CSD22044S18]> CREATE  TABLE Customer(
    -> custid VARCHAR(5) PRIMARY KEY ,
    -> name VARCHAR(50),
    -> nickname VARCHAR(10),
    -> city VARCHAR(20),
    -> postalCode VARCHAR(10),
    -> age INTEGER(3));
Query OK, 0 rows affected (0.36 sec)

MariaDB [CSD22044S18]> show tables
    -> SHOW TABLES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SHOW TABLES' at line 2
MariaDB [CSD22044S18]> SHOW TABLES;
+-----------------------+
| Tables_in_csd22044s18 |
+-----------------------+
| customer              |
+-----------------------+
1 row in set (0.00 sec)

MariaDB [CSD22044S18]> EXIT
