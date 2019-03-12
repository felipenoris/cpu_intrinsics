CC = clang
CFLAGS = -g -Wall
FEATURE_FLAGS = -mrdrnd

TARGET = cpuintrinsics

all: $(TARGET) llvm

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) $(FEATURE_FLAGS) -o $(TARGET) $(TARGET).c

llvm:
	$(CC) -S -emit-llvm $(FEATURE_FLAGS) $(TARGET).c

clean:
	rm -f $(TARGET) $(TARGET).ll
