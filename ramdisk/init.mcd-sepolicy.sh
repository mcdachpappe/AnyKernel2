#!/system/bin/sh

supolicy --live \
    "allow init rootfs file execute_no_trans" \
    "allow { init modprobe } rootfs system module_load" \
    "allow init { system_file vendor_file vendor_configs_file } file mounton" \
    "allow { msm_irqbalanced hal_perf_default } { rootfs kernel } file { getattr read open } " \
    "allow { msm_irqbalanced hal_perf_default } { rootfs kernel } dir { getattr read open } " \
;

echo "mcd: mcd-sepolicy executed" > /dev/kmsg