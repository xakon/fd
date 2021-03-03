SHELL		:= /bin/sh
INSTALL		?= install

PREFIX		?= /usr/local

TARGET		:= fd


install: release doc/fd.1
	$(INSTALL)    -d ${DESTDIR}/${PREFIX}/bin
	$(INSTALL) -s -t ${DESTDIR}/${PREFIX}/bin target/release/${TARGET}
	$(INSTALL)    -t ${DESTDIR}/${PREFIX}/share/man/man1 -m 0644 doc/fd.1
release:
	cargo build --release --locked


.PHONY: release install
