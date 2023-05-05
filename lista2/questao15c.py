# 1. Importar as bibliotecas necessárias
import numpy as np
import matplotlib.pyplot as plt
import control as ctl

# 2. Definir a função de transferência do sistema
num = [0.0625] # numerador da função de transferência
den = [1, 1.3066, 0.8536, 0.3266, 0.0625] # denominador da função de transferência
sys = ctl.TransferFunction(num, den) # criar o objeto que representa o sistema

# 3. Definir os valores de tempo para simulação
t = np.linspace(0, 40, 10000) # valores de tempo de 0 a 10 segundos

# 4. Obter a resposta ao degrau unitário usando a função `step()`
t, y = ctl.step_response(sys, t) # obter a resposta ao degrau unitário

# 5. Plotar o gráfico usando a biblioteca `matplotlib`
plt.plot(t, y) # plotar o gráfico da resposta ao degrau unitário
plt.xlabel('Tempo (s)') # definir o rótulo do eixo x
plt.ylabel('Saída do sistema') # definir o rótulo do eixo y
plt.title('Resposta ao degrau unitário') # definir o título do gráfico
plt.grid() # adicionar a grade ao gráfico
plt.show() # mostrar o gráfico na tela