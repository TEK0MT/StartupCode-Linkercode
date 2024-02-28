.PHONY: all clean
cc:= arm-none-eabi-
all:= Mohamed_Tarek.elf
%.o:%.c
	$(cc)gcc -c -mcpu=cortex-m4 -std=gnu11 -mthumb $< -o $@
StartupCode.o:StartupCode.c
	$(cc)gcc -c -mcpu=cortex-m4 -std=gnu11 -mthumb $< -o $@
Mohamed_Tarek.elf: GPIO_Prog.o RCC_Prog.o SysTick_Prog.o StartupCode.o
	$(cc)ld -T LinkerScript.ld -nostdlib -w1 -MAP=excutable.map $< -o $@
Progamm:
	openocd -f board/st_nucleo_f4.cfg
clean:
	rm -f *.o *.elf