import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Parameters
L = 0.5  # Length of the pendulum (m)
m = 1  # Mass of the pendulum (kg)
g = 9.8  # Acceleration due to gravity (m/s^2)
theta0 = np.deg2rad(30)  # Initial angle of the pendulum (30 degrees)

# Nonlinear equation of motion
def nonlinear_eq(t, y):
    return [y[1], -(g / L) * np.sin(y[0])]

# Linearized equation of motion
def linear_eq(t, y):
    return [y[1], -(g / L) * y[0]]

# Time span
tspan = [0, 10]  # Time span for simulation (from t=0 to t=10 seconds)

# Solve the nonlinear equation of motion
sol_nonlinear = solve_ivp(nonlinear_eq, tspan, [theta0, 0], t_eval=np.linspace(tspan[0], tspan[1], 1000))

# Solve the linearized equation of motion
sol_linear = solve_ivp(linear_eq, tspan, [theta0, 0], t_eval=np.linspace(tspan[0], tspan[1], 1000))

# Plotting
plt.plot(sol_nonlinear.t, np.rad2deg(sol_nonlinear.y[0]), 'b-', linewidth=1.5, label='Nonlinear')
plt.plot(sol_linear.t, np.rad2deg(sol_linear.y[0]), 'r--', linewidth=1.5, label='Linear')
plt.xlabel('Time (s)')
plt.ylabel('Angle (degrees)')
plt.title('Nonlinear and Linear Response of Simple Pendulum')
plt.legend()
plt.grid(True)
plt.show()