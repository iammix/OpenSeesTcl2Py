ADSpan = 6.580711
JDSpan = 0.25517
IzDSpan = 4.640704
IyDSpan = 77.581343
ADSupport = 10.395654
JDSupport = 1.545231
IzDSupport = 6.131701
IyDSupport = 120.808531
Aabtm = 28.2
Jabtm = 58.390254
Izabtm = 12.977875
Iyabtm = 338.4
Adokedr = 15.18
Jdokedr = 8.971443
Izdokedr = 2.55038
Iydokedr = 146.930013
Asynddok = 2.225
Jsynddok = 0.045534
Izsynddok = 0.011589
Iysynddok = 14.686854
Akefalod = 100
Jkefalod = 1285.199242
Izkefalod = 533.333333
Iykefalod = 1302.083333
Athwrakio = 4.8
Jthwrakio = 0.250624
Izthwrakio = 0.064
Iythwrakio = 57.6
Apiles = 0.785398
Jpiles = 0.098175
Izpiles = 0.049087
Iypiles = 0.049087
ARIGID = 10000
JRIGID = 10000
IzRIGID = 10000
IyRIGID = 10000
Edeck = 35000000
Eth = 30000000
Evathro = 30000000
Gdeck = [expr
Gth = [expr
Gvathro = [expr
numIntgrPtsNLBC = 5
secTagDECKSPAN = 100
secTagDECKSUPPORT = 101
secTagABUTMENT = 102
secTagDOKOSEDRASHS = 103
secTagSYNDDOKOS = 104
secTagKEFALODESMOS = 105
secTagTHWRAKIO = 106
secTagPILES = 107
secTagRIGID = 108
IDColTransf = 1
IDBeamTransf = 2
IDR1Transf = 3
IDR2Transf = 4
matTagKv1236 = 4
Kv1236 = 1490438
eta = 0.05
matTagKh1236 = 5
Kh1236 = 3500
ke1236 = 6393;

fy1236 = 147.007;

alpha = 0.5;

matTagKbx1236 = 6
Kbx1236 = 9981
matTagKby1236 = 7
Kby1236 = 9981
matTagKv45 = 44
Kv45 = 3950272
eta = 0.05
matTagKh45 = 54
Kh45 = 4545
ke45 = 8302;

fy45 = 121.518;

alpha = 0.5;

matTagKbx45 = 64
Kbx45 = 18212
matTagKby45 = 74
Kby45 = 18212
matTagKvA = 444
KvA = 685940
eta = 0.05
matTagKhA = 544
KhA = 2864
keA = 3632;

fyA = 121.518;

alpha = 0.5;

matTagKbxA = 644
KbxA = 5969
matTagKbyA = 744
KbyA = 5969
matTagKxP = 51
KxP = 17126946.6
matTagKyP = 61
KyP = 17126946.6
matTagKzP = 71
KzP = 19141028.84
matTagKrxP = 81
KrxP = 486384205.3
matTagKryP = 92
KryP = 503156074
matTagKrzP = 93
KrzP = 789790660
matTagkxyPileA = 41
kxyPileA = 62800
matTagkxyPileB = 42
kxyPileB = 62800
matTagkz1Pile = 43
kzPile1 = 402
matTagkzPile = 45
kzPile = 35342
matTagGap1X = 88
E = 1750000
Fygap = -55800
gap = -0.20
matTagGap2X = 888
E = 1750000
Fygap = 55800
gap = 0.20
matTagAbtm_X = 1001

e1pX = 0.03
s1pX = 10418
e2pX = 0.105
s2pX = 17725
e3pX = 0.3
s3pX = 23701
pinchX = 1
pinchY = 1
damage1 = 0
damage2 = 0
matTagAbtm_Y = 1004

e1pY = 0.03
s1pY = 6945
e2pY = 0.105
s2pY = 20507
e3pY = 0.3
s3pY = 31602
pinchX = 1
pinchY = 1
damage1 = 0
damage2 = 0;

Ecthwr = 30000000
Athwr = [expr
EAthwr = [expr
Gthwr = [expr
thwrMatTagAxial = 30000
thwrMatTagFlex0 = 20001
thwrSecTag = 20002
Mythwr0 = 5398
Muthwr0 = 5810
PhiYthwr0 = 0.012
Phiuthwr0 = 0.1284
secTagBackwall = 20003;

matTagKx = 50
Kx = 15008375.3
matTagKy = 60
Ky = 13840247.3
matTagKz = 70
Kz = 15825975.16
matTagKrx = 80
Krx = 314276813.8
matTagKry = 90
Kry = 125789019
matTagKrz = 91
Krz = 783994694.5
Tol = 1.0e-8
NstepGravity = 5
DGravity = [expr
Tol = 1.0e-6
omega = {}

f = {}

T = {}

lambda = [eigen
period = "Periods.txt"

Periods = [open
Tol = 1.e-8
maxNumIter = 1000
printFlag = 0
TestType = EnergyIncr
algorithmType = ModifiedNewton

NewmarkGamma = 0.5
NewmarkBeta = 0.25
a0 = 0.38

a1 = 0.0065

IDloadTag = 400
GMdirection = 1
GMfile = "NEWZEAL_A-MAT083.txt"
DtAnalysis = 0.02
TmaxAnalysis = [expr
GMfatt = 10.0
AccelSeries = "Series
Nsteps = [expr
ok = [analyze
meshFile = [open
count = 1

layerNodeCount = 0

