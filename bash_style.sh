color="green"
services_line_1="service1, service2"
services_line_2="service3, service4"


get_color(){
  case $1 in
    black) echo 0 ;;
    red) echo 1 ;;
    green) echo 2 ;;
    yellow) echo 3 ;;
    blue) echo 4 ;;
    magenta) echo 5 ;;
    cyan) echo 6 ;;
    "light gray") echo 7 ;;
    *) echo 7 ;; # Default to light gray if color is unknown
  esac
}

build_ps1(){
  color_id=$(get_color "$1")
  PS1="${debian_chroot:+($debian_chroot)}\[\e[0;3${color_id}m\]\u\[\e[0m\]@\[\e[1;3${color_id}m\]\h\[\e[0m\]:\[\e[0;3${color_id}m\]\w\[\e[0m\]$ "
}

center_text() {
  local text="$1"
  local terminal_width
  terminal_width=$(tput cols)
  local lines=()

  IFS=$'\n' read -r -d '' -a lines <<< "$text"

  for line in "${lines[@]}"; do
    local text_width=${#line}
    local padding_width=$(( (terminal_width - text_width) / 2 ))
    local padding
    padding=$(printf "%*s" $padding_width)
    echo "${padding}${line}"
  done
}

trim(){
  echo "$1" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
}

build_welcome_screen(){
  local color_id=$(get_color "$1")
  local capitalized=$(hostname | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')
  local ip_addr=$(hostname -I | awk '{print $1}')
  local uptime_info=$(uptime -p | sed -e 's/^up //')
  local users=$(uptime | grep -oP '\d+ users?')

  local status_line_1=$(trim "${users} connected ▬▬▬ up since ${uptime_info}")
  local status_line_2="ip: ${ip_addr}"

  printf "\e[1;3%sm" "${color_id}"
  fig_hostname=$(figlet -f big ">> ${capitalized} <<")
  center_text "${fig_hostname}"

  printf "\e[0;9%sm" "${color_id}"
  if [ ${#2} -gt 0 ]; then
    services_figlet1=$(figlet -f small "> "$2" <")
    center_text "${services_figlet1}"
  fi

  if [ ${#3} -gt 0 ]; then
    services_figlet2=$(figlet -f small "> "$3" <")
    center_text "${services_figlet2}"
  fi


  separators=$(printf "%*s" "${#status_line_1}" | tr ' ' '=')
  center_text "${separators}"
  center_text "${status_line_1}"
  center_text "${status_line_2}"
  center_text "${separators}"

  printf "\e[0m"
}

build_welcome_screen "$color" "$services_line_1" "$services_line_2"
build_ps1 "$color"
