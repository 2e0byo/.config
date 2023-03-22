# `.config`

Everyone puts their dotfiles up on github, it seems, so here are mine.

Mostly for my own benefit, some docs:

## Policy

Only tools which are (i) are meaningfully shared between disparate machines,
possibly running different distros and (ii) contain no private data go in here.
In practice this means mostly coding tools.

## Rationale

*Nearly* everything can use `$XDG_CONFIG_DIR` these days, so my old solution of
a `dotfiles` repo and then `stow` was getting cumbersome.  Moreover blindly
`stow`ing everything isn't the best approach: it's worth reading config files
carefully before syncing them.  Many are just ephemeral.

## Local Variations

Create `file.hostname.ext`, symlink to `file.hostname` and make sure the symlink
is `gitignore`d.  Then use diff/patch :D  This is easier and quicker than the
config merger you really *want* to write, and it probably works better too.

## Avoiding shared private state

Much as you might *think* you want share e.g. browsing history, you don't.  It's
far more hassle than it's worth, git isn't the right tool, and the files aren't
designed to be used that way.

If you really want to do that kind of thing, use dropbox.

## Deploying

Clone this repo, examine it and manually symlink for any hostname-specific
files, update `.gitignore`, and go.

## License

These config files are in the public domain.
