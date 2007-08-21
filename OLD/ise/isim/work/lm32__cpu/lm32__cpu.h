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

#ifndef H_workMlm32__cpu_H
#define H_workMlm32__cpu_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workMlm32__cpu : public HSim__s5{
public: 
    workMlm32__cpu(const char *instname);
    ~workMlm32__cpu();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    void paramAssign();
    class cu0 : public HSimVlogTask{
    public: 
        HSim__s3 uv[2];
        cu0(workMlm32__cpu* arch );
        HSimVlogTaskCall * createTaskCall(HSim__s7 * process );
        void deleteTaskCall(HSimVlogTaskCall *p );
        void reset();
        void constructObject();
        int getSizeForArg(int argNumber);
        int getSize();
        HSim::VlogVarType getType();
        int constructObjectCalled;
        workMlm32__cpu* Arch ;
        HSimVector<HSimRegion *> activeInstanceList ;
        HSimVector<HSimRegion *>  availableTaskCallObjList ;
        ~cu0();
        bool disable(HSim__s7* proc);
    };
    cu0 u8;
    HSim__s1 us[133];
    HSim__s3 uv[73];
    HSimVlogParam up[14];
};

#endif
