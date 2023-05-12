import numpy as np
import control as ctrl
import matplotlib.pyplot as plt

# 1. Definir a funcao de transferencia do sistema
num = [100, 0, 1600]  # numerador da funcao de transferencia
den = [16, 3.2, 1600]  # denominador da funcao de transferencia
sys = ctrl.TransferFunction(num, den)  # criar o objeto que representa o sistema

# 2. Definir os valores de tempo para simulacao
t = np.linspace(0, 4*np.pi, 10000)  # valores de tempo de 0 a 4*pi segundos

# 3. Definir o sinal de entrada como o cosseno multiplicado pelo degrau unitario
u = np.heaviside(t, 1) * np.cos(100*t)

# 4. Realizar a simulacao da resposta do sistema usando a funcao `control.forced_response()`
t_out, yout = ctrl.forced_response(sys, T=t, U=u)

# 5. Resposta analitica
y_a = 100/16*(-0.0085*np.exp(-0.1*t)*np.cos(9.999*t)+0.0010*np.exp(-0.1*t)*np.sin(9.999*t) + 1.0085*np.cos(100*t) - 0.0002*np.sin(100*t))

# 6. Plotar o grafico da resposta
plt.plot(t_out, yout)
plt.plot(t, y_a)
plt.xlabel('t')
plt.ylabel('y(t)')
plt.grid()
plt.show()