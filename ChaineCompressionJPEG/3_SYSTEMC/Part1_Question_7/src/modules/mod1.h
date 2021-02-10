#include "systemc.h"

SC_MODULE(Mod1)
{
private:
	int t[3];

public:
    sc_fifo_in <unsigned char> e;
    // sc_fifo_out<unsigned char> s;
    sc_out < sc_uint <24>  > out0;
		sc_out <bool> i_valid;
    sc_in < bool > clk;
//bool clk;
	SC_CTOR(Mod1)
	{
		SC_CTHREAD(mod1,clk.pos());
		//sensitive << e;
	}

    void mod1();
 };
