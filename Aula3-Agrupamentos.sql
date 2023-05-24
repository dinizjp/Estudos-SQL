-- 1. Qual o número de clientes únicos de todos os estados?
SELECT 
	c.customer_state ,
	COUNT( c.customer_unique_id ) AS numero_clientes_unicos
FROM customer c 
GROUP BY c.customer_state 

-- 2. Qual o número de cidades únicas de todos os estados?
SELECT 
	c.customer_state ,
	COUNT(c.customer_city ) AS numero_de_cidades_por_estado
FROM customer c 
GROUP BY c.customer_state 

-- 3. Qual o número de clientes únicos por estado e por cidade?
SELECT 
	c.customer_state ,
	c.customer_city ,
	COUNT(c.customer_unique_id  ) AS numero_de_clientes
FROM customer c 
GROUP BY c.customer_state , c.customer_city 

-- 4. Qual o número de clientes únicos por cidade e por estado?
SELECT 
	c.customer_city , 
	c.customer_state ,
	COUNT(c.customer_city ) AS numero_de_cidades_por_estado
FROM customer c 
GROUP BY c.customer_city , c.customer_state 
ORDER BY customer_state 

-- 5. Qual o número total de pedidos únicos acima de R$ 3.500 por cada vendedor?
SELECT 
	oi.seller_id ,
	COUNT(DISTINCT oi.order_id)  
FROM order_items oi
WHERE oi.price > 3500
GROUP BY seller_id 

-- 6. Qual o número total de pedidos únicos, a data mínima e máxima de envio, o valor máximo, mínimo e médio do frete dos pedidos acima de R$ 1.100 por cada vendedor?
SELECT 
	seller_id ,
	COUNT(DISTINCT oi.order_id ) AS pedidos_unicos,
	MAX(DATE( oi.shipping_limit_date )) AS data_max_envio ,
	MIN(DATE( oi.shipping_limit_date )) AS data_min_envio,
	MAX(oi.freight_value) AS frete_max,
	MIN(oi.freight_value) AS frete_min,
	AVG(oi.freight_value) AS frete_mean
FROM order_items oi 
WHERE price > 1000
GROUP BY seller_id 

-- 7. Qual o valor médio, máximo e mínimo do preço de todos os pedidos de cada produto?
SELECT 
	oi.product_id ,
	AVG(oi.price) AS price_mean,
	MAX(oi.price) AS price_max,
	MIN(oi.price) AS price_min
FROM order_items oi 
GROUP BY oi.product_id  

-- 8. Qual a quantidade de vendedores distintos que receberam algum pedido antes do dia 23 de setembro de 2016 e qual foi o preço médio desses pedidos?
SELECT 
	 oi.shipping_limit_date ,
	COUNT(oi.seller_id),
	AVG(oi.price)
FROM order_items oi 
WHERE DATE ( oi.shipping_limit_date ) < '2016-09-23'
GROUP BY oi.shipping_limit_date


-- 10. Qual a quantidade de pedidos por tipo de pagamentos?
SELECT 
	op.payment_type,
	COUNT(op.order_id) AS numero_pedidos
FROM order_payments op  
GROUP BY op.payment_type 


-- 11. Qual a quantidade de pedidos, a média do valor do pagamento e o número máximo de parcelas por tipo de pagamentos?
SELECT 
	op.payment_type ,
	COUNT( op.order_id ) AS numero_pedidos,
	AVG(op.payment_value) AS price_mean, 
	MAX(op.payment_installments) AS parcela_max
FROM order_payments op 
GROUP BY op.payment_type 


-- 12. Qual a valor mínimo, máximo, médio e as soma total paga por cada tipo de pagamento e número de parcelas disponíveis?
SELECT 
	op.payment_type ,
	op.payment_installments ,
	MIN(payment_value) AS price_min,
	MAX(payment_value) AS price_max,
	AVG(payment_value) AS price_mean
FROM order_payments op 
GROUP BY payment_type, payment_installments 

-- 13. Qual a média de pedidos por cliente?
SELECT 
	o.customer_id ,
	AVG(o.order_id) AS order_mean
FROM orders o 
GROUP BY o.customer_id

-- 14. Qual a quantidade de pedidos realizados por cada status do pedido, a partir do dia 23 de Setembro de 2016?
SELECT 
	o.order_status , 
	COUNT(o.order_id) AS order_count 
FROM orders o 
WHERE DATE( o.order_approved_at) > '2016-09-23' 
GROUP BY o.order_status 

-- 15. Qual a quantidade de pedidos realizados por dia, a partir do dia 23 de Setembro de 2016?
SELECT 
	DATE(o.order_approved_at) AS data, 
	COUNT(o.order_id) AS order_count 
FROM orders o 
WHERE DATE( o.order_approved_at) > '2016-09-23' 
GROUP BY o.order_approved_at

-- 16. Quantos produtos estão cadastrados na empresa por categoria?
SELECT 
	p.product_category_name ,
	COUNT(product_id) AS quantidade_produtos
FROM products p 
GROUP BY product_category_name 










