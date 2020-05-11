class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wine, only: [:create, :edit, :update, :destroy]

  def create
    @comment = @wine.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
    # binding.irb
      if @comment.save
        flash.now[:notice] = 'コメントが投稿されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの投稿に失敗しました'
        format.js { render :error }
      end
    end
  end

  def edit
    @comment = @wine.comments.find(params[:id])
    if current_user.id != @comment.user_id
        redirect_to wines_path, notice: "他人のコメントは編集出来ません！"
    else
      # @comment = @wine.comments.find(params[:id])
      respond_to do |format|
        flash.now[:notice] = 'コメントの編集中'
        format.js { render :edit }
      end
    end
  end

  def update
    @comment = @wine.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id != @comment.user_id
      redirect_to wines_path, notice: "他人のコメントは編集出来ません！"
    else
      # @comment = Comment.find(params[:id])
      @comment.destroy
      respond_to do |format|
          flash.now[:notice] = 'コメントが削除されました'
          format.js { render :index }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :wine_id)
  end

  def set_wine
    @wine = Wine.find(params[:wine_id])
  end
end
