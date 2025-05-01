CAT=cat
BUN=bun
ECHO=echo
NODE=node
PRINTF=printf

all:: ats_lsp

clean:: ; rm -f *~
cleanall:: ; rm -f *~
cleanall:: ; rm -f out/*~
cleanall:: ; rm -f out/*_out.js
cleanall:: ; rm -f out/*_out?.js

XATSHOME=./vendor

XATS2JSD=$(XATSHOME)/xassets/JS/xats2js
XATS2JS_JSEMIT01=\
$(XATSHOME)/xassets/JS/xats2js/xats2js_jsemit01_dats_opt1.js


ats_lsp:: ; \
$(PRINTF) "// %s\n" "`date`" > out/$@_out.js
ats_lsp:: ; \
$(CAT) $(XATS2JSD)/runtime/xats2js_js1emit.js >> out/$@_out.js
ats_lsp:: ; \
$(CAT) $(XATS2JSD)/runtime/xats2js_prelude.js >> out/$@_out.js
ats_lsp:: ; \
$(CAT) ./lsp_bootstrap.js >> out/$@_out.js
ats_lsp:: src/DATS/main.dats; \
$(NODE) --stack-size=8192 $(XATS2JS_JSEMIT01) $< >> out/$@_out.js