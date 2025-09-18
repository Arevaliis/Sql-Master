/*
1. Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.
*/

SELECT flight_id, flight_no, status  

FROM flights

WHERE status = 'On Time';

/*
2. Escribe una consulta que extraiga todas las columnas de la tabla bookings 
y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).

Nota: las tablas son públicas de Rusia, por tanto son Rublos sus unidades monetarias
*/

SELECT *

FROM bookings

WHERE total_amount > 1000000

ORDER BY total_amount desc;

/*
3. Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data).
*/

SELECT * FROM aircrafts_data;

/*
4. Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. (Código Modelo Avión = 733)
*/

SELECT flight_id, aircraft_code 

FROM flights 

WHERE aircraft_code = '733';

/*
5. Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.
*/

SELECT a.passenger_name, b.*

FROM tickets AS a 

INNER JOIN ticket_flights AS b
	ON a.ticket_no = b.ticket_no

WHERE passenger_name LIKE 'IRINA%';

/*
6. Mostrar las ciudades con más de un aeropuerto.
*/

SELECT city, COUNT(*) as total

FROM airports_data

GROUP BY city

HAVING COUNT(*) > 1

ORDER BY total DESC;

/*
7. Mostrar el número de vuelos por modelo de avión.
*/

SELECT aircraft_code, COUNT(*) AS total_vuelos

FROM flights

GROUP BY aircraft_code

ORDER BY total_vuelos DESC;


/*
8. Reservas con más de un billete (varios pasajeros).
*/

SELECT book_ref, COUNT (*) AS total

FROM tickets

GROUP BY book_ref

HAVING COUNT(*) > 1

ORDER BY total DESC;

/*
9. Vuelos con retraso de salida superior a una hora
*/

SELECT *, actual_departure - scheduled_departure as tiempo_total_retraso

FROM flights

WHERE (actual_departure - scheduled_departure) > '01:00:00'

ORDER BY tiempo_total_retraso DESC;