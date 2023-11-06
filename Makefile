include ./make_config.mk

ifndef DISABLE_JEMALLOC
	ifdef JEMALLOC
		PLATFORM_CXXFLAGS += -DROCKSDB_JEMALLOC -DJEMALLOC_NO_DEMANGLE
	endif
	EXEC_LDFLAGS := $(JEMALLOC_LIB) $(EXEC_LDFLAGS) -lpthread
	PLATFORM_CXXFLAGS += $(JEMALLOC_INCLUDE)
endif

ifneq ($(USE_RTTI), 1)
	CXXFLAGS += -fno-rtti
endif

CFLAGS += -Wstrict-prototypes

.PHONY: clean librocksdb

all: compact_files_example

compact_files_example: librocksdb compact_files_example.cc
	$(CXX) $(CXXFLAGS) $@.cc -o$@ ./rocksdb/librocksdb.a -I./rocksdb/include -std=c++17 -g $(PLATFORM_LDFLAGS) $(PLATFORM_CXXFLAGS) $(EXEC_LDFLAGS)

compact_files_example2: librocksdb compact_files_example.cc
	$(CXX) $(CXXFLAGS) $@.cc -o$@ ./rocksdb/librocksdb.a -I./rocksdb/include -O2 -std=c++17 $(PLATFORM_LDFLAGS) $(PLATFORM_CXXFLAGS) $(EXEC_LDFLAGS)


.c.o:
	$(CC) $(CFLAGS) -c $< -o $@ -I./rocksdb/include

clean:
	rm -rf ./compact_files_example 

