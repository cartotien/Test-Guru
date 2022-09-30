module ApplicationHelper
  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end

  def current_year
    Date.today.year
  end

  def flash_message(message)
    if flash[message]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
