CREATE TYPE service_type AS ENUM ('resident', 'day');
CREATE TYPE position_type AS ENUM ('admin', 'manager', 'staff');
CREATE TYPE gender_type AS ENUM ('Male', 'Female', 'Genderfluid', 'Bigender', 'Genderqueer', 'Agender', 'Polygender', 'Non-binary');

CREATE TABLE clients (
    "address" text,
    "gender" gender_type,
    "dob" date,
    "first" text NOT NULL,
    "last" text NOT NULL,
    "SSN" character(9) NOT NULL,
    "enroll-date" date,
    PRIMARY KEY ("SSN"),
    UNIQUE ("SSN")
);

CREATE TABLE facilities (
    "address" text,
    "liscense-date" date,
    name text,
    site_id character(9) NOT NULL,
    service service_type,
    PRIMARY KEY (site_id),
    UNIQUE (site_id)
);

CREATE TABLE employees
(
    "address" text,
    "gender" gender_type,
    "first" text NOT NULL,
    "last" text NOT NULL,
    "SSN" character(9) NOT NULL,
    "hire-date" date,
    position position_type,
    PRIMARY KEY ("SSN"),
    UNIQUE ("SSN")
);

CREATE TABLE previous_clients (
    "address" text,
    "dob" date,
    "first" text NOT NULL,
    "last" text NOT NULL,
    "SSN" character(9) NOT NULL,
    "enroll-date" date NOT NULL,
    "dischage-date" date NOT NULL,
    PRIMARY KEY ("SSN"),
    UNIQUE ("SSN")
);

CREATE TABLE previous_employees (
    "address" text,
    "gender" gender_type,
    "first" text NOT NULL,
    "last" text NOT NULL,
    "SSN" character(9) NOT NULL,
    "hire-date" date,
    position position_type,
    "end-date" date,
    PRIMARY KEY ("SSN"),
    UNIQUE ("SSN")
);

insert into clients values ('54 Ronald Regan Drive', 'Female', '1971-10-17', 'Colin', 'Lamas', '419024981', '2011-03-03');
insert into clients values ('0 Meadow Vale Lane', 'Male', '1971-11-08', 'Jareb', 'Kitteringham', '750314922', '2008-11-25');
insert into clients values ('9 Bunting Alley', 'Female', '1970-07-10', 'Jolynn', 'Gibling', '305549360', '2008-02-14');
insert into clients values ('165 Aberg Place', 'Genderfluid', '1985-07-09', 'Brandy', 'Dossetter', '409081416', '2020-03-07');
insert into clients values ('29 Hoffman Plaza', 'Male', '1978-05-10', 'Bobine', 'Goldhawk', '211109913', '2014-02-18');
insert into clients values ('2248 Farwell Terrace', 'Male', '1967-05-19', 'Elsworth', 'Le Sieur', '708636757', '2004-06-20');
insert into clients values ('67 Saint Paul Point', 'Genderfluid', '1970-06-28', 'Olva', 'Carreyette', '746979250', '2004-08-08');
insert into clients values ('05 Delaware Terrace', 'Genderqueer', '1965-11-21', 'Pierrette', 'Bignall', '220468542', '2015-05-02');
insert into clients values ('05 Buhler Way', 'Female', '1987-10-09', 'Lazaro', 'Purselow', '846319559', '2017-06-25');
insert into clients values ('17 Beilfuss Pass', 'Bigender', '1979-05-11', 'Ave', 'Edmunds', '530274111', '2010-09-16');
insert into clients values ('25828 Memorial Point', 'Genderfluid', '1975-08-07', 'Norrie', 'Start', '126283773', '2007-04-18');
insert into clients values ('965 8th Circle', 'Male', '1989-03-04', 'Sissie', 'Spurnier', '224866186', '2008-04-20');
insert into clients values ('94 Lyons Place', 'Female', '1998-03-17', 'Kerstin', 'Lob', '348326854', '2011-11-15');
insert into clients values ('53 Riverside Trail', 'Agender', '1975-09-28', 'Erin', 'Ramsbotham', '668575533', '2010-02-13');
insert into clients values ('6 Lerdahl Terrace', 'Polygender', '1962-11-12', 'Gilbertina', 'Livezey', '290388873', '2000-08-04');

insert into facilities values ('2 Laurel Road', '2011-12-27', 'Laurel', '675268091', 'resident');
insert into facilities values ('4690 Delladonna Avenue', '2013-12-07', 'Delladonna', '234836107', 'day');
insert into facilities values ('84359 Troy Park', '2017-06-15', 'Troy', '380997827', 'resident');
insert into facilities values ('89785 Lukken Pass', '2021-03-12', 'Lukken', '317870856', 'resident');
insert into facilities values ('4247 Glacier Hill Avenue', '2007-07-22', 'Glacier', '116718215', 'day');
insert into facilities values ('99 Gale Drive', '2006-12-30', 'Gale', '622916749', 'resident');
insert into facilities values ('94592 Northport Pass', '2004-02-10', 'Northport', '993147078', 'day');
insert into facilities values ('3401 Becker Lane', '2004-01-02', 'Becker', '201536699', 'day');
insert into facilities values ('5 Eastwood Place', '2002-06-18', 'Eastwood', '525066973', 'resident');
insert into facilities values ('64882 Nevada Avenue', '2012-07-01', 'Nevada', '622261672', 'resident');

insert into previous_clients values ('725 Straubel Road', '1978-05-06', 'Alex', 'Whittock', '286123972', '2006-04-27', '2008-10-12');
insert into previous_clients values ('438 Schlimgen Circle', '1993-07-29', 'Illa', 'Rechert', '855279287', '2004-05-16', '2011-12-18');
insert into previous_clients values ('6399 Linden Court', '1967-12-08', 'Odette', 'Shory', '604276755', '2003-12-20', '2005-12-14');
insert into previous_clients values ('9518 Daystar Crossing', '1973-04-06', 'Hyacinthia', 'Skippon', '242310801', '2010-11-05', '2020-02-21');
insert into previous_clients values ('77683 Onsgard Lane', '1971-10-01', 'Rutter', 'MacAskie', '876490580', '2000-04-26', '2015-03-03');
insert into previous_clients values ('067 Alpine Junction', '1976-04-23', 'Adiana', 'Cristol', '280297424', '2013-01-11', '2020-05-06');
insert into previous_clients values ('771 Farragut Trail','1984-08-12', 'Torry', 'Jennaroy', '165385300', '2019-05-01', '2020-02-05');
insert into previous_clients values ('759 Hauk Street', '1964-10-03', 'Toby', 'Jex', '249798216', '2009-02-15', '2016-02-12');
insert into previous_clients values ('63 Cherokee Crossing', '1969-10-14', 'Hulda', 'Sherebrook', '532501656', '2006-10-19', '2018-06-20');
insert into previous_clients values ('21150 Victoria Plaza', '1974-09-18', 'Michal', 'Runnicles', '822534707', '2000-02-02', '2008-01-21');


insert into previous_employees values ('1 Stuart Point', 'Genderqueer', 'Randolph', 'Toulson', '952218943', '2010-02-04', 'manager', '2011-03-03');
insert into previous_employees values ('3 Waxwing Plaza', 'Female', 'Jessa', 'Redford', '092534172', '2003-01-10', 'staff', '2018-05-29');
insert into previous_employees values ('7277 Cherokee Center', 'Non-binary', 'Ruprecht', 'Volet', '646022397', '2005-02-01', 'manager', '2013-07-24');
insert into previous_employees values ('8257 Northland Alley', 'Male', 'Giffy', 'Adnam', '808236573', '2008-06-08', 'manager', '2010-09-18');
insert into previous_employees values ('0 Lakeland Pass', 'Agender', 'Abbi', 'Burner', '628711139', '2004-06-02', 'admin', '2017-12-15');
insert into previous_employees values ('430 Sutteridge Trail', 'Genderfluid', 'Roley', 'Bastard', '599193258', '2003-08-28', 'staff', '2019-04-28');
insert into previous_employees values ('34 Spohn Crossing', 'Agender', 'Hinda', 'Calvie', '220155485', '2002-01-31', 'staff', '2016-01-05');
insert into previous_employees values ('0948 Browning Parkway', 'Genderqueer', 'Desmund', 'Eberts', '645721872', '2004-08-13', 'admin', '2010-06-20');
insert into previous_employees values ('54 Towne Road', 'Male', 'Paulina', 'Guenther', '546331049', '2004-09-20', 'manager', '2013-11-03');
insert into previous_employees values ('41724 Jenifer Lane', 'Non-binary', 'Constantine', 'Derrington', '663579758', '2005-01-19', 'admin', '2020-01-16');
insert into previous_employees values ('989 Lakewood Gardens Avenue', 'Polygender', 'Matthieu', 'Gumery', '111665511', '2005-12-24', 'staff', '2014-11-05');
insert into previous_employees values ('661 Transport Lane', 'Polygender', 'Thom', 'Korn', '581539428', '2003-12-28', 'staff', '2018-07-02');
insert into previous_employees values ('97 Shoshone Circle', 'Bigender', 'Dur', 'Francescotti', '017126265', '2007-08-31', 'staff', '2016-12-27');
insert into previous_employees values ('69655 Clarendon Drive', 'Agender', 'Brion', 'Dowling', '803463442', '2003-10-09', 'admin', '2013-04-04');
insert into previous_employees values ('2153 Donald Terrace', 'Non-binary', 'Jamima', 'Benettolo', '461061149', '2003-09-21', 'staff', '2021-01-12');
insert into previous_employees values ('53 Express Avenue', 'Genderfluid', 'Tiff', 'Slessar', '030234093', '2004-03-03', 'manager', '2011-05-04');
insert into previous_employees values ('6 Susan Pass', 'Genderqueer', 'Lodovico', 'Caustick', '476566246', '2005-02-02', 'staff', '2020-10-14');
insert into previous_employees values ('75 Florence Avenue', 'Genderfluid', 'Corrine', 'Beneze', '270484554', '2000-12-18', 'staff', '2020-09-25');
insert into previous_employees values ('571 Pepper Wood Court', 'Polygender', 'Lane', 'Bussetti', '076115376', '2002-01-02', 'admin', '2012-03-30');
insert into previous_employees values ('382 Hoard Circle', 'Non-binary', 'Gran', 'Seeborne', '016321094', '2001-01-07', 'admin', '2017-02-18');

insert into employees values ('0 Sutteridge Drive', 'Genderfluid', 'Sal', 'Halligan', '664082386', '2007-12-20', 'manager');
insert into employees values ('4 Barnett Parkway', 'Bigender', 'Clevie', 'Dowda', '765581620', '2011-07-28', 'admin');
insert into employees values ('71 Blackbird Park', 'Male', 'Mikey', 'Prover', '450555948', '2007-01-06', 'staff');
insert into employees values ('7 Corben Road', 'Non-binary', 'Herc', 'Huntly', '400154587', '2017-08-11', 'staff');
insert into employees values ('46 Trailsway Park', 'Female', 'Moyna', 'Calladine', '718083237', '2017-07-31', 'manager');
insert into employees values ('989 Rowland Junction', 'Non-binary', 'Camilla', 'Scholefield', '777529177', '2015-09-04', 'staff');
insert into employees values ('196 American Ash Lane', 'Genderfluid', 'Johnette', 'Vedmore', '595135009', '2017-02-08', 'staff');
insert into employees values ('76 Corscot Junction', 'Non-binary', 'Illa', 'Stuckes', '697082880', '2007-09-13', 'admin');
insert into employees values ('9 Lyons Trail', 'Polygender', 'Paola', 'Harburtson', '045329511', '2005-07-30', 'admin');
insert into employees values ('473 Meadow Ridge Street', 'Genderfluid', 'Jana', 'Raffon', '306679190', '2008-11-07', 'admin');
insert into employees values ('2361 1st Lane', 'Bigender', 'Teddie', 'Cerman', '699615239', '2008-09-23', 'manager');
insert into employees values ('1 Dottie Crossing', 'Genderfluid', 'Dame', 'Botham', '903971569', '2019-10-11', 'staff');
insert into employees values ('7205 Rockefeller Place', 'Genderqueer', 'Rici', 'Haysman', '346395701', '2004-04-16', 'manager');
insert into employees values ('948 Dayton Court', 'Non-binary', 'Corrine', 'Phripp', '475787734', '2002-08-04', 'manager');
insert into employees values ('6292 Westend Parkway', 'Agender', 'Nehemiah', 'Prowse', '108180070', '2010-09-01', 'staff');
insert into employees values ('71 Lindbergh Terrace', 'Agender', 'Shauna', 'Warlton', '966531871', '2005-05-09', 'manager');
insert into employees values ('8212 Lien Place', 'Female', 'Betta', 'Eidelman', '655008141', '2008-02-17', 'manager');
insert into employees values ('196 Morningstar Road', 'Bigender', 'Clarance', 'Rushbrooke', '982030015', '2013-06-24', 'admin');
insert into employees values ('8 Lyons Point', 'Female', 'Cherry', 'Wiltshear', '842269437', '2015-01-24', 'admin');
insert into employees values ('19 Sommers Hill', 'Bigender', 'Grete', 'Bahl', '532793737', '2020-10-27', 'staff');
insert into employees values ('8 Anderson Point', 'Polygender', 'Malcolm', 'Baythrop', '964152553', '2012-05-24', 'manager');
insert into employees values ('66713 Bartillon Avenue', 'Genderfluid', 'Dedra', 'Longworth', '708555540', '2008-06-21', 'manager');
insert into employees values ('10609 Erie Street', 'Male', 'Julian', 'Swatheridge', '887967823', '2017-12-01', 'staff');
insert into employees values ('874 Summer Ridge Drive', 'Male', 'Meade', 'Rodrig', '059419036', '2005-08-28', 'staff');
insert into employees values ('661 Arrowood Road', 'Genderfluid', 'Cristina', 'Cranmere', '291645736', '2009-03-20', 'manager');