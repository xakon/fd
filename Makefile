SHELL		:= /bin/sh
INSTALL		?= install

PREFIX		?= /usr/local
BINDIR		?= ${PREFIX}/bin
DATADIR		?= ${PREFIX}/share
MANDIR		?= ${DATADIR}/man/

TARGET		:= fd

install: release doc/fd.1
	$(INSTALL)    -d ${DESTDIR}/${BINDIR}
	$(INSTALL) -s -t ${DESTDIR}/${BINDIR} target/release/${TARGET}
	$(INSTALL)    -t ${DESTDIR}/${MANDIR}/man1 -m 0644 doc/fd.1
release:
	cargo build --release --locked


.PHONY: release install
