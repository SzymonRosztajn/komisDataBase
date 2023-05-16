SELECT Marka.Nazwa, AVG(Pojazd.wartosc) as avg_price
FROM Pojazd
JOIN Model ON Pojazd.Model_id = Model.id
JOIN Marka ON Model.Marka_id = Marka.id
GROUP BY Marka.Nazwa;