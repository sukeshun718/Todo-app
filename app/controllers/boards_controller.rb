class BoardsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        @boards = Board.all
    end
    def show 
        @board = Board.find(params[:id])
        @tasks = @board.tasks
    end

    def new 
        @board = current_user.boards.build
    end

    def create 
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to root_path, notice: '保存できたよ！'
        else
            flash.now[:error] = "保存に失敗しました"
            render :new 
        end
        
    end

    def destroy 
        board = current_user.boards.find(params[:id])
        board.destroy!
        redirect_to root_path, notice: '削除に成功しました'
    end


    private
    def board_params
        params.require(:board).permit(:name, :description)
    end

end
