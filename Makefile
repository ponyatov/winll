
WGET = wget -P gz

all:
	LANG=C $(MAKE) src

src:
	$(WGET) http://releases.llvm.org/6.0.1/llvm-6.0.1.src.tar.xz

