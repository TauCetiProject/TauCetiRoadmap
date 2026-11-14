module

import Mathlib

/-!
# P-adic differential equations, rigid cohomology and p-adic weights, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti. No headline theorem is statable at these
pins with only a few simple definitions on existing carriers. Tau Ceti has the rings of power
series with bounded coefficients (`PowerSeries.HasGaussNorm.subring`, the bounded-disc ring
`K[[t]]₀` at radius 1), of power series on the open disc (`PowerSeries.OnOpenDisc.subring`), and
the `π`-adic and Monsky–Washnitzer weak completions of a finitely generated algebra
(`TauCeti.Dagger.piAdicCompletion`, `TauCeti.Dagger.weakCompletion`; for a lifted affine curve
these are its completed and dagger coordinate rings), and the Monsky–Washnitzer algebra with its
partial derivations (`TauCeti.Dagger.washnitzerAlgebra`), but as rings only: Mathlib's formal
derivative `PowerSeries.derivative` acts on all power series, and neither library equips these
rings with a compatible Frobenius lift over `σ` making them coefficient rings. Mathlib's
`AdicCompletion` and localisations give the underlying rings of the Amice field and of the
completed generic field of a curve, but neither library has these fields with a Frobenius lift
and derivation, the bounded Robba field, `(φ,∇)`-modules over any of these rings, Frobenius
slopes of such modules, convergent or overconvergent F-isocrystals on a smooth `k`-scheme, slope
filtrations of such objects, or rigid cohomology. These structures are owned by the roadmap
PadicDifferentialEquationsAndRigidCohomology and are heavy constructions, not definitions of a
few lines. The headline theorems and what each lacks:

* The specified-map theorem on curves (README MS.4.6; Tsuzuki, Corollary 6.5) lacks
  overconvergent and convergent F-isocrystals on a smooth curve, their slope filtrations and
  maximal-slope quotients.
* Its minimal-slope form (README MS.4.8) lacks the same carriers and the minimal-slope
  subobject.
* The minimal slope property on curves (README MS.5.7; D'Addezio, Theorem 4.2.13) lacks, in
  addition, dagger-extendable convergent `F^n`-isocrystals and their dagger hulls.
* The curve PBQ filtration and the curve rank theorem (README MS.2.5, MS.4.2; Tsuzuki,
  Theorem 3.27 and Proposition 6.1) lack the completed generic field of a curve with its
  Frobenius lift and derivation, its `(φ,∇)`-modules and their maximally bounded quotients.
* The local theorems (README MS.0.7, MS.1.1, MS.1.8, MS.3.7: bounded splitting, the PBQ
  filtration, logarithmic growth versus Frobenius slopes, local reconstruction) lack the Amice
  and bounded Robba fields with Frobenius lift and derivation, generic solution spaces on the
  generic disc, solution spaces in the logarithmic Robba ring with their log-growth filtration, and
  Frobenius slopes of `φ`-modules over them.
* The finite-field theorems (README MS.6.13, MS.6.14; Tsuzuki, Theorem 7.20) lack overconvergent
  `Q̄_p`-F-isocrystals on smooth varieties over finite fields, their Frobenius fibres and
  `ι`-weights, and Lefschetz curves.
* The docile Lefschetz theorem (README MS.5.8; D'Addezio, Theorem 4.4.2) lacks docile
  overconvergent isocrystals on the complement of a normal crossings divisor.
* The opposite slope rank bound (README MS.0.4; Tsuzuki, Theorems 2.13–2.14; D'Addezio,
  Lemma 4.2.7) lacks `φ`-modules, with no connection, over the bounded Robba field and the Amice
  field and over D'Addezio's generic pair of the affine line (residue field `k(t)`), with their
  Frobenius slopes and maximal-slope quotients.
* The bounded graded formula and the two descents of the PBQ filtration (README MS.1.2, MS.1.4,
  MS.1.5; Tsuzuki, Theorems 3.19(2) and 3.23) lack, beyond the carriers of the local theorems,
  maximally bounded quotients and the grades of PBQ filtrations, and `(φ,∇)`-modules over the
  bounded-disc ring `K[[t]]₀`, which Tau Ceti has only as a ring.
* The curve intersection, gluing and transport theorems (README MS.2.2, MS.2.3, MS.2.6, MS.2.7,
  MS.2.9: dagger sections as intersections, interior and boundary gluing, finite étale PBQ
  transport, the curve bounded quotient, the convergent PBQ filtration; Tsuzuki, Lemmas 3.1–3.2
  and 3.31–3.33, Proposition 3.29, proof of Proposition 6.1) lack the completed generic field
  of a curve and its local fields with their Frobenius lifts, derivations and embeddings, and
  convergent and overconvergent F-isocrystals on a curve with their generic and local
  realisations, pullback and direct image.
* Local graded recovery, the curve irreducibility criterion and curve graded recovery (README
  MS.3.6, MS.4.3, MS.4.4; Tsuzuki, Theorem 4.11, Proposition 6.2, Theorem 6.4) lack, beyond
  these carriers, saturated quotients of `(φ,∇)`-modules over the bounded Robba field and of
  overconvergent F-isocrystals on a curve, and the convergent bounded quotient of a curve.
* The reductions of the minimal slope property, the generic minimal slope property and the étale
  affine-line reduction (README MS.5.3, MS.5.5, MS.5.6; D'Addezio, Lemmas 4.1.4–4.1.8,
  Proposition 4.2.2, proof of Theorem 4.2.13) lack convergent and overconvergent
  `F^n`-isocrystals with Frobenius pullback and finite étale direct image, dagger hulls,
  minimal-slope subobjects, and `(φ,∇)`-modules over D'Addezio's generic pair.
* Lefschetz fibre reconstruction, the coefficient-linear trace formula, the projected trace
  average and the fibrewise isomorphism criterion (README MS.6.3, MS.6.6, MS.6.7, MS.6.10;
  Tsuzuki, Corollary 6.8, Propositions 7.10, 7.12 and 7.15, Lemma 7.11, Corollary 7.13) lack
  overconvergent `L`-`F_q`-isocrystals and `Q̄_p`-objects with their Frobenius fibres, rigid
  cohomology with and without compact supports with these coefficients, their `L`-functions and
  `ι`-weights, and Lefschetz curves. The averaging step of MS.6.7 on a bare representation is
  Mathlib's `Representation.averageMap`; stated there it is linear algebra on free variables,
  not the headline.
-/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomologyPartII

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomologyPartII
