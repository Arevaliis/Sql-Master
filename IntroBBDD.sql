/*
1. Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.
*/

SELECT flight_id, flight_no  

FROM flights

WHERE status = 'On Time';

/*
2. Escribe una consulta que extraiga todas las columnas de la tabla bookings 
y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).

Nota: las tablas son públicas de Rusia, por tanto son Rublos sus unidades monetarias
*/

SELECT *

FROM bookings

WHERE total_amount >= 1000000

ORDER BY total_amount desc;

/*
3. Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data).
*/

SELECT a.*, b.status

FROM aircrafts_data AS a

INNER JOIN flights AS b
	ON a.aircraft_code = b.aircraft_code 

WHERE b.status = 'Scheduled';

/*
4. Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. (Código Modelo Avión = 733)
*/

SELECT b.flight_id, a.aircraft_code 

FROM aircrafts_data AS a

INNER JOIN flights AS b
	ON a.aircraft_code = b.aircraft_code 

WHERE a.aircraft_code = '733';

/*
5. Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.
*/

SELECT *

FROM tickets AS a 

INNER JOIN ticket_flights AS b
	ON a.ticket_no = b.ticket_no

WHERE passenger_name 
	LIKE 'IRINA%';