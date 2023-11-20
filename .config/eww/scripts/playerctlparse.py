#!/usr/bin/python
from sys import argv

match argv[1:]:
    case ["position", position]:
        position = int(float(position))
        minute = str(position // 60)
        second = str(position % 60)
        print(f"{minute}:{'0' + second if len(second) == 1 else second}")
    case ["length", *other, length]:
        length = int(length)//1000000
        minute = str(length // 60)
        second = str(length % 60)
        print(f"{minute}:{'0' + second if len(second) == 1 else second}")
    case ["positionperc", *other, length, position]:
        length = int(length)
        position = float(position)*1000000        
        print(position / length * 100)
    case ["percposition", *other, length, perc]:
        print((float(perc) / 100) * (int(length) // 100000))
        
