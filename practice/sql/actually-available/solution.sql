select
   count(*) as in_stock_count
from products
where in_stock = true;
