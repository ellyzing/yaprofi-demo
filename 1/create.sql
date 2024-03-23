-- SQLite
-- Создание таблицы операторов сотовой связи
CREATE TABLE Оператор_связи (
    ID_оператора INTEGER PRIMARY KEY,
    Название_оператора TEXT NOT NULL,
    Название_юр_лица TEXT,
    Адрес_юр_лица TEXT,
    Контактный_телефон TEXT,
    E_mail TEXT
);

-- Создание таблицы тарифов
CREATE TABLE Тариф (
    ID_тарифа INTEGER PRIMARY KEY,
    Название_тарифа TEXT NOT NULL,
    Ежемесячная_абонентская_плата REAL,
    Трафик_интернет INTEGER,
    Минуты_разговора INTEGER,
    ID_оператора INTEGER,
    FOREIGN KEY (ID_оператора) REFERENCES Оператор_связи (ID_оператора)
);

-- Создание таблицы клиентов
CREATE TABLE Клиент (
    ID_клиента INTEGER PRIMARY KEY,
    ФИО TEXT NOT NULL,
    Серия_номер_паспорта TEXT,
    Адрес_регистрации TEXT,
    Дата_рождения DATE,
    Телефонный_номер TEXT
);

-- Создание таблицы пользования тарифами клиентов
CREATE TABLE Пользование_тарифами (
    ID_пользования INTEGER PRIMARY KEY,
    ID_клиента INTEGER,
    ID_тарифа INTEGER,
    Текущий_баланс REAL,
    FOREIGN KEY (ID_клиента) REFERENCES Клиент (ID_клиента),
    FOREIGN KEY (ID_тарифа) REFERENCES Тариф (ID_тарифа)
);

-- Создание таблицы трафика клиентов
CREATE TABLE Трафик (
    ID_трафика INTEGER PRIMARY KEY,
    ID_клиента INTEGER,
    Трафик_интернет INTEGER,
    Минуты_разговора INTEGER,
    FOREIGN KEY (ID_клиента) REFERENCES Клиент (ID_клиента)
);

-- Создание таблицы платежей
CREATE TABLE Платеж (
    ID_платежа INTEGER PRIMARY KEY,
    ID_клиента INTEGER,
    Дата_платежа DATE,
    Сумма REAL,
    FOREIGN KEY (ID_клиента) REFERENCES Клиент (ID_клиента)
);
