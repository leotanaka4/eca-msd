# 1. Importar as bibliotecas necessárias
import numpy as np
import matplotlib.pyplot as plt
import control as ctl

# 2. Definir a função de transferência do sistema
sys = []
labels = []  # Lista para armazenar os rótulos das linhas
for z in [5, 10, 15]:
    num = [20/z, 20] # numerador da função de transferência
    den = [1, 3, 20] # denominador da função de transferência
    sys.append(ctl.TransferFunction(num, den)) # criar o objeto que representa o sistema
    labels.append(f'z = {z}')  # Adiciona o rótulo do sistema atual à lista de rótulos

# 3. Definir os valores de tempo para simulação
t = np.linspace(0, 4, 10000) # valores de tempo de 0 a 40 segundos

# 4. Obter a resposta ao degrau unitário usando a função `step()`
t0, y0 = ctl.step_response(sys[0], t) # obter a resposta ao degrau unitário
t1, y1 = ctl.step_response(sys[1], t) # obter a resposta ao degrau unitário
t2, y2 = ctl.step_response(sys[2], t) # obter a resposta ao degrau unitário

# 5. Plotar o gráfico usando a biblioteca `matplotlib`
plt.plot(t, y0, label=labels[0]) # plotar o gráfico da resposta ao degrau unitário
plt.plot(t, y1, label=labels[1]) # plotar o gráfico da resposta ao degrau unitário
plt.plot(t, y2, label=labels[2]) # plotar o gráfico da resposta ao degrau unitário

plt.xlabel('t') # definir o rótulo do eixo x
plt.ylabel('x(t)') # definir o rótulo do eixo y
plt.title(f'Resposta ao sistema') # definir o título do gráfico
plt.grid() # adicionar a grade ao gráfico
plt.legend()  # Adiciona a legenda às linhas
plt.show() # mostrar o gráfico na tela