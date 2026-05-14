#!/usr/bin/env bash
# Switch from nvidia-driver-595-open to nvidia-driver-580-open.
# RTX 5080 (Blackwell) requires the -open kernel module flavor; the closed
# driver loads but cannot enumerate the GPU.
set -euo pipefail

echo ">>> Step 1/4: Purging 595-open driver packages..."
apt-get purge -y \
  'nvidia-driver-595-open' \
  'nvidia-dkms-595-open' \
  'nvidia-kernel-source-open-595' \
  'nvidia-kernel-source-595-open' \
  'nvidia-driver-595' \
  'nvidia-dkms-595' \
  'nvidia-kernel-source-595' \
  'nvidia-kernel-common-595' \
  'nvidia-compute-utils-595' \
  'nvidia-utils-595' \
  'nvidia-firmware-595-595.58.03' \
  'xserver-xorg-video-nvidia-595' \
  'libnvidia-cfg1-595' \
  'libnvidia-common-595' \
  'libnvidia-compute-595' \
  'libnvidia-compute-595:i386' \
  'libnvidia-decode-595' \
  'libnvidia-decode-595:i386' \
  'libnvidia-encode-595' \
  'libnvidia-encode-595:i386' \
  'libnvidia-extra-595' \
  'libnvidia-fbc1-595' \
  'libnvidia-fbc1-595:i386' \
  'libnvidia-gl-595' \
  'libnvidia-gl-595:i386' \
  2>/dev/null || true
apt-get purge -y '^.*nvidia.*595.*$' 2>/dev/null || true

echo ""
echo ">>> Step 2/4: Cleaning up orphans..."
apt-get autoremove -y --purge

echo ""
echo ">>> Step 3/4: Installing nvidia-driver-580-open..."
apt-get update
apt-get install -y nvidia-driver-580-open

echo ""
echo ">>> Step 4/4: Verifying..."
echo "--- Installed nvidia driver/dkms/kernel packages ---"
dpkg -l | grep -E "^ii.*nvidia" | grep -v '^ii.*libnvidia' | awk '{print $2, $3}'
echo ""
echo "--- DKMS status ---"
dkms status 2>/dev/null || true
echo ""
echo "--- nvidia.ko in /lib/modules/$(uname -r) ---"
find /lib/modules/$(uname -r) -name 'nvidia*.ko*' 2>&1
echo ""
echo "--- modinfo (license/version) ---"
modinfo /lib/modules/$(uname -r)/updates/dkms/nvidia.ko 2>/dev/null | grep -E "^(license|version|filename):"
echo ""
echo ">>> Done. If DKMS reports 'installed' for 580 and nvidia.ko exists, reboot:"
echo ">>>   sudo reboot"
