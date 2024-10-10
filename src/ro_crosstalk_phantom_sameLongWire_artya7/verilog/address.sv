
// Top definitions

// UART protocol
`define SET_PHANTOM_DATA_ADDR               8'b0000_0001
`define SET_START_CROSSTALK_ADDR            8'b0000_0010
`define GET_PHANTOM_RECEIVER_STATUS_ADDR    8'b0000_0011
`define GET_FINAL_DATA_ADDR                 8'b0000_0100
`define SET_CLOCKS_PER_BIT_ADDR             8'b0000_0101
`define SET_THRESHOLD_ADDR                  8'b0000_0110
`define GET_DEBUG_ROCOUNTS_ZERO_ADDR        8'b0000_0111
`define GET_DEBUG_ROCOUNTS_ONE_ADDR         8'b0000_1000
`define GET_DEBUG_ROCOUNTS_TWO_ADDR         8'b0000_1001
`define GET_DEBUG_ROCOUNTS_THREE_ADDR       8'b0000_1010
`define GET_DEBUG_ROCOUNTS_FOUR_ADDR        8'b0000_1011
`define GET_DEBUG_ROCOUNTS_FIVE_ADDR        8'b0000_1100
`define GET_DEBUG_ROCOUNTS_SIX_ADDR         8'b0000_1101
`define GET_DEBUG_ROCOUNTS_SEVEN_ADDR       8'b0000_1110
`define GET_DEBUG_TX_WIRE_ADDR              8'b0000_1111

// TDC protocol
`define TDC_SET_START_ADDR                  8'b0001_0001
`define TDC_SET_RESET_ADDR                  8'b0001_0010
`define TDC_SET_MEASUREMENT_NUM_ADDR        8'b0001_0011
`define TDC_SET_CONFIG_ADDR                 8'b0001_0100
`define TDC_SET_COARSE_ADDR                 8'b0001_0101
`define TDC_SET_FINE_ADDR                   8'b0001_0110

`define TDC_GET_STATUS_ADDR                 8'b0010_0001
`define TDC_GET_FIFO0_ADDR                  8'b0010_0010
`define TDC_GET_FIFO1_ADDR                  8'b0010_0011
`define TDC_GET_FIFO2_ADDR                  8'b0010_0100
`define TDC_GET_FIFO3_ADDR                  8'b0010_0101
`define TDC_GET_FIFO4_ADDR                  8'b0010_0110
`define TDC_GET_FIFO5_ADDR                  8'b0010_0111
`define TDC_GET_FIFO6_ADDR                  8'b0010_1000
`define TDC_GET_FIFO7_ADDR                  8'b0010_1001

// Debug
`define SET_TX_RO_ADDR                      8'b0011_0001



// Full phantum functions
`define SET_SW_RST_ADDR                     8'b0100_0000
`define SET_PHANTOM_START_ADDR              8'b0100_0001
`define SET_TX_WIRE_TT_ADDR                 8'b0100_0010
`define SET_DELAY_PH_ADDR                   8'b0100_0011
`define SET_DELAY_TX_ADDR                   8'b0100_0100

`define GET_DEBUG0_PHAN_ADDR                8'b0101_0000
`define GET_DEBUG1_PHAN_ADDR                8'b0101_0001

`define GET_PHAN_FIFO_0_ADDR                8'b0110_0000
`define GET_PHAN_FIFO_1_ADDR                8'b0110_0001
`define GET_PHAN_FIFO_2_ADDR                8'b0110_0010
`define GET_PHAN_FIFO_3_ADDR                8'b0110_0011
`define GET_PHAN_FIFO_4_ADDR                8'b0110_0100

