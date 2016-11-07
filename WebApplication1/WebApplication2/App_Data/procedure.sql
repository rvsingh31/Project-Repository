DECLARE @curr TABLE(id int)

INSERT @curr exec( 'select p_id from package_details where CONVERT(datetime,expiry_date,103) < CONVERT(datetime, GETDATE(), 103)')

delete from package_details where p_id in (select * from @curr)

