title = "Aruna Ratanagiri Dhamma Talks"
author = "Aruna Ratanagiri Buddhist Monastery"
description = "Dhamma Talks from various teachers present at Aruna Ratanagiri Buddhist Monastery."
keywords = "dhamma, dhamma talks, talks, buddhism, aruna ratanagiri, harnham, buddhist monastery, dharma"
image = "http://ratanagiri.org.uk/cover_600x600.jpg"

xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
  xml.channel do
    xml.title title
    xml.link "http://ratanagiri.org.uk/teachings/talks"
    xml.description description
    xml.language 'en'
    xml.pubDate @talks.first.created_at.to_s(:rfc822)
    xml.lastBuildDate @talks.first.created_at.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => image
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'aruna.ratanagiri@gmail.com'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Religion &amp; Spirituality'

    itunes_talks.each do  |talk|
      xml.item do
        link = "http://ratanagiri.org.uk/teachings/talks/#{talk.slug}"
        mp3_url = "http://ratanagiri.org.uk/teachings/talks/#{talk.slug}.mp3"
        xml.title talk.title
        xml.description talk.description
        xml.pubDate talk.date.to_s(:rfc822)
        xml.enclosure :url => mp3_url, :type => 'audio/mpeg'
        xml.link link
        xml.guid({:isPermaLink => "true"}, link)
        xml.itunes :author, talk.teacher.name
        xml.itunes :subtitle, truncate(talk.description, :length => 150)
        xml.itunes :summary, talk.description
        xml.itunes :explicit, 'no'
        #xml.itunes :duration, talk.duration
      end
    end
  end
end
