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

#ifndef H_workMasram__top_H
#define H_workMasram__top_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workMasram__top : public HSim__s5{
public: 
    workMasram__top(const char *instname);
    ~workMasram__top();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    HSim::ValueS* up11Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    void paramAssign();
    void genModuleInstantiate(HSimConfigDecl *cfg);
    void genParamAssign();
    void genSetDefparam();
    void genParamValue(HSimConfigDecl *cfg);
    class cu0 : public HSim__s6 {
    public:
        cu0(workMasram__top* arch);
        ~cu0();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMasram__top* Arch;
    };
    cu0* u0;
    class cu1 : public HSim__s6 {
    public:
        cu1(workMasram__top* arch);
        ~cu1();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMasram__top* Arch;
    };
    cu1* u1;
    class cu2 : public HSim__s6 {
    public:
        cu2(workMasram__top* arch);
        ~cu2();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMasram__top* Arch;
    };
    cu2* u2;
    class cu3 : public HSim__s6 {
    public:
        cu3(workMasram__top* arch);
        ~cu3();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMasram__top* Arch;
    };
    cu3* u3;
    class cu4 : public HSim__s6 {
    public:
        cu4(workMasram__top* arch);
        ~cu4();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMasram__top* Arch;
    };
    cu4* u4;
    class cu5 : public HSim__s6 {
    public:
        cu5(workMasram__top* arch);
        ~cu5();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMasram__top* Arch;
    };
    cu5* u5;
    class cu6 : public HSim__s6 {
    public:
        cu6(workMasram__top* arch);
        ~cu6();
        void constructObject();
        void moduleInstantiate(HSimConfigDecl *cfg);
        void setDefparam();
        void archImplement();
        void connectSigs();
        workMasram__top* Arch;
        HSim::ValueS u7[1];
        cu6* u6;
    };
    cu6* u6;
    HSim__s1 us[31];
    HSimVlogParam up[12];
};

#endif
