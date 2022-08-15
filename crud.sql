-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes
  (nome, lealdade)
VAlUES
  ('Georgia', 0);


-- 2)
INSERT INTO pedidos
  (status, cliente_id)
VALUES
  ('Recebido', 6);


-- 3)
INSERT INTO produtos_pedidos
  (pedido_id, produto_id)
VALUES
  (6, 1),
  (6, 2),
  (6, 6),
  (6, 8),
  (6, 8);


-- Leitura

-- 1)
SELECT
  p.id,
  c.nome,
  c.lealdade,
  c.id,
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
  INNER JOIN produtos prod ON prod.id = pp.produto_id
  INNER JOIN clientes c ON c.id = p.cliente_id
  WHERE c.nome LIKE 'Georgia'


-- Atualização

-- 1)
UPDATE clientes
  SET lealdade = (
    SELECT
    sum(prod.pts_de_lealdade)
    FROM
      pedidos p
      INNER JOIN produtos_pedidos pp ON p.id = pp.pedido_id
      INNER JOIN produtos prod ON prod.id = pp.produto_id
      INNER JOIN clientes c ON c.id = p.cliente_id
      WHERE c.nome LIKE 'Georgia'
    GROUP BY
      c.nome)
WHERE
  id = 6


-- Deleção

-- 1)
DELETE FROM
  clientes
WHERE
  nome = 'Marcelo'

