output = checkInfo

all:
	gcc src/main.c -o $(output) 

clean:
	rm $(output)
