# How to personalize the GUAM Model
You can create a script with the following structure:
```matlab
%% sim parameters
model = 'GUAM';

%% 'userStruct' definition

%% Trajectory and basic flight manuevers definition

%% Prepare to run simulation
% set initial conditions and add trajectory to SimInput
simSetup;
open(model);
```
## 'userStruct' Customization
The simulation makes use of an input structure: "userStruct" to change the variants of various subsystems that are used, and to specify various "switches". 

### Variants
The userStruct variant options are:
```matlab
struct with fields:
 
     vehicleType: 1
         expType: DEFAULT
       atmosType: US_STD_ATMOS_76
        turbType: None
        ctrlType: BASELINE
    refInputType: EUTL_TRAJ
         actType: FirstOrder
        propType: None
          fmType: SFunction
         eomType: STARS
      sensorType: None
```
To select one op the variant options the user can either write an m-file script or simply call (in the MATLAB command line):
```matlab
userStruct.variants.fmType = 1; % 1=SFunction, 2=Polynomial
simSetup
```
If a user doesn't provide userStruct.variant selections, then the default choices are set. 

> [!TIP]
> If a field is not specified, a default enumeration value is assigned.  If a '-1' value is assigned to the field, that will cause the menu selection function to be invoked for that particular 'type' in setupTypes.m

#### Actuator Type Variants (actType)
Variants of the Control Surface Dynamics Block in the Surface and Engine Actuator Dynamics
- None:1
- FirstOrder:2
- SecondOrder:3
- FirstOrderFailSurf:4

#### Atmosphere type Variants (atmosType)
The only variant is the U.S. Standard Atmosphere, 1976, which is an idealized, steady-state representation of the earth's atmosphere from the surface to 1000 km. [Get more info](https://ntrs.nasa.gov/citations/19770009539).
| Option  | Value |
| :---: | :---: |
| US_STD_ATMOS_76 | 1 |

#### Equations of Motion Variants (eomType)
Variants of the Equations of Motion Block in the Vehicle Model
- STARS:1
- Simple:2

#### Experiment type Variants (expType)
_Doesn't appear to be implemented_
- DEFAULT:1
- ATMX_TURB:2
- BENCHMARK:3
- FULL_SIMOUT:4

#### Aero/Propulsion Force/Moment model Variants (fmType)
Variants of the Propulsion and Aerodynamic Forces and Moments Block in the Vehicle Model
| Option  | Value | Description | Default |
| :-------------: | :-------------: | :------------- | :-------------: |
| SFunction  | 1  | Contains a matlab class/object based model that allows a user to build an aircraft configuration (airfoil, number and location of rotors, aerodynamic surfaces, etc.). Produces aero-propulsive model predictions throughout the flight envelope. [Get more info](https://doi.org/10.2514/6.2021-1720) | |
| Polynomial | 2  | Composed of blended response surface equations identified from primarily computational fluid dynamics (CFD) experiments for a generic Lift+Cruise configuration. Limits may be exceeded and result in errors in some corners of the flight envelope when users ask for model predictions in areas that are not characterized by the response surface equations. [Get more info](https://doi.org/10.2514/6.2021-3170) | ✔️|

#### Propulsion type Variants (propType)
Variants of the Propulsion Dynamics Block in the Surface and Engine Actuator Dynamics
- None(1)
- FirstOrder(2)
- SecondOrder(3) 
- FirstOrderFailProp(4)

#### Sensor type Variants (sensorType)
Variants of the Sensors Block in the Vehicle Model
- None:1
- ZOH:2

#### Turbulence type Variants (turbType)
Levels of turbulence intensity. If value different from None the Ubody, Vbody, Wbody turbulence will be increased based on the selected intensity.
| Option  | Value | Default |
| :-------------: | :-------------: | :------------- | :-------------: |
| None | 1 | ✔️ |
| Light | 2 |  |
| Moderate | 3 |  |
| Severe | 4 |  |

#### Vehicle type Variants (vehicleType)
Variants of the GenCtrl Inputs Block
| Option  | Value | Description | Default | Implemented |
| :-------------: | :-------------: | :------------- | :-------------: | :-------------: |
| LiftPlusCruise | 1 | Lift+Cruise VTOL aircraft conceptual configurations. [Get more info](https://arc.aiaa.org/doi/10.2514/6.2018-3847) | ✔️ | Yes |
| Quad6 | 2 | Six-passenger quadrotor |  | No |
| GenTiltRotor | 3 | Generic Tilt Rotor |  | No |
| GenTiltWing | 4 | Generic Tilt Wing |  | No |
| GL10 | 5 | Greased Lightning (GL-10) is an aircraft configuration that combines the characteristics of a cruise efficient airplane with the ability to perform vertical takeoff and landing (VTOL). [Get more info](https://ntrs.nasa.gov/citations/20170007194) |  | No |
| LA8 | 6 | The Langley Aerodrome No. 8 (LA-8) is a distributed electric propulsion, vertical takeoff and landing (VTOL) aircraft. [Get more info](https://ntrs.nasa.gov/citations/20205011023) |  | No |
| OTHER | 7 |  |  |  |

#### Controller type Variants (ctrlType)
Variants of the Controller Block in the Vehicle Generalized Control
| Option  | Value | Description | Default | Implemented |
| :-------------: | :-------------: | :------------- | :-------------: | :-------------: |
| TRIM | 1 |  |  | No |
| BASELINE | 2 |  | ✔️ | Yes |
| BASELINE_L1 | 3 | L1 Adaptive Control. [Get more info](https://ntrs.nasa.gov/citations/20220017506) |  | No |
| BASELINE_AGI | 4 | Control allocation uses an expanded Affine Generalized Inverse (AGI) algorithm. [Get more info](https://ntrs.nasa.gov/citations/20205010869) |  | No |

#### Reference input type Variants (refInputType)
Variants of the Reference Inputs Block in the GenCtrl Inputs
| Option  | Value | Description | Default |
| :-------------: | :-------------: | :------------- | :-------------: |
| FOUR_RAMP   | 1 | Simulink ramp blocks are used to build a simple trajectory. The user makes use of an input structure "target" to provide some basic trim configuration information and then provides timing and magnitude for the ramps blocks using the SimPar structure |  |
| ONE_RAMP    | 2 |  |  |
| TIMESERIES  | 3 | Allows users to define the trajectory using a series of time-stamped points. |  |
| BEZIER      | 4 | Piece-wise Bezier curve desired trajectory. Can be a user provided PW Bezier trajectory file or a "target" structure input the contains the PW Bezier information |  |
| DEFAULT(doublets) | 5 |  | ✔️ |


### Switches
To select one op the switches options the user can either write an m-file script or simply call (in the MATLAB command line):
```matlab
userStruct.switches.FeedbackCurrent = 1; % 1 or 0
simSetup
```
If a user doesn't provide userStruct.variant selections, then the default choices are set. 
| Switch  | Default Value | Description |
| :---: | :---: | :--- |
| WindShearOn | 0 | |
| SensorNoiseOn | 0 | Switch on sensor noise when sensor type variant set to ZOH (2) |
| TrimModeOn | 0 | Switch on/off InputModification for Trimming in Surface and Engine Actuator Dynamics|
| LinearizeModeOn | 0 | |
| RefTrajOn | 0 | Switch on forces switches FeedbackCurrent and PositionError |
| FeedbackCurrent | 1 | Turns on/off table lookup (controller gains etc.) for current velocities |
| PositionError | 0 | Turns on/off position/heading error feedback in generalized controller |
| TurbulenceOn | 0 | std Ubody, Vbody, Wbody turbulence |
| RotationalGustsOn | 0 | Pbody, Qbody, Rbody rotational turbulence |
| WindsOn | 0 | Steady Winds, Wind shear, etc.. |
| AeroPropDeriv | 0 | |
| TrajAbeamPos | 0 | |

## 'SFunction' Customization
The customization of the aircraft can be done in the `/vehicles/Lift+Cruise/AeroProp/SFunction/build_Lift_plus_Cruise.m` file. This file is used to specify the tiltwing aircraft configuration.
For some reason file '/home/adcl/Documents/MATLAB/Generic-Urban-Air-Mobility-GUAM-main/vehicles/Lift+Cruise/setup.m' is overriding the num of engines and surfaces established in the build_Lift_plus_Cruise file

## Trajectory and basic flight manuevers Customization
_TODO_

## Failures Customization
The customization of the aircraft failures can be done in the `/vehicles/Lift+Cruise/setup/setupParameters.m` file

## Example
So an example of a first-principles-based strip-theory model **"SFunction"** using **"Piecewise Bezier"** for desired trajectories and basic flight manuevers to execute would be:
```matlab
userStruct.variants.fmType = 1; % 1=SFunction, 2=Polynomial
userStruct.variants.refInputType = 4; % 1=FOUR_RAMP, 2=ONE_RAMP, 3=Timeseries, 4=Piecewise Bezier, 5=Default(doublets)
```
