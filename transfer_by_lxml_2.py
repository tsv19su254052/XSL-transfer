# todo пока работает с XSLT только версии 1.0
from configparser import ConfigParser
from lxml import etree


config_from_cfg = ConfigParser()
config_from_cfg.read('configCommon.cfg')

# Выходной файл
xml_output = "file_XML_output_by_lxml_2.xml"

xslt = etree.XSLT(etree.parse(config_from_cfg.get(section='FileNames', option='xsl_filename')))
result = xslt(etree.parse(config_from_cfg.get(section='FileNames', option='xml_input')))

with open(xml_output, 'wb') as f:
    St = etree.tostring(result)
    f.write(St)
    print("Преобразование выполнено")
