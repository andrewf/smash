.PHONY: clean

all: stack_none stack_noexecstack stack_sp stack_both badfile call_shellcode

stack_none: stack.c
	gcc -o $@ -fno-stack-protector -z execstack $^

# version that prevents executing stack
stack_noexecstack: stack.c
	gcc -o $@ -fno-stack-protector $^

# version that has stack protector
stack_sp: stack.c
	gcc -o $@ -z execstack $^

# version that has both protections
stack_both: stack.c
	gcc -o $@ $^

call_shellcode: call_shellcode.c
	gcc -o $@ -z execstack -fno-stack-protector $^

exploit: exploit.c

badfile: exploit
	./exploit
