CAT=cat
SED=sed
BUN=bun
ECHO=echo
NODE=node
PRINTF=printf

all::

clean:: ; rm -f *~
cleanall:: ; rm -f *~
cleanall:: ; rm -f out/*~
cleanall:: ; rm -f out/*_out.js
cleanall:: ; rm -f out/*_out?.js

XATSHOME=./vendor
XATS2JS=$(XATSHOME)/xassets/JS/xats2js
XATS2JS_LIB=$(XATS2JS)/lib1xatsopt2js_ats2_opt1.js
XATS2JS_JSEMIT=$(XATS2JS)/xats2js_jsemit01_ats2_opt1.js
XATS2JS_RUNTIME=$(XATS2JS)/runtime/xats2js_js1emit.js

SRCSATS :=
SRCDATS := \
main.dats

OUTSATS := \
$(patsubst %.sats, out/%_sats_out.js, $(SRCSATS))
OUT0DATS := \
$(patsubst %.dats, out/%_dats_out0.js, $(SRCDATS))
OUT1DATS := \
$(patsubst %.dats, out/%_dats_out1.js, $(SRCDATS))

all:: all_sats
all_sats:: $(OUTSATS)

all:: all_dats
all_dats:: $(OUTDATS)

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

all:: ats_lsp
ats_lsp: $(OUT1DATS); \
$(PRINTF) "// %s\n" "`date`" > out/$@_out.js && \
$(CAT) $(XATS2JS_RUNTIME) >> out/$@_out.js && \
$(CAT) $(XATS2JS_LIB) >> out/$@_out.js && \
$(CAT) lsp_bootstrap.js >> out/$@_out.js && \
$(CAT) $(OUT1DATS) >> out/$@_out.js