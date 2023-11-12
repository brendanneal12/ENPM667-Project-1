%% Brendan Neal and Adam Lobo
%% ENPM667 Project 1
%% Gain Scheduled Zero Ref Response

%% Desired Value
phi_des = 0; %deg

%% Uav Specifications
rho = 1.204; %kg/m^3
S = 0.44; %m^2
b = 0.490; %m

%L Moment Derivative Coefficients
Clo = 1.108;
Clp = -11.5;
Clda =0.65;

%% Controler Gains

%Outer Loop Roll Angle Gains
Kc2 = 7.67;
tau2 = 24.12;

%% Simulation
Va = 7; %m/s
out1 = sim('Simulink_Models/Gain_Scheduled_PI_Zero_Ref_Test.slx',50);
Va = 10; %m/s
out2 = sim('Simulink_Models/Gain_Scheduled_PI_Zero_Ref_Test.slx',50);
Va = 15; %m/s
out3 = sim('Simulink_Models/Gain_Scheduled_PI_Zero_Ref_Test.slx',50);


%% Data Organization
TimeData1 = [out1.phi.Time(2:99)];
TimeData2 = [out2.phi.Time(2:99)] + 50;
TimeData3 = [out3.phi.Time(2:99)] + 100;
FullTime = [TimeData1; TimeData2; TimeData3];
FullPhiData = [out1.phi.Data(2:99); out2.phi.Data(2:99); out3.phi.Data(2:99)];
FullCIData = [out1.ctrl_signal.Data(2:99); out2.ctrl_signal.Data(2:99); out3.ctrl_signal.Data(2:99)];


%% Plotting
figure()
plot(FullTime, FullPhiData, 'b-')
ylim([-20 50])
xlabel('Time (s)')
ylabel('Roll Angle (deg)')
title('Gain Scheduled PI Zero Ref Response Test - Phi vs. Time')

figure()
plot(FullTime, FullCIData, 'r-')
ylim([-100 100])
xlabel('Time (s)')
ylabel('Control Signal')
title('Gain Scheduled PI Zero Ref Response Test - Control Signal vs. Time')