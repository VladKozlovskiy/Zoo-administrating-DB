--2 Заполнение таблиц

INSERT INTO Zoo.Employees (employee_name, employee_surname, employee_mobile_phone,employee_email,employee_payment, employee_card_number, employee_passport_number)
VALUES
  ('Allegra', 'Bruce', '1-718-341-7559', 'fames.ac@yahoo.org',2000, '3466191820566542','qdhyteytLF7hcNhLDTxMbw1werg'),
  ('Lee', 'Sanchez','(886) 686-7325','semper.egestas@outlook.ca',1500, '4916191820566765', 'OwrgKyytLjsfkvaTxMbwrf6'),
  ('Porter','Nicholson','(454) 632-8715','diam.sed@outlook.org',300, '5486191820568769', 'OnGW339KyytLFqrqrgqergbw1y5yj'),
  ('Burke', 'Haley','(858) 792-7394','mattis.semper.dui@protonmail.edu',NULL, '65416191820566489', 'OnGW339KyytLFqwrge65j'),
  ('Joseph', 'Landry',NULL, 'gravida.nunc@icloud.edu',1000, '8626191820566039', 'OnGW33ergytLF7qergqrgMbw546yu'),
  ('Garth' ,'Carr','1-744-576-1418',NULL,800, '7616791820566406', 'OnGW339KyytLF7hcNhLDTxM35uy'),
  ('Nathaniel', 'Mccoy','(601) 183-5795','eu.lacus@outlook.ca',650,'2457191820566465', 'ksskW339KqrgqerDfdTxMbw1UOy'),
  ('Audra', 'Shaw','1-928-608-8347','eget.lacus@hotmail.com',NULL, '4561669762066454', 'dld3qrgq3rgtLF7hcNhLTxMbwrth'),
  ('Cyrus', 'Fuller','(159) 858-7665','orci@protonmail.com',1200,  '4458191865566489', 'slfW339ergdhetyjLDfxMbw14eff'),
  ('Jacqueline', 'Guthrie',NULL,'convallis.erat@outlook.couk',900, '5416191820564484', 'lspW339sdvv7hcNhLfdvvxMbw645'),
  ('Fulton', 'Levy','1-271-425-4517','mattis@protonmail.ca',2200, '5616191820566439', 'OnGW339KyytLF7hcNcvbgMb465y'),
  ('Oliver', 'Rodriquez','1-630-493-9554',NULL,700, '781619182056329', 'OnGW339KyytLF7hcNhLDTxMbw1UOy'),
  ('Jemima', 'Morin','(655) 710-8381','fringilla.porttitor.vulputate@icloud.org',1600, '4956191820566083', 'dslvkKyytLF7hcNhLDTxMbw14naJE'),
  ('Autumn', 'Cooley','(878) 403-8169','non.sollicitudin.a@google.com',1250, '4956191820566045', '39KWasfGGyytLF7hcNhLDTxMbw1RG'),
  ('James', 'Robins','1-275-495-8317',NULL,1200, '5786191820566349', 'SDFytLcNhLerggDTxMbw1EDsfbF'),
  ('John', 'Brown','1-636-653-7352',NULL,950, '0266191820566489', 'S3jrF9KyytLrehcNhLDTxMberger'),
  ('Julia', 'Omirzak','(655) 715-6372','asdasd@icloud.org',1800, '0476191820569439', 'dkfb39Kyyerg7ehcNhLDDFsfg5B'),
  ('Phoebe', 'Cooley',NULL,'magna.et@icloud.org',990, '580619182056829', 'OnGW339KyytLF7hcNhLDTxMbw1UOy');


INSERT INTO Zoo.Excursions_Program (excursion_title, animal_spieceis, establishment_name, excursion_cost, excursion_duration)
VALUES
('Pandas guests' , 'Panda', 'Masala', 120, 3),
('Piggy Trip', 'Boar', 'Munchies', 200, 5),
('Polar Excursion', 'Polar Bear', 'Menu Feed ', 170, 2.5),
('Funny Monks', 'Monkey','Munchies', 260, 4),
('Across the forest', 'Dear', 'Munchies', 185, 3.5),
('Life is like zebra !', 'Zebra', 'Menu Feed', 160, 2),
('Looooong looong neck you ve never seen!', 'Giraph', 'Masala', 300, 2.5),
('Royal excursion to the animal king', 'Lion', 'Menu Feed', 270, 4.5),
('Unique Birds', 'Penguin', 'Mediterra Seafood', 190, 3),
('Colourful tail !', 'Pauline', 'Masala', 330, 2.5);


INSERT INTO Zoo.Excursions (excursion_title,excursion_date, excursion_start, excursion_end, amount_of_visitors, rating_from_audience_after_excursion)
VALUES
('Funny Monks','05/14/2022', '14:00', '17:20', 20, 3.55),
('Unique Birds','05/10/2022', '9:00', '13:10', 15, 4),
('Pandas guests','05/12/2022', '9:00', '22:10', 30, 4.8),
('Piggy Trip','05/23/2022', '13:00', '18:13', 20, 4.5),
('Funny Monks','05/12/2022', '19:00', '23:08', 26, 3.92),
('Across the forest','05/13/2022', '9:00', '12:26', 18,2.7 ),
('Piggy Trip','05/13/2022', '11:00', '16:03', 33, 4.77),
('Colourful tail !','05/13/2022', '14:00', '18:30', 29, 4.52),
('Funny Monks','05/13/2022', '18:00', '22:10', 24, 4.65),
('Piggy Trip','05/14/2022', '10:00', '14:50', 44, 4.77),
('Pandas guests','05/14/2022', '20:00', '23:07', 29, 5);


INSERT INTO Zoo.Establishments_Nearby (establishment_name, establishment_type, open_time, close_time,establishment_rating)
VALUES
('Souvenier Shop', 'Shop', '9:00', '19:00', NULL),
('Masala', 'Caffe', '10:00', '23:00', NULL),
('Munchies', 'Caffe', '10:30', '22:00', 4.46),
('Menu Feed', 'Restaurant', '10:00', '20:00', 4.88),
('Mediterra Seafood', 'Restaurant', '9:00', '21:00', 3.55),
('Observation deck', 'Observation deck', '9:00', '23:00', 5),
('Cash register', 'Cash register', '9:00', '23:00', NULL),
('Cash register2', 'Cash register', '9:00', '23:00', NULL),
('Bike rent', 'Rent', '9:00', '22:00', 5),
('Brown store','Shop', '10:00', '21:00', 3.31);



INSERT INTO Zoo.Animals (animal_name, animal_spiecies, animal_weight, animal_age, chipped, vaccinated)
VALUES
('BOB', 'Boar', 200, 10, true, false),
('Dan', 'Monkey', 80, 7, true, true),
('Mike', 'Panda', 200, 6, true, true),
('Linda', 'Pauile', 40, 3, false, true),
('Gorge', 'Dear', 170, 5, true, false),
('Alex', 'Zebra', 230, 4, false, true),
('Dan', 'Penguin', 60, 2, false, false),
('Mike', 'Lion', 300, 4,true, false),
('Linda', 'Giraph', 700, 5, true, false),
('Gorge', 'Polar Bear', 230, 3, false, false);

INSERT INTO Zoo.Animals_vaccination (animal_id, date_of_vaccination)
VALUES
(3,'03/15/2021'),
(7,'07/07/2020'),
(6,'08/03/2020'),
(9,'11/23/2019');



INSERT INTO Zoo.Workers_and_Animals (worker_id, animal_id)
VALUES
(3,1),
(4,2),
(5,3),
(3,4),
(3,5),
(4,6),
(5,7),
(3,8),
(4,9),
(5,10);

INSERT INTO Zoo.Workers_and_Excursions (worker_id, excursion_id)
VALUES
(7,1),
(8,2),
(9,3),
(7,4),
(10,5),
(11,6),
(8,7),
(9,8),
(10,9),
(11,10),
(9, 11);

INSERT INTO Zoo.Workers_and_Establishments (worker_id, establishment_name)
VALUES
(1,'Souvenier Shop'),
(6,'Masala'),
(13,'Munchies'),
(18,'Menu Feed'),
(16,'Mediterra Seafood'),
(2,'Observation deck'),
(15,'Cash register'),
(12,'Cash register2'),
(17,'Bike rent'),
(14,'Brown store');

