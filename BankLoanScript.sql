

-- (1) Find Total Number of Loan application
SELECT COUNT(id) Total_Loan_Aplication FROM BankLoanData;


-- (2) Find Month to Date Total Number of Loan application
SELECT COUNT(id) MTD_Total_Loan_Aplication
FROM BankLoanData
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;


-- (3) Find Previous Month to Date Total Number of Loan application
SELECT COUNT(id) MTD_Total_Loan_Aplication
FROM BankLoanData
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


-- (4) Find Total Funded Amount
SELECT SUM(Loan_amount) Total_Funded_Amount from BankLoanData;



-- (5) Find MTD Total Funded Amount
SELECT SUM(Loan_amount) MTD_Total_Funded_Amount 
FROM BankLoanData
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021


-- (6) Find PMTD Total Funded Amount
SELECT SUM(Loan_amount) PMTD_Total_Funded_Amount 
FROM BankLoanData
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


-- (7) Find Total Amount Received
SELECT SUM(total_payment) as Total_Received_Amount from BankLoanData


-- (8) Find MTD Total Amount Received
SELECT SUM(total_payment) as MTD_Total_Received_Amount from BankLoanData
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021


-- (9) Find PMTD Total Amount Received
SELECT SUM(total_payment) as PMTD_Total_Received_Amount from BankLoanData
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


-- (10) Find the Average Interest Rate
SELECT Round(AVG(int_rate),6) * 100 Avg_Interest_Rate from BankLoanData


-- (11) Find the MTD Average Interest Rate
SELECT Round(AVG(int_rate),6) * 100 MTD_Avg_Interest_Rate from BankLoanData
WHERE MONTH(issue_date) = 12 And YEAR(issue_date) = 2021


-- (12) Find the PMTD Average Interest Rate
SELECT Round(AVG(int_rate),6) * 100 PMTD_Avg_Interest_Rate from BankLoanData
WHERE MONTH(issue_date) = 11 And YEAR(issue_date) = 2021


-- (13) Find Average Debt-to-Income Ratio (DTI)
SELECT Round(AVG(DTI),4) * 100 Avg_DTI from BankLoanData


-- (14) Find MTD Average Debt-to-Income Ratio (DTI)
SELECT Round(AVG(DTI),4) * 100 MTD_Avg_DTI from BankLoanData
Where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021


-- (15) Find PMTD Average Debt-to-Income Ratio (DTI)
SELECT Round(AVG(DTI),4) * 100 PMTD_Avg_DTI from BankLoanData
Where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


-- (16) Find Good Loan Application Percentage
SELECT
COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current'
	  Then id 
	  END) *100 / COUNT(id) as Good_Loan_Percentage
From BankLoanData


-- (17) Find Good Loan Applications
SELECT COUNT(id) Good_Loan_Applications From BankLoanData
Where loan_status = 'Fully Paid' OR loan_status = 'Current'


-- (18) Find Good Loan Funded Amount
SELECT SUM(loan_amount) Good_Loan_Funded_Amount FROM BankLoanData
Where loan_status = 'Fully Paid' OR loan_status = 'Current'


-- (19)Find Good Loan Total Received Amount
SELECT SUM(total_payment) Good_Loan_Received_Amount FROM BankLoanData
Where loan_status = 'Fully Paid' OR loan_status = 'Current'


-- (20) Find Bad Loan Application Percentage
SELECT COUNT(CASE WHEN loan_Status = 'Charged off' 
		then id END) * 100
		/ COUNT(id) Bad_Loan_Percentage
from BankLoanData


-- (21) Find Bad Loan Applications
SELECT COUNT(id) Bad_Loan_Applications from BankLoanData
WHERE loan_status = 'Charged off'


-- (22) Find the Bad Loan Funded Amount
SELECT SUM(loan_amount) Bad_Loan_Funded_Amount from BankLoanData
WHERE loan_status = 'Charged off'


-- (23)Find the Bad Loan Amount Received
SELECT SUM(total_payment) Bad_Loan_Received_Amount from BankLoanData
WHERE loan_status = 'Charged off'


-- (24) Loan Status Grid view
Select 
loan_status,
COUNT(id) Total_Loan_Application,
Sum(loan_amount) Total_Funded_Amount,
Sum(total_payment) Total_Received_Amount,
Round(Avg(int_rate * 100),2) Interest_Rate,
Round(Avg(dti * 100),2) DTI  
from BankLoanData
Group by loan_status


-- (25) Comparison between Month to Date Amount funded 
-- and Month to Date Amount Received by Loan Status
Select 
loan_status,
SUM(loan_amount) MTD_Funded_Amount,
Sum(total_payment) MTD_Received_Amount 
from  BankLoanData
Where Month(issue_date) = 12 AND YEAR(issue_date) = 2021
Group by loan_status


-- (26)Find Monthly Trend by Issue Date
Select
MONTH(issue_date) Month_Number,
DATENAME(Month, issue_date) Month_Name,
COUNT(id) Total_Loan_Application,
SUM(loan_amount) Total_Funded_Amount,
SUM(total_payment) Total_Received_Amount 
from BankLoanData
Group by MONTH(issue_date), DATENAME(Month, issue_date) 
Order By MONTH(issue_date)


-- (27)Regional Analysis by State
Select address_state,
COUNT(id) Total_Loan_Application,
SUM(loan_amount) Total_Funded_Amount,
SUM(total_payment) Total_Received_Amount 
from BankLoanData
Group by address_state
Order by SUM(loan_amount) DESC
-- OR You can Order by Count(id)


-- (28)Loan Term Analysis
Select term,
COUNT(id) Total_Loan_Application,
SUM(loan_amount) Total_Funded_Amount,
SUM(total_payment) Total_Received_Amount 
from BankLoanData
Group by term
Order by term 


-- (29) Employee Length Analysis
Select emp_length,
COUNT(id) Total_Loan_Application,
SUM(loan_amount) Total_Funded_Amount,
SUM(total_payment) Total_Received_Amount 
from BankLoanData
Group by emp_length
Order by COUNT(id) DESC


-- (30) Loan Purpose breakdown
Select purpose,
COUNT(id) Total_Loan_Application,
SUM(loan_amount) Total_Funded_Amount,
SUM(total_payment) Total_Received_Amount 
from BankLoanData
Group by purpose
Order by COUNT(id) DESC


-- (31) Home OwnerShip Analysis
Select home_ownership,
COUNT(id) Total_Loan_Application,
SUM(loan_amount) Total_Funded_Amount,
SUM(total_payment) Total_Received_Amount 
from BankLoanData
Group by home_ownership
Order by COUNT(id) DESC

