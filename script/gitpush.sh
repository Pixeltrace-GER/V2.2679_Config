cd /home/pi/klipper_config
git fetch
git checkout patch-from-printer
git add -u
git commit -m "Update $(date +"%Y%m%d-%H%M%S")"
git push --set-upstream origin patch-from-printer