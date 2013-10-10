Pathname for user-choices
=========================

[![Build Status](https://secure.travis-ci.org/god_object/user-choices-pathname.png)](
https://secure.travis-ci.org/god_object/user-choices-pathname)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/godobject/user-choices-pathname)

* [Documentation][docs]
* [Project][project]

   [docs]:    http://rdoc.info/github/god_object/user-choices-pathname/
   [project]: https://github.com/god_object/user-choices-pathname/

Description
-----------

Pathname for the user-choices command-line argument parser allows choices to be
automatically converted to Pathname objects.

Features / Problems
-------------------

This project tries to conform to:

* [Semantic Versioning (2.0.0)][semver]
* [Ruby Packaging Standard (0.5-draft)][rps]
* [Ruby Style Guide][style]
* [Gem Packaging: Best Practices][gem]

   [semver]: http://semver.org/
   [rps]:    http://chneukirchen.github.com/rps/
   [style]:  https://github.com/bbatsov/ruby-style-guide
   [gem]:    http://weblog.rubyonrails.org/2009/9/1/gem-packaging-best-practices

Additional facts:

* Written purely in Ruby.
* Documented with YARD.
* Intended to be used with Ruby 1.8.7 or higher.
* Cryptographically signed gem and git tags.

Synopsis
--------

This documentation defines the public interface of the software. Don't rely
on elements marked as private. Those should be hidden in the documentation
by default.

This is still experimental software, even the public interface may change
substantially in future releases.

### Loading

In most cases you want to load the library by the following command:

~~~~~ ruby
require 'user-choices-pathname'
~~~~~

In a bundler Gemfile you should use the following:

~~~~~ ruby
gem 'user-choices-pathname'
~~~~~

### Usage

Just like the other types that are supported by user-choices by default you can
define a choice to be of the type pathname like the following:

~~~~~ ruby
class SomeCommand < UserChoices::Command

  …

  def add_choices(builder)
    …
    builder.add_choice(:somepath, :type => :pathname)
    …
  end

  …

end
~~~~~

When the command is run, arguments given for the choice 'somepath' are then
automatically made into Pathname objects and are accessible through the
arguments hash stored in the @user_choices instance variable.

The conversion is also able to convert argument lists to Arrays of Pathnames.

Requirements
------------

* Ruby 1.8.7 or higher

Installation
------------

On *nix systems you may need to prefix the command with sudo to get root
privileges.

### High security (recommended)

There is a high security installation option available through rubygems. It is
highly recommended over the normal installation, although it may be a bit less
comfortable. To use the installation method, you will need my [gem signing
public key][gemkey], which I use for cryptographic signatures on all my gems.

Add the key to your rubygems' trusted certificates by the following command:

    gem cert --add aef-gem.pem

Now you can install the gem while automatically verifying it's signature by the
following command:

    gem install user-choices-pathname -P HighSecurity

Please notice that you may need other keys for dependent libraries, so you may
have to install dependencies manually.

   [gemkey]: https://aef.name/crypto/aef-gem.pem

### Normal

    gem install user-choices-pathname

### Automated testing

Go into the root directory of the installed gem and run the following command
to fetch all development dependencies:

    bundle

Afterwards start the test runner:

    rake spec

If something goes wrong you should be noticed through failing examples.

Development
-----------

### Bug reports and feature requests

Please use the [issue tracker][issues] on github.com to let me know about errors
or ideas for improvement of this software.

   [issues]: https://github.com/god_object/user-choices-pathname/issues/

### Source code

This software is developed in the source code management system Git. There are
several synchronized mirror repositories available:

* GitHub
    
    URL: https://github.com/godobject/user-choices-pathname.git

* Gitorious
    
    URL: https://git.gitorious.org/user-choices-pathname/user-choices-pathname.git

* BitBucket
    
    URL: https://bitbucket.org/godobject/user-choices-pathname.git

You can get the latest source code with the following command, while
exchanging the placeholder for one of the mirror URLs:

    git clone MIRROR_URL

#### Tags

The final commit before each released gem version will be marked by a tag
named like the version with a prefixed lower-case "v", as required by Semantic
Versioning. Every tag will be signed by my [OpenPGP public key][openpgp] which
enables you to verify your copy of the code cryptographically.

   [openpgp]: https://aef.name/crypto/aef-openpgp.asc

Add the key to your GnuPG keyring by the following command:

    gpg --import aef-openpgp.asc

This command will tell you if your code is of integrity and authentic:

    git tag -v [TAG NAME]

### Contribution

Help on making this software better is always very appreciated. If you want
your changes to be included in the official release, please clone my project
on github.com, create a named branch to commit and push your changes into and
send me a pull request afterwards.

Please make sure to write tests for your changes so that I won't break them
when changing other things on the library. Also notice that I can't promise
to include your changes before reviewing them.

The following people were involved in development:

- Alexander E. Fischer

License
-------

Copyright GodObject Team <dev@godobject.net>, 2009-2013

This file is part of Pathname for user-choices.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
