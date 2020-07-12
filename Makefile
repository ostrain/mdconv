ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SHELL=/bin/bash -o pipefail


# You can override these by setting environment variables of the same name
MDCONV_CHROME_BINARY ?= "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
MDCONV_TEMPLATES_DIR ?= $(ROOT_DIR)/templates


# Convert a .md file to a .htm file
%.htm: %.md $(MDCONV_TEMPLATES_DIR)/header.htm $(MDCONV_TEMPLATES_DIR)/footer.htm
	$(ROOT_DIR)/tools/Markdown.pl $< | $(ROOT_DIR)/tools/SmartyPants.pl | cat $(MDCONV_TEMPLATES_DIR)/header.htm - $(MDCONV_TEMPLATES_DIR)/footer.htm > $@

# Convert a .md file to a .pdf file
%.pdf: %.htm
	$(MDCONV_CHROME_BINARY) --headless --disable-gpu --print-to-pdf-no-header "--print-to-pdf=$(PWD)/$@" "$(PWD)/$<"


# Install required tools
install: $(ROOT_DIR)/tools/Markdown.pl $(ROOT_DIR)/tools/SmartyPants.pl

$(ROOT_DIR)/tools/Markdown.pl:
	mkdir -p $(ROOT_DIR)/tools
	curl https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip -o /tmp/Markdown_1.0.1.zip
	unzip /tmp/Markdown_1.0.1.zip -d /tmp/
	cp /tmp/Markdown_1.0.1/Markdown.pl $(ROOT_DIR)/tools/Markdown.pl
	rm -r /tmp/Markdown_1.0.1.zip /tmp/Markdown_1.0.1/

$(ROOT_DIR)/tools/SmartyPants.pl:
	mkdir -p $(ROOT_DIR)/tools
	curl https://daringfireball.net/projects/downloads/SmartyPants_1.5.1.zip -o /tmp/SmartyPants_1.5.1.zip
	unzip /tmp/SmartyPants_1.5.1.zip -d /tmp/
	cp /tmp/SmartyPants_1.5.1/SmartyPants.pl $(ROOT_DIR)/tools/SmartyPants.pl
	chmod +x $(ROOT_DIR)/tools/SmartyPants.pl
	rm -r /tmp/SmartyPants_1.5.1.zip /tmp/SmartyPants_1.5.1/
