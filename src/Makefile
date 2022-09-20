LIB:=libdh_lua.so
CFLAGS:=-Wall -fpic -shared
LDFLAGS:=-llua -lcrypto
SRC:=$(wildcard *.c)
OBJS:=$(SRC:.c=.o)

.PHONE: all clean

all: $(LIB)

$(LIB): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<
	
clean:
	$(RM) $(LIB)
