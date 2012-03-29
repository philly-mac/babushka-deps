dep 'ruby 1.9.3' do
  met? do
    shell("rbfu-env").ok?
  end
end

dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3'
end