title: Vagrant Status in the Command Line
tags: []
date: 2013-01-07 00:00:00
description: Show the status of your Vagrant server as part of your command line prompt.
markdown:
  breaks: false
---

*AKA:* **How to know if you left your Vagrant server on.**

I started using [Vagrant](http://www.vagrantup.com) on a client
project and I love it. Vagrant will create a virtual machine
that is ran using a headless version of
[VirtualBox](https://www.virtualbox.org). This means it's easy
to forget if your server is still running or not at the
end of the day.

I was already using some [nifty code](https://gist.github.com/3170548)
for outputting the status of git in my command line, so I
decided to try putting the status of my Vagrant server in the prompt
as well.

Here's what I came up with:

{% gist 4478878 .profile %}

The `parse_vagrant_status` method will return nothing if you
are in a folder with no `Vagrantfile`. Otherwise, it will
return "[on]" or "[off]" depending on if the server is started or not.

![Vagrant status in command line](/images/2013/vagrant-status-in-the-command-line/vagrant-status.png)

---

**Extra Credit:** The `vagrant status` process seems to take a bit to run,
or at least longer than I'd like to wait when moving around the command
line. By changing my script to detect if a `Vagrantfile` exists, and then
looking for the VirtualBox process, things could probably be sped up.
