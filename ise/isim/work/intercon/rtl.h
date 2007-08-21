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

#ifndef H_Work_intercon_rtl_H
#define H_Work_intercon_rtl_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_intercon_rtl: public HSim__s6 {
public:

    HSim__s1 SE[64];

    HSim__s1 SA[20];
  char t134;
  char t135;
  char t136;
  char t137;
  char t138;
  char t139;
  char t140;
  char t141;
  char t142;
HSimConstraints *c143;
  char *t144;
HSimConstraints *c145;
  char *t146;
HSimConstraints *c147;
  char *t148;
HSimConstraints *c149;
  char *t150;
HSimConstraints *c151;
  char *t152;
HSimConstraints *c153;
  char *t154;
HSimConstraints *c155;
  char *t156;
HSimConstraints *c157;
  char *t158;
HSimConstraints *c159;
  char *t160;
    Work_intercon_rtl(const char * name);
    ~Work_intercon_rtl();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};

class Work_intercon_rtl_arbiter_bram0: public HSim__s6 {
public:
  Work_intercon_rtl *Arch;
    HSim__s1 SS;
    HSim__s1 SU;
    HSim__s1 SW;
    HSim__s1 SY;
    HSim__s1 S10;
    HSim__s1 S12;
    HSim__s1 S14;
    HSim__s1 S16;
    HSim__s1 S18;
    HSim__s1 S1a;
    HSim__s1 S1c;
    HSim__s1 S1e;
    HSim__s1 S1g;
  char t161;
  char t162;
  char t163;
  char t164;
  char t165;
  Work_intercon_rtl_arbiter_bram0(const char* name,
    Work_intercon_rtl *arch,
    HSimConfigDecl* cfg);
    void constructObject();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};

class Work_intercon_rtl_arbiter_timer0: public HSim__s6 {
public:
  Work_intercon_rtl *Arch;
    HSim__s1 S4m;
    HSim__s1 S4p;
    HSim__s1 S4r;
    HSim__s1 S4t;
    HSim__s1 S4v;
    HSim__s1 S4x;
    HSim__s1 S4z;
    HSim__s1 S4B;
    HSim__s1 S4D;
    HSim__s1 S4F;
    HSim__s1 S4H;
    HSim__s1 S4J;
    HSim__s1 S4L;
  char t166;
  char t167;
  char t168;
  char t169;
  char t170;
  Work_intercon_rtl_arbiter_timer0(const char* name,
    Work_intercon_rtl *arch,
    HSimConfigDecl* cfg);
    void constructObject();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};

class Work_intercon_rtl_arbiter_uart0: public HSim__s6 {
public:
  Work_intercon_rtl *Arch;
    HSim__s1 S7N;
    HSim__s1 S7Q;
    HSim__s1 S7S;
    HSim__s1 S7U;
    HSim__s1 S7W;
    HSim__s1 S7Y;
    HSim__s1 S80;
    HSim__s1 S82;
    HSim__s1 S84;
    HSim__s1 S86;
    HSim__s1 S88;
    HSim__s1 S8a;
    HSim__s1 S8c;
  char t171;
  char t172;
  char t173;
  char t174;
  char t175;
  Work_intercon_rtl_arbiter_uart0(const char* name,
    Work_intercon_rtl *arch,
    HSimConfigDecl* cfg);
    void constructObject();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};

class Work_intercon_rtl_arbiter_gpio0: public HSim__s6 {
public:
  Work_intercon_rtl *Arch;
    HSim__s1 Sbe;
    HSim__s1 Sbg;
    HSim__s1 Sbi;
    HSim__s1 Sbk;
    HSim__s1 Sbn;
    HSim__s1 Sbq;
    HSim__s1 Sbs;
    HSim__s1 Sbu;
    HSim__s1 Sbw;
    HSim__s1 Sby;
    HSim__s1 SbA;
    HSim__s1 SbC;
    HSim__s1 SbE;
  char t176;
  char t177;
  char t178;
  char t179;
  char t180;
  Work_intercon_rtl_arbiter_gpio0(const char* name,
    Work_intercon_rtl *arch,
    HSimConfigDecl* cfg);
    void constructObject();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};

class Work_intercon_rtl_arbiter_sram0: public HSim__s6 {
public:
  Work_intercon_rtl *Arch;
    HSim__s1 SeG;
    HSim__s1 SeI;
    HSim__s1 SeK;
    HSim__s1 SeM;
    HSim__s1 SeP;
    HSim__s1 SeR;
    HSim__s1 SeT;
    HSim__s1 SeV;
    HSim__s1 SeX;
    HSim__s1 SeZ;
    HSim__s1 Sf1;
    HSim__s1 Sf3;
    HSim__s1 Sf5;
  char t181;
  char t182;
  char t183;
  char t184;
  char t185;
  Work_intercon_rtl_arbiter_sram0(const char* name,
    Work_intercon_rtl *arch,
    HSimConfigDecl* cfg);
    void constructObject();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};

class Work_intercon_rtl_decoder: public HSim__s6 {
public:
  Work_intercon_rtl *Arch;
  char *t186;
HSimConstraints *c187;
HSimConstraints *c188;
  char *t189;
  char *t190;
HSimConstraints *c191;
HSimConstraints *c192;
  char *t193;
  char *t194;
HSimConstraints *c195;
  Work_intercon_rtl_decoder(const char* name,
    Work_intercon_rtl *arch,
    HSimConfigDecl* cfg);
    void constructObject();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_intercon_rtl(const char *name);

#endif
