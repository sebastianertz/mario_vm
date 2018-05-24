ifneq ($(CROSS_COMPILE),)
$(info CROSS_COMPILE=$(CROSS_COMPILE))
endif

CC := $(CROSS_COMPILE)gcc
CXX := $(CROSS_COMPILE)g++
AR := $(CROSS_COMPILE)ar
LD := $(CROSS_COMPILE)g++

SRCS = demo.c

CFLAGS =  -I./ -g

ifeq ($(CROSS_COMPILE), avr-)
CFLAGS =  -I./ -Os -DF_CPU=16000000UL -mmcu=atmega328p
endif

all:
	$(CC) -o mario $(CFLAGS) $(SRCS)

clean:
	rm -fr *.o mario *.dSYM
