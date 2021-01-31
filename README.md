# Setting up a new linux server

## Adding non-root user

### Create new user

```bash
adduser <username>
```

### Add the new user to the sudo group

```bash
usermod -aG sudo <username>
```

## Disable password and root login 

modify `/etc/ssh/sshd_config`:

```
PasswordAuthentication no
PermitRootLogin No
```

## Install Git

```bash
sudo apt install git-all
```

## Install ZSH

run `sudo apt-get install zsh`

run `chsh`  (and enter `/usr/bin/zsh`)

## Install epegzz/linux-server

```bash
mkdir -p “$HOME/.config”
git clone https://github.com/epegzz/linux-server.git “$HOME/.config/linux-server
```
