
%initial conditions
theta_0 = [0;0.01];

r_ac = 0.1017;%reason is the same for I_c
g = 9.81;
m = 0.2159;
I_c = 9.47e-4; %still need to get accurate values for R1,R2,R3 before this is accurate
mu= 0.7;

%Time point
t_span = linspace(0,5,40);

%solve ODE;
[t,theta_results] = ode45(@(t, theta) ode_func(t, theta,g,r_ac,m,I_c,mu),t_span,theta_0);


angular_vel = diff(theta_results(:,1));
angular_acc = diff(angular_vel);
t1 = linspace(0,5,39);%needed for the new angular_vel vector as its smaller than t
t2 = linspace(0,5,38);%same reason


figure(1)
tiledlayout(4,1)

nexttile
plot(t,theta_results(:,1),"b",t,theta,"m","LineWidth",2) %plots the Angular Displacement as a function of time
ylabel('Angular Displacement ${\theta}$',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t,theta_results(:,2),"r","LineWidth",2)%Plots the displacement as a function of time
ylabel('Displacement ',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t1,angular_vel,"g","LineWidth",2)
ylabel('Angular Velocity ${\dot\theta}$',Interpreter='latex')
xlabel('Time(s)')
grid on

nexttile
plot(t2,angular_acc,"m","LineWidth",2)
ylabel('Angular Acceleration ${\ddot\theta}$',Interpreter='latex')
xlabel('Time(s)')
grid on
