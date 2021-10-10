---
title: "PostgreSQL Notes: Creating roles"
date: 2019-11-26T10:00:00-04:00
tags: ["postgresql"]
draft: false
---

One of the most important thing, when you develop applications totally inside the database is roles. A role can be anything that will interact with objects in the database, for example, a role can run functions, own a table or even create other roles and grant permissions to them.

To make it simpler, a role can be a normal user that can log in to the database, query tables, insert some data or can be an *internal user* that could do some of the things mentioned above (run functions, etc). I like to call it *internal user* because it can do the same things like a user but *can not log in*. Let's see some code.

{{< highlight sql "linenos=table" >}}
  CREATE ROLE frank;
  CREATE USER frank;
{{< /highlight >}}

They do the same thing: create a role with the name `frank`. PostgreSQL assigns some default attributes to a role, one of them is `NOCREATEDB`, as you can notice PostgreSQL is verbose and explicit and `NOCREATEDB` means exactly what you are thinking, role `frank` can't create databases.

There are a few differences between `CREATE ROLE` and `CREATE USER`, one of them, when you create a role using `CREATE USER` the attribute `LOGIN` is applied by default, so, that role can log in to the database, otherwise `CREATE ROLE` sets `NOLOGIN` by default, you have to be careful with that.

[Read more about roles](https://www.postgresql.org/docs/current/role-membership.html)
