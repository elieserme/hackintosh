/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembly of iASL3BnjPB.aml, Wed Nov  6 20:03:44 2024
 *
 * ACPI Data Table [DMAR]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "DMAR"    [DMA Remapping table]
[004h 0004   4]                 Table Length : 00000050
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : BB
[00Ah 0010   6]                       Oem ID : "ALASKA"
[010h 0016   8]                 Oem Table ID : "A M I"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20200925

[024h 0036   1]           Host Address Width : 26
[025h 0037   1]                        Flags : 01
[026h 0038  10]                     Reserved : 00 00 00 00 00 00 00 00 00 00

[030h 0048   2]                Subtable Type : 0000 [Hardware Unit Definition]
[032h 0050   2]                       Length : 0020

[034h 0052   1]                        Flags : 01
[035h 0053   1]                     Reserved : 00
[036h 0054   2]           PCI Segment Number : 0000
[038h 0056   8]        Register Base Address : 00000000FED90000

[040h 0064   1]            Device Scope Type : 03 [IOAPIC Device]
[041h 0065   1]                 Entry Length : 08
[042h 0066   2]                     Reserved : 0000
[044h 0068   1]               Enumeration ID : 02
[045h 0069   1]               PCI Bus Number : F0

[046h 0070   2]                     PCI Path : 1F,00


[048h 0072   1]            Device Scope Type : 04 [Message-capable HPET Device]
[049h 0073   1]                 Entry Length : 08
[04Ah 0074   2]                     Reserved : 0000
[04Ch 0076   1]               Enumeration ID : 00
[04Dh 0077   1]               PCI Bus Number : 00

[04Eh 0078   2]                     PCI Path : 1F,00


Raw Table Data: Length 80 (0x50)

    0000: 44 4D 41 52 50 00 00 00 01 BB 41 4C 41 53 4B 41  // DMARP.....ALASKA
    0010: 41 20 4D 20 49 00 00 00 01 00 00 00 49 4E 54 4C  // A M I.......INTL
    0020: 25 09 20 20 26 01 00 00 00 00 00 00 00 00 00 00  // %.  &...........
    0030: 00 00 20 00 01 00 00 00 00 00 D9 FE 00 00 00 00  // .. .............
    0040: 03 08 00 00 02 F0 1F 00 04 08 00 00 00 00 1F 00  // ................
