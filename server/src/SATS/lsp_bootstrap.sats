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

#abstype depset <= p0tr
fun depset_make(): depset
fun depset_add(depset, sym_t): void
fun depset_pop(depset): sym_t
fun depset_is_empty(depset): bool
fun depset_union(depset, depset): depset

#abstype depgraph <= p0tr
fun depgraph_add(depgraph, sym_t, sym_t): void
fun depgraph_delete(depgraph, sym_t): void
fun depgraph_has(depgraph, sym_t): bool
fun depgraph_find(depgraph, sym_t): depset

// FIXME:
// The ats compiler only provides print methods and not to_string methods.
// We will use JS to capture printing and turn them into strings.
fun stderr_capture_start(): void
fun stderr_capture_stop(): void
fun stderr_capture_get(): string

// FIXME: 
// The ats compiler library does not provide an api to prune cached staload files. 
// We will use JS to prune caches directly.
fun env_reset{syn:tx}(topmap(syn), sym_t): void

#typedef text_validator_t = (depgraph, diagnostics, url) -> void
#typedef cache_pruner_t = (depgraph, url) -> void
fun initialize(text_validator_t, cache_pruner_t) : void