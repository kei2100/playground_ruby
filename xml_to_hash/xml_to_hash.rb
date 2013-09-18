#!/usr/bin/env ruby
# encoding:utf-8

require 'bundler'
Bundler.require

class XmlToHash
  def self.element_to_hash(xml_element)
    hash = {element: xml_element.name}
  
    attribute_hash = element_attribute_to_hash(xml_element)
    hash[:attribute] = attribute_hash unless attribute_hash.empty?
  
    contents = element_contents_to_array(xml_element)
    unless contents.empty?
      if contents.size == 1
        hash[:contents] = contents[0]
      else
        hash[:contents] = contents
      end
    end
  
    return hash
  end
  
  def self.element_attribute_to_hash(xml_element)
    hash = {}
    xml_element.attributes.each do |attr_key, attr_val|
      hash[attr_key.to_sym] = attr_val.value
    end
    return hash
  end
  
  def self.element_contents_to_array(xml_element)
    contents = []
    xml_element.children.each do |child|
      case 
      when child.text?
        content_striped = child.text.strip
        contents << content_striped unless content_striped.empty?
      when child.element?
        contents << element_to_hash(child)
      end
    end
    return contents
  end
end
