import sys
if __name__ == "__main__":

    for line in sys.stdin:

        columna = line.rstrip().split()
        
        for letra in columna[1].split(','):
          sys.stdout.write("{}\t{}\t{}\n".format(letra+columna[0].zfill(2),letra,columna[0]))
