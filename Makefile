# Forcefully clear the flags that the kernel build system tries to inject
ccflags-y := -w -fno-stack-protector -D__KERNEL__ -DMODULE

# Explicitly override the arch flags
obj-m += src/kpm.o

KDIR ?= /lib/modules/$(shell uname -r)/build
ARCH ?= arm64
CROSS_COMPILE ?= aarch64-linux-gnu-

all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) \
	KCFLAGS="-w -fno-stack-protector" \
	modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
