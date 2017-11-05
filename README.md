<p align="center">
    <a href="https://www.gitdvcs.com">
        <img src="https://cdn.rawgit.com/dvcs/gitdvcs.com/master/.github/gitdvcs.svg" />
    </a>
    <br>
    <small>Git is a distributed version control system</small>
</p>
<br>
<p align="center">
    <a href="https://github.com/dvcs/gitdvcs.com/blob/master/LICENSE.md"><img src="https://img.shields.io/github/license/dvcs/gitdvcs.com.svg?style=flat-square" alt="license"></a>
</p>


### Prerequisites

Install On macOS

```sh
brew update && brew install hugo

# Update ulimit
sudo sysctl -w kern.maxfiles=65536
sudo sysctl -w kern.maxfilesperproc=65536
ulimit -n 65536 65536

# Install rsync 3
brew instal rsync

# Install HTML XML Utils
brew install html-xml-utils

# Parallel
brew install parallel

# Pandoc
brew install pandoc

# Pygments
pip install Pygments

```


Install On Linux

```sh

# Update ulimit
sudo sysctl -w kern.maxfiles=65536
sudo sysctl -w kern.maxfilesperproc=65536
ulimit -n 65536 65536

# Install HTML XML Utils
sudo apt-get install html-xml-utils

# Pygments
sudo apt-get install python3-pygments
```


### Bootstrapping

The bootstrap process synchronizes all of the documentation from kernel.org's source of git documentation, sanitizes the output and then places the data in the websites scafolding.

```sh
cd scripts
./bootstrap.sh
```

### Publish

`publish.sh` publishes the website to GitHub using the gh-pages branch

```sh
cd scripts
./publish.sh
```

### Run

Run Locally

```sh
hugo server
```