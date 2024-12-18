# Hackintosh

This is the guide for **OpenCore 1.0.3** Hackintosh build based on i7 9700KF | Gigabyte Z370N WIFI | Radeon RX 6600XT | 32GB RAM | running **MacOS 15.2 Sequoia** like an **iMac Pro**!

## Table of Contents

- [Hackintosh](#hackintosh)
	- [Table of Contents](#table-of-contents)
	- [Warning](#warning)
	- [Why use iMac Pro model](#why-use-imac-pro-model)
	- [Hardware](#hardware)
	- [BIOS settings for Windows](#bios-settings-for-windows)
	- [Windows 11 setup](#windows-11-setup)
	- [BIOS settings for MacOS](#bios-settings-for-macos)
	- [MacOS 15 Sequoia setup](#macos-15-sequoia-setup)
	- [USB Ports](#usb-ports)
	- [Sleep](#sleep)
	- [Final Steps](#final-steps)
	- [Cleaning the EFI](#cleaning-the-efi)
	- [Dual Boot](#dual-boot)

## Warning 
**Please read** the [OpenCore Guide](https://dortania.github.io/OpenCore-Install-Guide/) to **understand the process** and make any changes if you require different settings.

> **Warning!**
Custom configuration for this _specific motherboard, graphics card and NVMe listed below_. If your computer's components are different, **DO NOT USE THIS CONFIGURATION AND MAKE YOUR OWN ONE ACCORDING TO YOUR HARDWARE**.

## Why use iMac Pro model
- **AMD GPU** for full performance;
- **h264** and **h265** video **encoding** and **decoding** working;
- **No DRM issues** _(you can use Apple TV+ and Safari for Netflix and PrimeVideo)_.

## Hardware

|       Type       | Item                                                                                                                                                                                             |
| :--------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|     **CPU**      | **[Intel i7 9700KF ](https://www.intel.com.br/content/www/br/pt/products/sku/190885/intel-core-i79700kf-processor-12m-cache-up-to-4-90-ghz/specifications.html)** 9th generation 8 core 3,6GHz with Turbo Boost up to 4,9GHz          |
| **Motherboard**  | **[Gigabyte Z370N WiFi 1.0](https://www.gigabyte.com/br/Motherboard/Z370N-WIFI-rev-10#kf)** Mini ITX                                                                                                |
|     **RAM**      | **2 x [Kingston KVR26N19D8/16](https://www.kingston.com/datasheets/KVR26N19D8_16.pdf)** 16GB DDR4 2666MHz _(native jedec speed without XMP profile)_                                                                   |
|     **GPU**      | **[Sapphire RX 6600XT 8GB](https://www.sapphiretech.com/en/consumer/pulse-radeon-rx-6600-xt-8g-gddr6)** Dedicated Video Card                                                                         |
|   **Wireless**   | **[Intel AC 8265NGW](https://www.intel.com.br/content/www/br/pt/products/sku/94150/intel-dual-band-wirelessac-8265/specifications.html)** WiFi and Bluetooth PCIe card onboard |
|     **NVMe**     | **[WD Black SN750](https://www.westerndigital.com/pt-br/products/internal-drives/wd-black-sn750-nvme-ssd#WDS250G3X0C)** 500GB PCIe NVMe _(for MacOS,  on the top of the motherboard)_  <br /> **[WD Black SN750](https://www.westerndigital.com/pt-br/products/internal-drives/wd-black-sn750-nvme-ssd#WDS250G3X0C)** 1TB PCIe NVMe _(for Windows 11 and gamming, on the back of the motherboard)_                                                    |
|     **HDD**      | **2 x [Seagate BarraCuda ST2000DM008-2FR102](https://www.seagate.com/br/pt/products/hard-drives/barracuda-hard-drive/)** 2TB HDD 3.5"                                               |
|  **Coolers**  | **[Montech DT24](https://www.montechpc.com/en/products_detail.php?nid=299&s_ok2=)** CPU cooler<br />**3 x [Fractal Aspect 12](https://www.fractal-design.com/products/fans/aspect/aspect-12/black/)** 120mm case cooler _(System Fan 1 and 2)_                                                                                                      |
| **Power Supply** | **[Super Flower LEADEX III GOLD 850W](https://www.super-flower.com.tw/ja/products/leadex-iii-gold-850w)**  _(use **[this link](https://outervision.com/power-supply-calculator)** to calculate your power supply need)_                                           |
|     **Case**     | **[Fractal Pop Mini Silent](https://www.fractal-design.com/products/cases/pop/pop-mini-silent/black-tg-clear/)** Micro ATX and Mini ITX support                                                                                                             |

> **Memory Note!**
**Do not use memory with speed beyond 2666MHz** or **XMP Profile** on this motherboard, because it have issues with **USB** and **Audio** on MacOS.

> **Config Note!**
**RC6 Render Standby** option is missing on this motherboard BIOS when installed a _Intel CPU with F suffix (no iGPU)_. This option need to be **DISABLED** for system stability and avoid kernel panics (like NVMe errors). The opencore **forceRenderStandby=0** boot argument does the trick if missing this option on BIOS.

> **Network Note!**
The **Intel AT211 Ethernet is DISABLED** in MacOS, so you need to use the **Intel i219v Ethernet port** when using MacOS. On Windows both ethernet ports are functional.

## BIOS settings for Windows

Gigabyte z370N WIFI using **BIOS version F12**

- Save & Exit &gt; **Load optimised defaults**
- SmartFan &gt; System Fan 1 &gt; Fan Control Use Temperature Input &gt; **PCH**
- SmartFan &gt; System Fan 2 &gt; Fan Control Use Temperature Input &gt; **PCH**
- BIOS &gt; FastBoot &gt; **DISABLED**
- BIOS &gt; CSM Support &gt; **DISABLED**
- BIOS &gt; Windows 8/10 Features &gt; **Windows 8/10 WHQL**
- BIOS &gt; Secure Boot &gt; **ENABLED**
- Peripherals &gt; Initial Display Output &gt; **PCIe 1 Slot**
- Peripherals &gt; Above 4G Decoding &gt; **ENABLED**
- Peripherals &gt; Intel PTT &gt; **ENABLED**
- Peripherals &gt; SGX &gt; **DISABLED**
- Peripherals &gt; Trusted Computing &gt; **ENABLED**
- Peripherals &gt; SATA and RST Configuration &gt; SATA Mode Selection &gt; **AHCI**
- Peripherals &gt; SATA and RST Configuration &gt; Aggressive LPM Support &gt; **DISABLED**
- Peripherals &gt; USB Config &gt; Legacy &gt; **DISABLED**
- Peripherals &gt; USB Config &gt; XHCI Handoff &gt; **ENABLED**
- Peripherals &gt; USB Config &gt; Port 60/64 emulation &gt; **DISABLED**
- Chipset &gt; VT-d &gt; **ENABLED**
- Chipset &gt; Wake On Lan &gt; **DISABLED** _(remind to disable it on adapters too)_
- Power &gt; AC BACK &gt; **Always Off**
- Power &gt; ErP &gt; **DISABLED**
- Power &gt; Soft-Off by PWR-BTTN &gt; **Delay 4 Sec.**
- Power &gt; CEC 2019 Ready &gt; **DISABLED**
- Power &gt; Platform Power Management &gt; **ENABLED** _(enable child items **PEG**, **PCH** and **DMI ASPM**)_
- Save & Exit &gt; Save Profile &gt; **Windows** _(get the first entry and name it)_
- Save & Exit &gt; **Save & Exit Setup**

## Windows 11 setup

You can install **Windows 11** as usual. **Drivers** for this motherboard are below:

- **Download [Intel INF Driver](https://raw.github.com/elieserme/hackintosh/main/util/windows11/SetupChipset.exe)** _**(required)**_
- **Download [Latest AMD Graphics Driver](https://www.amd.com/pt/support/graphics/amd-radeon-6000-series/amd-radeon-6600-series/amd-radeon-rx-6600-xt)** _**(required)**_
- Download [Apple TimeCapsule Driver](https://raw.github.com/elieserme/hackintosh/main/util/windows11/AirPortSetup.exe) _(optional)_

> **TimeCapsule on Windows:**
To use TimeCapsule driver, first enable the **SMB 1.0/CIFS** on Windows (use the _**Turn Windows features on or off**_ dialog for this). The same apply if you have a Windows file server that will be accessed by a MacOS machine or vice-versa.

To **keep the date and time synchronized** when switching between MacOS and Windows, run the following command:

```bash
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_QWORD /f
```

You will want to **Turn off Memory Integrity on Windows 11** to avoid problems on Opencore boot _(and increase gamming performance)_:

- Select **Start**, enter ‘**Core Isolation**’ in the taskbar, and select **Core Isolation** from the list of results to open the Windows security app;
- On the **Core isolation** page, _**turn off** the toggle_ for **Memory Integrity**. You might need to restart the computer.

If you want a **cleaner installation of Windows 11**, you can run a script to do the cleanup _(be careful, for testing only)_ using [LeDragoX's scripts](https://github.com/LeDragoX/Win-Debloat-Tools). After running the script, you may want to get the **new desktop context menu back**. Use the command below to return it to normal:

```bash
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
```

To **keep your Windows drivers up to date**, Intel has a tool that can help _(it only works with Intel's basic motherboard drivers)_. You can download and install it from [Intel's website](https://www.intel.com/content/www/us/en/support/detect.html).

## BIOS settings for MacOS

- BIOS &gt; Secure Boot &gt; **DISABLED**
- Peripherals &gt; Intel PTT &gt; **DISABLED**
- Save & Exit &gt; Save Profile &gt; **MacOS** _(get the second entry and name it)_
- Save & Exit &gt; **Save & Exit Setup**
  
## MacOS 15 Sequoia setup

- Can be direct downloaded from Apple using **[App Store](https://www.apple.com/br/macos/macos-sequoia/)** on a regular MacOS computer; 
- Make a **USB** install disk _(the example below uses a USB device named USB and makes Sequoia installation disk)_:
```bash
sudo /Applications/Install\ macOS\ Sequoia.app/Contents/Resources/createinstallmedia --volume /Volumes/USB
```
- **Download** the **[git repo sources](http://github.com/elieserme/hackintosh/zipball/main/)** and use the **EFI** folder **or clone it** with following command:

```bash
git clone git@github.com:elieserme/hackintosh.git
```

Download the **[Python installer](https://www.python.org/downloads/)** and setup it to use the tools below.

Download **[ProperTree](https://github.com/corpnewt/ProperTree/zipball/master/)** to edit the **`config.plist`** file and change **PlatformInfo** values to your own machine:
- **MLB**, **SystemSerialNumber** and **SystemUUID** can be generated by downloading and use **[GenSMBIOS utility](https://github.com/corpnewt/GenSMBIOS/zipball/master/)**;
- Before use a generated **SystemSerialNumber**, check it on **[Apple Database](https://checkcoverage.apple.com)** _(If it is valid, generate another and repeat if necessary until find an invalid and unused one)_; 
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
		<string>iMacPro1,1</string>
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
- Mount the **EFI partition** of the **USB** disk with **[MountEFI](https://github.com/corpnewt/MountEFI/zipball/master/)** utility and **copy your EFI folder** to **`/Volumes/EFI`**
- **Boot** the target machine with **USB** disk you just made
- Using **Modified GRUB Shell** we must disable **CFG Lock** first with command below:
```bash
setup_var_3 0x5A4 0x00
```
**Please note that hardcoded value is for F11, F12, F13, F14a, F14b and F14 BIOS version of the Gigabyte z370N WIFI 1.0 motherboard, if you use another BIOS version or another motherboard model you need to [recalculate this value](https://dortania.github.io/OpenCore-Post-Install/misc/msr-lock.html)** _(this command must run every time that BIOS is reflashed or CMOS clear. Some other motherboards can disable CFG Lock on BIOS settings without this hack)_. 

- Use **Clear NVRAM** and reboot to make a clean install
- Use **Disk Utility** to erase a **APFS GUI** volume and **install MacOS**
- Finish **normal** MacOS setup

## USB Ports

The included **`USBMap.kext`** with USB mapping is for the **Gigabyte z370N WiFi 1.0 and iMacPro1,1 SMBIOS only** with some **USB 3** ports, one **USB type C** and one **internal Bluetooth USB** port enabled.

Keep in mind that **you have to choose what ports to enable**, because **MacOS has a 15 logical ports limit** and each port has 2 logical ports _(one physical port has one USB 2 and one USB 3 personality, and USB Type C has different ports for each side... so **2 logical ports per physical port**)_ and you have to **reserve a port for Bluetooth card**.

![Motherboard](/images/motherboard.png)

**List of the 15 ports ENABLED**:

| Label | Name               |  Type  | Comment                                                             |
| :---: | ------------------ | :----: | ------------------------------------------------------------------- |
| **I** | HS01, **SS01**     |  3  | _USB 2.0 & **3.1** front 1_                                         |
| **I** | HS02, **SS02**     |  3  | _USB 2.0 & **3.1** front 2_                                         |
| **F** | HS03, **SS03**     |  3  | _USB 2.0 & **3.1** rear 5_                                          |
| **G** | HS04, **SS04**     |  3  | _USB 2.0 & **3.1** rear 6_                                          |
| **C** | HS05               |   3    | _USB 2.0 rear 3_                                                    |
| **D** | HS06               |   3    | _USB 2.0 rear 4_                                                    |
| **E** | HS09               |   9    | _USB 2.0 only rear **Type C**_                                      |
| **H** | HS10               |  255   | _USB 2.0 **internal** (bluetooth)_                                  |
| **J** | HS11               |   3    | _USB 2.0 **internal** (wireless keyboard or mouse dongle)_          |
| **E** | **SS09**, **SS10** | 10 | _USB **3.1** only rear **Type C** (for each side of the connector)_ |

**List of ports DISABLED**:

|  Label   | Port                     | Comment                       |
| :------: | ------------------------ | ----------------------------- |
|  **C**   | _SS05_                   | _Only USB 2.0 active on HS05_ |
|  **D**   | _SS06_                   | _Only USB 2.0 active on HS06_ |
|  **A**   | _HS07, SS07_             | _Only to power my desklight_  |
|  **B**   | _HS08, SS08_             | _Only to power my soundbar_   |
|  **J**   | _HS12_                   | _Not used in macOS_           |
| _hidden_ | _HS13, HS14, USR1, USR2_ | _Not used in macOS_           |



## Sleep
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

## Final Steps

The EFI folder configuration already comes with SecureBootModel and WiFi and Bluetooth Kexts disabled by default. After successfully installing MacOS you can enable these options as below.

> **MacOS Update:**
Using Sonoma 14.4 and later, every time you update MacOS, you need to first disable SecureBootModel (Disabled). After the update, you can enable it again (Default). Please remind to **Clear NVRAM** each time you enable or disable this settings.

- Enable the **SecureBootModel** in **`config.plist`**:
```diff
	<key>SecureBootModel</key>
-	<string>Disabled</string>
+	<string>Default</string>
```

## Cleaning the EFI

- If you **do not want** the **Boot Menu**, disable it in **`config.plist`** to boot like a real Mac:
```diff
	<key>ShowPicker</key>
-	<true/>
+	<false/>
```

## Dual Boot

To switch between Windows and MacOS you must **enter the BIOS** and **change the Boot order** to the Windows or MacOS disk according to your choice and also **load the BIOS settings** profile depending on the operating system you are going to start:

- Save & Exit &gt; Load Profile &gt; **Windows** _or_ **MacOS**
- Save & Exit &gt; **Save & Exit Setup**

