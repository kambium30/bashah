# Buka Directory
cd ~/arrow

# Sync Repo
repo init -u https://github.com/ArrowOS/android_manifest.git -b arrow-10.0
repo sync --force-sync --no-clone-bundle -j$(nproc --all)

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
git clone https://github.com/ProtoDump/device_xiaomi_santoni -b arrow-ten device/xiaomi/santoni
git clone https://github.com/zhantech/android_kernel_xiaomi_santoni -b luuvy-4.9 kernel/xiaomi/msm8937
git clone https://github.com/ProtoDump/vendor_xiaomi -b arrow-ten vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
. build/envsetup.sh
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ubuntu"
brunch santoni

