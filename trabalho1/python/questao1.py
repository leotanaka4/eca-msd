import numpy as np
import control as ctrl
import matplotlib.pyplot as plt

# 1. Definir a função de transferência do sistema
num = [100, 0, 1600]  # numerador da função de transferência
den = [16, 3.2, 1600]  # denominador da função de transferência
sys = ctrl.TransferFunction(num, den)  # criar o objeto que representa o sistema

# 2. Definir os valores de tempo para simulação
t = np.linspace(0, 10, 1000)  # valores de tempo de 0 a 10 segundos

# 3. Definir o sinal de entrada como o cosseno multiplicado pelo degrau unitário
u = np.heaviside(t, 1) * np.cos(t)

# 4. Realizar a simulação da resposta do sistema usando a função `control.forced_response()`
t, y = ctrl.forced_response(sys, T=t, U=u)

# 5. Plotar o gráfico usando a função `matplotlib.pyplot.plot()`
plt.plot(t, y)  # plotar o gráfico da resposta ao cosseno multiplicado pelo degrau unitário

# 6. Adicionar rótulos aos eixos e título ao gráfico
plt.xlabel('Tempo (s)')  # definir o rótulo do eixo x
plt.ylabel('Saída do sistema')  # definir o rótulo do eixo y
plt.title('Resposta ao cosseno multiplicado pelo degrau unitário')  # definir o título do gráfico

# 7. Adicionar uma grade ao gráfico
plt.grid()  # adicionar a grade ao gráfico

# 8. Exibir o gráfico
plt.show()