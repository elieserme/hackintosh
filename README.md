# Hackintosh

This is the guide for **OpenCore 0.7.2** with **Big Sur 11.5.1** for an **iMac19,2** hackintosh build.

## Table of Contents

- [Warning](#warning)
- [Why use iMac 19,2 model?](#why-use-imac-19-model)
- [Hardware](#hardware)
	- [BIOS settings](#bios-settings)
- [Windows 10](#windows-10)
- [MacOS 11 Big Sur](#macos-11-big-sur)
- [Post Install](#post-install)
	- [Windows and BootCamp](#windows-and-bootcamp)
	- [Cleaning the EFI](#cleaning-the-efi)
- [Other SMBIOS](#other-smbios)
	- [iMacPro](#imacpro)
	- [MacPro](#macpro)
- [Notes](#notes)
	- [USB Ports](#usb-ports)
	- [2nd Ethernet port](#2nd-ethernet-port)
	- [DRM Support](#drm-support)
	- [Power Management](#power-management)
	- [Sleep and Hibernate](#sleep-and-hibernate)
	- [ABNT2 keyboard](#abnt2-keyboard)
	- [Final comments](#final-comments)
- [My Build](#my-build)


## Warning 
**Please read** the [OpenCore Guide](https://dortania.github.io/OpenCore-Install-Guide/) to **understand the process** and make any changes if you require different settings.

## Why use iMac 19 model
- Native **Intel Cofee Lake** power management;
- **AMD GPU** and **iGPU** for balanced performance;
- **h264** and **h265** video **encoding** and **decoding** working;
- **Sidecar** working because **this iMac do not have T2 chip**;
- Note that are DRM issues with **Netflix**, **PrimeVideo** and **Apple TV+** in Big Sur until community finds a solution _(if you require DRM support, better use the iMacPro1,1 or MacPro7,1 SMBIOS and read this until the end for more information)_.

## Hardware

| Type | Item |
| ---- | ---- |
| **CPU** | [Intel i7 8700 ](https://www.intel.com.br/content/www/br/pt/products/processors/core/core-vpro/i7-8700.html) 8th generation 6 cores and 12 threads 3,2GHz with Turbo Boost up to 4,6GHz |
| **Motherboard** | [Gigabyte Z370N WiFi 1.0 ](https://www.gigabyte.com/br/Motherboard/Z370N-WIFI-rev-10#kf) Mini ITX |
| **RAM** | [G.SKILL 32GB ](https://www.gskill.com/product/165/326/1562838932/F4-3200C16D-32GTZN-Overview) DDR4 3200MHz F4-3200C16D-32GTZN |
| **SSD** | [Samsung EVO 970 Plus ](https://www.samsung.com/semiconductor/minisite/ssd/product/consumer/970evoplus/) 250GB PCIe NVMe |
| **Power Supply** | [Corsair CX550 Bronze ](https://www.corsair.com/br/pt/Categorias/Produtos/Unidades-de-fonte-de-alimentação/cx-series-config/p/CP-9020121-WW) 550W Unit |
| **GPU** | [Gigabyte Radeon RX 590 8GB 1.0](https://www.gigabyte.com/br/Graphics-Card/GV-RX590GAMING-8GD-rev-10#kf) Dedicated Video Card |
| **Wireless** | [BCM94360NG ](http://en.fenvi.com/en/download_zx.php) Bluetooth and WiFI replacement card |
| **Case** | [XIGMATEK Nebula C ](https://www.xigmatek.com/product_detail.php?item=63) Mini ITX |

### BIOS settings

Gigabyte z370N WIFI using BIOS version F14b

- **Load optimised defaults**
- MIT &gt; Advanced Memory Settings &gt; XMP &gt; **Profile 1**
- MIT &gt; Advanced CPU Core Settings &gt; Enhanced Multi-core Performance &gt; **ENABLED**
- SmartFan &gt; Fan Control Mode &gt; **PWM**
- BIOS &gt; FastBoot &gt; **DISABLED**
- BIOS &gt; CSM Support &gt; **DISABLED**
- BIOS &gt; Windows 8/10 Features &gt; **Windows 8/10 WHQL**
- Peripherals &gt; Above 4G Decoding &gt; **ENABLED**
- Peripherals &gt; Re-Size Bar &gt; **DISABLED**
- Peripherals &gt; Intel PTT &gt; **ENABLED**
- Peripherals &gt; SGX &gt; **Software Controlled**
- Peripherals &gt; Trusted Computing &gt; **ENABLED**
- Peripherals &gt; USB Config &gt; Legacy &gt; **DISABLED**
- Peripherals &gt; USB Config &gt; XHCI Handoff &gt; **ENABLED**
- Peripherals &gt; USB Config &gt; Port 60/64 emulation &gt; **DISABLED**
- Chipset &gt; VT-d &gt; **ENABLED**
- Chipset &gt; Internal Graphics &gt; **ENABLED** with **64MB** min and **256MB** max; 
- Chipset &gt; Wake On Lan &gt; **DISABLED** _(disable on adapters too)_
- Power &gt; ErP &gt; **ENABLED**
- Save and restart

#### MacOS only BIOS settings

If you **don't plan to install Windows 10 on dual boot or BootCamp**, you can change the following settings from above config:

- Peripherals &gt; Intel PTT &gt; **DISABLED**
- Peripherals &gt; SGX &gt; **DISABLED**
- Peripherals &gt; Trusted Computing &gt; **DISABLED**
- Chipset &gt; VT-d &gt; **DISABLED**

Remind to config **DisableIoMapper** to **`false`** in **`config.plist`** since you **disabled VT-d** setting:
```xml
<key>DisableIoMapper</key>
<false/>
```

## Windows 10

- If you plan to have Windows setup, it must be **installed first** on it's own disk;
- Use your **motherboard and AMD drivers** supplied. For **WIFI/Bluetooth** drivers, [download](http://en.fenvi.com/en/download_zx.php) from Fenvi.

## MacOS 11 Big Sur

- Can be direct downloaded from Apple using [App Store](https://apps.apple.com/br/app/macos-big-sur/id1526878132?mt=12) on a regular MacOS computer; 
- Make a **USB** install disk _(the example below uses a USB device named USB and makes Big Sur installation disk)_:
```bash
sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/USB
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
- Using **Modified GRUB Shell** we must disable **CFG Lock** first with command below, but **note that hardcoded value is for F14a/b BIOS version of the Gigabyte z370N WIFI 1.0 motherboard, if you use another BIOS version or another motherboard model you need to [recalculate this value](https://dortania.github.io/OpenCore-Post-Install/misc/msr-lock.html)** _(this command must run every time that BIOS is reflashed or CMOS clear. Please note that some other motherboards can disable CFG Lock on BIOS settings without this hack)_
```bash
setup_var_3 0x5A4 0x00
```
- Use **Clear NVRAM** and reboot to make a clean install
- Use **Disk Utility** to erase a **APFS GUI** volume and **install MacOS**
- Finish **normal** MacOS setup
- Install **App Store** applications, including **Xcode**
- Install [HomeBrew ](https://brew.sh) package management tool and run the **Scripts** for install tools _(can skip this step if you don't plan to use development tools)_
- System Preferences &gt; Software Updates &gt; **Uncheck**
- System Preferences &gt; General &gt; Show Scrollbars &gt; **When scrolling**
- System Preferences &gt; Notifications &gt; **Check disable between 22h and 7h**
- System Preferences &gt; Monitors &gt; NightShift &gt; **Sunset to Sunrise**
- System Preferences &gt; Security &gt; Privacy &gt; **Check system locations service**
- System Preferences &gt; Security &gt; **activate Filevalt**
- Finder &gt; Preferences &gt; Start in **Documents** folder
- Finder &gt; Preferences &gt; Show **Home Folder**
- Finder &gt; View &gt; Show **Status Bar**
- Desktop &gt; Right click &gt; **Use Stacks**

## Post install

### Windows and Bootcamp

- If you don't plan to install BootCamp drivers, you need patch registry for **time sync** with MacOS, run **regedit as Administrator** and go to `HKEY_LOCAL_MACHINE` &gt; `SYSTEM` &gt; `CURRENTCONTROLSET` &gt; `CONTROL` &gt; `TIMEZONEINFORMATION` and add the property **RealTimeIsUniversal** with value **DWORD=1**
- Or you can install **BootCamp** drivers with [Brigadier](https://github.com/timsutton/brigadier) utility **after MacOS installed** _(use this option if you plan to use Apple Magic Keyboard and Trackpad)_
```bash
git clone https://github.com/timsutton/brigadier
cd brigadier
brigadier -m iMac19,2 -i
```
- If your **Magic Trackpad don't appear in BootCamp Control Panel** in Windows, you will need to install the driver manually. Go to downloaded BootCamp drivers folder, find the Trackpad driver folder, **right click and install the driver inf file**. To complete the setup, **reboot Windows**.

> **IMPORTANT!**
One valid use of a Windows install is to **generate the files** on **`ACPI`** folder. You can follow [this guide](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-methods/ssdt-easy.html#so-what-can-t-ssdttime-do) on how to use SSDTTime tool to generate **`SSDT-AWAC.aml`**,  **`SSDT-HPET.aml`** and **`SSDT-PLUG.aml`** files _(or other ACPI files your specific motherboard need)_. The **`SSDT-EC-USBX.aml`** and **`SSDT-SBUS-MCHC.aml`** can be edited and compiled using **MaciASL** util. Sources are in **`other/acpi_src`** in this repo.

### Cleaning the EFI

- Remove all **Tools** from menu _(if you need this tools again you can use your USB disk to boot)_. Remove the **`Tools`** folder and edit your **`config.plist`** on following section and disable:
```diff
	<key>Tools</key>
	<array>
		<dict>
			<key>Comment</key>
			<string>OpenShell.efi<string>
			<key>Auxiliary</key>
			<true/>
			<key>Enabled</key>
-			<true/>
+			<false/>
			<key>Arguments</key>
			<string></string>
			<key>Path</key>
			<string>OpenShell.efi<string>
			<key>Name</key>
			<string>OpenShell.efi<string>
			<key>RealPath</key>
			<false/>
			<key>TextMode</key>
			<false/>
		</dict>
		<dict>
			<key>Comment</key>
			<string>modGRUBShell.efi<string>
			<key>Auxiliary</key>
			<true/>
			<key>Enabled</key>
-			<true/>
+			<false/>
			<key>Arguments</key>
			<string></string>
			<key>Path</key>
			<string>modGRUBShell.efi<string>
			<key>Name</key>
			<string>modGRUBShell.efi<string>
			<key>RealPath</key>
			<false/>
			<key>TextMode</key>
			<false/>
		</dict>
	</array>
```
**If you prefer and if you will not use the Tools**, you can completely remove the **Tools** by left it as an empty array:
```diff
	<key>Tools</key>
+	<array/>
-	<array>
-		<dict>
-			<key>Comment</key>
-			<string>OpenShell.efi<string>
-			<key>Auxiliary</key>
-			<true/>
-			<key>Enabled</key>
-			<true/>
-			<false/>
-			<key>Arguments</key>
-			<string></string>
-			<key>Path</key>
-			<string>OpenShell.efi<string>
-			<key>Name</key>
-			<string>OpenShell.efi<string>
-			<key>RealPath</key>
-			<false/>
-			<key>TextMode</key>
-			<false/>
-		</dict>
-		<dict>
-			<key>Comment</key>
-			<string>modGRUBShell.efi<string>
-			<key>Auxiliary</key>
-			<true/>
-			<key>Enabled</key>
-			<true/>
-			<false/>
-			<key>Arguments</key>
-			<string></string>
-			<key>Path</key>
-			<string>modGRUBShell.efi<string>
-			<key>Name</key>
-			<string>modGRUBShell.efi<string>
-			<key>RealPath</key>
-			<false/>
-			<key>TextMode</key>
-			<false/>
-		</dict>
-	</array>
```
- If you **not using iMacPro1,1 or MacPro7,1** SMBIOS, remove **`CPUFriend.kext`** and **`CPUFriendDataProvider.kext`** from **`Kexts`** folder and from **`config.plist`** too:
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
```
- If **not using iMacPro1,1** SMBIOS, remove the **`AGPMInjector.kext`** from the **`Kexts`** folder and from **`config.plist`** too:
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
-		<string></string>
-		<key>Arch</key>
-		<string>Any</string>
-		<key>BundlePath</key>
-		<string>AGPMInjector.kext</string>
-	</dict>
```
- If **not using MacPro7,1** SMBIOS, remove the **`RestrictEvents.kext`** from the **`Kexts`** folder and from **`config.plist`** too:
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
-		<string>Contents/MacOS/RestrictEvents</string>
-		<key>Arch</key>
-		<string>Any</string>
-		<key>BundlePath</key>
-		<string>RestrictEvents.kext</string>
-	</dict>
```
- Disable **Reset NVRAM** option in **`config.plist`** too:
```diff
	<key>AllowNvramReset</key>
-	<true/>
+	<false/>
```
- Disable **Boot Menu** in **`config.plist`** to work like a real Mac:
```diff
	<key>ShowPicker</key>
-	<true/>
+	<false/>
```

## Other SMBIOS

This build has some options:
- The **most hardware compatible** and working out-of-the-box is **iMac19,2** by default, but have DRM issues with Safari, Netflix, Prime Video, Apple TV+ and possible others;
- **iMacPro1,1** will have **DRM decoding fully working**; but loss SideCar because no T2 chip;
- **MacPro7,1** is more like a PC because you can **add GPUs and upgrade parts**. It will give you **full DRM support** and **best video processing speed**; but loss SideCar too because no T2 chip.

| SMBIOS | Advantage | Loss |
| ------ | --------- | ---- |
| **iMac19,2** | _**Native CPU power management, no T2 chip, GPU + iGPU with IQSV encoding, SideCar**_ | _DRM support on Safari, Apple TV+_ |
| **iMacPro1,1** | _Full DRM support, AppleTV+, AMD GPU encoding_ | _SideCar, Need `CPUFriend` for power management, lack of T2 chip, `APGMInjector` for GPU_ |
| **MacPro7,1** | **_Full DRM support, HDR display support, Netflix and Prime Video on Safari, AppleTV+, Fast AMD GPU encoding, more hardware upgrade options_** | _SideCar, Need `CPUFriend` for power management, lack of T2 chip, `RestrictEvents` for warning messages_ |

You can decide **what features are more important to your work and choice** the right SMBIOS. If you decide go to **iMacPro** or **MacPro** see instructions below.


### iMacPro

Use the MacPro1,1 SMBIOS if you **require full DRM support**. Follow the steps below:
- **Disable iGPU** in **BIOS** settings, changing **Chipset &gt; Internal Graphics** to **DISABLED** 
- Change **`config.plist`** and replace **SystemProductName** with iMacPro1,1:
```diff
	<key>SystemProductName</key>
-	<string>iMac19,2</string>
+	<string>iMacPro1,1</string>
```
- Generate a new **MLB**, **SystemSerialNumber** and **SystemUUID** for iMacPro1,1 using [GenSMBIOS utility](https://github.com/corpnewt/GenSMBIOS) and **replace this values** in your **`config.plist`**;
- **Remove this section** from your **`config.plist`** since you **don't have iGPU** anymore:
```diff
-	<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
-	<dict>
-		<key>AAPL,ig-platform-id</key>
-		<data>AwCSPg==</data>
-	</dict>
```
- Find and Enable **XHC1 to SHCI** patch in your **`config.plist`**:
```diff
	<key>Patch</key>
	<array>
		<dict>
			<key>Comment</key>
			<string>XHC1 to SHCI</string>
			<key>Count</key>
			<integer>0</integer>
			<key>Enabled</key>
-			<false/>
+			<true/>
			<key>Find</key>
			<data>WEhDMQ==</data>
			<key>Limit</key>
			<integer>0</integer>
			<key>Mask</key>
			<data></data>
			<key>OemTableId</key>
			<data></data>
			<key>Replace</key>
			<data>U0hDSQ==</data>
			<key>ReplaceMask</key>
			<data></data>
			<key>Skip</key>
			<integer>0</integer>
			<key>TableLength</key>
			<integer>0</integer>
			<key>TableSignature</key>
			<data></data>
		</dict>
	</array>
```
- Edit **`USBPorts.kext`** _(on Mac you need to right click and Show Package Contents, edit info.plist inside de Contents folder)_ and change in **two places** the new SMBIOS:
```diff
	<key>IOKitPersonalities</key>
	<dict>
-	<key>iMac19,2-XHC</key>
+	<key>iMacPro1,1-XHC</key>
```
and
```diff
	<key>model</key>
-	<string>iMac19,2</string>
+	<string>iMacPro1,1</string>
```
- **Copy** the **`CPUFriendDataProvider.kext`** from folder **`other/imacpro11`** in this repo to your **`Kexts`** folder
- **Enable** the **`AGPMInjector.kext`**, **`CPUFriend.kext`** and **`CPUFriendDataProvider.kext`** in your **`config.plist`** _(this kexts are supplied but disabled by default)_:
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
		<string></string>
		<key>Arch</key>
		<string>Any</string>
		<key>BundlePath</key>
		<string>AGPMInjector.kext</string>
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
```
- Remind to **Reset NVRAM** if you are changing from iMac19,2 running to new iMacPro1,1 **prior to reboot MacOS** _(if you need to generate your own `CPUFriendDataProvider.kext` see the apendix below for instructions)_

### MacPro

Use the MacPro7,1 SMBIOS if you **require full DRM support** and **best video production** acceleration. Follow the steps below:
- **Disable iGPU** in **BIOS** settings, changing **Chipset &gt; Internal Graphics** to **DISABLED** 
- Change **`config.plist`** and replace **SystemProductName** with MacPro7,1:
```diff
	<key>SystemProductName</key>
-	<string>iMac19,2</string>
+	<string>MacPro7,1</string>
```
- Generate a new **MLB**, **SystemSerialNumber** and **SystemUUID** for MacPro7,1 using [GenSMBIOS utility](https://github.com/corpnewt/GenSMBIOS) and **replace this values** in your **`config.plist`**;
- **Remove this section** from your **`config.plist`** since you **don't have iGPU** anymore:
```diff
-	<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
-	<dict>
-		<key>AAPL,ig-platform-id</key>
-		<data>AwCSPg==</data>
-	</dict>
```
- Edit **`USBPorts.kext`** _(on Mac you need to right click and Show Package Contents, edit info.plist inside de Contents folder)_ and change in **two places** the new SMBIOS:
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
- **Copy** the **`CPUFriendDataProvider.kext`** from folder **`other/macpro71`** in this repo to your **`Kexts`** folder
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
- Remind to **Reset NVRAM** if you are changing from iMac19,2 running to new MacPro7,1 **prior to reboot MacOS** _(if you need to generate your own `CPUFriendDataProvider.kext` see the apendix below for instructions)_.

## Notes 

### USB Ports

The included **`USBPorts.kext`** with USB mapping is for the **Gigabyte z370N WiFi 1.0 and iMac19,2 SMBIOS only** with some **USB 2 and 3** ports, no **USB type C** and one **internal Bluetooth USB** port enabled.

Keep in mind that **you have to choose what ports to enable**, because **MacOS has a 15 logical ports limit** and each port has 2 logical ports _(one physical port has one USB 2 and one USB 3 personality... so **2 logical ports per physical port**)_ and you have to **reserve a port for Bluetooth card**.

If you want to map your USB ports yourself, **please read** [this guide](https://www.tonymacx86.com/threads/the-new-beginners-guide-to-usb-port-configuration.286553/) for USB mapping using [Hackintool](https://github.com/headkaze/Hackintool).

Note that **you need Big Sur 11.2.3** to this guide work. **Later versions do not work** for port remapping. After reading the guide, follow this instructions:

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
- Enable **USB Ports Limit** quirk:
```diff
	<key>XhciPortLimit</key>
-	<false/>
+	<true/>
```
- **Follow the guide** and determine what ports you want to use _(must be 15 or less ports)_;
- Generate new **`USBPorts.kext`** using **Hackintool**, copy it to **`Kexts` folder** and **enable it** _(remind to disable `USBInjectAll.kext` and set XhciPortLimit to false again)_:
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

### 2nd Ethernet Port

Gigabyte Z370N WIFI **has two gigabit ethernet ports**. By default, only Intel i219 is enabled in **`config.plist`** but you can activate the second port _(Intel i211)_ by enable **`SmallTreeIntel82576.kext`** in your **`config.plist`**:

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
		<string>Contents/MacOS/SmallTreeIntel82576</string>
		<key>Arch</key>
		<string>Any</string>
		<key>BundlePath</key>
		<string>SmallTreeIntel82576.kext</string>
	</dict>
```
To have the fancy **name** of this ethernet port in **System Report**, you can inject the device name in properties inside **DeviceProperties**:
```xml
<key>PciRoot(0x0)/Pci(0x1C,0x5)/Pci(0x0,0x0)</key>
<dict>
	<key>model</key>
	<string>Intel I211 PCI Express Gigabit Ethernet</string>
</dict>
```

### DRM Support

The **iMac19,2** SMBIOS **need some hack to have DRM support** _(Netflix, Prime Video, Apple TV+)_:
- For **Catalina**, you need to add `shikigva=80` in your `boot-args` in **`config.plist`** file;
- For **Big Sur**, there are [no definitive solution](https://dortania.github.io/OpenCore-Install-Guide/extras/big-sur/#known-issues). But you can watch Apple TV+ using the commands below:
```bash
defaults write com.apple.AppleGVA gvaForceAMDKE -bool YES
defaults write com.apple.AppleGVA gvaForceAMDAVCEncode -bool YES
defaults write com.apple.AppleGVA gvaForceAMDAVCDecode -bool YES
defaults write com.apple.AppleGVA gvaForceAMDHEVCDecode -bool YES
```
- For error `VDADecoderCreate failed. err: -12473` in Big Sur, forcing the AMD Decoder can help resolve this:
```bash
defaults write com.apple.AppleGVA gvaForceAMDAVCDecode -bool YES
```
- If **you require full DRM support**, you must choose [other SMBIOS](#other-smbios) that provide it.

### Power Management

The **iMacPro1,1** and **MacPro7,1** SMBIOS redirect all graphics processing to dedicated graphics card (your AMD GPU). This can increase graphics processing and bypass DRM issues. But in real life, **iMacPro and MacPro uses Intel Xeon** CPUs and **power management may not work for your Intel Cofee Lake** or other CPUs. 

**Method 1:** This can be resolved using **`CPUFriend.kext`** and a **`CPUFriendDataProvider.kext`** _(frequency vectors)_ that are provided in repo for Cofee Lake CPUs. But if you need to generate this file yourself, you can use the [CPUFriendFriend](https://github.com/corpnewt/CPUFriendFriend) as described in [this guide](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#enabling-x86platformplugin).

**Method 2:** Another way is use the **Tools** that come with **`CPUFriend.kext`** to **generate `CPUFriendDataProvider.kext`** using the steps below on your MacOS:
 
- **Download** the [CPUFriend](https://github.com/acidanthera/CPUFriend) repo:
```bash
git clone git@github.com:acidanthera/CPUFriend.git
```
- Go inside the **`Tools`** folder;
- **Copy the relevant power management file from MacOS system**. In our case, we need **Cofee Lake** _(for i7 8700)_ so the best Mac model that fits the bill is **iMac19,2** _(you can search the model that match your processor if you use another generation)_. The file we need to copy is the **board-id** of Mac19,2 named **`Mac-63001698E7A34814.plist`** _(you must replace with board id of model you need)_:
```bash
sudo cp /System/Library/Extensions/IOPlatformPluginFamily.kext/Contents/PlugIns/X86PlatformPlugin.kext/Contents/Resources/Mac-63001698E7A34814.plist .
```
- Run the **`ResourceConverter.sh`** Tool using the **board-id file** that you copied to current folder:
```bash
sudo chmod +x ResourceConverter.sh
./ResourceConverter.sh -k Mac-63001698E7A34814.plist
```
- The file **`CPUFriendDataProvider.kext`** will be generated. Just **copy this file to your `Kext` folder in your EFI volume**, the same folder of **`CPUFriend.kext`** file _(remind to enable this kexts in config.plist)_

> **IMPORTANT!** On iMacPro1,1 SMBIOS if you need to generate a new `AGPMInjector.kext` for other GPU just use the [AGPMInjector app](#https://github.com/Pavo-IM/AGPMInjector) to generate this file and copy it to `Kexts`folder. 

### Sleep and Hibernate
Sometimes after sleep the computer will **wake every few minutes**. Normal Macs do this for several reasons, like updates and other devices near. If you require a deep sleep without random wakeups, use the commands below to **disable this features**:
```bash
sudo pmset proximitywake 0
```
If you want to control **how and when the computer hibernates** (save state and turn off) you need to customize some vars.

**Example 1:** Computer sleeps and hibernates 2 hours after sleep:
```bash
sudo pmset -a hibernatemode 3
sudo pmset -a standbydelaylow 7200
sudo pmset -a standbydelayhigh 7200
```
**Example 2:** Computer just hibernate instead of sleep (saves more power, but takes longer to wake):
```bash
sudo pmset -a hibernatemode 25
```
If you want to **restore the default** factory settings:
```bash
sudo pmset -a restoredefaults
```

The commands above **works on a real Mac** computer too, if you want deep sleeps just follow the same steps.

### ABNT2 keyboard
To make your brazilian **ABNT2 keyboard** default when Install MacOS, change language and keyboard layout in your **`config.plist`** inside **NVRAM** key section:
```xml
<key>prev-lang:kbd</key>
<string>pt-BR:128</string>
```

### Final comments

After all you will can boot MacOS, Windows and Recovery **just like a real Mac** computer:
- Hold **Option** key (or **ESC** key) to show boot menu;
- Use **System Preferences > Startup** disk to change boot to Windows and **BootCamp Control Panel** on Windows to change the boot to Mac;
- Update your Mac using the **Apple Software Updates**;
- Remind [update OpenCore](https://dortania.github.io/OpenCore-Post-Install/universal/update.html) **before** update MacOS.

## My Build 

For my build **I decided to go with iMac19,2** SMBIOS:
- **Fast Video render** using my GPU and iGPU;
- **SideCar, AirPlay, Handoff, Airdrop, iPhone Cellular Calls, SMS Forwarding and Universal Clipboard** working;
- Removed **`CPUFriend.kext`**, **`CPUFriendDataProvider.kext`**, **`AGPMInjector.kext`**, **`USBInjectAll.kext`** and **`SmallTreeIntel82576.kext`** from **`config.plist`** and delete from **`Kexts`** folder;
- Removed **Tools** as described [here](#cleaning-the-efi);
- Computer **sleep working** as a real Mac;
- **Disable boot menu** _(can be enabled using Option or ESC key on boot)_ like a real iMac;
- **Enabled boot chyme** sound, connecting speakers to LineOut on motherboard _(enabling volume controls on keyboard too, because real Macs do not control volume for HDMI ou DisplayPort connections)_;
- Apple **Magic Keyboard** and **Magic TrackPad** fully working on **MacOS**, **Windows 10** and even in **BIOS** settings _(press FN+F12 to enter BIOS setup)_ with **BootCamp** installed on Windows;
- I feel that I have an iMac!


[![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?username=elieserme)](https://github.com/anuraghazra/github-readme-stats)
