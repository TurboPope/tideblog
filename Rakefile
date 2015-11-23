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

task :draft, [:layout, :title] do |t, args|
  # Create post in draft dir
  draft_dir = "_drafts/"
  index = "0";
  filename = args.title
  File.open(draft_dir + index + filename, "w") do |f|
    f.puts("---")
    f.puts("title: #{args.title}")
    f.puts("layout: #{args.layout}")
    f.puts("---")
  end
end

task :publish do
  # Move contents of draft dir to posts dir and prepend consecutive dates
end

task build: [:bundle_install, :bower_install] do |_, args|
  jekyll 'build', config, *args
end

task serve: [:bundle_install, :bower_install] do |_, args|
  jekyll 'serve', config, *args
end

task doctor: [:bundle_install, :bower_install] do
  jekyll 'doctor'
end

task guard: [:bundle_install, :bower_install] do
  sh 'bundle exec guard'
end

task :bundle_install do
  sh 'bundle install'
end

task :bower_install do
  sh 'bower install'
end

task :default => 'build'
