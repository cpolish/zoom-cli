#!/bin/bash

func_help="\
Usage:\n\
  zoom [command] <arguments>\n\
\n\
Available commands:\n\
  join - join a Zoom meeting with a specified meeting ID\n\
  open (currently only on macOS) - open the zoom app\n\
  -h, --help, help - display this help menu\
"

if [[ $(uname) == "Darwin" ]]
then
	open_link=open
	open_app=$(open -a zoom.us)
else
	open_link=xdg-open
	open_app=$(echo "zoom: open: sorry, currently this only supports macOS")
fi

if [[ $# != 0 ]]
then
	case "$1" in
		join)
			if [ -n "$2" ]
			then
				$open_link "zoommtg://zoom.us/join?confno=$2"
			else
				echo "zoom: join: requires meeting ID specified" >&2
			fi
			;;
		open)
			$open_cmd -a zoom.us ;;
		-h|--help|help)
			echo $func_help ;;
		*)
			echo "zoom: error: invalid command, see 'zoom -h' for a list of commands" >&2
	esac
else
	echo $func_help
fi
