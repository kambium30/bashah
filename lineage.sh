
# Buka Directory
cd ~/lineage

# Sync Repo
repo init -u git://github.com/LineageOS/android.git -b lineage-17.1
repo sync

# Hapus Out
rm -rf out
rm -rf out/.lock

# Hapus Tree
rm -rf device/xiaomi/santoni
rm -rf kernel/xiaomi/msm8937
rm -rf vendor/xiaomi

# Hapus Toolclain
rm -rf prebuilts/clang/host/linux-x86/clang-12

# Clone Tree
git clone https://github.com/kambium30/device_xiaomi_santoni -b lineage device/xiaomi/santoni
git clone https://github.com/zhantech/android_kernel_xiaomi_santoni -b luuvy-4.9 kernel/xiaomi/msm8937
git clone https://github.com/kambium30/vendor_xiaomi_santoni -b cr-8.0-backup vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
source build/envsetup.sh
breakfast santoni
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ruyo"
croot
brunch santoni


