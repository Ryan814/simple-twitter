class Admin::TweetsController < Admin::BaseController
  
  def index
    @tweets = Tweet.order(created_at: :desc).page(params[:page]).per(10)
  end

  def destroy
    @tweet = Tweet.find(params[:id])

    if current_user.admin?
      @tweet.destroy
      redirect_to admin_root_path
      flash[:alert] = "推文已刪除"
    else
      redirect_to admin_root_path
      flash[:alert] = "非禮勿刪"
    end
  end

end
