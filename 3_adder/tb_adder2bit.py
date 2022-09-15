import random
import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def adder2bit_basic_test(dut):
    """ Test for 2 + 3 """
    cocotb.log.info("=============================")
    cocotb.log.info("=====Basic Test==============")
    cocotb.log.info("=============================")

    A = 2
    B = 3
    s_value = A + B

    dut.a_in.value = A
    dut.b_in.value = B

    await Timer(2, units="ns")

    assert dut.o_sum.value == s_value, f"Adder result is incorrect: {dut.o_sum.value} != {A + B}"
    cocotb.log.info(f"a={A} ; b={B} ; exp={s_value} ; obs={dut.o_sum.value}")
    cocotb.log.info("=============================")


@cocotb.test()
async def adder2bit_inc_test(dut):
    """ Incremental Test """
    cocotb.log.info("=============================")
    cocotb.log.info("====Incremental Test=========")
    cocotb.log.info("=============================")

    for i in range (0,3):
        for j in range (0,3):
            A = i
            B = j
            s_value = A + B

            dut.a_in.value = A
            dut.b_in.value = B

            await Timer(2, units="ns")

            assert dut.o_sum.value == s_value, f"Adder result is incorrect: {dut.o_sum.value} != {s_value}"
            cocotb.log.info(f"a={A} ; b={B} ; exp={s_value} ; obs={dut.o_sum.value}")

    cocotb.log.info("=============================")
