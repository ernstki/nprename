`nprename` rename image files based on Noun Project ID
======================================================

This utility helps me keep a standard file naming convention for icons
downloaded from [The Noun Project][1].

The naming convention I use is:

    nounproject-<id>-<term_slug>-<author_username>.<ext>

…but this can be modified around line 100 of the script (search for
`newbasename =`).


Installation
------------

Clone this repository, then

    gem build *.gemspec
    gem install --user *.gem

Make sure that the `bin` directory for the path(s) given by `gem environment
gempath` are in your shell's search path, _e.g._, by setting something like
this in your `~/.bash_profile` or `~/.bashrc`:

    # using the built-in 'ruby' for macOS 10.14 (Mojave), for example
    export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"


Configuration
-------------

Get an API token/password from <https://thenounproject.com/developers/apps/>.

Copy `config.rb.example` to `~/.config/nprename/config.rb` and update `TOKEN`
and `SECRET` to match those generated above.


Usage
-----

    nprename - creates a usable filename from a Noun Project ID
  
    usage:
      nprename [-h|--help]
      nprename [-d|--dump] [-u|--url] [-k|--keep] [-n|--dry-run] [ID | FILENAME]
  
    where:
      -d, --dump                       dumps a JSON record for ID (and quits)
      -u, --url                        prints the URL for ID (and quits)
      -k, --keep, --keep-original      leaves original file (rather than removing it)
      -n, --dryrun, --dry-run          show what would happen, but don't do it


Examples
--------

Given a file named `1210575.png`, dump the entire Noun Project record for image
ID 1210575 to the terminal as JSON:

    $ nprename --dump 1210575.png

Same, but pretty-printed, colorized, and piped through `less`:

    $ nprename --dump 1210575.png | jq -C . | less -R

Same, but just for an ID

    $ nprename --dump 1210575

Get the permalink URL for an ID

    $ nprename --url 1210575
    https://thenounproject.com/term/module/1210575

Simulate renaming an existing file based on the format described above:

    $ nprename --dry-run 1210575.png
    would move 1210575.png -> ./nounproject-1210575-module-kiranshastry15.png

Same, except with the `--keep` option:

    $ nprename --dry-run --keep 1210575.png
    would copy 1210575.png -> ./nounproject-1210575-module-kiranshastry15.png (keeping original)

Actually do it:

    $ nprename 1210575.png
    moving 1210575.png -> ./nounproject-1210575-module-kiranshastry15.png


Author
------

Kevin Ernst [ernstki -at- mail.uc.edu](mailto:ernstki%20-at-%20mail.uc.edu)


License
-------

[MIT](LICENSE.txt)


[1]: https://thenounproject.com
