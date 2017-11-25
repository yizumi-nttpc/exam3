class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    @notification = @comment.notifications.build(user_id: @topic.user.id )

    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.js { render :index }

        unless @comment.topic.user_id == current_user.id
          Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'comment_created', {
            message: 'あなたのトピックにコメントが付きました'
          })
        end

        Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'notification_created', {
          unread_counts: Notification.where(user_id: @comment.topic.user.id, read: false).count
        })

      else
        format.html { render :new }
      end
    end
  end

  def edit
    @topic = @comment.topic
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params) then
        format.html { redirect_to topic_path(@comment.topic), notice: 'コメントを更新しました。' }
        format.js { render :index }
      else
        format.html { redirect_to topic_path(@comment.topic), notice: 'コメントを更新しませんでした。' }
        format.js { render :index }
      end
    end
  end

  def destroy

    respond_to do |format|
      @comment.destroy
      format.html { redirect_to topic_path(@comment.topic), notice: 'コメントを削除しました。' }
      format.js { render :index }
    end

  end

 private

  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

end
