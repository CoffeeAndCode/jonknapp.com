---
layout: post
title: Vagrant Status in the Command Line
---

*AKA:* **How to know if you left your Vagrant server on.**

I started using [Vagrant](http://www.vagrantup.com) on a client
project and I love it. Vagrant will create a virtual machine
that is ran using [VirtualBox](https://www.virtualbox.org),
but it runs it headless. This means it's easy to forget if
your server is still running or not at the end of the day.

I was already using some [nifty code](https://gist.github.com/3170548)
for outputting the status if git in my command line. I
decided that adding the status of the Vagrant server
would be exactly what I needed.

I'm not really good at bash but this worked for me:

{% gist 4478878 .profile %}

The `parse_vagrant_status` method will return nothing if you
are in a folder with no `Vagrantfile`. Otherwise, it will
return "[on]" or "[off]" depending on if the server is started or not.

{% image_path vagrant-status.png "Vagrant status in command line" %}

---

**Extra Credit:** The `vagrant status` process seems to take a bit to run,
or at least longer than I'd like to wait when moving around the command
line. By changing my script to detect if a `Vagrantfile` exists, and then
looking for the VirtualBox process, things could probably be sped up.