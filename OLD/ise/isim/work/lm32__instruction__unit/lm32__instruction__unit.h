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

#ifndef H_workMlm32__instruction__unit_H
#define H_workMlm32__instruction__unit_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workMlm32__instruction__unit : public HSim__s5{
public: 
    workMlm32__instruction__unit(const char *instname);
    ~workMlm32__instruction__unit();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    HSim::ValueS* up5Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up7Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    class cu0 : public HSimVlogTask{
    public: 
        HSim__s3 uv[2];
        cu0(workMlm32__instruction__unit* arch );
        HSimVlogTaskCall * createTaskCall(HSim__s7 * process );
        void deleteTaskCall(HSimVlogTaskCall *p );
        void reset();
        void constructObject();
        int getSizeForArg(int argNumber);
        int getSize();
        HSim::VlogVarType getType();
        int constructObjectCalled;
        workMlm32__instruction__unit* Arch ;
        HSimVector<HSimRegion *> activeInstanceList ;
        HSimVector<HSimRegion *>  availableTaskCallObjList ;
        ~cu0();
        bool disable(HSim__s7* proc);
    };
    cu0 u0;
    HSim__s2 *driver_us0;
    HSim__s2 *driver_us1;
    HSim__s2 *driver_us2;
    HSim__s2 *driver_us3;
    HSim__s2 *driver_us4;
    HSim__s2 *driver_us5;
    HSim__s2 *driver_us6;
    HSim__s2 *driver_us7;
    HSim__s2 *driver_us8;
    HSim__s2 *driver_us9;
    HSim__s2 *driver_us10;
    HSim__s2 *driver_us11;
    HSim__s1 us[32];
    HSim__s3 uv[3];
    HSimVlogParam up[8];
};

#endif
