CONFIGS = ["_config.yml"]

def config
  return '--config ' + CONFIGS.join(',')
end

def jekyll(*args)
  begin
    sh 'bundle exec jekyll ' + args.join(' ')
  rescue Exception => e
    puts "jekyll stopped"
    return
  end
end


#desc 'Add asset compression'
#task 'compress' do
#  CONFIGS << '_config.compress.yml'
#end

task build: :bundle_install do |_, args|
  jekyll 'build', config, *args
end

task serve: :bundle_install do |_, args|
  jekyll 'serve', config, *args
end

task doctor: :bundle_install do
  jekyll 'doctor'
end

task :bundle_install do
  sh 'bundle install'
end

task :default => 'build'
