#!/bin/sh
streamkeys &

function running {
	ps ax | grep $1 | grep -v grep > /dev/null
}

if ! running mplayer; then
	mplayer -fps 3 -tv quality=10:driver=v4l2:width=640:height=480:fps=5:outfmt=i420:device=/dev/video0 -vo caca tv:// &
fi

if ! running obs; then
	obs &
fi
