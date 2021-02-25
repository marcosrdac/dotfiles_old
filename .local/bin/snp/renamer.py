#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import os


def main():
    ls = os.listdir()
    for i in ls:
        if " - " in i:
            j = i.replace(' - ', ' ')
            os.rename(i, j)


if __name__ == '__main__':
    main()
