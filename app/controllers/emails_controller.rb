class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @selected_email = Email.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.turbo_stream
    end
  end

  def new
    Email.create(
      object: Faker::Movie.title,
      body: Faker::Lorem.paragraph
    )
    redirect_to root_path
  end

  def create
    @new_email = Email.create(
      object: Faker::Movie.title,
      body: Faker::Lorem.paragraph
    )
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
    redirect_to emails_path, status: :see_other
  end
end
