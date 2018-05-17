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

MariaDB [csd22044s18]> use db;
ERROR 1049 (42000): Unknown database 'db'
MariaDB [csd22044s18]> desc countries;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| COUNTRY_ID   | varchar(2)    | NO   | PRI | NULL    |       |
| COUNTRY_NAME | varchar(40)   | YES  |     | NULL    |       |
| REGION_ID    | decimal(10,0) | YES  | MUL | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> desc employees;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| EMPLOYEE_ID    | decimal(6,0) | NO   | PRI | 0       |       |
| FIRST_NAME     | varchar(20)  | YES  |     | NULL    |       |
| LAST_NAME      | varchar(25)  | NO   | MUL | NULL    |       |
| EMAIL          | varchar(25)  | NO   | UNI | NULL    |       |
| PHONE_NUMBER   | varchar(20)  | YES  |     | NULL    |       |
| HIRE_DATE      | date         | NO   |     | NULL    |       |
| JOB_ID         | varchar(10)  | NO   | MUL | NULL    |       |
| SALARY         | decimal(8,2) | YES  |     | NULL    |       |
| COMMISSION_PCT | decimal(2,2) | YES  |     | NULL    |       |
| MANAGER_ID     | decimal(6,0) | YES  | MUL | NULL    |       |
| DEPARTMENT_ID  | decimal(4,0) | YES  | MUL | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
11 rows in set (0.02 sec)

MariaDB [csd22044s18]> desc departments;
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | YES  | MUL | NULL    |       |
| LOCATION_ID     | decimal(4,0) | YES  | MUL | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> desc jobhistory;
ERROR 1146 (42S02): Table 'csd22044s18.jobhistory' doesn't exist
MariaDB [csd22044s18]> desc job_history;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| EMPLOYEE_ID   | decimal(6,0) | NO   | PRI | NULL    |       |
| START_DATE    | date         | NO   | PRI | NULL    |       |
| END_DATE      | date         | NO   |     | NULL    |       |
| JOB_ID        | varchar(10)  | NO   | MUL | NULL    |       |
| DEPARTMENT_ID | decimal(4,0) | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

MariaDB [csd22044s18]> desc locations;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| LOCATION_ID    | decimal(4,0) | NO   | PRI | 0       |       |
| STREET_ADDRESS | varchar(40)  | YES  |     | NULL    |       |
| POSTAL_CODE    | varchar(12)  | YES  |     | NULL    |       |
| CITY           | varchar(30)  | NO   | MUL | NULL    |       |
| STATE_PROVINCE | varchar(25)  | YES  | MUL | NULL    |       |
| COUNTRY_ID     | varchar(2)   | YES  | MUL | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> desc regions;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| REGION_ID   | decimal(5,0) | NO   | PRI | NULL    |       |
| REGION_NAME | varchar(25)  | YES  | UNI | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> desc jobs;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> select * from employees;
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME  | LAST_NAME   | EMAIL    | PHONE_NUMBER       | HIRE_DATE  | JOB_ID     | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
|         100 | Steven      | King        | SKING    | 515.123.4567       | 1987-06-17 | AD_PRES    | 24000.00 |           0.00 |          0 |            90 |
|         101 | Neena       | Kochhar     | NKOCHHAR | 515.123.4568       | 1987-06-18 | AD_VP      | 17000.00 |           0.00 |        100 |            90 |
|         102 | Lex         | De Haan     | LDEHAAN  | 515.123.4569       | 1987-06-19 | AD_VP      | 17000.00 |           0.00 |        100 |            90 |
|         103 | Alexander   | Hunold      | AHUNOLD  | 590.423.4567       | 1987-06-20 | IT_PROG    |  9000.00 |           0.00 |        102 |            60 |
|         104 | Bruce       | Ernst       | BERNST   | 590.423.4568       | 1987-06-21 | IT_PROG    |  6000.00 |           0.00 |        103 |            60 |
|         105 | David       | Austin      | DAUSTIN  | 590.423.4569       | 1987-06-22 | IT_PROG    |  4800.00 |           0.00 |        103 |            60 |
|         106 | Valli       | Pataballa   | VPATABAL | 590.423.4560       | 1987-06-23 | IT_PROG    |  4800.00 |           0.00 |        103 |            60 |
|         107 | Diana       | Lorentz     | DLORENTZ | 590.423.5567       | 1987-06-24 | IT_PROG    |  4200.00 |           0.00 |        103 |            60 |
|         108 | Nancy       | Greenberg   | NGREENBE | 515.124.4569       | 1987-06-25 | FI_MGR     | 12000.00 |           0.00 |        101 |           100 |
|         109 | Daniel      | Faviet      | DFAVIET  | 515.124.4169       | 1987-06-26 | FI_ACCOUNT |  9000.00 |           0.00 |        108 |           100 |
|         110 | John        | Chen        | JCHEN    | 515.124.4269       | 1987-06-27 | FI_ACCOUNT |  8200.00 |           0.00 |        108 |           100 |
|         111 | Ismael      | Sciarra     | ISCIARRA | 515.124.4369       | 1987-06-28 | FI_ACCOUNT |  7700.00 |           0.00 |        108 |           100 |
|         112 | Jose Manuel | Urman       | JMURMAN  | 515.124.4469       | 1987-06-29 | FI_ACCOUNT |  7800.00 |           0.00 |        108 |           100 |
|         113 | Luis        | Popp        | LPOPP    | 515.124.4567       | 1987-06-30 | FI_ACCOUNT |  6900.00 |           0.00 |        108 |           100 |
|         114 | Den         | Raphaely    | DRAPHEAL | 515.127.4561       | 1987-07-01 | PU_MAN     | 11000.00 |           0.00 |        100 |            30 |
|         115 | Alexander   | Khoo        | AKHOO    | 515.127.4562       | 1987-07-02 | PU_CLERK   |  3100.00 |           0.00 |        114 |            30 |
|         116 | Shelli      | Baida       | SBAIDA   | 515.127.4563       | 1987-07-03 | PU_CLERK   |  2900.00 |           0.00 |        114 |            30 |
|         117 | Sigal       | Tobias      | STOBIAS  | 515.127.4564       | 1987-07-04 | PU_CLERK   |  2800.00 |           0.00 |        114 |            30 |
|         118 | Guy         | Himuro      | GHIMURO  | 515.127.4565       | 1987-07-05 | PU_CLERK   |  2600.00 |           0.00 |        114 |            30 |
|         119 | Karen       | Colmenares  | KCOLMENA | 515.127.4566       | 1987-07-06 | PU_CLERK   |  2500.00 |           0.00 |        114 |            30 |
|         120 | Matthew     | Weiss       | MWEISS   | 650.123.1234       | 1987-07-07 | ST_MAN     |  8000.00 |           0.00 |        100 |            50 |
|         121 | Adam        | Fripp       | AFRIPP   | 650.123.2234       | 1987-07-08 | ST_MAN     |  8200.00 |           0.00 |        100 |            50 |
|         122 | Payam       | Kaufling    | PKAUFLIN | 650.123.3234       | 1987-07-09 | ST_MAN     |  7900.00 |           0.00 |        100 |            50 |
|         123 | Shanta      | Vollman     | SVOLLMAN | 650.123.4234       | 1987-07-10 | ST_MAN     |  6500.00 |           0.00 |        100 |            50 |
|         124 | Kevin       | Mourgos     | KMOURGOS | 650.123.5234       | 1987-07-11 | ST_MAN     |  5800.00 |           0.00 |        100 |            50 |
|         125 | Julia       | Nayer       | JNAYER   | 650.124.1214       | 1987-07-12 | ST_CLERK   |  3200.00 |           0.00 |        120 |            50 |
|         126 | Irene       | Mikkilineni | IMIKKILI | 650.124.1224       | 1987-07-13 | ST_CLERK   |  2700.00 |           0.00 |        120 |            50 |
|         127 | James       | Landry      | JLANDRY  | 650.124.1334       | 1987-07-14 | ST_CLERK   |  2400.00 |           0.00 |        120 |            50 |
|         128 | Steven      | Markle      | SMARKLE  | 650.124.1434       | 1987-07-15 | ST_CLERK   |  2200.00 |           0.00 |        120 |            50 |
|         129 | Laura       | Bissot      | LBISSOT  | 650.124.5234       | 1987-07-16 | ST_CLERK   |  3300.00 |           0.00 |        121 |            50 |
|         130 | Mozhe       | Atkinson    | MATKINSO | 650.124.6234       | 1987-07-17 | ST_CLERK   |  2800.00 |           0.00 |        121 |            50 |
|         131 | James       | Marlow      | JAMRLOW  | 650.124.7234       | 1987-07-18 | ST_CLERK   |  2500.00 |           0.00 |        121 |            50 |
|         132 | TJ          | Olson       | TJOLSON  | 650.124.8234       | 1987-07-19 | ST_CLERK   |  2100.00 |           0.00 |        121 |            50 |
|         133 | Jason       | Mallin      | JMALLIN  | 650.127.1934       | 1987-07-20 | ST_CLERK   |  3300.00 |           0.00 |        122 |            50 |
|         134 | Michael     | Rogers      | MROGERS  | 650.127.1834       | 1987-07-21 | ST_CLERK   |  2900.00 |           0.00 |        122 |            50 |
|         135 | Ki          | Gee         | KGEE     | 650.127.1734       | 1987-07-22 | ST_CLERK   |  2400.00 |           0.00 |        122 |            50 |
|         136 | Hazel       | Philtanker  | HPHILTAN | 650.127.1634       | 1987-07-23 | ST_CLERK   |  2200.00 |           0.00 |        122 |            50 |
|         137 | Renske      | Ladwig      | RLADWIG  | 650.121.1234       | 1987-07-24 | ST_CLERK   |  3600.00 |           0.00 |        123 |            50 |
|         138 | Stephen     | Stiles      | SSTILES  | 650.121.2034       | 1987-07-25 | ST_CLERK   |  3200.00 |           0.00 |        123 |            50 |
|         139 | John        | Seo         | JSEO     | 650.121.2019       | 1987-07-26 | ST_CLERK   |  2700.00 |           0.00 |        123 |            50 |
|         140 | Joshua      | Patel       | JPATEL   | 650.121.1834       | 1987-07-27 | ST_CLERK   |  2500.00 |           0.00 |        123 |            50 |
|         141 | Trenna      | Rajs        | TRAJS    | 650.121.8009       | 1987-07-28 | ST_CLERK   |  3500.00 |           0.00 |        124 |            50 |
|         142 | Curtis      | Davies      | CDAVIES  | 650.121.2994       | 1987-07-29 | ST_CLERK   |  3100.00 |           0.00 |        124 |            50 |
|         143 | Randall     | Matos       | RMATOS   | 650.121.2874       | 1987-07-30 | ST_CLERK   |  2600.00 |           0.00 |        124 |            50 |
|         144 | Peter       | Vargas      | PVARGAS  | 650.121.2004       | 1987-07-31 | ST_CLERK   |  2500.00 |           0.00 |        124 |            50 |
|         145 | John        | Russell     | JRUSSEL  | 011.44.1344.429268 | 1987-08-01 | SA_MAN     | 14000.00 |           0.40 |        100 |            80 |
|         146 | Karen       | Partners    | KPARTNER | 011.44.1344.467268 | 1987-08-02 | SA_MAN     | 13500.00 |           0.30 |        100 |            80 |
|         147 | Alberto     | Errazuriz   | AERRAZUR | 011.44.1344.429278 | 1987-08-03 | SA_MAN     | 12000.00 |           0.30 |        100 |            80 |
|         148 | Gerald      | Cambrault   | GCAMBRAU | 011.44.1344.619268 | 1987-08-04 | SA_MAN     | 11000.00 |           0.30 |        100 |            80 |
|         149 | Eleni       | Zlotkey     | EZLOTKEY | 011.44.1344.429018 | 1987-08-05 | SA_MAN     | 10500.00 |           0.20 |        100 |            80 |
|         150 | Peter       | Tucker      | PTUCKER  | 011.44.1344.129268 | 1987-08-06 | SA_REP     | 10000.00 |           0.30 |        145 |            80 |
|         151 | David       | Bernstein   | DBERNSTE | 011.44.1344.345268 | 1987-08-07 | SA_REP     |  9500.00 |           0.25 |        145 |            80 |
|         152 | Peter       | Hall        | PHALL    | 011.44.1344.478968 | 1987-08-08 | SA_REP     |  9000.00 |           0.25 |        145 |            80 |
|         153 | Christopher | Olsen       | COLSEN   | 011.44.1344.498718 | 1987-08-09 | SA_REP     |  8000.00 |           0.20 |        145 |            80 |
|         154 | Nanette     | Cambrault   | NCAMBRAU | 011.44.1344.987668 | 1987-08-10 | SA_REP     |  7500.00 |           0.20 |        145 |            80 |
|         155 | Oliver      | Tuvault     | OTUVAULT | 011.44.1344.486508 | 1987-08-11 | SA_REP     |  7000.00 |           0.15 |        145 |            80 |
|         156 | Janette     | King        | JKING    | 011.44.1345.429268 | 1987-08-12 | SA_REP     | 10000.00 |           0.35 |        146 |            80 |
|         157 | Patrick     | Sully       | PSULLY   | 011.44.1345.929268 | 1987-08-13 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         158 | Allan       | McEwen      | AMCEWEN  | 011.44.1345.829268 | 1987-08-14 | SA_REP     |  9000.00 |           0.35 |        146 |            80 |
|         159 | Lindsey     | Smith       | LSMITH   | 011.44.1345.729268 | 1987-08-15 | SA_REP     |  8000.00 |           0.30 |        146 |            80 |
|         160 | Louise      | Doran       | LDORAN   | 011.44.1345.629268 | 1987-08-16 | SA_REP     |  7500.00 |           0.30 |        146 |            80 |
|         161 | Sarath      | Sewall      | SSEWALL  | 011.44.1345.529268 | 1987-08-17 | SA_REP     |  7000.00 |           0.25 |        146 |            80 |
|         162 | Clara       | Vishney     | CVISHNEY | 011.44.1346.129268 | 1987-08-18 | SA_REP     | 10500.00 |           0.25 |        147 |            80 |
|         163 | Danielle    | Greene      | DGREENE  | 011.44.1346.229268 | 1987-08-19 | SA_REP     |  9500.00 |           0.15 |        147 |            80 |
|         164 | Mattea      | Marvins     | MMARVINS | 011.44.1346.329268 | 1987-08-20 | SA_REP     |  7200.00 |           0.10 |        147 |            80 |
|         165 | David       | Lee         | DLEE     | 011.44.1346.529268 | 1987-08-21 | SA_REP     |  6800.00 |           0.10 |        147 |            80 |
|         166 | Sundar      | Ande        | SANDE    | 011.44.1346.629268 | 1987-08-22 | SA_REP     |  6400.00 |           0.10 |        147 |            80 |
|         167 | Amit        | Banda       | ABANDA   | 011.44.1346.729268 | 1987-08-23 | SA_REP     |  6200.00 |           0.10 |        147 |            80 |
|         168 | Lisa        | Ozer        | LOZER    | 011.44.1343.929268 | 1987-08-24 | SA_REP     | 11500.00 |           0.25 |        148 |            80 |
|         169 | Harrison    | Bloom       | HBLOOM   | 011.44.1343.829268 | 1987-08-25 | SA_REP     | 10000.00 |           0.20 |        148 |            80 |
|         170 | Tayler      | Fox         | TFOX     | 011.44.1343.729268 | 1987-08-26 | SA_REP     |  9600.00 |           0.20 |        148 |            80 |
|         171 | William     | Smith       | WSMITH   | 011.44.1343.629268 | 1987-08-27 | SA_REP     |  7400.00 |           0.15 |        148 |            80 |
|         172 | Elizabeth   | Bates       | EBATES   | 011.44.1343.529268 | 1987-08-28 | SA_REP     |  7300.00 |           0.15 |        148 |            80 |
|         173 | Sundita     | Kumar       | SKUMAR   | 011.44.1343.329268 | 1987-08-29 | SA_REP     |  6100.00 |           0.10 |        148 |            80 |
|         174 | Ellen       | Abel        | EABEL    | 011.44.1644.429267 | 1987-08-30 | SA_REP     | 11000.00 |           0.30 |        149 |            80 |
|         175 | Alyssa      | Hutton      | AHUTTON  | 011.44.1644.429266 | 1987-08-31 | SA_REP     |  8800.00 |           0.25 |        149 |            80 |
|         176 | Jonathon    | Taylor      | JTAYLOR  | 011.44.1644.429265 | 1987-09-01 | SA_REP     |  8600.00 |           0.20 |        149 |            80 |
|         177 | Jack        | Livingston  | JLIVINGS | 011.44.1644.429264 | 1987-09-02 | SA_REP     |  8400.00 |           0.20 |        149 |            80 |
|         178 | Kimberely   | Grant       | KGRANT   | 011.44.1644.429263 | 1987-09-03 | SA_REP     |  7000.00 |           0.15 |        149 |             0 |
|         179 | Charles     | Johnson     | CJOHNSON | 011.44.1644.429262 | 1987-09-04 | SA_REP     |  6200.00 |           0.10 |        149 |            80 |
|         180 | Winston     | Taylor      | WTAYLOR  | 650.507.9876       | 1987-09-05 | SH_CLERK   |  3200.00 |           0.00 |        120 |            50 |
|         181 | Jean        | Fleaur      | JFLEAUR  | 650.507.9877       | 1987-09-06 | SH_CLERK   |  3100.00 |           0.00 |        120 |            50 |
|         182 | Martha      | Sullivan    | MSULLIVA | 650.507.9878       | 1987-09-07 | SH_CLERK   |  2500.00 |           0.00 |        120 |            50 |
|         183 | Girard      | Geoni       | GGEONI   | 650.507.9879       | 1987-09-08 | SH_CLERK   |  2800.00 |           0.00 |        120 |            50 |
|         184 | Nandita     | Sarchand    | NSARCHAN | 650.509.1876       | 1987-09-09 | SH_CLERK   |  4200.00 |           0.00 |        121 |            50 |
|         185 | Alexis      | Bull        | ABULL    | 650.509.2876       | 1987-09-10 | SH_CLERK   |  4100.00 |           0.00 |        121 |            50 |
|         186 | Julia       | Dellinger   | JDELLING | 650.509.3876       | 1987-09-11 | SH_CLERK   |  3400.00 |           0.00 |        121 |            50 |
|         187 | Anthony     | Cabrio      | ACABRIO  | 650.509.4876       | 1987-09-12 | SH_CLERK   |  3000.00 |           0.00 |        121 |            50 |
|         188 | Kelly       | Chung       | KCHUNG   | 650.505.1876       | 1987-09-13 | SH_CLERK   |  3800.00 |           0.00 |        122 |            50 |
|         189 | Jennifer    | Dilly       | JDILLY   | 650.505.2876       | 1987-09-14 | SH_CLERK   |  3600.00 |           0.00 |        122 |            50 |
|         190 | Timothy     | Gates       | TGATES   | 650.505.3876       | 1987-09-15 | SH_CLERK   |  2900.00 |           0.00 |        122 |            50 |
|         191 | Randall     | Perkins     | RPERKINS | 650.505.4876       | 1987-09-16 | SH_CLERK   |  2500.00 |           0.00 |        122 |            50 |
|         192 | Sarah       | Bell        | SBELL    | 650.501.1876       | 1987-09-17 | SH_CLERK   |  4000.00 |           0.00 |        123 |            50 |
|         193 | Britney     | Everett     | BEVERETT | 650.501.2876       | 1987-09-18 | SH_CLERK   |  3900.00 |           0.00 |        123 |            50 |
|         194 | Samuel      | McCain      | SMCCAIN  | 650.501.3876       | 1987-09-19 | SH_CLERK   |  3200.00 |           0.00 |        123 |            50 |
|         195 | Vance       | Jones       | VJONES   | 650.501.4876       | 1987-09-20 | SH_CLERK   |  2800.00 |           0.00 |        123 |            50 |
|         196 | Alana       | Walsh       | AWALSH   | 650.507.9811       | 1987-09-21 | SH_CLERK   |  3100.00 |           0.00 |        124 |            50 |
|         197 | Kevin       | Feeney      | KFEENEY  | 650.507.9822       | 1987-09-22 | SH_CLERK   |  3000.00 |           0.00 |        124 |            50 |
|         198 | Donald      | OConnell    | DOCONNEL | 650.507.9833       | 1987-09-23 | SH_CLERK   |  2600.00 |           0.00 |        124 |            50 |
|         199 | Douglas     | Grant       | DGRANT   | 650.507.9844       | 1987-09-24 | SH_CLERK   |  2600.00 |           0.00 |        124 |            50 |
|         200 | Jennifer    | Whalen      | JWHALEN  | 515.123.4444       | 1987-09-25 | AD_ASST    |  4400.00 |           0.00 |        101 |            10 |
|         201 | Michael     | Hartstein   | MHARTSTE | 515.123.5555       | 1987-09-26 | MK_MAN     | 13000.00 |           0.00 |        100 |            20 |
|         202 | Pat         | Fay         | PFAY     | 603.123.6666       | 1987-09-27 | MK_REP     |  6000.00 |           0.00 |        201 |            20 |
|         203 | Susan       | Mavris      | SMAVRIS  | 515.123.7777       | 1987-09-28 | HR_REP     |  6500.00 |           0.00 |        101 |            40 |
|         204 | Hermann     | Baer        | HBAER    | 515.123.8888       | 1987-09-29 | PR_REP     | 10000.00 |           0.00 |        101 |            70 |
|         205 | Shelley     | Higgins     | SHIGGINS | 515.123.8080       | 1987-09-30 | AC_MGR     | 12000.00 |           0.00 |        101 |           110 |
|         206 | William     | Gietz       | WGIETZ   | 515.123.8181       | 1987-10-01 | AC_ACCOUNT |  8300.00 |           0.00 |        205 |           110 |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
107 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT salary FROM employees WHERE last_name LIKE 'Bull';
+---------+
| salary  |
+---------+
| 4100.00 |
+---------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,Last_name  FROM employees WHERE salary > 4100;
+-------------+------------+
| first_name  | Last_name  |
+-------------+------------+
| Steven      | King       |
| Neena       | Kochhar    |
| Lex         | De Haan    |
| Alexander   | Hunold     |
| Bruce       | Ernst      |
| David       | Austin     |
| Valli       | Pataballa  |
| Diana       | Lorentz    |
| Nancy       | Greenberg  |
| Daniel      | Faviet     |
| John        | Chen       |
| Ismael      | Sciarra    |
| Jose Manuel | Urman      |
| Luis        | Popp       |
| Den         | Raphaely   |
| Matthew     | Weiss      |
| Adam        | Fripp      |
| Payam       | Kaufling   |
| Shanta      | Vollman    |
| Kevin       | Mourgos    |
| John        | Russell    |
| Karen       | Partners   |
| Alberto     | Errazuriz  |
| Gerald      | Cambrault  |
| Eleni       | Zlotkey    |
| Peter       | Tucker     |
| David       | Bernstein  |
| Peter       | Hall       |
| Christopher | Olsen      |
| Nanette     | Cambrault  |
| Oliver      | Tuvault    |
| Janette     | King       |
| Patrick     | Sully      |
| Allan       | McEwen     |
| Lindsey     | Smith      |
| Louise      | Doran      |
| Sarath      | Sewall     |
| Clara       | Vishney    |
| Danielle    | Greene     |
| Mattea      | Marvins    |
| David       | Lee        |
| Sundar      | Ande       |
| Amit        | Banda      |
| Lisa        | Ozer       |
| Harrison    | Bloom      |
| Tayler      | Fox        |
| William     | Smith      |
| Elizabeth   | Bates      |
| Sundita     | Kumar      |
| Ellen       | Abel       |
| Alyssa      | Hutton     |
| Jonathon    | Taylor     |
| Jack        | Livingston |
| Kimberely   | Grant      |
| Charles     | Johnson    |
| Nandita     | Sarchand   |
| Jennifer    | Whalen     |
| Michael     | Hartstein  |
| Pat         | Fay        |
| Susan       | Mavris     |
| Hermann     | Baer       |
| Shelley     | Higgins    |
| William     | Gietz      |
+-------------+------------+
63 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,Last_name  FROM salary  WHERE salary > 4100;
ERROR 1146 (42S02): Table 'csd22044s18.salary' doesn't exist
MariaDB [csd22044s18]> SELECT first_name,Last_name  FROM employees  WHERE salary  > 4100;
+-------------+------------+
| first_name  | Last_name  |
+-------------+------------+
| Steven      | King       |
| Neena       | Kochhar    |
| Lex         | De Haan    |
| Alexander   | Hunold     |
| Bruce       | Ernst      |
| David       | Austin     |
| Valli       | Pataballa  |
| Diana       | Lorentz    |
| Nancy       | Greenberg  |
| Daniel      | Faviet     |
| John        | Chen       |
| Ismael      | Sciarra    |
| Jose Manuel | Urman      |
| Luis        | Popp       |
| Den         | Raphaely   |
| Matthew     | Weiss      |
| Adam        | Fripp      |
| Payam       | Kaufling   |
| Shanta      | Vollman    |
| Kevin       | Mourgos    |
| John        | Russell    |
| Karen       | Partners   |
| Alberto     | Errazuriz  |
| Gerald      | Cambrault  |
| Eleni       | Zlotkey    |
| Peter       | Tucker     |
| David       | Bernstein  |
| Peter       | Hall       |
| Christopher | Olsen      |
| Nanette     | Cambrault  |
| Oliver      | Tuvault    |
| Janette     | King       |
| Patrick     | Sully      |
| Allan       | McEwen     |
| Lindsey     | Smith      |
| Louise      | Doran      |
| Sarath      | Sewall     |
| Clara       | Vishney    |
| Danielle    | Greene     |
| Mattea      | Marvins    |
| David       | Lee        |
| Sundar      | Ande       |
| Amit        | Banda      |
| Lisa        | Ozer       |
| Harrison    | Bloom      |
| Tayler      | Fox        |
| William     | Smith      |
| Elizabeth   | Bates      |
| Sundita     | Kumar      |
| Ellen       | Abel       |
| Alyssa      | Hutton     |
| Jonathon    | Taylor     |
| Jack        | Livingston |
| Kimberely   | Grant      |
| Charles     | Johnson    |
| Nandita     | Sarchand   |
| Jennifer    | Whalen     |
| Michael     | Hartstein  |
| Pat         | Fay        |
| Susan       | Mavris     |
| Hermann     | Baer       |
| Shelley     | Higgins    |
| William     | Gietz      |
+-------------+------------+
63 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM departments;
+---------------+----------------------+------------+-------------+
| DEPARTMENT_ID | DEPARTMENT_NAME      | MANAGER_ID | LOCATION_ID |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |          0 |        1700 |
|           130 | Corporate Tax        |          0 |        1700 |
|           140 | Control And Credit   |          0 |        1700 |
|           150 | Shareholder Services |          0 |        1700 |
|           160 | Benefits             |          0 |        1700 |
|           170 | Manufacturing        |          0 |        1700 |
|           180 | Construction         |          0 |        1700 |
|           190 | Contracting          |          0 |        1700 |
|           200 | Operations           |          0 |        1700 |
|           210 | IT Support           |          0 |        1700 |
|           220 | NOC                  |          0 |        1700 |
|           230 | IT Helpdesk          |          0 |        1700 |
|           240 | Government Sales     |          0 |        1700 |
|           250 | Retail Sales         |          0 |        1700 |
|           260 | Recruiting           |          0 |        1700 |
|           270 | Payroll              |          0 |        1700 |
+---------------+----------------------+------------+-------------+
27 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM department_id , department_name FROM departments WHERE department_name LIKE 'IT%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM departments WHERE department_name LIKE 'IT%'' at line 1
MariaDB [csd22044s18]> SELECT  department_id , department_name FROM departments WHERE department_name LIKE 'IT%';
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|            60 | IT              |
|           210 | IT Support      |
|           230 | IT Helpdesk     |
+---------------+-----------------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT  department_id FROM departments WHERE department_name LIKE 'IT%';
+---------------+
| department_id |
+---------------+
|            60 |
|           210 |
|           230 |
+---------------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,Last_name, department_id FROM employees WHERE department_id = ( SELECT department_id FROM departments WHERE department_name LIKE 'IT%');
ERROR 1242 (21000): Subquery returns more than 1 row
MariaDB [csd22044s18]> SELECT first_name,Last_name, department_id FROM employees WHERE department_id IN ( SELECT department_id FROM departments WHERE department_name LIKE 'IT%');
+------------+-----------+---------------+
| first_name | Last_name | department_id |
+------------+-----------+---------------+
| Alexander  | Hunold    |            60 |
| Bruce      | Ernst     |            60 |
| David      | Austin    |            60 |
| Valli      | Pataballa |            60 |
| Diana      | Lorentz   |            60 |
+------------+-----------+---------------+
5 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,Last_name,SALARY  FROM employees  WHERE salary>4100;
+-------------+------------+----------+
| first_name  | Last_name  | SALARY   |
+-------------+------------+----------+
| Steven      | King       | 24000.00 |
| Neena       | Kochhar    | 17000.00 |
| Lex         | De Haan    | 17000.00 |
| Alexander   | Hunold     |  9000.00 |
| Bruce       | Ernst      |  6000.00 |
| David       | Austin     |  4800.00 |
| Valli       | Pataballa  |  4800.00 |
| Diana       | Lorentz    |  4200.00 |
| Nancy       | Greenberg  | 12000.00 |
| Daniel      | Faviet     |  9000.00 |
| John        | Chen       |  8200.00 |
| Ismael      | Sciarra    |  7700.00 |
| Jose Manuel | Urman      |  7800.00 |
| Luis        | Popp       |  6900.00 |
| Den         | Raphaely   | 11000.00 |
| Matthew     | Weiss      |  8000.00 |
| Adam        | Fripp      |  8200.00 |
| Payam       | Kaufling   |  7900.00 |
| Shanta      | Vollman    |  6500.00 |
| Kevin       | Mourgos    |  5800.00 |
| John        | Russell    | 14000.00 |
| Karen       | Partners   | 13500.00 |
| Alberto     | Errazuriz  | 12000.00 |
| Gerald      | Cambrault  | 11000.00 |
| Eleni       | Zlotkey    | 10500.00 |
| Peter       | Tucker     | 10000.00 |
| David       | Bernstein  |  9500.00 |
| Peter       | Hall       |  9000.00 |
| Christopher | Olsen      |  8000.00 |
| Nanette     | Cambrault  |  7500.00 |
| Oliver      | Tuvault    |  7000.00 |
| Janette     | King       | 10000.00 |
| Patrick     | Sully      |  9500.00 |
| Allan       | McEwen     |  9000.00 |
| Lindsey     | Smith      |  8000.00 |
| Louise      | Doran      |  7500.00 |
| Sarath      | Sewall     |  7000.00 |
| Clara       | Vishney    | 10500.00 |
| Danielle    | Greene     |  9500.00 |
| Mattea      | Marvins    |  7200.00 |
| David       | Lee        |  6800.00 |
| Sundar      | Ande       |  6400.00 |
| Amit        | Banda      |  6200.00 |
| Lisa        | Ozer       | 11500.00 |
| Harrison    | Bloom      | 10000.00 |
| Tayler      | Fox        |  9600.00 |
| William     | Smith      |  7400.00 |
| Elizabeth   | Bates      |  7300.00 |
| Sundita     | Kumar      |  6100.00 |
| Ellen       | Abel       | 11000.00 |
| Alyssa      | Hutton     |  8800.00 |
| Jonathon    | Taylor     |  8600.00 |
| Jack        | Livingston |  8400.00 |
| Kimberely   | Grant      |  7000.00 |
| Charles     | Johnson    |  6200.00 |
| Nandita     | Sarchand   |  4200.00 |
| Jennifer    | Whalen     |  4400.00 |
| Michael     | Hartstein  | 13000.00 |
| Pat         | Fay        |  6000.00 |
| Susan       | Mavris     |  6500.00 |
| Hermann     | Baer       | 10000.00 |
| Shelley     | Higgins    | 12000.00 |
| William     | Gietz      |  8300.00 |
+-------------+------------+----------+
63 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,Last_name,SALARY  FROM employees  WHERE salary > (SELECT salary FROM employees where last_name like 'bull');
+-------------+------------+----------+
| first_name  | Last_name  | SALARY   |
+-------------+------------+----------+
| Steven      | King       | 24000.00 |
| Neena       | Kochhar    | 17000.00 |
| Lex         | De Haan    | 17000.00 |
| Alexander   | Hunold     |  9000.00 |
| Bruce       | Ernst      |  6000.00 |
| David       | Austin     |  4800.00 |
| Valli       | Pataballa  |  4800.00 |
| Diana       | Lorentz    |  4200.00 |
| Nancy       | Greenberg  | 12000.00 |
| Daniel      | Faviet     |  9000.00 |
| John        | Chen       |  8200.00 |
| Ismael      | Sciarra    |  7700.00 |
| Jose Manuel | Urman      |  7800.00 |
| Luis        | Popp       |  6900.00 |
| Den         | Raphaely   | 11000.00 |
| Matthew     | Weiss      |  8000.00 |
| Adam        | Fripp      |  8200.00 |
| Payam       | Kaufling   |  7900.00 |
| Shanta      | Vollman    |  6500.00 |
| Kevin       | Mourgos    |  5800.00 |
| John        | Russell    | 14000.00 |
| Karen       | Partners   | 13500.00 |
| Alberto     | Errazuriz  | 12000.00 |
| Gerald      | Cambrault  | 11000.00 |
| Eleni       | Zlotkey    | 10500.00 |
| Peter       | Tucker     | 10000.00 |
| David       | Bernstein  |  9500.00 |
| Peter       | Hall       |  9000.00 |
| Christopher | Olsen      |  8000.00 |
| Nanette     | Cambrault  |  7500.00 |
| Oliver      | Tuvault    |  7000.00 |
| Janette     | King       | 10000.00 |
| Patrick     | Sully      |  9500.00 |
| Allan       | McEwen     |  9000.00 |
| Lindsey     | Smith      |  8000.00 |
| Louise      | Doran      |  7500.00 |
| Sarath      | Sewall     |  7000.00 |
| Clara       | Vishney    | 10500.00 |
| Danielle    | Greene     |  9500.00 |
| Mattea      | Marvins    |  7200.00 |
| David       | Lee        |  6800.00 |
| Sundar      | Ande       |  6400.00 |
| Amit        | Banda      |  6200.00 |
| Lisa        | Ozer       | 11500.00 |
| Harrison    | Bloom      | 10000.00 |
| Tayler      | Fox        |  9600.00 |
| William     | Smith      |  7400.00 |
| Elizabeth   | Bates      |  7300.00 |
| Sundita     | Kumar      |  6100.00 |
| Ellen       | Abel       | 11000.00 |
| Alyssa      | Hutton     |  8800.00 |
| Jonathon    | Taylor     |  8600.00 |
| Jack        | Livingston |  8400.00 |
| Kimberely   | Grant      |  7000.00 |
| Charles     | Johnson    |  6200.00 |
| Nandita     | Sarchand   |  4200.00 |
| Jennifer    | Whalen     |  4400.00 |
| Michael     | Hartstein  | 13000.00 |
| Pat         | Fay        |  6000.00 |
| Susan       | Mavris     |  6500.00 |
| Hermann     | Baer       | 10000.00 |
| Shelley     | Higgins    | 12000.00 |
| William     | Gietz      |  8300.00 |
+-------------+------------+----------+
63 rows in set (0.00 sec)

MariaDB [csd22044s18]> select * from departments;
+---------------+----------------------+------------+-------------+
| DEPARTMENT_ID | DEPARTMENT_NAME      | MANAGER_ID | LOCATION_ID |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |          0 |        1700 |
|           130 | Corporate Tax        |          0 |        1700 |
|           140 | Control And Credit   |          0 |        1700 |
|           150 | Shareholder Services |          0 |        1700 |
|           160 | Benefits             |          0 |        1700 |
|           170 | Manufacturing        |          0 |        1700 |
|           180 | Construction         |          0 |        1700 |
|           190 | Contracting          |          0 |        1700 |
|           200 | Operations           |          0 |        1700 |
|           210 | IT Support           |          0 |        1700 |
|           220 | NOC                  |          0 |        1700 |
|           230 | IT Helpdesk          |          0 |        1700 |
|           240 | Government Sales     |          0 |        1700 |
|           250 | Retail Sales         |          0 |        1700 |
|           260 | Recruiting           |          0 |        1700 |
|           270 | Payroll              |          0 |        1700 |
+---------------+----------------------+------------+-------------+
27 rows in set (0.00 sec)

MariaDB [csd22044s18]> select * from locations;
+-------------+---------------------------+--------------+---------------------+-------------------+------------+
| LOCATION_ID | STREET_ADDRESS            | POSTAL_CODE  | CITY                | STATE_PROVINCE    | COUNTRY_ID |
+-------------+---------------------------+--------------+---------------------+-------------------+------------+
|        1000 | 1297 Via Cola di Rie      | 989          | Roma                |                   | IT         |
|        1100 | 93091 Calle della Testa   | 10934        | Venice              |                   | IT         |
|        1200 | 2017 Shinjuku-ku          | 1689         | Tokyo               | Tokyo Prefecture  | JP         |
|        1300 | 9450 Kamiya-cho           | 6823         | Hiroshima           |                   | JP         |
|        1400 | 2014 Jabberwocky Rd       | 26192        | Southlake           | Texas             | US         |
|        1500 | 2011 Interiors Blvd       | 99236        | South San Francisco | California        | US         |
|        1600 | 2007 Zagora St            | 50090        | South Brunswick     | New Jersey        | US         |
|        1700 | 2004 Charade Rd           | 98199        | Seattle             | Washington        | US         |
|        1800 | 147 Spadina Ave           | M5V 2L7      | Toronto             | Ontario           | CA         |
|        1900 | 6092 Boxwood St           | YSW 9T2      | Whitehorse          | Yukon             | CA         |
|        2000 | 40-5-12 Laogianggen       | 190518       | Beijing             |                   | CN         |
|        2100 | 1298 Vileparle (E)        | 490231       | Bombay              | Maharashtra       | IN         |
|        2200 | 12-98 Victoria Street     | 2901         | Sydney              | New South Wales   | AU         |
|        2300 | 198 Clementi North        | 540198       | Singapore           |                   | SG         |
|        2400 | 8204 Arthur St            |              | London              |                   | UK         |
|        2500 | "Magdalen Centre          |  The Oxford  | OX9 9ZB             | Oxford            | Ox         |
|        2600 | 9702 Chester Road         | 9629850293   | Stretford           | Manchester        | UK         |
|        2700 | Schwanthalerstr. 7031     | 80925        | Munich              | Bavaria           | DE         |
|        2800 | Rua Frei Caneca 1360      | 01307-002    | Sao Paulo           | Sao Paulo         | BR         |
|        2900 | 20 Rue des Corps-Saints   | 1730         | Geneva              | Geneve            | CH         |
|        3000 | Murtenstrasse 921         | 3095         | Bern                | BE                | CH         |
|        3100 | Pieter Breughelstraat 837 | 3029SK       | Utrecht             | Utrecht           | NL         |
|        3200 | Mariano Escobedo 9991     | 11932        | Mexico City         | "Distrito Federal | "          |
+-------------+---------------------------+--------------+---------------------+-------------------+------------+
23 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,Last_name FROM Employees  WHERE Manager_id != 0;
+-------------+-------------+
| first_name  | Last_name   |
+-------------+-------------+
| Neena       | Kochhar     |
| Lex         | De Haan     |
| Alexander   | Hunold      |
| Bruce       | Ernst       |
| David       | Austin      |
| Valli       | Pataballa   |
| Diana       | Lorentz     |
| Nancy       | Greenberg   |
| Daniel      | Faviet      |
| John        | Chen        |
| Ismael      | Sciarra     |
| Jose Manuel | Urman       |
| Luis        | Popp        |
| Den         | Raphaely    |
| Alexander   | Khoo        |
| Shelli      | Baida       |
| Sigal       | Tobias      |
| Guy         | Himuro      |
| Karen       | Colmenares  |
| Matthew     | Weiss       |
| Adam        | Fripp       |
| Payam       | Kaufling    |
| Shanta      | Vollman     |
| Kevin       | Mourgos     |
| Julia       | Nayer       |
| Irene       | Mikkilineni |
| James       | Landry      |
| Steven      | Markle      |
| Laura       | Bissot      |
| Mozhe       | Atkinson    |
| James       | Marlow      |
| TJ          | Olson       |
| Jason       | Mallin      |
| Michael     | Rogers      |
| Ki          | Gee         |
| Hazel       | Philtanker  |
| Renske      | Ladwig      |
| Stephen     | Stiles      |
| John        | Seo         |
| Joshua      | Patel       |
| Trenna      | Rajs        |
| Curtis      | Davies      |
| Randall     | Matos       |
| Peter       | Vargas      |
| John        | Russell     |
| Karen       | Partners    |
| Alberto     | Errazuriz   |
| Gerald      | Cambrault   |
| Eleni       | Zlotkey     |
| Peter       | Tucker      |
| David       | Bernstein   |
| Peter       | Hall        |
| Christopher | Olsen       |
| Nanette     | Cambrault   |
| Oliver      | Tuvault     |
| Janette     | King        |
| Patrick     | Sully       |
| Allan       | McEwen      |
| Lindsey     | Smith       |
| Louise      | Doran       |
| Sarath      | Sewall      |
| Clara       | Vishney     |
| Danielle    | Greene      |
| Mattea      | Marvins     |
| David       | Lee         |
| Sundar      | Ande        |
| Amit        | Banda       |
| Lisa        | Ozer        |
| Harrison    | Bloom       |
| Tayler      | Fox         |
| William     | Smith       |
| Elizabeth   | Bates       |
| Sundita     | Kumar       |
| Ellen       | Abel        |
| Alyssa      | Hutton      |
| Jonathon    | Taylor      |
| Jack        | Livingston  |
| Kimberely   | Grant       |
| Charles     | Johnson     |
| Winston     | Taylor      |
| Jean        | Fleaur      |
| Martha      | Sullivan    |
| Girard      | Geoni       |
| Nandita     | Sarchand    |
| Alexis      | Bull        |
| Julia       | Dellinger   |
| Anthony     | Cabrio      |
| Kelly       | Chung       |
| Jennifer    | Dilly       |
| Timothy     | Gates       |
| Randall     | Perkins     |
| Sarah       | Bell        |
| Britney     | Everett     |
| Samuel      | McCain      |
| Vance       | Jones       |
| Alana       | Walsh       |
| Kevin       | Feeney      |
| Donald      | OConnell    |
| Douglas     | Grant       |
| Jennifer    | Whalen      |
| Michael     | Hartstein   |
| Pat         | Fay         |
| Susan       | Mavris      |
| Hermann     | Baer        |
| Shelley     | Higgins     |
| William     | Gietz       |
+-------------+-------------+
106 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT location_id,Country_id FROM Locations  WHERE country_id = 'US';
+-------------+------------+
| location_id | Country_id |
+-------------+------------+
|        1400 | US         |
|        1500 | US         |
|        1600 | US         |
|        1700 | US         |
+-------------+------------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT location_id  FROM Locations  WHERE country_id = 'US';
+-------------+
| location_id |
+-------------+
|        1400 |
|        1500 |
|        1600 |
|        1700 |
+-------------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> desc departments;
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | YES  | MUL | NULL    |       |
| LOCATION_ID     | decimal(4,0) | YES  | MUL | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT department_id,LOCATION_ID  FROM departments  WHERE location_id IN (SELECT location_id  FROM Locations  WHERE country_id = 'US');
+---------------+-------------+
| department_id | LOCATION_ID |
+---------------+-------------+
|            60 |        1400 |
|            50 |        1500 |
|            10 |        1700 |
|            30 |        1700 |
|            90 |        1700 |
|           100 |        1700 |
|           110 |        1700 |
|           120 |        1700 |
|           130 |        1700 |
|           140 |        1700 |
|           150 |        1700 |
|           160 |        1700 |
|           170 |        1700 |
|           180 |        1700 |
|           190 |        1700 |
|           200 |        1700 |
|           210 |        1700 |
|           220 |        1700 |
|           230 |        1700 |
|           240 |        1700 |
|           250 |        1700 |
|           260 |        1700 |
|           270 |        1700 |
+---------------+-------------+
23 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,Last_name FROM Employees  WHERE Manager_id != 0 AND department_id IN (SELECT department_id FROM departments WHERE location_id IN (SELECT location_id FROM locations WHERE country_id = 'us'));
+-------------+-------------+
| first_name  | Last_name   |
+-------------+-------------+
| Alexander   | Hunold      |
| Bruce       | Ernst       |
| David       | Austin      |
| Valli       | Pataballa   |
| Diana       | Lorentz     |
| Matthew     | Weiss       |
| Adam        | Fripp       |
| Payam       | Kaufling    |
| Shanta      | Vollman     |
| Kevin       | Mourgos     |
| Julia       | Nayer       |
| Irene       | Mikkilineni |
| James       | Landry      |
| Steven      | Markle      |
| Laura       | Bissot      |
| Mozhe       | Atkinson    |
| James       | Marlow      |
| TJ          | Olson       |
| Jason       | Mallin      |
| Michael     | Rogers      |
| Ki          | Gee         |
| Hazel       | Philtanker  |
| Renske      | Ladwig      |
| Stephen     | Stiles      |
| John        | Seo         |
| Joshua      | Patel       |
| Trenna      | Rajs        |
| Curtis      | Davies      |
| Randall     | Matos       |
| Peter       | Vargas      |
| Winston     | Taylor      |
| Jean        | Fleaur      |
| Martha      | Sullivan    |
| Girard      | Geoni       |
| Nandita     | Sarchand    |
| Alexis      | Bull        |
| Julia       | Dellinger   |
| Anthony     | Cabrio      |
| Kelly       | Chung       |
| Jennifer    | Dilly       |
| Timothy     | Gates       |
| Randall     | Perkins     |
| Sarah       | Bell        |
| Britney     | Everett     |
| Samuel      | McCain      |
| Vance       | Jones       |
| Alana       | Walsh       |
| Kevin       | Feeney      |
| Donald      | OConnell    |
| Douglas     | Grant       |
| Jennifer    | Whalen      |
| Den         | Raphaely    |
| Alexander   | Khoo        |
| Shelli      | Baida       |
| Sigal       | Tobias      |
| Guy         | Himuro      |
| Karen       | Colmenares  |
| Neena       | Kochhar     |
| Lex         | De Haan     |
| Nancy       | Greenberg   |
| Daniel      | Faviet      |
| John        | Chen        |
| Ismael      | Sciarra     |
| Jose Manuel | Urman       |
| Luis        | Popp        |
| Shelley     | Higgins     |
| William     | Gietz       |
+-------------+-------------+
67 rows in set (0.02 sec)

MariaDB [csd22044s18]> SELECT manager_id  FROM emoployees  WHERE manager_id != 0;
ERROR 1146 (42S02): Table 'csd22044s18.emoployees' doesn't exist
MariaDB [csd22044s18]> SELECT first_name,Last_name FROM Employees  WHERE employee_id  IN  department_id IN (SELECT manager_id FROM employees where manager_id !=0);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'department_id IN (SELECT manager_id FROM employees where manager_id !=0)' at line 1
MariaDB [csd22044s18]> SELECT first_name,Last_name FROM Employees  WHERE employee_id  IN  department_id IN( SELECT DISTINCT  (manager_id) FROM employees WHERE manager_id !=0);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'department_id IN( SELECT DISTINCT  (manager_id) FROM employees WHERE manager_id ' at line 1
MariaDB [csd22044s18]> SELECT first_name,Last_name FROM Employees  WHERE employee_id, department_id IN( SELECT DISTINCT  (manager_id) FROM employees WHERE manager_id !=0);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ' department_id IN( SELECT DISTINCT  (manager_id) FROM employees WHERE manager_id' at line 1
MariaDB [csd22044s18]> SELECT first_name,Last_name FROM Employees  WHERE  department_id IN( SELECT DISTINCT  (manager_id) FROM employees WHERE manager_id !=0);
+-------------+-----------+
| first_name  | Last_name |
+-------------+-----------+
| Nancy       | Greenberg |
| Daniel      | Faviet    |
| John        | Chen      |
| Ismael      | Sciarra   |
| Jose Manuel | Urman     |
| Luis        | Popp      |
+-------------+-----------+
6 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,Last_name FROM Employees  WHERE  employee_id IN(SELECT DISTINCT(manager_id) FROM employees WHERE manager_id !=0);
+------------+-----------+
| first_name | Last_name |
+------------+-----------+
| Steven     | King      |
| Neena      | Kochhar   |
| Lex        | De Haan   |
| Alexander  | Hunold    |
| Nancy      | Greenberg |
| Den        | Raphaely  |
| Matthew    | Weiss     |
| Adam       | Fripp     |
| Payam      | Kaufling  |
| Shanta     | Vollman   |
| Kevin      | Mourgos   |
| John       | Russell   |
| Karen      | Partners  |
| Alberto    | Errazuriz |
| Gerald     | Cambrault |
| Eleni      | Zlotkey   |
| Michael    | Hartstein |
| Shelley    | Higgins   |
+------------+-----------+
18 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT AVG(SALARY) FROM employees;
+-------------+
| AVG(SALARY) |
+-------------+
| 6461.682243 |
+-------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,Last_name FROM Employees  WHERE salary > SELECT AVG(SALARY) FROM employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SELECT AVG(SALARY) FROM employees' at line 1
MariaDB [csd22044s18]> SELECT first_name,Last_name,salary FROM Employees  WHERE salary > (SELECT AVG(SALARY) FROM employees);
+-------------+------------+----------+
| first_name  | Last_name  | salary   |
+-------------+------------+----------+
| Steven      | King       | 24000.00 |
| Neena       | Kochhar    | 17000.00 |
| Lex         | De Haan    | 17000.00 |
| Alexander   | Hunold     |  9000.00 |
| Nancy       | Greenberg  | 12000.00 |
| Daniel      | Faviet     |  9000.00 |
| John        | Chen       |  8200.00 |
| Ismael      | Sciarra    |  7700.00 |
| Jose Manuel | Urman      |  7800.00 |
| Luis        | Popp       |  6900.00 |
| Den         | Raphaely   | 11000.00 |
| Matthew     | Weiss      |  8000.00 |
| Adam        | Fripp      |  8200.00 |
| Payam       | Kaufling   |  7900.00 |
| Shanta      | Vollman    |  6500.00 |
| John        | Russell    | 14000.00 |
| Karen       | Partners   | 13500.00 |
| Alberto     | Errazuriz  | 12000.00 |
| Gerald      | Cambrault  | 11000.00 |
| Eleni       | Zlotkey    | 10500.00 |
| Peter       | Tucker     | 10000.00 |
| David       | Bernstein  |  9500.00 |
| Peter       | Hall       |  9000.00 |
| Christopher | Olsen      |  8000.00 |
| Nanette     | Cambrault  |  7500.00 |
| Oliver      | Tuvault    |  7000.00 |
| Janette     | King       | 10000.00 |
| Patrick     | Sully      |  9500.00 |
| Allan       | McEwen     |  9000.00 |
| Lindsey     | Smith      |  8000.00 |
| Louise      | Doran      |  7500.00 |
| Sarath      | Sewall     |  7000.00 |
| Clara       | Vishney    | 10500.00 |
| Danielle    | Greene     |  9500.00 |
| Mattea      | Marvins    |  7200.00 |
| David       | Lee        |  6800.00 |
| Lisa        | Ozer       | 11500.00 |
| Harrison    | Bloom      | 10000.00 |
| Tayler      | Fox        |  9600.00 |
| William     | Smith      |  7400.00 |
| Elizabeth   | Bates      |  7300.00 |
| Ellen       | Abel       | 11000.00 |
| Alyssa      | Hutton     |  8800.00 |
| Jonathon    | Taylor     |  8600.00 |
| Jack        | Livingston |  8400.00 |
| Kimberely   | Grant      |  7000.00 |
| Michael     | Hartstein  | 13000.00 |
| Susan       | Mavris     |  6500.00 |
| Hermann     | Baer       | 10000.00 |
| Shelley     | Higgins    | 12000.00 |
| William     | Gietz      |  8300.00 |
+-------------+------------+----------+
51 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM jobs
    -> ;
+------------+---------------------------------+------------+------------+
| JOB_ID     | JOB_TITLE                       | MIN_SALARY | MAX_SALARY |
+------------+---------------------------------+------------+------------+
| AD_PRES    | President                       |      20000 |      40000 |
| AD_VP      | Administration Vice President   |      15000 |      30000 |
| AD_ASST    | Administration Assistant        |       3000 |       6000 |
| FI_MGR     | Finance Manager                 |       8200 |      16000 |
| FI_ACCOUNT | Accountant                      |       4200 |       9000 |
| AC_MGR     | Accounting Manager              |       8200 |      16000 |
| AC_ACCOUNT | Public Accountant               |       4200 |       9000 |
| SA_MAN     | Sales Manager                   |      10000 |      20000 |
| SA_REP     | Sales Representative            |       6000 |      12000 |
| PU_MAN     | Purchasing Manager              |       8000 |      15000 |
| PU_CLERK   | Purchasing Clerk                |       2500 |       5500 |
| ST_MAN     | Stock Manager                   |       5500 |       8500 |
| ST_CLERK   | Stock Clerk                     |       2000 |       5000 |
| SH_CLERK   | Shipping Clerk                  |       2500 |       5500 |
| IT_PROG    | Programmer                      |       4000 |      10000 |
| MK_MAN     | Marketing Manager               |       9000 |      15000 |
| MK_REP     | Marketing Representative        |       4000 |       9000 |
| HR_REP     | Human Resources Representative  |       4000 |       9000 |
| PR_REP     | Public Relations Representative |       4500 |      10500 |
+------------+---------------------------------+------------+------------+
19 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM EMPLOYEES LIMIT 2;
+-------------+------------+-----------+----------+--------------+------------+---------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL    | PHONE_NUMBER | HIRE_DATE  | JOB_ID  | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+----------+--------------+------------+---------+----------+----------------+------------+---------------+
|         100 | Steven     | King      | SKING    | 515.123.4567 | 1987-06-17 | AD_PRES | 24000.00 |           0.00 |          0 |            90 |
|         101 | Neena      | Kochhar   | NKOCHHAR | 515.123.4568 | 1987-06-18 | AD_VP   | 17000.00 |           0.00 |        100 |            90 |
+-------------+------------+-----------+----------+--------------+------------+---------+----------+----------------+------------+---------------+
2 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT * FROM EMPLOYEES LIMIT 4;
+-------------+------------+-----------+----------+--------------+------------+---------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL    | PHONE_NUMBER | HIRE_DATE  | JOB_ID  | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+----------+--------------+------------+---------+----------+----------------+------------+---------------+
|         100 | Steven     | King      | SKING    | 515.123.4567 | 1987-06-17 | AD_PRES | 24000.00 |           0.00 |          0 |            90 |
|         101 | Neena      | Kochhar   | NKOCHHAR | 515.123.4568 | 1987-06-18 | AD_VP   | 17000.00 |           0.00 |        100 |            90 |
|         102 | Lex        | De Haan   | LDEHAAN  | 515.123.4569 | 1987-06-19 | AD_VP   | 17000.00 |           0.00 |        100 |            90 |
|         103 | Alexander  | Hunold    | AHUNOLD  | 590.423.4567 | 1987-06-20 | IT_PROG |  9000.00 |           0.00 |        102 |            60 |
+-------------+------------+-----------+----------+--------------+------------+---------+----------+----------------+------------+---------------+
4 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT JOB_ID  FROM EMPLOYEES  ;
+------------+
| JOB_ID     |
+------------+
| AC_ACCOUNT |
| AC_MGR     |
| AD_ASST    |
| AD_PRES    |
| AD_VP      |
| AD_VP      |
| FI_ACCOUNT |
| FI_ACCOUNT |
| FI_ACCOUNT |
| FI_ACCOUNT |
| FI_ACCOUNT |
| FI_MGR     |
| HR_REP     |
| IT_PROG    |
| IT_PROG    |
| IT_PROG    |
| IT_PROG    |
| IT_PROG    |
| MK_MAN     |
| MK_REP     |
| PR_REP     |
| PU_CLERK   |
| PU_CLERK   |
| PU_CLERK   |
| PU_CLERK   |
| PU_CLERK   |
| PU_MAN     |
| SA_MAN     |
| SA_MAN     |
| SA_MAN     |
| SA_MAN     |
| SA_MAN     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SA_REP     |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| SH_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_CLERK   |
| ST_MAN     |
| ST_MAN     |
| ST_MAN     |
| ST_MAN     |
| ST_MAN     |
+------------+
107 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT NAME_ID ,JOB_ID  FROM EMPLOYEES  ;
ERROR 1054 (42S22): Unknown column 'NAME_ID' in 'field list'
MariaDB [csd22044s18]> SELECT first_name,JOB_ID  FROM EMPLOYEES  ;
+-------------+------------+
| first_name  | JOB_ID     |
+-------------+------------+
| Steven      | AD_PRES    |
| Neena       | AD_VP      |
| Lex         | AD_VP      |
| Alexander   | IT_PROG    |
| Bruce       | IT_PROG    |
| David       | IT_PROG    |
| Valli       | IT_PROG    |
| Diana       | IT_PROG    |
| Nancy       | FI_MGR     |
| Daniel      | FI_ACCOUNT |
| John        | FI_ACCOUNT |
| Ismael      | FI_ACCOUNT |
| Jose Manuel | FI_ACCOUNT |
| Luis        | FI_ACCOUNT |
| Den         | PU_MAN     |
| Alexander   | PU_CLERK   |
| Shelli      | PU_CLERK   |
| Sigal       | PU_CLERK   |
| Guy         | PU_CLERK   |
| Karen       | PU_CLERK   |
| Matthew     | ST_MAN     |
| Adam        | ST_MAN     |
| Payam       | ST_MAN     |
| Shanta      | ST_MAN     |
| Kevin       | ST_MAN     |
| Julia       | ST_CLERK   |
| Irene       | ST_CLERK   |
| James       | ST_CLERK   |
| Steven      | ST_CLERK   |
| Laura       | ST_CLERK   |
| Mozhe       | ST_CLERK   |
| James       | ST_CLERK   |
| TJ          | ST_CLERK   |
| Jason       | ST_CLERK   |
| Michael     | ST_CLERK   |
| Ki          | ST_CLERK   |
| Hazel       | ST_CLERK   |
| Renske      | ST_CLERK   |
| Stephen     | ST_CLERK   |
| John        | ST_CLERK   |
| Joshua      | ST_CLERK   |
| Trenna      | ST_CLERK   |
| Curtis      | ST_CLERK   |
| Randall     | ST_CLERK   |
| Peter       | ST_CLERK   |
| John        | SA_MAN     |
| Karen       | SA_MAN     |
| Alberto     | SA_MAN     |
| Gerald      | SA_MAN     |
| Eleni       | SA_MAN     |
| Peter       | SA_REP     |
| David       | SA_REP     |
| Peter       | SA_REP     |
| Christopher | SA_REP     |
| Nanette     | SA_REP     |
| Oliver      | SA_REP     |
| Janette     | SA_REP     |
| Patrick     | SA_REP     |
| Allan       | SA_REP     |
| Lindsey     | SA_REP     |
| Louise      | SA_REP     |
| Sarath      | SA_REP     |
| Clara       | SA_REP     |
| Danielle    | SA_REP     |
| Mattea      | SA_REP     |
| David       | SA_REP     |
| Sundar      | SA_REP     |
| Amit        | SA_REP     |
| Lisa        | SA_REP     |
| Harrison    | SA_REP     |
| Tayler      | SA_REP     |
| William     | SA_REP     |
| Elizabeth   | SA_REP     |
| Sundita     | SA_REP     |
| Ellen       | SA_REP     |
| Alyssa      | SA_REP     |
| Jonathon    | SA_REP     |
| Jack        | SA_REP     |
| Kimberely   | SA_REP     |
| Charles     | SA_REP     |
| Winston     | SH_CLERK   |
| Jean        | SH_CLERK   |
| Martha      | SH_CLERK   |
| Girard      | SH_CLERK   |
| Nandita     | SH_CLERK   |
| Alexis      | SH_CLERK   |
| Julia       | SH_CLERK   |
| Anthony     | SH_CLERK   |
| Kelly       | SH_CLERK   |
| Jennifer    | SH_CLERK   |
| Timothy     | SH_CLERK   |
| Randall     | SH_CLERK   |
| Sarah       | SH_CLERK   |
| Britney     | SH_CLERK   |
| Samuel      | SH_CLERK   |
| Vance       | SH_CLERK   |
| Alana       | SH_CLERK   |
| Kevin       | SH_CLERK   |
| Donald      | SH_CLERK   |
| Douglas     | SH_CLERK   |
| Jennifer    | AD_ASST    |
| Michael     | MK_MAN     |
| Pat         | MK_REP     |
| Susan       | HR_REP     |
| Hermann     | PR_REP     |
| Shelley     | AC_MGR     |
| William     | AC_ACCOUNT |
+-------------+------------+
107 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT minimum_salary  FROM jobs where job_id IN (select job_id from employees);  ;
ERROR 1054 (42S22): Unknown column 'minimum_salary' in 'field list'
ERROR: No query specified

MariaDB [csd22044s18]> SELECT min_salary  FROM jobs where job_id IN (select job_id from employees);  ;
+------------+
| min_salary |
+------------+
|      20000 |
|      15000 |
|       3000 |
|       8200 |
|       4200 |
|       8200 |
|       4200 |
|      10000 |
|       6000 |
|       8000 |
|       2500 |
|       5500 |
|       2000 |
|       2500 |
|       4000 |
|       9000 |
|       4000 |
|       4000 |
|       4500 |
+------------+
19 rows in set (0.00 sec)

ERROR: No query specified

MariaDB [csd22044s18]> SELECT min_salar,job_idy  FROM jobs where job_id IN (select job_id from employees);  ;
ERROR 1054 (42S22): Unknown column 'min_salar' in 'field list'
ERROR: No query specified

MariaDB [csd22044s18]> SELECT min_salar,job_id  FROM jobs where job_id IN (select job_id from employees);  ;
ERROR 1054 (42S22): Unknown column 'min_salar' in 'field list'
ERROR: No query specified

MariaDB [csd22044s18]> SELECT min_salar,job_id  FROM jobs;
ERROR 1054 (42S22): Unknown column 'min_salar' in 'field list'
MariaDB [csd22044s18]> SELECT min_salary,job_id  FROM jobs;
+------------+------------+
| min_salary | job_id     |
+------------+------------+
|      20000 | AD_PRES    |
|      15000 | AD_VP      |
|       3000 | AD_ASST    |
|       8200 | FI_MGR     |
|       4200 | FI_ACCOUNT |
|       8200 | AC_MGR     |
|       4200 | AC_ACCOUNT |
|      10000 | SA_MAN     |
|       6000 | SA_REP     |
|       8000 | PU_MAN     |
|       2500 | PU_CLERK   |
|       5500 | ST_MAN     |
|       2000 | ST_CLERK   |
|       2500 | SH_CLERK   |
|       4000 | IT_PROG    |
|       9000 | MK_MAN     |
|       4000 | MK_REP     |
|       4000 | HR_REP     |
|       4500 | PR_REP     |
+------------+------------+
19 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,last_name,salary,job_id FROM employees;
+-------------+-------------+----------+------------+
| first_name  | last_name   | salary   | job_id     |
+-------------+-------------+----------+------------+
| Steven      | King        | 24000.00 | AD_PRES    |
| Neena       | Kochhar     | 17000.00 | AD_VP      |
| Lex         | De Haan     | 17000.00 | AD_VP      |
| Alexander   | Hunold      |  9000.00 | IT_PROG    |
| Bruce       | Ernst       |  6000.00 | IT_PROG    |
| David       | Austin      |  4800.00 | IT_PROG    |
| Valli       | Pataballa   |  4800.00 | IT_PROG    |
| Diana       | Lorentz     |  4200.00 | IT_PROG    |
| Nancy       | Greenberg   | 12000.00 | FI_MGR     |
| Daniel      | Faviet      |  9000.00 | FI_ACCOUNT |
| John        | Chen        |  8200.00 | FI_ACCOUNT |
| Ismael      | Sciarra     |  7700.00 | FI_ACCOUNT |
| Jose Manuel | Urman       |  7800.00 | FI_ACCOUNT |
| Luis        | Popp        |  6900.00 | FI_ACCOUNT |
| Den         | Raphaely    | 11000.00 | PU_MAN     |
| Alexander   | Khoo        |  3100.00 | PU_CLERK   |
| Shelli      | Baida       |  2900.00 | PU_CLERK   |
| Sigal       | Tobias      |  2800.00 | PU_CLERK   |
| Guy         | Himuro      |  2600.00 | PU_CLERK   |
| Karen       | Colmenares  |  2500.00 | PU_CLERK   |
| Matthew     | Weiss       |  8000.00 | ST_MAN     |
| Adam        | Fripp       |  8200.00 | ST_MAN     |
| Payam       | Kaufling    |  7900.00 | ST_MAN     |
| Shanta      | Vollman     |  6500.00 | ST_MAN     |
| Kevin       | Mourgos     |  5800.00 | ST_MAN     |
| Julia       | Nayer       |  3200.00 | ST_CLERK   |
| Irene       | Mikkilineni |  2700.00 | ST_CLERK   |
| James       | Landry      |  2400.00 | ST_CLERK   |
| Steven      | Markle      |  2200.00 | ST_CLERK   |
| Laura       | Bissot      |  3300.00 | ST_CLERK   |
| Mozhe       | Atkinson    |  2800.00 | ST_CLERK   |
| James       | Marlow      |  2500.00 | ST_CLERK   |
| TJ          | Olson       |  2100.00 | ST_CLERK   |
| Jason       | Mallin      |  3300.00 | ST_CLERK   |
| Michael     | Rogers      |  2900.00 | ST_CLERK   |
| Ki          | Gee         |  2400.00 | ST_CLERK   |
| Hazel       | Philtanker  |  2200.00 | ST_CLERK   |
| Renske      | Ladwig      |  3600.00 | ST_CLERK   |
| Stephen     | Stiles      |  3200.00 | ST_CLERK   |
| John        | Seo         |  2700.00 | ST_CLERK   |
| Joshua      | Patel       |  2500.00 | ST_CLERK   |
| Trenna      | Rajs        |  3500.00 | ST_CLERK   |
| Curtis      | Davies      |  3100.00 | ST_CLERK   |
| Randall     | Matos       |  2600.00 | ST_CLERK   |
| Peter       | Vargas      |  2500.00 | ST_CLERK   |
| John        | Russell     | 14000.00 | SA_MAN     |
| Karen       | Partners    | 13500.00 | SA_MAN     |
| Alberto     | Errazuriz   | 12000.00 | SA_MAN     |
| Gerald      | Cambrault   | 11000.00 | SA_MAN     |
| Eleni       | Zlotkey     | 10500.00 | SA_MAN     |
| Peter       | Tucker      | 10000.00 | SA_REP     |
| David       | Bernstein   |  9500.00 | SA_REP     |
| Peter       | Hall        |  9000.00 | SA_REP     |
| Christopher | Olsen       |  8000.00 | SA_REP     |
| Nanette     | Cambrault   |  7500.00 | SA_REP     |
| Oliver      | Tuvault     |  7000.00 | SA_REP     |
| Janette     | King        | 10000.00 | SA_REP     |
| Patrick     | Sully       |  9500.00 | SA_REP     |
| Allan       | McEwen      |  9000.00 | SA_REP     |
| Lindsey     | Smith       |  8000.00 | SA_REP     |
| Louise      | Doran       |  7500.00 | SA_REP     |
| Sarath      | Sewall      |  7000.00 | SA_REP     |
| Clara       | Vishney     | 10500.00 | SA_REP     |
| Danielle    | Greene      |  9500.00 | SA_REP     |
| Mattea      | Marvins     |  7200.00 | SA_REP     |
| David       | Lee         |  6800.00 | SA_REP     |
| Sundar      | Ande        |  6400.00 | SA_REP     |
| Amit        | Banda       |  6200.00 | SA_REP     |
| Lisa        | Ozer        | 11500.00 | SA_REP     |
| Harrison    | Bloom       | 10000.00 | SA_REP     |
| Tayler      | Fox         |  9600.00 | SA_REP     |
| William     | Smith       |  7400.00 | SA_REP     |
| Elizabeth   | Bates       |  7300.00 | SA_REP     |
| Sundita     | Kumar       |  6100.00 | SA_REP     |
| Ellen       | Abel        | 11000.00 | SA_REP     |
| Alyssa      | Hutton      |  8800.00 | SA_REP     |
| Jonathon    | Taylor      |  8600.00 | SA_REP     |
| Jack        | Livingston  |  8400.00 | SA_REP     |
| Kimberely   | Grant       |  7000.00 | SA_REP     |
| Charles     | Johnson     |  6200.00 | SA_REP     |
| Winston     | Taylor      |  3200.00 | SH_CLERK   |
| Jean        | Fleaur      |  3100.00 | SH_CLERK   |
| Martha      | Sullivan    |  2500.00 | SH_CLERK   |
| Girard      | Geoni       |  2800.00 | SH_CLERK   |
| Nandita     | Sarchand    |  4200.00 | SH_CLERK   |
| Alexis      | Bull        |  4100.00 | SH_CLERK   |
| Julia       | Dellinger   |  3400.00 | SH_CLERK   |
| Anthony     | Cabrio      |  3000.00 | SH_CLERK   |
| Kelly       | Chung       |  3800.00 | SH_CLERK   |
| Jennifer    | Dilly       |  3600.00 | SH_CLERK   |
| Timothy     | Gates       |  2900.00 | SH_CLERK   |
| Randall     | Perkins     |  2500.00 | SH_CLERK   |
| Sarah       | Bell        |  4000.00 | SH_CLERK   |
| Britney     | Everett     |  3900.00 | SH_CLERK   |
| Samuel      | McCain      |  3200.00 | SH_CLERK   |
| Vance       | Jones       |  2800.00 | SH_CLERK   |
| Alana       | Walsh       |  3100.00 | SH_CLERK   |
| Kevin       | Feeney      |  3000.00 | SH_CLERK   |
| Donald      | OConnell    |  2600.00 | SH_CLERK   |
| Douglas     | Grant       |  2600.00 | SH_CLERK   |
| Jennifer    | Whalen      |  4400.00 | AD_ASST    |
| Michael     | Hartstein   | 13000.00 | MK_MAN     |
| Pat         | Fay         |  6000.00 | MK_REP     |
| Susan       | Mavris      |  6500.00 | HR_REP     |
| Hermann     | Baer        | 10000.00 | PR_REP     |
| Shelley     | Higgins     | 12000.00 | AC_MGR     |
| William     | Gietz       |  8300.00 | AC_ACCOUNT |
+-------------+-------------+----------+------------+
107 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,last_name,salary,job_id FROM employees WHERE salary = (SELECT MIN_SALARY FROM jobs WHERE employees.job_id = jobs.job_id);
+------------+------------+---------+----------+
| first_name | last_name  | salary  | job_id   |
+------------+------------+---------+----------+
| Karen      | Colmenares | 2500.00 | PU_CLERK |
| Martha     | Sullivan   | 2500.00 | SH_CLERK |
| Randall    | Perkins    | 2500.00 | SH_CLERK |
+------------+------------+---------+----------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> select * from departments;
+---------------+----------------------+------------+-------------+
| DEPARTMENT_ID | DEPARTMENT_NAME      | MANAGER_ID | LOCATION_ID |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |          0 |        1700 |
|           130 | Corporate Tax        |          0 |        1700 |
|           140 | Control And Credit   |          0 |        1700 |
|           150 | Shareholder Services |          0 |        1700 |
|           160 | Benefits             |          0 |        1700 |
|           170 | Manufacturing        |          0 |        1700 |
|           180 | Construction         |          0 |        1700 |
|           190 | Contracting          |          0 |        1700 |
|           200 | Operations           |          0 |        1700 |
|           210 | IT Support           |          0 |        1700 |
|           220 | NOC                  |          0 |        1700 |
|           230 | IT Helpdesk          |          0 |        1700 |
|           240 | Government Sales     |          0 |        1700 |
|           250 | Retail Sales         |          0 |        1700 |
|           260 | Recruiting           |          0 |        1700 |
|           270 | Payroll              |          0 |        1700 |
+---------------+----------------------+------------+-------------+
27 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT AVG(SALARY) FROM employees;
+-------------+
| AVG(SALARY) |
+-------------+
| 6461.682243 |
+-------------+
1 row in set (0.00 sec)

MariaDB [csd22044s18]> SELECT department_id from departments where department_name LIKE 'IT%';
+---------------+
| department_id |
+---------------+
|            60 |
|           210 |
|           230 |
+---------------+
3 rows in set (0.00 sec)

MariaDB [csd22044s18]> SELECT first_name,last_name,salary,department_id FROM employees WHERE salary > (SELECT avg(SALARY) FROM employees) AND department_id IN (SELECT department_id FROM departments WHERE DEPARTMENT_NAME LIKE 'IT%');
+------------+-----------+---------+---------------+
| first_name | last_name | salary  | department_id |
+------------+-----------+---------+---------------+
| Alexander  | Hunold    | 9000.00 |            60 |
+------------+-----------+---------+---------------+
1 row in set (0.00 sec)

