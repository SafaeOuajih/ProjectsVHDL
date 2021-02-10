/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "systemc.h"

SC_MODULE(Mod2)
{
private:
	int t[3];

public:
	sc_in < sc_uint <8> > in0;
	sc_in < sc_uint <8> > in1;
	sc_in < sc_uint <8> > in2;
	sc_in <bool> clk;
	sc_in <bool> o_valid;

//bool clk;
    sc_fifo_out<unsigned char> s;

	SC_CTOR(Mod2)
	{
		SC_CTHREAD(mod2,clk.pos());
		//sensitive << e;
	}

    void mod2();
 };
