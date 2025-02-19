#ifndef PSRAM_H
#define PSRAM_H

#define     EF_PSRAM_CTRL_V2_BASE				    0x21000000

#define     EF_PSRAM_CTRL_V2_EXTERNAL_MEM_ADDR      (EF_PSRAM_CTRL_V2_BASE + 0x00000000)
#define     EF_PSRAM_CTRL_V2_RD_CMD_REG_ADDR        (EF_PSRAM_CTRL_V2_BASE + 0x00800100)
#define     EF_PSRAM_CTRL_V2_WR_CMD_REG_ADDR        (EF_PSRAM_CTRL_V2_BASE + 0x00800200)
#define     EF_PSRAM_CTRL_V2_EQPI_CMD_REG_ADDR      (EF_PSRAM_CTRL_V2_BASE + 0x00800400)
#define     EF_PSRAM_CTRL_V2_XQPI_CMD_REG_ADDR      (EF_PSRAM_CTRL_V2_BASE + 0x00800800)
#define     EF_PSRAM_CTRL_V2_WAIT_STATES_REG_ADDR   (EF_PSRAM_CTRL_V2_BASE + 0x00801000)
#define     EF_PSRAM_CTRL_V2_MODE_REG_ADDR          (EF_PSRAM_CTRL_V2_BASE + 0x00802000)
#define     EF_PSRAM_CTRL_V2_ENTER_QPI_REG_ADDR     (EF_PSRAM_CTRL_V2_BASE + 0x00804000)
#define     EF_PSRAM_CTRL_V2_EXIT_QPI_REG_ADDR      (EF_PSRAM_CTRL_V2_BASE + 0x00808000)

void PSRAM_setReadCMD(int value){
    (*(volatile int*)EF_PSRAM_CTRL_V2_RD_CMD_REG_ADDR) = value;
}

int PSRAM_getReadCMD(){
    return (*(volatile int*)EF_PSRAM_CTRL_V2_RD_CMD_REG_ADDR);
}

void PSRAM_setWriteCMD(int value){
    (*(volatile int*)EF_PSRAM_CTRL_V2_WR_CMD_REG_ADDR) = value;
}

int PSRAM_getWrireCMD(){
    return (*(volatile int*)EF_PSRAM_CTRL_V2_WR_CMD_REG_ADDR);
}

void PSRAM_setEnterQPIcmd(int value){
    (*(volatile int*)EF_PSRAM_CTRL_V2_EQPI_CMD_REG_ADDR) = value;
}

int PSRAM_getEnterQPIcmd(){
    return (*(volatile int*)EF_PSRAM_CTRL_V2_EQPI_CMD_REG_ADDR);
}

void PSRAM_setExitQPIcmd(int value){
    (*(volatile int*)EF_PSRAM_CTRL_V2_XQPI_CMD_REG_ADDR) = value;
}

int PSRAM_getexitQPIcmd(){
    return (*(volatile int*)EF_PSRAM_CTRL_V2_XQPI_CMD_REG_ADDR);
}

void PSRAM_setWaitStates(int value){
    (*(volatile int*)EF_PSRAM_CTRL_V2_WAIT_STATES_REG_ADDR) = value;
}

int PSRAM_getWaitStates(){
    return (*(volatile int*)EF_PSRAM_CTRL_V2_WAIT_STATES_REG_ADDR);
}

void PSRAM_setMode(int value){
    (*(volatile int*)EF_PSRAM_CTRL_V2_MODE_REG_ADDR) = value;
}

int PSRAM_getMode(){
    return (*(volatile int*)EF_PSRAM_CTRL_V2_MODE_REG_ADDR);
}

void PSRAM_setEnterQPI(int value){
    (*(volatile int*)EF_PSRAM_CTRL_V2_ENTER_QPI_REG_ADDR) = value;
}

int PSRAM_getEnterQPI(){
    return (*(volatile int*)EF_PSRAM_CTRL_V2_ENTER_QPI_REG_ADDR);
}

void PSRAM_setExitQPI(int value){
    (*(volatile int*)EF_PSRAM_CTRL_V2_EXIT_QPI_REG_ADDR) = value;
}

int PSRAM_getExitQPI(){
    return (*(volatile int*)EF_PSRAM_CTRL_V2_EXIT_QPI_REG_ADDR);
}

void PSRAM_writeWord(int addr, int word){
    (*(volatile int*) (EF_PSRAM_CTRL_V2_EXTERNAL_MEM_ADDR + addr)) = word;
}

int PSRAM_readWord(int addr){
    return (*(volatile int*) (EF_PSRAM_CTRL_V2_EXTERNAL_MEM_ADDR + addr));
}


#endif
