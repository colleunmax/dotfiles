#!/usr/bin/env bash

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

wallpapers_directory="../wallpapers"
cache_directory="."
current_wallpaper=""
new_wallpaper=""
wallpapers=()

if ! [[ -e "$DIR/$cache_directory/wallpaper.cache.txt" ]]; then
  touch "$DIR/$cache_directory/wallpaper.cache.txt"
fi

if ! [[ -d "$DIR/$wallpapers_directory" ]]; then
  mkdir -p "$DIR/$wallpapers_directory"
fi

current_wallpaper=$(cat "$DIR/$cache_directory/wallpaper.cache.txt")

wallpapers=$(ls "$DIR/$wallpapers_directory")

found=false
end_of_directory=true

IFS=$'\n'
for file in $wallpapers; do
  if [[ $file == $current_wallpaper ]]; then
    found=true
  elif $found; then
    new_wallpaper=$file
    end_of_directory=false
    break
  fi
done

if $end_of_directory; then
  first_wallpaper=""
  read -r -a first_wallpaper <<< $wallpapers
  new_wallpaper=$first_wallpaper
fi

swww img "$DIR/$wallpapers_directory/$new_wallpaper" --transition-type outer --transition-bezier .60,0,1,1 --transition-duration 1 --transition-fps 60
echo -n $new_wallpaper > $DIR/$cache_directory/wallpaper.cache.txt