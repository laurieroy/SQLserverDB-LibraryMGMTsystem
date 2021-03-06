USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[uspBookCountBranches]    Script Date: 2/12/2018 12:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[uspBookCountBranches] 
AS
--Note: This procedure is set for The Lost Tribe and gives returns for all branches
SELECT COUNT(b.book_title) AS 'No. of Copies at Sharpstown Branch'
FROM tbl_book b
inner join tbl_book_copies bc ON b.book_id=bc.book_id
WHERE b.book_title='The Lost Tribe'
AND bc.branch_id=1;
SELECT COUNT(b.book_title) AS 'No. of Copies at Central Branch'
FROM tbl_book b
inner join tbl_book_copies bc ON b.book_id=bc.book_id
WHERE b.book_title='The Lost Tribe'
AND bc.branch_id=2;
SELECT COUNT(b.book_title) AS 'No. of Copies at West Branch'
FROM tbl_book b
inner join tbl_book_copies bc ON b.book_id=bc.book_id
WHERE b.book_title='The Lost Tribe'
AND bc.branch_id=3;
SELECT COUNT(b.book_title) AS 'No. of Copies at South Branch'
FROM tbl_book b
inner join tbl_book_copies bc ON b.book_id=bc.book_id
WHERE b.book_title='The Lost Tribe'
AND bc.branch_id=4;
