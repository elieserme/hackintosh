# Hackintosh

This is the guide for **OpenCore 0.7.7** Hackintosh build based on i7 8700 | Gigabyte Z370N WIFI | RX 6600XT | 32GB RAM | running **MacOS Monterey 12.2** like a  **iMac 2019**.

## Table of Contents

- [Hackintosh](#hackintosh)
	- [Table of Contents](#table-of-contents)
	- [Warning](#warning)
	- [Why use iMac 2019 model](#why-use-imac-2019-model)
	- [Hardware](#hardware)
		- [BIOS settings](#bios-settings)
	- [MacOS Monterey 12](#macos-monterey-12)
	- [Post install](#post-install)
		- [Windows](#windows)
		- [Cleaning the EFI](#cleaning-the-efi)
	- [Other SMBIOS](#other-smbios)
		- [MacPro](#macpro)
	- [Notes](#notes)
		- [USB Ports](#usb-ports)
		- [DRM Support](#drm-support)
		- [Power Management](#power-management)
		- [Sleep and Hibernate](#sleep-and-hibernate)
		- [Power button](#power-button)
		- [ABNT2 keyboard](#abnt2-keyboard)
	- [Final comments](#final-comments)
	- [Build images](#build-images)


## Warning 
**Please read** the [OpenCore Guide](https://dortania.github.io/OpenCore-Install-Guide/) to **understand the process** and make any changes if you require different settings.

## Why use iMac 2019 model
- Native **Intel Cofee Lake** power management;
- **AMD GPU** and **iGPU** for balanced performance;
- **h264** and **h265** video **encoding** and **decoding** working;
- **Sidecar** working because **this iMac do not have T2 chip**;
- Note that are DRM issues with **Netflix**, **PrimeVideo** and **Apple TV+** in **Big Sur** and **Monterey** until community finds a solution _(if you require DRM support, better use the MacPro7,1 SMBIOS and read this until the end for more information)_.

## Hardware

|       Type       | Item                                                                                                                                                                                    |
| :--------------: | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|     **CPU**      | [Intel i7 8700 ](https://www.intel.com.br/content/www/br/pt/products/processors/core/core-vpro/i7-8700.html) 8th generation 6 cores and 12 threads 3,2GHz with Turbo Boost up to 4,6GHz |
| **Motherboard**  | [Gigabyte Z370N WiFi 1.0 ](https://www.gigabyte.com/br/Motherboard/Z370N-WIFI-rev-10#kf) Mini ITX                                                                                       |
|     **RAM**      | [G.SKILL 32GB ](https://www.gskill.com/product/165/326/1562838932/F4-3200C16D-32GTZN-Overview) DDR4 3200MHz F4-3200C16D-32GTZN                                                          |
|     **SSD**      | [WD Black SN750 ](https://www.westerndigital.com/pt-br/products/internal-drives/wd-black-sn750-nvme-ssd#WDS250G3X0C) 500GB PCIe NVMe _(Macintosh HD)_                                   |
|     **SSD**      | [ADATA XPG SX6000 Pro ](https://www.adata.com/pt/xpg/580) 1TB PCIe NVMe _(Windows)_                                                                                                     |
| **Power Supply** | [Corsair CX550 Bronze ](https://www.corsair.com/br/pt/Categorias/Produtos/Unidades-de-fonte-de-alimentação/cx-series-config/p/CP-9020121-WW) 550W Unit                                  |
|     **GPU**      | [Sapphire RX 6600XT 8GB](https://www.sapphiretech.com/en/consumer/pulse-radeon-rx-6600-xt-8g-gddr6) Dedicated Video Card                                                                |
|   **Wireless**   | [BCM94360CS2 ](https://github.com/elieserme/hackintosh/blob/main/other/windows11/wireless_apple/bcm94360cs2.zip) Bluetooth and WiFI replacement card                                    |
|     **Case**     | [XIGMATEK Nebula C ](https://www.xigmatek.com/product_detail.php?item=63) Mini ITX                                                                                                      |

### BIOS settings

Gigabyte z370N WIFI using BIOS version F14

- **Load optimised defaults**
- MIT &gt; Advanced Memory Settings &gt; XMP &gt; **Profile 1**
- MIT &gt; Advanced CPU Core Settings &gt; Enhanced Multi-core Performance &gt; **AUTO**
- SmartFan &gt; Fan Control Mode &gt; **PWM**
- SmartFan &gt; Auto Stop &gt; **ENABLED**
- BIOS &gt; FastBoot &gt; **DISABLED**
- BIOS &gt; CSM Support &gt; **DISABLED**
- BIOS &gt; Windows 8/10 Features &gt; **Windows 8/10 WHQL**
- BIOS &gt; Secure Boot &gt; **DISABLED**
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
- Chipset &gt; Internal Graphics &gt; **ENABLED** with **64MB** min and **256MB** max; 
- Chipset &gt; Wake On Lan &gt; **DISABLED** _(remind to disable it on adapters too)_
- Power &gt; ErP &gt; **ENABLED**
- Power &gt; Platform Power Management &gt; **ENABLED** _(enable child items **PEG**, **PCH** and **DMI ASPM**)_
- Power &gt; CEC 2019 Ready &gt; **DISABLED**
- Power &gt; Power Loading &gt; **DISABLED**
- Save and restart

## MacOS Monterey 12

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
		<string>iMac19,2</string>
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

- Mount the **EFI partition** of the **USB** disk using [MountEFI](https://github.com/corpnewt/MountEFI) utility and **copy the EFI folder** inside **`/Volumes/EFI`**
- **Boot** the target machine with **USB** disk you just made
- Using **Modified GRUB Shell** we must disable **CFG Lock** first with command below:
```bash
setup_var_3 0x5A4 0x00
```
**Please note that hardcoded value is for F14 BIOS version of the Gigabyte z370N WIFI 1.0 motherboard, if you use another BIOS version or another motherboard model you need to [recalculate this value](https://dortania.github.io/OpenCore-Post-Install/misc/msr-lock.html)** _(this command must run every time that BIOS is reflashed or CMOS clear. Some other motherboards can disable CFG Lock on BIOS settings without this hack)_. Below is the offset table for my tested BIOS versions:

| Gigabyte Z370N WiFi BIOS | Offset   |
| :----------------------: | -------- |
|         **F10**          | _0x0585_ |
|         **F14**          | _Ox05A4_ |

- Use **Clear NVRAM** and reboot to make a clean install
- Use **Disk Utility** to erase a **APFS GUI** volume and **install MacOS**
- Finish **normal** MacOS setup

## Post install

### Windows 

> **IMPORTANT!**
**Do not install Intel RST or Optane drivers** on Windows, because it changes the operation of SATA ports in BIOS from **AHCI (required)** to RAID _(unsupported)_.

You can **isolate Windows** from Mac and vice versa _(by choose boot drive in BIOS)_.

To correct date and time, you need patch registry for **time sync** with MacOS, run **regedit as Administrator** and go to `HKEY_LOCAL_MACHINE` &gt; `SYSTEM` &gt; `CURRENTCONTROLSET` &gt; `CONTROL` &gt; `TIMEZONEINFORMATION` and add the property **RealTimeIsUniversal** with value **DWORD=1**

> **TIP!**
One valid use of Windows beyond gamming is to **generate the files** on **`ACPI`** folder. You can use **SSDTTime** tool to generate **`SSDT-AWAC.aml`**,  **`SSDT-EC.aml`** , **`SSDT-HPET.aml`** and **`SSDT-PLUG.aml`** files _(or other ACPI files your specific motherboard need)_. The **`SSDT-EC-USBW.aml`** and **`SSDT-SBUS-MCHC.aml`** can be edited and compiled using **MaciASL** util. Sources are in **`other/acpi_src`** in this repo.

### Cleaning the EFI

- If you **not using MacPro7,1** SMBIOS, remove **`CPUFriend.kext`**, **`CPUFriendDataProvider.kext`** and **`RestrictEvents.kext`** from **`Kexts`** folder and from **`config.plist`** too:
```diff
-	<dict>
-		<key>Comment</key>
-		<string></string>
-		<key>MaxKernel</key>
-		<string></string>
-		<key>PlistPath</key>
-		<string>Contents/Info.plist</string>
-		<key>Enabled</key>
-		<false/>
-		<key>MinKernel</key>
-		<string></string>
-		<key>ExecutablePath</key>
-		<string>Contents/MacOS/CPUFriend</string>
-		<key>Arch</key>
-		<string>Any</string>
-		<key>BundlePath</key>
-		<string>CPUFriend.kext</string>
-	</dict>
-	<dict>
-		<key>Comment</key>
-		<string></string>
-		<key>MaxKernel</key>
-		<string></string>
-		<key>PlistPath</key>
-		<string>Contents/Info.plist</string>
-		<key>Enabled</key>
-		<false/>
-		<key>MinKernel</key>
-		<string></string>
-		<key>ExecutablePath</key>
-		<string></string>
-		<key>Arch</key>
-		<string>Any</string>
-		<key>BundlePath</key>
-		<string>CPUFriendDataProvider.kext</string>
-	</dict>
-	<dict>
-		<key>Comment</key>
-		<string></string>
-		<key>MaxKernel</key>
-		<string></string>
-		<key>PlistPath</key>
-		<string>Contents/Info.plist</string>
-		<key>Enabled</key>
-		<false/>
-		<key>MinKernel</key>
-		<string></string>
-		<key>ExecutablePath</key>
-		<string>Contents/MacOS/RestrictEvents</string>
-		<key>Arch</key>
-		<string>Any</string>
-		<key>BundlePath</key>
-		<string>RestrictEvents.kext</string>
-	</dict>
```
- If you **do not want** to install Windows 11, disable **Boot Menu** in **`config.plist`** to work like a real Mac:
```diff
	<key>ShowPicker</key>
-	<true/>
+	<false/>
```

## Other SMBIOS

This build has some options:
- The **most hardware compatible** and working out-of-the-box is **iMac19,2** by default, but have DRM issues with Safari, Netflix, Prime Video, Apple TV+ and possible others;
- **MacPro7,1** is more like a PC because you can **add GPUs and upgrade parts**. It will give you **full DRM support** and **best video processing speed**; but loss SideCar because your hack will not have a T2 chip.

| SMBIOS        | Advantage                                                                                                                                      | Loss                                                     |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| **iMac19,2**  | _**Native CPU power management, no T2 chip, GPU + iGPU with IQSV encoding, SideCar**_                                                          | _DRM support (Netflix, PrimeVideo) on Safari, Apple TV+_ |
| **MacPro7,1** | **_Full DRM support, HDR display support, Netflix and Prime Video on Safari, AppleTV+, Fast AMD GPU encoding, more hardware upgrade options_** | _SideCar_                                                |

You can decide **what features are more important to your work and choice** the right SMBIOS. If you decide go to **MacPro** see instructions below.

### MacPro

Use the MacPro7,1 SMBIOS if you **require full DRM support** and **best video production** acceleration. Follow the steps below:
- Change **`config.plist`** and replace **SystemProductName** with MacPro7,1:
```diff
	<key>SystemProductName</key>
-	<string>iMac19,2</string>
+	<string>MacPro7,1</string>
```
- Generate a new **MLB**, **SystemSerialNumber** and **SystemUUID** for MacPro7,1 using [GenSMBIOS utility](https://github.com/corpnewt/GenSMBIOS) and **replace this values** in your **`config.plist`**;
- **Update this section** from your **`config.plist`** since you **will not use iGPU** anymore:
```diff
	<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
	<dict>
-		<key>AAPL,ig-platform-id</key>
-		<data>AwCSPg==</data>
+		<key>class-code</key>
+		<data>/////w==</data>
+		<key>name</key>
+		<string>#display</string>
+		<key>IOName</key>
+		<string>#display</string>
	</dict>
```
- Edit **`USBPorts.kext`** _(on Mac you need to right click and Show Package Contents, edit info.plist inside de Contents folder)_ and change in **two places** the new SMBIOS and **USB Power** settings:
```diff
	<key>IOKitPersonalities</key>
	<dict>
-	<key>iMac19,2-XHC</key>
+	<key>MacPro7,1-XHC</key>
```
and
```diff
	<key>model</key>
-	<string>iMac19,2</string>
+	<string>MacPro7,1</string>
```
- **Enable** the **`CPUFriend.kext`**, **`CPUFriendDataProvider.kext`** and **`RestrictEvents.kext`** in your **`config.plist`** _(this kexts are supplied but disabled by default)_:
```diff
	<dict>
		<key>Comment</key>
		<string></string>
		<key>MaxKernel</key>
		<string></string>
		<key>PlistPath</key>
		<string>Contents/Info.plist</string>
		<key>Enabled</key>
-		<false/>
+		<true/>
		<key>MinKernel</key>
		<string></string>
		<key>ExecutablePath</key>
		<string>Contents/MacOS/CPUFriend</string>
		<key>Arch</key>
		<string>Any</string>
		<key>BundlePath</key>
		<string>CPUFriend.kext</string>
	</dict>
	<dict>
		<key>Comment</key>
		<string></string>
		<key>MaxKernel</key>
		<string></string>
		<key>PlistPath</key>
		<string>Contents/Info.plist</string>
		<key>Enabled</key>
-		<false/>
+		<true/>
		<key>MinKernel</key>
		<string></string>
		<key>ExecutablePath</key>
		<string></string>
		<key>Arch</key>
		<string>Any</string>
		<key>BundlePath</key>
		<string>CPUFriendDataProvider.kext</string>
	</dict>
	<dict>
		<key>Comment</key>
		<string></string>
		<key>MaxKernel</key>
		<string></string>
		<key>PlistPath</key>
		<string>Contents/Info.plist</string>
		<key>Enabled</key>
-		<false/>
+		<true/>
		<key>MinKernel</key>
		<string></string>
		<key>ExecutablePath</key>
		<string>Contents/MacOS/RestrictEvents</string>
		<key>Arch</key>
		<string>Any</string>
		<key>BundlePath</key>
		<string>RestrictEvents.kext</string>
	</dict>
```
- Remind to **Reset NVRAM** if you are changing from iMac19,2 running to new MacPro7,1 **prior to reboot MacOS** _(if you need to generate your own `CPUFriendDataProvider.kext` see the [notes](#power-management) below for instructions)_.

## Notes 

### USB Ports

The included **`USBPorts.kext`** with USB mapping is for the **Gigabyte z370N WiFi 1.0 and iMac19,2 SMBIOS only** with some **USB 3** ports, one **USB type C** and one **internal Bluetooth USB** port enabled.

Keep in mind that **you have to choose what ports to enable**, because **MacOS has a 15 logical ports limit** and each port has 2 logical ports _(one physical port has one USB 2 and one USB 3 personality, and USB Type C has different ports for each side... so **2 logical ports per physical port**)_ and you have to **reserve a port for Bluetooth card**.

![Motherboard](/images/motherboard.png)

**List of the 15 ports ENABLED**:

| Label | Name               |  Type  | Comment                                                    |
| :---: | ------------------ | :----: | ---------------------------------------------------------- |
| **I** | HS01, **SS01**     |  0, 3  | _USB 2.0 & **3.1** front 1_                                |
| **I** | HS02, **SS02**     |  0, 3  | _USB 2.0 & **3.1** front 2_                                |
| **F** | HS03, **SS03**     |  0, 3  | _USB 2.0 & **3.1** rear 5_                                 |
| **G** | HS04, **SS04**     |  0, 3  | _USB 2.0 & **3.1** rear 6_                                 |
| **C** | HS05               |   0    | _USB 2.0 rear 3_                                           |
| **D** | HS06               |   0    | _USB 2.0 rear 4_                                           |
| **E** | HS09               |   0    | _USB 2.0 only rear **Type C**_                             |
| **H** | HS10               |  255   | _USB 2.0 **internal** (bluetooth)_                         |
| **J** | HS11               |   0    | _USB 2.0 **internal** (wireless keyboard or mouse dongle)_ |
| **E** | **SS09**, **SS10** | 10, 10 | _USB **3.1** only rear **Type C**_                         |

**List of ports DISABLED**:

|  Label   | Port                     |
| :------: | ------------------------ |
|  **C**   | _SS05_                   |
|  **D**   | _SS06_                   |
|  **A**   | _HS07, SS07_             |
|  **B**   | _HS08, SS08_             |
|  **J**   | _HS12_                   |
| _hidden_ | _HS13, HS14, USR1, USR2_ |

If you want to map your USB ports yourself,  use [Hackintool](https://github.com/headkaze/Hackintool) and follow this instructions:

- The required **`USBInjectAll.kext`** is supplied but it's disabled in **`config.plist`**. You can **enable it** and **disable `USBPorts.kext`** to map the ports:
```diff
	<dict>
		<key>Comment</key>
		<string></string>
		<key>MaxKernel</key>
		<string></string>
		<key>PlistPath</key>
		<string>Contents/Info.plist</string>
		<key>Enabled</key>
-		<false/>
+		<true/>
		<key>MinKernel</key>
		<string></string>
		<key>ExecutablePath</key>
		<string>Contents/MacOS/USBInjectAll</string>
		<key>Arch</key>
		<string>Any</string>
		<key>BundlePath</key>
		<string>USBInjectAll.kext</string>
	</dict>
	<dict>
		<key>Comment</key>
		<string></string>
		<key>MaxKernel</key>
		<string></string>
		<key>PlistPath</key>
		<string>Contents/Info.plist</string>
		<key>Enabled</key>
-		<true/>
+		<false/>
		<key>MinKernel</key>
		<string></string>
		<key>ExecutablePath</key>
		<string></string>
		<key>Arch</key>
		<string>Any</string>
		<key>BundlePath</key>
		<string>USBPorts.kext</string>
	</dict>
```
- **Reboot** and **use Hackintool to test USB ports you want to use** (using a pendrive or other USB 2.0 device). **Take note** on what ports you **do not want** to use.
- Include in `boot-args` on **`config.plist`** the parameter `uia_exclude` to disable the ports you do not want. **Example below will exclude 2 USB 2.0 ports named HS03 and HS04**:
```
uia_exclude=HS03;HS04
```
- **Reboot** and do the step above again, **until you have only 15 ports** active. As example, my final boot-args directive was like this:

```
uia_exclude=HS07;HS08;HS12;HS13;HS14;USR1;USR2;SS05;SS06;SS07;SS08
```
- After that, export the **`USBPorts.kext`** using Hackintool and place it on **`Kexts`** folder. 
- Remind to **disable** **`USBInjectAll.kext`** and **enable `USBPorts.kext`** in **`config.plist`** and remove **`uia_exclude`** directive from `boot-args`:
```diff
	<dict>
		<key>Comment</key>
		<string></string>
		<key>MaxKernel</key>
		<string></string>
		<key>PlistPath</key>
		<string>Contents/Info.plist</string>
		<key>Enabled</key>
+		<false/>
-		<true/>
		<key>MinKernel</key>
		<string></string>
		<key>ExecutablePath</key>
		<string>Contents/MacOS/USBInjectAll</string>
		<key>Arch</key>
		<string>Any</string>
		<key>BundlePath</key>
		<string>USBInjectAll.kext</string>
	</dict>
	<dict>
		<key>Comment</key>
		<string></string>
		<key>MaxKernel</key>
		<string></string>
		<key>PlistPath</key>
		<string>Contents/Info.plist</string>
		<key>Enabled</key>
+		<true/>
-		<false/>
		<key>MinKernel</key>
		<string></string>
		<key>ExecutablePath</key>
		<string></string>
		<key>Arch</key>
		<string>Any</string>
		<key>BundlePath</key>
		<string>USBPorts.kext</string>
	</dict>
```
 
### DRM Support

If **you require full DRM support**, you must choose [other SMBIOS](#other-smbios) that provide it.

### Power Management

The **MacPro7,1** SMBIOS redirect all graphics processing to dedicated graphics card (your AMD GPU). This can increase graphics processing and bypass DRM issues. But in real life, **MacPro uses Intel Xeon** CPUs and **power management may not work for your Intel Cofee Lake** or other CPUs. 

You can use [CPUFriendFriend](https://github.com/corpnewt/CPUFriendFriend) to generate a new **CPUFriendDataProvider.kext** file to your needs.

> **TIP!**
_Just for your record, when running **CPUFriendFriend** I choose base clock **0B** (1100Mhz), Performance **00** and Bias **01** options. This enable my MacPro7,1 SMBIOS to sleep well with my hardware. You may need to test what values are more appropriated for your hardware._

### Sleep and Hibernate
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

To **verify the current values** on your computer and **see what services are preventing the system to sleep**, use the following command:
```bash
pmset -g live
```

The commands above **works on a real Mac** computer too, if you want deep sleeps just follow the same steps.

### Power button
You know that **Power Button can turn on and wake the computer** from Sleep and Hibernate modes. But you can make the Power Button **works for turn off the display and sleep like a real Mac too** with the following command:
```bash
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool yes
```

### ABNT2 keyboard
To make your brazilian **ABNT2 keyboard** default when Install MacOS, change language and keyboard layout in your **`config.plist`** inside **NVRAM** key section:
```xml
<key>prev-lang:kbd</key>
<string>pt-BR:128</string>
```

## Final comments

After all you will can boot MacOS, Windows and Recovery **just like a real Mac** computer:
- Hold **Option** key (or **ESC** key) to show boot menu _(if you hide it)_;
- Press **Space Bar** on boot menu to show advanced options _(like NVRAM reset)_;
- Use **System Preferences > Startup** disk to change boot to Windows and **BootCamp Control Panel** on Windows to change the boot to Mac;
- Update your Mac using the **Apple Software Updates**;
- Remind [update OpenCore](https://dortania.github.io/OpenCore-Post-Install/universal/update.html) **before** update MacOS.

## Build images

**NVMe drive installation on z370N WiFi Motherboard**

![NVMe](/images/nvme.png)

**WiFi/Bluetooth NGFF card replacement (replace original Intel with Apple BCM94360CS2)**

![NVMe](/images/bt1.png)

![NVMe](/images/bt2.png)

![NVMe](/images/bt3.png)

**Logitech Unifying dongle on HS11 internal port inside the case**

![NVMe](/images/usb1.png)

![NVMe](/images/usb2.png)


[![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?username=elieserme)](https://github.com/anuraghazra/github-readme-stats)
