#!/usr/bin/env python2
import logging                  # Including many defaults, can be removed if unneeded
import argparse
import os
import numpy as np
import pandas as pd
import math
import re


def TEMPLATE(options):
    """ DESCRIPTION """
    logging.debug("Called with {}".format(options))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="DESCRIPTION")
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="increase output verbosity")
    parser.add_argument("-o", "--output_stub", type=str, required=False,
                        help="stub of name to write output to")
    parser.add_argument('--err', nargs='?', type=argparse.FileType('w'),
                        default=None)
    parser.add_argument('files', metavar='f', type=str, nargs='+',
                        help='input files')
    args = parser.parse_args()

    if args.verbose:
        logging.basicConfig(format='%(levelname)s: %(message)s', level=logging.DEBUG)
        logging.debug("Verbose debuging mode activated")
    else:
        logging.basicConfig(format='%(levelname)s: %(message)s', level=logging.INFO)

    if args.err is not None:
        root = logging.getLogger()
        ch = logging.StreamHandler(args.err)
        ch.setLevel(logging.ERROR)
        formatter = logging.Formatter('%(levelname)s: %(message)s')
        ch.setFormatter(formatter)
        root.addHandler(ch)


    TEMPLATE(args)
