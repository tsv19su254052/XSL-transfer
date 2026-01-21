# Interpreter 3.8 (+) -> 3.9 (+) -> 3.10 (-) -> 3.11 (++) -> 3.12 (++) -> 3.13 (+) -> 3.14 (+)

import os
from configparser import ConfigParser
# todo пока с XSLT 3-й версии и новее работают только эти библиотеки
import saxoncee  # Enterprise Edition (самая крутая и быстрая) oт Saxon-а (см. https://www.saxonica.com/saxon-c/index.xml )
# есть также библиотеки
#  - saxoncpe (Professional Edition),
#  - saxonche (Home Edition) - O`Neil Prattler


config_from_cfg = ConfigParser()
config_from_cfg.read('configCommon.cfg')


def main_function():
    with saxoncee.PySaxonProcessor(license=True) as Process_Saxon:
        print(Process_Saxon.version)
        # см. статью https://pypi.org/project/saxoncee
        Process_xslt = Process_Saxon.new_xslt30_processor()
        Process_Saxon.set_cwd(os.getcwd())
        Output = Process_xslt.transform_to_string(source_file=config_from_cfg.get(section='FileNames',
                                                                                  option='xml_input'),
                                                  stylesheet_file=config_from_cfg.get(section='FileNames',
                                                                                      option='xsl_filename'))
        with open(file=config_from_cfg.get(section='FileNames',
                                           option='xml_output'),
                  mode="w") as f:
            f.write(Output)
            print("Преобразование выполнено")


# Точка входа
if __name__ == "__main__":
    main_function()
