`nprename` rename image files based on Noun Project ID
======================================================

This utility helps me keep a standard file naming convention for icons
downloaded from [The Noun Project][np].

This utility does _not_ download the icons. I have my own way of doing this,
which usually involves picking foreground/background colors on the web site,
and then doing a screenshot of the image.

> [!TIP]
> If you're sloppy at this, like I am, and always end up with a white border
> around the screenshot, you can use [`mogrify -trim`][trim] to remove that.

There doesn't seem to be a programmatic way of doing this through the API, and
the web site has a nice set of pre-selected colors anyway; there's no point in
trying to reimplement what already works fine in that regard.

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
this in your `~/.bash_profile` or `~/.profile` (preferred), or `~/.bashrc`:

    # using Ruby 3.2.3 from rbenv, for example
    export PATH="$HOME/.gem/ruby/3.2.0/bin:$PATH"

If you only work with the system default `ruby`, you can have Ruby itself make
figure out what directory that needs to be _for_ you:

    # h/t: https://stackoverflow.com/a/4454366/785213
    rubymajmin=$(ruby -e 'puts RUBY_VERSION.split(".")[0,2].join(".")')
    export PATH="$HOME/.gem/ruby/$rubymajmin.0/bin:$PATH"
    unset rubymajmin


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

Kevin Ernst \<[ernstki -at- mail.uc.edu](mailto:ernstki%20-at-%20mail.uc.edu)\>


License
-------

[MIT](LICENSE.txt)


[np]: https://thenounproject.com
[trim]: https://imagemagick.org/script/command-line-options.php#trim
