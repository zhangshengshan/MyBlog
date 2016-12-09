---
title: SparkDataFrameLikeSql
date: 2016-12-09 16:11:00
tags: Spark DataFrameLikeSQL
---

The idea of spark Datafame is inspired from dataframe of pandas which is a package of python for computing. On my opinion, dataframe can by prefered by the people who is familiar with SQL or BI developers, for it is easy to learn.


DataFrame could by registered as a table ,then Somebody could explore the the data by using Standard SQL.

However this article will focus on  some dataframe processing method without the help of registering a virtual table, and compared to those common operations in SQL including  SELECT, WHERE, GROUPBY, MIN, MAX, COUNT, SUM ,DISTINCT, ORDERBY, TOP, JOIN and so on


```
    select * from person;


```
