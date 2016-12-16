#! /usr/bin/env python3
import subprocess
import gi

gi.require_version('Playerctl', '1.0')
gi.require_version('Notify', '0.7')

from gi.repository import Playerctl, Notify, GLib

player = Playerctl.Player()
Notify.init("spotify-notify")

def on_track_change(player, e):
    track_info = '{artist} - {title}'.format(artist=player.get_artist(), title=player.get_title())

    notif = "notify-send.sh --replace=%d \"\" \"%s\"" % (52, track_info)
    process = subprocess.Popen(notif.split())
    process.communicate()


player.on('metadata', on_track_change)

GLib.MainLoop().run()
