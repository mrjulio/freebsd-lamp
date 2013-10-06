-- create user
CREATE USER 'pureftpd'@'localhost' IDENTIFIED BY 'pureftpd';
 
-- grang privileges
GRANT ALL PRIVILEGES ON pureftpd.* TO 'pureftpd'@'localhost';
 
-- create users table
CREATE TABLE users (
    USER VARCHAR(16) BINARY NOT NULL,
    password VARCHAR(64) BINARY NOT NULL,
    uid INT(11) NOT NULL DEFAULT '-1',
    gid INT(11) NOT NULL DEFAULT '-1',
    dir VARCHAR(128) BINARY NOT NULL,
    PRIMARY KEY  (USER)
);

-- example
INSERT INTO users VALUES('admin', md5('nimda'), 1001, 14, '/storage/ftp');

