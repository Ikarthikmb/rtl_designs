import random
import math
import cocotb
from cocotb.triggers import Timer
from model_bin2gray import model_bin2gray


@cocotb.test()
async def basic_test(dut):
    """* Test for converting binary 2 to gray """

    cocotb.log.info("-"*38)
    cocotb.log.info("| Basic Test")
    cocotb.log.info("-"*38)

    A = 2

    dut.i_bin.value = A
    # cocotb.log.info(f"Sent dut.i_bin.value = {A}")

    await Timer(2, units="ns")

    A = bin(A)
    A = str(A[2:])
    assert str(dut.o_gray.value).zfill(4) == str(model_bin2gray(A)).zfill(4), f"Wrong output: {dut.o_gray.value} != {model_bin2gray(A)}"
    cocotb.log.info(
            f"Binary: {str(A).zfill(4)} | Exp: {str(model_bin2gray(A)).zfill(4)} | Gray: {dut.o_gray.value}")
    cocotb.log.info("-"*38)


@cocotb.test()
async def inc_test(dut):
    """* Inc Test for converting 2-bit binary to gray """

    cocotb.log.info("-"*38)
    cocotb.log.info("| Inc Test")
    cocotb.log.info("-"*38)

    # A = 2
    for i in range(4):
        A = random.randint(0, 3)

        dut.i_bin.value = A
        # cocotb.log.info(f"Sent dut.i_bin.value = {A}")

        await Timer(2, units="ns")

        A = str(bin(A)[2:])
        assert str(dut.o_gray.value).zfill(4) == str(model_bin2gray(A)).zfill(4), f"Wrong output: {dut.o_gray.value} != {model_bin2gray(A)}"
        cocotb.log.info(
            f"Binary: {str(A).zfill(4)} | Exp: {str(model_bin2gray(A)).zfill(4)} | Gray: {dut.o_gray.value}")
    cocotb.log.info("-"*38)

@cocotb.test()
async def inc_test4b(dut):
    """* Inc Test for converting 4-bit Binary to gray """

    cocotb.log.info("-"*38)
    cocotb.log.info("| Inc Test 4Bit")
    cocotb.log.info("-"*38)

    l = 4
    # A = 2
    for i in range(math.ceil(4+(2**l/l))):
        A = random.randint(0, (2**l)-2)

        dut.i_bin.value = A
        # cocotb.log.info(f"Sent dut.i_bin.value = {A}")

        await Timer(2, units="ns")

        A = str(bin(A)[2:])
        assert str(dut.o_gray.value).zfill(4) == str(model_bin2gray(A)).zfill(4), f"Wrong output: {dut.o_gray.value} != {model_bin2gray(A)}"
        cocotb.log.info(
            f"Binary: {str(A).zfill(4)} | Exp: {str(model_bin2gray(A)).zfill(4)} | Gray: {dut.o_gray.value}")
    cocotb.log.info("-"*38)
