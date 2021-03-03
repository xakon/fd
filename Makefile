SHELL		:= /bin/sh
INSTALL		?= install

PREFIX		?= /usr/local
BINDIR		?= ${PREFIX}/bin
DATADIR		?= ${PREFIX}/share
MANDIR		?= ${DATADIR}/man/

TARGET		:= fd

manpages	:= doc/fd.1

install: release ${manpages}
	$(INSTALL)    -d ${DESTDIR}/${BINDIR}
	$(INSTALL) -s -t ${DESTDIR}/${BINDIR} target/release/${TARGET}
	$(INSTALL)    -t ${DESTDIR}/${MANDIR}/man1 -m 0644 ${manpages}
release:
	cargo build --release --locked


.PHONY: release install
