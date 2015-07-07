CC= gcc
CFLAGS=  -O2 -Wall
#CFLAGS=  -g -Wall
#
#choose which moon method dyou you use
MOBJ=domoon.o gplan.o
#MOBJ=cmoon.o gplan2.o
#
OBJS = $(MOBJ) altaz.o angles.o annuab.o constel.o deflec.o deltat.o diurab.o \
diurpx.o dms.o epsiln.o fk4fk5.o kepler.o kfiles.o lightt.o lonlat.o \
nutate.o precess.o refrac.o rplanet.o rstar.o sidrlt.o sun.o \
trnsit.o vearth.o zatan2.o \
mer404.o ven404.o ear404.o mar404.o jup404.o \
sat404.o ura404.o nep404.o plu404.o mlr404.o mlat404.o

INCS = kep.h plantbl.h

TARGETS=aa conjunct moonrise
# deltat
TSRC=$(addsuffix .c,$(TARGETS))
TOBJ=$(addsuffix .o,$(TARGETS))

.PHONY: all clean

all: $(TOBJ) $(TARGETS)

clean: 
	@-rm $(OBJS) $(TOBJ) $(TARGETS)

SUFFIXES: .o .c
.c.o: 
	$(CC) $(CFLAGS) -c $<

$(TOBJ): %.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGETS): $(OBJS) $(INCS)
	$(CC) -o $@  $(addsuffix .o,$@) $^ -lm

