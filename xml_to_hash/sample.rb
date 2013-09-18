#!/usr/bin/env ruby
# encoding:utf-8

require 'bundler'
Bundler.require
require 'pp'

require './xml_to_hash'

xml = <<EOM
<?xml version="1.0" encoding="UTF-8"?>
<items count="3" next="false">
  <item id="123">
    <name>Andy</name>
    <age>21</age>
  </item>
  <item id="234">
    <name>Brian</name>
    <age>23</age>
  </item>
  <item id="345">
    <name>Charles</name>
    <age>19</age>
  </item>
</items>
EOM

root = Nokogiri::XML(xml).root
pp XmlToHash.element_to_hash(root)

