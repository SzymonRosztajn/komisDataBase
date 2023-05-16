SELECT Stanowisko, AVG(Pensja) as avg_salary
FROM Pracownik
GROUP BY Stanowisko;