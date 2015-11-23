class Jekyll < Thor
  include Thor::Actions
  require 'fileutils'

  def self.source_root
    File.dirname(__FILE__)
  end

  $draft_format = /\d+-.*\.md/

  desc "draft LAYOUT TITLE", "create a draft"
  def draft(layout, title)
    draft_dir = "_drafts"

    highest_index = 0;
    Dir.glob('_drafts/*.md') do |draft_filename|
      if draft_filename.match($draft_format)
        tested_index = draft_filename.match(/^_drafts\/(\d)+-/)[1].to_i
        puts tested_index
        if (tested_index >= highest_index)
          highest_index = tested_index + 1
        end
      end
    end
    index = highest_index.to_s;

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
    date = Date.today
    Dir.glob('_drafts/*.md').sort.each do |draft_filename|
      if draft_filename.match($draft_format)
        new_filename = draft_filename.gsub(/^_drafts\/\d+-/, "#{date.to_s}-")
        FileUtils.mv(draft_filename, "_posts/#{new_filename}")
        date = date + 1
      end
    end
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
