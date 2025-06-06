#!/usr/bin/env python3

from update_xml import *
import os

xfceconf = os.path.join(os.environ['HOME'],
                        '.config/xfce4/xfconf/xfce-perchannel-xml')
os.system(f'mkdir -p {os.path.dirname(xfceconf)}')

with UpdateXMLConf(os.path.join(xfceconf, 'xfce4-screensaver.xml')) as ux:
  ux.SetPropertyValue(['saver', 'idle-activation', 'delay'], 120)

with UpdateXMLConf(os.path.join(xfceconf, 'xfce4-panel.xml')) as ux:
  ux.SetPropertyValue(['panels', 'panel-1', 'position'], "p=8;x=1280;y=1575")
  ux.SetPropertyValue(['panels', 'panel-1', 'length'], 100)
  ux.SetPropertyValue(['panels', 'panel-1', 'position-locked'], True)
  ux.SetPropertyValue(['panels', 'panel-1', 'background-style'], 0)
  ux.SetPropertyValue(['panels', 'panel-1', 'size'], 48)
  ux.SetPropertyValue(['panels', 'panel-1', 'length-adjust'], True)
  ux.SetPropertyValue(['panels', 'panel-1', 'mode'], 0)
  ux.SetPropertyValue(['panels', 'panel-1', 'autohide-behavior'], 2)

with UpdateXMLConf(os.path.join(xfceconf, 'xfce4-terminal.xml')) as ux:
  ux.SetPropertyValue(['font-name'], 'DejaVu Sans Mono 10')
  ux.SetPropertyValue(['misc-default-geometry'], '80x42')
  ux.SetPropertyValue(['misc-show-unsafe-paste-dialog'], False)

with UpdateXMLConf(os.path.join(xfceconf, 'xsettings.xml')) as ux:
  ux.SetPropertyValue(['Net', 'DoubleClickDistance'], 5)
  ux.SetPropertyValue(['Xft', 'DPI'], 189)
  ux.SetPropertyValue(['Xfce', 'LastCustomDPI'], 189)
  ux.SetPropertyValue(['Gtk', 'FontName'], 'Noto Sans 9')
  ux.SetPropertyValue(['Gtk', 'CursorThemeName'], 'DMZ-White')
  ux.SetPropertyValue(['Gtk', 'CursorThemeSize'], 31)

