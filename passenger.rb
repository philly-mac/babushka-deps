dep 'ruby 1.9.3' do
  met? do
    Shell.new("rbfu-env").run.ok?
  end

  meet do
    Shell.new('eval "$(rbfu --init)"').run
  end
end

dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3'
end