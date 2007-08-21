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

#ifndef H_Work_intercon_package_H
#define H_Work_intercon_package_H

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


#include "ieee/std_logic_1164/std_logic_1164.h"

class Work_intercon_package: public HSim__s6 {
public:
/* subprogram name and */
char *Gh(HSimConstraints *reConstr, const char *Ea, const HSimConstraints *constrEa, const char Ed);

public:

public:
  Work_intercon_package(const HSimString &name);
  ~Work_intercon_package();
};

extern Work_intercon_package *WorkIntercon_package;

#endif
