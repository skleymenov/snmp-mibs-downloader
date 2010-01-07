# Makefile for mib-downloader
#

CONFFILES= snmp-mibs-downloader.conf \
           iana.conf ianalist \
           rfc.conf rfclist rfcmibs.diff \
           simpleweb.conf simplelist \
           ianarfc.conf ianarfclist

BINFILES=  download-mibs
INSTALL=   /usr/bin/install

all:

install:
	$(INSTALL) -m 755 $(BINFILES)  $(DESTDIR)/usr/bin
	$(INSTALL) -m 644 $(CONFFILES) $(DESTDIR)/etc/snmp-mibs-downloader
	cp mibrfcs/*                   $(DESTDIR)/usr/share/doc/mibrfcs
	ln -s /var/lib/mibs/ietf     $(DESTDIR)/usr/share/mibs/ietf
	ln -s /var/lib/mibs/iana     $(DESTDIR)/usr/share/mibs/iana
