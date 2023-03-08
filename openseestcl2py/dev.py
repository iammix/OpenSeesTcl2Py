import convert


def test1():
    lines = 'fhjakkfhbasifbaivifasfaivw4yi $adfhkefugaei'
    lines = lines.replace('$', '')
    print(lines)

def model_builder():
    model = convert.ConvertTcl2Py(r'C:\Projects\OpenSeesTcl2Py\src\modelfile.tcl')
    model.get_model_type()


if __name__ == '__main__':
    test1()
