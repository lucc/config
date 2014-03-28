# fishrc
# vim: ft=fish

function fish_prompt
  switch $USER
    case root
      set usercolor red
    case '*'
      set usercolor green
  end
  printf '[ %s%s%s@%s%s%s | %s%s%s | %s ] ' \
    (set_color $usercolor)                  \
    (whoami)                                \
    (set_color cyan)                        \
    (set_color blue)                        \
    (hostname|cut -d . -f 1)                \
    (set_color normal)                      \
    (set_color cyan)                        \
    (prompt_pwd)                            \
    (set_color normal)                      \
    (date +%T)
end

function fish_right_prompt
  set old_status $status
  switch $old_status
    case 0
      # git info and battery
      battery.sh -bc
    case '*'
      echo -n -s (set_color red) 'Error: ' $old_status (set_color normal)
  end
end
