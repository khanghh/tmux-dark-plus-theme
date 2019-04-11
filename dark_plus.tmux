#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DARK_PLUS_THEME_BASE_CONFIG_FILE="dark_plus_base.conf"
DARK_PLUS_DEFAULT_THEME="dark_plus_default.conf"
DARK_PLUS_NO_PATCHED_FONT_THEME="dark_plus_no_patched_font.conf"
DARK_PLUS_NO_PATCHED_FONT_OPTION="@dark_plus_no_patched_font"

main() {
  tmux source-file "$CURRENT_DIR/$DARK_PLUS_THEME_BASE_CONFIG_FILE"

  local no_patched_font=$(tmux show-option -gqv "$DARK_PLUS_NO_PATCHED_FONT_OPTION")

  local theme_file="$DARK_PLUS_DEFAULT_THEME"
  if [ "$no_patched_font" == "1" ]; then
    theme_file="$DARK_PLUS_NO_PATCHED_FONT_THEME"
  fi
  tmux source-file "$CURRENT_DIR/$theme_file"

  unset CURRENT_DIR
  unset DARK_PLUS_THEME_BASE_CONFIG_FILE
  unset DARK_PLUS_DEFAULT_THEME
  unset DARK_PLUS_NO_PATCHED_FONT_THEME
  unset DARK_PLUS_NO_PATCHED_FONT_OPTION
}

main
