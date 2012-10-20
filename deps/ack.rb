dep 'ack binary', :template => 'managed' do
  installs 'ack-grep'
  provides 'ack-grep'
end

dep 'ack' do
  requires 'ack binary'

  met? { shell?("test -L /usr/bin/ack") }

  meet do
    cd "/usr/bin" do
      shell "ln -s /usr/bin/ack-grep ack"
    end
  end

end
