#!/bin/bash -e



ROOTFS_TEMP="./bullseye_root"

sudo rm -rf $ROOTFS_TEMP


sudo debootstrap --variant=minbase --include=locales,gnupg,ifupdown,apt-utils,apt-transport-https,ca-certificates,bzip2,console-setup,cpio,cron,dbus,init,initramfs-tools,iputils-ping,isc-dhcp-client,kmod,less,libpam-systemd,linux-base,logrotate,netbase,netcat-openbsd,systemd,sudo,ucf,udev,whiptail,wireless-regdb,dmsetup,rsync,tzdata,fdisk,libgtk2.0-bin  --exclude=rsyslog 		--arch=arm64 --components=main --foreign bullseye $ROOTFS_TEMP http://localhost:3142/mirrors.tuna.tsinghua.edu.cn/debian


	
sudo mkdir -p $ROOTFS_TEMP/usr/local/bin


sudo chroot $ROOTFS_TEMP/bin/bash -c "/debootstrap/debootstrap --second-stage"


