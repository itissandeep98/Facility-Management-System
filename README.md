[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/itissandeep98/Facility-Management-System)

# Table of Contents

- [Table of Contents](#table-of-contents)
	- [How To Setup Project](#how-to-setup-project)
	- [IF ALL GOES WELL THEN YOU WILL SEE THE FOLLOWING SCREENS](#if-all-goes-well-then-you-will-see-the-following-screens)
		- [Login Screen](#login-screen)
		- [On Successfull Login](#on-successfull-login)
		- [Employee Screen (Interface for the workers)](#employee-screen-interface-for-the-workers)
		- [User Screen (Interface for the Students or Faculty)](#user-screen-interface-for-the-students-or-faculty)
		- [History of User](#history-of-user)
		- [FMS Screen (Interface for the FMS head to manage everything)](#fms-screen-interface-for-the-fms-head-to-manage-everything)
		- [Interface for FMS head to modify employee database](#interface-for-fms-head-to-modify-employee-database)

 By- [Sandeep](https://github.com/itissandeep98), [Sarthak](https://github.com/sarthak144)

This is a group project extensively based on implementing a DBMS, its an attempt in creating an interface for the various Facilities provided by workers inside our college. For more Details read the [Write UP]( /Project%20Files/Work%20in%20Progress_Final%20Report.pdf )

1.External Library used for material Design : [JFoenix](https://github.com/jfoenixadmin/JFoenix)\
2.External Library for exporting excel sheets : [Apache POI](https://poi.apache.org/download.html)\
3.JDBC(mysql-connector jar file)(Platform Independent)  [MySQL](https://dev.mysql.com/downloads/connector/j/)

## How To Setup Project

1.Clone the repo on your local machine (`git clone github.com/itissandeep98/Facility-Management-System`) \
2.Set the default java Version to be java 11 and javaFX (preferably 14)\
3.Import the [dependicies](FMS/external%20libraries) using gradle to the library\
4.Change the VM options in configurations (for eg in Ubuntu : `"--module-path /usr/lib/jvm/javafx-sdk-14/lib --add-modules=javafx.controls,javafx.fxml"`)\
5.[Import](https://dev.mysql.com/doc/workbench/en/wb-admin-export-import-management.html) the [DBMS DATA.sql](/Project%20Files/DBMS%20DATA.sql) file to the local database \
6. Change these [parameters in Main.java](https://github.com/itissandeep98/Facility-Management-System/blob/610b0340fb665b589dddc2f4ca866069c8d42b60/FMS/src/sample/Main.java#L33-L34) according to your database.

## IF ALL GOES WELL,THEN YOU WILL SEE THE FOLLOWING SCREENS

### Login Screen

![image](https://user-images.githubusercontent.com/44255731/80458729-de677d00-894e-11ea-9fc4-c3e21b61ca60.png)

### On Successfull Login

![image](https://user-images.githubusercontent.com/44255731/80458829-1373cf80-894f-11ea-9729-1609a5e004da.png)

### Employee Screen (Interface for the workers)

![image](https://user-images.githubusercontent.com/44255731/80458898-2b4b5380-894f-11ea-9b1d-f8535146a560.png)

### User Screen (Interface for the Students or Faculty)

![image](https://user-images.githubusercontent.com/44255731/80458945-428a4100-894f-11ea-9982-12af753d50b7.png)

### History of User

![image](https://user-images.githubusercontent.com/44255731/80458987-4e760300-894f-11ea-9e5e-4580ed79cedf.png)

### FMS Screen (Interface for the FMS head to manage everything)

![image](https://user-images.githubusercontent.com/44255731/80459056-6b123b00-894f-11ea-9be4-78955e62b07a.png)

### Interface for FMS head to modify employee database

![image](https://user-images.githubusercontent.com/44255731/80459081-76fdfd00-894f-11ea-996b-cf7a823406bf.png)
