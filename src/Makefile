CC = clang
CFLAGS = -g -Wall

TARGET = cpuintrinsics

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	rm -f $(TARGET)
