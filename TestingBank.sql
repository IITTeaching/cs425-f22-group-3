-- Database: banking_system

-- DROP DATABASE IF EXISTS banking_system;
CREATE TABLE Employee(
    ID INT NOT NULL, 
    emp_password VARCHAR(50) NOT NULL,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    salary INT CHECK (salary >= 0),
    emp_type VARCHAR(15) CHECK (emp_type IN ('Manager', "Teller" ,"Loan Specialist")),
    SSN NUMERIC(9, 0),
    address_id INT,
    branch_ID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY(address_id) REFERENCES Address(address_id),
    FOREIGN KEY(branch_ID) REFERENCES Branch(branch_ID)
);

CREATE TABLE Address(
    city VARCHAR(16),
    street VARCHAR(16),
    zip INT,
    country VARCHAR(16),
    state VARCHAR(16),
    address_id INT NOT NULL,
    PRIMARY KEY (address_id)
);

CREATE TABLE Customer(
    ID INT NOT NULL,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    cust_password VARCHAR(50) NOT NULL,
    address_id INT,
    branch_ID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY(address_id) REFERENCES Address(address_id),
    FOREIGN KEY(branch_ID) REFERENCES Branch(branch_ID)
);

CREATE TABLE Branch(
    street VARCHAR(16),
    city VARCHAR(16),
    zip INT,
    country VARCHAR(16),
    state VARCHAR(16),
    branch_ID INT,
    PRIMARY KEY (branch_ID)
);

CREATE TABLE Accounts_And_Owners(
    account_num INT,
    ID INT,
    PRIMARY KEY (account_num, ID),
    FOREIGN KEY (ID) REFERENCES Customer(ID),
    FOREIGN KEY (account_num) REFERENCES Accounts(account_num)
);

CREATE TABLE Accounts(
    account_num INT NOT NULL,
    balance NUMERIC(8, 2) NOT NULL,
    account_name VARCHAR(50),
    PRIMARY KEY (account_num),
    FOREIGN KEY (account_name) REFERENCES Account_Types(account_name)
);

CREATE TABLE Account_Types(
    account_name VARCHAR(50),
    account_type VARCHAR(8) CHECK(account_type IN ("Checking", "Savings")),
    interest_rate FLOAT(10),
    neg_balance BOOLEAN,
    overdraft_fee NUMERIC(8, 2),
    monthly_fee NUMERIC(8, 2),
    PRIMARY KEY (account_name)
);

CREATE TABLE Transactions(
    trans_type VARCHAR(10) CHECK(trans_type IN ("Deposit", "Withdrawal", "Transfer")),
    amount NUMERIC(8, 2),
    description VARCHAR(1000),
    trans_ID INT NOT NULL,
    date DATE,
    account_num INT,
    PRIMARY KEY (trans_ID),
    FOREIGN KEY (account_num) REFERENCES Accounts(account_num)
);
	
	
