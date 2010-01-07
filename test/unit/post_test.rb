require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  fixtures :posts

  test "secret_key generation is functional" do
    post = posts(:bookslam)
    post.before_validation_on_create
    assert_not_nil conn.secret_key, "secret_key generation failed in before_validation_on_create"
  end
end
