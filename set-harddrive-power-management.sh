#!/bin/sh

set -- \
    /dev/disk/by-id/scsi-SATA_WDC_WD140EDGZ-11_9LH51ZBG \
    /dev/disk/by-id/scsi-SATA_WDC_WD140EDFZ-11_QBH1LSAT \
    /dev/disk/by-id/scsi-SATA_WDC_WD140EDFZ-11_X1GH3GLL \
    /dev/disk/by-id/scsi-SATA_ST18000NM003D-3D_ZVTB4SA5 \
    /dev/disk/by-id/scsi-SATA_WDC_WD180EDGZ-11_8LGD8JRK \
    /dev/disk/by-id/scsi-SATA_WDC_WD120EMAZ-11_5PGJT29C \
    /dev/disk/by-id/scsi-SATA_WDC_WD120EMFZ-11_Z2H8HE0T \
    /dev/disk/by-id/scsi-SATA_WDC_WD140EDFZ-11_9LGA6YWA \
    /dev/disk/by-id/scsi-SATA_ST14000NM001G-2K_ZL2D3HY7 \
    /dev/disk/by-id/scsi-SATA_ST14000NM001G-2K_ZL2D12AX \
    /dev/disk/by-id/scsi-SATA_ST14000NM000J-2T_ZR516PR9 \
    /dev/disk/by-id/scsi-SATA_ST18000NM000J-2T_ZR5BA9B5 \
    /dev/disk/by-id/scsi-SATA_WDC_WD180EDGZ-11_3LGHSB2U \
    /dev/disk/by-id/scsi-SATA_WDC_WD180EDGZ-11_3GKK6M2K

# set -- \
#     /dev/disk/by-id/scsi-SATA_ST18000NM003D-3D_ZVTB4SA5 \
#     /dev/disk/by-id/scsi-SATA_ST14000NM001G-2K_ZL2D3HY7 \
#     /dev/disk/by-id/scsi-SATA_ST14000NM001G-2K_ZL2D12AX \
#     /dev/disk/by-id/scsi-SATA_ST14000NM000J-2T_ZR516PR9 \
#     /dev/disk/by-id/scsi-SATA_ST18000NM000J-2T_ZR5BA9B5 \

# set -- \
#     /dev/disk/by-id/scsi-SATA_WDC_WD140EDGZ-11_9LH51ZBG \
#     /dev/disk/by-id/scsi-SATA_WDC_WD140EDFZ-11_QBH1LSAT \
#     /dev/disk/by-id/scsi-SATA_WDC_WD140EDFZ-11_X1GH3GLL \
#     /dev/disk/by-id/scsi-SATA_WDC_WD180EDGZ-11_8LGD8JRK \
#     /dev/disk/by-id/scsi-SATA_WDC_WD120EMAZ-11_5PGJT29C \
#     /dev/disk/by-id/scsi-SATA_WDC_WD120EMFZ-11_Z2H8HE0T \
#     /dev/disk/by-id/scsi-SATA_WDC_WD140EDFZ-11_9LGA6YWA \
#     /dev/disk/by-id/scsi-SATA_WDC_WD180EDGZ-11_3LGHSB2U \
#     /dev/disk/by-id/scsi-SATA_WDC_WD180EDGZ-11_3GKK6M2K

openseachest_powercontrol_command="/usr/bin/openSeaChest/openSeaChest_PowerControl --noBanner"

feature_support() {
    # feature_support <device_info_output> <feature_name>
    device_info_output=$1
    feature_name=$2

    feature_support=$(echo "$device_info_output" | grep -i $feature_name)
    if [ $? -eq 0 ]; then
        echo "$feature_name supported"

        feature_status=$(echo "$feature_support" | grep "Enabled")

        if [ $? -eq 0 ]; then
            echo "$feature_name enabled"
        else
            echo "$feature_name disabled"
        fi
    else
        echo "$feature_name not supported"
    fi
}

feature_status() {
    # feature_support <device_info_output> <feature_name>
    device_info_output=$1
    feature_name=$2

    feature_status=$(echo "$device_info_output" | grep -i "$feature_name [Enabled]")
    if [ $? -eq 0 ]; then
        echo "$feature_name enabled"
    else
        echo "$feature_name disabled"
    fi
}

for drive in "$@"; do
    echo "$drive"
    power_mode=$($openseachest_powercontrol_command --device $drive --checkPowerMode | grep Device | sed 's/^.*Device is in the \(.*$\)/\1/')
    # device_info=$($openseachest_powercontrol_command --device $drive --deviceInfo)
    # apm_feature=$(echo "$device_info" | grep APM)
    # if [ $? -eq 0 ]; then
    #     apm_supported=true
    #     echo "apm supported"
    # else
    #     apm_supported=false
    #     echo "apm not supported"
    # fi
    # feature_support "$device_info" "APM"
    # feature_support "$device_info" "EPC"

    # power_mode=$(smartctl -i -n standby $drive | grep "Power mode")
    # apm_level=$(hdparm -B $drive | grep APM | cut --delimiter='=' --field=2 | tr --delete '[:space:]')
    
    echo $power_mode
    # echo "[$apm_level]"
    echo ---
    # $openseachest_powercontrol_command --device $drive --idle_c enable
    # $openseachest_powercontrol_command --device $drive --setAPMLevel 254
    # $openseachest_powercontrol_command --device $drive --disableAPM
    # $openseachest_powercontrol_command --device $drive --EPCfeature enable
    # $openseachest_powercontrol_command --device $drive --idle_a enable
    # $openseachest_powercontrol_command --device $drive --idle_b enable
    # $openseachest_powercontrol_command --device $drive --idle_c 900000
    # $openseachest_powercontrol_command --device $drive --idle_c disable
    # $openseachest_powercontrol_command --device $drive --showEPCSettings
done