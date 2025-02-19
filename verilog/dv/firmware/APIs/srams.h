#ifndef SRAMS_H
#define SRAMS_H


volatile int SRAMS_BASES[4] = { 0x20000000, 0x48000000, 0x6C000000, 0xdeadbeaf }; 
// unsigned short *SRAM_halfWordBases =  {(unsigned short *) SRAMS_BASES[0], (unsigned short *) SRAMS_BASES[1], (unsigned short *) SRAMS_BASES[2]};
// unsigned char *SRAM_byteBases =  {(unsigned char *) SRAMS_BASES[0], (unsigned char *) SRAMS_BASES[1], (unsigned char *) SRAMS_BASES[2]};

enum ram_types { RAM0 = 0, RAM1= 1, USER_RAM=2};

inline int SRAM_readWord(enum ram_types ram, int word_num) __attribute__((always_inline));
inline void SRAM_writeWord(enum ram_types ram, int word_num, int data) __attribute__((always_inline));

inline void SRAM_writeWord(enum ram_types ram, int word_num, int data){
    (*(volatile int*)(SRAMS_BASES[ram] + word_num)) = data;
}

inline int SRAM_readWord(enum ram_types ram, int word_num){
    return (*(volatile int*) (SRAMS_BASES[ram] + word_num));
}

inline unsigned short SRAM_readHalfWord(enum ram_types ram, int half_word_num) __attribute__((always_inline));
inline void SRAM_writeHalfWord(enum ram_types ram, int half_word_num, unsigned short data) __attribute__((always_inline));

inline void SRAM_writeHalfWord(enum ram_types ram, int half_word_num, unsigned short data){
    (*(volatile short*) (SRAMS_BASES[ram] + half_word_num)) = data;
}

inline unsigned short SRAM_readHalfWord(enum ram_types ram, int half_word_num){
    return (*(volatile short*) (SRAMS_BASES[ram] + half_word_num)) >> 16;
}

inline void SRAM_writeByte(enum ram_types ram, int byte_num, unsigned char data) __attribute__((always_inline));
inline unsigned char SRAM_readByte(enum ram_types ram, int byte_num) __attribute__((always_inline));

inline void SRAM_writeByte(enum ram_types ram, int byte_num, unsigned char data){
    (*(volatile char*)(SRAMS_BASES[ram] + byte_num)) = data;
}

inline unsigned char SRAM_readByte(enum ram_types ram, int byte_num){
    return (*(volatile char*) (SRAMS_BASES[ram] + byte_num));
}
int SRAM_byteSize(enum ram_types ram){
    if (ram == RAM0) return 8192;
    if (ram == RAM1) return 8192;
    if (ram == USER_RAM) return 32768;
    return 0;
}

void SRAM_setWriteDelay(enum ram_types ram, int delay){
    // to change counter val write the value while assert bit 23 which is 0x8xxxxxxx 
    // the register is non readable
    // register is 3 bits 
    *(volatile int*)(SRAMS_BASES[ram] + 0x800000) = delay;
}

#endif // SRAMS_H