def calcular_pi(n):
    pi = 0
    for k in range(n):
        pi += ((-1) ** k) / (2 * k + 1)
    return 4 * pi

n = 200
pi_valor = calcular_pi(n)
print(f"El valor de π calculado con n={n} es: {pi_valor}")