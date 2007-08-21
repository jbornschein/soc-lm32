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

#ifndef H_workMlm32__decoder_H
#define H_workMlm32__decoder_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workMlm32__decoder : public HSim__s5{
public: 
    workMlm32__decoder(const char *instname);
    ~workMlm32__decoder();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    class cu0 : public HSimVlogTask{
    public: 
        HSim__s3 uv[2];
        cu0(workMlm32__decoder* arch );
        HSimVlogTaskCall * createTaskCall(HSim__s7 * process );
        void deleteTaskCall(HSimVlogTaskCall *p );
        void reset();
        void constructObject();
        int getSizeForArg(int argNumber);
        int getSize();
        HSim::VlogVarType getType();
        int constructObjectCalled;
        workMlm32__decoder* Arch ;
        HSimVector<HSimRegion *> activeInstanceList ;
        HSimVector<HSimRegion *>  availableTaskCallObjList ;
        ~cu0();
        bool disable(HSim__s7* proc);
    };
    cu0 u62;
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
    HSim__s1 us[97];
};

#endif
