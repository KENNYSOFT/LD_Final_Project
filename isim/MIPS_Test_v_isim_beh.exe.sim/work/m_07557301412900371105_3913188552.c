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
static const char *ng0 = "/csehome/hm525/Final_Project/register.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};



static void Always_37_0(char *t0)
{
    char t13[8];
    char t26[8];
    char t42[8];
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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;

LAB0:    t1 = (t0 + 3960U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 4528);
    *((int *)t2) = 1;
    t3 = (t0 + 3992);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(37, ng0);

LAB5:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1848U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(46, ng0);

LAB10:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB14;

LAB11:    if (t18 != 0)
        goto LAB13;

LAB12:    *((unsigned int *)t13) = 1;

LAB14:    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t42, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB46;

LAB43:    if (t18 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t42) = 1;

LAB46:    t12 = (t42 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t42);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB47;

LAB48:
LAB49:
LAB17:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(38, ng0);

LAB9:    xsi_set_current_line(39, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB8;

LAB13:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB14;

LAB15:    xsi_set_current_line(47, ng0);

LAB18:    xsi_set_current_line(48, ng0);
    t27 = (t0 + 1368U);
    t28 = *((char **)t27);
    memset(t26, 0, 8);
    t27 = (t26 + 4);
    t29 = (t28 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (t30 >> 2);
    *((unsigned int *)t26) = t31;
    t32 = *((unsigned int *)t29);
    t33 = (t32 >> 2);
    *((unsigned int *)t27) = t33;
    t34 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t34 & 3U);
    t35 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t35 & 3U);

LAB19:    t36 = ((char*)((ng3)));
    t37 = xsi_vlog_unsigned_case_compare(t26, 2, t36, 2);
    if (t37 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng2)));
    t37 = xsi_vlog_unsigned_case_compare(t26, 2, t2, 2);
    if (t37 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng4)));
    t37 = xsi_vlog_unsigned_case_compare(t26, 2, t2, 2);
    if (t37 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng5)));
    t37 = xsi_vlog_unsigned_case_compare(t26, 2, t2, 2);
    if (t37 == 1)
        goto LAB26;

LAB27:
LAB29:
LAB28:    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB30:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 3U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 3U);

LAB31:    t5 = ((char*)((ng3)));
    t37 = xsi_vlog_unsigned_case_compare(t13, 2, t5, 2);
    if (t37 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng2)));
    t37 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t37 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng4)));
    t37 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t37 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng5)));
    t37 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 2);
    if (t37 == 1)
        goto LAB38;

LAB39:
LAB41:
LAB40:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB42:    goto LAB17;

LAB20:    xsi_set_current_line(49, ng0);
    t38 = (t0 + 2568);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t41, t40, 0, 0, 8, 0LL);
    goto LAB30;

LAB22:    xsi_set_current_line(50, ng0);
    t3 = (t0 + 2728);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 8, 0LL);
    goto LAB30;

LAB24:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 2888);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 8, 0LL);
    goto LAB30;

LAB26:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 3048);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 8, 0LL);
    goto LAB30;

LAB32:    xsi_set_current_line(56, ng0);
    t11 = (t0 + 2568);
    t12 = (t11 + 56U);
    t27 = *((char **)t12);
    t28 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t28, t27, 0, 0, 8, 0LL);
    goto LAB42;

LAB34:    xsi_set_current_line(57, ng0);
    t3 = (t0 + 2728);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 8, 0LL);
    goto LAB42;

LAB36:    xsi_set_current_line(58, ng0);
    t3 = (t0 + 2888);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 8, 0LL);
    goto LAB42;

LAB38:    xsi_set_current_line(59, ng0);
    t3 = (t0 + 3048);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 8, 0LL);
    goto LAB42;

LAB45:    t11 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(63, ng0);

LAB50:    xsi_set_current_line(64, ng0);
    t27 = (t0 + 1208U);
    t28 = *((char **)t27);
    t27 = (t28 + 4);
    t30 = *((unsigned int *)t27);
    t31 = (~(t30));
    t32 = *((unsigned int *)t28);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB51;

LAB52:
LAB53:    goto LAB49;

LAB51:    xsi_set_current_line(64, ng0);

LAB54:    xsi_set_current_line(65, ng0);
    t29 = (t0 + 1688U);
    t36 = *((char **)t29);

LAB55:    t29 = ((char*)((ng3)));
    t37 = xsi_vlog_unsigned_case_compare(t36, 2, t29, 2);
    if (t37 == 1)
        goto LAB56;

LAB57:    t2 = ((char*)((ng2)));
    t37 = xsi_vlog_unsigned_case_compare(t36, 2, t2, 2);
    if (t37 == 1)
        goto LAB58;

LAB59:    t2 = ((char*)((ng4)));
    t37 = xsi_vlog_unsigned_case_compare(t36, 2, t2, 2);
    if (t37 == 1)
        goto LAB60;

LAB61:    t2 = ((char*)((ng5)));
    t37 = xsi_vlog_unsigned_case_compare(t36, 2, t2, 2);
    if (t37 == 1)
        goto LAB62;

LAB63:
LAB64:    goto LAB53;

LAB56:    xsi_set_current_line(66, ng0);
    t38 = (t0 + 1528U);
    t39 = *((char **)t38);
    t38 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t38, t39, 0, 0, 8, 0LL);
    goto LAB64;

LAB58:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 8, 0LL);
    goto LAB64;

LAB60:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 8, 0LL);
    goto LAB64;

LAB62:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 8, 0LL);
    goto LAB64;

}

static void Initial_76_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(76, ng0);

LAB2:    xsi_set_current_line(77, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2568);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);
    xsi_set_current_line(78, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2728);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);
    xsi_set_current_line(79, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2888);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);
    xsi_set_current_line(80, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3048);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);
    xsi_set_current_line(81, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2248);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);
    xsi_set_current_line(82, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2408);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);

LAB1:    return;
}


extern void work_m_07557301412900371105_3913188552_init()
{
	static char *pe[] = {(void *)Always_37_0,(void *)Initial_76_1};
	xsi_register_didat("work_m_07557301412900371105_3913188552", "isim/MIPS_Test_v_isim_beh.exe.sim/work/m_07557301412900371105_3913188552.didat");
	xsi_register_executes(pe);
}
