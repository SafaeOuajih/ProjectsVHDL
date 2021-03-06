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
	int d[3];
	int t[3];

public:
	sc_fifo_in <unsigned char> e;
    sc_fifo_out<unsigned char> s;

	SC_CTOR(Conversion)
	{
		SC_THREAD(do_conversion);
	}

    void do_conversion();
 };
