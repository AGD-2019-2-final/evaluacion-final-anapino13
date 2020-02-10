import sys

if __name__ == '__main__':
    lista = []
    for line in sys.stdin:
        columna, valor1, valor2 = line.split("\t")
        lista.append([columna,valor1,int(valor2.strip())])
    lista = sorted(lista, key=lambda x: (x[0], x[2]))
    for line in lista:
        sys.stdout.write("{}\t{}\t{}\n".format(line[0], line[1], line[2]))
