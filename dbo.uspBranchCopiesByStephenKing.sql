USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[uspBranchCopiesByStephenKing]    Script Date: 2/12/2018 12:50:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--NOTE: This procedure returns the book title and number count of books at specified branch (Central) 
--authored (or co-authored) by "Stephen King". Nothing is returned if the count is zero.
ALTER PROCEDURE [dbo].[uspBranchCopiesByStephenKing]
AS 
SELECT b.book_title AS 'Title', COUNT(*) AS 'No. of copies'
FROM tbl_author a
INNER JOIN tbl_bookAuthors ba ON ba.author_id=a.author_id
INNER JOIN tbl_book_copies bc ON bc.book_id=ba.book_id
INNER JOIN tbl_book b ON b.book_id=ba.book_id
INNER JOIN tbl_libraryBranch br ON br.branch_id=bc.branch_id
WHERE a.author_id=1
AND br.branch_name='Central'
GROUP BY b.book_title
