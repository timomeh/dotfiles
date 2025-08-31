function fish_greeting
  # if set -q FISH_PROFILE_NAME
  #   set_color brblack
  #   echo "profile: $FISH_PROFILE_NAME"
  #   set_color normal
  # end

  if not set -q FISH_PROFILE_NAME
    echo ""
    echo "🎏 FISH_PROFILE_NAME is not set."
    echo "   You can set it like this:"
    echo "     set -Ux FISH_PROFILE_NAME timo"
    echo ""
  end
end