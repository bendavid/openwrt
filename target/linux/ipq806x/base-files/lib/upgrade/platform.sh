. /lib/ipq806x.sh

PART_NAME=firmware

platform_check_image() {
	local board=$(ipq806x_board_name)

	case "$board" in
	AP148 |\
	r7500)
		nand_do_platform_check $board $1
		return $?;
		;;
	c2600)
		local magic_long="$(get_magic_long "$1")"
		[ "$magic_long" != "27051956" ] && {
			echo "Invalid image, bad magic: $magic_long"
			return 1
		}
		return 0;
		;;
	*)
		return 1;
	esac
}

platform_pre_upgrade() {
	local board=$(ipq806x_board_name)

	case "$board" in
	AP148 |\
	r7500)
		nand_do_upgrade "$1"
		;;
	esac
}

platform_do_upgrade() {
	local board=$(ipq806x_board_name)

	case "$board" in
	c2600)
		platform_do_upgrade_c2600 "$ARGV"
		;;
	esac
}

platform_do_upgrade_c2600() {
	local kernpart="0:HLOS"
	local rootfspart="rootfs"
	
	local kernel_mtd="$(find_mtd_index $kernpart)"
	
	local kerndev="/dev/mtd${kernel_mtd}"
	local rootfsdev=$rootfspart
	
	PART_NAME="${kerndev}:${rootfsdev}"
	MTD_CONFIG_ARGS="-s 0x200000"
		
	default_do_upgrade "$ARGV"
	
}
