Overview
--------

Resources related to my personal development environment.


Key Bindings
------------

    +-------------------------------------------------------------------------+
    |                   OS/DESKTOP LEVEL                                      |
    +-------------------------------------------------------------------------+
    caps-lock                   # MacOS remapped to ESC
    ctrl + {left,right}         # MacOS switch to another virtual desktop
    ctrl + {up,down}            # MacOS expose for desktop, app; respectively
    cmd + shift + {}            # MacOS switch to another application tab

    +-------------------------------------------------------------------------+
    |                   TERMINAL LEVEL                                        |
    +-------------------------------------------------------------------------+
    shift + {left,right}        # Tmux switch window
    ctrl + {h,j,k,l}            # Tmux switch pane
    prefix + {h,j,k,l}          # Tmux resize pane

    +-------------------------------------------------------------------------+
    |                   APPLICATION LEVEL                                     |
    +-------------------------------------------------------------------------+
    option + {h,j,k,l}          # Vim switch window
    {left,right}                # Vim switch tab
    ctrl + n                    # Vim open nerdtree (from command mode)

    NOTE: Always send arrow keys to app level (required for some curses apps).
    NOTE: Always reserve {up,down} for app level menu selection (e.g. the vim
          CtrlP plugin)
    NOTE: Vim is configured on MacOS to copy visual selection with ctrl-c


Source Code Pro Fonts
---------------------

* https://github.com/adobe-fonts/source-code-pro/releases/tag/variable-fonts
* Install via homebrew (see .zshrc)


Setup GitHub commit signing
---------------------------

* https://help.github.com/articles/checking-for-existing-gpg-keys/
* https://help.github.com/articles/generating-a-new-gpg-key/
* https://help.github.com/articles/telling-git-about-your-signing-key/
* https://help.github.com/articles/signing-commits/
* Set GPG\_TTY env var in bashrc
* Add aliases to gitconfig
* Add gpg key to GitHub
