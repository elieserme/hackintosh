# Hackintosh

This is the guide for **OpenCore 0.8.1** Hackintosh build based on i7 9700KF | Gigabyte Z370N WIFI | RX 6600XT | 32GB RAM | running **MacOS 12.4 Monterey** like a **Mac Pro (2019)**.

## Table of Contents

- [Hackintosh](#hackintosh)
	- [Table of Contents](#table-of-contents)
	- [Warning](#warning)
	- [Why use Mac Pro model](#why-use-mac-pro-model)
	- [Hardware](#hardware)
	- [BIOS settings](#bios-settings)
	- [Windows 11](#windows-11)
	- [MacOS 12 Monterey](#macos-12-monterey)
	- [USB Ports](#usb-ports)
	- [Sleep and Hibernate](#sleep-and-hibernate)
	- [Cleaning the EFI](#cleaning-the-efi)
	- [Final comments](#final-comments)
	- [Build images](#build-images)


## Warning 
**Please read** the [OpenCore Guide](https://dortania.github.io/OpenCore-Install-Guide/) to **understand the process** and make any changes if you require different settings.

## Why use Mac Pro model
- **The Last Intel Mac** ever! Long live to Hackintosh!
- **AMD GPU** for full performance;
- **h264** and **h265** video **encoding** and **decoding** working;
- **No DRM issues** _(you can use Apple TV+ and Safari for Netflix and PrimeVideo)_.

## Hardware

|       Type       | Item                                                                                                                                                                                             |
| :--------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|     **CPU**      | [Intel i7 9700KF ](https://www.intel.com.br/content/www/br/pt/products/sku/190885/intel-core-i79700kf-processor-12m-cache-up-to-4-90-ghz/specifications.html) 9th generation 8 cores 3,6GHz with Turbo Boost up to 4,9GHz          |
| **Motherboard**  | [Gigabyte Z370N WiFi 1.0 ](https://www.gigabyte.com/br/Motherboard/Z370N-WIFI-rev-10#kf) Mini ITX                                                                                                |
|     **RAM**      | [G.SKILL 32GB ](https://www.gskill.com/product/165/326/1562838932/F4-3200C16D-32GTZN-Overview) DDR4 3200MHz F4-3200C16D-32GTZN                                                                   |
|     **GPU**      | [Sapphire RX 6600XT 8GB](https://www.sapphiretech.com/en/consumer/pulse-radeon-rx-6600-xt-8g-gddr6) Dedicated Video Card                                                                         |
|   **Wireless**   | [Intel AC 8265 ](https://www.intel.com.br/content/www/br/pt/products/sku/94150/intel-dual-band-wirelessac-8265/specifications.html) Motherboard Wi-Fi and Bluetooth card |
|     **NVMe**     | [WD Black SN750 ](https://www.westerndigital.com/pt-br/products/internal-drives/wd-black-sn750-nvme-ssd#WDS250G3X0C) 500GB PCIe NVMe _(macOS)_                                                   |
|     **NVMe**     | [WD Black SN750 ](https://www.westerndigital.com/pt-br/products/internal-drives/wd-black-sn750-nvme-ssd#WDS250G3X0C) 1TB PCIe NVMe _(Windows)_                                                                                                              |
|     **HDD**      | [Western Digital Blue WD10EZEX-75WN4A0](https://www.westerndigital.com/pt-br/products/internal-drives/wd-blue-desktop-sata-hdd#WD5000AZLX) 1TB HDD _(Time Machine backup)_                                                 |
|     **HDD**      | [Seagate BarraCuda ST2000DM008-2FR102](https://www.seagate.com/br/pt/products/hard-drives/barracuda-hard-drive/) 2TB HDD _(Archives)_                                                 |
|  **CPU Cooler**  | [Scythe Big Shuriken 3 ](https://www.scythe-eu.com/produkte/cpu-kuehler/big-shuriken-3.html) low profile and small form factor cooler                                                                                                       |
| **Case Cooler**  | [Scythe KF1425FD18-P ](https://www.scythe.co.jp/product/fan/kf1425fd18-p/) 140mm case cooler                                                                                                     |
| **Power Supply** | [Corsair CX550 Bronze ](https://www.corsair.com/br/pt/Categorias/Produtos/Unidades-de-fonte-de-alimenta????o/cx-series-config/p/CP-9020121-WW) 550W Unit                                           |
|     **Case**     | [XIGMATEK Nebula C ](https://www.xigmatek.com/product_detail.php?item=63) Mini ITX                                                                                                               |

## BIOS settings

Gigabyte z370N WIFI using BIOS version F14

- **Load optimised defaults**
- MIT &gt; Advanced Memory Settings &gt; XMP &gt; **Profile 1**
- SmartFan &gt; Fan Control Mode &gt; **PWM**
- BIOS &gt; FastBoot &gt; **DISABLED**
- BIOS &gt; CSM Support &gt; **DISABLED**
- BIOS &gt; Windows 8/10 Features &gt; **Windows 8/10 WHQL**
- BIOS &gt; Secure Boot &gt; **DISABLED**
- Peripherals &gt; Initial Display Output &gt; **PCIe 1 Slot**
- Peripherals &gt; Above 4G Decoding &gt; **ENABLED**
- Peripherals &gt; Re-Size Bar &gt; **AUTO**
- Peripherals &gt; Intel PTT &gt; **ENABLED**
- Peripherals &gt; SGX &gt; **DISABLED**
- Peripherals &gt; Trusted Computing &gt; **ENABLED**
- Peripherals &gt; SATA and RST Configuration &gt; SATA Mode Selection &gt; **AHCI**
- Peripherals &gt; SATA and RST Configuration &gt; Aggressive LPM Support &gt; **DISABLED**
- Peripherals &gt; SATA and RST Configuration &gt; Sata **N** _(all ports)_ &gt; Hot Plug &gt; **DISABLED**
- Peripherals &gt; USB Config &gt; Legacy &gt; **DISABLED**
- Peripherals &gt; USB Config &gt; XHCI Handoff &gt; **ENABLED**
- Peripherals &gt; USB Config &gt; Port 60/64 emulation &gt; **DISABLED**
- Chipset &gt; VT-d &gt; **ENABLED**
- Chipset &gt; Wake On Lan &gt; **DISABLED** _(remind to disable it on adapters too)_
- Power &gt; Platform Power Management &gt; **ENABLED** _(enable child items **PEG**, **PCH** and **DMI ASPM**)_
- Power &gt; ErP &gt; **ENABLED**
- Power &gt; CEC 2019 Ready &gt; **DISABLED**
- Power &gt; Power Loading &gt; **DISABLED**
- Power &gt; RC6 (Render Standby) &gt; **DISABLED**
- Save and restart

## Windows 11 

> **IMPORTANT!**
**Do not install Intel RST or Optane drivers** on Windows, because it changes the operation of SATA ports in BIOS from **AHCI (required)** to RAID _(unsupported)_.

You can **isolate Windows** from Mac and vice versa _(by choose in BIOS what operating system will start)_. I'm not using BootCamp because my Windows activation and other software are linked to my motherboard.

To correct date and time, you need patch registry for **time sync** with MacOS, run **regedit as Administrator** and go to `HKEY_LOCAL_MACHINE` &gt; `SYSTEM` &gt; `CURRENTCONTROLSET` &gt; `CONTROL` &gt; `TIMEZONEINFORMATION` and add the property **RealTimeIsUniversal** with value **DWORD=1**

> **TIP!**
One valid use of Windows setup beyond gamming is to **generate the files** on **`ACPI`** folder. You can use **SSDTTime** tool to generate **`SSDT-AWAC.aml`**,  **`SSDT-EC.aml`** , **`SSDT-HPET.aml`** and **`SSDT-PLUG.aml`** files _(or other ACPI files your specific motherboard need)_. The **`SSDT-EC-USBW.aml`** and **`SSDT-SBUS-MCHC.aml`** can be edited and compiled using **MaciASL** util. Sources are in **`other/acpi_src`** in this repo.

## MacOS 12 Monterey

- Can be direct downloaded from Apple using [App Store](https://www.apple.com/br/macos/monterey/) on a regular MacOS computer; 
- Make a **USB** install disk _(the example below uses a USB device named USB and makes Monterey installation disk)_:
```bash
sudo /Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/USB
```
- Use [git repo](https://github.com/elieserme/hackintosh/) to download the **EFI** folder 

```bash
git clone git@github.com:elieserme/hackintosh.git
```

Use [ProperTree](https://github.com/corpnewt/ProperTree) to edit the **`config.plist`** file and change **PlatformInfo** values to your own machine:
- **MLB**, **SystemSerialNumber** and **SystemUUID** can be generated by [GenSMBIOS utility](https://github.com/corpnewt/GenSMBIOS);
- Before use a generated **SystemSerialNumber**, check it on [Apple Database](https://checkcoverage.apple.com) _(If it is valid, generate another and repeat if necessary until find an invalid and unused one)_; 
- **ROM** is the Mac address of the **en0** network adapter _(on Gigabyte z370N WIFI 1.0 is the Intel i219v gigabit port)_. Use the **Network Settings > Advanced > Hardware** panel to copy the Mac address _(only numbers and letters, without the : chars)_;
- Inside the **`config.plist`** search and replace **AAAAAAAAAAAA** with your generated _SystemSerialNumber_ value, **BBBBBBBBBBBBBBBBBB** with _MLB_ value, **CCCCCC-CCCC-CCCC-CCCC-CCCCCCCCCCCC** with _SystemUUID_ value and **DDDDDDDD** with _ROM_ value:
```xml
<key>PlatformInfo</key>
<dict>
	<key>Automatic</key>
	<true/>
	<key>CustomMemory</key>
	<false/>
	<key>Generic</key>
	<dict>
		<key>MaxBIOSVersion</key>
		<false/>
		<key>AdviseFeatures</key>
		<false/>
		<key>SystemMemoryStatus</key>
		<string>Auto</string>
		<key>MLB</key>
		<string>BBBBBBBBBBBBBBBBBB</string>
		<key>ProcessorType</key>
		<integer>0</integer>
		<key>ROM</key>
		<data>DDDDDDDD</data>
		<key>SpoofVendor</key>
		<true/>
		<key>SystemProductName</key>
		<string>MacPro7,1</string>
		<key>SystemSerialNumber</key>
		<string>AAAAAAAAAAAA</string>
		<key>SystemUUID</key>
		<string>CCCCCC-CCCC-CCCC-CCCC-CCCCCCCCCCCC</string>
	</dict>
	<key>UpdateDataHub</key>
	<true/>
	<key>UpdateNVRAM</key>
	<true/>
	<key>UpdateSMBIOS</key>
	<true/>
	<key>UpdateSMBIOSMode</key>
	<string>Create</string>
	<key>UseRawUuidEncoding</key>
	<false/>
</dict>
```
- To make your brazilian **ABNT2 keyboard** default when Install MacOS, change language and keyboard layout in your **`config.plist`** inside **NVRAM** key section:
```xml
<key>prev-lang:kbd</key>
<string>pt-BR:128</string>
```
- Mount the **EFI partition** of the **USB** disk using [MountEFI](https://github.com/corpnewt/MountEFI) utility and **copy the EFI folder** inside **`/Volumes/EFI`**
- **Boot** the target machine with **USB** disk you just made
- Using **Modified GRUB Shell** we must disable **CFG Lock** first with command below:
```bash
setup_var_3 0x5A4 0x00
```
**Please note that hardcoded value is for F14 BIOS version of the Gigabyte z370N WIFI 1.0 motherboard, if you use another BIOS version or another motherboard model you need to [recalculate this value](https://dortania.github.io/OpenCore-Post-Install/misc/msr-lock.html)** _(this command must run every time that BIOS is reflashed or CMOS clear. Some other motherboards can disable CFG Lock on BIOS settings without this hack)_. Below is the offset table for my tested BIOS versions:

| Gigabyte Z370N WiFi BIOS | CFG Lock offset |
| :----------------------: | --------------- |
|         **F10**          | _0x0585_        |
|         **F14**          | _Ox05A4_        |

- Use **Clear NVRAM** and reboot to make a clean install
- Use **Disk Utility** to erase a **APFS GUI** volume and **install MacOS**
- Finish **normal** MacOS setup

## USB Ports

The included **`USBMap.kext`** with USB mapping is for the **Gigabyte z370N WiFi 1.0 and MacPro7,1 SMBIOS only** with some **USB 3** ports, one **USB type C** and one **internal Bluetooth USB** port enabled.

Keep in mind that **you have to choose what ports to enable**, because **MacOS has a 15 logical ports limit** and each port has 2 logical ports _(one physical port has one USB 2 and one USB 3 personality, and USB Type C has different ports for each side... so **2 logical ports per physical port**)_ and you have to **reserve a port for Bluetooth card**.

![Motherboard](/images/motherboard.png)

**List of the 15 ports ENABLED**:

| Label | Name               |  Type  | Comment                                                             |
| :---: | ------------------ | :----: | ------------------------------------------------------------------- |
| **I** | HS01, **SS01**     |  0, 3  | _USB 2.0 & **3.1** front 1_                                         |
| **I** | HS02, **SS02**     |  0, 3  | _USB 2.0 & **3.1** front 2_                                         |
| **F** | HS03, **SS03**     |  0, 3  | _USB 2.0 & **3.1** rear 5_                                          |
| **G** | HS04, **SS04**     |  0, 3  | _USB 2.0 & **3.1** rear 6_                                          |
| **C** | HS05               |   0    | _USB 2.0 rear 3_                                                    |
| **D** | HS06               |   0    | _USB 2.0 rear 4_                                                    |
| **E** | HS09               |   8    | _USB 2.0 only rear **Type C**_                                      |
| **H** | HS10               |  255   | _USB 2.0 **internal** (bluetooth)_                                  |
| **J** | HS11               |   0    | _USB 2.0 **internal** (wireless keyboard or mouse dongle)_          |
| **E** | **SS09**, **SS10** | 10, 10 | _USB **3.1** only rear **Type C** (for each side of the connector)_ |

**List of ports DISABLED**:

|  Label   | Port                     | Comment                       |
| :------: | ------------------------ | ----------------------------- |
|  **C**   | _SS05_                   | _Only USB 2.0 active on HS05_ |
|  **D**   | _SS06_                   | _Only USB 2.0 active on HS06_ |
|  **A**   | _HS07, SS07_             | _Only to power my desklight_  |
|  **B**   | _HS08, SS08_             | _Only to power my soundbar_   |
|  **J**   | _HS12_                   | _Not used in macOS_           |
| _hidden_ | _HS13, HS14, USR1, USR2_ | _Not used in macOS_           |



## Sleep and Hibernate
Sometimes after sleep the computer will **wake every few minutes**. Normal Macs do this for several reasons, like other devices near. If you require a deep sleep without random wakeups, use the commands below to **disable this features**:
```bash
sudo pmset proximitywake 0
```
This is a desktop machine, you may want to **disable hibernation**:
```bash
sudo pmset hibernatemode 0
```
If you want to **restore the default** factory settings:
```bash
sudo pmset -a restoredefaults
```

You know that **Power Button can turn on and wake the computer** from Sleep and Hibernate modes. But you can make the Power Button **works for turn off the display and sleep like a real Mac too** with the following command:
```bash
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool yes
```

To **verify the current values** on your computer and **see what services are preventing the system to sleep**, use the following command:
```bash
pmset -g live
```

The commands above **works on a real Mac** computer too, if you want deep sleeps just follow the same steps.

## Cleaning the EFI

- If you **do not want** the **Boot Menu**, disable it in **`config.plist`** to boot like a real Mac:
```diff
	<key>ShowPicker</key>
-	<true/>
+	<false/>
```

## Final comments

After all you will can boot MacOS, Windows and Recovery **just like a real Mac** computer:
- Hold **Option** key (or **ESC** key) to show boot menu _(if you hide it)_;
- Press **Space Bar** on boot menu to show advanced options _(like Recovery and NVRAM reset)_;
- Update your Mac using the **Apple Software Updates**;
- Remind [update OpenCore](https://dortania.github.io/OpenCore-Post-Install/universal/update.html) **before** update MacOS.

## Build images

**Final Build**

![Logi1](/images/final.png)

[![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?username=elieserme)](https://github.com/anuraghazra/github-readme-stats)
