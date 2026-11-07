module

public import Mathlib
public import TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic
public import TauCeti.RingTheory.Huber.PowerBounded

/-!
# Rigid analytic geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions needed to state them: the affinoid predicate `IsAffinoidAlgebra` (a surjection from a
native Tate algebra, choosing no norm), the strict-radius predicate, the evaluation norm at a
classical point (Mathlib's spectral norm on the maximal-ideal quotient), the supremum seminorm,
the presentation-ring predicate and the numerical slope predicates.

Statable at the pins, and stated below: the algebraic theorems of Layer 1 (noetherianity, the
Jacobson property, Noether normalisation, finiteness of maximal residue fields, the height formula
for affinoid domains, strictness of positive polyradii, the closed-embedding theorem for finite
injective affinoid maps); the supremum theorems of Layer 2 (boundedness, maximum modulus, power
multiplicativity, the nilradical kernel, the uniform value-group exponent, the power-bounded and
topologically nilpotent characterisations, the Banach function algebra theorem, the reduced
quotient criterion for a ring of definition, presentation-ring integrality, Kiehl's almost
noetherianity and its noetherian corollary); and the numerical slope decomposition and projection
of §7.2.

Not statable at the pins, so stated nowhere in this file: classical Tate acyclicity (Layer 5),
which needs the affinoid space `Sp A` with its rational subdomains and structure presheaf; the
quasi-Stein theorem (§7.3), Kiehl's proper mapping theorem with its base-change and formal-functions
statements (§§7.4–7.5) and proper GAGA (§8.4), which need rigid spaces, coherent sheaves on them and
rigid analytification; and the rigid–adic equivalence (§8.3), which needs the rigid category and
the functor to adic spaces. These are README targets with their intended signatures.
-/

namespace TauCetiRoadmap.RigidAnalyticGeometry

noncomputable section

@[expose] public section

open Topology

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- The weighted Tate algebra at polyradius `ρ`: the native restricted subring of
`MvPowerSeries (Fin n) K`, with Tau Ceti's algebra and norm instances. -/
abbrev weightedTate (n : ℕ) (ρ : Fin n → ℝ) :=
  MvPowerSeries.IsRestricted.subring (R := K) ρ

/-- The Tate algebra `Tₙ = K⟨X₁, …, Xₙ⟩`: the weighted Tate algebra at unit polyradius. -/
abbrev TateAlgebra (n : ℕ) := weightedTate K n (fun _ ↦ 1)

local instance unitRadius_pos : Fact (0 < (1 : ℝ)) := ⟨zero_lt_one⟩

/-- `A` is a `K`-affinoid algebra: some Tate algebra surjects onto it as a `K`-algebra. The
predicate chooses no norm or topology (README Convention 3). -/
def IsAffinoidAlgebra (A : Type*) [CommRing A] [Algebra K A] : Prop :=
  ∃ (n : ℕ) (π : TateAlgebra K n →ₐ[K] A), Function.Surjective π

/-- `r` lies in the divisible hull `√|K×|` of the value group: `r > 0` and some positive power of
`r` is the norm of a nonzero scalar. -/
def IsStrictRadius (r : ℝ) : Prop :=
  0 < r ∧ ∃ (m : ℕ) (c : K), 0 < m ∧ c ≠ 0 ∧ r ^ m = ‖c‖

/-! ## Layer 1: affinoid algebras and their topology -/

section Algebra

variable {A : Type*} [CommRing A] [Algebra K A]

/-- Affinoid algebras are noetherian (BGR §6.1.1). -/
theorem isNoetherianRing (hA : IsAffinoidAlgebra K A) : IsNoetherianRing A := by
  sorry

/-- Affinoid algebras are Jacobson rings (BGR §6.1.1). -/
theorem isJacobsonRing (hA : IsAffinoidAlgebra K A) : IsJacobsonRing A := by
  sorry

/-- Noether normalisation: a nonzero affinoid algebra is finite over a Tate algebra through an
injective algebra map (BGR §6.1.2). Nontriviality is necessary: the zero algebra admits no
injection from a Tate algebra. -/
theorem exists_finite_injective [Nontrivial A] (hA : IsAffinoidAlgebra K A) :
    ∃ (d : ℕ) (π : TateAlgebra K d →ₐ[K] A), Function.Injective π ∧
      (letI := π.toRingHom.toAlgebra; Module.Finite (TateAlgebra K d) A) := by
  sorry

/-- Every maximal residue field of an affinoid algebra is finite over `K` (BGR §6.1.2). -/
theorem finite_residue (hA : IsAffinoidAlgebra K A) (x : MaximalSpectrum A) :
    FiniteDimensional K (A ⧸ x.asIdeal) := by
  sorry

/-- In an affinoid domain every maximal ideal has height equal to the Krull dimension (Conrad,
Lemma 2.1.5). The domain hypothesis cannot be weakened to arbitrary reduced affinoids. -/
theorem height_eq_ringKrullDim_of_isDomain [IsDomain A]
    (hA : IsAffinoidAlgebra K A) (x : MaximalSpectrum A) :
    x.asIdeal.height = ringKrullDim A := by
  sorry

/-- The weighted Tate algebra at positive polyradius `ρ` is `K`-affinoid iff every `ρᵢ` lies in
`√|K×|` (BGR §6.1.5). -/
theorem weightedTate_isAffinoid_iff (n : ℕ) (ρ : Fin n → ℝ) (hρ : ∀ i, 0 < ρ i) :
    IsAffinoidAlgebra K (weightedTate K n ρ) ↔ ∀ i, IsStrictRadius K (ρ i) := by
  sorry

end Algebra

/-! ## Layer 2: supremum seminorm, reduction and integral models -/

section Points

variable {A : Type*} [CommRing A] [Algebra K A]

/-- The evaluation norm `|f(x)|` at a classical point `x`: the spectral norm of the image of `f`
in the residue field `A/x`, which is finite over `K` by `finite_residue`. -/
def pointNorm (x : MaximalSpectrum A) (f : A) : ℝ :=
  letI := x.isMaximal
  letI := Ideal.Quotient.field x.asIdeal
  spectralNorm K (A ⧸ x.asIdeal) (Ideal.Quotient.mk x.asIdeal f)

/-- The supremum seminorm `|f|sup = sup_x |f(x)|` over the classical points; the real supremum
is zero for the zero algebra, and its boundedness is the separate target `bddAbove_pointNorm`. -/
def supSeminorm (f : A) : ℝ := ⨆ x : MaximalSpectrum A, pointNorm K x f

/-- The evaluation norms of an element of an affinoid algebra are bounded (BGR §6.2.1). -/
theorem bddAbove_pointNorm (hA : IsAffinoidAlgebra K A) (f : A) :
    BddAbove (Set.range (fun x : MaximalSpectrum A ↦ pointNorm K x f)) := by
  sorry

/-- Maximum modulus principle: on a nonzero affinoid algebra every supremum seminorm is attained
at a classical point (BGR §6.2.1). -/
theorem exists_pointNorm_eq_supSeminorm [Nontrivial A]
    (hA : IsAffinoidAlgebra K A) (f : A) :
    ∃ x : MaximalSpectrum A, pointNorm K x f = supSeminorm K f := by
  sorry

/-- The supremum seminorm is power multiplicative for positive exponents, including on the zero
algebra; exponent zero fails there. -/
theorem supSeminorm_pow (hA : IsAffinoidAlgebra K A) (f : A) (n : ℕ) (hn : 0 < n) :
    supSeminorm K (f ^ n) = supSeminorm K f ^ n := by
  sorry

/-- The kernel of the supremum seminorm is the nilradical (BGR §6.2.1). -/
theorem supSeminorm_eq_zero_iff (hA : IsAffinoidAlgebra K A) (f : A) :
    supSeminorm K f = 0 ↔ IsNilpotent f := by
  sorry

/-- One exponent `m ≥ 1`, depending only on `A`, with `|f|sup^m ∈ |K|` for every `f`, including
the elements of supremum zero (BGR §6.2.1). -/
theorem exists_uniform_valueGroup_exponent (hA : IsAffinoidAlgebra K A) :
    ∃ m : ℕ, 0 < m ∧ ∀ f : A, ∃ c : K, supSeminorm K f ^ m = ‖c‖ := by
  sorry

end Points

section Normed

variable {A : Type*} [NormedCommRing A] [NormedAlgebra K A]
  [IsUltrametricDist A] [CompleteSpace A]

/-- Every finite injective map of affinoid algebras, each carrying a complete algebra norm, is a
closed topological embedding (BGR §3.7.3 with the norm equivalence of §6.1.3); continuity is part
of the conclusion. -/
theorem isClosedEmbedding_of_finite_injective {B : Type*} [NormedCommRing B] [NormedAlgebra K B]
    [IsUltrametricDist B] [CompleteSpace B]
    (hA : IsAffinoidAlgebra K A) (hB : IsAffinoidAlgebra K B) (φ : A →ₐ[K] B)
    (hinj : Function.Injective φ)
    (hfin : letI := φ.toRingHom.toAlgebra; Module.Finite A B) :
    IsClosedEmbedding φ := by
  sorry

/-- `A° = {f : |f|sup ≤ 1}` for an affinoid algebra with a complete algebra norm (BGR §6.2.3). -/
theorem powerBounded_iff (hA : IsAffinoidAlgebra K A) (f : A) :
    TauCeti.Huber.IsPowerBounded f ↔ supSeminorm K f ≤ 1 := by
  sorry

/-- `A°° = {f : |f|sup < 1}` for an affinoid algebra with a complete algebra norm
(BGR §6.2.3). -/
theorem topologicallyNilpotent_iff (hA : IsAffinoidAlgebra K A) (f : A) :
    IsTopologicallyNilpotent f ↔ supSeminorm K f < 1 := by
  sorry

/-- Banach function algebra theorem: on a reduced affinoid algebra every complete algebra norm is
equivalent to the supremum norm (BGR §6.2.4). -/
theorem banachFunctionAlgebra [IsReduced A] (hA : IsAffinoidAlgebra K A) :
    ∃ C : ℝ, 0 < C ∧ ∀ f : A,
      supSeminorm K f ≤ ‖f‖ ∧ ‖f‖ ≤ C * supSeminorm K f := by
  sorry

/-- Reduced quotient of a ring of definition: an open bounded subring `B` containing a
topologically nilpotent unit `ϖ` of `A` with `B/ϖB` reduced is exactly `{f : |f|sup ≤ 1}`
(Fujiwara–Kato, Proposition B.1.3(1), with the supremum identification of §2.2). The unit is an
element of `B`, not necessarily a scalar in `K`. -/
theorem mem_iff_supSeminorm_le_one_of_isReduced (hA : IsAffinoidAlgebra K A)
    (B : Subring A) (hBo : IsOpen (B : Set A)) (hBb : Bornology.IsBounded (B : Set A))
    (ϖ : B) (hϖu : IsUnit (ϖ : A))
    (hϖ : IsTopologicallyNilpotent (ϖ : A))
    (hred : IsReduced (B ⧸ Ideal.span {ϖ})) (f : A) :
    f ∈ B ↔ supSeminorm K f ≤ 1 := by
  sorry

end Normed

section IntegralModels

variable {A : Type*} [CommRing A] [Algebra K A]

/-- `S` is the presentation ring `A₀ = π(Tₙ°)` of the surjection `π`: the image of the Gauss unit
ball, described by membership; no norm instance on `A` is invented. -/
def IsPresentationRing {n : ℕ} (π : TateAlgebra K n →ₐ[K] A) (S : Subring A) : Prop :=
  ∀ a : A, a ∈ S ↔ ∃ t, ‖t‖ ≤ 1 ∧ π t = a

/-- Presentation-ring integrality: the elements integral over `A₀` are exactly those of supremum
seminorm at most one, including in nonreduced algebras (BGR §6.3.4). -/
theorem integral_iff_supSeminorm_le_one {n : ℕ} (π : TateAlgebra K n →ₐ[K] A)
    (hπ : Function.Surjective π) (S : Subring A) (hS : IsPresentationRing K π S) (a : A) :
    IsIntegral S a ↔ supSeminorm K a ≤ 1 := by
  sorry

/-- Kiehl's almost noetherianity (Kiehl-E, Satz 5.1): for a finite `A₀`-module `M`, a submodule
`N` and `0 < ε < 1`, one finitely generated `N' ⊆ N` contains `cN` for every scalar `c ∈ K`
with `|c| ≤ ε`. -/
theorem exists_fg_smul_le_of_presentation {n : ℕ} (π : TateAlgebra K n →ₐ[K] A)
    (hπ : Function.Surjective π) (S : Subring A) (hS : IsPresentationRing K π S)
    {M : Type*} [AddCommGroup M] [Module S M] [Module.Finite S M]
    (N : Submodule S M) (ε : ℝ) (hε₀ : 0 < ε) (hε₁ : ε < 1) :
    ∃ N' : Submodule S M, N'.FG ∧ N' ≤ N ∧
      ∀ s : S, (∃ c : K, ‖c‖ ≤ ε ∧ (s : A) = algebraMap K A c) →
        ∀ x ∈ N, s • x ∈ N' := by
  sorry

/-- For discretely valued `K` (the norms below one are bounded away from one), presentation rings
are noetherian (Kiehl-E, §5). -/
theorem isNoetherian_of_presentation_of_discrete
    (hK : ∃ ρ : ℝ, ρ < 1 ∧ ∀ c : K, ‖c‖ < 1 → ‖c‖ ≤ ρ)
    {n : ℕ} (π : TateAlgebra K n →ₐ[K] A) (hπ : Function.Surjective π)
    (S : Subring A) (hS : IsPresentationRing K π S) : IsNoetherianRing S := by
  sorry

end IntegralModels

/-! ## Layer 7: numerical slopes -/

section NumericalSlopes

universe u

variable {K : Type u} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- `Q ∈ A[X]` has slope at least `r > 0`: under every `K`-algebra map `χ : A → L` to an algebraic
extension `L/K`, every root of `χ(Q)` has spectral norm at least `r`. This is a cutoff on
annihilator roots, not on the roots of a Fredholm series (Urban §2.3). -/
def IsSlopeLE {A : Type u} [CommRing A] [Algebra K A] (r : ℝ) (Q : Polynomial A) : Prop :=
  0 < r ∧ ∀ (L : Type u) [Field L] [Algebra K L] [Algebra.IsAlgebraic K L]
    (χ : A →ₐ[K] L) (α : L),
    (Q.map (χ : A →+* L)).IsRoot α → r ≤ spectralNorm K L α

/-- `(M₁, M₂)` is a slope-`≤ r` decomposition of `M` for `U`: a continuously split `U`-stable
complement, `M₁` finite projective and annihilated by a monic polynomial with unit constant term
of slope at least `r`, and every such polynomial acting bijectively on `M₂` (Urban §2.3). -/
def IsSlopeDecomposition {A : Type u} [NormedCommRing A] [NormedAlgebra K A]
    {M : Type*} [NormedAddCommGroup M] [Module A M] (U : M →L[A] M) (r : ℝ)
    (M₁ M₂ : Submodule A M) : Prop :=
  0 < r ∧
    (∃ h : IsCompl M₁ M₂, Continuous (Submodule.projectionOnto M₁ M₂ h)) ∧
    (∀ x ∈ M₁, U x ∈ M₁) ∧ (∀ x ∈ M₂, U x ∈ M₂) ∧
    Module.Finite A M₁ ∧ Module.Projective A M₁ ∧
    (∃ Q : Polynomial A, Q.Monic ∧ IsUnit (Q.coeff 0) ∧ IsSlopeLE (K := K) r Q ∧
      ∀ x ∈ M₁, Polynomial.aeval (U : M →ₗ[A] M) Q x = 0) ∧
    ∀ P : Polynomial A, P.Monic → IsUnit (P.coeff 0) → IsSlopeLE (K := K) r P →
      Set.BijOn (Polynomial.aeval (U : M →ₗ[A] M) P) M₂ M₂

/-- A slope decomposition has a continuous idempotent with image `M₁` and kernel `M₂` commuting
with `U`, built from the continuous complementary projection, independently of Fredholm
theory. -/
theorem IsSlopeDecomposition.exists_projection {A : Type u} [NormedCommRing A]
    [NormedAlgebra K A] {M : Type*} [NormedAddCommGroup M] [Module A M]
    {U : M →L[A] M} {r : ℝ} {M₁ M₂ : Submodule A M}
    (h : IsSlopeDecomposition (K := K) U r M₁ M₂) :
    ∃ P : M →L[A] M, P.comp P = P ∧ LinearMap.range (P : M →ₗ[A] M) = M₁ ∧
      LinearMap.ker (P : M →ₗ[A] M) = M₂ ∧ P.comp U = U.comp P := by
  sorry

end NumericalSlopes

end

end

end TauCetiRoadmap.RigidAnalyticGeometry
