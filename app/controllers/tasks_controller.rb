# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @search = Task.user_accessible(current_user.id).ransack(search_params)

    @pagy, @tasks = pagy(@search.result.includes(:created_by, :assigned_to))
  end

  def new
    task = Task.new

    @form = Tasks::Form.new(task, current_user:)
  end

  def create
    task = Task.new
    @form = Tasks::Form.new(task, current_user:)

    if @form.create(task_params)
      redirect_to task_path(task), status: :see_other, flash: { success: t('.success') }
    else
      flash.now[:error] = t('.error')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    task = Task.user_accessible(current_user.id).find(params[:id])

    @form = Tasks::Form.new(task, current_user:)
  end

  def update
    task = Task.user_accessible(current_user.id).find(params[:id])
    @form = Tasks::Form.new(task, current_user:)

    if @form.update(task_params)
      redirect_to task_path(task), status: :see_other, flash: { success: t('.success') }
    else
      flash.now[:error] = t('.error')
      render :new, status: :unprocessable_content
    end
  end

  def show
    @task = Task.user_accessible(current_user.id).find(params[:id])
  end

  def destroy
    task = Task.user_accessible(current_user.id).find(params[:id])
    task.destroy
    redirect_to tasks_path, status: :see_other, flash: { success: t('.success') }
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :short_description,
      :status,
      :assigned_to_id,
      :deadline,
      :detail_description
    )
  end

  def search_params
    params.
      fetch(:search, {}).permit(
      :title_cont,
      :short_description_cont,
      :assigned_to_id_eq,
      :deadline_gteq,
      :deadline_lteq,
      :s,
      status_in: []
    ).
      reverse_merge(
        {
          assigned_to_id_eq: current_user.id,
          s: 'deadline acs'
        }
      )
  end
end
