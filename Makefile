SHELL		:= /bin/sh

PREFIX		?= /usr/local

TARGET		:= fd


install: release doc/fd.1
	cp target/release/${TARGET} ${DESTDIR}/${PREFIX}/bin/
	strip ${DESTDIR}/${PREFIX}/bin/${TARGET}
	cp doc/fd.1 ${DESTDIR}/${PREFIX}/share/man/man1
release:
	cargo build --release --locked


.PHONY: release install
