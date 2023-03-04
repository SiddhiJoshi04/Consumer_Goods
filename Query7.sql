/* Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount
*/
select MONTH(date) as month, YEAR(date) as year, 
sum(gross_price*sold_quantity) gross_sales_amount
from fact_sales_monthly join fact_gross_price on
fact_sales_monthly.product_code = fact_gross_price.product_code 
where fact_sales_monthly.customer_code IN (SELECT dim_customer.customer_code from 
dim_customer where customer = "Atliq Exclusive") group by month,year;

/*select MONTH(date) as month, YEAR(date) as year, 
sum(gross_price*sold_quantity) gross_sales_amount
from fact_sales_monthly join fact_gross_price on
fact_sales_monthly.product_code = fact_gross_price.product_code 
where fact_sales_monthly.customer_code IN (SELECT dim_customer.customer_code from 
dim_customer where customer = "Atliq Exclusive") group by month,year;
*/
