clc; close all; clearvars;

addpath('./Exec_Scripts/');
if ~exist("userStruct",'var')
    addpath('./Bez_Functions/');
end

%% sim parameters
model = 'GUAM';

userStruct.variants.fmType = 2; % 1=SFunction, 2=Polynomial
userStruct.variants.actType = 2; % 1=None, 2=FirstOrder, 3=SecondOrder, 4=FirstOrderFailSurf
userStruct.variants.refInputType = 4; % 1=FOUR_RAMP, 2=ONE_RAMP, 3=Timeseries, 4=Piecewise Bezier, 5=Default(doublets)

%% Define the target structure and provide the Ramp settings
% target = struct('tas', 0, 'gndtrack', 0,'stopTime', 30);
PW_Bezier_flag = 0; % Flag to denote failure of PW Bezier setup

% First create the example trajectory (simple liftoff in hover and transition to fwd flight):
% pos in ft, vel in ft/sec, and acc in ft/sec^2
% wptsX = [0 0 0; 0 0 0; 1750 50 0]; % within row = pos vel acc, rows are waypoints
% time_wptsX = [0 10 80];
% wptsY = [0 0 0; 0 0 0; 1750 50 0]; % within row = pos vel acc, rows are waypoints
% time_wptsY = [0 10 80];
% wptsZ = [0 0 0; -80 -500/60 0;-580 -500/60 0]; % within row = pos vel acc, rows are waypoints, NOTE: NED frame -z is up...
% time_wptsZ = [0 20 80];

wptsX = [0 0 0; 0 0 0]; % within row = pos vel acc, rows are waypoints
time_wptsX = [0 80];
wptsY = [0 0 0;0 0 0; 0 -0 0]; % within row = pos vel acc, rows are waypoints
time_wptsY = [0 10 80];
wptsZ = [0 0 0; 0 0 0; 0 0 0]; % within row = pos vel acc, rows are waypoints, NOTE: NED frame -z is up...
time_wptsZ = [0 10 80];

% wptsX = [0 100 0; 2000 100 0; 3500 50 0]; % within row = pos vel acc, rows are waypoints
% time_wptsX = [0 20 40];
% wptsY = [0 0 0; 0 0 0]; % within row = pos vel acc, rows are waypoints
% time_wptsY = [0 40];
% wptsZ = [0 0 0; 0 0 0; 83.33 500/60 0]; % within row = pos vel acc, rows are waypoints, NOTE: NED frame -z is up...
% time_wptsZ = [0 20 40];


% NOTE each axis is handled seperately and can have different number of rows (waypoints and times), 
% however start and stop times must be consistent across all three axes

% Store the PW Bezier trajectory in the target structure (used in RefInputs)
target.RefInput.Bezier.waypoints = {wptsX, wptsY, wptsZ};
target.RefInput.Bezier.time_wpts = {time_wptsX time_wptsY time_wptsZ};



% Set desired Initial condition vars
target.RefInput.Vel_bIc_des    = [0;0;0];
target.RefInput.pos_des        = zeros(3,1);
target.RefInput.chi_des        = 0;
target.RefInput.chi_dot_des    = 0;
target.RefInput.trajectory.refTime = [0 80];

% target.RefInput.Vel_bIc_des    = [100;0;0];
% target.RefInput.pos_des        = zeros(3,1);
% target.RefInput.chi_des        = 0;
% target.RefInput.chi_dot_des    = 0;
% target.RefInput.trajectory.refTime = [0 40];

% Plot the sample PW Bezier curve that was created (see visualization of trajectory and derivatives)
Plot_PW_Bezier;
clear wptsX wptsY wptsZ time_wptsX time_wptsY time_wptsZ 
userStruct.trajFile = ''; % Delete user specified PW Bezier file

%% Prepare to run simulation
% set initial conditions and add trajectory to SimInput
simSetup;
open(model);

% % Execute the model
% sim(model);
% % Create sample output plots
% simPlots_GUAM;
