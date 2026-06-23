# Root Makefile
obj-m += src/kpm.o

# Note: You MUST update KDIR to point to your specific kernel source directory
# For GitHub CI, we usually download the source during the build step.
KDIR := /usr/src/linux-headers-$(shell uname -r) 
CROSS_COMPILE := aarch64-linux-android-

all:
	make -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=$(CROSS_COMPILE) modules

clean:
	make -C $(KDIR) M=$(PWD) clean
