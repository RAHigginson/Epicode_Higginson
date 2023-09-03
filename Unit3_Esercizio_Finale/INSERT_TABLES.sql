USE prenotazione_volo;

INSERT INTO biglietto (
	Ticket_number,
    Prezzo,
    Numero_volo,
	Numero_passaporto,
	Aeroporto_partenza,
	Aeroporto_arrivo,
    Codice_classe
)

VALUES  ('00123412', 399.90, 'BR00096', 'EX00123412', 'MXP', 'TPE', 'E'),
		('01879034', 1800.90, 'EK00205', '93851111', 'MXP', 'JFK', 'B'),
		('11034358', 19.90, 'EC03545', '28981250', 'MXP', 'CTA', 'E'),
		('76108345', 50.50, 'TP00823', 'D8712344L', 'MXP', 'LIS', 'FC'),
		('94623111', 200.10, 'SV00210', '9912E4352D', 'MXP', 'JED', 'PE'),
        ('788122974', 199.90, 'FR01015', 'PT91241111', 'MXP', 'PMO', 'E'),
		('124888811', 20.90, 'U208306', '129997335', 'MXP', 'LGW', 'E'),
		('9111175E', 49.90, 'EC03831', 'L998543361', 'MXP', 'LTN', 'E'),
		('00012315', 200.50, 'BA00567', 'K090013241', 'MXP', 'LHR', 'PE'),
		('092124555', 700.10, 'EK00092', 'TR99912014', 'MXP', 'DXB', 'B')
;

INSERT INTO passeggero (
	Numero_passaporto,
	Cittadinanza,
	Cognome,
    Nome,
    Email
)

VALUES  ('EX00123412', 'Italiana', 'Rossi', 'Marco', 'rossi_marco@gmail.com'),
		('93851111', 'Americana', 'Jhon', 'Smith', 'Jhon_smith@aol.com'),
        ('28981250', 'Italiana', 'Colombo', 'Mario', 'mario_colombo@libero.it'),
        ('D8712344L', 'Brasiliana', 'Araujo', 'Joao', 'joaodragao@gmail.com'),
        ('9912E4352D', 'Saudi', 'Amari', 'Ali', 'aliali@gmail.com'),
        ('PT91241111', 'Messicana', 'Rodriguez', 'Lorena', 'Lorerodriguez@gmail.com'),
        ('129997335', 'Britanica', 'Smith', 'Mark', 'Masmith@yahoo.com'),
        ('L998543361', 'Australiana', 'White', 'Walter', 'heisenberg@gmail.com'),
        ('K090013241', 'Indiana', 'Kumar', 'Vishnu', 'Vishnuindia@yahoo.com'),
        ('TR99912014', 'Egiziana', 'Mohamed', 'Ahmed', 'Mohamedahmed1523@gmail.com')
;

INSERT INTO volo (
	Numero_volo,
    Compagnia_area_IATA,
	Orario_partenza,
	Orario_arrivo,
    Durata_minuti
)

VALUES  ('BR00096', 'BR', '2023-09-03 10:20:00', '2023-09-04 03:20:00', 600),
		('EK00205', 'EK', '2023-09-03 10:30:00', '2023-09-03 11:00:00', 450),
        ('EC03545', 'EC', '2023-09-03 11:00:00', '2023-09-03 12:45:00', 105),
        ('TP00823', 'TP', '2023-09-03 11:10:00', '2023-09-03 13:00:00', 190),
        ('SV00210', 'SV', '2023-09-03 11:25:00', '2023-09-03 18:25:00', 300),
        ('FR01015', 'FR', '2023-09-03 11:40:00', '2023-09-03 13:50:00', 130),
        ('U208306', 'U2', '2023-09-03 12:00:00', '2023-09-03 14:10:00', 190),
        ('EC03831', 'EC', '2023-09-03 12:20:00', '2023-09-03 14:35:00', 195),
        ('BA00567', 'BA', '2023-09-03 13:00:00', '2023-09-03 15:00:00', 180),
        ('EK00092', 'EK', '2023-09-03 13:10:00', '2023-09-03 21:20:00', 370)
;

INSERT INTO aeroporto (
	Codice_IATA,
	Nome,
	Paese,
    Città
)

VALUES  ('MXP', 'Milan Malpensa Airport', 'Italia', 'Milano'),
		('TPE', 'Taiwan Taoyuan International Airport', 'Taipei', 'Taiwan'),
		('JFK', 'John F. Kennedy Airport', 'USA', 'New York City'),
		('CTA', 'Catania Internation Airport', 'Italia', 'Catania'),
        ('LIS', 'Humberto Delgado Airport', 'Portugal', 'Lisboa'),
        ('JED', 'King Abdulaziz International Airport', 'Jeddah', 'Saudi Arabia'),
        ('PMO', 'Palermo Airport Falcone-Borcellino', 'Italia', 'Palermo'),
        ('LGW', 'London Gatwick Airport', 'United Kingdom', 'London'),
        ('LTN', 'London Luton Airport', 'United Kingdom', 'London'),
        ('LHR', 'Heathrow Airport', 'United Kingdom', 'London'),
        ('DXB', 'Dubai International Airport', 'United Arab Emirates', 'Dubai')
;

INSERT INTO compagnia_aerea (
	Codice_IATA_compagnia,
	Nome
)

VALUES  ('BR', 'Eva Air'),
		('B', 'Business'),
        ('EC', 'Easyjet Europe'),
        ('TP', 'Tap Air Portugal'),
        ('SV', 'Saudia'),
        ('FR', 'Ryanair'),
        ('U2','Easyjet'),
        ('BA', 'British Airways')
;

INSERT INTO classe (
	Codice_classe,
	Nome
)

VALUES  ('FC', 'First Class'),
		('B', 'Business'),
        ('PE', 'Premium Economy'),
        ('E', 'Economy')
;