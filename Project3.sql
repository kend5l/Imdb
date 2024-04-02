CREATE TABLE Movie(
    Id VARCHAR2(20) CONSTRAINT Movie_Id_PK PRIMARY KEY,
    Release_Date DATE,
    Lang VARCHAR2(20),
    Name VARCHAR2(100),
    Length VARCHAR2(7), /*Ex: 2h 7m ?*/
    Information VARCHAR2(400)
);

CREATE TABLE TV_Show(
    Id VARCHAR2(20) CONSTRAINT TV_Show_Id_PK PRIMARY KEY,
    Release_Date DATE,
    Lang VARCHAR2(20),
    Name VARCHAR2(100),
    Length VARCHAR2(20), /* how many seasons the show has?*/
    Information VARCHAR2(400)
);

CREATE TABLE Episode(
    Id VARCHAR2(20) CONSTRAINT Episode_Id_PK PRIMARY KEY,
    Release_Date DATE,
    Lang VARCHAR2(20),
    Name VARCHAR2(100),
    Length VARCHAR2(7),
    Information VARCHAR2(400)
);

CREATE TABLE Review(
    Id VARCHAR2(20) CONSTRAINT Review_Id_PK PRIMARY KEY,
    Username VARCHAR2(20),
    Rating VARCHAR2(5), /* Ex: 5/10? */
    Title VARCHAR2(100), /* website kinda let me type forever so lets just do 100*/
    Comments VARCHAR2(600), /*actual limit*/
    Helpful_Votes VARCHAR2(4) /*9999 max*/
);

/*FOREIGN KEYS*/
ALTER TABLE Episode
ADD CONSTRAINT Episode_Show_Id_FK FOREIGN KEY(Show_Id)
REFERENCES TV_Show(Id)

ALTER TABLE Review
ADD CONSTRAINT Review_Movie_Id_FK FOREIGN KEY(Movie_Id)
REFERENCES Movie(Id)

ALTER TABLE Review
ADD CONSTRAINT Review_Show_Id_FK FOREIGN KEY(Show_Id)
REFERENCES TV_Show(Id)

ALTER TABLE Review
ADD CONSTRAINT Review_Episode_Id_FK FOREIGN KEY(Episode_Id)
REFERENCES Episode(Id)