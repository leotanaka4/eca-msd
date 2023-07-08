function [dx]=lotkavolterra_f(t,x,u)

x1=x(1);  % Pressa
x2=x(2);  % Predador

alfa=1;
beta=1;
gama=1;
delta=1;

dx1 =  alfa*x1 - beta*x1*x2 + u;
dx2 = -gama*x2 + delta*x1*x2;

dx=[dx1; dx2];
