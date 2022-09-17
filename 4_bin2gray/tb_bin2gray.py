import random
import cocotb
from cocotb.triggers import Timer
from model_bin2gray import model_bin2gray


@cocotb.test()
async def basic_test(dut):
    """ Test for converting binary 2 to gray """

    cocotb.log.info("=============================")
    cocotb.log.info("=====Basic Test==============")
    cocotb.log.info("=============================")

    A = 2

    dut.i_bin.value = A
    cocotb.log.info(f"Sent dut.i_bin.value = {A}")

    await Timer(2, units="ns")

    A = bin(A)
    A = str(A[2:])
    # assert str(dut.o_gray.value) == str(model_bin2gray(A)), f"Wrong output: {dut.o_gray.value} != {model_bin2gray(A)}"
    cocotb.log.info(f"Binary: {A} | Exp: {model_bin2gray(A)} | Gray: {dut.o_gray.value}")
    cocotb.log.info("=============================")


async def inc_test(dut):
    """ Inc Test for converting binary 2 to gray """

    cocotb.log.info("=============================")
    cocotb.log.info("=======Inc Test==============")
    cocotb.log.info("=============================")

    # A = 2
    for i in range(4):
        A = random.randint(0, 3)

        dut.i_bin.value = A
        cocotb.log.info(f"Sent dut.i_bin.value = {A}")

        await Timer(2, units="ns")

        A = bin(A)
        A = str(A[2:])
        # assert str(dut.o_gray.value) == str(model_bin2gray(A)), f"Wrong output: {dut.o_gray.value} != {model_bin2gray(A)}"
        cocotb.log.info(
            f"Binary: {A} | Exp: {model_bin2gray(A)} | Gray: {dut.o_gray.value}")
        cocotb.log.info("=============================")
