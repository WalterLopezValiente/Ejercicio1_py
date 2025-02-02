def calcular_letra_dni(dni):
    letras = "TRWAGMYFPDXBNJZSQVHLCKE"
    return letras[dni % 23]

dni = int(input("Ingrese su número de DNI: "))
letra = calcular_letra_dni(dni)
print(f"La letra correspondiente a su DNI es: {letra}")