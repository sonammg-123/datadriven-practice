select
      ci.content_type as content_type,
      count(cv.view_id) as view_count
from content_items ci join
content_views cv on
cv.content_id  = ci.content_id
group by content_type;
