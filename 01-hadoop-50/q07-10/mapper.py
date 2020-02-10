import sys
if __name__ == "__main__":
    for line in sys.stdin:
      columna = line.split('   ')[0]
      valor1 = line.split('   ')[1]
      valor2 = line.split('   ')[2].strip()
      sys.stdout.write("{}\t{}\t{}\n".format(columna,valor1,valor2))
