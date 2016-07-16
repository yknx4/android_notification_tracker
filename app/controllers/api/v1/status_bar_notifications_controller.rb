class Api::V1::StatusBarNotificationsController < Api::V1::V1BaseController
  before_action :set_status_bar_notification, only: [:show, :edit, :update, :destroy]
  before_action :decorate_params, only: [:update, :create]

  def index
    @status_bar_notifications = StatusBarNotification.all
    render json: @status_bar_notifications
  end

  def show
  end

  def new
    @status_bar_notification = StatusBarNotification.new
  end

  def edit
  end

  def create
    status_bar_notification = StatusBarNotification.new(status_bar_notification_params)

    if status_bar_notification.save
      render json: status_bar_notification
    else
      render json: status_bar_notification.errors, status: :unprocessable_entity
    end


  end

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

  def destroy
    @status_bar_notification.destroy
    respond_to do |format|
      format.html { redirect_to status_bar_notifications_url, notice: 'Status bar notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_status_bar_notification
      @status_bar_notification = StatusBarNotification.find(params[:id])
    end

    def decorate_params
      return unless params[:status_bar_notification].present? and params[:status_bar_notification][:notification_attributes].present? and params[:status_bar_notification][:notification_attributes][:extras].present?
      extras = params[:status_bar_notification][:notification_attributes][:extras]

      if extras.present?
        attributes = {}
        attributes[:content] = extras

        android_data = extras['mMap'] || {}

        android_data.each do |key, value|
          next unless key.include? 'android.'
          att_key = key.gsub('android.', '').underscore
          attributes[att_key] = value
        end

        params[:status_bar_notification][:notification_attributes][:notification_extra_attributes] = attributes
      end

    end

    def array_params(array)
      array ||= []
      if array.first.is_a?(Array)
        array_params(array.first)
      elsif array.first.is_a?(Hash)
        hash_params(array.first)
      else
        []
      end
    end

    def hash_params(hash)
      hash ||= {}
      hash.map do |key, value|
        if value.is_a?(Hash)
          hash_strong_params = {}
          hash_strong_params[key] = hash_params value
          hash_strong_params
        elsif value.is_a?(Array)
          hash_strong_params = {}
          hash_strong_params[key] = array_params value
          hash_strong_params
        else
          key.to_sym
        end
      end
    end

  def notification_extra_present?
    params[:status_bar_notification].present? and
        params[:status_bar_notification][:notification_attributes].present? and
        params[:status_bar_notification][:notification_attributes][:extras].present?
  end

  def location_extra_present?
    params[:status_bar_notification].present? and
        params[:status_bar_notification][:location_attributes].present? and
        params[:status_bar_notification][:location_attributes][:extras].present?
  end

    def status_bar_notification_params

      notification_extra_content = params[:status_bar_notification][:notification_attributes][:extras] if notification_extra_present?

      content_permitted_params = hash_params(notification_extra_content)

      location_permitted_params = {}
      if has_location?
        location_extra = params[:status_bar_notification][:location_attributes][:extras] if location_extra_present?
        location_permitted_params = hash_params(location_extra)
      end


      params
          .require(:status_bar_notification)
          .permit(
              :group_key,
              :id,
              :key,
              :override_group_key,
              :post_time_ms,
              :post_time,
              :tag,
              :android_user_id,
              :is_clearable,
              :is_group,
              :is_ongoing,
              :android_notification_id,
              :package_name,
              :location_id,
              location_attributes: [
                  :accuracy,
                  :altitude,
                  :bearing,
                  :elapsed_real_time_nanos,
                  :latitude,
                  :longitude,
                  :provider,
                  :speed,
                  :time,
                  extras: location_permitted_params
              ],
              notification_attributes: [
                  :ticker_text,
                  :when_ms,
                  :visibility,
                  :priority,
                  :number,
                  :icon_level,
                  :flags,
                  :defaults,
                  :color,
                  :category,
                  notification_extra_attributes: [
                      :big_text,
                      :conversation_title,
                      :info_text,
                      :people,
                      :progress,
                      :progress_indeterminate,
                      :progress_max,
                      :remote_input_history,
                      :self_display_name,
                      :sub_text,
                      :summary_text,
                      :text,
                      :text_lines,
                      :title,
                      :title_big,
                      content: content_permitted_params
                  ]
              ]
          )
    end

  def has_location?
    params[:status_bar_notification][:location_attributes].present?
  end
end
