# tmux chat session by luc

start-server
new-session -A -t chat
#if-shell '! tmux has-session -t chat' 'new-session -t chat'
#if-shell 'tmux has-session -t chat' 'attach-session -t chat'
