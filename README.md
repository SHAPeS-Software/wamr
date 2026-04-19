![WAMR Logo](/assets/wamr.png)

# WhereAreMyRepos (WAMR)

*Version 0.1.0*

*License MIT*

---

A fast, cross-platform tool to find all Git repositories on your system.

## Why?

Ever forget where you cloned that one repo? WAMR scans directories and shows you every Git repository it finds.

It's fast because it uses native shell commands (`find` on Unix/macOS, PowerShell on Windows) instead of pure Ruby filesystem traversal.

**"Why not just write a shell script?"**

I don't know Bash or PowerShell well enough, and I don't want to maintain separate scripts for each platform. Ruby gives me cross-platform compatibility with shell-level speed.

## Installation

```bash
gem install wamr
```

## Usage

**Scan a specific directory:**
```bash
$ wamr ~/projects
[1] /home/user/projects/website/
[2] /home/user/projects/cool_thing/
[3] /home/user/projects/old_experiment/

Total Git repositories found: 3
```

**Scan current directory:**
```bash
$ wamr
[1] /home/user/projects/cool_thing/

Total Git repositories found: 1
```

**Search inside a hidden directory:**
```bash
$ wamr ~/.config
[1] /home/user/.config/nvim/

Total Git repositories found: 1
```

By default, WAMR skips hidden directories (like `.local`, `.cache`) unless you explicitly target them.

## Requirements

- Ruby 4.0.2 or higher
- Linux/macOS
- Windows: PowerShell (built-in on Windows 7+)

## Contributing

I'm new to open source, so:
- I might be slow to respond to issues/PRs
- I might not accept every contribution
- Be patient with me while I learn the ropes

That said, bug reports and suggestions are welcome!
