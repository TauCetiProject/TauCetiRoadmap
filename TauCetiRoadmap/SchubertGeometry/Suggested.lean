import Mathlib
import TauCeti.LinearAlgebra.RootSystem.Chamber
import TauCeti.LinearAlgebra.RootSystem.Weyl.Denominator.Basic
import TauCeti.LinearAlgebra.RootSystem.Weyl.Denominator.Integral
import TauCeti.RepresentationTheory.LSPath.Basic
import TauCeti.RepresentationTheory.LSPath.RootOperator

/-!
# Schubert geometry: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, each with `sorry`.

Stated below, on the native Lakshmibai–Seshadri encodings `TauCeti.LSPath`, their realized
paths `TauCeti.LSPath.toPLPath`, Littelmann's operators `TauCeti.PLPath.lower` and
`TauCeti.PLPath.raise`, the Weyl denominator `TauCeti.weylDenominator` and the dot
alternatization `RootPairing.dotAlternatization`, are S4's three path theorems: operator
stability of the encodings of a dominant shape (S4.2), generation of every encoding from the
straight one by simple lowerings (S4.3) and the character identity `Δ · char B(λ) = J(e^λ)` in
the integral group ring of the weight lattice (S4.4).

The remaining headlines are not statable at the pins:
* S1's relative parabolic representability and Schubert/incidence comparison need relative
  parabolic and flag schemes with their determinantal Schubert subschemes. The Grassmannian
  scheme `Module.Grassmannian.scheme` of a module over an affine base is native, with its
  functor of points and properness; the relative parabolic, flag and isotropic schemes are not.
* S2/S5's all-word image and derived pushforward theorems need Bott–Samelson
  schemes, their multiplication maps and their associated invertible sheaves.
* S3's geometric Demazure and Weyl character theorems need those flag line bundles
  and their section representations; the Demazure operators themselves are the
  native `RootPairing.demazureOperator` of `TauCeti/LinearAlgebra/RootSystem/Weyl/Demazure/`.
* S4's component isomorphism theorem and tensor-component theorem need the normal
  crystal structure on the encodings of a dominant shape, which S4.1 and S4.3 construct
  from the operator stability stated here; `TauCeti.NormalCrystal` is native, but the
  crystal `B(λ)` on `TauCeti.LSPath` is not.
* S5's splitting, normality and vanishing theorems need the Schubert schemes
  and their Frobenius-module and coherent-cohomology constructions.
* S6's all-degree standard monomial theorem needs geometric path sections and
  the Schubert section ring, not just a polynomial ring with named minors.
* S7's Chevalley and cycle comparisons need Schubert cycles and their Chow classes.
* S8's flag K-ring presentation needs the flag's algebraic K-ring and characteristic map.
* S9.0's general proper coherent GAGA needs complex analytic spaces with
  nilpotents, coherent analytification and its derived exchange maps.
* S9's moment–Morse and cellular comparisons need the flag
  and word analytifications, equivariant bundles and compatible cellular maps;
  S9.8's associated-line adapter needs their tensor-compatible analytification.
-/

namespace TauCetiRoadmap.SchubertGeometry

open TauCeti RootPairing AddMonoidAlgebra

/-! ## Layer 4: Finite-type LS chains, root operators and section indices (S4) -/

variable {ι M N : Type*} [AddCommGroup M] [AddCommGroup N]
  {P : RootPairing ι ℤ M N} {b : P.Base} [Finite ι] [P.IsReduced] [P.flip.IsReduced] {lam : M}
  {𝕜 V : Type*} [Field 𝕜] [LinearOrder 𝕜] [IsStrictOrderedRing 𝕜]
  [AddCommGroup V] [Module 𝕜 V]

/-- **Operator stability, lowering** (S4.2; Littelmann1995, Proposition 4.7). For a dominant
shape `λ` and an encoding `π` of shape `λ`, realized by an additive map `f` into a vector space
over an ordered field whose height forms `F i` agree with the simple coroots on the lattice: if
Littelmann's lowering operator `f_i` is defined on the realized path of `π`, its value is the
realized path of an encoding of shape `λ`. -/
theorem exists_toPLPath_eq_of_lower_eq_some
    (π : LSPath P b lam) (hlam : lam ∈ dominantChamber P b) (f : M →+ V)
    (F : b.support → Module.Dual 𝕜 V) (hF : ∀ i m, F i (f m) = (P.coroot' i m : 𝕜))
    (i : b.support) {q : PLPath 𝕜 V}
    (hq : PLPath.lower (F i) (f (P.root i)) (π.toPLPath 𝕜 f) = some q) :
    ∃ π' : LSPath P b lam, π'.toPLPath 𝕜 f = q := by
  sorry

/-- **Operator stability, raising** (S4.2; Littelmann1995, Proposition 4.7). Under the hypotheses
of `exists_toPLPath_eq_of_lower_eq_some`: if the raising operator `e_i` is defined on the realized
path of `π`, its value is the realized path of an encoding of shape `λ`. -/
theorem exists_toPLPath_eq_of_raise_eq_some
    (π : LSPath P b lam) (hlam : lam ∈ dominantChamber P b) (f : M →+ V)
    (F : b.support → Module.Dual 𝕜 V) (hF : ∀ i m, F i (f m) = (P.coroot' i m : 𝕜))
    (i : b.support) {q : PLPath 𝕜 V}
    (hq : PLPath.raise (F i) (f (P.root i)) (π.toPLPath 𝕜 f) = some q) :
    ∃ π' : LSPath P b lam, π'.toPLPath 𝕜 f = q := by
  sorry

/-- **Generation from the straight path** (S4.3; Littelmann1995, Corollary 3). For a dominant
shape `λ`, the realized path of every encoding of shape `λ` is reached from the realized straight
path `t ↦ t λ` by finitely many simple-root lowerings `f_{i₁}, …, f_{i_r}`: the set of encodings
is the operator component of the straight one. -/
theorem reflTransGen_lower_toPLPath_straight
    (π : LSPath P b lam) (hlam : lam ∈ dominantChamber P b) (f : M →+ V)
    (F : b.support → Module.Dual 𝕜 V) (hF : ∀ i m, F i (f m) = (P.coroot' i m : 𝕜)) :
    Relation.ReflTransGen
      (fun p q : PLPath 𝕜 V ↦ ∃ i, PLPath.lower (F i) (f (P.root i)) p = some q)
      ((LSPath.straight lam : LSPath P b lam).toPLPath 𝕜 f) (π.toPLPath 𝕜 f) := by
  sorry

/-- **The character identity in the weight lattice** (S4.4; Littelmann1995, Theorem 9.1,
multiplied by `e^{-ρ}`). For a dominant shape `λ`, an injective realization `f` and the lattice
weights `wt π` of the encodings, defined by `f (wt π) = π(1)`,

`Δ · ∑_{π ∈ B(λ)} e^{wt π} = J(e^λ) = ∑_{w ∈ W} sgn(w) e^{w λ - (ρ - w ρ)}`

in the integral group ring of the weight lattice, where `Δ = ∏_{α > 0} (1 - e^{-α})` is the Weyl
denominator; every exponent lies in the lattice even when `ρ` does not. -/
theorem weylDenominator_mul_finsum_single_eq_dotAlternatization [Fintype P.weylGroup]
    (hlam : lam ∈ dominantChamber P b) (f : M →+ V) (hf : Function.Injective f)
    (wt : LSPath P b lam → M) (hwt : ∀ π, f (wt π) = (π.toPLPath 𝕜 f).endpoint) :
    weylDenominator P b * ∑ᶠ π : LSPath P b lam, single (wt π) (1 : ℤ) =
      dotAlternatization P b (single lam 1) := by
  sorry

end TauCetiRoadmap.SchubertGeometry
