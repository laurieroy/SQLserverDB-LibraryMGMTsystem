USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[uspCheckedoutDueToday]    Script Date: 2/12/2018 12:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--NOTE: This procedure returns the book title, borrower's first, last name, address frm the borrower table 
--for books that are due today (by computer time) and checked out per the bookLoan table.
ALTER PROCEDURE [dbo].[uspCheckedoutDueToday]
AS 
SELECT b.book_title, m.borrower_firstName, m.borrower_lastName, m.borrower_address
FROM tbl_borrower m
INNER JOIN tbl_bookLoan bl ON bl.loan_cardNo=m.borrower_cardNo
INNER JOIN tbl_book b ON b.book_id=bl.book_id
WHERE bl.loan_dateIn= CAST(GETDATE() AS DATE) AND
bl.branch_id=1
;
