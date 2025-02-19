#ifndef CAN_H_
#define CAN_H_

//#include <sys/mman.h>
#include <stdint.h>

#define CTU_CAN_FD_BASE                 0x400D0000
#define CTU_CAN_FD_DEVICE_ID            0xCAFD

#define BIT(nr) (1UL << (nr))

#define CTU_CAN_FD_DEVICE_ID_OFFSET      0x0
#define CTU_CAN_FD_VERSION_OFFSET        0x2
#define CTU_CAN_FD_MODE_OFFSET           0x4
#define CTU_CAN_FD_SETTINGS_OFFSET       0x6
#define CTU_CAN_FD_INT_STAT_OFFSET       0x10
#define CTU_CAN_FD_INT_ENA_SET_OFFSET    0x14
#define CTU_CAN_FD_INT_ENA_CLR_OFFSET    0x18
#define CTU_CAN_FD_INT_MASK_SET_OFFSET   0x1C
#define CTU_CAN_FD_INT_MASK_CLR_OFFSET   0x20
#define CTU_CAN_FD_BTR_OFFSET            0x24
#define CTU_CAN_FD_BTR_FD_OFFSET         0x28
#define CTU_CAN_FD_RX_DATA_OFFSET        0x6C
#define CTU_CAN_FD_RX_STATUS_OFFSET      0x68
#define CTU_CAN_FD_TX_STATUS_OFFSET      0x70
#define CTU_CAN_FD_TRV_DELAY_OFFSET      0x80
#define CTU_CAN_FD_FAULT_STATUS_OFFSET   0x2E
#define CTU_CAN_FD_TXT_COMMAND_OFFSET    0x74
#define CTU_CAN_FD_TXT_BUFFER_1_OFFSET   0x100

#define CTU_CAN_FD_RX_STATUS_RXE_BIT     0
#define CTU_CAN_FD_MODE_RST_BIT          0
#define CTU_CAN_FD_MODE_BMM_BIT          1
#define CTU_CAN_FD_MODE_STM_BIT          2
#define CTU_CAN_FD_MODE_FDE_BIT          4
#define CTU_CAN_FD_STATUS_ENA_BIT        6
#define CTU_CAN_FD_FAULT_STATUS_ERA_BIT  0
#define CTU_CAN_FD_SETTINGS_ILBP_BIT     5

#define CTU_CAN_FD_INT_STAT_RXI_BIT      0
#define CTU_CAN_FD_INT_STAT_TXI_BIT      1
#define CTU_CAN_FD_INT_STAT_EWLI_BIT     2
#define CTU_CAN_FD_INT_STAT_DOI_BIT      3
#define CTU_CAN_FD_INT_STAT_FCSI_BIT     4
#define CTU_CAN_FD_INT_STAT_ALI_BIT      5
#define CTU_CAN_FD_INT_STAT_BEI_BIT      6
#define CTU_CAN_FD_INT_STAT_OFI_BIT      7
#define CTU_CAN_FD_INT_STAT_RXFI_BIT     8
#define CTU_CAN_FD_INT_STAT_BSI_BIT      9
#define CTU_CAN_FD_INT_STAT_RBNEI_BIT    10
#define CTU_CAN_FD_INT_STAT_TXBHCI_BIT   11

#define CTU_CAN_FD_BTR_VAL               0x80B3FEF   // 200 * 1 * cycle
#define CTU_CAN_FD_BTR_FD_VAL            0x0808A387  // 500kbit/s
#define CTU_CAN_FD_TRV_DELAY_VAL         0x01000000

#define CTU_CAN_CLK_GATE 0xFF10
#define INLINE 
INLINE void ctucan_enableClk(){
	char *base = (char *) CTU_CAN_FD_BASE;
	volatile uint32_t *reg = (volatile uint32_t *)(base + CTU_CAN_CLK_GATE);
	*reg = 1;

}

INLINE void ctucan_write_32(uint32_t offset, uint32_t data)
{
	char *base = (char *) CTU_CAN_FD_BASE;
	volatile uint32_t *reg = (volatile uint32_t *)(base + offset);
	*reg = data;
}

INLINE void ctucan_write_16(uint32_t offset, uint16_t data)
{
	char *base = (char *) CTU_CAN_FD_BASE;
	volatile uint16_t *reg = (volatile uint16_t *)(base + offset);
	*reg = data;
}

/* read functions */

INLINE uint32_t ctucan_read_32(uint32_t offset)
{
	char *base = (char *) CTU_CAN_FD_BASE;
	volatile uint32_t *reg = (volatile uint32_t *)(base + offset);
	return *reg;
}

INLINE uint16_t ctucan_read_16(uint32_t offset)
{
	char *base = (char *) CTU_CAN_FD_BASE;
	volatile uint16_t *reg = (volatile uint16_t *)(base + offset);
	return *reg;
}

INLINE uint16_t ctucan_read_8(uint32_t offset)
{
	char *base = (char *) CTU_CAN_FD_BASE;
	volatile uint8_t *reg = (volatile uint8_t *)(base + offset);
	return *reg;
}

/* bit access */

INLINE void ctucan_set_bit_32(uint32_t offset, uint32_t bit, uint32_t val)
{
	uint32_t reg_val = ctucan_read_32(offset);
	reg_val = (reg_val & ~BIT(bit)) | ((!!val) << bit);
	ctucan_write_32(offset, reg_val);
}

INLINE void ctucan_set_bit_16(uint32_t offset, uint32_t bit, uint32_t val)
{
	uint16_t reg_val = ctucan_read_16(offset);
	reg_val = (reg_val & ~BIT(bit)) | ((!!val) << bit);
	ctucan_write_16(offset, reg_val);
}

INLINE uint32_t ctucan_get_bit_32(uint32_t offset, int bit)
{
	uint32_t reg_value = ctucan_read_32(offset);
	return !!(reg_value & BIT(bit));
}

INLINE uint32_t ctucan_get_bit_16(uint32_t offset, int bit)
{
	uint16_t reg_value = ctucan_read_16(offset);
	return !!(reg_value & BIT(bit));
}

INLINE uint32_t ctucan_get_bit_8(uint32_t offset, int bit)
{
	uint8_t reg_value = ctucan_read_8(offset);
	return !!(reg_value & BIT(bit));
}

void ctucan_reset()
{
	ctucan_set_bit_16(CTU_CAN_FD_MODE_OFFSET, CTU_CAN_FD_MODE_RST_BIT, 1);
}

void ctucan_configure()
{
	ctucan_write_32(CTU_CAN_FD_BTR_OFFSET, CTU_CAN_FD_BTR_VAL);
	ctucan_write_32(CTU_CAN_FD_BTR_FD_OFFSET, CTU_CAN_FD_BTR_FD_VAL);
	ctucan_write_32(CTU_CAN_FD_TRV_DELAY_OFFSET, CTU_CAN_FD_TRV_DELAY_VAL);
}

void ctucan_interrupt_enable(int irq_bit)
{
	ctucan_set_bit_16(CTU_CAN_FD_INT_ENA_SET_OFFSET, irq_bit, 1);
}

void ctucan_interrupt_unmask(int irq_bit)
{
	ctucan_set_bit_16(CTU_CAN_FD_INT_MASK_CLR_OFFSET, irq_bit, 1);
}

void ctucan_interrupt_clean(int irq_bit)
{
	ctucan_set_bit_16(CTU_CAN_FD_INT_ENA_CLR_OFFSET, irq_bit, 1);
}

void ctucan_interrupts_mask_all()
{
	uint16_t reg_val = ctucan_read_16(CTU_CAN_FD_INT_MASK_SET_OFFSET);
	uint16_t mask = 0x0FFF;
	reg_val = (reg_val & ~mask) | mask;
	ctucan_write_16(CTU_CAN_FD_INT_MASK_SET_OFFSET, reg_val);
}

void ctucan_configure_interrupts()
{
	ctucan_interrupts_mask_all();

	ctucan_interrupt_enable(CTU_CAN_FD_INT_STAT_RXI_BIT);
	ctucan_interrupt_enable(CTU_CAN_FD_INT_STAT_TXI_BIT);
	ctucan_interrupt_unmask(CTU_CAN_FD_INT_STAT_RXI_BIT);
	ctucan_interrupt_unmask(CTU_CAN_FD_INT_STAT_TXI_BIT);
}

void ctucan_enable_selfack()
{
	ctucan_set_bit_16(CTU_CAN_FD_MODE_OFFSET, CTU_CAN_FD_MODE_STM_BIT, 1);
}

void ctucan_enable_fd()
{
	ctucan_set_bit_16(CTU_CAN_FD_MODE_OFFSET, CTU_CAN_FD_MODE_FDE_BIT, 1);
}

void ctucan_enable_loop()
{
	ctucan_set_bit_16(CTU_CAN_FD_SETTINGS_OFFSET, CTU_CAN_FD_SETTINGS_ILBP_BIT, 1);
}

int ctucan_disable()
{
	ctucan_set_bit_16(CTU_CAN_FD_SETTINGS_OFFSET, CTU_CAN_FD_STATUS_ENA_BIT, 0);
	return (ctucan_get_bit_16(CTU_CAN_FD_SETTINGS_OFFSET, CTU_CAN_FD_STATUS_ENA_BIT) == 0) ? 0 : -1;
}

int ctucan_enable()
{
	ctucan_set_bit_16(CTU_CAN_FD_SETTINGS_OFFSET, CTU_CAN_FD_STATUS_ENA_BIT, 1);
	return (ctucan_get_bit_16(CTU_CAN_FD_SETTINGS_OFFSET, CTU_CAN_FD_STATUS_ENA_BIT) == 1) ? 0 : -1;
}

int ctucan_is_rx_empty()
{
	return ctucan_get_bit_16(CTU_CAN_FD_RX_STATUS_OFFSET, CTU_CAN_FD_RX_STATUS_RXE_BIT) == 1;
}

int ctucan_tx_status()
{
	return ctucan_read_8(CTU_CAN_FD_TX_STATUS_OFFSET) & 0x0F;
}

int ctucan_is_initialized()
{
	return ctucan_get_bit_16(CTU_CAN_FD_FAULT_STATUS_OFFSET, CTU_CAN_FD_FAULT_STATUS_ERA_BIT) == 1;
}

// ///


void ctucan_send_frame(int id, int dlc, char data[], char is_fd)
{
	/* Insert CAN frame to TXT buffer 1 */

	uint32_t frame_format_word = 0;
	frame_format_word |= dlc;                                            // DLC 8
	frame_format_word |= (1 << 7);                                       // CAN 2.0 Frame
	frame_format_word |= (is_fd << 9);                                       // brs
	frame_format_word |= (0 << 5);                                       // RTR (0 = data frame, 1 = remote frame)
	ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET, frame_format_word);  // Store frame format word
	if (dlc > 8){
		switch (dlc){
			case 9: dlc = 12;
			break;
			case 10: dlc = 16;
			break;
			case 11: dlc = 20;
			break;
			case 12: dlc = 24;
			break;
			case 13: dlc = 32;
			break;
			case 14: dlc = 48;
			break;
			case 15: dlc = 64;
			break;
		}

	}
	uint32_t id_word = id << 18;                                         // Identifier
	ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET + 0x4, id_word);      // Store identifier word
	ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET + 0x8, 0);            // TIMESTAMP_L_W
	ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET + 0xC, 0);            // TIMESTAMP_U_W
	for (int i = 0; i < dlc;) {
		int data_tx = 0;
		for (int j = 0; j < 4; j++) {
			if (i >= dlc)
				break;
			data_tx |=  data[i] << (j * 8);
			i++;
		}
		int offset = (i / 4) - 1;
		if (i < 3)
			offset = 0;
		ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET + 0x10 + offset *4, data_tx);
	}

	/* Issue Set ready command */
	uint32_t command = 0;
	command |= 0x2;                                                     // Set Ready command
	command |= (1 << 8);                                                // Choose TXT Buffer 1
	ctucan_write_32(CTU_CAN_FD_TXT_COMMAND_OFFSET, command);             // Issue the command
}


void ctucan_send_frame_ext(int id_base, int id_ext, int dlc, char data[])
{
	/* Insert CAN frame to TXT buffer 1 */

	uint32_t frame_format_word = 0;
	frame_format_word |= dlc;                                            // DLC 8
	frame_format_word |= (0 << 7);                                       // CAN 2.0 Frame
	frame_format_word |= (0 << 5);                                       // RTR (0 = data frame, 1 = remote frame)
	frame_format_word |= (1 << 6);										// Extended ID
	ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET, frame_format_word);  // Store frame format word

	uint32_t id_word = id_base << 18 | (id_ext & 0x3FFFF);				 // Identifier
	ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET + 0x4, id_word);      // Store identifier word
	ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET + 0x8, 0);            // TIMESTAMP_L_W
	ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET + 0xC, 0);            // TIMESTAMP_U_W
	for (int i = 0; i < dlc;) {
		int data_tx = 0;
		for (int j = 0; j < 4; j++) {
			if (i >= dlc)
				break;
			data_tx |=  data[i] << (j * 8);
			i++;
		}
		int offset = (i / 4) - 1;
		if (i < 3)
			offset = 0;
		ctucan_write_32(CTU_CAN_FD_TXT_BUFFER_1_OFFSET + 0x10 + offset *4, data_tx);
	}

	/* Issue Set ready command */
	uint32_t command = 0;
	command |= 0x2;                                                     // Set Ready command
	command |= (1 << 8);                                                // Choose TXT Buffer 1
	ctucan_write_32(CTU_CAN_FD_TXT_COMMAND_OFFSET, command);             // Issue the command
}


void ctucan_change_btr(int btr){
	ctucan_disable();
	ctucan_write_32(CTU_CAN_FD_BTR_OFFSET, btr);
	ctucan_enable();
}

#endif /* CAN_H_ */
