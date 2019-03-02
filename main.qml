import QtQuick 2.9
import QtQuick.Window 2.2
import QmlBanner 1.0
import QmlRewardedVideoAd 1.0
import QmlInterstitialAd 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    id: window
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Hello World")

    Text {
        id: hello_text
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

    Item {
        id: screen
        width: window.width
        height: window.height
    }

    QmlBanner
    {
        id: banner_ad

        //This is test ad, more information:
        //https://developers.google.com/admob/android/test-ads
        unitId: "ca-app-pub-3940256099942544/6300978111"

        bannerSize: QmlBanner.LARGE_BANNER

        //This ad will be in the bottom
        x: (window.width - width) * Screen.devicePixelRatio / 2
        y: (window.height - height) * Screen.devicePixelRatio

        visible: true

        testDeviceId: "41E647017EBEBB0650DAE627391B7A43"

        onBannerClosed: {}
        onBannerFailedToLoad: {}
        onBannerLeftApplication: {}
        onBannerLoaded: {}
        onBannerOpened: {}
    }

    QmlInterstitialAd
    {
        id: interstitial_ad

        //This is test ad, more information:
        //https://developers.google.com/admob/android/test-ads
        unitId: "ca-app-pub-3940256099942544/1033173712"

        testDeviceId: "41E647017EBEBB0650DAE627391B7A43"

        onInterstitialAdClosed: {
            interstitial_ad_status.text = "interstitial ad closed"
        }
        onInterstitialAdFailedToLoad: {
            interstitial_ad_status.text = "interstitial ad failed to load error code = " + errorCode
        }
        onInterstitialAdLeftApplication: {}
        onInterstitialAdLoaded: {
            interstitial_ad_status.text = "interstitial ad loaded"
        }
        onInterstitialAdOpened: {}
    }

    Button
    {
        id: interstitial_ad_button
        width: screen.width/3
        anchors.left: screen.left
        style: ButtonStyle
        {
            label: Text {
                width: interstitial_ad_button.width
                text: "show interstitial ad"
            }
        }
        onClicked: interstitial_ad.showInterstitialAd()
    }

    Text {
        id: interstitial_ad_status
        width: screen.width/3
        anchors.top: interstitial_ad_button.bottom
        anchors.left: screen.left
    }

    QmlRewardedVideoAd
    {
        id: video_ad

        //This is test ad, more information:
        //https://developers.google.com/admob/android/test-ads
        unitId: "ca-app-pub-3940256099942544/5224354917"

        testDeviceId: "41E647017EBEBB0650DAE627391B7A43"

        onRewarded: {}
        onRewardedVideoAdClosed: {
            video_ad_status.text = "video ad closed"
        }
        onRewardedVideoAdFailedToLoad: {
            video_ad_status.text = "video ad failed to load error code = " + errorCode
        }
        onRewardedVideoAdLeftApplication: {}
        onRewardedVideoAdLoaded: {
            video_ad_status.text = "video ad loaded"
        }
        onRewardedVideoAdOpened: {}
        onRewardedVideoCompleted: {}
        onRewardedVideoStarted: {}
    }

    Button
    {
        id: video_ad_button
        width: screen.width/3
        anchors.right: screen.right
        style: ButtonStyle
        {
            label: Text {
                width: video_ad_button.width
                text: "show video ad"
            }
        }
        onClicked: video_ad.show()
    }

    Text {
        id: video_ad_status
        width: screen.width/3
        anchors.top: video_ad_button.bottom
        anchors.right: screen.right
    }

    Component.onCompleted:
    {
        banner_ad.loadBanner()
        interstitial_ad.loadInterstitialAd()
        video_ad.loadRewardedVideoAd()
    }
}
