/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "systemc.h"

SC_MODULE(Conversion)
{
private:
	int t[3];

public:
	//sc_fifo_in <unsigned char> e;
	sc_in < sc_uint <24>  > e0;
	sc_in < bool  > clk;
	sc_in < bool  > i_valid;
	sc_out < bool  > o_valid;
	sc_uint <24> inconv1;
 	sc_uint <24> outconv1;
	sc_out < sc_uint <24>  > outconv0;

	SC_CTOR(Conversion)
	{
		SC_CTHREAD(do_conversion,clk.pos());
		//sensitive << e;
	}

    void do_conversion();
 };
