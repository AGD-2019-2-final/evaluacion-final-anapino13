import sys
if __name__ == "__main__":
    for line in sys.stdin:
      columna = line.split()[0]
      columna1 = line.split()[1]
      columna2 = line.split()[2]
      columna2=columna2.zfill(3)
      sys.stdout.write("{}\t{}\t{}\t{}\n".format(columna2, columna, columna1, int(columna2)))
