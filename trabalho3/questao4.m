function pendulum_simulation()

    % Initial conditions
    x0 = [0; 0.18; 0; 0; 0; 0]; % [theta; psi; phi; dot{theta}; dot{psi}; dot{phi}]

    % Time span for simulation
    tspan = 0:0.01:10; % From 0 to 10 seconds with a time step of 0.01 seconds

    % Solve the differential equations using ode45 solver
    [t, x] = ode45(@penduloinvertido_f, tspan, x0);

    % Extract the states for plotting
    theta = x(:, 1);
    psi = x(:, 2);
    phi = x(:, 3);
    dot_theta = x(:, 4);
    dot_psi = x(:, 5);
    dot_phi = x(:, 6);

    % Plot the results
    figure;

    subplot(3, 2, 1);
    plot(t, theta, 'b', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('\theta (rad)');
    title('\theta vs. Time');

    subplot(3, 2, 3);
    plot(t, psi, 'r', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('\psi (rad)');
    title('\psi vs. Time');

    subplot(3, 2, 5);
    plot(t, phi, 'g', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('\phi (rad)');
    title('\phi vs. Time');

    subplot(3, 2, 2);
    plot(t, dot_theta, 'b', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('\dot{\theta} (rad/s)');
    title('\dot{\theta} vs. Time');

    subplot(3, 2, 4);
    plot(t, dot_psi, 'r', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('\dot{\psi} (rad/s)');
    title('\dot{\psi} vs. Time');

    subplot(3, 2, 6);
    plot(t, dot_phi, 'g', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('\dot{\phi} (rad/s)');
    title('\dot{\phi} vs. Time');

end

function dx = penduloinvertido_f(t, x)
    % Variaveis de estado
    theta = x(1);
    psi = x(2);
    phi = x(3);

    % Derivadas das variaveis de estado
    theta_dot = x(4);
    psi_dot = x(5);
    phi_dot = x(6);

    % Parametros do sistema
    g = 9.8;  % gravidade
    m = 0.03; % peso da roda
    R = 0.04; % raio da roda
    Jw = m * R^2 / 2; % momento de inercia da roda
    M = 0.6;  % peso do corpo
    W = 0.14; % largura do corpo
    D = 0.04; % profundidade do corpo
    H = 0.144; % altura do corpo
    L = H / 2; % distancia do centro de massa do corpo ao eixo da roda
    Jphi = M * L^2 / 3; % momento de inercia do corpo em pitch
    Jpsi = M * (W^2 + D^2) / 12; % momento de inercia do corpo em rumo
    Rm = 6.69; % resistencia do motor DC
    Kt = 0.4; % constante de torque (Nm/A)
    Ke = 0.4; % e constante de EMF (V s/rad)
    fm = 0.0022; % atrito entre o corpo e o motor
    n = 1; % reducao do motor

    % Matriz de inercia inversa
    M_inv = inv([
        R^2 * (2 * m + M) + 2 * Jw, M * R * L * cos(psi), 0;
        M * R * L * cos(psi), M * L^2 + Jpsi, 0;
        0, 0, m * (W^2 / 2) + M * L * sin(psi)^2 + Jphi + (W^2 / (2 * R^2)) * Jw
    ]);

    % Matriz G
    G = [
        0;
        -M * g * L * sin(psi);
        0
    ];

    % Matriz C
    C = [
        -M * R * L * sin(psi) * psi_dot^2;
        -M * L^2 * sin(psi) * cos(psi) * phi_dot^2;
        M * L^2 * sin(2 * psi) * psi_dot * phi_dot
    ];

    % Matriz Q
    Q = [
        -2 * ((n * Kt * Ke / Rm) + fm), 2 * ((n * Kt * Ke / Rm) + fm), 0;
        2 * ((n * Kt * Ke / Rm) + fm), -2 * ((n * Kt * Ke / Rm) + fm), 0;
        0, 0, -W^2 / (2 * R^2) * ((n * Kt * Ke / Rm) + fm)
    ];

    F = Q*[theta_dot; psi_dot; phi_dot]

    % Vetor de entrada
    V = [0; 0]; % [V_l; V_r]

    % Sistema de equacoes diferenciais
    dx = zeros(6, 1);
    dx(1:3) = [theta_dot; psi_dot; phi_dot];
    dx(4:6) = M_inv * (F - G - C);
end

% Call the simulation function to run the simulation and plot the results
pendulum_simulation();
