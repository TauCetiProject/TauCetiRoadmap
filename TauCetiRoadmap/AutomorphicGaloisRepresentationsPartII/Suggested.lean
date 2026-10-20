import Mathlib
import TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Basic

/-!
# Automorphic Galois representations, part II: representative target signatures

The README is the definitive roadmap. These are suggested forms, not an exhaustive checklist.
The file records light definitions and milestones statable against the pinned Mathlib APIs.
Automorphic representations, geometric realizations, period comparisons and compatible systems
are specified in the README. Geometric Frobenius and `HT(ε) = −1` fix the numerical conventions.
AG2.0's `fieldOfRationality` abbreviates AutomorphicFormsOnReductiveGroups §5.7's
`rationalityField` on the smooth finite part, with its scalar twist/conjugation laws and
Clozel finiteness for regular algebraic cuspidal representations in cohomological normalization.
SmallRamificationAndAbelianVarietyBaseCases §5.0d supplies `AutomorphicSystemData`, its raw
operations and convention adapters. AG2.P provides compatibility predicates on that carrier
and their preservation; AG2.6 provides automorphic systems with the stated branch hypotheses.
AG2.P's `arithmeticPadicMonodromy` specializes PadicHodgeTheory §5.1 on the common Robba
realization of LocalGaloisDeformationRings §0.4. Its `finiteCoefficientPeriodAPI` and
`periodBaseChange` retain the supplied filtered comparisons and coefficient embeddings;
`potentiallySemistableWD` uses NeronModelsAndSemistableAbelianVarieties §5.3's
`PadicWeilDeligneRealization`, with geometric Frobenius and both monodromy normalizations.
EtaleDualityAndPerverseSheaves §§3.1–3.2 and 6.1–6.5 supply
`TauCeti.EtaleDuality.CohCorr.rgammac`, `.comp`, `.pushforward`, `.traceMap`, `.localTerm`
and `fujiwaraVarshavskyTraceFormula` at finite, integral and rational coefficients.
AG2.P's `correspondenceTraceCoefficientLimit` identifies the normalized systems used here
with these objects; AG2.1a provides the PEL/Hecke lifts and projector comparison.
AG2.6 supplies relative curves, `BunG`, `DLisBunG`, `HeckeFunctor`, `parameterStack` and
`geometricSpectralAction` before their AHTW specialization. Its
`globalStablePeriodQuotients` controls actual local restrictions of a globally semisimple
representation. `BoundedLGC` retains both that global stable Cayley–Hamilton factorization
and the local type/Bernstein factorization through boundary comparison and degree shifting.
The algebraic-character target uses the maximal subfield that is imaginary CM or totally real,
with identity conjugation in the totally real case; Mathlib's `NumberField.IsCMField`
continues to mean an imaginary CM field.
-/

namespace TauCeti.AutomorphicGalois

open Polynomial
open scoped BigOperators Classical

/-! ## Rank-`n` construction from the HLTT boundary family -/

/-- HLTT factor separation constructs both rank-`n` semisimple representations with the
prescribed dense-set Frobenius polynomials from the rank-`2n` boundary family. -/
theorem hlttFactorSeparation
    {G K : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [Field K] [CharZero K] [IsAlgClosed K] [TopologicalSpace K]
    [IsTopologicalDivisionRing K] [T2Space K]
    (n : ℕ) (hn : 0 < n) (D : Set G) (hD : Dense D)
    (μ : G →* Kˣ) (hμ : Continuous μ)
    (horder : ∀ g : D, ¬ IsOfFinOrder (μ g))
    (α β : D → Fin n → Kˣ) (M : Set ℤ) (hM : M.Infinite)
    (R : M → G →* Matrix.GeneralLinearGroup (Fin (2 * n)) K)
    (hR : ∀ m, Continuous (R m))
    (hss : ∀ m, Representation.IsSemisimpleRepresentation
      (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp (R m))) :
        Representation K G (Fin (2 * n) → K)))
    (hpoly : ∀ (m : M) (g : D), ((R m g).val).charpoly =
      (∏ i, (X - C (α g i : K))) *
        ∏ i, (X - C ((β g i * μ g ^ (m : ℤ) : Kˣ) : K))) :
    ∃ r₁ r₂ : G →* Matrix.GeneralLinearGroup (Fin n) K,
      Continuous r₁ ∧ Continuous r₂ ∧
      Representation.IsSemisimpleRepresentation
        (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp r₁)) :
          Representation K G (Fin n → K)) ∧
      Representation.IsSemisimpleRepresentation
        (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp r₂)) :
          Representation K G (Fin n → K)) ∧
      ∀ g : D, ((r₁ g).val).charpoly = ∏ i, (X - C (α g i : K)) ∧
        ((r₂ g).val).charpoly = ∏ i, (X - C (β g i : K)) := sorry

/-- Continuous semisimple representations with the same characteristic polynomials on a
dense set are isomorphic; this gives uniqueness of good-place attachment. -/
theorem goodPolynomial_unique
    {G K : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [Field K] [CharZero K] [IsAlgClosed K] [TopologicalSpace K]
    [IsTopologicalDivisionRing K] [T2Space K] {n : ℕ}
    (D : Set G) (hD : Dense D)
    (r s : G →* Matrix.GeneralLinearGroup (Fin n) K)
    (hr : Continuous r) (hs : Continuous s)
    (hrss : Representation.IsSemisimpleRepresentation
      (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp r)) :
        Representation K G (Fin n → K)))
    (hsss : Representation.IsSemisimpleRepresentation
      (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp s)) :
        Representation K G (Fin n → K)))
    (hpoly : ∀ g ∈ D, ((r g).val).charpoly = ((s g).val).charpoly) :
    ∃ u : Matrix.GeneralLinearGroup (Fin n) K, ∀ g, s g = u * r g * u⁻¹ := sorry

#check NumberField.IsCMField.complexEmbedding_complexConj
#check Multiset.prod_X_sub_C_coeff
#check Matrix.charpoly_map
#check Matrix.charpoly_units_conj

/-! ## Layer AG2.0: dominant coordinates and labelled Hodge weights -/

/-- One pinned Tau Ceti dominant GLₙ weight per embedding. -/
def DominantWeight (n : ℕ) (ι : Type*) : Type _ := ι → TauCeti.DominantWeight n

namespace DominantWeight

variable {n : ℕ} {ι : Type*}

/-- Conjugate coordinates sum to `w`. -/
def IsInW (c : ι → ι) (w : ℤ) (a : DominantWeight n ι) : Prop :=
  ∀ τ (i : Fin n), (a τ).1 i + (a (c τ)).1 i.rev = w

/-- Pull coordinates back along restriction of embeddings. -/
def baseChange {ι' : Type*} (f : ι' → ι) (a : DominantWeight n ι) : DominantWeight n ι' :=
  fun τ => a (f τ)

/-- Form the weight from antitone coordinates. -/
def mk (a : ι → Fin n → ℤ) (ha : ∀ τ, Antitone (a τ)) : DominantWeight n ι :=
  fun τ => ⟨a τ, ha τ⟩

/-- At some embedding, equal-sized subsets of shifted coordinates have distinct sums. -/
def IsExtremelyRegular (a : DominantWeight n ι) : Prop :=
  ∃ τ, ∀ H H' : Finset (Fin n), H.card = H'.card →
    (∑ i ∈ H, ((a τ).1 i + ((n - 1 - i : ℕ) : ℤ))) = (∑ i ∈ H', ((a τ).1 i + ((n - 1 - i : ℕ) : ℤ))) → H = H'

/-- Pullback along a conjugation-compatible map preserves the common weight. -/
theorem isInW_baseChange {ι' : Type*} (c : ι → ι) (c' : ι' → ι') (f : ι' → ι)
    (hf : ∀ τ, f (c' τ) = c (f τ)) {w : ℤ} {a : DominantWeight n ι} (h : a.IsInW c w) :
    (a.baseChange f).IsInW c' w := sorry

/-- Dominant weights are determined by their embedding-wise coordinates. -/
@[ext] theorem ext {a b : DominantWeight n ι}
    (h : ∀ τ i, (a τ).1 i = (b τ).1 i) : a = b := sorry

/-- Pullback along the identity leaves a dominant weight unchanged. -/
@[simp] theorem baseChange_id (a : DominantWeight n ι) : a.baseChange id = a := sorry

/-- Successive embedding pullbacks agree with pullback along the composite. -/
theorem baseChange_comp {ι' ι'' : Type*} (f : ι' → ι) (g : ι'' → ι')
    (a : DominantWeight n ι) : (a.baseChange f).baseChange g = a.baseChange (f ∘ g) := sorry

/-- Powers of two have distinct subset sums. -/
theorem extremelyRegular_binary : IsExtremelyRegular
    (fun _ : Unit => ⟨![5, 2, 1, 1], by
      intro i j hij; fin_cases i <;> fin_cases j <;> simp_all⟩ : DominantWeight 4 Unit) := sorry

/-- Shifted entries `3,2,1,0` fail extreme regularity since `3+0=2+1`. -/
theorem not_extremelyRegular_parallel : ¬ IsExtremelyRegular
    (fun _ : Unit => ⟨(0 : Fin 4 → ℤ), by intro i j _; rfl⟩ : DominantWeight 4 Unit) := sorry

/-- An empty embedding index cannot witness extreme regularity, even in rank zero. -/
example {n : ℕ} (a : DominantWeight n Empty) : ¬ IsExtremelyRegular a := by
  rintro ⟨τ, _⟩
  exact τ.elim

/-- In rank one a nonempty embedding index suffices. -/
example {ι : Type*} [Nonempty ι] (a : DominantWeight 1 ι) : IsExtremelyRegular a := by
  obtain ⟨τ⟩ := ‹Nonempty ι›
  refine ⟨τ, ?_⟩
  intro H H' hcard _
  fin_cases H <;> fin_cases H' <;> simp_all

end DominantWeight

/-- The dominant rank-two vector `(x,y)`, with `y≤x`. -/
def mk2 (x y : ℤ) (h : y ≤ x) : TauCeti.DominantWeight 2 :=
  ⟨![x, y], by intro i j hij; fin_cases i <;> fin_cases j <;> simp_all⟩

/-- Test `DominantWeight.isInW_classical`: the weight `(k − 2, 0)` of a classical weight-`k` form lies in `(ℤ²)_{k−2}`
(one embedding, conjugation trivial). -/
example (k : ℤ) (hk : 2 ≤ k) :
    DominantWeight.IsInW id (k - 2) (fun _ : Unit => mk2 (k - 2) 0 (by omega) : DominantWeight 2 Unit) := by
  intro τ i
  fin_cases i <;> simp [mk2, Fin.rev]

/-- Test `DominantWeight.not_isInW_unpaired`: `a_τ = (1, 0)`, `a_{cτ} = (0, 0)` lies in no `(ℤ²)_w`. -/
example : ¬ ∃ w, DominantWeight.IsInW (fun b => !b) w
    (fun b : Bool => if b then mk2 1 0 (by norm_num) else mk2 0 0 le_rfl : DominantWeight 2 Bool) := by
  rintro ⟨w, h⟩
  have h1 := h true 0
  have h2 := h true 1
  simp [mk2, Fin.rev] at h1 h2
  omega

/-- The multiset `a(i)+n−1−i`, with `HT(ε)=−1`. -/
def expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) : Multiset ℤ :=
  Multiset.map (fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ)) Finset.univ.val

/-- The Hodge shift makes antitone highest-weight coordinates strictly antitone. -/
theorem expectedHodgeTate_strictAnti {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    StrictAnti fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ) := sorry

/-- The labelled Hodge multiset has one entry for each coordinate. -/
@[simp] theorem expectedHodgeTate_card {n : ℕ} (a : Fin n → ℤ) :
    (expectedHodgeTate a).card = n := sorry

/-- Dominance ensures that the shifted Hodge multiset has no repetitions. -/
theorem expectedHodgeTate_nodup {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    (expectedHodgeTate a).Nodup := sorry

/-- Conjugate Hodge coordinates are paired around the sum `w+n−1`. -/
theorem expectedHodgeTate_conj {n : ℕ} {ι : Type*} (c : ι → ι) {w : ℤ} {a : DominantWeight n ι}
    (h : a.IsInW c w) (τ : ι) (i : Fin n) :
    (a (c τ)).1 i + ((n - 1 - i : ℕ) : ℤ) =
      (w + ((n - 1 : ℕ) : ℤ)) - ((a τ).1 i.rev + ((n - 1 - i.rev : ℕ) : ℤ)) := sorry

/-- A constant weight translation translates every labelled Hodge number. -/
theorem expectedHodgeTate_twist {n : ℕ} (a : Fin n → ℤ) (t : ℤ) :
    expectedHodgeTate (fun i => a i - t) = (expectedHodgeTate a).map (· - t) := sorry

/-- Test `expectedHodgeTate_regular`: the shifted weight function is injective. -/
example {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    Function.Injective (fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ)) :=
  (expectedHodgeTate_strictAnti ha).injective

/-- Test `not_expectedHodgeTate_unshifted`: rank two weight zero has distinct shifted entries. -/
example : expectedHodgeTate (0 : Fin 2 → ℤ) ≠ ({0, 0} : Multiset ℤ) := by decide

/-! ## Layers AG2.0–AG2.1a: algebraic coefficient exponents and corrected selectors -/

namespace Fixtures

/-- Algebraic coefficient weight determined by the central exponent and highest-weight sum. -/
def coefficientWeight (central highestWeightSum : ℤ) : ℤ :=
  -2 * central - highestWeightSum

/-- Formal labelled integer `k−1−highestWeight−central`, before geometric comparison. -/
def labelledInteger (central highestWeight : ℤ) (k : ℕ) : ℤ :=
  (k : ℤ) - 1 - highestWeight - central

/-- The relative-degree factor; geometric use assumes `N≥2` and `y≠1`. -/
def selectorFactor (N : ℚ) (y : ℕ) (eigenvalue : ℚ) : ℚ :=
  (eigenvalue - N ^ y) / (N - N ^ y)

/-- A filtered operator with graded identity and a nonzero nilpotent error at eigenvalue one. -/
def lerayJordan : Matrix (Fin 2) (Fin 2) ℚ := !![1, 1; 0, 1]

/-- Taking a power leaves the nilpotent error at eigenvalue one and fails idempotence. -/
example : (lerayJordan ^ 5) ^ 2 ≠ lerayJordan ^ 5 := by
  intro h
  have he := congrFun (congrFun h 0) 1
  norm_num [lerayJordan, pow_succ, Matrix.mul_apply, Fin.sum_univ_succ, Matrix.one_apply] at he

end Fixtures

namespace CoefficientProjector

/-- The polynomial correction `1−(1−T^D)^D` in the endomorphism ring. -/
def correction {R : Type*} [Ring R] (D : ℕ) (T : R) : R :=
  1 - (1 - T ^ D) ^ D

/-- An operator idempotent on a length-`D` filtration has an idempotent polynomial correction. -/
theorem lerayCorrection {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (D : ℕ) (hD : 0 < D) (F : ℕ → Submodule K V) (hF : Monotone F)
    (hzero : F 0 = ⊥) (htop : F D = ⊤) (T : Module.End K V)
    (hpres : ∀ i, ∀ v ∈ F i, T v ∈ F i)
    (hgraded : ∀ i < D, ∀ v ∈ F (i + 1), (T - T ^ 2) v ∈ F i) :
    (T - T ^ 2) ^ D = 0 ∧ IsIdempotentElem (correction D T) := sorry

/-- Multiplication by a commuting Young idempotent preserves the corrected idempotence. -/
theorem commuting_idempotent {R : Type*} [Ring R] (D : ℕ) (T ε : R)
    (hdef : (T - T ^ 2) ^ D = 0) (hε : IsIdempotentElem ε) (hc : Commute ε T) :
    IsIdempotentElem (ε * correction D T) := sorry

/-- A linear comparison intertwining the selectors also intertwines their corrections. -/
theorem comparison {K V W : Type*} [Field K]
    [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]
    (D : ℕ) (u : V →ₗ[K] W) (T : Module.End K V) (S : Module.End K W)
    (hu : u.comp T = S.comp u) :
    u.comp (correction D T) = (correction D S).comp u := sorry

/-- The corrected Jordan operator is exactly the identity. -/
example : correction 5 Fixtures.lerayJordan = 1 := by
  have hs : (1 - Fixtures.lerayJordan ^ 5) ^ 2 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      norm_num [Fixtures.lerayJordan, pow_succ, Matrix.mul_apply, Fin.sum_univ_succ,
        Matrix.one_apply]
  unfold correction
  rw [show (5 : ℕ) = 2 + 3 from rfl, pow_add, hs, zero_mul, sub_zero]

/-- The same correction kills the nilpotent Jordan block at eigenvalue zero. -/
example : correction 5 (Fixtures.lerayJordan - 1) = 0 := by
  have hs : (Fixtures.lerayJordan - 1) ^ 2 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      norm_num [Fixtures.lerayJordan, pow_succ, Matrix.mul_apply, Fin.sum_univ_succ,
        Matrix.one_apply]
  have hp : (Fixtures.lerayJordan - 1) ^ 5 = 0 := by
    rw [show (5 : ℕ) = 2 + 3 from rfl, pow_add, hs, zero_mul]
  simp [correction, hp]

end CoefficientProjector

/-! ## Layer AG2.2: discrete transfer ranks -/

namespace Fixtures

/-- Rank sum over multiplicities and constituent dimensions. -/
def discreteRank (blocks : List (ℕ × ℕ)) : ℕ :=
  (blocks.map fun b => b.1 * b.2).sum

end Fixtures

/-! ## Layer AG2.4: Hasse weights and Kuga slopes -/

namespace Fixtures

/-- The Hasse increment `(p−1)p^(M−1)j`, for `M≥1`. -/
def hasseShift (p M j : ℕ) : ℕ := (p - 1) * p ^ (M - 1) * j

/-- Add `mn[F:ℚ]` to the section slope. -/
def kugaSlope (sectionSlope : ℚ) (m n fieldDegree : ℕ) : ℚ :=
  sectionSlope + (m * n * fieldDegree : ℕ)

end Fixtures

/- Algebraic test data for the AG2.5 monodromy Checks. -/

namespace Fixtures

/-- Rank of a monodromy power with the given block lengths. -/
def blockPowerRank (blocks : List ℕ) (k : ℕ) : ℕ :=
  (blocks.map fun d => d - k).sum

/-- Diagonal Frobenius for `q=4` with weights `3,1,1,−1,−1,−3`. -/
def frobeniusFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if i.val = j.val then
    if i.val = 0 then 8 else if i.val = 1 ∨ i.val = 2 then 2
    else if i.val = 3 ∨ i.val = 4 then 1 / 2 else 1 / 8
    else 0

/-- Nilpotent strings of lengths 4 and 2. -/
def pureChainFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if (i.val, j.val) ∈ ([(1, 0), (3, 1), (5, 3), (4, 2)] : List (ℕ × ℕ))
    then 1 else 0

/-- Nilpotent strings of lengths 3 and 3. -/
def impureChainFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if (i.val, j.val) ∈ ([(1, 0), (3, 1), (4, 2), (5, 4)] : List (ℕ × ℕ))
    then 1 else 0

/-- Equal first monodromy ranks and the same Weil relation do not determine the
nilpotent strings: the third powers distinguish the two six-dimensional parameters. -/
theorem monodromyFirstRankDoesNotDetermineStrings :
    frobeniusFixture * pureChainFixture = (1 / 4 : ℚ) • (pureChainFixture * frobeniusFixture) ∧
    frobeniusFixture * impureChainFixture = (1 / 4 : ℚ) • (impureChainFixture * frobeniusFixture) ∧
    pureChainFixture.rank = 4 ∧ impureChainFixture.rank = 4 ∧
    (pureChainFixture ^ 3).rank = 1 ∧ (impureChainFixture ^ 3).rank = 0 ∧
    pureChainFixture ^ 4 = 0 ∧ impureChainFixture ^ 3 = 0 := sorry

end Fixtures

/-! ## Layer AG2.6: Hodge sums and projected comparison -/

/-- The sum of the labelled Hodge weights includes the determinant shift `n(n−1)/2`. -/
theorem sum_expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) :
    ∑ i : Fin n, (a i + ((n - 1 - i : ℕ) : ℤ)) =
    ∑ i : Fin n, a i + ((n * (n - 1) / 2 : ℕ) : ℤ) := sorry

/-- An intertwining linear equivalence identifies the images of the cohomological projectors. -/
theorem geometricCoefficientPrimeComparison {K V W : Type*} [Field K]
    [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]
    (u : V ≃ₗ[K] W) (e : Module.End K V) (f : Module.End K W)
    (he : e.comp e = e) (hf : f.comp f = f)
    (hu : u.toLinearMap.comp e = f.comp u.toLinearMap) :
    Nonempty (LinearMap.range e ≃ₗ[K] LinearMap.range f) := sorry

/-! ## Layer AG2.7: local residual eigenvalue conditions -/

/-- Every ordered ratio of different occurrences avoids `q`. -/
def IsGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  ∀ i j, i ≠ j → (α i : K) / (α j : K) ≠ q

/-- Generic eigenvalues that are pairwise distinct. -/
def IsStrongGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  IsGenericEigenvalues α q ∧ Function.Injective α

/-- Generic matrix data with a specified inertia subgroup and Frobenius. -/
def IsGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)

/-- Strong generic matrix data with specified inertia and Frobenius. -/
def IsStrongGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsStrongGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)


/-- Primality instance for the finite-field ratio checks. -/
instance prime_five : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

/-- Primality instance for the distinct-root finite-field check. -/
instance prime_seven : Fact (Nat.Prime 7) := ⟨by decide⟩

/-- Test TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one. -/
example : ¬ IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 1 := by
  intro h
  exact h 0 1 (by decide) (by simp)

/-- Test TauCeti.AutomorphicGalois.strongGeneric_not_repeated. -/
example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := by
  constructor
  · intro i j _
    simp
    decide
  · intro h
    have hh := h.2 (a₁ := 0) (a₂ := 1) rfl
    exact (by decide : (0 : Fin 2) ≠ 1) hh

/-- Test `strongGeneric_distinct_ratios`: at `q = 2`, the roots `(1,3)` over `𝔽₇`
are distinct and both ordered ratios avoid `q`. -/
example : IsStrongGenericEigenvalues
    ![(1 : (ZMod 7)ˣ), Units.mk0 (3 : ZMod 7) (by decide)] 2 := by
  constructor
  · intro i j hij
    fin_cases i <;> fin_cases j
    · exact (hij rfl).elim
    · intro h
      have hm := (div_eq_iff (Units.ne_zero _)).mp h
      exact (by decide : (1 : ZMod 7) ≠ 2 * 3) hm
    · intro h
      have hm := (div_eq_iff (Units.ne_zero _)).mp h
      exact (by decide : (3 : ZMod 7) ≠ 2 * 1) hm
    · exact (hij rfl).elim
  · intro i j h
    have hv := congrArg (fun u : (ZMod 7)ˣ => (u : ZMod 7)) h
    fin_cases i <;> fin_cases j
    · rfl
    · exact ((by decide : (1 : ZMod 7) ≠ 3) hv).elim
    · exact ((by decide : (3 : ZMod 7) ≠ 1) hv).elim
    · rfl

/-- An inertia-trivial character twist preserves and reflects local genericity. -/
theorem genericityTransfer {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r s : G →* Matrix.GeneralLinearGroup (Fin n) k) (χ : G →* kˣ)
    (hs : ∀ g, s g = Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) * r g)
    (hχ : ∀ g ∈ I, χ g = 1) (frob : G) (q : k) :
    IsGeneric I s frob q ↔ IsGeneric I r frob q := sorry

/-- An inertia-trivial character twist preserves and reflects strong local genericity. -/
theorem strongGenericityTransfer {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r s : G →* Matrix.GeneralLinearGroup (Fin n) k) (χ : G →* kˣ)
    (hs : ∀ g, s g = Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) * r g)
    (hχ : ∀ g ∈ I, χ g = 1) (frob : G) (q : k) :
    IsStrongGeneric I s frob q ↔ IsStrongGeneric I r frob q := sorry

/-- Extending the coefficient field preserves and reflects the ordered-ratio condition. -/
theorem isGenericEigenvalues_coeffExtension {k K : Type*} [Field k] [Field K] {n : ℕ}
    (f : k →+* K) (α : Fin n → kˣ) (q : k) :
    IsGenericEigenvalues (fun i => Units.map f.toMonoidHom (α i)) (f q) ↔
      IsGenericEigenvalues α q := sorry

/-- Coefficient extension also preserves and reflects distinctness of the eigenvalues. -/
theorem isStrongGenericEigenvalues_coeffExtension {k K : Type*} [Field k] [Field K] {n : ℕ}
    (f : k →+* K) (α : Fin n → kˣ) (q : k) :
    IsStrongGenericEigenvalues (fun i => Units.map f.toMonoidHom (α i)) (f q) ↔
      IsStrongGenericEigenvalues α q := sorry

/-- The strong eigenvalue predicate is precisely exclusion of both ratios `1` and `q`. -/
theorem isStrongGenericEigenvalues_iff_ratios {k : Type*} [Field k] {n : ℕ}
    (α : Fin n → kˣ) (q : k) :
    IsStrongGenericEigenvalues α q ↔
      ∀ i j, i ≠ j → (α i : k) / (α j : k) ≠ 1 ∧ (α i : k) / (α j : k) ≠ q := sorry

/-- A change of matrix basis preserves and reflects local genericity, including inertia. -/
theorem isGeneric_conjugate {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r s : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (A : Matrix.GeneralLinearGroup (Fin n) k) (hs : ∀ g, s g = A * r g * A⁻¹)
    (frob : G) (q : k) : IsGeneric I s frob q ↔ IsGeneric I r frob q := sorry

/-- A change of matrix basis preserves and reflects strong local genericity. -/
theorem isStrongGeneric_conjugate {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r s : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (A : Matrix.GeneralLinearGroup (Fin n) k) (hs : ∀ g, s g = A * r g * A⁻¹)
    (frob : G) (q : k) : IsStrongGeneric I s frob q ↔ IsStrongGeneric I r frob q := sorry

/-- Extending matrix coefficients preserves and reflects local genericity. -/
theorem isGeneric_coeffExtension {G k K : Type*} [Group G] [Field k] [Field K] {n : ℕ}
    (f : k →+* K) (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) :
    IsGeneric I ((Matrix.GeneralLinearGroup.map f).comp r) frob (f q) ↔
      IsGeneric I r frob q := sorry

/-- Extending matrix coefficients preserves and reflects strong local genericity. -/
theorem isStrongGeneric_coeffExtension {G k K : Type*} [Group G] [Field k] [Field K] {n : ℕ}
    (f : k →+* K) (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) :
    IsStrongGeneric I ((Matrix.GeneralLinearGroup.map f).comp r) frob (f q) ↔
      IsStrongGeneric I r frob q := sorry

/-- Nonvanishing reduced differences give distinct residual eigenvalues avoiding the ratio `q`. -/
theorem residualGenericityOutsideFiniteSet {O k : Type*} [CommRing O] [Field k]
    {n : ℕ} (red : O →+* k) (α : Fin n → Oˣ) (q : O)
    (h : ∀ i j, i ≠ j → red ((α i : O) - (α j : O)) ≠ 0 ∧
      red ((α i : O) - q * (α j : O)) ≠ 0) :
    IsStrongGenericEigenvalues (fun i => Units.map red.toMonoidHom (α i)) (red q) := sorry

/-- Local genericity forces trivial action on the specified inertia subgroup. -/
theorem isGeneric_unramified {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsGeneric I r frob q) :
    ∀ g ∈ I, r g = 1 := sorry

/-- Trivial inertia makes local genericity independent of the Frobenius lift. -/
theorem isGeneric_frobenius_independent {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob₁ frob₂ : G) (q : k) (hI : ∀ g ∈ I, r g = 1)
    (hfrob : frob₁⁻¹ * frob₂ ∈ I) :
    IsGeneric I r frob₁ q ↔ IsGeneric I r frob₂ q := sorry

/-- Common nonzero scaling preserves and reflects the ordered-ratio condition. -/
theorem isGenericEigenvalues_smul {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (c : Kˣ) :
    IsGenericEigenvalues (fun i => c * α i) q ↔ IsGenericEigenvalues α q := sorry

/-- Permuting the eigenvalue list preserves and reflects genericity. -/
theorem isGenericEigenvalues_reindex {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (e : Fin n ≃ Fin n) :
    IsGenericEigenvalues (α ∘ e) q ↔ IsGenericEigenvalues α q := sorry

/-- Inverting all eigenvalues preserves genericity by reversing ordered pairs. -/
theorem isGenericEigenvalues_inverse {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) :
    IsGenericEigenvalues (fun i => (α i)⁻¹) q ↔ IsGenericEigenvalues α q := sorry

/-- Strong local genericity implies the ACC+ local predicate. -/
theorem strongGeneric_generic {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsStrongGeneric I r frob q) : IsGeneric I r frob q := sorry

/-- Strong genericity excludes repeated eigenvalues. -/
theorem strongGeneric_distinct {K : Type*} [Field K] {n : ℕ}
    {α : Fin n → Kˣ} {q : K} (h : IsStrongGenericEigenvalues α q) :
    Function.Injective α := sorry

/-- The normalized contragredient Hecke roots preserve the ordered-ratio condition. -/
theorem dualAndTwistHeckeComparison {k : Type*} [Field k] {n : ℕ} (α : Fin n → kˣ) (q : kˣ) :
    IsGenericEigenvalues (fun i => q ^ (n - 1) * (α i)⁻¹) (q : k) ↔
      IsGenericEigenvalues α (q : k) := sorry

/-- A diagonal Frobenius reduces matrix genericity to trivial inertia and the eigenvalue test. -/
theorem isGeneric_matrix_diagonal {G K : Type*} [Group G] [Field K] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) K)
    (frob : G) (q : K) (α : Fin n → Kˣ)
    (hd : (r frob).val = Matrix.diagonal (fun i => (α i : K))) :
    IsGeneric I r frob q ↔ (∀ g ∈ I, r g = 1) ∧ IsGenericEigenvalues α q := sorry

/-- A diagonal Frobenius reduces strong genericity to inertia, ratios and distinctness. -/
theorem isStrongGeneric_matrix_diagonal {G K : Type*} [Group G] [Field K] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) K)
    (frob : G) (q : K) (α : Fin n → Kˣ)
    (hd : (r frob).val = Matrix.diagonal (fun i => (α i : K))) :
    IsStrongGeneric I r frob q ↔
      (∀ g ∈ I, r g = 1) ∧ IsStrongGenericEigenvalues α q := sorry

/-- Test `strongGeneric_rank_one`: every rank-one matrix representation trivial on inertia
is strong generic for every `q`. -/
example {G K : Type*} [Group G] [Field K]
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin 1) K)
    (frob : G) (q : K) (hI : ∀ g ∈ I, r g = 1) :
    IsStrongGeneric I r frob q := by
  let α : Fin 1 → (AlgebraicClosure K)ˣ := fun _ =>
    Units.map (algebraMap K (AlgebraicClosure K)).toMonoidHom (r frob).det
  refine ⟨hI, α, ?_, ?_⟩
  · have hd : ((r frob).val.map (algebraMap K (AlgebraicClosure K))) =
        Matrix.diagonal (fun i => (α i : AlgebraicClosure K)) := by
      ext i j
      fin_cases i
      fin_cases j
      simp [α, Matrix.GeneralLinearGroup.det]
    rw [hd, Matrix.charpoly_diagonal]
  · constructor
    · intro i j hij
      exact (hij (Subsingleton.elim i j)).elim
    · intro i j _
      exact Subsingleton.elim i j

/-- Distinct Frobenius eigenvalues with ratio `q` fail matrix genericity. -/
example : ¬ IsGeneric (⊥ : Subgroup (Fin 2 → (ZMod 5)ˣ))
    TauCeti.diagGL ![Units.mk0 (2 : ZMod 5) (by decide), 1] 2 := by
  rw [isGeneric_matrix_diagonal _ _ _ _ _ (TauCeti.diagGL_coe _)]
  rintro ⟨_, h⟩
  exact h 0 1 (by decide) (by simp)

/-- A nontrivial inertia image rules out both matrix predicates. -/
example {G K : Type*} [Group G] [Field K] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) K)
    (frob : G) (q : K) (g : G) (hg : g ∈ I) (hr : r g ≠ 1) :
    ¬ IsGeneric I r frob q ∧ ¬ IsStrongGeneric I r frob q := by
  exact ⟨fun h => hr (h.1 g hg), fun h => hr (h.1 g hg)⟩

/-! ## Layer AG2.7: two labelled algebraic constituents -/

section Unitary
variable {G K : Type*} [Group G] [Field K] {n₁ n₂ : ℕ}

/-- Algebraic block sum of two representations with specified character twists. -/
structure UnitaryDiscreteExport (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K) (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K)
    (ε₁ ε₂ : G →* Kˣ) where
  rep : G →* Matrix.GeneralLinearGroup (Fin n₁ ⊕ Fin n₂) K
  block : ∀ g, (rep g).val = Matrix.fromBlocks
    ((ε₁ g : K) • (r₁ g).val) 0 0 ((ε₂ g : K) • (r₂ g).val)

/-- Two matrix representations and their character twists admit the specified block sum. -/
theorem unitaryDiscreteExport_exists
    (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K)
    (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K) (ε₁ ε₂ : G →* Kˣ) :
    Nonempty (UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) := sorry

/-- The first coordinate inclusion intertwines the twisted constituent with the block sum. -/
theorem unitaryDiscreteExport_constituent (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K) (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K)
    (ε₁ ε₂ : G →* Kˣ) (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G)
    (v : Fin n₁ → K) :
    (x.rep g).val.mulVec (Sum.elim v 0) =
      Sum.elim (((ε₁ g : K) • (r₁ g).val).mulVec v) 0 := sorry

/-- The block-sum characteristic polynomial is the product of the twisted constituent polynomials. -/
theorem unitaryDiscreteExport_goodPolynomial (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K) (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K)
    (ε₁ ε₂ : G →* Kˣ) (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) :
    (x.rep g).val.charpoly = (((ε₁ g : K) • (r₁ g).val).charpoly) *
      (((ε₂ g : K) • (r₂ g).val).charpoly) := sorry

/-- Two positive-dimensional labelled summands give a proper invariant subspace. -/
theorem unitaryDiscreteExport_not_cuspidal_irreducibility
    (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K)
    (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K) (ε₁ ε₂ : G →* Kˣ)
    (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (hn₁ : 0 < n₁) (hn₂ : 0 < n₂) :
    ¬ Representation.IsIrreducible
      (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp x.rep)) :
        Representation K G ((Fin n₁ ⊕ Fin n₂) → K)) := sorry

/-- A zero-dimensional constituent contributes polynomial one. -/
example (r₁ : G →* Matrix.GeneralLinearGroup (Fin 0) K)
    (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K) (ε₁ ε₂ : G →* Kˣ)
    (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) :
    (((ε₁ g : K) • (r₁ g).val).charpoly = 1) ∧
    (x.rep g).val.charpoly = ((ε₂ g : K) • (r₂ g).val).charpoly := by
  have hzero : ((ε₁ g : K) • (r₁ g).val).charpoly = 1 := by
    simp [Matrix.charpoly]
  exact ⟨hzero, by rw [unitaryDiscreteExport_goodPolynomial, hzero, one_mul]⟩

end Unitary

/-
The README specifies the arithmetic place-fibre targets
IsDecomposedGenericPrime, IsDecomposedGeneric, infinitelyManyDecomposedGenericPrimes;
the compatible-system targets compatibleSystem, IsStrongCoefficientField,
GoodPrimeExport, NonselfdualComparisonExport, PolarizedComparisonExport;
and residualRep and ResidualPolynomialExport on their actual geometric and arithmetic carriers.
-/

end TauCeti.AutomorphicGalois
