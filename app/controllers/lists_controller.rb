class ListsController < ApplicationController
  def index
    @lists = List.all.order(created_at: :desc)
  end

  def new
    @list = ListsTag.new
  end

  def create 
    @list = ListsTag.new(list_params)
    if @list.valid?
      @list.save
       redirect_to lists_path
    else
      render "new"
    end
  end

  def edit 
    @list = ListsTag.new(id: params[:id])
  end

  def update
    @list = ListsTag.new(list_params.merge(id: params[:id]))
    if @list.valid?
      @list.update
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to action: :index
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private
  def list_params
    params.require(:lists_tag).permit(:info, :name, :image)
  end
end
