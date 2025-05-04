#abstype url <= p0tr
#extern fun url_to_path(url) : string

#abstype severity <= p0tr
#extern fun severity_error$make() : severity
#extern fun severity_warn$make()  : severity 
#extern fun severity_hint$make()  : severity 
#extern fun severity_info$make()  : severity 

#abstype position <= p0tr
#extern fun position_make(
  line: int,
  offs: int
) : position

#abstype range <= p0tr
#extern fun range_make(
  pbeg: position,
  pend: position
) : range

#abstype diagnostic <= p0tr
#extern fun diagnostic_make(
  severity: severity,
  location: range, 
  message: string,
  source: string
) : diagnostic

#abstype diagnostics <= p0tr
#extern fun diagnostics_push(
  ds: diagnostics, 
  d: diagnostic
) : void

#extern fun bootstrap_set_validator((diagnostics, url) -> void) : void
#extern fun bootstrap_connect() : void