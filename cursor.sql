DECLARE 
    @product_name VARCHAR(MAX), 
    @list_price   DECIMAL;

DECLARE cursor_product CURSOR
FOR SELECT 
        product_name, 
        list_price
    FROM 
        production.products;

OPEN cursor_product;

FETCH NEXT FROM cursor_product INTO 
    @product_name, 
    @list_price;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @product_name + CAST(@list_price AS varchar);
        FETCH NEXT FROM cursor_product INTO 
            @product_name, 
            @list_price;
    END;

CLOSE cursor_product;

DEALLOCATE cursor_product;


-- custom cursor Example
DECLARE 
    @fname nvarchar(200), 
    @lname   nvarchar(200);

DECLARE cursor_user CURSOR
FOR SELECT 
        fname, 
        lname
    FROM 
        dbo.site_user;

OPEN cursor_user;

FETCH NEXT FROM cursor_user INTO 
    @fname, 
    @lname;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @fname + '  ' + @lname;
        FETCH NEXT FROM cursor_user INTO 
            @fname, 
            @lname;
    END;

CLOSE cursor_user;

--release cursor
DEALLOCATE cursor_user;

