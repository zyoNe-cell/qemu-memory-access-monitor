# qemu-memory-access-monitor

### Introduction

Modifying for monitoring the page accesses from the guest OS

### Terms Explanation

These phases are equvalent in this document: 1)TCG instruction, Operation, translated codes, translated instruction, emulating function.<br />

### Environment:

Guest OS version: ubuntu-16.04.6-server-i386;

Format of installed image(Aka: Image contains the Guest OS):

QEMU version&type: qemu-system-i386,  full-software-emulation

<br />

### Run:

sh ./vm-start.sh

## Issues:

### 1)Some specific instructions are not well cared:(Need to double check)

Introduction: I am some certain undertanding on the "Instruction side". and "Software MMU side".

And the interfaces in software mmu are used by the operations. So only when there are some "backdoors", we may wrong records the HVA as GVA or GPA;

(1)call and jmp instruction in IA32 will be translated into exit_tb t0, goto_tb index, the "address" used in the operand are not in the form of
guest PA.

(2)Some oprands in operations use host memory address instead of guest memorory to locate the memory posistion.

![image.png](assets/image.png?t=1691196306571)

Reference: [TCG Intermediate Representation — QEMU 8.0.0 documentation](https://qemu.readthedocs.io/en/latest/devel/tcg-ops.html)

2)VM DNS issues
3)Not been fully tested the accurancy yet.

## Note:

The installed image of ubuntu -i386 is too big to directly upload

__More information about the project:__ https://github.com/zyoNe-cell/qemu-memory-access-monitor/blob/master/Porject%20description.rst
