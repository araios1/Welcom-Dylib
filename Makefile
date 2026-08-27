TARGET := iphone:clang:latest:14.0
INSTALL_TYPE := package

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WelcomeASDev

WelcomeASDev_FILES = Tweak.x
WelcomeASDev_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
