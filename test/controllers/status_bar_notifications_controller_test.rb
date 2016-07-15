require 'test_helper'

class StatusBarNotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_bar_notification = status_bar_notifications(:one)
  end

  test "should get index" do
    get status_bar_notifications_url
    assert_response :success
  end

  test "should get new" do
    get new_status_bar_notification_url
    assert_response :success
  end

  test "should create status_bar_notification" do
    assert_difference('StatusBarNotification.count') do
      post status_bar_notifications_url, params: { status_bar_notification: { android_notification_id: @status_bar_notification.android_notification_id, android_user_id: @status_bar_notification.android_user_id, group_key: @status_bar_notification.group_key, id: @status_bar_notification.id, is_clearable: @status_bar_notification.is_clearable, is_group: @status_bar_notification.is_group, is_ongoing: @status_bar_notification.is_ongoing, key: @status_bar_notification.key, location_id: @status_bar_notification.location_id, override_group_key: @status_bar_notification.override_group_key, package_name: @status_bar_notification.package_name, post_time: @status_bar_notification.post_time, post_time_ms: @status_bar_notification.post_time_ms, tag: @status_bar_notification.tag } }
    end

    assert_redirected_to status_bar_notification_url(StatusBarNotification.last)
  end

  test "should show status_bar_notification" do
    get status_bar_notification_url(@status_bar_notification)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_bar_notification_url(@status_bar_notification)
    assert_response :success
  end

  test "should update status_bar_notification" do
    patch status_bar_notification_url(@status_bar_notification), params: { status_bar_notification: { android_notification_id: @status_bar_notification.android_notification_id, android_user_id: @status_bar_notification.android_user_id, group_key: @status_bar_notification.group_key, id: @status_bar_notification.id, is_clearable: @status_bar_notification.is_clearable, is_group: @status_bar_notification.is_group, is_ongoing: @status_bar_notification.is_ongoing, key: @status_bar_notification.key, location_id: @status_bar_notification.location_id, override_group_key: @status_bar_notification.override_group_key, package_name: @status_bar_notification.package_name, post_time: @status_bar_notification.post_time, post_time_ms: @status_bar_notification.post_time_ms, tag: @status_bar_notification.tag } }
    assert_redirected_to status_bar_notification_url(@status_bar_notification)
  end

  test "should destroy status_bar_notification" do
    assert_difference('StatusBarNotification.count', -1) do
      delete status_bar_notification_url(@status_bar_notification)
    end

    assert_redirected_to status_bar_notifications_url
  end
end
