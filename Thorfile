class Jekyll < Thor
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__)
  end

  desc "draft LAYOUT TITLE", "create a draft"
  def draft(layout, title)
    draft_dir = "_drafts"
    index = "0";
    filename = title
    extension = "md"
    File.open("#{draft_dir}/#{index}-#{filename}.#{extension}", "w") do |f|
      f.puts("---")
      f.puts("title: #{title}")
      f.puts("layout: #{layout}")
      f.puts("---")
    end
  end

  desc("publish", "move contents of draft dir to posts dir and prepend consecutive dates")
  def publish
    run("mv _drafts/*.md _posts/")
  end

  desc("spellcheck FILE", "spellcheck FILE")
  def spellcheck(file)
    run("hunspell -d de_DE #{file}")
  end

  desc("bundle_install", "install gems from Gemfile with bundler")
  def bundle_install
    run("bundle install")
  end

  desc("bower_install", "install frontend dependencies with bower")
  def bower_install
    run("bower install")
  end

  desc("guard", "run local development server with autobuild and browser-autoreload")
  def guard
    invoke :bundle_install
    invoke :bower_install
    run("bundle exec guard")
  end

  desc("jekyll COMMAND, ARGS", "execute a jekyll command")
  def jekyll(command, *args)
    invoke :bundle_install, []
    invoke :bower_install, []
    run("bundle exec jekyll #{command} #{args.join(' ')}")
  end
end
