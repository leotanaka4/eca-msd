prey = x(:,1);       
predator = x(:,2);

figure(1)
subplot(2,1,1)
plot(tout,prey,'LineWidth',1.5)
grid on
legend('Prey')
xlabel('t')
subplot(2,1,2)
plot(tout,predator,'LineWidth',1.5)
grid on
legend('predator')
xlabel('t')


figure(2)
tout2=ScopeData.time;
prey  = ScopeData.signals(1).values(:,1);
predator = ScopeData.signals(1).values(:,2);
u = ScopeData.signals(2).values;

subplot(3,1,1)
plot(tout2,prey,'LineWidth',1.5)
grid on
legend('Prey')
xlabel('t')
subplot(3,1,2)
plot(tout2,predator,'LineWidth',1.5)
grid on
legend('Predator')
xlabel('t')
subplot(3,1,3)
plot(tout2,u,'LineWidth',1.5)
grid on
legend('Input')
xlabel('t')

