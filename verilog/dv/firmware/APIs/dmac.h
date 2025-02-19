#ifndef DMAC_H
#define DMAC_H

#define DMAC_BASE				0x24000000

#define	DMAC_SADDR_REG_ADDR		    (DMAC_BASE+0x0)
#define	DMAC_DADDR_REG_ADDR		    (DMAC_BASE+0x4)
#define	DMAC_CONTROL_REG_ADDR		(DMAC_BASE+0x8)
#define	DMAC_SCFG_REG_ADDR		    (DMAC_BASE+0xC)
#define	DMAC_DCFG_REG_ADDR		    (DMAC_BASE+0x10)
#define	DMAC_CFG_REG_ADDR		    (DMAC_BASE+0x14)
#define	DMAC_COUNT_REG_ADDR		    (DMAC_BASE+0x18)
#define	DMAC_SIZE_REG_ADDR		    (DMAC_BASE+0x1C)
#define	DMAC_STATUS_REG_ADDR		(DMAC_BASE+0x20)
#define	DMAC_ICRA_REG_ADDR		    (DMAC_BASE+0x24)
#define	DMAC_ICRV_REG_ADDR		    (DMAC_BASE+0x28)

#define DMAC_CONTROL_REG_START		0
#define DMAC_CONTROL_REG_START_LEN	1
#define DMAC_CFG_REG_SIZE    		0
#define DMAC_CFG_REG_SIZE_LEN	    3
#define DMAC_CFG_REG_INC    		4
#define DMAC_CFG_REG_INC_LEN	    3

#define DMAC_STATUS_REG_DONE		0
#define DMAC_STATUS_REG_DONE_LEN	1

enum data_size {dma_byte =0, dma_half_word = 1, dma_word = 2};

void DMAC_setSourceDataType(enum data_size value){
    unsigned int mask = ((1 << DMAC_CFG_REG_SIZE_LEN) - 1) << DMAC_CFG_REG_SIZE;
    // Clear the bits at the specified offset in the original number
    (*(volatile int*)DMAC_SCFG_REG_ADDR) &= ~mask;
    // Set the bits with the given value at the specified offset
    (*(volatile int*)DMAC_SCFG_REG_ADDR) |= (value << DMAC_CFG_REG_SIZE);
}

//0: byte, 1: half word, 2: word
void DMAC_setDestinationDataType (enum data_size value){

    unsigned int mask = ((1 << DMAC_CFG_REG_SIZE_LEN) - 1) << DMAC_CFG_REG_SIZE;

    // Clear the bits at the specified offset in the original number
    (*(volatile int*)DMAC_DCFG_REG_ADDR) &= ~mask;

    // Set the bits with the given value at the specified offset
    (*(volatile int*)DMAC_DCFG_REG_ADDR) |= (value << DMAC_CFG_REG_SIZE);
    
}

void DMAC_sourceAddrAutoIncrement(enum data_size value){
        int data = (value == dma_byte) ? 1 : (value == dma_half_word) ? 2 : 4;
        unsigned int mask = ((1 << DMAC_CFG_REG_INC_LEN) - 1) << DMAC_CFG_REG_INC;

        // Clear the bits at the specified offset in the original number
        (*(volatile int*)DMAC_SCFG_REG_ADDR) &= ~mask;

        // Set the bits with the given value at the specified offset
        (*(volatile int*)DMAC_SCFG_REG_ADDR) |= (data << DMAC_CFG_REG_INC);
}

void DMAC_destinationAddrAutoIncrement(enum data_size value){
        int data = (value == dma_byte) ? 1 : (value == dma_half_word) ? 2 : 4;
        unsigned int mask = ((1 << DMAC_CFG_REG_INC_LEN) - 1) << DMAC_CFG_REG_INC;

        // Clear the bits at the specified offset in the original number
        (*(volatile int*)DMAC_DCFG_REG_ADDR) &= ~mask;

        // Set the bits with the given value at the specified offset
        (*(volatile int*)DMAC_DCFG_REG_ADDR) |= (data << DMAC_CFG_REG_INC);


}


void DMAC_setConfigReg(int value){

    (*(volatile int*)DMAC_CFG_REG_ADDR) = value;
}

void DMAC_setIrq(int is_enabled, int irq_num){

    (*(volatile int*)DMAC_CFG_REG_ADDR) = is_enabled | (irq_num <<4);
}

void DMAC_setSourceAddr(int value){

    (*(volatile int*)DMAC_SADDR_REG_ADDR) = value;

}
int DMAC_getSourceAddr(){

    return (*(volatile int*)DMAC_SADDR_REG_ADDR);

}

void DMAC_setDestinationAddr(int value){

    (*(volatile int*)DMAC_DADDR_REG_ADDR) = value;

}
int DMAC_getDestinationAddr(){

    return (*(volatile int*)DMAC_DADDR_REG_ADDR);

}

void DMAC_setCount(int value){
    (*(volatile int*)DMAC_COUNT_REG_ADDR) = value;
}

void DMAC_setSize(int value){
    (*(volatile int*)DMAC_SIZE_REG_ADDR) = value;
}

int DMAC_getCount(){
    return (*(volatile int*)DMAC_COUNT_REG_ADDR);
}

void DMAC_setSWTrigger(){
    (*(volatile int*)DMAC_CONTROL_REG_ADDR) = 1;
}

int DMAC_getSWTrigger(){
    return (*(volatile int*)DMAC_CONTROL_REG_ADDR);
}

int DMAC_getStatus(){

    return (*(volatile int*)DMAC_STATUS_REG_ADDR);

}

void DMAC_set_ICR_A(int val){
    (*(volatile int*)DMAC_ICRA_REG_ADDR) = val;
}

void DMAC_set_ICR_V(int val){
    (*(volatile int*)DMAC_ICRV_REG_ADDR) = val;
}
#endif

