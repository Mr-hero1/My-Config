if status is-interactive
set -U fish_greeting ""
set -gx GDK_BACKEND wayland
set -gx CLUTTER_BACKEND wayland
set -gx MOZ_ENABLE_WAYLAND 1
set -gx SDL_VIDEODRIVER wayland
set -gx QT_QPA_PLATFORM wayland
set -gx ELM_DISPLAY wayland

# alias
fortune | cowsay -f tux
end
