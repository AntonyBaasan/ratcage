require 'rake/testtask'
require 'rake/clean'

gem_name = "ratcage"
version = "0.0.0"

Rake::TestTask.new do |t|
  t.libs << "test"
end

CLEAN = FileList['*.gem']

desc "Run tests"
task :default => :test

# gem build ratcage.gemspec
desc "Build gem"
task :build do

  Rake::Task[:clean] #remove old gem files

  sh "gem", "build", gem_name+".gemspec"
  version = Dir['*.gem'].first.scan(/\d\.\d\.\d/).first
end

# gem install ratcage-0.0.0.gem
desc "Install the gem on local machine"
task :install => :build do
  sh "gem", "install", gem_name+"-"+version+".gem"
end

#TODO: add remove from local machine command

# gem push ratcage-0.0.0.gem
desc "Realse the gem to rubygems.org"
task :release => :build do
  sh "gem", "install", gem_name+"-"+version+".gem"
end

# gem yank (remove gem from rubygems.org)
desc "Remove the gem from rubygems.org"
task :yank, [:version] do |t, args|

  if (args.to_a.size == 0)
    puts "Please insert version"
    return
  end
  Rake::Task[:build]
  sh "gem", "yank", gem_name, "-v", args.version
end
