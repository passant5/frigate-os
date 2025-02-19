#ifndef SPI_H
#define SPI_H
#include <EF_SPI.c>

int SPI_read_address(int spi_base, int address){
    EF_SPI_assertCs(spi_base);
    EF_SPI_enable(spi_base);
    EF_SPI_enableRx(spi_base);

    EF_SPI_writeData(spi_base, 0x10); // read command
    EF_SPI_waitRxFifoNotEmpty(spi_base);
    EF_SPI_readData(spi_base); // pop value from RX fifo
    EF_SPI_writeData(spi_base, address); // address
    EF_SPI_waitRxFifoNotEmpty(spi_base);
    EF_SPI_readData(spi_base); // pop value from RX fifo
    EF_SPI_writeData(spi_base, 0x0); // write 0 to send clk
    EF_SPI_waitRxFifoNotEmpty(spi_base);
    volatile int data = EF_SPI_readData(spi_base);
    EF_SPI_disableRx(spi_base);
    EF_SPI_deassertCs(spi_base);
    EF_SPI_disable(spi_base);
    return data;
}
#endif // SPI_H