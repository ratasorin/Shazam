// Address Space Parameters
`define BANKSTART       0
`define BANKSIZE        2					// split into 2 banks that will be selected by B0 and B1

`define ROWSTART        0
`define ROWSIZE			262_144; 			// each bank must have 2^18 rows for a total of 2^19 memory slots in both banks

`define COLSTART        0
`define COLSIZE         11


// Address and Data Bus Sizes
`define  MAX_ADDRESS_WIDTH           18      // total address width of the SDRAM (so we can access 2^18 memory cells in each bank)
`define  DATA_WIDTH           		 4      // width of data bus to SDRAM (we need to access elements from 0 -> 11, so 4 bits is enough)

///////////////////////////////////////
////////////	100 MHz	///////////////
parameter	INIT_PER	               = 	24000;
parameter	REF_PER		               = 	1024;
parameter	SDRAM_CAS_LATENCY		     = 	3;  // 3 clock cycles between issuing the READ command and receiving valid data
parameter	SC_RCD		                = 	3;
parameter	SC_RRD		                = 	7;
parameter	SDRAM_FULL_PAGE_BURST		 = 	1;
parameter	SDRAM_BURST_LENGTH		    = 0;

// configure the burst length according to the table in the SDRAM datasheet page 26:
parameter	SDRAM_BURST_LENGTH = 
// if A2 = 1, A1 = 1, A0 = 1 ---> Full Page Burst
(SDRAM_FULL_PAGE_BURST == 1)?	3'b111	:
// if the PAGE_MODE is 0 try:
(SDRAM_BURST_LENGTH == 1)?	3'b000	:
(SDRAM_BURST_LENGTH == 2)?	3'b001	:
(SDRAM_BURST_LENGTH == 4)?	3'b010	:
(SDRAM_BURST_LENGTH == 8)?  3'b011  ;

parameter SDRAM_BURST_TYPE = (SDRAM_FULL_PAGE_BURST == 1) ? 0 : 1; // the Burst Type when using Full Page Bursts must be Sequential (i.e: 0)

parameter SDRAM_OPERATING_MODE = 2'b00;

parameter	SDRAM_SELECTED_LATENCY_MODE		 = 	(SDRAM_CAS_LATENCY == 2) ? 3'b010: 3'b011;
