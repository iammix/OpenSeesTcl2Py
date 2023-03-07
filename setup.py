import setuptools

with open('README.md', 'r', encoding='utf-8') as file:
    long_description = file.read()

setuptools.setup(
    name='OpenSeesTcl2Py',
    version='0.0.1-rc1',
    author='Konstantinos Mixios',
    author_email='k.mixios@gmail.com',
    description='OpenSeesTcl2Py is a Python package that allows you to convert OpenSees tcl models in OpenSeesPy models.',
    long_description=long_description,
    long_description_content_type='text/markdown',
    project_urls={
        'Bug Tracker': 'https://github.com/iammix/OpenSeesTcl2Py/issues',
    },
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    package_dir={'': 'openseestcl2py'},
    packages=setuptools.find_packages(where='openseestcl2py'),
    python_requires='>=3.6',
)
