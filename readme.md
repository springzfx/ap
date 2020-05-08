Simple wireless access point, support both ipv4 and ipv6 with private address using nat.

Access point and wifi connection can coexist, if your wireless network support. 

Tested with `Intel AC 9260`.

For technique detail, see arch wiki [Software access point](https://wiki.archlinux.org/index.php/Software_access_point).

----

Configure file locate at `/etc/ap/ap.conf`

To start:

```bash
sudo ap
# or using systemd
sudo systemctl start ap
```

To install:

```bash
yay -S ap-git
```





