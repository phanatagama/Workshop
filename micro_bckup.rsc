# oct/10/2019 13:20:37 by RouterOS 6.44.5
# software id = PCSY-WL58
#
# model = RB952Ui-5ac2nD
# serial number = 92490A7FE526
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
add authentication-types=wpa-psk,wpa2-psk eap-methods="" \
    management-protection=allowed mode=dynamic-keys name=mikrotik \
    supplicant-identity="" wpa-pre-shared-key=ilkomunej2019 \
    wpa2-pre-shared-key=ilkomunej2019
/interface wireless
set [ find default-name=wlan2 ] band=5ghz-a/n/ac disabled=no frequency=5785 \
    security-profile=mikrotik ssid=MTCNA
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/ip address
add address=192.168.28.254/24 interface=ether2 network=192.168.28.0
/ip dhcp-client
add dhcp-options=hostname,clientid disabled=no interface=wlan2
/ip dns
set allow-remote-requests=yes
/ip firewall nat
add action=masquerade chain=srcnat out-interface=wlan2
/system clock
set time-zone-name=Asia/Jakarta
