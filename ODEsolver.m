


%initial conditions
theta_0 = [0;pi];

r_ac = 0.1017;
g = 9.81;
m = 0.2159;
I_c = 9.47e-4;
mu= 1;

%Time point
t_span = [0,5];

%solve ODE;
[t,theta_results] = ode45(@(t, theta) ode_func(t, theta,g,r_ac,m,I_c,mu),t_span,theta_0);

figure(1)
tiledlayout(2,1)

nexttile
plot(t,theta_results(:,1),"b", 'LineWidth',2)
ylabel('Angular Velocity $\dot{\theta}$',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t,theta_results(:,2),"r","LineWidth",2)
ylabel('Displacement of the centroid in the y axis (m)',Interpreter='latex')
xlabel('Time (s)')
grid on

