# Espanso

> Espanso is a cross-platform Text Expander written in Rust.

## Download

You can download Espanso from [official site](https://espanso.org/install/).

## Supported systems

- macOS
- Windows
- Linux

## How To Use

### Folder Structure

```shell
├── README.md
├── default.yml
├── lib
│   └── fake.rb
└── user
    ├── emoji.yml
    ├── git.yml
    ├── math.yml
    └── scripts.yml
```

### Steps

1. Clone this repo
   
   ```shell
   git clone https://github.com/tinng81/decent-macOS.git && cd espanso
   ```
2. Determine Espanso Configuration Paths
   
   ```shell
   espanso path
   ```

Configurations are stored differently by OS:
- Linux: `$XDG_CONFIG_HOME/espanso` (e.g. `/home/user/.config/espanso`)

- macOS: `$HOME/Library/Preferences/espanso` (e.g. `/Users/user/Library/Preferences/espanso`)

- Windows: `{FOLDERID_RoamingAppData}\espanso` (e.g. `C:\Users\user\AppData\Roaming\espanso`)

3. Copy to your local Espanso config directory
   
   ```shell
   # Default location on macOS
   mv * /Users/<user>/Library/Preferences/espanso
   ```

4. Restart Espanso by double-click <kbd>Option ⌥</kbd> or manually from the topbar

## Features

### default.yml

> Arrows, macOS Navigation & Modifier Keys and extra remarks ¯\\_(ツ)_/¯.

### emoji.yml

> Emoji from multiple sources.

### git.yml

> Routine commands work with Source Control Git.

### math.yml

> Greeks Symbols and Mathematic Notations

### scripts.yml

> Timestamp, Date, String Manipulation, IP Addresses, Fake Info Generator and current Finder Window path.

## Notes

- [scripts.yml](###scripts.yml) requires at least `Python2` installed and can be detected by typing `which python` in Terminal. 

- [scripts.yml](###scripts.yml) contains custom `ruby` script: `fake.rb`. The called script is stored in `./lib/`.

- Be sure to append `default.yml` instead of mistakenly replace your local file.

## License

MIT © Tin Nguyen
