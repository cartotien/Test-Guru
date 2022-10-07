module GistsHelper
  def gist_url_to_hash(url)
    /(?<=com\/).*/.match(url)
  end
end
