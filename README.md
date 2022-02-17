# How to Install

You need to install `rcm` first.

## Fedora

```
$ sudo dnf install rcm
```

## Ubuntu

```
$ sudo apt install rcm
```

# Use the Dot Files

It's not mandatory but it's recommended to clone the repo like this:

```
git clone https://github.com/QSaman/DotFiles.git ~/.dotfiles
```

Then create the `~/.rcrc` with the following content. Feel free to change it according to your preferences. For more information run `man rcrc`.

```
TAGS="vim tmux bash"
EXCLUDES="README.md LICENSE"
```

Then run the following command:

```
$ rcup -d "$PWD" -v
```

After it make sure to source `~/.my_shellrc`. For Bash add the following line to `~/.bashrc`:

```
. "$HOME"/.my_shellrc
```

For `zsh` you should use `~/.zshrc` instead.

# References

* [Fedora magazine](https://fedoramagazine.org/managing-dotfiles-rcm/).
