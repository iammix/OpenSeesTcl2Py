import os
from pathlib import Path


class ConvertTcl2Py():

    def __init__(self, tclFileName:str):
        self.tclFileName = tclFileName
        self.pyLines = []

    def _get_lines(self)->str:
        with open(self.tclFileName, 'r') as tclFile:
            tclLines = tclFile.readlines()
        tclFile.close()
        return tclLines
    
    def _get_node_lines(self)->str:
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
        lines = self._get_node_lines()
        node_tag = []
        x = []
        y = []
        z = []
        for line in lines:
            line_list = line.split('\t')
            if len(line_list) > 1:
                node_tag.append(line_list[0])
                x.append(line_list[1])
                y.append(line_list[2])
                z.append(line_list[3])
            else:
                # TODO In case the separation is not tab but something else
                #  labels: todo
                
                pass
        print(node_tag, x, y, z)




if __name__ == "__main__":
    project_path = Path(__file__).absolute().parent
    tclFileName = os.path.join(project_path, "Nodes.tcl")
    convert = ConvertTcl2Py(tclFileName)
    convert.node()
