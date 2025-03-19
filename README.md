# hello FPGA (Field Programmable Gate Arrays)
FPGAs are integrated circuits that can be reconfigured to meet the designers' needs
- they contains an array of `programmable logic blocks`
- they are `truly parallel` in nature unlike CPUs >> different processing operations do not have to compete for the same resources. 
- allows you to design custom digital logic
## Parts of an FPGA
- made up of multiple logic celss, the fundamental building blocks of digital circuits.  
- you could use FPGA to buid your own processor (soft-core processor). could even create multiple processors (soft-core) depending on how much space you haclve in your FPGA fabric

## why use an FPGA
- custom, reconfigurable digital logic circuits
- add more peripherals to your circuit
- modify cpu


## When to use FPGAs
- Digital signal processing
- high frequency data control/transmission
- sometimes it's just cheaper to use a reconfiguble logic with FPGA
- if you are making a few units of a product
- Prototyping for production 

## Hardware Description Language (HDL)
- We use HDLs to program FPGAs
- they are less like traditiona programming languages but more of markup languages
- set of instructions occurs at once rather than a sequential execution
    - Verilog (weekly-typed)
    - VHDL (strongly-typed)
    - System-Verilog extends verilog functionality

- Both HDLs are example of `(Register-Level Transfer)RLT design`, the describe how the circuit move and manipulate data between registers but desnt entail the necessary hardware to do so

## Design flow
- HDL Coding (verilog)
- Simulation (testbench gtkwave)
- Systenthesis (yosys)
    - takes code and translate to gate-leve representation (netlist of how different block interconnect)
- Place and Route (PNR) `nextpnr`
- Package (icepack) (convert to binary file)
- Upload (iceprog) to your FPGA
> with `YAPIO` it calls all the above low-level tools for us so we don't have to worry much

 # [Installing to get started](https://youtu.be/gtkQ84Euyww?si=WTLcoFpK9YusJ3oJ)

 1. `python --versoin`
 2. `python -m pip install apio=0.6.7`
    - if you encounter an error try to run your termainl as an administrator
3. verify: `apio --version`
4. tooling: `apio install --all` 
5. install necessary drivers: `apio install driver`
6. in case of ftdi: `apio drivers --ftdi-enable`
