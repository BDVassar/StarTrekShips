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
ADD COLUMN capacity INT NULL COMMENT 'Cargo capacity of the ship',
MODIFY creatorId VARCHAR(255) NULL COMMENT 'Account ID of the creator';

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
    FOREIGN KEY (SpeciesID) REFERENCES Species (SpeciesID)
);

DROP Table CrewMember;

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

ALTER TABLE FSGFederationShips
ADD img VARCHAR(255);


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