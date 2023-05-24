-- 1. Qual o número de clientes únicos nos estado de Minas Gerais ou Rio de Janeiro?
SELECT
	c.customer_state,
	COUNT( customer_unique_id )
FROM customer c  
WHERE c.customer_state  = 'MG'
OR c.customer_state ='RJ'
GROUP BY c.customer_state 

-- 2. Qual a quantidade de cidades únicas dos vendedores no estado de São Paulo ou Rio de Janeiro com a latitude maior que -24.54 e longitude menor que -45.63?
SELECT 
	g.geolocation_state , 
	COUNT(DISTINCT g.geolocation_city) AS quant_cidade
FROM geolocation g
WHERE g.geolocation_state = 'SP' OR g.geolocation_state ='RJ'
AND g.geolocation_lat > -24.54 AND -45.63
GROUP BY g.geolocation_state 

-- 3. Qual o número total de pedidos únicos, o número total de produtos e o preço médio dos pedidos com o preço de frete maior que R$ 20 e a data limite
-- de envio entre os dias 1 e 31 de Outubro de 2016? 
SELECT 
	COUNT(DISTINCT oi.order_id) AS pedidos_unicos,
	COUNT (product_id) AS total_produtos,
	AVG (oi.price)
FROM order_items oi
WHERE oi.freight_value > 20 
AND DATE(oi.shipping_limit_date) >= '2016-10-01'
AND DATE(oi.shipping_limit_date) <= '2016-10-31'

-- 4. Mostre a quantidade total dos pedidos e o valor total do pagamento, para pagamentos entre 1 e 5 prestações ou um valor de pagamento acima de R$ 5000.
SELECT 
	op.payment_type,
	op.payment_installments, 
	COUNT(op.order_id),
	SUM(op.payment_value) 
FROM order_payments op 
WHERE op.payment_installments  >= 1 AND op.payment_installments <= 5
OR op.payment_value > 5000
GROUP BY payment_type , payment_installments 


-- 5. Qual a quantidade de pedidos com o status em processamento ou cancelada acontecem com a data estimada de entrega maior que 01 de Janeiro
-- de 2017 ou menor que 23 de Novembro de 2016?
SELECT 
	o.order_status, 
	o.order_estimated_delivery_date,
	COUNT(o.order_id)
FROM orders o 
WHERE (o.order_status = 'processing'  OR o.order_status  = 'canceled')
AND (DATE(o.order_estimated_delivery_date) > '2017-01-01' OR DATE(o.order_estimated_delivery_date) < '2016-10-23')
GROUP BY o.order_status 


-- 6. Quantos produtos estão cadastrados nas categorias: perfumaria, brinquedos, esporte lazer, cama mesa e banho e móveis de escritório que
-- possuem mais de 5 fotos, um peso maior que 5 g, um altura maior que 10 cm, uma largura maior que 20 cm?
SELECT 
	p.product_category_name ,
	COUNT(product_id) 
FROM products p 
WHERE (p.product_category_name = 'perfumaria'
	OR p.product_category_name = 'brinquedos'
	OR p.product_category_name = 'esporte_lazer'
	OR p.product_category_name = 'cama_mesa_banho'
	OR p.product_category_name = 'moveis_escritorio')
	AND p.product_photos_qty > 5
	AND p.product_weight_g > 5
	AND p.product_height_cm > 10
	AND p.product_width_cm > 20
GROUP BY product_category_name 
