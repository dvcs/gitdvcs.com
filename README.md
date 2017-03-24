# Git


### Prerequisites

Install On macOS

```sh
brew update && brew install hugo

# Update ulimit
sudo sysctl -w kern.maxfiles=65536
sudo sysctl -w kern.maxfilesperproc=65536
ulimit -n 65536 65536

# Install HTML XML Utils
brew install html-xml-utils

# Parallel
brew install parallel

# Pandoc
brew install pandoc

# Pygments

```


Install On Linux

```sh

# Update ulimit
sudo sysctl -w kern.maxfiles=65536
sudo sysctl -w kern.maxfilesperproc=65536
ulimit -n 65536 65536

# Install HTML XML Utils
sudo apt-get install html-xml-utils
```

Run Locally

```sh
hugo server
```

### Bootstrapping


