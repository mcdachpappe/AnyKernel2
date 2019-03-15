#!/system/bin/sh

SULIBS="/su/lib:/sbin/supersu/lib:/system/lib64:/system/lib:/sbin/magiskpolicy"

for SUPOLICY in `which supolicy sepolicy-inject`;
do
	LD_LIBRARY_PATH=$SULIBS $SUPOLICY --live \
	"allow priv_app { cache_private_backup_file unlabeled } dir getattr" \
	"allow untrusted_app sysfs_kgsl file { read write getattr open }" \
	"allow untrusted_app sysfs_kgsl dir { read write getattr open }" \
	"allow untrusted_app sysfs file { read write getattr open }" \
	"allow untrusted_app sysfs dir { read write getattr open }" \
	"allow { audioserver system_server location sensors } diag_device chr_file { read write }" \
	"allow vold logd dir read" \
	"allow vold logd lnk_file getattr" \
	"allow dumpstate theme_data_file file getattr" \
	"allow mediaserver mediaserver_tmpfs file { read write execute }" \
	"allow untrusted_app sysfs_zram dir search" \
        "allow untrusted_app sysfs_zram file { read open getattr }" \
	"allow shell dalvikcache_data_file dir write" \
	"allow perfd system_server file write" \
	"allow dumpstate fuse dir search" \
        "allow dumpstate theme_data_file file { read open }" \
        "allow dumpstate fuse file getattr" \
	"allow untrusted_app sysfs_leds dir search" \
	"allow untrusted_app sysfs_leds lnk_file read" \
	"allow untrusted_app proc_stat file { read open getattr }" \
	"allow hal_memtrack_default qti_debugfs file { read open getattr }" \
	"allow hal_perf_default kernel dir search" \
	"allow untrusted_app proc file { read open getattr }" \
	"allow hal_perf_default hal_perf_default capability kill" \
	"allow hal_perf_default kernel dir { read open }" \
	"allow hal_perf_default hal_graphics_composer_default process signull"
done

