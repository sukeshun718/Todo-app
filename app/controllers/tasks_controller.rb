class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def  new 
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def  show
        board = Board.find(params[:board_id])
        @task = board.tasks.find(params[:id])
        @comments = @task.comments
    end

    def  create 
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        if @task.save
            redirect_to board_path(board),notice: 'Cardを追加'
        else
            flash.now[:error] = '追加できませんでした'
            render :new
        end
    end

    private
    def task_params
        params.require(:task).permit(:name, :description)
    end

end
