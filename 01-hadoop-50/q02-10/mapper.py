import sys
if __name__ == "__main__":
    for line in sys.stdin:
        columna1 = line.split(',')[3]
        columna2 = line.split(',')[4]
        sys.stdout.write("{}\t{}\n".format(columna1,columna2))
