---
title: "Linux Driver Subsystem"
date: "2025-09-21T17:21:26+01:00"
categories: ["Linux Driver Development"]
tags: [c, rust, drivers, linux]
layout: post
---
from https://www.kernel.org/doc/html/latest/driver-api/driver-model/bus.html
Every driver in the Linux kernel is associated with a bus type, which defines the interface between the kernel and the hardware devices.

A bus is a channel between the processor and one or more devices. For the purposes of the device model, all devices are connected via a bus, even if it is an internal, virtual, “platform” bus. Buses can plug into each other. A USB controller is usually a PCI device, for example. 
Each bus gets its own directory , along with two default directory

```s
@Anurag252 ➜ /workspaces/codespaces-blank $ ls /sys/bus
acpi         cpu           gpio          mdio_bus        node         platform     serio   vmbus
auxiliary    dax           hid           memory          nvmem        pnp          soc     vme
clockevents  edac          i2c           memory_tiering  pci          rapidio      spi     workqueue
clocksource  eisa          isa           mipi-dsi        pci-epf      scsi         usb
container    event_source  machinecheck  nd              pci_express  serial-base  virtio

ls /sys/bus/pci
devices  drivers  drivers_autoprobe  drivers_probe  rescan  resource_alignment  slots  uevent
```

Each registered driver gets a directory in bus's driver directory.

```s
  @Anurag252 ➜ /workspaces/codespaces-blank $ ls /sys/bus/pci/drivers
  8250_mid       ata_generic  intel_scu     mlx5_core  pata_sis  serial      xhci_hcd
  agpgart-intel  ata_piix     iosf_mbi_pci  nvme       pcieport  shpchp
  agpgart-via    hyperv_drm   mana          pata_acpi  pwm-lpss  virtio-pci
```

also each device that gets discovered on bus gets a directory in devices folder
```
@Anurag252 ➜ /workspaces/codespaces-blank $ ls /sys/bus/pci/devices/
0000:00:00.0  0000:00:07.0  0000:00:07.1  0000:00:07.3  0000:00:08.0  2614:00:02.0
```



