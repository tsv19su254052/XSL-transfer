# Interpreter 3.8 (+) -> 3.9 (+) -> 3.10 (-) -> 3.11 (++) -> 3.12 (+)

import os
from configparser import ConfigParser
# todo пока с XSLT версии 3.0 работают только эти библиотеки
import saxoncee  # Enterprise Edition (самая крутая и быстрая) oт Saxon-а (см. https://www.saxonica.com/saxon-c/index.xml )
# есть библиотеки saxoncpe (Professional Edition), saxonche (Home Edition) - O`Neil Prattler

# Нейросетки
import anthropic  # работа с исходниками
import openai
#import pytorch  # пока не ставится
import pytorch_accelerated
import torch
import turbo_alignment
import ultralytics
import tensorflow


config_from_cfg = ConfigParser()
config_from_cfg.read('configCommon.cfg')


def main():
    with saxoncee.PySaxonProcessor(license=True) as Process_Saxon:
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
    main()
