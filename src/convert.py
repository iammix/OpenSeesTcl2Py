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

    def tcl2py(self):
        with open(self.tclFilename, 'r') as tclFile:
            tclLines = tclFile.readlines()
    
    def node_convert(self):
        lines = self._get_lines()
        for line in lines:
            if line.startswith('node'):
                line = self._convert_tabs_to_commas(line)
                line = self._convert_nodeComma_to_nodeParenthesis(line)
                print(line)


    def _convert_tabs_to_commas(self, string:str)->str:
        return string.replace('\t', ', ')
    
    def _convert_nodeComma_to_nodeParenthesis(self, string:str)->str:
        return string.replace('node, ','ops.node(')



if __name__ == "__main__":
    project_path = Path(__file__).absolute().parent
    tclFileName = os.path.join(project_path, "Nodes.tcl")
    convert = ConvertTcl2Py(tclFileName)
    convert.node_convert()
