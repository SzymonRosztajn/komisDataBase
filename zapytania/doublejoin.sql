SELECT Pracownik.Imie, Pracownik.Nazwisko, Pojazd.Vin, Pojazd.Kolor
FROM Pracownik
JOIN Raport ON Pracownik.Raport_id = Raport.id
JOIN Pojazd ON Raport.Pojazd_id = Pojazd.id
WHERE Raport.Sprawny = 1;