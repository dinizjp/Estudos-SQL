-- 1.Gere uma tabela com o id do cliente, a cidade e o estado onde ele vive.

SELECT 
	c.customer_id,
	c.customer_city,
	c.customer_state
FROM customer c 
LIMIT 10;

-- 2. Gere uma tabela com o id do cliente e a cidade, somente dos clientes que vivem em Santa Catarina.
SELECT 
	c.customer_id,
	c.customer_city,
	c.customer_state 
FROM customer c 
WHERE customer_state = 'SC'
LIMIT 10;

-- 3. Gere uma tabela com o id do cliente e o estado, somente dos clientes que vivem em Florianópolis.
SELECT 
	c.customer_id ,
	c.customer_state 
FROM customer c 
WHERE customer_city ='florianopolis'
LIMIT 10;

-- 4. Gere uma tabela com o estado, latitude e longitude do estado de São Paulo
SELECT 
	g.geolocation_state ,
	g.geolocation_lat ,
	g.geolocation_lng 
FROM geolocation g 
WHERE geolocation_state ='SP'
LIMIT 10;

-- 5. Gere uma tabela com o id do produto, a data de envio e o preço, somente para produtos acima de 6300
SELECT 
	oi.product_id ,
	oi.shipping_limit_date ,
	oi.price 
FROM order_items oi 
WHERE price > 6300;


-- 6. Gere uma tabela com o id do pedido, o tipo de pagamento e o número de parcelas, somente para produtos com parcelas menores que 1.
SELECT 
	op.order_id ,
	op.payment_type ,
	op.payment_installments 
FROM order_payments op 
WHERE payment_installments < 1


-- 7. Gere uma tabela com o id do pedido, id do cliente, o status do pedido e a data de aprovação , somente para compras aprovadas até dia 10 de Maio de 2016
SELECT 
	o.order_id ,
	o.customer_id ,
	o.order_status ,
	o.order_approved_at 
FROM orders o 
WHERE order_approved_at < '2016-10-05'
















