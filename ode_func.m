
function [dtheta_dt] = ode_func(t,theta,g,r_ac,m,I_c,mu)
    theta1 = theta(1);%this is essentially theta
    theta2 = theta(2);%this is essentially theta double dot.
    dtheta1_dt = theta2;%splitting the ODE into a vector form of 2 ODEs.
    dtheta2_dt = (-mu*theta2)/(m+(I_c/(r_ac^2))) + ((m*g/r_ac)*sin(theta1))/(m + (I_c/r_ac^2));
    %-mu*theta2 is the damping component for our system, if we didnt have
    %this the curve repeat periodically with same amplitude.
    dtheta_dt = [dtheta1_dt; dtheta2_dt];%vector of the 2 ODEs
end

