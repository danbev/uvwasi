_HEADERS=uvwasi.h fd_table.h uv_mapping.h wasi_types.h
_OBJ=uvwasi.o fd_table.o uv_mapping.o
IDIR=./include
SDIR=./src
OUTDIR=./out
CC=gcc
CFLAGS=-Wall -Wsign-compare -I$(IDIR)
HEADERS=$(patsubst %,$(IDIR)/%,$(_HEADERS))
LIBS=-luv
ODIR=$(OUTDIR)/obj
OBJ=$(patsubst %,$(ODIR)/%,$(_OBJ))
MKDIRP = mkdir -p

$(ODIR)/%.o: $(SDIR)/%.c $(HEADERS)
	$(CC) -c -o $@ $< $(CFLAGS)

app: $(OBJ) app.c
	$(CC) -o $(OUTDIR)/$@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -rf $(OUTDIR)

$(shell $(MKDIRP) $(ODIR))
