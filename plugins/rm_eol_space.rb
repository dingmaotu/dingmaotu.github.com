# encoding: utf-8

require './plugins/octopress_filters'

class String
  @@eol_space_regex = /([^\p{Latin}\n]) *\n *([^\p{Latin}\n-=])/m
  # @@link_regex = /(\[.*)\n(.*\])/
  # @@zh_en_space = /(\p{Han})([a-zA-Z0-9]+)(\p{Han})/
  
  def prettify_zh_en!
    gsub!(@@eol_space_regex, '\1\2')
  end
end

module OctopressLiquidFilters
  def rm_eol_space(input)
    input.prettify_zh_en!
  end
end
