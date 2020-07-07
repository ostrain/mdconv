# Markdown Converter

This repo contains some simple tooling to convert a
[Markdown](https://daringfireball.net/projects/markdown/syntax) document into
tasteful, easy-to-read HTML and PDF versions. It includes default styling that
works well for desktop, mobile, and print (in fact, the PDF version is generated
by doing a print-to-PDF on the HTML version). It also converts "dumb quotes" to
“smart quotes” automatically using
[SmartyPants](https://daringfireball.net/projects/smartypants/).


## Setup

### Requirements

Perl is required. It is preinstalled on macOS.

`make` is required. On macOS, you may need to install Apple's [Xcode command
line tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html)
to install `make`.

To generate PDFs, Chrome is required. Chrome 84 or newer is preferred since
those versions support an option to omit the ugly header and footer from the
PDF. By default it will look for Chrome in the standard macOS location of
`/Applications`. If Chome is installed somewhere else on your system, use one of
these two ways to tell the converter tool:

*  Export an environment variable, `$CHROME_BINARY`, containing the path to
   Chrome on your system.
*  Edit the `CHROME_BINARY` variable near the top of the Makefile to contain the
   correct path to Chrome on your system.


### Installation

The Markdown and SmartyPants scipts are required to run this tool. To download
and install them, simply run `make install`. They will be downloaded to
`./tools/`.

## Usage

To use this tool, simply create a Markdown file in this directory such as
`myfile.md` file then run:

    make myfile.htm myfile.pdf

This will generate HTML and PDF versions of your document and save them
as`myfile.htm` and `myfile.pdf`. The input Markdown filename and output HTML/PDF
filenames must match.

You can try it out with this README.md file by running:

    make README.htm README.pdf

### Customization

The tool generates the final HTML file in a very simple way: it converts the
input Markdown document to HTML tags, then prepends the contents of
`templates/header.htm` and appends the contents of `templates/footer.htm` to
assemble a full HTML document (including CSS in the header).

This means that if you'd like to customize the resulting HTML file, say to add a
`<title>` tag or edit the CSS, all you have to do is edit `templates/header.htm`
with your changes and re-run the `make` command.

You can also override the location of the `templates` directory by exporting a
`$TEMPLATES_DIR` environment variable.

### Building Files In Other Directories

This Makefile supports being run from another directory (which can be useful if
you want to run it from a script). For example to convert `myfile.md` in
whatever directory you're in, you could run:

    make -f /path/to/mdconv/Makefile myfile.htm myfile.pdf

