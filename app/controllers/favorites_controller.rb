class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(wine_id: params[:wine_id])
    redirect_to wines_url, notice: "#{favorite.wine.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to wines_url, notice: "#{favorite.wine.user.name}さんのブログをお気に入り解除しました"
  end
end
