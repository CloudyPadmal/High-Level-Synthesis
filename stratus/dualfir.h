#ifndef dualfir_h
#define dualfir_h

#include "dualfir_defs.h"
#include "fir.h"

#ifndef HLS_RTL

SC_MODULE(dualfir) {
  sc_in_clk  clk;
  sc_in<bool>  rst_n;
  channel_t::in data_in;
  sc_in< data_t > coeff1_in[TAPS1];
  sc_in< data_t > coeff2_in[TAPS2];
  channel_t::out data_out;

  fir<TAPS1, ACCBITS1> fir1;
  fir<TAPS2, ACCBITS2> fir2;

  channel_t fir1_out;

  void reset_thread();

 SC_CTOR(dualfir) :
    fir1("fir1"),
    fir2("fir2")
  {
  fir1.clk(clk);
  fir1.rst_n(rst_n);
  fir1.data_in(data_in);
  fir1.data_out(fir1_out);

  fir2.clk(clk);
  fir2.rst_n(rst_n);
  fir2.data_in(fir1_out);
  fir2.data_out(data_out);
  }
};

#else

#include "dualfir_rtl_wrapper.h"

#endif

#endif
