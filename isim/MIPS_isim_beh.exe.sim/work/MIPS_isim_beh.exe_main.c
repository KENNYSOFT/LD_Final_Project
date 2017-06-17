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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_06046353405855539259_2858095548_init();
    work_m_02650747019728856777_1323274903_init();
    work_m_02586734124518818615_1987142118_init();
    work_m_10425743376279402882_0967167703_init();
    work_m_18253056902333614198_0641753560_init();
    work_m_07557301412900371105_3913188552_init();
    work_m_17221499227625474820_3037777339_init();
    work_m_00331469577069973378_0160779869_init();
    work_m_05968116290108204770_2725559894_init();
    work_m_04233943486825036605_1714798787_init();
    work_m_17386404712534672574_3422722564_init();
    work_m_14939453399513845197_3515808994_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_14939453399513845197_3515808994");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
