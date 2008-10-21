= story-helper

* http://github.com/jtrupiano/story-helper

== DESCRIPTION:

Provides very basic baseline for using direct Ruby to define your test data and test accessors.  Still a work in progress,
but something we use at SLS in lieu of fixtures.  More details to come as this becomes more useful to others.

There's some information on the wiki regarding how to use it in conjunction with fixtures.

== FEATURES/PROBLEMS:

* not entirely DRY (requires you to define your accessors in addition to your test data -- this should be able to be automated)
* could auto-convert existing fixtures
* should only be used in conjunction with pre-built test databases (in other words, no dropping and recreating for each test case -- use DB transactions instead)

== SYNOPSIS:

  FIX (code sample of usage)

== REQUIREMENTS:

* FIX (list of requirements)

== INSTALL:

* sudo gem install story-helper

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
