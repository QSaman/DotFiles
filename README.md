# How to Install

First we need to install [rcm](https://github.com/thoughtbot/rcm).

## Fedora

```
$ sudo dnf install rcm
```

## Ubuntu

```
$ sudo apt install rcm
```

For other platforms refer to the official [site](https://github.com/thoughtbot/rcm).

# Usage

It is recommended to clone this repository to `~/.dotfiles`:

```
git clone https://github.com/QSaman/DotFiles.git ~/.dotfiles
```

Then create `~/.rcrc` file with the following content. Feel free to change it according to your preferences:

```
TAGS="vim tmux bash"
EXCLUDES="README.md LICENSE"
```

For more information run `man rcrc`. Then run the following command:

```
$ rcup -d "$PWD" -v
```

Finally make sure to source `~/.my_shellrc`. For `bash` add the following line to `~/.bashrc`:

```
. "$HOME"/.my_shellrc
```

For `zsh` you should use `~/.zshrc` instead.

# References

* [Fedora magazine](https://fedoramagazine.org/managing-dotfiles-rcm/).
* [Official page](https://github.com/thoughtbot/rcm)
