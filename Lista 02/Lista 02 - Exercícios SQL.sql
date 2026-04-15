USE MASTER;
GO

CREATE DATABASE P7_15;
GO

USE P7_15;
GO

CREATE TABLE CUSTOMER (
    CUS_CODE INT PRIMARY KEY,
    CUS_LNAME VARCHAR(50),
    CUS_FNAME VARCHAR(50),
    CUS_INITIAL CHAR(1),
    CUS_AREACODE CHAR(3),
    CUS_PHONE VARCHAR(15),
    CUS_BALANCE DECIMAL(10,2)
);
GO

CREATE TABLE INVOICE (
    INV_NUMBER INT PRIMARY KEY,
    INV_DATE DATE,
    CUS_CODE INT
);
GO

CREATE TABLE LINE (
    LINE_NUMBER INT,
    LINE_UNITS INT,
    LINE_PRICE DECIMAL(10,2),
    INV_NUMBER INT,
    P_CODE VARCHAR(20),
    PRIMARY KEY (INV_NUMBER, LINE_NUMBER)
);
GO

CREATE TABLE PRODUCT (
    P_CODE VARCHAR(20) PRIMARY KEY,
    P_DESCRIPT VARCHAR(100),
    P_INDATE DATE,
    P_QOH INT,
    P_MIN INT,
    P_PRICE DECIMAL(10,2),
    P_DISCOUNT DECIMAL(4,2),
    V_CODE INT
);
GO

CREATE TABLE VENDOR (
    V_CODE INT PRIMARY KEY,
    V_NAME VARCHAR(100),
    V_CONTACT VARCHAR(50),
    V_AREACODE CHAR(3),
    V_PHONE VARCHAR(15),
    V_STATE CHAR(2),
    V_ORDER CHAR(1)
);
GO

ALTER TABLE INVOICE ADD CONSTRAINT FK_INVOICE_2
    FOREIGN KEY (CUS_CODE)
    REFERENCES CUSTOMER (CUS_CODE);
GO

ALTER TABLE LINE ADD CONSTRAINT FK_LINE_2
    FOREIGN KEY (INV_NUMBER)
    REFERENCES INVOICE (INV_NUMBER);
GO

ALTER TABLE LINE ADD CONSTRAINT FK_LINE_3
    FOREIGN KEY (P_CODE)
    REFERENCES PRODUCT (P_CODE);
GO

ALTER TABLE PRODUCT ADD CONSTRAINT FK_PRODUCT_2
    FOREIGN KEY (V_CODE)
    REFERENCES VENDOR (V_CODE);
GO


INSERT INTO VENDOR (V_CODE, V_NAME, V_CONTACT, V_AREACODE, V_PHONE, V_STATE, V_ORDER) VALUES
(21225, 'Bryson, Inc.', 'Smithson', '615', '223-3234', 'TN', 'Y'),
(21226, 'SuperLoo, Inc.', 'Flushing', '904', '215-8995', 'FL', 'N'),
(21231, 'D&E Supply', 'Singh', '615', '228-3245', 'TN', 'Y'),
(21344, 'Gomez Bros.', 'Ortega', '615', '889-2546', 'KY', 'N'),
(22567, 'Dome Supply', 'Smith', '901', '678-1419', 'GA', 'N'),
(23119, 'Randsets Ltd.', 'Anderson', '901', '678-3998', 'GA', 'Y'),
(24004, 'Brackman Bros.', 'Browning', '615', '228-1410', 'TN', 'N'),
(24288, 'ORDVA, Inc.', 'Hakford', '615', '898-1234', 'TN', 'Y'),
(25443, 'B&K, Inc.', 'Smith', '904', '227-0093', 'FL', 'N'),
(25501, 'Damal Supplies', 'Smythe', '615', '890-3529', 'TN', 'N'),
(25595, 'Rubicon Systems', 'Orton', '904', '456-0092', 'FL', 'Y');
GO

INSERT INTO CUSTOMER (CUS_CODE, CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE, CUS_BALANCE) VALUES
(10010, 'Ramas', 'Alfred', 'A', '615', '844-2573', 0.00),
(10011, 'Dunne', 'Leona', 'K', '713', '894-1238', 0.00),
(10012, 'Smith', 'Kathy', 'W', '615', '894-2285', 345.86),
(10012, 'Smith', 'Kathy', 'W', '615', '894-2285', 345.86),
(10013, 'Olowski', 'Paul', 'F', '615', '894-2180', 536.75),
(10014, 'Orlando', 'Myron', NULL, '615', '222-1672', 0.00),
(10015, 'O''Brian', 'Amy', 'B', '713', '442-3381', 0.00),
(10016, 'Brown', 'James', 'G', '615', '297-1228', 221.19),
(10017, 'Williams', 'George', NULL, '615', '290-2556', 768.93),
(10018, 'Farriss', 'Anne', 'G', '713', '382-7185', 216.55),
(10019, 'Smith', 'Olette', 'K', '615', '297-3809', 0.00);
GO


INSERT INTO PRODUCT (P_CODE, P_DESCRIPT, P_INDATE, P_QOH, P_MIN, P_PRICE, P_DISCOUNT, V_CODE) VALUES
('11QER/31', 'Power painter, 15 psi., 3-nozzle', '2007-11-03', 8, 5, 109.99, 0.00, 25595),
('13-Q2/P2', '7.25-in. pwr. saw blade', '2007-12-13', 32, 15, 14.99, 0.05, 21344),
('14-Q1/L3', '9.00-in. pwr. saw blade', '2007-11-13', 18, 12, 17.49, 0.00, 21344),
('1546-QQ2', 'Hrd. cloth, 1/4-in., 2x50', '2008-01-15', 15, 8, 39.95, 0.00, 23119),
('1558-QW1', 'Hrd. cloth, 1/2-in., 3x50', '2008-01-15', 23, 5, 43.99, 0.00, 23119),
('2232/QTY', 'B&D jigsaw, 12-in. blade', '2007-12-30', 8, 5, 109.92, 0.05, 24288),
('2232/QWE', 'B&D jigsaw, 8-in. blade', '2007-12-24', 6, 5, 99.87, 0.05, 24288),
('2238/QPD', 'B&D cordless drill, 1/2-in.', '2008-01-20', 12, 5, 38.95, 0.05, 25595),
('23109-HB', 'Claw hammer', '2008-01-20', 23, 10, 9.95, 0.10, 21225),
('23114-AA', 'Sledge hammer, 12 lb.', '2008-01-02', 8, 5, 14.40, 0.05, NULL),
('54778-2T', 'Rat-tail file, 1/8-in. fine', '2007-12-15', 43, 20, 4.99, 0.00, 21344),
('89-WRE-Q', 'Hicut chain saw, 16 in.', '2008-02-07', 11, 5, 256.99, 0.05, 24288),
('PVC23DRT', 'PVC pipe, 3.5-in., 8-ft', '2008-02-20', 188, 75, 5.87, 0.00, NULL),
('SM-18277', '1.25-in. metal screw, 25', '2008-03-01', 172, 75, 6.99, 0.00, 21225),
('SW-23116', '2.5-in. wd. screw, 50', '2008-02-24', 237, 100, 8.45, 0.00, 21231),
('WR3/TT3', 'Steel matting, 4''x8''x1/6", 5" mesh', '2008-01-17', 18, 5, 119.95, 0.10, 25595);
GO


INSERT INTO INVOICE (INV_NUMBER, INV_DATE, CUS_CODE) VALUES
(1001, '2008-03-16', 10014),
(1002, '2008-03-16', 10011),
(1003, '2008-03-16', 10012),
(1004, '2008-03-17', 10011),
(1005, '2008-03-17', 10018),
(1006, '2008-03-17', 10014),
(1007, '2008-03-17', 10015),
(1008, '2008-03-17', 10011);
GO


INSERT INTO LINE (LINE_NUMBER, LINE_UNITS, LINE_PRICE, INV_NUMBER, P_CODE) VALUES
(1, 1, 14.99, 1001, '13-Q2/P2'),
(2, 1, 9.95, 1001, '23109-HB'),
(1, 2, 4.99, 1002, '54778-2T'),
(1, 1, 38.95, 1003, '2238/QPD'),
(2, 1, 39.95, 1003, '1546-QQ2'),
(3, 5, 14.99, 1003, '13-Q2/P2'),
(1, 3, 4.99, 1004, '54778-2T'),
(2, 2, 9.95, 1004, '23109-HB'),
(1, 12, 5.87, 1005, 'PVC23DRT'),
(1, 3, 6.99, 1006, 'SM-18277'),
(2, 1, 109.92, 1006, '2232/QTY'),
(3, 1, 9.95, 1006, '23109-HB'),
(4, 1, 256.99, 1006, '89-WRE-Q'),
(1, 2, 14.99, 1007, '13-Q2/P2'),
(2, 1, 4.99, 1007, '54778-2T'),
(1, 5, 5.87, 1008, 'PVC23DRT'),
(2, 3, 119.95, 1008, 'WR3/TT3'),
(3, 1, 9.95, 1008, '23109-HB');
GO

-- 16 - Escreva uma consulta que conte o número de faturas.
SELECT COUNT(DISTINCT INV_NUMBER) AS 'Total de Faturas'
FROM INVOICE;
GO

-- 17 - Escreva uma consulta que conte o número de clientes com saldo superior a US$ 500.
SELECT COUNT(DISTINCT CUS_CODE) AS 'Total de clientes com saldo > US$ 500'
FROM CUSTOMER
WHERE CUS_BALANCE > 500;
GO

-- 18 - Gere uma listagem de todas as compras feitas por clientes, utilizando como orientação o resultado apresentado na Figura P7.16. (Sugestão: Utilize a cláusula ORDER BY para ordenar as linhas resultantes apresentadas na Figura P7.16.)
SELECT 
    I.CUS_CODE, 
    I.INV_NUMBER, 
    P.P_DESCRIPT, 
    I.INV_DATE, 
    L.LINE_UNITS, 
    L.LINE_PRICE
FROM INVOICE I
INNER JOIN LINE L 
    ON I.INV_NUMBER = L.INV_NUMBER
INNER JOIN PRODUCT P 
    ON L.P_CODE = P.P_CODE
ORDER BY 
    I.CUS_CODE, I.INV_NUMBER, P.P_DESCRIPT;
GO

-- 19 - Utilizando como orientação o resultado apresentado na Figura P7.17, gere uma lista de compras de clientes, incluindo os subtotais de cada número de linha de fatura. (Sugestão: Modifique o formato da consulta utilizada para produzir a lista de compras de clientes do Problema 18, exclua a coluna INV_DATE e adicione o atributo derivado (computado) LINE_UNITS * LINE_PRICE para calcular os subtotais.)
SELECT 
    I.CUS_CODE, 
    I.INV_NUMBER, 
    P.P_DESCRIPT, 
    L.LINE_UNITS AS 'Units Bought',
    L.LINE_PRICE AS 'Unit Price',
    (L.LINE_UNITS * L.LINE_PRICE) AS 'Subtotal'
FROM INVOICE I
INNER JOIN LINE L 
    ON I.INV_NUMBER = L.INV_NUMBER
INNER JOIN PRODUCT P 
    ON L.P_CODE = P.P_CODE
ORDER BY 
    I.CUS_CODE, I.INV_NUMBER, P.P_DESCRIPT;
GO

-- 20 - Modifique a consulta utilizada no Problema 19 para produzir o resumo apresentado na Figura P7.18.
SELECT 
    I.CUS_CODE, 
    C.CUS_BALANCE, 
    SUM(L.LINE_UNITS * L.LINE_PRICE) AS 'Total Purchases'
FROM CUSTOMER C
INNER JOIN INVOICE I 
    ON C.CUS_CODE = I.CUS_CODE
INNER JOIN LINE L 
    ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY 
    I.CUS_CODE, C.CUS_BALANCE
ORDER BY 
    I.CUS_CODE;
GO

-- 21 - Modifique a consulta do Problema 20 de modo a incluir o número de compras individuais de produtos feitas por cliente.
SELECT 
    I.CUS_CODE, 
    C.CUS_BALANCE, 
    SUM(L.LINE_UNITS * L.LINE_PRICE) AS 'Total Purchases',
    COUNT(L.LINE_NUMBER) AS 'Number of Purchases'
FROM CUSTOMER C
INNER JOIN INVOICE I 
    ON C.CUS_CODE = I.CUS_CODE
INNER JOIN LINE L 
    ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY 
    I.CUS_CODE, C.CUS_BALANCE
ORDER BY 
    I.CUS_CODE;
GO

-- 22 - Utilize uma consulta para computar a quantia média de compras por produto feita por cliente. (Sugestão: Utilize os resultados do Problema 21 como base desta consulta.) 
SELECT 
    I.CUS_CODE, 
    C.CUS_BALANCE, 
    SUM(L.LINE_UNITS * L.LINE_PRICE) AS 'Total Purchases',
    COUNT(L.LINE_NUMBER) AS 'Number of Purchases',
    CAST(SUM(L.LINE_UNITS * L.LINE_PRICE) / COUNT(L.LINE_NUMBER) AS DECIMAL(10,2)) AS 'Average Purchase Amount'
FROM CUSTOMER C
INNER JOIN INVOICE I 
    ON C.CUS_CODE = I.CUS_CODE
INNER JOIN LINE L 
    ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY 
    I.CUS_CODE, C.CUS_BALANCE
ORDER BY 
    I.CUS_CODE;
GO

-- 23 - Crie uma consulta para produzir as compras totais por fatura, gerando os resultados apresentados na Figura P7.21. 
SELECT 
    INV_NUMBER, 
    SUM(LINE_UNITS * LINE_PRICE) AS 'Invoice Total'
FROM LINE
GROUP BY 
    INV_NUMBER
ORDER BY 
    INV_NUMBER;
GO

-- 24 - Utilize uma consulta para mostrar as faturas e totais de faturas conforme apresentado na Figura P7.22. (Sugestão: Agrupe por CUS_CODE.)
SELECT 
    I.CUS_CODE, 
    I.INV_NUMBER, 
    SUM(L.LINE_UNITS * L.LINE_PRICE) AS 'Invoice Total'
FROM INVOICE I
INNER JOIN LINE L 
    ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY 
    I.CUS_CODE, I.INV_NUMBER
ORDER BY 
    I.CUS_CODE, I.INV_NUMBER;
GO

-- 25 - Escreva uma consulta que produza o número de faturas e as quantias totais de compras por cliente, utilizando como orientação o resultado da Figura P7.23.
SELECT 
    I.CUS_CODE, 
    COUNT(DISTINCT I.INV_NUMBER) AS 'Number of Invoices',
    SUM(L.LINE_UNITS * L.LINE_PRICE) AS 'Total Customer Purchases'
FROM INVOICE I
INNER JOIN LINE L 
    ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY 
    I.CUS_CODE
ORDER BY 
    I.CUS_CODE;
GO

-- 26 - Utilizando os resultados do Problema 25 como base, escreva uma consulta que gere o número total de faturas, o total de todas as faturas, o menor e maior valor de fatura, e o valor médio de todas as faturas.
WITH CustomerTotals AS (
    SELECT 
        CUS_CODE, 
        SUM(L.LINE_UNITS * L.LINE_PRICE) AS TotalPurchases
    FROM INVOICE I
    INNER JOIN LINE L 
        ON I.INV_NUMBER = L.INV_NUMBER
    GROUP BY 
        CUS_CODE
)
SELECT 
    (SELECT COUNT(INV_NUMBER) FROM INVOICE) AS 'Total invoices',
    SUM(TotalPurchases) AS 'Total Sales',
    MIN(TotalPurchases) AS 'Minimum Sale',
    MAX(TotalPurchases) AS 'Largest Sale',
    AVG(TotalPurchases) AS 'Average Sale'
FROM CustomerTotals;
GO

-- 27 - Liste as características dos saldos dos clientes que fizeram compras durante o ciclo atual de faturas ou seja, dos clientes que aparecem na tabela INVOICE.
SELECT DISTINCT 
    C.CUS_CODE, 
    C.CUS_BALANCE
FROM CUSTOMER C
INNER JOIN INVOICE I 
    ON C.CUS_CODE = I.CUS_CODE
ORDER BY 
    C.CUS_CODE;
GO

-- 28 - Utilizando os resultados da consulta criada no Problema 27, forneça um resumo das características dos saldos de clientes, conforme a Figura P7.26.
WITH ActiveCustomers AS (
    SELECT DISTINCT 
        C.CUS_CODE, 
        C.CUS_BALANCE
    FROM CUSTOMER C
    INNER JOIN INVOICE I 
        ON C.CUS_CODE = I.CUS_CODE
)
SELECT 
    MIN(CUS_BALANCE) AS 'Minimum Balance',
    MAX(CUS_BALANCE) AS 'Maximum Balance',
    AVG(CUS_BALANCE) AS 'Average Balance'
FROM ActiveCustomers;
GO

-- 29 - Crie uma consulta que encontre as características de saldos de todos os clientes, incluindo o total de saldos a receber. 
SELECT 
    SUM(CUS_BALANCE) AS 'Total Balances',
    MIN(CUS_BALANCE) AS 'Minimum Balance',
    MAX(CUS_BALANCE) AS 'Maximum Balance',
    AVG(CUS_BALANCE) AS 'Average Balance'
FROM CUSTOMER;
GO

-- 30 - Obtenha a listagem de clientes que não fizeram compras durante o período de faturamento. 
SELECT 
    CUS_CODE, 
    CUS_BALANCE
FROM CUSTOMER
WHERE CUS_CODE NOT IN (SELECT CUS_CODE FROM INVOICE)
ORDER BY 
    CUS_CODE;
GO

-- 31 - Obtenha o resumo dos saldos de todos os clientes que não fizeram compras durante o período atual de faturamento.
SELECT 
    SUM(CUS_BALANCE) AS 'Total Balance',
    MIN(CUS_BALANCE) AS 'Minimum Balance',
    MAX(CUS_BALANCE) AS 'Maximum Balance',
    AVG(CUS_BALANCE) AS 'Average Balance'
FROM CUSTOMER
WHERE CUS_CODE NOT IN (SELECT CUS_CODE FROM INVOICE);
GO

-- 32 - Crie uma consulta para produzir o resumo do valor dos produtos atualmente em estoque. Observe que o valor de cada produto é obtido pela multiplicação das unidades atualmente em estoque pelo preço unitário. Utilize a cláusula ORDER BY para obter a ordem apresentada na Figura P7.30.
SELECT 
    P_DESCRIPT, 
    P_QOH, 
    P_PRICE, 
    (P_QOH * P_PRICE) AS 'Subtotal'
FROM PRODUCT
ORDER BY 
    P_CODE; 
GO

-- 33 - Utilizando os resultados da consulta criada no Problema 32, obtenha o valor total do estoque de produtos. Os resultados são apresentados na Figura P7.31.
SELECT 
    SUM(P_QOH * P_PRICE) AS 'Total Value of Inventory'
FROM PRODUCT;
GO