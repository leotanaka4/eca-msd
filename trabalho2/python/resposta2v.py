import os
from scipy.io import loadmat

import numpy as np
import control as ctrl
import matplotlib.pyplot as plt

data = loadmat(os.path.dirname(os.path.abspath(__file__))+"\\data\\trabalho2dados.mat")

# Resposta a onda quadrada +/- 2Volts
t2v = np.array(data["t2v"]) # t2v:  tempo (s)
u2v = np.array(data["u2v"]) # u2v:  entrada Va (v)
y2v = np.array(data["y2v"]) # y2v:  saida  wm  (rad/s)

# Definindo as constantes do sistema
Ra = 10.6
La = 0.82 * 10**(-3)
Jeq = 22.07136 * 10**(-6)
Km = 0.0502
Ke = 0.0502

# Definindo as matrizes A, B, C e D do sistema
A = np.array([[0, 1], [-Ke*Km/Jeq/La, -Ra/La]])
B = np.array([[0], [1]])
C = np.array([[Km/Jeq/La, 0]])
D = np.array([[0]])

# Criando um objeto StateSpace para representar seu sistema.
sys = ctrl.StateSpace(A, B, C, D)

# Criar o vetor de tempo
t = np.linspace(0, len(t2v)/100, len(t2v))

# Criar a onda quadrada
u = 2 * np.sign(np.sin(2 * np.pi * (1/2) * (t-0.5)))

# Gere a resposta ao sinal de entrada.
t, y = ctrl.forced_response(sys, T=t, U=u)

plt.plot(t2v, y2v)
plt.plot(t, y)
plt.xlabel('tempo (s)')
plt.ylabel('velocidade angular (rad/s)')
plt.title('Resposta a onda quadrada  +/- 2Volts')
plt.grid(True)
plt.show()