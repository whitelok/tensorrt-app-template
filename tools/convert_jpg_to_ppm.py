# -*- coding: UTF-8 -*-
try:
    import Image
except BaseException:
    print "Please install PIL package with pip install Pillow"
import argparse
import os

if '__main__' == __name__:
    parser = argparse.ArgumentParser()
    parser.add_argument('jpg_path', type=str, help='JPG image path')
    parser.add_argument(
        '--target_path',
        required=False,
        help='converted ppm image path',
        type=str)
    args = parser.parse_args()

    jpg_path = args.jpg_path
    target_path = args.target_path

    assert os.path.exists(jpg_path), "JPG image is not exists!!!"

    if target_path is None:
        target_path = os.path.join('bin', os.path.basename(jpg_path) + '.ppm')

    Image.open(jpg_path).save(target_path)
