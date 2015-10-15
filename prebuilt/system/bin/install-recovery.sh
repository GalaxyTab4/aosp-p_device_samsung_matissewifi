#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10655744 cdbfc4d5d03d49d38de8d3b7924f14f7c1cd0ff5 8355840 a6f885015e2a41f615d1808f019e7c296ea43da8
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10655744:cdbfc4d5d03d49d38de8d3b7924f14f7c1cd0ff5; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:8355840:a6f885015e2a41f615d1808f019e7c296ea43da8 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery cdbfc4d5d03d49d38de8d3b7924f14f7c1cd0ff5 10655744 a6f885015e2a41f615d1808f019e7c296ea43da8:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
