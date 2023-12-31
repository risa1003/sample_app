class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを作成する
    @list = List.new
  end

  def create
    #データを受け取り新規作成するためのインスタンス作成
    @list = List.new(list_params)
    #データをデータベースに保存するためのsaveメソッド実行
    @list.save
    flash[:notice] = "投稿が成功しました"
    redirect_to list_path(@list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy #データ(レコード)を削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end


  private
  #ストロングパラメータ
  def list_params
  params.require(:list).permit(:title, :body, :image)
  end
end