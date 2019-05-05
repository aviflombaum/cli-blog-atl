class Post < ActiveRecord::Base

  def self.print_titles
    Post.all.each_with_index do |p, i|
      puts "#{i+1}. #{p.title}"
    end
  end

end