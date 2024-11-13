-- Bank Account Summary: Problem Statement

-- Create a bank account summary by considering the transactions mentioned :

CREATE DATABASE bank_account;
USE bank_account;

-- creating table and inserting data:

CREATE TABLE bank(
    account_number INT,
    account_holder_name VARCHAR(50),
    transaction_date DATE,
    transaction_type varchar(20),
    transaction_amount DECIMAL(10,2)
);


INSERT INTO bank(account_number, account_holder_name, transaction_date, transaction_type, transaction_amount) 
VALUES (1001, 'Ravi Sharma', '2023-07-01', 'Deposit', 5000),
  (1001, 'Ravi Sharma', '2023-07-05', 'Withdrawal', 1000),
  (1001, 'Ravi Sharma', '2023-07-10', 'Deposit', 2000),
  (1002, 'Priya Gupta', '2023-07-02', 'Deposit', 3000),
  (1002, 'Priya Gupta', '2023-07-08', 'Withdrawal', 500),
  (1003, 'Vikram Patel', '2023-07-04', 'Deposit', 10000),
  (1003, 'Vikram Patel', '2023-07-09', 'Withdrawal', 2000);

-- to create a bank account summary using SQL for all the accounts in the database:

  SELECT 
  account_number,
  account_holder_name,
  SUM(CASE WHEN transaction_type ="Deposit" THEN transaction_amount ELSE -transaction_amount END ) AS total_amount
  FROM
  bank
  GROUP BY
  account_number,
  account_holder_name
  ORDER BY 
  account_number;
