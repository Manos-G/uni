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
static const char *ng0 = "/home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1/be.vhd";



static void work_a_2596200055_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;

LAB0:    t1 = (t0 + 2664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 3112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(50, ng0);
    t7 = (100 * 1000LL);
    t2 = (t0 + 2472);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t9 = *((unsigned char *)t3);
    t10 = (t9 == (unsigned char)2);
    if (t10 == 1)
        goto LAB10;

LAB11:    t8 = (unsigned char)0;

LAB12:    if (t8 == 0)
        goto LAB8;

LAB9:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 3112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(55, ng0);
    t7 = (100 * 1000LL);
    t2 = (t0 + 2472);
    xsi_process_wait(t2, t7);

LAB15:    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    t2 = (t0 + 5052);
    xsi_report(t2, 9U, (unsigned char)2);
    goto LAB9;

LAB10:    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t11 = *((unsigned char *)t4);
    t12 = (t11 == (unsigned char)2);
    t8 = t12;
    goto LAB12;

LAB13:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t9 = *((unsigned char *)t3);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB19;

LAB20:    t8 = (unsigned char)0;

LAB21:    if (t8 == 0)
        goto LAB17;

LAB18:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(60, ng0);
    t7 = (100 * 1000LL);
    t2 = (t0 + 2472);
    xsi_process_wait(t2, t7);

LAB24:    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB14:    goto LAB13;

LAB16:    goto LAB14;

LAB17:    t2 = (t0 + 5061);
    xsi_report(t2, 9U, (unsigned char)2);
    goto LAB18;

LAB19:    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t11 = *((unsigned char *)t4);
    t12 = (t11 == (unsigned char)2);
    t8 = t12;
    goto LAB21;

LAB22:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t9 = *((unsigned char *)t3);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB28;

LAB29:    t8 = (unsigned char)0;

LAB30:    if (t8 == 0)
        goto LAB26;

LAB27:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(65, ng0);
    t7 = (100 * 1000LL);
    t2 = (t0 + 2472);
    xsi_process_wait(t2, t7);

LAB33:    *((char **)t1) = &&LAB34;
    goto LAB1;

LAB23:    goto LAB22;

LAB25:    goto LAB23;

LAB26:    t2 = (t0 + 5070);
    xsi_report(t2, 9U, (unsigned char)2);
    goto LAB27;

LAB28:    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t11 = *((unsigned char *)t4);
    t12 = (t11 == (unsigned char)2);
    t8 = t12;
    goto LAB30;

LAB31:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t9 = *((unsigned char *)t3);
    t10 = (t9 == (unsigned char)2);
    if (t10 == 1)
        goto LAB37;

LAB38:    t8 = (unsigned char)0;

LAB39:    if (t8 == 0)
        goto LAB35;

LAB36:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5088);
    xsi_report(t2, 19U, (unsigned char)0);
    xsi_set_current_line(69, ng0);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB32:    goto LAB31;

LAB34:    goto LAB32;

LAB35:    t2 = (t0 + 5079);
    xsi_report(t2, 9U, (unsigned char)2);
    goto LAB36;

LAB37:    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t11 = *((unsigned char *)t4);
    t12 = (t11 == (unsigned char)3);
    t8 = t12;
    goto LAB39;

LAB40:    goto LAB2;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

}


extern void work_a_2596200055_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2596200055_3212880686_p_0};
	xsi_register_didat("work_a_2596200055_3212880686", "isim/half_adder_half_adder_sch_tb_isim_beh.exe.sim/work/a_2596200055_3212880686.didat");
	xsi_register_executes(pe);
}
