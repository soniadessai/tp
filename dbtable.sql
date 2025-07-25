create database trade;

use trade;

create table Stocks (
	id INT(10) auto_increment primary key,
    stockTicker varchar(10) not null unique,
    stockName varchar(100) not null,
    price float(10) not null check (price >= 0),
    unitsAvailable int(100) not null check (unitsAvailable >= 0)
);

create table Users(
	userId int(10) auto_increment primary key,
    userName varchar(100) not null,
    userMail varchar(100) not null,
    userPassword varchar(100) not null
);

create table OrdersPlaced(
	orderid INT(10) auto_increment primary key,
    createdAt datetime default current_timestamp,
    stockId INT(10),
    userId INT(10) not null,
    noOfUnitsBought int(10) not null check (noOfUnitsBought >= 0),
    statusCode int(1) default 0,
    foreign key (stockId) references Stocks(id),
    foreign key (userID) references Users(userId)
);