USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[uspBookCount]    Script Date: 2/12/2018 12:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[uspBookCount]
AS
--Note: This procedure is set for The Lost Tribe and Sharpstown branch (ID=1)
SELECT COUNT(b.book_title)
FROM tbl_book b
inner join tbl_book_copies bc ON b.book_id=bc.book_id
WHERE b.book_title='The Lost Tribe'
AND bc.branch_id=1;
