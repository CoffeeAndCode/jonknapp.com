---
layout: post
title: Switch Active HipChat Account on Mac
description: An Alfred plugin and code necessary to switch your active HipChat
  account on a Mac without logging out and back in every time.
---

I love [HipChat](https://www.hipchat.com/) for team communication. I've used it
for several different projects, which has led me to a bit of a conundrum.
The main service [does not allow you to manage multiple accounts](http://help.hipchat.com/knowledgebase/articles/64418)
at this point. This forces me to have multiple HipChat accounts that I need
to change between day to day. Also, my passwords are random and managed by
[1Password](https://agilebits.com/onepassword)
so it's a bit harder for me to just log out and log back in again.

Disgruntled by wasted cycles, I decided to dig around the internals of my Mac a
bit and I seem to have found a way to pull off what I need. Long story short, I created an
[Alfred workflow](/files/switch-active-hipchat-account-on-mac/Switch%20HipChat%20Account.alfredworkflow)
for switching your active HipChat account.

A few things to note:

1. You need to create keychain entries for each account you want to switch to.
2. You should not log out of the HipChat app anymore (it deletes the last used keychain entry).
3. You should have HipChat closed for a few seconds before switching accounts.

---

## How To

Short story longer, here's how I made multiple HipChat accounts a bit more bearable.
I should preface that this technique is for the native Mac client (currently v2.0),
not the previous Adobe AIR client.


### Keychains

I started by poking around the Keychain Access app for instances of `hipchat` and
found one entry which appeared to be deleted and recreated if I logged out and back
in to another HipChat account.

This led to finding out about the `security` command which can be ran from the
command line to edit/delete/add keychain entries. Editing the keychain won't
work for us though since it gets recreated when a user logs out of HipChat so we
need to add new entries for each account we would like to use.

To add a new keychain, you can run a command like this from the command line
substituting `EMAIL` and `PASSWORD` appropriately:

    security add-generic-password -a EMAIL -s chat.hipchat.com -w PASSWORD -U -T /Applications/HipChat.app


### Preference Files

Once I had keychain entries for each account, I needed to track down preference
files that might have directed HipChat what the active account should be. I used an
app called [Easy Find](https://itunes.apple.com/us/app/easyfind/id411673888?mt=12)
to quickly locate all files on my Mac that had the word `hipchat` in the filename.

Popping into `~/Library/Preferences/com.hipchat.HipChat.plist` I found a few things
that held promise: `account_email` and `signInEmail` keys that referenced the last
account I logged into HipChat as.

*FYI, you can open the plist file directly from your command line with the
following command:*

    open ~/Library/Preferences/com.hipchat.HipChat.plist

By editing the `account_email` and `signInEmail` keys to a different HipChat account
that I manually added keychains for, the next time HipChat started it would log
me into a different account! Success!!!

Digging around a bit more, I found how to edit plist configs from the command line:

    /usr/libexec/PlistBuddy -c "Set :account_email EMAIL" ~/Library/Preferences/com.hipchat.HipChat.plist
    /usr/libexec/PlistBuddy -c "Set :signInEmail EMAIL" ~/Library/Preferences/com.hipchat.HipChat.plist


### Success

Weilding my newfound knowledge, I was able to wrap up the functionality in an
[Alfred workflow](/files/switch-active-hipchat-account-on-mac/Switch%20HipChat%20Account.alfredworkflow)
which returned my precious cycles.

I was originally hoping my workflow could close HipChat, swap the plist
entires, then log back in but it appears that happens a bit too fast for HipChat's liking.
The plist file has the ability of being written a few seconds after the GUI disappears
so our options are to add a `sleep` call in the bash script, or only switch accounts
after HipChat has been closed for a few seconds. My workflow chose the later.

Hopefully this can be of use to people until HipChat can get multiple accounts working.
