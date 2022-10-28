require_relative 'database_connection'

class Post
    attr_accessor :id, :title
end

class PostRepo
    def find_by_tag(tag)
        sql = 'SELECT posts.id, posts.title
               FROM posts
               JOIN posts_tags ON posts_tags.post_id = posts.id
               JOIN tags ON posts_tags.tag_id = tags.id
               WHERE name = $1;'
        
        params = [tag]

        results = DatabaseConnection.exec_params(sql, params)
        
        #post = Post.new
        #post.id = results['id']
        #post.title = results['title']
        
        #return post
    end
end

post_repo = PostRepo.new
post_repo.find_by_tag('coding')