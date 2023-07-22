% Carregar o arquivo 'trabalho4-2023-1.mat'
load('trabalho4-2023-1.mat');

% Calcule o eixo de frequência correspondente à Transformada de Fourier
N = length(u); % Número de pontos na Transformada de Fourier
fs = 1 / (t(2) - t(1)); % Frequência de amostragem (inverso do intervalo de tempo entre amostras)
f = (0:N-1) * fs / N; % Eixo de frequência

% Realizar a FFT do sinal de entrada 'u'
U = fft(u);
U_mag = abs(U);
U_phase = angle(U);

% Realizar a FFT do sinal de saída 'y'
Y = fft(y);

% Estimar a resposta em frequência do sistema G(jw)
G_estimated = Y ./ U;
G_mag_dB = 20*log10(abs(G_estimated));
G_phase_deg = rad2deg(angle(G_estimated));

% Plotar o módulo e fase da resposta em frequência estimada na mesma figura em escala logarítmica
figure;
subplot(2, 1, 1);
semilogx(f, G_mag_dB, 'b', 'LineWidth', 2);
title('Resposta em Frequência Estimada - Magnitude');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
grid on;

subplot(2, 1, 2);
semilogx(f, G_phase_deg, 'r', 'LineWidth', 2);
title('Resposta em Frequência Estimada - Fase');
xlabel('Frequência (Hz)');
ylabel('Fase (graus)');
grid on;