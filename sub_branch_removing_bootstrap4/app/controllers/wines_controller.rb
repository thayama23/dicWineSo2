class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  #未ログイン状態でも、ブログの閲覧だけは可能
  before_action :authenticate_user!, only: [:new, :create]

  def index   
    @wines = Wine.all.order(created_at: :desc)

    @q = Wine.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty? 
  
    @wines = @q.result(distinct: true)

    # @wines = Wine.all.order(created_at: :desc)
    # if params[:q] == "true"
    #   @q = Wine.ransack(params[:q])
    #   @wines = @q.result(distinct: true)
    # else  
    #   @wines = Wine.all.order(created_at: :desc)
    # end 
    
    # if params[:q] != nil
    #   @wines = Wine.all.order(created_at: :desc)
    # else  
    #   @q = Wine.ransack(params[:q])
    #   @wines = @q.result(distinct: true)
    # end


  end

  def create
    @wine = Wine.new(wine_params)
    @wine.user_id = current_user.id
    # binding.irb
    if params[:back]
      render :new
    else
      if @wine.save
        redirect_to wines_path, notice: "レビュウを作成しました！"
      else
        render :new
      end
    end
    # @wine = Wine.new(wine_params)
    # if @wine.save
    #   redirect_to wines_path, notice: "レビュウを作成しました！"
    # else
    #   render :new
    # end
  end

  def new
    @wine = Wine.new
  end

  def edit
    if current_user.id != @wine.user_id
      redirect_to wines_path, notice:"他人のレビューは出来ません!"     
    end
  end

  def show
    @comments = @wine.comments
    @comment = @wine.comments.build
    # binding.irb
    
    if current_user.present?
      @favorite = current_user.favorites.find_by(wine_id: @wine.id)
    end
  end

  def update
    if @wine.update(wine_params)
      redirect_to wines_path, notice: "編集完了です！"
    else
      render :edit
    end
    
  end

  def destroy
    if current_user.id != @wine.user_id
      redirect_to wines_path, notice:"他人のレビュー削除は出来ません!"     
    else
      @wine.destroy
      redirect_to wines_path, notice: "レビュウを削除しました！"
    end
  end

  def confirm
    @wine = Wine.new(wine_params)
    @wine.user_id = current_user.id
    render :new if @wine.invalid?
  end

  private
  def set_wine
    @wine = Wine.find(params[:id])
  end

  def wine_params
    params.require(:wine).permit(:image, :image_cache, :price, :kind, :variety, :country, :origin, :name, :vintage, :taste, :ranking, :overview, { label_ids: [] })
  end

  # def logged_in?
  #   unless current_user.present?
  #     redirect_to wines_path
  #   end
  # end
end
