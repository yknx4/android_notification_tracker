require 'rails_helper'

RSpec.describe Api::V1::StatusBarNotificationsController, type: :controller do

  let(:json) { '{"android_notification_id":2130968651,"package_name":"com.samsung.android.securitylogagent","post_time_ms":1468613872134,"is_clearable":true,"is_ongoing":false,"notification_attributes":{"ticker_text":"Unauthorized actions have been detected. Restart your device to undo any unauthorized changes.","when_ms":0,"defaults":0,"flags":24,"icon_level":0,"priority":0,"extras":{"mAllowFds":true,"mFdsKnown":true,"mHasFds":false,"mMap":{"android.title":"Security notice","android.showChronometer":false,"android.icon":2130837505,"android.text":"Unauthorized actions have been detected. Restart your device to undo any unauthorized changes.","android.progress":0,"android.progressMax":0,"android.showWhen":true,"android.rebuild.applicationInfo":{"accessInfo":0,"agentType":1,"allowCategory":"0,2-1023","allowedAgentType":1,"bbccategory":1023,"category":0,"compatibleWidthLimitDp":0,"dataDir":"/data/user/0/com.samsung.android.securitylogagent","descriptionRes":0,"dssScale":1,"enabled":true,"enabledSetting":0,"flags":952680005,"fullBackupContent":0,"installLocation":-1,"largestWidthLimitDp":0,"nativeLibraryDir":"/system/app/SecurityLogAgent/lib/arm","nativeLibraryRootDir":"/system/app/SecurityLogAgent/lib","nativeLibraryRootRequiresIsa":true,"overrideRes":0,"primaryCpuAbi":"armeabi-v7a","privateFlags":0,"processName":"com.samsung.android.securitylogagent","publicSourceDir":"/system/app/SecurityLogAgent/SecurityLogAgent.apk","requiresSmallestWidthDp":0,"scanPublicSourceDir":"/system/app/SecurityLogAgent","scanSourceDir":"/system/app/SecurityLogAgent","seinfo":"platform","sourceDir":"/system/app/SecurityLogAgent/SecurityLogAgent.apk","targetSdkVersion":23,"taskAffinity":"com.samsung.android.securitylogagent","theme":2131099648,"uiOptions":0,"uid":1000,"versionCode":433400100,"banner":0,"icon":2130837506,"isElasticEnabled":false,"labelRes":2130968678,"logo":0,"metaData":{"mAllowFds":true,"mFdsKnown":true,"mHasFds":false,"mParcelledData":{"mNativePtr":-1266789448,"mNativeSize":0,"mOwnsNativeParcelObject":true}},"packageName":"com.samsung.android.securitylogagent","resIdOffset":0,"showUserIcon":-10000},"android.originatingUserId":0,"android.progressIndeterminate":false,"headsup":0}},"color":0,"visibility":0},"location_attributes":{"accuracy":30,"altitude":0,"bearing":0,"elapsed_real_time_nanos":314740325000000,"latitude":19.2651665,"longitude":-103.7106405,"provider":"fused","speed":0,"time":1468613838481},"group_key":"0|com.samsung.android.securitylogagent|2130968651|null|1000","key":"0|com.samsung.android.securitylogagent|2130968651|null|1000"}' }

  before do

  end

  describe 'create' do
    it 'should create a status bar notification with all its nested elements' do

      params = {
          status_bar_notification: JSON.parse(json)
      }

      post :create, params
      expect(StatusBarNotification.all.exists?).to eq(true)
      expect(Notification.all.exists?).to eq(true)
      expect(NotificationExtra.all.exists?).to eq(true)
      expect(Location.all.exists?).to eq(true)
    end
  end

end
