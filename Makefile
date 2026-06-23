# Optimized for Android/ARM64 cross-compilation
obj-m += src/kpm.o

# Force the compiler to ignore specific x86-only flags the kernel is looking for
EXTRA_CFLAGS += -fno-stack-protector -mno-outline-atomics
# Disable ftrace/mcount which is causing the -mrecord-mcount error
ccflags-y := -mno-record-mcount -mfentry

KDIR ?= /lib/modules/$(shell uname -r)/build
ARCH ?= arm64
CROSS_COMPILE ?= aarch64-linux-gnu-

all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
