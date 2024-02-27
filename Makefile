all: clean build
	@./bb_lab

clean:
	@rm -f bb_lab bb_lab_custom strippped *.gch

build: clean
	@aarch64-linux-gnu-gcc -static -o bb_lab phases.h phases.c bb_lab.c -ggdb3

compile:
	@aarch64-linux-gnu-gcc -static -S phases.h phases.c bb_lab.c

custom: clean
	@aarch64-linux-gnu-gcc -static -o bb_lab_custom phases_custom.s bb_lab.s
	@aarch64-linux-gnu-strip -sx -o stripped bb_lab_custom

# qemu-aarch64 -L /usr/aarch64-linux-gnu/ -g 1234 ./bb_lab
# gdb-multiarch -q --nh -ex 'set architecture arm64' -ex 'file bb_lab' -ex 'target remote localhost:1234'