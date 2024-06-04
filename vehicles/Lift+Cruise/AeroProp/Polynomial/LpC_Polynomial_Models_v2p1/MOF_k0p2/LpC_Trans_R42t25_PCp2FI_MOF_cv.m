function [C]=LpC_Trans_R42t25_PCp2FI_MOF_cv(u,v,w,LA,RA,LE,RE,RUD,N1,N2,N3,N4,N5,N6,N7,N8,N9)
% LpC_Trans_R42t25_PCp2FI_MOF_cv - Aerodynamic model for "LpC Trans"
%
% DESCRIPTION: 
%   This script contains the aerodynamic model for the Lift+Cruise transition regime. The script was
%   automatically generated using "GenModelCV.m" on 17-Mar-2021 22:58:23
%
% INPUTS:
%   List of column vectors containing the model explanatory variables 
%       The variables are in the following order:
%       [u,v,w,LA,RA,LE,RE,RUD,N1,N2,N3,N4,N5,N6,N7,N8,N9]
%       Units: deg for angles, kts for velocity, rpm for rotor speed
%
% OUTPUTS:
%   C - Matrix containing the model response variables in each column 
%       The variables are in the following order:
%       [Faxial,Fside,Fnormal,Mroll,Mpitch,Myaw,Flift,Fdrag]
%       Units: lbf for forces, ft-lbf for moments 
%
% WRITTEN BY:
%   Benjamin M. Simmons
%   Flight Dynamics Branch (D317)
%   NASA Langley Research Center
%
% REFERENCE:
%   Simmons, B. M., Buning, P. G., and Murphy, P. C., "Full-Envelope
%   Aero-Propulsive Model Identification for Lift+Cruise Aircraft Using
%   Computational Experiments," AIAA AVIATION Forum, Aug. 2021.
%   https://doi.org/10.2514/6.2021-3170
%
% HISTORY:
%   17 MAR 2021 - created and debugged, BMS
%

%
%   Explantory variable ranges used to develop model:
%             u: [  +13.75,   +32.5] kts
%             v: [     -10,     +10] kts
%             w: [     -10,     +10] kts
%            LA: [     -30,     +30] deg
%            RA: [     -30,     +30] deg
%            LE: [     -30,     +30] deg
%            RE: [     -30,     +30] deg
%           RUD: [     -30,     +30] deg
%            N1: [    +550,   +1550] rpm
%            N2: [    +550,   +1550] rpm
%            N3: [    +550,   +1550] rpm
%            N4: [    +550,   +1550] rpm
%            N5: [    +550,   +1550] rpm
%            N6: [    +550,   +1550] rpm
%            N7: [    +550,   +1550] rpm
%            N8: [    +550,   +1550] rpm
%            N9: [    +750,   +1750] rpm
%

% Conversion from natural variables to coded variables
u_cv = ( u-(2.31250000000000E+01) )/(9.37500000000000E+00);
v_cv = ( v-(0.00000000000000E+00) )/(1.00000000000000E+01);
w_cv = ( w-(0.00000000000000E+00) )/(1.00000000000000E+01);
LA_cv = ( LA-(0.00000000000000E+00) )/(3.00000000000000E+01);
RA_cv = ( RA-(0.00000000000000E+00) )/(3.00000000000000E+01);
LE_cv = ( LE-(0.00000000000000E+00) )/(3.00000000000000E+01);
RE_cv = ( RE-(0.00000000000000E+00) )/(3.00000000000000E+01);
RUD_cv = ( RUD-(0.00000000000000E+00) )/(3.00000000000000E+01);
N1_cv = ( N1-(1.05000000000000E+03) )/(5.00000000000000E+02);
N2_cv = ( N2-(1.05000000000000E+03) )/(5.00000000000000E+02);
N3_cv = ( N3-(1.05000000000000E+03) )/(5.00000000000000E+02);
N4_cv = ( N4-(1.05000000000000E+03) )/(5.00000000000000E+02);
N5_cv = ( N5-(1.05000000000000E+03) )/(5.00000000000000E+02);
N6_cv = ( N6-(1.05000000000000E+03) )/(5.00000000000000E+02);
N7_cv = ( N7-(1.05000000000000E+03) )/(5.00000000000000E+02);
N8_cv = ( N8-(1.05000000000000E+03) )/(5.00000000000000E+02);
N9_cv = ( N9-(1.25000000000000E+03) )/(5.00000000000000E+02);






% Faxial Model

Faxial = ...
  -2.01675721767937E+03 .*                    1  + ... 
  -1.80473304659557E+03 .*                N9_cv  + ... 
  -2.40764537488725E+02 .*             N9_cv.^2  + ... 
  -1.12100906183080E+02 .*              w_cv.^3  + ... 
  +1.14403718740093E+02 .*              u_cv.^3  + ... 
  +7.20017991908625E+01 .*                N4_cv  + ... 
  +5.96370382173588E+01 .*                 v_cv  + ... 
  -5.81876211043690E+01 .*                LE_cv  + ... 
  +5.25129586181246E+01 .*               RUD_cv  + ... 
  +5.03890255020873E+01 .*                RE_cv  + ... 
  +4.28380814363852E+01 .*                N2_cv  + ... 
  +3.55435821899885E+01 .*             N7_cv.^3  + ... 
  -8.12805863963171E+01 .*        u_cv .* N9_cv  + ... 
  +3.44616038394047E+01 .*       N4_cv .* N9_cv  + ... 
  +3.53003604749438E+01 .*       RE_cv .* N9_cv  + ... 
  +3.17945867148726E+01 .*             N1_cv.^3  + ... 
  -3.16277826488914E+01 .*       LE_cv .* N9_cv  + ... 
  +3.11121304560652E+01 .*             N8_cv.^3  + ... 
  +3.24820136341841E+01 .*        v_cv .* N9_cv  + ... 
  +3.20456934698366E+01 .*      RUD_cv .* N9_cv  + ... 
  +2.70154100117526E+01 .*                N3_cv  + ... 
  +1.04356799174580E+02 .*             N9_cv.^3  + ... 
  +3.00372250074048E+01 .*        v_cv .* N3_cv ;      

% Fside Model

Fside = ...
  -3.12518123397314E+02 .*                 v_cv  + ... 
  -2.38285937044927E+02 .*                N3_cv  + ... 
  +2.38336093916094E+02 .*                N5_cv  + ... 
  +1.77140695794886E+02 .*                N6_cv  + ... 
  -1.68701827902237E+02 .*                N4_cv  + ... 
  -9.68810864352679E+01 .*               RUD_cv  + ... 
  -6.75153846001269E+01 .*         v_cv .* w_cv  + ... 
  -5.29950621510215E+01 .*        v_cv .* N9_cv  + ... 
  -3.93555616032304E+01 .*      RUD_cv .* N9_cv  + ... 
  +7.43675330205780E+01 .*         u_cv .* v_cv  + ... 
  +2.75468285631489E+01 .*        w_cv .* N6_cv  + ... 
  -2.68337403710795E+01 .*        w_cv .* N4_cv  + ... 
  -2.50161498917245E+01 .*        v_cv .* N3_cv  + ... 
  -2.36438639412400E+01 .*        v_cv .* N5_cv  + ... 
  +2.17267524643359E+01 .*             N9_cv.^3  + ... 
  -4.12401155350303E+01 .*        u_cv .* N4_cv  + ... 
  +1.60274825210986E+01 .*             N8_cv.^3  + ... 
  -2.69806206828073E+01 .*             N2_cv.^3  + ... 
  +5.89264091300905E+01 .*        u_cv .* N6_cv  + ... 
  +1.90908638979795E+01 .*        w_cv .* N3_cv  + ... 
  -1.83926858499453E+01 .*        v_cv .* N7_cv  + ... 
  -1.84487015063055E+01 .*             N1_cv.^3  + ... 
  +1.80720722907143E+01 .*       N6_cv .* N9_cv  + ... 
  -5.58311121068090E+01 .*             N5_cv.^3  + ... 
  -1.73541428142298E+01 .*        v_cv .* N1_cv  + ... 
  +5.09204278336787E+01 .*             N3_cv.^3  + ... 
  -2.90574974580096E+01 .*       u_cv .* RUD_cv  + ... 
  -1.21453630076603E+01 .*                LE_cv  + ... 
  +1.32656315437505E+01 .*             N7_cv.^3  + ... 
  -1.55397016567749E+01 .*       N5_cv .* N6_cv  + ... 
  -1.53658737567497E+01 .*        v_cv .* N8_cv  + ... 
  +6.31033259309528E+01 .*             N5_cv.^2  + ... 
  -6.37982895047161E+01 .*             N3_cv.^2  + ... 
  +1.35609763530064E+01 .*       N5_cv .* N7_cv  + ... 
  -1.23866399969425E+01 .*        v_cv .* N2_cv  + ... 
  -1.19224612376497E+01 .*        w_cv .* N5_cv  + ... 
  -1.22939815903237E+01 .*        v_cv .* RA_cv  + ... 
  -1.17954501708486E+01 .*        w_cv .* N2_cv  + ... 
  -1.04882163710262E+01 .*      RE_cv .* RUD_cv  + ... 
  -3.14863764989704E+01 .*        u_cv .* N2_cv  + ... 
  -1.19085494758559E+01 .*        v_cv .* N4_cv  + ... 
  -9.79303734023973E+00 .*       N7_cv .* N8_cv  + ... 
  -1.10202665558000E+01 .*       N1_cv .* N3_cv  + ... 
  -1.11513802199270E+01 .*        v_cv .* N6_cv  + ... 
  -1.15367161966275E+01 .*                 u_cv  + ... 
  +9.88167584330397E+00 .*       RE_cv .* N8_cv  + ... 
  -9.52683533930134E+00 .*       LA_cv .* N4_cv ;      

% Fnormal Model

Fnormal = ...
  +8.13645415837747E+03 .*                    1  + ... 
  +1.05714420882391E+03 .*                N4_cv  + ... 
  +1.05954436437388E+03 .*                N8_cv  + ... 
  +1.05069239775190E+03 .*                N6_cv  + ... 
  +1.05194641237504E+03 .*                N2_cv  + ... 
  +9.90706807517510E+02 .*                 w_cv  + ... 
  +7.60739333680111E+02 .*                N7_cv  + ... 
  +7.61497149876806E+02 .*                N1_cv  + ... 
  +6.59583957855527E+02 .*                N5_cv  + ... 
  +6.47489973513758E+02 .*                N3_cv  + ... 
  +1.72535587416500E+02 .*             N8_cv.^2  + ... 
  +1.79475186399585E+02 .*              u_cv.^3  + ... 
  +1.76797222635862E+02 .*             N6_cv.^2  + ... 
  +1.99193660104134E+02 .*             N7_cv.^2  + ... 
  +3.85850868118284E+02 .*         u_cv .* w_cv  + ... 
  +2.24833401325756E+02 .*             N2_cv.^2  + ... 
  +1.88014595489074E+02 .*             N5_cv.^2  + ... 
  +3.57903448225188E+02 .*                 u_cv  + ... 
  +1.75963918697161E+02 .*             N3_cv.^2  + ... 
  +7.77147820479802E+01 .*             LE_cv.^3  + ... 
  -7.87122513271590E+01 .*        v_cv .* N5_cv  + ... 
  +6.75581501758861E+01 .*                LA_cv  + ... 
  +1.84688444979840E+02 .*              w_cv.^2  + ... 
  +6.78968793440556E+01 .*                RA_cv  + ... 
  +7.36192569908761E+01 .*                RE_cv  + ... 
  -6.82064573017958E+01 .*                N9_cv  + ... 
  +7.20625155050570E+01 .*        w_cv .* N2_cv  + ... 
  +1.65465715175118E+02 .*             N1_cv.^2  + ... 
  +1.62039228803144E+02 .*              u_cv.^2  + ... 
  +1.28238795723070E+02 .*             N4_cv.^2  + ... 
  -1.40126086078689E+02 .*              v_cv.^2 ;      

% Mroll Model

Mroll = ...
  +1.92708208416109E+04 .*                N2_cv  + ... 
  -1.90487864135088E+04 .*                N8_cv  + ... 
  +1.39787377233438E+04 .*                N1_cv  + ... 
  -1.39094954755540E+04 .*                N7_cv  + ... 
  +7.51664915014149E+03 .*                N4_cv  + ... 
  -7.58623306649199E+03 .*                N6_cv  + ... 
  -4.80406344676283E+03 .*                N5_cv  + ... 
  +4.87978484218496E+03 .*                N3_cv  + ... 
  -2.92173269689382E+03 .*                    1  + ... 
  -2.84645852497096E+03 .*         v_cv .* w_cv  + ... 
  -2.36949760241461E+03 .*                N9_cv  + ... 
  -2.21570183258293E+03 .*                 v_cv  + ... 
  -1.55583200102843E+03 .*        w_cv .* N1_cv  + ... 
  +1.34619842595001E+03 .*        w_cv .* N7_cv  + ... 
  -4.16421174034885E+03 .*             N8_cv.^2  + ... 
  +3.85301153026132E+03 .*             N2_cv.^2  + ... 
  -3.65928700479391E+03 .*             N7_cv.^2  + ... 
  +3.64207933192441E+03 .*             N1_cv.^2  + ... 
  +1.16004255841146E+03 .*             LA_cv.^3  + ... 
  -8.60533307483194E+02 .*                RA_cv  + ... 
  -1.85905311272918E+03 .*             N5_cv.^2  + ... 
  +1.78631838731302E+03 .*             N4_cv.^2  + ... 
  -8.05549162321340E+02 .*        w_cv .* N3_cv  + ... 
  -1.74079890149054E+03 .*             N6_cv.^2  + ... 
  +1.64875873413572E+03 .*             N3_cv.^2  + ... 
  +7.37678485682943E+02 .*        w_cv .* N5_cv  + ... 
  +6.86413913447966E+02 .*        w_cv .* N2_cv ;      

% Mpitch Model

Mpitch = ...
  +3.58705116321024E+03 .*                N3_cv  + ... 
  +3.50965136122722E+03 .*                N5_cv  + ... 
  +3.38288368423099E+03 .*                N7_cv  + ... 
  -3.32185808300255E+03 .*                N8_cv  + ... 
  +3.30225486247384E+03 .*                N1_cv  + ... 
  -3.30229748380117E+03 .*                N2_cv  + ... 
  -2.63583173799231E+03 .*                N4_cv  + ... 
  -2.61046463570219E+03 .*                N6_cv  + ... 
  -1.99143578899671E+03 .*                N9_cv  + ... 
  -7.09590075641961E+02 .*                LE_cv  + ... 
  -5.27041237799288E+02 .*                RE_cv  + ... 
  -8.17118859459007E+02 .*             N6_cv.^2  + ... 
  +5.32703763732133E+02 .*        v_cv .* N3_cv  + ... 
  -4.44833449636915E+02 .*        v_cv .* N5_cv  + ... 
  +4.01256872583978E+02 .*        w_cv .* N6_cv  + ... 
  -3.50443070882397E+02 .*       LE_cv .* N9_cv  + ... 
  +7.44062533955653E+02 .*              w_cv.^2  + ... 
  -7.91370372669611E+02 .*             N2_cv.^2  + ... 
  +3.40875396568805E+02 .*        w_cv .* N4_cv  + ... 
  +3.00377329391547E+02 .*        v_cv .* N7_cv  + ... 
  -2.62266281695897E+02 .*       RE_cv .* N9_cv  + ... 
  +2.93859948755939E+02 .*        w_cv .* N3_cv  + ... 
  +2.97770822707066E+02 .*                    1  + ... 
  -7.13517382761947E+02 .*             N4_cv.^2  + ... 
  +2.74739794363723E+02 .*        w_cv .* N5_cv  + ... 
  +4.53179359632470E+02 .*             N7_cv.^2  + ... 
  -6.79387263292460E+02 .*             N8_cv.^2  + ... 
  +4.98548185095035E+02 .*             N1_cv.^2  + ... 
  -2.10304343419720E+02 .*                 v_cv  + ... 
  -2.37593995275654E+02 .*        v_cv .* N1_cv  + ... 
  +8.07301566839329E+02 .*                 w_cv  + ... 
  +2.23019379720016E+02 .*       N1_cv .* N3_cv  + ... 
  +1.88501198475573E+02 .*               RUD_cv  + ... 
  -6.83287701350883E+02 .*              w_cv.^3  + ... 
  -1.87830236161152E+02 .*        v_cv .* LE_cv  + ... 
  +4.04120295750957E+02 .*             N3_cv.^2 ;      

% Myaw Model

Myaw = ...
  +2.10124030660352E+03 .*                N4_cv  + ... 
  -1.93634697507608E+03 .*                N3_cv  + ... 
  +1.91832235772783E+03 .*                N5_cv  + ... 
  -2.12558015475616E+03 .*                N6_cv  + ... 
  +1.74868361412650E+03 .*                 v_cv  + ... 
  +1.59841309392626E+03 .*               RUD_cv  + ... 
  +1.25591293609200E+03 .*                N8_cv  + ... 
  -1.15902942839236E+03 .*                N2_cv  + ... 
  +1.15657533521512E+03 .*        v_cv .* N9_cv  + ... 
  +7.18837634871362E+02 .*                    1  + ... 
  +6.28972701490133E+02 .*      RUD_cv .* N9_cv  + ... 
  +3.60953818102614E+02 .*         v_cv .* w_cv  + ... 
  -7.12734614844471E+02 .*             N2_cv.^2  + ... 
  -7.61318814831001E+02 .*        u_cv .* N6_cv  + ... 
  +3.27483358277294E+02 .*        w_cv .* N7_cv  + ... 
  -3.06871371342172E+02 .*        w_cv .* N1_cv  + ... 
  -1.75069047194309E+02 .*                N7_cv  + ... 
  +1.91798099080036E+02 .*                N1_cv  + ... 
  +2.78496592439381E+02 .*        w_cv .* N4_cv  + ... 
  +3.16941462377992E+02 .*        v_cv .* N6_cv  + ... 
  -2.85869521398202E+02 .*        v_cv .* N3_cv  + ... 
  -2.97724198296146E+02 .*        v_cv .* N5_cv  + ... 
  +3.06004451541452E+02 .*                LE_cv  + ... 
  +5.44262018624813E+02 .*             N8_cv.^2  + ... 
  -5.41558546224325E+02 .*             N3_cv.^2  + ... 
  -2.19350898239927E+02 .*       N6_cv .* N9_cv  + ... 
  +5.31307615488461E+02 .*        u_cv .* N4_cv  + ... 
  +2.26887588987722E+02 .*        v_cv .* N4_cv  + ... 
  -5.30467405320069E+02 .*         u_cv .* v_cv  + ... 
  +2.50052649146891E+02 .*                 u_cv  + ... 
  -2.06661776619174E+02 .*        w_cv .* N6_cv  + ... 
  +4.09811798891347E+02 .*       u_cv .* RUD_cv  + ... 
  +1.50721999301334E+02 .*       N4_cv .* N9_cv  + ... 
  +2.83364538612171E+02 .*             N5_cv.^2  + ... 
  +3.72307285721430E+02 .*        u_cv .* LE_cv  + ... 
  -3.65849323751083E+02 .*             N6_cv.^2  + ... 
  +1.25311604788209E+02 .*      RA_cv .* RUD_cv  + ... 
  +1.95356150306060E+02 .*        u_cv .* N9_cv  + ... 
  +1.29450359867829E+02 .*      RE_cv .* RUD_cv  + ... 
  +2.98471522192962E+02 .*        u_cv .* N7_cv  + ... 
  +1.05698535519166E+02 .*                RA_cv  + ... 
  +1.19249595624844E+02 .*      LE_cv .* RUD_cv  + ... 
  +2.13374456720926E+02 .*             N1_cv.^2  + ... 
  -8.69877193941285E+01 .*                LA_cv  + ... 
  +1.10136345695417E+02 .*       N7_cv .* N8_cv  + ... 
  +1.15284153913459E+02 .*       LE_cv .* N9_cv  + ... 
  -2.74080451294625E+02 .*        u_cv .* N1_cv  + ... 
  -1.03940918275211E+02 .*       RA_cv .* RE_cv  + ... 
  -1.04009390139662E+02 .*       LE_cv .* RE_cv  + ... 
  +2.18694436710768E+02 .*             RA_cv.^2  + ... 
  -9.71823569843906E+01 .*       LA_cv .* N7_cv ;      

% Flift Model

Flift = ...
  +8.26355835183999E+03 .*                    1  + ... 
  +1.98734846462466E+03 .*                 w_cv  + ... 
  +9.81137269880788E+02 .*                N8_cv  + ... 
  +9.73068040127668E+02 .*                N4_cv  + ... 
  +1.00958505441408E+03 .*                N6_cv  + ... 
  +1.01548838531571E+03 .*                N2_cv  + ... 
  +6.99493177063429E+02 .*                N1_cv  + ... 
  +6.96897749886651E+02 .*                N7_cv  + ... 
  +7.68470458927418E+02 .*        w_cv .* N9_cv  + ... 
  +5.96898789747379E+02 .*                N5_cv  + ... 
  +5.85562763581075E+02 .*                N3_cv  + ... 
  +6.30342463744546E+02 .*                 u_cv  + ... 
  +2.01354160927573E+02 .*             N6_cv.^2  + ... 
  -6.94278946275015E+02 .*              w_cv.^2  + ... 
  +1.84118912981879E+02 .*             N8_cv.^2  + ... 
  +1.78777232630955E+02 .*             N3_cv.^2  + ... 
  +1.88267673696838E+02 .*             N2_cv.^2  + ... 
  +1.55665897551789E+02 .*             N7_cv.^2  + ... 
  +8.42671483166738E+01 .*             LE_cv.^3  + ... 
  +7.39838640559672E+01 .*                RE_cv  + ... 
  +6.80249862076231E+01 .*                RA_cv  + ... 
  +6.73817846237657E+01 .*                LA_cv  + ... 
  +1.96762667938301E+02 .*        u_cv .* N2_cv  + ... 
  +1.60112216706218E+02 .*             N1_cv.^2  + ... 
  -6.89501377559274E+01 .*        v_cv .* N5_cv  + ... 
  -6.15107860033634E+01 .*                N9_cv  + ... 
  +1.44315608312017E+02 .*             N4_cv.^2  + ... 
  -1.98068407457549E+02 .*              w_cv.^3  + ... 
  -1.45705649024314E+02 .*              v_cv.^2  + ... 
  +1.55777493543564E+02 .*        u_cv .* N6_cv  + ... 
  +1.27582474387022E+02 .*             N5_cv.^2 ;      

% Fdrag Model

Fdrag = ...
  +3.70956595288746E+03 .*                 w_cv  + ... 
  -1.99361228698404E+03 .*                    1  + ... 
  -1.43458356949966E+03 .*                N9_cv  + ... 
  +4.45934629625033E+02 .*        w_cv .* N2_cv  + ... 
  +4.42458680894525E+02 .*        w_cv .* N4_cv  + ... 
  +4.21185578113225E+02 .*        w_cv .* N6_cv  + ... 
  +4.50130843125702E+02 .*        w_cv .* N8_cv  + ... 
  -1.05089778938005E+03 .*         u_cv .* w_cv  + ... 
  +5.06230583456865E+02 .*              w_cv.^2  + ... 
  +3.22863439047254E+02 .*        w_cv .* N1_cv  + ... 
  +3.19456391209794E+02 .*        w_cv .* N7_cv  + ... 
  +2.83315469463841E+02 .*        w_cv .* N5_cv  + ... 
  +2.88358616273642E+02 .*        w_cv .* N3_cv  + ... 
  +3.39534041656454E+02 .*              v_cv.^2  + ... 
  -1.05028293708826E+02 .*        v_cv .* N5_cv  + ... 
  -2.08762154509964E+02 .*             N9_cv.^2  + ... 
  +1.00009859726542E+02 .*        v_cv .* N3_cv  + ... 
  +7.38854118868472E+01 .*                N2_cv  + ... 
  +7.04365041461750E+01 .*                N4_cv  + ... 
  -2.54011998520352E+02 .*              w_cv.^3 ;      



% Output response variable predictions
C = [Faxial,Fside,Fnormal,Mroll,Mpitch,Myaw,Flift,Fdrag];

return