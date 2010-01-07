module PostsHelper

# Post display helper.
    def display_post(post)
    render :partial => 'posts/post_display', :locals => {:post => post}
  end

# For SHOW view. Selects appropriate partial for level of access.
  def show_manager(key_flag, post)
    if key_flag
      render :partial => 'show_authd', :locals => {:post => post}
    else
      render :partial => 'show', :locals => {:post => post}
    end
  end

# Form field html generators.
  def identity_field(name)
    options = Post::IdentityOptions.sort
    html = "    <label for='i-am-field'>I am a</label><select id='i-am-field' class='kind-field' name='#{name}[iam]'>"
    html << "<option value=''>[Gender]</option>"
    options.each {|key, text|
      html << "<option value='#{key}'>#{text}</option>"
    }
    html << '</select>'
    html << "    <label for='you-are-field' id='you-are-label'>You are a</label><select id='you-are-field' class='kind-field' name='#{name}[youare]'>"
    html << "<option value=''>[Gender]</option>"
    options.each {|key, text|
      html << "<option value='#{key}'>#{text}</option>"
    }
    html << '</select>'
  end

  def upfor_field(name)
    options = Post::UpforOptions.sort
    html = "    <select id='upfor-field' name='#{name}[upfor]'>"
    options.each {|key, text|
      html << "<option value='#{key}'>#{text}</option>"
    }
    html << '</select>'
  end

end
