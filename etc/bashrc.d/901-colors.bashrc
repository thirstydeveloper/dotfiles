# https://misc.flogisoft.com/bash/tip_colors_and_formatting

export C_RESET="\e[0m"

export C_BOLD="\e[1m"
export C_NO_BOLD="\e[21m"
export C_DIM="\e[2m"
export C_NO_DIM="\e[22m"
export C_UNDERLINE="\e[4m"
export C_NO_UNDERLINE="\e[24m"
export C_BLINK="\e[5m"
export C_NO_BLINK="\e[25m"
export C_INVERT="\e[7m"
export C_NO_INVERT="\e[27m"
export C_HIDDEN="\e[8m"
export C_NO_HIDDEN="\e[28m"

export C_NORMAL_FG="\e[39m"

export C_BLACK_FG="\e[30m"
export C_RED_FG="\e[31m"
export C_GREEN_FG="\e[32m"
export C_YELLOW_FG="\e[33m"
export C_BLUE_FG="\e[34m"
export C_MAGENTA_FG="\e[35m"
export C_CYAN_FG="\e[36m"
export C_LIGHT_GRAY_FG="\e[37m"
export C_DARK_GRAY_FG="\e[90m"
export C_LIGHT_RED_FG="\e[91m"
export C_LIGHT_GREEN_FG="\e[92m"
export C_LIGHT_YELLOW_FG="\e[93m"
export C_LIGHT_BLUE_FG="\e[94m"
export C_LIGHT_MAGENTA_FG="\e[95m"
export C_LIGHT_CYAN_FG="\e[96m"
export C_WHITE_FG="\e[97m"

export C_NORMAL_BG="\e[49m"

export C_BLACK_BG="\e[40m"
export C_RED_BG="\e[41m"
export C_GREEN_BG="\e[42m"
export C_YELLOW_BG="\e[43m"
export C_BLUE_BG="\e[44m"
export C_MAGENTA_BG="\e[45m"
export C_CYAN_BG="\e[46m"
export C_LIGHT_GRAY_BG="\e[47m"
export C_DARK_GRAY_BG="\e[100m"
export C_LIGHT_RED_BG="\e[101m"
export C_LIGHT_GREEN_BG="\e[102m"
export C_LIGHT_YELLOW_BG="\e[103m"
export C_LIGHT_BLUE_BG="\e[104m"
export C_LIGHT_MAGENTA_BG="\e[105m"
export C_LIGHT_CYAN_BG="\e[106m"
export C_WHITE_BG="\e[107m"

# Conventions

export C_FATAL="${C_BLINK}${C_RED_BG}${C_BLACK_FG}"
export C_ERROR="${C_RED_BG}${C_BLACK_FG}"
export C_WARN="${C_YELLOW_BG}${C_BLACK_FG}"
export C_INFO="${C_CYAN_BG}${C_BLACK_FG}"
