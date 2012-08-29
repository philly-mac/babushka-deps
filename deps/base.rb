def babushka_root
  @babushka_root ||= File.dirname(__FILE__)
end

dep 'rsync',        :template => 'managed'
dep 'tmux',         :template => 'managed'
dep 'curl',         :template => 'managed'
dep 'grep',         :template => 'managed'
dep 'postfix',      :template => 'managed'
dep 'htop',         :template => 'managed'
dep 'git',          :template => 'managed'
dep 'radicale',     :template => 'managed'
dep "vim",          :template => "managed"
