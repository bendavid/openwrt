#
# Copyright (c) 2014 The Linux Foundation. All rights reserved.
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/C2600
	NAME:=TP-Link Archer C2600
	PACKAGES:= \
		kmod-usb-core kmod-usb-ohci kmod-usb2 kmod-ledtrig-usbdev \
		kmod-usb3 kmod-usb-dwc3-qcom kmod-usb-phy-qcom-dwc3 \
		kmod-ath10k ath10k-firmware-qca99x0 wpad-mini
endef

define Profile/C2600/Description
	Package set for the TP-Link Archer C2600.
endef
$(eval $(call Profile,C2600))
