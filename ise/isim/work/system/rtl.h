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

#ifndef H_Work_system_rtl_H
#define H_Work_system_rtl_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_system_rtl: public HSim__s6 {
public:

    HSim__s1 SE[17];

    HSim__s1 SA[80];
  char *t884;
  char *t885;
HSimConstraints *c886;
HSimConstraints *c887;
HSimConstraints *c888;
  char *t889;
HSimConstraints *c890;
  char *t891;
HSimConstraints *c892;
  char *t893;
HSimConstraints *c894;
  char *t895;
HSimConstraints *c896;
  char *t897;
    Work_system_rtl(const char * name);
    ~Work_system_rtl();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_system_rtl(const char *name);

#endif
