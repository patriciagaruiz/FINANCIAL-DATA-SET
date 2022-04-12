SELECT 
	* 
FROM 
	account

SELECT 
	* 
FROM 
	client

SELECT 
	* 
FROM 
	disp

SELECT 
	* 
FROM 
	bank.order

-- ##############################################################################
-- *********** LOOKING FOR BAD ACCOUNTS ************
-- ##############################################################################

-- **** ACCOUNTS - LOAN NOT PAYED' *****

SELECT 
		loan.account_id AS account_id,  
        loan.loan_id AS loan_id,
        loan.date AS date_loan,
        loan.amount AS amount_loan,
        loan.duration AS duaration_loan,
        loan.payments AS payments_loan,
        loan.status,
	(CASE WHEN loan.status = 'A' THEN 'CONTRACT FINISHED - NO PROBLEMS'
                 WHEN loan.status = 'B' THEN 'CONTRACT FINISHED - LOAN NOT PAYED'
                 WHEN loan.status = 'C' THEN 'RUNNING CONTRACT - OK SO FAR'
                 ELSE 'RUNNING CONTRACT - CLIENT IN DEBT' END) as desc_status
FROM	
	loan 
WHERE 	
	loan.status = 'B'
ORDER BY 
loan.account_id


-- 31 DISTINCT ACCOUNTS
SELECT 
	DISTINCT loan.account_id
FROM	
	loan 
WHERE 	
	loan.status = 'B'

-- TOTAL LOAN € 4.362.348 NOT PAYED
SELECT 
	SUM(loan.amount)
FROM	
	loan 
WHERE 	
	loan.status = 'B'
    
-- CONTRACTS CLOSED - TOTAL LOAN € 22.965.564
SELECT 
	SUM(loan.amount)
FROM	
	loan 
WHERE 	
	loan.status IN ('A','B')

-- ##### LOAN NOT PAID X ACCOUNT_TYPE
-- REGULAR	18
-- GOOD	5
-- LOW_SCORE	3
-- VIP	5

SELECT 	
	account_type.type_ac,
	COUNT(loan.loan_id)
FROM	
	loan, 
	account_type
WHERE 	
	loan.status = 'B'
	AND	 account_type.account = loan.account_id
GROUP BY 
	account_type.type_ac
 
SELECT * FROM account_type

-- TOTAL LOAN € 11.217.804 CLIENT IN DEBT
SELECT 
	SUM(loan.amount)
FROM	
	loan 
WHERE
 	loan.status = 'D'

-- CONTRACTS RUNNING - TOTAL LOAN € 80.296.176
SELECT 
	SUM(loan.amount)
FROM	
	loan 
WHERE 	
	loan.status IN ('C','D')

-- **** ACCOUNTS - LOAN NOT PAYED' X CREDIT CARD *****

SELECT 
		loan.account_id AS account_id,  
        loan.loan_id AS loan_id,
        card.card_id AS card_id,
        card.type AS type_card,
        loan.date AS date_loan,
        loan.amount AS amount_loan,
        loan.duration AS duration_loan,
        loan.payments AS payments_loan,
        loan.status
FROM	loan, disp, card
WHERE 	loan.status = 'B' AND disp.account_id = loan.account_id AND card.disp_id = disp.disp_id
ORDER BY loan.account_id

-- Accounts x Clients

SELECT 
		disp.client_id AS client_id,
        disp.type AS type_of_disposition,
		loan.account_id AS account_id,  
        loan.loan_id AS loan_id,
        loan.date AS date_loan,
        loan.amount AS amount_loan,
        loan.duration AS duration_loan,
        loan.payments AS payments_loan,
        loan.status
FROM	
		loan, disp
WHERE 	
		loan.status = 'B' AND disp.account_id = loan.account_id 
ORDER BY 
		loan.account_id, disp.client_id


-- COUNT NUMBER OF CLIENTS A AND ACCOUNTS

SELECT COUNT(*) FROM bank.account

SELECT COUNT(*) FROM bank.client

-- **** ACCOUNTS - LOAN NOT PAYED' X DISTRICT *****

SELECT 
		loan.account_id AS account_id,  
        loan.loan_id AS loan_id,
        loan.amount AS amount_loan,
        loan.duration AS duration_loan,
        loan.payments AS payments_loan,
        loan.status AS status_loan,
		district.a3 AS region,
        district.a2 AS district_name,
        district.a11 AS salary_avg,
        district.a13 AS unemployment_96,
        district.a10 AS ratio_urban
FROM	
		loan, 
        bank.account, 
        district
WHERE 	
		loan.status = 'B' AND 
        bank.account.account_id = loan.account_id AND 
        bank.account.district_id = district.a1
ORDER BY 
		district.a3, 
        district.a2, 
        loan.account_id

-- **** ACCOUNTS - LOAN NOT PAYED' X DISTRICT GROUP BY *****

SELECT 
        district.a3 AS region,
        COUNT(loan.loan_id),
		SUM(loan.amount),
        AVG(loan.payments),
		AVG(district.a11) AS salary_avg
FROM	
		loan, 
        bank.account, district
WHERE 	
		loan.status = 'B' AND 
        bank.account.account_id = loan.account_id AND bank.account.district_id = district.a1
GROUP BY 
		district.a3
ORDER BY 
		district.a3 
        
-- % PAYMENTS_LOAN X SALARY_AVG

SELECT 
		district.a3 AS region,
        district.a2 AS district_name,
		loan.account_id AS account_id,  
        loan.loan_id AS loan_id,
        loan.amount AS amount_loan,
        loan.duration AS duration_loan,
        loan.payments AS payments_loan,
		district.a11 AS salary_avg,
        ROUND((loan.payments/district.a11),2) AS ratio_loan_avg_salary,
        loan.status AS status_loan,
		district.a13 AS unemployment_96,
        district.a10 AS ratio_urban
FROM	
		loan, 
		bank.account, 
        district
WHERE 	
		loan.status = 'B' AND 
        bank.account.account_id = loan.account_id AND
        bank.account.district_id = district.a1
ORDER BY 
		district.a3, 
        district.a2, 
        ratio_loan_avg_salary DESC

-- % PAYMENTS_LOAN NOT PAYED X SALARY_AVG -- ABOVE 50%

SELECT 
        COUNT(loan.loan_id) 
FROM	
		loan, 
        bank.account, 
        district
WHERE 	
		loan.status = 'B' AND 
        bank.account.account_id = loan.account_id AND
		bank.account.district_id = district.a1 AND 
        (loan.payments/district.a11) > 0.5

-- % PAYMENTS_LOAN X SALARY_AVG -- ABOVE 50% -- RUNNING CONTRACT
SELECT 
		loan.status,
        COUNT(loan.loan_id),
        SUM(loan.amount)
FROM	
		loan, 
        bank.account, 
        district
WHERE 	
		loan.status IN ('C','D') AND 
        bank.account.account_id = loan.account_id AND
		bank.account.district_id = district.a1 AND 
        (loan.payments/district.a11) > 0.5
GROUP BY 
		loan.status
ORDER BY 
		loan.status


-- ##############################################################################
-- *********** LOOKING FOR GOOD ACCOUNTS ************
-- ##############################################################################


-- ***** LOOKING FOR BALANCE AT TRANSACTIONS TABLE *****


-- ######## CREATE TABLE TO STORE ACCOUNTS BY BALANCE
-- DROP TABLE account_type
-- CREATE TABLE account_type_backup AS select * from account_type

CREATE TABLE account_type AS

SELECT
	trans.account_id AS account,
    trans.date AS date_trans,
	trans.balance AS balance,
    trans.trans_id AS trans_id,
    (CASE WHEN balance < 0 THEN 'LOW_SCORE' 
		  WHEN balance < 40000 THEN 'REGULAR'
          WHEN balance < 80000 THEN 'GOOD'
          ELSE 'VIP' END) AS type_ac
FROM
	TRANS
JOIN
	(SELECT
		trans.account_id AS account,
		MAX(trans.date) AS date
	FROM
		trans
	GROUP BY trans.account_id) AS aux
ON 
	trans.date = aux.date AND 
    trans.account_id = aux.account
ORDER BY 
	account, 
    date_trans, 
    trans_id


-- CHECK PREVIOUS SQL 
SELECT
	trans.account_id AS account,
    MAX(trans.date) AS date
FROM
	trans
WHERE	
	trans.account_id = 1032
GROUP BY 
	trans.account_id

SELECT
	trans.account_id AS account,
    trans.date AS date,
    trans.trans_id AS trans,
	trans.balance AS balance
FROM
	trans
WHERE	
	trans.account_id = 1032 AND 
    trans.date = 981231

SELECT MAX(balance) FROM trans 

SELECT * FROM account_type WHERE balance < 0


-- VERIFY VIP ACCOUNTS HAVE GOLD CREDIT CARD

SELECT DISTINCT account FROM account_type WHERE type_ac = 'VIP'
SELECT DISTINCT account FROM account_type WHERE type_ac = 'GOOD'
SELECT DISTINCT account FROM account_type WHERE type_ac = 'REGULAR'
SELECT DISTINCT account FROM account_type WHERE type_ac = 'LOW_SCORE'

-- ***** DISCOVER ACCOUNTS WITH GOLD CREDIT CARD
-- VIP / GOOD / REGULAR / LOW_SCORE

SELECT 
		disp.client_id, 
        disp.account_id, 
        card.card_id, 
        card.type, 
        account_type.type_ac
FROM	
		disp, 
        card, 
        account_type
WHERE 	
		account_type.account = disp.disp_id AND 
        disp.disp_id = card.disp_id AND 
        card.type = 'classic' AND 
        account_type.type_ac = 'VIP'
ORDER BY 
		disp.client_id, 
        disp.account_id
        
-- ***** DISCOVER CREDIT CARD BY TYPE OF ACCOUNT
-- VIP / GOOD / REGULAR / LOW_SCORE

SELECT 
		card.type, 
        COUNT(disp.client_id)
FROM	
		disp, 
        card, 
        account_type
WHERE 	
		account_type.account = disp.disp_id AND 
        disp.disp_id = card.disp_id AND 
        account_type.type_ac = 'LOW_SCORE'
GROUP BY 
		card.type
ORDER BY 
		disp.client_id, 
        disp.account_id


-- ***** DISCOVER VIP ACCOUNTS WITH GOLD CREDIT CARD
SELECT 
		disp.client_id, 
        disp.account_id, 
        card.card_id, 
        card.type, 
        account_type.type_ac
FROM	
		disp, 
		card, 
        account_type
WHERE 	
		account_type.account = disp.disp_id AND 
        disp.disp_id = card.disp_id AND 
        card.type = 'classic' AND 
        account_type.type_ac = 'VIP'
ORDER BY 
		disp.client_id, 
        disp.account_id

-- **** CREDIT CARD BY CLIENT (VIP / GOOD / REGULAR / LOW_SCORE)

SELECT 
		card.type, 
        COUNT(disp.client_id)
FROM	
		disp, 
        card, 
        account_type
WHERE 	
		account_type.account = disp.disp_id AND 
        disp.disp_id = card.disp_id AND 
        account_type.type_ac = 'GOOD'
GROUP BY 
		card.type
ORDER BY 
		disp.client_id, 
        disp.account_id

-- CLASSIC: 659 / JUNIOR: 145 / GOLD: 88
--
SELECT 
		type, 
        COUNT(card_id) 
FROM 
		card
GROUP BY 
		type

---

SELECT COUNT(*) FROM card


-- ***** DISCOVER ACCOUNTS WITH GOLD / CLASSIC / JUNIOR CREDIT CARD

SELECT 
		disp.client_id, 
		disp.account_id, 
		card.card_id, 
		card.type
FROM	
		disp, 
		card
WHERE 	
		disp.disp_id = card.disp_id AND 
		card.type = 'Gold'  
ORDER BY 
		disp.client_id, 
		disp.account_id
--- 
SELECT 
		disp.client_id, 
        COUNT(disp.account_id)
FROM	
		disp, 
		card
WHERE 	
		disp.disp_id = card.disp_id AND 
        card.type = 'Gold'  
GROUP BY 
		disp.client_id
ORDER BY 
		disp.client_id, 
        disp.account_id



-- ***** DEMOGRAPHIC DATA FOR ACCOUNTS WITH GOLD CREDIT CARD

SELECT * FROM disp

SELECT 	
		disp.account_id AS account_id, 
		card.card_id AS credit_card, 
        card.type AS type_ccard, 
        disp.client_id AS client_id,
        disp.type AS type_disposition,
        client.district_id AS district_id, 
        district.a3 AS region, 
        district.a2 AS district_name, 
        district.a11 AS avg_salary
FROM	
		disp, 
        card, 
        client, 
        district
WHERE 
		disp.disp_id = card.disp_id AND 
        card.type = 'Gold' AND 
        client.client_id = disp.client_id AND 
        district.a1 = client.district_id
ORDER BY 
		district.a3, 
        district.a2
        
-- ***** REGION / DISTRICT  WITH ACCOUNTS WITH GOLD CREDIT CARD

SELECT  
		district.a3 AS region, 
        district.a2 AS district_name, 
        COUNT(district.a1) AS count_account, 
        AVG(district.a11) AS avg_salary
FROM	
		disp, 
        card, 
        client, 
        district
WHERE 
		disp.disp_id = card.disp_id AND 
        card.type = 'Gold' AND 
        client.client_id = disp.client_id AND 
        district.a1 = client.district_id
GROUP BY 
		district.a3, 
        district.a2
ORDER BY 
		district.a3, 
        district.a2


-- **** SUM ACCOUNTS WITH GOLD CREDIT CARD AND LOAN

SELECT 
		loan.status, 
			(CASE WHEN loan.status = 'A' THEN 'CONTRACT FINISHED - NO PROBLEMS'
                  WHEN loan.status = 'B' THEN 'CONTRACT FINISHED - LOAN NOT PAYED'
                  WHEN loan.status = 'C' THEN 'RUNNING CONTRACT - OK SO FAR'
                  ELSE 'RUNNING CONTRACT - CLIENT IN DEBT' END) as desc_status,
		COUNT(loan.status)
FROM	
		disp, 
        card, 
        loan
WHERE 
		disp.disp_id = card.disp_id AND 
        card.type = 'Gold' AND 
        loan.account_id = disp.account_id
GROUP BY 
		loan.status
/*
A	CONTRACT FINISHED - NO PROBLEMS	8
C	RUNNING CONTRACT - OK SO FAR	7
D	RUNNING CONTRACT - CLIENT IN DEBT	1
*/

-- **** ACCOUNTS WITH GOLD CREDIT CARD X PERMANENT ORDER
SELECT 
		* 
FROM 
		bank.order

-- ----

SELECT 
		disp.account_id, 
        order.order_id, 
			(CASE WHEN order.k_symbol = 'POJISTNE' THEN 'INSURRANCE PAYMENT'
                  WHEN order.k_symbol = 'SIPO' THEN 'HOUSEHOLD PAYMENT'
                  WHEN order.k_symbol = 'LEASING' THEN 'LEASING'
                  ELSE 'LOAN PAYMENT' END) as type_payment,
		order.amount
FROM	
		disp, 
        card, 
        bank.order
WHERE 
		disp.disp_id = card.disp_id AND 
        card.type = 'Gold' AND 
        order.account_id = disp.account_id
ORDER BY 
		disp.account_id


SELECT 
		COUNT(DISTINCT disp.account_id)
FROM	disp, 
		card, 
		bank.order
WHERE 
		disp.disp_id = card.disp_id AND 
        card.type = 'Gold' AND 
        order.account_id = disp.account_id
ORDER BY 
		disp.account_id

-- **** Where are most of the customers located (district)?
-- ***** DEMOGRAPHIC DATA FOR ACCOUNTS WITH GOLD CREDIT CARD

SELECT 
		district.a2 AS district_name,
		COUNT(disp.account_id) AS count_account
FROM
		disp,
		client,
		district
WHERE
		client.client_id = disp.client_id AND 
        district.a1 = client.district_id
GROUP BY 
		district.a2
ORDER BY 
		count_account DESC
        

/* VERIFICAÇÃO DOS CLIENTES QUE TIVERAM MAIS DE UMA TRANSAÇÃO NA ÚLTIMA DATA DE MOVIMENTAÇÃO NA 
TABELA DE TRANSAÇÃO

SELECT * FROM account_type WHERE account = 19
SELECT * FROM account_type WHERE account = 1106
SELECT * FROM account_type WHERE account = 1888
SELECT * FROM account_type WHERE account = 3273
SELECT * FROM account_type WHERE account = 4081
SELECT * FROM account_type WHERE account = 5066
SELECT * FROM account_type WHERE account = 5927
SELECT * FROM account_type WHERE account = 6118
SELECT * FROM account_type WHERE account = 11021
SELECT * FROM account_type WHERE account = 10266
SELECT * FROM account_type WHERE account = 10131
SELECT * FROM account_type WHERE account =9199
SELECT * FROM account_type WHERE account =8566
SELECT * FROM account_type WHERE account =7418

*** EXCLUSÃO DAS TRANSAÇÕES ANTERIORES À ÚLTIMA TRANSAÇÃO DO DIA
DELETE FROM account_type WHERE account = 19 AND trans_id = 3445050;
DELETE FROM account_type WHERE account = 1106 AND trans_id = 3446283;
DELETE FROM account_type WHERE account = 1888 AND trans_id = 3592775;
DELETE FROM account_type WHERE account = 1888 AND trans_id = 3592776;
DELETE FROM account_type WHERE account = 1888 AND trans_id = 3681560;
DELETE FROM account_type WHERE account = 3273 AND trans_id = 3448968;
DELETE FROM account_type WHERE account = 3273 AND trans_id =3448969;
DELETE FROM account_type WHERE account = 3273 AND trans_id =3681734;
DELETE FROM account_type WHERE account = 4081 AND trans_id =3450098;
DELETE FROM account_type WHERE account = 5066 AND trans_id = 3668637;
DELETE FROM account_type WHERE account = 5927 AND trans_id =3452973;
DELETE FROM account_type WHERE account = 6118 AND trans_id =3453322;
DELETE FROM account_type WHERE account = 11021 AND trans_id =3458725;
DELETE FROM account_type WHERE account = 10266 AND trans_id =3094954;
DELETE FROM account_type WHERE account = 10266 AND trans_id =3457858;
DELETE FROM account_type WHERE account = 10266 AND trans_id =3519827;
DELETE FROM account_type WHERE account = 10131 AND trans_id =3457565;
DELETE FROM account_type WHERE account = 9199 AND trans_id =3456441;
DELETE FROM account_type WHERE account = 8566 AND trans_id =3476096;
DELETE FROM account_type WHERE account = 7418 AND trans_id =3454543;
DELETE FROM account_type WHERE account = 7418 AND trans_id =3488187;

