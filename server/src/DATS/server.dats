#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

// ----------------------------------------------------

#staload "./../SATS/templates.sats"
#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/dependency30.sats"
#staload "./../SATS/diagnostic10.sats"
#staload "./../SATS/diagnostic20.sats"
#staload "./../SATS/diagnostic30.sats"
#staload "./../SATS/server.sats"

// ----------------------------------------------------

#staload "./../DATS/templates.dats"
#staload "./../DATS/lsp_bootstrap.dats"

#staload "./../DATS/dependency20.dats"
#staload "./../DATS/dependency20_decl.dats"
#staload "./../DATS/dependency20_dexp.dats"

#staload "./../DATS/dependency30.dats"
#staload "./../DATS/dependency30_decl.dats"
#staload "./../DATS/dependency30_dexp.dats"

#staload "./../DATS/diagnostic10.dats"
#staload "./../DATS/diagnostic20.dats"
#staload "./../DATS/diagnostic20_decl.dats"

#staload "./../DATS/diagnostic20_dexp.dats"
#staload "./../DATS/diagnostic30.dats"
#staload "./../DATS/diagnostic30_decl.dats"
#staload "./../DATS/diagnostic30_dexp.dats"

// ----------------------------------------------------

fun fpath_is_dats(fp: strn): bool = let
    val re = regex_make(".*\\.dats$")
  in regex_test(re, fp)
  end

#implfun text_validator(dp, ds, uri) = let 
    // FIXME:
    val path = url_to_path(uri) 
    val key = path.fpath().fnm2()
  in 
    if fpath_is_dats(path) then let
      val dpar = d3parsed_of_fildats(path)
      val () = dependency30_d3parsed(dp, dpar, key)
      val () = diagnostic30_d3parsed(ds, dpar)
      end
    else let
      val dpar = d3parsed_of_filsats(path)
      val () = dependency30_d3parsed(dp, dpar, key)
      end
  end


// FIXME: 
// The ats compiler library does not provide an api to prune cached staload files. 
// We will use JS to prune caches directly.
// TODO: 
// The pruner should take dependencies into account.
// If file B depends on file A, then modifying A should prune both A and B.
#implfun cache_pruner(dp, uri) = let
    val path = url_to_path(uri)
    val key = path.fpath().fnm2()
    val deps0 = depset_make()
    val () = depset_add(deps0, key)
    fun loop(deps0: depset): void =
      if ~depset_is_empty(deps0) then let
        val key = depset_pop(deps0)
        val () = env_reset(the_d1parenv_pvstmap(), key)
        val () = env_reset(the_d2parenv_pvstmap(), key)
        val () = env_reset(the_d3parenv_pvstmap(), key)
        val deps1 = depgraph_find(dp, key)
        val deps2 = depset_union(deps0, deps1)
        val () = depgraph_delete(dp, key)
      in loop(deps2)
      end
  in loop(deps0)
  end


// initialize the xatsopt environment
val _ = the_fxtyenv_pvsload()
val _ = the_tr12env_pvsl00d()
val () = xatsopt_flag$pvsadd0("--_XATSOPT_")
val () = xatsopt_flag$pvsadd0("--_SRCGEN2_XATSOPT_")

// boostrap the lsp server
val () = initialize(text_validator, cache_pruner)