import sys
if __name__ == '__main__':

    curkey = None
    suma = 0
    x=0
    promedio=0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val=float(val)
        

        if key == curkey:
            suma = suma + val
            x += 1
            promedio = suma / x

        else:
            if curkey is None:
            	curkey = key
            	suma = val
            	x = 1
            	promedio = suma / x
            else:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma,promedio))
                curkey = key
                suma = val
                x = 1
                promedio = suma / x

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma,promedio))
