class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_is_clickbait

    def title_is_clickbait
    #     if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top 10") && !title.include?("Guess")
    #         errors.add(:title, "More clickbaity")
    #     end

        # if !title.include?("Won't Believe", "Secret", "Top 10", "Guess")
        #     errors.add(:title, "More clickability")
        # end
        if title == nil
            errors.add(:title, "More clickability")
        else
            array = ["Won't Believe", "Secret", "Top 10", "Guess"]
            is_it_true = array.map do |word| 
                title.include?(word) 
            end
            print is_it_true
            if !is_it_true.include?(true)
                errors.add(:title, "More clickability")
            end
        end
        
    end

end

# !post.title.include?("Won't Believe") && !post.title.include?("Secret") && !post.title.include?("Top 10") && !post.title.include?("Guess")
# !post.title.include?("Won't Believe") || !post.title.include?("Secret") || !post.title.include?("Top 10") || !post.title.include?("Guess")