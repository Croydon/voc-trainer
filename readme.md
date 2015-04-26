# Voc Trainer

This is a school project with the goal of teaching a bit more of absolutely basic database knowledge to my class. I will also try to give a feeling, how one can start to develop a project, when there is nothing, but an idea. 
Keep in mind, that the database and my presentation itself are the only parts, which really matters for this project.
The code itself basically doesn't matter at all, except that it makes the thing running.


# License

The code is, like the [Fat-Free Framework](https://github.com/bcosca/fatfree), on which the code is based on, licensed under the terms of GNU GPL 3.0, while the database and the presentation are licensed under the terms of [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

# Setup

Requirements: 
 * PHP >= 5.4
 * MariaDB/MySQL >= 5.6
 
In theory it should also work with PHP 5.3 and older version of the database, 
however neither is it recommended to run these versions, nor is it tested in any way.

Steps:
 * Import the database schema into your database
 * Rename `app/config/db-example.php` to `db.php`, edit the file and add your database connection information
