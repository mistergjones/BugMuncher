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
ALTER TABLE engineers ADD COLUMN role TEXT;

drop table reports;

CREATE TABLE reports (
    report_id SERIAL PRIMARY KEY,
    week TEXT,
    points_target INTEGER,
    ideal_points INTEGER,
    actual_points INTEGER
);

INSERT INTO reports (week, points_target, ideal_points, actual_points) VALUES ('Week1', 400, 45, 40);
INSERT INTO reports (week, points_target, ideal_points, actual_points) VALUES ('Week2', 400, 85, 75);
INSERT INTO reports (week, points_target, ideal_points, actual_points) VALUES ('Week3', 300, 112, 82);
INSERT INTO reports (week, points_target, ideal_points, actual_points) VALUES ('Week4', 300, 146, 130);
INSERT INTO reports (week, points_target, ideal_points, actual_points) VALUES ('Week5', 250, 213, 240);


