DELETE FROM person_order po 
WHERE po.menu_id IN (SELECT m.id FROM menu m WHERE m.pizza_name = 'greek pizza') AND po.order_date = '2022-02-25';