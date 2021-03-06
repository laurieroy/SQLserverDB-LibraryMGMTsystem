USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[uspBorrowers5books]    Script Date: 2/12/2018 12:49:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--NOTE: This procedure returns names, addresses, and number of books checked out for all borrowers who have more than
-- five books checked out.
ALTER PROCEDURE [dbo].[uspBorrowers5books]
AS 

SELECT b.borrower_firstName AS 'Borrower''s First Name', b.borrower_lastName AS 'Borrower''s Last Name', b.borrower_address AS 'Borrower''s Address', COUNT(bl.loan_cardNo) AS 'No. of Books'
FROM tbl_borrower b
INNER JOIN tbl_bookLoan bl ON bl.loan_cardNo=b.borrower_cardNo
GROUP BY b.borrower_lastName, b.borrower_firstName, b.borrower_address
HAVING COUNT(bl.loan_cardNo)>5 
	ORDER BY b.borrower_lastName
