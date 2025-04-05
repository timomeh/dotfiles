function rm --wraps rm --description "Override rm to say Nope"
  set fonts (ls /opt/homebrew/share/figlet | grep '\.tlf$' | sed 's/\.tlf$//')
  set random_font (random choice $fonts)
  toilet -f $random_font "Nope"
  echo ""
  echo "rm is disabled. Use trash instead, or rrm if you really mean it" 1>&2

  if test -t 0
    afplay ~/.config/nope.mp3 & disown
  end

  return 1
end