require 'posts'

RSpec.describe PostRepo do
    def reset_posts_table
      seed_sql = File.read('spec/seeds.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_posts_tags' })
      connection.exec(seed_sql)
    end
      
    
    before(:each) do 
      reset_posts_table
    end

    it 'finds a post with a tag' do
         post_repo = PostRepo.new

         post = post_repo.find_by_tag('1')

         expect(post).to eq '1'

    end    
end