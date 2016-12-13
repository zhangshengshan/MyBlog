---
title: SparkDataFrameLikeSql
date: 2016-12-09 16:11:00
tags: Spark DataFrame
---

The idea of spark Datafame is inspired from dataframe of pandas which is a package of python for computing. On my opinion, dataframe can by prefered by the people who is familiar with SQL or BI developers, for it is easy to learn.

DataFrame could by registered as a table ,then Somebody could explore the the data by using Standard SQL.

However this article will focus on  some dataframe processing method without the help of registering a virtual table, and compared to those common operations in SQL including  SELECT, WHERE, GROUPBY, MIN, MAX, COUNT, SUM ,DISTINCT, ORDERBY, TOP, JOIN and so on

here we make a DataFrame object a by reading a json file
```
val sc: SparkContext // An existing SparkContext.
val sqlContext = new org.apache.spark.sql.SQLContext(sc)
// this is used to implicitly convert an RDD to a DataFrame.
import sqlContext.implicits._
val a = sqlContext.read.json("people.json")
```
and the content of people.json is as below
```
{"name":"Michael" , "age":23 ,"depart":"A","salary":3000 }
{"name":"Dan"     , "age":23 ,"depart":"A","salary":3500 }
{"name":"Alex"    , "age":23 ,"depart":"A","salary":3600 }
{"name":"Ben"     , "age":23 ,"depart":"A","salary":3700 }
{"name":"Andy"    , "age":30 ,"depart":"B","salary":4000 }
{"name":"Justin"  , "age":19 ,"depart":"A","salary":5000 }
{"name":"Jack"    , "age":19 ,"depart":"B","salary":2000 }
```
let us image a as a Table which is stored in a RDS database such as MySQL.

## desc 

```
desc people;
```
```
scala> a.printSchema
root
|-- age: long (nullable = true)
|-- depart: string (nullable = true)
|-- name: string (nullable = true)
|-- salary: long (nullable = true)
```

## SELECT 
```
select name from people;
```

```
a.select("name").show
a.select($"name").show
a.select(a("name")).show
```
the three methods above are equivelent.

## WHERE
```
select name,age from people where age = 23
```
```
a.select("name", "age").where($"age"===23).show
a.select("name", "age").filter($"age"===23).show
```

## MIN,MAX,SUM

```
select min(age), max(age), sum(salary) from people
```


```
a.select(min("age"),max("age"),sum("salary"),count("age")).show
```
and the result is 
```

+--------+--------+-----------+----------+
|min(age)|max(age)|sum(salary)|count(age)|
+--------+--------+-----------+----------+
|      19|      30|      24800|         7|
+--------+--------+-----------+----------+

```



