# Photogram GUI

In this project, we'll practice populating our pages with data from our tables.

We'll also build forms and links to finally allow our users to CRUD data into our tables, instead of relying on `rails console`, `/rails/db`, `rails sample_data`, etc.

## Target

[Here's our target.](https://photogram-gui.matchthetarget.com/)

## Starting point

If you look at the `config/routes.rb` file, or navigate to `/rails/info`, you'll see that there aren't any routes defined yet. We have to build them all ourselves.

However, we're not starting competely from scratch. Navigate to `/rails/db` and you'll see that the database exists already; it's the structure that we designed way back in Weeks 1 & 2.

Also, crucially, the models already exist; and within the models, I've already defined the "association accessor" methods that we practiced writing together. These methods make it much easier to actually _use_ the foreign keys and join tables that we painstakingly planned out in our domain model, rather than having to write cumbersome `.where` queries all over the place.

Spend some time reading the methods in the models; particularly the ones in `app/models/user.rb`. There are a _lot_, because in a social network there are so many important relationships between entities, and the whole point of the application is to query these relationships.

Once you're comfortable with the methods, let's proceed to building the interface. Having these methods at our fingertips is going to make our job a _lot_ easier.

## Domain model

For a quick overview of your database, there's an ERD located in the root-level folder of the application, `erd.png`.

![Domain Model](erd.png?raw=true "Domain Model")

You can also always look at the comments at the top of each of your models in `app/models` to remind yourself of what columns it has.

## Tasks

The required tasks are:

 - `/users` should
    - display all the users
    - a link to get to details for each user
    - a form to add a new user
 - `/users/[USERNAME]` should
    - display the username of the user
    - the photos posted by the user
 - `/photos` should have a form to add a new photo
 - `/photos/[ID]` should
    - display the details of a photo
    - displays the comments that have been made on the photo
    - have a form to add a comment to the photo

## Workflow

 1. As often as you like, reset your database with dummy data: `rails sample_data`
 2. Start the web server: `bin/server`
 3. **A**lways **B**e **C**ommitting at `/git`
 4. Check out your database visually at `/rails/db`
 5. Run `rails grade` as often as you like to see how you are doing, but **test whatever you're working on manually first to make sure it matches the target's behavior**. Don't debug using `rails grade`; that is a terribly slow feedback loop.

## Things to keep in mind

  - I added some _validations_, rules to try and help prevent bogus data from entering your tables, to your models. If your record is mysteriously not saving, then a validation is failing (or you just forgot to call `.save`, which I do all the time).
 - Don't be alarmed by the number of automated tests. Most of them are there as hints to help you structure your forms correctly.
 - It's okay to View Source on the target to get hints on what HTML we used.
 - When you make forms, don't forget to add a `<label>` for every form control (`<input>`, `<textarea>`, etc). The `<label>` should have a `for=""` attribute that matches the `id=""` attribute of the input. For example,

    ```html
    <label for="zebra">Fan</label>
    <input id="zebra" type="text" name="qs_fan_id">
    ```
