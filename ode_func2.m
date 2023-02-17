function [dx_dt] = ode_func2(t,x,g,r_ac,m,I_c,mu,k)
    x1 = x(1);
    x2 = x(2);
    dx1_dt = x2;
    dx2_dt = (-mu*x2)/(m+(I_c/r_ac^2)) + (m*g*sin(x1/r_ac + k)/(m+(I_c/r_ac^2)));
    dx_dt = [dx1_dt;dx2_dt];
end


