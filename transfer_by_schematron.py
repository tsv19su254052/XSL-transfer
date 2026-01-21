# Interpreter 3.8 (+) -> 3.9 (+) -> 3.10 (-) -> 3.11 (++) -> 3.12 (+) -X-> 3.13

from configparser import ConfigParser
import pyschematron


config_from_cfg = ConfigParser()
config_from_cfg.read('configCommon.cfg')


