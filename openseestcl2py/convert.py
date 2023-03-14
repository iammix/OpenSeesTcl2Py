import os
from pathlib import Path
import shutil
from typing import List
import utilities


class ConvertTcl2Py:
    """
    Converts OpenSees models written in .tcl to .py!
    """

    def __init__(self, tclFileName: str, seperator: str = ' '):
        self.tclFileName = tclFileName
        self.pyLines = []
        self.seperator = seperator  # space or tab
        self.modelType = self._get_model_type()
        self.tcl_lines = self._get_lines()
        self.tcl_lines = self._remove_dollar_sign()
        self.tcl_lines = self._remove_semi_column()
        self.tcl_lines = self._remove_sets()
        self.tcl_lines = self._remove_right_parenthesis()

    def _remove_expr(self) -> List:
        lines = []
        for line in self.tcl_lines:
            lines.append(line.replace('[expr', ''))
        return lines

    def _remove_right_parenthesis(self) -> List:
        lines = []
        for line in self.tcl_lines:
            lines.append(line.replace(']', ''))
        return lines

    def _remove_sets(self) -> List:
        lines = []
        for line in self.tcl_lines:
            lines.append(line.replace('set', ''))
        return lines

    def _remove_semi_column(self) -> List:
        lines = []
        for line in self.tcl_lines:
            lines.append(line.replace(';', ''))
        return lines

    def _remove_dollar_sign(self) -> List:
        lines = []
        for line in self.tcl_lines:
            lines.append(line.replace('$', ''))
        return lines

    def _get_lines(self) -> List[str]:
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
        tclFile.close()
        return tclLines

    def _get_model_type(self) -> str:
        lines = self._get_lines()
        for line in lines:
            if line.startswith('model'):
                if line.split(self.seperator)[3] == '2':
                    self.modelType = '2D'
                else:
                    self.modelType = '3D'
        return self.modelType

    def tcl2py(self):
        with open(self.tclFilename, 'r') as tclFile:
            tclLines = tclFile.readlines()

    def _get_node_lines(self) -> list:
        node_lines = []
        for line in self.tcl_lines:
            if line.startswith('node'):
                node_lines.append(line)
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

            line_list_space = line.split(' ')
            line_list_tab = line.split('\t')
            if len(line_list_space) > len(line_list_tab):
                line_list = line_list_space
            else:
                line_list = line_list_tab
            if len(line_list) > 1:
                node_tag.append(int(line_list[1]))
                x.append(utilities.convert_to_number(line_list[2]))
                y.append(utilities.convert_to_number(line_list[3]))
                z.append(utilities.convert_to_number(line_list[4]))
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
            line_list = line.split(' ')
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
                f"ops.fix({node_tag[i]}, {int(x_fix[i])}, {int(y_fix[i])}, {int(z_fix[i])}, {int(xr_fix[i])}, {int(yr_fix[i])}, {int(zr_fix[i])})")
        return self.fix_lines

    def _get_fix_lines(self) -> List:
        fix_lines = []
        for line in self.tcl_lines:
            if line.startswith('fix'):
                fix_lines.append(line)
        return fix_lines

    def mass(self):
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

            line_list = line.split(' ')
            if len(line_list) > 1:
                node_tag.append(int(line_list[1]))
                x_mass.append(float(line_list[2]))
                y_mass.append(float(line_list[3]))
                z_mass.append(float(line_list[4]))
                xr_mass.append(float(line_list[5]))
                yr_mass.append(float(line_list[6]))
                zr_mass.append(float(line_list[7]))
            else:
                line_list = line.split('\t')
                node_tag.append(int(line_list[1]))
                x_mass.append(float(line_list[2]))
                y_mass.append(float(line_list[3]))
                z_mass.append(float(line_list[4]))
                xr_mass.append(float(line_list[5]))
                yr_mass.append(float(line_list[6]))
                zr_mass.append(float(line_list[7]))
        self.mass_lines = []
        for i in range(len(node_tag)):
            self.mass_lines.append(
                f"ops.mass({node_tag[i]}, {x_mass[i]}, {y_mass[i]}, {z_mass[i]}, {xr_mass[i]}, {yr_mass[i]}, {zr_mass[i]})")
        return self.mass_lines

    def _get_mass_lines(self) -> List:
        mass_lines = []
        for line in self.tcl_lines:
            if line.startswith('mass'):
                mass_lines.append(line)
        return mass_lines

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

    def _get_section_elastic_lines(self) -> List:
        section_elastic_lines = []
        for line in self.tcl_lines:
            if line.startswith('section'):
                line_split = line.split(' ')
                if line_split[1] == 'Elastic':
                    section_elastic_lines.append(line)
        return section_elastic_lines

    def geotransform(self):
        # TODO Leaves a \n at the end of the arguments
        # labels: bug
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
                f"ops.geomTransf('{geotransform_list[i][1]}', {geotransform_list[i][2]}, {geotransform_list[i][3]}, {geotransform_list[i][4]}, {geotransform_list[i][5]})")
        return self.geotransform_lines

    def _get_geotransform_lines(self) -> List:
        geotransform_lines = []
        for line in self.tcl_lines:
            if line.startswith('geomTransf'):
                geotransform_lines.append(line)
        return geotransform_lines

    def element_nonlinearBeamColumn(self):
        lines = self._get_element_nonlinearBeamColumn_lines()
        element_list = []
        for line in lines:
            line_list = line.split(' ')
            if len(line_list) > 1:
                element_list.append(line_list)
            else:
                pass
        self.element_lines = []
        for i in range(len(element_list)):
            self.element_lines.append(
                f"ops.element('nonlinearBeamColumn', {element_list[i][2]}, {element_list[i][3]}, {element_list[i][4]}, {element_list[i][5]}, {element_list[i][6]}, {element_list[i][7]})")
        return self.element_lines

    def _get_element_nonlinearBeamColumn_lines(self) -> List:
        element_nonlinearBeamColumn_lines = []
        for line in self.tcl_lines:
            if line.startswith('element'):
                new_line = line.split(' ')
                if new_line[1] == 'nonlinearBeamColumn':
                    element_nonlinearBeamColumn_lines.append(line)
        return element_nonlinearBeamColumn_lines

    def element_zerolength(self):
        lines = self._get_element_zerolength()
        element_list21 = []
        element_list19 = []
        for line in lines:
            line_list = line.split(' ')
            if len(line_list) > 21:
                element_list21.append(line_list)
            else:
                element_list19.append(line_list)
        self.element_lines = []
        for i in range(len(element_list21)):
            self.element_lines.append(
                f"ops.element('zeroLength', {element_list21[i][2]}, {element_list21[i][3]}, {element_list21[i][4]}, '-mat', {element_list21[i][6]}, {element_list21[i][7]}, {element_list21[i][8]}, {element_list21[i][9]}, {element_list21[i][10]}, '-dir', 1, 2, 3, 4, 5, 6, '-orient', 0, 0, 1, 1, 0, 0)"
            )
        for i in range(len(element_list19)):
            self.element_lines.append(
                f"ops.element('zeroLength', {element_list19[i][2]}, {element_list19[i][3]}, {element_list19[i][4]}, '-mat', {element_list19[i][6]}, {element_list19[i][7]}, {element_list19[i][8]}, '-dir', 1, 2, 3, '-orient', 0, 0, 1, 1, 0, 0)")

        return self.element_lines

    def _get_element_zerolength(self) -> List:
        element_zerolength_lines = []
        for line in self.tcl_lines:
            if line.startswith('element'):
                new_line = line.split(' ')
                if new_line[1] == 'zeroLength':
                    element_zerolength_lines.append(line)
        return element_zerolength_lines

    def uniaxialMaterial_elastic(self):
        lines = self._get_uniaxialMaterial_elastic_lines()
        uniaxialMaterial_list = []
        for line in lines:
            line_list = line.split(' ')
            uniaxialMaterial_list.append(line_list)
        self.uniaxialMaterial_elastic_lines = []
        for i in range(len(uniaxialMaterial_list)):
            self.uniaxialMaterial_elastic_lines.append(
                f"ops.uniaxialMaterial('Elastic', {uniaxialMaterial_list[i][2]}, {uniaxialMaterial_list[i][3]}, {uniaxialMaterial_list[i][4]})")
        return self.uniaxialMaterial_elastic_lines

    def _get_uniaxialMaterial_elastic_lines(self) -> List:
        uniaxialMaterial_lines = []
        for line in self.tcl_lines:
            if line.startswith('uniaxialMaterial'):
                new_line = line.split(' ')
                if new_line[1] == 'Elastic':
                    uniaxialMaterial_lines.append(line)
        return uniaxialMaterial_lines

    def uniaxialMaterial_steel01(self):
        lines = self._get_uniaxialMaterial_steel01_lines()
        uniaxialMaterial_list = []
        for line in lines:
            line_list = line.split(' ')
            uniaxialMaterial_list.append(line_list)
        self.uniaxialMaterial_steel01_lines = []
        for i in range(len(uniaxialMaterial_list)):
            self.uniaxialMaterial_steel01_lines.append(
                f"ops.uniaxialMaterial('Steel01', {uniaxialMaterial_list[i][2]}, {uniaxialMaterial_list[i][3]}, {uniaxialMaterial_list[i][4]}, {uniaxialMaterial_list[i][5]})"
            )
        return self.uniaxialMaterial_steel01_lines

    def _get_uniaxialMaterial_steel01_lines(self) -> List:
        uniaxialMaterial_lines = []
        for line in self.tcl_lines:
            if line.startswith('uniaxialMaterial'):
                new_line = line.split(' ')
                if new_line[1] == 'Steel01':
                    uniaxialMaterial_lines.append(line)
        return uniaxialMaterial_lines

    def recorders(self):
        lines = self._get_recorders_lines()
        recorder_list = []
        for line in lines:
            line_list = line.split(' ')
            recorder_list.append(line_list)
        self.recorder_Node_lines = []
        for i in range(len(recorder_list)):
            self.recorder_Node_lines.append(
                f"ops.recorder('Node', '-time', '-file', {recorder_list[i][4]}, '-node', {recorder_list[i][6]}, '-dof', {recorder_list[i][8]}, {recorder_list[i][9]})"
            )

        return self.recorder_Node_lines

    def _get_recorders_lines(self) -> list:
        recorder_lines = []
        for line in self.tcl_lines:
            if line.startswith('recorder'):
                new_line = line.split(' ')
                if new_line[1] == 'Node':
                    recorder_lines.append(line)
        return recorder_lines


def write_file():
    project_path = Path(__file__).absolute().parent
    if os.path.exists(os.path.join(project_path, 'bridge_model.py')):
        os.remove(os.path.join(project_path, 'bridge_model.py'))
        print('File Deleted . . .')

    modelName = 'bridge_model.tcl'
    tclFileName = os.path.join(project_path, modelName)
    convert = ConvertTcl2Py(tclFileName)
    lines = []

    lines.append(convert.geotransform())
    with open('modelOpenSeesPy.py', 'w') as pythonFile:
        pythonFile.write('import openseespy.opensees as ops\n')
        for line in lines:
            for item in line:
                pythonFile.write(item + '\n')
    pythonFile.close()


if __name__ == "__main__":
    write_file()
