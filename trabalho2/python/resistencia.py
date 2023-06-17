import numpy as np
from sklearn.linear_model import LinearRegression
# Dados de voltagem Va(V) em Volts e corrente Ia(A)
voltagem = np.array([1.0, 2.0, 3.0, 4.0, 4.9, 5.9, 6.9, 7.9, 8.9, 9.9])
corrente = np.array([0.076, 0.150, 0.225, 0.305, 0.425, 0.474, 0.550, 0.620, 0.720, 0.800])
# Ajuste da regressão linear
x = corrente.reshape(-1, 1)  # Converte corrente para formato adequado
y = voltagem
regressor = LinearRegression()
regressor.fit(x, y)
# Estimativa da resistência média (coeficiente angular da regressão linear)
resistencia_media = regressor.coef_[0]
# Exibindo os resultados
print("Resistência média:", resistencia_media, "ohms")