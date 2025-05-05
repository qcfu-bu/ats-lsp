#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/diagnostic10.sats"
#staload "./../SATS/diagnostic20.sats"
#staload "./../SATS/diagnostic30.sats"
#staload "./../SATS/server.sats"

#staload "./../DATS/lsp_bootstrap.dats"
#staload "./../DATS/diagnostic10.dats"
#staload "./../DATS/diagnostic20.dats"
#staload "./../DATS/diagnostic20_decl.dats"
#staload "./../DATS/diagnostic20_dexp.dats"
#staload "./../DATS/diagnostic30.dats"
#staload "./../DATS/diagnostic30_decl.dats"
#staload "./../DATS/diagnostic30_dexp.dats"

fun fpath_is_dats(fp: strn): bool = let
    val re = regex_make(".*\\.dats$")
  in regex_test(re, fp)
  end

#implfun text_validator(ds, uri) = let 
    val path = url_to_path(uri) 
    val key = fpath_get_fnm2(path.fpath())
  in 
    if fpath_is_dats(path) then let
      val dpar = d3parsed_of_fildats(path)
      // debug logging
      // val () = prerrln(path)
      // val () = prerrln(dpar)
      // val () = fperr30_d3parsed(g_stderr(), dpar)
      val () = diagnostic30_d3parsed(ds, dpar)
      end
    else 
      // TODO:
      ()
  end

// FIXME: 
// The ats compiler library does not provide an api to prune cached staload files. 
// We will use JS to prune caches directly.
// TODO: 
// The pruner should take dependencies into account.
// If file B depends on file A, then modifying A should prune both A and B.
#implfun cache_pruner(uri) = let
    val path = url_to_path(uri)
    val key = path.fpath().fnm2()
    val () = topmap_reset(the_d1parenv_pvstmap(), key.stmp())
    val () = topmap_reset(the_d2parenv_pvstmap(), key.stmp())
    val () = topmap_reset(the_d3parenv_pvstmap(), key.stmp())
  end

// initialize the xatsopt environment
val _ = the_fxtyenv_pvsload()
val _ = the_tr12env_pvsl00d()
val () = xatsopt_flag$pvsadd0("--_XATSOPT_")
val () = xatsopt_flag$pvsadd0("--_SRCGEN2_XATSOPT_")

// boostrap the lsp server
val () = initialize(text_validator, cache_pruner)