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

You'll need `make` installed. On macOS, you may need to install Apple's [Xcode
command line
tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html)
to install `make`.

To generate PDFs, Chrome is required. Chrome 84 or newer is preferred since
those versions support an option to omit the ugly header and footer from the
PDF. By default it will look for Chrome in the standard macOS location of
`/Applications`. If Chome is installed somewhere else on your system, you will
need to update the `CHROME_BINARY` variable at the top of the Makefile to point
to your copy of Chrome.

Perl is required. It is preinstalled on macOS.


### Installation

The Markdown and SmartyPants scipts are required to run this tool. To download
and install them, simply run `make install`.

## Usage

To use this tool, simply create a Markdown file in this directory such as
`myfile.md` file then run:

    make myfile.htm myfile.pdf

This will generate HTML and PDF versions of your document and save them
as`myfile.htm` and `myfile.pdf`. The input Markdown filename and output HTML/PDF
filenames must match.

You can try it out with this README.md file by running:

    make README.htm README.pdf
