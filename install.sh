#!/bin/bash

KLIPPER_DIR="/home/pi/klipper"
CONFIG_DIR="/home/pi/klipper_config/klipper-custom-configs"
PLUGIN_DIR="/home/pi/klipper/klippy/extras"

BASE=$(dirname "$(readlink -f "$0")")
source "${BASE}/lib/includes"

if [ "$(whoami)" != "pi" ];then
	log error "please run from user 'pi'"
fi

if [ -d "$CONFIG_DIR" ];then
	log warn "config directory '${CONFIG_DIR}' already exists, skipping..."
else
	log info "creating symlink in '$CONFIG_DIR'"
	ln -s "${BASE}/custom" "$CONFIG_DIR"
fi

sudo cp -v "${BASE}/lib/cron" /etc/cron.d/klipper-custom-configs

for fn in $(find "${BASE}/klippy-plugins" -type f);do
	newfn="${PLUGIN_DIR}/$(basename "$fn")"
	if [ ! -f "$newfn" ];then
		ln -s "$fn" "$newfn"
	fi
done
