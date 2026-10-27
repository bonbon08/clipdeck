PREFIX ?= /usr
DESTDIR ?=
BINDIR = $(PREFIX)/bin

install:
	install -Dm755 clipdeck $(DESTDIR)$(BINDIR)/clipdeck
	install -Dm755 clipdeck-gui $(DESTDIR)$(BINDIR)/clipdeck-gui
	install -dm755 $(DESTDIR)$(PREFIX)/lib/systemd/user
	sed 's#@BINDIR@#$(BINDIR)#' clipdeck.service.in > $(DESTDIR)$(PREFIX)/lib/systemd/user/clipdeck.service
	chmod 644 $(DESTDIR)$(PREFIX)/lib/systemd/user/clipdeck.service
	install -Dm644 io.github.bonbon08.clipdeck.desktop $(DESTDIR)$(PREFIX)/share/applications/io.github.bonbon08.clipdeck.desktop
	install -Dm644 LICENSE $(DESTDIR)$(PREFIX)/share/licenses/clipdeck/LICENSE
	install -Dm644 README.md $(DESTDIR)$(PREFIX)/share/doc/clipdeck/README.md

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/clipdeck $(DESTDIR)$(BINDIR)/clipdeck-gui \
	      $(DESTDIR)$(PREFIX)/lib/systemd/user/clipdeck.service \
	      $(DESTDIR)$(PREFIX)/share/applications/io.github.bonbon08.clipdeck.desktop
	rm -rf $(DESTDIR)$(PREFIX)/share/licenses/clipdeck $(DESTDIR)$(PREFIX)/share/doc/clipdeck

.PHONY: install uninstall
