rm -rf .repo/local_manifests/

#repo init
repo init --depth=1 --no-repo-verify -u https://github.com/yaap/manifest.git -b fifteen -g default,-mips,-darwin,-notdefault
echo "=================="
echo "Repo init success"
echo "=================="

#local_manifest
git clone https://github.com/blazey66/local_manifests.git -b yaap .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

#Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=Blazey66
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

#build
lunch yaap_mi439-user && m yaap
