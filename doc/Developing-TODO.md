### aus fsfw-uni-stick_build.sh

2016-10-21 13:22 gerdg-dd 092a2a1 # TODO: Skript Installation auf benötigte Pakete testen                                                                                                     
2016-10-21 13:22 gerdg-dd 092a2a1
2016-10-21 13:22 gerdg-dd 092a2a1 #       sudo grub2 parted dosfstools gzip syslinux-common wget dialog util-linux pandoc qemu live-build live-config-systemd live-boot                        
2016-10-21 13:22 gerdg-dd 092a2a1
2016-10-21 13:22 gerdg-dd 092a2a1 # Dialog welche Aufgaben sollen eredigt werden ? - default alle ?                                                                                           
2016-10-28 15:32 gerdg-dd db26de8 #
2016-10-28 15:32 gerdg-dd db26de8 #       FSFW_UNI_Stick_*.iso bauen (CD-Image)                                                                                                               
2016-10-21 13:22 gerdg-dd 092a2a1 #       Doku bauen und verteilen                                                                                                                            
2016-10-21 13:22 gerdg-dd 092a2a1 #       FSFW user config erstellen                                                                                                                          
2016-10-28 15:32 gerdg-dd db26de8 #       USB-Stick erstellen (komplettes Image mit WIN-DATEN und Persistence Partition)                                                                      
2016-10-28 15:32 gerdg-dd db26de8 #       Windows Programme copieren ( auf WIN-DATEN Partition )                                                                                              
2016-10-21 13:22 gerdg-dd 092a2a1 #

2016-10-21 13:22 gerdg-dd          092a2a1 # TODO:                                                                                                    
2016-10-21 13:22 gerdg-dd          092a2a1 #script doku_create.sh          # ../html/*  --> ../../FSFW-Uni-Stick/config/includes.chroot/var/www/       
2017-03-07 01:43 cknoll   cb13f09 # TODO: allgemeine Doku zu Progammen oder Funkionen des Live Systems --> doku_create.sh                              

2016-10-21 13:22 gerdg-dd 092a2a1 # TODO:
2016-10-21 13:22 gerdg-dd 092a2a1 # USB-Stick erstellen - Speichergerät partitionieren,formatieren - FSFW_UNI_Stick_*.iso schreiben
2016-10-21 13:22 gerdg-dd 092a2a1 # script mit $1 starten oder später abfrage ??
2016-10-21 13:22 gerdg-dd 092a2a1 # sudo ../tools/FSFW_-_USB-Stick_erstellen.sh $1
2016-10-21 13:22 gerdg-dd 092a2a1
2016-10-21 13:22 gerdg-dd 092a2a1
2016-10-21 13:22 gerdg-dd 092a2a1 # TODO:
2016-10-21 13:22 gerdg-dd 092a2a1 # Windows Programme downoad & copieren auf WIN-DATEN Partition
2016-10-21 13:22 gerdg-dd 092a2a1 # usb-live-linux/doc/src/windows.md     - anpassen [Programm] (download-path-programm.zip *.exe ..*.etc )
2016-10-21 13:22 gerdg-dd 092a2a1 #script win-daten_download.sh
2016-10-26 19:41 gerd     2cb3165 #script win-daten_copy.sh
2016-10-26 19:41 gerd     2cb3165 #
2016-10-26 19:41 gerd     2cb3165 
2016-10-26 19:41 gerd     2cb3165 # TODO:
2016-10-26 19:41 gerd     2cb3165 # Distibution / Verteilung Script
2016-10-26 19:41 gerd     2cb3165 # script Uni_Stick_distri.show
2016-10-26 19:41 gerd     2cb3165 #
2016-10-26 19:41 gerd     2cb3165 # pack USBImage (ZIP)
2016-10-26 19:41 gerd     2cb3165 # make Checksums (PGP, MD5, SHA256, SHA512)
2016-10-26 19:41 gerd     2cb3165 # create Torrent with Webseed
2016-10-26 19:41 gerd     2cb3165 # create Magnet Link

2016-10-28 10:27 tools/fsfw-user_config.sh fdbb6f4 # TODO: *.hlml  --> ../../FSFW-Uni-Stick/config/includes.chroot/var/www/             
mkdir -pv config/includes.chroot/var/www/FSFW-stick-doku
ln -svi /var/www/FSFW-stick-doku config/includes.chroot/etc/skel/FSFW-Material/stick-doku                                              

