class TasksController < ApplicationController
    
    
    def index
        render json: Task.all.order(:id)                  
    end    
    
    def update
        task = Task.find(params[:id])
        task.update_attributes(task_params)
        render json: task 
    end    

    
    def create
        task = Task.create(task_params)
        render json: task
    end
    
    def delete
        task = Task.find(params[:id])
        task = Task.destroy
        render json: task 
        
    end    
    
    private 
    
    def task_params
        params.require(:task).permit(:done, :title)
    end 
end
