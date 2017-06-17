/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/csehome/hm525/Final_Project/nextpc.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};



static void Always_30_0(char *t0)
{
    char t13[8];
    char t14[8];
    char t15[8];
    char t21[8];
    char t26[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t27;

LAB0:    t1 = (t0 + 3000U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 3320);
    *((int *)t2) = 1;
    t3 = (t0 + 3032);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t3, 8, t2, 32);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    memset(t15, 0, 8);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t4) != 0)
        goto LAB11;

LAB12:    t12 = (t15 + 4);
    t16 = *((unsigned int *)t15);
    t17 = *((unsigned int *)t12);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB13;

LAB14:    t22 = *((unsigned int *)t15);
    t23 = (~(t22));
    t24 = *((unsigned int *)t12);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t12) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t15) > 0)
        goto LAB19;

LAB20:    memcpy(t14, t19, 8);

LAB21:    memset(t26, 0, 8);
    xsi_vlog_unsigned_add(t26, 32, t13, 32, t14, 32);
    t27 = (t0 + 2088);
    xsi_vlogvar_assign_value(t27, t26, 0, 0, 8);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(31, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2088);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 8);
    goto LAB8;

LAB9:    *((unsigned int *)t15) = 1;
    goto LAB12;

LAB11:    t11 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB12;

LAB13:    t19 = (t0 + 1368U);
    t20 = *((char **)t19);
    memcpy(t21, t20, 8);
    goto LAB14;

LAB15:    t19 = ((char*)((ng1)));
    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t14, 32, t21, 32, t19, 32);
    goto LAB21;

LAB19:    memcpy(t14, t21, 8);
    goto LAB21;

}


extern void work_m_07144932043043270421_3011671265_init()
{
	static char *pe[] = {(void *)Always_30_0};
	xsi_register_didat("work_m_07144932043043270421_3011671265", "isim/MIPS_Test_v_isim_beh.exe.sim/work/m_07144932043043270421_3011671265.didat");
	xsi_register_executes(pe);
}
