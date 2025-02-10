locals {
  math = 2 * 2
  equality = 2 == 2
  comparision = 2 < 1
  logical = true || false
}

output "operators" {
    value = {
        math = local.math
        equality = local.equality
        comparision = local.comparision
        logical = local.logical
    }
  
}

/*

"terraform output"

operators = {
  "comparision" = false
  "equality" = true
  "logical" = true
  "math" = 4
}

*/

