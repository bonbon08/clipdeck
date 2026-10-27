# Maintainer: bonbon08 <mail@jan-schmitt.eu>
pkgname=clipdeck
pkgver=0.1.0
pkgrel=1
pkgdesc="Replay-Clip-Recorder: speichert die letzten Sekunden des Bildschirms per Hotkey (GTK4-GUI)"
arch=('any')
url="https://github.com/bonbon08/clipdeck"
license=('MIT')
depends=('bash' 'gpu-screen-recorder' 'python' 'python-gobject' 'gtk4' 'libadwaita' 'procps-ng' 'systemd')
optdepends=('libnotify: Benachrichtigung nach dem Speichern'
            'libpulse: Auslöser-Sound nach dem Speichern'
            'sound-theme-freedesktop: Auslöser-Sound'
            'xdg-utils: clipdeck open'
            'gnome-settings-daemon: automatisch eingerichteter Hotkey')
install=clipdeck.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('247d5ee10543560f44089a0999d373c01daf214eedca301bf269785481b30960')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
