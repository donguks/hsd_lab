# 180420 Lab7 Report

2011-11410 서동욱 2012-10554 이현민

## HW

##### `myip_v1_0.v`: wrapper for the following module.

##### `myip_v1_0_s00_AXI.v` 

* Finite State Machine and a master to read and write to BRAM
* register `slv_reg0` controls slave 0
  * if `slv_reg0 == 32'h5555 `, the state changes as below.
    *  0 `Idle` -> 1 `BRAM_READ` -> 3 `BRAM_WAIT` -> 2 `BRAM_WRITE`
  * else, the state remains as `IDLE` 
* register `bram_counter` : resets to 0 then add 1 when  `bram_state == BRAM_WRITE` 
* register `run_complete` : check if we read 4 data from bram.
* shifting is executed like `assign BRAM_WRDATA = BRAM_RDDATA << 1;`

## HW System

`processing_system` runs `main.c` code and change  `slv_reg0`  in `my_ip` through  `AXI Interconnect`. which leads to read and shift values in BRAM.

## SW

##### SD card 15GB: linux OS, 1.1GB: /sdcard 

#####`main.c`

mmap` maps bram to virtual address and run my_ip by changing the value  `slv_reg0`, then print before and after values in the bram. 

### Makefile

`make` without specifying the target, it will build the first target, which compiles `main.c`  then runs the output executable. 



## Figures

![result1](/Users/hm/ClassMaterial/18-1classLocal/HWSystemDesign/hsd_lab/lab7_0420/result1.png)

![wave1](/Users/hm/ClassMaterial/18-1classLocal/HWSystemDesign/hsd_lab/lab7_0420/wave1.png)


![wave2](/Users/hm/ClassMaterial/18-1classLocal/HWSystemDesign/hsd_lab/lab7_0420/wave2.png)