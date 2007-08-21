static const char * HSimCopyRightNotice = "Copyright 2004-2005, Xilinx Inc. All rights reserved.";
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif
#include "/home/joerg/Xilinx92i/vhdl/hdp/lin/ieee/std_logic_1164/std_logic_1164.h"
#include "/home/joerg/Xilinx92i/vhdl/hdp/lin/ieee/numeric_std/numeric_std.h"
#include "isim/work/intercon_package/intercon_package.h"


static HSim__s6* IF0(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__addsub(const char*);
    HSim__s6 *blk = createworkMlm32__addsub(label); 
    return blk;
}


static HSim__s6* IF1(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__shifter(const char*);
    HSim__s6 *blk = createworkMlm32__shifter(label); 
    return blk;
}


static HSim__s6* IF2(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__multiplier(const char*);
    HSim__s6 *blk = createworkMlm32__multiplier(label); 
    return blk;
}


static HSim__s6* IF3(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__mc__arithmetic(const char*);
    HSim__s6 *blk = createworkMlm32__mc__arithmetic(label); 
    return blk;
}


static HSim__s6* IF4(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__logic__op(const char*);
    HSim__s6 *blk = createworkMlm32__logic__op(label); 
    return blk;
}


static HSim__s6* IF5(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__load__store__unit(const char*);
    HSim__s6 *blk = createworkMlm32__load__store__unit(label); 
    return blk;
}


static HSim__s6* IF6(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__interrupt(const char*);
    HSim__s6 *blk = createworkMlm32__interrupt(label); 
    return blk;
}


static HSim__s6* IF7(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__instruction__unit(const char*);
    HSim__s6 *blk = createworkMlm32__instruction__unit(label); 
    return blk;
}


static HSim__s6* IF8(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__decoder(const char*);
    HSim__s6 *blk = createworkMlm32__decoder(label); 
    return blk;
}


static HSim__s6* IF9(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__adder(const char*);
    HSim__s6 *blk = createworkMlm32__adder(label); 
    return blk;
}


static HSim__s6* IF10(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMtxmitt(const char*);
    HSim__s6 *blk = createworkMtxmitt(label); 
    return blk;
}


static HSim__s6* IF11(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMrxcver(const char*);
    HSim__s6 *blk = createworkMrxcver(label); 
    return blk;
}


static HSim__s6* IF12(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMintface(const char*);
    HSim__s6 *blk = createworkMintface(label); 
    return blk;
}


static HSim__s6* IF13(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMasram__core(const char*);
    HSim__s6 *blk = createworkMasram__core(label); 
    return blk;
}


static HSim__s6* IF14(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMasram__top(const char*);
    HSim__s6 *blk = createworkMasram__top(label); 
    return blk;
}


static HSim__s6* IF15(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMuart__core(const char*);
    HSim__s6 *blk = createworkMuart__core(label); 
    return blk;
}


static HSim__s6* IF16(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMlm32__cpu(const char*);
    HSim__s6 *blk = createworkMlm32__cpu(label); 
    return blk;
}


static HSim__s6* IF17(HSim__s6 *Arch,const char* label,int nGenerics, 
va_list vap)
{
    extern HSim__s6 * createworkMglbl(const char*);
    HSim__s6 *blk = createworkMglbl(label); 
    return blk;
}

class _top : public HSim__s6 {
public:
    _top() : HSim__s6(false, "_top", "_top", 0, 0, HSim::VerilogModule) {}
    HSimConfigDecl * topModuleInstantiate() {
        HSimConfigDecl * cfgvh = 0;
        cfgvh = new HSimConfigDecl("default");
        (*cfgvh).registerFuseLibList("unisims_ver;xilinxcorelib_ver");

        (*cfgvh).addVlogModule("work","lm32_addsub", (HSimInstFactoryPtr)IF0);
        (*cfgvh).addVlogModule("work","lm32_shifter", (HSimInstFactoryPtr)IF1);
        (*cfgvh).addVlogModule("work","lm32_multiplier", (HSimInstFactoryPtr)IF2);
        (*cfgvh).addVlogModule("work","lm32_mc_arithmetic", (HSimInstFactoryPtr)IF3);
        (*cfgvh).addVlogModule("work","lm32_logic_op", (HSimInstFactoryPtr)IF4);
        (*cfgvh).addVlogModule("work","lm32_load_store_unit", (HSimInstFactoryPtr)IF5);
        (*cfgvh).addVlogModule("work","lm32_interrupt", (HSimInstFactoryPtr)IF6);
        (*cfgvh).addVlogModule("work","lm32_instruction_unit", (HSimInstFactoryPtr)IF7);
        (*cfgvh).addVlogModule("work","lm32_decoder", (HSimInstFactoryPtr)IF8);
        (*cfgvh).addVlogModule("work","lm32_adder", (HSimInstFactoryPtr)IF9);
        (*cfgvh).addVlogModule("work","txmitt", (HSimInstFactoryPtr)IF10);
        (*cfgvh).addVlogModule("work","rxcver", (HSimInstFactoryPtr)IF11);
        (*cfgvh).addVlogModule("work","intface", (HSimInstFactoryPtr)IF12);
        (*cfgvh).addVlogModule("work","asram_core", (HSimInstFactoryPtr)IF13);
        (*cfgvh).addVlogModule("work","asram_top", (HSimInstFactoryPtr)IF14);
        (*cfgvh).addVlogModule("work","uart_core", (HSimInstFactoryPtr)IF15);
        (*cfgvh).addVlogModule("work","lm32_cpu", (HSimInstFactoryPtr)IF16);
        (*cfgvh).addVlogModule("work","glbl", (HSimInstFactoryPtr)IF17);
        HSim__s6 * topvh = 0;
        extern HSim__s6 * createWork_system_rtl(const char*);
        topvh = createWork_system_rtl("System");
        addChild(topvh);
        HSim__s5 * topvl = 0;
        extern HSim__s6 * createworkMglbl(const char*);
        topvl = (HSim__s5*)createworkMglbl("glbl");
        topvl->moduleInstantiate(cfgvh);
        addChild(topvl);
        return cfgvh;
}
};

main(int argc, char **argv) {
  HSimDesign::initDesign();
  globalKernel->getOptions(argc,argv);
  HSim__s6 * _top_i = 0;
  try {
    IeeeStd_logic_1164=new Ieee_std_logic_1164("std_logic_1164");
    IeeeNumeric_std=new Ieee_numeric_std("NUMERIC_STD");
    WorkIntercon_package=new Work_intercon_package("intercon_package");
    HSimConfigDecl *cfg;
 _top_i = new _top();
  cfg =  _top_i->topModuleInstantiate();
    return globalKernel->runTcl(cfg, _top_i, "_top", argc, argv);
  }
  catch (HSimError& msg){
    try {
      globalKernel->error(msg.ErrMsg);
      return 1;
    }
    catch(...) {}
      return 1;
  }
  catch (...){
    globalKernel->fatalError();
    return 1;
  }
}
