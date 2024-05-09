#!/usr/bin/env python
"""
Prints the canonical source path to the CWD, and the subtrees at each level
from the full canonical path down to just the basename. The result can be piped
through fzf to select what level of canon path to use for setting a tmux window
title.
"""
import os
import re

full_cwd = os.getcwd()
canon_cwd = re.sub(r'.*/source/github.com/', '//', full_cwd)

print(canon_cwd)

canon_dirs = canon_cwd.split('/')[2:]
canon_dirs = list(filter(lambda x: len(x), canon_dirs))

for idx in range(len(canon_dirs)):
    title = '...' + os.path.join('/', *canon_dirs[idx:])
    print(title)

print(canon_dirs[-1])
