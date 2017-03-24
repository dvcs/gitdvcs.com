---
Title: Linux
Downloads:
- Git
---

# Download `git` for Linux

It is easiest to install Git on Linux using the preferred package manager of your Linux distribution. If you prefer to build from source, you can find the tarballs on [kernel.org](https://www.kernel.org/pub/software/scm/git/).

### Debian/Ubuntu
`$ apt-get install git`

### Fedora
`$ yum install git` (up to Fedora 21)
`$ dnf install git` (Fedora 22 and later)

### Gentoo
`$ emerge --ask --verbose dev-vcs/git`

### Arch Linux
`$ pacman -S git`

### openSUSE
`$ zypper install git`

### Mageia
`$ urpmi git`

### FreeBSD
`$ pkg install git`

### Solaris 9/10/11 ([OpenCSW](https://www.opencsw.org))
`$ pkgutil -i git`

### Solaris 11 Express
`$ pkg install developer/versioning/git`

### OpenBSD
`$ pkg_add git`

### Alpine
`$ apk add git`

### Red Hat Enterprise Linux, Oracle Linux, CentOS, Scientific Linux, et al.
RHEL and derivatives typically ship older versions of git. You can download a tarball and build from source, or use a 3rd-party repository such as the IUS Community Project to obtain a more recent version of git.
