# Hugo Marotta's Dotfiles

My personal configuration files for Linux.

## Installation

> [!NOTE]
> Some configuration files use hardcoded paths under `/home/humtta`. If your
> home directory is different, create a symbolic link that points to it:
>
> ```sh
> sudo ln -s "$HOME" /home/humtta
> ```

First, clone the repository where you intend to keep it:

```sh
git clone https://github.com/humtta/dotfiles
```

Then, run the setup script from the cloned directory:

```sh
./setup.sh
```

The setup script creates symbolic links to the files in this repository. If you
move or rename the cloned directory, these links will break. To fix them, run
the setup script again.

## License

This project is licensed under the [MIT License].

[mit license]: LICENSE.md
