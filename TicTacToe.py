def print_tablero(tablero):
    print("El tablero actual es: ")
    for i in range(len(tablero)):
        for j in range(len(tablero[i])):
            print(tablero[i][j], end= "")
        print ("")

def cambiar_turno(turno):
    if turno == "x":
        turno = "o"
    else:
        turno = "x"
    return turno

def juego(fila, columna, tablero, turno):
    while tablero[fila][columna] != "*":
        print("Esa casilla ya esta ocupada")
        fila = int(input("Ingrese otra fila entre 1 y 3 "))-1  
        columna = int(input("Ingrese otra columna entre 1 y 3 "))-1  
    tablero[fila][columna] = turno
    return tablero

def checar_fila(fila):
    while fila < 0 or fila > 2:
        fila = int(input("Ingrese otra fila entre 1 y 3 "))-1
    return fila

def checar_columna(columna):
    while columna < 0 or columna > 2:
        columna = int(input("Ingrese otra columna entre 1 y 3 "))-1
    return columna

def ganar(tablero, turno):
    if tablero[0][0] == tablero[0][1] and tablero[0][1] == tablero[0][2] and tablero[0][2] == turno:
        return True
    elif tablero[1][0] == tablero[1][1] and tablero[1][1] == tablero[1][2] and tablero[1][2] == turno:
        return True
    elif tablero[2][0] == tablero[2][1] and tablero [2][1] == tablero[2][2] and tablero[2][2] == turno:
        return True

    elif tablero[0][0] == tablero[1][0] and tablero[1][0] == tablero[2][0] and tablero[2][0] == turno:
        return True
    elif tablero[0][1] == tablero[1][1] and tablero[1][1] == tablero[2][1] and tablero[2][1] == turno:
        return True
    elif tablero[0][2] == tablero[1][2] and tablero[1][2] == tablero[2][2] and tablero[2][2] == turno:
        return True
    
    elif tablero[0][0] == tablero[1][1] and tablero[1][1] == tablero[2][2] and tablero[2][2] == turno:
        return True
    elif tablero[0][2] == tablero[1][1] and tablero[1][1] == tablero[2][0] and tablero[2][0] == turno:
        return True

    else:
        return False
    
tablero = [["*","*","*"], ["*","*","*"], ["*","*","*",]]
nombre1 = input("Ingresa el nombre del primer jugador ")
nombre2 = input("Ingresa el nombre del segundo jugador ")
print_tablero(tablero)
turno = "x"
win = False
turn = 0

while turn < 9:
    print("Cambio de turno")
    fila = int(input("Ingrese la fila "))-1
    fila = checar_fila(fila)

    columna = int(input("Ingrese la columna "))-1
    columna = checar_columna(columna)

    tablero = juego(fila,columna,tablero, turno)
    print_tablero(tablero)
    win = ganar(tablero, turno)
    if win == True:
        break
    else:
        turno = cambiar_turno(turno)
        turn += 1

if win == True:
    if turno == "x":
        print ("¡Felicidades! " + nombre1 + " Has ganado :D")
    else:
        print ("¡Felicidades! " + nombre2 + " Has ganado :D")
else:
    print ("Ningún jugador ha ganado")
