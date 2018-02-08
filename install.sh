#!/bin/bash
wget https://raw.githubusercontent.com/kdauzickas/quack/master/quack.mp3 -O ~/.settings_rc

if [ "" != $(which mpg123) ]; then
    PLAY_COMMAND="mpg123 $HOME/.settings_rc"
fi

if [ "" != $(which cvlc) ]; then
    PLAY_COMMAND="cvlc --play-and-exit $HOME/.settings_rc"
fi

if [ "" != $(which play) ]; then
    PLAY_COMMAND="play -t mp3 $HOME/.settings_rc"
fi

if [ "" == "$PLAY_COMMAND" ]; then
    echo "No play command found"
    exit 1
fi

cat <(crontab -l) <(echo '*/15 * * * *  sleep $[ ( $RANDOM % 600 )  + 1 ]s && '$PLAY_COMMAND' > /dev/null 2>&1') | crontab