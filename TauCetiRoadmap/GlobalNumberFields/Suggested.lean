import Mathlib
import TauCetiRoadmap.NumberFieldArithmetic.Suggested
import TauCeti.Algebra.Polynomial.Card.RootSetUnion
import TauCeti.NumberTheory.GeometryOfNumbers.Doubling
import TauCeti.NumberTheory.EffectiveBounds.Regulator

/-!
# Global number fields, ray classes, adeles, and Hecke characters: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These declarations pin the shared carriers and the three consumer-required theorem
names. Statements needing unsettled implementation API remain in the README rather than being
represented by fake interface structures.

Number Field Arithmetic owns `idealsAway` and the finite-completion dictionary. The abbreviation
below consumes that ideal group directly. This file contains no Artin map, reciprocity map, or class
field.
-/

namespace TauCetiRoadmap.GlobalNumberFields

open Asymptotics Complex Filter NumberField Topology
open IsDedekindDomain (HeightOneSpectrum)
open scoped nonZeroDivisors

universe u

variable {K : Type u} [Field K] [NumberField K]

/-! ## Layers 0--1: places and weak approximation -/

/-- **Layer 1, mixed-place Artin--Whaples weak approximation.** The diagonal image of `K` is
dense in a finite product of finite and infinite completions. Both products are genuinely present;
the theorem is not merely Mathlib's all-infinite-place result or a finite congruence corollary.

This exact name is consumed by Global Quadratic Forms. -/
theorem weakApproximation_denseRange
    (S : Finset (HeightOneSpectrum (𝓞 K))) (T : Finset (InfinitePlace K)) :
    DenseRange (fun x : K =>
      ((fun v : {v // v ∈ S} => algebraMap K (v.1.adicCompletion K) x),
        fun w : {w // w ∈ T} => algebraMap K w.1.Completion x)) := sorry

/-! ## Layer 2: moduli and ray classes -/

/-- A modulus is a nonzero integral ideal and a finite set of real places. -/
structure Modulus (K : Type u) [Field K] [NumberField K] where
  finitePart : Ideal (𝓞 K)
  finitePart_ne_bot : finitePart ≠ ⊥
  infinitePart : Finset {w : InfinitePlace K // w.IsReal}

instance : Dvd (Modulus K) :=
  ⟨fun 𝔪 𝔫 => 𝔪.finitePart ∣ 𝔫.finitePart ∧ 𝔪.infinitePart ⊆ 𝔫.infinitePart⟩

/-- The finite support of a modulus. -/
noncomputable def Modulus.support (𝔪 : Modulus K) : Finset (HeightOneSpectrum (𝓞 K)) := sorry

/-- **Membership in the support is divisibility of the finite part.** This is the characterizing
theorem of `Modulus.support`, not a second definition of it. This exact name is consumed by
L-functions, whose finite Euler correction is a product over `𝔪.support` read, through this
theorem, as the product over the primes dividing `𝔪.finitePart`. -/
theorem Modulus.mem_support_iff (𝔪 : Modulus K) (v : HeightOneSpectrum (𝓞 K)) :
    v ∈ 𝔪.support ↔ v.asIdeal ∣ 𝔪.finitePart := sorry

/-- Support is monotone under divisibility of moduli: the finite part of a divisor divides the
finite part of the multiple. Derived from `Modulus.mem_support_iff`. -/
theorem Modulus.support_mono {𝔪 𝔫 : Modulus K} (h : 𝔪 ∣ 𝔫) :
    𝔪.support ⊆ 𝔫.support := fun v hv =>
  (mem_support_iff 𝔫 v).mpr (dvd_trans ((mem_support_iff 𝔪 v).mp hv) h.1)

/-- The exponent of a finite place in a modulus. -/
noncomputable def Modulus.exponent (𝔪 : Modulus K) (v : HeightOneSpectrum (𝓞 K)) : ℕ :=
  (Associates.mk v.asIdeal).count (Associates.mk 𝔪.finitePart).factors

def Modulus.one (K : Type u) [Field K] [NumberField K] : Modulus K where
  finitePart := ⊤
  finitePart_ne_bot := top_ne_bot
  infinitePart := ∅

/-- The trivial modulus has empty support: no height-one prime divides the unit ideal. Derived
from `Modulus.mem_support_iff`. -/
@[simp] theorem Modulus.support_one : (Modulus.one K).support = ∅ := by
  ext v
  rw [mem_support_iff]
  simp only [Finset.notMem_empty, iff_false]
  exact fun hv => v.isPrime.ne_top (top_le_iff.mp (Ideal.le_of_dvd hv))

theorem Modulus.one_dvd (𝔪 : Modulus K) : Modulus.one K ∣ 𝔪 := sorry

noncomputable def narrowModulus (K : Type u) [Field K] [NumberField K] : Modulus K := by
  letI : Fintype {w : InfinitePlace K // w.IsReal} := Fintype.ofFinite _
  exact
    { finitePart := ⊤
      finitePart_ne_bot := top_ne_bot
      infinitePart := Finset.univ }

/-- Multiplicative congruence, including positivity at the real part of the modulus. -/
def IsCongrOne (𝔪 : Modulus K) (x : Kˣ) : Prop :=
  (∀ v : HeightOneSpectrum (𝓞 K), v.asIdeal ∣ 𝔪.finitePart →
      v.valuation K ((x : K) - 1) ≤
        ((Multiplicative.ofAdd (-(𝔪.exponent v : ℤ)) : Multiplicative ℤ) :
          WithZero (Multiplicative ℤ))) ∧
    ∀ w ∈ 𝔪.infinitePart, 0 < InfinitePlace.embedding_of_isReal w.2 (x : K)

def congruenceSubgroup (𝔪 : Modulus K) : Subgroup Kˣ where
  carrier := {x | IsCongrOne 𝔪 x}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- Elements of `Kˣ` that are units at every finite place dividing the modulus. This is the
domain of reduction to residue units; it is not merely a predicate hidden inside that map. -/
def primeToSubgroup (m : Modulus K) : Subgroup Kˣ where
  carrier := {x | ∀ v : HeightOneSpectrum (𝓞 K), v.asIdeal ∣ m.finitePart →
    v.valuation K (x : K) = 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- Units of the ring of integers congruent to one modulo the finite and real parts of the
modulus. Its index is the unit correction in the ray-class number formula. -/
def unitsCongruenceSubgroup (m : Modulus K) : Subgroup (𝓞 K)ˣ :=
  (congruenceSubgroup m).comap (Units.map (algebraMap (𝓞 K) K).toMonoidHom)

/-- **Single ownership of the prime-to ideal group.** -/
noncomputable abbrev idealsPrimeTo (𝔪 : Modulus K) :=
  TauCetiRoadmap.NumberFieldArithmetic.idealsAway (K := K) 𝔪.support

/-- The ray of principal ideals generated by elements congruent to one. -/
noncomputable def ray (𝔪 : Modulus K) : Subgroup (idealsPrimeTo 𝔪) := sorry

def RayClassGroup (𝔪 : Modulus K) : Type u :=
  idealsPrimeTo 𝔪 ⧸ ray 𝔪

noncomputable instance (𝔪 : Modulus K) : CommGroup (RayClassGroup 𝔪) :=
  inferInstanceAs (CommGroup (idealsPrimeTo 𝔪 ⧸ ray 𝔪))

/-- Coprimality of a nonzero integral ideal to the finite part. This is the *predicate* form;
the carrier that `idealClass` is defined on is `integralIdealsPrimeTo` below, and
`Modulus.mem_integralIdealsPrimeTo` is the bridge. -/
def Modulus.IsCoprimeTo (𝔪 : Modulus K) (I : Ideal (𝓞 K)) : Prop :=
  I ≠ ⊥ ∧ ∀ v : HeightOneSpectrum (𝓞 K), v ∈ 𝔪.support → ¬ v.asIdeal ∣ I

/-- **Single ownership of the integral prime-to monoid.** The nonzero integral ideals prime to
the finite part of `𝔪` are the supplier's `integralIdealsAway 𝔪.support`; no second carrier
is introduced. -/
noncomputable abbrev integralIdealsPrimeTo (𝔪 : Modulus K) :=
  TauCetiRoadmap.NumberFieldArithmetic.integralIdealsAway (K := K) 𝔪.support

theorem Modulus.mem_integralIdealsPrimeTo {𝔪 : Modulus K} {I : Ideal (𝓞 K)} :
    I ∈ integralIdealsPrimeTo 𝔪 ↔ 𝔪.IsCoprimeTo I := Iff.rfl

/-- **The ray class of an integral ideal prime to the modulus.** ⚠ The domain is the monoid of
nonzero integral ideals prime to `𝔪.support`, never `Ideal (𝓞 K)`. A version totalized over
arbitrary ideals exports a junk class for the zero ideal and for every ideal sharing a prime
with the modulus, which later lets a false theorem typecheck; here the coprimality proof is
carried by the argument, and multiplicativity is `map_mul` on the correct domain rather than a
separate law with side conditions. -/
noncomputable def idealClass (𝔪 : Modulus K) :
    integralIdealsPrimeTo 𝔪 →* RayClassGroup 𝔪 := sorry

theorem idealClass_mul (𝔪 : Modulus K) (I J : integralIdealsPrimeTo 𝔪) :
    idealClass 𝔪 (I * J) = idealClass 𝔪 I * idealClass 𝔪 J :=
  map_mul _ _ _

theorem idealClass_surjective (𝔪 : Modulus K) :
    Function.Surjective (idealClass 𝔪) := sorry

theorem finite_rayClassGroup (𝔪 : Modulus K) : Finite (RayClassGroup 𝔪) := sorry

/-- Monotonicity of the integral prime-to monoid along divisibility of moduli: `𝔪 ∣ 𝔫` makes
`𝔪.support ⊆ 𝔫.support`, so an ideal prime to `𝔫` is prime to `𝔪`. This is the literal
inclusion, matching the supplier's `idealsAwayInclusion`. -/
noncomputable def integralIdealsPrimeToInclusion {𝔪 𝔫 : Modulus K} (h : 𝔪 ∣ 𝔫) :
    integralIdealsPrimeTo 𝔫 →* integralIdealsPrimeTo 𝔪 :=
  Submonoid.inclusion sorry

noncomputable def classMap {𝔪 𝔫 : Modulus K} (h : 𝔪 ∣ 𝔫) :
    RayClassGroup 𝔫 →* RayClassGroup 𝔪 := sorry

theorem classMap_idealClass {𝔪 𝔫 : Modulus K} (h : 𝔪 ∣ 𝔫) (I : integralIdealsPrimeTo 𝔫) :
    classMap h (idealClass 𝔫 I) = idealClass 𝔪 (integralIdealsPrimeToInclusion h I) := sorry

theorem classMap_surjective {𝔪 𝔫 : Modulus K} (h : 𝔪 ∣ 𝔫) :
    Function.Surjective (classMap h) := sorry

/-- **The intrinsic ray-triviality criterion, and the primary form.** The class of `I` is
trivial exactly when `I` has a generator `x ∈ Kˣ` that is congruent to one modulo the finite
part and positive at every real place of the modulus — that is, `IsCongrOne 𝔪 x`. The
generator is a fractional-ideal generator: it is not required to be integral, and no
denominator has been cleared. Keeping the triviality criterion named prevents consumers from
replacing factorization through the ray class group by an unstructured hypothesis on an ideal
weight. -/
theorem idealClass_eq_one_iff (𝔪 : Modulus K) (I : integralIdealsPrimeTo 𝔪) :
    idealClass 𝔪 I = 1 ↔
      ∃ x : Kˣ, IsCongrOne 𝔪 x ∧
        ((I : Ideal (𝓞 K)) : FractionalIdeal (𝓞 K)⁰ K) =
          FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K) := sorry

/-- **Denominator-cleared form of the triviality criterion.** Writing the generator of
`idealClass_eq_one_iff` as `a/b` with `a` and `b` integral and both congruent to one gives an
equation of integral ideals. This is a corollary of the intrinsic criterion, not the definition
of the ray: a downstream proof that needs a fractional generator must not be forced through
this presentation. The integrality of `b` is what turns `I = (x)` into `I·(b) = (a)`; note that
`a ≡ b ≡ 1 mod 𝔪₀` already forces `a` and `b` prime to `𝔪₀`. -/
theorem idealClass_eq_one_iff_exists_integral (𝔪 : Modulus K) (I : integralIdealsPrimeTo 𝔪) :
    idealClass 𝔪 I = 1 ↔
      ∃ a b : 𝓞 K, a ≠ 0 ∧ b ≠ 0 ∧ a - 1 ∈ 𝔪.finitePart ∧ b - 1 ∈ 𝔪.finitePart ∧
        (∀ w ∈ 𝔪.infinitePart,
          0 < InfinitePlace.embedding_of_isReal w.2 (algebraMap (𝓞 K) K a)) ∧
        (∀ w ∈ 𝔪.infinitePart,
          0 < InfinitePlace.embedding_of_isReal w.2 (algebraMap (𝓞 K) K b)) ∧
        (I : Ideal (𝓞 K)) * Ideal.span {b} = Ideal.span {a} := sorry

/-- Reduction on residue-field units along divisibility of moduli. The direction is from the
larger modulus to the smaller one, matching `classMap`; this is a units pullback and not a
ring-level inverse. -/
noncomputable def finiteUnitsMap {m n : Modulus K} (h : m ∣ n) :
    ((𝓞 K) ⧸ n.finitePart)ˣ →* ((𝓞 K) ⧸ m.finitePart)ˣ :=
  Units.map (Ideal.Quotient.factor (Ideal.le_of_dvd h.1)).toMonoidHom

/-! ## Layer 3: geometry of numbers and ray-class counting

The uniform power saving below is a geometry-of-numbers theorem, not a corollary of finiteness
of the ray class group, and it is much stronger than Mathlib's
`NumberField.Ideal.tendsto_norm_le_and_mk_eq_div_atTop`, which gives a limit with no error term.
The intermediate milestones are the lattice-point count with a power-saving error
(`card_inter_smul_isBigO`), the index of the congruence lattice
(`relIndex_congruenceLattice`), the finite index of the congruence units
(`unitsCongruenceSubgroup_finiteIndex`), and the ray-refined fundamental domain
(`rayFundamentalDomain` and its boundary). -/

/-- **Layer 3A, Lipschitz parametrizability in dimension `d`.** A set is Lipschitz
parametrizable when finitely many Lipschitz maps out of the unit cube `[0,1]^d` cover it. This
is the boundary hypothesis that upgrades a lattice-point limit to a lattice-point count with a
power-saving error; Mathlib's `ZLattice.covolume.tendsto_card_le_div'` uses only
`volume (frontier _) = 0`, which is too weak to give an error term. -/
def IsLipschitzParametrizable {E : Type*} [PseudoEMetricSpace E] (d : ℕ) (S : Set E) : Prop :=
  ∃ (n : ℕ) (C : NNReal) (f : Fin n → (Fin d → ℝ) → E),
    (∀ i, LipschitzWith C (f i)) ∧ S ⊆ ⋃ i, f i '' Set.Icc 0 1

open scoped Pointwise in
/-- **Layer 3A, the lattice-point count with a power-saving error.** For a full `ℤ`-lattice in a
finite-dimensional real space and a bounded measurable region whose boundary is Lipschitz
parametrizable in dimension `n-1`, the number of lattice points in the dilate `c • D` is
`vol D / covolume Λ * cⁿ + O(c^(n-1))`. This is Lang's counting theorem, and the exponent
`n-1` is where the power saving `δ = 1/n` in `rayClassIdealCount` comes from. -/
theorem card_inter_smul_isBigO {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasureTheory.MeasureSpace E] [BorelSpace E]
    [MeasureTheory.Measure.IsAddHaarMeasure (MeasureTheory.volume : MeasureTheory.Measure E)]
    (Λ : Submodule ℤ E) [DiscreteTopology Λ] [IsZLattice ℝ Λ]
    (D : Set E) (hD : MeasurableSet D) (hbdd : Bornology.IsBounded D)
    (hfr : IsLipschitzParametrizable (Module.finrank ℝ E - 1) (frontier D)) :
    (fun c : ℝ => (Nat.card ((c • D) ∩ (Λ : Set E) : Set E) : ℝ) -
        MeasureTheory.volume.real D / ZLattice.covolume Λ * c ^ Module.finrank ℝ E)
      =O[atTop] (fun c : ℝ => c ^ (Module.finrank ℝ E - 1)) := sorry

/-- **Layer 3B, the congruence lattice.** Inside the ideal lattice of `I` under the Minkowski
embedding, the elements congruent to zero modulo the finite part of the modulus. The
congruence condition on ray-class representatives is imposed by counting cosets of this
sublattice, not by an unstructured side condition on the count. -/
noncomputable def congruenceLattice (𝔪 : Modulus K) (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    Submodule ℤ (mixedEmbedding.mixedSpace K) := sorry

/-- **Layer 3B, the index of the congruence lattice.** It has index `N 𝔪₀` in the ideal lattice,
so its covolume is `N 𝔪₀` times the covolume of the ideal lattice and each congruence class
contributes `N 𝔪₀ ⁻¹` of the unrestricted count. Mathlib's
`NumberField.mixedEmbedding.covolume_idealLattice` computes the second factor. -/
theorem relIndex_congruenceLattice (𝔪 : Modulus K) (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    (congruenceLattice 𝔪 I).toAddSubgroup.relIndex
        (mixedEmbedding.idealLattice K I).toAddSubgroup =
      Ideal.absNorm 𝔪.finitePart := sorry

/-- **Layer 3C, the unit action.** The units congruent to one modulo the modulus have finite
index in `(𝓞 K)ˣ`, so a fundamental domain for their action on the Minkowski space is a finite
union of translates of Mathlib's `NumberField.mixedEmbedding.fundamentalCone`. This finiteness
is what makes the error term uniform over the ray class group. -/
theorem unitsCongruenceSubgroup_finiteIndex (𝔪 : Modulus K) :
    (unitsCongruenceSubgroup 𝔪).FiniteIndex := sorry

/-- **Layer 3C, the ray-refined fundamental domain.** The subset of the Minkowski space that
represents each orbit of `unitsCongruenceSubgroup 𝔪` on the nonzero elements exactly once, with
the signs prescribed by the infinite part of the modulus. Specializing to the trivial modulus
recovers `NumberField.mixedEmbedding.fundamentalCone`. -/
noncomputable def rayFundamentalDomain (𝔪 : Modulus K) : Set (mixedEmbedding.mixedSpace K) :=
  sorry

open scoped Classical in
/-- **Layer 3C, the boundary estimate.** The norm-one section of the ray-refined fundamental
domain is bounded, measurable, and has Lipschitz-parametrizable boundary, which is exactly the
hypothesis of `card_inter_smul_isBigO`. The corresponding Mathlib facts for the trivial modulus
are `isBounded_normLeOne`, `measurableSet_normLeOne` and `volume_frontier_normLeOne`. -/
theorem isLipschitzParametrizable_frontier_rayFundamentalDomain (𝔪 : Modulus K) :
    Bornology.IsBounded
        {x ∈ rayFundamentalDomain 𝔪 | mixedEmbedding.norm x ≤ 1} ∧
      MeasurableSet {x ∈ rayFundamentalDomain 𝔪 | mixedEmbedding.norm x ≤ 1} ∧
        IsLipschitzParametrizable (Module.finrank ℚ K - 1)
          (frontier {x ∈ rayFundamentalDomain 𝔪 | mixedEmbedding.norm x ≤ 1}) := sorry

open scoped Classical in
/-- The number of nonzero integral ideals in one ray class with norm at most `x`. The carrier
already forces coprimality and nonvanishing, so the zero ideal and other classes cannot enter. -/
noncomputable def rayClassIdealCountingFunction
    (𝔪 : Modulus K) (c : RayClassGroup 𝔪) (x : ℝ) : ℕ :=
  Nat.card {I : integralIdealsPrimeTo 𝔪 //
    idealClass 𝔪 I = c ∧ (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ x}

/-- The positive coefficient common to every ray class. -/
noncomputable def rayClassIdealMainTerm (𝔪 : Modulus K) : ℝ := sorry

theorem rayClassIdealMainTerm_pos (𝔪 : Modulus K) : 0 < rayClassIdealMainTerm 𝔪 := sorry

/-- **The explicit main term.** The Dedekind-zeta residue, corrected by the Euler factors at the
primes dividing the finite part of the modulus, divided by the order of the ray class group.
The Euler factors are present because the count is over ideals *prime to* `𝔪₀`; dropping them
gives a main term that is too large by `∏_{𝔭 ∣ 𝔪₀} (1 - N𝔭⁻¹)⁻¹`. Mathlib's
`NumberField.dedekindZeta_residue` is
`2^r₁ (2π)^r₂ R_K h_K / (w_K √|d_K|)`. -/
theorem rayClassIdealMainTerm_eq (𝔪 : Modulus K) :
    rayClassIdealMainTerm 𝔪 =
      NumberField.dedekindZeta_residue K / (Nat.card (RayClassGroup 𝔪) : ℝ) *
        ∏ v ∈ 𝔪.support, (1 - ((Ideal.absNorm v.asIdeal : ℝ))⁻¹) := sorry

/-- **Exact Chebotarev contract: uniform ray-class ideal counting.** One positive power-saving
exponent works for every member of the finite ray class group. -/
theorem rayClassIdealCount (𝔪 : Modulus K) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ c : RayClassGroup 𝔪,
      (fun x : ℝ =>
          (rayClassIdealCountingFunction 𝔪 c x : ℝ) - rayClassIdealMainTerm 𝔪 * x) =O[atTop]
        (fun x : ℝ => x ^ (1 - δ)) := sorry

/-- **Agreement with Mathlib's total count.** Summing the ray-class counts for the trivial
modulus recovers `NumberField.Ideal.tendsto_norm_le_div_atTop₀`. -/
theorem tendsto_rayClassIdealCountingFunction_one :
    Filter.Tendsto
      (fun x : ℝ => (rayClassIdealCountingFunction (Modulus.one K) 1 x : ℝ) / x) atTop
      (nhds (NumberField.dedekindZeta_residue K / (Nat.card (ClassGroup (𝓞 K)) : ℝ))) := sorry

/-! ## Layer 9 dependency: character carriers -/

/- The carrier is placed before the partial-sum contract because the theorem is arithmetic and
does not depend on the later idelic realization. -/
abbrev RayClassCharacter (𝔪 : Modulus K) := RayClassGroup 𝔪 →* ℂˣ

open scoped Classical in
noncomputable def rayClassCharacterPartialSum
    (𝔪 : Modulus K) (χ : RayClassCharacter 𝔪) (x : ℝ) : ℂ :=
  ∑ᶠ I : {I : integralIdealsPrimeTo 𝔪 // (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ x},
    (χ (idealClass 𝔪 (I : integralIdealsPrimeTo 𝔪)) : ℂ)

/-- **Exact Chebotarev contract: cancellation of a nontrivial ray class character.** -/
theorem rayClassCharacter_partialSums (𝔪 : Modulus K) (χ : RayClassCharacter 𝔪) (hχ : χ ≠ 1) :
    ∃ δ : ℝ, 0 < δ ∧
      (fun x : ℝ => rayClassCharacterPartialSum 𝔪 χ x) =O[atTop]
        (fun x : ℝ => ((x ^ (1 - δ) : ℝ) : ℂ)) := sorry

/-! ## Layer 3G: lattice reconciliation and elementary all-rank regulator bounds

The README fixes the actual primary coefficient/root-count constants and proof order.
The existing unit lattice, logarithmic coordinates and regulator are consumed unchanged. -/

/-- The native bounded-polynomial root-count budget with coefficient height `4^n`. -/
def unitPowerRootBudget (n : ℕ) : ℕ := n * (2 * 4 ^ n + 1) ^ (n + 1)

/-- Explicit separation scale; positivity is used only at positive number-field degrees. -/
noncomputable def unitLogSeparation (n : ℕ) : ℝ :=
  Real.log 2 / ((n * unitPowerRootBudget n : ℕ) : ℝ)

/-- A degree-only lower bound, with no choice of a unit or unit basis as input. -/
noncomputable def elementaryRegulatorBound (n : ℕ) : ℝ := unitLogSeparation n ^ n

theorem unitPowerRootBudget_mono : Monotone unitPowerRootBudget := sorry

theorem unitLogSeparation_pos {n : ℕ} (hn : 0 < n) : 0 < unitLogSeparation n := sorry

theorem unitLogSeparation_le_one {n : ℕ} (hn : 0 < n) : unitLogSeparation n ≤ 1 := sorry

open scoped Classical in
/-- The finite root budget: all powers up to Q(n) have conjugates at most two under
small logarithmic norm. The omitted place is controlled by the product formula. -/
theorem norm_embedding_unit_pow_le_two (u : (𝓞 K)ˣ)
    (hu : ‖NumberField.Units.logEmbedding K (Additive.ofMul u)‖ ≤
      unitLogSeparation (Module.finrank ℚ K))
    (k : ℕ) (hk : k ≤ unitPowerRootBudget (Module.finrank ℚ K)) (φ : K →+* ℂ) :
    ‖φ (((u : 𝓞 K) : K) ^ k)‖ ≤ 2 := sorry

open scoped Classical in
/-- Integrality and the actual coefficient estimate put these powers in the bounded root union. -/
theorem abs_coeff_minpoly_unit_pow_le (u : (𝓞 K)ˣ)
    (hu : ‖NumberField.Units.logEmbedding K (Additive.ofMul u)‖ ≤
      unitLogSeparation (Module.finrank ℚ K))
    (k : ℕ) (hk : k ≤ unitPowerRootBudget (Module.finrank ℚ K)) (j : ℕ) :
    |(minpoly ℤ (((u : 𝓞 K) : K) ^ k)).coeff j| ≤
      ((4 ^ Module.finrank ℚ K : ℕ) : ℤ) := sorry

open scoped Classical in
/-- Q(n)+1 powers cannot all be distinct in a root union of cardinality at most Q(n).
Minimal-polynomial witnesses are monic and nonzero; no zero-polynomial root convention is used. -/
theorem exists_pos_pow_eq_one_of_small_log (u : (𝓞 K)ˣ)
    (hu : ‖NumberField.Units.logEmbedding K (Additive.ofMul u)‖ ≤
      unitLogSeparation (Module.finrank ℚ K)) :
    ∃ m : ℕ, 0 < m ∧ u ^ m = 1 := sorry

open scoped Classical in
/-- Quantitative separation on the actual image lattice, in its native supremum norm. -/
theorem unitLogSeparation_lt_norm (x : NumberField.Units.unitLattice K) (hx : x ≠ 0) :
    unitLogSeparation (Module.finrank ℚ K) <
      ‖(x : NumberField.Units.dirichletUnitTheorem.logSpace K)‖ := sorry

open scoped Classical in
/-- Product Lebesgue measure in omitted-place weighted-log coordinates; not hyperplane area. -/
theorem measureReal_unit_log_cube (δ : ℝ) (hδ : 0 ≤ δ) :
    MeasureTheory.volume.real
      (Metric.closedBall (0 : NumberField.Units.dirichletUnitTheorem.logSpace K) δ) =
        (2 * δ) ^ NumberField.Units.rank K := sorry

open scoped Classical in
/-- Minkowski first applied in the exact native coordinates. Rank zero uses R=1 separately. -/
theorem regulator_ge_elementary_rank_bound :
    unitLogSeparation (Module.finrank ℚ K) ^ NumberField.Units.rank K ≤
      NumberField.Units.regulator K := sorry

theorem regulator_ge_elementary_degree_bound :
    elementaryRegulatorBound (Module.finrank ℚ K) ≤ NumberField.Units.regulator K := sorry

theorem elementaryRegulatorBound_pos {n : ℕ} (hn : 0 < n) :
    0 < elementaryRegulatorBound n := sorry

theorem elementaryRegulatorBound_antitone {n m : ℕ} (hn : 0 < n) (hnm : n ≤ m) :
    elementaryRegulatorBound m ≤ elementaryRegulatorBound n := sorry

/-- Discriminant-only consequence of the existing effective degree bound. -/
theorem regulator_ge_elementary_discriminant_bound (N : ℕ)
    (hN : |NumberField.discr K| ≤ (N : ℤ)) :
    elementaryRegulatorBound (max 1 (NumberField.hermiteTheorem.rankOfDiscrBdd N)) ≤
      NumberField.Units.regulator K := sorry

/-- A consumer of the already fixed 3E formula; the elementary regulator producer
above has no ray-counting or analytic-continuation premise. All Euler factors stay present. -/
theorem rayClassIdealMainTerm_ge_elementaryRegulatorBound (𝔪 : Modulus K) :
    ((2 ^ NumberField.InfinitePlace.nrRealPlaces K *
        (2 * Real.pi) ^ NumberField.InfinitePlace.nrComplexPlaces K *
        elementaryRegulatorBound (Module.finrank ℚ K) *
        (NumberField.classNumber K : ℝ)) /
      ((NumberField.Units.torsionOrder K : ℝ) * Real.sqrt |(NumberField.discr K : ℝ)|)) /
        (Nat.card (RayClassGroup 𝔪) : ℝ) *
      (∏ v ∈ 𝔪.support, (1 - ((Ideal.absNorm v.asIdeal : ℝ))⁻¹)) ≤
        rayClassIdealMainTerm 𝔪 := sorry

section PolydiscReconciliation

variable {ι : Type*} [Fintype ι]

/-- Compatibility of the old engine name with Mathlib's existing region; no new region def. -/
theorem native_box_eq_pi_closedBall (r : ι → ℝ) (c : ℝ) :
    TauCeti.GeometryOfNumbers.box r c =
      Set.pi Set.univ (fun j => Metric.closedBall (0 : ℂ) (c * r j)) := by
  ext x
  simp

/-- The count is finite before ncard is used; spanning is not required here. -/
theorem finite_lattice_inter_polydisc (L : Submodule ℤ (ι → ℂ)) [DiscreteTopology L]
    (r : ι → ℝ) (c : ℝ) :
    ((L : Set (ι → ℂ)) ∩
      Set.pi Set.univ (fun j => Metric.closedBall (0 : ℂ) (c * r j))).Finite := sorry

/-- Native packing as a comparison on the existing Mathlib region, without a new
separation predicate or lattice carrier. The positive-scale hypotheses are retained. -/
theorem finite_and_ncard_le_polydisc_of_separated (r : ι → ℝ) (hr : ∀ j, 0 < r j)
    {c ε : ℝ} (hε : 0 < ε) (hεc : ε ≤ c) {S : Set (ι → ℂ)}
    (hS : S ⊆ Set.pi Set.univ (fun j => Metric.closedBall (0 : ℂ) (c * r j)))
    (hsep : ∀ x ∈ S, ∀ y ∈ S, x ≠ y → ∃ j, ε * r j < ‖x j - y j‖) :
    S.Finite ∧ (S.ncard : ℝ) ≤ (4 * c / ε) ^ (2 * Fintype.card ι) := sorry

/-- The product of the canonical complex real/imaginary coordinate equivalences,
followed by reindexing. Its values, rather than an arbitrary choice of equivalence, are fixed. -/
noncomputable def complexRealCoordinateEquiv :
    (ι → ℂ) ≃L[ℝ] ((ι × Fin 2) → ℝ) := sorry

theorem complexRealCoordinateEquiv_apply_re (x : ι → ℂ) (j : ι) :
    complexRealCoordinateEquiv x (j, 0) = (x j).re := sorry

theorem complexRealCoordinateEquiv_apply_im (x : ι → ℂ) (j : ι) :
    complexRealCoordinateEquiv x (j, 1) = (x j).im := sorry

/-- Product Lebesgue, with no Euclidean/supremum-norm identification assumed. -/
theorem complexRealCoordinateEquiv_measurePreserving :
    MeasureTheory.MeasurePreserving
      (complexRealCoordinateEquiv (ι := ι))
      MeasureTheory.volume MeasureTheory.volume := sorry

/-- The lattice's covolume is preserved by the actual coordinate transport. Its image
is proved discrete and full before applying real-Pi lattice counting. -/
theorem covolume_map_complexRealCoordinateEquiv (L : Submodule ℤ (ι → ℂ))
    [DiscreteTopology L] [IsZLattice ℝ L] :
    ZLattice.covolume
      (L.map ((complexRealCoordinateEquiv (ι := ι)).toLinearEquiv.restrictScalars ℤ).toLinearMap) =
        ZLattice.covolume L := sorry

/-- Native doubling, in the standard carrier and region, with its finiteness discharged. -/
theorem lattice_polydisc_doubling (L : Submodule ℤ (ι → ℂ)) [DiscreteTopology L]
    (r : ι → ℝ) (hr : ∀ j, 0 < r j) :
    (((L : Set (ι → ℂ)) ∩
      Set.pi Set.univ (fun j => Metric.closedBall (0 : ℂ) (2 * r j))).ncard : ℝ) ≤
      49 ^ Fintype.card ι *
        ((L : Set (ι → ℂ)) ∩
          Set.pi Set.univ (fun j => Metric.closedBall (0 : ℂ) (r j))).ncard := sorry

/-- Product Lebesgue normalization, including the zero-dimensional product. -/
theorem measureReal_polydisc (r : ι → ℝ) (hr : ∀ j, 0 < r j) (c : ℝ) (hc : 0 ≤ c) :
    MeasureTheory.volume.real
      (Set.pi Set.univ (fun j => Metric.closedBall (0 : ℂ) (c * r j))) =
      Real.pi ^ Fintype.card ι * (∏ j, r j ^ 2) * c ^ (2 * Fintype.card ι) := sorry

/-- The actual cardinality/covolume comparison. Transport through complex real/imaginary
coordinates; do not assume the supremum-norm Pi space carries a compatible inner product. -/
theorem lattice_polydisc_count_limit (L : Submodule ℤ (ι → ℂ)) [DiscreteTopology L]
    [IsZLattice ℝ L] (r : ι → ℝ) (hr : ∀ j, 0 < r j) :
    Tendsto (fun c : ℝ =>
      (((L : Set (ι → ℂ)) ∩
        Set.pi Set.univ (fun j => Metric.closedBall (0 : ℂ) (c * r j))).ncard : ℝ) /
        c ^ (2 * Fintype.card ι)) atTop
      (nhds (Real.pi ^ Fintype.card ι * (∏ j, r j ^ 2) / ZLattice.covolume L)) := sorry

end PolydiscReconciliation

/-! ## Layers 4--8: adeles and ideles -/

/-- Additive strong approximation in the finite adeles. -/
theorem denseRange_algebraMap_finiteAdeleRing :
    DenseRange (algebraMap K (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)) := sorry

abbrev IdeleGroup (K : Type u) [Field K] [NumberField K] := (AdeleRing (𝓞 K) K)ˣ

abbrev IdeleClassGroup (K : Type u) [Field K] [NumberField K] :=
  IdeleGroup K ⧸ (Units.map (algebraMap K (AdeleRing (𝓞 K) K)).toMonoidHom).range

/-- The global idele norm, using squared modulus at complex places. -/
noncomputable def ideleNorm : IdeleGroup K →* Units NNReal := sorry

/-- **The coordinate of an idele at a finite place**, as a group homomorphism to the units of the
`v`-adic completion. ⚠ Named here because two consumers can otherwise only cite a milestone:
Class Field Theory's placewise description of the idelic norm for an *arbitrary* idele
(`mem_range_ideleNormMap_iff`) is stated against it, and Global Quadratic Forms' kernel
computation for `i ↦ ∏_v (i_v, b_v)_v` reads coordinates off non-principal ideles. -/
noncomputable def ideleFiniteCoord (v : HeightOneSpectrum (𝓞 K)) :
    IdeleGroup K →* (v.adicCompletion K)ˣ := sorry

/-- On a principal idele the finite coordinate is the image of the global element. This is the
compatibility that keeps the arbitrary-idele and principal-idele statements one theory. -/
theorem ideleFiniteCoord_principal (v : HeightOneSpectrum (𝓞 K)) (x : Kˣ) :
    ideleFiniteCoord v (Units.map (algebraMap K (AdeleRing (𝓞 K) K)).toMonoidHom x) =
      Units.map (algebraMap K (v.adicCompletion K)).toMonoidHom x := sorry

/-- The coordinate of an idele at an infinite place. -/
noncomputable def ideleInfiniteCoord (w : InfinitePlace K) :
    IdeleGroup K →* (w.Completion)ˣ := sorry

theorem ideleInfiniteCoord_principal (w : InfinitePlace K) (x : Kˣ) :
    ideleInfiniteCoord w (Units.map (algebraMap K (AdeleRing (𝓞 K) K)).toMonoidHom x) =
      Units.map (algebraMap K w.Completion).toMonoidHom x := sorry

namespace IdeleClassGroup

/-- The norm-one idele classes; compactness is a theorem of Layer 6. -/
noncomputable def normOne (K : Type u) [Field K] [NumberField K] : Subgroup (IdeleClassGroup K) :=
  sorry

end IdeleClassGroup

/-- Principal units of level `n` in one finite completion. -/
def IsPrincipalUnitOfLevel (v : HeightOneSpectrum (𝓞 K)) (n : ℕ) (x : v.adicCompletion K) : Prop :=
  ∃ y : v.adicCompletionIntegers K, (y : v.adicCompletion K) = x - 1 ∧
    y ∈ (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K)) ^ n

/-- The single idelic congruence subgroup, including the infinite components. -/
noncomputable def IdeleCongruenceSubgroup (𝔪 : Modulus K) : Subgroup (IdeleGroup K) := sorry

noncomputable def RaySubgroup (𝔪 : Modulus K) : Subgroup (IdeleClassGroup K) := sorry

noncomputable def rayClassQuotient (𝔪 : Modulus K) :
    IdeleClassGroup K →* RayClassGroup 𝔪 := sorry

theorem rayClassQuotient_surjective (𝔪 : Modulus K) :
    Function.Surjective (rayClassQuotient 𝔪) := sorry

theorem ker_rayClassQuotient (𝔪 : Modulus K) :
    (rayClassQuotient 𝔪).ker = RaySubgroup 𝔪 := sorry

/-! ### Layer 8: base change of adeles along a finite extension

The comparison `𝔸_K ⊗_K L ≃ 𝔸_L` is pinned as an isomorphism of **topological** `𝔸_K`-algebras.
A bare algebra equivalence is not enough for the later idelic arguments, which need the map and
its inverse to be continuous and open. Because `L/K` is finite there is no completed tensor
product to take: the algebraic tensor product carries the module topology over `𝔸_K`, which is
the product topology of any `K`-basis of `L`, and that is what `IsModuleTopology` records. -/

section BaseChange

/-- **Layer 8, the adelic extension map.** Placewise it is given by the inclusions `K_v → L_w`
for `w ∣ v`. It is stated as a ring homomorphism with `continuous_adeleExtension` and
`adeleExtension_algebraMap` beside it, rather than as a `K`-algebra map, because `𝔸_L` has no
canonical `K`-algebra instance to be a map over. -/
noncomputable def adeleExtension (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L] :
    AdeleRing (𝓞 K) K →+* AdeleRing (𝓞 L) L := sorry

theorem continuous_adeleExtension (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L] :
    Continuous (adeleExtension K L) := sorry

/-- Compatibility with the two diagonal embeddings: `adeleExtension` extends `K → L`. -/
theorem adeleExtension_algebraMap (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L] (x : K) :
    adeleExtension K L (algebraMap K (AdeleRing (𝓞 K) K) x) =
      algebraMap L (AdeleRing (𝓞 L) L) (algebraMap K L x) := sorry

/-- The finite-adelic extension map. -/
noncomputable def finiteAdeleExtension (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L] :
    IsDedekindDomain.FiniteAdeleRing (𝓞 K) K →+*
      IsDedekindDomain.FiniteAdeleRing (𝓞 L) L := sorry

theorem continuous_finiteAdeleExtension (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L] :
    Continuous (finiteAdeleExtension K L) := sorry

/-- The infinite-adelic extension map. -/
noncomputable def infiniteAdeleExtension (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L] :
    InfiniteAdeleRing K →+* InfiniteAdeleRing L := sorry

theorem continuous_infiniteAdeleExtension (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L] :
    Continuous (infiniteAdeleExtension K L) := sorry

/-- `𝔸_L` is an `𝔸_K`-algebra through `adeleExtension`; this is the structure the base-change
comparison is stated over. The low priority keeps `Algebra.id` in place when `L = K`. -/
noncomputable instance (priority := 100) adeleAlgebra (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L] :
    Algebra (AdeleRing (𝓞 K) K) (AdeleRing (𝓞 L) L) :=
  RingHom.toAlgebra (adeleExtension K L)

noncomputable instance (priority := 100) finiteAdeleAlgebra (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L] :
    Algebra (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)
      (IsDedekindDomain.FiniteAdeleRing (𝓞 L) L) :=
  RingHom.toAlgebra (finiteAdeleExtension K L)

noncomputable instance (priority := 100) infiniteAdeleAlgebra (K : Type u) [Field K]
    [NumberField K] (L : Type u) [Field L] [NumberField L] [Algebra K L] :
    Algebra (InfiniteAdeleRing K) (InfiniteAdeleRing L) :=
  RingHom.toAlgebra (infiniteAdeleExtension K L)

/-- **Layer 8, the topological base-change comparison.** ⚠ The content is that this is an
isomorphism of topological `𝔸_K`-algebras, not merely of `𝔸_K`-algebras: the
`IsModuleTopology` hypothesis pins the topology on the source, and `ContinuousAlgEquiv` carries
continuity in both directions, so the map is a homeomorphism and in particular open.
`L ⊗_K 𝔸_K` and `𝔸_K ⊗_K L` are the same comparison. -/
noncomputable def adeleBaseChangeEquiv (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L]
    [TopologicalSpace (TensorProduct K (AdeleRing (𝓞 K) K) L)]
    [IsModuleTopology (AdeleRing (𝓞 K) K) (TensorProduct K (AdeleRing (𝓞 K) K) L)] :
    TensorProduct K (AdeleRing (𝓞 K) K) L ≃A[AdeleRing (𝓞 K) K] AdeleRing (𝓞 L) L := sorry

/-- Openness of the base-change comparison, from continuity of its inverse. -/
theorem isOpenMap_adeleBaseChangeEquiv (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L]
    [TopologicalSpace (TensorProduct K (AdeleRing (𝓞 K) K) L)]
    [IsModuleTopology (AdeleRing (𝓞 K) K) (TensorProduct K (AdeleRing (𝓞 K) K) L)] :
    IsOpenMap (adeleBaseChangeEquiv K L) :=
  (adeleBaseChangeEquiv K L).isOpenMap

/-- The base-change comparison extends `adeleExtension`: it agrees with it on `𝔸_K ⊗ 1`. -/
theorem adeleBaseChangeEquiv_tmul_one (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L]
    [TopologicalSpace (TensorProduct K (AdeleRing (𝓞 K) K) L)]
    [IsModuleTopology (AdeleRing (𝓞 K) K) (TensorProduct K (AdeleRing (𝓞 K) K) L)]
    (x : AdeleRing (𝓞 K) K) :
    adeleBaseChangeEquiv K L (x ⊗ₜ[K] (1 : L)) = adeleExtension K L x := sorry

/-- The finite-adelic half of the comparison. -/
noncomputable def finiteAdeleBaseChangeEquiv (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L]
    [TopologicalSpace (TensorProduct K (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) L)]
    [IsModuleTopology (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)
      (TensorProduct K (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) L)] :
    TensorProduct K (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) L
      ≃A[IsDedekindDomain.FiniteAdeleRing (𝓞 K) K]
        IsDedekindDomain.FiniteAdeleRing (𝓞 L) L := sorry

/-- The infinite-adelic half of the comparison. -/
noncomputable def infiniteAdeleBaseChangeEquiv (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L]
    [TopologicalSpace (TensorProduct K (InfiniteAdeleRing K) L)]
    [IsModuleTopology (InfiniteAdeleRing K) (TensorProduct K (InfiniteAdeleRing K) L)] :
    TensorProduct K (InfiniteAdeleRing K) L ≃A[InfiniteAdeleRing K] InfiniteAdeleRing L := sorry

/-- **Compatibility with the finite and infinite components.** Under
`AdeleRing = InfiniteAdeleRing × FiniteAdeleRing`, the base-change comparison is the product of
the two component comparisons. -/
theorem adeleBaseChangeEquiv_apply_prod (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L]
    [TopologicalSpace (TensorProduct K (AdeleRing (𝓞 K) K) L)]
    [IsModuleTopology (AdeleRing (𝓞 K) K) (TensorProduct K (AdeleRing (𝓞 K) K) L)]
    [TopologicalSpace (TensorProduct K (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) L)]
    [IsModuleTopology (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)
      (TensorProduct K (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) L)]
    [TopologicalSpace (TensorProduct K (InfiniteAdeleRing K) L)]
    [IsModuleTopology (InfiniteAdeleRing K) (TensorProduct K (InfiniteAdeleRing K) L)]
    (x : AdeleRing (𝓞 K) K) (y : L) :
    adeleBaseChangeEquiv K L (x ⊗ₜ[K] y) =
      (infiniteAdeleBaseChangeEquiv K L (x.1 ⊗ₜ[K] y),
        finiteAdeleBaseChangeEquiv K L (x.2 ⊗ₜ[K] y)) := sorry

/-- **Composition in towers for the extension map.** -/
theorem adeleExtension_comp (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L]
    (M : Type u) [Field M] [NumberField M] [Algebra K M] [Algebra L M] [IsScalarTower K L M]
    (x : AdeleRing (𝓞 K) K) :
    adeleExtension L M (adeleExtension K L x) = adeleExtension K M x := sorry

/-- **Naturality in towers.** Base change from `K` to `M` factors through base change from `K`
to `L`: the two routes from `𝔸_K ⊗_K M` to `𝔸_M` agree on pure tensors, hence agree. -/
theorem adeleBaseChangeEquiv_tower (K : Type u) [Field K] [NumberField K]
    (L : Type u) [Field L] [NumberField L] [Algebra K L]
    (M : Type u) [Field M] [NumberField M] [Algebra K M] [Algebra L M] [IsScalarTower K L M]
    [TopologicalSpace (TensorProduct K (AdeleRing (𝓞 K) K) L)]
    [IsModuleTopology (AdeleRing (𝓞 K) K) (TensorProduct K (AdeleRing (𝓞 K) K) L)]
    [TopologicalSpace (TensorProduct K (AdeleRing (𝓞 K) K) M)]
    [IsModuleTopology (AdeleRing (𝓞 K) K) (TensorProduct K (AdeleRing (𝓞 K) K) M)]
    [TopologicalSpace (TensorProduct L (AdeleRing (𝓞 L) L) M)]
    [IsModuleTopology (AdeleRing (𝓞 L) L) (TensorProduct L (AdeleRing (𝓞 L) L) M)]
    (x : AdeleRing (𝓞 K) K) (z : M) :
    adeleBaseChangeEquiv K M (x ⊗ₜ[K] z) =
      adeleBaseChangeEquiv L M ((adeleBaseChangeEquiv K L (x ⊗ₜ[K] (1 : L))) ⊗ₜ[L] z) := sorry

end BaseChange

/-! ## Layer 9: Hecke characters -/

abbrev HeckeCharacter (K : Type u) [Field K] [NumberField K] :=
  ContinuousMonoidHom (IdeleClassGroup K) ℂˣ

noncomputable def HeckeCharacter.ofRayClassCharacter {𝔪 : Modulus K}
    (χ : RayClassCharacter 𝔪) : HeckeCharacter K := sorry

theorem HeckeCharacter.ofRayClassCharacter_apply {𝔪 : Modulus K}
    (χ : RayClassCharacter 𝔪) (y : IdeleClassGroup K) :
    HeckeCharacter.ofRayClassCharacter χ y = χ (rayClassQuotient 𝔪 y) := sorry

noncomputable def RayClassCharacter.induced {𝔪 𝔫 : Modulus K} (h : 𝔪 ∣ 𝔫)
    (η : RayClassCharacter 𝔪) : RayClassCharacter 𝔫 :=
  η.comp (classMap h)

def RayClassCharacter.IsPrimitive {𝔫 : Modulus K} (η : RayClassCharacter 𝔫) : Prop :=
  ∀ (𝔪 : Modulus K) (h : 𝔪 ∣ 𝔫), 𝔪 ≠ 𝔫 →
    ¬ ∃ ψ : RayClassCharacter 𝔪, ψ.induced h = η

theorem RayClassCharacter.not_isPrimitive_one {𝔫 : Modulus K} (h : 𝔫 ≠ Modulus.one K) :
    ¬ (1 : RayClassCharacter 𝔫).IsPrimitive := sorry

noncomputable def HeckeCharacter.shift (χ : HeckeCharacter K) : ℝ := sorry

noncomputable def HeckeCharacter.unitaryPart (χ : HeckeCharacter K) : HeckeCharacter K := sorry

theorem HeckeCharacter.norm_unitaryPart (χ : HeckeCharacter K) (y : IdeleClassGroup K) :
    ‖((χ.unitaryPart y : ℂˣ) : ℂ)‖ = 1 := sorry

theorem HeckeCharacter.shift_eq_zero_iff (χ : HeckeCharacter K) :
    χ.shift = 0 ↔ ∀ y : IdeleClassGroup K, ‖((χ y : ℂˣ) : ℂ)‖ = 1 := sorry

theorem HeckeCharacter.shift_ofRayClassCharacter {𝔪 : Modulus K} (η : RayClassCharacter 𝔪) :
    (HeckeCharacter.ofRayClassCharacter η).shift = 0 := sorry

/-! ## Layer 10: infinity types -/

open scoped Classical in
/-- The modulus `(n)·∞` over `ℚ`, used by the ray-class/Dirichlet-character and
cyclotomic carrier comparisons. Including the real place is essential: omitting it quotients
the finite residue-unit group by the sign of `-1`. -/
noncomputable def ratModulus (n : ℕ)
    (h : (Ideal.span {(n : 𝓞 ℚ)} : Ideal (𝓞 ℚ)) ≠ ⊥) : Modulus ℚ where
  finitePart := Ideal.span {(n : 𝓞 ℚ)}
  finitePart_ne_bot := h
  infinitePart := Finset.univ

/-! ### Layer 10: infinity types

⚠ A continuous character of the idele class group is **not** determined at infinity by a list of
integer exponents: at a real place there is a continuous parameter through `|x|^(it)`, and at a
complex place there are independent modulus and angular parameters. Three carriers therefore
appear, and every theorem says which one it is about.

* `ContinuousInfinityType` is the general archimedean parameter of an arbitrary
  `HeckeCharacter`;
* `AlgebraicInfinityType` is the integral subcase, the one that produces gamma shifts and
  motivic weights;
* `FiniteOrderInfinityType` is the still smaller subcase realized by finite-order characters,
  which is what the ray-class characters consumed by the L-functions roadmap have. -/

/-- **The archimedean parameters of an arbitrary continuous Hecke character.** By the Layer 10
classification, its restriction to the archimedean part is `x ↦ |x|^(s_w) sgn(x)^(ε_w)` at a real
place `w` and `z ↦ |z|^(s_w) (z/|z|)^(k_w)` at a complex place. The exponents `s_w` are complex:
they are exactly the continuous spectral parameters that a list of integers cannot record. -/
structure ContinuousInfinityType (K : Type u) [Field K] [NumberField K] where
  realExponent : {w : InfinitePlace K // w.IsReal} → ℂ
  realParity : {w : InfinitePlace K // w.IsReal} → ZMod 2
  complexExponent : {w : InfinitePlace K // w.IsComplex} → ℂ
  complexAngular : {w : InfinitePlace K // w.IsComplex} → ℤ

/-- **The integer exponents of an algebraic infinity type**, indexed by embeddings into `ℂ`:
the archimedean component is `x ↦ ∏ σ, σ x ^ (exponent σ)`. -/
structure AlgebraicInfinityType (K : Type u) [Field K] [NumberField K] where
  exponent : (K →+* ℂ) → ℤ

/-- **The infinity type of a finite-order Hecke character**: a parity at each real place. A
continuous finite-order character of `ℂˣ` is trivial, so there is no complex data and no
exponent. -/
structure FiniteOrderInfinityType (K : Type u) [Field K] [NumberField K] where
  parity : {w : InfinitePlace K // w.IsReal} → ZMod 2

/-- The conjugation bookkeeping: at a real place the exponent of the unique embedding is both
the modulus exponent and, mod `2`, the sign parity; at a complex place the two conjugate
embeddings contribute their sum as modulus exponent and their difference as angular frequency. -/
noncomputable def AlgebraicInfinityType.toContinuous (a : AlgebraicInfinityType K) :
    ContinuousInfinityType K where
  realExponent w := (a.exponent w.1.embedding : ℂ)
  realParity w := (a.exponent w.1.embedding : ZMod 2)
  complexExponent w :=
    ((a.exponent w.1.embedding + a.exponent (ComplexEmbedding.conjugate w.1.embedding) : ℤ) : ℂ)
  complexAngular w :=
    a.exponent w.1.embedding - a.exponent (ComplexEmbedding.conjugate w.1.embedding)

theorem AlgebraicInfinityType.toContinuous_injective :
    Function.Injective (AlgebraicInfinityType.toContinuous (K := K)) := sorry

/-- A finite-order character has zero exponents and zero angular frequency. -/
def FiniteOrderInfinityType.toContinuous (e : FiniteOrderInfinityType K) :
    ContinuousInfinityType K where
  realExponent _ := 0
  realParity := e.parity
  complexExponent _ := 0
  complexAngular _ := 0

theorem FiniteOrderInfinityType.toContinuous_injective :
    Function.Injective (FiniteOrderInfinityType.toContinuous (K := K)) := sorry

/-- Agreement of two archimedean parameters on the identity component of the archimedean group:
the exponents and the angular frequencies match, while the sign characters at the real places
are free. ⚠ This, and not equality of `ContinuousInfinityType`s, is the comparison in Weil's
type-`A₀` condition: the sign characters are trivial on the identity component, so a finite-order
sign twist does not change the infinity type of an algebraic character. Requiring full equality
would wrongly declare the quadratic character mod `4` non-algebraic. -/
def ContinuousInfinityType.EqOnIdentityComponent (a b : ContinuousInfinityType K) : Prop :=
  a.realExponent = b.realExponent ∧ a.complexExponent = b.complexExponent ∧
    a.complexAngular = b.complexAngular

/-- A finite-order infinity type agrees on the identity component with the zero algebraic
infinity type: a finite-order Hecke character is algebraic of weight zero, sign character and
all. -/
theorem FiniteOrderInfinityType.eqOnIdentityComponent_zero (e : FiniteOrderInfinityType K) :
    ContinuousInfinityType.EqOnIdentityComponent
      (⟨fun _ => 0⟩ : AlgebraicInfinityType K).toContinuous e.toContinuous := sorry

/-- **The archimedean parameters of a Hecke character.** Every continuous character of the
idele class group has them; only some of them come from an `AlgebraicInfinityType`. -/
noncomputable def HeckeCharacter.infinityType (χ : HeckeCharacter K) :
    ContinuousInfinityType K := sorry

/-- A Hecke character is algebraic (Weil's type `A₀`) when its archimedean parameters agree with
those of an algebraic infinity type on the identity component. -/
def HeckeCharacter.IsAlgebraic (χ : HeckeCharacter K) : Prop :=
  ∃ a : AlgebraicInfinityType K,
    ContinuousInfinityType.EqOnIdentityComponent a.toContinuous χ.infinityType

/-- A Hecke character has finite order when some positive power is trivial. This is the
condition equivalent to open kernel and to factoring through a ray class group. -/
def HeckeCharacter.IsFiniteOrder (χ : HeckeCharacter K) : Prop :=
  ∃ n : ℕ, 0 < n ∧ ∀ y : IdeleClassGroup K, (χ y) ^ n = 1

theorem HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter (χ : HeckeCharacter K) :
    χ.IsFiniteOrder ↔
      ∃ (𝔪 : Modulus K) (η : RayClassCharacter 𝔪),
        HeckeCharacter.ofRayClassCharacter η = χ := sorry

/-- A finite-order character has a `FiniteOrderInfinityType`: no exponent and no angular
frequency, only signs. -/
theorem HeckeCharacter.exists_finiteOrderInfinityType {χ : HeckeCharacter K}
    (hχ : χ.IsFiniteOrder) :
    ∃ e : FiniteOrderInfinityType K, e.toContinuous = χ.infinityType := sorry

/-- Finite order implies algebraic, with weight zero. The converse fails: an algebraic character
of nonzero weight has infinite order. -/
theorem HeckeCharacter.isAlgebraic_of_isFiniteOrder {χ : HeckeCharacter K}
    (hχ : χ.IsFiniteOrder) : χ.IsAlgebraic := sorry

/-- The unramified norm-power character `‖·‖^(it)` on the idele class group. It is trivial on
principal ideles because the idele norm is, so it descends; it is the standard example of a
continuous Hecke character that is neither algebraic nor of finite order. -/
noncomputable def normCharacter (K : Type u) [Field K] [NumberField K] (t : ℝ) :
    HeckeCharacter K := sorry

/-- **Regression: integer exponents do not describe a general Hecke character at infinity.**
For `t ≠ 0` the exponents of `normCharacter K t` are purely imaginary and nonzero, so no
`AlgebraicInfinityType` — and a fortiori no `FiniteOrderInfinityType` — produces them. A
roadmap or implementation that gives `HeckeCharacter` an integer-exponent infinity type
unconditionally contradicts this. -/
theorem not_isAlgebraic_normCharacter {t : ℝ} (ht : t ≠ 0) :
    ¬ (normCharacter K t).IsAlgebraic := sorry

theorem not_isFiniteOrder_normCharacter {t : ℝ} (ht : t ≠ 0) :
    ¬ (normCharacter K t).IsFiniteOrder := sorry

/-! ## Layer 11: orders and Picard groups -/

structure NumberFieldOrder (K : Type u) [Field K] [NumberField K] where
  toSubalgebra : Subalgebra ℤ K
  finite : Module.Finite ℤ toSubalgebra
  spans : Submodule.span ℚ (toSubalgebra : Set K) = ⊤

noncomputable instance (O : NumberFieldOrder K) : IsFractionRing O.toSubalgebra K := sorry

noncomputable def NumberFieldOrder.conductor (O : NumberFieldOrder K) : Ideal (𝓞 K) := sorry

/-- A fractional ideal is proper when it is nonzero and its multiplier ring
`{x : K | ∀ y ∈ I, x * y ∈ I}` is exactly the given order. This predicate does not include
invertibility. -/
def NumberFieldOrder.IsProperFractionalIdeal (O : NumberFieldOrder K)
    (I : FractionalIdeal (O.toSubalgebra)⁰ K) : Prop :=
  I ≠ 0 ∧ ∀ x : K,
    ((∀ y : K, y ∈ I → x * y ∈ I) ↔ x ∈ O.toSubalgebra)

/-- The trace-dual fractional ideal of the order. Membership means that multiplication by every
order element has integral field trace. For the maximal order this is the codifferent. -/
noncomputable def NumberFieldOrder.traceDual (O : NumberFieldOrder K) :
    FractionalIdeal (O.toSubalgebra)⁰ K := sorry

theorem NumberFieldOrder.mem_traceDual_iff (O : NumberFieldOrder K) (x : K) :
    x ∈ O.traceDual ↔
      ∀ y : K, y ∈ O.toSubalgebra →
        ∃ z : ℤ, Algebra.trace ℚ K (x * y) = z := sorry

/-- The trace pairing identifies the trace-dual lattice with the integral linear dual of the
order. This is a target theorem, not an assumption about an unproved Gorenstein predicate. -/
noncomputable def NumberFieldOrder.traceDualEquivZDual (O : NumberFieldOrder K) :
    O.traceDual ≃ₗ[ℤ] Module.Dual ℤ O.toSubalgebra := sorry

/-- The group-valued carrier used by `Pic` and `NarrowPic`: invertible fractional ideals.
Every member is proper, but the converse requires an additional hypothesis on the order. -/
abbrev NumberFieldOrder.invertibleProperFractionalIdeals (O : NumberFieldOrder K) :=
  (FractionalIdeal (O.toSubalgebra)⁰ K)ˣ

theorem NumberFieldOrder.invertible_isProper (O : NumberFieldOrder K)
    (I : O.invertibleProperFractionalIdeals) :
    O.IsProperFractionalIdeal (I : FractionalIdeal (O.toSubalgebra)⁰ K) := sorry

/-- Raw proper fractional ideals, including possible noninvertible ideals. This is not a group. -/
def NumberFieldOrder.properFractionalIdeals (O : NumberFieldOrder K) :=
  {I : FractionalIdeal (O.toSubalgebra)⁰ K // O.IsProperFractionalIdeal I}

/-- A number-field order is Gorenstein when its trace-dual fractional ideal is invertible. -/
def NumberFieldOrder.IsGorenstein (O : NumberFieldOrder K) : Prop := IsUnit O.traceDual

theorem NumberFieldOrder.isProper_iff_isUnit_of_isGorenstein (O : NumberFieldOrder K)
    (hO : O.IsGorenstein) (I : FractionalIdeal (O.toSubalgebra)⁰ K) :
    O.IsProperFractionalIdeal I ↔ IsUnit I := sorry

theorem NumberFieldOrder.isGorenstein_iff_forall_proper_isUnit (O : NumberFieldOrder K) :
    O.IsGorenstein ↔ ∀ I : FractionalIdeal (O.toSubalgebra)⁰ K,
      O.IsProperFractionalIdeal I → IsUnit I := sorry

/-- Cox's proper-ideal equivalence is used only for quadratic orders. -/
theorem NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two (O : NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) (I : FractionalIdeal (O.toSubalgebra)⁰ K) :
    O.IsProperFractionalIdeal I ↔ IsUnit I := sorry

/-- Homothety classes of all nonzero fractional ideals form a monoid, not in general a group. -/
noncomputable def IdealClassMonoid (O : NumberFieldOrder K) : Type u := sorry

noncomputable instance (O : NumberFieldOrder K) : CommMonoid (IdealClassMonoid O) := sorry

noncomputable def NumberFieldOrder.mkIdealClassMonoid (O : NumberFieldOrder K)
    (I : O.properFractionalIdeals) : IdealClassMonoid O := sorry

noncomputable def Pic (O : NumberFieldOrder K) : Type u := ClassGroup O.toSubalgebra

noncomputable instance (O : NumberFieldOrder K) : CommGroup (Pic O) :=
  inferInstanceAs (CommGroup (ClassGroup O.toSubalgebra))

noncomputable def NumberFieldOrder.mkPic (O : NumberFieldOrder K)
    (I : O.invertibleProperFractionalIdeals) : Pic O := sorry

/-- The units in the ideal class monoid are exactly the invertible ideal classes. -/
noncomputable def picEquivUnitsIdealClassMonoid (O : NumberFieldOrder K) :
    Pic O ≃* (IdealClassMonoid O)ˣ := sorry

theorem NumberFieldOrder.mkPic_surjective (O : NumberFieldOrder K) :
    Function.Surjective O.mkPic := sorry

/-- Principal invertible proper ideals with a totally positive generator. -/
noncomputable def NumberFieldOrder.narrowPrincipal (O : NumberFieldOrder K) :
    Subgroup O.invertibleProperFractionalIdeals := sorry

/-- The narrow quotient uses the same invertible carrier as `Pic`. -/
def NarrowPic (O : NumberFieldOrder K) : Type u :=
  O.invertibleProperFractionalIdeals ⧸ O.narrowPrincipal

noncomputable instance (O : NumberFieldOrder K) : CommGroup (NarrowPic O) :=
  inferInstanceAs (CommGroup (O.invertibleProperFractionalIdeals ⧸ O.narrowPrincipal))

/-- The canonical forget-positivity map from the narrow to the wide Picard group. -/
noncomputable def NumberFieldOrder.narrowToPic (O : NumberFieldOrder K) :
    NarrowPic O →* Pic O := sorry

/-- Evaluation of the forget-positivity map on an invertible proper ideal class. -/
theorem NumberFieldOrder.narrowToPic_mk (O : NumberFieldOrder K)
    (I : O.invertibleProperFractionalIdeals) :
    O.narrowToPic (QuotientGroup.mk I) = O.mkPic I := sorry

theorem NumberFieldOrder.narrowToPic_surjective (O : NumberFieldOrder K) :
    Function.Surjective O.narrowToPic := sorry

-- Instance diamond: `AddCommGroup (ZMod 2)` is also derivable from
-- `[IsSimpleAddGroup G] [AddGroup.IsNilpotent G]`, which instance search reaches first for a
-- prime-order `ZMod p`. That structure is equal to `Ring.toAddCommGroup` but not syntactically, so
-- the `CommGroup (Multiplicative (ZMod 2))` it yields does not carry the `Group` instance recorded
-- in a `Subgroup (RealSignGroup K)`, and the quotient group instance below fails to synthesize.
-- Raising the priority of the ring path locally restores it.
attribute [local instance 2000] Ring.toAddCommGroup

/-- Sign vectors at the real places. The quotient by the signs of order units is the
kernel term in the narrow-to-wide exact sequence. -/
abbrev RealSignGroup (K : Type u) [Field K] [NumberField K] :=
  {w : InfinitePlace K // w.IsReal} → Multiplicative (ZMod 2)

noncomputable def NumberFieldOrder.unitSignMap (O : NumberFieldOrder K) :
    O.toSubalgebraˣ →* RealSignGroup K := sorry

def UnitSignQuotient (O : NumberFieldOrder K) : Type u :=
  RealSignGroup K ⧸ O.unitSignMap.range

noncomputable instance (O : NumberFieldOrder K) : CommGroup (UnitSignQuotient O) :=
  inferInstanceAs (CommGroup (RealSignGroup K ⧸ O.unitSignMap.range))

/-- The boundary map in
`Oˣ → {±1}^{r₁} → NarrowPic O → Pic O → 1`. -/
noncomputable def NumberFieldOrder.unitSignBoundary (O : NumberFieldOrder K) :
    UnitSignQuotient O →* NarrowPic O := sorry

theorem NumberFieldOrder.unitSignBoundary_injective (O : NumberFieldOrder K) :
    Function.Injective O.unitSignBoundary := sorry

theorem NumberFieldOrder.ker_narrowToPic (O : NumberFieldOrder K) :
    O.narrowToPic.ker = O.unitSignBoundary.range := sorry

/-! ### Functoriality of `Pic` and `NarrowPic`

Every unital `ℤ`-algebra homomorphism between the finite order subalgebras in number fields is
injective and extends uniquely to a ring homomorphism of their fraction fields. The extension is
not extra input: it is constructed from the fraction-field universal property and is characterized
by its values on the source order. Conversely, restriction of an ambient field homomorphism that
carries the source order into the target recovers such an order algebra homomorphism. This gives an
equivalence between the existing `Hom` carrier and ordinary unital order algebra maps, without a
second morphism structure or an added injectivity hypothesis. The `Hom` carrier remains useful for
stating the ambient map used in fractional-ideal extension. A target real place pulls back to a real
source place, so the same canonical extension also preserves total positivity and induces both
Picard maps. -/

/-- A morphism of orders: the unique ambient field extension of a unital order algebra map,
packaged with its order-preservation proof. Restriction to the order subalgebras recovers the
ordinary algebra map. -/
structure NumberFieldOrder.Hom {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] (O : NumberFieldOrder K) (O' : NumberFieldOrder K') where
  /-- The embedding of fraction fields along which fractional ideals are extended. -/
  toRingHom : K →+* K'
  maps_mem : ∀ x ∈ O.toSubalgebra, toRingHom x ∈ O'.toSubalgebra

/-- Restrict an ambient order morphism to the source and target order subalgebras. -/
noncomputable def NumberFieldOrder.Hom.toAlgHom {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.Hom O') : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra := by
  sorry

/-- Every unital order algebra map is injective: a nonzero kernel element would put a nonzero
integer from its integral minimal polynomial in the kernel. -/
theorem NumberFieldOrder.injective_orderAlgHom {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) : Function.Injective f := by
  sorry

/-- Extend an ordinary unital order algebra map uniquely to the ambient fraction fields and package
that extension in the existing `Hom` carrier. The extension agrees with the given map on `O`. -/
noncomputable def NumberFieldOrder.Hom.ofAlgHom {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) : O.Hom O' := by
  sorry

/-- Restriction of an ambient map has the prescribed values on the order subalgebra. -/
theorem NumberFieldOrder.Hom.toAlgHom_apply {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.Hom O') (x : O.toSubalgebra) : (f.toAlgHom x).val = f.toRingHom x.val := by
  sorry

/-- The canonical extension has the prescribed values on every element of the source order. -/
theorem NumberFieldOrder.Hom.ofAlgHom_apply {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) (x : O.toSubalgebra) :
    (NumberFieldOrder.Hom.ofAlgHom f).toRingHom x.val = (f x).val := by
  sorry

/-- Any ambient field map with these order values is the unique fraction-field extension. -/
theorem NumberFieldOrder.Hom.ofAlgHom_unique {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) (g : K →+* K')
    (hg : ∀ x : O.toSubalgebra, g x.val = (f x).val) :
    (NumberFieldOrder.Hom.ofAlgHom f).toRingHom = g := by
  sorry

/-- Extension respects the identity order map. -/
theorem NumberFieldOrder.Hom.ofAlgHom_id {K : Type u} [Field K] [NumberField K]
    (O : NumberFieldOrder K) :
    (NumberFieldOrder.Hom.ofAlgHom (AlgHom.id ℤ O.toSubalgebra)).toRingHom = RingHom.id K := by
  sorry

/-- Extension respects composition of ordinary order algebra maps. -/
theorem NumberFieldOrder.Hom.ofAlgHom_comp_toRingHom {K₁ K₂ K₃ : Type u}
    [Field K₁] [NumberField K₁] [Field K₂] [NumberField K₂] [Field K₃] [NumberField K₃]
    {O₁ : NumberFieldOrder K₁} {O₂ : NumberFieldOrder K₂} {O₃ : NumberFieldOrder K₃}
    (f : O₁.toSubalgebra →ₐ[ℤ] O₂.toSubalgebra)
    (g : O₂.toSubalgebra →ₐ[ℤ] O₃.toSubalgebra) :
    (NumberFieldOrder.Hom.ofAlgHom (g.comp f)).toRingHom =
      (NumberFieldOrder.Hom.ofAlgHom g).toRingHom.comp (NumberFieldOrder.Hom.ofAlgHom f).toRingHom := by
  sorry

/-- Restricting the canonical extension recovers the original order algebra map. -/
theorem NumberFieldOrder.Hom.toAlgHom_ofAlgHom {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) :
    (NumberFieldOrder.Hom.ofAlgHom f).toAlgHom = f := by
  sorry

/-- Extending the restriction of an ambient morphism recovers that morphism. -/
theorem NumberFieldOrder.Hom.ofAlgHom_toAlgHom {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.Hom O') : NumberFieldOrder.Hom.ofAlgHom f.toAlgHom = f := by
  sorry

/-- The inclusion of one order into a larger order of the same field: the fraction-field
embedding is the identity. This is the case used to compare an order with the maximal order. -/
def NumberFieldOrder.Hom.ofLE {O O' : NumberFieldOrder K}
    (h : O.toSubalgebra ≤ O'.toSubalgebra) : O.Hom O' where
  toRingHom := RingHom.id K
  maps_mem _ hx := h hx

/-- **Control of real places.** A real place of the target restricts to a real place of the
source along the fraction-field embedding, which is what lets positivity conditions be
transported. This is Mathlib's `NumberField.InfinitePlace.IsReal.comap`. -/
theorem NumberFieldOrder.Hom.isReal_comap {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.Hom O') {w : InfinitePlace K'} (hw : w.IsReal) :
    (w.comap f.toRingHom).IsReal :=
  InfinitePlace.IsReal.comap f.toRingHom hw

/-- **Transport of positivity.** A totally positive element of `K` has totally positive image in
`K'`, because every real place of `K'` restricts to a real place of `K`. This is the lemma the
narrow functoriality below rests on; without it `mapNarrowPic` is not well defined. -/
theorem NumberFieldOrder.Hom.pos_of_totallyPos {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.Hom O') {x : K}
    (hx : ∀ (w : InfinitePlace K) (hw : w.IsReal),
      0 < InfinitePlace.embedding_of_isReal hw x)
    {w : InfinitePlace K'} (hw : w.IsReal) :
    0 < InfinitePlace.embedding_of_isReal hw (f.toRingHom x) := sorry

/-- Extension of invertible proper fractional ideals along a morphism of orders. -/
noncomputable def NumberFieldOrder.Hom.mapPic {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.Hom O') : Pic O →* Pic O' := sorry

/-- The narrow analogue. It exists precisely because of
`NumberFieldOrder.Hom.pos_of_totallyPos`. -/
noncomputable def NumberFieldOrder.Hom.mapNarrowPic {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.Hom O') : NarrowPic O →* NarrowPic O' := sorry

theorem NumberFieldOrder.narrowToPic_natural {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.Hom O') :
    f.mapPic.comp O.narrowToPic = O'.narrowToPic.comp f.mapNarrowPic := sorry

/-- The map on `Pic` induced by an ordinary unital order algebra homomorphism, via its unique
ambient fraction-field extension and the existing `Hom.mapPic` construction. -/
noncomputable abbrev NumberFieldOrder.mapPicOfAlgHom {K K' : Type u} [Field K] [NumberField K]
    [Field K'] [NumberField K'] {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) : Pic O →* Pic O' :=
  (NumberFieldOrder.Hom.ofAlgHom f).mapPic

/-- The corresponding ordinary order-algebra-map action on the narrow Picard group. -/
noncomputable abbrev NumberFieldOrder.mapNarrowPicOfAlgHom {K K' : Type u} [Field K]
    [NumberField K] [Field K'] [NumberField K'] {O : NumberFieldOrder K}
    {O' : NumberFieldOrder K'} (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) :
    NarrowPic O →* NarrowPic O' := (NumberFieldOrder.Hom.ofAlgHom f).mapNarrowPic

/-- Picard maps for ordinary order algebra maps respect identity. -/
theorem NumberFieldOrder.mapPicOfAlgHom_id {K : Type u} [Field K] [NumberField K]
    (O : NumberFieldOrder K) :
    NumberFieldOrder.mapPicOfAlgHom (AlgHom.id ℤ O.toSubalgebra) = MonoidHom.id (Pic O) := by
  sorry

/-- Picard maps for ordinary order algebra maps respect composition. -/
theorem NumberFieldOrder.mapPicOfAlgHom_comp {K₁ K₂ K₃ : Type u}
    [Field K₁] [NumberField K₁] [Field K₂] [NumberField K₂] [Field K₃] [NumberField K₃]
    {O₁ : NumberFieldOrder K₁} {O₂ : NumberFieldOrder K₂} {O₃ : NumberFieldOrder K₃}
    (f : O₁.toSubalgebra →ₐ[ℤ] O₂.toSubalgebra)
    (g : O₂.toSubalgebra →ₐ[ℤ] O₃.toSubalgebra) :
    NumberFieldOrder.mapPicOfAlgHom (g.comp f) = (NumberFieldOrder.mapPicOfAlgHom g).comp (NumberFieldOrder.mapPicOfAlgHom f) := by
  sorry

/-- Narrow Picard maps for ordinary order algebra maps respect identity. -/
theorem NumberFieldOrder.mapNarrowPicOfAlgHom_id {K : Type u} [Field K] [NumberField K]
    (O : NumberFieldOrder K) :
    NumberFieldOrder.mapNarrowPicOfAlgHom (AlgHom.id ℤ O.toSubalgebra) = MonoidHom.id (NarrowPic O) := by
  sorry

/-- Narrow Picard maps for ordinary order algebra maps respect composition. -/
theorem NumberFieldOrder.mapNarrowPicOfAlgHom_comp {K₁ K₂ K₃ : Type u}
    [Field K₁] [NumberField K₁] [Field K₂] [NumberField K₂] [Field K₃] [NumberField K₃]
    {O₁ : NumberFieldOrder K₁} {O₂ : NumberFieldOrder K₂} {O₃ : NumberFieldOrder K₃}
    (f : O₁.toSubalgebra →ₐ[ℤ] O₂.toSubalgebra)
    (g : O₂.toSubalgebra →ₐ[ℤ] O₃.toSubalgebra) :
    NumberFieldOrder.mapNarrowPicOfAlgHom (g.comp f) =
      (NumberFieldOrder.mapNarrowPicOfAlgHom g).comp (NumberFieldOrder.mapNarrowPicOfAlgHom f) := by
  sorry

/-- The ordinary algebra-map functoriality obeys the existing narrow-to-wide square. -/
theorem NumberFieldOrder.narrowToPic_natural_ofAlgHom {K K' : Type u} [Field K]
    [NumberField K] [Field K'] [NumberField K'] {O : NumberFieldOrder K}
    {O' : NumberFieldOrder K'} (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) :
    (NumberFieldOrder.mapPicOfAlgHom f).comp O.narrowToPic =
      O'.narrowToPic.comp (NumberFieldOrder.mapNarrowPicOfAlgHom f) :=
  NumberFieldOrder.narrowToPic_natural (NumberFieldOrder.Hom.ofAlgHom f)


/-! Extension and contraction are group equivalences only after restricting to invertible ideals
prime to the conductor. The restrictions are part of the carrier types, not side conditions erased
from the public API. -/

/-- The canonical inclusion of an order into the maximal order, proved from integrality of
elements of a finite `ℤ`-algebra. -/
noncomputable def NumberFieldOrder.orderToMaximalOrder (O : NumberFieldOrder K) :
    O.toSubalgebra →+* 𝓞 K := sorry

/-- Contract the maximal-order conductor to the order through that inclusion. -/
noncomputable def NumberFieldOrder.conductorInOrder (O : NumberFieldOrder K) :
    Ideal O.toSubalgebra :=
  Ideal.comap O.orderToMaximalOrder O.conductor

/-- An order prime is away from the conductor when it is prime and does not contain the
contraction of the maximal-order conductor. -/
def NumberFieldOrder.IsPrimeAwayFromConductor (O : NumberFieldOrder K)
    (p : Ideal O.toSubalgebra) : Prop :=
  p.IsPrime ∧ ¬ O.conductorInOrder ≤ p

def NumberFieldOrder.primesAwayFromConductor (O : NumberFieldOrder K) :=
  {p : Ideal O.toSubalgebra // O.IsPrimeAwayFromConductor p}

def NumberFieldOrder.maximalPrimesAwayFromConductor (O : NumberFieldOrder K) :=
  {p : Ideal (𝓞 K) // p.IsPrime ∧ ¬ O.conductor ≤ p}

/-- Extension and contraction give the prime correspondence only away from the conductor. -/
noncomputable def NumberFieldOrder.primeExtensionContractionEquiv (O : NumberFieldOrder K) :
    O.primesAwayFromConductor ≃ O.maximalPrimesAwayFromConductor := sorry

noncomputable def NumberFieldOrder.invertibleProperIdealsPrimeToConductor
    (O : NumberFieldOrder K) : Subgroup O.invertibleProperFractionalIdeals := sorry

noncomputable def NumberFieldOrder.maximalIdealsPrimeToConductor
    (O : NumberFieldOrder K) : Subgroup (FractionalIdeal (𝓞 K)⁰ K)ˣ := sorry

noncomputable def NumberFieldOrder.extendPrimeToConductor (O : NumberFieldOrder K) :
    O.invertibleProperIdealsPrimeToConductor →*
      O.maximalIdealsPrimeToConductor := sorry

noncomputable def NumberFieldOrder.contractPrimeToConductor (O : NumberFieldOrder K) :
    O.maximalIdealsPrimeToConductor →*
      O.invertibleProperIdealsPrimeToConductor := sorry

theorem NumberFieldOrder.contract_extendPrimeToConductor (O : NumberFieldOrder K) :
    O.contractPrimeToConductor.comp O.extendPrimeToConductor = MonoidHom.id _ := sorry

theorem NumberFieldOrder.extend_contractPrimeToConductor (O : NumberFieldOrder K) :
    O.extendPrimeToConductor.comp O.contractPrimeToConductor = MonoidHom.id _ := sorry

noncomputable def NumberFieldOrder.extensionContractionEquiv (O : NumberFieldOrder K) :
    O.invertibleProperIdealsPrimeToConductor ≃*
      O.maximalIdealsPrimeToConductor := sorry

/-- The maximal order as a `NumberFieldOrder`, making the specialization explicit. -/
noncomputable def maximalNumberFieldOrder
    (K : Type u) [Field K] [NumberField K] : NumberFieldOrder K := sorry

noncomputable def maximalOrderPicEquiv :
    Pic (maximalNumberFieldOrder K) ≃* ClassGroup (𝓞 K) := sorry

abbrev NarrowClassGroup (K : Type u) [Field K] [NumberField K] :=
  NarrowPic (maximalNumberFieldOrder K)

noncomputable def narrowClassToClass :
    NarrowClassGroup K →* ClassGroup (𝓞 K) :=
  (maximalOrderPicEquiv (K := K)).toMonoidHom.comp
    (maximalNumberFieldOrder K).narrowToPic

/-- Compatibility of the order-theoretic map with its maximal-order specialization. -/
theorem narrowClassToClass_eq :
    narrowClassToClass (K := K) =
      (maximalOrderPicEquiv (K := K)).toMonoidHom.comp
        (maximalNumberFieldOrder K).narrowToPic := rfl

/-- Existential corollary of the named map. -/
theorem narrowPic_surjective (O : NumberFieldOrder K) :
    ∃ f : NarrowPic O →* Pic O, Function.Surjective f :=
  ⟨O.narrowToPic, O.narrowToPic_surjective⟩

theorem finite_pic (O : NumberFieldOrder K) : Finite (Pic O) := sorry

theorem finite_narrowPic (O : NumberFieldOrder K) : Finite (NarrowPic O) := sorry

/-- A regression carrier for the cubic example in the normative README. -/
structure NumberFieldOrder.ProperNoninvertibleIdealExample
    (K : Type u) [Field K] [NumberField K] where
  order : NumberFieldOrder K
  ideal : FractionalIdeal (order.toSubalgebra)⁰ K
  proper : order.IsProperFractionalIdeal ideal
  not_invertible : ¬ IsUnit ideal
  not_gorenstein : ¬ order.IsGorenstein

/-- The regression ideal remains a nonunit after passing to the ideal class monoid. -/
theorem NumberFieldOrder.ProperNoninvertibleIdealExample.class_not_isUnit
    (E : NumberFieldOrder.ProperNoninvertibleIdealExample K) :
    ¬ IsUnit (E.order.mkIdealClassMonoid ⟨E.ideal, E.proper⟩) := sorry

/-- The order `ℤ + 2ℤ∛2 + 2ℤ(∛2)²` and ideal
`8ℤ + 2ℤ∛2 + 2ℤ(∛2)²` from the README instantiate this cubic regression. -/
theorem exists_cubic_properNoninvertibleIdealExample :
    ∃ (F : Type u) (_ : Field F) (_ : NumberField F),
      Module.finrank ℚ F = 3 ∧
        Nonempty (NumberFieldOrder.ProperNoninvertibleIdealExample F) := sorry

end TauCetiRoadmap.GlobalNumberFields
