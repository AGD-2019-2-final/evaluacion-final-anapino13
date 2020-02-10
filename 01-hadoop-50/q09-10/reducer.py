import sys
if __name__ == '__main__':
    curkey = None
    n = 0
    for line in sys.stdin:
        if n < 6:
            texto,key,fecha,val = line.split("\t")
            sys.stdout.write("{}\t{}\t{}\n".format(key,fecha,val))
            n += 1
