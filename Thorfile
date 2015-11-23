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

  desc("spellcheck FILE", "spellcheck FILE")
  def spellcheck(file)
    run("hunspell -d de_DE #{file}")
  end
end
