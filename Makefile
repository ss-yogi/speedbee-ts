# Makefile
# SPeeDBee
INCLUDE=-I/usr/local/include/speedbee
LDFLAGS=-L/usr/local/lib

CFLAGS=-O2 -Wall $(INCLUDE) $(HEADER) 

SPBEE_LIBS=-lspeedbee
SYS_LIBS=-pthread -ldl -lm

SAMPLE=./samples
HEADER=-I$(SAMPLE)/src_h
TARGET=$(SAMPLE)/src/sample1 $(SAMPLE)/src/sample2 $(SAMPLE)/src/sample3 $(SAMPLE)/src/sample4 $(SAMPLE)/src/sample5 \
$(SAMPLE)/src/sample6 $(SAMPLE)/src/sample7 $(SAMPLE)/src/sample8 $(SAMPLE)/src/sample9 $(SAMPLE)/src/sample10 \
$(SAMPLE)/src/sample11 $(SAMPLE)/src/sample12 $(SAMPLE)/src/sample13 $(SAMPLE)/src/sample14 $(SAMPLE)/src/sample15 \
$(SAMPLE)/src/SampleCpuMonitoring

all: $(TARGET)

.c:
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(SPBEE_LIBS) $(SYS_LIBS)

clean:
	rm -f *.exe *.obj *.log *.o $(TARGET) *.dat *.trn *.map *.wal


# Following lines are for installing libspeedbee files into system.

VER=v621
PLATFORM=linux-x86_64

speedbee-ts-trial-$(VER)-$(PLATFORM).tar.gz:
	wget https://github.com/saltyster/speedbee-ts/releases/download/$(VER)/speedbee-ts-trial-$(VER)-$(PLATFORM).tar.gz

get-libspeedbee: speedbee-ts-trial-$(VER)-$(PLATFORM).tar.gz

install-libspeedbee: get-libspeedbee
	tar xzvf speedbee-ts-trial-$(VER)-$(PLATFORM).tar.gz -C /usr/local
	ldconfig

