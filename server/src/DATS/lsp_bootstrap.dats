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
    ) : diagnostic = $extnam()
  }

#implfun diagnostics_push(ds, d) = 
  vscode_diagnostics_push(ds, d)
  where {
    #extern fun
    vscode_diagnostics_push(
      ds: diagnostics, 
      d: diagnostic
    ) : void = $extnam() 
  }

#symload push with diagnostics_push

#implfun set_validator(f) = 
  vscode_set_validator(f)
  where {
    #extern fun
    vscode_set_validator(
      f: (diagnostics, url) -> void
    ): void = $extnam()
  }

#implfun connect() = 
  vscode_connect()
  where {
    #extern fun vscode_connect() = $extnam()
  }