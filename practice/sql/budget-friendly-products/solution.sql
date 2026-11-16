select category
from products
where price between 90 and 200
group by category
order by category asc;
