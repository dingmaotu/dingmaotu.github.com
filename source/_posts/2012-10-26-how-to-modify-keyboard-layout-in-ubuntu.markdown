---
layout: post
title: "How to modify keyboard layouts easily in Ubuntu"
date: 2012-10-26 23:20
comments: true
categories: [tricks] 
---

If you want to remap the CAPSLOCK key to the Control key or something else,
you will find many tutorials on the internet (most of them are of course for
Emacs learners). However, quite a few of them are outdated and unnecessarily
complicated (for me). In a modern version of Ubuntu, you can accomplish this
easily in the system settings dialog. I believe Ubuntu learned this from Mac.

Here is how (12.04 LTS):

<!-- more -->

1. Locate `System Settings` in the upper right corner of your desktop, and
select `Keyboard` in the popup dialog:

	{% img /images/2012-10-26/systemsettings.png %}

	> Sorry for the Chinese ... but you should be able to recognize where to click,
	> after all its a picture
	
2. Then go to the `Layout Settings` in the lower left corner:

	{% img /images/2012-10-26/layout.png %}

3. You will see `Options` in the lower right corner:

	{% img /images/2012-10-26/options.png %}

4. Here you will find various options concerning the behaviors of special keys:

	{% img /images/2012-10-26/capslock.png %}

5. Now you should find your way of configuring what you want, I simply exchanged
ESC and CAPSLOCK. It is really convenient to have this modification, since
both Emacs and Vim are heavy ESC key users.

	{% img /images/2012-10-26/esc-exchg.png %}

Good luck using Emacs!
