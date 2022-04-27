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

    def tcl2py(self):
        with open(self.tclFilename, 'r') as tclFile:
            tclLines = tclFile.readlines()

    def _get_node_lines(self) -> list:
        node_lines = []
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
            for line in tclLines:
                if line.startswith('node'):
                    node_lines.append(line)
        tclFile.close()
        return node_lines

    def node(self):
        # TODO The case that the line spit is different than tab.
        # It can be a single or multiple spaces.
        #  labels: todo

        # TODO In case that the problem is 2D and not 3D.
        # labels: todo, enhancement
        # assignees: iammix
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
            self.node_lines.append(f"ops.node({node_tag[i]}, {x[i]}, {y[i]}, {z[i]})")
        return self.node_lines

    def fix(self):
        # TODO Arguments Split with something else than tab.
        # labels: todo, enhancement
        # assignees: iammix

        lines = self._get_fix_lines()
        node_tag = []
        x_fix = []
        y_fix = []
        z_fix = []
        xr_fix = []
        yr_fix = []
        zr_fix = []

        lines = self._get_fix_lines()
        for line in lines:
            if line.endswith('\n'):
                line = line[:-1]
            if line.endswith(';'):
                line = line[:-1]
            line_list = line.split('\t')
            if len(line_list) > 1:
                node_tag.append(int(line_list[1]))
                x_fix.append(float(line_list[2]))
                y_fix.append(float(line_list[3]))
                z_fix.append(float(line_list[4]))
                xr_fix.append(float(line_list[5]))
                yr_fix.append(float(line_list[6]))
                zr_fix.append(float(line_list[7]))
            else:
                pass
        self.fix_lines = []
        for i in range(len(node_tag)):
            self.fix_lines.append(
                f"ops.fix({node_tag[i]}, {x_fix[i]}, {y_fix[i]}, {z_fix[i]}, {xr_fix[i]}, {yr_fix[i]}, {zr_fix[i]})")
        return self.fix_lines

    def _get_fix_lines(self) -> list:
        fix_lines = []
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
            for line in tclLines:
                if line.startswith('fix'):
                    fix_lines.append(line)
        tclFile.close()
        return fix_lines


if __name__ == "__main__":
    project_path = Path(__file__).absolute().parent
    tclFileName = os.path.join(project_path, "Fix.tcl")
    convert = ConvertTcl2Py(tclFileName)
    lines = convert.fix()
    with open('python.py', 'w') as pythonFile:
        for line in lines:
            pythonFile.write(line + '\n')
    pythonFile.close()

