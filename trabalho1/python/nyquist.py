import control as ctrl
import matplotlib.pyplot as plt

# 1. Definir a função de transferência do sistema
num = [100, 0, 1600]  # numerador da função de transferência
den = [16, 3.2, 1600]  # denominador da função de transferência
H = ctrl.TransferFunction(num, den)

# 2. Plotar o diagrama de Nyquist
ctrl.nyquist_plot(H, omega=None, plot=True)
plt.show()
