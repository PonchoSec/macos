macOS VM Installation

## Creating Installation Media
### Downloading the Installers

This process requires downloading the Installer app for the target OS you want to run in the VM. This can be done through the Apple App Store:

macOS Monterey (12): https://apps.apple.com/us/app/macos-monterey/id1576738294

macOS Big Sur (11) https://apps.apple.com/app/macos-big-sur/id1526878132

macOS Catalina (10.15) https://apps.apple.com/ug/app/macos-catalina/id1466841314

### Creating an ISO image

To install macOS into a virtual machine, we need an ISO image that we can attach to the VM’s virtual CD-ROM/DVD-ROM drive.

This process works the same for all three versions of macOS listed in the download section, but the examples use Monterey specifically. It requires running commands in a terminal.

### Create a temporary disk image: 
`sudo hdiutil create -o /tmp/installer -size 16384m -volname MacOSInstaller -layout SPUD -fs HFS+J`

### Attach the disk image: 
`sudo hdiutil attach /tmp/installer.dmg -noverify -mountpoint /Volumes/MacOSInstaller`

### Run the `createinstallmedia` script from within the installer app: 
`sudo /Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/MacOSInstaller --nointeraction`

### When that command finishes, you will have a new installer volume mounted named after the installer app. Force unmount it: 
`hdiutil eject -force /Volumes/Install\ macOS\ Monterey`

### Now we can convert the dmg image to an ISO: 
```
hdiutil convert /tmp/installer.dmg -format UDTO -o ~/Desktop/installMonterey
mv ~/Desktop/installMonterey.cdr ~/Desktop/installMonterey.iso
sudo rm -f /tmp/installer.dmg
```
