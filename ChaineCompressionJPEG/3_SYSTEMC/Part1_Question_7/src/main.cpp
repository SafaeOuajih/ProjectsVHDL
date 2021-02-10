#include "./analyseur/ImageOut.h"
#include "./gene/ImageIn.h"
#include "./modules/Conversion.h"
#include "./modules/ConversionInverse.h"
#include "./modules/mod1.h"
#include "./modules/mod2.h"
#include <iostream>
#include "systemc.h"
#include <math.h>

using namespace std;

// POUR EVITER LES DISTORTIONS, IL EST NECESSAIRE D'ULISER DES CANAUX DE TYPE
// INT CAR SINON LES TRONCATURES INT => UNSIGNED INT SONT FAUSSE !
int main (int argc, char * argv []){
	cout << "Initialisation des composants..." << endl;
	ImageIn      		gene ("Data_Generator_1");
	Conversion 			conv ("conversion");
	ConversionInverse 	iconv("iConversion");
	ImageOut 			term ("Terminal_1");
	Mod1 mod1("Mod1..");
	Mod2 mod2("Mod2..");
	cout << "Creation des signaux d'interconnexion..." << endl;
	sc_fifo<unsigned char>  s1("FIFO_1", 128);
	sc_fifo<unsigned char>  s2("FIFO_2", 128);
	sc_fifo<unsigned char>  s3("FIFO_3", 128);

	sc_signal< sc_uint <8> >  sig1;
	sc_signal< sc_uint <8> >  sig2;
	sc_signal< sc_uint <8> >  sig3;
	sc_clock clock("TestClock", 10, SC_NS, 0.5);
	sc_signal< bool >  i_valid1;
	sc_signal< bool >  o_valid1;

	sc_signal<sc_uint <8> >  sig11;
	sc_signal< sc_uint <8> >  sig22;
	sc_signal< sc_uint <8> >  sig33;

	cout << "Mapping des composants..." << endl;

	gene.s(s1);
	mod1.e(s1);
	mod1.clk(clock);
	mod2.clk(clock);

	mod1.i_valid(i_valid1);
  conv.i_valid(i_valid1);
	conv.o_valid(o_valid1);
	mod2.o_valid(o_valid1);


	mod1.out0(sig1);
	mod1.out1(sig2);
	mod1.out2(sig3);

	conv.e0(sig1);
	conv.e1(sig2);
	conv.e2(sig3);

	conv.outconv0(sig11);
	conv.outconv1(sig22);
	conv.outconv2(sig33);

	conv.clk(clock);
	mod2.in0(sig11);
	mod2.in1(sig22);
	mod2.in2(sig33);

	mod2.s(s2);
	iconv.e(s2);

	iconv.s(s3);
	term.e (s3);

	cout << "Lancement de la simulation du circuit..." << endl;
	sc_trace_file *trace = sc_create_vcd_trace_file("My_wave_form");
	sc_trace(trace, clock,   "Horloge");
	sc_start(100,SC_MS);
	sc_close_vcd_trace_file( trace );
	cout << "Fin de la simulation du circuit..." << endl;

    return 0;
}
