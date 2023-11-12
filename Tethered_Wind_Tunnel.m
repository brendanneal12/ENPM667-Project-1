%% Brendan Neal and Adam Lobo
%% ENPM667 Project 1
%% Tethered Wind Tunnel Test


%% PLEASE NOTE THAT THIS CODE DOES NOT WORK. 
% RATHER, THIS IS HERE TO SHOW WE ATTEMPTED TO BUILD THE MODEL FROM SCRATCH AND SIMULATE
% See Report for more details.

%% Desired Values
phi_des = 10; %deg
theta_des = 7; %deg
r_des = 1; %deg/s

%% UAV Specifications
rho = 1.204; %kg/m^3
S = 0.44; %m^2
b = 0.490; %m
Va = 7; %m/s
c = 0.0885; %m
Bc = 0; %Course Angle

%Moments of Inertia
Ix = 0.8869; %kg/m^2
Iy = 1.0353; %kg/m^2
Iz = 1.2138; %kg/m^2
Ixz = Ix*Iz;

Gamma0 = Ix*Iz-(Ixz)^2;
Gamma1 = (Ixz*(Ix-Iy-Iz))/Gamma0;
Gamma2 = (Iz*(Iz-Iy)+(Ixz^2))/Gamma0;
Gamma3 = Iz/Gamma0;
Gamma4 = Ixz/Gamma0;
Gamma5 = (Iz-Ix)/Iy;
Gamma6 = Ixz/Gamma0;
Gamma7 = ((Ix-Iy)*Ix+Ixz^2)/Gamma0;
Gamma8 = Ix/Gamma0;

%L Moment Derivative Coefficients (unknown)
Clo = 1.108;
Clbc = 1;
Clp = -11.5;
Clr = -15.4;
Clda = 0.65;
Cldr = -0.005;


%M Moment Derivative Coefficients (unknown)
Cmo = 1;
Cma = -1.26;
Cmq = -20.8;
Cmde = 1.34;

%N Moment Derivative Coefficients (unknown)
Cno = 1.108;
Cnbc = 1;
Cnp = -12;
Cnr = -15;
Cnda = -0.065;
Cndr = 0.005;


%% Controller Gains

%Outer Loop Roll Angle Gains
Kc2 = 7.67;
tau2 = 24.12;

%Outer Loop Pitch Angle Gains (unknown)
Kc3 = 4.5; 
tau3 = 20.12;

%Inner Loop q Gains (unknown)
Kc4 = 0.87;
tau4 = 0.10;

%Inner Loop r Gains (unknown)
Kc5 = 0.55;
tau5 = 1.25;

%% Simulation

out = sim('Simulink_Models/Tethered_Wind_Tunnel_Test.slx',50);

%% Plotting
figure()
plot(out.phi.Time, out.phi.Data, 'b-')
ylim([-50 50])
xlabel('Time (s)')
ylabel('Roll Angle (deg)')
title('Tethered Wind Tunnel Test - Phi vs. Time')

figure()
plot(out.theta.Time, out.theta.Data, 'r')
ylim([-50 50])
xlabel('Time (s)')
ylabel('Control Signal')
title('Tethered Wind Tunnel Test - Theta vs. Time')