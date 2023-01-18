CREATE TABLE
    IF NOT EXISTS accounts(
        id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
        name varchar(255) COMMENT 'User Name',
        email varchar(255) COMMENT 'User Email',
        picture varchar(255) COMMENT 'User Picture'
    ) default charset utf8 COMMENT '';

CREATE TABLE
    ships(
        id VARCHAR(255) NOT NULL PRIMARY KEY COMMENT 'primary key',
        name VARCHAR(255) NOT NULL,
        quadrent VARCHAR(255) NOT NULL,
        crewComplement INT NOT NULL,
        phasers BOOLEAN NOT NULL,
        torpedos BOOLEAN NOT NULL,
        shields BOOLEAN NOT NULL,
        shipPrefix VARCHAR(255) NOT NULL,
        alliance VARCHAR(255) NOT NULL,
        shuttles INT NOT NULL,
        class VARCHAR(255) NOT NULL
    ) default charset utf8 COMMENT '';