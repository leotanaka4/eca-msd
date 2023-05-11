import control as ctrl
import matplotlib.pyplot as plt

# 1. Definir a funcao de transferencia do sistema
num = [100, 0, 1600]  # numerador da funcao de transferencia
den = [16, 3.2, 1600]  # denominador da funcao de transferencia
H = ctrl.TransferFunction(num, den)

# 2. Plotar o diagrama de Bode
ctrl.bode_plot(H)
plt.show()
