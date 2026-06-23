#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/input.h>

static int __init kpm_init(void) {
    printk(KERN_INFO "KPM: Module loaded, ready for input hooking\n");
    return 0;
}

static void __exit kpm_exit(void) {
    printk(KERN_INFO "KPM: Module unloaded\n");
}

module_init(kpm_init);
module_exit(kpm_exit);
MODULE_LICENSE("GPL");
