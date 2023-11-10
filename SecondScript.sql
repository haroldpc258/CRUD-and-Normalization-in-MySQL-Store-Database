SELECT p.product_name, ps.number_of_units, s.customer_doc_type, s.customer_doc_number, s.sale_date
FROM products p
INNER JOIN products_sales ps ON p.id = ps.product_id
INNER JOIN sales s ON ps.sale_id = s.id AND s.Logical_deletion = FALSE
WHERE s.customer_doc_type = 'DNI' AND s.customer_doc_number = '56789012';

SELECT p.product_name, GROUP_CONCAT(s.supplier_name) AS suppliers
FROM products p
LEFT JOIN products_suppliers ps ON p.id = ps.product_id
LEFT JOIN suppliers s ON ps.supplier_id = s.id
WHERE p.product_name = 'Smartwatch';

SELECT ps.product_id, p.product_name, SUM(ps.number_of_units) AS total_units_sold
FROM products_sales ps
JOIN products p ON ps.product_id = p.id
GROUP BY ps.product_id, p.product_name
ORDER BY total_units_sold DESC;