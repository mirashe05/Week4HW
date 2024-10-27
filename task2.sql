INSERT INTO petPet VALUES
    ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ('Puffball','Diane','hamster','F','1999-03-30',NULL);

INSERT INTO petEvent VALUES
    ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ("Slim", "1997-08-03", "vet", "broken rib"),
    ("Slim", "1997-10-04", "vet", "broken tooth"),
    ("Bowser", "1991-10-12", "kennel", NULL),
    ("Fang", "1991-10-12", "kennel", NULL),
    ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ("Claws", "1998-03-17","birthday", "Gave him a new flea collar"),
    ("Whistler", "1998-12-09", "birthday", "First birthday");
    
    CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender CHAR(1) CHECK (gender IN ('M', 'F')),
  birth DATE,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(20),
  eventdate DATE,
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname),
  PRIMARY KEY (petname, eventdate)
);

-- 1. Insert event for Fluffy
INSERT INTO petEvent VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

-- 2. Insert event for Hammy, and insert Hammy into petPet
INSERT INTO petPet VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);
INSERT INTO petEvent VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- 3. Update event for Fluffy to note the birth of kittens
INSERT INTO petEvent VALUES ('Fluffy', '1995-05-15', 'litter', '5 kittens, 2 male');

-- 4. Insert an event for Claws breaking a rib
INSERT INTO petEvent VALUES ('Claws', '1997-08-03', 'injury', 'broken rib');

-- 5. Update death date for Puffball
UPDATE petPet SET death = '2020-09-01' WHERE petname = 'Puffball';

-- 6. Remove Harold's dog (assuming the pet's name is Buffy) due to GDPR
DELETE FROM petPet WHERE petname = 'Buffy' AND owner = 'Harold';
DELETE FROM petEvent WHERE petname = 'Buffy';
