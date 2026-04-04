# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Set up android tools
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$PATH"

# Prioritize brew binaries over system
export PATH="/opt/homebrew/bin:$PATH"

# Use gnu-sed as sed
PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# Make sure coreutils are loaded before system commands
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

export PATH="$HOME/.maestro/bin:$PATH"

export PATH="$HOME/.config/zsh/bin:$PATH"

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"