---
title: "pg_ctl: command not found"
date: 2023-09-28T19:55:53+02:00
tags: ["postgresql"]
draft: false
---

Let’s say you have a fresh new installation of PostgreSQL, then you open up a new terminal window to check the PostgreSQL server and type

{{< highlight bash >}}
$ pg_ctl
{{< /highlight >}}

and boom!: 

{{< highlight bash >}}
$ pg_ctl: command not found
{{< /highlight >}}

Why? Does the installation fail? What about psql the official client? Let’s see…

{{< highlight bash >}}
$ psql –version
$ psql (PostgreSQL) 16.0 (Ubuntu 16.0-1.pgdg20.04+1)
{{< /highlight >}}

OK, we know that PostgreSQL is installed, the official client with the –version flag returns the actual version of the database.

Let’s try the following command:

{{< highlight bash >}}
$ pg_config
{{< /highlight >}}

Nice! A lot information about the installation. Everything seems OK.

Let’s do one last verification:

{{< highlight bash >}}
$ ls -l /usr/lib/postgresql/16/bin/
{{< /highlight >}}

Wow, all the PostgreSQL applications are there!!! So what’s happening?

When a command is not found and you are completely sure the application is installed, one of the common reason is that weed need to add the PATH to the environment.

{{< highlight bash >}}
$ vim ./bashrc
{{< /highlight >}}

Let’s open the bashrc file and the following line:

{{< highlight bash >}}
$ export PATH="$PATH:/usr/lib/postgresql/16/bin"
{{< /highlight >}}

Reload your terminal and let’s check if is OK:

{{< highlight bash >}}
$ pg_ctl –version
$ pg_ctl (PostgreSQL) 16.0 (Ubuntu 16.0-1.pgdg20.04+1)
{{< /highlight >}}

...and done!
