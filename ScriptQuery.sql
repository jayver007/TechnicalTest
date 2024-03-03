

SELECT Cars.*,
	   Buyers.Name as 'Buyers Name',
	   Buyers.LastName as 'Buyers Last Name',
	   CarsBuyers.Quote,
	   States.Name,
	   CarBuyerStateHistory.CreatedAt
FROM Cars
INNER JOIN CarsBuyers ON Cars.Id = CarsBuyers.CarId
INNER JOIN Buyers ON CarsBuyers.BuyerId = Buyers.Id
INNER JOIN (SELECT CarBuyerId, MAX(CreatedAt) AS MaxStateCreatedAt 
			FROM CarBuyerStateHistory 
			GROUP BY CarBuyerId
			) AS MaxStates ON CarsBuyers.Id = MaxStates.CarBuyerId
INNER JOIN CarBuyerStateHistory ON CarsBuyers.Id = CarBuyerStateHistory.CarBuyerId 
			AND CarBuyerStateHistory.CreatedAt = MaxStates.MaxStateCreatedAt
INNER JOIN States ON CarBuyerStateHistory.StateId = States.Id
WHERE CarsBuyers.[Current] = 1