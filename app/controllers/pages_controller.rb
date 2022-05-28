class PagesController < ApplicationController
  def home
    if params[:query].present?
      search = params[:query]
      search_results = Unsplash::Photo.search(search)
      @results = search_results.map do |result|
        result.urls.raw
      end
    end
  end
end
