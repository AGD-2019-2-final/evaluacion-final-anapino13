import sys
if __name__ == '__main__':

    curkey = None
    minimo = 0
    maximo = 0

    for line in sys.stdin:
        key, val = line.split("\t")
        val = float(val)
        if key == curkey:
            if(val < minimo):
                minino = val
            if(val > maximo):
                maximo = val            
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo, minimo))
            curkey = key
            minimo = val
            maximo = val
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo, minimo))
