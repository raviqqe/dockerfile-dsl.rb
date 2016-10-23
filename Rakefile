require 'rake/clean'



TMP_DIR = 'tmp'


task :build do
  sh %q(gem build *.gemspec)
end

task :push => :build do
  sh %q(gem push *.gem)
end

task :install => :build do
  sh %q(gem install *.gem)
end

task :test => :install do
  sh 'tool/run_readme.sh README.md'

  rm_rf TMP_DIR
  mkdir_p TMP_DIR

  Dir.glob('examples/*.rb').each do |file|
    File.write File.join(TMP_DIR, 'Dockerfile'), `ruby #{file}`
    sh "sudo docker build #{TMP_DIR}"
  end

  rm_r TMP_DIR
end

task :default => :build


CLEAN.include Dir.glob ['*.gem']
