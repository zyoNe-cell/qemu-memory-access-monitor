Project Description
In our assumption, we ignore 
1)the memory access on the guest page tables;
2)Indirect addressing in IA32
3)I/O;
4)Eventfds;




There are two kinds address recorded by the Controlled Channel attack
- Page fault Address: The address whose access triggered the page fault;
- Instruction address of page fault: Address of instruction A, when the page fault happen when instruction A is executed;

These can classfiyed into two types of monitoring events in QEMU:
- recording the executed instruction address(GVA and GPA)
- recording the addresss of instruction I and data access D, when the data access D happening in the execution of Instruction I;


Implementation:

For Every time we get an translated code, we records that PC value and GPA;
When the translated code doing memory operations get exectued, record the address which accessed by the translated code.



#Analysis process-----
wo appoarches: Top to down: Translated codes access software MMU      
Down to Top: MMU be accessed by anyone using the interfaces


Executing process:

cpu_exec_loop() --1)will use tb_lookup() to see if "that context" exsit in the chain of TBs, if not call tb_gen_code()       ->  cpu_loop_exec_tb()   ->   cpu_tb_exec() 
->tcg_qemu_tb_exec() where execute the translated code(some codes are QEMU specific operations: JMP  or QEMU load)
executing the bit operations one by one;


The fetching process:
 tb_gen_code() or cpu_exec_step_atomic()     
 ->tb_lookup() --to check if there exits an translated instruction with same PC value-
 -> tb_htable_lookup()    
 ->get_page_addr_code_hostp() --get GPA of code waitted to be translated  ; -> module translates the GVA to GPA(and do TLB fill if TLB miss); 
When looking up if the instruction get translated already, the control flow of looking up process also
pass through the probe_access_internal(). The GPA is only unique

tb-_gen_code() ->get_page_addr_code_hostp()

SoftMMU:
SoftMMU interfaces/entries for the translated instruction:


Memory Address: is the link between guest phy
ATOMIC_NAME   MMU_write;






+Features:

