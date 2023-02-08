
function [dtheta_dt] = ode_func(t,theta,g,r_ac,m,I_c,mu)
    theta1 = theta(1);
    theta2 = theta(2);
    dtheta1_dt = theta2;
    dtheta2_dt = -mu*theta2 + ((m*g/r_ac)*sin(theta1))/(m + (I_c/r_ac^2));
    dtheta_dt = [dtheta1_dt; dtheta2_dt];
end
