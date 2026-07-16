# Create the interpreter for the Gramado language.
# Usage:
# $ ./gramado -s THEME1.CNF --stats 
# Created by Fred Nora.

# Create the interpreter for the Gramado language.
# Usage:
# $ ./gramado -s THEME1.CNF --stats 
# Created by Fred Nora.

linkTarget = gramado

# Objects
myObjects = main.o globals.o lexer.o parser.o vm.o tree.o compiler.o   

all:

	gcc -c main.c      -o main.o
	gcc -c globals.c   -o globals.o
	gcc -c lexer.c     -o lexer.o
	gcc -c parser.c    -o parser.o
	gcc -c vm.c        -o vm.o
	gcc -c tree.c      -o tree.o
	gcc -c compiler.c  -o compiler.o

# Link
# Create the 'gramado' executable.
	gcc -Wall -o $(linkTarget) $(myObjects) 

# Build the final destination
	-mkdir build/
	-cp ./$(linkTarget)                build/
	-cp ./assets/examples/THEME1.CNF   build/
	-cp ./assets/examples/TEST1.CNF    build/
	-cp ./assets/usage.txt             build/
	-cp ./assets/Makefile              build/
	-cp ./assets/LOAD.TXT              build/
	rm *.o  

	@echo "Go to build/ folder and type make";
clean:
	-rm *.o  
	-rm ./gramado 
	-rm -rf build

clean-all:
	-rm *.o  
	-rm ./gramado 
	-rm -rf build

