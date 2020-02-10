import sys
if __name__=="__main__":
	for linea in sys.stdin:
		columna1=linea.split(',')[0]
		columna2=linea.split(',')[1] 
		columna2=int(columna2)
		sys.stdout.write("{}\t{}\t{}\n".format(columna2,columna1,columna2))
