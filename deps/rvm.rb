dep 'rvm requirements', :template => 'managed' do
  installs "build-essential",
    "openssl",
    "libreadline6",
    "libreadline6-dev",
    "git-core",
    "zlib1g",
    "zlib1g-dev",
    "libssl-dev",
    "libyaml-dev",
    "libsqlite3-dev",
    "sqlite3",
    "autoconf",
    "libc6-dev",
    "ncurses-dev",
    "automake",
    "libtool",
    "bison",
    "subversion"
end

dep 'rvm' do
  requires 'rvm requirements'

  met? { "/usr/local/rvm".p.exist? }

  meet do
    log_shell "Installing rvm (Ruby Version Manager)", "shell curl -L https://get.rvm.io | bash -s stable"
  end

end
