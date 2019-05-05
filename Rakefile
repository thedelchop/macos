#!/usr/bin/ruby

task default: %i[
  xcode
  zshell
  mac_os
  brew
  cask
  computer_name
  vim_config
  git_config
  ssh_config
  nvm_install
  rvm_install
  cask_configs
  spacemacs_install
]

task continue: %i[
  brew
  cask
  vim_config
  git_config
  ssh_config
  nvm_install
  rvm_install
  cask_configs
  computer_name
  spacemacs_install
]

def curl(what)
  sh "curl -O #{what}"
end

def brew(what)
  sh "brew install #{what}"
end

def cask(what)
  sh "brew cask install #{what}"
end

def in_dir(dir)
  pwd = Dir.pwd
  begin
    Dir.chdir dir
    yield if block_given?
  ensure
    Dir.chdir pwd
  end
end

def git_config(setting, what)
  sh "git config --global #{setting} #{what}"
end

def ask_for(what)
  print what
  STDIN.gets.strip
end

#### Download steps ####

desc 'Installs xcode. Waits for input while installer is running.'
task :xcode do
  begin
    sh 'xcode-select --install'
  rescue StandardError
    puts 'Looks like xcode failed... was it already installed?'
  ensure
    puts 'Wait until xcode is installed...When done, press [ENTER] to continue.'
    STDIN.gets.strip
  end

  begin
    puts "Now, let's accept the XCode licenses from command line!"
    sh 'sudo xcodebuild -license accept'
  rescue StandardError
  end
end

desc 'Installs Oh-my zshell'
task :zshell do
  sh 'curl -L http://install.ohmyz.sh | sh'
end

def install_homebrew
  sh %{/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"} unless \
    Dir.exist? '/usr/local/Homebrew'
  sh 'touch ~/.homebrew_analytics_user_uuid && chmod 000 ~/.homebrew_analytics_user_uuid'
end

task :install_homebrew do
  install_homebrew
end

def install_profiles
  sh 'cp bullet-train.zsh-theme ~/.oh-my-zsh/custom/themes/'
  sh 'cp .zshrc ~'
end

task :install_profiles do
  install_profiles
end

desc 'Sets some macOS preferred settings'
task :mac_os do
  sh 'git clone https://github.com/haf/macos.git'
  in_dir 'macos' do
    install_homebrew
    install_profiles
  end
end

desc 'Updates, upgrades and installs homebrew packages'
task :brew do
  sh 'brew update'
  sh 'brew upgrade'
  sh 'brew cleanup'
  sh 'brew tap homebrew/cask'
  sh 'brew tap homebrew/cask-fonts'
  sh 'brew tap caskroom/versions'
  packages = %w[
    autoconf
    automake
    colordiff
    ctags
    editorconfig
    emacs
    fzf
    git
    libtool
    libuv
    neovim
    nvm
    postgresql
    readline
    tree
    ucspi-tcp
    watch
    vim
    yarn
    zlib
  ].join(' ')
  brew packages

  sh '/usr/local/opt/fzf/install --no-bash --completion --key-bindings'
end

desc 'Installs common casks'
task :cask do
  packages = %w[
    atom
    iterm2
    docker
    firefox
    font-awesome-terminal-fonts
    font-fontawesome
    font-monoid
    font-monoid-nerd-font
    font-monoid-nerd-font-mono
    font-roboto
    font-roboto-condensed
    font-roboto-mono
    font-roboto-mono-for-powerline
    font-roboto-slab
    font-robotomono-nerd-font
    font-robotomono-nerd-font-mono
    google-chrome
    postman
    slack
    visual-studio-code
  ].join(' ')
  cask packages
end

desc 'Configure the installed casks'
task :cask_configs do
  sh 'mkdir -p ~/.iterm && cp com.googlecode.iterm2.plist ~/.iterm'

  # https://github.com/eczarny/spectacle/issues/244
  sh %(mkdir -p "#{ENV['HOME']}/Library/Application Support/Code/User")
  sh %(cp vscode.json "#{ENV['HOME']}/Library/Application Support/Code/User/settings.json")
end

desc 'Sets computer name. Asks for input'
task :computer_name do
  # Set computer name (as done via System Preferences -> Sharing)
  computer_name = ask_for 'Computer name: '
  sh "sudo scutil --set ComputerName '#{computer_name}'"
  sh "sudo scutil --set HostName '#{computer_name}'"
  sh "sudo scutil --set LocalHostName '#{computer_name}'"
  sh "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string '#{computer_name.upcase}'"
  sh 'sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist'
end

desc 'Configure vim'
task :vim_config do
  sh 'cp .vimrc ~/.vimrc'
end

desc 'Sets minimum git config. Asks for input'
task :git_config do
  sh 'cp .gitconfig ~/.gitconfig'
  git_config 'core.editor', '/usr/local/bin/nvim'
  git_config 'push.default', 'current'

  # Configure User section
  user = ask_for 'Git user name: '
  git_config 'user.name', "'#{user}'"
  email = ask_for 'Git user email: '
  git_config 'user.email', "'#{email}'"

  # Configure Githbub section
  github_username = ask_for 'Github username: '
  git_config 'user.email', "'#{github_username}'"
end

desc 'Configures SSH and its agent'
task :ssh_config do
  sh 'mkdir -p ~/.ssh'
end

task :spacemacs_install do
  sh 'git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d'
end

task :nvm_install do
  sh './nvm-install-lts.sh'
end

task :rvm_install do
  sh './rvm-install.sh'
end

task :macos_config do
  sh './config-macos.sh'
end
