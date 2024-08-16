CREATE TABLE IF NOT EXISTS accounts (
    id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
    name varchar(255) COMMENT 'User Name',
    email varchar(255) COMMENT 'User Email',
    picture varchar(255) COMMENT 'User Picture'
) default charset utf8 COMMENT '';

CREATE TABLE ships (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'primary key',
    name VARCHAR(255) NOT NULL COMMENT 'Name of Ship',
    quadrant VARCHAR(255) NOT NULL COMMENT 'Quadrent location',
    crewComplement INT NOT NULL COMMENT 'Number of Crewmen',
    phasers BOOLEAN NOT NULL COMMENT 'Does the ship have phasers',
    torpedos BOOLEAN NOT NULL COMMENT ' Does the ship have torpedos',
    shields BOOLEAN NOT NULL COMMENT 'Does the ship have shields',
    shipPrefix VARCHAR(255) NOT NULL COMMENT 'Ship Prefix',
    alliance VARCHAR(255) NOT NULL COMMENT 'Alliance',
    shuttles INT NOT NULL COMMENT 'Does the ship have shuttles',
    classification VARCHAR(255) NOT NULL COMMENT 'Class of ship',
    creatorId VARCHAR(255) NOT NULL
) default charset utf8 COMMENT '';

ALTER TABLE ships
DROP COLUMN type;

ALTER TABLE ships
ADD COLUMN type VARCHAR(255) NOT NULL COMMENT 'Type of the ship',
ADD COLUMN captain VARCHAR(255) NULL COMMENT 'Name of the current captain',
ADD COLUMN passengerCapacity INT NULL COMMENT 'Number of passengers the ship can accommodate',
ADD COLUMN speed INT NULL COMMENT 'Warp factor or maximum speed',
ADD COLUMN sensors BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Does the ship have sensors?',
ADD COLUMN dockingBay BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Does the ship have a docking bay?',
ADD COLUMN sickBay BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Does the ship have a sick bay?',
ADD COLUMN cloakingDevice BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Does the ship have a cloaking device?',
ADD COLUMN tractorBeam BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Does the ship have a tractor beam?',
ADD COLUMN transporter BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Does the ship have a transporter?',
ADD COLUMN capacity INT NULL COMMENT 'Cargo capacity of the ship';

INSERT INTO ships (name, quadrant, crewComplement, phasers, torpedos, shields, shipPrefix, alliance, shuttles, classification, captain, passengerCapacity, speed, sensors, dockingBay, sickBay, cloakingDevice, tractorBeam, transporter, capacity)
VALUES 
    -- USS Enterprise (NCC-1701)
    ('USS Enterprise', 'Alpha Quadrant', 430, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 3, 'Constitution', 'J.T. Kirk', 1000, 8, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 8000),
    -- USS Enterprise-A (NCC-1701-A)
    ('USS Enterprise-A', 'Alpha Quadrant', 1016, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 5, 'Galaxy', 'James T. Kirk', 1500, 9.8, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 12000),
    -- USS Voyager (NCC-74656)
    ('USS Voyager', 'Delta Quadrant', 1578, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 5, 'Intrepid', 'Kathryn Janeway', 1400, 9.9, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 75000),
    -- USS Deep Space Nine (NCC-74654)
    ('USS Deep Space Nine', 'Gamma Quadrant', 1022, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 0, 'Space Station', 'Benjamin Sisko', 3000, NULL, TRUE, 5, TRUE, FALSE, TRUE, TRUE, 5000),
    -- USS Defiant (NCC-1764)
    ('USS Defiant', 'Alpha Quadrant', 450, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 2, 'Cruiser', 'Worf', 500, 8, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 10000),
    -- USS Excelsior (NCC-1701-D)
    ('USS Excelsior', 'Alpha Quadrant', 1024, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 4, 'Sovereign', 'Jean-Luc Picard', 1200, 9.6, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 15000),
    -- USS Galaxy (NCC-1750)
    ('USS Galaxy', 'Alpha Quadrant', 842, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 3, 'Galaxy', 'Rayford Steppenwolf', 800, 9.7, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 10000),
    -- USS Reliant (NCC-74605)
    ('USS Reliant', 'Alpha Quadrant', 472, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 2, 'Cruiser', 'David Marcus', 400, 8.5, TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, 5000),
    -- USS Enterprise-D (NCC-1701-D)
    ('USS Enterprise-D', 'Alpha Quadrant', 1012, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 4, 'Galaxy', 'Jean-Luc Picard', 1000, 9.8, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 15000),
    -- USS Discovery (NCC-1031)
    ('USS Discovery', 'Unknown', 1500, TRUE, TRUE, TRUE, 'USS', 'United Federation of Planets', 5, 'Science Vessel', 'Philippa Georgiou', 1400, 9.9, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 25000);

DROP TABLE ships;

INSERT INTO
    ships (
        name,
        quadrant,
        crewComplement,
        phasers,
        torpedos,
        shields,
        shipPrefix,
        alliance,
        shuttles,
        classification,
        creatorId
    )
VALUES (
        "USS Voyager",
        "Alpha",
        "141",
        true,
        true,
        true,
        "NCC-74656",
        "United Federation Of Planets",
        true,
        "Intrepid Class",
        "6387d94b68790d657c7154ca"
    );

CREATE TABLE CrewMember (
    CrewMemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Rating VARCHAR(20) NOT NULL,
    Position VARCHAR(30) NOT NULL,
    SpeciesID INT,
    Age INT NOT NULL,
    Gender VARCHAR(10),
    CrewImg VARCHAR(255) NULL,
    FOREIGN KEY (SpeciesID) REFERENCES Species (SpeciesID)
);

ALTER TABLE CrewMember ADD CrewImg VARCHAR(255) NULL AFTER Gender;

INSERT INTO
    CrewMember (
        Name,
        Rating,
        Position,
        SpeciesID,
        Age,
        Gender,
        CrewImg
    )
VALUES (
        "Tom Paris",
        "Ensign",
        "Helmsman",
        1,
        27,
        "Male",
        "https://vignette.wikia.nocookie.net/memoryalpha/images/e/ee/Tom_Paris_DS9.jpg/revision/latest/scale-to-width-down/350?cb=20171025183731"
    ),
    (
        "B'Elanna Torres",
        "Lieutenant",
        "Chief Engineer",
        1,
        24,
        "Female",
        "https://vignette.wikia.nocookie.net/memoryalpha/images/a/a1/B%27Elanna_Torres_2373.jpg/revision/latest/scale-to-width-down/350?cb=20171025192711"
    ),
    (
        "Harry Kim",
        "Ensign",
        "Tactical Officer",
        1,
        21,
        "Male",
        "https://vignette.wikia.nocookie.net/memoryalpha/images/3/31/Harry_Kim_in_uniform.jpg/revision/latest/scale-to-width-down/350?cb=20171025193542"
    ),
    (
        "Seven of Nine",
        "Lieutenant Commander",
        "Former Borg",
        1,
        23,
        "Female",
        "https://vignette.wikia.nocookie.net/memoryalpha/images/e/e1/Seven_of_Nine_joins_Voyager.jpg/revision/latest/scale-to-width-down/350?cb=20171025194431"
    ),
    (
        "Chakotay",
        "Captain",
        "Former Maquis",
        1,
        35,
        "Male",
        "https://vignette.wikia.nocookie.net/memoryalpha/images/3/33/Chakotay_in_command_uniform_2371.jpg/revision/latest/scale-to-width-down/350?cb=20171025194643"
    ),
    (
        "Janeway",
        "Captain",
        "Human",
        1,
        45,
        "Female",
        "https://vignette.wikia.nocookie.net/memoryalpha/images/7/74/Kathryn_Janeway_promotion.jpg/revision/latest/scale-to-width-down/350?cb=20171025195057"
    );

DROP Table CrewMember;

CREATE TABLE CrewMemberShips (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CrewMemberID INT,
    ShipID INT,
    FOREIGN KEY (CrewMemberID) REFERENCES CrewMember (CrewMemberID),
    FOREIGN KEY (ShipID) REFERENCES ships (id)
);

INSERT INTO
    CrewMemberShips (CrewMemberID, ShipID)
SELECT CrewMemberID, 1 --add to Voyager Ship id=1
FROM CrewMember;

DROP TABLE CrewMemberShips;

-- Planet Table
CREATE TABLE Planet (
    PlanetID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Type VARCHAR(30),
    Atmosphere VARCHAR(50),
    Gravity DECIMAL(4, 2),
    Population BIGINT,
    UNIQUE (Name)
);

INSERT INTO
    Planet (
        Name,
        Type,
        Atmosphere,
        Gravity,
        Population
    )
VALUES (
        "Alpha Centauri",
        "M-Class",
        "Oxygen-Nitrogen",
        0.9,
        20000000000
    ),
    (
        "Arkadia",
        "M-Class",
        "Oxygen-Nitrogen",
        1.0,
        10000000000
    ),
    (
        "Bajor",
        "Class M",
        "Nitrogen-Oxygen",
        1.0,
        10000000000
    ),
    (
        "Deneva",
        "M-Class",
        "Oxygen-Nitrogen",
        1.0,
        10000000000
    ),
    (
        "Ferenginar",
        "M-Class",
        "Carbon Dioxide",
        1.0,
        5000000000
    ),
    (
        "Klingon Homeworld",
        "Class M",
        "Nitrogen-Oxygen",
        1.15,
        30000000000
    ),
    (
        "Romulus",
        "Class M",
        "Oxygen-Nitrogen",
        1.0,
        10000000000
    ),
    (
        "Vulcan",
        "Class M",
        "Oxygen-Nitrogen",
        1.1,
        7500000000
    );

-- Species Table
CREATE TABLE Species (
    SpeciesID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Classification VARCHAR(50),
    HomePlanetID INT,
    AverageHeight DECIMAL(4, 2),
    AverageLifespan INT,
    FOREIGN KEY (HomePlanetID) REFERENCES Planet (PlanetID)
);

INSERT INTO
    Species (
        Name,
        Classification,
        HomePlanetID,
        AverageHeight,
        AverageLifespan
    )
VALUES (
        "Andorian",
        "Humanoid",
        12,
        1.8,
        80
    ),
    (
        "Bajoran",
        "Humanoid",
        13,
        1.7,
        80
    ),
    (
        "Ferengi",
        "Humanoid",
        15,
        1.6,
        140
    ),
    (
        "Klingon",
        "Humanoid",
        16,
        2.0,
        75
    ),
    (
        "Romulan",
        "Humanoid",
        17,
        1.8,
        85
    ),
    (
        "Vulcan",
        "Humanoid",
        18,
        1.8,
        120
    );

CREATE Table FSGFederationShips (
    name VARCHAR(100) NOT NULL,
    Health INT,
    MaxHealth int,
    ShieldStrength int,
    PhaserDamage int
);

INSERT INTO
    FSGFederationShips (
        name,
        health,
        maxHealth,
        shieldStrength,
        phaserDamage
    )
VALUES (
        "Enterprise-D",
        150,
        150,
        75,
        15
    ),
    (
        "Deep Space Nine",
        120,
        120,
        60,
        12
    ),
    ("Defiant", 100, 100, 50, 10),
    ("Voyager", 80, 80, 40, 8),
    ("Discovery", 180, 180, 90, 20);

ALTER TABLE FSGFederationShips ADD img VARCHAR(255);

UPDATE FSGFederationShips
SET
    img = CASE
        WHEN name = "Enterprise-D" THEN "path/to/enterprise_d.jpg"
        WHEN name = "Deep Space Nine" THEN "path/to/deep_space_nine.jpg"
        WHEN name = "Defiant" THEN "path/to/defiant.jpg"
        WHEN name = "Voyager" THEN "path/to/voyager.jpg"
        WHEN name = "Discovery" THEN "path/to/discovery.jpg"
        ELSE NULL
    END;

CREATE Table FSGBorgShips (
    name VARCHAR(100) NOT NULL,
    Health INT,
    MaxHealth int,
    ShieldStrength int,
    PhaserDamage int
);

INSERT INTO
    FSGBorgShips (
        name,
        health,
        maxHealth,
        shieldStrength,
        phaserDamage
    )
VALUES (
        "Borg Cube",
        200,
        200,
        100,
        25
    ),
    (
        "Klingon Bird-of-Prey",
        150,
        150,
        80,
        20
    ),
    (
        "Romulan Warbird",
        120,
        120,
        60,
        15
    ),
    (
        "Cardassian Cruiser",
        90,
        90,
        45,
        10
    ),
    (
        "Gorn Battle Cruiser",
        180,
        180,
        90,
        20
    );

CREATE Table FSGKlingonShips (
    name VARCHAR(100) NOT NULL,
    Health INT,
    MaxHealth int,
    ShieldStrength int,
    PhaserDamage int
);

CREATE Table FSGRomulanShips (
    name VARCHAR(100) NOT NULL,
    Health INT,
    MaxHealth int,
    ShieldStrength int,
    PhaserDamage int
);

CREATE Table FSGCardassianShips (
    name VARCHAR(100) NOT NULL,
    Health INT,
    MaxHealth int,
    ShieldStrength int,
    PhaserDamage int
);

CREATE Table FSGGornShips (
    name VARCHAR(100) NOT NULL,
    Health INT,
    MaxHealth int,
    ShieldStrength int,
    PhaserDamage int
);