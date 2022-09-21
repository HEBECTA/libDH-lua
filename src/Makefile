LIB:=gen_dh_lua.so
CFLAGS:=-Wall -fPIC -shared
LDFLAGS:=-llua -lcrypto
SRC:=$(wildcard *.c)
OBJS:=$(SRC:.c=.o)

.PHONE: all clean

all: $(LIB)

$(LIB): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<
	
clean:
	$(RM) $(LIB)
