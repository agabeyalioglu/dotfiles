eval "$(/opt/homebrew/bin/brew shellenv)"

# Load dotfiles binaries
export PATH="$DOTFILES/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Set up android tools
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"

# Prioritize brew binaries over system
export PATH="$(brew --prefix)/bin:$PATH"

# Use gnu-sed as sed
PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"

# Make sure coreutils are loaded before system commands
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
