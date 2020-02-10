import sys
if __name__ == '__main__':

    curkey = None
    total = ''
    
    for line in sys.stdin:

        orden, key, valor = line.split("\t")
        valor = valor

        if key == curkey:

            total = total+','+valor.rstrip()
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\n".format(curkey, total))

            curkey = key
            total = valor.rstrip()
            
    sys.stdout.write("{}\t{}\n".format(curkey, total))
