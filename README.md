<div align="center">

# asdf-glow [![Build](https://github.com/localdee/asdf-glow/actions/workflows/build.yml/badge.svg)](https://github.com/localdee/asdf-glow/actions/workflows/build.yml) [![Lint](https://github.com/localdee/asdf-glow/actions/workflows/lint.yml/badge.svg)](https://github.com/localdee/asdf-glow/actions/workflows/lint.yml)

[glow](https://github.com/charmbracelet/glow) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Install

Plugin:

```shell
asdf plugin add locald-glow https://github.com/localdee/asdf-glow.git
```

locald-glow:

```shell
# Show all installable versions
asdf list-all locald-glow

# Install specific version
asdf install locald-glow latest

# Set a version globally (on your ~/.tool-versions file)
asdf global locald-glow latest

# Now glow commands are available
glow --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/localdee/asdf-glow/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Rigger.dev](https://github.com/localdee/)
