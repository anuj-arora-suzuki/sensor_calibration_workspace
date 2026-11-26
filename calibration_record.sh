set -euo pipefail

OUT_NAME="${1:-rosbag_$(date +%Y%m%d_%H%M%S)}"

rm -rf "$OUT_NAME"

echo "Starting ros2 bag record (filtered topics with regex) -> $OUT_NAME  [storage=sqlite3]"
exec ros2 bag record \
    --storage sqlite3 \
    -o "$OUT_NAME" \
    -e "\
/tf_static$|\
/tf$|\
/ros_out$|\
/parameter_events$|\
/events_read_splits$|\
/sensing/lidar/top/pointcloud$|\
/sensing/lidar/front_center/pointcloud$|\
/sensing/lidar/back_center/pointcloud$|\
/sensing/lidar/top/pointcloud_raw|\
/sensing/lidar/front_center/pointcloud_raw|\
/sensing/lidar/back_center/pointcloud_raw"
