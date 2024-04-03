class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @content = params[:content]
    @model = params[:model]
    @method = params[:method]
    if @content == ''
      redirect_to request.referer
    elsif @model == 'user'
      @records = User.search_for(@content, @method)
    else
      @records = Work.search_for(@content, @method)
    end
  end
end
