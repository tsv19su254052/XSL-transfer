# todo пока работает с XSLT только версии 1.0
from configparser import ConfigParser
from lxml import etree


config_from_cfg = ConfigParser()
config_from_cfg.read('configCommon.cfg')

# Выходной файл
xml_output = "file_XML_output_by_lxml_3.xml"

dom_by_lxml = etree.parse(config_from_cfg.get(section='FileNames', option='xml_input'))
xslt = etree.parse(config_from_cfg.get(section='FileNames', option='xsl_filename'))
transform = etree.XSLT(xslt)
newdom_by_lxml = transform(dom_by_lxml)
print(etree.tostring(newdom_by_lxml, pretty_print=True))
