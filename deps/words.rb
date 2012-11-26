dep 'words.managed' do
  met? { '/usr/share/dict/british-english'.p.exist? }
  installs ['wbritish']
end