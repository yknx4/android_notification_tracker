class StatusBarNotificationsController < ApplicationController
  before_action :set_status_bar_notification, only: [:show, :edit, :update, :destroy]

  # GET /status_bar_notifications
  # GET /status_bar_notifications.json
  def index
    @status_bar_notifications = StatusBarNotification.all
  end

  # GET /status_bar_notifications/1
  # GET /status_bar_notifications/1.json
  def show
  end

  # GET /status_bar_notifications/new
  def new
    @status_bar_notification = StatusBarNotification.new
  end

  # GET /status_bar_notifications/1/edit
  def edit
  end

  # POST /status_bar_notifications
  # POST /status_bar_notifications.json
  def create
    @status_bar_notification = StatusBarNotification.new(status_bar_notification_params)

    respond_to do |format|
      if @status_bar_notification.save
        format.html { redirect_to @status_bar_notification, notice: 'Status bar notification was successfully created.' }
        format.json { render :show, status: :created, location: @status_bar_notification }
      else
        format.html { render :new }
        format.json { render json: @status_bar_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_bar_notifications/1
  # PATCH/PUT /status_bar_notifications/1.json
  def update
    respond_to do |format|
      if @status_bar_notification.update(status_bar_notification_params)
        format.html { redirect_to @status_bar_notification, notice: 'Status bar notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_bar_notification }
      else
        format.html { render :edit }
        format.json { render json: @status_bar_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_bar_notifications/1
  # DELETE /status_bar_notifications/1.json
  def destroy
    @status_bar_notification.destroy
    respond_to do |format|
      format.html { redirect_to status_bar_notifications_url, notice: 'Status bar notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_bar_notification
      @status_bar_notification = StatusBarNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_bar_notification_params
      params.require(:status_bar_notification).permit(:group_key, :id, :key, :override_group_key, :post_time_ms, :post_time, :tag, :android_user_id, :is_clearable, :is_group, :is_ongoing, :android_notification_id, :package_name, :location_id)
    end
end
