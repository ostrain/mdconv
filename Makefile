CHROME_BINARY = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

%.htm: %.md templates/header.htm templates/footer.htm
	./tools/Markdown.pl $< | ./tools/SmartyPants.pl | cat templates/header.htm - templates/footer.htm > $@

%.pdf: %.htm
	$(CHROME_BINARY) --headless --disable-gpu --print-to-pdf-no-header "--print-to-pdf=$(PWD)/$@" "$(PWD)/$<"


install: tools/Markdown.pl tools/SmartyPants.pl

tools/Markdown.pl:
	mkdir -p tools
	curl https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip -o /tmp/Markdown_1.0.1.zip
	unzip /tmp/Markdown_1.0.1.zip -d /tmp/
	cp /tmp/Markdown_1.0.1/Markdown.pl tools/Markdown.pl
	rm -r /tmp/Markdown_1.0.1.zip /tmp/Markdown_1.0.1/

tools/SmartyPants.pl:
	mkdir -p tools
	curl https://daringfireball.net/projects/downloads/SmartyPants_1.5.1.zip -o /tmp/SmartyPants_1.5.1.zip
	unzip /tmp/SmartyPants_1.5.1.zip -d /tmp/
	cp /tmp/SmartyPants_1.5.1/SmartyPants.pl tools/SmartyPants.pl
	chmod +x tools/SmartyPants.pl
	rm -r /tmp/SmartyPants_1.5.1.zip /tmp/SmartyPants_1.5.1/
