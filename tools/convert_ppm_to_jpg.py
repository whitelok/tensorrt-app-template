# -*- coding: UTF-8 -*-
try:
    import Image
except BaseException:
    print "Please install PIL package with pip install Pillow"
import argparse
import os

if '__main__' == __name__:
    parser = argparse.ArgumentParser()
    parser.add_argument('ppm_path', type=str, help='PPM image path')
    parser.add_argument(
        '--target_path',
        required=False,
        help='converted jpg image path',
        type=str)
    args = parser.parse_args()

    ppm_path = args.ppm_path
    target_path = args.target_path

    assert os.path.exists(ppm_path), "PPM image is not exists!!!"

    if target_path is None:
        target_path = os.path.join('data', os.path.basename(ppm_path) + '.jpg')

    Image.open(ppm_path).save(target_path)
