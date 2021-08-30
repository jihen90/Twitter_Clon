module TweetsHelper
    def hashtag(content)
        format_content = content.split(" ")
        tag = []
        format_content.each do |t|
            if t.start_with?("#")
                t = link_to t, controller: "tweets", q: t
            end
            tag.push(t)
        end
        raw tag.join(" ")    
    end
end
