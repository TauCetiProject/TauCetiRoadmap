module

public import Mathlib
public import TauCeti.RingTheory.FormalGroup.Hom
public import TauCeti.RingTheory.FormalGroup.Height.Basic

/-!
# Bordism, formal groups and chromatic operations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`.

Statable at the pins, and stated below: Lazard's classification of
one-dimensional commutative formal groups over a separably closed field of
characteristic `p` by their height (F1), on Tau Ceti's bundled isomorphisms
`TauCeti.FormalGroupIso` and height `FormalGroup.height`. The rest of F1
(the `n`-series, the Lazard ring with its universality and polynomial
theorem, the symmetric cocycle lemma, the coordinate-change Hopf algebroid,
the invariant differential, logarithm and exponential, the exponent-two
normalized logarithm and its universal ring) consists of theorems of the
pinned Tau Ceti, consumed by the README and stated nowhere here.

Not statable at the pins, and stated nowhere in this file: the Lubin–Tate
universal deformation theorem (no deformations of formal groups over
complete local rings and no universal deformation ring); Quillen's theorem
`L ≅ MU_*` and Thom's computation of `π_*MO` (no spectra, no `MU`, `MO` or
Eilenberg–MacLane spectra); the Conner–Floyd and graded Eilenberg–MacLane
comparisons for `MO` (no `MO`, no graded Eilenberg–MacLane spectrum
`H(MO_*)`, no represented homology theories); the Landweber exact functor
theorem (no `MU_*MU`-comodules); the Devinatz–Hopkins–Smith nilpotence
theorem and the Hopkins–Smith thick-subcategory classification and
periodicity theorem (no stable homotopy category, no finite `p`-local
spectra, no Morava `K(n)`); the Hopkins–Ravenel smashing theorem, the
chromatic fracture square and the `K(n)`-local completion formula (no
homological Bousfield localizations of spectra, no `E(n)`- or `K(n)`-local
categories, no homotopy limits of spectra); the Greenlees–Sadofsky/Kuhn
Tate vanishing (no Morava `K(n)`, no Tate construction); and the torus
Euler cancellation of F6.6 (no `MU`-module families over `BT`, no
Thom-cocone Euler maps).
-/

@[expose] public section

noncomputable section
namespace TauCetiRoadmap.BordismFormalGroups

/-! ## F1: formal-group algebra and universality -/

/-- F1 (Lazard): over a separably closed field `k` of characteristic `p`, two commutative
one-dimensional formal groups are isomorphic exactly when their heights agree, the infinite
height (the class of the additive group) included (Ravenel, Theorem A2.2.12). The forward
direction and the infinite-height case are theorems of the pinned Tau Ceti
(`TauCeti.FormalGroupIso.height_eq`, `FormalGroup.height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`);
the finite-height converse needs the separable closure. -/
theorem nonempty_formalGroupIso_iff_height_eq {k : Type*} [Field k] [IsSepClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm] :
    Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p := by
  sorry

end TauCetiRoadmap.BordismFormalGroups
