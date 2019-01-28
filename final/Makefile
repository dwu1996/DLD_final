VLOG = ncverilog
SRC = final_test.v	\
	  final.v
VLOGARG = +access+r

TMPFILE =	*.log \
			ncverilog.key \
			INCA_libs \
			novas.conf \
			novas.rc 

DBFILE = final.fsdb *.vcd

BAKFILE = *.bak .*.un~

all :: sim

sim :
	$(VLOG) $(SRC) $(VLOGARG)

clean :
	rm -rf $(DBFILE)
	rm -rf $(TMPFILE)

veryclean :
	rm -rf $(DBFILE)
	rm -rf $(TMPFILE)
	rm -rf $(BAKFILE)
