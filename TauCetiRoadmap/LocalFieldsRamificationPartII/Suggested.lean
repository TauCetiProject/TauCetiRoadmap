module

import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic

/-!
# Local fields and ramification, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few simple
definitions needed to state them.

A valued field is a field `K` with a Mathlib `ValuationSubring K`. Its residue characteristic
exponent is `ringExpChar` of the residue field. Tameness of a field is expressed through Mathlib's
`ValuationSubring.inertiaSubgroup` of finite Galois subextensions of `AlgebraicClosure K`: a field
is separably tame when every such inertia group has order prime to the residue characteristic
exponent, and tame when it is moreover perfect. Layer 2 of the README identifies these predicates
with Temkin's conditions `Kˢ = Kᵗ` and `Kᵃ = Kᵗ`.

Headline theorems stated below:

* Temkin's tameness theorem: a valued field without nontrivial finite extensions of degree a
  power of its residue characteristic exponent is tame (Layer 6);
* the separable export: a separably `P`-closed field is separably tame at every valuation whose
  residue characteristic exponent lies in `P` (Layer 6);
* the Kuhlmann–Pank–Roquette splitting over a henselian valued field (Layer 3);
* the profinite input of the splitting theorem: continuous sections of surjections with pro-`p`
  kernel onto groups of `p`-cohomological dimension at most one (Layer 3);
* finite presentation of flat finite-type algebras over arbitrary domains, and of finite modules
  flat over a Prüfer base (Layer 1);
* Krasner's lemma over a henselian, not necessarily complete, rank-one normed field (Layer 4);
* the algebraic Abhyankar inequality and the resulting height bound (Layer 5).

Headline theorems not statable at the pins:

* the Pank splitting in height one without a henselian hypothesis (Temkin, Theorem 2.5.5), and
  every statement about the tame closure `Kᵗ` of a non-henselian field: they need the wild
  inertia subgroup of a prolongation to the separable closure and its fixed field, which neither
  library provides for a general valued field (Mathlib has decomposition and inertia subgroups
  only, and Tau Ceti's `TauCeti.wildInertiaSubgroup` assumes a nonarchimedean local field);
* the tensor decomposition `L ⊗_K Kʰ ≅ ∏ L_wʰ` and the height-one decompletion: they need the
  henselization of a valued field, which neither library provides (Tau Ceti has the henselization
  of the valuation ring as a ring, not the valued field built on it inside a separable closure);
* the composition criteria for unramified and tame extensions: they need the unramified and tame
  extension classes of a non-henselian field, defined through the henselization.
-/

namespace TauCetiRoadmap.LocalFieldsRamificationPartII

open IsLocalRing

/-! ## Layer 0: prime-supported extensions -/

/-- A natural number `n` is a `P`-number for a set `P` of natural numbers when it is positive and
every prime divisor of `n` lies in `P`. Zero is never a `P`-number, and for `P = ∅` the only
`P`-number is `1` (Temkin 2017, §2.1.1). -/
def IsPNumber (P : Set ℕ) (n : ℕ) : Prop :=
  0 < n ∧ ∀ q : ℕ, q.Prime → q ∣ n → q ∈ P

/-- A field `K` is `P`-closed when it has no nontrivial finite extension whose degree is a
`P`-number; purely inseparable extensions are included (Temkin 2017, §2.1.1). -/
def IsPClosed (P : Set ℕ) (K : Type*) [Field K] : Prop :=
  ∀ E : IntermediateField K (AlgebraicClosure K), FiniteDimensional K E →
    IsPNumber P (Module.finrank K E) → E = ⊥

/-- A field `K` is separably `P`-closed when it has no nontrivial finite separable extension
whose degree is a `P`-number. No perfection is imposed. -/
def IsSeparablyPClosed (P : Set ℕ) (K : Type*) [Field K] : Prop :=
  ∀ E : IntermediateField K (AlgebraicClosure K), FiniteDimensional K E →
    Algebra.IsSeparable K E → IsPNumber P (Module.finrank K E) → E = ⊥

/-! ## Layer 1: finite presentation over domains and Prüfer domains -/

/-- **Flat finite-type algebras over a domain are finitely presented.** Let `A` be a domain
and `B` an `A`-algebra of finite type that is flat over `A`. Then `B` is a finitely presented
`A`-algebra (Raynaud–Gruson, Corollaire 3.4.7; Stacks, Proposition 38.13.10, tag 053G). -/
theorem finitePresentation_of_flat_of_isDomain (A B : Type*) [CommRing A]
    [IsDomain A] [CommRing B] [Algebra A B] [Algebra.FiniteType A B] [Module.Flat A B] :
    Algebra.FinitePresentation A B := by
  sorry

/-- **Finite modules flat over a Prüfer domain are finitely presented.** Let `A` be a domain
whose localization at every maximal ideal is a valuation ring, `B` an `A`-algebra of finite type
and `M` a finite `B`-module that is flat as an `A`-module. Then `M` is a finitely presented
`B`-module; the flatness hypothesis is on `M`, not on `B` (Stacks, Lemma 15.26.6, tag 053E, for a
valuation ring). -/
theorem module_finitePresentation_of_flat_of_valuationRing_localization (A B M : Type*)
    [CommRing A] [IsDomain A] [CommRing B] [Algebra A B] [Algebra.FiniteType A B]
    [AddCommGroup M] [Module A M] [Module B M] [IsScalarTower A B M] [Module.Finite B M]
    [Module.Flat A M]
    (hA : ∀ (P : Ideal A), [P.IsMaximal] → ValuationRing (Localization P.primeCompl)) :
    Module.FinitePresentation B M := by
  sorry

/-! ## Layer 2: tame Galois extensions and tame fields -/

/-- A subextension `L` of `AlgebraicClosure K` is a tame Galois extension for the valuation
subring `V` of `K` when `L/K` is finite Galois and, for every valuation subring `A` of `L` lying
over `V`, the inertia subgroup of `A` in `Gal(L/K)` has order prime to the residue characteristic
exponent of `V`. -/
def IsTameGaloisExtension {K : Type*} [Field K] (V : ValuationSubring K)
    (L : IntermediateField K (AlgebraicClosure K)) : Prop :=
  FiniteDimensional K L ∧ IsGalois K L ∧
    ∀ A : ValuationSubring L, A.comap (algebraMap K L) = V →
      Nat.Coprime (Nat.card (ValuationSubring.inertiaSubgroup K A))
        (ringExpChar (ResidueField V))

/-- A valued field `(K, V)` is separably tame when every finite Galois subextension of
`AlgebraicClosure K` is a tame Galois extension; equivalently `Kˢ = Kᵗ` (Temkin 2017, §2.3.9). -/
def IsSeparablyTameField {K : Type*} [Field K] (V : ValuationSubring K) : Prop :=
  ∀ L : IntermediateField K (AlgebraicClosure K), FiniteDimensional K L → IsGalois K L →
    IsTameGaloisExtension V L

/-- A valued field `(K, V)` is tame when it is perfect and separably tame; equivalently
`Kᵃ = Kᵗ`, that is, every algebraic extension is tame at every prolongation (Temkin 2017,
§2.3.9). No henselian hypothesis is part of the definition. -/
def IsTameField {K : Type*} [Field K] (V : ValuationSubring K) : Prop :=
  PerfectField K ∧ IsSeparablyTameField V

/-- The compositum in `AlgebraicClosure K` of the tame Galois extensions of `(K, V)`. When `V` is
henselian it is the tame closure `Kᵗ`; in general it is the largest subextension of `Kᵗ` that is
Galois over `K`. -/
noncomputable def galoisTamePart {K : Type*} [Field K] (V : ValuationSubring K) :
    IntermediateField K (AlgebraicClosure K) :=
  ⨆ (L : IntermediateField K (AlgebraicClosure K)) (_ : IsTameGaloisExtension V L), L

/-! ## Layer 3: sections through pro-`p` kernels and the splitting theorem over henselian fields -/

/-- **Sections through pro-`p` kernels.** Let `f : E → G` be a continuous surjective homomorphism
of profinite groups whose kernel is pro-`p`. If `cd_p G ≤ 1`, then `f` has a continuous
homomorphic section (Serre, *Galois Cohomology*, I §3.4, Proposition 16). -/
theorem exists_continuous_section_of_isProP_ker {p : ℕ} [Fact p.Prime] {E G : Type*}
    [Group E] [TopologicalSpace E] [IsTopologicalGroup E] [CompactSpace E]
    [TotallyDisconnectedSpace E]
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G]
    (f : E →* G) (hf : Continuous f) (hsurj : Function.Surjective f)
    (hker : TauCeti.IsProP p f.ker) (hG : TauCeti.cohomologicalDimensionAt p G ≤ 1) :
    ∃ s : G →* E, Continuous s ∧ ∀ g, f (s g) = g := by
  sorry

/-- **The Kuhlmann–Pank–Roquette splitting theorem.** Let `(K, V)` be a henselian valued field
and `E` a maximal purely wild extension of `K` in `AlgebraicClosure K`, that is, maximal among
the subextensions linearly disjoint from the tame closure `Kᵗ`. Then `E` and `Kᵗ` generate the
whole algebraic closure, so that multiplication `Kᵗ ⊗_K E → Kᵃ` is an isomorphism (Kuhlmann,
Pank and Roquette 1986, Theorems 2.1–2.2; Temkin 2017, Theorem 2.4.9). -/
theorem sup_galoisTamePart_eq_top_of_henselian {K : Type*} [Field K] (V : ValuationSubring K)
    [HenselianLocalRing V] (E : IntermediateField K (AlgebraicClosure K))
    (hE : E.LinearDisjoint (galoisTamePart V))
    (hmax : ∀ E' : IntermediateField K (AlgebraicClosure K), E ≤ E' →
      E'.LinearDisjoint (galoisTamePart V) → E' = E) :
    E ⊔ galoisTamePart V = ⊤ := by
  sorry

/-! ## Layer 4: height one -/

/-- **Krasner's lemma over a henselian base.** Let `K` be a nontrivially normed field with an
ultrametric norm whose valuation ring `{x | ‖x‖ ≤ 1}` is henselian, and `L` an algebraic
extension of `K` with a field norm extending that of `K`. Then `L/K` has the Krasner property: if
`x ∈ L` is separable over `K` with all its conjugates in `L`, and `y ∈ L` is closer to `x` than
every other conjugate of `x`, then `x ∈ K(y)`. Completeness of `K` is not assumed; Temkin 2017,
proof of Lemma 2.5.2, applies this over the henselization of a field of height one. -/
theorem isKrasner_of_henselianLocalRing (K L : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [NormedField L] [NormedAlgebra K L] [Algebra.IsAlgebraic K L]
    [HenselianLocalRing (NormedField.valuation (K := K)).valuationSubring] :
    IsKrasner K L := by
  sorry

/-! ## Layer 5: the Abhyankar inequality and the height bound -/

/-- **The algebraic Abhyankar inequality, elementwise.** Let `vL` be a valuation of `L`
extending the valuation `vK` of `K`. If the values of `x i` are independent modulo the value
group of `K` (no nontrivial integral monomial in them is a value of an element of `K`), and the
`y j` lie in the valuation ring of `vL` with residues algebraically independent over the residue
field of `vK`, then the family `x, y` is algebraically independent over `K`. Hence the rational
rank of `Γ_L/Γ_K` plus the residue transcendence degree is at most `trdeg(L/K)` (Kuhlmann,
Kuhlmann and Vişan 2016, Lemma 2.1). -/
theorem algebraicIndependent_of_valuation_independent {K L ΓK ΓL : Type*} [Field K] [Field L]
    [Algebra K L] [LinearOrderedCommGroupWithZero ΓK] [LinearOrderedCommGroupWithZero ΓL]
    (vK : Valuation K ΓK) (vL : Valuation L ΓL) [vK.HasExtension vL]
    {ι κ : Type*} (x : ι → L) (y : κ → vL.valuationSubring)
    (hx : ∀ n : ι →₀ ℤ, (n.prod fun i k => vL (x i) ^ k) ∈
      Set.range (fun a : K => vL (algebraMap K L a)) → n = 0)
    (hy : AlgebraicIndependent (ResidueField vK.valuationSubring)
      (fun j => residue vL.valuationSubring (y j))) :
    AlgebraicIndependent K (Sum.elim x (fun j => (y j : L))) := by
  sorry

/-- **The height bound.** If `L/K` has finite transcendence degree `n` and `W` is a valuation
subring of `L`, then the height (Krull dimension) of `W` is at most the height of its
restriction to `K` plus `n`. In particular every valuation on a field of finite transcendence
degree over its prime field has finite height (Temkin 2017, proof of Theorem 2.6.6). -/
theorem ringKrullDim_le_ringKrullDim_comap_add {K L : Type*} [Field K] [Field L] [Algebra K L]
    (W : ValuationSubring L) (n : ℕ) (hn : Algebra.trdeg K L = n) :
    ringKrullDim W ≤ ringKrullDim (W.comap (algebraMap K L)) + n := by
  sorry

/-! ## Layer 6: the tameness theorem -/

/-- **Temkin's tameness theorem.** Let `(K, V)` be a valued field, with a valuation of arbitrary
height, and `p` the characteristic exponent of its residue field. If `K` has no nontrivial finite
extension of degree a power of `p`, then `K` is tame: every algebraic extension of `K` is tame
at every prolongation. For `p = 1` the hypothesis is empty (Temkin 2017, Theorem 2.6.6). -/
theorem isTameField_of_isPClosed {K : Type*} [Field K] (V : ValuationSubring K)
    (h : IsPClosed {q | q.Prime ∧ q = ringExpChar (ResidueField V)} K) :
    IsTameField V := by
  sorry

/-- **The separable export.** Let `P` be a set of natural numbers and `K` a field without
nontrivial finite separable extension of `P`-number degree. Then `K` is separably tame at every
valuation subring whose residue characteristic exponent lies in `P`; for exponent `1` (residue
characteristic zero) this holds for every valued field. The field `K` need not be perfect, and
nothing is claimed for residue characteristic exponents outside `P`. Temkin 2017, Lemma 3.2.5, states the
`P`-closed form; the separable form passes through the perfection of `K`, as Temkin 2017,
Remark 2.4.7, does for the separable splitting conditions. -/
theorem isSeparablyTameField_of_isSeparablyPClosed {K : Type*} [Field K] (P : Set ℕ)
    (hP : IsSeparablyPClosed P K) (V : ValuationSubring K)
    (hp : ringExpChar (ResidueField V) ∈ P) :
    IsSeparablyTameField V := by
  sorry

end TauCetiRoadmap.LocalFieldsRamificationPartII
