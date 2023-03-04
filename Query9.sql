/* Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/

select channel, sum(sold_quantity) gross_sales, sum(sold_quantity)*100/(select sum(sold_quantity) from fact_sales_monthly where fiscal_year=2021) percentage from dim_customer 
join fact_sales_monthly on dim_customer.customer_code = fact_sales_monthly.customer_code where fiscal_year=2021
group by channel order by gross_sales desc;