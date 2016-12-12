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
val a = sqlContext.read.json("people.json")
```

let us image a as a Table which is stored in a RDS database such as MySQL.
```
desc yourtable;
```

```
    scala> a.printSchema
    root
    |-- age: long (nullable = true)
    |-- depart: string (nullable = true)
    |-- name: string (nullable = true)
    |-- salary: long (nullable = true)
```


