CREATE PROCEDURE delete_old_vehicles(IN age_threshold INT)
BEGIN
DELETE FROM Pojazd
WHERE Data_prod < DATE_SUB(NOW(), INTERVAL age_threshold YEAR);
END;