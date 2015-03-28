#!/bin/bash
cd ~/rails_projects/tl-intro-r-wd-lesson-1/
tmux start-server
tmux new-session -d -s itp1 -n workspace
tmux new-window -t itp1:2 -n irb
tmux new-window -t itp1:3 -n git
tmux send-keys -t itp1:2 "irb" C-m
tmux send-keys -t itp1:3 "git status" C-m
tmux select-window -t itp1:3
tmux attach-session -t itp1
