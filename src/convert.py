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

    def mass(self):
        # TODO Mass arguments split with space not tab
        # labels: todo, enhancement
        # assignees: iammix

        lines = self._get_mass_lines()
        node_tag = []
        x_mass = []
        y_mass = []
        z_mass = []
        xr_mass = []
        yr_mass = []
        zr_mass = []

        for line in lines:
            if line.endswith('\n'):
                line = line[:-1]
            if line.endswith(';'):
                line = line[:-1]
            line_list = line.split('\t')
            if len(line_list) > 1:
                node_tag.append(int(line_list[1]))
                x_mass.append(float(line_list[2]))
                y_mass.append(float(line_list[3]))
                z_mass.append(float(line_list[4]))
                xr_mass.append(float(line_list[5]))
                yr_mass.append(float(line_list[6]))
                zr_mass.append(float(line_list[7]))
            else:
                pass
        self.mass_lines = []
        for i in range(len(node_tag)):
            self.mass_lines.append(
                f"ops.mass({node_tag[i]}, {x_mass[i]}, {y_mass[i]}, {z_mass[i]}, {xr_mass[i]}, {yr_mass[i]}, {zr_mass[i]})")
        return self.mass_lines

    def _get_mass_lines(self) -> list:
        mass_lines = []
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
            for line in tclLines:
                if line.startswith('mass'):
                    mass_lines.append(line)
        tclFile.close()
        return mass_lines

    def set_variables(self):
        # TODO Handle expr in variable setter
        #  labels: todo, enhancement
        #  assignees: iammix

        lines = self._get_set_lines()
        variable_list = []
        value_of_variable = []
        for line in lines:
            line_list = line.split(' ')
            if len(line_list) > 1:
                variable_list.append(line_list[1])
                if line_list[2].endswith(';'):
                    print(line_list[2])
                    line_list[2] = line_list[2][:-1]
                value_of_variable.append(line_list[2])
            else:
                pass
        self.set_variables_lines = []
        for i in range(len(variable_list)):
            self.set_variables_lines.append(f"{variable_list[i]} = {value_of_variable[i]}")
        return self.set_variables_lines

    def _get_set_lines(self) -> list:
        set_variable_lines = []
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
            for line in tclLines:
                if line.startswith('set'):
                    set_variable_lines.append(line)
        tclFile.close()
        return set_variable_lines

    def section_Elastic(self):
        lines = self._get_section_elastic_lines()
        section_list = []
        for line in lines:
            line_list = line.split(' ')
            if len(line_list) > 1:
                section_list.append(line_list)
            else:
                pass
        self.section_elastic_lines = []
        for i in range(len(section_list)):
            for j in range(2, 9):
                if section_list[i][j].startswith('$'):
                    section_list[i][j] = section_list[i][j][1:]
            self.section_elastic_lines.append(
                f"ops.section('Elastic', {section_list[i][2]}, {section_list[i][3]}, {section_list[i][4]}, {section_list[i][5]}, {section_list[i][6]}, {section_list[i][7]}, {section_list[i][8]})")
        return self.section_elastic_lines

    def _get_section_elastic_lines(self) -> list:
        section_elastic_lines = []
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
            for line in tclLines:
                if line.startswith('section'):
                    line_split = line.split(' ')
                    if line_split[1] == 'Elastic':
                        section_elastic_lines.append(line)
        tclFile.close()
        return section_elastic_lines

    def geotransform(self):
        # TODO [geotransform] remove $ from variable
        # labels: todo, bug
        # assignees: iammix
        lines = self._get_geotransform_lines()
        geotransform_list = []
        for line in lines:
            line_list = line.split(' ')
            if len(line_list) > 1:
                geotransform_list.append(line_list)
            else:
                pass
        self.geotransform_lines = []
        for i in range(len(geotransform_list)):
            self.geotransform_lines.append(
                f"ops.geotransform('{geotransform_list[i][1]}', {geotransform_list[i][2]}, {geotransform_list[i][3]}, {geotransform_list[i][4]}, {geotransform_list[i][5]})")
        return self.geotransform_lines

    def _get_geotransform_lines(self) -> list:
        geotransform_lines = []
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
            for line in tclLines:
                if line.startswith('geomTransf'):
                    geotransform_lines.append(line)
        tclFile.close()
        return geotransform_lines

    def element_nonlinearBeamColumn(self):
        lines = self._get_element_nonlinearBeamColumn_lines()
        element_list = []
        for line in lines:
            line_list = line.split(' ')
            if len(line_list) > 1:
                element_list.append(line_list)
            else: pass
        self.element_lines = []
        for i in range(len(element_list)):
            self.element_lines.append(
                f"ops.element('nonlinearBeamColumn', {element_list[i][2]}, {element_list[i][3]}, {element_list[i][4]}, {element_list[i][5]}, {element_list[i][6]}, {element_list[i][7]})")
        return self.element_lines

    def _get_element_nonlinearBeamColumn_lines(self) -> list:
        element_nonlinearBeamColumn_lines = []
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
            for line in tclLines:
                if line.startswith('element'):
                    new_line = line.split(' ')
                    if new_line[1] == 'nonlinearBeamColumn':
                        element_nonlinearBeamColumn_lines.append(line)
        tclFile.close()
        return element_nonlinearBeamColumn_lines


if __name__ == "__main__":
    project_path = Path(__file__).absolute().parent
    tclFileName = os.path.join(project_path, "ElementNonlinearBeamColumn.tcl")
    convert = ConvertTcl2Py(tclFileName)
    lines = convert.element_nonlinearBeamColumn()
    with open('model.py', 'w') as pythonFile:
        for line in lines:
            pythonFile.write(line + '\n')
    pythonFile.close()
