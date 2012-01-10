class PostsController < ApplicationController
  def index
    require 'rubygems'
    require 'net/http'
    require 'nokogiri'

    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @projects=Basecamp::Project.all


    @projects.each do |i|
      pro_id=i.id
      uri = URI.parse("https://webonise.basecamphq.com/projects/#{pro_id}/posts")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Get.new(uri.request_uri)
      req.add_field('accept','application/xml')
      req.add_field('content_type','application/xml')
      req.basic_auth 'kunal.webonise', '9930ghijk'
      resp = http.request(req)

      doc=Nokogiri::XML(resp.body)



      doc.xpath('//posts/post').map do |i|


        @author_name=i.xpath('author-name').inner_html
        @basecamp_id=i.xpath('id').inner_html.to_i
        @author_id=i.xpath('author-id').inner_html.to_i
        #@postedon=i.xpath('author-name').inner_html
        @postedon = i.xpath('posted-on').inner_html
        @posted_on=Time.mktime(*ParseDate.parsedate(@postedon))
        @body=i.xpath('body').inner_html
        @title=i.xpath('title').inner_html
        @from_client=i.xpath('from_client').inner_html

        @post=Post.new(:basecamp_id=>@basecamp_id,:author_id=> @author_id,:author_name=>@author_name, :posted_on=>@posted_on,:body=>@body, :title=>@title,:from_client=>@from_client)
        @post.save

      end

    end



  end

end
