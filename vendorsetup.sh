export AOSP_REVISION=$(grep "default revision" ".repo/manifests/default.xml" | awk -F '/' '{print $3}' | awk -F '"' '{print $1}')

# Welcome Msg
echo "=========================================="
echo "       CardinalOS Build Environment        "
echo "=========================================="
echo "AOSP Revision: $AOSP_REVISION"

export SKIP_ABI_CHECKS="true"
