Gem::Specification.new do |s|
  s.name = 'nthrut'
  s.version = '0.1.0'
  s.summary = 'No Thrills HTML Renderer using Tilt (NThrut).'
  s.authors = ['James Robertson']
  s.files = Dir['lib/nthrut.rb']
  s.add_runtime_dependency('tilt', '~> 2.0', '>=2.0.9') 
  s.add_runtime_dependency('slim', '~> 4.0', '>=4.0.1')  
  s.add_runtime_dependency('haml', '~> 5.0', '>=5.0.1')
  s.signing_key = '../privatekeys/nthrut.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/nthrut'
end
