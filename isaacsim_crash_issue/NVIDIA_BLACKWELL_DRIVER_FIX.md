# Fixing NVIDIA Driver on RTX 50-Series (Blackwell) — Ubuntu 22.04

After installing `nvidia-driver-580` (or `-570`, `-595` etc.) on a machine with
an RTX 5080, the system boots to a black screen and `nvidia-smi` reports
`No devices were found` even though `lsmod` shows the kernel module loaded.

The fix is to use the **`-open` flavor** of the same driver branch
(e.g. `nvidia-driver-580-open` instead of `nvidia-driver-580`).

---

## Symptoms

- Black screen after boot; only TTY (Ctrl+Alt+F3) works.
- `nvidia-smi` → `No devices were found`.
- `lsmod | grep nvidia` shows `nvidia`, `nvidia_drm`, `nvidia_modeset`, `nvidia_uvm` loaded.
- `/var/log/Xorg.0.log` contains:
  `(EE) [drm] Failed to open DRM device for pci:0000:01:00.0: -19`
- `/proc/driver/nvidia/gpus/<bus>/information` shows:
  ```
  Video BIOS:    ??.??.??.??.??
  GPU Firmware:  N/A
  ```

## Root cause

NVIDIA RTX 50-series (Blackwell, e.g. RTX 5080 PCI ID `10de:2c02`) is **only
supported by the open-source kernel module** flavor of the NVIDIA driver. The
proprietary/closed kernel module supports up to Ada Lovelace (RTX 40-series).

On Ubuntu these are two separate packages:

| Closed (won't work on Blackwell) | Open (works on Blackwell) |
| -------------------------------- | ------------------------- |
| `nvidia-driver-580`              | `nvidia-driver-580-open`  |
| `nvidia-dkms-580`                | `nvidia-dkms-580-open`    |
| `nvidia-driver-570`              | `nvidia-driver-570-open`  |

The closed driver installs cleanly and the kernel module loads, but it cannot
enumerate the GPU — hence the "device present in `lspci`, invisible to
`nvidia-smi`" symptom.

## Diagnosis steps (how to confirm this is your problem)

```bash
# 1. Confirm the GPU is a Blackwell card (device IDs 2b**, 2c**, 2d**, 2f**).
lspci -nn | grep -i nvidia

# 2. Module loaded but no devices?
lsmod | grep nvidia
nvidia-smi

# 3. Check whether driver initialized the GPU:
cat /proc/driver/nvidia/gpus/*/information
# GPU Firmware: N/A + Video BIOS: ??.??.??.??.?? = init failed.

# 4. Confirm which driver flavor is installed:
dpkg -l | grep -E '^ii.*nvidia-(driver|dkms)-[0-9]+' | awk '{print $2}'
# If you see e.g. nvidia-driver-580 (without "-open"), that's the bug.
```

## Fix

Replace the closed driver with the `-open` variant of the same branch. Run
from a TTY (Ctrl+Alt+F3) since X won't be running.

```bash
# Replace 580 with whichever branch you want (570, 580, 595, ...).
BRANCH=580

sudo apt-get purge -y \
  "nvidia-driver-${BRANCH}" \
  "nvidia-dkms-${BRANCH}" \
  "nvidia-kernel-source-${BRANCH}" \
  "nvidia-kernel-common-${BRANCH}" \
  "nvidia-compute-utils-${BRANCH}" \
  "nvidia-utils-${BRANCH}" \
  "xserver-xorg-video-nvidia-${BRANCH}" \
  "libnvidia-cfg1-${BRANCH}" \
  "libnvidia-common-${BRANCH}" \
  "libnvidia-compute-${BRANCH}" \
  "libnvidia-decode-${BRANCH}" \
  "libnvidia-encode-${BRANCH}" \
  "libnvidia-extra-${BRANCH}" \
  "libnvidia-fbc1-${BRANCH}" \
  "libnvidia-gl-${BRANCH}"
# Catch leftovers
sudo apt-get purge -y "^.*nvidia.*${BRANCH}.*$"

sudo apt-get autoremove -y --purge
sudo apt-get update
sudo apt-get install -y "nvidia-driver-${BRANCH}-open"

sudo reboot
```

## Verification (after reboot)

```bash
nvidia-smi               # Should list your GPU.
dkms status              # nvidia/<version>, <kernel>: installed
modinfo nvidia | head -5 # filename should be /lib/modules/.../updates/dkms/nvidia.ko
```

## Notes & gotchas

- `nvidia-driver-*-open` conflicts with `nvidia-prime`. apt will remove
  `nvidia-prime` automatically — that's expected on a desktop with a single
  discrete GPU.
- The "firmware" subdirectory under `/lib/firmware/nvidia/<version>/` only
  contains `gsp_tu10x.bin` / `gsp_ga10x.bin` even on working systems. GSP
  firmware for newer architectures is shipped inside the kernel module itself,
  so missing files there are **not** the issue.
- The `-open` flavor is fine for desktop, CUDA, and Isaac Sim workloads — it
  is functionally equivalent to the closed driver from userspace.
- Branch selection: any branch from 570 onwards has Blackwell support via the
  `-open` flavor. Pick the one your app/SDK requires (e.g. Isaac Sim version
  constraints).

## TL;DR

**RTX 50-series? Always install `nvidia-driver-<branch>-open`, never
`nvidia-driver-<branch>`.**
