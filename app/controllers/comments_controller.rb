class CommentsController < ApplicationController
  def persist

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

      doc.xpath('//posts/post').map do |j|



        @basecamp_id=j.xpath('id').inner_html.to_i


        uri = URI.parse("https://webonise.basecamphq.com/projects/#{pro_id}/posts/#{@basecamp_id}/comments")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        req = Net::HTTP::Get.new(uri.request_uri)
        req.add_field('accept','application/xml')
        req.add_field('content_type','application/xml')
        req.basic_auth 'kunal.webonise', '9930ghijk'
        resp = http.request(req)

        doc=Nokogiri::XML(resp.body)

        doc.xpath('//comments/comment').map do |k|
          @basecamp_commentid=k.xpath('id').inner_html.to_i
          @author_id=k.xpath('author-id').inner_html.to_i
          @body=k.xpath('body').inner_html
          @postedon = k.xpath('created-at').inner_html
          @posted_on=Time.mktime(*ParseDate.parsedate(@postedon))
          @post_id=k.xpath('commentable').inner_html.to_i
          @comment=Comment.new(:basecamp_id=>@basecamp_commentid,:author_id=>@author_id,:body=>@body,:created_at=>@posted_on,:post_id=>@post_id)
          @comment.save
        end
      end

    end
  end

end
