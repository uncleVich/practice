CREATE TABLE IF NOT EXISTS organization (
  id        INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  version   INTEGER NOT NULL,
  name      VARCHAR(255) NOT NULL,
  full_name VARCHAR(255) NOT NULL,
  inn       VARCHAR(12) UNIQUE,
  kpp       VARCHAR(9),
  address   VARCHAR(255),
  phone     VARCHAR(16),
  is_active BOOLEAN
);

CREATE TABLE IF NOT EXISTS office (
  id        INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  version   INTEGER NOT NULL,
  address   VARCHAR(50) NOT NULL,
  name      VARCHAR(255) NOT NULL,
  phone     VARCHAR(16),
  is_active       BOOLEAN,
  organization_id INTEGER NOT NULL,
);

CREATE TABLE IF NOT EXISTS user (
  id          INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  version     INTEGER NOT NULL,
  first_name  VARCHAR(50) NOT NULL,
  second_name VARCHAR(50) NOT NULL,
  middle_name VARCHAR(50) NOT NULL,
  phone       VARCHAR(16),
  position    VARCHAR(255),
  is_identified BOOLEAN,
  doc_id      INT NOT NULL,
  country_id  INT NOT NULL,
  office_id   INT NOT NULL
);

CREATE TABLE IF NOT EXISTS document (
  id          INTEGER PRIMARY KEY AUTO_INCREMENT,
  version     INTEGER NOT NULL,
  name        VARCHAR(255) NOT NULL,
  code        CHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS country (
  id          INTEGER PRIMARY KEY AUTO_INCREMENT,
  version     INTEGER NOT NULL,
  name        VARCHAR(255) NOT NULL,
  code        CHAR(3) NOT NULL
);

ALTER TABLE office ADD FOREIGN KEY (organization_id) REFERENCES organization(id);
ALTER TABLE user ADD FOREIGN KEY (office_id) REFERENCES office(id);
ALTER TABLE user ADD FOREIGN KEY (doc_id) REFERENCES document (id);
ALTER TABLE user ADD FOREIGN KEY (country_id) REFERENCES country (id);