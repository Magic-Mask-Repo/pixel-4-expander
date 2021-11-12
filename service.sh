#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread
magiskpolicy --live "auditallow untrusted_app * * *"

###########
# MINIMAL #
###########

# allow everything in class unix_stream_socket
magiskpolicy --live "allow untrusted_app * unix_stream_socket *"
magiskpolicy --live "allow untrusted_app_29 * unix_stream_socket *"
# this is what was lefter over from the previous
magiskpolicy --live "allow untrusted_app sysfs_net dir { search }"
magiskpolicy --live "allow untrusted_app proc file { read }"
magiskpolicy --live "allow untrusted_app qdsp_device chr_file *"
magiskpolicy --live "allow untrusted_app hexagon_halide_file file *"
magiskpolicy --live "allow untrusted_app easel_device chr_file *"
magiskpolicy --live "allow hal_camera_default camera_vendor_data_file dir *"