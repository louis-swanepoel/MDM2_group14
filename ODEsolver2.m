
%initial conditions
x_0 = [pi;0.1];
k = 1;
r_ac = 0.054188;%reason is the same for I_c
g = 9.81;
m = 0.2159;
I_c = 6.577e-3;
%I_c = 9.47e-4; %still need to get accurate values for R1,R2,R3 before this is accurate
mu= 0.8;

%Time point
t_span = [0 5];

%solve ODE;
[t,theta_results] = ode45(@(t, x) ode_func2(t, x,g,r_ac,m,I_c,mu,k),t_span,x_0);


figure(1)
tiledlayout(2,1)

nexttile
plot(t,theta_results(:,1),"b", 'LineWidth',2) %plots the Angular Displacement as a function of time
ylabel('Angular Displacement ${\theta}$',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t,theta_results(:,2),"r","LineWidth",2)%Plots the displacement as a function of time
ylabel('Angular Velocity ',Interpreter='latex')
xlabel('Time (s)')
grid on

