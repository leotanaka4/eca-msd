% Carregamento dos dados (substitua 'trabalho4-2023-1.mat' pelo nome correto do arquivo)
load('trabalho4-2023-1.mat');

% Frequência de amostragem e vetor de frequências em Hz
fs = 2; % Frequência de amostragem em Hz
freq = (0:length(u)-1) * fs / length(u); % Vetor de frequências em Hz

% Cálculo do espectro de entrada e saída
U = fft(u);
Y = fft(y);

% Estimativa da resposta em frequência
H_estimado = Y ./ U;

% Inicialização dos parâmetros para ajuste manual
wn_guess = 0.2;
zeta_guess = 0.25;

% Calcula a resposta em frequência para os valores iniciais dos parâmetros
sistema = tf(wn_guess^2, [1, 2 * zeta_guess * wn_guess, wn_guess^2]);
H_modelo = freqresp(sistema, freq); 

% Plota a resposta em frequência estimada e do modelo inicial (magnitude)
figure;
subplot(2, 1, 1);
semilogx(freq, 20 * log10(abs(H_estimado)), 'b', 'LineWidth', 2);
hold on;
semilogx(freq, 20 * log10(abs(squeeze(H_modelo))), 'r', 'LineWidth', 2);
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
legend('Estimado', 'Modelo');
grid on;

% Plota a resposta em frequência do modelo inicial (fase em graus)
subplot(2, 1, 2);
semilogx(freq, rad2deg(angle(H_estimado)), 'b', 'LineWidth', 2);
hold on;
semilogx(freq, rad2deg(angle(squeeze(H_modelo))), 'r', 'LineWidth', 2);
xlabel('Frequência (Hz)');
ylabel('Fase (graus)');
legend('Estimado', 'Modelo');
grid on;