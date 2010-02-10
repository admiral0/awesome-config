TARGET = awesome-helperd
CFLAGS = -I/usr/include/xmms2
LDFLAGS = -lxmmsclient
CC = gcc
LD= ld
PREFIX = /usr
DESTDIR=
all: executable
executable: awesome-helper.c
	@echo Compiling awesome-helperd..
	$(CC) $< $(CFLAGS) $(LDFLAGS) -o $(TARGET)
clean: 
	@echo Removing awesome-helperd
	@rm awesome-helperd
install:
	install -D -m755 awesome-helperd $(DESTDIR)$(PREFIX)/bin/awesome-helperd
uninstall:
	rm $(DESTDIR)/bin/awesome-helperd
