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

#ifndef H_workMasram__core_H
#define H_workMasram__core_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workMasram__core : public HSim__s5{
public: 
    workMasram__core(const char *instname);
    ~workMasram__core();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    HSim::ValueS* up4Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up5Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim__s2 *driver_us0;
    HSim__s2 *driver_us1;
    HSim__s2 *driver_us2;
    HSim__s1 us[24];
    HSim__s3 uv[7];
    HSimVlogParam up[6];
};

#endif
