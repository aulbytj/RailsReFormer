# frozen_string_literal: true

class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User '#{@user.username}' was successfully added"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "User '#{@user.username}' was successfully updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.destroy(params[:id])

    flash[:success] = "User '#{@user.username}' was deleted"
    redirect_to root_path
  end
end
