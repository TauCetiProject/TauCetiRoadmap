import Mathlib
import TauCeti.Algebra.Polynomial.Card.RootSetUnion
import TauCeti.NumberTheory.GeometryOfNumbers.Doubling
import TauCeti.NumberTheory.EffectiveBounds.Regulator
import TauCeti.NumberTheory.NumberField.Global.RayClass.MainTerm
import TauCeti.NumberTheory.NumberField.Global.Adeles.Extension
import TauCeti.NumberTheory.NumberField.Global.Orders.IdealClassMonoid
import TauCeti.NumberTheory.NumberField.Global.Orders.Hom

/-!
# Global number fields, ray classes, adeles, and Hecke characters: target signatures

**This file is not the roadmap.** The definitive specification is `README.md`. This file states
the roadmap's headline theorems that are still open at the pinned Tau Ceti, against the pinned
Mathlib and Tau Ceti carriers, each with `sorry`.

The carriers of Layers 0--11 are the pinned Tau Ceti declarations in the namespace
`TauCeti.GlobalNumberFields` (directory `TauCeti/NumberTheory/NumberField/Global/`): `Modulus`,
`Modulus.support`, `Modulus.mem_support_iff`, `IsCongrOne`, `congruenceSubgroup`,
`idealsPrimeTo`, `integralIdealsPrimeTo`, `ray`, `RayClassGroup`, `idealClass`, `classMap`,
`rayClassIdealCountingFunction`, `rayClassIdealMainTerm`, `RayClassCharacter`, `rayClassQuotient`,
`ideleCongruenceSubgroup`, `raySubgroup`, `HeckeCharacter`, the three infinity-type structures,
`NumberFieldOrder`, `Pic`, `NarrowPic` and `IdealClassMonoid`; the adelic extension maps are `NumberField.adeleExtension` and
its components. None of them is restated here.

The following headline theorems are already proved at the pinned Tau Ceti and are therefore not
restated: mixed-place weak approximation (`weakApproximation_denseRange`); finiteness of the ray
class group (the instance `finite_rayClassGroup`); the ray-triviality criteria
(`idealClass_eq_one_iff`, `idealClass_eq_one_iff_exists_integral`); the uniform ray-class ideal
count and its main term (`rayClassIdealCount`, `rayClassIdealMainTerm_eq`,
`tendsto_rayClassIdealCountingFunction_one`); cancellation for a nontrivial ray class character
(`rayClassCharacter_partialSums`); the index of the congruence lattice
(`relIndex_congruenceLattice`) and finite index of the congruence units
(`unitsCongruenceSubgroup_finiteIndex`); additive strong approximation
(`IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap`); the idelic description of ray classes
(`rayClassQuotient_surjective`, `ker_rayClassQuotient`); the shift and unitary part of a Hecke
character (`HeckeCharacter.shift_eq_zero_iff`, `HeckeCharacter.norm_unitaryPart`); the finite-order
criterion (`HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter`); the units of the ideal
class monoid (`IdealClassMonoid.picEquivUnits`); the narrow-to-wide sequence for orders
(`NumberFieldOrder.narrowToPic_surjective`, `NumberFieldOrder.narrowSignQuotientEquivKerNarrowToPic`);
finiteness of `Pic` (`NumberFieldOrder.finite_pic`); and functoriality of both Picard groups along order morphisms
(`NumberFieldOrder.Hom.mapPic_comp`, `NumberFieldOrder.Hom.mapNarrowPic_comp`,
`NumberFieldOrder.narrowToPic_natural`).

Every headline of the README is statable at the pins; nothing is omitted for lack of a carrier.
-/

namespace TauCetiRoadmap.GlobalNumberFields

open Asymptotics Complex Filter NumberField Topology
open IsDedekindDomain (HeightOneSpectrum)
open TauCeti.GlobalNumberFields
open scoped nonZeroDivisors

universe u

variable {K : Type u} [Field K] [NumberField K]

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

omit [Fintype ι] in
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

/-! ## Layer 8: base change of adeles along a finite extension -/

open scoped AdeleExtension in
/-- **Layer 8, the topological base-change comparison.** For a finite extension `L/K` of number
fields there is an isomorphism of topological `𝔸_K`-algebras `𝔸_K ⊗_K L ≃ 𝔸_L` sending
`x ⊗ y` to `adeleExtension x · y`. The `IsModuleTopology` hypothesis pins the topology of the
source; `ContinuousAlgEquiv` carries continuity in both directions, so the comparison is a
homeomorphism and in particular open. Pure tensors span the source, so the displayed formula
determines the comparison; with the pinned `NumberField.adeleExtension_comp` it gives naturality
in towers. The infinite-adelic half is the pinned
`TauCeti.GlobalNumberFields.infiniteAdeleBaseChangeEquiv`. -/
theorem exists_adeleBaseChangeEquiv (L : Type*) [Field L] [NumberField L] [Algebra K L]
    [TopologicalSpace (TensorProduct K (AdeleRing (𝓞 K) K) L)]
    [IsModuleTopology (AdeleRing (𝓞 K) K) (TensorProduct K (AdeleRing (𝓞 K) K) L)] :
    ∃ e : TensorProduct K (AdeleRing (𝓞 K) K) L ≃A[AdeleRing (𝓞 K) K] AdeleRing (𝓞 L) L,
      ∀ (x : AdeleRing (𝓞 K) K) (y : L),
        e (x ⊗ₜ[K] y) =
          NumberField.adeleExtension (𝓞 K) K (𝓞 L) L x * algebraMap L (AdeleRing (𝓞 L) L) y :=
  sorry

/-! ## Layer 11: orders and Picard groups -/

/-- **Gorenstein orders.** An order `O` of `K` is Gorenstein when its trace dual
`{x ∈ K | Tr_{K/ℚ}(x y) ∈ ℤ for all y ∈ O}` (Mathlib's `Submodule.traceDual ℤ ℚ 1`) is an
invertible `O`-submodule of `K`. For the maximal order the trace dual is the codifferent, which is
invertible. -/
def NumberFieldOrder.IsGorenstein (O : NumberFieldOrder K) : Prop :=
  IsUnit (Submodule.traceDual ℤ ℚ (1 : Submodule O.toSubalgebra K))

/-- **Proper ideals of Gorenstein orders.** An order is Gorenstein exactly when every proper
fractional ideal (nonzero, with multiplier ring exactly `O`, the pinned
`NumberFieldOrder.IsProperFractionalIdeal`) is invertible (Marseglia, *Computing abelian
varieties over finite fields isogenous to a power*, 2019, §2). -/
theorem NumberFieldOrder.isGorenstein_iff_forall_proper_isUnit (O : NumberFieldOrder K) :
    NumberFieldOrder.IsGorenstein O ↔
      ∀ I : FractionalIdeal O.toSubalgebra⁰ K, O.IsProperFractionalIdeal I → IsUnit I := sorry

/-- **Quadratic orders.** In a quadratic field every order is Gorenstein, so a fractional ideal
of an order is proper exactly when it is invertible (Cox, *Primes of the form x² + ny²*,
Prop. 7.4). -/
theorem NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two (O : NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) (I : FractionalIdeal O.toSubalgebra⁰ K) :
    O.IsProperFractionalIdeal I ↔ IsUnit I := sorry

/-- Every unital ring homomorphism between orders of number fields is injective: a nonzero kernel
would be a nonzero prime of `O`, which contains a nonzero integer, and that integer is nonzero in
the characteristic-zero domain `O'`. -/
theorem NumberFieldOrder.injective_orderAlgHom {K' : Type*} [Field K'] [NumberField K']
    {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) : Function.Injective f := sorry

/-- **Order maps are order morphisms.** Every unital ring homomorphism `O → O'` between orders of
number fields extends to a unique morphism of orders in the pinned sense
(`TauCeti.GlobalNumberFields.NumberFieldOrder.Hom`, an ambient field homomorphism carrying `O`
into `O'`). The extension is the fraction-field universal property applied to the injective map
`O → O' ⊆ K'`; through the pinned `NumberFieldOrder.Hom.mapPic` and
`NumberFieldOrder.Hom.mapNarrowPic` it makes both Picard groups functorial in ordinary order maps. -/
theorem NumberFieldOrder.existsUnique_hom_of_algHom {K' : Type*} [Field K'] [NumberField K']
    {O : NumberFieldOrder K} {O' : NumberFieldOrder K'}
    (f : O.toSubalgebra →ₐ[ℤ] O'.toSubalgebra) :
    ∃! g : NumberFieldOrder.Hom O O', ∀ x : O.toSubalgebra, g.fieldHom x = f x := sorry

/-- **A proper noninvertible ideal.** There is a cubic field with a non-Gorenstein order and a
proper fractional ideal of it that is not invertible; the README's example is the order
`ℤ + 2ℤ∛2 + 2ℤ(∛2)²` with the ideal `8ℤ + 2ℤ∛2 + 2ℤ(∛2)²`. Its class in the pinned
`IdealClassMonoid` is therefore a nonunit (`IdealClassMonoid.isUnit_mk_iff`). -/
theorem exists_cubic_proper_not_isUnit :
    ∃ (F : Type) (_ : Field F) (_ : NumberField F) (O : NumberFieldOrder F)
      (I : FractionalIdeal O.toSubalgebra⁰ F),
      Module.finrank ℚ F = 3 ∧ O.IsProperFractionalIdeal I ∧ ¬ IsUnit I ∧
        ¬ NumberFieldOrder.IsGorenstein O := sorry

end TauCetiRoadmap.GlobalNumberFields
