#!/bin/bash
echo ""
echo "- - - - - - - - Running Kali Update  1/8 - - - - - - - -"
echo ""
sudo apt-get update -y
echo ""
echo "- - - - - - - - Installing Ubertooth1 Libraries 2/8 - - - - - - - -"
echo ""
sudo apt-get install cmake libusb-1.0-0-dev make gcc g++ libbluetooth-dev pkg-config python3-numpy python3-qtpy -y
sudo pip install pyside2
echo ""
echo "- - - - - - - - Creating a Folder - UB1  3/8 - - - - - - - -"
echo ""
mkdir UB1
cd UB1
pwd
echo ""
echo "- - - - - - - - Installing and Configuring the UB1  4/8 - - - - - - - -"
echo ""
wget https://github.com/greatscottgadgets/ubertooth/releases/download/2020-12-R1/ubertooth-2020-12-R1.tar.xz
tar -xf ubertooth-2020-12-R1.tar.xz
cd ubertooth-2020-12-R1/host
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig
echo ""
echo "- - - - - - - - Installation Of Bluetooth baseband Decoding Library  5/8 - - - - - - - -"
echo ""
cd /home/kali/UB1/
pwd
wget https://github.com/greatscottgadgets/libbtbb/archive/2020-12-R1.tar.gz -O libbtbb-2020-12-R1.tar.gz
tar -xf libbtbb-2020-12-R1.tar.gz
cd libbtbb-2020-12-R1
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig
#echo ""
#echo "- - - - - - - - Installation Of Wireless Bluetooth baseband Decoding Library  6/10 - - - - - - - -"
#echo ""
#cd /home/kali/UB1/
#pwd
#sudo apt-get install wireshark wireshark-dev libwiretap-dev libwireshark-dev cmake
#cd libbtbb-2020-12-R1/wireshark/plugins/btbb
#mkdir build
#cd build
#cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu/wireshark/libwireshark3/plugins ..
#make
#sudo make install
#echo ""
#echo "- - - - - - - - Installation Of BR/EDR plugin  7/10 - - - - - - - -"
#echo ""
#cd /home/kali/UB1/
#pwd
#cd libbtbb-2020-12-R1/wireshark/plugins/btbredr
#mkdir build
#cd build
#cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu/wireshark/libwireshark3/plugins ..
#make
#sudo make install
echo ""
echo "- - - - - - - - Ubertooth Successfully Installed!!  6/8 - - - - - - - -"
echo "- - - - - - - - Detecting the Ubertooth 1.....  7/8 - - - - - - - -"
echo ""
lsusb
echo ""
echo "- - - - - - - - Updating the Firmware 8/8 - - - - - - - -"
echo ""
cd /home/kali/UB1/ubertooth-2020-12-R1/ubertooth-one-firmware-bin
sudo ubertooth-dfu -d bluetooth_rxtx.dfu -r
sudo ubertooth-util -v
echo ""
echo "- - - - - - - - Ubertooth Ready to use - - - - - - - -"
echo ""
