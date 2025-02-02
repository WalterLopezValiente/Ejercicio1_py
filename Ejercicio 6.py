def desglose_dinero(cantidad):
    billetes_monedas = [500, 200, 100, 50, 20, 10, 5, 2, 1]
    desglose = {}
    for billete_moneda in billetes_monedas:
        if cantidad >= billete_moneda:
            desglose[billete_moneda], cantidad = divmod(cantidad, billete_moneda)
    return desglose

cantidad = int(input("Ingrese una cantidad entera de euros: "))
desglose = desglose_dinero(cantidad)
print("Desglose en billetes y monedas:")
for billete_moneda, cantidad in desglose.items():
    print(f"{billete_moneda}€: {cantidad}")