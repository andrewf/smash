.PHONY: clean

all: stack_none stack_noexecstack stack_sp stack_both badfile call_shellcode

stack_none: stack.c
	sudo gcc -o $@ -fno-stack-protector -z execstack $^
	sudo chmod 4755 $@

# version that prevents executing stack
stack_noexecstack: stack.c
	sudo gcc -o $@ -fno-stack-protector $^
	sudo chmod 4755 $@

# version that has stack protector
stack_sp: stack.c
	sudo gcc -o $@ -z execstack $^
	sudo chmod 4755 $@

# version that has both protections
stack_both: stack.c
	sudo gcc -o $@ $^
	sudo chmod 4755 $@

call_shellcode: call_shellcode.c
	sudo gcc -o $@ -z execstack -fno-stack-protector $^
	sudo chmod 4755 $@

exploit: exploit.c

badfile: exploit
	./exploit

clean:
	rm -f stack_* badfile exploit call_shellcode

