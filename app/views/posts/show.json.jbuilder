json.extract! @post
json.url post_url(@post, format: :json)
json.title @post.title
json.content @post.content
