/**
 \file
*/
#ifndef HK_HEADER_FILE
#define HK_HEADER_FILE

#define HKSPI_PORT_BASE_ADDR 0x26000000
#define HKSPI_SPI_BASE_ADDR 0x26100000
#define CTRL_BITS_SIZE 16

#define reg_hkspi_status      (*(volatile unsigned int*)(HKSPI_SPI_BASE_ADDR + 0x00))
#define reg_hkspi_chip_id     (*(volatile unsigned int*)(HKSPI_SPI_BASE_ADDR + 0x04))
#define reg_hkspi_user_id     (*(volatile unsigned int*)(HKSPI_SPI_BASE_ADDR + 0x08))
#define reg_hkspi_irq 	      (*(volatile unsigned int*)(HKSPI_SPI_BASE_ADDR + 0x14))
#define reg_hkspi_reset       (*(volatile unsigned int*)(HKSPI_SPI_BASE_ADDR + 0x18))
#define reg_hkspi_disable     (*(volatile unsigned int*)(HKSPI_SPI_BASE_ADDR + 0x1C))

#define reg_mprj_xfer   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x00))
#define reg_mprj_io_0   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x24))
#define reg_mprj_io_1   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x28))
#define reg_mprj_io_2   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x2c))
#define reg_mprj_io_3   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x30))
#define reg_mprj_io_4   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x34))
#define reg_mprj_io_5   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x38))
#define reg_mprj_io_6   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x3c))
#define reg_mprj_io_7   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x40))
#define reg_mprj_io_8   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x44))
#define reg_mprj_io_9   (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x48))
#define reg_mprj_io_10  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x4c))
#define reg_mprj_io_11  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x50))
#define reg_mprj_io_12  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x54))
#define reg_mprj_io_13  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x58))
#define reg_mprj_io_14  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x5c))
#define reg_mprj_io_15  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x60))
#define reg_mprj_io_16  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x64))
#define reg_mprj_io_17  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x68))
#define reg_mprj_io_18  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x6c))
#define reg_mprj_io_19  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x70))
#define reg_mprj_io_20  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x74))
#define reg_mprj_io_21  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x78))
#define reg_mprj_io_22  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x7c))
#define reg_mprj_io_23  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x80))
#define reg_mprj_io_24  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x84))
#define reg_mprj_io_25  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x88))
#define reg_mprj_io_26  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x8c))
#define reg_mprj_io_27  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x90))
#define reg_mprj_io_28  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x94))
#define reg_mprj_io_29  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x98))
#define reg_mprj_io_30  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x9c))
#define reg_mprj_io_31  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xa0))
#define reg_mprj_io_32  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xa4))
#define reg_mprj_io_33  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xa8))
#define reg_mprj_io_34  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xac))
#define reg_mprj_io_35  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xb0))
#define reg_mprj_io_36  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xb4))
#define reg_mprj_io_37  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xb8))
#define reg_mprj_io_38  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xbc))
#define reg_mprj_io_39  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xc0))
#define reg_mprj_io_40  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xc4))
#define reg_mprj_io_41  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xc8))
#define reg_mprj_io_42  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xcc))
#define reg_mprj_io_43  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xd0))
#define reg_mprj_io_44  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xd4))
#define reg_mprj_io_45  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xd8))
#define reg_mprj_io_46  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xdc))
#define reg_mprj_io_47  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xe0))
#define reg_mprj_io_48  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xe4))
#define reg_mprj_io_49  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xe8))
#define reg_mprj_io_50  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xec))
#define reg_mprj_io_51  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xf0))
#define reg_mprj_io_52  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xf4))
#define reg_mprj_io_53  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xf8))
#define reg_mprj_io_54  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0xfc))
#define reg_mprj_io_55  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x100))
#define reg_mprj_io_56  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x104))
#define reg_mprj_io_57  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x108))
#define reg_mprj_io_58  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x10c))
#define reg_mprj_io_59  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x110))
#define reg_mprj_io_60  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x114))
#define reg_mprj_io_61  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x118))
#define reg_mprj_io_62  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x11c))
#define reg_mprj_io_63  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x120))
#define reg_mprj_io_64  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x124))
#define reg_mprj_io_65  (*(volatile unsigned int*)(HKSPI_PORT_BASE_ADDR + 0x128))





enum gpio_mode {
                GPIO_MODE_MGMT_STD_INPUT_NOPULL = 0x8403,
                GPIO_MODE_MGMT_STD_INPUT_PULLDOWN =0x8c01,
                GPIO_MODE_MGMT_STD_INPUT_PULLUP=0x8801,
                GPIO_MODE_MGMT_STD_OUTPUT=0x9809,
                GPIO_MODE_MGMT_STD_BIDIRECTIONAL=0x9801,
                GPIO_MODE_MGMT_STD_ANALOG=0x800b,
                GPIO_MODE_USER_STD_INPUT_NOPULL=0x8402,
                GPIO_MODE_USER_STD_INPUT_PULLDOWN=0x8c00,
                GPIO_MODE_USER_STD_INPUT_PULLUP=0x8800,
                GPIO_MODE_USER_STD_OUTPUT=0x9808,
                GPIO_MODE_USER_STD_BIDIRECTIONAL=0x9800,
                GPIO_MODE_USER_STD_OUT_MONITORED=0x9802,
                GPIO_MODE_USER_STD_ANALOG=0x800a};

/**
 * Configure all GPIOs with the config
 *  
 * @param config is configuration of type gpio_mode
 * 
 * \note
 * These configurations will not be change the GPIOs modes until calling HK_loadConfigs()
 * 
 */
void HK_configureAll(enum gpio_mode config){
    reg_mprj_io_65 = config;
    reg_mprj_io_64 = config;
    reg_mprj_io_63 = config;
    reg_mprj_io_62 = config;
    reg_mprj_io_61 = config;
    reg_mprj_io_60 = config;
    reg_mprj_io_59 = config;
    reg_mprj_io_58 = config;
    reg_mprj_io_57 = config;
    reg_mprj_io_56 = config;
    reg_mprj_io_55 = config;
    reg_mprj_io_54 = config;
    reg_mprj_io_53 = config;
    reg_mprj_io_52 = config;
    reg_mprj_io_51 = config;
    reg_mprj_io_50 = config;
    reg_mprj_io_49 = config;
    reg_mprj_io_48 = config;
    reg_mprj_io_47 = config;
    reg_mprj_io_46 = config;
    reg_mprj_io_45 = config;
    reg_mprj_io_44 = config;
    reg_mprj_io_43 = config;
    reg_mprj_io_42 = config;
    reg_mprj_io_41 = config;
    reg_mprj_io_40 = config;
    reg_mprj_io_39 = config;
    reg_mprj_io_38 = config;
    reg_mprj_io_37 = config;
    reg_mprj_io_36 = config;
    reg_mprj_io_35 = config;
    reg_mprj_io_34 = config;
    reg_mprj_io_33 = config;
    reg_mprj_io_32 = config;
    reg_mprj_io_31 = config;
    reg_mprj_io_30 = config;
    reg_mprj_io_29 = config;
    reg_mprj_io_28 = config;
    reg_mprj_io_27 = config;
    reg_mprj_io_26 = config;
    reg_mprj_io_25 = config;
    reg_mprj_io_24 = config;
    reg_mprj_io_23 = config;
    reg_mprj_io_22 = config;
    reg_mprj_io_21 = config;
    reg_mprj_io_20 = config;
    reg_mprj_io_19 = config;
    reg_mprj_io_18 = config;
    reg_mprj_io_17 = config;
    reg_mprj_io_16 = config;
    reg_mprj_io_15 = config;
    reg_mprj_io_14 = config;
    reg_mprj_io_13 = config;
    reg_mprj_io_12 = config;
    reg_mprj_io_11 = config;
    reg_mprj_io_10 = config;
    reg_mprj_io_9  = config;
    reg_mprj_io_8  = config;
    reg_mprj_io_7  = config;
    reg_mprj_io_6  = config;
    reg_mprj_io_5  = config;
    reg_mprj_io_4  = config;
    reg_mprj_io_3  = config;
    reg_mprj_io_2  = config;
    reg_mprj_io_1  = config;
    reg_mprj_io_0  = config;
}
/**
 * Load the configurations changes to the GPIOs 
 *  
 */
void HK_loadConfigs(){
    reg_mprj_xfer = 1;
    while ((reg_mprj_xfer&0x1) == 1);
}

void HK_disableSpi(){
    reg_hkspi_disable = 1;
}
/**
 * Configure one GPIO with the input config
 *  
 * @param config is configuration of type gpio_mode
 * @param gpio_num is GPIO number it can have values from 0 to 37
 * 
 * \note
 * These configurations will not be change the GPIOs modes until calling HK_loadConfigs()
 * 
 */
void HK_configure(int gpio_num,enum gpio_mode config){
    switch(gpio_num){
        case 0 :
            reg_mprj_io_0   = config; break;
        case 1 :
            reg_mprj_io_1   = config; break;
        case 2 :
            reg_mprj_io_2   = config; break;
        case 3 :
            reg_mprj_io_3   = config; break;
        case 4 :
            reg_mprj_io_4   = config; break;
        case 5 :
            reg_mprj_io_5   = config; break;
        case 6 :
            reg_mprj_io_6   = config; break;
        case 7 :
            reg_mprj_io_7   = config; break;
        case 8 :
            reg_mprj_io_8   = config; break;
        case 9 :
            reg_mprj_io_9   = config; break;
        case 10:
            reg_mprj_io_10  = config; break;
        case 11:
            reg_mprj_io_11  = config; break;
        case 12:
            reg_mprj_io_12  = config; break;
        case 13:
            reg_mprj_io_13  = config; break;
        case 14:
            reg_mprj_io_14  = config; break;
        case 15:
            reg_mprj_io_15  = config; break;
        case 16:
            reg_mprj_io_16  = config; break;
        case 17:
            reg_mprj_io_17  = config; break;
        case 18:
            reg_mprj_io_18  = config; break;
        case 19:
            reg_mprj_io_19  = config; break;
        case 20:
            reg_mprj_io_20  = config; break;
        case 21:
            reg_mprj_io_21  = config; break;
        case 22:
            reg_mprj_io_22  = config; break;
        case 23:
            reg_mprj_io_23  = config; break;
        case 24:
            reg_mprj_io_24  = config; break;
        case 25:
            reg_mprj_io_25  = config; break;
        case 26:
            reg_mprj_io_26  = config; break;
        case 27:
            reg_mprj_io_27  = config; break;
        case 28:
            reg_mprj_io_28  = config; break;
        case 29:
            reg_mprj_io_29  = config; break;
        case 30:
            reg_mprj_io_30  = config; break;
        case 31:
            reg_mprj_io_31  = config; break;
        case 32:
            reg_mprj_io_32  = config; break;
        case 33:
            reg_mprj_io_33  = config; break;
        case 34:
            reg_mprj_io_34  = config; break;
        case 35:
            reg_mprj_io_35  = config; break;
        case 36:
            reg_mprj_io_36  = config; break;
        case 37:
            reg_mprj_io_37  = config; break;
        case 38:
            reg_mprj_io_38  = config; break;
        case 39:
            reg_mprj_io_39  = config; break;
        case 40:
            reg_mprj_io_40  = config; break;
        case 41:
            reg_mprj_io_41  = config; break;
        case 42:
            reg_mprj_io_42  = config; break;
        case 43:
            reg_mprj_io_43  = config; break;
        case 44:
            reg_mprj_io_44  = config; break;
        case 45:
            reg_mprj_io_45  = config; break;
        case 46:
            reg_mprj_io_46  = config; break;
        case 47:
            reg_mprj_io_47  = config; break;
        case 48:
            reg_mprj_io_48  = config; break;
        case 49:
            reg_mprj_io_49  = config; break;
        case 50:
            reg_mprj_io_50  = config; break;
        case 51:
            reg_mprj_io_51  = config; break;
        case 52:
            reg_mprj_io_52  = config; break;
        case 53:
            reg_mprj_io_53  = config; break;
        case 54:
            reg_mprj_io_54  = config; break;
        case 55:
            reg_mprj_io_55  = config; break;
        case 56:
            reg_mprj_io_56  = config; break;
        case 57:
            reg_mprj_io_57  = config; break;
        case 58:
            reg_mprj_io_58  = config; break;
        case 59:
            reg_mprj_io_59  = config; break;
        case 60:
            reg_mprj_io_60  = config; break;
        case 61:
            reg_mprj_io_61  = config; break;
        case 62:
            reg_mprj_io_62  = config; break;
        case 63:
            reg_mprj_io_63  = config; break;
        case 64:
            reg_mprj_io_64  = config; break;
        case 65:
            reg_mprj_io_65  = config; break;
        default:
            break;
    }
}
int HK_configureRead(int gpio_num){
    switch(gpio_num){
        case 0:
            return reg_mprj_io_0;
        case 1:
            return reg_mprj_io_1;
        case 2:
            return reg_mprj_io_2;
        case 3:
            return reg_mprj_io_3;
        case 4:
            return reg_mprj_io_4;
        case 5:
            return reg_mprj_io_5;
        case 6:
            return reg_mprj_io_6;
        case 7:
            return reg_mprj_io_7;
        case 8:
            return reg_mprj_io_8;
        case 9:
            return reg_mprj_io_9;
        case 10:
            return reg_mprj_io_10;
        case 11:
            return reg_mprj_io_11;
        case 12:
            return reg_mprj_io_12;
        case 13:
            return reg_mprj_io_13;
        case 14:
            return reg_mprj_io_14;
        case 15:
            return reg_mprj_io_15;
        case 16:
            return reg_mprj_io_16;
        case 17:
            return reg_mprj_io_17;
        case 18:
            return reg_mprj_io_18;
        case 19:
            return reg_mprj_io_19;
        case 20:
            return reg_mprj_io_20;
        case 21:    
            return reg_mprj_io_21;
        case 22:
            return reg_mprj_io_22;
        case 23:
            return reg_mprj_io_23;
        case 24:
            return reg_mprj_io_24;
        case 25:
            return reg_mprj_io_25;
        case 26:
            return reg_mprj_io_26;
        case 27:
            return reg_mprj_io_27;
        case 28:
            return reg_mprj_io_28;
        case 29:
            return reg_mprj_io_29;
        case 30:
            return reg_mprj_io_30;
        case 31:    
            return reg_mprj_io_31;
        case 32:
            return reg_mprj_io_32;
        case 33:
            return reg_mprj_io_33;
        case 34:
            return reg_mprj_io_34;
        case 35:
            return reg_mprj_io_35;
        case 36:
            return reg_mprj_io_36;
        case 37:
            return reg_mprj_io_37;
        case 38:
            return reg_mprj_io_38;
        case 39:
            return reg_mprj_io_39;
        case 40:
            return reg_mprj_io_40;
        case 41:
            return reg_mprj_io_41;
        case 42:
            return reg_mprj_io_42;
        case 43:
            return reg_mprj_io_43;
        case 44:
            return reg_mprj_io_44;
        case 45:
            return reg_mprj_io_45;
        case 46:
            return reg_mprj_io_46;
        case 47:
            return reg_mprj_io_47;
        case 48:
            return reg_mprj_io_48;
        case 49:
            return reg_mprj_io_49;
        case 50:
            return reg_mprj_io_50;
        case 51:
            return reg_mprj_io_51;
        case 52:
            return reg_mprj_io_52;
        case 53:
            return reg_mprj_io_53;
        case 54:
            return reg_mprj_io_54;
        case 55:
            return reg_mprj_io_55;
        case 56:
            return reg_mprj_io_56;
        case 57:
            return reg_mprj_io_57;
        case 58:
            return reg_mprj_io_58;
        case 59:
            return reg_mprj_io_59;
        case 60:
            return reg_mprj_io_60;
        case 61:
            return reg_mprj_io_61;
        case 62:
            return reg_mprj_io_62;
        case 63:
            return reg_mprj_io_63;
        case 64:
            return reg_mprj_io_64;
        case 65:
            return reg_mprj_io_65;
        default:
            return 0;
    }
}
#endif // HK_HEADER_FILE
