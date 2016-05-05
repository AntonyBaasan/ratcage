Gem::Specification.new do |s|
  s.name        = 'ratcage'
  s.version     = '0.0.2'
  s.date        = '2016-05-05'
  s.summary     = "Ratcage!"
  s.description = "A simple gem that helps to generate a template file from spec file.
                  Current supported version:
                  Rails Application Template
                  "
  s.authors     = ["Antony Baasandorj"]
  s.email       = 'antony.baasan@gmail.com'
  s.files       = %w(lib/ratcage.rb
                      lib/generator/generator_factory.rb
                      lib/generator/rails_generator.rb
                    )
  s.homepage    = 'http://rubygems.org/gems/ratcage'
  s.license     = 'MIT'
end