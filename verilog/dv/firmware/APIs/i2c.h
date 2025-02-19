#ifndef I2C_H
#define I2C_H

volatile int I2C_BASES[3] = {0x420F0000, 0x42100000, 0xdeadbeef}; 

#define     I2C_PRE_LO_REG      0x0
#define     I2C_PRE_HI_REG      0x4
#define     I2C_CTRL_REG        0x8
#define     I2C_TX_REG          0xC
#define     I2C_RX_REG          0x10
#define     I2C_CMD_REG         0x14
#define     I2C_STAT_REG        0x18

#define     I2C_CMD_STA         0x80
#define     I2C_CMD_STO         0x40
#define     I2C_CMD_RD          0x20
#define     I2C_CMD_WR          0x10
#define     I2C_CMD_NACK        0x08
#define     I2C_CMD_IACK        0x01

#define     I2C_CTRL_EN         0x80
#define     I2C_CTRL_IEN        0x40

#define     I2C_STAT_RXACK      0x80
#define     I2C_STAT_BUSY       0x40
#define     I2C_STAT_AL         0x20
#define     I2C_STAT_TIP        0x02
#define     I2C_STAT_IF         0x01


#define I2C_PRE_LO         (I2C_BASE + I2C_PRE_LO_REG) 
#define I2C_PRE_HI         (I2C_BASE + I2C_PRE_HI_REG)  
#define I2C_CTRL           (I2C_BASE + I2C_CTRL_REG)
#define I2C_TX             (I2C_BASE + I2C_TX_REG)
#define I2C_RX             (I2C_BASE + I2C_RX_REG)
#define I2C_CMD            (I2C_BASE + I2C_CMD_REG)
#define I2C_STAT           (I2C_BASE + I2C_STAT_REG)

enum i2c_ports {I2C0 = 0, I2C1 = 1};

void i2c_init(enum i2c_ports port, unsigned int pre, char ien_enable){
    unsigned int I2C_BASE = I2C_BASES[port];
    (*(volatile int*)I2C_PRE_LO) = pre & 0xff;
    (*(volatile int*)I2C_PRE_HI) = pre & 0xff00;
    if (ien_enable)
        (*(volatile int*)I2C_CTRL) = I2C_CTRL_EN | I2C_CTRL_IEN;
    else
        (*(volatile int*)I2C_CTRL) = I2C_CTRL_EN;
}

void i2c_send_byte(enum i2c_ports port, unsigned char saddr, unsigned char sdata){
    int volatile y;
    unsigned int I2C_BASE = I2C_BASES[port];
    // send slave address
    (*(volatile int*)I2C_TX) = saddr << 1; // write bit 0 = 0 means write to slave
    (*(volatile int*)I2C_CMD) = I2C_CMD_STA | I2C_CMD_WR;
    while( ((*(volatile int*)I2C_STAT) & I2C_STAT_TIP) != 0 );
    //(*I2C_STAT) & I2C_STAT_TIP ;

    if( ((*(volatile int*)I2C_STAT) & I2C_STAT_RXACK)  == 1) {
        (*(volatile int*)I2C_CMD) = I2C_CMD_STO;
        return;
    }
    // send data
    (*(volatile int*)I2C_TX) = sdata;
    (*(volatile int*)I2C_CMD) = I2C_CMD_WR;
    while( ((*(volatile int*)I2C_STAT) & I2C_STAT_TIP) != 0 );
    (*(volatile int*)I2C_CMD) = I2C_CMD_STO;
    if( ((*(volatile int*)I2C_STAT) & I2C_STAT_RXACK ) == 1)
        return;
    else
        return;

    
}
int i2c_read_byte(enum i2c_ports port, unsigned char saddr){
    int volatile y;
    unsigned int I2C_BASE = I2C_BASES[port];
    // send slave address
    (*(volatile int*)I2C_TX) = saddr << 1 | 1; 
    (*(volatile int*)I2C_CMD) = I2C_CMD_STA | I2C_CMD_WR;
    while( ((*(volatile int*)I2C_STAT) & I2C_STAT_TIP) != 0 );
    //(*I2C_STAT) & I2C_STAT_TIP ;

    (*(volatile int*)I2C_CMD) =I2C_CMD_RD;
    if( ((*(volatile int*)I2C_STAT) & I2C_STAT_RXACK)  == 1) {
        (*(volatile int*)I2C_CMD) = I2C_CMD_STO;
        return;
    }


    // send data
    while( ((*(volatile int*)I2C_STAT) & I2C_STAT_TIP) != 0 );
    int data = (*(volatile int*)I2C_RX);
    while( ((*(volatile int*)I2C_STAT) & I2C_STAT_TIP) != 0 );
    (*(volatile int*)I2C_CMD) = I2C_CMD_STO;
    while( ((*(volatile int*)I2C_STAT) & I2C_STAT_TIP) != 0 );

    return data;
}

#endif