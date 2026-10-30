module

import Mathlib

/-!
# Supported formal K-theory and derived intersection degrees: target signatures

The roadmap is README.md; this file is not the roadmap. It records which of the roadmap's
headline theorems can be stated against the pinned APIs.

None of the following headline theorems is statable at the pins on its actual carrier:

* The formal stalk/completion and codimension comparison (Layer 0) lacks the locally ringed
  formal-scheme carrier and its coherent closed immersions. Adic completion of modules alone
  does not supply a formal stalk.
* Formal coherent supported devissage and affine transport (Layer 1) lack coherent modules on
  formal schemes, the power-supported subcategory and the strict supported complex category.
* Regular supported comparison (Layer 2) lacks formal supported K-zero and its homology map.
* Comparison of the dimension and codimension filtrations (Layer 2) lacks those formal groups
  and their support filtrations.
* Rational affine multiplicativity (Layer 2) lacks strict supported K-zero with arbitrary
  closed supports. Full-support module Cartan equivalence does not state this theorem.
* Closed-union decomposition (Layer 3) lacks coherent formal K-zero, closed pushforwards and
  their overlap cokernels, including their systems over noetherian open exhaustions.
* Expected-dimension Tor vanishing (Layer 3) lacks formal regular immersions, coherent formal
  Tor sheaves and their stalk-dimension condition.
* Componentwise expected-dimension vanishing (Layer 3) additionally lacks the formal overlap
  support subcategory and its coherent K-zero cokernel.
* Cartier pullback (Layer 3) lacks formal Cartier divisors and their strict supported classes.
* The derived Euler-Poincare pairing and its base-change laws (Layer 4) lack proper scheme
  supports over a formal base, their coherent Euler degree and their formal ambient Tor pairing.
* The length-times-rank formula (Layer 4) lacks the formal ambient derived Euler pairing and
  its zero-dimensional proper support; a free-standing module Euler identity is not its target.
* The Cartier-divisor degree formula (Layer 4) lacks the formal Cartier class, ambient derived
  intersection and proper-support Euler pairing.
* Proper formal pushforward and the supported projection formula (Layer 4) lack formal
  morphisms, coherent higher direct images and the supported coherent K-zero groups.

These are construction-sized missing carriers, not simple definitions that can be bundled from
native data. No algebraic special case, arbitrary predicate or admitted data is substituted for
one of these theorems. The complete statements, hypotheses, APIs and Checks are in README.md.
-/

namespace TauCetiRoadmap.SchemeKTheoryOperationsPartII

end TauCetiRoadmap.SchemeKTheoryOperationsPartII
