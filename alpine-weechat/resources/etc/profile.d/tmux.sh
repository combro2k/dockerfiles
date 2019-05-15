if test $TMUX; then
	LC_ALL=c exec /usr/bin/weechat 
elif tmux has-session -t WeeChat 2>/dev/null; then
	tmux attach -t WeeChat
	exit
else
	tmux new -s WeeChat
	exit
fi
