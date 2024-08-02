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