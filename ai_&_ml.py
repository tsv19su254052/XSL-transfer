# Interpreter 3.8 (+) -> 3.9 (+) -> 3.10 (-) -> 3.11 (++) -> 3.12 (-) -X-> 3.13 () -> 3.14 ()

from configparser import ConfigParser

# Нейросетки
import anthropic  # работа с исходниками
import openai
import pytorch  # пока не ставится
import pytorch_accelerated
import torch
import turbo_alignment  # на 3.12 не ставится
import ultralytics
import tensorflow
import keras


config_from_cfg = ConfigParser()
config_from_cfg.read('configCommon.cfg')
