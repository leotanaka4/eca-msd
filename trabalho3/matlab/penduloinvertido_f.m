function [dx]=penduloinvertido_f(t,x,u)

x1=x(1);  % theta
x2=x(2);  % psi
x3=x(3);  % phi
x4=x(4);  % dot{theta}
x5=x(5);  % dot{psi}
x6=x(6);  % dot{phi}

g=9.8;  % gravidade
m=0.03; % peso da roda
R=0.04; % raio da roda
Jw=m*R^2/2; % momento de inércia da roda
M=0.6;  % peso do corpo
W=0.14; % largura do corpo
D=0.04; % profundidade do corpo
H=0.144; % altura do corpo
L=H/2; % distância do centro de massa do corpo ao eixo da roda
Jphi=M*L^2/3; % momento de inércia do corpo em pitch
Jpsi=M*(W^2+D^2)/12; % momento de inércia do corpo em rumo
Rm=6.69; % resistência do motor DC
Kt=0.4; % constante de torque (Nm/A)
Ke=0.4; % e constante de EMF (V s/rad)
fm=0.0022; % atrito entre o corpo e o motor
n=1; % redução do motor

beta=n*Kt*Ke/Rm+fm;

dx1=x4;
dx2=x5;
dx3=x6;
dx4=(M*L^2+Jpsi)/(((2*m+M)*R^2+2*Jw)*(M*L^2+Jpsi)-M^2*R^2*L^2*cos(x2)^2)*(-2*beta*x4+2*beta*x5+M*R*L*sin(x2)*x5.^2)-(M*R*L*cos(x2))/(((2*m+M)*R^2+2*Jw)*(M*L^2+Jpsi)-M^2*R^2*L^2*cos(x2)^2)*(2*beta*x4-2*beta*x5+M*L^2*sin(x2)*cos(x2)*x5^2+M*g*L*sin(x2));
dx5=-(M*R*L*cos(x2))/(((2*m+M)*R^2+2*Jw)*(M*L^2+Jpsi)-M^2*R^2*L^2*cos(x2)^2)*(-2*beta*x4+2*beta*x5+M*R*L*sin(x2)*x5.^2)+((2*m+M)*R^2+2*Jw)/(((2*m+M)*R^2+2*Jw)*(M*L^2+Jpsi)-M^2*R^2*L^2*cos(x2)^2)*(2*beta*x4-2*beta*x5+M*L^2*sin(x2)*cos(x2)*x5^2+M*g*L*sin(x2));
dx6=1/(m*W^2/2+M*L*sin(x2)^2+Jphi+W^2/(2*R^2)*Jw)*(-W^2/((2*R^2)*beta*x6-2*M*L^2*sin(x2)*cos(x2)*x5*x6));

dx=[dx1; dx2; dx3; dx4; dx5; dx6];
