import sys
from setuptools import setup, find_packages

PACKAGE_NAME = 'struc2vec'
MINIMUM_PYTHON_VERSION = 3, 7


def check_python_version():
    """
    Exit when the Python version is too low.
    """
    if sys.version_info < MINIMUM_PYTHON_VERSION:
        sys.exit("Python {}.{}+ is required.".format(*MINIMUM_PYTHON_VERSION))

with open('requirements.txt', 'r') as f:
    install_requires = list()
    for line in f:
        re = line.strip()
        if re:
            install_requires.append(re)

check_python_version()

setup(name=PACKAGE_NAME,
      version='master',
      description='struc2vec',
      author='Tony Joseph',
      url='https://github.com/patagona-technologies/struc2vec',
      maintainer_email='team@patagona.ca',
      maintainer='Development team',
      license='Copyright (C) Patagona Technologies Inc. - All Rights Reserved',
      packages=find_packages(exclude=['pyenv*']),
      zip_safe=False,
      python_requires='>=2.7',
      install_requires=install_requires
      )
