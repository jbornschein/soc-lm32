////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_wb_bram_rtl_H
#define H_Work_wb_bram_rtl_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_wb_bram_rtl: public HSim__s6 {
public:

    HSim__s1 SE[10];

HSim__s4 Cc;
  HSimArrayType Mem_typebase;
  HSimArrayType Mem_type;
  char *t0;
    HSim__s1 SA[2];
  char t1;
    Work_wb_bram_rtl(const char * name);
    ~Work_wb_bram_rtl();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_wb_bram_rtl(const char *name);

#endif
