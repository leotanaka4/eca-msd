import numpy as np
import control as ctrl
import matplotlib.pyplot as plt

# 1. Definir a função de transferência do sistema
num = [100, 0, 1600]  # numerador da função de transferência
den = [16, 3.2, 1600]  # denominador da função de transferência
sys = ctrl.TransferFunction(num, den)  # criar o objeto que representa o sistema

# 2. Definir os valores de tempo para simulação
t = np.linspace(0, 4*np.pi, 10000)  # valores de tempo de 0 a 2*pi segundos

# 3. Definir o sinal de entrada como o cosseno multiplicado pelo degrau unitário
u = np.heaviside(t, 1) * np.cos(4*t)

# 4. Realizar a simulação da resposta do sistema usando a função `control.forced_response()`
t_out, yout= ctrl.forced_response(sys, T=t, U=u)

# 5. Plotar o gráfico da resposta
plt.plot(t_out, yout)
plt.xlabel('t')
plt.ylabel('y(t)')
plt.title('Resposta ao cosseno multiplicado pelo degrau unitário')
plt.show()
