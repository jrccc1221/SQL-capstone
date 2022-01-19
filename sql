Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet 
This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary. 
In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required. 
For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately. In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer. 
Part 1: Yelp Dataset Profiling and Understanding 
1.	Profile the data by finding the total number of records for each of the tables below: 

Select count(*)
From table name
 	 
Attribute table = 10000
Business table = 10000
Category table = 10000
Checkin table = 10000
elite_years table = 10000
friend table = 10000
hours table = 10000
photo table = 10000
review table = 10000
tip table = 10000
user table = 10000
 	 
2.	Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key. 

SELECT COUNT(DISTINCT(key))
FROM table


i.	Business = id: 10000
ii.	Hours = business_id: 1562
iii.	Category = business_id: 2643
iv.	Attribute = business_id: 1115
v.	Review = id: 10000, business_id: 8090, user_id: 9581
vi.	Checkin = business_id: 493
vii.	Photo = id: 10000, photo: 6493
viii.	Tip = user_id: 537, business_id: 3979
ix.	User = id: 10000
x.	Friend = user_id: 11
xi.	Elite_years = user_id: 2780

3.	Are there any columns with null values in the Users table? Indicate "yes," or "no." 
 	Answer: No
 	  	 
 	SQL code used to arrive at answer: select * FROM user
where compliment_photos='Null'
 	  	 
 	 
4.	For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields: 
SELECT AVG(column), Max(column),AVG(column)
From table
FROM table
i.	Table: Review, Column: Stars 
 	  	min: 1	 	max: 5  	avg: 3.7082
 	 	 
 	 
ii.	Table: Business, Column: Stars 
 	  	min: 1	 	max: 5  	avg: 3.6549
 	 	 
 	 
iii.	Table: Tip, Column: Likes 
 	  	min: 0 	max: 2 	avg: 0.0144
 	 	 
 	 
iv.	Table: Checkin, Column: Count 
 	  	min: 1 	max: 53 	avg: 1.9414
 	 	 
 	 
v.	Table: User, Column: Review_count 
 	  	min: 0 	max: 2000  	avg: 24.2995
 	 	 
5.	List the cities with the most reviews in descending order: 
 	SQL code used to arrive at answer: 
select city, sum(review_count) as review 
from business
group by city
order by review desc

 	Copy and Paste the Result Below: 
+-----------------+--------+
| city            | review |
+-----------------+--------+
| Las Vegas       |  82854 |
| Phoenix         |  34503 |
| Toronto         |  24113 |
| Scottsdale      |  20614 |
| Charlotte       |  12523 |
| Henderson       |  10871 |
| Tempe           |  10504 |
| Pittsburgh      |   9798 |
| Montréal        |   9448 |
| Chandler        |   8112 |
| Mesa            |   6875 |
| Gilbert         |   6380 |
| Cleveland       |   5593 |
| Madison         |   5265 |
| Glendale        |   4406 |
| Mississauga     |   3814 |
| Edinburgh       |   2792 |
| Peoria          |   2624 |
| North Las Vegas |   2438 |
| Markham         |   2352 |
| Champaign       |   2029 |
| Stuttgart       |   1849 |
| Surprise        |   1520 |
| Lakewood        |   1465 |
| Goodyear        |   1155 |

 	 
 	 
6.	Find the distribution of star ratings to the business in the following cities: i. Avon 
SQL code used to arrive at answer: 
select city, stars, sum(review_count)
from business
where city = 'Avon'
group by stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+------+-------+-------------------+
| city | stars | sum(review_count) |
+------+-------+-------------------+
| Avon |   1.5 |                10 |
| Avon |   2.5 |                 6 |
| Avon |   3.5 |                88 |
| Avon |   4.0 |                21 |
| Avon |   4.5 |                31 |
| Avon |   5.0 |                 3 |
+------+-------+-------------------+
 
ii. Beachwood 
SQL code used to arrive at answer: 
select city, stars, sum(review_count)
from business
where city like '%Beachwood%'
group by stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count): 
+-----------+-------+-------------------+
| city      | stars | sum(review_count) |
+-----------+-------+-------------------+
| Beachwood |   2.0 |                 8 |
| Beachwood |   2.5 |                 3 |
| Beachwood |   3.0 |                11 |
| Beachwood |   3.5 |                 6 |
| Beachwood |   4.0 |                69 |
| Beachwood |   4.5 |                17 |
| Beachwood |   5.0 |                23 |
	 	 
7.	Find the top 3 users based on their total number of reviews: 
 	 	 
 	SQL code used to arrive at answer: 
SELECT review_count, name
FROM user
ORDER BY review_count DESC
LIMIT 3


 	 
 	 	 
 	Copy and Paste the Result Below: 
+--------------+--------+
| review_count | name   |
+--------------+--------+
|         2000 | Gerald |
|         1629 | Sara   |
|         1339 | Yuri   |
+--------------+--------+

8.	Does posing more reviews correlate with more fans? 
SELECt fans, name, review_count
FROM user
ORDER BY review_count DESC
+------+-----------+--------------+
| fans | name      | review_count |
+------+-----------+--------------+
|  253 | Gerald    |         2000 |
|   50 | Sara      |         1629 |
|   76 | Yuri      |         1339 |
|  101 | .Hon      |         1246 |
|  126 | William   |         1215 |
|  311 | Harald    |         1153 |
|   16 | eric      |         1116 |
|  104 | Roanna    |         1039 |
|  497 | Mimi      |          968 |
|  173 | Christine |          930 |
|   38 | Ed        |          904 |
|   43 | Nicole    |          864 |
|  124 | Fran      |          862 |
|  115 | Mark      |          861 |
|   85 | Christina |          842 |
|   37 | Dominic   |          836 |
|  120 | Lissa     |          834 |
|  159 | Lisa      |          813 |
|   61 | Alison    |          775 |
|   78 | Sui       |          754 |
|   35 | Tim       |          702 |
|   10 | L         |          696 |
|  101 | Angela    |          694 |
|   25 | Crissy    |          676 |
|   45 | Lyn       |          675 |


 Please explain your findings and interpretation of the results: Not necessary because Mimi has the most fans but doesn’t has the most review count. There is no correlation

 	 
 	 
9.	Are there more reviews with the word "love" or with the word "hate" in them? 
 	Answer: 	SELECT COUNT(*)
			FROM review
			WHERE text LIKE "%love%"

			SELECT COUNT(*)
FROM review
WHERE text LIKE "%hate%" 

	




	
 	 
 	SQL code used to arrive at answer: 
+------------+
| count_love |
+------------+
|       1780 |
+------------+


+------------+
| count_hate |
+------------+
|        232 |
+------------+


 	  	 
10.	Find the top 10 users with the most fans: 
 	SQL code used to arrive at answer: 

select name, fans
from user
order by fans desc
limit 10

 	 	 
 	Copy and Paste the Result Below: 
+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+

 	 
 	 	 
Part 2: Inferences and Analysis 
1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code. 
 
i.	Do the two groups you chose to analyze have a different distribution of hours? 
Yes,
select b.name,b.city,b.review_count,b.stars,c.category,h.hours,
case WHEN h.hours LIKE "%monday%" THEN 1
                  WHEN h.hours LIKE "%tuesday%" THEN 2
                  WHEN h.hours LIKE "%wednesday%" THEN 3
                  WHEN h.hours LIKE "%thursday%" THEN 4
                  WHEN h.hours LIKE "%friday%" THEN 5
                  WHEN h.hours LIKE "%saturday%" THEN 6
                  WHEN h.hours LIKE "%sunday%" THEN 7
                  end hours
from business b inner join category c on b.id = c.business_id
inner join hours h on h.business_id=b.id 
where b.city like 'Toronto' and c.category like 'Restaurants'
order by b.stars


+------------------+---------+--------------+-------+-------------+-----------------------+--------+
| name             | city    | review_count | stars | category    | hours                 | hours  |
+------------------+---------+--------------+-------+-------------+-----------------------+--------+
| 99 Cent Sushi    | Toronto |            5 |   2.0 | Restaurants | Monday|11:00-23:00    |      1 |
| 99 Cent Sushi    | Toronto |            5 |   2.0 | Restaurants | Tuesday|11:00-23:00   |      2 |
| 99 Cent Sushi    | Toronto |            5 |   2.0 | Restaurants | Friday|11:00-23:00    |      5 |
| 99 Cent Sushi    | Toronto |            5 |   2.0 | Restaurants | Wednesday|11:00-23:00 |      3 |
| 99 Cent Sushi    | Toronto |            5 |   2.0 | Restaurants | Thursday|11:00-23:00  |      4 |
| 99 Cent Sushi    | Toronto |            5 |   2.0 | Restaurants | Sunday|11:00-23:00    |      7 |
| 99 Cent Sushi    | Toronto |            5 |   2.0 | Restaurants | Saturday|11:00-23:00  |      6 |
| Big Smoke Burger | Toronto |           47 |   3.0 | Restaurants | Monday|10:30-21:00    |      1 |
| Big Smoke Burger | Toronto |           47 |   3.0 | Restaurants | Tuesday|10:30-21:00   |      2 |
| Big Smoke Burger | Toronto |           47 |   3.0 | Restaurants | Friday|10:30-21:00    |      5 |
| Big Smoke Burger | Toronto |           47 |   3.0 | Restaurants | Wednesday|10:30-21:00 |      3 |
| Big Smoke Burger | Toronto |           47 |   3.0 | Restaurants | Thursday|10:30-21:00  |      4 |
| Big Smoke Burger | Toronto |           47 |   3.0 | Restaurants | Sunday|11:00-19:00    |      7 |
| Big Smoke Burger | Toronto |           47 |   3.0 | Restaurants | Saturday|10:30-21:00  |      6 |
| Pizzaiolo        | Toronto |           34 |   3.0 | Restaurants | Monday|9:00-23:00     |      1 |
| Pizzaiolo        | Toronto |           34 |   3.0 | Restaurants | Tuesday|9:00-23:00    |      2 |
| Pizzaiolo        | Toronto |           34 |   3.0 | Restaurants | Friday|9:00-4:00      |      5 |
| Pizzaiolo        | Toronto |           34 |   3.0 | Restaurants | Wednesday|9:00-23:00  |      3 |
| Pizzaiolo        | Toronto |           34 |   3.0 | Restaurants | Thursday|9:00-23:00   |      4 |
| Pizzaiolo        | Toronto |           34 |   3.0 | Restaurants | Sunday|10:00-23:00    |      7 |
| Pizzaiolo        | Toronto |           34 |   3.0 | Restaurants | Saturday|10:00-4:00   |      6 |
| Edulis           | Toronto |           89 |   4.0 | Restaurants | Sunday|12:00-16:00    |      7 |
| Edulis           | Toronto |           89 |   4.0 | Restaurants | Friday|18:00-23:00    |      5 |
| Edulis           | Toronto |           89 |   4.0 | Restaurants | Wednesday|18:00-23:00 |      3 |
| Edulis           | Toronto |           89 |   4.0 | Restaurants | Thursday|18:00-23:00  |      4 |
+------------------+---------+--------------+-------+-------------+-----------------------+--------+
(Output limit exceeded, 25 of 40 total rows shown)

ii.	Do the two groups you chose to analyze have a different number of reviews? 

Yes, they have different number of review
                    iii. Are you able to infer anything from the location data provided between these two groups? Explain. 
		
SQL code used for analysis: 
 	 	  	 	 
2.	Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer. 
 	 	 Difference 1: businesses that are opened has higher star and review than those are closed
                    Difference 2: there are more review on business that are opened
                              
SQL code used for analysis: 
select Count(DISTINCT(id)),
Avg(review_count),
Sum(review_count),
Avg(stars),
is_open

FROM business
GROUP BY is_open

+---------------------+-------------------+-------------------+---------------+---------+
| Count(DISTINCT(id)) | Avg(review_count) | Sum(review_count) |    Avg(stars) | is_open |
+---------------------+-------------------+-------------------+---------------+---------+
|                1520 |     23.1980263158 |             35261 | 3.52039473684 |       0 |
|                8480 |     31.7570754717 |            269300 | 3.67900943396 |       1 |
+---------------------+-------------------+-------------------+---------------+---------+


 	  	 
3.	For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis. 
Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following: 
 	 
i. Indicate the type of analysis you chose to do: 
                    ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data: 
                            
                   iii. Output of your finished dataset: 
                    iv. Provide the SQL code you used to create your final dataset:
