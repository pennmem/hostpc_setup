#!/usr/bin/env python3

from update_xml import *

xfceconf = os.path.join(os.environ['HOME'],
                        '.config/xfce4/xfconf/xfce-perchannel-xml')

with UpdateXMLConf(os.path.join(xfceconf, 'xfce4-screensaver.xml')) as ux:
  ux.SetPropertyValue(['saver', 'idle-activation', 'delay'], 120)

with UpdateXMLConf('testpanel.xml') as ux:
  ux.SetPropertyValue(['panels', 'panel-1', 'position'], "p=8;x=1280;y=1575")
  ux.SetPropertyValue(['panels', 'panel-1', 'length'], 100)
  ux.SetPropertyValue(['panels', 'panel-1', 'position-locked'], True)
  ux.SetPropertyValue(['panels', 'panel-1', 'background-style'], 0)
  ux.SetPropertyValue(['panels', 'panel-1', 'size'], 48)
  ux.SetPropertyValue(['panels', 'panel-1', 'length-adjust'], True)
  ux.SetPropertyValue(['panels', 'panel-1', 'mode'], 0)
  ux.SetPropertyValue(['panels', 'panel-1', 'autohide-behavior'], 2)
