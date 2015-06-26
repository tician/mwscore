#~~~~~~~~~~~~~~~~~~~~ Output File Name ~~~~~~~~~~~~~~~~~~~~
PROJECT_NAME = yetis_itb_v0

#~~~~~~~~~~~~~~~~~~~~ Source Files ~~~~~~~~~~~~~~~~~~~~
SRCS = \
	yetis_itb_v0.cpp \
	usiTwiSlave.c

#~~~~~~~~~~~~~~~~~~~~ Object Files ~~~~~~~~~~~~~~~~~~~~
BINDIR = bin
OBJDIR = obj

TARGET = $(BINDIR)/$(PROJECT_NAME)

CSRCS = $(filter %.c,$(SRCS))
CPPSRCS = $(filter %.cpp,$(SRCS))
RAWOBJS = $(CSRCS:.c=.c.o) $(CPPSRCS:.cpp=.cpp.o)
TARGET_OBJS = $(addprefix $(OBJDIR)/,$(RAWOBJS))

#~~~~~~~~~~~~~~~~~~~~ Include Directories ~~~~~~~~~~~~~~~~~~~~
INCLUDE_DIRS = -I. -I../yetis

#~~~~~~~~~~~~~~~~~~~~ Library Directories ~~~~~~~~~~~~~~~~~~~~
LIBRARY_DIRS = -L. 

#~~~~~~~~~~~~~~~~~~~~ User Libraries ~~~~~~~~~~~~~~~~~~~~
USER_LIBS = 
#USER_LIBS = -lzigbee -lserial -ldynamixel

#~~~~~~~~~~~~~~~~~~~~ MCU name ~~~~~~~~~~~~~~~~~~~~
#MCU = atmega168
#MCU = attiny13
#MCU = t13
#MCU = atmega2561
#MCU = t85
MCU = attiny85

#~~~~~~~~~~~~~~~~~~~~ Processor frequency ~~~~~~~~~~~~~~~~~~~~
#     This will define a symbol, F_CPU, in all source code files equal to the 
#     processor frequency. You can then use this symbol in your source code to 
#     calculate timings. Do NOT tack on a 'UL' at the end, this will be done
#     automatically to create a 32-bit value in your source code.
#     Typical values are:
#         F_CPU =  1000000
#         F_CPU =  1843200
#         F_CPU =  2000000
#         F_CPU =  3686400
#         F_CPU =  4000000
#         F_CPU =  7372800
         F_CPU =  8000000
#         F_CPU = 11059200
#         F_CPU = 14745600
#F_CPU = 16000000
#         F_CPU = 18432000
#         F_CPU = 20000000
#F_CPU = 9600000
#F_CPU = 1200000

#~~~~~~~~~~~~~~~~~~~~ Optimization level ~~~~~~~~~~~~~~~~~~~~
#    Can be [0, 1, 2, 3, s]. 
#    0 = turn off optimization. s = optimize for size.
#    (Note: 3 is not always the best optimization level. See avr-libc FAQ.)
#OPT = s
OPT = 2

#~~~~~~~~~~~~~~~~~~~~ C Standard level ~~~~~~~~~~~~~~~~~~~~
#     c89   = "ANSI" C
#     gnu89 = c89 plus GCC extensions
#     c99   = ISO C99 standard (not yet fully implemented)
#     gnu99 = c99 plus GCC extensions
CSTANDARD = -std=gnu99
CDEFS = -DF_CPU=$(F_CPU)UL
CPPDEFS = -DF_CPU=$(F_CPU)UL
ADEFS = -DF_CPU=$(F_CPU)

#~~~~~~~~~~~~~~~~~~~~ Compiler Options C ~~~~~~~~~~~~~~~~~~~~
#  -g*:          generate debugging information
#  -O*:          optimization level
#  -f...:        tuning, see GCC manual and avr-libc documentation
#  -Wall...:     warning level
#  -Wa,...:      tell GCC to pass this to the assembler.
#    -adhlns...: create assembler listing
CFLAGS = -mmcu=$(MCU) -I. 
#CFLAGS += -g$(DEBUG)
CFLAGS += $(CDEFS)
CFLAGS += -O$(OPT)
CFLAGS += -funsigned-char
CFLAGS += -funsigned-bitfields
CFLAGS += -fpack-struct
CFLAGS += -fshort-enums
CFLAGS += -Wall
CFLAGS += -Wstrict-prototypes
#CFLAGS += -mshort-calls
#CFLAGS += -fno-unit-at-a-time
#CFLAGS += -Wundef
#CFLAGS += -Wunreachable-code
#CFLAGS += -Wsign-compare
CFLAGS += -Wa,-adhlns=$(<:%.c=%.lst)
#CFLAGS += $(patsubst %,-I%,$(INCLUDE_DIRS))
CFLAGS += $(CSTANDARD)

#~~~~~~~~~~~~~~~~~~~~ Compiler Options C++ ~~~~~~~~~~~~~~~~~~~~
CXXFLAGS = -mmcu=$(MCU) -I. -x c++ 
#CXXFLAGS += -g$(DEBUG)
CXXFLAGS += $(CPPDEFS)
CXXFLAGS += -O$(OPT)
CXXFLAGS += -funsigned-char
CXXFLAGS += -funsigned-bitfields
CXXFLAGS += -fpack-struct
CXXFLAGS += -fshort-enums
CXXFLAGS += -fno-exceptions
CXXFLAGS += -Wall
CXXFLAGS += -Wundef
#CXXFLAGS += -mshort-calls
#CXXFLAGS += -fno-unit-at-a-time
#CXXFLAGS += -Wstrict-prototypes
#CXXFLAGS += -Wunreachable-code
#CXXFLAGS += -Wsign-compare
CXXFLAGS += -Wa,-adhlns=$(<:%.cpp=%.lst)
#CXXFLAGS += $(patsubst %,-I%,$(INCLUDE_DIRS))
#CXXFLAGS += $(CSTANDARD)

#~~~~~~~~~~~~~~~~~~~~ Compiler Options Assembly ~~~~~~~~~~~~~~~~~~~~
ASFLAGS = -mmcu=$(MCU) -I. -x assembler-with-cpp
ASFLAGS += $(ADEFS) -Wa,-adhlns=$(<:%.S=%.lst),-gstabs,--listing-cont-lines=100

#---------------- Library Options ----------------
# Minimalistic printf version
PRINTF_LIB_MIN = -Wl,-u,vfprintf -lprintf_min

# Floating point printf version (requires MATH_LIB = -lm below)
PRINTF_LIB_FLOAT = -Wl,-u,vfprintf -lprintf_flt

# If this is left blank, then it will use the Standard printf version.
PRINTF_LIB = 
#PRINTF_LIB = $(PRINTF_LIB_MIN)
#PRINTF_LIB = $(PRINTF_LIB_FLOAT)

# Minimalistic scanf version
SCANF_LIB_MIN = -Wl,-u,vfscanf -lscanf_min

# Floating point + %[ scanf version (requires MATH_LIB = -lm below)
SCANF_LIB_FLOAT = -Wl,-u,vfscanf -lscanf_flt

# If this is left blank, then it will use the Standard scanf version.
SCANF_LIB = 
#SCANF_LIB = $(SCANF_LIB_MIN)
#SCANF_LIB = $(SCANF_LIB_FLOAT)

MATH_LIB = -lm

#---------------- External Memory Options ----------------

# 64 KB of external RAM, starting after internal RAM (ATmega128!),
# used for variables (.data/.bss) and heap (malloc()).
#EXTMEMOPTS = -Wl,-Tdata=0x801100,--defsym=__heap_end=0x80ffff

# 64 KB of external RAM, starting after internal RAM (ATmega128!),
# only used for heap (malloc()).
#EXTMEMOPTS = -Wl,--section-start,.data=0x801100,--defsym=__heap_end=0x80ffff

EXTMEMOPTS =

#---------------- Linker Options ----------------
#  -Wl,...:     tell GCC to pass this to linker.
#    -Map:      create map file
#    --cref:    add cross reference to  map file
LDFLAGS = -Wl,-Map=$@.map,--cref
LDFLAGS += $(EXTMEMOPTS)
#LDFLAGS += $(patsubst %,-L%,$(LIBRARY_DIRS))
LDFLAGS += $(PRINTF_LIB) $(SCANF_LIB) $(MATH_LIB) $(USER_LIBS)
#LDFLAGS += -Wl,--section-start=.bootloader=0x1C00
#LDFLAGS += -Wl,--section-start=.bootsupport=0x1D00
#LDFLAGS += -Wl,--section-start=.text=0x1C00
#LDFLAGS += -T linker_script.x

# Compiler flags to generate dependency files.
GENDEPFLAGS = -MMD -MP -MF .dep/$(@F).d

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TCHAIN_PREFIX=avr-

CC = $(TCHAIN_PREFIX)gcc
CFLAGS += $(GENDEPFLAGS) $(INCLUDE_DIRS) 

CXX = $(TCHAIN_PREFIX)g++
CXXFLAGS += $(GENDEPFLAGS) $(INCLUDE_DIRS) 

AS = $(TCHAIN_PREFIX)gcc
ASFLAGS += $(GENDEPFLAGS)

LD = $(TCHAIN_PREFIX)gcc
LDFLAGS += $(INCLUDE_DIRS) $(LIBRARY_DIRS) 

OBJCP = $(TCHAIN_PREFIX)objcopy

OBJDUMP = $(TCHAIN_PREFIX)objdump

AR = $(TCHAIN_PREFIX)ar
ARFLAGS = rcs
#ARFLAGS = cr

NM =  $(TCHAIN_PREFIX)nm

SHELL = sh
WINSHELL = cmd
SIZE = $(TCHAIN_PREFIX)size
REMOVE = rm -f
REMOVEDIR = rm -rf
COPY = cp


MSG_ERRORS_NONE = Errors: none
MSG_BEGIN = -------- begin --------
MSG_END = --------  end  --------
MSG_BUILD_DIRS = Checking build directories exist:
MSG_SIZE_BEFORE = Size before: 
MSG_SIZE_AFTER = Size after:
MSG_FLASH = Creating load file for Flash:
MSG_EEPROM = Creating load file for EEPROM:
MSG_EXTENDED_LISTING = Creating Extended Listing:
MSG_SYMBOL_TABLE = Creating Symbol Table:
MSG_LINKING = Linking:
MSG_COMPILING = Compiling C:
MSG_COMPILING_CPP = Compiling C++:
MSG_ASSEMBLING = Assembling:
MSG_CLEANING = Cleaning project:
MSG_CREATING_LIBRARY = Creating library:


#~~~~~~~~~~~~~~~~~~~~ Linked Files ~~~~~~~~~~~~~~~~~~~~
TARGET_ELF = $(TARGET).elf
TARGET_HEX = $(TARGET).hex
TARGET_EEP = $(TARGET).eep
TARGET_LSS = $(TARGET).lss
TARGET_SYM = $(TARGET).sym


#~~~~~~~~~~~~~~~~~~~~ all ~~~~~~~~~~~~~~~~~~~~
all: begin gccversion spotcheck sizebefore build sizeafter end

#~~~~~~~~~~~~~~~~~~~~ build ~~~~~~~~~~~~~~~~~~~~
spotcheck:
	@echo $(MSG_BUILD_DIRS)
	test -d $(BINDIR) || mkdir -p $(BINDIR)
	test -d $(OBJDIR) || mkdir -p $(OBJDIR)
	@echo

#build: $(TARGET)

#$(TARGET): $(OBJS)
#	$(CXX) -o $@ $(OBJS) $(LDFLAGS)

#~~~~~~~~~~~~~~~~~~~~ build ~~~~~~~~~~~~~~~~~~~~
build: \
	$(TARGET_ELF) \
	$(TARGET_HEX) \
	$(TARGET_EEP) \
	$(TARGET_LSS) \
	$(TARGET_SYM)

#~~~~~~~~~~~~~~~~~~~~ Eye candy ~~~~~~~~~~~~~~~~~~~~
begin:
	@echo
	@echo $(MSG_BEGIN)

end:
	@echo $(MSG_END)
	@echo

sizebefore:
	@if test -f $(TARGET_ELF); then echo; \
	echo $(MSG_SIZE_BEFORE);                \
	$(SIZE) $(TARGET_ELF);                \
	$(SIZE) --target=ihex $(TARGET_HEX);  \
	2>/dev/null; echo; fi

sizeafter:
	@if test -f $(TARGET_ELF); then echo; \
	echo $(MSG_SIZE_AFTER);                 \
	$(SIZE) $(TARGET_ELF);                \
	$(SIZE) --target=ihex $(TARGET_HEX);  \
	2>/dev/null; echo; fi

gccversion : 
	@$(CC) --version

#~~~~~~~~~~~~~~~~~~~~ Creating Output Files ~~~~~~~~~~~~~~~~~~~~
# Create final output files (.hex, .eep) from ELF output file.
%.hex: %.elf
	@echo
	@echo $(MSG_FLASH) $@
	$(OBJCP) -O ihex -R .eeprom -R .fuse -R .lock $< $@

%.eep: %.elf
	@echo
	@echo $(MSG_EEPROM) $@
	-$(OBJCP) -j .eeprom --set-section-flags=.eeprom="alloc,load" \
	--change-section-lma .eeprom=0 --no-change-warnings \
	-O ihex $< $@ || exit 0

# Create extended listing file from ELF output file.
%.lss: %.elf
	@echo
	@echo $(MSG_EXTENDED_LISTING) $@
	$(OBJDUMP) -h -S -z $< > $@

# Create a symbol table from ELF output file.
%.sym: %.elf
	@echo
	@echo $(MSG_SYMBOL_TABLE) $@
	$(NM) -n $< > $@

#~~~~~~~~~~~~~~~~~~~~ Linking ~~~~~~~~~~~~~~~~~~~~
# Link: create ELF output file from object files.
.SECONDARY : $(TARGET_ELF)
.PRECIOUS : $(TARGET_OBJS)
%.elf: $(TARGET_OBJS)
	@echo
	@echo $(MSG_LINKING) $@
	$(LD) $(CFLAGS) $^ --output $@ $(LDFLAGS)

#~~~~~~~~~~~~~~~~~~~~ Compiling ~~~~~~~~~~~~~~~~~~~~
# Compile: create object files from C source files.
%.c.o: $(CSRCS)
	@echo
	@echo $(MSG_COMPILING) $<
	$(CC) $(CFLAGS) -c $< -o $@ 

# Compile: create object files from C++ source files.
%.cpp.o: $(CPPSRCS)
	@echo
	@echo $(MSG_COMPILING_CPP) $<
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile: create assembler files from C source files.
#%.s : %.c
#	$(CC) -S $(CFLAGS) $< -o $@

# Compile: create assembler files from C++ source files.
#%.s : %.cpp
#	$(CXX) -S $(CXXFLAGS) $< -o $@

# Assemble: create object files from assembler source files.
#%.o : %.S
#	@echo
#	@echo $(MSG_ASSEMBLING) $<
#	$(AS) -c $(ASFLAGS) $< -o $@

# Create preprocessed source for use in sending a bug report.
#%.i : %.c
#	$(CC) -E -mmcu=$(MCU) -I. $(CFLAGS) $< -o $@ 


# Include the dependency files.
-include $(shell mkdir .dep 2>/dev/null) $(wildcard .dep/*)

#~~~~~~~~~~~~~~~~~~~~ clean ~~~~~~~~~~~~~~~~~~~~
clean: begin clean_list end

clean_list :
	@echo
	@echo $(MSG_CLEANING)
#	$(REMOVE) $(TARGET_HEX)
#	$(REMOVE) $(TARGET_ELF)
#	$(REMOVE) $(TARGET_ELF).map
#	$(REMOVE) $(TARGET_LSS)
#	$(REMOVE) $(TARGET_EEP)
#	$(REMOVE) $(TARGET_SYM)
#	$(REMOVEDIR) .dep
#	$(REMOVE) $(TARGET_OBJS)
#	$(REMOVE) $(TARGET_OBJS:%.o=%.lst)
	rm -f $(OBJS)
	rm -f $(TARGET)
	rm -rf $(OBJDIR)
	rm -rf $(BINDIR)

#~~~~~~~~~~~~~~~~~~~~ backup ~~~~~~~~~~~~~~~~~~~~
backup: clean
	tar cJvf ../$(TARGET)_`date +"%Y-%m-%d_%H%M"`.tar.xz *
