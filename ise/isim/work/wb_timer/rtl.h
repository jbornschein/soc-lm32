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

#ifndef H_Work_wb_timer_rtl_H
#define H_Work_wb_timer_rtl_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_wb_timer_rtl: public HSim__s6 {
public:

    HSim__s1 SE[12];

    HSim__s1 SA[15];
  char t37;
  char *t38;
  char t39;
  char *t40;
  char t41;
  char *t42;
  char t43;
  char *t44;
  char t45;
  char *t46;
  char t47;
  char *t48;
  char *t49;
HSimConstraints *c50;
HSimConstraints *c51;
HSimConstraints *c52;
HSimConstraints *c53;
HSimConstraints *c54;
    Work_wb_timer_rtl(const char * name);
    ~Work_wb_timer_rtl();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_wb_timer_rtl(const char *name);

#endif
