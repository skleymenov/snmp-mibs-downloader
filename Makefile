# Makefile for mib-downloader
#

CONFFILES= snmp-mibs-downloader.conf \
           cisco.conf ciscolist \
           iana.conf ianalist \
           ianarfc.conf ianarfclist \
           junos.conf junoslist \
           rfc.conf rfclist rfcmibs.diff \
           screenos.conf screenoslist \
           simpleweb.conf simplelist \
           $(nil)

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
	ln -s /var/lib/snmp/mibs/ietf  $(DESTDIR)/usr/share/snmp/mibs/ietf
	ln -s /var/lib/snmp/mibs/iana  $(DESTDIR)/usr/share/snmp/mibs/iana
