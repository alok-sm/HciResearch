# check if user is sudo.
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run with sudo" 1>&2
   exit 1
fi

# stop screen recorder
touch stop_screen_recorder

# stop key stroke monitor
touch key_stroke_watcher/stop_key_stroke_watcher

while [ ! -f ~/Movies/$(cat session.txt).mov ]
do
  sleep 2
done


mv ~/Movies/$(cat session.txt).mov output/$(cat session.txt)/screen_recording.mov

sudo chown -R $(cat user.txt) results/*
