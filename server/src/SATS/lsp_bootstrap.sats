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

fun set_validator((diagnostics, url) -> void) : void
fun connect() : void