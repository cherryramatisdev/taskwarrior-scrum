# Taskwarrior Scrum

This binary is reponsible to read the files `~/.task/*.data` provided by [taskwarrior](https://taskwarrior.org/) and output with cool UIs for your different scrum rituals.

## Installation

You can download from the [release page](https://github.com/cherryramatisdev/taskwarrior-scrum/releases)

## Usage

Demo: https://github.com/cherryramatisdev/cherryramatisdev-taskwarrior-scrum/assets/86631177/efbd3c86-af5e-4ebe-a624-6ca48dab701d

Commands available with examples

- completed

```sh
taskwarrior-scrum completed
```

or with a specific date

```sh
taskwarrior-scrum completed 05/06/2023
```

- daily

```sh
taskwarrior-scrum daily
```

or with a specific date

```sh
taskwarrior-scrum daily 05/06/2023
```

- pending

```sh
taskwarrior-scrum pending
```

or with a specific date

```sh
taskwarrior-scrum pending 05/06/2023
```

- generate

```sh
taskwarrior-scrum generate --type=zsh # type can be zsh or bash
```

## Contributing

1. Fork it (<https://github.com/cherryramatisdev/taskwarrior-scrum/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Cherry Ramatis](https://github.com/cherryramatisdev) - creator and maintainer
