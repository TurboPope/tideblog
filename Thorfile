class Jekyll < Thor
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
end
