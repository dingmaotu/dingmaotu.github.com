---
layout: post
title: "Octopress: A HARD Way to Blog"
date: 2012-03-31 19:33
comments: true
categories: [octopress]
---

## From Ruby Installation to AN Octopress Blog

It needs quite a lot effort to setup an octopress blog. First of all, trying to use ruby under Windows is just painful, so I use CentOS to do all these (in a VMWare Player Virtual Machine). I downloaded RVM, following the RVM homepage guides, and did not succeed for several times. That was because I omitted the "requirement" step (I thought RVM will install requirements for me). However, I did build ruby successfully and was happy, until I had found that gem, heroku were not functional. I had to install zlib, openssl etc. with RVM. But in China you cannot even access zlib homepage (similarly ruby-installer, vimeo, facebook, you name it). I then remembered the "requirements" step, and just yum-ed them all.

I have learned a bit Ruby, so octopress setup guide is relatively easy to understand. The setup is OK now, this blog being the first to test Octopress functionality, markdown syntax, and code rendering.

<!-- more -->

## Markdown

First is a link to my old [homepage](dingmaotu.com). And a line:

***

The following is an unordered list:

* First
* Second
* Third

And this is a piece of inline code `int main(void){}`.

The following is a C code snippet:

{% codeblock A Test For Code Snippet Support lang:c %}
int main(void)
{
    printf("Hello Octopress!");
    return 0;
}
{% endcodeblock %}

However, the above test did not work for the first time because of the 'lib.so' error ( python-dev for apt-get or python-devel for yum must be installed to solve the problem ). Ah, how obscured!

Finnally let's test some Chinese Characters: 嘿, 可以了.

## Feelings

With Octopress, inserting (syntax-colored) code in your blog is super easy, which is extremely convenient for hackers alike. But writing plain blog is far from pleasant, so it is basically for programmers, not ordinary bloggers.

This the end of my first octopress blog.
