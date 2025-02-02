import math

def temperatura(ts, t0, k, t):
    return ts + (t0 - ts) * math.exp(-k * t)

# Datos iniciales
ts = 40  # Temperatura ambiente en ºC
t0 = 5   # Temperatura inicial del cuerpo en ºC
k = 0.45 # Constante de enfriamiento

# Calcular las temperaturas después de 1, 5, 12, y 14 horas
tiempos = [1, 5, 12, 14]
temperaturas = [temperatura(ts, t0, k, t) for t in tiempos]

for t, temp in zip(tiempos, temperaturas):
    print(f"Temperatura después de {t} horas: {temp:.2f} ºC")

#calcular el tiempo necesario para que el cuerpo este a 0.5 grados menos q la temperatura ambiente

def tiempo_para_temperatura(ts, t0, k, t_final):
    return -math.log((t_final - ts) / (t0 - ts)) / k

# Temperatura objetivo (0.5ºC menos que la temperatura ambiente)
t_objetivo = ts - 0.5

# Calcular el tiempo necesario
t_necesario = tiempo_para_temperatura(ts, t0, k, t_objetivo)
print(f"Tiempo necesario para que la temperatura sea {t_objetivo} ºC: {t_necesario:.2f} horas")
