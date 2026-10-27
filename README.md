# clipdeck

Clip-Recorder für Linux: clipdeck nimmt dauerhaft im Hintergrund in einen
Replay-Puffer auf. Ein Tastendruck (Standard: **F8**) speichert die letzten
Sekunden als Videodatei, ideal für Gaming-Highlights.

- Hardware-Encoding über [gpu-screen-recorder](https://git.dec05eba.com/gpu-screen-recorder/about/) (AMD, Intel, NVIDIA)
- Funktioniert unter **Wayland** (über den xdg-desktop-portal) und unter X11
- Desktop-Ton und Mikrofon
- GTK4/libadwaita-Oberfläche und CLI
- GNOME-Hotkey wird automatisch eingerichtet
- Läuft als systemd-User-Service, auf Wunsch mit Autostart

> clipdeck ist ein unabhängiges Projekt und steht in keiner Verbindung zu Medal.tv oder anderen Clip-Diensten.

## Installation

### Arch Linux

```bash
git clone https://github.com/bonbon08/clipdeck.git
cd clipdeck
yay -S gpu-screen-recorder   # Abhängigkeit aus dem AUR
makepkg -si
```

### Andere Distributionen

Benötigt: `bash`, `gpu-screen-recorder`, `python3`, PyGObject, GTK 4, libadwaita ≥ 1.5

```bash
sudo make install            # PREFIX=/usr ist Standard
```

## Einrichtung

Einmalig als normaler Benutzer:

```bash
clipdeck setup
```

Der Befehl legt `~/.config/clipdeck/config` an, aktiviert den Autostart und
richtet den Hotkey ein. Alternativ öffnest du einfach die App **clipdeck**.

Beim ersten Start fragt der Desktop, welcher Bildschirm aufgenommen werden soll.
Die Auswahl wird gespeichert. Clips landen standardmäßig in `~/Videos/Clips`.

## Benutzung

| Befehl | Funktion |
|---|---|
| `clipdeck-gui` | Grafische Oberfläche |
| `clipdeck start` / `stop` | Replay-Puffer starten / stoppen |
| `clipdeck clip` | Letzte N Sekunden speichern (auf den Hotkey gelegt) |
| `clipdeck status` / `logs` | Service-Status / Live-Log |
| `clipdeck open` | Clip-Ordner öffnen |
| `clipdeck hotkey` | GNOME-Hotkey nach Änderung neu setzen |
| `clipdeck reset` | Autostart und Hotkey entfernen |

## Konfiguration

`~/.config/clipdeck/config` (Shell-Syntax, auch über die GUI bearbeitbar):

```bash
CLIP_SECONDS=30                       # Länge des Puffers
FPS=60
OUTPUT_DIR="$HOME/Videos/Clips"
QUALITY=very_high                     # medium | high | very_high | ultra
CODEC=auto                            # auto | h264 | hevc | av1
CONTAINER=mp4                         # mp4 | mkv
CAPTURE=portal                        # portal (Wayland) | screen | <Monitorname>
AUDIO="default_output|default_input"  # "" = kein Ton
HOTKEY=F8                             # GNOME-Format, z.B. "<Alt>F10"
```

## Hinweise

- **Andere Desktops (KDE, Hyprland, Sway …):** Lege ein globales Tastenkürzel
  auf den Befehl `clipdeck clip`.
- **Hotkey im Spiel wirkungslos:** Manche Vollbild-Spiele blockieren globale
  Tastenkürzel. GNOME fragt dann, ob das Spiel das darf. Wähle in dem Fall „Ablehnen“.
- **Flatpak-Version von gpu-screen-recorder:** Die Aufnahme funktioniert, aber
  Clips werden nicht umbenannt und es gibt keine Benachrichtigung, da das
  Speicher-Skript außerhalb der Sandbox liegt.

## Lizenz

MIT
