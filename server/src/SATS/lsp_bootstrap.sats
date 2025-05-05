#include "./../HATS/libxatsopt.hats"

#abstype url <= p0tr
#extern fun url_to_path(url) : string

#abstype severity <= p0tr
fun severity_error$make() : severity
fun severity_warn$make()  : severity 
fun severity_hint$make()  : severity 
fun severity_info$make()  : severity 

#abstype position <= p0tr
fun position_make(
  line: int,
  offs: int
) : position

#abstype range <= p0tr
fun range_make(
  pbeg: position,
  pend: position
) : range

fun range_of_loctn(loctn) : range

#abstype diagnostic <= p0tr
fun diagnostic_make(
  severity: severity,
  location: range, 
  message: string,
  source: string
) : diagnostic

#abstype diagnostics <= p0tr
fun diagnostics_push(
  ds: diagnostics, 
  d: diagnostic
) : void
#symload push with diagnostics_push

#abstype regex <= p0tr
fun regex_make(pat: string) : regex
fun regex_test(re: regex, input: string): bool

// FIXME: 
// The ats compiler library does not provide an api to prune cached staload files. 
// We will use JS to prune caches directly.
fun topmap_reset{syn:tx}(topmap(syn), stamp): void

#typedef text_validator_t = (diagnostics, url) -> void
#typedef cache_pruner_t = url -> void
fun initialize(text_validator_t, cache_pruner_t) : void