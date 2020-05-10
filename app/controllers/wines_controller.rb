class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  #未ログイン状態でも、ブログの閲覧だけは可能
  before_action :authenticate_user!, only: [:new, :create]

  def index   
    # @wines = Wine.all.order(created_at: :desc)

    @q = Wine.ransack(params[:q])
    @wines = @q.result(distinct: true)
    @wines = Wine.all.order(created_at: :desc)
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
  end

  def show
    @comments = @wine.comments
    @comment = @wine.comments.build

    @favorite = current_user.favorites.find_by(wine_id: @wine.id)
  end

  def update
    if @wine.update(wine_params)
      redirect_to wines_path, notice: "編集完了です！"
    else
      render :edit
    end
  end

  def destroy
    @wine.destroy
    redirect_to wines_path, notice: "レビュウを削除しました！"
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
end
