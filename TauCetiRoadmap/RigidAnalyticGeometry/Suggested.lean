module

public import Mathlib
public import TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic
public import TauCeti.RingTheory.Huber.PowerBounded

/-!
# Rigid analytic geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them: the Tate algebra as the native restricted subring at unit
polyradius, the affinoid predicate (a proposition that selects no norm), strict radii, point norms
and the supremum seminorm, the presentation ring, and the numerical slope predicates consumed by
LocallyAnalyticDistributions §4.16. Every definition has a real body on a pinned carrier.

Headline theorems not statable at the pins, and what each lacks:

* classical Tate acyclicity and the sheaf property of the structure presheaf (Layer 5): no `Sp A`
  with its rational basis and structure presheaf;
* Kiehl's finiteness theorem for proper morphisms, quasi-Stein Theorem B and proper GAGA
  (Layer 7, §8.4): no `RigidSpace` and no coherent sheaves on it;
* Huber's rigid–adic equivalence on quasi-separated spaces (§8.3): no `RigidSpace`;
* faithful flatness of `A → A ⊗̂_K L` and the complete field extension of finite modules (§1.3):
  no completed tensor product of Banach algebras;
* excellence of affinoid algebras and of analytic local rings (§1.2, §8.1): no excellence
  predicate in Mathlib.
-/

public section

namespace TauCetiRoadmap.RigidAnalyticGeometry

noncomputable section

open scoped Topology

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-! ## Layer 0: shared Tate inputs and weak stability -/

/-- The native carrier of restricted series of polyradius `ρ`, with Tau Ceti's algebra and norm
instances. -/
abbrev weightedTate (n : ℕ) (ρ : Fin n → ℝ) :=
  MvPowerSeries.IsRestricted.subring (R := K) ρ

/-- The Tate algebra `Tₙ = K⟨X₁,…,Xₙ⟩`: restricted series at unit polyradius. -/
abbrev TateAlgebra (n : ℕ) := weightedTate K n (fun _ ↦ 1)

local instance unitRadius_pos : Fact (0 < (1 : ℝ)) := ⟨zero_lt_one⟩

/-- Finite normalisation of the Tate algebra, in every characteristic: the integral closure of
`Tₙ` in a finite extension `L` of its fraction field is a finite `Tₙ`-module ([BGR] 5.3.1 and
3.5.3 through the Japanese-ring criterion; the inseparable step is [BGR] 4.1 and 4.4). -/
theorem integralClosure_finite (n : ℕ) (L : Type*) [Field L]
    [Algebra (FractionRing (TateAlgebra K n)) L]
    [FiniteDimensional (FractionRing (TateAlgebra K n)) L]
    [Algebra (TateAlgebra K n) L]
    [IsScalarTower (TateAlgebra K n) (FractionRing (TateAlgebra K n)) L] :
    Module.Finite (TateAlgebra K n) (integralClosure (TateAlgebra K n) L) := by
  sorry

/-! ## Layer 1: affinoid algebras and their topology -/

/-- `A` is affinoid over `K` when some Tate algebra surjects onto it as a `K`-algebra. The
predicate makes no choice of norm or topology (README Convention 3). -/
def IsAffinoidAlgebra (A : Type*) [CommRing A] [Algebra K A] : Prop :=
  ∃ (n : ℕ) (π : TateAlgebra K n →ₐ[K] A), Function.Surjective π

/-- A positive real in the divisible hull `√|K×|` of the value group. Positivity excludes zero. -/
def IsStrictRadius (r : ℝ) : Prop :=
  0 < r ∧ ∃ (m : ℕ) (c : K), 0 < m ∧ c ≠ 0 ∧ r ^ m = ‖c‖

section Algebra

variable {A : Type*} [CommRing A] [Algebra K A]

/-- Affinoid algebras are noetherian ([BGR] 6.1.1). -/
theorem isNoetherianRing (hA : IsAffinoidAlgebra K A) : IsNoetherianRing A := by
  sorry

/-- Affinoid algebras are Jacobson rings ([BGR] 6.1.1). -/
theorem isJacobsonRing (hA : IsAffinoidAlgebra K A) : IsJacobsonRing A := by
  sorry

/-- Noether normalisation ([BGR] 6.1.2): a nonzero affinoid algebra is finite and injective over
some Tate algebra `T_d`. Nontriviality is necessary for the injective normalisation map. -/
theorem exists_finite_injective [Nontrivial A] (hA : IsAffinoidAlgebra K A) :
    ∃ (d : ℕ) (π : TateAlgebra K d →ₐ[K] A), Function.Injective π ∧
      (letI := π.toRingHom.toAlgebra; Module.Finite (TateAlgebra K d) A) := by
  sorry

/-- Every maximal residue field of an affinoid algebra is finite over `K` ([BGR] 6.1.2). -/
theorem finite_residue (hA : IsAffinoidAlgebra K A) (x : MaximalSpectrum A) :
    FiniteDimensional K (A ⧸ x.asIdeal) := by
  sorry

/-- In an affinoid domain every maximal ideal has height equal to the Krull dimension ([Conrad],
Lemma 2.1.5). The domain hypothesis cannot be weakened to arbitrary reduced affinoids. -/
theorem height_eq_ringKrullDim_of_isDomain [IsDomain A]
    (hA : IsAffinoidAlgebra K A) (x : MaximalSpectrum A) :
    x.asIdeal.height = ringKrullDim A := by
  sorry

/-- The strict-radius criterion ([BGR] 6.1.5): the weighted Tate algebra of positive polyradius
`ρ` is affinoid exactly when every `ρᵢ` lies in `√|K×|`. -/
theorem weightedTate_isAffinoid_iff (n : ℕ) (ρ : Fin n → ℝ) (hρ : ∀ i, 0 < ρ i) :
    IsAffinoidAlgebra K (weightedTate K n ρ) ↔ ∀ i, IsStrictRadius K (ρ i) := by
  sorry

end Algebra

section Topology

variable {A : Type*} [NormedCommRing A] [NormedAlgebra K A] [IsUltrametricDist A] [CompleteSpace A]

/-- Automatic continuity ([BGR] 3.7.5 and 6.1.3): every `K`-algebra homomorphism from a
noetherian Banach `K`-algebra `B` into an affinoid algebra `A`, carrying any complete algebra norm,
is continuous. With `B = A` this gives the independence of the Banach topology from the
presentation. -/
theorem continuous_algHom_of_isNoetherianRing {B : Type*} [NormedCommRing B] [NormedAlgebra K B]
    [IsUltrametricDist B] [CompleteSpace B] [IsNoetherianRing B]
    (hA : IsAffinoidAlgebra K A) (φ : B →ₐ[K] A) : Continuous φ := by
  sorry

/-- A finite injective homomorphism of affinoid algebras, each carrying a complete algebra norm, is
a closed topological embedding ([BGR] 3.7.3 and 6.1.3, with the open mapping theorem).
Continuity is part of the conclusion; equality of norms is not asserted. -/
theorem isClosedEmbedding_of_finite_injective {B : Type*} [NormedCommRing B] [NormedAlgebra K B]
    [IsUltrametricDist B] [CompleteSpace B]
    (hA : IsAffinoidAlgebra K A) (hB : IsAffinoidAlgebra K B) (φ : A →ₐ[K] B)
    (hinj : Function.Injective φ)
    (hfin : letI := φ.toRingHom.toAlgebra; Module.Finite A B) :
    Topology.IsClosedEmbedding φ := by
  sorry

end Topology

/-! ## Layer 2: supremum seminorm, reduction and integral models -/

section Points

variable {A : Type*} [CommRing A] [Algebra K A]

/-- The value `|f(x)|` at a classical point: the spectral norm of the residue class of `f` in the
maximal-ideal quotient, the unique extension of `|·|` once that quotient is known to be finite
over `K`. -/
def pointNorm (x : MaximalSpectrum A) (f : A) : ℝ :=
  letI := x.isMaximal
  letI := Ideal.Quotient.field x.asIdeal
  spectralNorm K (A ⧸ x.asIdeal) (Ideal.Quotient.mk x.asIdeal f)

/-- The supremum seminorm `|f|sup = sup_x |f(x)|` over classical points; the real supremum of an
empty or unbounded family is zero, and boundedness is a separate theorem. -/
def supSeminorm (f : A) : ℝ := ⨆ x : MaximalSpectrum A, pointNorm K x f

/-- Point norms of an element of an affinoid algebra are bounded ([BGR] 6.2.1). -/
theorem bddAbove_pointNorm (hA : IsAffinoidAlgebra K A) (f : A) :
    BddAbove (Set.range (fun x : MaximalSpectrum A ↦ pointNorm K x f)) := by
  sorry

/-- The maximum modulus principle ([BGR] 6.2.1): on a nonzero affinoid algebra the supremum
seminorm is attained at a classical point. -/
theorem exists_pointNorm_eq_supSeminorm [Nontrivial A]
    (hA : IsAffinoidAlgebra K A) (f : A) :
    ∃ x : MaximalSpectrum A, pointNorm K x f = supSeminorm K f := by
  sorry

/-- The supremum seminorm is power-multiplicative for positive exponents, including on the zero
algebra. -/
theorem supSeminorm_pow (hA : IsAffinoidAlgebra K A) (f : A) (n : ℕ) (hn : 0 < n) :
    supSeminorm K (f ^ n) = supSeminorm K f ^ n := by
  sorry

/-- The kernel of the supremum seminorm is the nilradical ([BGR] 6.2.1). -/
theorem supSeminorm_eq_zero_iff (hA : IsAffinoidAlgebra K A) (f : A) :
    supSeminorm K f = 0 ↔ IsNilpotent f := by
  sorry

/-- The value-group theorem ([BGR] 6.2.1): one exponent `m ≥ 1` for the whole affinoid algebra
puts every `|f|sup^m` in `|K|`, including the elements of supremum zero. -/
theorem exists_uniform_valueGroup_exponent (hA : IsAffinoidAlgebra K A) :
    ∃ m : ℕ, 0 < m ∧ ∀ f : A, ∃ c : K, supSeminorm K f ^ m = ‖c‖ := by
  sorry

end Points

section Normed

variable {A : Type*} [NormedCommRing A] [NormedAlgebra K A]
  [IsUltrametricDist A] [CompleteSpace A]

/-- `A° = {f : |f|sup ≤ 1}` ([BGR] 6.2.3): power-boundedness for any complete algebra norm
on an affinoid algebra is the supremum bound. -/
theorem powerBounded_iff (hA : IsAffinoidAlgebra K A) (f : A) :
    TauCeti.Huber.IsPowerBounded f ↔ supSeminorm K f ≤ 1 := by
  sorry

/-- `A°° = {f : |f|sup < 1}` ([BGR] 6.2.3). -/
theorem topologicallyNilpotent_iff (hA : IsAffinoidAlgebra K A) (f : A) :
    IsTopologicallyNilpotent f ↔ supSeminorm K f < 1 := by
  sorry

/-- The Banach function algebra theorem ([BGR] 6.2.4): on a reduced affinoid algebra every
complete algebra norm is equivalent to the supremum norm. -/
theorem banachFunctionAlgebra [IsReduced A] (hA : IsAffinoidAlgebra K A) :
    ∃ C : ℝ, 0 < C ∧ ∀ f : A,
      supSeminorm K f ≤ ‖f‖ ∧ ‖f‖ ≤ C * supSeminorm K f := by
  sorry

/-- The affinoid ring-of-definition criterion supplied to AdicSpacesPartII R0.9 ([FK] B.1.3(1)
with the supremum identification): an open bounded subring `B` containing a topologically
nilpotent unit `ϖ` of `A` with `B/ϖB` reduced is exactly `A°`. The unit is an element of the ring
of definition, not necessarily a scalar in `K`. -/
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

/-- `S` is the presentation ring `A₀ = π(Tₙ°)` of the presentation `π`: the image of the Gauss
unit ball. Membership is characterised; no norm on `A` is invented. -/
def IsPresentationRing {n : ℕ} (π : TateAlgebra K n →ₐ[K] A) (S : Subring A) : Prop :=
  ∀ a : A, a ∈ S ↔ ∃ t, ‖t‖ ≤ 1 ∧ π t = a

/-- `A°` is the integral closure of the presentation ring, including for nonreduced `A`
([BGR] 6.3.4). -/
theorem integral_iff_supSeminorm_le_one {n : ℕ} (π : TateAlgebra K n →ₐ[K] A)
    (hπ : Function.Surjective π) (S : Subring A) (hS : IsPresentationRing K π S) (a : A) :
    IsIntegral S a ↔ supSeminorm K a ≤ 1 := by
  sorry

/-- Almost noetherianity of finite modules over a presentation ring ([Kiehl-E] Satz 5.1,
AdicSpacesPartIII R3.6): one finitely generated submodule `N' ⊆ N` absorbs `c·N` for every scalar
`c ∈ K` with `|c| ≤ ε`. -/
theorem exists_fg_smul_le_of_presentation {n : ℕ} (π : TateAlgebra K n →ₐ[K] A)
    (hπ : Function.Surjective π) (S : Subring A) (hS : IsPresentationRing K π S)
    {M : Type*} [AddCommGroup M] [Module S M] [Module.Finite S M]
    (N : Submodule S M) (ε : ℝ) (hε₀ : 0 < ε) (hε₁ : ε < 1) :
    ∃ N' : Submodule S M, N'.FG ∧ N' ≤ N ∧
      ∀ s : S, (∃ c : K, ‖c‖ ≤ ε ∧ (s : A) = algebraMap K A c) →
        ∀ x ∈ N, s • x ∈ N' := by
  sorry

/-- Over a discretely valued `K` the presentation ring is noetherian ([Kiehl-E] §5). -/
theorem isNoetherian_of_presentation_of_discrete
    (hK : ∃ ρ : ℝ, ρ < 1 ∧ ∀ c : K, ‖c‖ < 1 → ‖c‖ ≤ ρ)
    {n : ℕ} (π : TateAlgebra K n →ₐ[K] A) (hπ : Function.Surjective π)
    (S : Subring A) (hS : IsPresentationRing K π S) : IsNoetherianRing S := by
  sorry

end IntegralModels

/-! ## Layer 7: coherent sheaves and proper cohomology -/

section NumericalSlopes

universe u

variable {K : Type u} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- `Q` has slope at most `r`: `r > 0`, and for every `K`-algebra map `χ : A → L` into an
algebraic extension of `K`, every root of `χ(Q)` has absolute value at least `r` under the unique
extended absolute value. This is a cutoff on annihilator roots, not on Fredholm-series roots
([Urban] 2.3.1, in reciprocal form). -/
def IsSlopeLE {A : Type u} [CommRing A] [Algebra K A] (r : ℝ) (Q : Polynomial A) : Prop :=
  0 < r ∧ ∀ (L : Type u) [Field L] [Algebra K L] [Algebra.IsAlgebraic K L]
    (χ : A →ₐ[K] L) (α : L),
    (Q.map (χ : A →+* L)).IsRoot α → r ≤ spectralNorm K L α

/-- A slope-`≤ r` decomposition of `U` on `M` into `M₁ ⊕ M₂` ([Urban] 2.3.1): continuously
split, `U`-stable, `M₁` finite projective and annihilated by a monic polynomial of slope at most
`r` with unit constant term, and every such polynomial acting bijectively on `M₂`. This is the
module-level condition consumed by LocallyAnalyticDistributions §4.16. -/
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

/-- The slope projector: a slope decomposition yields a continuous idempotent commuting with `U`,
of image `M₁` and kernel `M₂` ([Urban] 2.3.2–2.3.3). -/
theorem IsSlopeDecomposition.exists_projection {A : Type u} [NormedCommRing A]
    [NormedAlgebra K A] {M : Type*} [NormedAddCommGroup M] [Module A M]
    {U : M →L[A] M} {r : ℝ} {M₁ M₂ : Submodule A M}
    (h : IsSlopeDecomposition (K := K) U r M₁ M₂) :
    ∃ P : M →L[A] M, P.comp P = P ∧ LinearMap.range (P : M →ₗ[A] M) = M₁ ∧
      LinearMap.ker (P : M →ₗ[A] M) = M₂ ∧ P.comp U = U.comp P := by
  sorry

end NumericalSlopes

end

end TauCetiRoadmap.RigidAnalyticGeometry
