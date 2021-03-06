USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[uspBookCountBranchesShort]    Script Date: 2/12/2018 12:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[uspBookCountBranchesShort] 
AS
--Note: This procedure is set for The Lost Tribe and returns number at all branches. If zero, it isn't listed.

SELECT lb.branch_name, COUNT(b.book_title) AS 'No. of Copies at each Branch'
FROM tbl_book b
inner join tbl_book_copies bc ON b.book_id=bc.book_id
inner join tbl_libraryBranch lb on lb.branch_id=bc.branch_id
GROUP BY lb.branch_name, b.book_title, bc.branch_id
HAVING b.book_title='The Lost Tribe'
