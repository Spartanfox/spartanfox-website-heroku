class DownloadsController < ApplicationController
  before_action only: [:new, :create] do
    redirect_to(downloads_path, alert: "You must be admin or above to make a download") unless @auth >= @admin
  end
  before_action only: [:update, :destroy] do
    redirect_to(downloads_path, alert: "You must be owner to edit/delete downloads") unless @auth >= @owner
  end
  def index
    @downloads = Download.all
  end

  def new
    @download = Download.new
  end

  def edit
    @download = Download.find(params[:id])
  end

  def show
    @download = Download.find(params[:id])
    unless cookies["downloads_"+@download.title] == "downloaded"
      cookies["downloads_"+@download.title] = "downloaded"
      @download.downloads_number += 1
      @download.save
    end
    redirect_to @download.download_url
  end

  def create
    @download = Download.new(download_params)
    if @download.save
      redirect_to downloads_path
    else
      render 'new'
    end
  end

  def update
    @download = Download.find(params[:id])
    if @download.update(download_params)
      redirect_to downloads_path
    else
      render 'edit'
    end
  end

  def destroy
    @download = Download.find(params[:id])
    @download.destroy
    redirect_to downloads_path
  end


  private
  def download_params
    params.require(:download).permit(:title, :description,:download_url, :downloads_number)
  end
end
