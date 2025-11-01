# BigQuery Crime Analysis Project
<img width="888" height="230" alt="image" src="https://github.com/user-attachments/assets/703630c4-85a8-49f2-bb1b-7abf8a639292" /># TODO
> Edit this file to add your answeres to each TODO item. Its okay to link to external documentation as well, just remember to ensure that our reviewers has access.
> When you're ready to submit, click **Commit changes...** and save your responses to a new branch titled 'implementation' and create a pull request.

>Before you start reading, please configure your environment as described in the "Before you get started" README section of your GitHub repository.*

In this task, you will work with the [Chicago Crime Dataset](https://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1salva-coding-test!2schicago_crime!3scrime) to figure out some insights regarding the crimes commited in Chicago.

Here are some examples of the columns you will work with:

|Variable|Description|
|----:|-----|
|primary_type |What type of crime was committed|
|location_description |Description of the location where the crime was committed|
|arrest|If the crime led to an arrest or not|

Feel free to explore the dataset and try out different queries using the BigQuery interface.
Once you have a query that answers the question, add the code snippet to the specific question as well any supportive reasoning/comment that you may have.  

## Task 1 

From what date is the oldest data point in the data set? 

> TODO: 2001-01-01 00:00:00 UTC

## Task 2

Which year had the largest amount of crimes and how many crimes were committed that year?

> TODO: 2002, 486825

## Task 3

Let's define "Arrest Rate" as the share of crimes that led to an arrest.
What were the five most common crimes in 2020? Which of those has the highest and lowest arrest rate?

> TODO: Row	crime_type	        total	arrests	arrest_rate_percent
          1	BATTERY	                41514	6920	16.67
          2	ASSAULT	                18257	2331	12.77
          3	THEFT	                41337	2804	6.78
          4	CRIMINAL DAMAGE	        24877	1179	4.74
          5	DECEPTIVE PRACTICE	18487	385	2.08

## Task 4

What year had the highest arrest rate? Plot the number of crimes per year and comment on the trend.

> TODO: Row	year	total_crimes	arrests	arrest_rate_percent
          1	2001	485920	        141942	29.21
          2	2002	486825	        141578	29.08
          3	2003	475989	        141600	29.75
          4	2004	469432	        144704	30.83
          5	2005	453779	        140928	31.06
          6	2006	448191	        135426	30.22
          7	2007	437093	        131881	30.17

## Task 5

Which year had the most number of crimes leading to an arrest? How many arrests were made during that year? Plot the trend for total number of arrests per year.

> TODO: 2004,	144704
> Row	year	total_arrests
  1	2001	141942           
  2	2002	141578
  3	2003	141600
  4	2004	144704
  5	2005	140928
  6	2006	135426
  7	2007	131881
> <img width="888" height="230" alt="image" src="https://github.com/user-attachments/assets/321c0bb0-310b-4653-9324-b25add79d867" />


## Task 6

How has the arrest rate looked like over time? 
- Plot the trend of the arrest rate.
- Between which years can you see the biggest change in "Arrest Rate"?
- Can you point at specific reasons to why the Arrest Rate dropped between those years? Comment on your conclusions.

> Since the data set is constantly updating, disregard the year 2021 and later for the analysis in this question.

> TODO: Row	year	arrest_rate_percent
        1	2001	29.21
        2	2002	29.08
        3	2003	29.75
        4	2004	30.83
        5	2005	31.06
        6	2006	30.22
        7	2007	30.17
> <img width="881" height="229" alt="image" src="https://github.com/user-attachments/assets/2d304afa-f812-4178-98de-94a6b7be41d6" />

Row	year	arrest_rate	rate_change
1	2016	19.65	-6.8000000000000007
