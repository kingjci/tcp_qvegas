obj-m := tcp_qvegas.o

all:
	make -C /lib/modules/`uname -r`/build M=`pwd` modules CC=/usr/bin/gcc-4.9

clean:
	make -C /lib/modules/`uname -r`/build M=`pwd` clean

install:
	install tcp_qvegas.ko /lib/modules/`uname -r`/kernel/net/ipv4
	insmod /lib/modules/`uname -r`/kernel/net/ipv4/tcp_qvegas.ko
	depmod -a