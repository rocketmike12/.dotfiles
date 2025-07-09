IFS=' / ' read -r -a array <<< $(pactl get-sink-volume alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink)
echo "${array[3]}"
