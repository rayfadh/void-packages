#!/bin/sh
# vlcj uses default NativeDiscovery; jna.library.path points it to system libvlc.
# VLC_PLUGIN_PATH tells libvlccore where to find its plugins from system vlc package.

export _JAVA_AWT_WM_NONREPARENTING=1
export VLC_PLUGIN_PATH=/usr/lib/vlc/plugins

_jvm_args="-Djna.library.path=/usr/lib"

if [ -n "${SIMPLEX_SCALE}" ]; then
    _jvm_args="${_jvm_args} -Dsun.java2d.uiScale=${SIMPLEX_SCALE}"
fi

if [ "${SIMPLEX_RENDER_API}" = "SOFTWARE" ]; then
    export SKIKO_RENDER_API=SOFTWARE
fi

exec /usr/lib/simplex-chat/simplex/bin/simplex \
    --jvm-arg="${_jvm_args}" \
    "$@"
