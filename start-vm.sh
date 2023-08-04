cd ./build
./qemu-system-i386 -M pc -cpu max -m 4096 -accel tcg \
-device virtio-blk-pci,drive=drv0 \
-drive format=qcow2,file=../hda.qcow2,if=none,id=drv0 \
-device virtio-rng-pci,rng=rng0 \
-netdev user,id=mynet0 -device rtl8139,netdev=mynet0 \
-object rng-random,filename=/dev/urandom,id=rng0 \
-d mmu -D ../memLog.txt
