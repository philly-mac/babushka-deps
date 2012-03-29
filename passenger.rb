dep 'ruby 1.9.3' do
  met? do
    run("rbfu-env")
  end

  meet do
    run('eval "$(rbfu --init)"')
  end
end

dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3'
end