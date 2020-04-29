drop database bugmuncher;
CREATE DATABASE bugmuncher;
\c bugmuncher;



CREATE TABLE defects (
    defect_id SERIAL PRIMARY KEY,
    defect_title TEXT,
    description TEXT,
    status TEXT
);

CREATE TABLE engineers (
    eng_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
);

INSERT INTO defects (defect_title, description, status) VALUES ('Big Bug1', 'A big defect', 'Open');
INSERT INTO defects (defect_title, description, status) VALUES ('Big Bug2', 'A big defect', 'Open');
INSERT INTO defects (defect_title, description, status) VALUES ('Big Bug3', 'A big defect', 'Open');
INSERT INTO defects (defect_title, description, status) VALUES ('Big Bug4', 'A big defect', 'Open');
INSERT INTO defects (defect_title, description, status) VALUES ('A massive Bug', 'A really massive defect', 'In-progress');
INSERT INTO defects (defect_title, description, status) VALUES ('Teeny Weeny Bug', 'This is a tiny bug. Fixed in 2 mins', 'Closed');
INSERT INTO defects (defect_title, description, status) VALUES ('Is this bug or spider?', 'Not sure if a bug or something else', 'New');

INSERT INTO engineers (name, email) VALUES ('theHomelessHacker', 'thh@thh.com');
INSERT INTO engineers (name, email) VALUES ('codeWarrior', 'cw@cw.com');
INSERT INTO engineers (name, email) VALUES ('devOpsWizard', 'devo@devo.com');

SELECT status, COUNT (status) from defects group by status;

SELECT status, COUNT (status) from defects group by status UNION ALL select 'Total' Status, COUNT(status) from defects;

ALTER TABLE defects ADD COLUMN eng_id INTEGER;

ALTER TABLE engineers ADD COLUMN password_digest TEXT;