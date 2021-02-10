/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "Conversion.h"

void ConversionCouleurs(int rvb[3], int ycbcr[3]){
const char n = 24;
const char frac = 5;

 sc_int<n> fact10=0.299*(1<<frac);
 sc_int<n> fact20=0.587*(1<<frac);
 sc_int<n> fact30=0.114*(1<<frac);


 sc_int<n> fact11=(-0.1687)*(1<<frac);
 sc_int<n> fact21=(-0.3313)*(1<<frac);
 sc_int<n> fact31=0.5*(1<<frac);


 sc_int<n> fact12=0.5*(1<<frac);
 sc_int<n> fact22=(-0.4187)*(1<<frac);
 sc_int<n> fact32=(-0.0813)*(1<<frac);


 ycbcr[0]=(( fact10 * rvb[0] )+( fact20 * rvb[1] )+( fact30 * rvb[2] )    )>>frac ;
 ycbcr[1]=(( fact11 * rvb[0] )+( fact21 * rvb[1] )+( fact31 * rvb[2] )+(128*(1<<frac)))>>frac ;
 ycbcr[2]=(( fact12 * rvb[0] )+( fact22 * rvb[1] )+( fact32 * rvb[2] )+(128*(1<<frac)))>>frac ;


	   	for( int j = 0; j < 4; j++){
		  if( ycbcr[j]<0 )
		    ycbcr[j] = 0;
		  if( ycbcr[j]> 255 )
		    ycbcr[j] = 255;
		}

}

void Conversion::do_conversion(){
	int d[3];
	while( true ){
		d[0] = (int)e.read();
		d[1] = (int)e.read();
		d[2] = (int)e.read();

    	ConversionCouleurs(d, t);


	   s.write( (unsigned char)t[0] );
	   s.write( (unsigned char)t[1] );
	   s.write( (unsigned char)t[2] );
	}
}

