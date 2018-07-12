CFLAGS=-I \.include -L \.lib -Wunused-command-line-argument

t: libs t.o
	clang $(CFLAGS) t.o -lsb -o t


t.o: t.c
	clang $(CFLAGS) -c t.c -o $@


libs: libsb.a


libsb.a: base
	@cd string_builder && $(MAKE) lib
	@cp string_builder/libsb.a .lib/libsb.a
	@cp string_builder/sb.h .include/sb.h

base: .lib .include

.lib:
	@mkdir -p .lib

.include:
	@mkdir -p .include

test: base
	@cd string_builder && $(MAKE) test
	@$(MAKE) clean


clean:
	@cd string_builder && $(MAKE) clean
	@rm -rf .lib
	@rm -rf .include
	@rm -f *.o
	@rm -f t
