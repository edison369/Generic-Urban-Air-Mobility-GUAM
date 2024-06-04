# How to personalize the GUAM Model
You can create a script with the following structure:
```MATLAB
%% sim parameters
model = 'GUAM';

%% 'userStruct' definition

%% Trajectory and basic flight manuevers definition

%% Prepare to run simulation
% set initial conditions and add trajectory to SimInput
simSetup;
open(model);
```
## 'userStruct' definition
The simulation makes use of an input structure: "userStruct" to change the variants of various subsystems that are used, and to specify various "switches". If a user doesn't provide userStruct.variant selections, 
then the default choices (vehicle specific) as set in ./vehicles/Lift+Cruise/setup/setupDefaultChoices.m. 
The userStruct options are:
```MATLAB
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
> [!TIP]
> If a field is not specified, a default enumeration value is assigned.  If a '-1' value is assigned to the field, that will cause the menu selection function to be invoked for that particular 'type' in setupTypes.m

### Variants
#### Actuator Type Variants (actType)
- None:1
- FirstOrder:2
- SecondOrder:3
- FirstOrderFailSurf:4

### Atmosphere type Variants (atmosType)
- US_STD_ATMOS_76:1

### Equations of Motion Variants (eomType)
- STARS:1
- Simple:2

### Experiment type Variants (expType)
- DEFAULT:1
- ATMX_TURB:2
- BENCHMARK:3
- FULL_SIMOUT:4

### Aero/Propulsion Force/Moment model Variants (fmType)
Two aero-propulsive model options are available: a low-fidelity, first-principles-based strip-theory model and a mid-fidelity, computationally-derived polynomial model.
| Option  | Value | Description | Default |
| ------------- | :-------------: | :------------- | :-------------: |
| SFunction  | 1  | Contains a matlab class/object based model that allows a user to build an aircraft configuration (airfoil, number and location of rotors, aerodynamic surfaces, etc.). Produces aero-propulsive model predictions throughout the flight envelope | |
| Polynomial | 2  | Composed of blended response surface equations identified from primarily computational fluid dynamics (CFD) experiments for a generic Lift+Cruise configuration. Limits may be exceeded and result in errors in some corners of the flight envelope when users ask for model predictions in areas that are not characterized by the response surface equations | ✔️|

### Propulsion type Variants (propType)
- None(1)
- FirstOrder(2)
- SecondOrder(3) 
- FirstOrderFailProp(4)

### Sensor type Variants (sensorType)
- None:1
- ZOH:2

### Turbulence type Variants (turbType)
- None:1
- Enabled:2

### Vehicle type Variants (vehicleType)
- LiftPlusCruise:1
- Quad6:2
- GenTiltRotor:3
- GenTiltWing:4
- GL10:5
- LA8:6
- OTHER:7

### Controller type Variants (ctrlType)
- TRIM:1
- BASELINE:2
- BASELINE_L1:3
- BASELINE_AGI:4

### Reference input type Variants (refInputType)
| Option  | Value | Description | Default |
| ------------- | :-------------: | :------------- | :-------------: |
| FOUR_RAMP   | 1 | Simulink ramp blocks are used to build a simple trajectory. The user makes use of an input structure "target" to provide some basic trim configuration information and then provides timing and magnitude for the ramps blocks using the SimPar structure |  |
| ONE_RAMP    | 2 |  |  |
| TIMESERIES  | 3 |  |  |
| BEZIER      | 4 | Piece-wise Bezier curve desired trajectory. Can be a user provided PW Bezier trajectory file or a "target" structure input the contains the PW Bezier information |  |
| DEFAULT(doublets) | 5 |  |  |


### Switches
TODO

## Trajectory and basic flight manuevers definition
TODO

## Example
So an example of a first-principles-based strip-theory model **"SFunction"** using **"Piecewise Bezier"** for desired trajectories and basic flight manuevers to execute would be:
```MATLAB
userStruct.variants.fmType = 1; % 1=SFunction, 2=Polynomial
userStruct.variants.refInputType = 4; % 1=FOUR_RAMP, 2=ONE_RAMP, 3=Timeseries, 4=Piecewise Bezier, 5=Default(doublets)
```
