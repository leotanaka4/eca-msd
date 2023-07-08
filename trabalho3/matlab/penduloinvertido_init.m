% Init
clear all

x0 = [0;0;0;0;0;0];
 

%%  Simulacao via ODE45

[tout,x]=ode45(@penduloinvertido_f, [0 10], x0,[], 0);