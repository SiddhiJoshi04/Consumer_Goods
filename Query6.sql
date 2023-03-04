/* Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage */
select  min(dim_customer.customer_code) as customer_code, min(customer) customer, ROUND(avg(pre_invoice_discount_pct),6) average_discount
from fact_pre_invoice_deductions inner join dim_customer 
on fact_pre_invoice_deductions.customer_code = dim_customer.customer_code where market="India"
group by dim_customer.customer order by average_discount desc limit 5 ;

/*Note, one customer has multiple customer_codes therefre customer_code cant be shown" */