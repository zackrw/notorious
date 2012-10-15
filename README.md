# Notorious

Notorious allows you to take notes in simple markdown, and then build them
into a stylish, easy-to-study outline in the browser.

## Installation

Add this line to your application's Gemfile:

    gem 'notorious'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install notorious

## Usage

###Take notes in a file:
    <!-- notes.md -->

    # U.S. History Class

    ## George Washington

    First prez; tall dude. George Washington (February 22, 1732 – December 14, 1799)
    was one of the Founding Fathers of the United States, serving as the
    commander-in-chief of the Continental Army during the American Revolutionary
    War and later as the new republic's first President.
    ![Pic of George](http://upload.wikimedia.org/wikipedia/commons/b/b6/Gilbert_Stuart_Williamstown_Portrait_of_George_Washington.jpg)

    ## Ben Franklin

    Smart guy; efficient planner. Benjamin Franklin (January 17, 1706 - April 17, 1790)
    was one of the Founding Fathers of the United States. A noted polymath,
    Franklin was a leading author, printer, political theorist, politician, postmaster,
    scientist, musician, inventor, satirist, civic activist, statesman, and
    diplomat. As a scientist, he was a major figure in the American
    Enlightenment and the history of physics for his discoveries and theories
    regarding electricity. He invented the lightning rod, bifocals, the
    Franklin stove, a carriage odometer, and the glass 'armonica'.[1] He
    facilitated many civic organizations, including a fire department and a university.
    ![Pic of Ben](http://upload.wikimedia.org/wikipedia/commons/c/cc/BenFranklinDuplessis.jpg)

    ## U.S. States
    ### [Map](http://www.mapsofworld.com/usa/usa-maps/usa-state-capital-map.jpg)

    * There were originally 13 colonies.
    * Now there are 50 states
    * Alabama - Montgomery
    * Alaska - Juneau
    * etc..

###Then call notorious

    $ notorious build notes.md

###And see your fancy notes

![Example Output](https://raw.github.com/zackrw/notorious/v1/spec/examples/example.png)

###To run this example

    $ notorious example

###If notorious can't open your notes
When you call notorious build, notorious creates an html file (by default the same
directory as the markdown file). If notorious cannot open your newly made notes,
notorious will output their location, and you may open the file on your own in
your favorite browser.


###Options

    $ notorious --help
    Usage: notorious [options] [action] file

    actions:
        build [file]                     The markdown file to build.

        options:
        -o, --output [file]              Specify output file name (defaults to input_file.html)
        -s, --stylesheet [file]          Specify a custom stylesheet
        -v, --verbose                    Run verbosely

###Testing
    $ make test

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
