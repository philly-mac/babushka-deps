dep "redis server", :template => 'managed' do
  installs 'redis-server'
end

dep 'redis lib', :template => 'managed' do
  met? { "/usr/include/hiredis/hiredis.h".p.exist? }

  installs 'libhiredis-dev'
end
