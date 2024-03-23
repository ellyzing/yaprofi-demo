-- SQLite
-- Заполнение таблицы операторов сотовой связи тестовыми данными
INSERT INTO Оператор_связи (Название_оператора, Название_юр_лица, Адрес_юр_лица, Контактный_телефон, E_mail) VALUES
    ('МТС', 'МТС ООО', 'Москва', '+7 (999) 123-45-67', 'info@mts.ru'),
    ('Билайн', 'Билайн ООО', 'Санкт-Петербург', '+7 (999) 987-65-43', 'info@beeline.ru'),
    ('Мегафон', 'Мегафон ООО', 'Новосибирск', '+7 (999) 111-22-33', 'info@megafon.ru');

-- Заполнение таблицы тарифов тестовыми данными
INSERT INTO Тариф (Название_тарифа, Ежемесячная_абонентская_плата, Трафик_интернет, Минуты_разговора, ID_оператора) VALUES
    -- Тарифы для МТС
    ('Тариф МТС 1', 500.00, 10, 100, 1),
    ('Тариф МТС 2', 600.00, 20, 200, 1),
    ('Тариф МТС 3', 700.00, 30, 300, 1),
    ('Тариф МТС 4', 800.00, 40, 400, 1),
    ('Тариф МТС 5', 900.00, 50, 500, 1),
    ('Тариф МТС 6', 1000.00, 60, 600, 1),
    ('Тариф МТС 7', 1100.00, 70, 700, 1),
    ('Тариф МТС 8', 1200.00, 80, 800, 1),
    ('Тариф МТС 9', 1300.00, 90, 900, 1),
    ('Тариф МТС 10', 1400.00, 100, 1000, 1),
    
    -- Тарифы для Билайн
    ('Тариф Билайн 1', 550.00, 15, 150, 2),
    ('Тариф Билайн 2', 650.00, 25, 250, 2),
    ('Тариф Билайн 3', 750.00, 35, 350, 2),
    ('Тариф Билайн 4', 850.00, 45, 450, 2),
    ('Тариф Билайн 5', 950.00, 55, 550, 2),
    ('Тариф Билайн 6', 1050.00, 65, 650, 2),
    ('Тариф Билайн 7', 1150.00, 75, 750, 2),
    ('Тариф Билайн 8', 1250.00, 85, 850, 2),
    ('Тариф Билайн 9', 1350.00, 95, 950, 2),
    ('Тариф Билайн 10', 1450.00, 105, 1050, 2),
    
    -- Тарифы для Мегафон
    ('Тариф Мегафон 1', 600.00, 20, 200, 3),
    ('Тариф Мегафон 2', 700.00, 30, 300, 3),
    ('Тариф Мегафон 3', 800.00, 40, 400, 3),
    ('Тариф Мегафон 4', 900.00, 50, 500, 3),
    ('Тариф Мегафон 5', 1000.00, 60, 600, 3),
    ('Тариф Мегафон 6', 1100.00, 70, 700, 3),
    ('Тариф Мегафон 7', 1200.00, 80, 800, 3),
    ('Тариф Мегафон 8', 1300.00, 90, 900, 3),
    ('Тариф Мегафон 9', 1400.00, 100, 1000, 3),
    ('Тариф Мегафон 10', 1500.00, 110, 1100, 3);
    
-- Заполнение таблицы клиентов тестовыми данными
INSERT INTO Клиент (ФИО, Серия_номер_паспорта, Адрес_регистрации, Дата_рождения, Телефонный_номер) VALUES
    ('Иванов Иван Иванович', '1234 567890', 'Москва', '1990-01-01', '+7 (999) 111-22-33'),
    ('Петров Петр Петрович', '9876 543210', 'Санкт-Петербург', '1985-05-05', '+7 (999) 222-33-44'),
    ('Сидоров Сидор Сидорович', '1111 222333', 'Новосибирск', '1980-10-10', '+7 (999) 333-44-55'),
    ('Кузнецова Елена Владимировна', '4444 555666', 'Москва', '1975-03-15', '+7 (999) 444-55-66'),
    ('Васильева Ольга Сергеевна', '7777 888999', 'Санкт-Петербург', '1995-12-20', '+7 (999) 777-88-99'),
    ('Николаев Николай Николаевич', '9999 000111', 'Новосибирск', '1988-07-25', '+7 (999) 999-00-11'),
    ('Козлов Игорь Петрович', '3333 444555', 'Москва', '2000-09-30', '+7 (999) 333-44-55'),
    ('Федорова Анна Владимировна', '2222 333444', 'Санкт-Петербург', '1992-11-05', '+7 (999) 222-33-44'),
    ('Павлов Алексей Иванович', '5555 666777', 'Новосибирск', '1987-04-12', '+7 (999) 555-66-77'),
    ('Ильина Мария Андреевна', '8888 999000', 'Москва', '1983-06-18', '+7 (999) 888-99-00');

-- Заполнение таблицы пользования тарифами клиентов тестовыми данными
INSERT INTO Пользование_тарифами (ID_клиента, ID_тарифа, Текущий_баланс) VALUES
    (1, 1, 1000.00),
    (2, 1, 1500.00),
    (3, 1, 2000.00),
    (4, 23, 1200.00),
    (5, 24, 1800.00),
    (6, 23, 1300.00),
    (7, 14, 1100.00),
    (8, 14, 1900.00),
    (9, 5, 1600.00),
    (10, 7, 1400.00);

-- Заполнение таблицы трафика клиентов тестовыми данными
INSERT INTO Трафик (ID_клиента, Трафик_интернет, Минуты_разговора) VALUES
    (1, 5, 50),
    (2, 15, 150),
    (3, 25, 250),
    (4, 35, 350),
    (5, 45, 450),
    (6, 55, 550),
    (7, 65, 650),
    (8, 75, 750),
    (9, 85, 850),
    (10, 95, 950);

-- Заполнение таблицы платежей тестовыми данными
INSERT INTO Платеж (ID_клиента, Дата_платежа, Сумма) VALUES
    (1, '2023-01-01', 500.00),
    (2, '2023-01-15', 700.00),
    (3, '2023-02-01', 1000.00),
    (4, '2023-02-15', 600.00),
    (5, '2023-03-01', 800.00),
    (6, '2023-03-15', 900.00),
    (7, '2023-04-01', 1200.00),
    (8, '2023-04-15', 1100.00),
    (9, '2023-05-01', 1300.00),
    (10, '2023-05-15', 1400.00);
