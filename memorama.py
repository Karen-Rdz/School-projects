import random

def mostrar_tablero(tablero):
    for i in range(len(tablero)):
        for j in range(len(tablero[i])):
            print(tablero[i][j], end=" ")
        print ("")

def filas_columnas(filas, columnas):
    # Crear un tablero
    tablero = []
    for i in range(0, filas):
        tablero.append([])
        for j in range(0, columnas):
            tablero[i].append("X")
    return tablero

def crear_numeros(div, dictionary, filas, columnas):
    numeros = []
    numeros = filas_columnas(filas, columnas)

    # Hacer el diccionario
    for i in range(1, int(div)+1):
        dictionary[i] = 0
    keys = dictionary.keys()

    # Asignar un valor
    for i in range(0, len(numeros)):
        for j in range(0, len(numeros[i])):
            asignar = False
            while not asignar:
                num_random = random.choice(list(keys))
                if dictionary[num_random] != 2:
                    numeros[i][j] = num_random
                    dictionary[num_random] += 1
                    asignar = True  
    return numeros

def checar(numero, comparar):
    # Comparar si el número seleccionado es menor al del tablero
    while numero > comparar or numero == 0:
        numero = int(input("Invalido, escoge otro número: "))
    return numero-1

def comprobar(tablero, fila, columna):
    while tablero[fila][columna] != "X":
        print("Invalido, esa tarjeta ya la has seleccionado")
        fila1 = int(input("Selecciona la fila (1,2,3...): "))
        fila = checar(fila1, filas)
        columna1 = int(input("Selecciona la columna (1,2,3...): "))
        columna = checar(columna1, columnas)
    return fila, columna

    
def turno(tablero, numeros, filas, columnas, count):
    # Pedir la fila y columna de las dos tarjetas a comparar, checar si es válida
    print("Tarjeta 1")
    fila1 = int(input("Selecciona la fila (1,2,3...): "))
    fila1 = checar(fila1, filas)
    columna1 = int(input("Selecciona la columna (1,2,3...): "))
    columna1 = checar(columna1, columnas)
    fila1, columna1 = comprobar(tablero, fila1, columna1)

    print("Tarjeta 2")
    fila2 = int(input("Selecciona la fila (1,2,3...): "))
    fila2 = checar(fila2, filas)
    columna2 = int(input("Selecciona la columna (1,2,3...): "))
    columna2 = checar(columna2, columnas)
    fila2, columna2 = comprobar(tablero, fila2, columna2)

    while fila1 == fila2 and columna1 == columna2:
        print("Invalido, las dos tarjetas son iguales")
        print("Tarjeta 1")
        fila1 = int(input("Selecciona la fila (1,2,3...): "))
        fila1 = checar(fila1, filas)
        columna1 = int(input("Selecciona la columna (1,2,3...): "))
        columna1 = checar(columna1, columnas)
        fila1, columna1 = comprobar(tablero, fila1, columna1)

        print("Tarjeta 2")
        fila2 = int(input("Selecciona la fila (1,2,3...)1: "))
        fila2 = checar(fila2, filas)
        columna2 = int(input("Selecciona la columna (1,2,3...): "))
        columna2 = checar(columna2, columnas)
        fila2, columna2 = comprobar(tablero, fila2, columna2)

    # Asignar los valors de números al tablero
    tablero[fila1][columna1] = numeros[fila1][columna1]
    tablero[fila2][columna2] = numeros[fila2][columna2]
    mostrar_tablero(tablero)

    # Checar si las tarjetas son iguales
    if numeros[fila1][columna1] == numeros[fila2][columna2]:
        print("Los dos números son iguales")
        count += 1
    else:
        print("Los dos números son diferentes")
        tablero[fila1][columna1] = "X"
        tablero[fila2][columna2] = "X"
        mostrar_tablero(tablero)
    return count

def crear_tablero(filas, columnas):
    tablero = []
    dictionary = {}
    mult = filas*columnas

    # Checar si el numero de filas por el de columnas es par, para que se pueda hacer el memorama
    while mult%2 != 0:
        print("Invalido, las filas y columnas no forman un juego correcto")
        filas = int(input("Escribe las filas de tu juego: "))
        columnas = int(input("Escribe las columnas de tu juego: "))
        mult = filas*columnas
    div = mult/2

    tablero = filas_columnas(filas, columnas)
    numeros = crear_numeros(div, dictionary, filas, columnas)
    mostrar_tablero(tablero)
    return tablero, numeros, div, filas, columnas

continuar = True

while continuar == True:
    print("¡Bienvenido al memorama digital!")
    filas = int(input("Escribe las filas de tu juego: "))
    columnas = int(input("Escribe las columnas de tu juego: "))
    tablero, numeros, div, filas, columnas = crear_tablero(filas, columnas)
    count = 0

    while count < div:
        count = turno(tablero, numeros, filas, columnas, count)

    if count == div:
        print("¡Felicidades, has terminado el juego!")
        respuesta = input("Si deseas jugar otra vez escribe 1, si no, escribe 2: ")
        if respuesta == "1":
            continuar = True
        else:
            continuar = False
print("¡Muchas gracias por jugar!")
        


    

