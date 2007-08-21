////////////////////////////////////////////////////////////////////////////////
//   ____  ____  
//  /   /\/   /  
// /___/  \  /   
// \   \   \/    
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /___/   /\   
// \   \  /  \  
//  \___\/\___\ 
////////////////////////////////////////////////////////////////////////////////

#ifndef H_workMlm32__interrupt_H
#define H_workMlm32__interrupt_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workMlm32__interrupt : public HSim__s5{
public: 
    workMlm32__interrupt(const char *instname);
    ~workMlm32__interrupt();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    void genModuleInstantiate(HSimConfigDecl *cfg);
    void genParamAssign();
    void genSetDefparam();
    void genParamValue(HSimConfigDecl *cfg);
    class cu0 : public HSim__s6 {
    public:
        cu0(workMlm32__interrupt* arch);
        ~cu0();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMlm32__interrupt* Arch;
    };
    cu0* u0;
    class cu1 : public HSim__s6 {
    public:
        cu1(workMlm32__interrupt* arch);
        ~cu1();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMlm32__interrupt* Arch;
    };
    cu1* u1;
    class cu2 : public HSim__s6 {
    public:
        cu2(workMlm32__interrupt* arch);
        ~cu2();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMlm32__interrupt* Arch;
    };
    cu2* u2;
    class cu3 : public HSim__s6 {
    public:
        cu3(workMlm32__interrupt* arch);
        ~cu3();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMlm32__interrupt* Arch;
    };
    cu3* u3;
    HSim__s2 *driver_us0;
    HSim__s1 us[15];
    HSim__s3 uv[4];
    HSimVlogParam up[1];
};

#endif
