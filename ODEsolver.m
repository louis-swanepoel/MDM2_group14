
%initial conditions
theta_0 = [0;0.01];
r_ac = 0.054188;
g = 9.81;
m = 0.2159;
I_c = 6.577e-3;
mu1= linspace(0.0125,1,172);
mu2 = 1.5;%could be 0.847
mu3 = 0.845;
%mu2 = 0.9;
%Time point
t_span = linspace(0,20,172);
t_experiment = linspace(0,6,172);
k = 1:172;

for i=k
[t,theta_results(:,:,i)] = ode45(@(t, tHeta) ode_func(t,tHeta,g,r_ac,m,I_c,mu1(i)),t_span,theta_0);
end

theta(isnan(theta))= 0;

for j = k
    for i = k
         obj(j,i) = abs(theta_results(i,1,j) - theta(i));
    end
end


new = zeros(size(obj, 1), 1);
for i = 1:size(obj, 1)
  new(i) = sum(obj(i,:)); 
end


[t,theta_results2] = ode45(@(t, tHeta) ode_func(t,tHeta,g,r_ac,m,I_c,mu3),t_experiment,theta_0);

new2 = sum(obj(1:end,:));

figure(1)

%tiledlayout(3,1)
% 
%nexttile
plot(t,theta_results2(:,1),"b", 'LineWidth',2) %plots the Angular Displacement as a function of time
hold on
plot(t_experiment,theta,'m', 'LineWidth',2)
ylabel('Angular Displacement ${\theta}$',Interpreter='latex',FontSize=18)
legend('${\theta_{an}}$', '$\theta_{exp}$',Interpreter='latex',FontSize=18)
xlabel('Time (s)',Interpreter='latex',FontSize=18)
grid on

figure(2)
%nexttile
plot(t,theta_results2(:,2),"b","LineWidth",2)%Plots the Angular Velocity as a function of time
hold on
plot(t_experiment,thetaDot,'m',"Linewidth",2)
ylabel('Angular Velocity ${\dot\theta}$',Interpreter='latex')
legend('Analytical Model', 'Experimental Model')
xlabel('Time (s)',Interpreter='latex')
grid on
figure(3)
% nexttile


plot(mu1, new2,"k","LineWidth",2)
grid on
ylabel('Objective Function ${\phi}$(${\mu}$)',Interpreter='latex',FontSize=18)
xlabel('Friction Coefficient ${\mu}$',Interpreter='latex',FontSize=18)
legend('${\phi}$(${\mu}$)',Interpreter='latex',Fontsize=18)






