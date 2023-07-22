% Carregar os dados do arquivo
data = load('trabalho4-2023-1.mat');
u = data.u;
t = data.t;
% Frequência de amostragem (fs) e período de amostragem (T)
fs = 2; % Hz 
T = 1 / fs;
% Calcula o espectro do sinal de entrada u(t) usando a FFT
U = fft(u); 
% Vetor de frequências para o eixo x
frequencies = (0:length(U) - 1) * (fs / length(U));
% Módulo do espectro do sinal de entrada
modulo_U = abs(U);
% Fase do espectro do sinal de entrada
fase_U = angle(U);
% Cores para os plots
cor_modulo = 'b'; % Azul
cor_fase = 'r';   % Vermelho
figure; % Plot do espectro do sinal de entrada (módulo e fase)
subplot(2, 1, 1); % Plot do módulo do espectro
stem(frequencies, modulo_U, 'Color', cor_modulo);
xlabel('Frequência (Hz)');
ylabel('Módulo');
title('Módulo do espectro do Sinal de Entrada u(t)');
grid on;
subplot(2, 1, 2); % Plot da fase do espectro
stem(frequencies, fase_U, 'Color', cor_fase);
xlabel('Frequência (Hz)');
ylabel('Fase (rad)');
title('Fase do Espectro do Sinal de Entrada u(t)');
grid on;