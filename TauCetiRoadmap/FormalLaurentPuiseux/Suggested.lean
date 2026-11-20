import Mathlib
import TauCeti.RingTheory.LaurentSeries.KaehlerDifferential.Basic
import TauCeti.RingTheory.LaurentSeries.Substitution.Basic
import TauCeti.RingTheory.LaurentSeries.Puiseux.AlgClosure
import TauCeti.RingTheory.LaurentSeries.Puiseux.FiniteExtension
import TauCeti.RingTheory.LaurentSeries.Level.KaehlerDifferential
import TauCeti.RingTheory.LaurentSeries.Puiseux.AbsoluteGalois

/-!
# Formal Laurent fields, Puiseux expansions and continuous differential calculus: target signatures

The roadmap is `README.md`; this file is not the roadmap. It records the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti by pinning the declarations that prove them.

Every headline theorem of the roadmap is proved in the pinned Tau Ceti, so this file restates none
of them. Each `#check` below pins the declaration that carries one of them, so that the file stops
building if that declaration is renamed or removed. Throughout, `K` is a field and `F = K⸨X⸩`.

* Layer 2. A continuous `K`-derivation of `F` into a Hausdorff `F`-module with continuous scalar
  multiplication factors uniquely through the universal derivation `d` of the continuous one-forms
  `Ω¹_cont(F/K)`, and `Ω¹_cont(F/K)` is free of rank one on `dX`.
* Layer 3. For a nonzero power series `φ` with zero constant coefficient, the residue of
  `f(φ) φ' dX` is `ord(φ)` times the residue of `f dX`, in every characteristic.
* Layer 5. If `K` is algebraically closed of characteristic zero, the Puiseux field is an algebraic
  closure of `F`.
* Layer 6. For such `K`, a finite extension of `F` is isomorphic over `F` to the ramified level
  `K⸨u⸩`, `u ^ e = X`, exactly when its degree is `e`. Over every field `K`, when `e` is nonzero in
  `K`, the trace of one-forms from that level to `F` preserves residues.
* Layer 7. For such `K` and a compatible family `ζ` of primitive roots of unity, the absolute
  Galois group of `F` is isomorphic to `ℤ̂` as a topological group, and an automorphism has
  coordinate the generator of `ℤ̂` exactly when it multiplies every `n`-th root of a uniformizer
  by `ζₙ`.
-/

namespace TauCetiRoadmap.FormalLaurentPuiseux

#check @TauCeti.ContinuousKaehlerDifferential.existsUnique_compDer_eq
#check @TauCeti.ContinuousKaehlerDifferential.equivLaurentSeries
#check @TauCeti.LaurentSeries.coeff_neg_one_substAlgHom_mul_derivative_eq_nsmul
#check @TauCeti.puiseuxField.instIsAlgClosure
#check @TauCeti.LaurentSeries.Level.nonempty_algEquiv_iff
#check @TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.coeff_neg_one_equivLaurentSeries_trace
#check @TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat
#check @TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat_eq_gen_iff

end TauCetiRoadmap.FormalLaurentPuiseux
