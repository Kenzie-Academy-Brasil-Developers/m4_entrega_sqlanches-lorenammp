-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
  p.id,
  p.status,
  p.cliente_id,
  prod.id,
  prod.nome,
  prod.tipo,
  prod.preco,
  prod.pts_de_lealdade
FROM
  pedidos p
  INNER JOIN produtos_pedidos pp ON p.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id;

-- 2)
SELECT
    p.id
FROM
  pedidos p
  INNER JOIN produtos_pedidos pp ON p.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id
  WHERE prod.nome LIKE 'Fritas'

-- 3)
SELECT
  c.nome
FROM
  pedidos p
  INNER JOIN produtos_pedidos pp ON p.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id
  INNER JOIN clientes c ON c.id = p.cliente_id
  WHERE prod.nome LIKE 'Fritas'

-- 4)
SELECT
  SUM(prod.preco)
FROM
  pedidos p
  INNER JOIN produtos_pedidos pp ON p.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id
  INNER JOIN clientes c ON c.id = p.cliente_id
  WHERE c.nome LIKE 'Laura'
  
GROUP BY
  c.nome

-- 5)
SELECT
  prod.nome,
  count(prod.nome)
FROM
  pedidos p
  INNER JOIN produtos_pedidos pp ON p.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id
GROUP BY
  prod.nome