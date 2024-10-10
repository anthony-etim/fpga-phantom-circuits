
# ********************* RO Sensors ***********************
#
# Sensor 0
#
# Modify the following items for your code:
#   1. `CLOCKREGION_X0Y4`
#       => Your custom clock region
#   2. `PATH_TO_ro*`
#       => The path to your RO sensor's ro
#   3. `set_property LOC XXX` 
#       => Choose your own location
#



create_pblock pblock_rosensor
resize_pblock [get_pblocks pblock_rosensor] -add {CLOCKREGION_X0Y4:CLOCKREGION_X0Y4}
add_cells_to_pblock [get_pblocks pblock_rosensor] [get_cells {PATH_TO_ro*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks pblock_rosensor]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_rosensor]

set_property LOC SLICE_X5Y250 [get_cells {PATH_TO_ro*}]
