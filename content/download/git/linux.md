---
Title: Linux
Downloads:
- Git
Preview: /img/download/linux.png
Description: "It is easiest to install Git on Linux using the preferred package manager of your Linux distribution. If you prefer to build from source, you can find the tarballs on kernel.org."
Site: https://www.kernel.org/pub/software/scm/git/
Platforms:
- Title: Linux
  URL: https://www.kernel.org/pub/software/scm/git/
Price: "Free"
---

- Debian/Ubuntu

	{{< highlight bash >}}
$ apt-get install git
{{< / highlight >}}

- Fedora

	{{< highlight bash >}}
$ yum install git # Up to Fedora 21
{{< / highlight >}}

	{{< highlight bash >}}
$ dnf install git # Fedora 22 and later
{{< / highlight >}}

- Gentoo

	{{< highlight bash >}}
$ emerge --ask --verbose dev-vcs/git
{{< / highlight >}}

- Arch Linux

	{{< highlight bash >}}
$ pacman -S git
{{< / highlight >}}

- openSUSE

	{{< highlight bash >}}
$ zypper install git
{{< / highlight >}}

- Mageia

	{{< highlight bash >}}
$ urpmi git
{{< / highlight >}}

- FreeBSD

	{{< highlight bash >}}
$ pkg install git
{{< / highlight >}}

- OpenBSD

	{{< highlight bash >}}
$ pkg_add git
{{< / highlight >}}

- Alpine

	{{< highlight bash >}}
$ apk add git
{{< / highlight >}}
