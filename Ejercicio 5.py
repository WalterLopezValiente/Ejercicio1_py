def generar_lista():
    lista = []
    for i in range(1, 101):
        if i % 2 == 0:
            lista.append(i ** 2)
        else:
            lista.append(i ** 3)
    return lista

def suma_cercana_a_un_millon(lista):
    suma = 0
    contador = 0
    for numero in lista:
        if suma + numero < 1000000:
            suma += numero
            contador += 1
        else:
            break
    return contador, suma

lista = generar_lista()
contador, suma = suma_cercana_a_un_millon(lista)
print(f"Se deben sumar {contador} números para obtener una suma de {suma}, lo más cercano posible pero inferior a un millón")