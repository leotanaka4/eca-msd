import numpy as np
import matplotlib.pyplot as plt
import control as ctrl

# 1. Definir a funcao de transferencia do sistema
num = [100, 0, 1600]  # numerador da funcao de transferencia
den = [16, 3.2, 1600]  # denominador da funcao de transferencia
sys = ctrl.TransferFunction(num, den)  # criar o objeto que representa o sistema

# 2. Calcular a resposta ao impulso
t, h = ctrl.impulse_response(sys)

# 3. Plotar do gráfico da resposta ao impulso
plt.plot(t, h)
plt.xlabel('t')
plt.ylabel('y(t)')
plt.grid()
plt.show()
