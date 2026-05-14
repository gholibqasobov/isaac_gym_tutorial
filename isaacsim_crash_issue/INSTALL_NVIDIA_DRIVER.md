# Install a Specific NVIDIA Driver Version (Ubuntu 22.04)

Pick a branch (`570`, `580`, `595`, ...) and a flavor:

- **`-open`** → open kernel module. **Required for RTX 50-series (Blackwell).**
- **proprietary** → closed kernel module. Works for RTX 40-series and older.

## 1. Check what's available

```bash
# List available versions for a branch:
apt-cache policy nvidia-driver-580 nvidia-driver-580-open
```

## 2. Purge any currently-installed NVIDIA driver

```bash
sudo apt-get purge -y '^nvidia-.*' '^libnvidia-.*'
sudo apt-get autoremove -y --purge
```

## 3. Install the driver you want

Set the branch, then run one of the two install lines:

```bash
BRANCH=580   # or 570, 595, etc.

# --- Open kernel module (REQUIRED for RTX 50-series) ---
sudo apt-get update
sudo apt-get install -y "nvidia-driver-${BRANCH}-open"

# --- Proprietary kernel module (RTX 40-series and older) ---
sudo apt-get update
sudo apt-get install -y "nvidia-driver-${BRANCH}"
```

## 4. Reboot and verify

```bash
sudo reboot
# After reboot:
nvidia-smi
```

`nvidia-smi` should report the chosen driver version and list your GPU.

---

**RTX 50-series gotcha:** installing `nvidia-driver-<BRANCH>` (without `-open`)
on a Blackwell GPU loads the kernel module but `nvidia-smi` reports
`No devices were found` and you boot to a black screen. Always use `-open` on
RTX 50-series cards.
