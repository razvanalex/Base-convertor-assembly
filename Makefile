all: build

build: 
	nasm -g -f elf32 -o tema1.o tema1.asm
	gcc tema1.o ./checker/objects/macro.o -g -o tema1 -m32 

check:
	cp tema1.asm ./checker/
	cd ./checker && python ./checker.py

run:
	./tema1 

clean:
	rm -fr *.o tema1
