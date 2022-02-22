USE mydb;
-- ---- Function to find client details from client's first name ----
DELIMITER //
	CREATE FUNCTION get_client_id
	(
			first_name_param VARCHAR(50)
	)
    RETURNS INT
    DETERMINISTIC READS SQL DATA
    BEGIN 
		DECLARE client_id_var INT;
        
        SELECT client_id INTO client_id_var FROM client WHERE first_name = first_name_param;
        RETURN(client_id_var);
	END //
    
-- Statement that calls get client id stored function---
SELECT client_id,contact_number FROM client WHERE client_id = get_client_id('Mihir');


-- ---- Function to find stock details of particular album ----
DELIMITER //
	CREATE FUNCTION get_album_stock
	(
			album_name_param VARCHAR(50)
	)
    RETURNS INT
    DETERMINISTIC READS SQL DATA
    BEGIN 
		DECLARE album_stock_var INT;
        
        SELECT stock INTO album_stock_var FROM album WHERE album_name = album_name_param;
        RETURN(album_stock_var);
	END //
    
-- Statement that calls get stocks stored function---
SELECT album_price,stock FROM album WHERE stock = get_album_stock('Apne');


-- ---- Function to find stock details of particular track ----
DELIMITER //
	CREATE FUNCTION get_track_stock
	(
			track_name_param VARCHAR(50)
	)
    RETURNS INT 
    DETERMINISTIC READS SQL DATA
    BEGIN 
		DECLARE track_stock_var INT;
        
        SELECT stock INTO track_stock_var FROM tracks WHERE title = track_name_param;
        RETURN(track_stock_var);
	END //
    
-- Statement that calls get stocks stored function---
SELECT price,stock FROM tracks WHERE stock = get_track_stock('hero');
