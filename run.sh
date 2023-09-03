qemu-system-aarch64 -cpu cortex-a57 -smp 4 -m 1024M -M virt -nographic \
    -kernel build/arch/arm64/boot/Image  \
    -append "console=ttyAMA0 root=/dev/vda rw mem=256M" \
    -drive format=raw,file=../rootfs/busybox/rootfs.img
    -fsdev local,security_model=passthrough,id=fsdev0,path=supcode \
    -device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare \
    -net nic -net user,hostfwd=tcp::22222-:22
    #-net nic -net tap,ifname=tap0,script=no,downscript=no
    #-net user,hostfwd=tcp::10022-:22 -net nic -net 
    #-net nic -net tap,ifname=tap0
    #-append "console=ttyAMA0 root=/dev/vda rw init=/lib/systemd/systemd" \
    #qemu-system-aarch64 -cpu cortex-a53 -m 1024M -M virt -nographic\
    #-append "console=ttyAMA0 root=/dev/vda rw init=/lib/systemd/systemd ip=dhcp cma=2M@0x7e000000-0x7e800000" \
    #-kernel build/arch/arm64/boot/Image -dtb virt.dtb\
