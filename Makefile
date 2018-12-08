
LLVM_VER	= 7.0.0
# 6.0.1
LLVM		= llvm-$(LLVM_VER)
LLVM_GZ		= $(LLVM).tar.xz

CWD = $(CURDIR)
GZ	= $(CWD)/gz
SRC	= $(CWD)/src

WGET = wget -c -P $(GZ)

.PHONY: all src build

all:
	LANG=C $(MAKE) src
	rm -rf build/*
	LANG=C $(MAKE) PATH="C:\MinGW\bin;C:\MinGW\CMake\bin" build

build:
	cd build ; cmake $(SRC)/$(LLVM) -G "MinGW Makefiles" 

src: $(SRC)/$(LLVM)/README
$(SRC)/$(LLVM)/README: $(GZ)/$(LLVM_GZ)
	cd $(SRC) ; xzcat $< | tar x
	mv $(SRC)/$(LLVM).src $(SRC)/$(LLVM) 
	touch $@
$(GZ)/$(LLVM_GZ):
	$(WGET) -O $@ http://releases.llvm.org/$(LLVM_VER)/$(LLVM).src.tar.xz

