import sys
if __name__ == "__main__":
    for line in sys.stdin:
        columna1 = line.split("   ")[0]
        columna2 = line.split("   ")[2]
        sys.stdout.write("{}\t{}".format(columna1,columna2))
