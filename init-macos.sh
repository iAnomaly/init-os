#!/usr/bin/env bash

# Enable TouchID for PAM
grep -q pam_tid.so /etc/pam.d/sudo || sudo sed -i '.bak' $'2i\\\nauth       sufficient     pam_tid\.so\n' /etc/pam.d/sudo

# Install Xcode
xcode-select --install

# Install Homebrew
export CI=
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Homebrew formulae
brew install awscli bash-completion coreutils gawk git gnu-sed go helmfile go jq kubernetes-cli kubernetes-helm make mysql@5.7 node python redis ripgrep sceptre sipcalc watch wget yq
brew link --force mysql@5.7

# Install Homebrew casks
brew cask install docker google-chrome osxfuse spectacle visual-studio-code

# Install Homebrew taps
brew install datawire/blackbird/telepresence
brew install twpayne/taps/chezmoi
brew tap johanhaleby/kubetail && brew install kubetail
