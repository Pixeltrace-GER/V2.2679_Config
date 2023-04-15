cd /home/pi/klipper_config
git fetch
git checkout master
git pull
git checkout -b patch-from-printer
git merge master
git add .
git commit -m "Update $(date +"%Y%m%d-%H%M%S")"
git push --set-upstream origin patch-from-printer
git checkout master
git checkout -d patch-printer