import os
from pathlib import Path


class ConvertTcl2Py():

    def __init__(self, tclFileName: str):
        self.tclFileName = tclFileName
        self.pyLines = []

    def _get_lines(self) -> str:
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
        tclFile.close()
        return tclLines

    def _get_node_lines(self) -> str:
        node_lines = []
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
            for line in tclLines:
                if line.startswith('node'):
                    node_lines.append(line)
        tclFile.close()
        return node_lines

    def tcl2py(self):
        with open(self.tclFilename, 'r') as tclFile:
            tclLines = tclFile.readlines()

    def node(self):
        # TODO: Line split different than tab
        #  labels: todo
        lines = self._get_node_lines()
        node_tag = []
        x = []
        y = []
        z = []
        for line in lines:
            line_list = line.split('\t')
            if len(line_list) > 1:
                node_tag.append(int(line_list[1]))
                x.append(float(line_list[2]))
                y.append(float(line_list[3]))
                z.append(float(line_list[4]))
            else:
                pass
        self.node_lines = []
        for i in range(len(node_tag)):
            print(z[i])
            self.node_lines.append(f"ops.node({node_tag[i]}, {x[i]}, {y[i]}, {z[i]})")
        return self.node_lines


if __name__ == "__main__":
    project_path = Path(__file__).absolute().parent
    tclFileName = os.path.join(project_path, "Nodes.tcl")
    convert = ConvertTcl2Py(tclFileName)
    lines = convert.node()
    with open('python.py', 'w') as pythonFile:
        for line in lines:
            pythonFile.write(line + '\n')
    pythonFile.close()
