import convert


def model_builder():
    model = convert.ConvertTcl2Py(r'C:\Projects\OpenSeesTcl2Py\src\modelfile.tcl')
    model.get_model_type()


if __name__ == '__main__':
    model_builder()
