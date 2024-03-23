-- SQLite
CREATE TABLE Предприятие (
    ID_предприятия INTEGER PRIMARY KEY,
    Название_предприятия TEXT
);

CREATE TABLE Договор (
    ID_договора INTEGER PRIMARY KEY,
    Годовой_лимит INTEGER,
    ID_предприятия INTEGER,
    FOREIGN KEY (ID_предприятия) REFERENCES Предприятие(ID_предприятия)
);

CREATE TABLE Отход (
    ID_отхода INTEGER PRIMARY KEY,
    Наименование_отхода TEXT,
    Класс_опасности INTEGER,
    FOREIGN KEY (Класс_опасности) REFERENCES Класс_опасности(ID_класса)
);

CREATE TABLE Класс_опасности (
    ID_класса INTEGER PRIMARY KEY,
    Название_класса TEXT
);


CREATE TABLE Участок (
    ID_участка INTEGER PRIMARY KEY,
    Название_участка TEXT,
    Класс_опасности INTEGER,
    FOREIGN KEY (Класс_опасности) REFERENCES Класс_опасности(ID_класса)
);

CREATE TABLE Поставка_отходов (
    ID_поставки INTEGER PRIMARY KEY,
    Дата_поставки DATE,
    Количество INTEGER,
    ID_отхода INTEGER,
    ID_договора INTEGER,
    ID_участка INTEGER,
    FOREIGN KEY (ID_отхода) REFERENCES Отход(ID_отхода),
    FOREIGN KEY (ID_договора) REFERENCES Договор(ID_договора),
    FOREIGN KEY (ID_участка) REFERENCES Участок(ID_участка)
);

CREATE TABLE Транспортное_средство (
    ID_транспорта INTEGER PRIMARY KEY,
    Марка TEXT,
    Модель TEXT,
    Госномер TEXT,
    ФИО_водителя TEXT
);

