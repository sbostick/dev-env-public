#!/bin/bash
#
# NOTE: window names are arbitrary but I prefer the unified namespace syntax.
# NOTE: (i.e. the apparent path structure is just a convention)
#
# REMINDER(attach session): tmux at -d -t "session-name"
# REMINDER(kill session): tmux kill-session "session-name"
# REMINDER(kill session): ctrl-a : kill-session
set -eu

function tmux_enable_session_pane_titles {
  set -g pane-border-status top
}

function tmux_set_pane_title {
  # enables pane referencing by title, as opposed to index
  name="$1"
  select-pane -t "$name:1.1" -T foo
}

function tmux_display_message {
  name="$1"
  tmux display -t "$name" "hello."
}

function tmux_session_exists {
  name="$1"
  tmux has-session -t "$name" 2>/dev/null
}

function tmux_kill_session {
  name="$1"
  tmux kill-session -t "$name"
}


# __MAIN__
session="sb-2023"
position=0

if tmux_session_exists "$session"; then
    echo "Session [$session] already exists"
else
    cd /tmp
    tmux new-session -d -s "$session"
    tmux setw -t "$session" -g mouse on

    ((position+=1))
    window="SCRATCH"
    tmux rename-window -t "${position}" "${window}"
    tmux select-window -t "${session}:1"
    tmux select-pane -t "${session}:1.1"
    tmux send-keys -t "${session}:${window}.1" -l 'clear'

    ((position+=1))
    window="//sbostick/dev-env-public"
    tmux new-window -a -t "${position}" -n "${window}"
    tmux send-keys -t "${session}:${window}.1" -l 'cd ~/source/github.com/sbostick/dev-env-public/; clear'
    tmux select-pane -t "${session}:${window}.1"

    ((position+=1))
    window="//example.com/foo"
    tmux new-window -a -t "${position}" -n "${window}"
    tmux send-keys -t "${session}:${window}.1" -l 'cd ~/source/github.com/example-com/foo/; clear'
    tmux select-pane -t "${session}:${window}.1"

    ((position+=1))
    window="//example.com/bar"
    tmux new-window -a -t "${position}" -n "${window}"
    tmux send-keys -t "${session}:${window}.1" -l 'cd ~/source/github.com/example-com/bar/; clear'
    tmux select-pane -t "${session}:${window}.1"

    terminal_features="256,title,mouse"
    tmux select-window -t "${session}:1"
    tmux select-pane -t "${session}:1.1"
    tmux -T "${terminal_features}" -vv attach-session -d -t "$session"
fi
