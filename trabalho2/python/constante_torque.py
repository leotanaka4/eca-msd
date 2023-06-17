import numpy as np
from sklearn.linear_model import LinearRegression
# Ra resistência de armadura
Ra = 10.6
Jeq = Jeq = 22.07136 * 10**(-6)
# Dados de voltagem Va(V) em Volts, velocidade angular wm(rad/s) e corrente Ia(mA)
Va = np.array([1.0, 2.0, 3.0, 4.0, 4.9, 5.9, 6.9, 7.9, 8.9, 9.9])
wm = np.array([12, 29, 49, 70, 89, 105, 127, 148, 168, 185])
Ia = np.array([1, 1, 1, 1, 1, 1, 2, 2, 2, 3])
# Ajuste da regressão linear
x = wm.reshape(-1, 1)  # Converte corrente para formato adequado
y = Va - Ra * Ia * 10**(-3)
regressor = LinearRegression()
regressor.fit(x, y)
# Estimativa da resistência média (coeficiente angular da regressão linear)
constante_torque = regressor.coef_[0]
# Exibindo os resultados
print("Constante de torque do motor:", constante_torque, "Nm/A")