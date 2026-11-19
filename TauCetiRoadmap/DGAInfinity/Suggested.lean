import Mathlib
import TauCeti.Algebra.Homology.AInfinity.Algebra.CohomologicalUnit
import TauCeti.Algebra.Homology.AInfinity.Algebra.Hom.Homotopy
import TauCeti.Algebra.Homology.AInfinity.Algebra.Hom.Iso
import TauCeti.Algebra.Homology.AInfinity.Algebra.Minimal

/-!
# DG and A∞ algebras, categories, and modules: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the roadmap's headline theorems that the pinned libraries do not already prove,
each with `sorry`, on Tau Ceti's carriers `TauCeti.AInfinityAlgebra`, `TauCeti.AInfinityHom`,
`TauCeti.AInfinityHom.Homotopy` and the unit predicates `TauCeti.AInfinityAlgebra.StrictUnit` and
`TauCeti.AInfinityAlgebra.CohomologicallyUnital`.

Stated here (README §3.5): over a field, an `A∞` quasi-isomorphism has an inverse up to homotopy
(Keller, *Introduction to A-infinity algebras and modules*, Section 3.7, Theorem (b)), and every
cohomologically unital `A∞` algebra is `A∞` quasi-isomorphic to a strictly unital one, `A∞`
isomorphic to one if it is minimal (Keller, *A-infinity algebras, modules and functor
categories*, Proposition 2.4).

The graded vocabulary of Layer 0, `InternalGrading`, `InternalGrading.IsHomogeneous` and
`LinearHasDegree`, is Tau Ceti's internal grading `TauCeti.InternalGrading` with membership in a
summand and the degree of a linear map, under the names in which the Lean file of the roadmap
StablePeriodicCurved, which imports this one, states its curved DG algebras and modules.

Headline theorems the Tau Ceti pin already proves, cited by the README by name and not restated:

* Kadeishvili's minimal-model theorem for `A∞` algebras over a field (README §3.4):
  `TauCeti.AInfinityAlgebra.minimalModel`, `TauCeti.AInfinityAlgebra.isMinimal_minimalModel`,
  `TauCeti.AInfinityAlgebra.minimalModel_m_two`,
  `TauCeti.AInfinityAlgebra.isQuasiIso_minimalModelInclusion` and the uniqueness
  `TauCeti.AInfinityAlgebra.isIso_minimalModelProjection_comp`;
* the transferred `m₃([a], [a], [b]) = [ac] ≠ 0` for `Λ(a, b, c)` with `dc = ab` (README, Layer 3
  examples): `TauCeti.HeisenbergDGA.minimalModel_m_three` and
  `TauCeti.HeisenbergDGA.minimalModel_m_three_ne_zero`;
* the triangulated pretriangulated envelope (README §5.4):
  `TauCeti.DGTwistedObject.isTriangulated_oneSided` and
  `TauCeti.DGTwistedObject.isLeast_isoClosure_oneSided`;
* Kadeishvili's intrinsic-formality criterion (README §8.4):
  `TauCeti.AInfinityAlgebra.isIntrinsicallyFormal_of_forall_hochschildVanishesAt`, and the
  transferred `m₃` as an element of the triple Massey product (README §8.3):
  `TauCeti.AInfinityAlgebra.minimalModel_m_three_mem_tripleMasseyProduct`.

Headline theorems not statable at the pins, and the carrier each lacks:

* the module equivalence `D(A) ≃ D_∞(H*A)` restricting to perfect objects (README §6.2): no
  derived category of `A∞` modules as a triangulated category, and no `Perf`;
* the enveloping DG algebra `U(A) = ΩB∞A` with its quasi-isomorphism `A → U(A)` (README §4.2):
  no cobar construction;
* Keller's derived Morita theorem with a compact generator (README §6.4): no derived category of
  DG modules over a DG category, no compact objects in the triangulated sense, no `RHom`;
* Drinfeld's DG quotient, its comparison `C^tr/B^tr ≃ (C/B)^tr` and the `K₀` sequence of a DG
  quotient (README §§7.1–7.4): no DG quotient;
* the statement that higher transferred operations encode Massey defining systems (README §8.3):
  no `n`-fold Massey product for `n ≥ 4`;
* Shklyarov's Hirzebruch–Riemann–Roch theorem and the Calabi–Yau property of `Π_n(C)` (README
  §§9.3, 9.5): no Hochschild homology or Chern character of a DG algebra, no smoothness
  predicate, no inverse dualizing bimodule, no derived tensor algebra;
* the Serre identities for the Euler form on `Perf(C)` (README §10.3): no `Perf` and no Serre
  functor;
* relative Koszul duality (README §11.2): no tensor algebra over a noncommutative semisimple base,
  no Koszul predicate for right modules, and no Yoneda algebra structure on `Ext*(S, S)`.
-/

namespace TauCetiRoadmap.DGAInfinity

open TauCeti

universe uK uA uB

/-! ## Layer 0: signed graded multilinear algebra and tensor coalgebras -/

/-- An internal `ℤ`-grading of a `k`-module: a family of submodules whose direct sum is the
module, Tau Ceti's `TauCeti.InternalGrading` (README, Convention 5 and §0.1). -/
abbrev InternalGrading (k A : Type*) [CommRing k] [AddCommGroup A] [Module k A] :=
  TauCeti.InternalGrading k A

/-- An element is homogeneous of degree `p` for an internal grading when it lies in the degree-`p`
summand. -/
def InternalGrading.IsHomogeneous {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (G : InternalGrading k A) (p : ℤ) (x : A) : Prop :=
  x ∈ G.piece p

/-- A linear map between internally graded modules has degree `q` when it sends every element
homogeneous of degree `p` to an element homogeneous of degree `p + q`. This is Tau Ceti's
`TauCeti.LinearMap.IsHomogeneous f GA.piece GB.piece q` with `p` and `x` taken explicitly, the
form `TauCeti.LinearMap.isHomogeneous_def` unfolds it to. -/
def LinearHasDegree {k A B : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    [AddCommGroup B] [Module k B] (GA : InternalGrading k A) (GB : InternalGrading k B) (q : ℤ)
    (f : A →ₗ[k] B) : Prop :=
  ∀ p x, GA.IsHomogeneous p x → GB.IsHomogeneous (p + q) (f x)

/-! ## Layer 3: minimal models and homological transfer -/

/-- **The `A∞` Whitehead theorem.** Over a field, an `A∞` quasi-isomorphism `f : A → B` has an
inverse up to homotopy: an `A∞` morphism `g : B → A` with `g ∘ f` homotopic to the identity of
`A` and `f ∘ g` homotopic to the identity of `B`, homotopy being Keller's (a coderivation `H`
along the two bar coalgebra maps with `F − G = b H + H b`). Keller, *Introduction to A-infinity
algebras and modules*, Section 3.7, Theorem (b) (Prouté). README §3.5. -/
theorem exists_homotopy_inverse_of_isQuasiIso {K : Type uK} [Field K]
    {A : Type uA} {B : Type uB} [AddCommGroup A] [Module K A] [AddCommGroup B] [Module K B]
    {AA : AInfinityAlgebra K A} {BB : AInfinityAlgebra K B} {f : AInfinityHom AA BB}
    (hf : f.IsQuasiIso) :
    ∃ g : AInfinityHom BB AA,
      Nonempty (AInfinityHom.Homotopy (g.comp f) (AInfinityHom.id AA)) ∧
        Nonempty (AInfinityHom.Homotopy (f.comp g) (AInfinityHom.id BB)) := by
  sorry

/-- **Unit strictification.** Over a field, every cohomologically unital `A∞` algebra `A` is
`A∞` quasi-isomorphic to an `A∞` algebra with a strict unit: there is a strictly unital `A∞`
algebra `B` on a carrier in the universe of `A` and an `A∞` quasi-isomorphism `B → A`. Keller,
*A-infinity algebras, modules and functor categories*, Proposition 2.4. README §3.5. -/
theorem exists_strictUnit_isQuasiIso_of_cohomologicallyUnital {K : Type uK} [Field K]
    {A : Type uA} [AddCommGroup A] [Module K A] {AA : AInfinityAlgebra K A}
    (h : AA.CohomologicallyUnital) :
    ∃ (B : Type uA) (_ : AddCommGroup B) (_ : Module K B) (BB : AInfinityAlgebra K B) (e : B)
      (f : AInfinityHom BB AA), BB.StrictUnit e ∧ f.IsQuasiIso := by
  sorry

/-- **Unit strictification for minimal algebras.** Over a field, a minimal cohomologically
unital `A∞` algebra `A` is `A∞` isomorphic to an `A∞` algebra with a strict unit on the same
carrier. Keller, *A-infinity algebras, modules and functor categories*, Proposition 2.4.
README §3.5. -/
theorem exists_strictUnit_isIso_of_isMinimal {K : Type uK} [Field K]
    {A : Type uA} [AddCommGroup A] [Module K A] {AA : AInfinityAlgebra K A}
    (hmin : AA.IsMinimal) (h : AA.CohomologicallyUnital) :
    ∃ (BB : AInfinityAlgebra K A) (e : A) (f : AInfinityHom BB AA),
      BB.StrictUnit e ∧ f.IsIso := by
  sorry

end TauCetiRoadmap.DGAInfinity
