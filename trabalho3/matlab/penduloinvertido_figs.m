theta = x(:,1);       
psi = x(:,2);
phi = x(:,3);
dottheta = x(:,4);
dotpsi = x(:,5);
dotphi = x(:,6);

figure(1)
subplot(3,2,1)
plot(tout,theta,'LineWidth',1.5)
grid on
legend('Theta')
xlabel('t')
subplot(3,2,2)
plot(tout,psi,'LineWidth',1.5)
grid on
legend('psi')
xlabel('t')
subplot(3,2,3)
plot(tout,phi,'LineWidth',1.5)
grid on
legend('psi')
xlabel('t')
subplot(3,2,4)
plot(tout,dottheta,'LineWidth',1.5)
grid on
legend('dottheta')
xlabel('t')
subplot(3,2,5)
plot(tout,dotpsi,'LineWidth',1.5)
grid on
legend('dotpsi')
xlabel('t')
subplot(3,2,6)
plot(tout,dotphi,'LineWidth',1.5)
grid on
legend('dotphi')
xlabel('t')

figure(2)
tout2=ScopeData.time;
theta  = ScopeData.signals(1).values(:,1);
psi = ScopeData.signals(1).values(:,2);
phi = ScopeData.signals(1).values(:,3);
dottheta = ScopeData.signals(1).values(:,4);
dotpsi = ScopeData.signals(1).values(:,5);
dotphi = ScopeData.signals(1).values(:,6);

u = ScopeData.signals(2).values;

subplot(3,2,1)
plot(tout2,theta,'LineWidth',1.5)
grid on
legend('theta')
xlabel('t')
subplot(3,2,2)
plot(tout2,psi,'LineWidth',1.5)
grid on
legend('psi')
xlabel('t')
subplot(3,2,3)
plot(tout2,phi,'LineWidth',1.5)
grid on
legend('phi')
xlabel('t')
subplot(3,2,4)
plot(tout2,dottheta,'LineWidth',1.5)
grid on
legend('dottheta')
xlabel('t')
subplot(3,2,5)
plot(tout2,dotpsi,'LineWidth',1.5)
grid on
legend('dotpsi')
xlabel('t')
subplot(3,2,6)
plot(tout2,dotphi,'LineWidth',1.5)
grid on
legend('dotphi')
xlabel('t')

