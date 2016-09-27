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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/EriveltonDell/Documents/Western Michigan University/ECE 5510/Programs/random/random.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_2865140800_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(20, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(25, ng0);
    t1 = (t0 + 1608U);
    t3 = *((char **)t1);
    t1 = (t0 + 3112);
    t4 = (t1 + 56U);
    t11 = *((char **)t4);
    t12 = (t11 + 56U);
    t20 = *((char **)t12);
    memcpy(t20, t3, 4U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 3032);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(21, ng0);
    t3 = (t0 + 1608U);
    t4 = *((char **)t3);
    t5 = (4 - 1);
    t6 = (t5 - 3);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t3 = (t4 + t9);
    t10 = *((unsigned char *)t3);
    t11 = (t0 + 1608U);
    t12 = *((char **)t11);
    t13 = (4 - 2);
    t14 = (t13 - 3);
    t15 = (t14 * -1);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t11 = (t12 + t17);
    t18 = *((unsigned char *)t11);
    t19 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t10, t18);
    t20 = (t0 + 1728U);
    t21 = *((char **)t20);
    t20 = (t21 + 0);
    *((unsigned char *)t20) = t19;
    xsi_set_current_line(22, ng0);
    t1 = (t0 + 1608U);
    t3 = *((char **)t1);
    t5 = (4 - 2);
    t7 = (3 - t5);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t1 = (t3 + t9);
    t4 = xsi_get_transient_memory(3U);
    memcpy(t4, t1, 3U);
    t11 = (t0 + 1608U);
    t12 = *((char **)t11);
    t6 = (4 - 1);
    t15 = (3 - t6);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t11 = (t12 + t17);
    memcpy(t11, t4, 3U);
    xsi_set_current_line(23, ng0);
    t1 = (t0 + 1728U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 1608U);
    t4 = *((char **)t1);
    t5 = (0 - 3);
    t7 = (t5 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t4 + t9);
    *((unsigned char *)t1) = t2;
    goto LAB3;

}


extern void work_a_2865140800_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2865140800_3212880686_p_0};
	xsi_register_didat("work_a_2865140800_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_2865140800_3212880686.didat");
	xsi_register_executes(pe);
}
