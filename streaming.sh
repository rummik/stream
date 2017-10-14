#!/bin/bash

running() {
	ps ax | grep $1 | grep -v grep > /dev/null
}

if ! running screenkey; then
	screenkey &
fi

if ! running vlc; then
	vlc -I dummy 'v4l2:///dev/video1:fps=12:width=640:height=400' --video-filter='adjust{contrast=1.7}' -V aa
fi

if ! running obs; then
	obs
fi
