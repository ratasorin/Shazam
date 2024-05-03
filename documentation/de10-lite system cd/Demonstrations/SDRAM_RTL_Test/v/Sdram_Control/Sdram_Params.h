// Address Space Parameters

`define ROWSTART        10          
`define ROWSIZE         13

`define COLSTART        0
`define COLSIZE         10

`define BANKSTART       23
`define BANKSIZE        2


// Address and Data Bus Sizes
`define  SASIZE          13

`define  ASIZE           25      // total address width of the SDRAM
`define  DSIZE           16      // Width of data bus to SDRAMS

//parameter	INIT_PER	=	100;		//	For Simulation

//	Controller Parameter
////////////	133 MHz	///////////////
/*
parameter	INIT_PER	=	32000;
parameter	REF_PER		=	1536;
parameter	SDRAM_CAS_LATENCY		=	3;
parameter	SC_RCD		=	3;
parameter	SC_RRD		=	7;
parameter	SDRAM_FULL_PAGE_BURST		=	1;
parameter	SDRAM_BURST_LENGTH		=	1;
*/
///////////////////////////////////////
////////////	100 MHz	///////////////
parameter	INIT_PER	=	24000;
parameter	REF_PER		=	1024;
parameter	SDRAM_CAS_LATENCY		=	3;
parameter	SC_RCD		=	3;
parameter	SC_RRD		=	7;
parameter	SDRAM_FULL_PAGE_BURST		=	1;
parameter	SDRAM_BURST_LENGTH		=	1;
///////////////////////////////////////
////////////	50 MHz	///////////////
/*
parameter	INIT_PER	=	12000;
parameter	REF_PER		=	512;
parameter	SDRAM_CAS_LATENCY		=	3;
parameter	SC_RCD		=	3;
parameter	SC_RRD		=	7;
parameter	SDRAM_FULL_PAGE_BURST		=	1;
parameter	SDRAM_BURST_LENGTH		=	1;
*/
///////////////////////////////////////

//	SDRAM Parameter
parameter	SDRAM_BURST_LENGTH		=	(SDRAM_FULL_PAGE_BURST == 1)?	3'b111	:
							(SDRAM_BURST_LENGTH == 1)?	3'b000	:
							(SDRAM_BURST_LENGTH == 2)?	3'b001	:
							(SDRAM_BURST_LENGTH == 4)?	3'b010	:
											3'b011	;
parameter	SDRAM_BURST_TYPE		=	1'b0;	//	Sequential
							//	1'b1:	//	Interteave
parameter	SDRAM_SELECTED_LATENCY_MODE		=	(SDRAM_CAS_LATENCY == 2)?	3'b10:
											3'b11;
 	
