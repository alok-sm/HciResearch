# check if user is sudo.
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run with sudo" 1>&2
   exit 1
fi

# start file watcher
file_watcher/start_filetracer.sh $(cat meta/session.txt) > raw_data/$(cat meta/session.txt)/filetrace.txt 2> /dev/null &

# start screen and window recorder
su - $(cat meta/user.txt) -c -m "cd $(pwd); osascript screen_recorder/screen_record.applescript $(cat meta/session.txt) 2> raw_data/$(cat meta/session.txt)/window_positions.txt" &

# start key logger
cd key_stroke_watcher
sudo python keylog.py > ../raw_data/$(cat ../meta/session.txt)/keylog.json &

