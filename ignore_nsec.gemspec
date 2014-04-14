# -*- encoding: utf-8 -*-  
$:.push File.expand_path('../lib', __FILE__)  
require 'ignore_nsec/version'

Gem::Specification.new do |s|
  s.name        = 'ignore_nsec'
  s.version     = IgnoreNsec::VERSION
  s.authors     = ['Gary S. Weaver']
  s.email       = ['garysweaver@gmail.com']
  s.homepage    = 'https://github.com/garysweaver/ignore_nsec'
  s.summary     = %q{Ignore nanosecond precision in Time comparisons.}
  s.description = %q{Some versions of OS's and databases only support microsecond precision. Using this gem makes Ruby ignore nanoseconds in Time comparisons to hopefully help avoid the time != time problem.}
  s.files = Dir['lib/**/*'] + ['LICENSE', 'README.md']
  s.license = 'MIT'
end
