% Carregar o arquivo 'trabalho4-2023-1.mat'
load('trabalho4-2023-1.mat');

% Frequência de amostragem
fs = 2; % Hz

% Realizar a FFT do sinal de entrada 'u'
U = fft(u);
U_mag = abs(U);
U_phase = angle(U);

% Realizar a FFT do sinal de saída 'y'
Y = fft(y);
Y_mag = abs(Y);
Y_phase = angle(Y);

% Estimar a resposta em frequência do sistema G(jw)
G_estimated = Y ./ U;
G_mag_dB = 20*log10(abs(G_estimated));
G_phase_deg = rad2deg(angle(G_estimated));

% Frequências correspondentes
N = length(u);
frequencies = (0:N-1) * (fs/N);

% Plotar o módulo e fase da resposta em frequência estimada na mesma figura em escala logarítmica
figure;
subplot(2, 1, 1);
semilogx(frequencies, G_mag_dB, 'b', 'LineWidth', 2);
title('Resposta em Frequência Estimada - Magnitude');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
grid on;

subplot(2, 1, 2);
semilogx(frequencies, G_phase_deg, 'r', 'LineWidth', 2);
title('Resposta em Frequência Estimada - Fase');
xlabel('Frequência (Hz)');
ylabel('Fase (graus)');
grid on;