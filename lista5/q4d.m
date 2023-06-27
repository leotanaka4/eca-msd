clear all
pkg load control
pkg load signal
s = tf('s')

k_e = 0.9;
k_m = 0.9;
R = 10^5;
j_m = 10^(-2);
j = 4*10^(-1);
R_a = 1.5;
L = 4*10^(-3);
b_m = 0.3;
b = b_m;
n = 40;
R_i = 1*10^5;
C = 1*10^(-6);

#G = Km*(1/R + 1/R1 + C*s)/(2*(1/R1+C*s)*(((Jm*s^2+bm*s)*n + 1/n*(J*s^2+b*s))*(Ra+La*s) + Kb*Km*n))

F = k_m/(((j_m*(s^2)+b_m*s)*n + 1/n*(j*(s^2)+b*s))*(R_a+L*s) + k_e*k_m*n)
G = (1/R + 1/R_i + C*s)/(2*(1/R_i + C*s))
H = 1/(R*(1/R_i + C*s))

O_vi = G*F/(1+H*F)

t = 0:0.001:10;
[y,t] = step(O_vi,t);
plot(t,y,'linewidth', 2)
