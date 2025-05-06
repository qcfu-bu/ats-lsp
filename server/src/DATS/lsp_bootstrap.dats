#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

#implfun url_to_path(uri) = 
  vscode_url_to_path(uri)
  where {
    #extern fun 
    vscode_url_to_path(uri: url) : string = $extnam()
  }

#implfun severity_error$make() = 
  vscode_severity_error$make()
  where {
    #extern fun 
    vscode_severity_error$make() : severity = $extnam()
  }

#implfun severity_warn$make() = 
  vscode_severity_warn$make()
  where {
    #extern fun 
    vscode_severity_warn$make() : severity = $extnam()
  }

#implfun severity_hint$make() = 
  vscode_severity_hint$make()
  where {
    #extern fun 
    vscode_severity_hint$make() : severity = $extnam()
  }

#implfun severity_info$make() =
  vscode_severity_info$make()
  where {
    #extern fun 
    vscode_severity_info$make() : severity = $extnam()
  }

#implfun position_make(line, offs) : position  =
  vscode_position_make(line, offs)
  where {
    #extern fun 
    vscode_position_make(line: int, offs: int): position = $extnam()
  }

#implfun range_make(pbeg, pend): range = 
  vscode_range_make(pbeg, pend)
  where {
    #extern fun
    vscode_range_make(pbeg: position, pend: position): range = $extnam()
  }

#implfun range_of_loctn(loc0) =
  let
    val lsrc0 = loc0.lsrc()
    val pbeg0 = loc0.pbeg()
    val pend0 = loc0.pend()
    val pbeg1 = position_make(pbeg0.nrow(), pbeg0.ncol()) 
    val pend1 = position_make(pend0.nrow(), pend0.ncol()) 
  in range_make(pbeg1, pend1)
  end

#implfun diagnostic_make(severity, location, message, source) : diagnostic = 
  vscode_diagnostic_make(severity, location, message, source)
  where {
    #extern fun
    vscode_diagnostic_make(
      severity: severity,
      location: range, 
      message: string,
      source: string
    ): diagnostic = $extnam()
  }

#implfun diagnostics_push(ds, d) = 
  vscode_diagnostics_push(ds, d)
  where {
    #extern fun
    vscode_diagnostics_push(
      ds: diagnostics, 
      d: diagnostic
    ): void = $extnam() 
  }

#symload push with diagnostics_push

#implfun regex_make(pat) =
  vscode_regex_make(pat)
  where {
    #extern fun
    vscode_regex_make(pat: string): regex = $extnam()
  }

#implfun regex_test(re, input) =
  vscode_regex_test(re, input)
  where {
    #extern fun
    vscode_regex_test(re: regex, input: string): bool = $extnam()
  }

#implfun depset_make() =
  JS_depset_make()
  where {
    #extern fun
    JS_depset_make(): depset = $extnam()
  }

#implfun depset_add(dp, key) =
  JS_depset_add(dp, key)
  where {
    #extern fun
    JS_depset_add(dp: depset, key: sym_t): void = $extnam()
  }

#implfun depset_pop(dp) =
  JS_depset_pop(dp)
  where {
    #extern fun
    JS_depset_pop(dp: depset): sym_t = $extnam()
  }

#implfun depset_is_empty(dp) =
  JS_depset_is_empty(dp)
  where {
    #extern fun
    JS_depset_is_empty(dp: depset): bool = $extnam()
  }

#implfun depset_union(dp1, dp2) =
  JS_depset_union(dp1, dp2)
  where {
    #extern fun
    JS_depset_union(dp1: depset, dp2: depset): depset = $extnam()
  }

#implfun depgraph_add(dp, k, v) =
  JS_depgraph_add(dp, k.stmp(), k, v)
  where {
    #extern fun
    JS_depgraph_add(dp: depgraph, k: stamp, k0: sym_t, v: sym_t): void = $extnam()
  }

#implfun depgraph_delete(dp, k) =
  JS_depgraph_delete(dp, k.stmp())
  where {
    #extern fun
    JS_depgraph_delete(dp: depgraph, k: stamp): void = $extnam()
  }

#implfun depgraph_has(dp, k) =
  JS_depgraph_has(dp, k.stmp())
  where {
    #extern fun
    JS_depgraph_has(dp: depgraph, k: stamp): bool = $extnam()
  }

#implfun depgraph_find(dp, k) =
  JS_depgraph_find(dp, k.stmp())
  where {
    #extern fun
    JS_depgraph_find(dp: depgraph, k: stamp): depset = $extnam()
  }

// FIXME: 
// The ats compiler library does not provide an api to prune cached staload files. 
// We will use JS to prune caches directly.
#implfun env_reset{syn}(env, key) =
  JS_map_reset{syn}(env, key.stmp())
  where {
    #extern fun 
    JS_map_reset{syn:tx}(env: topmap(syn), key: stamp): void = $extnam()
  }

#implfun initialize(f, g) = 
  vscode_initialize(f, g)
  where {
    #extern fun
    vscode_initialize(
      f: text_validator_t,
      g: cache_pruner_t
    ): void = $extnam()
  }