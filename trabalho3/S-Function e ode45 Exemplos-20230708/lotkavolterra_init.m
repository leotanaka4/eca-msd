% Init
clear all

x0 = [4;4];
 

%%  Simulacao via ODE45

[tout,x]=ode45(@lotkavolterra_f, [0 10], x0,[], 0);