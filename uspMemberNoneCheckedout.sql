USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[uspMemberNoneCheckedout]    Script Date: 2/12/2018 12:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--NOTE: This procedure returns the first and last names of borrowers who do not have any books 
--checked out, per the bookLoan table.
ALTER PROCEDURE [dbo].[uspMemberNoneCheckedout] 
AS
SELECT borrower_firstName AS 'First Name', borrower_lastName AS 'Last Name'
FROM tbl_borrower m 
LEFT JOIN tbl_bookLoan bl ON bl.loan_cardNo=m.borrower_cardNo
WHERE bl.loan_id is NULL