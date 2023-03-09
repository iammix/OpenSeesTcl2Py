############################################################################################
#-----------------------------------------------------------------------------------------
#  1. SET UP
#-----------------------------------------------------------------------------------------
##########################################################################################

wipe;									# clear opensees model
model BasicBuilder -ndm 3 -ndf 6;		# 3 dimensions, 6 dof per node
set dataDir Data;			# set up name of data directory
file mkdir $dataDir; 			# create data directory
set GMdir "../GMfiles";		# ground-motion file directory

set GravityDir Gravity;			# set up name of data directory
file mkdir $GravityDir; 			# create data directory
set GMdir "../GMfiles";		# ground-motion file directory

set THDir TH;			# set up name of data directory
file mkdir $THDir; 			# create data directory
set GMdir "../GMfiles";		# ground-motion file directory

#source DisplayPlane.tcl;		# procedure for displaying a plane in model
#source DisplayModel3D.tcl;		# procedure for displaying 3D perspectives of model

##########################################################################################
#-----------------------------------------------------------------------------------------
#  2. DEFINE NODAL COORDINATES
#-----------------------------------------------------------------------------------------
##########################################################################################

############################################
### Parametropoihsh komvwn stylwn###########
############################################
set Rigd1 1.05
set Hcol1 5.96
set Hcol1tot [expr $Hcol1 + $Rigd1]

set Rigd2 1.05
set Hcol2 7.95
set Hcol2tot [expr $Hcol2 + $Rigd1]

## z katastrwmatos
set z50 3.02
set z51 5.96
## z komvwn edrashs
set z7 [expr $z50-$Hcol1tot]
set z13 [expr $z51-$Hcol2tot]
## z themeliwshs
set z60 [expr $z7-0.66]
set z61 [expr $z13-0.66]
## z rigid stylwn
set z55 [expr $z50-$Rigd1]
set z551 [expr $z51-$Rigd2]
###############################################

node 5 0.00 0.00 0.00 ;
node 7 27.00 2.60 $z7; 
node 13 72.00 2.60 $z13 ; 
node 24 0.00 5.20 0.00 ; 
node 27 0.00 5.20 0.00 ; 
node 28 0.00 0.00 0.0 ; 
node 29 99.00 0.00 6.18 ;
node 30 99.00 0.00 6.18 ; 
node 31 99.00 5.20 6.18 ; 
node 32 99.00 5.20 6.18 ; 
node 40 0.00 2.60 1.20 ; 
node 41 99.00 2.60 7.32 ; 
node 50 27.00 2.60 3.02 ; 
node 51 72.00 2.60 5.96 ; 
node 55 27.00 2.60 $z55 ;
node 551 72.00 2.60 $z551 ;
node 111 2.00 2.60 1.33 ;
node 1111 4.00 2.60 1.525 ;
node 112 6.00 2.60 1.72 ; 
node 113 11.17 2.60 2.07 ; 
node 114 16.33 2.60 2.41 ; 
node 115 21.50 2.60 2.76 ;
node 1115 23.50 2.60 2.835 ;
node 116 25.50 2.60 2.91 ; 
node 121 28.50 2.60 3.11 ; 
node 1121 30.50 2.60 3.3 ;
node 122 32.50 2.60 3.49 ; 
node 123 37.50 2.60 3.82 ; 
node 124 42.50 2.60 4.15 ; 
node 125 48.00 2.60 4.50 ; 
node 126 49.50 2.60 4.60 ; 
node 127 51.00 2.60 4.70 ; 
node 128 56.50 2.60 5.06 ; 
node 129 61.50 2.60 5.39 ; 
node 131 73.50 2.60 6.03 ; 
node 1131 75.50 2.60 6.185 ; 
node 132 77.50 2.60 6.34 ; 
node 133 82.67 2.60 6.60 ; 
node 134 87.83 2.60 6.85 ; 
node 135 93.00 2.60 7.11 ; 
node 1135 95.00 2.60 7.18 ;
node 136 97.00 2.60 7.25 ; 
node 60 27.00 2.60 $z60 ; 
node 660 27.00 2.60 $z60 ; 
node 61 72.00 2.60 $z61; 
node 661 72.00 2.60 $z61 ; 
node 70 66.50 2.60 5.71 ; 
node 700 68.50 2.60 5.785 ;
node 71 70.50 2.60 5.86 ; 
#node 80 0.00 2.60 0.00 ; 
#node 81 99.00 2.60 6.09 ;

############################################
### Parametropoihsh komvwn akrovathrwn######
############################################

set z40 1.20;
set z41 7.32; 
set z80 0.00;
set z81 6.09; 
set Hstemwall 3.20;
set z800 [expr $z80-$Hstemwall];
set z810 [expr $z81-$Hstemwall];
set Hthwr 1.25; ## to miso you ypsous tou thwrakiou 
set z441 [expr $z41+$Hthwr] 
set z440 [expr $z40+$Hthwr] 
############################################

### NODES THWRAKIO ABTM

### K.B. katastrwmatos
node 440 0.00 2.60 $z440 ;
node 441 99.00 2.60 $z441 ;
### Rigid prin gapX (komvoi gefyras)
node 888 -1.65 2.60 $z440 ;
node 882 100.65 2.60 $z441;
### Komvoi gia zero length element abtm (komvoi backwall)
node 8820 100.65 2.60 $z441 ; 
node 8880 -1.65 2.60 $z440 ;
### Komvoi paktwshs abutment
node 8821 100.65 2.60 $z441 ; 
node 8881 -1.65 2.60 $z440 ;
### Katw komvos backwall
node 880 -1.65 2.60 0.00 ;
node 881 100.65 2.60 6.09 ;
### Komvoi paktwshs stem wall
node 810 99.00 2.60 $z810 ;
node 800 0.00 2.60  $z800 ;
node 8810 99.00 2.60 $z810 ;
node 8800 0.00 2.60  $z800 ;
## Komvoi gia rigid dipla ston katw komvo efedranwn (Abtm1-konto vathro)
node 240 0.00 5.60 0.0 ; 
node 500 0.00 -0.40 0.0 ; 
#### Komvoi gia gap kai abtY (Abtm1-konto vathro)
node 2400 0.00 5.60 1.20 ; 
node 2401 0.00 5.60 1.20 ; 
node 2402 0.00 5.60 1.20 ; 
node 5000 0.00 -0.40 1.20; 
node 5001 0.00 -0.40 1.20;
node 5002 0.00 -0.40 1.20;
## Komvoi gia rigid dipla ston katw komvo efedranwn (Abtm2-pshlo vathro)
node 310 99.00 5.60 6.09 ; 
node 290 99.00 -0.40 6.09 ; 
#### Komvoi gia gap kai abtY (Abtm2-pshlo vathro)
node 2900 99.00 -0.40 7.32 ; 
node 2901 99.00 -0.40 7.32 ; 
node 2902 99.00 -0.40 7.32 ; 
node 3100 99.00 5.60 7.32; 
node 3101 99.00 5.60 7.32;
node 3102 99.00 5.60 7.32;
## Komvos syndeshs stylou stem kai katw komvwn efedranwn (meta to gap)
node 8000 0.00 2.60 0.00 ; 
node 8100 99.00 2.60 6.09 ;

##########################################################################################
#-----------------------------------------------------------------------------------------
#  3. MASSES
#-----------------------------------------------------------------------------------------
##########################################################################################

mass	7	23.70	23.70	23.70	0	0	0	;
mass	13	31.70	31.70	31.70	0	0	0	;
mass	40	38.456	38.456	38.456	0	0	0	;
mass	111	76.911	76.911	76.911	0	0	0	;
mass	1111	60.362	60.362	60.362	0	0	0	;
mass	112	78.862	78.862	78.862	0	0	0	;
mass	113	113.912	113.912	113.912	0	0	0	;
mass	114	113.912	113.912	113.912	0	0	0	;
mass	115	78.862	78.862	78.862	0	0	0	;
mass	1115	60.275	60.275	60.275	0	0	0	;
mass	116	67.146	67.146	67.146	0	0	0	;
mass	50	81.252	81.252	81.252	0	0	0	;
mass	121	67.146	67.146	67.146	0	0	0	;
mass	1121	60.275	60.275	60.275	0	0	0	;
mass	122	76.672	76.672	76.672	0	0	0	;
mass	123	109.531	109.531	109.531	0	0	0	;
mass	124	115.008	115.008	115.008	0	0	0	;
mass	125	76.672	76.672	76.672	0	0	0	;
mass	126	32.859	32.859	32.859	0	0	0	;
mass	127	76.672	76.672	76.672	0	0	0	;
mass	128	115.008	115.008	115.008	0	0	0	;
mass	129	109.531	109.531	109.531	0	0	0	;
mass	70	76.672	76.672	76.672	0	0	0	;
mass	700	60.275	60.275	60.275	0	0	0	;
mass	71	67.146	67.146	67.146	0	0	0	;
mass	51	89.258	89.258	89.258	0	0	0	;
mass	131	67.146	67.146	67.146	0	0	0	;
mass	1131	60.275	60.275	60.275	0	0	0	;
mass	132	78.862	78.862	78.862	0	0	0	;
mass	133	113.912	113.912	113.912	0	0	0	;
mass	134	113.912	113.912	113.912	0	0	0	;
mass	135	78.862	78.862	78.862	0	0	0	;
mass	1135	61.459	61.459	61.459	0	0	0	;
mass	136	79.106	79.106	79.106	0	0	0	;
mass	41	39.553	39.553	39.553	0	0	0	;

### Mass akrovathro
## thwrakio
mass	882	15.93	15.93	15.93	0	0	0	;
mass	888	15.93	15.93	15.93	0	0	0	;
## stem wall kai wingwall
mass	8000	86.6	86.6	86.6	0	0	0	;
mass	8100	104.89	104.89	104.89	0	0	0	;

#### mass embankment

mass	882	300	300	300	0	0	0	;
mass	888	300	300	300	0	0	0	;

##########################################################################################
#-----------------------------------------------------------------------------------------
#  4. BOUNDARY CONDITIONS
#-----------------------------------------------------------------------------------------
##########################################################################################

#fixY 0.0  1 1 1 0 1 0;		# pin all Y=0.0 nodes 

fix 660 1 1 1 1 1 1; 
fix 661 1 1 1 1 1 1; 
fix 8800 1 1 1 1 1 1; 
fix 8810 1 1 1 1 1 1; 
fix 2902 1 1 1 1 1 1; 
fix 3102 1 1 1 1 1 1; 
fix 5002 1 1 1 1 1 1; 
fix 2402 1 1 1 1 1 1; 
fix 8821 1 1 1 1 1 1; 
fix 8881 1 1 1 1 1 1; 

##########################################################################################
#-----------------------------------------------------------------------------------------
#  5. ElasticSection GEOMETRIES (Deck, Foundation, Rigid)
#-----------------------------------------------------------------------------------------
##########################################################################################

set AF1SD	12.384;
set JF1SD	2.455196;
set IzF1SD	4.471695;
set IyF1SD	56.366223;

set AF2SD	5.892841;
set JF2SD	1.6817324;
set IzF2SD	3.33665;
set IyF2SD	40.734941;

set AF3SD	12.35;
set JF3SD	2.5250554;
set IzF3SD	4.744066;
set IyF3SD	56.988979;

set AF4SD	12.8145;
set JF4SD	2.708898;
set IzF4SD	4.9669;
set IyF4SD	57.723913;

set AFOUNDM12	72;
set JFOUNDM12	720.589471;
set IzFOUNDM12	384;
set IyFOUNDM12	486;

set ARIGID	10000;
set JRIGID	10000;
set IzRIGID	10000;
set IyRIGID	10000;

##########################################################################################
#-----------------------------------------------------------------------------------------
#  6. Elastic Section (Bridge Deck and Foundation)
#-----------------------------------------------------------------------------------------
##########################################################################################

set E 31222000; #kPa
set Eth 29000000; #kPa
set G [expr $E/(2*(0.2+1))] ; #kPa
set Gth [expr $Eth/(2*(0.2+1))] ; #kPa
set numIntgrPtsNLBC 10;								# number of integration points for nonlinear Beam Column
 
set secTagF1SD 100;
set secTagF2SD 101;
set secTagF3SD 102;
set secTagF4SD 103;
set secTagFOUNDM12 104;
set secTagRIGID 105;

#section Elastic $secTag $E $A $Iz <$Iy $G $J> gia na synperilhfthoun sto nonlinearBeamColumn

section Elastic $secTagF1SD $E $AF1SD $IzF1SD $IyF1SD $G $JF1SD ;
section Elastic $secTagF2SD $E $AF2SD $IzF2SD $IyF2SD $G $JF2SD ;
section Elastic $secTagF3SD $E $AF3SD $IzF3SD $IyF3SD $G $JF3SD ;
section Elastic $secTagF4SD $E $AF4SD $IzF4SD $IyF4SD $G $JF4SD ;
section Elastic $secTagFOUNDM12 $Eth $AFOUNDM12 $IzFOUNDM12 $IyFOUNDM12 $Gth $JFOUNDM12 ;
section Elastic $secTagRIGID $Eth $ARIGID $IzRIGID $IyRIGID $Gth $JRIGID ;

##########################################################################################
#-----------------------------------------------------------------------------------------
#  7. Geometric Tranformation
#-----------------------------------------------------------------------------------------
##########################################################################################

# define geometric transformation: performs a linear geometric transformation of beam stiffness and resisting force from the basic system to the global-coordinate system

#geomTransf Linear $transfTag $vecxzX $vecxzY $vecxzZ <-jntOffset $dXi $dYi $dZi $dXj $dYj $dZj>

# Set up geometric transformations of all elements (deck, piers, rigid)
# separate columns and beams
# in 3D model, assign vector vecxz

set IDColTransf 1; # all columns
set IDBeamTransf 2; # all beams
set IDR1Transf 3; # Rigid 1
set IDR2Transf 4; # Rigid 2

geomTransf Linear $IDBeamTransf 0 -1 0;
geomTransf Linear $IDR1Transf 1 0 0;
geomTransf Linear $IDR2Transf -1 0 0;
geomTransf Linear $IDColTransf 0 1 0;

##########################################################################################
#-----------------------------------------------------------------------------------------
#  8. DECK FOUNDATION AND RIGID ELEMENTS (ELASTIC)
#-----------------------------------------------------------------------------------------
##########################################################################################

### Ta elements pou xrhsimopoioume einai ta force-based giati kanoun pio grhgora converge kai den xreiazontai polla elements (gia poly kalo converge sta force based auksanoume ta intergation points)

element nonlinearBeamColumn 1  40  111  $numIntgrPtsNLBC $secTagF1SD $IDBeamTransf ;

element nonlinearBeamColumn 22  125  126  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;
element nonlinearBeamColumn 25  126  127  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;
element nonlinearBeamColumn 28  112  113  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;
element nonlinearBeamColumn 29  113  114  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;
element nonlinearBeamColumn 30  114  115  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;
element nonlinearBeamColumn 31  132  133  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;
element nonlinearBeamColumn 32  133  134  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;
element nonlinearBeamColumn 33  134  135  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;
element nonlinearBeamColumn 34  122  123  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;
element nonlinearBeamColumn 35  123  124  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;
element nonlinearBeamColumn 36  127  128  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;
element nonlinearBeamColumn 38  128  129  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;
element nonlinearBeamColumn 39  129  70  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;
element nonlinearBeamColumn 16  124  125  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf  ;

element nonlinearBeamColumn 5  116  50  $numIntgrPtsNLBC $secTagF3SD $IDBeamTransf ; 
element nonlinearBeamColumn 6  50  121  $numIntgrPtsNLBC $secTagF3SD $IDBeamTransf ;
element nonlinearBeamColumn 10  71  51  $numIntgrPtsNLBC $secTagF3SD $IDBeamTransf ;
element nonlinearBeamColumn 21  51  131  $numIntgrPtsNLBC $secTagF3SD $IDBeamTransf ;

element nonlinearBeamColumn 14  136  41  $numIntgrPtsNLBC $secTagF4SD $IDBeamTransf ;

element nonlinearBeamColumn 2  111  1111  $numIntgrPtsNLBC $secTagF1SD $IDBeamTransf ; 
element nonlinearBeamColumn 2002 1111  112  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;

element nonlinearBeamColumn 4  115  1115  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;
element nonlinearBeamColumn 4004  1115  116  $numIntgrPtsNLBC $secTagF3SD $IDBeamTransf ;

element nonlinearBeamColumn 9  70  700  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;
element nonlinearBeamColumn 9009  700  71  $numIntgrPtsNLBC $secTagF3SD $IDBeamTransf ;

element nonlinearBeamColumn 7  121  1121  $numIntgrPtsNLBC $secTagF3SD $IDBeamTransf ;
element nonlinearBeamColumn 7007  1121  122  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;

element nonlinearBeamColumn 11  131  1131  $numIntgrPtsNLBC $secTagF3SD $IDBeamTransf ;
element nonlinearBeamColumn 10011  1131  132  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;


element nonlinearBeamColumn 13  135  1135  $numIntgrPtsNLBC $secTagF2SD $IDBeamTransf ;
element nonlinearBeamColumn 10013  1135  136  $numIntgrPtsNLBC $secTagF4SD $IDBeamTransf ;

#### RIGID STHN PERRIOXH TWN EFEDRANWN

element nonlinearBeamColumn 17  27  40  $numIntgrPtsNLBC $secTagRIGID $IDR2Transf ;
element nonlinearBeamColumn 18  28  40  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf  ;
element nonlinearBeamColumn 19  32  41  $numIntgrPtsNLBC $secTagRIGID $IDR2Transf ;
element nonlinearBeamColumn 20  30  41  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;

### Abtm 2
element nonlinearBeamColumn 210  2901  41  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;
element nonlinearBeamColumn 220  41  3101  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;

element nonlinearBeamColumn 230  290   29  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;
element nonlinearBeamColumn 240  29  8100  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;
element nonlinearBeamColumn 250  8100  31  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;
element nonlinearBeamColumn 260  31   310  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;

element nonlinearBeamColumn 270  290  2900  $numIntgrPtsNLBC $secTagRIGID $IDColTransf ;
element nonlinearBeamColumn 280  310  3100  $numIntgrPtsNLBC $secTagRIGID $IDColTransf ;
element nonlinearBeamColumn 290  41   441  $numIntgrPtsNLBC $secTagRIGID $IDColTransf ;

element nonlinearBeamColumn 300  888  440  $numIntgrPtsNLBC $secTagRIGID $IDBeamTransf;
element nonlinearBeamColumn 310  8100 881  $numIntgrPtsNLBC $secTagRIGID $IDBeamTransf;

### Abtm 1
element nonlinearBeamColumn 320  5001  40  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;
element nonlinearBeamColumn 330  40  2401  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;

element nonlinearBeamColumn 340  500   5  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;
element nonlinearBeamColumn 350  5  8000  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;
element nonlinearBeamColumn 360  8000  24  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;
element nonlinearBeamColumn 370  24   240  $numIntgrPtsNLBC $secTagRIGID $IDR1Transf ;

element nonlinearBeamColumn 380  500  5000  $numIntgrPtsNLBC $secTagRIGID $IDColTransf ;
element nonlinearBeamColumn 390  240  2400  $numIntgrPtsNLBC $secTagRIGID $IDColTransf ;
element nonlinearBeamColumn 400  40   440  $numIntgrPtsNLBC $secTagRIGID $IDColTransf ;

element nonlinearBeamColumn 410  441   882  $numIntgrPtsNLBC $secTagRIGID $IDBeamTransf;
element nonlinearBeamColumn 420  880  8000  $numIntgrPtsNLBC $secTagRIGID $IDBeamTransf;

## rigid stylwn
element	nonlinearBeamColumn	1014	55	50	$numIntgrPtsNLBC	$secTagRIGID	$IDColTransf 	;
element	nonlinearBeamColumn	1015	551	51	$numIntgrPtsNLBC	$secTagRIGID	$IDColTransf 	;

### Komvoi syndeshs themeliou
element nonlinearBeamColumn 41  60  7  $numIntgrPtsNLBC $secTagFOUNDM12 $IDColTransf ;
element nonlinearBeamColumn 53  61  13  $numIntgrPtsNLBC $secTagFOUNDM12 $IDColTransf ;


##########################################################################################
#-----------------------------------------------------------------------------------------
#  9. PIER SECTION AND ELEMENTS (BEAM WITH HINGES)
#-----------------------------------------------------------------------------------------
##########################################################################################

source Column_propertiesX.txt


##########################################################################################
#-----------------------------------------------------------------------------------------
#  10. BEARINGS
#-----------------------------------------------------------------------------------------
##########################################################################################


#Opensees Elastomeric Bearing (not used)
# element elastomericBearing $eleTag $iNode $jNode $ke $fy $alpha -P $matTag -T $matTag -My $matTag -Mz $matTag <-orient $x1 $x2 $x3 $y1 $y2 $y3> <-shearDist $sDratio> <-mass $m>

#Opensees zero-length element (used)
#element zeroLength $eleTag $iNode $jNode -mat $matTag1 $matTag2 ... -dir $dir1 $dir2 ... <-orient $x1 $x2 $x3 $yp1 $yp2 $yp3> <-doRayleigh $rFlag>

set matTagKv 4 ;
set Kv 2700889 ; #kN/m 
set eta 0.05; # damping

uniaxialMaterial Elastic $matTagKv $Kv $eta ; 

# Orismos dystmhsias (local y and local z axis)

set matTagKh 5 ;
set Kh 5011.36 ; #kN/m 
set ke 9154;
set fy 76.5;
set alpha 0.5; 
uniaxialMaterial Steel01 $matTagKh $fy $ke $alpha 

# Orismos kamptikhs dyskampsias (local y and local z, global x and global y)

set matTagKbx 6 ;
set Kbx 7146 ; #kN/m 

uniaxialMaterial Elastic $matTagKbx $Kbx $eta ; 

set matTagKby 7 ;
set Kby 11812 ; #kN/m 

uniaxialMaterial Elastic $matTagKby $Kby $eta ;


#####################################################################################
##########    ELEMENT BEARING   #######################################
#####################################################################################


element zeroLength 991 31 32 -mat $matTagKv $matTagKh $matTagKh $matTagKby $matTagKbx -dir 1 2 3 5 6 -orient 0 0 1 1 0 0 ;
element zeroLength 992 29 30 -mat $matTagKv $matTagKh $matTagKh $matTagKby $matTagKbx -dir 1 2 3 5 6 -orient 0 0 1 1 0 0 ;
element zeroLength 993 24 27 -mat $matTagKv $matTagKh $matTagKh $matTagKby $matTagKbx -dir 1 2 3 5 6 -orient 0 0 1 1 0 0 ;
element zeroLength 994 5 28 -mat $matTagKv $matTagKh $matTagKh  $matTagKby $matTagKbx -dir 1 2 3 5 6 -orient  0 0 1 1 0 0 ;
# to elathrio tou abtm mpainei se allo komvo (me idies syntetagmenes), syndesh se seira.


##########################################################################################
#-----------------------------------------------------------------------------------------
#  11. FOUNDATION SPRINGS
#-----------------------------------------------------------------------------------------
##########################################################################################

set matTagKz 40 ;
set Kz 7729793.855 ; #kN/m
#set Kz 2149275.5 
uniaxialMaterial Elastic $matTagKz $Kz ; 

set matTagKx 50;
set Kx 6876935.184 ; #kN/m 
#set Kx 2363177.6; #kN/m 
uniaxialMaterial Elastic $matTagKx $Kx ; 

set matTagKy 60 ;
set Ky 6985692.282 ; #kN/m 
#set Ky 2393417.6 ; #kN/m 
uniaxialMaterial Elastic $matTagKy $Ky ; 

set matTagKrx 70 ;
set Krx 105999758.4 ; #kN/m 
#set Krx 24700188.6 ; #kN/m 
uniaxialMaterial Elastic $matTagKrx $Krx  ; 

set matTagKry 80 ;
set Kry 93691435 ; #kN/m 
#set Kry 30721159.3 ; #kN/m
uniaxialMaterial Elastic $matTagKry $Kry  ; 

set matTagKrz 90 ;
set Krz 204708047.1 ; #kN/m 
#set Krz 43597715.8 ; #kN/m 
uniaxialMaterial Elastic $matTagKrz $Krz  ; 

element zeroLength 995 660 60 -mat $matTagKz $matTagKx $matTagKy $matTagKrx $matTagKrz $matTagKry -dir 1 2 3 4 5 6 -orient 0 0 1 1 0 0 ;
element zeroLength 996 661 61 -mat $matTagKz $matTagKx $matTagKy $matTagKrx $matTagKrz $matTagKry -dir 1 2 3 4 5 6 -orient 0 0 1 1 0 0 ;

##########################################################################################
#-----------------------------------------------------------------------------------------
#  12. ABUTMENTS
#-----------------------------------------------------------------------------------------
##########################################################################################


#####################################################################################
###############    LONGITUDINAL   ###################################################
#####################################################################################
 
#uniaxialMaterial ElasticPPGap $matTag $E $Fy $gap <$eta> <damage>
set matTagGap1X 88 ;
set E 3474000 ; #kN/m
set Fygap -55584 ;
set gap -0.10 ;
uniaxialMaterial ElasticPPGap $matTagGap1X $E $Fygap $gap ;

#uniaxialMaterial ElasticPPGap $matTag $E $Fy $gap <$eta> <damage>
set matTagGap2X 888 ;
set E 3474000 ; #kN/m
set Fygap 55584 ;
set gap 0.10 ;
uniaxialMaterial ElasticPPGap $matTagGap2X $E $Fygap $gap ;

## Hysteretic Abutment_X (DEN to diairw dia 2 giati exoume 1 shmeio syndeshs sto abutmt)

set matTagAbtm_X 1001

set e1pX 0.008 ; 
set s1pX 1377.6 ;
set e2pX 0.028 ;
set s2pX 4931.13 ;
set e3pX 0.08 ;
set s3pX 7838.56 ;

set pinchX 0 ;
set pinchY 0 ;
set damage1 0 ;
set damage2 0 ;

# uniaxialMaterial Hysteretic $matTag $s1p $e1p $s2p $e2p <$s3p $e3p> $s1n $e1n $s2n $e2n <$s3n $e3n> $pinchX $pinchY $damage1 $damage2 <$beta>
#uniaxialMaterial Hysteretic $matTagAbtm_X $s1pX $e1pX $s2pX $e2pX $s1nX $e1nX $s2nX $e2nX $pinchX $pinchY $damage1 $damage2 ;

uniaxialMaterial Hysteretic $matTagAbtm_X $s1pX $e1pX $s2pX $e2pX $s3pX $e3pX [expr -$s1pX] [expr -$e1pX] [expr -$s2pX] [expr -$e2pX] [expr -$s3pX] [expr -$e3pX] $pinchX $pinchY $damage1 $damage2 0.0 ;

## Series Material (Gap + Abutment Long.)

set matTagSeriesX1 11 ;  

uniaxialMaterial Series $matTagSeriesX1 $matTagGap1X $matTagAbtm_X 


set matTagSeriesX2 110 ; 

uniaxialMaterial Series $matTagSeriesX2  $matTagGap2X $matTagAbtm_X

#####################################################################################
###############    TRANSVERSE     ###################################################
#####################################################################################

#uniaxialMaterial ElasticPPGap $matTag $E $Fy $gap <$eta> <damage>
set matTagGap1Y 99 ;
set E 3474000 ; #kN/m
set Fygap -55584 ;
set gap -0.15 ;
uniaxialMaterial ElasticPPGap $matTagGap1Y $E $Fygap $gap ;

#uniaxialMaterial ElasticPPGap $matTag $E $Fy $gap <$eta> <damage>
set matTagGap2Y 999 ;
set E 3474000 ; #kN/m
set Fygap 55584 ;
set gap 0.15 ;
uniaxialMaterial ElasticPPGap $matTagGap2Y $E $Fygap $gap ;

## Hysteretic Abutment_Y (To dairoume dia 2 giati exoume 2 shmeia syndeshs sto abutmt)

set matTagAbtm_Y 1004

set e1pY 0.008 ; 
set s1pY 918.4 ;
set e2pY 0.028 ;
set s2pY 6161.56 ;
set e3pY 0.08 ;
set s3pY 10451.41 ;

set pinchX 0 ;
set pinchY 0 ;
set damage1 0 ;
set damage2 0;

# uniaxialMaterial Hysteretic $matTag $s1p $e1p $s2p $e2p <$s3p $e3p> $s1n $e1n $s2n $e2n <$s3n $e3n> $pinchX $pinchY $damage1 $damage2 <$beta>
uniaxialMaterial Hysteretic $matTagAbtm_Y $s1pY $e1pY $s2pY $e2pY $s3pY $e3pY [expr -$s1pY] [expr -$e1pY] [expr -$s2pY] [expr -$e2pY] [expr -$s3pY] [expr -$e3pY] $pinchX $pinchY $damage1 $damage2 ;

set matTagSeriesY1 12 

uniaxialMaterial Series $matTagSeriesY1 $matTagGap1Y $matTagAbtm_Y

set matTagSeriesY2 120 

uniaxialMaterial Series $matTagSeriesY2 $matTagGap2Y $matTagAbtm_Y

#####################################################################################
##########    ELEMENTS ABUTMENT   #######################################
#####################################################################################

### Elathrio Gap+Abtm (Series X) se seira me ta efedrana
set matTagKrigid 666 ;
set Krigid 10000; #kN/m 
set eta 0.05; # damping
uniaxialMaterial Elastic $matTagKrigid $Krigid $eta ; 


element zeroLength 9991 882 8820 -mat  $matTagGap1X   -dir 2 -orient 0 0 1 1 0 0 ;
element zeroLength 9992 888 8880 -mat $matTagGap2X  -dir 2 -orient 0 0 1 1 0 0 ;
element zeroLength 99991 8820 8821 -mat  $matTagAbtm_X -dir 2 -orient 0 0 1 1 0 0 ;
element zeroLength 99992 8880 8881 -mat $matTagAbtm_X  -dir 2 -orient 0 0 1 1 0 0 ;
### Elathrio Gap+AbtmY (Series Y) se seira me ta efedrana
element zeroLength 9993 2900 2901 -mat  $matTagGap1Y -dir 3  -orient 0 0 1 1 0 0 ;
element zeroLength 9994 3101 3100 -mat $matTagGap2Y -dir 3 -orient 0 0 1 1 0 0 ;
element zeroLength 9995 5000 5001 -mat $matTagGap1Y -dir 3 -orient 0 0 1 1 0 0 ;
element zeroLength 9996 2401 2400 -mat $matTagGap2Y -dir 3  -orient 0 0 1 1 0 0 ;

element zeroLength 9997 5002 5000 -mat $matTagAbtm_Y -dir 3  -orient 0 0 1 1 0 0 ;
element zeroLength 9998 2400 2402 -mat $matTagAbtm_Y -dir 3 -orient 0 0 1 1 0 0 ;
element zeroLength 9999 2902 2900 -mat $matTagAbtm_Y -dir 3 -orient 0 0 1 1 0 0 ;
element zeroLength 99999 3100 3102 -mat $matTagAbtm_Y -dir 3  -orient 0 0 1 1 0 0 ;

#####################################################################################
##########    ELEMENT THWRAKIO KAI TOIXOS ABUTMENT  #######################################
#####################################################################################

### THWRAKIO

# Thwrakio section

# calculated stiffness parameters
set Ecthwr 29790940; #kpa
set Athwr [expr  0.5*10.0];
set EAthwr [expr $Ecthwr*$Athwr];			# EA, for axial-force-strain relationship
set Gthwr [expr $Ecthwr/2*(0.2+1)] ; #kPa
set thwrMatTagAxial 30000;			# assign a tag number to the column axial behavior
uniaxialMaterial Elastic $thwrMatTagAxial $EAthwr;				# this is not used as a material, this is an axial-force-strain response  (U1)

### Thwrakio 10.0x0.5

set thwrMatTagFlex0 20001;			# assign a tag number to the column flexural behavior
set thwrSecTag 20002;				# assign a tag number to the column section tag

set Mythwr0 6896.769;				# yield moment
set Muthwr0 7038.713;				# ultimate moment
set PhiYthwr0 0.008447754;			# yield curvature
set Phiuthwr0 0.0414;			# ultimate curvature

#uniaxialMaterial Steel01 $ColMatTagFlexM10 $MyColM10 $EIColeffM10 $bM10; 		# bilinear behavior for flexure (R2, R3)
uniaxialMaterial Hysteretic $thwrMatTagFlex0 [expr $Mythwr0-100] [expr $PhiYthwr0 -0.000122] $Mythwr0  $PhiYthwr0 $Muthwr0  $Phiuthwr0 [expr -$Mythwr0+100] [expr -$PhiYthwr0+0.000122] [expr -$Mythwr0] [expr -$PhiYthwr0] [expr -$Muthwr0] [expr -$Phiuthwr0] 0.0 0.0 0 0.0 0.7 ;

section Aggregator $thwrSecTag $thwrMatTagAxial P $thwrMatTagFlex0 Mz;	# combine axial and flexural behavior into one section (no P-M interaction here)
#set modIthwr 0.23

# element connectivity:
element beamWithHinges	2006	881	8820	$thwrSecTag 0.27 $thwrSecTag 0.27 $Ecthwr $Athwr 0.1042 41.67 $Gthwr 0.4035 $IDColTransf ;
element beamWithHinges	2007	880	8880	$thwrSecTag 0.27 $thwrSecTag 0.27 $Ecthwr $Athwr 0.1042 41.67 $Gthwr 0.4035 $IDColTransf ;


### TOIXOS ABUTMENT (stem wall)

# calculated stiffness parameters
set Ecstem 29790940; #kpa
set Astem [expr 2.00*10.0]; ## paxos= 1.20+1.65/2
set EAstem [expr $Ecstem*$Astem];			# EA, for axial-force-strain relationship
set Gstem [expr $Ecstem/(2*(0.2+1))] ; #kPa
set stemMatTagAxial 40000;			# assign a tag number to the column axial behavior
uniaxialMaterial Elastic $stemMatTagAxial $EAstem;				# this is not used as a material, this is an axial-force-strain response  (U1)

set Jstem	15.8952;
set Izstem	4.4661;
set Iystem	145.833;

set secTagStem 500;

#section Elastic $secTag $E $A $Iz <$Iy $G $J> gia na synperilhfthoun sto nonlinearBeamColumn
section Elastic $secTagStem $E $Astem $Izstem $Iystem $Gstem $Jstem ;

## Element stem wall (elastic)
element nonlinearBeamColumn 500  810  8100  $numIntgrPtsNLBC $secTagStem $IDColTransf ;
element nonlinearBeamColumn 501  800  8000  $numIntgrPtsNLBC $secTagStem $IDColTransf ;

##########################################################################################
#-----------------------------------------------------------------------------------------
# ABUTMENT FOUNDATION SPRINGS
#-----------------------------------------------------------------------------------------
##########################################################################################

set matTagKz1 400 ;
set Kz1 8493608.62	 ; #kN/m
uniaxialMaterial Elastic $matTagKz1 $Kz1 ; 

set matTagKz2 401 ;
set Kz2 8840745.837 ; #kN/m
uniaxialMaterial Elastic $matTagKz2 $Kz2 ; 

set matTagKx1 500;
set Kx1 7410999.64 ; #kN/m 
uniaxialMaterial Elastic $matTagKx1 $Kx1 ; 

set matTagKx2 501;
set Kx2 7731473.573 ; #kN/m 
uniaxialMaterial Elastic $matTagKx2 $Kx2 ;

set matTagKy1 600 ;
set Ky1 8172299.323; #kN/m 
uniaxialMaterial Elastic $matTagKy1 $Ky1 ; 

set matTagKy2 601 ;
set Ky2 8384016.158 ; #kN/m 
uniaxialMaterial Elastic $matTagKy2 $Ky2 ; 

set matTagKrx1 700 ;
set Krx1 157745638.9 ; #kN/m 
uniaxialMaterial Elastic $matTagKrx1 $Krx1  ; 

set matTagKrx2 701 ;
set Krx2 175562099.9 ; #kN/m 
uniaxialMaterial Elastic $matTagKrx2 $Krx2  ; 

set matTagKry1 800 ;
set Kry1 48797622 ; #kN/m 
uniaxialMaterial Elastic $matTagKry1 $Kry1  ; 

set matTagKry2 801 ;
set Kry2 70268576 ; #kN/m 
uniaxialMaterial Elastic $matTagKry2 $Kry2  ; 

set matTagKrz1 900 ;
set Krz1 399495071.5 ; #kN/m 
uniaxialMaterial Elastic $matTagKrz1 $Krz1  ; 

set matTagKrz2 901 ;
set Krz2 437957077.5 ; #kN/m 
uniaxialMaterial Elastic $matTagKrz2 $Krz2  ;

element zeroLength 997 8800 800 -mat $matTagKz1 $matTagKx1 $matTagKy1 $matTagKrx1 $matTagKrz1 $matTagKry1 -dir 1 2 3 4 5 6 -orient 0 0 1 1 0 0 ;
element zeroLength 998 8810 810 -mat $matTagKz2 $matTagKx2 $matTagKy2 $matTagKrx2 $matTagKrz2 $matTagKry2 -dir 1 2 3 4 5 6 -orient 0 0 1 1 0 0 ;


##########################################################################################
#-----------------------------------------------------------------------------------------
#  13. RECORDERS FOR GRAVITY LOADS
#-----------------------------------------------------------------------------------------
##########################################################################################

### Recorder Displacement

recorder Node -file $GravityDir/DFree.out -node 50 -dof 1 2 3 4 5 6  disp;			# displacements of free node

recorder Node -time -file $GravityDir/disp.out -node 5 7 13 24 27 28 29 30 31 32 40 41 50 51 111 1111 112 113 114 115 1115 116 121 1121 122 123 124 125 126 127 128 129 131 1131 132 133 134 135 1135 136 60 61 70 700 71 80 81 -dof 1 2 3 4 5 6 disp;

recorder Node -time -file $GravityDir/acc.out -node 50 -dof 1 accel;

recorder Element -file $GravityDir/force.out -time -ele 62 force;

recorder Node -time-file $GravityDir/RBase60.out  -node 60   -dof 1 2 3 4 5 6 reaction;		# support reaction
recorder Node -time-file $GravityDir/RBase61.out  -node 61   -dof 1 2 3 4 5 6 reaction;		# support reaction
recorder Node -time-file $GravityDir/RBase80.out -node 80   -dof 1 2 3 4 5 6 reaction;		# support reaction
recorder Node -time-file $GravityDir/RBase81.out  -node 81   -dof 1 2 3 4 5 6 reaction;		# support reaction

##########################################################################################
#-----------------------------------------------------------------------------------------
#  14.GRAVITY LOADS
#-----------------------------------------------------------------------------------------
##########################################################################################

### PREPEI NA MPOUN TA FORTIA LOGV IDIOU VAROUS , LOGW G1 KAI 0,2 Q
#load $nodeTag (ndf $LoadValues), tha ta vgaloume san nodal gravity forces apo tis mazes
# define GRAVITY -------------------------------------------------------------
# GRAVITY LOADS # define gravity load applied to beams and columns -- 	eleLoad applies loads in local coordinate axis
pattern Plain 101 Linear {
load	7	0	0	-[expr	23.70*9.81]	0	0	0	;
load	13	0	0	-[expr	31.70*9.81]	0	0	0	;
load	40	0	0	-[expr	38.456*9.81]	0	0	0	;
load	111	0	0	-[expr	76.911*9.81]	0	0	0	;
load	1111	0	0	-[expr	60.362*9.81]	0	0	0	;
load	112	0	0	-[expr	78.862*9.81]	0	0	0	;
load	113	0	0	-[expr	113.912*9.81]	0	0	0	;
load	114	0	0	-[expr	113.912*9.81]	0	0	0	;
load	115	0	0	-[expr	78.862*9.81]	0	0	0	;
load	1115	0	0	-[expr	60.275*9.81]	0	0	0	;
load	116	0	0	-[expr	67.146*9.81]	0	0	0	;
load	50	0	0	-[expr	81.252*9.81]	0	0	0	;
load	121	0	0	-[expr	67.146*9.81]	0	0	0	;
load	1121	0	0	-[expr	60.275*9.81]	0	0	0	;
load	122	0	0	-[expr	76.672*9.81]	0	0	0	;
load	123	0	0	-[expr	109.531*9.81]	0	0	0	;
load	124	0	0	-[expr	115.008*9.81]	0	0	0	;
load	125	0	0	-[expr	76.672*9.81]	0	0	0	;
load	126	0	0	-[expr	32.859*9.81]	0	0	0	;
load	127	0	0	-[expr	76.672*9.81]	0	0	0	;
load	128	0	0	-[expr	115.008*9.81]	0	0	0	;
load	129	0	0	-[expr	109.531*9.81]	0	0	0	;
load	70	0	0	-[expr	76.672*9.81]	0	0	0	;
load	700	0	0	-[expr	60.275*9.81]	0	0	0	;
load	71	0	0	-[expr	67.146*9.81]	0	0	0	;
load	51	0	0	-[expr	89.258*9.81]	0	0	0	;
load	131	0	0	-[expr	67.146*9.81]	0	0	0	;
load	1131	0	0	-[expr	60.275*9.81]	0	0	0	;
load	132	0	0	-[expr	78.862*9.81]	0	0	0	;
load	133	0	0	-[expr	113.912*9.81]	0	0	0	;
load	134	0	0	-[expr	113.912*9.81]	0	0	0	;
load	135	0	0	-[expr	78.862*9.81]	0	0	0	;
load	1135	0	0	-[expr	61.459*9.81]	0	0	0	;
load	136	0	0	-[expr	79.106*9.81]	0	0	0	;
load	41	0	0	-[expr	39.553*9.81]	0	0	0	;
load	8820	0	0	-[expr	15.93*9.81]	0	0	0	;
load	8880	0	0	-[expr	15.93*9.81]	0	0	0	;
load	882	0	0	-[expr	15.93*9.81]	0	0	0	;
load	888	0	0	-[expr	15.93*9.81]	0	0	0	;
load	8000	0	0	-[expr	86.6*9.81]	0	0	0	;
load	8100	0	0	-[expr	104.89*9.81]	0	0	0	;

load	8821	0	0	-[expr	15.93*9.81]	0	0	0	;
load	8881	0	0	-[expr	15.93*9.81]	0	0	0	;
}
# Gravity-analysis parameters -- load-controlled static analysis
set Tol 1.0e-8;			# convergence tolerance for test
numberer RCM;			# renumber dof's to minimize band-width (optimization), if you want to
constraints Plain 			 
system BandGeneral ;		# how to store and solve the system of equations in the analysis (large model: try UmfPack)
test EnergyIncr $Tol 6 ; 		# determine if convergence has been achieved at the end of an iteration step
algorithm Newton;			# use Newton's solution algorithm: updates tangent stiffness at every iteration
set NstepGravity 5;  		# apply gravity in 10 steps
set DGravity [expr 1./$NstepGravity]; 	# first load increment;
integrator LoadControl $DGravity;	# determine the next time step for an analysis
analysis Static;			# define type of analysis static or transient
analyze $NstepGravity;		# apply gravity
# ------------------------------------------------- maintain constant gravity loads and reset time to zero
loadConst -time 0.0
set Tol 1.0e-6;			# reduce tolerance after gravity loads
puts "Model Built"

##########################################################################################
#-----------------------------------------------------------------------------------------
#  15. EIGEN ANALYSIS
#-----------------------------------------------------------------------------------------
##########################################################################################

set omega {}
set f {}
set T {}
set lambda [eigen 20]

foreach lam $lambda {
	lappend omega [expr sqrt($lam)]
	lappend f [expr sqrt($lam)/(2*$pi)]
	lappend T [expr (2*$pi)/sqrt($lam)]
}

set period "Periods.txt"
set Periods [open $period "w"]
foreach t $T {
	puts $Periods " $t"
}
close $Periods


##############################################

#set outfile [open eigenvalues.txt w]
#set eigenvalues [eigen 20]
#puts $outfile $eigenvalues
#close $outfile
#recorder Node -file eigenvectors1.out -time -node 40	111	1111	112	113	114	115	1115	116	50	55	7	121	1121	122	123	124	125	126	127	128	129	70	700	71	51	551	13	131	1131	132	133	134	135	1135	136	41 -dof 1 2 3 4 5 6 "eigen 1"
#recorder Node -file eigenvectors2.out -time -node 40	111	1111	112	113	114	115	1115	116	50	55	7	121	1121	122	123	124	125	126	127	128	129	70	700	71	51	551	13	131	1131	132	133	134	135	1135	136	41 -dof 1 2 3 4 5 6 "eigen 2"
#recorder Node -file eigenvectors3.out -time -node 40	111	1111	112	113	114	115	1115	116	50	55	7	121	1121	122	123	124	125	126	127	128	129	70	700	71	51	551	13	131	1131	132	133	134	135	1135	136	41 -dof 1 2 3 4 5 6 "eigen 3"
#recorder Node -file eigenvectors4.out -time -node 40	111	1111	112	113	114	115	1115	116	50	55	7	121	1121	122	123	124	125	126	127	128	129	70	700	71	51	551	13	131	1131	132	133	134	135	1135	136	41 -dof 1 2 3 4 5 6 "eigen 4"
#recorder Node -file eigenvectors5.out -time -node 40	111	1111	112	113	114	115	1115	116	50	55	7	121	1121	122	123	124	125	126	127	128	129	70	700	71	51	551	13	131	1131	132	133	134	135	1135	136	41 -dof 1 2 3 4 5 6 "eigen 5"

recorder Node -file eigenvectors1.out -time -node 40	111	1111	112	113	114	115	1115	116	50	55	7	121	1121	122	123	124	125	126	127	128	129	70	700	71	51	551	13	131	1131	132	133	134	135	1135	136	41 -dof 2 "eigen 1"
recorder Node -file eigenvectors3.out -time -node 40	111	1111	112	113	114	115	1115	116	50	55	7	121	1121	122	123	124	125	126	127	128	129	70	700	71	51	551	13	131	1131	132	133	134	135	1135	136	41 -dof 1 "eigen 3"

#analyze 1; // you need at least 1 analyze to get them! to be recorded 

##########################################################################################
#-----------------------------------------------------------------------------------------
#  16. RECORDERS FOR TIME HISTORY
#-----------------------------------------------------------------------------------------
##########################################################################################

####Abutment1 Recorder

recorder Node -time -file $THDir/DispAbtm8820.out -node 8820 -dof 1 2 3 4 5 6 disp;
recorder Node -time -file $THDir/DispAbtm882.out -node 882 -dof 1 2 3 4 5 6 disp;
recorder Node -file $THDir/react810.out -node 810 -dof 1 2 3 4 5 6  reaction;
#recorder Node -file $THDir/react881.out -node 810 -dof 1 2 3 4 5 6  reaction;
#recorder Element -file $THDir/react32.out -time -ele 9991 globalForce;

####Abutment2 Recorder

recorder Node -time -file $THDir/DispAbtm8880.out -node 8880 -dof 1 2 3 4 5 6 disp;
recorder Node -time -file $THDir/DispAbtm888.out -node 888 -dof 1 2 3 4 5 6 disp;
recorder Node -file $THDir/react800.out -node 800 -dof 1 2 3 4 5 6  reaction;

###### Acceleration Recorder (top column and abtm)

recorder Node -time -file $THDir/acc50.out -node 50 -dof 1 accel;
recorder Node -time -file $THDir/acc51.out -node 51 -dof 1 accel;
recorder Node -time -file $THDir/acc40.out -node 40 -dof 1 accel;
recorder Node -time -file $THDir/acc41.out -node 41 -dof 1 accel;

###### Displacement Recorder (top column and abtm)

recorder Node -time -file $THDir/disp50.out -node 50 -dof 1 disp;
recorder Node -time -file $THDir/disp51.out -node 51 -dof 1 disp;
recorder Node -time -file $THDir/disp40.out -node 40 -dof 1 disp;
recorder Node -time -file $THDir/disp41.out -node 41 -dof 1 disp;


##### M-phi recorder piers
recorder Element -file $THDir/curvature62b.out -time -ele 62 section 1 deformation;
recorder Element -file $THDir/curvature62t.out -time -ele 62 section 6 deformation;
recorder Element -file $THDir/ForceMoment62.out -time -ele 62 globalForce;
recorder Element -file $THDir/curvature63t.out -time -ele 63 section 1 deformation;
recorder Element -file $THDir/curvature63b.out -time -ele 63 section 6 deformation;
recorder Element -file $THDir/ForceMoment63.out -time -ele 63 globalForce;

###Recorders for bearings
recorder Node -time -file $THDir/Disp32.out -node 32 -dof 1 2 3 4 5 6 disp;
recorder Node -time -file $THDir/Disp30.out -node 30 -dof 1 2 3 4 5 6 disp;
recorder Element -file $THDir/Force991.out -time -ele 991 force; 
recorder Element -file $THDir/Force9991.out -time -ele 9991 force; 
recorder Element -file $THDir/Force992.out -time -ele 992 force; 
#recorder Node -file $THDir/react810.out -node 810 -dof 1 2 3 4 5 6  reaction;

recorder Node -time -file $THDir/Disp28.out -node 28 -dof 1 2 3 4 5 6 disp;
recorder Node -time -file $THDir/Disp27.out -node 27 -dof 1 2 3 4 5 6 disp;
recorder Element -file $THDir/Force993.out -time -ele 993 force; 
recorder Element -file $THDir/Force994.out -time -ele 994 force; 
#recorder Node -file $THDir/react800.out -node 800 -dof 1 2 3 4 5 6  reaction;

#### Thwrakio recorders

recorder Element -file $THDir/ForceMoment2006.out -time -ele 2006 force;
recorder Element -file $THDir/curvature2006.out -time -ele 2006 section 1 deformation;

recorder Element -file $THDir/ForceMoment2007.out -time -ele 2007 force;
recorder Element -file $THDir/curvature2007.out -time -ele 2007 section 1 deformation;

recorder Node -time -file $THDir/disp881.out -node 881 -dof 1 disp;
recorder Node -time -file $THDir/disp882.out -node 882 -dof 1 disp;
recorder Node -time -file $THDir/disp29.out -node 29 -dof 1 disp;
recorder Node -time -file $THDir/disp3101.out -node 3101 -dof 1 disp;
recorder Node -time -file $THDir/disp32.out -node 32 -dof 1 disp;
#recorder Node -time -file $THDir/disp30.out -node 30 -dof 1 disp;

##########################################################################################
#-----------------------------------------------------------------------------------------
#  17. DYNAMIC EQ ANALYSIS
#-----------------------------------------------------------------------------------------
##########################################################################################

# DYNAMIC ANALYSIS PARAMETERS
# CONSTRAINTS handler -- Determines how the constraint equations are enforced in the analysis (http://opensees.berkeley.edu/OpenSees/manuals/usermanual/617.htm)
#          Plain Constraints -- Removes constrained degrees of freedom from the system of equations 
#          Lagrange Multipliers -- Uses the method of Lagrange multipliers to enforce constraints 
#          Penalty Method -- Uses penalty numbers to enforce constraints 
#          Transformation Method -- Performs a condensation of constrained degrees of freedom 
constraints Transformation ; 
# DOF NUMBERER (number the degrees of freedom in the domain): (http://opensees.berkeley.edu/OpenSees/manuals/usermanual/366.htm)
#   determines the mapping between equation numbers and degrees-of-freedom
#          Plain -- Uses the numbering provided by the user 
#          RCM -- Renumbers the DOF to minimize the matrix band-width using the Reverse Cuthill-McKee algorithm 
numberer RCM
# SYSTEM (http://opensees.berkeley.edu/OpenSees/manuals/usermanual/371.htm)
#   Linear Equation Solvers (how to store and solve the system of equations in the analysis)
#   -- provide the solution of the linear system of equations Ku = P. Each solver is tailored to a specific matrix topology. 
#          ProfileSPD -- Direct profile solver for symmetric positive definite matrices 
#          BandGeneral -- Direct solver for banded unsymmetric matrices 
#          BandSPD -- Direct solver for banded symmetric positive definite matrices 
#          SparseGeneral -- Direct solver for unsymmetric sparse matrices (-piv option)
#          SparseSPD -- Direct solver for symmetric sparse matrices 
#          UmfPack -- Direct UmfPack solver for unsymmetric matrices 
system BandGeneral
# TEST: # convergence test to 
# Convergence TEST (http://opensees.berkeley.edu/OpenSees/manuals/usermanual/360.htm)
#   -- Accept the current state of the domain as being on the converged solution path 
#   -- determine if convergence has been achieved at the end of an iteration step
#          NormUnbalance -- Specifies a tolerance on the norm of the unbalanced load at the current iteration 
#          NormDispIncr -- Specifies a tolerance on the norm of the displacement increments at the current iteration 
#          EnergyIncr-- Specifies a tolerance on the inner product of the unbalanced load and displacement increments at the current iteration 
#          RelativeNormUnbalance --
#          RelativeNormDispIncr --
#          RelativeEnergyIncr --
set Tol 1.e-8;                        # Convergence Test: tolerance
set maxNumIter 1000;                # Convergence Test: maximum number of iterations that will be performed before "failure to converge" is returned
set printFlag 0;                # Convergence Test: flag used to print information on convergence (optional)        # 1: print information on each step; 
set TestType EnergyIncr;	# Convergence-test type
test $TestType $Tol $maxNumIter $printFlag;

# Solution ALGORITHM: -- Iterate from the last time step to the current (http://opensees.berkeley.edu/OpenSees/manuals/usermanual/682.htm)
#          Linear -- Uses the solution at the first iteration and continues 
#          Newton -- Uses the tangent at the current iteration to iterate to convergence 
#          ModifiedNewton -- Uses the tangent at the first iteration to iterate to convergence 
#          NewtonLineSearch -- 
#          KrylovNewton -- 
#          BFGS -- 
#          Broyden -- 
set algorithmType ModifiedNewton 
algorithm $algorithmType;        

# Static INTEGRATOR: -- determine the next time step for an analysis  (http://opensees.berkeley.edu/OpenSees/manuals/usermanual/689.htm)
#          LoadControl -- Specifies the incremental load factor to be applied to the loads in the domain 
#          DisplacementControl -- Specifies the incremental displacement at a specified DOF in the domain 
#          Minimum Unbalanced Displacement Norm -- Specifies the incremental load factor such that the residual displacement norm in minimized 
#          Arc Length -- Specifies the incremental arc-length of the load-displacement path 
# Transient INTEGRATOR: -- determine the next time step for an analysis including inertial effects 
#          Newmark -- The two parameter time-stepping method developed by Newmark 
#          HHT -- The three parameter Hilbert-Hughes-Taylor time-stepping method 
#          Central Difference -- Approximates velocity and acceleration by centered finite differences of displacement 
set NewmarkGamma 0.5;	# Newmark-integrator gamma parameter (also HHT)
set NewmarkBeta 0.25;	# Newmark-integrator beta parameter
integrator Newmark $NewmarkGamma $NewmarkBeta 

# ANALYSIS  -- defines what type of analysis is to be performed (http://opensees.berkeley.edu/OpenSees/manuals/usermanual/324.htm)
#          Static Analysis -- solves the KU=R problem, without the mass or damping matrices. 
#          Transient Analysis -- solves the time-dependent analysis. The time step in this type of analysis is constant. The time step in the output is also constant. 
#          variableTransient Analysis -- performs the same analysis type as the Transient Analysis object. The time step, however, is variable. This method is used when 
#                 there are convergence problems with the Transient Analysis object at a peak or when the time step is too small. The time step in the output is also variable.
analysis Transient

# define DAMPING--------------------------------------------------------------------------------------
# set damping based on first eigen mode
set a0 0.380568
set a1 0.00650509
rayleigh    $a0 0.0 $a1 0.0
#set freq [expr [eigen 1]**0.5]
#set dampRatio 0.05
#rayleigh 0. 0. 0. [expr 2*$dampRatio/$freq]

#  ---------------------------------    perform Dynamic Ground-Motion Analysis
 # Uniform EXCITATION: acceleration input
set IDloadTag 400;			# load tag
set GMdirection 1;				# ground-motion direction
set GMfile "NEWZEAL_A-MAT083.txt" ;			# ground-motion filenames
set DtAnalysis	0.02;	# time-step Dt for lateral analysis
#set dt 0.01;			# time step for input ground motion
set TmaxAnalysis	[expr 27.];	# maximum duration of ground-motion analysis -- should be 50*$sec
set GMfatt 1.36;			# data in input file is in g Unifts -- ACCELERATION TH
set AccelSeries "Series -dt $DtAnalysis -filePath $GMfile -factor  $GMfatt";			# time series information
pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries  ;		# create Unifform excitation
set Nsteps [expr int($TmaxAnalysis/$DtAnalysis)];
set ok [analyze $Nsteps $DtAnalysis];			# actually perform analysis; returns ok=0 if analysis was successful

if {$ok != 0} {      ;					# if analysis was not successful.
	# change some analysis parameters to achieve convergence
	# performance is slower inside this loop
	#    Time-controlled analysis
	set ok 0;
	set controlTime [getTime];
	while {$controlTime < $TmaxAnalysis && $ok == 0} {
		set ok [analyze 1 $DtAnalysis]
		set controlTime [getTime]
		set ok [analyze 1 $DtAnalysis]
		if {$ok != 0} {
			puts "Trying Newton with Initial Tangent .."
			test NormDispIncr   $Tol 1000  0
			algorithm Newton -initial
			set ok [analyze 1 $DtAnalysis]
			test $TestType $Tol $maxNumIter  0
			algorithm $algorithmType
		}
		if {$ok != 0} {
			puts "Trying Broyden .."
			algorithm Broyden 8
			set ok [analyze 1 $DtAnalysis]
			algorithm $algorithmType
		}
		if {$ok != 0} {
			puts "Trying NewtonWithLineSearch .."
			algorithm NewtonLineSearch .8
			set ok [analyze 1 $DtAnalysis]
			algorithm $algorithmType
		}
	}
};      # end if ok !0



puts "ALL DONE. End Time: [getTime]"
wipe

##########################################################################################
#-----------------------------------------------------------------------------------------
#  18. CREATE GID FLAVIA.MSH FILE FOR POSTPROCESSING
#-----------------------------------------------------------------------------------------
##########################################################################################

set meshFile [open nodes_input.flavia.msh w]
puts $meshFile "MESH 100linear dimension 3 ElemType Linear Nnode 2"
puts $meshFile "Coordinates"
puts $meshFile "#node_number   coord_x   coord_y   coord_z"
set count 1
set layerNodeCount 0
puts $meshFile 	"	5	0	0	0	"
puts $meshFile 	"	7	27	2.6	-3.99	"
puts $meshFile 	"	13	72	2.6	-3.04	"
puts $meshFile 	"	24	0	5.2	0	"
puts $meshFile 	"	27	0	5.2	0	"
puts $meshFile 	"	28	0	0	0	"
puts $meshFile 	"	29	99	0	6.18	"
puts $meshFile 	"	30	99	0	6.18	"
puts $meshFile 	"	31	99	5.2	6.18	"
puts $meshFile 	"	32	99	5.2	6.18	"
puts $meshFile 	"	40	0	2.6	1.2	"
puts $meshFile 	"	41	99	2.6	7.32	"
puts $meshFile 	"	50	27	2.6	3.02	"
puts $meshFile 	"	51	72	2.6	5.96	"
puts $meshFile 	"	55	27	2.6	1.97	"
puts $meshFile 	"	551	72	2.6	4.91	"
puts $meshFile 	"	111	2	2.6	1.33	"
puts $meshFile 	"	1111	4	2.6	1.525	"
puts $meshFile 	"	112	6	2.6	1.72	"
puts $meshFile 	"	113	11.17	2.6	2.07	"
puts $meshFile 	"	114	16.33	2.6	2.41	"
puts $meshFile 	"	115	21.5	2.6	2.76	"
puts $meshFile 	"	1115	23.5	2.6	2.835	"
puts $meshFile 	"	116	25.5	2.6	2.91	"
puts $meshFile 	"	121	28.5	2.6	3.11	"
puts $meshFile 	"	1121	30.5	2.6	3.3	"
puts $meshFile 	"	122	32.5	2.6	3.49	"
puts $meshFile 	"	123	37.5	2.6	3.82	"
puts $meshFile 	"	124	42.5	2.6	4.15	"
puts $meshFile 	"	125	48	2.6	4.5	"
puts $meshFile 	"	126	49.5	2.6	4.6	"
puts $meshFile 	"	127	51	2.6	4.7	"
puts $meshFile 	"	128	56.5	2.6	5.06	"
puts $meshFile 	"	129	61.5	2.6	5.39	"
puts $meshFile 	"	131	73.5	2.6	6.03	"
puts $meshFile 	"	1131	75.5	2.6	6.185	"
puts $meshFile 	"	132	77.5	2.6	6.34	"
puts $meshFile 	"	133	82.67	2.6	6.6	"
puts $meshFile 	"	134	87.83	2.6	6.85	"
puts $meshFile 	"	135	93	2.6	7.11	"
puts $meshFile 	"	1135	95	2.6	7.18	"
puts $meshFile 	"	136	97	2.6	7.25	"
puts $meshFile 	"	60	27	2.6	-4.65	"
puts $meshFile 	"	660	27	2.6	-4.65	"
puts $meshFile 	"	61	72	2.6	-3.7	"
puts $meshFile 	"	661	72	2.6	-3.7	"
puts $meshFile 	"	70	66.5	2.6	5.71	"
puts $meshFile 	"	700	68.5	2.6	5.785	"
puts $meshFile 	"	71	70.5	2.6	5.86	"
puts $meshFile 	"	440	0	2.6	2.45	"
puts $meshFile 	"	441	99	2.6	8.57	"
puts $meshFile 	"	888	-1.65	2.6	2.45	"
puts $meshFile 	"	882	100.65	2.6	8.57	"
puts $meshFile 	"	8820	100.65	2.6	8.57	"
puts $meshFile 	"	8880	-1.65	2.6	2.45	"
puts $meshFile 	"	8821	100.65	2.6	8.57	"
puts $meshFile 	"	8881	-1.65	2.6	2.45	"
puts $meshFile 	"	880	-1.65	2.6	0	"
puts $meshFile 	"	881	100.65	2.6	6.09	"
puts $meshFile 	"	810	99	2.6	2.89	"
puts $meshFile 	"	800	0	2.6	-3.2	"
puts $meshFile 	"	8810	99	2.6	2.89	"
puts $meshFile 	"	8800	0	2.6	-3.2	"
puts $meshFile 	"	240	0	5.6	0	"
puts $meshFile 	"	500	0	-0.4	0	"
puts $meshFile 	"	2400	0	5.6	1.2	"
puts $meshFile 	"	2401	0	5.6	1.2	"
puts $meshFile 	"	2402	0	5.6	1.2	"
puts $meshFile 	"	5000	0	-0.4	1.20;	"
puts $meshFile 	"	5001	0	-0.4	1.20;	"
puts $meshFile 	"	5002	0	-0.4	1.20;	"
puts $meshFile 	"	310	99	5.6	6.09	"
puts $meshFile 	"	290	99	-0.4	6.09	"
puts $meshFile 	"	2900	99	-0.40	7.32	"
puts $meshFile 	"	2901	99	-0.40	7.32	"
puts $meshFile 	"	2902	99	-0.40	7.32	"
puts $meshFile 	"	3100	99	5.60	7.32;	"
puts $meshFile 	"	3101	99	5.60	7.32;	"
puts $meshFile 	"	3102	99	5.60	7.32;	"
puts $meshFile 	"	8000	0	2.6	0	"
puts $meshFile 	"	8100	99	2.6	6.09	"
puts $meshFile "end coordinates"

puts $meshFile "Elements"
puts $meshFile "# element   node1   node2"
puts $meshFile 	"	1	40	111	"
puts $meshFile 	"	22	125	126	"
puts $meshFile 	"	25	126	127	"
puts $meshFile 	"	28	112	113	"
puts $meshFile 	"	29	113	114	"
puts $meshFile 	"	30	114	115	"
puts $meshFile 	"	31	132	133	"
puts $meshFile 	"	32	133	134	"
puts $meshFile 	"	33	134	135	"
puts $meshFile 	"	34	122	123	"
puts $meshFile 	"	35	123	124	"
puts $meshFile 	"	36	127	128	"
puts $meshFile 	"	38	128	129	"
puts $meshFile 	"	39	129	70	"
puts $meshFile 	"	16	124	125	"
puts $meshFile 	"	5	116	50	"
puts $meshFile 	"	6	50	121	"
puts $meshFile 	"	10	71	51	"
puts $meshFile 	"	21	51	131	"
puts $meshFile 	"	14	136	41	"
puts $meshFile 	"	2	111	1111	"
puts $meshFile 	"	2002	1111	112	"
puts $meshFile 	"	4	115	1115	"
puts $meshFile 	"	4004	1115	116	"
puts $meshFile 	"	9	70	700	"
puts $meshFile 	"	9009	700	71	"
puts $meshFile 	"	7	121	1121	"
puts $meshFile 	"	7007	1121	122	"
puts $meshFile 	"	11	131	1131	"
puts $meshFile 	"	10011	1131	132	"
puts $meshFile 	"	13	135	1135	"
puts $meshFile 	"	10013	1135	136	"
puts $meshFile 	"	17	27	40	"
puts $meshFile 	"	18	28	40	"
puts $meshFile 	"	19	32	41	"
puts $meshFile 	"	20	30	41	"
puts $meshFile 	"	210	2901	41	"
puts $meshFile 	"	220	41	3101	"
puts $meshFile 	"	230	290	29	"
puts $meshFile 	"	240	29	8100	"
puts $meshFile 	"	250	8100	31	"
puts $meshFile 	"	260	31	310	"
puts $meshFile 	"	270	290	2900	"
puts $meshFile 	"	280	310	3100	"
puts $meshFile 	"	290	41	441	"
puts $meshFile 	"	300	888	440	"
puts $meshFile 	"	310	8100	881	"
puts $meshFile 	"	320	5001	40	"
puts $meshFile 	"	330	40	2401	"
puts $meshFile 	"	340	500	5	"
puts $meshFile 	"	350	5	8000	"
puts $meshFile 	"	360	8000	24	"
puts $meshFile 	"	370	24	240	"
puts $meshFile 	"	380	500	5000	"
puts $meshFile 	"	390	240	2400	"
puts $meshFile 	"	400	40	440	"
puts $meshFile 	"	410	441	882	"
puts $meshFile 	"	420	880	8000	"
puts $meshFile 	"	41	60	7	"
puts $meshFile 	"	1014	55	50	"
puts $meshFile 	"	1015	551	51	"
puts $meshFile 	"	53	61	13	"
puts $meshFile 	"	62	7	55	"
puts $meshFile 	"	63	13	551	"
puts $meshFile 	"	991	31	32	"
puts $meshFile 	"	992	29	30	"
puts $meshFile 	"	993	24	27	"
puts $meshFile 	"	994	5	28	"
puts $meshFile 	"	995	660	60	"
puts $meshFile 	"	996	661	61	"
puts $meshFile 	"	9991	882	8820	"
puts $meshFile 	"	9992	888	8880	"
puts $meshFile 	"	99991	8820	8821	"
puts $meshFile 	"	99992	8880	8881	"
puts $meshFile 	"	9993	2900	2901	"
puts $meshFile 	"	9994	3101	3100	"
puts $meshFile 	"	9995	5000	5001	"
puts $meshFile 	"	9996	2401	2400	"
puts $meshFile 	"	9997	5002	5000	"
puts $meshFile 	"	9998	2400	2402	"
puts $meshFile 	"	9999	2902	2900	"
puts $meshFile 	"	99999	3100	3102	"
puts $meshFile 	"	500	810	8100	"
puts $meshFile 	"	501	800	8000	"
puts $meshFile 	"	997	8800	800	"
puts $meshFile 	"	998	8810	810	"
puts $meshFile 	"	2006	881	8820	"
puts $meshFile 	"	2007	880	8880	"
puts $meshFile "end elements"
close $meshFile




