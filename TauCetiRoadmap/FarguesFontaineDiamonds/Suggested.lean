import Mathlib

/-!
# The Fargues–Fontaine curve as a diamond: target signatures

The roadmap is `README.md`, the definitive specification. This file records suggested
Lean forms for its headline results, not an exhaustive checklist: it states those headline
theorems that can be written against the pinned Mathlib and Tau Ceti APIs.

At the pins none of the headline results is statable:

* F0's comparison interface requires the analytic Yoneda-adic category and its
  comparison functor, which are absent at the pins. The underlying adic objects
  are supplied by Tau Ceti's `FarguesFontaine.spaYAdicSpace` and
  `FarguesFontaine.spaXAdicSpace`, with `FarguesFontaine.quotientAdicHom`.
* F1's product isomorphism and F2's Frobenius-equivariant effective quotient require
  the category of perfectoid test spaces, its `v`-topology, marked untilts, `Spd(ℚ_p)`
  and the analytic adic-space diamond functor. These objects are absent at the pins.
* F3's étale-sheaf and finite étale descent equivalences require the adic and diamond
  étale sites and their comparison functor, which are absent at the pins.
* F4's closed Cartier untilt immersions on the period domain and curve, exact divisor
  sequence and Frobenius-orbit invariance require marked untilts and analytic
  Cartier ideals with adic quotient spaces. The boundary supremum and multiplication
  estimates require the marked-untilt neighborhoods and their normalized spectral
  norms. The fixed-field untilt-quotient section bijection requires the `v`-sheaf
  `Spd(ℚ_p)/φ^ℤ`. None of these carriers is supplied by the algebraic Fontaine theta map.
* F5's left-completed and derived-complete adic coefficient equivalences and natural
  global-sections comparisons require the enhanced étale categories, coherent
  Postnikov completion and coefficient-system limits. Mathlib's ordinary derived
  categories do not supply these objects.

The README specifies their full hypotheses and supplier contracts.
-/

namespace TauCetiRoadmap.FarguesFontaineDiamonds

end TauCetiRoadmap.FarguesFontaineDiamonds
