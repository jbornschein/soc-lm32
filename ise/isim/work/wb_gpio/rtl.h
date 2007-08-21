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

#ifndef H_Work_wb_gpio_rtl_H
#define H_Work_wb_gpio_rtl_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_wb_gpio_rtl: public HSim__s6 {
public:

    HSim__s1 SE[12];

    HSim__s1 SA[3];
  char t9;
  char t10;
  char *t11;
  char t12;
  char t13;
  char *t14;
  char *t15;
    Work_wb_gpio_rtl(const char * name);
    ~Work_wb_gpio_rtl();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_wb_gpio_rtl(const char *name);

#endif
