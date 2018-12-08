
LLVM_VER	= 7.0.0
# 6.0.1
LLVM		= llvm-$(LLVM_VER)
LLVM_GZ		= $(LLVM).tar.xz

CWD = $(CURDIR)
GZ	= $(CWD)/gz
SRC	= $(CWD)/src

WGET = wget -c -P $(GZ)

all:
	LANG=C $(MAKE) src
	rm -rf build ; mkdir build ; cd build ; cmake ..

src: $(SRC)/$(LLVM)/README
$(SRC)/$(LLVM)/README: $(GZ)/$(LLVM_GZ)
	cd $(SRC) ; xzcat $< | tar x
	mv $(SRC)/$(LLVM).src $(SRC)/$(LLVM) 
	touch $@
$(GZ)/$(LLVM_GZ):
	$(WGET) -O $@ http://releases.llvm.org/$(LLVM_VER)/$(LLVM).src.tar.xz

