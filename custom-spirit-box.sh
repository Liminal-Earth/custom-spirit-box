while [[ $(mplayer -shuffle -playlist playlist.txt -delay -10 -volume 100 >/dev/null 2>&1) -eq 0 ]]; do sleep 1; done
