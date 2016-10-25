#DVD Club
__DBMS Project__<br>
Language: PHP<br>
Framework: Laravel 5.3

##Tables
name|
---|
users|
password_resets|
genres|
dvd_types|
jobs|
crew|
dvds|
tv_shows|
movies|
issues|
dvd_genre|
crew_dvd|

##Routes
route|description
---|---
public/insertCrew|To insert a new crew member
public/insertDvd|To insert a new dvd
public/dvd/{id}|View the dvd having given id
public/crew/{id}|View the crew member having given id
public/genre/{id}|View all the dvds in the genre having given id