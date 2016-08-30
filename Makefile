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
	cp mibrfcs/*                   $(DESTDIR)/usr/share/snmp/mibs-downloader/mibrfcs
	cp mibiana/*                   $(DESTDIR)/usr/share/snmp/mibs-downloader/mibiana
	gzip -n9                       $(DESTDIR)/usr/share/snmp/mibs-downloader/mibrfcs/*
	gzip -n9                       $(DESTDIR)/usr/share/snmp/mibs-downloader/mibiana/*
	ln -s /var/lib/mibs/ietf     $(DESTDIR)/usr/share/mibs/ietf
	ln -s /var/lib/mibs/iana     $(DESTDIR)/usr/share/mibs/iana
