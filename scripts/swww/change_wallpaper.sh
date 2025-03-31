#!/usr/bin/bash


# Constants
WALLPAPER_CACHE_DIRECTORY=~/.koru-dotfiles
WALLPAPER_DIRECTORY=~/Pictures/wallpapers

setWallpaper() {
    swww img "$1" --transition-type wipe --transition-angle 30 --transition-fps 60 --transition-duration 1;
}

setCache() {
    echo "$1" > $WALLPAPER_CACHE_DIRECTORY/wallpaper-cache.txt;
}

main() {

    # if the wallpaper switch should be done forward or backward (previous/next).
    reverse=false

    # count of correct files in the wallpaper directory
    count=$(ls $WALLPAPER_DIRECTORY/*.{jpeg,jpg,png,gif,pnm,tga,tiff,webp,bmp,farbfeld} 2>/dev/null | wc -l)

    # the previous wallpaper cached in the wallpaper-cache.txt file
    cache_value=$(cat $WALLPAPER_CACHE_DIRECTORY/wallpaper-cache.txt);

    # returns if there is no correct file in the wallpaper directory
    if [ "$count" -lt 1 ]; then 
        notify-send -u critical "Wallpaper changer" "Sowy >_<, I couldn't change your wallpaper because you don't have any wallpaper in\n\n $WALLPAPER_DIRECTORY"
        return
    elif [ "$count" -lt 2 ]; then
        notify-send -u low "Wallpaper changer" "Sowy... but... I couldn't change your wallpaper because you only have one wallpaper in\n\n$WALLPAPER_DIRECTORY"
        return
    fi

    if [[ $1 == "reverse" ]]; then
        reverse=true;
    fi

    WALLPAPERS=();
    NEXT_ONE=false;
    if [[ -z $cache_value ]]; then
        NEXT_ONE=true;
    fi

    for file in $WALLPAPER_DIRECTORY/*.{jpeg,jpg,png,gif,pnm,tga,tiff,webp,bmp,farbfeld}; do
        if [ -f "$file" ]; then
            WALLPAPERS+=("$file")

            if ( ! $reverse ); then
                if $NEXT_ONE; then
                    setCache "$file";
                    setWallpaper "$file";
                    return
                fi

                if [[ "$file" == "$cache_value" ]]; then
                    NEXT_ONE=true;
                fi
            fi
        fi
    done



    if ( $reverse ); then
        last_index=$(($count-1))
        for i in $(eval echo {"$last_index"..0}); do
            file=${WALLPAPERS[$i]};
            if $NEXT_ONE; then
                setCache "$file";
                setWallpaper "$file";
                return
            fi

            if [[ "$file" == "$cache_value" ]]; then
                NEXT_ONE=true;
            fi
        done

        setCache ${WALLPAPERS[-1]}
        setWallpaper ${WALLPAPERS[-1]}
        return
    fi

    setCache ${WALLPAPERS[0]}
    setWallpaper ${WALLPAPERS[0]}

}

main $1