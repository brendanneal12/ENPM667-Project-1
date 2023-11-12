%% Brendan Neal and Adam Lobo
%% ENPM667 Project 1
%% Outer Loop Relay Feedback Test

%% Desired Value
phi_des = 20; %deg

%% Uav Specifications
rho = 1.204; %kg/m^3
S = 0.44; %m^2
b = 0.490; %m

%L Moment Derivative Coefficients
Clo = 1.108;
Clp = -11.5;
Clda =0.65;

%% Controler Gains
%P Controller Gain from Paper
KT2 = 3;

%% Simulation

%Va = 7 m/s
Va = 7;
out = sim('Simulink_Models/OLRF.slx',10);
figure()
plot(out.phi.Time, out.phi.Data, 'b-')
hold on
plot(out.relay_data.Time, out.relay_data.Data, 'r--')
ylim([-50 50])
xlabel('Time (s)')
ylabel('Roll Angle (deg)')
title('Outer Loop Relay Feedback Test (Va = 7)')
legend('System Response', 'Desired Roll Angle')

%Va = 10 m/s
Va = 10;
out2 = sim('Simulink_Models/OLRF.slx',10);
figure()
plot(out2.phi.Time, out2.phi.Data, 'b-')
hold on
plot(out2.relay_data.Time, out2.relay_data.Data, 'r--')
ylim([-50 50])
xlabel('Time (s)')
ylabel('Roll Angle (deg)')
title('Outer Loop Relay Feedback Test (Va = 10)')
legend('System Response', 'Desired Roll Angle')

%Va = 15 m/s
Va = 15;
out3 = sim('Simulink_Models/OLRF.slx',10);
figure()
plot(out3.phi.Time, out3.phi.Data, 'b-')
hold on
plot(out3.relay_data.Time, out3.relay_data.Data, 'r--')
ylim([-50 50])
xlabel('Time (s)')
ylabel('Roll Angle (deg)')
title('Outer Loop Relay Feedback Test (Va = 15)')
legend('System Response', 'Desired Roll Angle')