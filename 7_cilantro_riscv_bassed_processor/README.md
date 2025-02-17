## Cilantro RISC-V 

Cilantro is a RISC-V based processor 

1. **Processor Architecture:**
   Define the overall structure of the RISC-V processor, including its components like the Program Counter (PC), Arithmetic Logic Unit (ALU), and registers.

2. **Instruction Set Subset:**
   Choose a subset of RISC-V instructions that the processor will support.

3. **Instruction Fetch (IF) Stage:**
   Implement the stage where the processor fetches instructions from memory based on the value in the PC.

4. **Instruction Decode (ID) Stage:**
   Implement the stage where the fetched instruction is decoded to determine the operation to be performed.

5. **Register File:**
   Create a register file to hold the processor's general-purpose registers.

6. **Arithmetic Logic Unit (ALU):**
   Design and implement the ALU, which performs arithmetic and logical operations on data.

7. **Execution Stage:**
   Perform the required operation using the ALU based on the decoded instruction. Handle special cases like branching and memory accesses (load and store).

8. **Memory Unit:**
   Design a simple memory unit to store data and instructions.

9. **Control Logic:**
   Develop the control logic to manage the flow of instructions through the various stages of the processor. Control the data path and ensure proper synchronization of different stages.

10. **Testing and Simulation:**
    Create a testbench to simulate the processor's behavior and verify its correctness. Write assembly programs using the subset of RISC-V instructions to validate the processor's functionality. Perform functional testing to check if the processor executes instructions correctly.

11. **Performance Evaluation (Optional):**
    If desired, evaluate the performance of your basic RISC-V processor by running benchmark programs and measuring execution times.

12. **Optimization (Optional):**
    Explore opportunities for optimization in your processor design, such as pipelining or caching, to improve its performance.

## Pipeline Stages

IF --> ID --> EX --> MEM --> WB

1. Instruction Fetch
2. Instruction Decode
3. Execution
4. Memory Access
5. Write Back
