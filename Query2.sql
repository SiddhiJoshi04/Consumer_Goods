with avg_j as(

select (SELECT count(distinct product_code) as m from fact_gross_price a
where fiscal_year=2020) unique_products_2020,
(SELECT count(distinct product_code) as n from fact_gross_price where 
fiscal_year = 2021) unique_products_2021
from fact_gross_price)

SELECT unique_products_2020, unique_products_2021, 
((unique_products_2021-unique_products_2020)/unique_products_2020)*100 as percentage_change from avg_j limit 1;
