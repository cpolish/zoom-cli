#!/bin/bash
if [ "$#" -ne 0 ]
then
	case "$1" in
		join)
			if [ -n "$2" ]
			then
				open "zoommtg://zoom.us/join?confno=$2"
			else
				echo "zoom: join: requires meeting ID specified" >&2
			fi
			;;
		open)
			open -a zoom.us ;;
		-h|--help|help) printf "%s\n" \
			"Usage:" \
			"  zoom [command] <arguments>" \
			"" \
			"Available commands:" \
			"  join - join a Zoom meeting with a specified meeting ID" \
			"  open - open the zoom app" \
			"  -h, --help, help - display this help menu"
			;;
		*)
			echo "zoom: error: invalid command, see 'zoom -h' for a list of commands" >&2
	esac
else
	printf "%s\n" \
		"Usage:" \
		"  zoom [command] <arguments>" \
		"" \
		"Available commands:" \
		"  join - join a Zoom meeting with a specified meeting ID" \
		"  open - open the zoom app" \
		"  -h, --help, help - display this help menu"
fi
