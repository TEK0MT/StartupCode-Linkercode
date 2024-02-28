.PHONY: all clean
cc:= arm-none-eabi-
all: Mohamed_Tarek.elf
obj:= main.o StartupCode.o GPIO_Prog.o RCC_Prog.o SysTick_Prog.o 
%.o:%.c
	$(cc)gcc -c -mcpu=cortex-m4 -std=gnu11 -mthumb $< -o $@
Mohamed_Tarek.elf: $(obj)
	$(cc)ld -Map Mohamed_Tarek.map -T LinkerScript.ld $(obj) -o $@
Progamm:
	openocd -f board/st_nucleo_f4.cfg
clean:
	rm -f *.o *.elf
