%% Brendan Neal and Adam Lobo
%% ENPM667 Project 1
%% Gain Scheduled PI Step Response

%% Desired Value
phi_des = 30; %deg

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
out1 = sim('Simulink_Models/Gain_Scheduled_PI_Step_Test.slx',50);
Va = 10; %m/s
out2 = sim('Simulink_Models/Gain_Scheduled_PI_Step_Test.slx',50);
Va = 15; %m/s
out3 = sim('Simulink_Models/Gain_Scheduled_PI_Step_Test.slx',50);

%% Data Organization

TimeData1 = [out1.phi.Time(2:129)];
TimeData2 = [out2.phi.Time(2:129)] + 50;
TimeData3 = [out3.phi.Time(2:129)] + 100;
FullTime = [TimeData1; TimeData2; TimeData3];
FullPhiData = [out1.phi.Data(2:129); out2.phi.Data(2:129); out3.phi.Data(2:129)];
FullCIData = [out1.ctrl_signal.Data(2:129); out2.ctrl_signal.Data(2:129); out3.ctrl_signal.Data(2:129)];
FullPhiDesData = [out1.des_phi.Data(2:129); out2.des_phi.Data(2:129); out3.des_phi.Data(2:129)];

P_Gain1=out1.P_Gain.Data*ones(128,1);
P_Gain2=out2.P_Gain.Data*ones(128,1);
P_Gain3=out3.P_Gain.Data*ones(128,1);
FullPGain = [P_Gain1; P_Gain2; P_Gain3];

I_Gain1=out1.I_Gain.Data*ones(128,1);
I_Gain2=out2.I_Gain.Data*ones(128,1);
I_Gain3=out3.I_Gain.Data*ones(128,1);
FullIGain = [I_Gain1; I_Gain2; I_Gain3];

%% Plotting
figure()
plot(FullTime, FullPhiData, 'b-')
hold on
plot(FullTime, FullPhiDesData, 'r--')
ylim([-20 50])
xlabel('Time (s)')
ylabel('Roll Angle (deg)')
title('Gain Scheduled PI Step Response Test - Phi vs. Time')

figure()
plot(FullTime, FullCIData, 'r-')
ylim([-100 100])
xlabel('Time (s)')
ylabel('Control Signal')
title('Gain Scheduled PI Step Response Test - Control Signal vs. Time')

figure()
subplot(2,1,1)
plot(FullTime, FullPGain, 'b-')
xlabel('Time (s)')
ylabel('Proportional Controller Gain')
title('Proportional Controller Gain vs. Time')
subplot(2,1,2)
plot(FullTime, FullIGain, 'r-')
xlabel('Time (s)')
ylabel('Integral Controller Gain')
title('Integral Controller Gain vs. Time')
