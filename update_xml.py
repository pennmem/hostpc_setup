#!/usr/bin/env python3

import xml.etree.ElementTree as ET
import os

class UpdateXMLConf():
  def __init__(self, pathname):
    self.type_map = {'int':'int', 'bool':'bool', 'str':'string'}
    self.Open(pathname)

  def __enter__(self):
    return self

  def __exit__(self, exc_type, exc_val, exc_tb):
    if exc_type is None:
      self.Save()

  def Open(self, pathname):
    self.pathname = pathname
    self.tree = ET.parse(self.pathname)
    self.root = self.tree.getroot()

  def Save(self):
    ET.indent(self.tree, space='  ', level=0)
    self.tree.write(self.pathname, encoding='UTF-8', xml_declaration=True)
    with open(self.pathname, 'a') as fw:
      fw.write('\n')

  def SetPropertyValue(self, name_traversal, value):
    valuestr = str(value) if not isinstance(value, bool) else str(value).lower()
    level = self.root
    for i,name in enumerate(name_traversal):
      found = False
      for p in level:
        if 'name' in p.keys() and p.get('name') == name:
          level = p
          found = True
          if i == len(name_traversal)-1:
            p.set('value', valuestr)
          break
      if not found:
        if i == len(name_traversal)-1:
          level.append(ET.fromstring(f'<property name="{name}" type="{self.type_map[value.__class__.__name__]}" value="{valuestr}"/>'))
          break
        else:
          new_p = ET.fromstring(f'<property name="{name}" type="empty"></property>')
          level.append(new_p)
          level = new_p
          continue

