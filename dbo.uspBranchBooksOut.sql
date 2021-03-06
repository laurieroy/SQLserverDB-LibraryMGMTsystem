USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[uspBranchBooksOut]    Script Date: 2/12/2018 12:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- This procedure returns the a list of the number of books loaned from each branch.
ALTER PROCEDURE [dbo].[uspBranchBooksOut]
AS 
SELECT b.branch_name AS 'Branch Name', COUNT(bl.book_id) AS 'No. of Books Loaned'
FROM tbl_bookLoan bl
inner join tbl_libraryBranch b ON b.branch_id=bl.branch_id
GROUP BY b.branch_name
