RM=rm
CAT=cat
SED=sed
BUN=bun
ECHO=echo
NODE=node
PRINTF=printf
CLOSURE=google-closure-compiler

all::

clean:: ; rm -f *~
cleanall:: ; rm -f *~
cleanall:: ; rm -f out/*~
cleanall:: ; rm -f out/*_out.js
cleanall:: ; rm -f out/*_out?.js

XATS2JS=./xatshome/xassets/JS/xats2js
XATS2JS_LIB=$(XATS2JS)/lib2xatsopt2js_ats3_opt1.js
XATS2JS_JSEMIT=$(XATS2JS)/xats2js_jsemit00_ats2_opt1.js

SRCSATS :=
SRCDATS := \
templates.dats \
lsp_bootstrap.dats \
repr30.dats \
dependency20.dats \
dependency20_decl.dats \
dependency20_dexp.dats \
dependency30.dats \
dependency30_decl.dats \
dependency30_dexp.dats \
diagnostic10.dats \
diagnostic20.dats \
diagnostic20_decl.dats \
diagnostic20_dexp.dats \
diagnostic30.dats \
diagnostic30_decl.dats \
diagnostic30_dexp.dats \
server.dats

OUTSATS := \
$(patsubst %.sats, out/%_sats_out.js, $(SRCSATS))
OUT0DATS := \
$(patsubst %.dats, out/%_dats_out0.js, $(SRCDATS))
OUT1DATS := \
$(patsubst %.dats, out/%_dats_out1.js, $(SRCDATS))
OUT2DATS := \
$(patsubst %.dats, out/%_dats_out2.js, $(SRCDATS))

all:: all_sats
all_sats:: $(OUTSATS)

all:: all_dats
all_dats:: $(OUTDATS)

# Renaming HACK
N001="X"
N002=$(N001) $(N001)
N004=$(N002) $(N002)
N008=$(N004) $(N004)
N016=$(N008) $(N008)
N032=$(N016) $(N016)
N064=$(N032) $(N032)
N128=$(N064) $(N064)
N256=$(N128) $(N128)
N512=$(N256) $(N256)
NFILE=$(N064) $(N032) $(N004) # 100=064+032+004

out/%_dats_out0.js: src/DATS/%.dats; \
$(NODE) --stack-size=8192 $(XATS2JS_JSEMIT) $< > $@
out/%_dats_out1.js: out/%_dats_out0.js; \
$(eval NFILE=$(NFILE) X) \
$(SED) -e 's/jsxtnm/jsx$(words $(NFILE))tnm/g' $< > $@

out/ats_lsp_out0.js: $(OUT1DATS); \
$(PRINTF) "// %s\n" "`date`" > $@ && \
$(CAT) $(XATS2JS_LIB) >> $@ && \
$(CAT) src/CATS/lsp_bootstrap.js >> $@ && \
$(CAT) $(OUT1DATS) >> $@

all:: out/ats_lsp_out1.js
out/ats_lsp_out1.js: out/ats_lsp_out0.js; \
$(CLOSURE) -W QUIET -O SIMPLE --js $< --js_output_file $@ && \
$(RM) $<