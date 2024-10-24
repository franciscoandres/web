---
title: "PostgreSQL Functions PUBLIC by default"
date: 2024-10-24T19:33:53+02:00
tags: ["postgresql"]
draft: false
---

There's a developer called [Andrew](https://github.com/ajzbc), this guy made a Kanye REST API a few years ago, basically a server with Hono that returns Kanye's quote randomly. It's a simple, nice project, and I don't know... is elegant.

Anyway, I tried to do the same thing but with PostgreSQL and PostgREST. But I wanted to add a function that allows you to get an specific quote by id. I created a new database and schema and my table...

{{< highlight sql "linenos=table" >}}
  CREATE TABLE quotes (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    body TEXT NOT NULL CHECK (CHAR_LENGTH(body) > 0)
  );
{{< /highlight >}}

Two fields, multiple constraints, nothing fancy.

By default the public schema grants basic permissions to all users, users even can create objects BUT this only happens in the public schema. When you create a new schema, basically the users don't have ANY permissions which is nice because now you can add granular permissions to the new users and have everything under control.

So, I created the view random_quote and when I tried to access that view with a new user... permission denied! Ok that's expected behaviour because I didn't grant the permissions to the user. Nice.

After granting permissions to the user to that view, it returned data correctly so everything was working well. 

Now, the function... I created the function and I don't know why I go to the psql and execute my function and... it works!... oh that's weird... it works, yeah is the expected behaviour but I go back to my SQL statements and there's not a single command where I granted the permissions to execute that function to the user.

So, it is pointed out in the [documentation](https://www.postgresql.org/docs/current/sql-createfunction.html) that...

<blockquote>
Another point to keep in mind is that by default, execute privilege is granted to PUBLIC for newly created functions (see Section 5.8 for more information). Frequently you will wish to restrict use of a security definer function to only some users. To do that, you must revoke the default PUBLIC privileges and then grant execute privilege selectively. To avoid having a window where the new function is accessible to all, create it and set the privileges within a single transaction. 
</blockquote>

Good to know that _not all_ objects inside a new schema (that is not the schema _public_), will be available even if you not grant explicit permissions for the user.
