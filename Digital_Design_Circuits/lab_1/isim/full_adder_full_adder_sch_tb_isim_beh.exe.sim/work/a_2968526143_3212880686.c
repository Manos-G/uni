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
static const char *ng0 = "/home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1/full_adder_bench.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;
extern char *STD_STANDARD;

char *ieee_p_1242562249_sub_10420449594411817395_1035706684(char *, char *, int , int );
unsigned char ieee_p_2592010699_sub_3488546069778340532_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_3488768496604610246_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_3488768497506413324_503743352(char *, unsigned char , unsigned char );


static void work_a_2968526143_3212880686_p_0(char *t0)
{
    char t6[16];
    char t39[16];
    char t41[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    int64 t17;
    unsigned char t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned char t23;
    unsigned char t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned char t29;
    unsigned char t30;
    unsigned char t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t40;
    char *t42;
    char *t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned char t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned char t53;
    int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned char t58;
    unsigned char t59;
    unsigned char t60;
    unsigned char t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    int t68;
    unsigned int t69;
    unsigned int t70;

LAB0:    t1 = (t0 + 2944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 5688);
    *((int *)t2) = 0;
    t3 = (t0 + 5692);
    *((int *)t3) = 7;
    t4 = 0;
    t5 = 7;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5747);
    xsi_report(t2, 19U, (unsigned char)0);
    xsi_set_current_line(69, ng0);

LAB19:    *((char **)t1) = &&LAB20;

LAB1:    return;
LAB5:    xsi_set_current_line(54, ng0);
    t7 = (t0 + 5688);
    t8 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t6, *((int *)t7), 3);
    t9 = (t0 + 1968U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t11 = (t6 + 12U);
    t12 = *((unsigned int *)t11);
    t12 = (t12 * 1U);
    memcpy(t9, t8, t12);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t13 = (2 - 2);
    t12 = (t13 * -1);
    t14 = (1U * t12);
    t15 = (0 + t14);
    t2 = (t3 + t15);
    t16 = *((unsigned char *)t2);
    t7 = (t0 + 3328);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t16;
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t13 = (1 - 2);
    t12 = (t13 * -1);
    t14 = (1U * t12);
    t15 = (0 + t14);
    t2 = (t3 + t15);
    t16 = *((unsigned char *)t2);
    t7 = (t0 + 3392);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t16;
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t13 = (0 - 2);
    t12 = (t13 * -1);
    t14 = (1U * t12);
    t15 = (0 + t14);
    t2 = (t3 + t15);
    t16 = *((unsigned char *)t2);
    t7 = (t0 + 3456);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t16;
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(58, ng0);
    t17 = (100 * 1000LL);
    t2 = (t0 + 2752);
    xsi_process_wait(t2, t17);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB6:    t2 = (t0 + 5688);
    t4 = *((int *)t2);
    t3 = (t0 + 5692);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB16:    t13 = (t4 + 1);
    t4 = t13;
    t7 = (t0 + 5688);
    *((int *)t7) = t4;
    goto LAB4;

LAB8:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t16 = *((unsigned char *)t3);
    t2 = (t0 + 1968U);
    t7 = *((char **)t2);
    t13 = (2 - 2);
    t12 = (t13 * -1);
    t14 = (1U * t12);
    t15 = (0 + t14);
    t2 = (t7 + t15);
    t18 = *((unsigned char *)t2);
    t8 = (t0 + 1968U);
    t9 = *((char **)t8);
    t19 = (1 - 2);
    t20 = (t19 * -1);
    t21 = (1U * t20);
    t22 = (0 + t21);
    t8 = (t9 + t22);
    t23 = *((unsigned char *)t8);
    t24 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t18, t23);
    t10 = (t0 + 1968U);
    t11 = *((char **)t10);
    t25 = (0 - 2);
    t26 = (t25 * -1);
    t27 = (1U * t26);
    t28 = (0 + t27);
    t10 = (t11 + t28);
    t29 = *((unsigned char *)t10);
    t30 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t24, t29);
    t31 = (t16 == t30);
    if (t31 == 0)
        goto LAB12;

LAB13:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t16 = *((unsigned char *)t3);
    t2 = (t0 + 1968U);
    t7 = *((char **)t2);
    t13 = (2 - 2);
    t12 = (t13 * -1);
    t14 = (1U * t12);
    t15 = (0 + t14);
    t2 = (t7 + t15);
    t18 = *((unsigned char *)t2);
    t8 = (t0 + 1968U);
    t9 = *((char **)t8);
    t19 = (1 - 2);
    t20 = (t19 * -1);
    t21 = (1U * t20);
    t22 = (0 + t21);
    t8 = (t9 + t22);
    t23 = *((unsigned char *)t8);
    t24 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t18, t23);
    t10 = (t0 + 1968U);
    t11 = *((char **)t10);
    t25 = (2 - 2);
    t26 = (t25 * -1);
    t27 = (1U * t26);
    t28 = (0 + t27);
    t10 = (t11 + t28);
    t29 = *((unsigned char *)t10);
    t32 = (t0 + 1968U);
    t33 = *((char **)t32);
    t44 = (0 - 2);
    t45 = (t44 * -1);
    t46 = (1U * t45);
    t47 = (0 + t46);
    t32 = (t33 + t47);
    t30 = *((unsigned char *)t32);
    t31 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t29, t30);
    t48 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t24, t31);
    t34 = (t0 + 1968U);
    t35 = *((char **)t34);
    t49 = (1 - 2);
    t50 = (t49 * -1);
    t51 = (1U * t50);
    t52 = (0 + t51);
    t34 = (t35 + t52);
    t53 = *((unsigned char *)t34);
    t36 = (t0 + 1968U);
    t37 = *((char **)t36);
    t54 = (0 - 2);
    t55 = (t54 * -1);
    t56 = (1U * t55);
    t57 = (0 + t56);
    t36 = (t37 + t57);
    t58 = *((unsigned char *)t36);
    t59 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t53, t58);
    t60 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t48, t59);
    t61 = (t16 == t60);
    if (t61 == 0)
        goto LAB14;

LAB15:    goto LAB6;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    t32 = (t0 + 5696);
    t34 = ((STD_STANDARD) + 384);
    t35 = (t0 + 5688);
    t36 = xsi_int_to_mem(*((int *)t35));
    t37 = xsi_string_variable_get_image(t6, t34, t36);
    t40 = ((STD_STANDARD) + 984);
    t42 = (t41 + 0U);
    t43 = (t42 + 0U);
    *((int *)t43) = 1;
    t43 = (t42 + 4U);
    *((int *)t43) = 25;
    t43 = (t42 + 8U);
    *((int *)t43) = 1;
    t44 = (25 - 1);
    t45 = (t44 * 1);
    t45 = (t45 + 1);
    t43 = (t42 + 12U);
    *((unsigned int *)t43) = t45;
    t38 = xsi_base_array_concat(t38, t39, t40, (char)97, t32, t41, (char)97, t37, t6, (char)101);
    t43 = (t6 + 12U);
    t45 = *((unsigned int *)t43);
    t46 = (25U + t45);
    xsi_report(t38, t46, (unsigned char)2);
    goto LAB13;

LAB14:    t38 = (t0 + 5721);
    t42 = ((STD_STANDARD) + 384);
    t43 = (t0 + 5688);
    t62 = xsi_int_to_mem(*((int *)t43));
    t63 = xsi_string_variable_get_image(t6, t42, t62);
    t65 = ((STD_STANDARD) + 984);
    t66 = (t41 + 0U);
    t67 = (t66 + 0U);
    *((int *)t67) = 1;
    t67 = (t66 + 4U);
    *((int *)t67) = 26;
    t67 = (t66 + 8U);
    *((int *)t67) = 1;
    t68 = (26 - 1);
    t69 = (t68 * 1);
    t69 = (t69 + 1);
    t67 = (t66 + 12U);
    *((unsigned int *)t67) = t69;
    t64 = xsi_base_array_concat(t64, t39, t65, (char)97, t38, t41, (char)97, t63, t6, (char)101);
    t67 = (t6 + 12U);
    t69 = *((unsigned int *)t67);
    t70 = (26U + t69);
    xsi_report(t64, t70, (unsigned char)2);
    goto LAB15;

LAB17:    goto LAB2;

LAB18:    goto LAB17;

LAB20:    goto LAB18;

}


extern void work_a_2968526143_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2968526143_3212880686_p_0};
	xsi_register_didat("work_a_2968526143_3212880686", "isim/full_adder_full_adder_sch_tb_isim_beh.exe.sim/work/a_2968526143_3212880686.didat");
	xsi_register_executes(pe);
}
