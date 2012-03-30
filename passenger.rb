dep 'ruby 1.9.3' do
  requires 'rbfu inited'

  met? do
    shell "env | grep -i GEM_HOME | grep 'rubies\/1.9.3'"
  end

  meet do
    shell "rbfu-env @1.9.3"
  end

end

dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3'
end