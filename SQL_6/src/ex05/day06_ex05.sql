COMMENT ON TABLE person_discounts IS 'Информация о скидках определенных людей';
COMMENT ON COLUMN person_discounts.id IS 'Порядковый номер в таблице';
COMMENT ON COLUMN person_discounts.person_id IS 'ID человека в таблице скидок';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID пиццерии в которой у человека скидка';
COMMENT ON COLUMN person_discounts.discount IS 'Сколько процентов скидка у человека';       