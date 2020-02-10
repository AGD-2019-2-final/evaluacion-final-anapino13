import sys
if __name__ == "__main__":
    for line in sys.stdin:
        columna = line.split(',')[2]
        sys.stdout.write("{}\t1\n".format(columna)) 
