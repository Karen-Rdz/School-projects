def checar_filas(sudoku):
    for i in range (0,len(sudoku)):
        count = 1
        while count <= 9:
            if count in sudoku[i]:
                count += 1
            else:
                return False
    if count == 10:
        return True
    else:
        return False
        
def voltear_columnas(sudoku):
    y = []
    for i in range (0,len(sudoku)):
        x = []
        for j in range (0, len(sudoku)):
            x.append(sudoku[j][i])
        y.append(x)
    return y

def voltear_tres(sudoku):
    y = []
    for i in range (0, len(sudoku), 3):
        for j in range (0, len(sudoku), 3):
            x = []
            for k in range (3):
                for z in range (3):
                    x.append(sudoku[k+i][z+j])
            y.append(x)
    return y

def revisarSudoku(sudoku):
    sudoku2 = voltear_columnas(sudoku)
    sudoku3 = voltear_tres(sudoku)
    if checar_filas(sudoku) and checar_filas(sudoku2) and checar_filas(sudoku3):
        return True
    else:
        return False
    
        
sudokuCorrecto = [[8,2,7,1,5,4,3,9,6],
                  [9,6,5,3,2,7,1,4,8],
                  [3,4,1,6,8,9,7,5,2],
                  [5,9,3,4,6,8,2,7,1],
                  [4,7,2,5,1,3,6,8,9],
                  [6,1,8,9,7,2,4,3,5],
                  [7,8,6,2,3,5,9,1,4],
                  [1,5,4,7,9,6,8,2,3],
                  [2,3,9,8,4,1,5,6,7]]

sudokuCorrecto2 = [[1,8,5,3,2,9,4,7,6],
                   [7,2,4,5,1,6,8,9,3],
                   [9,6,3,8,4,7,5,1,2],
                   [6,4,1,2,9,8,3,5,7],
                   [5,9,8,7,6,3,1,2,4],
                   [2,3,7,4,5,1,6,8,9],
                   [3,1,6,9,8,2,7,4,5],
                   [4,7,9,1,3,5,2,6,8],
                   [8,5,2,6,7,4,9,3,1]]

sudokuIncorrecto = [[8,2,2,1,3,4,3,9,1],
                  [9,1,3,3,2,2,1,4,8],
                  [3,4,1,1,8,9,2,3,2],
                  [3,9,3,4,1,8,2,2,1],
                  [4,2,2,3,1,3,1,8,9],
                  [1,1,8,9,2,2,4,3,3],
                  [2,8,1,2,3,3,9,1,4],
                  [1,3,4,2,9,1,8,2,3],
                  [2,3,9,8,4,1,3,1,2]]

sudokuIncorrecto2 = [[1,2,3,4,5,6,7,8,9],
                    [1,2,3,4,5,6,7,8,9],
                    [1,2,3,4,5,6,7,8,9],
                    [1,2,3,4,5,6,7,8,9],
                    [1,2,3,4,5,6,7,8,9],
                    [1,2,3,4,5,6,7,8,9],
                    [1,2,3,4,5,6,7,8,9],
                    [1,2,3,4,5,6,7,8,9],
                    [1,2,3,4,5,6,7,8,9]]

sudokuIncorrecto3 = [[1,1,1,1,1,1,1,1,1],
                     [2,2,2,2,2,2,2,2,2],
                     [3,3,3,3,3,3,3,3,3],
                     [4,4,4,4,4,4,4,4,4],
                     [5,5,5,5,5,5,5,5,5],
                     [6,6,6,6,6,6,6,6,6],
                     [7,7,7,7,7,7,7,7,7],
                     [8,8,8,8,8,8,8,8,8],
                     [9,9,9,9,9,9,9,9,9]]

sudokuIncorrecto4 = [[1,2,3,4,5,6,7,8,9],
                     [9,1,2,3,4,5,6,7,8],
                     [8,9,1,2,3,4,5,6,7],
                     [7,8,9,1,2,3,4,5,6],
                     [6,7,8,9,1,2,3,4,5],
                     [5,6,7,8,9,1,2,3,4],
                     [4,5,6,7,8,9,1,2,3],
                     [3,4,5,6,7,8,9,1,2],
                     [2,3,4,5,6,7,8,9,1]]

sudokuIncorrecto5 = [[1,2,3,4,5,6,7,8,9],
                     [2,3,4,5,6,7,8,9,1],
                     [9,1,2,3,4,5,6,7,8],
                     [7,8,9,1,2,3,4,5,6],
                     [6,7,8,9,1,2,3,4,5],
                     [9,1,2,3,4,5,6,7,8],
                     [8,9,1,2,3,4,5,6,7],
                     [4,5,6,7,8,9,1,2,3],
                     [3,4,5,6,7,8,9,1,2]]

sudokuIncorrecto6 = [[1,2,3,4,5,6,7,8,9],
                     [3,4,5,6,7,8,9,1,2],
                     [7,8,9,1,2,3,4,5,6],
                     [6,7,8,9,1,2,3,4,5],
                     [9,1,2,3,4,5,6,7,8],
                     [8,9,1,2,3,4,5,6,7],
                     [4,5,6,7,8,9,1,2,3],
                     [5,6,7,8,9,1,2,3,4],
                     [2,3,4,5,6,7,8,9,1]]

sudokuIncorrecto7 = [[5,5,5,5,5,5,5,5,5],
                     [5,5,5,5,5,5,5,5,5],
                     [5,5,5,5,5,5,5,5,5],
                     [5,5,5,5,5,5,5,5,5],
                     [5,5,5,5,5,5,5,5,5],
                     [5,5,5,5,5,5,5,5,5],
                     [5,5,5,5,5,5,5,5,5],
                     [5,5,5,5,5,5,5,5,5],
                     [5,5,5,5,5,5,5,5,5]]

print(revisarSudoku(sudokuCorrecto))
print(revisarSudoku(sudokuCorrecto2))
print(revisarSudoku(sudokuIncorrecto))
print(revisarSudoku(sudokuIncorrecto2))
print(revisarSudoku(sudokuIncorrecto3))
print(revisarSudoku(sudokuIncorrecto4))
print(revisarSudoku(sudokuIncorrecto5))
print(revisarSudoku(sudokuIncorrecto6))
print(revisarSudoku(sudokuIncorrecto7))



