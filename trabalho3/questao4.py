import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

def pendulum_simulation():
    # Initial conditions
    x0 = [0, 0, 0, 0, 0, 0]  # [theta; psi; phi; dot{theta}; dot{psi}; dot{phi}]

    # Time span for simulation
    tspan = np.arange(0, 10.01, 0.01)  # From 0 to 10 seconds with a time step of 0.01 seconds

    # Solve the differential equations using solve_ivp
    sol = solve_ivp(penduloinvertido_f, [tspan[0], tspan[-1]], x0, t_eval=tspan)

    # Extract the states for plotting
    t = sol.t
    theta, psi, phi, dot_theta, dot_psi, dot_phi = sol.y

    # Plot the results
    fig, axs = plt.subplots(3, 2, figsize=(12, 10))

    axs[0, 0].plot(t, theta, 'b', linewidth=1.5)
    axs[0, 0].set_xlabel('Time (s)')
    axs[0, 0].set_ylabel(r'$\theta$ (rad)')
    axs[0, 0].set_title(r'$\theta$ vs. Time')

    axs[1, 0].plot(t, psi, 'r', linewidth=1.5)
    axs[1, 0].set_xlabel('Time (s)')
    axs[1, 0].set_ylabel(r'$\psi$ (rad)')
    axs[1, 0].set_title(r'$\psi$ vs. Time')

    axs[2, 0].plot(t, phi, 'g', linewidth=1.5)
    axs[2, 0].set_xlabel('Time (s)')
    axs[2, 0].set_ylabel(r'$\phi$ (rad)')
    axs[2, 0].set_title(r'$\phi$ vs. Time')

    axs[0, 1].plot(t, dot_theta, 'b', linewidth=1.5)
    axs[0, 1].set_xlabel('Time (s)')
    axs[0, 1].set_ylabel(r'$\dot{\theta}$ (rad/s)')
    axs[0, 1].set_title(r'$\dot{\theta}$ vs. Time')

    axs[1, 1].plot(t, dot_psi, 'r', linewidth=1.5)
    axs[1, 1].set_xlabel('Time (s)')
    axs[1, 1].set_ylabel(r'$\dot{\psi}$ (rad/s)')
    axs[1, 1].set_title(r'$\dot{\psi}$ vs. Time')

    axs[2, 1].plot(t, dot_phi, 'g', linewidth=1.5)
    axs[2, 1].set_xlabel('Time (s)')
    axs[2, 1].set_ylabel(r'$\dot{\phi}$ (rad/s)')
    axs[2, 1].set_title(r'$\dot{\phi}$ vs. Time')

    plt.tight_layout()
    plt.show()

def penduloinvertido_f(t, x):
    # Unpack the state variables
    theta, psi, phi, theta_dot, psi_dot, phi_dot = x

    # Parameters of the system
    g = 9.8
    m = 0.03
    R = 0.04
    Jw = m * R ** 2 / 2
    M = 0.6
    W = 0.14
    D = 0.04
    H = 0.144
    L = H / 2
    Jphi = M * L ** 2 / 3
    Jpsi = M * (W ** 2 + D ** 2) / 12
    Rm = 6.69
    Kt = 0.4
    Ke = 0.4
    fm = 0.0022
    n = 1

    # Matrices
    M_inv = np.linalg.inv(np.array([
        [R ** 2 * (2 * m + M) + 2 * Jw, M * R * L * np.cos(psi), 0],
        [M * R * L * np.cos(psi), M * L ** 2 + Jpsi, 0],
        [0, 0, m * (W ** 2 / 2) + Jphi + (W ** 2 / (2 * R ** 2)) * Jw]
    ]))

    G = np.array([0, -M * g * L * np.sin(psi), 0])

    C = np.array([
        -M * R * L * np.sin(psi) * psi_dot ** 2,
        -M * L ** 2 * np.sin(psi) * np.cos(psi) * phi_dot ** 2,
        M * L ** 2 * np.sin(2 * psi) * psi_dot * phi_dot
    ])

    Q = np.array([
        [-2 * ((n * Kt * Ke / Rm) + fm), 2 * ((n * Kt * Ke / Rm) + fm), 0],
        [2 * ((n * Kt * Ke / Rm) + fm), -2 * ((n * Kt * Ke / Rm) + fm), 0],
        [0, 0, -W ** 2 / (2 * R ** 2) * ((n * Kt * Ke / Rm) + fm)]
    ])

    F = Q @ np.array([theta_dot, psi_dot, phi_dot])

    # Input vector
    V = np.array([0, 0])  # [V_l, V_r]

    # System of differential equations
    dxdt = np.zeros_like(x)
    dxdt[0:3] = [theta_dot, psi_dot, phi_dot]
    dxdt[3:6] = M_inv @ (F - G - C)
    return dxdt

# Call the simulation function to run the simulation and plot the results
pendulum_simulation()