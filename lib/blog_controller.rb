class BlogController

  def start
    main_menu
  end

  def main_menu
    puts "Welcome to My Blog!"
    puts "1. Read Posts"
    puts "2. Write Posts"
    
    choice = gets.strip

    case (choice.to_i)
    when 1 
      list_posts
    when 2
      write_post
    else
      puts "Invalid Entry."
      main_menu
    end
  end

  def list_posts
    # - Read Posts
      # + Then the can select a post to read in full
      # + Go back to Read menu
    # we need to query something, the database, posts
    Post.print_titles
    puts "Which would you like to read? Type main for main menu."
    reading_choice = gets.strip
    
    if reading_choice.to_i == 0 
      main_menu
    else
      # Assume they typed in 2

      post = Post.find(reading_choice) # SELECT * posts WHERE id = 2
      puts "Title: #{post.title}"
      puts "------"
      puts "#{post.body}"

      list_posts
    end
  end

  def write_post
    puts "Enter the title for your post:"
    post_title = gets.strip

    puts "Enter the text for your post:"
    post_text = gets.strip

    post = Post.new
    post.title = post_title
    post.body = post_text
    post.save

    puts "Your post has been saved as Post #{post.id}"
  end
end
