class TestsController < ApplicationController
  def index
    render inline: '<li> <% Test.all.each do |t| %><p><%= t.title %></p><% end %></li>'
  end

  def show
    render inline: '<p><%= Test.find(params[:id]).title %></p>'
  end
end
