require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "eotb"
    gem.summary = "Rails plugin which allow you easily track and observe your apps"
    gem.description = "Rails plugin which allow you easily track and observe your apps"
    gem.email = "bartlomiej.kozal@ragnarson.com"
    gem.homepage = "http://github.com/Quirke/eotb_rails_plugin"
    gem.authors = ["Ragnarson"]
    gem.add_development_dependency "rspec", ">= 1.3.0"
    gem.add_development_dependency "jeweler", ">= 1.4.0"
    gem.add_dependency "json", ">= 1.4.3"
    gem.add_dependency "hoptoad_notifier", ">= 2.3.2"
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "eotb #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
