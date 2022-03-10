-----------------------------TRANSACTION - INSERT A NEW OFFICE AND UPDATE OFFICE PHONE NUMBER---------------------

START TRANSACTION;
	INSERT INTO offices(`officeCode`, `city`, `phone`, `addressLine1`, `country`, `postalCode`, `territory`)
	VALUES (9, 'Bucharest', '+40078644456', 'Splaiul Independentei',  'Romania', '246290', 'EU');
    UPDATE offices SET phone = '+61 2 9264 000' WHERE (`officeCode` = '6');
COMMIT;