data = load('trabalho4-2023-1.mat');

u = data.u;
y = data.y;
t = data.t;

% Estimar os parâmetros omega_n e zeta da função de transferência G(s)
% Você pode utilizar métodos de identificação de sistemas, como o método dos mínimos quadrados ou outros.
omega_n_est = 1.25; % Estimativa inicial para a frequência natural (ajuste conforme necessário)
zeta_est = 0.25;    % Estimativa inicial para o fator de amortecimento (ajuste conforme necessário)

% Calcular o espectro da função de transferência G(jw) com os parâmetros estimados
s = tf('s');
G_s = omega_n_est^2 / (s^2 + 2*zeta_est*omega_n_est*s + omega_n_est^2);

% Calcule o eixo de frequência correspondente à Transformada de Fourier
N = length(u); % Número de pontos na Transformada de Fourier
fs = 1 / (t(2) - t(1)); % Frequência de amostragem (inverso do intervalo de tempo entre amostras)
f = (0:N-1) * fs / N; % Eixo de frequência em Hz

% Converta o eixo de frequência para rad/s
omega_rad = 2 * pi * f;

% Calcule a Transformada de Fourier dos sinais de entrada e saída
U = fft(u);
Y = fft(y);

% Estime a resposta em frequência G(jw) a partir dos dados medidos
G_est = Y ./ U;

% Calcule o módulo e a fase da resposta em frequência em graus e dB, respectivamente
G_mag_dB = 20 * log10(abs(G_est));
G_phase_deg = angle(G_est) * (180 / pi);

% Calcule o módulo e a fase da resposta em frequência da função de transferência G(jw) em graus e dB, respectivamente
[mag_Gs, phase_Gs] = bode(G_s, omega_rad);

% Plotar o espectro de magnitude e fase estimados juntamente com a função de transferência G(s)
figure;
subplot(2, 1, 1);
semilogx(omega_rad, G_mag_dB, 'DisplayName', 'Estimado');
hold on;
semilogx(omega_rad, 20*log10(squeeze(mag_Gs)), 'DisplayName', 'Sistema de segunda ordem','LineWidth',2);
xlabel('Frequência (rad/s)');
ylabel('Magnitude (dB)');
title('Resposta em Frequência - Magnitude');
legend;
grid on;

subplot(2, 1, 2);
semilogx(omega_rad, G_phase_deg, 'DisplayName', 'Estimado');
hold on;
semilogx(omega_rad, squeeze(phase_Gs), 'DisplayName', 'Sistema de segunda ordem','LineWidth',2);
xlabel('Frequência (rad/s)');
ylabel('Fase (graus)');
title('Resposta em Frequência - Fase');
legend;
grid on;