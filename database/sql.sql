CREATE TABLE roomCategory(
	id INT NOT NULL AUTO_INCREMENT,
    roomType VARCHAR(20) NOT NULL,
    price INT NOT NULL,
	PRIMARY KEY(id)

);


CREATE TABLE room(
	id INT NOT NULL AUTO_INCREMENT,
   	roomNo INT NOT NULL,
    categoryId INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(categoryId) REFERENCES roomCategory(id)

);

CREATE TABLE customer(
	id INT NOT NULL AUTO_INCREMENT,
    fname VARCHAR(20)  NOT NULL,
    lname VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)


);

CREATE TABLE booking(
	id  INT NOT NULL AUTO_INCREMENT,
	userId INT NOT NULL,
    bookingDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    checkIn DATETIME DEFAULT CURRENT_TIMESTAMP,
    checkOut DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(userId) REFERENCES user(id)

);

CREATE TABLE roomBooking(
    id INT NOT NULL AUTO_INCREMENT,
    bookingId INT NOT  NULL,
    roomId INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(bookingId) REFERENCES booking(id),
    FOREIGN KEY(roomId) REFERENCES room(id)


);

CREATE VIEW roo AS
SELECT roomBooking.roomId, roomBooking.bookingId, booking.*
    FROM roomBooking
	JOIN booking
	ON roomBooking.bookingId = booking.id;
    where roomId not In
    (
        SELEct roomId from roo
        where
            (CheckIn BETWEEN '2017-04-10' and '2017-04-13')
            OR
            (CheckOut BETWEEN '2017-04-10' and '2017-04-13')
    )
