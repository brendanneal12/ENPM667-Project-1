%% Brendan Neal and Adam Lobo
%% ENPM667 Project 1
%% Cascaded PI Step Response

%% Desired Value
phi_des = 30; %deg

%% UAV Specifications
rho = 1.204; %kg/m^3
S = 0.44; %m^2
b = 0.490; %m

%L Moment Derivative Coefficients
Clo = 1.108;
Clp = -1.5;
Clda =0.65;

%% Controler Gains

%Inner Loop Roll Rate Gains
Kc1 = 0.23;
tau1 = 0.146;

%Outer Loop Roll Angle Gains
Kc2 = 7.67;
tau2 = 24.12;

%% Simulation

Va = 7; %m/s
out1 = sim('Simulink_Models/Cascaded_PI_Step_Test.slx',50);
Va = 10; %m/s
out2 = sim('Simulink_Models/Cascaded_PI_Step_Test.slx',50);
Va = 15; %m/s
out3 = sim('Simulink_Models/Cascaded_PI_Step_Test.slx',50);

%% Data Organization

TimeData1 = [out1.phi.Time(2:129)];
TimeData2 = [out2.phi.Time(2:129)] + 50;
TimeData3 = [out3.phi.Time(2:129)] + 100;
FullTime = [TimeData1; TimeData2; TimeData3];
FullPhiData = [out1.phi.Data(2:129); out2.phi.Data(2:129); out3.phi.Data(2:129)];
FullCIData = [out1.ctrl_signal.Data(2:129); out2.ctrl_signal.Data(2:129); out3.ctrl_signal.Data(2:129)];
FullPhiDesData = [out1.des_phi.Data(2:129); out2.des_phi.Data(2:129); out3.des_phi.Data(2:129)];
FullPhiDesData(128+128)=0;

%% Plotting
figure()
plot(FullTime, FullPhiData, 'b-')
hold on
plot(FullTime, FullPhiDesData, 'r--')
ylim([-20 50])
xlabel('Time (s)')
ylabel('Roll Angle (deg)')
title('Cascaded PI Step Response Test - Phi vs. Time')

figure()
plot(FullTime, FullCIData, 'r-')
ylim([-100 100])
xlabel('Time (s)')
ylabel('Control Signal')
title('Cascaded PI Step Response Test - Control Signal vs. Time')