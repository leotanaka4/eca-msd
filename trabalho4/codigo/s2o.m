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

% Estimar a resposta em frequência do sistema G(jw)
G_estimated = Y ./ U;

% Frequências correspondentes
N = length(u);
frequencies = (0:N-1) * (fs/N);

% Definir uma função de transferência de segunda ordem
sys_model = @(p, w) p(1) ./ (1i*w).^2 + p(2) ./ (1i*w) + p(3);

% Definir os parâmetros iniciais para o ajuste
p0 = [1, 1, 1];

% Realizar o ajuste dos parâmetros utilizando a função lsqcurvefit
frequencies_rad = 2 * pi * frequencies; % Converter para radianos por segundo
p_fit = lsqcurvefit(sys_model, p0, frequencies_rad, G_estimated);

% Extrair os parâmetros do ajuste
K_fit = p_fit(1);
zeta_fit = p_fit(2);
omega_n_fit = p_fit(3);

% Imprimir os parâmetros do sistema ajustado
disp('Parâmetros do sistema ajustado:');
disp(['K: ', num2str(K_fit)]);
disp(['Zeta: ', num2str(zeta_fit)]);
disp(['Omega_n: ', num2str(omega_n_fit)]);