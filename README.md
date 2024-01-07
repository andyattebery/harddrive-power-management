# Hard drive Power Management

## Status
WIP

## Requires
- [openSeaChest](https://github.com/Seagate/openSeaChest)

## Devices

`openSeaChest_PowerControl --showEPCSettings` output for devices

### Table Legend
```
===EPC Settings===
* = timer is enabled
C column = Changeable
S column = Savable
All times are in 100 milliseconds
```

### ST18000NM000J-2TV103 - ZR5BA9B5 - SN02 - ATA

```
Name       Current Timer Default Timer Saved Timer   Recovery Time C S
Idle A     *1            *1            *1            1             Y Y
Idle B     *1200         *1200         *1200         4             Y Y
Idle C      0             6000          6000         20            Y Y
Standby Z   0             9000          9000         110           Y Y
```

### WDC WD180EDGZ-11B2DA0 - 3GKK6M2K - 85.00A85 - ATA

```
Name       Current Timer Default Timer Saved Timer   Recovery Time C S
Idle A     *20           *20           *20           1             Y Y
Idle B     *6000         *6000         *6000         11            Y Y
Idle C      0             0             0            32            Y Y
Standby Y   0             0             0            32            Y Y
Standby Z   0             0             0            85            Y Y
```

## References
- https://superuser.com/questions/555400/what-do-different-values-of-hard-drives-advanced-power-management-feature-hdpa
- https://wiki.archlinux.org/title/Hdparm#Power_management_configuration
- https://www.reddit.com/r/truenas/comments/p1ebnf/seagate_exos_load_cyclingidling_info_solution/

### SATA Link Power Management
- https://www.thomas-krenn.com/en/wiki/SATA_Link_Power_Management
- https://insanity.industries/post/sata-power-consumption/

### Tools
- https://www.man7.org/linux/man-pages/man8/hdparm.8.html
- https://www.smartmontools.org/browser/trunk/smartmontools/smartctl.8.in
- https://github.com/tyan-boot/wdepc

### Seagate Specific
- https://www.reddit.com/r/truenas/comments/p1ebnf/seagate_exos_load_cyclingidling_info_solution/
- https://github.com/Seagate/openSeaChest
- https://www.seagate.com/files/docs/pdf/en-GB/whitepaper/tp608-powerchoice-tech-provides-gb.pdf
