#!/bin/sh

case ${MONS_NUMBER} in
    1)
        mons -o
        feh --no-fehbg --bg-fill "${HOME}/Yandex.Disk/morning-light1600x1200.jpg"
        ;;
    2)
        mons -s
        feh --no-fehbg --bg-fill "${HOME}/Yandex.Disk/morning-light1600x1200.jpg" \
                       --bg-fill "${HOME}/Yandex.Disk/morning-light1600x1200.jpg"
        ;;
    *)
        # Handle it manually
        ;;
esac
