import pathlib
import os


def isfloat(value):
    try:
        float(value)
        return True
    except ValueError:
        return False


# Function that does the conversion
#
def toOpenSeesPy(infile, outfile, alias=''):
    # Add a dot if needed
    if len(alias) > 0 and alias[-1] != '.':
        alias = alias + '.'

    infile = open(infile, 'r')
    for line in infile:
        info = line.split()
        N = len(info)

        # Skip a blank line
        if N < 1:
            outfile.write('\n')
            continue
            # Ignore a close brace
        if info[0][0] == '}':
            continue
        # Echo a comment line
        if info[0][0] == '#':
            outfile.write(line)
            continue

        # Change print to printModel
        if info[0] == 'print':
            info[0] = 'printModel'

        # A command with no arguments, e.g., wipe
        if N == 1:
            outfile.write(f"{alias}{info[0]}()\n")
            continue

        # Needs to be a special case due to beam integration
        if N >= 8 and info[1] in ['nonlinearBeamColumn', 'forceBeamColumn', 'dispBeamColumn']:
            eleTag = info[2]
            secTag = info[6]
            # The original element format
            # element beamColumn tag ndI ndJ Np secTag transfTag
            #    0        1       2   3   4   5    6       7
            if isfloat(secTag):
                Np = info[5]
                transfTag = info[7]
                if info[1] == 'dispBeamColumn':
                    outfile.write(f"{alias}beamIntegration('Legendre',{eleTag},{secTag},{Np})\n")
                else:
                    outfile.write(f"{alias}beamIntegration('Lobatto',{eleTag},{secTag},{Np})\n")
            # The newer element format
            # element beamColumn tag ndI ndJ transfTag integrType ...
            #    0        1       2   3   4      5         6
            else:
                transfTag = info[5]
                outfile.write(f"{alias}beamIntegration('{info[6]}',{eleTag}")
                for j in range(7, N):
                    outfile.write(f',{info[j]}')
                outfile.write(')\n')
            if info[1] == 'nonlinearBeamColumn':
                info[1] = 'forceBeamColumn'
            outfile.write(f"{alias}element('{info[1]}',{eleTag},{info[3]},{info[4]},{transfTag},{eleTag})\n")
            continue

        # Have to do the first argument before loop because of the commas
        if isfloat(info[1]):
            outfile.write(f'{alias}{info[0]}({info[1]}')
        else:
            outfile.write(f"{alias}{info[0]}('{info[1]}'")
        # Now loop through the remaining arguments with preceding commas
        writeClose = True
        for i in range(2, N):
            if info[i] == '{':
                writeClose = True
                break
            if info[i] == '}':
                writeClose = False
                break
            if isfloat(info[i]):
                outfile.write(f',{info[i]}')
            else:
                outfile.write(f",'{info[i]}'")
        if writeClose:
            outfile.write(')\n')
    infile.close()

    outfile.write('\n\n')


if __name__ == '__main__':
    ouputFile = pathlib.Path('new.py')
    toOpenSeesPy('./foulModel.tcl', ouputFile)
