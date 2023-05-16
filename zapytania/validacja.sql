SELECT * FROM Pojazd
WHERE Vin REGEXP '^[A-Z0-9]{17}$' AND
      Kolor REGEXP '[A-Za-z]+' AND
      Pochodzenie REGEXP '[A-Za-z]+' AND
      data_prod >= '2010-01-01' AND
      data_prod <= '2020-12-31' AND
      przebieg >= 0;