def fibonacci(n):
    secuencia = [0, 1]
    for i in range(2, n):
        secuencia.append(secuencia[-1] + secuencia[-2])
    return secuencia[:n]

n = int(input("Ingrese el valor de n para la sucesión de Fibonacci: "))
secuencia_fibonacci = fibonacci(n)
print(f"La sucesión de Fibonacci para n={n} es: {secuencia_fibonacci}")