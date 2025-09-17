# Hackintosh

> **It's the End of Times for Hackintosh.**
We knew this day would come. _Hackintosh is dead. Long live to the Hackintosh!_ But we'll see the sun rise for the Hackintosh one last time with **MacOS Tahoe**.

This is the guide for **OpenCore 1.0.5** Hackintosh build based on i7 9700KF | ASUS B360-G Gaming | Radeon RX 6600XT | 32GB RAM | running **MacOS 26.0 Tahoe** like an **Mac Pro** _(MacPro7,1 SMBIOS)_ **with Multiboot support** _(Windows, MacOS and Linux ext4/btrfs)_.

## Table of Contents

- [Hackintosh](#hackintosh)
	- [Table of Contents](#table-of-contents)
	- [Warning](#warning)
	- [Why use Mac Pro model](#why-use-mac-pro-model)
	- [Hardware](#hardware)
	- [BIOS settings](#bios-settings)
	- [MacOS 15 Sequoia setup](#macos-15-sequoia-setup)
	- [USB Ports](#usb-ports)
	- [Sleep](#sleep)
	- [Windows Notes](#windows-notes)
	- [Final Steps](#final-steps)
	- [Cleaning the EFI](#cleaning-the-efi)

## Warning 
**Please read** the [OpenCore Guide](https://dortania.github.io/OpenCore-Install-Guide/) to **understand the process** and make any changes if you require different settings.

> **Warning!**
Custom configuration for this _specific motherboard, graphics card and NVMe listed below_. If your computer's components are different, **DO NOT USE THIS CONFIGURATION AND MAKE YOUR OWN ONE ACCORDING TO YOUR HARDWARE**.

> **Important!**
After the initial installation of macOS Tahoe, please **do not restart your computer**. Disable FileVault first, wait for the disk to be fully decrypted, and then restart your computer.

> **Audio**
Motherboard audio has been **disabled** on MacOS Tahoe. Please use monitor audio with HDMI or DisplayPort.

## Why use Mac Pro model
- **The last standing Intel's desktop Macintosh**
- **AMD GPU** for full performance;
- **h264** and **h265** video **encoding** and **decoding** working;
- **No DRM issues** _(you can use Apple TV+ and Safari for Netflix and PrimeVideo)_.

## Hardware

|       Type       | Item                                                                                                                                                                                             |
| :--------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|     **CPU**      | **[Intel i7 9700KF](https://www.intel.com.br/content/www/br/pt/products/sku/190885/intel-core-i79700kf-processor-12m-cache-up-to-4-90-ghz/specifications.html)** 9th gen 8 core 3,6GHz with Turbo Boost up to 4,9GHz          |
| **Motherboard**  | **[ASUS ROG STRIX B360-G Gaming](https://rog.asus.com/motherboards/rog-strix/rog-strix-b360-g-gaming-model/)** Micro ATX                                                                                                |
|     **RAM**      | **2 x [Kingston KVR26N19D8/16](https://www.kingston.com/datasheets/KVR26N19D8_16.pdf)** 16GB DDR4 2666MHz _(native jedec speed without XMP profile)_                                                                   |
|     **GPU**      | **[Sapphire RX 6600XT 8GB](https://www.sapphiretech.com/en/consumer/pulse-radeon-rx-6600-xt-8g-gddr6)** Dedicated Video Card                                                                         |
|     **NVMe**     | **[WD Black SN750](https://www.westerndigital.com/pt-br/products/internal-drives/wd-black-sn750-nvme-ssd#WDS250G3X0C)** 1TB PCIe NVMe _(for Windows and Games)_ and 500GB PCIe NVMe _(for MacOS)_                                               |
|     **Bluetooth**     | **[TP-Link UB400 version 1.0](https://www.tp-link.com/en/home-networking/bluetooth-adapter/ub400/)** Bluetooth 4.0 USB adapter _(connected to HS07 USB port as internal)_                                               |
|     **HDD RAID**      | **2 x [Seagate BarraCuda ST2000DM008-2FR102](https://www.seagate.com/br/pt/products/hard-drives/barracuda-hard-drive/)** 2TB HDD 3.5" in RAID 1 _(backups)_                                               |
|     **SSD**      | **[WD Green SATA SSD](https://documents.westerndigital.com/content/dam/doc-library/pt_br/assets/public/western-digital/product/internal-drives/wd-green-ssd/data-sheet-wd-green-ssd-2879-800083.pdf)** 480GB SSD 2.5" _(for Linux)_                                               |
|  **Coolers**  | **[Montech DT24](https://www.montechpc.com/en/products_detail.php?nid=299&s_ok2=)** CPU air cooler<br />**3 x [Fractal Aspect 12](https://www.fractal-design.com/products/fans/aspect/aspect-12/black/)** 120mm silent air case cooler _(System Fan 1, 2 and 2b)_                                                                                                      |
| **Power Supply** | **[Super Flower LEADEX III GOLD 850W](https://www.super-flower.com.tw/ja/products/leadex-iii-gold-850w)**  _(use **[this link](https://outervision.com/power-supply-calculator)** to calculate your power supply need)_                                           |
|     **Case**     | **[Fractal Pop Mini Silent](https://www.fractal-design.com/products/cases/pop/pop-mini-silent/black-tg-clear/)** Very silent Micro ATX case                |

## BIOS settings

ASUS ROG STRIX B360-G Gaming using **BIOS version 3101** settings for MacOS:

- Exit &gt; **Load optimised defaults**
- Advanced &gt; Platform Misc Configuration &gt; PCI Express Native Power Management &gt; **Enabled**
- Advanced &gt; Platform Misc Configuration &gt; Native ASPM &gt; **Enabled**
- Advanced &gt; Platform Misc Configuration &gt; PCH DMI ASPM &gt; **Auto**
- Advanced &gt; Platform Misc Configuration &gt; ASPM 0 &gt; **Auto**
- Advanced &gt; Platform Misc Configuration &gt; L1 Substates &gt; **Disabled**
- Advanced &gt; Platform Misc Configuration &gt; PCI Express Clock Gating &gt; **Enabled**
- Advanced &gt; Platform Misc Configuration &gt; DMI Link ASPM Control &gt; **Disabled**
- Advanced &gt; Platform Misc Configuration &gt; PEG - ASPM &gt; **Auto**
- Advanced &gt; CPU Configuration &gt; Software Guard Extensions (SGX) &gt; **Disabled**
- Advanced &gt; CPU Configuration &gt; Intel (VMX) Virtualization Technology &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; Intel SpeedStep &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; Intel SpeedShift Technology &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; Turbo Mode &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; CPU C-states &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; Enhanced C-states &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; Intel SpeedStep &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; CPU C3 Report &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; CPU C6 Report &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; CPU C7 Report &gt; **CPU C7s**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; CPU C8 Report &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; CPU C9 Report &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; CPU C10 Report &gt; **Enabled**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; Package C State Limit &gt; **Auto**
- Advanced &gt; CPU Configuration &gt; CPU Power Management Control &gt; CFG Lock &gt; **Disabled**
- Advanced &gt; System Agent (SA) Configuration &gt; VT-d &gt; **Enabled**
- Advanced &gt; PCH Configuration &gt; System Time and Alarm Source &gt; **ACPI Time and Alarm Device**
- Advanced &gt; PCH Storage Configuration &gt; SATA Mode Selection &gt; **AHCI**
- Advanced &gt; Onboard Devices Configuration &gt; Serial Port Configuration &gt; **Off**
- Advanced &gt; PCI Subsystem Settings &gt; Above 4G Decoding &gt; **Enabled**
- Advanced &gt; PCI Subsystem Settings &gt; Re-Size BAR Support &gt; **Auto**
- Advanced &gt; PCI-FW Configuration &gt; TPM Device Selection &gt; **PTT**
- Advanced &gt; Trusted Computing &gt; Secure Device Support &gt; **Enabled**
- Advanced &gt; USB Configuration &gt; XHCI Hand-off &gt; **Enabled**
- Boot &gt; CSM (Compatibility Support Module) &gt; Launch CSM &gt; **Disabled**
- Boot &gt; Secure Boot &gt; OS Type &gt; **Other OS**
- Boot &gt; Fast Boot &gt; **Disabled**
- Exit &gt; **Save Changes & Reset**
  
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
- **ROM** is the Mac address of the **en0** network adapter _(Intel i219v gigabit port)_. Use the **Network Settings > Advanced > Hardware** panel to copy the Mac address _(only numbers and letters, without the : chars)_;
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
- Mount the **EFI partition** of the **USB** disk with **[MountEFI](https://github.com/corpnewt/MountEFI/zipball/master/)** utility and **copy your EFI folder** to **`/Volumes/EFI`**
- **Boot** the target machine with **USB** disk you just made
- Use **Clear NVRAM** and reboot to make a clean install
- Use **Disk Utility** to erase a **APFS GUI** volume and **install MacOS**
- Finish **normal** MacOS setup

## USB Ports

The included **`USBMap.kext`** with USB mapping is for the **ASUS ROG STRIX B360-G Gaming and MacPro7,1 SMBIOS only** with all extenal **USB 3** ports enabled.

Keep in mind that **you have to choose what ports to enable**, because **MacOS has a 15 logical ports limit** and each port has 2 logical ports _(one physical port has one USB 2 and one USB 3 personality... so **2 logical ports for each USB 3.0 port**)_.

![Motherboard](/images/motherboard.png)

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

## Windows Notes
  
**Drivers** for this motherboard are below:

- **Download [Intel INF Driver](https://raw.github.com/elieserme/hackintosh/main/b360-g/drivers/DRV_Chipset_Intel_TP_W11_64_V101188368283_20211022R.zip)** _**(required)**_
- **Download [Latest AMD Graphics Driver](https://www.amd.com/pt/support/graphics/amd-radeon-6000-series/amd-radeon-6600-series/amd-radeon-rx-6600-xt)** _**(required)**_
- Download [Apple TimeCapsule Driver](https://raw.github.com/elieserme/hackintosh/main/b360-g/drivers/AirPortSetup.exe) _(optional)_

> **TimeCapsule on Windows:**
To use TimeCapsule driver, first enable the **SMB 1.0/CIFS** on Windows (use the _**Turn Windows features on or off**_ dialog for this). The same apply if you have a Windows file server that will be accessed by a MacOS machine or vice-versa.

If you experience difference in date & time on Windows, it's necessary make Windows work on GMT time using the following command:

```bash
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_QWORD /f
```

To increase Windows performance you can disable Downfall mitigations:

```bash
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 33554432 /f
```

You also can **Turn off Memory Integrity on Windows 11** to avoid problems on Opencore boot _(and increase gamming performance)_:

- Select **Start**, enter ‘**Core Isolation**’ in the taskbar, and select **Core Isolation** from the list of results to open the Windows security app;
- On the **Core isolation** page, _**turn off** the toggle_ for **Memory Integrity**. You might need to restart the computer. 

## Final Steps

The EFI folder configuration already comes with SecureBootModel disabled by default. After successfully installing MacOS you can enable these options as below.

> **MacOS Updates:**
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

