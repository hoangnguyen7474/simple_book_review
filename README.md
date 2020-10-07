# Book Review

This is my very first Ruby on Rails application I built.

## Features:

* Admin can CRUD all books and comments. 
* Author can CRUD their books.
* Reviewer can browse all books and CRUD a short comment.

## Techniques behind the scenes:

* Using gem Devise, Rolify, CanCanCan to manage user authority.
* Store book cover on S3 Storage by using those gems: ActiveStorage, aws-sdk-s3, active_storage_validations, image_processing.
* Using bootstrap helps this app has a clean design.
* Comment can be shown and deleted without reloading a page by applying Ajax technique.

## Git strategy

For this app, I made a new branch per feature. This will be helpful I think for the amount of history that's bound to occur and change over time. 
