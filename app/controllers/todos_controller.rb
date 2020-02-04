class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :destroy, :edit, :update, :complete]
    def index
        @todos = Todo.all
    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            flash[:notice] = "Your new ToDo was added successfully"
            redirect_to todos_path
        else
            render 'new'
        end
    end

    def show
    end

    def destroy
        @todo.destroy
        redirect_to todos_path
    end

    def edit
    end

    def update
        if @todo.update(todo_params)
            flash[:notice] = "Your new ToDo was updated successfully"
            redirect_to todo_path(@todo)
        else
            render 'edit'
        end
    end

    def complete
        if @todo.completed == false
            @todo.completed = true
            @todo.save
            flash[:notice] = "Completed! Keep it up! "
            redirect_to todos_path
        else
            @todo.completed = false
            @todo.save
            redirect_to todos_path
        end  
    end

    def list
        @todo_completed = Todo.where(completed: true)
        @todo_incompleted = Todo.where(completed: false)
    end

    private
    def set_todo
        @todo = Todo.find(params[:id])  
    end
    def todo_params
        params.require(:todo).permit(:description, :completed)
    end
end
