# encoding: utf-8

require './plugins/post_filters'

class String
  @@eol_space_regex = /([^\p{Latin}\n]) *\n *([^\p{Latin}\n-=])/m
  # @@link_regex = /(\[.*)\n(.*\])/
  # @@zh_en_space = /(\p{Han})([a-zA-Z0-9]+)(\p{Han})/
  
  def prettify_zh_en!
    gsub!(@@eol_space_regex, '\1\2')
    # gsub!(@@link_regex, '\1\2')
    # gsub!(@@zh_en_space, '\1 \2 \3')
  end
end

# Use Jekylly's plugin system to modify the content before invoking rdicount
module Jekyll
  class JoinChineseFilter < PostFilter
    def pre_render(post)
      post.content.prettify_zh_en!
    end
  end
end
