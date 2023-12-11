DIR_SRC		= src
DIR_VWORK	= vwork

FILES_SRC 	 		= $(wildcard $(DIR_SRC)/*.asm)
FILES_VWORK_DISK  	= $(wildcard $(DIR_VWORK)/sys.img)
FILES_MBR			= $(wildcard $(DIR_VWORK)/mbr.bin)

CC	= nasm

all:
	$(CC) $(FILES_SRC) -o $(DIR_VWORK)/mbr.bin

install:
	dd if=$(FILES_MBR) of=$(FILES_VWORK_DISK) bs=512 count=1 conv=notrunc

run:
ifeq ($(wildcard $(DIR_VWORK)/sys.img.lock), )
	$(info <Bochs Image Lock File> Does not exist)
else
	$(info <Bochs Image Lock File> File exists： run >>> rm *.lock)
	rm $(DIR_VWORK)/sys.img.lock
endif

	bochs -f $(DIR_VWORK)/bochsrc.disk

