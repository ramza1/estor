class Admin::CommentsController < Admin::BaseController
  def create
    @comment = Comment.new(params[:comment])
    @comment.shop_name = requested_shop.name
    respond_to do |format|
      if @comment.save
        format.js
        format.html {redirect_to myaccount_order_url(@comment.order), notice: "Comment Sent"}
        CommentMailer.notify_user(requested_shop, @comment).deliver
      else
        format.js
        format.html {redirect_to myaccount_order_url(@comment.order), notice: "Failed to send comment"}
      end
    end
  end
end
