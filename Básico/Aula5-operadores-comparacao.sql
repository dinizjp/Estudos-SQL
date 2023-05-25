-- 1. Qual o número de clientes únicos do estado de São Paulo?
SELECT 
	COUNT( c.customer_unique_id ) 
FROM customer c 
WHERE customer_state ='SP'

-- 2. Qual o número total de pedidos únicos feitos no dia 08 de Outubro de 2016.

SELECT 
	COUNT(DISTINCT order_id) 
FROM order_items oi 
WHERE DATE(oi.shipping_limit_date) = '2016-10-08'

-- 3. Qual o número total de pedidos únicos feitos a partir do dia 08 de Outubro de 2016 .
SELECT 
	COUNT(DISTINCT order_id )
FROM order_items oi 
WHERE DATE(shipping_limit_date ) > '2016-10-08'

-- 4. Qual o número total de pedidos únicos feitos a partir do dia 08 de Outubro de 2016 incluso.
SELECT 
	COUNT(DISTINCT order_id )
FROM order_items oi 
WHERE DATE(shipping_limit_date ) >= '2016-10-08'

-- 5. Qual o número total de pedidos únicos, a data mínima e máxima de envio, o valor máximo, mínimo e médio do frete dos pedidos abaixo de R$ 1.100 por cada vendedor? 
SELECT 
	COUNT(DISTINCT order_id),
	MIN( shipping_limit_date ),
	MAX( shipping_limit_date),
	MAX( freight_value),
	MIN( freight_value),
	AVG(freight_value)
FROM order_items oi 
WHERE price < 1100


-- 6. Qual o número total de pedidos únicos, a data mínima e máxima de envio, o valor máximo, mínimo e médio do frete dos pedidos abaixo de R$ 1.100 incluso por cada vendedor?

SELECT 
	COUNT(DISTINCT order_id),
	MIN( shipping_limit_date ),
	MAX( shipping_limit_date),
	MAX( freight_value),
	MIN( freight_value),
	AVG(freight_value)
FROM order_items oi 
WHERE price <= 1100

	



