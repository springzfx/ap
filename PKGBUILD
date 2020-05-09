# Maintainer: Fancy Zhang <springzfx@gmail.com>
# pkgbase=ap
pkgname=ap
pkgver=1.1
pkgrel=1
pkgdesc="simple wireless ap support both ipv4 and ipv6 with nat"
arch=('x86_64')
url="https://github.com/springzfx/ap"
license=('GPL')
depends=('hostapd'  'dnsmasq')
optdepends=('systemd: for service')

source_x86_64=(
"ap.sh"
"ap.conf"
"ap.service"
"dnsmasq-template.sh"
"hostapd-template.sh"
"iptables-add.sh"
"iptables-del.sh"
"ap.resume"
)
md5sums_x86_64=('SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP')

backup=('etc/ap/ap.conf')

package_ap(){
    install -d ${pkgdir}/usr/lib/systemd/system/ ${pkgdir}/etc/ap/ ${pkgdir}/usr/share/ap/ ${pkgdir}/usr/bin/ \
               ${pkgdir}/usr/lib/systemd/system-sleep/
    install -m 444 ap.service ${pkgdir}/usr/lib/systemd/system/
    install -m 544 ap.sh ${pkgdir}/usr/bin/ap
    install -m 644 ap.conf ${pkgdir}/etc/ap/
    install -m 444 iptables-add.sh iptables-del.sh dnsmasq-template.sh hostapd-template.sh ${pkgdir}/usr/share/ap/
    install -m 544 ap.resume ${pkgdir}/usr/lib/systemd/system-sleep/
}
