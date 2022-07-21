create database indexe;
CREATE TABLE project(id INT NOT NULL,name VARCHAR(45),PRIMARY KEY(id));
INSERT INTO project(id,name)
    -> VALUES(01,"java"),(02,"sql"),(03,"angular"),(04,"html"),(05,"css");

 CREATE TABLE user(id INT NOT NULL,media_id INT,name VARCHAR(45),FOREIGN KEY(id) REFERENCES project(id));
 insert into user(id,media_id,name)VALUES(01,1,"yogita"),(02,2,"jyoti"),(03,3,"rohan"),(04,4,"tinku"),(05,5,"suraj");

 create table project_has_user(project_id INT,user_id INT,manager TINYINT(1),FOREIGN KEY(project_id) REFERENCES project(id),FOREIGN KEY(user_id) REFERENCES user(id));
insert into project_has_user(project_id,user_id,manager)VALUES(01,1,100),(02,2,101),(03,3,103),(04,4,104),(05,5,105);

create table bug(id INT,project_id INT,name VARCHAR(45),FOREIGN KEY(project_id) REFERENCES project(id));
insert into bug(id,project_id,name)VALUES(1,01,"java"),(2,02,"sql"),(3,03,"angular"),(4,04,"html"),(5,05,"css");

 create table comment(id INT,bug_project_id INT,bug_id INT ,text TEXT,FOREIGN KEY(bug_project_id) REFERENCES bug(project_id));
  insert into comment(id,bug_project_id,bug_id,text)VALUES(1,01,11,"firstb"),(2,02,12,"secb"),(3,03,13,"threeb"),(4,04,14,"fourb"),(5,05,15,"fiveb");

  create table comment_has_media(comment_id INT,comment_bug_project_id INT,comment_bug_id INT,media_id INT,FOREIGN KEY(comment_bug_project_id) REFERENCES comment(bug_project_id));
   insert into comment_has_media(comment_id,comment_bug_project_id,comment_bug_id,media_id)Values(1,01,11,1),(2,02,12,2),(3,03,13,3),(4,04,14,4),(5,05,15,5);

 create table bug_has_media(bug_id INT,bug_project_id INT,media_id INT,FOREIGN KEY(bug_project_id) REFERENCES bug(project_id));
 insert into bug_has_media(bug_id,bug_project_id,media_id)VALUES(11,01,1),(12,02,2),(13,03,3),(14,04,4),(15,05,5);

 create table media(id INT,user_id INT,path VARCHAR(70),filetypr VARCHAR(70),filesize DECIMAL(65,2),FOREIGN KEY(user_id) REFERENCES user(id));