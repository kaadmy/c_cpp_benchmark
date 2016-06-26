
# C++ compiles with some char conversion warnings, but works fine in C

# silence known warnings, such as no-op expressions that are typically
# removed with optimization
SILENCE_KNOWN_WARNINGS = -Wno-unused-value

CFLAGS = -O0 -Wall -Wextra -lrt $(SILENCE_KNOWN_WARNINGS)

default: benchmark-c benchmark-cxx run

benchmark-c: test.c
	@echo -e '\x1b[34mCompiling C test program...\x1b[00m'
	gcc $(LIBS) $(CFLAGS) -o benchmark-c test.c

benchmark-cxx: test.c
	@echo -e '\x1b[34mCompiling C++ test program...\x1b[00m'
	g++ $(LIBS) $(CFLAGS) -o benchmark-cxx test.c

run:
	@echo -e '\x1b[34mC test program running\x1b[00m'
	@./benchmark-c
	@echo -e '\x1b[34mC++ test program running\x1b[00m'
	@./benchmark-cxx

clean:
	-rm -f *.o
	-rm -f benchmark-c
	-rm -f benchmark-cxx