dep 'ruby 1.9.3' do
  met? do
    shell("rbfu-env")
  end

  meet { shell 'eval "$(rbfu --init)' }
end

dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3'
end