#!/usr/bin/python3

import os
import subprocess


def GetMACAddresses():
  cmd = ['ip', 'a']
  proc = subprocess.Popen(cmd, stdout=subprocess.PIPE)
  proc.wait()
  if proc.returncode != 0:
    raise RuntimeError('Could not run "ip a" search for ethernet mac addresses.')
  #print('proc.communicate()', proc.communicate()[0].decode().splitlines())
  lines = [L for L in proc.communicate()[0].decode().splitlines() if L.strip().startswith('link/ether 9c:bf:0d')]
  mac_addresses = [L.split()[1] for L in lines]
  return mac_addresses

print(GetMACAddresses())

