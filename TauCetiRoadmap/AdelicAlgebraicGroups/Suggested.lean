import Mathlib
import TauCeti.Algebra.AlgebraicGroup.SplitTorus.Basic
import TauCeti.Algebra.AlgebraicGroup.Dynamic.Parabolic
import TauCeti.Algebra.AlgebraicGroup.Dynamic.LeviDecomposition.Basic
import TauCeti.Algebra.Quaternion.NormForm
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Determinant
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
import TauCeti.Algebra.AlgebraicGroup.AdditiveGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.MultiplicativeGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.BaseChange
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.CharacterLattice.Torsion
import TauCeti.Algebra.AlgebraicGroup.Tangent.Representation
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Central
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Product
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Unipotent.Basic
import TauCeti.NumberTheory.LocalField.NormalizedValuation
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic
import TauCeti.Topology.Algebra.RestrictedProduct.Congr.Basic
import TauCeti.Topology.Algebra.RestrictedProduct.Away.Decomposition
import TauCeti.NumberTheory.NumberField.Global.Ideles.Norm.Basic
import TauCeti.RingTheory.DedekindDomain.FiniteAdeleRing.ClassGroup
import TauCetiRoadmap.ReductiveGroupsPartII.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested

/-!
# Adelic algebraic groups: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures which
can already be stated against the pinned Mathlib and Tau Ceti APIs. It is not an exhaustive list of
the results in any layer.

The file makes its design choices explicit. Adelic points are Tau Ceti's convolution group of
`F`-algebra maps `H → 𝔸_F`, with the evaluation topology, which is the point topology
`PointTopology` of ReductiveGroupsPartII, layer RG2.0, imported from that roadmap's
`Suggested.lean` together with the Weil restriction `WeilRestriction.ResHopf` and its point
adjunction (RG2.0a); only the transitivity of the Weil restriction in Hopf form is stated here,
since RG2.0a states it for the underlying algebra. The idele norm and the base-change comparison
`E ⊗_F 𝔸_F ≃ 𝔸_E` are written in the real-valued and left-factor shapes the adelic statements
use, and comparison theorems tie them to `ideleNorm` and `adeleBaseChangeEquiv` of the Global
number fields roadmap (layers 6 and 8). Measures on restricted products are built as directed
suprema of level measures, not as infinite products of probability measures. Declarations appear
in dependency order; each section heading names the README layer the block belongs to. 
-/

namespace TauCetiRoadmap.AdelicAlgebraicGroups

open TauCetiRoadmap.ReductiveGroupsPartII

set_option autoImplicit false

noncomputable section
open scoped RestrictedProduct Topology ENNReal NNReal TensorProduct Pointwise
open MeasureTheory Filter Set
open scoped Classical
set_option linter.unusedVariables false

local instance (R : Type*) [CommRing R] : Algebra.FiniteType R (SymmetricAlgebra R R) :=
  Algebra.FiniteType.of_surjective
    (SymmetricAlgebra.equivMvPolynomial (Module.Basis.singleton Unit R)).symm.toAlgHom
    (SymmetricAlgebra.equivMvPolynomial (Module.Basis.singleton Unit R)).symm.surjective

/-! ## Layer 0: Restricted products of Haar measures -/

namespace RestrictedProduct
open _root_.RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [hctx1 : ∀ i, IsTopologicalGroup (G i)] [hcount : Countable ι]
  [hT2 : ∀ i, T2Space (G i)] [hLC : ∀ i, LocallyCompactSpace (G i)]
  [hsecond : ∀ i, SecondCountableTopology (G i)] {B : ∀ i, Subgroup (G i)}
  [hBopen : Fact (∀ i, IsOpen (B i : Set (G i)))]
include hctx1 hcount hT2 hLC hsecond hBopen

/-- countably many second countable factors give a second countable
restricted product. -/
theorem secondCountable :
    SecondCountableTopology (Πʳ i, [G i, B i]) := by
  sorry

/-- the Borel σ-algebra on a restricted product. -/
instance instMeasurableSpace : MeasurableSpace (Πʳ i, [G i, B i]) := borel _

instance borelSpace : BorelSpace (Πʳ i, [G i, B i]) := ⟨rfl⟩

theorem measurable_eval (i : ι) [MeasurableSpace (G i)] [BorelSpace (G i)] :
    Measurable (fun x : Πʳ i, [G i, B i] => x i) := by
  sorry

/-- The box with factors `C i`, equal to `B i` for all but finitely many `i`. -/
def box (C : ∀ i, Set (G i)) : Set (Πʳ i, [G i, B i]) := {x | ∀ i, x i ∈ C i}

theorem measurableSet_box [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    (C : ∀ i, Set (G i)) (hC : ∀ i, MeasurableSet (C i))
    (hcof : ∀ᶠ i in cofinite, C i = B i) : MeasurableSet (box (B := B) C) := by
  sorry

theorem measurable_inclusion {S : Set ι} (hS : cofinite ≤ 𝓟 S) :
    @Measurable _ _ (borel _) _ (inclusion G (fun i => (B i : Set (G i))) hS) := by
  sorry

theorem borel_eq_generateFrom_boxes :
    (inferInstance : MeasurableSpace (Πʳ i, [G i, B i])) =
      MeasurableSpace.generateFrom
        {s | ∃ C : ∀ i, Set (G i), (∀ i, IsOpen (C i)) ∧ (∀ᶠ i in cofinite, C i = B i) ∧
          s = box (B := B) C} := by
  sorry

-- Test RestrictedProduct.measurableSet_structureMap_range
example : MeasurableSet {x : Πʳ i, [G i, B i] | ∀ i, x i ∈ B i} := by
  sorry

-- Test RestrictedProduct.borel_finite_index
example [Finite ι] [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    :
    borel (Πʳ i, [G i, B i]) = MeasurableSpace.comap
      (fun x : Πʳ i, [G i, B i] => (⇑x : ∀ i, G i))
      (inferInstance : MeasurableSpace (∀ i, G i)) := by
  sorry

-- Test RestrictedProduct.measurableSet_singleton_not_box
/-- For `ι = ℕ`, `G i = ZMod 4`, `B i = 2(ZMod 4)`: the singleton `{1}` is not a box with
cofinitely trivial factors, yet it is measurable (a decreasing intersection of boxes). -/
example [Infinite ι] [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    (hne : ∀ i, (B i : Set (G i)) ≠ {1}) :
    MeasurableSet ({1} : Set (Πʳ i, [G i, B i])) ∧
      ¬ ∃ C : ∀ i, Set (G i), (∀ᶠ i in cofinite, C i = B i) ∧ box (B := B) C = {1} := by
  sorry

/-- The open subgroup `U_S = ∏_{i ∈ S} G i × ∏_{i ∉ S} B i` of the restricted product. -/
def levelSubgroup (S : Set ι) : Subgroup (Πʳ i, [G i, B i]) where
  carrier := {x | ∀ i ∉ S, x i ∈ B i}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

-- Test RestrictedProduct.box_univ
example : box (B := B) (fun _ => Set.univ) = Set.univ := by
  ext x
  simp [box]

-- Test RestrictedProduct.box_empty_factor
example (j : ι) : box (B := B) (fun i => if i = j then ∅ else Set.univ) = ∅ := by
  ext x
  simp only [box, Set.mem_ofPred_eq, Set.mem_empty_iff_false, iff_false]
  intro h
  simpa using h j

-- Test RestrictedProduct.box_integral
example : box (B := B) (fun i => (B i : Set (G i))) =
    (levelSubgroup (B := B) ∅ : Set (Πʳ i, [G i, B i])) := by
  ext x
  simp [box, levelSubgroup]

-- Test RestrictedProduct.level_all
example : levelSubgroup (B := B) Set.univ = ⊤ := by
  ext x
  simp [levelSubgroup]

-- Test RestrictedProduct.level_singleton
example (j : ι) (x : Πʳ i, [G i, B i]) :
    x ∈ levelSubgroup (B := B) {j} ↔ ∀ i, i ≠ j → x i ∈ B i := by
  simp [levelSubgroup]

-- Test RestrictedProduct.level_reject
example (j : ι) (x : Πʳ i, [G i, B i]) (hx : x j ∉ B j) :
    x ∉ levelSubgroup (B := B) ∅ := by
  intro h
  exact hx (h j (by simp))

theorem isOpen_levelSubgroup (S : Set ι) (hS : S.Finite) :
    IsOpen ((levelSubgroup (B := B) S : Subgroup _) : Set (Πʳ i, [G i, B i])) := by
  sorry

variable [∀ i, MeasurableSpace (G i)] [hctx2 : ∀ i, BorelSpace (G i)]
  [hcB : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
include hctx2 hcB
include hcount hT2 hLC hsecond hcB

/-- the product measure `μ_S` on the level subgroup `U_S`, built from
`Measure.pi` over the finite set `S` and `Measure.infinitePi` of the probability measures
`μ i` restricted to `B i` off `S`. Its product formulas are stated for sigma-finite local
measures (in particular, Haar measures in the stated second countable setting). -/
def levelMeasure (μ : ∀ i, Measure (G i)) (S : Finset ι)
    (hμ : ∀ i ∉ S, μ i (B i) = 1) : Measure (levelSubgroup (B := B) (S : Set ι)) := sorry

theorem levelMeasure_box (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)] (S : Finset ι) (hμ : ∀ i ∉ S, μ i (B i) = 1)
    (C : ∀ i, Set (G i)) (hC : ∀ i ∉ S, C i = B i)
    (hCm : ∀ i, MeasurableSet (C i)) :
    levelMeasure μ S hμ {x | ∀ i, (x : Πʳ i, [G i, B i]) i ∈ C i} = ∏ i ∈ S, μ i (C i) := by
  sorry

theorem levelMeasure_isHaar (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S : Finset ι) (hμ : ∀ i ∉ S, μ i (B i) = 1) :
    (levelMeasure μ S hμ).IsHaarMeasure := by
  sorry

theorem levelMeasure_univ_compact (μ : ∀ i, Measure (G i)) (hcpt : ∀ i, IsCompact (B i : Set (G i)))
    (hμ : ∀ i, μ i (B i) = 1) :
    IsProbabilityMeasure (levelMeasure μ ∅ (fun i _ => hμ i)) := by
  sorry

-- Test RestrictedProduct.levelMeasure_empty_prob
example (μ : ∀ i, Measure (G i)) (hcpt : ∀ i, IsCompact (B i : Set (G i)))
    (hμ : ∀ i, μ i (B i) = 1) : levelMeasure μ ∅ (fun i _ => hμ i) univ = 1 := by
  sorry

-- Test RestrictedProduct.levelMeasure_two_factor
example {G₂ : Fin 2 → Type*} [∀ i, Group (G₂ i)] [∀ i, TopologicalSpace (G₂ i)]
    [∀ i, IsTopologicalGroup (G₂ i)] [∀ i, T2Space (G₂ i)]
    [∀ i, LocallyCompactSpace (G₂ i)] [∀ i, SecondCountableTopology (G₂ i)] {B₂ : ∀ i, Subgroup (G₂ i)}
    [Fact (∀ i, IsOpen (B₂ i : Set (G₂ i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B₂ i : Set (G₂ i)))] [∀ i, MeasurableSpace (G₂ i)] [∀ i, BorelSpace (G₂ i)]
    (μ : ∀ i, Measure (G₂ i)) [∀ i, SigmaFinite (μ i)] :
    Measure.map (fun x : levelSubgroup (B := B₂) ((Finset.univ : Finset (Fin 2)) : Set (Fin 2)) =>
        (⇑(x : Πʳ i, [G₂ i, B₂ i]) : ∀ i, G₂ i))
      (levelMeasure μ Finset.univ (fun i h => absurd (Finset.mem_univ i) h)) =
      Measure.pi μ := by
  sorry

-- Test RestrictedProduct.levelMeasure_unnormalized_factor
/-- The factors indexed by `S` are not normalized: with `S = {i₀}` the mass of `{x | x i₀ ∈ C}` is
`μ i₀ C` whatever `μ i₀ (B i₀)` is (counting measure on `ZMod 4`, `C = {0}`: value `1`, not `1/2`). -/
example (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)] (i₀ : ι)
    (hμ : ∀ i ∉ ({i₀} : Finset ι), μ i (B i) = 1) (C : Set (G i₀)) (hC : MeasurableSet C) :
    levelMeasure μ {i₀} hμ {x | (x : Πʳ i, [G i, B i]) i₀ ∈ C} = μ i₀ C := by
  sorry

/-- the restricted product of Haar measures. -/
def haarProduct (μ : ∀ i, Measure (G i)) (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1) :
    Measure (Πʳ i, [G i, B i]) := sorry

variable (μ : ∀ i, Measure (G i)) [hSigma : ∀ i, SigmaFinite (μ i)]
  (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)
include hSigma

theorem haarProduct_restrict_level (S : Finset ι) (hS : ∀ i ∉ S, μ i (B i) = 1) :
    (haarProduct μ hμ).restrict (levelSubgroup (B := B) (S : Set ι)) =
      Measure.map Subtype.val (levelMeasure μ S hS) := by
  sorry

-- Test RestrictedProduct.restrict_empty: the compact integral level has mass one.
example (h1 : ∀ i, μ i (B i) = 1) :
    (haarProduct μ hμ).restrict (levelSubgroup (B := B) (∅ : Set ι)) =
      Measure.map Subtype.val (levelMeasure μ ∅ (fun i _ => h1 i)) := by
  simpa using haarProduct_restrict_level μ hμ ∅ (fun i _ => h1 i)

-- Test RestrictedProduct.restrict_singleton: an exceptional mass is not divided out.
example (j : ι) (hS : ∀ i ∉ ({j} : Finset ι), μ i (B i) = 1)
    (hj : μ j (B j) = 2) :
    (haarProduct μ hμ).restrict (levelSubgroup (B := B) ({j} : Set ι)) =
      Measure.map Subtype.val (levelMeasure μ {j} hS) ∧
    (haarProduct μ hμ).restrict (levelSubgroup (B := B) ({j} : Set ι))
      (box (B := B) (fun i => (B i : Set (G i)))) = 2 := by
  sorry

-- Test RestrictedProduct.restrict_all: a finite full level is the whole measure.
example [Fintype ι] :
    haarProduct μ hμ = Measure.map Subtype.val
      (levelMeasure (B := B) μ Finset.univ (by simp)) := by
  sorry

theorem haarProduct_eq_of_restrict (ν : Measure (Πʳ i, [G i, B i]))
    (hν : ∀ (S : Finset ι) (hS : ∀ i ∉ S, μ i (B i) = 1),
      ν.restrict (levelSubgroup (B := B) (S : Set ι)) = Measure.map Subtype.val (levelMeasure μ S hS)) :
    ν = haarProduct μ hμ := by
  sorry

theorem haarProduct_box (C : ∀ i, Set (G i)) (hC : ∀ i, MeasurableSet (C i))
    (hcof : ∀ᶠ i in cofinite, C i = B i) :
    haarProduct μ hμ (box (B := B) C) = ∏ᶠ i, μ i (C i) := by
  sorry

theorem haarProduct_isHaarMeasure [∀ i, (μ i).IsHaarMeasure]
    (hcpt : ∀ᶠ i in cofinite, IsCompact (B i : Set (G i))) :
    (haarProduct μ hμ).IsHaarMeasure := by
  sorry

theorem haarProduct_smul (c : ι → ℝ≥0∞) (hc : ∀ᶠ i in cofinite, c i = 1) (hpos : ∀ i, c i ≠ 0 ∧ c i ≠ ∞)
    (hcμ : ∀ᶠ i in cofinite, (c i • μ i) (B i) = 1) :
    haarProduct (fun i => c i • μ i) hcμ = (∏ᶠ i, c i) • haarProduct μ hμ := by
  sorry

-- Test RestrictedProduct.haarProduct_compact_open_box
example (h1 : ∀ i, μ i (B i) = 1) :
    haarProduct μ hμ {x : Πʳ i, [G i, B i] | ∀ i, x i ∈ B i} = 1 := by
  sorry

/-- An exceptional local mass two survives in the integral box. -/
example (j : ι) (hj : μ j (B j) = 2) (hother : ∀ i, i ≠ j → μ i (B i) = 1) :
    haarProduct μ hμ (box (B := B) (fun i => (B i : Set (G i)))) = 2 := by
  sorry

/-- Two exceptional factors with masses two and three contribute six. -/
example (j k : ι) (hjk : j ≠ k) (hj : μ j (B j) = 2) (hk : μ k (B k) = 3)
    (hother : ∀ i, i ≠ j → i ≠ k → μ i (B i) = 1) :
    haarProduct μ hμ (box (B := B) (fun i => (B i : Set (G i)))) = 6 := by
  sorry

-- Test RestrictedProduct.haarProduct_finite_index
example [Fintype ι] :
    Measure.map (fun x : Πʳ i, [G i, B i] => (⇑x : ∀ i, G i)) (haarProduct μ hμ) = Measure.pi μ := by
  sorry

-- Test RestrictedProduct.haarProduct_not_probability_product
/-- The restricted product of Haar measures of noncompact groups is not a product of probability
measures: it gives infinite mass to the whole group. -/
example [Infinite ι] [∀ i, (μ i).IsHaarMeasure]
    (hnc : ∃ i, μ i univ = ∞) : haarProduct μ hμ univ = ∞ := by
  sorry

-- Test RestrictedProduct.haar_left_translation: translation preserves the actual measure.
example [∀ i, (μ i).IsHaarMeasure] (g : Πʳ i, [G i, B i]) :
    Measure.map (g * ·) (haarProduct μ hμ) = haarProduct μ hμ := by
  sorry

-- Test RestrictedProduct.haar_compact_finite: Haar mass is finite on each compact set.
example [∀ i, (μ i).IsHaarMeasure] (C : Set (Πʳ i, [G i, B i]))
    (hC : IsCompact C) : haarProduct μ hμ C < ∞ := by
  sorry

-- Test RestrictedProduct.haar_open_positive: nonempty open sets have nonzero mass.
example [∀ i, (μ i).IsHaarMeasure] (V : Set (Πʳ i, [G i, B i]))
    (hV : IsOpen V) (hne : V.Nonempty) : 0 < haarProduct μ hμ V := by
  sorry

/-- Right invariance passes from the factors to the restricted product measure. -/
theorem haarProduct_isMulRightInvariant [∀ i, (μ i).IsMulRightInvariant] :
    (haarProduct μ hμ).IsMulRightInvariant := by
  sorry

end RestrictedProduct

namespace RestrictedProduct
open _root_.RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [hctx3 : ∀ i, IsTopologicalGroup (G i)] [hcount : Countable ι]
  [hT2 : ∀ i, T2Space (G i)] [hLC : ∀ i, LocallyCompactSpace (G i)]
  [hsecond : ∀ i, SecondCountableTopology (G i)]
include hctx3 hcount hT2 hLC hsecond

/-- changing the restricting subgroups at finitely many
indices does not change the restricted product. The isomorphism is Tau Ceti's
`restrictedProductCongr` with its continuity in both directions; its measure compatibility is `map_changeSubgroups_haarProduct`. -/
def changeSubgroups (B B' : ∀ i, Subgroup (G i))
    [Fact (∀ i, IsOpen (B i : Set (G i)))] [Fact (∀ i, IsOpen (B' i : Set (G i)))] (h : ∀ᶠ i in cofinite, B i = B' i) :
    (Πʳ i, [G i, B i]) ≃ₜ* (Πʳ i, [G i, B' i]) :=
  { TauCeti.restrictedProductCongr B B' h with
    continuous_toFun := TauCeti.continuous_restrictedProductCongr B B' h
    continuous_invFun := TauCeti.continuous_restrictedProductCongr_symm B B' h }

/-- , measure clause: the identification carries the
restricted Haar product for `B` to the one for `B'`. -/
theorem map_changeSubgroups_haarProduct [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    (B B' : ∀ i, Subgroup (G i))
    [Fact (∀ i, IsOpen (B i : Set (G i)))] [Fact (∀ i, IsOpen (B' i : Set (G i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B' i : Set (G i)))]
    (h : ∀ᶠ i in cofinite, B i = B' i) (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
    (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1) (hμ' : ∀ᶠ i in cofinite, μ i (B' i) = 1) :
    Measure.map (changeSubgroups B B' h) (haarProduct (B := B) μ hμ) =
      haarProduct (B := B') μ hμ' := by
  sorry

variable {B : ∀ i, Subgroup (G i)} [hBopen : Fact (∀ i, IsOpen (B i : Set (G i)))]
include hBopen

/-- splitting off finitely many factors. The group isomorphism
is Tau Ceti's `awayDecomposition` (with the finite set of indices as a `Set`); this form fixes the
product carrier with the subtype away from `S` and the continuity the Fubini statements consume. -/
def splitFinite (S : Finset ι) :
    (Πʳ i, [G i, B i]) ≃ₜ* ((∀ i : S, G i) × Πʳ (i : {i // i ∉ S}), [G i, B i]) :=
  { TauCeti.awayDecomposition (S : Set ι) S.finite_toSet B with
    continuous_toFun := TauCeti.continuous_awayDecomposition (S : Set ι) S.finite_toSet B
    continuous_invFun := TauCeti.continuous_awayDecomposition_symm (S : Set ι) S.finite_toSet B
      (fun i _ => hBopen.out i) }

theorem splitFinite_mono (S S' : Finset ι) (h : S ⊆ S') (x : Πʳ i, [G i, B i]) :
    (∀ i : S, (splitFinite S' x).1 ⟨i, h i.2⟩ = (splitFinite S x).1 i) ∧
      ∀ i : {i // i ∉ S'}, (splitFinite S' x).2 i =
        (splitFinite S x).2 ⟨i, fun hi => i.2 (h hi)⟩ := by
  sorry

-- Test RestrictedProduct.splitFinite_empty
example [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
    (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
    (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)
    (hμ' : ∀ᶠ i : {i // i ∉ (∅ : Finset ι)} in cofinite, μ i (B i) = 1) :
    Measure.map (splitFinite (B := B) ∅) (haarProduct μ hμ) =
      (Measure.pi (fun i : (∅ : Finset ι) => μ i)).prod
        (haarProduct (fun i : {i // i ∉ (∅ : Finset ι)} => μ i) hμ') := by
  sorry

-- Test RestrictedProduct.splitFinite_univ_finite
example [Fintype ι] [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
    (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
    (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)
    (hμ' : ∀ᶠ i : {i // i ∉ (Finset.univ : Finset ι)} in cofinite, μ i (B i) = 1) :
    Measure.map (splitFinite (B := B) Finset.univ) (haarProduct μ hμ) =
      (Measure.pi (fun i : (Finset.univ : Finset ι) => μ i)).prod
        (haarProduct (fun i : {i // i ∉ (Finset.univ : Finset ι)} => μ i) hμ') := by
  sorry

-- Test RestrictedProduct.splitFinite_not_infinite
/-- A family lying outside `B i` at infinitely many indices (such as `(1/p)_p` in `∏_p ℚ_p`
with `B p = ℤ_p`) is not an element of the restricted product. -/
example (x : ∀ i, G i) (h : Set.Infinite {i | x i ∉ B i}) : ¬ ∀ᶠ i in cofinite, x i ∈ B i := by
  sorry

variable [∀ i, MeasurableSpace (G i)] [hctx4 : ∀ i, BorelSpace (G i)]
  [hcB : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
include hctx4 hcB
include hcount hT2 hLC hsecond hcB
variable (μ : ∀ i, Measure (G i)) [hSigma : ∀ i, SigmaFinite (μ i)]
  (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)
include hSigma

/-- Fubini for restricted product measures. -/
theorem haarProduct_split (S : Finset ι)
    (hμ' : ∀ᶠ (i : {i // i ∉ S}) in cofinite, μ i (B i) = 1) :
    Measure.map (splitFinite (B := B) S) (haarProduct μ hμ) =
      (Measure.pi (fun i : S => μ i)).prod (haarProduct (fun i : {i // i ∉ S} => μ i) hμ') := by
  sorry

theorem integral_haarProduct_factorizable (f : ∀ i, G i → ℂ) (hf : ∀ i, Integrable (f i) (μ i))
    (hB : ∀ᶠ i in cofinite, f i = (B i : Set (G i)).indicator 1) :
    ∫ x, (∏ᶠ i, f i (x i)) ∂(haarProduct μ hμ) = ∏ᶠ i, ∫ g, f i g ∂(μ i) := by
  sorry

omit hSigma in
theorem modularCharacter_haarProduct
    [LocallyCompactSpace (Πʳ i, [G i, B i])] (x : Πʳ i, [G i, B i]) :
    Measure.modularCharacter x = ∏ᶠ i, Measure.modularCharacter (x i) := by
  sorry

theorem map_haarProduct {G' : ι → Type*} [∀ i, Group (G' i)] [∀ i, TopologicalSpace (G' i)]
    [∀ i, IsTopologicalGroup (G' i)] [∀ i, T2Space (G' i)]
    [∀ i, LocallyCompactSpace (G' i)] [∀ i, SecondCountableTopology (G' i)]
    [∀ i, MeasurableSpace (G' i)] [∀ i, BorelSpace (G' i)]
    {B' : ∀ i, Subgroup (G' i)} [Fact (∀ i, IsOpen (B' i : Set (G' i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B' i : Set (G' i)))]
    (φ : ∀ i, G i ≃ₜ* G' i) (hφ : ∀ᶠ i in cofinite, (B i).map (φ i : G i →* G' i) = B' i)
    (Φ : (Πʳ i, [G i, B i]) ≃ₜ* (Πʳ i, [G' i, B' i])) (hΦ : ∀ x i, Φ x i = φ i (x i))
    (hμ' : ∀ᶠ i in cofinite, (Measure.map (φ i) (μ i)) (B' i) = 1) :
    Measure.map Φ (haarProduct μ hμ) = haarProduct (fun i => Measure.map (φ i) (μ i)) hμ' := by
  sorry

end RestrictedProduct

namespace RestrictedProduct

-- Test RestrictedProduct.factorizable_empty: the empty product is one on a one-point space.
example :
    let B : Fin 0 → Subgroup (Multiplicative (ZMod 2)) := fun _ => ⊤
    letI : MeasurableSpace (Multiplicative (ZMod 2)) := borel _
    letI : Fact (∀ i, IsOpen (B i : Set (Multiplicative (ZMod 2)))) := ⟨by simp [B]⟩
    letI : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (Multiplicative (ZMod 2)))) :=
      ⟨Filter.Eventually.of_forall (fun _ => isCompact_univ)⟩
    (∫ _x : Πʳ i, [Multiplicative (ZMod 2), B i],
      (∏ _i : Fin 0, (2 : ℂ))
      ∂(haarProduct (B := B) (fun _ => Measure.count) (by simp))) = 1 := by
  sorry

-- Test RestrictedProduct.factorizable_one: counting two points gives integral 4 for constant 2.
example :
    let B : Fin 1 → Subgroup (Multiplicative (ZMod 2)) := fun _ => ⊤
    letI : MeasurableSpace (Multiplicative (ZMod 2)) := borel _
    letI : Fact (∀ i, IsOpen (B i : Set (Multiplicative (ZMod 2)))) := ⟨by simp [B]⟩
    letI : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (Multiplicative (ZMod 2)))) :=
      ⟨Filter.Eventually.of_forall (fun _ => isCompact_univ)⟩
    (∫ _x : Πʳ i, [Multiplicative (ZMod 2), B i], (2 : ℂ)
      ∂(haarProduct (B := B) (fun _ => Measure.count) (by simp))) = 4 := by
  sorry

-- Test RestrictedProduct.factorizable_two: the integrals 4 and 6 multiply to 24.
example :
    let B : Fin 2 → Subgroup (Multiplicative (ZMod 2)) := fun _ => ⊤
    letI : MeasurableSpace (Multiplicative (ZMod 2)) := borel _
    letI : Fact (∀ i, IsOpen (B i : Set (Multiplicative (ZMod 2)))) := ⟨by simp [B]⟩
    letI : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (Multiplicative (ZMod 2)))) :=
      ⟨Filter.Eventually.of_forall (fun _ => isCompact_univ)⟩
    (∫ _x : Πʳ i, [Multiplicative (ZMod 2), B i], (2 : ℂ) * 3
      ∂(haarProduct (B := B) (fun _ => Measure.count) (by simp))) = 24 := by
  sorry

end RestrictedProduct

/-- the volumes `1 - p⁻¹` of `ℤ_p^×` for the measures
`|dx/x|_p` have divergent product, so convergence factors are needed. -/
theorem tamagawa_convergence_failure :
    Tendsto (fun N : ℕ => ∏ p ∈ Finset.filter Nat.Prime (Finset.range N), (1 - (p : ℝ)⁻¹))
      atTop (𝓝 0) := by
  sorry

namespace NumberField
open _root_.NumberField

variable (K : Type*) [Field K] [NumberField K]

instance : MeasurableSpace (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) := borel _
instance : BorelSpace (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) := ⟨rfl⟩
instance : MeasurableSpace (AdeleRing (𝓞 K) K) := borel _
instance : BorelSpace (AdeleRing (𝓞 K) K) := ⟨rfl⟩
instance : MeasurableSpace (IdeleGroup (𝓞 K) K) := borel _
instance : BorelSpace (IdeleGroup (𝓞 K) K) := ⟨rfl⟩
instance : MeasurableSpace (InfiniteAdeleRing K) := borel _
instance : BorelSpace (InfiniteAdeleRing K) := ⟨rfl⟩
instance : MeasurableSpace (InfiniteAdeleRing K)ˣ := borel _

/-- The archimedean component of an adele. -/
def adeleInfPart : AdeleRing (𝓞 K) K →+* InfiniteAdeleRing K := RingHom.fst _ _

/-- The compact open subring `∏_v 𝒪_v` of the finite adeles. -/
def finiteIntegers : Set (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) :=
  {x | ∀ v, x v ∈ v.adicCompletionIntegers K}

def finiteAdeleHaar : Measure (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) := sorry

@[simp] theorem finiteAdeleHaar_integers : finiteAdeleHaar K (finiteIntegers K) = 1 := by
  sorry

theorem finiteAdeleHaar_isAddHaar : (finiteAdeleHaar K).IsAddHaarMeasure := by
  sorry

/-- The idele norm of a finite idele, the product of the normalized absolute values. -/
def finiteIdeleNorm (a : (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)ˣ) : ℝ≥0∞ := sorry

theorem finiteAdeleHaar_smul (a : (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)ˣ) :
    Measure.map (fun x => (a : IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) * x) (finiteAdeleHaar K) =
      (finiteIdeleNorm K a)⁻¹ • finiteAdeleHaar K := by
  sorry

-- Test NumberField.finiteAdeleHaar_ideal
example (I : Ideal (𝓞 K)) (hI : I ≠ ⊥) :
    finiteAdeleHaar K (closure (algebraMap (𝓞 K) (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) '' I)) =
      (Ideal.absNorm I : ℝ≥0∞)⁻¹ := by
  sorry

-- Test NumberField.finiteAdeleHaar_rat_twoZ2
example (v₂ : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ))
    (hv₂ : (Ideal.absNorm v₂.asIdeal) = 2) :
    finiteAdeleHaar ℚ {x | ∀ v, x v ∈ v.adicCompletionIntegers ℚ ∧
      (v = v₂ → Valued.v (x v) < 1)} = 1 / 2 := by
  sorry

-- Test NumberField.finiteAdeleHaar_not_finite
example : ¬ IsFiniteMeasure (finiteAdeleHaar K) := by
  sorry

/-- The archimedean measure: Lebesgue measure at real places and twice Lebesgue at complex places,
transported from the mixed space. -/
def infiniteAdeleHaar : Measure (InfiniteAdeleRing K) := sorry

def adeleHaar : Measure (AdeleRing (𝓞 K) K) := sorry

theorem adeleHaar_isAddHaar : (adeleHaar K).IsAddHaarMeasure := by
  sorry

theorem adeleHaar_prod (s : Set (InfiniteAdeleRing K)) (t : Set (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K))
    (hs : MeasurableSet s) (ht : MeasurableSet t) :
    adeleHaar K (s ×ˢ t) = infiniteAdeleHaar K s * finiteAdeleHaar K t := by
  sorry

open scoped Classical in
theorem adeleHaar_infinite_eq_mixed (s : Set (mixedEmbedding.mixedSpace K)) (hs : MeasurableSet s) :
    infiniteAdeleHaar K (InfiniteAdeleRing.ringEquiv_mixedSpace K ⁻¹' s) =
      (2 : ℝ≥0∞) ^ InfinitePlace.nrComplexPlaces K * volume s := by
  sorry

-- Test NumberField.adeleHaar_box_rat
example : adeleHaar ℚ (((InfiniteAdeleRing.ringEquiv_mixedSpace ℚ) ⁻¹'
    {x | ∀ w, x.1 w ∈ Ico (0 : ℝ) 1}) ×ˢ finiteIntegers ℚ) = 1 := by
  sorry

-- Test NumberField.adeleHaar_complex_factor
example (K : Type*) [Field K] [NumberField K] (h : InfinitePlace.nrRealPlaces K = 0) (h' : InfinitePlace.nrComplexPlaces K = 1) :
    adeleHaar K (((InfiniteAdeleRing.ringEquiv_mixedSpace K) ⁻¹'
      {x | ∀ w, (x.2 w).re ∈ Icc (0 : ℝ) 1 ∧ (x.2 w).im ∈ Icc (0 : ℝ) 1}) ×ˢ finiteIntegers K) = 2 := by
  sorry

-- Test NumberField.adeleHaar_covolume
open scoped Classical in
/-- The `𝓞_K` parallelotope in `K_∞` times `∏_v 𝒪_v` is a fundamental domain for `K` in `𝔸_K`;
its mass is `2^{r₂} · 2^{-r₂} |d_K|^{1/2}`. The self-dual measure gives it volume one. -/
example : adeleHaar K (((InfiniteAdeleRing.ringEquiv_mixedSpace K) ⁻¹'
    ZSpan.fundamentalDomain (mixedEmbedding.latticeBasis K)) ×ˢ finiteIntegers K) =
      ENNReal.ofReal (Real.sqrt |(discr K : ℝ)|) := by
  sorry

/-- The archimedean idele measure: `dx/|x|` at real places and `2 dx dy/(x² + y²)` at complex
places; fixed by `infiniteIdeleHaar_eq_withDensity`. -/
def infiniteIdeleHaar : Measure (InfiniteAdeleRing K)ˣ := sorry

/-- On the units of `K_∞`, `infiniteIdeleHaar` is `infiniteAdeleHaar` with density
`∏_w |x_w|_w⁻¹`, the normalized absolute value being squared at complex places
(`mixedEmbedding.norm`). -/
theorem infiniteIdeleHaar_eq_withDensity :
    Measure.map (Units.val : (InfiniteAdeleRing K)ˣ → InfiniteAdeleRing K) (infiniteIdeleHaar K) =
      ((infiniteAdeleHaar K).withDensity (fun x => ENNReal.ofReal
        (mixedEmbedding.norm (InfiniteAdeleRing.ringEquiv_mixedSpace K x))⁻¹)).restrict
        {x | IsUnit x} := by
  sorry

-- Test NumberField.infiniteIdeleHaar_annulus: at the complex place of an imaginary quadratic
-- field the annulus `1 ≤ |z| ≤ e` has mass `4π` for `2 dx dy/(x² + y²)`; the measure
-- `dx dy/(x² + y²)` would give `2π`.
example (K : Type*) [Field K] [NumberField K] (h : InfinitePlace.nrRealPlaces K = 0)
    (h' : InfinitePlace.nrComplexPlaces K = 1) :
    infiniteIdeleHaar K {x | ∀ w, ‖(InfiniteAdeleRing.ringEquiv_mixedSpace K
        (x : InfiniteAdeleRing K)).2 w‖ ∈ Icc (1 : ℝ) (Real.exp 1)} =
      ENNReal.ofReal (4 * Real.pi) := by
  sorry

def ideleHaar : Measure (IdeleGroup (𝓞 K) K) := sorry

theorem ideleHaar_isHaar : (ideleHaar K).IsHaarMeasure := by
  sorry

theorem ideleHaar_units (C : Set (InfiniteAdeleRing K)ˣ) (hC : MeasurableSet C) :
    ideleHaar K {x | (∀ v, (x : AdeleRing (𝓞 K) K).2 v ∈ v.adicCompletionIntegers K ∧
        ((x⁻¹ : IdeleGroup (𝓞 K) K) : AdeleRing (𝓞 K) K).2 v ∈ v.adicCompletionIntegers K) ∧
      (Units.map (adeleInfPart K).toMonoidHom x) ∈ C} =
      infiniteIdeleHaar K C := by
  sorry

theorem ideleHaar_invariant_principal (a : Kˣ) :
    Measure.map (fun x : IdeleGroup (𝓞 K) K => Units.map (algebraMap K (AdeleRing (𝓞 K) K)) a * x)
      (ideleHaar K) = ideleHaar K := by
  sorry

-- Test NumberField.ideleHaar_rat_box
example : ideleHaar ℚ {x | (∀ v, (x : AdeleRing (𝓞 ℚ) ℚ).2 v ∈ v.adicCompletionIntegers ℚ ∧
    ((x⁻¹ : IdeleGroup (𝓞 ℚ) ℚ) : AdeleRing (𝓞 ℚ) ℚ).2 v ∈ v.adicCompletionIntegers ℚ) ∧
    ∀ w, ((InfiniteAdeleRing.ringEquiv_mixedSpace ℚ)
      (x : AdeleRing (𝓞 ℚ) ℚ).1).1 w ∈ Icc (1 : ℝ) (Real.exp 1)} = 1 := by
  sorry

-- Test NumberField.ideleHaar_neq_restrict_adele
example : adeleHaar K (Set.range (fun x : IdeleGroup (𝓞 K) K => (x : AdeleRing (𝓞 K) K))) = 0 := by
  sorry

-- Test NumberField.ideleHaar_form_factor
/-- At a finite place, with the additive normalization `μ_v(𝒪_v) = 1`, the units `𝒪_v^×` (where
`|x|_v = 1`, so `dx/|x|_v = dx`) have volume `1 - q_v⁻¹`. -/
example (v : IsDedekindDomain.HeightOneSpectrum (𝓞 K)) [MeasurableSpace (v.adicCompletion K)] [BorelSpace (v.adicCompletion K)]
    (μv : Measure (v.adicCompletion K)) [μv.IsAddHaarMeasure]
    (hμv : μv (v.adicCompletionIntegers K) = 1) :
    μv {x | x ∈ v.adicCompletionIntegers K ∧ Valued.v x = 1} =
      1 - (Ideal.absNorm v.asIdeal : ℝ≥0∞)⁻¹ := by
  sorry

-- Test NumberField.ideleHaar_form_factor (global clause)
/-- For `K = ℚ` the factor at `2` is `(1 - 2⁻¹)⁻¹ |dx/x|_2`: the set `x_2 ∈ 1 + 4ℤ_2`,
`x_p ∈ ℤ_p^×` (`p` odd), `x_∞ ∈ [1, e]` has mass `2 · 4⁻¹ = 1/2` (it would be `1/4` without it). -/
example (v₂ : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ)) (hv₂ : Ideal.absNorm v₂.asIdeal = 2) :
    ideleHaar ℚ {x | (∀ v, (x : AdeleRing (𝓞 ℚ) ℚ).2 v ∈ v.adicCompletionIntegers ℚ ∧
        ((x⁻¹ : IdeleGroup (𝓞 ℚ) ℚ) : AdeleRing (𝓞 ℚ) ℚ).2 v ∈ v.adicCompletionIntegers ℚ) ∧
      Valued.v ((x : AdeleRing (𝓞 ℚ) ℚ).2 v₂ - 1) ≤ Valued.v (4 : v₂.adicCompletion ℚ) ∧
      ∀ w, ((InfiniteAdeleRing.ringEquiv_mixedSpace ℚ) (x : AdeleRing (𝓞 ℚ) ℚ).1).1 w ∈
        Icc (1 : ℝ) (Real.exp 1)} = 1 / 2 := by
  sorry

end NumberField

namespace RealSiegel
/-- `b` is `(e, C)`-reduced in the standard basis `e` (Gram matrix `b`). -/
def IsReduced {n : ℕ} (C : ℝ) (b : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  (∀ i j, |b i j| < C * b i i) ∧ (∀ i j, i < j → b i i < C * b j j) ∧ (∏ i, b i i < C * b.det)

variable {n : ℕ}

theorem IsReduced.mono {C C' : ℝ} {b : Matrix (Fin n) (Fin n) ℝ} (h : IsReduced C b) (hC : C ≤ C')
    (hb : b.PosDef) : IsReduced C' b := by
  sorry

theorem IsReduced.smul {C c : ℝ} {b : Matrix (Fin n) (Fin n) ℝ} (hc : 0 < c) :
    IsReduced C b ↔ IsReduced C (c • b) := by
  sorry

-- Test RealSiegel.IsReduced_identity
example : IsReduced 2 (1 : Matrix (Fin n) (Fin n) ℝ) := by
  sorry

-- Test RealSiegel.IsReduced_dim_one
example (C : ℝ) (hC : 1 < C) (b : Matrix (Fin 1) (Fin 1) ℝ) (hb : 0 < b 0 0) : IsReduced C b := by
  sorry

-- Test RealSiegel.IsReduced_not_ordered
example : ¬ IsReduced 2 (Matrix.diagonal ![(4 : ℝ), 1]) ∧ IsReduced 2 (Matrix.diagonal ![(1 : ℝ), 4]) := by
  sorry

-- Test RealSiegel.IsReduced_positive_scale: [1] and [2] have the same reducedness.
example : IsReduced 2 (!![1] : Matrix (Fin 1) (Fin 1) ℝ) ∧
    IsReduced 2 ((2 : ℝ) • (!![1] : Matrix (Fin 1) (Fin 1) ℝ)) := by
  norm_num [IsReduced, Matrix.det_fin_one, Fin.forall_fin_one]

-- Test RealSiegel.IsReduced_zero_scale: zero scaling loses strict positivity.
example : ¬ IsReduced 2 ((0 : ℝ) • (!![1] : Matrix (Fin 1) (Fin 1) ℝ)) := by
  norm_num [IsReduced, Matrix.det_fin_one, Fin.forall_fin_one]

-- Test RealSiegel.IsReduced_negative_scale: negative scaling also fails.
example : ¬ IsReduced 2 ((-1 : ℝ) • (!![1] : Matrix (Fin 1) (Fin 1) ℝ)) := by
  norm_num [IsReduced, Matrix.det_fin_one, Fin.forall_fin_one]

/-- `T_{e,C}`. -/
def reducedSet (C : ℝ) : Set (Matrix (Fin n) (Fin n) ℝ) := {b | b.PosDef ∧ IsReduced C b}

theorem reducedSet_mono {C C' : ℝ} (h : C ≤ C') : reducedSet (n := n) C ⊆ reducedSet C' := by
  sorry

theorem reducedSet_smul_basis (C : ℝ) (g : GL (Fin n) ℚ) :
    {b | b.PosDef ∧ IsReduced C (((g.map (algebraMap ℚ ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ).transpose * b *
        ((g.map (algebraMap ℚ ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ))} =
      (fun b => (((g.map (algebraMap ℚ ℝ))⁻¹ : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ).transpose * b *
        (((g.map (algebraMap ℚ ℝ))⁻¹ : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)) '' reducedSet C := by
  sorry

-- Test RealSiegel.reducedSet_contains_one
example : (1 : Matrix (Fin n) (Fin n) ℝ) ∈ reducedSet 2 := by
  sorry

-- Test RealSiegel.reducedSet_dim_one
example (C : ℝ) (hC : 1 < C) : reducedSet (n := 1) C = {b | b.PosDef} := by
  sorry

-- Test RealSiegel.reducedSet_not_closed_under_inverse
example : Matrix.diagonal ![(1 : ℝ), 4] ∈ reducedSet 2 ∧ Matrix.diagonal ![(1 : ℝ), 1/4] ∉ reducedSet 2 := by
  sorry

end RealSiegel
namespace LevelMaps

section groups

variable {G : Type*} [Group G] (H : Subgroup G) {K K' K'' : Subgroup G}

/-- the nested-level map `H\G/K' → H\G/K`. -/
def levelMap (h : K' ≤ K) : DoubleCoset.Quotient (H : Set G) K' → DoubleCoset.Quotient (H : Set G) K := sorry

theorem levelMap_mk (h : K' ≤ K) (g : G) :
    levelMap H h (DoubleCoset.mk H K' g) = DoubleCoset.mk H K g := by
  sorry

theorem levelMap_surjective (h : K' ≤ K) : Function.Surjective (levelMap H h) := by
  sorry

/-- The surjection `K/K' → fibre`, `kK' ↦ [gk]`. -/
def fibreSurj (h : K' ≤ K) (g : G) : K ⧸ K'.subgroupOf K → levelMap H h ⁻¹' {DoubleCoset.mk H K g} := sorry

/-- The fibre map sends `kK'` to the fine double coset of `gk`. -/
theorem fibreSurj_mk (h : K' ≤ K) (g : G) (k : K) :
    (fibreSurj H h g (k : K ⧸ K'.subgroupOf K)).val = DoubleCoset.mk H K' (g * k) := by
  sorry

theorem fibreSurj_surjective (h : K' ≤ K) (g : G) : Function.Surjective (fibreSurj H h g) := by
  sorry

theorem levelMap_comp (h : K' ≤ K) (h' : K'' ≤ K') :
    levelMap H h ∘ levelMap H h' = levelMap H (h'.trans h) := by
  sorry

-- Test LevelMaps.levelMap_refl
example (x : DoubleCoset.Quotient (H : Set G) K) : levelMap H (le_refl K) x = x := by
  sorry

-- Test LevelMaps.levelMap_trivial_H
example (h : K' ≤ K) [(K'.subgroupOf K).FiniteIndex] (g : G) :
    Nat.card (levelMap (⊥ : Subgroup G) h ⁻¹' {DoubleCoset.mk ⊥ K g}) = (K'.subgroupOf K).index := by
  sorry

-- Test LevelMaps.levelMap_fibre_not_index
example (h : K' ≤ K) (g : G) (hidx : (K'.subgroupOf K).index = 2) :
    Nat.card (levelMap (⊤ : Subgroup G) h ⁻¹' {DoubleCoset.mk ⊤ K g}) = 1 := by
  sorry

/-- The finer class set is finite, of cardinality at most `[K : K'] · #(H\G/K)`. Finiteness is part of
the conclusion: `Nat.card` of an infinite type is `0`, so the inequality alone would not give it. -/
theorem card_le_index_mul (h : K' ≤ K) [(K'.subgroupOf K).FiniteIndex]
    [Finite (DoubleCoset.Quotient (H : Set G) K)] :
    Finite (DoubleCoset.Quotient (H : Set G) K') ∧
    Nat.card (DoubleCoset.Quotient (H : Set G) K') ≤
      (K'.subgroupOf K).index * Nat.card (DoubleCoset.Quotient (H : Set G) K) := by
  sorry

-- Test LevelMaps.card_le_index_mul_needs_finite: `Nat.card` of the infinite type `ℤ` is `0`, so a
-- bound `Nat.card X ≤ N h` holds for every infinite `X`.
example : Nat.card ℤ = 0 ∧ ¬ Finite ℤ := by
  exact ⟨Nat.card_eq_zero_of_infinite, not_finite_iff_infinite.mpr inferInstance⟩

def conjLevelEquiv (a : G) :
    DoubleCoset.Quotient (H : Set G) (K.map (MulAut.conj a).toMonoidHom) ≃ DoubleCoset.Quotient (H : Set G) K := sorry

/-- Conjugating the right level sends the representative `g` to `ga`. -/
theorem conjLevelEquiv_mk (a g : G) :
    conjLevelEquiv H (K := K) a (DoubleCoset.mk H (K.map (MulAut.conj a).toMonoidHom) g) =
      DoubleCoset.mk H K (g * a) := by
  sorry

-- Test LevelMaps.fibreSurj_noncommutative: (01)(12)(0)=1, but (12)(01)(0)=2.
example :
    let g := Equiv.swap (0 : Fin 3) 1
    let k : (⊤ : Subgroup (Equiv.Perm (Fin 3))) := ⟨Equiv.swap 1 2, Subgroup.mem_top _⟩
    (fibreSurj (⊥ : Subgroup (Equiv.Perm (Fin 3))) (K' := ⊥) bot_le g
      (k : (⊤ : Subgroup (Equiv.Perm (Fin 3))) ⧸
        (⊥ : Subgroup (Equiv.Perm (Fin 3))).subgroupOf ⊤)).val =
      DoubleCoset.mk (⊥ : Subgroup (Equiv.Perm (Fin 3))) ⊥ (g * k) ∧
      (g * k) 0 = 1 ∧ ((k : Equiv.Perm (Fin 3)) * g) 0 = 2 := by
  refine ⟨fibreSurj_mk _ _ _ _, ?_⟩
  decide

-- Test LevelMaps.conjLevelEquiv_noncommutative: the representative is multiplied on the right.
example :
    let g := Equiv.swap (0 : Fin 3) 1
    let a := Equiv.swap (1 : Fin 3) 2
    conjLevelEquiv (⊥ : Subgroup (Equiv.Perm (Fin 3))) (K := ⊥) a
        (DoubleCoset.mk ⊥ ((⊥ : Subgroup (Equiv.Perm (Fin 3))).map
          (MulAut.conj a).toMonoidHom) g) = DoubleCoset.mk ⊥ ⊥ (g * a) ∧
      (g * a) 0 = 1 ∧ (a * g) 0 = 2 := by
  refine ⟨conjLevelEquiv_mk _ _ _, ?_⟩
  decide

-- Test LevelMaps.conjLevelEquiv_inverse_direction: a 3-cycle distinguishes a from its inverse.
example :
    let g := Equiv.swap (0 : Fin 3) 1
    let a := Equiv.swap (0 : Fin 3) 1 * Equiv.swap 1 2
    conjLevelEquiv (⊥ : Subgroup (Equiv.Perm (Fin 3))) (K := ⊥) a
        (DoubleCoset.mk ⊥ ((⊥ : Subgroup (Equiv.Perm (Fin 3))).map
          (MulAut.conj a).toMonoidHom) g) = DoubleCoset.mk ⊥ ⊥ (g * a) ∧
      (g * a) 0 = 0 ∧ (g * a⁻¹) 0 = 2 := by
  refine ⟨conjLevelEquiv_mk _ _ _, ?_⟩
  decide

-- Test LevelMaps.conjLevelEquiv_identity: the unshifted representative is unchanged.
example (g : G) : conjLevelEquiv H (K := K) 1
    (DoubleCoset.mk H (K.map (MulAut.conj (1 : G)).toMonoidHom) g) =
      DoubleCoset.mk H K g := by
  simpa using conjLevelEquiv_mk H (K := K) 1 g

end groups

end LevelMaps
namespace AdelicExamples

/-- raw Möbius transformations on ℍ±. -/
def rawMoebius (g : GL (Fin 2) ℝ) (z : ℂ) : ℂ :=
  UpperHalfPlane.num g z / UpperHalfPlane.denom g z

theorem rawMoebius_im (g : GL (Fin 2) ℝ) (z : ℂ) :
    (rawMoebius g z).im = g.det.val * z.im / Complex.normSq (UpperHalfPlane.denom g z) := by
  sorry

theorem rawMoebius_mul (g h : GL (Fin 2) ℝ) (z : ℂ) (hz : z.im ≠ 0) :
    rawMoebius (g * h) z = rawMoebius g (rawMoebius h z) := by
  sorry

theorem folded_eq_glAction (g : GL (Fin 2) ℝ) (z : UpperHalfPlane) :
    (g • z : UpperHalfPlane) =
      (⟨if 0 < g.det.val then rawMoebius g z else star (rawMoebius g z), by sorry⟩ : UpperHalfPlane) := by
  sorry

/-- `ℍ± = ℂ ∖ ℝ`. -/
abbrev UpperLowerHalfPlane := {z : ℂ // z.im ≠ 0}

/-- The raw Möbius action of `GL₂(ℝ)` on `ℍ±`; negative determinant exchanges the half-planes. -/
instance rawMulAction : MulAction (GL (Fin 2) ℝ) UpperLowerHalfPlane where
  smul g z := ⟨rawMoebius g z, sorry⟩
  one_smul := sorry
  mul_smul := sorry

theorem coe_rawSMul (g : GL (Fin 2) ℝ) (z : UpperLowerHalfPlane) :
    ((g • z : UpperLowerHalfPlane) : ℂ) = rawMoebius g z :=
  rfl

/-- `ℝ^×SO(2)`, the invertible matrices `(a -b; b a)`. -/
def KInf : Subgroup (GL (Fin 2) ℝ) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) ℝ) 0 0 = (g : Matrix (Fin 2) (Fin 2) ℝ) 1 1 ∧
    (g : Matrix (Fin 2) (Fin 2) ℝ) 0 1 = -(g : Matrix (Fin 2) (Fin 2) ℝ) 1 0}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- The base point `i ∈ ℍ±`. -/
def basePoint : UpperLowerHalfPlane := ⟨Complex.I, by simp⟩

/-- the stabilizer of `i` for the raw action is `ℝ^×SO(2)`. -/
theorem stabilizer_basePoint : MulAction.stabilizer (GL (Fin 2) ℝ) basePoint = KInf := by
  sorry

/-- `g ↦ g • i` induces a homeomorphism `GL₂(ℝ)/ℝ^×SO(2) ≃ ℍ±`. -/
def realQuotientHomeomorph : (GL (Fin 2) ℝ ⧸ KInf) ≃ₜ UpperLowerHalfPlane :=
  sorry

theorem realQuotientHomeomorph_mk (g : GL (Fin 2) ℝ) :
    realQuotientHomeomorph (QuotientGroup.mk g) = g • basePoint := by
  sorry

/-- Equivariance: left multiplication on the quotient corresponds to the raw action. -/
theorem realQuotientHomeomorph_smul (g : GL (Fin 2) ℝ) (x : GL (Fin 2) ℝ ⧸ KInf) :
    realQuotientHomeomorph (g • x) = g • realQuotientHomeomorph x := by
  sorry

/-- `GL₂(ℝ)^+` acts transitively on `ℍ`. -/
theorem isPretransitive_GLPos : MulAction.IsPretransitive (Matrix.GLPos (Fin 2) ℝ) UpperHalfPlane := by
  sorry

/-- The stabilizer of `i ∈ ℍ` in `GL₂(ℝ)^+` is `ℝ^×SO(2)`. -/
theorem stabilizer_GLPos_I :
    MulAction.stabilizer (Matrix.GLPos (Fin 2) ℝ) UpperHalfPlane.I =
      KInf.subgroupOf (Matrix.GLPos (Fin 2) ℝ) := by
  sorry

/-- `diag(1, -1)`. -/
def diagOneNegOne : GL (Fin 2) ℝ :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 0; 0, -1] (by simp)

-- Test: `diag(1, -1)` sends `i` to `-i` in the raw action and fixes `i` in Mathlib's `glAction`.
example : ((diagOneNegOne • basePoint : UpperLowerHalfPlane) : ℂ) = -Complex.I ∧
    diagOneNegOne • UpperHalfPlane.I = UpperHalfPlane.I := by
  sorry

end AdelicExamples
namespace Tamagawa

/-- , the local count for `GL_n`: with the convergence factor
`λ = (1 - q⁻¹)⁻¹`, the normalized count of `GL_n(𝔽_q)` is `∏_{i=2}^{n} (1 - q^{-i})`. -/
theorem gl_local_volume (k : Type*) [Field k] [Fintype k] {n : ℕ} (hn : 1 ≤ n) :
    (1 - (Fintype.card k : ℝ)⁻¹)⁻¹ * Nat.card (GL (Fin n) k) / (Fintype.card k : ℝ) ^ (n ^ 2) =
      ∏ i ∈ Finset.Icc 2 n, (1 - (Fintype.card k : ℝ)⁻¹ ^ i) := by
  sorry

/-- , the local count for `SL_n`. -/
theorem sl_local_volume (k : Type*) [Field k] [Fintype k] [DecidableEq k] {n : ℕ} (hn : 1 ≤ n) :
    (Nat.card (Matrix.SpecialLinearGroup (Fin n) k) : ℝ) / (Fintype.card k : ℝ) ^ (n ^ 2 - 1) =
      ∏ i ∈ Finset.Icc 2 n, (1 - (Fintype.card k : ℝ)⁻¹ ^ i) := by
  sorry

/-- , convergence: `∑_v q_v^{-2}` converges, so the local factors
`∏_{i=2}^{n} (1 - q_v^{-i})` have an absolutely convergent product. -/
theorem summable_absNorm_rpow_neg_two (K : Type*) [Field K] [NumberField K] :
    Summable (fun v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K) =>
      (Ideal.absNorm v.asIdeal : ℝ) ^ (-2 : ℝ)) := by
  sorry

/-- The rank-zero GL factor cannot use the positive-rank correction. -/
example : (1 - (2 : ℝ)⁻¹)⁻¹ * 1 / 2 ^ (0 ^ 2 : ℕ) = 2 ∧
    (∏ i ∈ Finset.Icc 2 (0 : ℕ), (1 - (2 : ℝ)⁻¹ ^ i)) = 1 := by
  norm_num

/-- At q = 2, GL₂ has six elements and its corrected volume is 3/4. -/
example : (1 - (2 : ℝ)⁻¹)⁻¹ * 6 / 2 ^ (2 ^ 2 : ℕ) = 3 / 4 := by
  norm_num

end Tamagawa

namespace RestrictedProduct
open _root_.RestrictedProduct

variable {ι : Type*} [hctx5 : Countable ι]
  {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [hctx6 : ∀ i, IsTopologicalGroup (G i)] [hctx7 : ∀ i, T2Space (G i)]
  [hctx8 : ∀ i, LocallyCompactSpace (G i)] [hctx9 : ∀ i, SecondCountableTopology (G i)]
  {B : ∀ i, Subgroup (G i)} [hctx10 : Fact (∀ i, IsOpen (B i : Set (G i)))]
  [∀ i, MeasurableSpace (G i)] [hctx11 : ∀ i, BorelSpace (G i)]
  [hctx12 : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
include hctx5 hctx6 hctx7 hctx8 hctx9 hctx10 hctx11 hctx12

/-- Normalize only the good compact factors. The exceptional local Haar measures are retained. -/
def normalizedFamily (μ : ∀ i, Measure (G i)) (S : Finset ι) : ∀ i, Measure (G i) :=
  fun i => if i ∈ S then μ i else (μ i (B i))⁻¹ • μ i

-- Test RestrictedProduct.normalized_exceptional
example (μ : ∀ i, Measure (G i)) (S : Finset ι) (j : ι) (hj : j ∈ S) :
    normalizedFamily (B := B) μ S j = μ j := by
  simp [normalizedFamily, hj]

-- Test RestrictedProduct.normalized_unit
example (μ : ∀ i, Measure (G i)) (S : Finset ι) (j : ι) (hj : μ j (B j) = 1) :
    normalizedFamily (B := B) μ S j = μ j := by
  simp [normalizedFamily, hj]

-- Test RestrictedProduct.normalized_mass_two
example (μ : ∀ i, Measure (G i)) (j : ι) (hj : μ j (B j) = 2) :
    normalizedFamily (B := B) μ ∅ j = (2 : ℝ≥0∞)⁻¹ • μ j := by
  simp [normalizedFamily, hj]

/-- A restricted product measure with summable deviations of the good local masses from one. -/
def convergentHaarProduct (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S : Finset ι) (hc : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hp : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hs : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|)) :
    Measure (Πʳ i, [G i, B i]) :=
  ENNReal.ofReal (∏' i : {i // i ∉ S}, (μ i (B i)).toReal) •
    haarProduct (B := B) (normalizedFamily (B := B) μ S) (by sorry)

theorem convergentHaarProduct_independent_exceptionalSet
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S T : Finset ι)
    (hcS : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hpS : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hsS : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|))
    (hcT : ∀ i ∉ T, IsCompact (B i : Set (G i)))
    (hpT : ∀ i ∉ T, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hsT : Summable (fun i : {i // i ∉ T} => |(μ i (B i)).toReal - 1|)) :
    convergentHaarProduct (B := B) μ S hcS hpS hsS = convergentHaarProduct (B := B) μ T hcT hpT hsT := by
  sorry

theorem convergentHaarProduct_isHaarMeasure
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S : Finset ι) (hc : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hp : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hs : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|)) :
    (convergentHaarProduct (B := B) μ S hc hp hs).IsHaarMeasure := by
  sorry

/-- changing the compact open subgroups at finitely many
indices, all inside `S`, transports the convergent product along `changeSubgroups`. -/
theorem map_changeSubgroups_convergentHaarProduct
    (B' : ∀ i, Subgroup (G i)) [Fact (∀ i, IsOpen (B' i : Set (G i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B' i : Set (G i)))]
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure] (S : Finset ι)
    (hBS : ∀ i ∉ S, B i = B' i) (hc : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hp : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hs : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|))
    (hc' : ∀ i ∉ S, IsCompact (B' i : Set (G i)))
    (hp' : ∀ i ∉ S, 0 < μ i (B' i) ∧ μ i (B' i) < ∞)
    (hs' : Summable (fun i : {i // i ∉ S} => |(μ i (B' i)).toReal - 1|)) :
    Measure.map (changeSubgroups B B' (by sorry)) (convergentHaarProduct (B := B) μ S hc hp hs) =
      convergentHaarProduct (B := B') μ S hc' hp' hs' := by
  sorry

theorem convergentHaarProduct_box
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S : Finset ι) (hc : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hp : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hs : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|))
    (T : Finset ι) (hST : S ⊆ T) (C : ∀ i, Set (G i))
    (hC : ∀ i, MeasurableSet (C i)) (htail : ∀ i ∉ T, C i = B i) :
    convergentHaarProduct (B := B) μ S hc hp hs (box (B := B) C) =
      (∏ i ∈ T, μ i (C i)) * ENNReal.ofReal (∏' i : {i // i ∉ T}, (μ i (B i)).toReal) := by
  sorry

-- Test RestrictedProduct.convergentHaarProduct_normalized
example (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (hc : ∀ i, IsCompact (B i : Set (G i))) (hμ : ∀ i, μ i (B i) = 1) :
    convergentHaarProduct (B := B) μ ∅ (by sorry) (by sorry) (by sorry) =
      haarProduct (B := B) μ (Filter.Eventually.of_forall hμ) ∧
    convergentHaarProduct (B := B) μ ∅ (by sorry) (by sorry) (by sorry)
      {x | ∀ i, x i ∈ B i} = 1 := by
  sorry

-- Test RestrictedProduct.convergentHaarProduct_single_rescale
example (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (hc : ∀ i, IsCompact (B i : Set (G i))) (hμ : ∀ i, μ i (B i) = 1)
    (j : ι) (c : ℝ≥0∞) (hcpos : 0 < c) (hcfin : c < ∞) :
    let ν : ∀ i, Measure (G i) := fun i => if i = j then c • μ i else μ i
    ∃ hν : ∀ i, (ν i).IsHaarMeasure,
    letI : ∀ i, (ν i).IsHaarMeasure := hν
    ∃ (hcν : ∀ i ∉ (∅ : Finset ι), IsCompact (B i : Set (G i)))
      (hpν : ∀ i ∉ (∅ : Finset ι), 0 < ν i (B i) ∧ ν i (B i) < ∞)
      (hsν : Summable (fun i : {i // i ∉ (∅ : Finset ι)} => |(ν i (B i)).toReal - 1|)),
      convergentHaarProduct (B := B) ν ∅ hcν hpν hsν =
        c • haarProduct (B := B) μ (Filter.Eventually.of_forall hμ) := by
  sorry

-- Test RestrictedProduct.convergentHaarProduct_sl2_tail
/-- Good masses `a_i < 1` with summable defect (for SL₂, `a_v = 1 - q_v⁻²`): the integral box has
mass `∏' a_i`, positive and `< 1`; no eventual equality of the masses to one is used. -/
example [Nonempty ι] (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (hc : ∀ i, IsCompact (B i : Set (G i))) (a : ι → ℝ) (ha0 : ∀ i, 0 < a i)
    (ha1 : ∀ i, a i < 1) (hμ : ∀ i, μ i (B i) = ENNReal.ofReal (a i))
    (hs : Summable (fun i => |a i - 1|)) :
    convergentHaarProduct (B := B) μ ∅ (fun i _ => hc i) (by sorry) (by sorry)
        {x | ∀ i, x i ∈ B i} = ENNReal.ofReal (∏' i, a i) ∧
      0 < ∏' i, a i ∧ ∏' i, a i < 1 := by
  sorry

-- Test RestrictedProduct.change_identity: the counting measure retains all 4 points.
example :
    let G := Multiplicative (ZMod 4)
    letI : MeasurableSpace G := borel G
    let B : Fin 1 → Subgroup G := fun _ => ⊤
    let B' : Fin 1 → Subgroup G := fun _ => ⊤
    letI : Fact (∀ i, IsOpen (B i : Set G)) := ⟨by sorry⟩
    letI : Fact (∀ i, IsOpen (B' i : Set G)) := ⟨by sorry⟩
    letI : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set G)) := ⟨by simp⟩
    letI : Fact (∀ᶠ i in cofinite, IsCompact (B' i : Set G)) := ⟨by simp⟩
    let μ : Fin 1 → Measure G := fun _ => Measure.count
    letI : (Measure.count : Measure G).IsHaarMeasure := by sorry
    let m := convergentHaarProduct (B := B) μ Finset.univ (by simp) (by simp) (by sorry)
    let m' := convergentHaarProduct (B := B') μ Finset.univ (by simp) (by simp) (by sorry)
    Measure.map (changeSubgroups B B' (by simp)) m = m' ∧ m' Set.univ = 4 := by
  sorry

-- Test RestrictedProduct.change_one: the counting measure retains all 4 points.
example :
    let G := Multiplicative (ZMod 4)
    letI : MeasurableSpace G := borel G
    let B : Fin 1 → Subgroup G := fun _ => ⊤
    let B' : Fin 1 → Subgroup G := fun _ => ⊥
    letI : Fact (∀ i, IsOpen (B i : Set G)) := ⟨by sorry⟩
    letI : Fact (∀ i, IsOpen (B' i : Set G)) := ⟨by sorry⟩
    letI : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set G)) := ⟨by simp⟩
    letI : Fact (∀ᶠ i in cofinite, IsCompact (B' i : Set G)) := ⟨by simp⟩
    let μ : Fin 1 → Measure G := fun _ => Measure.count
    letI : (Measure.count : Measure G).IsHaarMeasure := by sorry
    let m := convergentHaarProduct (B := B) μ Finset.univ (by simp) (by simp) (by sorry)
    let m' := convergentHaarProduct (B := B') μ Finset.univ (by simp) (by simp) (by sorry)
    Measure.map (changeSubgroups B B' (by simp)) m = m' ∧ m' Set.univ = 4 := by
  sorry

-- Test RestrictedProduct.change_two: the counting measure retains all 16 points.
example :
    let G := Multiplicative (ZMod 4)
    letI : MeasurableSpace G := borel G
    let B : Fin 2 → Subgroup G := fun _ => ⊤
    let B' : Fin 2 → Subgroup G := fun _ => ⊥
    letI : Fact (∀ i, IsOpen (B i : Set G)) := ⟨by sorry⟩
    letI : Fact (∀ i, IsOpen (B' i : Set G)) := ⟨by sorry⟩
    letI : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set G)) := ⟨by simp⟩
    letI : Fact (∀ᶠ i in cofinite, IsCompact (B' i : Set G)) := ⟨by simp⟩
    let μ : Fin 2 → Measure G := fun _ => Measure.count
    letI : (Measure.count : Measure G).IsHaarMeasure := by sorry
    let m := convergentHaarProduct (B := B) μ Finset.univ (by simp) (by simp) (by sorry)
    let m' := convergentHaarProduct (B := B') μ Finset.univ (by simp) (by simp) (by sorry)
    Measure.map (changeSubgroups B B' (by simp)) m = m' ∧ m' Set.univ = 16 := by
  sorry

end RestrictedProduct

namespace QuotientMeasure

variable {G : Type*} [Group G] [TopologicalSpace G] [hctx13 : IsTopologicalGroup G]
  [hctx14 : T2Space G] [hctx15 : LocallyCompactSpace G] [hctx16 : SecondCountableTopology G]
  [MeasurableSpace G] [hctx17 : BorelSpace G]
  (H : Subgroup G) [hctx18 : Fact (IsClosed (H : Set G))] [hctx19 : LocallyCompactSpace H]
include hctx13 hctx14 hctx15 hctx16 hctx17 hctx18 hctx19

/-- The left H-orbits with their canonical quotient topology. -/
abbrev Cosets := MulAction.orbitRel.Quotient H G

instance : MeasurableSpace (Cosets H) := borel _
instance : BorelSpace (Cosets H) := ⟨rfl⟩

/-- Right Haar hypotheses expressed by actual Mathlib predicates. -/
def IsRightHaar {A : Type*} [Group A] [TopologicalSpace A] [MeasurableSpace A]
    (μ : Measure A) : Prop :=
  μ.IsMulRightInvariant ∧ IsFiniteMeasureOnCompacts μ ∧ μ.IsOpenPosMeasure

/-- The modular equality is required even when H is not normal. -/
def measure (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h) :
    Measure (Cosets H) := sorry

/-- Hg ↦ g⁻¹H, from left orbits to Mathlib's left cosets. -/
def inversionHomeomorph : Cosets H ≃ₜ (G ⧸ H) := sorry

theorem inversionHomeomorph_mk (g : G) :
    inversionHomeomorph H (Quotient.mk _ g) = ((g⁻¹ : G) : G ⧸ H) := by
  sorry

/-- , with the canonical orbit quotient topology. -/
theorem homogeneous_topology :
    T2Space (Cosets H) ∧ LocallyCompactSpace (Cosets H) ∧
      SecondCountableTopology (Cosets H) ∧ IsOpenMap (fun g : G => (Quotient.mk _ g : Cosets H)) := by
  sorry

theorem compact_lift (C : Set (Cosets H)) (hC : IsCompact C) :
    ∃ K : Set G, IsCompact K ∧ C ⊆ (fun g : G => (Quotient.mk _ g : Cosets H)) '' K := by
  sorry

/-- Fibre averaging uses right Haar measure on H. -/
def average (ν : Measure H) (hν : IsRightHaar ν) (f : G → ℝ) : Cosets H → ℝ :=
  fun q => Quotient.liftOn q (fun g => ∫ h : H, f (h * g) ∂ν) (by sorry)

theorem average_continuous_compact (ν : Measure H) (hν : IsRightHaar ν)
    (f : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f) :
    Continuous (average H ν hν f) ∧ HasCompactSupport (average H ν hν f) ∧
      Function.support (average H ν hν f) ⊆
        (fun g : G => (Quotient.mk _ g : Cosets H)) '' tsupport f := by
  sorry

theorem compact_cutoff (ν : Measure H) (hν : IsRightHaar ν)
    (C : Set (Cosets H)) (hC : IsCompact C) :
    ∃ β : G → ℝ, Continuous β ∧ HasCompactSupport β ∧ (∀ g, 0 ≤ β g) ∧
      ∀ q ∈ C, average H ν hν β q = 1 := by
  sorry

theorem right_haar_exchange (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f β : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f)
    (hβ : Continuous β) (hβc : HasCompactSupport β) :
    (∫ g, β g * average H ν hν f (Quotient.mk _ g) ∂μ) =
      ∫ g, f g * average H ν hν β (Quotient.mk _ g) ∂μ := by
  sorry

theorem quotient_lintegral (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : G → ℝ≥0∞) (hf : Measurable f) :
    ∃ P : Cosets H → ℝ≥0∞, Measurable P ∧
      (∀ g, P (Quotient.mk _ g) = ∫⁻ h : H, f (h * g) ∂ν) ∧
      (∫⁻ g, f g ∂μ) = ∫⁻ q, P q ∂(measure H μ ν hμ hν hmod) := by
  sorry

theorem integral_eq_of_integrable (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : G → ℝ) (hf : Integrable f μ) :
    (∀ᵐ g ∂μ, Integrable (fun h : H => f (h * g)) ν) ∧
    Integrable (average H ν hν f) (measure H μ ν hμ hν hmod) ∧
    ∫ g, f g ∂μ = ∫ q, average H ν hν f q ∂(measure H μ ν hμ hν hmod) := by
  sorry

def rightAct (g : G) : Cosets H → Cosets H := sorry

theorem rightAct_mk (g x : G) :
    rightAct H g (Quotient.mk _ x) = Quotient.mk _ (x * g) := by
  sorry

theorem integral_eq (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f) :
    ∫ g, f g ∂μ = ∫ q, Quotient.liftOn q (fun g => ∫ h : H, f (h * g) ∂ν)
      (by sorry) ∂(measure H μ ν hμ hν hmod) := by
  sorry

theorem invariant (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (g : G) :
    Measure.map (rightAct H g) (measure H μ ν hμ hν hmod) = measure H μ ν hμ hν hmod := by
  sorry

theorem unique (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (lam : Measure (Cosets H)) [Measure.Regular lam]
    (hinv : ∀ g : G, Measure.map (rightAct H g) lam = lam) :
    ∃ c : ℝ≥0, lam = c • measure H μ ν hμ hν hmod := by
  sorry

theorem smul_left (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (c : ℝ≥0∞) (hc : c ≠ 0) (hcfin : c ≠ ∞) :
    ∃ hνc : IsRightHaar (c • ν),
      measure H μ (c • ν) hμ hνc hmod = c⁻¹ • measure H μ ν hμ hν hmod := by
  sorry

-- Test QuotientMeasure.trivial_subgroup: the subgroup measure is normalized counting.
example (μ : Measure G) (hμ : IsRightHaar μ) :
    let H : Subgroup G := ⊥
    letI : Fact (IsClosed (H : Set G)) := ⟨by sorry⟩
    letI : LocallyCompactSpace H := by sorry
    ∃ hν : IsRightHaar (Measure.count : Measure H),
    ∃ hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h,
    Measure.map (fun g : G => Quotient.mk _ g) μ = measure H μ Measure.count hμ hν hmod := by
  sorry

-- Test QuotientMeasure.z_in_r: a unit-period lattice has quotient volume one.
example :
    let G := Multiplicative ℝ
    letI : MeasurableSpace G := borel G
    letI : BorelSpace G := ⟨rfl⟩
    let H : Subgroup G := Subgroup.zpowers (Multiplicative.ofAdd (1 : ℝ))
    letI : Fact (IsClosed (H : Set G)) := ⟨by sorry⟩
    letI : LocallyCompactSpace H := by sorry
    let μ := Measure.map (Multiplicative.ofAdd : ℝ → G) (volume : Measure ℝ)
    ∃ hμ : IsRightHaar μ,
    ∃ hν : IsRightHaar (Measure.count : Measure H),
    ∃ hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h,
      measure H μ Measure.count hμ hν hmod Set.univ = 1 := by
  sorry

end QuotientMeasure

namespace RealSiegel
/-- a uniform Cholesky adapter. The bound is quantified before the form,
so it cannot be chosen separately for each matrix. No pivot bound is assumed as a hypothesis. -/
theorem IsReduced.cholesky {n : ℕ} (C : ℝ) (hC : 0 < C) :
    ∃ R : ℝ, 0 < R ∧ ∀ (b N : Matrix (Fin n) (Fin n) ℝ) (d : Fin n → ℝ),
      b.PosDef → IsReduced C b →
      (∀ i j, j < i → N i j = 0) → (∀ i, N i i = 1) → (∀ i, 0 < d i) →
      b = N.transpose * Matrix.diagonal d * N →
      (∀ i j, i < j → |N i j| ≤ R) ∧ (∀ i j, i.val + 1 = j.val → d i ≤ R * d j) := by
  sorry

end RealSiegel

namespace RealSiegel
/-- The converse uniform Cholesky adapter. -/
theorem IsReduced.of_cholesky_bounds {n : ℕ} (R : ℝ) (hR : 0 < R) :
    ∃ C : ℝ, 1 < C ∧ ∀ (b N : Matrix (Fin n) (Fin n) ℝ) (d : Fin n → ℝ),
      b.PosDef → (∀ i j, j < i → N i j = 0) → (∀ i, N i i = 1) →
      (∀ i, 0 < d i) → b = N.transpose * Matrix.diagonal d * N →
      (∀ i j, i < j → |N i j| ≤ R) →
      (∀ i j, i.val + 1 = j.val → d i ≤ R * d j) → IsReduced C b := by
  sorry
end RealSiegel

namespace IntegralModelTests
-- Test IntegralModel.monoid_not_model. The canonical monoid algebra is F[T] with
-- group-like T, not the additive-group Hopf structure on the same polynomial ring.
example (F : Type*) [Field F] :
    let A := MonoidAlgebra F (Multiplicative ℕ)
    ¬ ∃ S : A →ₗ[F] A,
      LinearMap.mul' F A ∘ₗ S.rTensor A ∘ₗ Coalgebra.comul =
        Algebra.linearMap F A ∘ₗ Coalgebra.counit := by
  sorry
end IntegralModelTests

namespace QuotientMeasure
/-- The actual upper triangular subgroup of SL₂(R). -/
def sl2Borel : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℝ) where
  carrier := {g | g 1 0 = 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

-- Test QuotientMeasure.borel_no_invariant: equality of modular characters fails.
example :
    let G := Matrix.SpecialLinearGroup (Fin 2) ℝ
    letI : MeasurableSpace G := borel G
    letI : BorelSpace G := ⟨rfl⟩
    let H := sl2Borel
    letI : T2Space G := by sorry
    letI : LocallyCompactSpace G := by sorry
    letI : SecondCountableTopology G := by sorry
    letI : Fact (IsClosed (H : Set G)) := ⟨by sorry⟩
    letI : LocallyCompactSpace H := by sorry
    ¬ ∃ μ : Measure (Cosets H), IsFiniteMeasureOnCompacts μ ∧ Measure.Regular μ ∧
      μ ≠ 0 ∧ ∀ g : G, Measure.map (rightAct H g) μ = μ := by
  sorry

/-- a Borel set meeting every left orbit Γg exactly once;
it is a fundamental domain for every measure. -/
theorem exists_measurableSet_unique_orbit_rep {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G] [SecondCountableTopology G]
    [MeasurableSpace G] [BorelSpace G] (Γ : Subgroup G) [Countable Γ] [DiscreteTopology Γ]
    (μ : Measure G) :
    ∃ D : Set G, MeasurableSet D ∧ (∀ g : G, ∃! γ : Γ, γ • g ∈ D) ∧ IsFundamentalDomain Γ D μ := by
  sorry
end QuotientMeasure

namespace RestrictedProduct
open _root_.RestrictedProduct
variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [hctx20 : ∀ i, IsTopologicalGroup (G i)] [hctx21 : Countable ι] [hctx22 : ∀ i, T2Space (G i)]
  [hctx23 : ∀ i, LocallyCompactSpace (G i)] [hctx24 : ∀ i, SecondCountableTopology (G i)]
  {B : ∀ i, Subgroup (G i)} [hctx25 : Fact (∀ i, IsOpen (B i : Set (G i)))]
  [hctx26 : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
  [∀ i, MeasurableSpace (G i)] [hctx27 : ∀ i, BorelSpace (G i)]
include hctx20 hctx21 hctx22 hctx23 hctx24 hctx25 hctx26 hctx27

theorem levelMeasure_compat (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
    (S T : Finset ι) (hST : S ⊆ T) (hS : ∀ i ∉ S, μ i (B i) = 1)
    (hT : ∀ i ∉ T, μ i (B i) = 1) :
    (Measure.map Subtype.val (levelMeasure μ T hT)).restrict
      (levelSubgroup (B := B) (S : Set ι)) = Measure.map Subtype.val (levelMeasure μ S hS) := by
  sorry

theorem exists_normalized_haar (i : ι) (hcompact : IsCompact (B i : Set (G i))) :
    ∃ μ : Measure (G i), μ.IsHaarMeasure ∧ μ (B i) = 1 := by
  sorry
end RestrictedProduct

/-- , number-field form: uniqueness of the normalized additive Haar
measure on `K_v` and the scaling law `map (a * ·) μ_v = |a|_v⁻¹ • μ_v`, with `|a|_v = q_v^{-v(a)}`
the pinned normalized absolute value (needs `TauCeti.NumberTheory.LocalField.NormalizedValuation`
and `TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel`). -/
theorem NumberField.normalizedLocalHaar_unique_and_scaling (K : Type*) [Field K] [NumberField K]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K))
    [MeasurableSpace (v.adicCompletion K)] [BorelSpace (v.adicCompletion K)] :
    (∃! μ : Measure (v.adicCompletion K),
        μ.IsAddHaarMeasure ∧ μ (v.adicCompletionIntegers K) = 1) ∧
      ∀ μ : Measure (v.adicCompletion K), μ.IsAddHaarMeasure →
        μ (v.adicCompletionIntegers K) = 1 → ∀ a : v.adicCompletion K, a ≠ 0 →
          Measure.map (fun x => a * x) μ =
            (((TauCeti.normalizedAbsoluteValue (v.adicCompletion K) a : ℚ≥0) : ℝ≥0) : ℝ≥0∞)⁻¹ • μ := by
  sorry

/-! Layer 1: uses the actual Tau Ceti convolution group; its evaluation topology is installed after
the integral models below. -/

abbrev AdelicPoints (F : Type) [Field F] [NumberField F]
    (H : Type) [CommRing H] [HopfAlgebra F H] :=
  TauCeti.HopfAlgebra.points (H := H)
    (CommAlgCat.of F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F))

namespace AdelicPoints
variable (F : Type) [Field F] [NumberField F]
  (H : Type) [CommRing H] [HopfAlgebra F H]

abbrev FiniteAdelicPoints := TauCeti.HopfAlgebra.points (H := H)
  (CommAlgCat.of F (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F))

abbrev InfinitePoints := TauCeti.HopfAlgebra.points (H := H)
  (CommAlgCat.of F (NumberField.InfiniteAdeleRing F))

abbrev LocalPoints (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :=
  TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of F (v.adicCompletion F))

def diagonal : WithConv (H →ₐ[F] F) →* AdelicPoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- Canonical value-algebra projection `𝔸_F → F_v`. -/
def valueProjection (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    NumberField.AdeleRing (NumberField.RingOfIntegers F) F →ₐ[F] v.adicCompletion F where
  toFun x := x.2 v
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry
  commutes' := by sorry

def proj (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    AdelicPoints F H →* LocalPoints F H v := TauCeti.AlgHom.mapValue (H := H) (valueProjection F v)

theorem proj_diagonal (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g : WithConv (H →ₐ[F] F)) :
    proj F H v (diagonal F H g) = TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g := by
  sorry

def finiteProjection : AdelicPoints F H →* FiniteAdelicPoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (AlgHom.snd F _ _)

def infiniteProjection : AdelicPoints F H →* InfinitePoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (AlgHom.fst F _ _)

/-- The archimedean coordinate is the identity point of the group. -/
def finiteEmbed : FiniteAdelicPoints F H →* AdelicPoints F H where
  toFun x := WithConv.toConv {
    toFun h := ((1 : InfinitePoints F H).ofConv h, x.ofConv h)
    map_zero' := by sorry
    map_one' := by sorry
    map_add' := by sorry
    map_mul' := by sorry
    commutes' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

theorem finiteEmbed_finite (x : FiniteAdelicPoints F H) :
    finiteProjection F H (finiteEmbed F H x) = x := by
  sorry

theorem finiteEmbed_infinite (x : FiniteAdelicPoints F H) :
    infiniteProjection F H (finiteEmbed F H x) = 1 := by
  sorry

-- The group morphism is induced by the actual coordinate bialgebra morphism.
def map {H' : Type} [CommRing H'] [HopfAlgebra F H']
    (φ : H' →ₐc[F] H) : AdelicPoints F H →* AdelicPoints F H' where
  toFun x := WithConv.toConv (x.ofConv.comp (φ : H' →ₐ[F] H))
  map_one' := by sorry
  map_mul' := by sorry

theorem map_id (x : AdelicPoints F H) : map F H (BialgHom.id F H) x = x := by
  sorry

theorem map_comp {H' H'' : Type} [CommRing H'] [HopfAlgebra F H']
    [CommRing H''] [HopfAlgebra F H''] (φ : H' →ₐc[F] H) (ψ : H'' →ₐc[F] H')
    (x : AdelicPoints F H) : map F H (φ.comp ψ) x = map F H' ψ (map F H φ x) := by
  sorry

theorem map_diagonal {H' : Type} [CommRing H'] [HopfAlgebra F H']
    (φ : H' →ₐc[F] H) (g : WithConv (H →ₐ[F] F)) :
    map F H φ (diagonal F H g) =
      diagonal F H' (WithConv.toConv (g.ofConv.comp (φ : H' →ₐ[F] H))) := by
  sorry

theorem proj_map {H' : Type} [CommRing H'] [HopfAlgebra F H']
    (φ : H' →ₐc[F] H) (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (x : AdelicPoints F H) :
    proj F H' v (map F H φ x) =
      WithConv.toConv ((proj F H v x).ofConv.comp (φ : H' →ₐ[F] H)) := by
  sorry

-- Test AdelicPoints.map_trivial.
example (φ : F →ₐc[F] H) (x : AdelicPoints F H) : map F H φ x = 1 := by
  sorry

-- Test AdelicPoints.ga_eq_adeles, algebraic part; the homeomorphism is `AdelicPoints.gaEquiv`.
-- The canonical identification is evaluation at the generator (pinned `gaPointsMulEquiv`), and it
-- carries the diagonal to `algebraMap F 𝔸_F`; an abstract `Nonempty (≃*)` would not test this.
example (g : WithConv (SymmetricAlgebra F F →ₐ[F] F)) :
    Multiplicative.toAdd (TauCeti.AdditiveGroup.gaPointsMulEquiv
        (diagonal F (SymmetricAlgebra F F) g)) =
      algebraMap F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)
        (Multiplicative.toAdd (TauCeti.AdditiveGroup.gaPointsMulEquiv g)) := by
  sorry

-- Test AdelicPoints.trivial_group uses the actual trivial coordinate Hopf algebra.
example : Subsingleton (AdelicPoints F F) := by
  sorry

-- Test AdelicPoints.map_det_gl1: determinant is the canonical GL_1-to-units comparison.
example (x : AdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 1)) :
    TauCeti.DiagonalizableGroup.pointsMulEquiv
      (map F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 1)
        (TauCeti.GeneralLinear.determinantCoordinateMap F 1).hom x)
      (Multiplicative.ofAdd (1 : ℤ)) =
        Matrix.GeneralLinearGroup.det (TauCeti.GeneralLinear.pointsMulEquiv (R := F) 1 x) := by
  sorry

end AdelicPoints

abbrev RationalCharacter (F : Type) [Field F]
    (H : Type) [CommRing H] [HopfAlgebra F H] := GroupLike F H

namespace RationalCharacter
variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

def apply {R : Type} [CommRing R] [Algebra F R] (χ : RationalCharacter F H)
    (x : WithConv (H →ₐ[F] R)) : Rˣ :=
  Units.map x.ofConv.toMonoidHom (GroupLike.toUnits F χ)

theorem apply_mul {R : Type} [CommRing R] [Algebra F R]
    (χ : RationalCharacter F H) (x y : WithConv (H →ₐ[F] R)) :
    χ.apply (x * y) = χ.apply x * χ.apply y := by
  sorry

/-- Rational characters as bialgebra maps `F[T, T⁻¹] → H`, with Mathlib's convolution product on
`WithConv (F[T, T⁻¹] →ₐc[F] H)`; the map is fixed by `equivHom_apply_T`. -/
def equivHom : RationalCharacter F H ≃* WithConv (LaurentPolynomial F →ₐc[F] H) := sorry

/-- `equivHom χ` sends the coordinate `T` to `χ`; this determines it, since `T` generates
`F[T, T⁻¹]` as an algebra and the map is an algebra map. -/
theorem equivHom_apply_T (χ : RationalCharacter F H) :
    (equivHom χ).ofConv (LaurentPolynomial.T 1) = χ.val := by
  sorry

/-- The base change of a rational character to an algebraic closure; fixed by `toGeometric_val`. -/
def toGeometric (χ : RationalCharacter F H) :
    TauCeti.CommHopfAlgCat.geometricCharacterGroup (CommHopfAlgCat.of F H) := sorry

/-- `toGeometric χ` is the group-like element `1 ⊗ χ` of `F̄ ⊗_F H`. -/
theorem toGeometric_val (χ : RationalCharacter F H) :
    (toGeometric χ).val = (1 : AlgebraicClosure F) ⊗ₜ[F] (χ.val : H) := by
  sorry

theorem toGeometric_injective : Function.Injective (toGeometric (F := F) (H := H)) := by
  sorry

theorem toGeometric_range [CharZero F] :
    Set.range (toGeometric (F := F) (H := H)) =
      {χ | ∀ σ : Field.absoluteGaloisGroup F, σ • χ = χ} := by
  sorry

theorem free [Algebra.FiniteType F H]
    (hred : TauCeti.geometricallyReducedCommHopfAlgProperty F (CommHopfAlgCat.of F H))
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F (CommHopfAlgCat.of F H)) :
    Module.Free ℤ (Additive (RationalCharacter F H)) ∧
    Module.Finite ℤ (Additive (RationalCharacter F H)) := by
  sorry

-- Test RationalCharacter.gln_det: determinant is the specified lattice generator.
example (n : ℕ) (hn : 0 < n) :
    ∃ e : RationalCharacter F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) ≃*
      Multiplicative ℤ,
      e (TauCeti.GeneralLinear.determinantGroupLike F n) = Multiplicative.ofAdd (1 : ℤ) := by
  sorry

-- Test RationalCharacter.sln_trivial at the actual determinant-one coordinate quotient.
example (n : ℕ) :
    Subsingleton (RationalCharacter F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n)) := by
  sorry

-- Test RationalCharacter.equivHom_tautological: the coordinate `T` of `G_m` corresponds to the
-- identity bialgebra map; the inverse-twisted equivalence `χ ↦ (T ↦ χ⁻¹)` fails this.
example :
    (equivHom (⟨LaurentPolynomial.T 1, by sorry⟩ : RationalCharacter F (LaurentPolynomial F))).ofConv =
      BialgHom.id F (LaurentPolynomial F) := by
  sorry

-- Test RationalCharacter.toGeometric_not_inverse: `toGeometric T = 1 ⊗ T`, not `1 ⊗ T⁻¹`; the
-- inverse-twisted map is also injective with the same Galois-fixed range.
example :
    (toGeometric (⟨LaurentPolynomial.T 1, by sorry⟩ : RationalCharacter F (LaurentPolynomial F))).val ≠
      (1 : AlgebraicClosure F) ⊗ₜ[F] (LaurentPolynomial.T (-1) : LaurentPolynomial F) := by
  sorry

end RationalCharacter

abbrev RealCharacterSpace (F : Type) [Field F]
    (H : Type) [CommRing H] [HopfAlgebra F H] := Additive (RationalCharacter F H) →+ ℝ

namespace RealCharacterSpace
variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

def pairing (a : RealCharacterSpace F H) (χ : RationalCharacter F H) : ℝ :=
  a (Additive.ofMul χ)

theorem finrank [Module.Free ℤ (Additive (RationalCharacter F H))]
    [Module.Finite ℤ (Additive (RationalCharacter F H))] :
    Module.finrank ℝ (RealCharacterSpace F H) =
      Module.finrank ℤ (Additive (RationalCharacter F H)) := by
  sorry

/-- The covariant map `a_G → a_{G'}` of a coordinate Hopf map `φ : H' → H` (a homomorphism
`G → G'`): precomposition with the pullback `χ' ↦ φ χ'` of rational characters; fixed by
`map_apply`. -/
def map {H' : Type} [CommRing H'] [HopfAlgebra F H'] (φ : H' →ₐc[F] H) :
    RealCharacterSpace F H →ₗ[ℝ] RealCharacterSpace F H' := sorry

/-- `map φ a` evaluates `a` on the pulled-back character. -/
theorem map_apply {H' : Type} [CommRing H'] [HopfAlgebra F H'] (φ : H' →ₐc[F] H)
    (a : RealCharacterSpace F H) (χ : RationalCharacter F H') :
    map φ a (Additive.ofMul χ) = a (Additive.ofMul ⟨φ χ.val, χ.isGroupLikeElem_val.map φ⟩) := by
  sorry

theorem map_id (a : RealCharacterSpace F H) : map (BialgHom.id F H) a = a := by
  sorry

theorem map_comp {H' H'' : Type} [CommRing H'] [HopfAlgebra F H']
    [CommRing H''] [HopfAlgebra F H''] (φ : H' →ₐc[F] H) (ψ : H'' →ₐc[F] H')
    (a : RealCharacterSpace F H) : map (φ.comp ψ) a = map ψ (map φ a) := by
  sorry

-- Test RealCharacterSpace.gln_finrank: the dimension assertion uses the actual GL_n carrier.
example (n : ℕ) (hn : 0 < n) :
    Module.finrank ℝ (RealCharacterSpace F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n)) = 1 := by
  sorry

-- Test RealCharacterSpace.sln_zero at the actual determinant-one carrier.
example (n : ℕ) :
    Subsingleton (RealCharacterSpace F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n)) := by
  sorry

end RealCharacterSpace

/-! Layer 1: Integral models use finitely presented Hopf algebras and genuine Hopf isomorphisms.
The S-integer algebra and local integer inclusion are the canonical library carriers. -/
open CategoryTheory

abbrev AdelicSIntegers (F : Type) [Field F] [NumberField F]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :=
  (S : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))).integer F

structure IntegralModel (F : Type) [Field F] [NumberField F]
    (H : Type) [CommRing H] [HopfAlgebra F H]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) where
  coordinate : CommHopfAlgCat (AdelicSIntegers F S)
  finitePresentation : Algebra.FinitePresentation (AdelicSIntegers F S) coordinate
  baseChangeIso : TauCeti.CommHopfAlgCat.baseChange (K := F) coordinate ≅ CommHopfAlgCat.of F H

namespace IntegralModel
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  {S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}

/-- The value map is the canonical S-integer inclusion into the completed valuation ring. -/
def localIntegerMap (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    AdelicSIntegers F S →+* v.val.adicCompletionIntegers F where
  toFun x := ⟨algebraMap F (v.val.adicCompletion F) x, by sorry⟩
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry

instance localIntegerAlgebra (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    Algebra (AdelicSIntegers F S) (v.val.adicCompletionIntegers F) := (localIntegerMap v).toAlgebra

abbrev IntegralPoints (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :=
  TauCeti.HopfAlgebra.points (H := M.coordinate)
    (CommAlgCat.of (AdelicSIntegers F S) (v.val.adicCompletionIntegers F))

/-- Extend an integral point through the specified generic-fibre Hopf isomorphism. -/
def localEmbed (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    IntegralPoints M v →* AdelicPoints.LocalPoints F H v.val := sorry

theorem localEmbed_apply (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S})
    (x : IntegralPoints M v) (h : M.coordinate) :
    (localEmbed M v x).ofConv (M.baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F S] h)) =
      algebraMap (v.val.adicCompletionIntegers F) (v.val.adicCompletion F) (x.ofConv h) := by
  sorry

def localPoints (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    Subgroup (AdelicPoints.LocalPoints F H v.val) := (localEmbed M v).range

theorem localPoints_injective (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    Function.Injective (localEmbed M v) := by
  sorry

/-- Enlarge S by scalar extension; the Hopf base-change tower isomorphism fixes the generic fibre.
Fixed by `enlarge_coordinate`. -/
def enlarge (M : IntegralModel F H S)
    (T : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (hST : S ⊆ T) : IntegralModel F H T := sorry

/-- The enlarged model is the base change of `M.coordinate` along `𝒪_{F,S} → 𝒪_{F,T}`, by a Hopf
isomorphism under which the two generic-fibre identifications agree. Equality of local points alone
would also admit a product with a non-reduced group scheme supported at a prime outside `T`, which
has the same `𝒪_v`-points but is not smooth, or a generic-fibre identification twisted by a Hopf
automorphism. The inclusion `hle` of the `S`-integers in the `T`-integers holds because `S ⊆ T`. -/
theorem enlarge_coordinate (M : IntegralModel F H S)
    (T : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) (hST : S ⊆ T)
    (hle : ((S : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))).integer F) ≤
      ((T : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))).integer F)) :
    letI : Algebra (AdelicSIntegers F S) (AdelicSIntegers F T) :=
      (Subalgebra.inclusion hle).toRingHom.toAlgebra
    ∃ e : (M.enlarge T hST).coordinate ≅
        TauCeti.CommHopfAlgCat.baseChange (K := AdelicSIntegers F T) M.coordinate,
      ∀ h : M.coordinate,
        (M.enlarge T hST).baseChangeIso.hom.hom
            ((1 : F) ⊗ₜ[AdelicSIntegers F T]
              e.inv.hom ((1 : AdelicSIntegers F T) ⊗ₜ[AdelicSIntegers F S] h)) =
          M.baseChangeIso.hom.hom ((1 : F) ⊗ₜ[AdelicSIntegers F S] h) := by
  sorry

theorem enlarge_localPoints (M : IntegralModel F H S)
    (T : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (hST : S ⊆ T)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ T}) :
    (enlarge M T hST).localPoints v = M.localPoints ⟨v.val, by sorry⟩ := by
  sorry

/-- Standard GL_n model: its coordinate ring is the library's determinant localization. -/
def standardGLn (n : ℕ) : IntegralModel F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) S where
  coordinate := CommHopfAlgCat.of (AdelicSIntegers F S)
    (TauCeti.GeneralLinear.coordinateHopfAlgebra (AdelicSIntegers F S) n)
  finitePresentation := by sorry
  baseChangeIso := by sorry

-- Test IntegralModel.gln_localPoints: the determinant must be a unit in O_v.
example (n : ℕ)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    ((standardGLn (F := F) (S := S) n).localPoints v).map
      (TauCeti.GeneralLinear.pointsMulEquiv (R := F) (A := v.val.adicCompletion F) n).toMonoidHom =
      (Matrix.GeneralLinearGroup.map
        (algebraMap (v.val.adicCompletionIntegers F) (v.val.adicCompletion F))).range := by
  sorry

-- Test IntegralModel.ga_rescaled_identification: with generator `X ↦ c • T` the integral points
-- at `v ∉ S` are `c⁻¹ 𝒪_v`; they depend on the specified identification.
example (M : IntegralModel F (SymmetricAlgebra F F) S) (c : AdelicSIntegers F S)
    (X : M.coordinate) (hgen : Algebra.adjoin (AdelicSIntegers F S) {X} = ⊤)
    (hX : M.baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F S] X) =
      (c : F) • SymmetricAlgebra.ι F F 1)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    (((M.localPoints v).map
        (TauCeti.AdditiveGroup.gaPointsMulEquiv (R := F) (A := v.val.adicCompletion F)).toMonoidHom) :
          Set (Multiplicative (v.val.adicCompletion F))) =
      {a | algebraMap F (v.val.adicCompletion F) (c : F) * Multiplicative.toAdd a ∈
        v.val.adicCompletionIntegers F} := by
  sorry

end IntegralModel

namespace IntegralModel
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- and . -/
theorem «exists» [Algebra.FiniteType F H] :
    ∃ S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)),
      Nonempty (IntegralModel F H S) := by
  sorry

/-- the enlarged models have a compatible Hopf isomorphism. -/
theorem unique
    {S S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S) (M' : IntegralModel F H S') :
    ∃ T, ∃ hST : S ⊆ T, ∃ hS'T : S' ⊆ T,
      ∃ e : (M.enlarge T hST).coordinate ≅ (M'.enlarge T hS'T).coordinate,
        ∀ h : (M.enlarge T hST).coordinate,
          (M.enlarge T hST).baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F T] h) =
            (M'.enlarge T hS'T).baseChangeIso.hom.hom
              (1 ⊗ₜ[AdelicSIntegers F T] e.hom.hom h) := by
  sorry

/-- , morphism clause: a Hopf map `H' → H` spreads to a Hopf map of the
enlarged models compatible with the generic-fibre identifications. -/
theorem exists_spread_hom {H' : Type} [CommRing H'] [HopfAlgebra F H']
    {S S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S) (M' : IntegralModel F H' S') (φ : H' →ₐc[F] H) :
    ∃ T, ∃ hST : S ⊆ T, ∃ hS'T : S' ⊆ T,
      ∃ ψ : (M'.enlarge T hS'T).coordinate ⟶ (M.enlarge T hST).coordinate,
        ∀ h : (M'.enlarge T hS'T).coordinate,
          (M.enlarge T hST).baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F T] ψ.hom h) =
            φ ((M'.enlarge T hS'T).baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F T] h)) := by
  sorry
end IntegralModel

/-! Layer 1: The evaluation topology on points and the restricted-product realization.

The topology on `R`-points of an affine group over a topological `F`-algebra `R` is the
coarsest one for which every coordinate evaluation `x ↦ x h` is continuous: the point topology of
ReductiveGroupsPartII, layer RG2.0, which also owns its chart independence. That layer states its
Hausdorff, local compactness and countability theorems for groups over a local field `E` with
values in `E`; the instances below are their forms for an `F`-group with values in `F_v`. -/

namespace AdelicPoints

/-- the affine-points topology on `R`-points, induced from `R^H` by
evaluation; it is the point topology of ReductiveGroupsPartII, RG2.0. -/
abbrev evalTopology (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H]
    (R : Type) [CommRing R] [Algebra F R] [TopologicalSpace R] :
    TopologicalSpace (WithConv (H →ₐ[F] R)) :=
  PointTopology.instTopologicalSpaceWithConv F H R

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

instance instTopologicalSpace : TopologicalSpace (AdelicPoints F H) :=
  evalTopology F H (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)

instance instTopologicalSpaceFinite : TopologicalSpace (FiniteAdelicPoints F H) :=
  evalTopology F H (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F)

instance instTopologicalSpaceInfinite : TopologicalSpace (InfinitePoints F H) :=
  evalTopology F H (NumberField.InfiniteAdeleRing F)

instance instTopologicalSpaceLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    TopologicalSpace (LocalPoints F H v) :=
  evalTopology F H (v.adicCompletion F)

instance instIsTopologicalGroup : IsTopologicalGroup (AdelicPoints F H) := sorry

instance instIsTopologicalGroupFinite : IsTopologicalGroup (FiniteAdelicPoints F H) := sorry

instance instIsTopologicalGroupInfinite : IsTopologicalGroup (InfinitePoints F H) := sorry

instance instIsTopologicalGroupLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    IsTopologicalGroup (LocalPoints F H v) := sorry

theorem continuous_eval (h : H) :
    Continuous (fun x : AdelicPoints F H =>
      (x.ofConv h : NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) := by
  sorry

theorem continuous_proj (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    Continuous (proj F H v) := by
  sorry

theorem continuous_finiteProjection : Continuous (finiteProjection F H) := by
  sorry

theorem continuous_infiniteProjection : Continuous (infiniteProjection F H) := by
  sorry

theorem continuous_finiteEmbed : Continuous (finiteEmbed F H) := by
  sorry

/-- the induced map on adelic points is continuous. -/
theorem continuous_map {H' : Type} [CommRing H'] [HopfAlgebra F H'] (φ : H' →ₐc[F] H) :
    Continuous (map F H φ) := by
  sorry

-- Test AdelicPoints.not_product_topology: for `G_m` evaluation at `T` is injective but is not an
-- embedding into `𝔸_F`; the topology is not the subspace topology of `𝔸_F^×` in `𝔸_F`.
example : Function.Injective (fun x : AdelicPoints F (LaurentPolynomial F) =>
      (x.ofConv (LaurentPolynomial.T 1) : NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) ∧
    ¬ Topology.IsEmbedding (fun x : AdelicPoints F (LaurentPolynomial F) =>
      (x.ofConv (LaurentPolynomial.T 1) : NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) := by
  sorry

/-! The local groups `G(F_v)`: ReductiveGroupsPartII, RG2.0. -/

instance instT2SpaceLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    T2Space (LocalPoints F H v) := sorry

instance instLocallyCompactSpaceLocal [Algebra.FiniteType F H]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    LocallyCompactSpace (LocalPoints F H v) := sorry

instance instSecondCountableLocal [Algebra.FiniteType F H]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    SecondCountableTopology (LocalPoints F H v) := sorry

instance instT2Space : T2Space (AdelicPoints F H) := sorry

instance instLocallyCompactSpace [Algebra.FiniteType F H] :
    LocallyCompactSpace (AdelicPoints F H) := sorry

instance instSecondCountable [Algebra.FiniteType F H] :
    SecondCountableTopology (AdelicPoints F H) := sorry

instance instT2SpaceFinite : T2Space (FiniteAdelicPoints F H) := sorry

instance instLocallyCompactSpaceFinite [Algebra.FiniteType F H] :
    LocallyCompactSpace (FiniteAdelicPoints F H) := sorry

instance instSecondCountableFinite [Algebra.FiniteType F H] :
    SecondCountableTopology (FiniteAdelicPoints F H) := sorry

instance instLocallyCompactSpaceInfinite [Algebra.FiniteType F H] :
    LocallyCompactSpace (InfinitePoints F H) := sorry

/-- the diagonal is injective with discrete closed image. -/
theorem diagonal_injective : Function.Injective (diagonal F H) := by
  sorry

theorem discreteTopology_range_diagonal [Algebra.FiniteType F H] :
    DiscreteTopology (diagonal F H).range := by
  sorry

theorem isClosed_range_diagonal [Algebra.FiniteType F H] :
    IsClosed ((diagonal F H).range : Set (AdelicPoints F H)) := by
  sorry

/-- The diagonal into the finite adelic points. -/
def finiteDiagonal : WithConv (H →ₐ[F] F) →* FiniteAdelicPoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- `G(F)` is discrete in `G(𝔸_{F,f})` exactly when it
meets a compact open subgroup in a finite set. -/
theorem discreteTopology_finiteDiagonal_iff [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    DiscreteTopology (finiteDiagonal F H).range ↔ ((finiteDiagonal F H) ⁻¹' U).Finite := by
  sorry

/-- archimedean and finite parts. -/
def infiniteFiniteEquiv : AdelicPoints F H ≃ₜ* (InfinitePoints F H × FiniteAdelicPoints F H) :=
  sorry

theorem infiniteFiniteEquiv_apply (x : AdelicPoints F H) :
    infiniteFiniteEquiv F H x = (infiniteProjection F H x, finiteProjection F H x) := by
  sorry

theorem infiniteFiniteEquiv_diagonal (g : WithConv (H →ₐ[F] F)) :
    infiniteFiniteEquiv F H (diagonal F H g) =
      (TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g, finiteDiagonal F H g) := by
  sorry

/-- points over a product of algebras. -/
def prodValueEquiv (R₁ R₂ : Type) [CommRing R₁] [Algebra F R₁] [CommRing R₂] [Algebra F R₂] :
    WithConv (H →ₐ[F] R₁ × R₂) ≃* WithConv (H →ₐ[F] R₁) × WithConv (H →ₐ[F] R₂) where
  toFun x := (WithConv.toConv ((AlgHom.fst F R₁ R₂).comp x.ofConv),
    WithConv.toConv ((AlgHom.snd F R₁ R₂).comp x.ofConv))
  invFun y := WithConv.toConv (y.1.ofConv.prod y.2.ofConv)
  left_inv := sorry
  right_inv := sorry
  map_mul' := sorry

theorem isHomeomorph_prodValueEquiv (R₁ R₂ : Type) [CommRing R₁] [Algebra F R₁]
    [TopologicalSpace R₁] [CommRing R₂] [Algebra F R₂] [TopologicalSpace R₂] :
    @IsHomeomorph _ _ (evalTopology F H (R₁ × R₂))
      (@instTopologicalSpaceProd _ _ (evalTopology F H R₁) (evalTopology F H R₂))
      (prodValueEquiv F H R₁ R₂) := by
  sorry

end AdelicPoints

/-! Layer 1: Integral points as levels and the restricted product. -/

namespace IntegralModel
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  {S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}

/-- The level family: `𝓗(𝒪_v)` outside `S`, the whole local group at `v ∈ S`. -/
def levelFamily (M : IntegralModel F H S)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    Subgroup (AdelicPoints.LocalPoints F H v) :=
  if hv : v ∈ S then ⊤ else M.localPoints ⟨v, hv⟩

instance levelFamily_isOpen [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    Fact (∀ v, IsOpen (M.levelFamily v : Set (AdelicPoints.LocalPoints F H v))) := sorry

/-- `x ↦ (p_v x)_v` is an isomorphism of topological groups
`G(𝔸_{F,f}) ≃ Πʳ v, [G(F_v), B_v]`. -/
def restrictedProductEquiv [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    AdelicPoints.FiniteAdelicPoints F H ≃ₜ*
      Πʳ v, [AdelicPoints.LocalPoints F H v, M.levelFamily v] :=
  sorry

theorem restrictedProductEquiv_apply [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (x : AdelicPoints.FiniteAdelicPoints F H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (h : H) :
    ((restrictedProductEquiv M x v).ofConv h : v.adicCompletion F) =
      (x.ofConv h : IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F) v := by
  sorry

/-- the bijection on `S'`-adelic points, before topology. -/
theorem restrictedProductEquiv_bijective [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    Function.Bijective (restrictedProductEquiv M) :=
  (restrictedProductEquiv M).bijective

/-- two models differ by `changeSubgroups`. -/
theorem eventually_levelFamily_eq [Algebra.FiniteType F H]
    {S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S) (M' : IntegralModel F H S') :
    ∀ᶠ v in Filter.cofinite, M.levelFamily v = M'.levelFamily v := by
  sorry

theorem restrictedProductEquiv_indep [Algebra.FiniteType F H]
    {S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S) (M' : IntegralModel F H S') (x : AdelicPoints.FiniteAdelicPoints F H) :
    restrictedProductEquiv M' x =
      RestrictedProduct.changeSubgroups M.levelFamily M'.levelFamily
        (eventually_levelFamily_eq M M') (restrictedProductEquiv M x) := by
  sorry

end IntegralModel

/-! Layer 1: Concrete groups, levels and unimodularity. -/

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F]

/-- `G_a(𝔸_F) ≃ 𝔸_F`, through evaluation at the generator. -/
def gaEquiv :
    AdelicPoints F (SymmetricAlgebra F F) ≃ₜ*
      Multiplicative (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :=
  sorry

theorem gaEquiv_apply (x : AdelicPoints F (SymmetricAlgebra F F)) :
    gaEquiv F x = TauCeti.AdditiveGroup.gaPointsMulEquiv x := by
  sorry

-- Test AdelicPoints.ga_topological: the additive comparison includes both continuity directions.
example : Nonempty (AdelicPoints F (SymmetricAlgebra F F) ≃ₜ*
    Multiplicative (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) :=
  ⟨gaEquiv F⟩

/-- `G_m(𝔸_F)` is the idele group with its units topology. -/
def gmEquiv :
    AdelicPoints F (LaurentPolynomial F) ≃ₜ* NumberField.IdeleGroup (NumberField.RingOfIntegers F) F :=
  sorry

theorem gmEquiv_apply (x : AdelicPoints F (LaurentPolynomial F)) :
    gmEquiv F x = TauCeti.MultiplicativeGroup.pointsMulEquiv x := by
  sorry

/-- The finite part of `gm-adelic`: `G_m(𝔸_{F,f}) ≃ 𝔸_{F,f}^×`. -/
def gmFiniteEquiv :
    FiniteAdelicPoints F (LaurentPolynomial F) ≃ₜ*
      (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F)ˣ :=
  sorry

theorem gmFiniteEquiv_apply (x : FiniteAdelicPoints F (LaurentPolynomial F)) :
    gmFiniteEquiv F x = TauCeti.MultiplicativeGroup.pointsMulEquiv x := by
  sorry

-- Test AdelicPoints.map_not_open: for `G_m` over `ℚ` the image of squaring, `(𝔸_ℚ^×)²`, is
-- closed of infinite index but not open.
example : IsClosed ((powMonoidHom 2 : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ →*
      NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ).range :
        Set (NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ)) ∧
    (powMonoidHom 2 : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ →*
      NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ).range.index = 0 ∧
    ¬ IsOpen ((powMonoidHom 2 : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ →*
      NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ).range :
        Set (NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ)) := by
  sorry

/-- `GL_n(𝔸_F)` with the units topology of the matrix ring. -/
def glnEquiv (n : ℕ) :
    AdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) ≃ₜ*
      GL (Fin n) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :=
  sorry

theorem glnEquiv_apply (n : ℕ) (x : AdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n)) :
    glnEquiv F n x = TauCeti.GeneralLinear.pointsMulEquiv (R := F) n x := by
  sorry

/-- The finite part of `gln-adelic`; fixed by `glnFiniteEquiv_apply`. -/
def glnFiniteEquiv (n : ℕ) :
    FiniteAdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) ≃ₜ*
      GL (Fin n) (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F) :=
  sorry

theorem glnFiniteEquiv_apply (n : ℕ)
    (x : FiniteAdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n)) :
    glnFiniteEquiv F n x = TauCeti.GeneralLinear.pointsMulEquiv (R := F) n x := by
  sorry

-- Test AdelicPoints.glnFiniteEquiv_not_inverse: the comparison is the matrix of coordinates, not
-- its inverse transpose (also a topological group isomorphism); at `n = 1` they differ at a finite
-- idele of order greater than two.
example : ∃ x : FiniteAdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 1),
    glnFiniteEquiv F 1 x ≠ (TauCeti.GeneralLinear.pointsMulEquiv (R := F) 1 x)⁻¹ := by
  sorry

/-- two compact open subgroups of `G(𝔸_{F,f})` are commensurable. -/
theorem commensurable_of_compact_open {H : Type} [CommRing H] [HopfAlgebra F H]
    [Algebra.FiniteType F H] {U U' : Subgroup (FiniteAdelicPoints F H)}
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (hU' : IsCompact (U' : Set (FiniteAdelicPoints F H)))
    (hU'o : IsOpen (U' : Set (FiniteAdelicPoints F H))) :
    Subgroup.Commensurable U U' := by
  sorry

end AdelicPoints

namespace IntegralModel
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  {S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}

/-- The product level `∏_v V_v` inside `G(𝔸_{F,f})`, through the restricted-product comparison. -/
def productLevel [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (V : ∀ v, Subgroup (AdelicPoints.LocalPoints F H v))
    (hV : ∀ᶠ v in Filter.cofinite, V v = M.levelFamily v) :
    Subgroup (AdelicPoints.FiniteAdelicPoints F H) where
  carrier := {x | ∀ v, restrictedProductEquiv M x v ∈ V v}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- every compact open subgroup contains, and is contained in, a
product level whose factors are compact open and equal to `𝓗(𝒪_v)` at almost every place. -/
theorem exists_productLevel_le [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ∃ (V : ∀ v, Subgroup (AdelicPoints.LocalPoints F H v))
      (hV : ∀ᶠ v in Filter.cofinite, V v = M.levelFamily v),
      (∀ v, IsCompact (V v : Set (AdelicPoints.LocalPoints F H v)) ∧
        IsOpen (V v : Set (AdelicPoints.LocalPoints F H v))) ∧ M.productLevel V hV ≤ U := by
  sorry

theorem exists_le_productLevel [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ∃ (V : ∀ v, Subgroup (AdelicPoints.LocalPoints F H v))
      (hV : ∀ᶠ v in Filter.cofinite, V v = M.levelFamily v),
      (∀ v, IsCompact (V v : Set (AdelicPoints.LocalPoints F H v)) ∧
        IsOpen (V v : Set (AdelicPoints.LocalPoints F H v))) ∧ U ≤ M.productLevel V hV := by
  sorry

/-- conjugating a product level changes it only at the finitely
many places where `g` is not integral. -/
theorem conj_productLevel [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (V : ∀ v, Subgroup (AdelicPoints.LocalPoints F H v))
    (hV : ∀ᶠ v in Filter.cofinite, V v = M.levelFamily v)
    (g : AdelicPoints.FiniteAdelicPoints F H) :
    ∃ hV' : ∀ᶠ v in Filter.cofinite,
        (V v).map (MulAut.conj (restrictedProductEquiv M g v)).toMonoidHom = M.levelFamily v,
      (M.productLevel V hV).map (MulAut.conj g).toMonoidHom =
        M.productLevel (fun v => (V v).map (MulAut.conj (restrictedProductEquiv M g v)).toMonoidHom)
          hV' := by
  sorry

/-- The integral level `∏_v 𝓗(𝒪_v)` (the whole local group at `v ∈ S`). -/
def integralLevel [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    Subgroup (AdelicPoints.FiniteAdelicPoints F H) :=
  M.productLevel M.levelFamily (Filter.Eventually.of_forall fun _ => rfl)

/-- Every finite adelic point is `g_B * u` with `g_B` supported on a finite set `B` and `u` in the
integral level. -/
theorem exists_finiteSupport_mul [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (g : AdelicPoints.FiniteAdelicPoints F H) :
    ∃ (B : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
      (gB u : AdelicPoints.FiniteAdelicPoints F H),
      (∀ v ∉ B, restrictedProductEquiv M gB v = 1) ∧ u ∈ M.integralLevel ∧ g = gB * u := by
  sorry

/-- the `S'`-adeles `∏_{v ∈ S'} F_v × ∏_{v ∉ S'} 𝒪_v`. -/
def sAdeles (S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :
    Subring (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F) where
  carrier := {x | ∀ v ∉ S', x v ∈ v.adicCompletionIntegers F}
  zero_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  mul_mem' := sorry
  neg_mem' := sorry

theorem isOpen_sAdeles
    (S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :
    IsOpen (sAdeles (F := F) S' :
      Set (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F)) := by
  sorry

theorem sAdeles_mono {S₁ S₂ : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (h : S₁ ⊆ S₂) : sAdeles (F := F) S₁ ≤ sAdeles S₂ := by
  sorry

theorem iSup_sAdeles : ⨆ S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)),
    sAdeles (F := F) S' = ⊤ := by
  sorry

/-- Every finite adelic point takes integral values on the model outside a larger finite set. -/
theorem exists_sAdeles [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (x : AdelicPoints.FiniteAdelicPoints F H) :
    ∃ T, S ⊆ T ∧ ∀ h : M.coordinate,
      (x.ofConv (M.baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F S] h)) :
        IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F) ∈ sAdeles T := by
  sorry

end IntegralModel

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `H` as an object of the finite-type Hopf algebra category, for reductivity hypotheses. -/
abbrev finiteTypeObj [Algebra.FiniteType F H] : TauCeti.FiniteTypeCommHopfAlgCat F :=
  ⟨CommHopfAlgCat.of F H, (inferInstance : Algebra.FiniteType F H)⟩

/-- `G(F_v)` is unimodular for connected reductive `G`. -/
theorem modularCharacter_local_eq_one [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    MeasureTheory.Measure.modularCharacter (G := LocalPoints F H v) = 1 := by
  sorry

/-- `G(𝔸_F)`, `G(𝔸_{F,f})` and `G(F_∞)` are unimodular. -/
theorem modularCharacter_eq_one [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    MeasureTheory.Measure.modularCharacter (G := AdelicPoints F H) = 1 ∧
      MeasureTheory.Measure.modularCharacter (G := FiniteAdelicPoints F H) = 1 ∧
      MeasureTheory.Measure.modularCharacter (G := InfinitePoints F H) = 1 := by
  sorry

/-- For a central Hopf ideal `I` (the centre is the case
`I = centerDefiningIdeal`): its adelic points are central in `G(𝔸_F)`, and `I(F) = I(𝔸_F) ∩ G(F)`. -/
theorem quotientPointsSubgroup_le_center (I : TauCeti.HopfIdeal F (CommHopfAlgCat.of F H))
    (hI : I.IsCentral) :
    (TauCeti.CommHopfAlgCat.quotientPointsSubgroup (CommHopfAlgCat.of F H) I
      (CommAlgCat.of F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) :
        Set (AdelicPoints F H)) ⊆ Subgroup.center (AdelicPoints F H) := by
  sorry

theorem diagonal_mem_quotientPointsSubgroup_iff (I : TauCeti.HopfIdeal F (CommHopfAlgCat.of F H))
    (g : WithConv (H →ₐ[F] F)) :
    diagonal F H g ∈ (TauCeti.CommHopfAlgCat.quotientPointsSubgroup (CommHopfAlgCat.of F H) I
      (CommAlgCat.of F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) :
        Set (AdelicPoints F H)) ↔
      g ∈ (TauCeti.CommHopfAlgCat.quotientPointsSubgroup (CommHopfAlgCat.of F H) I
        (CommAlgCat.of F F) : Set (WithConv (H →ₐ[F] F))) := by
  sorry

end AdelicPoints

namespace IntegralModel

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  {S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}

/-- A reductive integral model is smooth over its S-integer base and has connected reductive
fibres after every field-valued base change (Conrad, Reductive group schemes, Definition 3.1.1). -/
def IsReductive (M : IntegralModel F H S) : Prop :=
  Algebra.Smooth (AdelicSIntegers F S) M.coordinate ∧
    ∀ (k : Type) [Field k] [Algebra (AdelicSIntegers F S) k],
      letI := M.finitePresentation
      TauCeti.reductiveCommHopfAlgProperty k
        ⟨CommHopfAlgCat.of k (k ⊗[AdelicSIntegers F S] M.coordinate),
          (inferInstance : Algebra.FiniteType k (k ⊗[AdelicSIntegers F S] M.coordinate))⟩

/-- Reductivity of an integral model includes that of its specified generic fibre. -/
theorem IsReductive.generic [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (hM : M.IsReductive) :
    TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H) := by
  sorry

/-- Reductivity survives enlargement of the exceptional set by base change. -/
theorem IsReductive.enlarge (M : IntegralModel F H S) (hM : M.IsReductive)
    (T : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (hST : S ⊆ T) : (M.enlarge T hST).IsReductive := by
  sorry

/-- A connected reductive generic fibre admits a reductive model outside finitely many places.
Conrad, Reductive group schemes, Corollary 3.1.11, pp. 88–89, and finite presentation descent. -/
theorem exists_reductive [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H)) :
    ∃ S, ∃ M : IntegralModel F H S, M.IsReductive := by
  sorry

/-- The standard general linear model has connected reductive fibres in every rank. -/
theorem standardGLn_isReductive (n : ℕ) : (standardGLn (F := F) (S := S) n).IsReductive := by
  sorry

-- Test IntegralModel.reductive_rank_zero: GL_0 is the trivial smooth group scheme.
example : (standardGLn (F := F) (S := S) 0).IsReductive := standardGLn_isReductive 0

-- Test IntegralModel.reductive_rank_one: GL_1 is the standard multiplicative group model.
example : (standardGLn (F := F) (S := S) 1).IsReductive := standardGLn_isReductive 1

-- Test IntegralModel.additive_not_reductive: smoothness alone does not suffice.
example (M : IntegralModel F (SymmetricAlgebra F F) S) : ¬ M.IsReductive := by
  sorry

-- Test IntegralModel.enlarge_standard_reductive: enlarging the standard `GL_n` model stays
-- reductive; an `enlarge` adding a non-reduced factor at a prime outside `T` keeps the local points
-- and fails this.
example (n : ℕ) (T : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (hST : S ⊆ T) : ((standardGLn (F := F) (S := S) n).enlarge T hST).IsReductive :=
  IsReductive.enlarge _ (standardGLn_isReductive n) T hST

end IntegralModel

namespace MeasureTheory.Measure
open _root_.MeasureTheory.Measure

variable {G : Type*} [TopologicalSpace G] [Group G] [hctx28 : IsTopologicalGroup G] [hctx29 : LocallyCompactSpace G]
include hctx28 hctx29

theorem modularCharacter_eq_one_of_mem_compact {K : Subgroup G} (hK : IsCompact (K : Set G))
    {g : G} (hg : g ∈ K) : modularCharacter g = 1 := by
  sorry

theorem modularCharacter_eq_one_of_mem_center {g : G} (hg : g ∈ Subgroup.center G) :
    modularCharacter g = 1 := by
  sorry

end MeasureTheory.Measure

/-! Layer 2: The idele norm, the Harish-Chandra map and the norm-one subgroup.

`NumberField.ideleNorm` is Tau Ceti's idele norm `TauCeti.GlobalNumberFields.ideleNorm`
(the Global number fields roadmap, layer 6), read as a real number so that `H_G` can be stated;
its API below is that declaration's `continuous_ideleNorm` and `ideleNorm_unitEmbedding`. -/

namespace NumberField
open _root_.NumberField

variable (K : Type) [Field K] [NumberField K]

/-- The idele norm `‖x‖ = ∏_w |x_w|_w^{m_w} · ∏_v |x_v|_v`, with `m_w = 2` at complex places and
the finite factors normalized by `|ϖ_v|_v = q_v⁻¹`: Tau Ceti's `ideleNorm`, as a real number. -/
def ideleNorm (x : IdeleGroup (RingOfIntegers K) K) : ℝ :=
  ((TauCeti.GlobalNumberFields.ideleNorm x : NNReal) : ℝ)

/-- The norm-one ideles `𝔸_K^1`. -/
def normOneIdeles : Subgroup (IdeleGroup (RingOfIntegers K) K) where
  carrier := {x | ideleNorm K x = 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

end NumberField

/-- `a_G` with its finite-dimensional real topology. -/
instance RealCharacterSpace.instTopologicalSpace {F : Type} [Field F] {H : Type} [CommRing H]
    [HopfAlgebra F H] : TopologicalSpace (RealCharacterSpace F H) :=
  moduleTopology ℝ _

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- the Harish-Chandra map `H_G : G(𝔸_F) → a_G`,
`⟨H_G(x), χ⟩ = log ‖χ(x)‖`. -/
def logHeight : AdelicPoints F H →* Multiplicative (RealCharacterSpace F H) where
  toFun x := Multiplicative.ofAdd
    { toFun := fun χ => Real.log (NumberField.ideleNorm F
        (RationalCharacter.apply (Additive.toMul χ) x))
      map_zero' := sorry
      map_add' := sorry }
  map_one' := sorry
  map_mul' := sorry

theorem logHeight_apply (x : AdelicPoints F H) (χ : RationalCharacter F H) :
    RealCharacterSpace.pairing (Multiplicative.toAdd (logHeight F H x)) χ =
      Real.log (NumberField.ideleNorm F (RationalCharacter.apply χ x)) := by
  sorry

theorem continuous_logHeight [Algebra.FiniteType F H] : Continuous (logHeight F H) := by
  sorry

-- Test AdelicPoints.logHeight_infinite_rank: the infinite split torus is not finite type,
-- and pointwise convergence of its coordinates does not imply convergence in moduleTopology.
example :
    ¬ Algebra.FiniteType ℚ (AddMonoidAlgebra ℚ (ℕ →₀ ℤ)) ∧
      ¬ Continuous (logHeight ℚ (AddMonoidAlgebra ℚ (ℕ →₀ ℤ))) := by
  sorry

/-- `H_G` vanishes on `G(F)`, by the product formula. -/
theorem logHeight_diagonal (g : WithConv (H →ₐ[F] F)) : logHeight F H (diagonal F H g) = 1 := by
  sorry

theorem logHeight_map {H' : Type} [CommRing H'] [HopfAlgebra F H'] (φ : H' →ₐc[F] H)
    (x : AdelicPoints F H) :
    Multiplicative.toAdd (logHeight F H' (map F H φ x)) =
      RealCharacterSpace.map φ (Multiplicative.toAdd (logHeight F H x)) := by
  sorry

theorem logHeight_compact (K : Subgroup (AdelicPoints F H))
    (hK : IsCompact (K : Set (AdelicPoints F H))) : K ≤ (logHeight F H).ker := by
  sorry

/-- The character `T` of `G_m`. -/
def gmCharacter : RationalCharacter F (LaurentPolynomial F) :=
  ⟨LaurentPolynomial.T 1, sorry⟩

-- Test AdelicPoints.logHeight_gm: for `G_m`, `H_G` is the logarithm of the idele norm.
example (x : AdelicPoints F (LaurentPolynomial F)) :
    RealCharacterSpace.pairing (Multiplicative.toAdd (logHeight F (LaurentPolynomial F) x))
        (gmCharacter F) =
      Real.log (NumberField.ideleNorm F (gmEquiv F x)) := by
  sorry

-- Test RealCharacterSpace.map_square: for the squaring map of `G_m` (coordinate map `T ↦ T²`),
-- `map` multiplies `a_{G_m} ≅ ℝ` by `2`.
example (a : RealCharacterSpace F (LaurentPolynomial F)) :
    RealCharacterSpace.map (AddMonoidAlgebra.mapDomainBialgHom F (AddMonoidHom.mulLeft (2 : ℤ)))
        a (Additive.ofMul (gmCharacter F)) = 2 * a (Additive.ofMul (gmCharacter F)) := by
  sorry

-- Test RealCharacterSpace.map_diagonal: for the diagonal `G_m → G_m²`, `t ↦ (t, t)` (coordinate
-- map `e_{(a,b)} ↦ T^{a+b}`), the first coordinate character of `G_m²` pulls back to `T`, so
-- `map a` takes the value `a(T)` on it. The functor conjugated by the rescaling `2` on `a_{G_m}`
-- and `1` on `a_{G_m²}` satisfies `map_id` and `map_comp` but gives `a(T)/2`.
example (a : RealCharacterSpace F (LaurentPolynomial F)) :
    RealCharacterSpace.map
        (AddMonoidAlgebra.mapDomainBialgHom F
          ((AddMonoidHom.id ℤ).coprod (AddMonoidHom.id ℤ) |>.comp
            (AddMonoidHom.mk' (fun f : Fin 2 → ℤ => (f 0, f 1)) (fun _ _ => rfl)))) a
        (Additive.ofMul (⟨AddMonoidAlgebra.single (Pi.single 0 1) 1, by sorry⟩ :
          RationalCharacter F (AddMonoidAlgebra F (Fin 2 → ℤ)))) =
      a (Additive.ofMul (gmCharacter F)) := by
  sorry

-- Test AdelicPoints.logHeight_sln: `H_G` vanishes identically on `SL_n`.
example (n : ℕ) (x : AdelicPoints F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n)) :
    logHeight F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n) x = 1 := by
  sorry

-- Test AdelicPoints.logHeight_not_infinite_only: over `ℚ` an idele with archimedean component `1`
-- can have norm different from `1`, so `H_G` is not computed at the archimedean places alone.
example : ∃ x : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ,
    NumberField.adeleInfPart ℚ (x : NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ) = 1 ∧
      NumberField.ideleNorm ℚ x ≠ 1 := by
  sorry

/-- `G(𝔸_F)^1 = ker H_G`. -/
def normOne : Subgroup (AdelicPoints F H) := (logHeight F H).ker

theorem isClosed_normOne : IsClosed (normOne F H : Set (AdelicPoints F H)) := by
  sorry

theorem normOne_normal : (normOne F H).Normal := by
  sorry

theorem diagonal_mem_normOne (g : WithConv (H →ₐ[F] F)) : diagonal F H g ∈ normOne F H := by
  sorry

theorem mem_normOne_iff (x : AdelicPoints F H) :
    x ∈ normOne F H ↔ ∀ χ : RationalCharacter F H,
      NumberField.ideleNorm F (RationalCharacter.apply χ x) = 1 := by
  sorry

theorem normOne_eq_top_of_no_characters [Subsingleton (RationalCharacter F H)] :
    normOne F H = ⊤ := by
  sorry

theorem commutator_le_normOne : commutator (AdelicPoints F H) ≤ normOne F H := by
  sorry

-- Test AdelicPoints.normOne_gm: for `G_m` the norm-one subgroup is `𝔸_F^1`.
example : (normOne F (LaurentPolynomial F)).map (gmEquiv F).toMonoidHom =
    NumberField.normOneIdeles F := by
  sorry

-- Test AdelicPoints.normOne_sl2: `SL_2(𝔸_F)^1 = SL_2(𝔸_F)`.
example : normOne F (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2) = ⊤ := by
  sorry

-- Test AdelicPoints.normOne_not_finite_part: over `ℚ` a norm-one idele need not have norm-one
-- archimedean component, so `𝔸^1 ≠ (𝔸_∞)^1 × 𝔸_f^×`.
example : ∃ x ∈ NumberField.normOneIdeles ℚ,
    ‖NumberField.adeleInfPart ℚ (x : NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)
      (NumberField.InfinitePlace.mk (Rat.castHom ℂ))‖ ≠ 1 := by
  sorry

/-- `A_G(ℝ)^0`, the identity component of the real points of the largest
`ℚ`-split central torus of `Res_{F/ℚ} G`, inside the archimedean factor `G(F_∞)`; the Weil
restriction is ReductiveGroupsPartII, RG2.0a. -/
def SplitComponent [Algebra.FiniteType F H] : Subgroup (AdelicPoints F H) := sorry

theorem splitComponent_le_infinite [Algebra.FiniteType F H] :
    SplitComponent F H ≤ (finiteProjection F H).ker := by
  sorry

theorem SplitComponent.central [Algebra.FiniteType F H] :
    SplitComponent F H ≤ Subgroup.center (AdelicPoints F H) := by
  sorry

theorem SplitComponent.inter_normOne [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    SplitComponent F H ⊓ normOne F H = ⊥ := by
  sorry

/-- `H_G` restricts to an isomorphism `A_G(ℝ)^0 ≃ a_G`. -/
def SplitComponent.logHeight_equiv [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    SplitComponent F H ≃ₜ* Multiplicative (RealCharacterSpace F H) :=
  sorry

theorem SplitComponent.logHeight_equiv_apply [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (a : SplitComponent F H) :
    SplitComponent.logHeight_equiv F H hred a = logHeight F H a := by
  sorry

theorem logHeight_surjective [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    Function.Surjective (logHeight F H) := by
  sorry

/-- `G(𝔸)^1 × A_G(ℝ)^0 → G(𝔸)` is an isomorphism. -/
def normOneSplitEquiv [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    (normOne F H × SplitComponent F H) ≃ₜ AdelicPoints F H :=
  sorry

theorem normOneSplitEquiv_apply [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (x : normOne F H × SplitComponent F H) :
    normOneSplitEquiv F H hred x = (x.1 : AdelicPoints F H) * x.2 := by
  sorry

/-- `G(F)\G(𝔸)^1 ≃ G(F)\G(𝔸)/A_G(ℝ)^0`. -/
def normOneQuotientHomeomorph [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    MulAction.orbitRel.Quotient ((diagonal F H).range.subgroupOf (normOne F H)) (normOne F H) ≃ₜ
      MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H ⧸ SplitComponent F H) :=
  sorry

theorem normOneQuotientHomeomorph_mk [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (x : normOne F H) :
    normOneQuotientHomeomorph F H hred (Quotient.mk'' x) =
      Quotient.mk'' ((x : AdelicPoints F H) : AdelicPoints F H ⧸ SplitComponent F H) := by
  sorry

-- Test AdelicPoints.normOneQuotient_identity
example [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    normOneQuotientHomeomorph F H hred (Quotient.mk'' (1 : normOne F H)) =
      Quotient.mk'' ((1 : AdelicPoints F H) : AdelicPoints F H ⧸ SplitComponent F H) :=
  normOneQuotientHomeomorph_mk F H hred 1

-- Test AdelicPoints.normOneQuotient_split: division by a split element leaves the class fixed.
example [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (x : normOne F H) (a : SplitComponent F H) :
    normOneQuotientHomeomorph F H hred (Quotient.mk'' x) =
      Quotient.mk'' (((x : AdelicPoints F H) * a : AdelicPoints F H) :
        AdelicPoints F H ⧸ SplitComponent F H) := by
  sorry

-- Test SplitComponent.semisimple_trivial: without rational characters the split component is
-- trivial.
example [Subsingleton (RationalCharacter F H)] [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    SplitComponent F H = ⊥ := by
  sorry

-- Test SplitComponent.gm_number_field: for `G_m` over `F`, `a_G` is one-dimensional, while the
-- positive archimedean units `(F ⊗ ℝ)^×_{>0}` have dimension `r₁ + r₂`.
example : Module.finrank ℝ (RealCharacterSpace F (LaurentPolynomial F)) = 1 := by
  sorry

-- Test SplitComponent.gln_scalars: for `GL_n` over `ℚ`, `A_G(ℝ)^0` is homeomorphic to `ℝ`.
example (n : ℕ) (hn : 0 < n) :
    Nonempty (SplitComponent ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) ≃ₜ ℝ) := by
  sorry

end AdelicPoints

/-! Layer 2: A gauge form is a nonzero vector in the invariant top-form line below.
For smooth finite-type groups, the cotangent dimension is the group dimension. -/

namespace GaugeForm
variable (k : Type*) [Field k] (H : Type*) [CommRing H] [HopfAlgebra k H]

abbrev augmentationIdeal := TauCeti.Bialgebra.AugmentationIdeal k H

abbrev cotangent := TauCeti.Bialgebra.CotangentSpace k H
end GaugeForm

abbrev GaugeForm (k : Type*) [Field k] (H : Type*) [CommRing H] [HopfAlgebra k H] :=
  ⋀[k]^(Module.finrank k (GaugeForm.cotangent k H)) (GaugeForm.cotangent k H)

namespace GaugeForm
variable (k : Type*) [Field k] (H : Type*) [CommRing H] [HopfAlgebra k H]

theorem finrank_eq_one [FiniteDimensional k (cotangent k H)] :
    Module.finrank k (GaugeForm k H) = 1 := by
  sorry

-- Test GaugeForm.trivial_group: the degree-zero exterior power is the scalar field.
example : Nonempty (GaugeForm k k ≃ₗ[k] k) := by
  sorry
end GaugeForm

namespace GaugeForm
variable {k : Type} [Field k] {H : Type} [CommRing H] [HopfAlgebra k H]

/-- Cotangent scalar extension induces the canonical top-exterior-power comparison; fixed by
`baseChange_tmul_ιMulti`. -/
def baseChange (K : Type) [Field K] [Algebra k K]
    [Algebra.FiniteType k H] :
    K ⊗[k] GaugeForm k H ≃ₗ[K] GaugeForm K (K ⊗[k] H) := sorry

/-- `baseChange` sends `c ⊗ (dh₁ ∧ ⋯ ∧ dh_d)` to `c • (d(1 ⊗ h₁) ∧ ⋯ ∧ d(1 ⊗ h_d))`, where `dh` is the
cotangent class `TauCeti.Bialgebra.cotangentMap` of `h`. The two top degrees agree (`hd`, which holds
for every finite-type `H`). -/
theorem baseChange_tmul_ιMulti (K : Type) [Field K] [Algebra k K] [Algebra.FiniteType k H]
    (hd : Module.finrank K (cotangent K (K ⊗[k] H)) = Module.finrank k (cotangent k H))
    (c : K) (h : Fin (Module.finrank k (cotangent k H)) → H) :
    baseChange K (c ⊗ₜ[k] exteriorPower.ιMulti k _
        (fun i => TauCeti.Bialgebra.cotangentMap k H (h i))) =
      c • exteriorPower.ιMulti K _ (fun i : Fin (Module.finrank K (cotangent K (K ⊗[k] H))) =>
        TauCeti.Bialgebra.cotangentMap K (K ⊗[k] H) ((1 : K) ⊗ₜ[k] h (Fin.cast hd i))) := by
  sorry

def gmCotangentGenerator : cotangent k (LaurentPolynomial k) :=
  (augmentationIdeal k (LaurentPolynomial k)).toCotangent ⟨LaurentPolynomial.T 1 - 1, by sorry⟩

-- Test GaugeForm.gm: the class of T-1 spans the actual cotangent space at the identity.
example : Submodule.span k {gmCotangentGenerator (k := k)} =
    (⊤ : Submodule k (cotangent k (LaurentPolynomial k))) ∧
    gmCotangentGenerator (k := k) ≠ 0 := by
  sorry

-- Test GaugeForm.baseChange_gm: along `ℚ → ℝ`, `1 ⊗ dT/T` goes to the class of `1 ⊗ T` itself.
-- The rescaled comparison `2 • baseChange` is also a linear equivalence and fails this.
example [Algebra.FiniteType ℚ (LaurentPolynomial ℚ)]
    (hd : Module.finrank ℝ (cotangent ℝ (ℝ ⊗[ℚ] LaurentPolynomial ℚ)) =
      Module.finrank ℚ (cotangent ℚ (LaurentPolynomial ℚ))) :
    baseChange ℝ ((1 : ℝ) ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ _
        (fun _ => TauCeti.Bialgebra.cotangentMap ℚ (LaurentPolynomial ℚ) (LaurentPolynomial.T 1))) =
      exteriorPower.ιMulti ℝ _ (fun _ =>
        TauCeti.Bialgebra.cotangentMap ℝ (ℝ ⊗[ℚ] LaurentPolynomial ℚ)
          ((1 : ℝ) ⊗ₜ[ℚ] (LaurentPolynomial.T 1 : LaurentPolynomial ℚ))) := by
  simpa using baseChange_tmul_ιMulti ℝ hd 1 (fun _ => LaurentPolynomial.T 1)
end GaugeForm

namespace GaugeForm
variable {k : Type} [Field k] {H : Type} [CommRing H] [HopfAlgebra k H]
  [hfd : FiniteDimensional k (cotangent k H)]
include hfd

/-- The adjoint action, after the canonical k-tensor unit comparison. -/
def adjointLinearEquiv (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k k)) :
    Module.Dual k (cotangent k H) ≃ₗ[k] Module.Dual k (cotangent k H) :=
  ((TensorProduct.lid k (Module.Dual k (cotangent k H))).symm.trans
    ((Derivation.adjointAction (R := k) (H := H) (CommAlgCat.of k k) g).toLinearEquiv)).trans
      (TensorProduct.lid k (Module.Dual k (cotangent k H)))

/-- Pullback on identity cotangents is the transpose of Ad(g⁻¹). -/
def rightCotangent (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k k)) :
    cotangent k H ≃ₗ[k] cotangent k H :=
  ((Module.evalEquiv k (cotangent k H)).trans
    (adjointLinearEquiv g⁻¹).dualMap).trans (Module.evalEquiv k (cotangent k H)).symm

/-- Algebraic right pullback on the invariant top-form line. -/
def rightTranslate (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k k)) :
    GaugeForm k H →ₗ[k] GaugeForm k H :=
  exteriorPower.map (Module.finrank k (cotangent k H)) (rightCotangent g).toLinearMap

theorem rightTranslate_eq_det_inv
    (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k k)) (ω : GaugeForm k H) :
    rightTranslate g ω = (LinearMap.det (adjointLinearEquiv g).toLinearMap)⁻¹ • ω := by
  sorry

example (ω : GaugeForm k H) : rightTranslate (1 : TauCeti.HopfAlgebra.points
    (H := H) (CommAlgCat.of k k)) ω = ω := by
  sorry
-- Test GaugeForm.borel_diag_two: O(B₂) is O(GL₂)/(X₁₀).
example :
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2
    let X₁₀ : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv ℚ 2
      (TauCeti.GeneralLinear.coordinateRingMap ℚ 2 (MvPolynomial.X (1, 0)))
    let I : Ideal A := Ideal.span {X₁₀}
    letI : I.IsHopfIdeal ℚ := by sorry
    letI : FiniteDimensional ℚ (cotangent ℚ (A ⧸ I)) := by sorry
    let m := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) (by norm_num [Matrix.det_fin_two])
    let f : A →ₐ[ℚ] ℚ := WithConv.ofConv ((TauCeti.GeneralLinear.pointsMulEquiv
      (R := ℚ) (A := ℚ) 2).symm m)
    let g := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    LinearMap.det (adjointLinearEquiv g).toLinearMap = 2 ∧
      LinearMap.det (rightCotangent g).toLinearMap = (2 : ℚ)⁻¹ ∧
      ∀ ω : GaugeForm ℚ (A ⧸ I), rightTranslate g ω = (2 : ℚ)⁻¹ • ω := by
  sorry

-- Test GaugeForm.borel_diag_reversed: O(B₂) is O(GL₂)/(X₁₀).
example :
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2
    let X₁₀ : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv ℚ 2
      (TauCeti.GeneralLinear.coordinateRingMap ℚ 2 (MvPolynomial.X (1, 0)))
    let I : Ideal A := Ideal.span {X₁₀}
    letI : I.IsHopfIdeal ℚ := by sorry
    letI : FiniteDimensional ℚ (cotangent ℚ (A ⧸ I)) := by sorry
    let m := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![1, 0; 0, 2] : Matrix (Fin 2) (Fin 2) ℚ) (by norm_num [Matrix.det_fin_two])
    let f : A →ₐ[ℚ] ℚ := WithConv.ofConv ((TauCeti.GeneralLinear.pointsMulEquiv
      (R := ℚ) (A := ℚ) 2).symm m)
    let g := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    LinearMap.det (adjointLinearEquiv g).toLinearMap = (1 / 2) ∧
      LinearMap.det (rightCotangent g).toLinearMap = ((1 / 2) : ℚ)⁻¹ ∧
      ∀ ω : GaugeForm ℚ (A ⧸ I), rightTranslate g ω = ((1 / 2) : ℚ)⁻¹ • ω := by
  sorry

-- Test GaugeForm.borel_unipotent: O(B₂) is O(GL₂)/(X₁₀).
example :
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2
    let X₁₀ : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv ℚ 2
      (TauCeti.GeneralLinear.coordinateRingMap ℚ 2 (MvPolynomial.X (1, 0)))
    let I : Ideal A := Ideal.span {X₁₀}
    letI : I.IsHopfIdeal ℚ := by sorry
    letI : FiniteDimensional ℚ (cotangent ℚ (A ⧸ I)) := by sorry
    let m := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) (by norm_num [Matrix.det_fin_two])
    let f : A →ₐ[ℚ] ℚ := WithConv.ofConv ((TauCeti.GeneralLinear.pointsMulEquiv
      (R := ℚ) (A := ℚ) 2).symm m)
    let g := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    LinearMap.det (adjointLinearEquiv g).toLinearMap = 1 ∧
      LinearMap.det (rightCotangent g).toLinearMap = (1 : ℚ)⁻¹ ∧
      ∀ ω : GaugeForm ℚ (A ⧸ I), rightTranslate g ω = (1 : ℚ)⁻¹ • ω := by
  sorry

end GaugeForm

namespace Parabolic

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]
  [FiniteDimensional F (GaugeForm.cotangent F H)]

/-- The adelic absolute determinant of the adjoint action. For a parabolic, the Levi
has adjoint determinant one, so this equals the determinant on its unipotent radical. -/
def modulus : AdelicPoints F H →* ℝ≥0 where
  toFun p := ⟨NumberField.ideleNorm F
    (LinearEquiv.det ((Derivation.adjointAction
      (R := F) (H := H) (CommAlgCat.of F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F))
        p).toLinearEquiv)), by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- Rational adjoint determinants have adelic norm one by the product formula. -/
theorem modulus_rational (p : WithConv (H →ₐ[F] F)) :
    modulus F H (AdelicPoints.diagonal F H p) = 1 := by
  sorry

/-- For a connected reductive group the adjoint determinant character is trivial. -/
theorem modulus_reductive [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (p : AdelicPoints F H) : modulus F H p = 1 := by
  sorry

/-- Mathlib's modular character of `P(𝔸_F)`, fixed by `map (· * p) μ = Δ(p) • μ` for a left Haar
measure `μ`, is the adelic absolute adjoint determinant; for a parabolic it is `δ_P`, so
`Δ_P(nm) = δ_P(m)`. -/
theorem modularCharacter_eq_modulus [Algebra.FiniteType F H] (p : AdelicPoints F H) :
    MeasureTheory.Measure.modularCharacter p = modulus F H p := by
  sorry

-- Test Parabolic.modulus_trivial
example (p : AdelicPoints F F) :
    letI : FiniteDimensional F (GaugeForm.cotangent F F) := by sorry
    modulus F F p = 1 := by
  sorry

-- Test Parabolic.modulus_gm: the adjoint determinant differs from the tautological character.
example (p : AdelicPoints F (LaurentPolynomial F)) :
    letI : FiniteDimensional F (GaugeForm.cotangent F (LaurentPolynomial F)) := by sorry
    modulus F (LaurentPolynomial F) p = 1 := by
  sorry

end Parabolic

/-! Layer 2: Quotient integration: stages, volumes and the averaging map. -/

namespace QuotientMeasure

variable {G : Type*} [Group G] [TopologicalSpace G] [hctx30 : IsTopologicalGroup G]
  [hctx31 : T2Space G] [hctx32 : LocallyCompactSpace G] [hctx33 : SecondCountableTopology G]
  [MeasurableSpace G] [hctx34 : BorelSpace G]
  (H : Subgroup G) [hctx35 : Fact (IsClosed (H : Set G))] [hctx36 : LocallyCompactSpace H]
include hctx30 hctx31 hctx32 hctx33 hctx34 hctx35 hctx36

/-- fibre averaging `C_c(G) → C_c(H\G)` is surjective, and nonnegative
functions have nonnegative preimages. -/
theorem average_surjective (ν : Measure H) (hν : IsRightHaar ν) (φ : Cosets H → ℝ)
    (hφ : Continuous φ) (hφc : HasCompactSupport φ) :
    ∃ f : G → ℝ, Continuous f ∧ HasCompactSupport f ∧ average H ν hν f = φ ∧
      ((∀ q, 0 ≤ φ q) → ∀ g, 0 ≤ f g) := by
  sorry

/-- under `Δ_G|_H = Δ_H`, `Pf = 0` forces `∫ f = 0`. -/
theorem integral_eq_zero_of_average_eq_zero (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f) (h0 : average H ν hν f = 0) :
    ∫ g, f g ∂μ = 0 := by
  sorry

/-- The canonical identification of `H` with its copy inside `H₂`. -/
def subgroupOfEquiv (H₂ : Subgroup G) (hle : H ≤ H₂) : H ≃ₜ* H.subgroupOf H₂ :=
  sorry

theorem subgroupOfEquiv_apply (H₂ : Subgroup G) (hle : H ≤ H₂) (h : H) :
    ((subgroupOfEquiv H H₂ hle h : H₂) : G) = h := by
  sorry

/-- integration over `H₁\G` in stages through `H₂\G` and
`H₁\H₂`, for nonnegative measurable functions on `H₁\G`. The smaller subgroup's Haar measure
is transported to its copy inside `H₂`; the inner measure is the resulting quotient measure. -/
theorem lintegral_trans (H₂ : Subgroup G) [Fact (IsClosed (H₂ : Set G))] [LocallyCompactSpace H₂]
    (hle : H ≤ H₂) (μ : Measure G) (ν₂ : Measure H₂) (ν₁ : Measure H)
    (hμ : IsRightHaar μ) (hν₂ : IsRightHaar ν₂) (hν₁ : IsRightHaar ν₁)
    (hmod₂ : ∀ h : H₂, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (hmod₁ : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : Cosets H → ℝ≥0∞) (hf : Measurable f) :
    let H₁₂ := H.subgroupOf H₂
    letI : Fact (IsClosed (H₁₂ : Set H₂)) := ⟨by sorry⟩
    letI : LocallyCompactSpace H₁₂ := by sorry
    let ν₁₂ := Measure.map (subgroupOfEquiv H H₂ hle) ν₁
    let hν₁₂ : IsRightHaar ν₁₂ := by sorry
    let hmod₁₂ : ∀ h : H₁₂,
        Measure.modularCharacter (h : H₂) = Measure.modularCharacter h := by sorry
    (∫⁻ q, f q ∂(measure H μ ν₁ hμ hν₁ hmod₁)) =
      ∫⁻ q₂, Quotient.liftOn q₂ (fun g =>
        ∫⁻ q₁₂, Quotient.liftOn q₁₂
          (fun h₂ : H₂ => f (Quotient.mk _ ((h₂ : G) * g))) (by sorry)
          ∂(measure H₁₂ ν₂ ν₁₂ hν₂ hν₁₂ hmod₁₂)) (by sorry)
        ∂(measure H₂ μ ν₂ hμ hν₂ hmod₂) := by
  sorry

-- Test QuotientMeasure.stages_unit: masses on {1}\C₂\C₄.
example :
    let G := Multiplicative (ZMod 4)
    letI : MeasurableSpace G := borel G
    let H₂ : Subgroup G := Subgroup.zpowers (Multiplicative.ofAdd (2 : ZMod 4))
    let H₁ : Subgroup G := ⊥
    let H₁₂ : Subgroup H₂ := H₁.subgroupOf H₂
    letI : Fact (IsClosed (H₁ : Set G)) := ⟨by sorry⟩
    letI : Fact (IsClosed (H₂ : Set G)) := ⟨by sorry⟩
    letI : Fact (IsClosed (H₁₂ : Set H₂)) := ⟨by sorry⟩
    let μ : Measure G := Measure.count
    let ν₂ : Measure H₂ := (1 : ℝ≥0∞) • Measure.count
    let ν₁ : Measure H₁ := (1 : ℝ≥0∞) • Measure.count
    let ν₁₂ := Measure.map (subgroupOfEquiv H₁ H₂ bot_le) ν₁
    let hμ : IsRightHaar μ := by sorry
    let h₂ : IsRightHaar ν₂ := by sorry
    let h₁ : IsRightHaar ν₁ := by sorry
    let h₁₂ : IsRightHaar ν₁₂ := by sorry
    let m := measure H₁ μ ν₁ hμ h₁ (by sorry)
    let m₂ := measure H₂ μ ν₂ hμ h₂ (by sorry)
    let m₁₂ := measure H₁₂ ν₂ ν₁₂ h₂ h₁₂ (by sorry)
    m₂ Set.univ = 2 / 1 ∧ m₁₂ Set.univ = 2 * 1 / 1 ∧
      m Set.univ = 4 / 1 ∧ m₂ Set.univ * m₁₂ Set.univ = m Set.univ := by
  sorry

-- Test QuotientMeasure.stages_rescaled_middle: masses on {1}\C₂\C₄.
example :
    let G := Multiplicative (ZMod 4)
    letI : MeasurableSpace G := borel G
    let H₂ : Subgroup G := Subgroup.zpowers (Multiplicative.ofAdd (2 : ZMod 4))
    let H₁ : Subgroup G := ⊥
    let H₁₂ : Subgroup H₂ := H₁.subgroupOf H₂
    letI : Fact (IsClosed (H₁ : Set G)) := ⟨by sorry⟩
    letI : Fact (IsClosed (H₂ : Set G)) := ⟨by sorry⟩
    letI : Fact (IsClosed (H₁₂ : Set H₂)) := ⟨by sorry⟩
    let μ : Measure G := Measure.count
    let ν₂ : Measure H₂ := (2 : ℝ≥0∞) • Measure.count
    let ν₁ : Measure H₁ := (1 : ℝ≥0∞) • Measure.count
    let ν₁₂ := Measure.map (subgroupOfEquiv H₁ H₂ bot_le) ν₁
    let hμ : IsRightHaar μ := by sorry
    let h₂ : IsRightHaar ν₂ := by sorry
    let h₁ : IsRightHaar ν₁ := by sorry
    let h₁₂ : IsRightHaar ν₁₂ := by sorry
    let m := measure H₁ μ ν₁ hμ h₁ (by sorry)
    let m₂ := measure H₂ μ ν₂ hμ h₂ (by sorry)
    let m₁₂ := measure H₁₂ ν₂ ν₁₂ h₂ h₁₂ (by sorry)
    m₂ Set.univ = 2 / 2 ∧ m₁₂ Set.univ = 2 * 2 / 1 ∧
      m Set.univ = 4 / 1 ∧ m₂ Set.univ * m₁₂ Set.univ = m Set.univ := by
  sorry

-- Test QuotientMeasure.stages_rescaled_bottom: masses on {1}\C₂\C₄.
example :
    let G := Multiplicative (ZMod 4)
    letI : MeasurableSpace G := borel G
    let H₂ : Subgroup G := Subgroup.zpowers (Multiplicative.ofAdd (2 : ZMod 4))
    let H₁ : Subgroup G := ⊥
    let H₁₂ : Subgroup H₂ := H₁.subgroupOf H₂
    letI : Fact (IsClosed (H₁ : Set G)) := ⟨by sorry⟩
    letI : Fact (IsClosed (H₂ : Set G)) := ⟨by sorry⟩
    letI : Fact (IsClosed (H₁₂ : Set H₂)) := ⟨by sorry⟩
    let μ : Measure G := Measure.count
    let ν₂ : Measure H₂ := (2 : ℝ≥0∞) • Measure.count
    let ν₁ : Measure H₁ := (3 : ℝ≥0∞) • Measure.count
    let ν₁₂ := Measure.map (subgroupOfEquiv H₁ H₂ bot_le) ν₁
    let hμ : IsRightHaar μ := by sorry
    let h₂ : IsRightHaar ν₂ := by sorry
    let h₁ : IsRightHaar ν₁ := by sorry
    let h₁₂ : IsRightHaar ν₁₂ := by sorry
    let m := measure H₁ μ ν₁ hμ h₁ (by sorry)
    let m₂ := measure H₂ μ ν₂ hμ h₂ (by sorry)
    let m₁₂ := measure H₁₂ ν₂ ν₁₂ h₂ h₁₂ (by sorry)
    m₂ Set.univ = 2 / 2 ∧ m₁₂ Set.univ = 2 * 2 / 3 ∧
      m Set.univ = 4 / 3 ∧ m₂ Set.univ * m₁₂ Set.univ = m Set.univ := by
  sorry

end QuotientMeasure

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

instance instMeasurableSpace : MeasurableSpace (AdelicPoints F H) := borel _
instance instBorelSpace : BorelSpace (AdelicPoints F H) := ⟨rfl⟩
instance instMeasurableSpaceFinite : MeasurableSpace (FiniteAdelicPoints F H) := borel _
instance instBorelSpaceFinite : BorelSpace (FiniteAdelicPoints F H) := ⟨rfl⟩
instance instMeasurableSpaceInfinite : MeasurableSpace (InfinitePoints F H) := borel _
instance instBorelSpaceInfinite : BorelSpace (InfinitePoints F H) := ⟨rfl⟩
instance instMeasurableSpaceLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    MeasurableSpace (LocalPoints F H v) := borel _
instance instBorelSpaceLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    BorelSpace (LocalPoints F H v) := ⟨rfl⟩

theorem map_restrict_eq_of_isFundamentalDomain [Algebra.FiniteType F H]
    (μ : Measure (AdelicPoints F H)) [μ.IsHaarMeasure]
    (hunim : Measure.modularCharacter (G := AdelicPoints F H) = 1)
    {D D' : Set (AdelicPoints F H)} (hD : IsFundamentalDomain (diagonal F H).range D μ)
    (hD' : IsFundamentalDomain (diagonal F H).range D' μ) :
    Measure.map (fun x : AdelicPoints F H =>
        (Quotient.mk'' x : MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)))
        (μ.restrict D) =
      Measure.map (fun x : AdelicPoints F H =>
        (Quotient.mk'' x : MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)))
        (μ.restrict D') := by
  sorry

end AdelicPoints

namespace AutomorphicQuotient

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `[G]^1 = G(F)\G(𝔸_F)^1`. -/
abbrev NormOneQuotient :=
  MulAction.orbitRel.Quotient ((AdelicPoints.diagonal F H).range.subgroupOf
    (AdelicPoints.normOne F H)) (AdelicPoints.normOne F H)

instance : MeasurableSpace (NormOneQuotient F H) := borel _

/-- the measure on `[G]^1` induced by a Haar measure `dx` on
`G(𝔸_F)`, Lebesgue measure on `a_G` normalized by the lattice dual to `X*_F(G)`, the
decomposition `G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0` and counting measure on `G(F)`. -/
def measure [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) : Measure (NormOneQuotient F H) :=
  sorry

instance : MeasurableSpace (RealCharacterSpace F H) := borel _
instance : BorelSpace (RealCharacterSpace F H) := ⟨rfl⟩

/-- The lattice `Hom(X*_F(G), ℤ)` in `a_G`. -/
def integralLattice : AddSubgroup (RealCharacterSpace F H) where
  carrier := {a | ∀ χ, ∃ m : ℤ, a χ = m}
  zero_mem' := sorry
  add_mem' := sorry
  neg_mem' := sorry

/-- The normalization of `measure`. Let `lam` be the Haar measure on `a_G` giving the fundamental
domains of `Hom(X*_F(G), ℤ)` mass one. For measurable `A ⊆ G(𝔸)^1` meeting each `G(F)`-orbit at
most once and measurable `E ⊆ a_G`, the set `A · (H_G|_{A_G(ℝ)^0})⁻¹(E)` has `μ`-mass
`measure(A mod G(F)) · lam(E)`. -/
theorem measure_mul_volume [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) [μ.IsHaarMeasure]
    (lam : Measure (RealCharacterSpace F H)) [lam.IsAddHaarMeasure]
    (hlam : ∀ D : Set (RealCharacterSpace F H),
      IsAddFundamentalDomain (integralLattice F H) D lam → lam D = 1)
    (A : Set (AdelicPoints.normOne F H)) (hA : MeasurableSet A)
    (hinj : Set.InjOn (fun x => (Quotient.mk'' x : NormOneQuotient F H)) A)
    (E : Set (RealCharacterSpace F H)) (hE : MeasurableSet E) :
    μ ((fun q : AdelicPoints.normOne F H × AdelicPoints.SplitComponent F H =>
        (q.1 : AdelicPoints F H) * q.2) ''
        (A ×ˢ {a | Multiplicative.toAdd (AdelicPoints.SplitComponent.logHeight_equiv F H hred a) ∈ E})) =
      measure F H hred μ ((fun x => (Quotient.mk'' x : NormOneQuotient F H)) '' A) * lam E := by
  sorry

-- Test AutomorphicQuotient.lattice_normalization_scale: the lattice condition fixes the scale of
-- `lam`; doubling it gives a fundamental domain mass `2`, so a factor `[F : ℚ]` or `2` in the
-- logarithmic measure is detected.
example (lam : Measure (RealCharacterSpace F H)) (D : Set (RealCharacterSpace F H))
    (hD : lam D = 1) : ((2 : ℝ≥0∞) • lam) D = 2 := by
  simp [hD]

/-- Right translation by `G(𝔸)^1` on `[G]^1`. -/
def rightAct (g : AdelicPoints.normOne F H) : NormOneQuotient F H → NormOneQuotient F H :=
  Quotient.map' (· * g) (by sorry)

theorem invariant [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) [μ.IsHaarMeasure] (g : AdelicPoints.normOne F H) :
    Measure.map (rightAct F H g) (measure F H hred μ) = measure F H hred μ := by
  sorry

theorem smul_haar [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) (c : ℝ≥0∞) :
    measure F H hred (c • μ) = c • measure F H hred μ := by
  sorry

instance [Algebra.FiniteType F H] : MeasurableSpace
    (MulAction.orbitRel.Quotient (AdelicPoints.diagonal F H).range
      (AdelicPoints F H ⧸ AdelicPoints.SplitComponent F H)) := borel _

/-- Its transport to `G(F)A_G(ℝ)^0\G(𝔸_F)` along the norm-one comparison. -/
def measure_split [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) :
    Measure (MulAction.orbitRel.Quotient (AdelicPoints.diagonal F H).range
      (AdelicPoints F H ⧸ AdelicPoints.SplitComponent F H)) :=
  Measure.map (AdelicPoints.normOneQuotientHomeomorph F H hred) (measure F H hred μ)

/-- The transported measure is invariant under right translation by `G(𝔸_F)`. -/
theorem measure_split_invariant [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) [μ.IsHaarMeasure] (g : AdelicPoints F H) :
    Measure.map (Quotient.map' (fun x : AdelicPoints F H ⧸ AdelicPoints.SplitComponent F H =>
        (Quotient.liftOn' x (fun y => ((y * g : AdelicPoints F H) :
          AdelicPoints F H ⧸ AdelicPoints.SplitComponent F H)) (by sorry))) (by sorry))
      (measure_split F H hred μ) = measure_split F H hred μ := by
  sorry

-- Test AutomorphicQuotient.semisimple: without rational characters `G(𝔸)^1 = G(𝔸)`.
example [Subsingleton (RationalCharacter F H)] : AdelicPoints.normOne F H = ⊤ :=
  AdelicPoints.normOne_eq_top_of_no_characters F H

-- Test AutomorphicQuotient.not_full_quotient: `ℚ^×\𝔸_ℚ^×` has infinite volume for every nonzero
-- invariant measure, since the split component `ℝ_{>0}` is not compact; `[GL_1]^1` is compact.
example : CompactSpace (NormOneQuotient ℚ (LaurentPolynomial ℚ)) ∧
    ¬ CompactSpace (MulAction.orbitRel.Quotient (AdelicPoints.diagonal ℚ (LaurentPolynomial ℚ)).range
      (AdelicPoints ℚ (LaurentPolynomial ℚ))) := by
  sorry

-- Test AutomorphicQuotient.gl1_rat: for `GL_1` over `ℚ` with the normalized idele measure,
-- `ℚ^×\𝔸_ℚ^1 ≃ ℤ̂^×` has volume one.
example (hred : TauCeti.reductiveCommHopfAlgProperty ℚ
    (AdelicPoints.finiteTypeObj ℚ (LaurentPolynomial ℚ))) :
    measure ℚ (LaurentPolynomial ℚ) hred
      (Measure.map (AdelicPoints.gmEquiv ℚ).symm (NumberField.ideleHaar ℚ)) Set.univ = 1 := by
  sorry

end AutomorphicQuotient

/-! Layer 2: Gauge-form measures and Tamagawa measures. -/

namespace GaugeForm

section Analytic
open scoped PointTopology
variable {K : Type} [Field K] [CharZero K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] {H : Type} [CommRing H] [HopfAlgebra K H]
  [Algebra.FiniteType K H]

local instance : MeasurableSpace (WithConv (H →ₐ[K] K)) := borel _
local instance : BorelSpace (WithConv (H →ₐ[K] K)) := ⟨rfl⟩

/-- The analytic measure of an invariant top form over any characteristic-zero nonarchimedean
local field, with the valuation ring of additive measure one. PRR, Theorem 3.71, p. 196.
The zero form gives the zero measure. -/
def analyticMeasure (ω : GaugeForm K H) : Measure (WithConv (H →ₐ[K] K)) := sorry

theorem analyticMeasure_isHaar [FiniteDimensional K (cotangent K H)]
    (ω : GaugeForm K H) (hω : ω ≠ 0) : (analyticMeasure ω).IsHaarMeasure := by
  sorry

theorem analyticMeasure_smul (ω : GaugeForm K H) (c : K) :
    analyticMeasure (c • ω) =
      (((TauCeti.normalizedAbsoluteValue K c : ℚ≥0) : ℝ≥0) : ℝ≥0∞) •
        analyticMeasure ω := by
  sorry

/-- Pushforward by right translation has the reciprocal of the differential-form pullback
factor. Unlike the rational-point specialization, this quantifies over all local points. -/
theorem analyticMeasure_rightTranslate [FiniteDimensional K (cotangent K H)]
    (ω : GaugeForm K H)
    (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of K K)) :
    Measure.map (· * g) (analyticMeasure ω) =
      (((TauCeti.normalizedAbsoluteValue K
        (LinearMap.det (adjointLinearEquiv g).toLinearMap) : ℚ≥0) : ℝ≥0) : ℝ≥0∞) •
        analyticMeasure ω := by
  sorry

-- Test GaugeForm.analyticMeasure_zero: the nonzero hypothesis in the Haar theorem is essential.
example : analyticMeasure (0 : GaugeForm K H) = 0 := by
  simpa using analyticMeasure_smul (0 : GaugeForm K H) 0

-- Test GaugeForm.analyticMeasure_scalar: scalar multiplication acts once, not to the dimension.
example (ω : GaugeForm K H) :
    analyticMeasure ((2 : K) • ω) =
      (((TauCeti.normalizedAbsoluteValue K 2 : ℚ≥0) : ℝ≥0) : ℝ≥0∞) •
        analyticMeasure ω := analyticMeasure_smul ω 2

-- Test GaugeForm.analyticMeasure_identity: pushforward at the identity has factor one.
example (ω : GaugeForm K H) :
    Measure.map (fun x : WithConv (H →ₐ[K] K) => x * 1) (analyticMeasure ω) =
      analyticMeasure ω := by simp

end Analytic

/-- The complex additive normalization in real and imaginary coordinates. -/
def complexCoordinateMeasure : Measure (ℝ × ℝ) :=
  (2 : ℝ≥0∞) • (volume : Measure ℝ).prod volume

-- Test GaugeForm.complex_volume_one: the unit square has mass two, not one.
example : complexCoordinateMeasure (Icc (0 : ℝ) 1 ×ˢ Icc (0 : ℝ) 1) = 2 := by
  rw [complexCoordinateMeasure, Measure.smul_apply, Measure.prod_prod]
  norm_num [Real.volume_Icc]

-- Test GaugeForm.complex_volume_two: the product gauge form has mass four.
example : (complexCoordinateMeasure.prod complexCoordinateMeasure)
    ((Icc (0 : ℝ) 1 ×ˢ Icc (0 : ℝ) 1) ×ˢ (Icc (0 : ℝ) 1 ×ˢ Icc (0 : ℝ) 1)) = 4 := by
  unfold complexCoordinateMeasure
  rw [Measure.prod_prod]
  simp only [Measure.smul_apply, Measure.prod_prod]
  norm_num [Real.volume_Icc]

-- Test GaugeForm.complex_volume_scaled: doubling both real coordinates multiplies mass by four.
example : complexCoordinateMeasure (Icc (0 : ℝ) 2 ×ˢ Icc (0 : ℝ) 2) = 8 := by
  rw [complexCoordinateMeasure, Measure.smul_apply, Measure.prod_prod]
  norm_num [Real.volume_Icc]

-- Test GaugeForm.complex_volume_degenerate: a real segment has complex additive mass zero.
example : complexCoordinateMeasure (Icc (0 : ℝ) 1 ×ˢ ({0} : Set ℝ)) = 0 := by
  rw [complexCoordinateMeasure, Measure.smul_apply, Measure.prod_prod]
  simp

end GaugeForm

namespace FiniteImageArtin

/-- Local determinant on the inertia-fixed space. The Frobenius acts on that space. -/
def localFactor {V : Type*} [AddCommGroup V] [Module ℂ V]
    (I : Submodule ℂ V) (frobenius : I ≃ₗ[ℂ] I) (q : ℕ) (s : ℂ) : ℂ :=
  (LinearMap.det (LinearMap.id - (q : ℂ) ^ (-s) • frobenius.toLinearMap))⁻¹

/-- The invariant line for the inertia transposition in the permutation representation
of Gal(ℚ(i)/ℚ) at 2. -/
def gaussianInertia : Submodule ℂ (Fin 2 → ℂ) where
  carrier := {x | x 0 = x 1}
  zero_mem' := rfl
  add_mem' := by intro x y hx hy; change x 0 + y 0 = x 1 + y 1; rw [hx, hy]
  smul_mem' := by intro c x hx; change c * x 0 = c * x 1; rw [hx]

-- Test localFactor_ramified_gaussian
example (s : ℂ) :
    Module.finrank ℂ gaussianInertia = 1 ∧
    localFactor gaussianInertia (LinearEquiv.refl ℂ _) 2 s = (1 - (2 : ℂ) ^ (-s))⁻¹ ∧
    localFactor gaussianInertia (LinearEquiv.refl ℂ _) 2 1 = 2 ∧
    localFactor (⊤ : Submodule ℂ (Fin 2 → ℂ)) (LinearEquiv.refl ℂ _) 2 1 = 4 := by sorry

-- Test localFactor_residue_degree_two
example (z : ℂ) :
    Matrix.det ((1 : Matrix (Fin 2) (Fin 2) ℂ) - z • !![0, 1; 1, 0]) = 1 - z ^ 2 := by
  simp [Matrix.det_fin_two]; ring

-- Test localFactor_zero
example (q : ℕ) (s : ℂ) :
    localFactor (⊥ : Submodule ℂ ℂ) (LinearEquiv.refl ℂ _) q s = 1 := by sorry

end FiniteImageArtin

namespace Tamagawa

/-- The local Artin factor for a trivial character representation of rank `r`.
The residue cardinality belongs to the specified finite place. -/
def splitLocalFactor (F : Type) [Field F] [NumberField F]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (r : ℕ) (s : ℂ) : ℂ :=
  ((1 - (Ideal.absNorm v.asIdeal : ℂ) ^ (-s)) ^ r)⁻¹

/-- The leading coefficient of the split rank-`r` character module. -/
def splitLeadingCoeff (F : Type) [Field F] [NumberField F] (r : ℕ) : ℝ :=
  NumberField.dedekindZeta_residue F ^ r

theorem splitLeadingCoeff_pos (F : Type) [Field F] [NumberField F] (r : ℕ) :
    0 < splitLeadingCoeff F r := by
  exact pow_pos (NumberField.dedekindZeta_residue_pos F) r

theorem tendsto_splitLeadingCoeff (F : Type) [Field F] [NumberField F] (r : ℕ) :
    Tendsto (fun s : ℝ => (((s - 1 : ℝ) : ℂ) * NumberField.dedekindZeta F s) ^ r)
      (𝓝[>] 1) (𝓝 (splitLeadingCoeff F r : ℂ)) := by
  simpa [splitLeadingCoeff, Complex.ofReal_pow] using
    (NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT F).pow r

-- Test Tamagawa.splitLocalFactor_rank_zero: the zero representation contributes no Euler factor.
example (F : Type) [Field F] [NumberField F]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (s : ℂ) :
    splitLocalFactor F v 0 s = 1 := by simp [splitLocalFactor]

-- Test Tamagawa.splitLocalFactor_rank_one: the actual residue cardinality two gives factor two.
example (F : Type) [Field F] [NumberField F]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (hv : Ideal.absNorm v.asIdeal = 2) : splitLocalFactor F v 1 1 = 2 := by
  norm_num [splitLocalFactor, hv, Complex.cpow_neg_one]

-- Test Tamagawa.splitLocalFactor_rank_two: rank affects the exponent, not the residue cardinality.
example (F : Type) [Field F] [NumberField F]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (hv : Ideal.absNorm v.asIdeal = 2) : splitLocalFactor F v 2 1 = 4 := by
  norm_num [splitLocalFactor, hv, Complex.cpow_neg_one]

-- Test Tamagawa.splitLeadingCoeff_rank_zero: no pole gives the empty-product coefficient.
example (F : Type) [Field F] [NumberField F] : splitLeadingCoeff F 0 = 1 := by
  simp [splitLeadingCoeff]

-- Test Tamagawa.splitLeadingCoeff_rank_one: the coefficient is the Dedekind-zeta residue.
example (F : Type) [Field F] [NumberField F] :
    splitLeadingCoeff F 1 = NumberField.dedekindZeta_residue F := by
  simp [splitLeadingCoeff]

-- Test Tamagawa.splitLeadingCoeff_rank_two: a double pole has the square of the residue.
example (F : Type) [Field F] [NumberField F] :
    splitLeadingCoeff F 2 = NumberField.dedekindZeta_residue F *
      NumberField.dedekindZeta_residue F := by
  simp [splitLeadingCoeff, pow_two]

-- Test Tamagawa.finite_torus_split: q = 2 and Frobenius acts by q on the rank-one lattice.
example : |Matrix.det ((2 : ℚ) • (1 : Matrix (Fin 1) (Fin 1) ℚ) - 1)| = 1 := by
  norm_num [Matrix.det_fin_one]

-- Test Tamagawa.finite_torus_nonsplit: Frobenius acts by -q; the lattice INDEX is positive.
example : |Matrix.det ((-2 : ℚ) • (1 : Matrix (Fin 1) (Fin 1) ℚ) - 1)| = 3 ∧
    Matrix.det ((-2 : ℚ) • (1 : Matrix (Fin 1) (Fin 1) ℚ) - 1) = -3 := by
  norm_num [Matrix.det_fin_one]

-- Test Tamagawa.finite_reductive_sl2: the Bruhat order expression q (q-1) (1+q) at q = 2.
example : (2 : ℕ) * (2 - 1) * (1 + 2) = 6 := by norm_num

end Tamagawa

namespace GaugeForm

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- the Haar measure `|ω|_v` on `G(F_v)`, given in an `F_v`-analytic
chart by `|f(x)|_v dx`, where `φ^*ω = f dx_1 ∧ ⋯ ∧ dx_d` and `𝒪_v` has volume one. -/
def localMeasure [Algebra.FiniteType F H] (ω : GaugeForm F H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    Measure (AdelicPoints.LocalPoints F H v) :=
  sorry

open scoped PointTopology

/-- The point adjunction identifies the general local-field construction with the existing
finite-completion measure. The form is extended by the canonical cotangent comparison. -/
theorem localMeasure_eq_analyticMeasure [Algebra.FiniteType F H]
    (ω : GaugeForm F H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    localMeasure ω v = @Measure.map _ _ (borel _) _
      (fun x : WithConv ((v.adicCompletion F ⊗[F] H) →ₐ[v.adicCompletion F] v.adicCompletion F) =>
        WithConv.toConv ((x.ofConv.restrictScalars F).comp Algebra.TensorProduct.includeRight))
      (analyticMeasure (baseChange (v.adicCompletion F) (1 ⊗ₜ[F] ω))) := by
  sorry

theorem localMeasure_isHaar [Algebra.FiniteType F H] [FiniteDimensional F (cotangent F H)]
    (ω : GaugeForm F H) (hω : ω ≠ 0)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    (localMeasure ω v).IsHaarMeasure := by
  sorry

theorem localMeasure_smul [Algebra.FiniteType F H] (ω : GaugeForm F H) (c : F)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    localMeasure (c • ω) v =
      (((TauCeti.normalizedAbsoluteValue (v.adicCompletion F)
        (algebraMap F (v.adicCompletion F) c) : ℚ≥0) : ℝ≥0) : ℝ≥0∞) • localMeasure ω v := by
  sorry

/-- The diagonal `G(F) → G(F_v)`. -/
def localDiagonal (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    WithConv (H →ₐ[F] F) →* AdelicPoints.LocalPoints F H v :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- Right translation scales `|ω|_v` by `|det Ad(g)|_v`, matching Mathlib's
`map (· * g) μ = Δ(g) μ`; here for rational `g`, where `Ad(g)` is the adjoint action. -/
theorem localMeasure_rightTranslate [Algebra.FiniteType F H] [FiniteDimensional F (cotangent F H)] (ω : GaugeForm F H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of F F)) :
    Measure.map (· * localDiagonal v g) (localMeasure ω v) =
      (((TauCeti.normalizedAbsoluteValue (v.adicCompletion F)
        (algebraMap F (v.adicCompletion F)
          (LinearMap.det (adjointLinearEquiv g).toLinearMap)) : ℚ≥0) : ℝ≥0) : ℝ≥0∞) •
        localMeasure ω v := by
  sorry

/-- The cotangent class of the coordinate `X` of `G_a`. -/
def gaCotangentGenerator : cotangent F (SymmetricAlgebra F F) :=
  (augmentationIdeal F (SymmetricAlgebra F F)).toCotangent ⟨SymmetricAlgebra.ι F F 1, by sorry⟩

/-- The gauge form `dX` of `G_a`. -/
def gaForm : GaugeForm F (SymmetricAlgebra F F) :=
  exteriorPower.ιMulti F _ (fun _ => gaCotangentGenerator)

/-- The gauge form `dT/T` of `G_m`. -/
def gmForm : GaugeForm F (LaurentPolynomial F) :=
  exteriorPower.ιMulti F _ (fun _ => gmCotangentGenerator)

-- Test GaugeForm.localMeasure_ga: under `x ↦ x(X)`, `|dX|_v` is the Haar measure of `F_v` with
-- `vol(𝒪_v) = 1`.
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    [MeasurableSpace (v.adicCompletion F)] [BorelSpace (v.adicCompletion F)]
    (μ : Measure (v.adicCompletion F)) [μ.IsAddHaarMeasure]
    (hμ : μ (v.adicCompletionIntegers F) = 1) :
    Measure.map (fun x : AdelicPoints.LocalPoints F (SymmetricAlgebra F F) v =>
        (x.ofConv (SymmetricAlgebra.ι F F 1) : v.adicCompletion F)) (localMeasure gaForm v) = μ := by
  sorry

-- Test GaugeForm.localMeasure_gm_units: `|dT/T|_v(𝒪_v^×) = 1 - q_v⁻¹`.
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    localMeasure gmForm v
        {x | (TauCeti.MultiplicativeGroup.pointsMulEquiv x : v.adicCompletion F) ∈
            v.adicCompletionIntegers F ∧
          (((TauCeti.MultiplicativeGroup.pointsMulEquiv x)⁻¹ : (v.adicCompletion F)ˣ) :
            v.adicCompletion F) ∈ v.adicCompletionIntegers F} =
      1 - ((Ideal.absNorm v.asIdeal : ℝ≥0∞))⁻¹ := by
  sorry

-- Test GaugeForm.localMeasure_not_normalized: `|dT/T|_v` gives `𝒪_v^×` volume `1 - q_v⁻¹ ≠ 1`, so
-- it is not the normalized idele measure of AA.0.
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    (1 : ℝ≥0∞) - ((Ideal.absNorm v.asIdeal : ℝ≥0∞))⁻¹ ≠ 1 := by
  sorry

-- Test GaugeForm.localMeasure_q_two: the form normalization has mass one half.
example : (1 : ℝ≥0∞) - (2 : ℝ≥0∞)⁻¹ = 1 / 2 := by norm_num

/-- Weil's formula for the standard model of `GL_n`: for the wedge `ω_e` of the cotangent classes
of the coordinates `X_ij - δ_ij` (in an order `e`; another order changes `ω_e` by a sign),
`|ω_e|_v(GL_n(𝒪_v)) = #GL_n(k_v) · q_v^{-n²}`. This fixes the normalization of `localMeasure` on
`GL_n`, which `localMeasure_smul` and `localMeasure_rightTranslate` leave open. -/
theorem localMeasure_gln_integral (n : ℕ)
    [Algebra.FiniteType F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n)]
    (e : Fin (Module.finrank F (cotangent F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n))) ≃
      Fin n × Fin n)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    localMeasure (exteriorPower.ιMulti F _ (fun i => TauCeti.Bialgebra.cotangentMap F _
        (TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv F n
          (TauCeti.GeneralLinear.coordinateRingMap F n (MvPolynomial.X (e i)))))) v
        ((IntegralModel.standardGLn (F := F) (S := ∅) n).localPoints ⟨v, by simp⟩ : Set _) =
      (Nat.card (GL (Fin n) (NumberField.RingOfIntegers F ⧸ v.asIdeal)) : ℝ≥0∞) /
        (Ideal.absNorm v.asIdeal : ℝ≥0∞) ^ (n ^ 2) := by
  sorry

-- Test GaugeForm.localMeasure_gln_two: at `n = 2` and `q_v = 2`, `#GL₂(𝔽₂) = 6` gives
-- `|ω|_v(GL₂(𝒪_v)) = 6/16 = 3/8`; a normalization `vol(GL₂(𝒪_v)) = 1` would give `1`.
example : (6 : ℝ≥0∞) / 2 ^ (2 ^ 2) = 3 / 8 := by
  rw [ENNReal.div_eq_div_iff] <;> norm_num

/-- The archimedean Haar measure `∏_{w | ∞} |ω|_w` on `G(F_∞) = G(F ⊗_ℚ ℝ)`, given in analytic
charts by `|f|_w` against `dx` at real places and `2 dx dy` at complex places, with
`|z|_w = z z̄` at complex places. -/
def archimedeanMeasure [Algebra.FiniteType F H] (ω : GaugeForm F H) :
    Measure (AdelicPoints.InfinitePoints F H) :=
  sorry

theorem archimedeanMeasure_isHaar [Algebra.FiniteType F H] [FiniteDimensional F (cotangent F H)]
    (ω : GaugeForm F H) (hω : ω ≠ 0) : (archimedeanMeasure ω).IsHaarMeasure := by
  sorry

/-- A scalar `c ∈ F` multiplies `∏_w |ω|_w` by `∏_w |c|_w`, the absolute value being squared at
complex places. -/
theorem archimedeanMeasure_smul [Algebra.FiniteType F H] (ω : GaugeForm F H) (c : F) :
    archimedeanMeasure (c • ω) =
      ENNReal.ofReal (∏ w : NumberField.InfinitePlace F, w c ^ w.mult) • archimedeanMeasure ω := by
  sorry

/-- For `G_a` and `ω = dX`, evaluation at `X` carries the archimedean measure to `infiniteAdeleHaar`
(`dx` at real places, `2 dx dy` at complex places). -/
theorem archimedeanMeasure_ga :
    Measure.map (fun x : AdelicPoints.InfinitePoints F (SymmetricAlgebra F F) =>
        (x.ofConv (SymmetricAlgebra.ι F F 1) : NumberField.InfiniteAdeleRing F))
      (archimedeanMeasure (gaForm (F := F))) = NumberField.infiniteAdeleHaar F := by
  sorry

-- Test GaugeForm.archimedeanMeasure_ga_rat: for `G_a/ℚ` the archimedean measure of `[0, 1)` is `1`.
example : archimedeanMeasure (gaForm (F := ℚ))
    {x | ∀ w, ((NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace ℚ)
      (x.ofConv (SymmetricAlgebra.ι ℚ ℚ 1))).1 w ∈ Ico (0 : ℝ) 1} = 1 := by
  sorry

-- Test GaugeForm.archimedeanMeasure_complex_scalar: over an imaginary quadratic field, scaling the
-- form by `2` scales the archimedean measure by `|2|_ℂ = 4`, not by `2`.
example (hr : NumberField.InfinitePlace.nrRealPlaces F = 0)
    (hc : NumberField.InfinitePlace.nrComplexPlaces F = 1) :
    (∏ w : NumberField.InfinitePlace F, w (2 : F) ^ w.mult) = 4 := by
  sorry

end GaugeForm

namespace Tamagawa

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- Complexified canonical geometric character lattice. -/
abbrev characterSpace := ℂ ⊗[ℤ]
  Additive (TauCeti.CommHopfAlgCat.geometricCharacterGroup (CommHopfAlgCat.of F H))

/-- A prolongation of the finite place to the algebraic closure. -/
def characterPlace
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    ValuationSubring (AlgebraicClosure F) := sorry

theorem characterPlace_restrict
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (x : F) :
    algebraMap F (AlgebraicClosure F) x ∈ characterPlace F v ↔ v.valuation F x ≤ 1 := by sorry

/-- Complex-linear extension of the pinned action on the geometric character lattice. -/
def characterAction : Field.absoluteGaloisGroup F →*
    (characterSpace F H ≃ₗ[ℂ] characterSpace F H) := sorry

theorem characterAction_tmul (σ : Field.absoluteGaloisGroup F) (z : ℂ)
    (χ : Additive (TauCeti.CommHopfAlgCat.geometricCharacterGroup (CommHopfAlgCat.of F H))) :
    characterAction F H σ (z ⊗ₜ[ℤ] χ) = z ⊗ₜ[ℤ] (σ • χ) := by sorry

/-- A lift of arithmetic residue Frobenius in the decomposition group. -/
def residueFrobenius
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    (characterPlace F v).decompositionSubgroup F := sorry

theorem residueFrobenius_apply
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (y : IsLocalRing.ResidueField (characterPlace F v)) :
    residueFrobenius F v • y = y ^ Ideal.absNorm v.asIdeal := by sorry

/-- Invariants of local inertia on the geometric character lattice, after complexification.
A prolongation of v to the algebraic closure fixes the inertia subgroup; conjugate choices
are identified by the geometric Galois action. -/
def characterInertiaSpace
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    Submodule ℂ (characterSpace F H) := sorry

theorem mem_characterInertiaSpace
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (x : characterSpace F H) :
    x ∈ characterInertiaSpace F H v ↔
      ∀ σ : (characterPlace F v).inertiaSubgroup F,
        characterAction F H (show Field.absoluteGaloisGroup F from σ.val.val) x = x := by sorry

/-- Arithmetic residue Frobenius on the inertia invariants. -/
def characterFrobenius
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    characterInertiaSpace F H v ≃ₗ[ℂ] characterInertiaSpace F H v := sorry

theorem characterFrobenius_apply
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (x : characterInertiaSpace F H v) :
    (characterFrobenius F H v x).val = characterAction F H
      (show Field.absoluteGaloisGroup F from (residueFrobenius F v).val) x.val := by sorry

/-- The canonical Artin factor for the geometric character representation. -/
def characterLocalFactor
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (s : ℂ) : ℂ :=
  FiniteImageArtin.localFactor (characterInertiaSpace F H v) (characterFrobenius F H v)
    (Ideal.absNorm v.asIdeal) s

/-- On Re(s)>1 the Artin L-function is this convergent Euler product. -/
def characterGlobalL (s : ℂ) : ℂ := ∏' v, characterLocalFactor F H v s

/-- The real leading coefficient at one. Existence and positivity are the Artin supplier. -/
def characterLeadingCoeff : ℝ :=
  Filter.limUnder (𝓝[>] (1 : ℝ)) fun s : ℝ =>
    (((s - 1 : ℝ) : ℂ) ^ Module.finrank ℤ (Additive (RationalCharacter F H)) *
      characterGlobalL F H s).re

theorem characterLeadingCoeff_pos [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H)) :
    0 < characterLeadingCoeff F H := by sorry

theorem tendsto_characterLeadingCoeff [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H)) :
    Tendsto (fun s : ℝ =>
      (((s - 1 : ℝ) : ℂ) ^ Module.finrank ℤ (Additive (RationalCharacter F H)) *
        characterGlobalL F H s)) (𝓝[>] 1) (𝓝 (characterLeadingCoeff F H : ℂ)) := by sorry

theorem characterLocalFactor_split [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (hsplit : Function.Surjective (RationalCharacter.toGeometric (F := F) (H := H)))
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (s : ℂ) :
    characterLocalFactor F H v s =
      splitLocalFactor F v (Module.finrank ℤ (Additive (RationalCharacter F H))) s := by sorry

theorem characterLeadingCoeff_split [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (hsplit : Function.Surjective (RationalCharacter.toGeometric (F := F) (H := H))) :
    characterLeadingCoeff F H =
      splitLeadingCoeff F (Module.finrank ℤ (Additive (RationalCharacter F H))) := by sorry

/-- `τ_G = |d_F|^{-d/2} ρ_G⁻¹ ∏_v λ_v |ω|_v`, with the convergence
factors and the convergent Haar product of AA.0. -/
def measure [Algebra.FiniteType F H] (ω : GaugeForm F H) : Measure (AdelicPoints F H) := sorry

theorem measure_isHaar [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (ω : GaugeForm F H) (hω : ω ≠ 0) : (measure F H ω).IsHaarMeasure := by
  sorry

/-- by the product formula, `τ_G` does not depend on `ω`. -/
theorem measure_smul [Algebra.FiniteType F H] (ω : GaugeForm F H) (c : F) (hc : c ≠ 0) :
    measure F H (c • ω) = measure F H ω := by
  sorry

/-- For `G_a`, `τ = |d_F|^{-1/2} • adeleHaar`. -/
theorem measure_ga :
    Measure.map (fun x => Multiplicative.toAdd (AdelicPoints.gaEquiv F x))
        (measure F (SymmetricAlgebra F F) GaugeForm.gaForm) =
      (ENNReal.ofReal (|(NumberField.discr F : ℝ)| ^ (-(1 / 2 : ℝ)))) • NumberField.adeleHaar F := by
  sorry

/-- The product formula for `τ_G` when every geometric character is rational (trivial Galois
action on `X*(G_{F̄})`, of rank `r`): then `λ_v = (1 - q_v⁻¹)^{-r}` and `ρ_G = (res_{s=1} ζ_F)^r`.
On the set of points with archimedean component in `C∞`, component in `C v` at the finite places
of `T` and in the integral points of a model `M` outside `T`, `τ_G` is
`|d_F|^{-d/2} ρ_G⁻¹ · |ω|_∞(C∞) · ∏_{v ∈ T} λ_v |ω|_v(C v) · ∏_{v ∉ T} λ_v |ω|_v(𝓗(𝒪_v))`, the last
product converging. The general formula is `measure_eq_product_artin`. -/
theorem measure_eq_product [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (hsplit : Function.Surjective (RationalCharacter.toGeometric (F := F) (H := H)))
    (ω : GaugeForm F H) (hω : ω ≠ 0)
    {S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S)
    (T : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) (hST : S ⊆ T)
    (Cinf : Set (AdelicPoints.InfinitePoints F H)) (hCinf : MeasurableSet Cinf)
    (C : ∀ v, Set (AdelicPoints.LocalPoints F H v)) (hC : ∀ v, MeasurableSet (C v))
    (hCT : ∀ v (hv : v ∉ T), C v = (M.localPoints ⟨v, fun h => hv (hST h)⟩ : Set _)) :
    measure F H ω {x | AdelicPoints.infiniteProjection F H x ∈ Cinf ∧
        ∀ v, AdelicPoints.proj F H v x ∈ C v} =
      ENNReal.ofReal (|(NumberField.discr F : ℝ)| ^
          (-(Module.finrank F (GaugeForm.cotangent F H) : ℝ) / 2) *
          (splitLeadingCoeff F (Module.finrank ℤ (Additive (RationalCharacter F H))))⁻¹) *
        GaugeForm.archimedeanMeasure ω Cinf *
        (∏ v ∈ T, ENNReal.ofReal
            (splitLocalFactor F v (Module.finrank ℤ (Additive (RationalCharacter F H))) 1).re *
          GaugeForm.localMeasure ω v (C v)) *
        ENNReal.ofReal (∏' v : {v // v ∉ T},
          (splitLocalFactor F v.1 (Module.finrank ℤ (Additive (RationalCharacter F H))) 1).re *
            (GaugeForm.localMeasure ω v.1 (C v.1)).toReal) := by
  sorry

/-- General Artin normalization on measurable adelic boxes; no split-character hypothesis. -/
theorem measure_eq_product_artin [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (ω : GaugeForm F H) (hω : ω ≠ 0)
    {S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S)
    (T : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) (hST : S ⊆ T)
    (Cinf : Set (AdelicPoints.InfinitePoints F H)) (hCinf : MeasurableSet Cinf)
    (C : ∀ v, Set (AdelicPoints.LocalPoints F H v)) (hC : ∀ v, MeasurableSet (C v))
    (hCT : ∀ v (hv : v ∉ T), C v = (M.localPoints ⟨v, fun h => hv (hST h)⟩ : Set _)) :
    measure F H ω {x | AdelicPoints.infiniteProjection F H x ∈ Cinf ∧
        ∀ v, AdelicPoints.proj F H v x ∈ C v} =
      ENNReal.ofReal (|(NumberField.discr F : ℝ)| ^
          (-(Module.finrank F (GaugeForm.cotangent F H) : ℝ) / 2) *
          (characterLeadingCoeff F H)⁻¹) *
        GaugeForm.archimedeanMeasure ω Cinf *
        (∏ v ∈ T, ENNReal.ofReal
            (characterLocalFactor F H v 1).re *
          GaugeForm.localMeasure ω v (C v)) *
        ENNReal.ofReal (∏' v : {v // v ∉ T},
          (characterLocalFactor F H v.1 1).re *
            (GaugeForm.localMeasure ω v.1 (C v.1)).toReal) := by
  sorry

-- Test Tamagawa.splitLocalFactor_cancels_gm: the convergence factor `λ_v = (1 - q_v⁻¹)⁻¹` of `G_m`
-- cancels the form volume `1 - q_v⁻¹` of `𝒪_v^×` exactly, so the integral factors of `τ_{G_m}` are
-- `1`; with `λ_v = 1` their product over all `v` would be `0`.
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    (splitLocalFactor F v 1 1).re * (1 - (Ideal.absNorm v.asIdeal : ℝ)⁻¹) = 1 := by
  sorry

-- Test Tamagawa.measure_trivial: for the trivial group `τ` is the unit point mass.
example (ω : GaugeForm F F) (hω : ω ≠ 0) : measure F F ω = Measure.dirac 1 := by
  sorry

-- Test Tamagawa.measure_not_naive_product: `∏_p (1 - p⁻¹)` tends to `0`, so the unnormalized
-- factors `|dT/T|_p(ℤ_p^×)` have no nonzero product.
example : Filter.Tendsto (fun N : ℕ => ∏ p ∈ Finset.filter Nat.Prime (Finset.range N),
    (1 - (p : ℝ)⁻¹)) Filter.atTop (𝓝 0) := by
  sorry

/-- `τ(G) = vol(G(F)\G(𝔸_F)^1)`. -/
def number [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (ω : GaugeForm F H) : ℝ≥0∞ :=
  AutomorphicQuotient.measure F H hred (measure F H ω) Set.univ

theorem number_pos [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (ω : GaugeForm F H) (hω : ω ≠ 0) : 0 < number F H hred ω := by
  sorry

theorem number_smul [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (ω : GaugeForm F H) (c : F) (hc : c ≠ 0) : number F H hred (c • ω) = number F H hred ω := by
  sorry

-- Test Tamagawa.number_gm_statement: `τ(G_m) = 1` over every number field.
example (hred : TauCeti.reductiveCommHopfAlgProperty F
    (AdelicPoints.finiteTypeObj F (LaurentPolynomial F))) :
    number F (LaurentPolynomial F) hred GaugeForm.gmForm = 1 := by
  sorry

-- Test Tamagawa.number_gm_gaussian: over `ℚ(i)` the residue `π/4` and the idele volume `π/2` of
-- `F^×\𝔸^1` give `τ = |d|^{-1/2} ρ⁻¹ vol = 1`; omitting `|d|^{-1/2}` gives `2`, and omitting the
-- factor `2` at the complex place gives `1/2`. Over `ℚ` neither omission changes the value.
example : (1 / 2 : ℝ) * (Real.pi / 4)⁻¹ * (Real.pi / 2) = 1 ∧
    (Real.pi / 4)⁻¹ * (Real.pi / 2) = 2 ∧
    (1 / 2 : ℝ) * (Real.pi / 4)⁻¹ * (Real.pi / 4) = 1 / 2 := by
  have hπ : Real.pi ≠ 0 := Real.pi_ne_zero
  refine ⟨?_, ?_, ?_⟩ <;> field_simp <;> ring

-- Test Tamagawa.number_trivial: `τ = 1` for the trivial group.
example (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F F))
    (ω : GaugeForm F F) (hω : ω ≠ 0) : number F F hred ω = 1 := by
  sorry

-- Test Tamagawa.measure_ga_selfdual: for `G_a` over `ℚ`, every measurable fundamental domain of `ℚ`
-- in `𝔸_ℚ` (for instance `[0, 1) × ℤ̂`) has Tamagawa volume one.
example (D : Set (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ))
    (hD : MeasureTheory.IsAddFundamentalDomain
      (algebraMap ℚ (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)).range.toAddSubgroup D
        (NumberField.adeleHaar ℚ)) :
    measure ℚ (SymmetricAlgebra ℚ ℚ) GaugeForm.gaForm
      {x | Multiplicative.toAdd (AdelicPoints.gaEquiv ℚ x) ∈ D} = 1 := by
  sorry

-- Test Tamagawa.number_not_full_quotient: `G_m(F)\G_m(𝔸_F)` has infinite volume: every
-- fundamental domain of `F^×` in `G_m(𝔸_F)` has infinite Haar measure.
example (μ : Measure (AdelicPoints F (LaurentPolynomial F))) [μ.IsHaarMeasure]
    (D : Set (AdelicPoints F (LaurentPolynomial F)))
    (hD : IsFundamentalDomain (AdelicPoints.diagonal F (LaurentPolynomial F)).range D μ) :
    μ D = ⊤ := by
  sorry

end Tamagawa

namespace Neat

/-- an automorphism is neat if its eigenvalues generate a torsion-free
subgroup of `ℂ^×`. -/
def IsNeatAut {n : ℕ} (α : GL (Fin n) ℂ) : Prop :=
  ∀ z ∈ Subgroup.closure {z : ℂˣ | Module.End.HasEigenvalue (Matrix.toLin' (α : Matrix (Fin n) (Fin n) ℂ)) z},
    IsOfFinOrder z → z = 1

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- Evaluate an actual algebraic representation in Hopf coordinates on rational points,
then extend entries along the specified embedding into C. The map on coordinate rings is
contravariant: O(GL_n)→O(G). The imported points equivalence uses ordinary matrix order. -/
def algebraicPointMap (τ : F →+* ℂ) (n : ℕ)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H) :
    WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ where
  toFun g := Matrix.GeneralLinearGroup.map τ
    (TauCeti.GeneralLinear.pointsMulEquiv (R := F) n
      (WithConv.toConv (g.ofConv.comp
        (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐ[F] H))))
  map_one' := sorry
  map_mul' := sorry

/-- The point action comes from an algebraic representation, not an arbitrary abstract
homomorphism of G(F). This predicate spells out its existing coordinate-ring carrier. -/
def IsAlgebraicPointHom (τ : F →+* ℂ) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) : Prop :=
  ∃ r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H,
    ρ = algebraicPointMap τ n r

/-- Faithful algebraic means a closed immersion, hence a surjection on coordinate rings.
Injectivity on F-rational points alone is not the algebraicity/faithfulness hypothesis. -/
def IsFaithfulAlgebraicPointHom (τ : F →+* ℂ) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) : Prop :=
  ∃ r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H,
    Function.Surjective r ∧ ρ = algebraicPointMap τ n r

/-- Neatness relative to the supplied matrix action. The algebraic-group notion chooses a
faithful algebraic action; its independence is the theorem below with those hypotheses. -/
def IsNeat (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (g : WithConv (H →ₐ[F] F)) : Prop :=
  IsNeatAut (ρ g)

def IsNeatSubgroup (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (Γ : Subgroup (WithConv (H →ₐ[F] F))) : Prop :=
  ∀ g ∈ Γ, IsNeat n ρ g

variable (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)

theorem IsNeat.pow {g : WithConv (H →ₐ[F] F)} (h : IsNeat n ρ g) (k : ℕ) : IsNeat n ρ (g ^ k) := by
  sorry

theorem IsNeat.torsion_eq_one (hρ : Function.Injective ρ) {g : WithConv (H →ₐ[F] F)} (h : IsNeat n ρ g)
    (hg : IsOfFinOrder g) : g = 1 := by
  sorry

/-- this direction permits nonfaithful σ,
but both representations must be algebraic over the same embedded coefficient field. -/
theorem isNeat_of_faithful [Algebra.FiniteType F H] (m : ℕ) (σ : WithConv (H →ₐ[F] F) →* GL (Fin m) ℂ)
    (τ : F →+* ℂ) (hρ : IsFaithfulAlgebraicPointHom τ n ρ)
    (hσ : IsAlgebraicPointHom τ m σ)
    (g : WithConv (H →ₐ[F] F)) (h : IsNeat n ρ g) : IsNeat m σ g := by
  sorry

-- Test Neat.isNeat_diag
example : IsNeatAut (Matrix.GeneralLinearGroup.mkOfDetNeZero (Matrix.diagonal ![(2 : ℂ), 1/2])
    (by simp [Matrix.det_diagonal, Fin.prod_univ_two])) := by
  sorry

-- Test Neat.isNeat_one
example : IsNeatAut (1 : GL (Fin n) ℂ) := by
  sorry

-- Test Neat.not_isNeat_rotation
example : ¬ IsNeatAut (Matrix.GeneralLinearGroup.mkOfDetNeZero !![(0 : ℂ), -1; 1, -1]
    (by simp [Matrix.det_fin_two_of])) := by
  sorry
end Neat

namespace Neat
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)

/-- Relative-to-ρ form of neat level. The algebraic-group API fixes ρ to be a faithful
algebraic representation; independence is `isNeat_of_faithful` in both directions.
`rationalLevelAt U g = G(F) ∩ g U g⁻¹`, through `AdelicPoints.finiteDiagonal`. -/
def rationalLevelAt (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (g : AdelicPoints.FiniteAdelicPoints F H) : Subgroup (WithConv (H →ₐ[F] F)) :=
  U.comap ((MulAut.conj g⁻¹).toMonoidHom.comp (AdelicPoints.finiteDiagonal F H))

def IsNeatLevel (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) : Prop :=
  ∀ g : AdelicPoints.FiniteAdelicPoints F H, IsNeatSubgroup n ρ (rationalLevelAt U g)

theorem IsNeatLevel.mono {U U' : Subgroup (AdelicPoints.FiniteAdelicPoints F H)}
    (h : IsNeatLevel n ρ U) (hU : U' ≤ U) : IsNeatLevel n ρ U' := by
  sorry

theorem IsNeatLevel.conj (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (g : AdelicPoints.FiniteAdelicPoints F H) :
    IsNeatLevel n ρ (U.map (MulAut.conj g).toMonoidHom) ↔ IsNeatLevel n ρ U := by
  sorry

theorem IsNeatLevel.torsionFree (hρ : Function.Injective ρ)
    {U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)} (h : IsNeatLevel n ρ U)
    (g : AdelicPoints.FiniteAdelicPoints F H)
    (γ : WithConv (H →ₐ[F] F)) (hγ : γ ∈ rationalLevelAt U g) (ht : IsOfFinOrder γ) : γ = 1 := by
  sorry

-- Test Neat.isNeatLevel_trivial_group at the actual trivial Hopf algebra.
example (ρ : WithConv (F →ₐ[F] F) →* GL (Fin n) ℂ)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F F)) : IsNeatLevel n ρ U := by
  sorry
end Neat

/-! ## Layer 4: Approximation

`G(F_S) = ∏_{w ∈ S_∞} G(F_w) × ∏_{v ∈ S_f} G(F_v)` for a finite set of archimedean places `S_∞` and
of finite places `S_f`. Strong approximation is stated for sets `S` containing every archimedean
place, the case the sources use, in the equivalent form "`G(F) G(F_S)` is dense in `G(𝔸_F)`". -/

namespace Approximation

/-- A closed subgroup containing one factor is the whole product if its other projection is
 dense. This is the topological step in Platonov's 1970 Addendum, §2, pp. 784–785. -/
theorem eq_top_of_contains_factor_dense_projection
    {A B : Type*} [Group A] [Group B] [TopologicalSpace A] [TopologicalSpace B]
    (C : Subgroup (A × B)) (hC : IsClosed (C : Set (A × B)))
    (hA : ∀ a : A, (a, 1) ∈ C)
    (hB : DenseRange (fun x : C => (x : A × B).2)) : C = ⊤ := by
  have hslice : ∀ b : B, ((1 : A), b) ∈ C := by
    intro b
    refine hB.induction_on (p := fun b : B => ((1 : A), b) ∈ C) b ?_ ?_
    · exact hC.preimage (continuous_const.prodMk continuous_id)
    · intro x
      simpa only [Prod.mul_def, inv_mul_cancel, one_mul] using
        C.mul_mem (hA (x.val.1)⁻¹) x.property
  apply top_unique
  intro x _
  simpa using C.mul_mem (hA x.1) (hslice x.2)


open _root_.NumberField NumberField

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `G(F_w)` at an archimedean place, with the evaluation topology. -/
abbrev ArchPoints (w : InfinitePlace F) :=
  TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of F w.Completion)

instance (w : InfinitePlace F) : TopologicalSpace (ArchPoints F H w) :=
  AdelicPoints.evalTopology F H w.Completion

/-- The diagonal `G(F) → G(F_S)`. -/
def diagonalS (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F)))
    (g : WithConv (H →ₐ[F] F)) :
    (∀ w : Sinf, ArchPoints F H w) × (∀ v : Sf, AdelicPoints.LocalPoints F H v) :=
  (fun w => TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g,
    fun v => TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g)

/-- `G(F)` is dense in `G(F_S)`. -/
def HasWeakApproximation (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) : Prop :=
  DenseRange (diagonalS F H Sinf Sf)

variable {F H}

theorem HasWeakApproximation.mono {Sinf Sinf' : Finset (InfinitePlace F)}
    {Sf Sf' : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasWeakApproximation F H Sinf Sf) (hinf : Sinf' ⊆ Sinf) (hf : Sf' ⊆ Sf) :
    HasWeakApproximation F H Sinf' Sf' := by
  sorry

theorem HasWeakApproximation.prod {H' : Type} [CommRing H'] [HopfAlgebra F H']
    {Sinf : Finset (InfinitePlace F)} {Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasWeakApproximation F H Sinf Sf) (h' : HasWeakApproximation F H' Sinf Sf) :
    HasWeakApproximation F (TensorProduct F H H') Sinf Sf := by
  sorry

theorem HasWeakApproximation.of_iso {H' : Type} [CommRing H'] [HopfAlgebra F H']
    (e : H ≃ₐc[F] H') {Sinf : Finset (InfinitePlace F)}
    {Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasWeakApproximation F H Sinf Sf) : HasWeakApproximation F H' Sinf Sf := by
  sorry

variable (F)

-- Test Approximation.hasWeakApproximation_empty.
example : HasWeakApproximation F H ∅ ∅ := by
  sorry

-- Test Approximation.hasWeakApproximation_ga: `G_a` has weak approximation for every finite `S`.
example (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasWeakApproximation F (SymmetricAlgebra F F) Sinf Sf := by
  sorry

-- Test Approximation.not_hasWeakApproximation_mu2: `μ_2 = Spec ℚ[ℤ/2]` fails for `S = {∞, 2}`.
example : ∃ (Sinf : Finset (InfinitePlace ℚ))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers ℚ))),
    Sinf.card = 1 ∧ Sf.card = 1 ∧
      ¬ HasWeakApproximation ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))) Sinf Sf := by
  sorry

/-- `GL_n`, `SL_n`, `G_a` and split tori have weak approximation. -/
theorem hasWeakApproximation_gln (n : ℕ) (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasWeakApproximation F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) Sinf Sf := by
  sorry

theorem hasWeakApproximation_sln (n : ℕ) (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasWeakApproximation F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n) Sinf Sf := by
  sorry

theorem hasWeakApproximation_splitTorus (r : ℕ) (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasWeakApproximation F (MonoidAlgebra F (Multiplicative (Fin r → ℤ))) Sinf Sf := by
  sorry

variable (H)

/-- Points of `G(𝔸_F)` supported at `∞ ∪ S_f`. -/
def supportedAt (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    Subgroup (AdelicPoints F H) where
  carrier := {x | ∀ v ∉ Sf, AdelicPoints.proj F H v x = 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- For `S = ∞ ∪ S_f`: `G(F) G(F_S)` is dense in `G(𝔸_F)`;
equivalently `G(F)` is dense in `G(𝔸_F^S)`. -/
def HasStrongApproximation (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    Prop :=
  Dense {x : AdelicPoints F H | ∃ g y, y ∈ supportedAt F H Sf ∧ x = AdelicPoints.diagonal F H g * y}

variable {F H}

theorem HasStrongApproximation.mono
    {Sf Sf' : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasStrongApproximation F H Sf) (hS : Sf ⊆ Sf') : HasStrongApproximation F H Sf' := by
  sorry

/-- For every open subgroup `U` of `G(𝔸_F)`, `G(𝔸_F) = G(F) G(F_S) U`. -/
theorem HasStrongApproximation.mul_open
    {Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasStrongApproximation F H Sf) (U : Subgroup (AdelicPoints F H))
    (hU : IsOpen (U : Set (AdelicPoints F H))) (x : AdelicPoints F H) :
    ∃ g, ∃ y ∈ supportedAt F H Sf, ∃ u ∈ U, x = AdelicPoints.diagonal F H g * y * u := by
  sorry

/-- With `S = ∞`, the class set `G(F)\G(𝔸_f)/U` is a point for every open subgroup `U`. -/
theorem HasStrongApproximation.classNumber_one (h : HasStrongApproximation F H ∅)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    Subsingleton (DoubleCoset.Quotient
      ((AdelicPoints.finiteDiagonal F H).range : Set (AdelicPoints.FiniteAdelicPoints F H)) U) := by
  sorry

variable (F)

-- Test Approximation.hasStrongApproximation_ga: `G_a` has strong approximation for `S = ∞`.
example : HasStrongApproximation F (SymmetricAlgebra F F) ∅ := by
  sorry

-- Test Approximation.hasStrongApproximation_sl2_rat: `SL_2` over `ℚ`, `S = ∞`; the surjectivity
-- of `SL_2(ℤ) → SL_2(ℤ/d)` alone gives only density of `SL_2(ℤ)` in `SL_2(ℤ̂)`.
example : HasStrongApproximation ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) ∅ := by
  sorry

-- Test Approximation.not_hasStrongApproximation_gm: `G_m` over `ℚ` fails for `S = ∞`.
example : ¬ HasStrongApproximation ℚ (LaurentPolynomial ℚ) ∅ := by
  sorry

-- Acceptance of at `SL_n`, `n ≥ 2`, `S = ∞`.
example (n : ℕ) (hn : 2 ≤ n) :
    HasStrongApproximation F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n) ∅ := by
  sorry

/-- Strong approximation away from an arbitrary set of places, expressed on the full adelic
carrier. The two sets are the infinite and finite parts of S; neither must be cofinite. -/
def HasStrongApproximationAway (Sinf : Set (InfinitePlace F))
    (Sf : Set (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) : Prop :=
  Dense {x : AdelicPoints F H | ∃ g y,
    (∀ v ∉ Sf, AdelicPoints.proj F H v y = 1) ∧
    (∀ w ∉ Sinf, ∀ h : H,
      (AdelicPoints.infiniteProjection F H y).ofConv h w =
        (1 : AdelicPoints.InfinitePoints F H).ofConv h w) ∧
    x = AdelicPoints.diagonal F H g * y}

/-- PRR, Lemma 5.7, pp. 301–302: S need only be nonempty, and may omit infinity. -/
theorem hasStrongApproximationAway_of_unipotent [Algebra.FiniteType F H]
    (hN : TauCeti.smoothUnipotentCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (Sinf : Set (InfinitePlace F))
    (Sf : Set (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F)))
    (hS : Sinf.Nonempty ∨ Sf.Nonempty) :
    HasStrongApproximationAway (H := H) F Sinf Sf := by
  sorry

/-- Comparison with the finite-away interface used by the reductive-group applications. -/
theorem hasStrongApproximationAway_univ_iff
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasStrongApproximationAway (H := H) F Set.univ (Sf : Set _) ↔
      HasStrongApproximation F H Sf := by
  simp [HasStrongApproximationAway, HasStrongApproximation, supportedAt]

-- Test Approximation.unipotent_away_finite_singleton: infinity remains in the approximation space.
example (v : IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F)) :
    HasStrongApproximationAway (H := SymmetricAlgebra F F) F ∅ {v} := by
  sorry

-- Test Approximation.unipotent_away_empty: the full rational diagonal is not dense.
example : ¬ HasStrongApproximationAway (H := SymmetricAlgebra ℚ ℚ) ℚ ∅ ∅ := by
  sorry

-- Test Approximation.away_all: the complementary space is a point, for every group.
example : HasStrongApproximationAway (H := H) F Set.univ Set.univ := by
  sorry

/-- smooth unipotent groups have strong approximation for every
`S ⊇ ∞`. -/
theorem hasStrongApproximation_of_unipotent [Algebra.FiniteType F H]
    (hN : TauCeti.smoothUnipotentCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasStrongApproximation F H Sf := by
  sorry

/-- a nontrivial torus never has strong approximation
for a finite `S`. -/
theorem not_hasStrongApproximation_of_torus [Algebra.FiniteType F H]
    (hT : TauCeti.torusCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (hnontriv : ¬ Subsingleton (WithConv (H →ₐ[F] AlgebraicClosure F)))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    ¬ HasStrongApproximation F H Sf := by
  sorry

end Approximation

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The archimedean embedding `G(F_∞) → G(𝔸_F)`, `x ↦ (x, 1)`. -/
def infiniteEmbed : InfinitePoints F H →* AdelicPoints F H where
  toFun x := WithConv.toConv {
    toFun h := (x.ofConv h, (1 : FiniteAdelicPoints F H).ofConv h)
    map_zero' := by sorry
    map_one' := by sorry
    map_add' := by sorry
    map_mul' := by sorry
    commutes' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

theorem infiniteEmbed_infinite (x : InfinitePoints F H) :
    infiniteProjection F H (infiniteEmbed F H x) = x := by
  sorry

theorem infiniteEmbed_finite (x : InfinitePoints F H) :
    finiteProjection F H (infiniteEmbed F H x) = 1 := by
  sorry

theorem continuous_infiniteEmbed : Continuous (infiniteEmbed F H) := by
  sorry

end AdelicPoints

/-- an open subgroup `Δ` of a locally compact group with
a nonzero finite invariant Radon measure on `G/Δ` has finite index. -/
theorem Subgroup.finiteIndex_of_finite_covolume {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G]
    (Δ : Subgroup G) (hΔ : IsOpen (Δ : Set G)) [MeasurableSpace (G ⧸ Δ)] [BorelSpace (G ⧸ Δ)]
    (μ : Measure (G ⧸ Δ)) [IsFiniteMeasure μ] [μ.Regular] (hμ : μ ≠ 0)
    (hinv : ∀ g : G, Measure.map (fun x : G ⧸ Δ => g • x) μ = μ) : Δ.FiniteIndex := by
  sorry

/-! ## Layer 4: Compact abelian quotients and limits of invariant measures -/

namespace Residual

open _root_.MeasureTheory

variable {C : Type*} [CommGroup C] [TopologicalSpace C] [hctx39 : IsTopologicalGroup C] [hctx40 : CompactSpace C]
  [hctx41 : T2Space C] [hctx42 : SecondCountableTopology C] [MeasurableSpace C] [hctx43 : BorelSpace C]
include hctx39 hctx40 hctx41 hctx42 hctx43

/-- for pairwise distinct continuous characters `χ_i : C → {±1}`,
every weak limit of probability measures invariant under `ker χ_i` is `C`-invariant. -/
theorem invariant_of_tendsto_kernels (χ : ℕ → C →* ℤˣ) (hχc : ∀ i, Continuous (χ i))
    (hχ : Function.Injective χ) (μ : ℕ → ProbabilityMeasure C)
    (hμ : ∀ i, ∀ c ∈ (χ i).ker, Measure.map (c * ·) (μ i : Measure C) = μ i)
    (ν : ProbabilityMeasure C) (hlim : Filter.Tendsto μ Filter.atTop (𝓝 ν)) :
    ∀ c : C, Measure.map (c * ·) (ν : Measure C) = ν := by
  sorry

/-- let `π : G → C` be a continuous surjective
homomorphism, `T ≤ G` closed, `Λ ≤ T` discrete with `Λ\T` compact and `π(Λ) = 1`, and `ν` the
`T`-invariant probability measure on `Λ\T`. Then the pushforward of `ν` along `[t] ↦ π(t g)` is
the probability measure on the coset `π(T) π(g)` invariant under `π(T)`. -/
theorem map_invariant_eq {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (π : G →* C) (hπ : Continuous π) (hπs : Function.Surjective π) (T : Subgroup G)
    (hT : IsClosed (T : Set G)) (Λ : Subgroup T) (hΛ : DiscreteTopology Λ)
    [CompactSpace (MulAction.orbitRel.Quotient Λ T)] (hπΛ : ∀ l : Λ, π ((l : T) : G) = 1)
    [MeasurableSpace (MulAction.orbitRel.Quotient Λ T)]
    [BorelSpace (MulAction.orbitRel.Quotient Λ T)]
    (ν : Measure (MulAction.orbitRel.Quotient Λ T)) [IsProbabilityMeasure ν]
    (hν : ∀ s : T, Measure.map (Quotient.map' (· * s) (by sorry)) ν = ν) (g : G) :
    let q : MulAction.orbitRel.Quotient Λ T → C :=
      Quotient.lift (fun t : T => π ((t : G) * g)) (by sorry)
    IsProbabilityMeasure (Measure.map q ν) ∧
      (∀ s ∈ T.map π, Measure.map (s * ·) (Measure.map q ν) = Measure.map q ν) ∧
      Measure.map q ν (((T.map π : Subgroup C) : Set C) * {π g})ᶜ = 0 := by
  sorry

/-- for pairwise distinct nontrivial continuous `χ_i : C → {±1}`,
the Haar probability `m_i` of `ker χ_i` integrates a character `ψ` to zero unless `ψ = 1` or
`ψ = χ_i`, so the `m_i` converge weakly to Haar probability on `C`. -/
theorem integral_character_kernel (χ : C →* ℤˣ) (hχ : Continuous χ) (hχ1 : χ ≠ 1)
    (m : Measure C) [IsProbabilityMeasure m] (hm : m (χ.ker : Set C)ᶜ = 0)
    (hminv : ∀ c ∈ χ.ker, Measure.map (c * ·) m = m) (ψ : C →* Circle) (hψ : Continuous ψ)
    (hψ1 : ψ ≠ 1) (hψχ : ∃ c, (ψ c : ℂ) ≠ ((χ c : ℤ) : ℂ)) :
    ∫ c, (ψ c : ℂ) ∂m = 0 := by
  sorry

theorem tendsto_kernel_haar (χ : ℕ → C →* ℤˣ) (hχc : ∀ i, Continuous (χ i))
    (hχ : Function.Injective χ) (m : ℕ → ProbabilityMeasure C)
    (hm : ∀ i, (m i : Measure C) ((χ i).ker : Set C)ᶜ = 0)
    (hminv : ∀ i, ∀ c ∈ (χ i).ker, Measure.map (c * ·) (m i : Measure C) = m i)
    (ν : ProbabilityMeasure C) (hν : ∀ c, Measure.map (c * ·) (ν : Measure C) = ν) :
    Filter.Tendsto m Filter.atTop (𝓝 ν) := by
  sorry

-- Test Residual.homogeneous_point
example :
    let G := Multiplicative (ZMod 4)
    letI : MeasurableSpace G := borel G
    let T : Subgroup G := ⊥
    let Λ : Subgroup T := ⊥
    let Q := MulAction.orbitRel.Quotient Λ T
    letI : MeasurableSpace Q := borel Q
    let ν : Measure Q := (Nat.card Q : ℝ≥0∞)⁻¹ • Measure.count
    let q : Q → G := Quotient.lift
      (fun t : T => (t : G) * Multiplicative.ofAdd (1 : ZMod 4)) (by sorry)
    Measure.map q ν {Multiplicative.ofAdd (1 : ZMod 4)} = 1 ∧
      Measure.map q ν Set.univ = 1 ∧
      Measure.map q ν ((T : Set G) * {Multiplicative.ofAdd (1 : ZMod 4)})ᶜ = 0 := by
  sorry

-- Test Residual.homogeneous_full
example :
    let G := Multiplicative (ZMod 4)
    letI : MeasurableSpace G := borel G
    let T : Subgroup G := ⊤
    let Λ : Subgroup T := ⊥
    let Q := MulAction.orbitRel.Quotient Λ T
    letI : MeasurableSpace Q := borel Q
    let ν : Measure Q := (Nat.card Q : ℝ≥0∞)⁻¹ • Measure.count
    let q : Q → G := Quotient.lift
      (fun t : T => (t : G) * Multiplicative.ofAdd (1 : ZMod 4)) (by sorry)
    Measure.map q ν {Multiplicative.ofAdd (1 : ZMod 4)} = (1 / 4) ∧
      Measure.map q ν Set.univ = 1 ∧
      Measure.map q ν ((T : Set G) * {Multiplicative.ofAdd (1 : ZMod 4)})ᶜ = 0 := by
  sorry

-- Test Residual.homogeneous_coset
example :
    let G := Multiplicative (ZMod 4)
    letI : MeasurableSpace G := borel G
    let T : Subgroup G := Subgroup.zpowers (Multiplicative.ofAdd (2 : ZMod 4))
    let Λ : Subgroup T := ⊥
    let Q := MulAction.orbitRel.Quotient Λ T
    letI : MeasurableSpace Q := borel Q
    let ν : Measure Q := (Nat.card Q : ℝ≥0∞)⁻¹ • Measure.count
    let q : Q → G := Quotient.lift
      (fun t : T => (t : G) * Multiplicative.ofAdd (1 : ZMod 4)) (by sorry)
    Measure.map q ν {Multiplicative.ofAdd (1 : ZMod 4)} = (1 / 2) ∧
      Measure.map q ν Set.univ = 1 ∧
      Measure.map q ν ((T : Set G) * {Multiplicative.ofAdd (1 : ZMod 4)})ᶜ = 0 := by
  sorry

/-- The identity of a two-point space need not be measurable for an arbitrary source sigma algebra. -/
example : ¬ @Measurable Bool Bool ⊥ ⊤ id := by
  intro h
  have hs : MeasurableSet[⊥] ({true} : Set Bool) := h (MeasurableSpace.measurableSet_top)
  rcases MeasurableSpace.measurableSet_bot_iff.mp hs with he | he
  · have : true ∈ (∅ : Set Bool) := he ▸ Set.mem_singleton true
    exact this
  · have : false ∈ ({true} : Set Bool) := he.symm ▸ Set.mem_univ false
    simp at this

end Residual

/-- `C_F/C_F²` is compact Hausdorff. -/
theorem NumberField.compactSpace_ideleClassGroup_mod_squares (F : Type) [Field F] [NumberField F] :
    CompactSpace (NumberField.IdeleClassGroup (NumberField.RingOfIntegers F) F ⧸
        Subgroup.closure (Set.range fun y : NumberField.IdeleClassGroup (NumberField.RingOfIntegers F) F =>
          y ^ 2)) ∧
      T2Space (NumberField.IdeleClassGroup (NumberField.RingOfIntegers F) F ⧸
        Subgroup.closure (Set.range fun y : NumberField.IdeleClassGroup (NumberField.RingOfIntegers F) F =>
          y ^ 2)) := by
  sorry

/-- if `Γ` is a lattice in `A × B`, the closure `Δ` of its
projection to `B` has finite covolume: `Δ\B` carries a nonzero finite `B`-invariant measure. -/
theorem exists_finite_invariant_measure_projection {A B : Type*} [Group A] [Group B]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalGroup A] [IsTopologicalGroup B]
    [LocallyCompactSpace A] [LocallyCompactSpace B] [SecondCountableTopology A]
    [SecondCountableTopology B] [T2Space A] [T2Space B]
    (Γ : Subgroup (A × B)) (hΓ : DiscreteTopology Γ)
    (μ : Measure (QuotientMeasure.Cosets Γ)) [IsFiniteMeasure μ] [μ.Regular] (hμ : μ ≠ 0)
    (hμinv : ∀ x : A × B, Measure.map (Quotient.map' (· * x) (by sorry)) μ = μ)
    : ∃ ν : Measure (QuotientMeasure.Cosets (Γ.map (MonoidHom.snd A B)).topologicalClosure),
      ν ≠ 0 ∧ IsFiniteMeasure ν ∧ ν.Regular ∧
        ∀ b : B, Measure.map (Quotient.map' (· * b) (by sorry)) ν = ν := by
  sorry

/-! ## Layer 4: Torsors -/

namespace Approximation

/-- a torsor under the affine group `Spec H` over a field `k`: a nonzero
finitely generated algebra `A` with a coassociative, counital coaction `A → A ⊗ H`, trivialized as a
comodule algebra over an algebraic closure. -/
structure Torsor (k : Type) [Field k] (H : Type) [CommRing H] [HopfAlgebra k H] where
  /-- The coordinate algebra of the torsor. -/
  A : Type
  [commRing : CommRing A]
  [algebra : Algebra k A]
  [nontrivial : Nontrivial A]
  finiteType : Algebra.FiniteType k A
  /-- The coaction `A → A ⊗ H`, a right action of `G` on `Spec A`. -/
  coaction : A →ₐ[k] TensorProduct k A H
  coassoc : (TensorProduct.map coaction.toLinearMap LinearMap.id) ∘ₗ coaction.toLinearMap =
    (TensorProduct.assoc k A H H).symm.toLinearMap ∘ₗ
      (TensorProduct.map LinearMap.id (Coalgebra.comul (R := k) (A := H))) ∘ₗ coaction.toLinearMap
  counit : (TensorProduct.rid k A).toLinearMap ∘ₗ
      (TensorProduct.map LinearMap.id (Coalgebra.counit (R := k) (A := H))) ∘ₗ
        coaction.toLinearMap = LinearMap.id
  /-- `Spec A × G → Spec A × Spec A`, `(x, g) ↦ (x, x g)`, is an isomorphism; over a field this is
  equivalent to a comodule-algebra trivialization over an algebraic closure. -/
  bijective_actionMap :
    Function.Bijective (Algebra.TensorProduct.productMap Algebra.TensorProduct.includeLeft coaction)

attribute [instance] Torsor.commRing Torsor.algebra Torsor.nontrivial

variable {k : Type} [Field k] {H : Type} [CommRing H] [HopfAlgebra k H]

/-- A torsor is trivial when it has a `k`-point. -/
def Torsor.IsTrivial (X : Torsor k H) : Prop := Nonempty (X.A →ₐ[k] k)

/-- `G` acting on itself. -/
def Torsor.self [Algebra.FiniteType k H] [Nontrivial H] : Torsor k H := sorry

/-- An isomorphism of torsors: an algebra isomorphism commuting with the coactions. -/
def Torsor.Iso (X Y : Torsor k H) : Prop :=
  ∃ e : X.A ≃ₐ[k] Y.A, (Algebra.TensorProduct.map e.toAlgHom (AlgHom.id k H)).comp X.coaction =
    Y.coaction.comp e.toAlgHom

theorem Torsor.trivial_iff_iso [Algebra.FiniteType k H] [Nontrivial H] (X : Torsor k H) :
    X.IsTrivial ↔ X.Iso Torsor.self := by
  sorry

/-- Base change of a torsor along a field extension `k → k'`: the coordinate algebra `k' ⊗_k A` with
the base-changed coaction. Its coordinate algebra and its points are fixed by
`Torsor.nonempty_baseChange_algEquiv` and `Torsor.isTrivial_baseChange_iff`. -/
def Torsor.baseChange (k' : Type) [Field k'] [Algebra k k'] (X : Torsor k H) :
    Torsor k' (TensorProduct k k' H) :=
  sorry

/-- The coordinate algebra of `X.baseChange k'` is `k' ⊗_k A`. -/
theorem Torsor.nonempty_baseChange_algEquiv (k' : Type) [Field k'] [Algebra k k'] (X : Torsor k H) :
    Nonempty ((X.baseChange k').A ≃ₐ[k'] TensorProduct k k' X.A) := by
  sorry

/-- A `k'`-point of the base change is a `k`-algebra map `A → k'`: the base change is trivial
exactly when `X` has a `k'`-valued point. -/
theorem Torsor.isTrivial_baseChange_iff (k' : Type) [Field k'] [Algebra k k'] (X : Torsor k H) :
    (X.baseChange k').IsTrivial ↔ Nonempty (X.A →ₐ[k] k') := by
  sorry

/-- Coordinate sections commute with scalar extension by the tensor adjunction. -/
def Torsor.baseChange_sections (k' : Type) [Field k'] [Algebra k k'] (X : Torsor k H) :
    ((X.baseChange k').A →ₐ[k'] k') ≃ (X.A →ₐ[k] k') := sorry

theorem Torsor.baseChange_iso (k' : Type) [Field k'] [Algebra k k']
    (X Y : Torsor k H) (h : X.Iso Y) : (X.baseChange k').Iso (Y.baseChange k') := by sorry

theorem Torsor.iso_trivial_iff (X Y : Torsor k H) (h : X.Iso Y) :
    X.IsTrivial ↔ Y.IsTrivial := by sorry

/-- The canonical tensor reassociation on the two factors of a coaction. -/
def Torsor.baseChangeCoactionMap (k' : Type) [Field k'] [Algebra k k'] (X : Torsor k H) :
    (X.A ⊗[k] H) →ₐ[k] ((k' ⊗[k] X.A) ⊗[k'] (k' ⊗[k] H)) := sorry

theorem Torsor.baseChangeCoactionMap_tmul (k' : Type) [Field k'] [Algebra k k']
    (X : Torsor k H) (a : X.A) (h : H) :
    X.baseChangeCoactionMap k' (a ⊗ₜ[k] h) =
      ((1 : k') ⊗ₜ[k] a) ⊗ₜ[k'] ((1 : k') ⊗ₜ[k] h) := by sorry

/-- The presentation is an isomorphism of comodules, as well as an algebra equivalence. -/
theorem Torsor.baseChange_coaction (k' : Type) [Field k'] [Algebra k k'] (X : Torsor k H) :
    ∃ e : (X.baseChange k').A ≃ₐ[k'] (k' ⊗[k] X.A), ∀ a : X.A,
      Algebra.TensorProduct.map e.toAlgHom (AlgHom.id k' (k' ⊗[k] H))
        ((X.baseChange k').coaction (e.symm ((1 : k') ⊗ₜ[k] a))) =
          X.baseChangeCoactionMap k' (X.coaction a) := by sorry

/-- A comparison with geometric torsor classes: every class has an affine presentation,
and equality of classes means an equivariant coordinate isomorphism. -/
structure Torsor.ClassComparison (C : Type*) where
  classOf : Torsor k H → C
  surjective : Function.Surjective classOf
  eq_iff_iso : ∀ X Y, classOf X = classOf Y ↔ X.Iso Y

/-- Triviality agrees with the distinguished geometric class. -/
theorem Torsor.ClassComparison.eq_base_iff {C : Type*}
    [Algebra.FiniteType k H] [Nontrivial H] (c : Torsor.ClassComparison (k := k) (H := H) C)
    (X : Torsor k H) : c.classOf X = c.classOf Torsor.self ↔ X.IsTrivial := by
  rw [c.eq_iff_iso, Torsor.trivial_iff_iso]

/-- Scalar extension descends to any geometric class set through its presentation comparison. -/
def Torsor.ClassComparison.baseChangeMap {C C' : Type*}
    (c : Torsor.ClassComparison (k := k) (H := H) C)
    (k' : Type) [Field k'] [Algebra k k']
    (c' : Torsor.ClassComparison (k := k') (H := k' ⊗[k] H) C') : C → C' := sorry

theorem Torsor.ClassComparison.baseChangeMap_classOf {C C' : Type*}
    (c : Torsor.ClassComparison (k := k) (H := H) C)
    (k' : Type) [Field k'] [Algebra k k']
    (c' : Torsor.ClassComparison (k := k') (H := k' ⊗[k] H) C') (X : Torsor k H) :
    c.baseChangeMap k' c' (c.classOf X) = c'.classOf (X.baseChange k') := by sorry

/-- The square-root torsor with the Kummer action. -/
def Torsor.sqrtTwo : Torsor ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))) := sorry

theorem Torsor.sqrtTwo_coordinates :
    Nonempty (Torsor.sqrtTwo.A ≃ₐ[ℚ] AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (2 : ℚ))) := by sorry

/-- The coordinate generator has the Kummer coaction x ↦ x ⊗ g. -/
theorem Torsor.sqrtTwo_coaction :
    ∃ e : Torsor.sqrtTwo.A ≃ₐ[ℚ] AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (2 : ℚ)),
      Torsor.sqrtTwo.coaction (e.symm (AdjoinRoot.root _)) =
        e.symm (AdjoinRoot.root _) ⊗ₜ[ℚ]
          MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ℚ) := by sorry

-- Test torsorClasses_sqrtTwo_nontrivial
example {C : Type*}
    (c : Torsor.ClassComparison (k := ℚ) (H := MonoidAlgebra ℚ (Multiplicative (ZMod 2))) C) :
    ¬ Torsor.sqrtTwo.IsTrivial ∧ c.classOf Torsor.sqrtTwo ≠ c.classOf Torsor.self := by sorry

-- Test torsorClasses_sqrtTwo_identity
example {C : Type*}
    (c : Torsor.ClassComparison (k := ℚ)
      (H := ℚ ⊗[ℚ] MonoidAlgebra ℚ (Multiplicative (ZMod 2))) C) :
    ¬ (Torsor.sqrtTwo.baseChange ℚ).IsTrivial ∧
      c.classOf (Torsor.sqrtTwo.baseChange ℚ) ≠ c.classOf Torsor.self := by sorry

-- Test torsorClasses_sqrtTwo_real
example {C : Type*}
    (c : Torsor.ClassComparison (k := ℝ)
      (H := ℝ ⊗[ℚ] MonoidAlgebra ℚ (Multiplicative (ZMod 2))) C) :
    (Torsor.sqrtTwo.baseChange ℝ).IsTrivial ∧
      c.classOf (Torsor.sqrtTwo.baseChange ℝ) = c.classOf Torsor.self := by sorry

-- Test Approximation.Torsor.baseChange_self_nontrivial: base change along `ℚ → ℚ` keeps the
-- `μ₂`-torsor `ℚ[x]/(x² - 2)` nontrivial, while base change along `ℚ → ℝ` trivializes it. A
-- `baseChange` returning the trivial torsor `G_{k'}` would make both base changes trivial.
example : ∃ X : Torsor ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))),
    Nonempty (X.A ≃ₐ[ℚ] AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (2 : ℚ))) ∧
      ¬ (X.baseChange ℚ).IsTrivial ∧ (X.baseChange ℝ).IsTrivial := by
  sorry

-- Test Approximation.Torsor.self_trivial.
example [Algebra.FiniteType k H] [Nontrivial H] : (Torsor.self (k := k) (H := H)).IsTrivial := by
  sorry

-- Test Approximation.Torsor.mu2_sqrt: `ℚ[x]/(x² - 2)` with `x ↦ x ⊗ g` is a nontrivial
-- `μ_2`-torsor over `ℚ`.
example : ∃ X : Torsor ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))),
    Nonempty (X.A ≃ₐ[ℚ] AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (2 : ℚ))) ∧ ¬ X.IsTrivial := by
  sorry

-- Test Approximation.Torsor.not_torsor_two_orbits: `G_m` acting on `A¹` by scaling is not a torsor.
example : ¬ ∃ X : Torsor ℚ (LaurentPolynomial ℚ), ∃ e : X.A ≃ₐ[ℚ] Polynomial ℚ,
    (Algebra.TensorProduct.map e.toAlgHom (AlgHom.id ℚ (LaurentPolynomial ℚ))).comp X.coaction =
      (Polynomial.aeval (Polynomial.X ⊗ₜ[ℚ] LaurentPolynomial.T 1 :
        TensorProduct ℚ (Polynomial ℚ) (LaurentPolynomial ℚ))).comp e.toAlgHom := by
  sorry

end Approximation

/-! ## Layer 4: Neatness: stability, p-adic criteria and existence -/

namespace Neat

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)

/-- subgroups of neat subgroups are neat. -/
theorem IsNeatSubgroup.mono {Γ Γ' : Subgroup (WithConv (H →ₐ[F] F))} (h : IsNeatSubgroup n ρ Γ)
    (hle : Γ' ≤ Γ) : IsNeatSubgroup n ρ Γ' := by
  sorry

/-- Conjugates of neat subgroups by rational points are neat. -/
theorem IsNeatSubgroup.conj {Γ : Subgroup (WithConv (H →ₐ[F] F))} (h : IsNeatSubgroup n ρ Γ)
    (γ : WithConv (H →ₐ[F] F)) : IsNeatSubgroup n ρ (Γ.map (MulAut.conj γ).toMonoidHom) := by
  sorry

/-- Images of neat subgroups under homomorphisms of algebraic groups are neat, for faithful
algebraic representations over the same embedding `τ`. -/
theorem IsNeatSubgroup.map {H' : Type} [CommRing H'] [HopfAlgebra F H'] [Algebra.FiniteType F H]
    [Algebra.FiniteType F H'] (τ : F →+* ℂ) (m : ℕ) (ρ' : WithConv (H' →ₐ[F] F) →* GL (Fin m) ℂ)
    (hρ : IsFaithfulAlgebraicPointHom τ n ρ) (hρ' : IsFaithfulAlgebraicPointHom τ m ρ')
    (φ : H' →ₐc[F] H) {Γ : Subgroup (WithConv (H →ₐ[F] F))} (h : IsNeatSubgroup n ρ Γ) :
    IsNeatSubgroup m ρ' (Γ.map (TauCeti.AlgHom.mapDomain (R := F) (H₁ := H') (H₂ := H) (A := F) φ)) := by
  sorry

/-- for faithful algebraic `ρ` and algebraic `σ`, every
eigenvalue of `σ(g)` lies in the group generated by the eigenvalues of `ρ(g)`. -/
theorem eigenvalue_mem_closure [Algebra.FiniteType F H] (τ : F →+* ℂ) (m : ℕ)
    (σ : WithConv (H →ₐ[F] F) →* GL (Fin m) ℂ) (hρ : IsFaithfulAlgebraicPointHom τ n ρ)
    (hσ : IsAlgebraicPointHom τ m σ) (g : WithConv (H →ₐ[F] F)) (μ : ℂˣ)
    (hμ : Module.End.HasEigenvalue (Matrix.toLin' (σ g : Matrix (Fin m) (Fin m) ℂ)) μ) :
    μ ∈ Subgroup.closure
      {z : ℂˣ | Module.End.HasEigenvalue (Matrix.toLin' (ρ g : Matrix (Fin n) (Fin n) ℂ)) z} := by
  sorry

/-- The value algebra map `𝔸_{F,f} → F_v`. -/
def finiteValue (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F →ₐ[F] v.adicCompletion F where
  toFun x := x v
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry
  commutes' := by sorry

/-- The projection `G(𝔸_{F,f}) → G(F_v)`. -/
def finiteProj (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    AdelicPoints.FiniteAdelicPoints F H →* AdelicPoints.LocalPoints F H v :=
  TauCeti.AlgHom.mapValue (H := H) (finiteValue v)

/-- If at one place `v | p` every element of `U` acts in `1 + p^e M_n(𝒪_v)` through the faithful
algebraic representation, with `e ≥ 1` for `p ≥ 3` and `e ≥ 2` for `p = 2`, then `U` is neat. The
congruence is modulo the rational prime power `p^e`, not a power of a uniformizer of `F_v`. -/
theorem isNeatLevel_of_congruence [Algebra.FiniteType F H] (τ : F →+* ℂ)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H)
    (hr : Function.Surjective r) (hρ : ρ = algebraicPointMap τ n r)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H)))
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (p : ℕ) [Fact p.Prime]
    (e : ℕ) (he : (3 ≤ p ∧ 1 ≤ e) ∨ (p = 2 ∧ 2 ≤ e))
    (hv : (p : NumberField.RingOfIntegers F) ∈ v.asIdeal)
    (hcong : ∀ u ∈ U, ∀ i j, ∃ y ∈ v.adicCompletionIntegers F,
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := F) n
          (TauCeti.AlgHom.mapDomain r (finiteProj v u)) :
            Matrix (Fin n) (Fin n) (v.adicCompletion F)) - 1) i j =
        (p : v.adicCompletion F) ^ e * y) :
    IsNeatLevel n ρ U := by
  sorry

-- Test Neat.congruence_two_needs_four: modulo `2` alone the criterion fails, since
-- `-1 = 1 + 2 · (-1)` is a nontrivial torsion element (it lies in `Γ(2)`); modulo `4` it is excluded.
example : ((-1 : ℤ) = 1 + 2 * (-1)) ∧ (-1 : ℤ) ^ 2 = 1 ∧ (-1 : ℤ) ≠ 1 ∧
    ¬ ∃ y : ℤ, (-1 : ℤ) = 1 + 4 * y := by
  refine ⟨by norm_num, by norm_num, by norm_num, ?_⟩
  rintro ⟨y, hy⟩
  omega

/-- every compact open level contains a neat open normal subgroup of
finite index. -/
theorem exists_isNeatLevel [Algebra.FiniteType F H] (τ : F →+* ℂ)
    (hρ : IsFaithfulAlgebraicPointHom τ n ρ) (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ∃ U' : Subgroup (AdelicPoints.FiniteAdelicPoints F H), U' ≤ U ∧
      IsOpen (U' : Set (AdelicPoints.FiniteAdelicPoints F H)) ∧ (U'.subgroupOf U).Normal ∧
      (U'.subgroupOf U).FiniteIndex ∧ IsNeatLevel n ρ U' := by
  sorry

end Neat

/-! p-adic inputs to the one-prime criterion. `PadicAlgCl p` is Mathlib's algebraic closure of
`ℚ_p` with the extended absolute value. -/

namespace NeatPadic

variable (p : ℕ) [hctx44 : Fact p.Prime]
include hctx44

/-- a root of unity `ζ ≠ 1` satisfies `|ζ - 1| ≥ p^{-1/(p-1)}`. -/
theorem le_norm_sub_one {ζ : PadicAlgCl p} (hζ : ζ ≠ 1) {m : ℕ} (hm : 0 < m) (hζm : ζ ^ m = 1) :
    (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) ≤ ‖ζ - 1‖ := by
  sorry

/-- A primitive `p^k`-th root of unity has distance `p^{-1/(p^{k-1}(p-1))}` from `1`. -/
theorem norm_sub_one_of_primitive_pow {ζ : PadicAlgCl p} {k : ℕ} (hk : 0 < k)
    (hζ : IsPrimitiveRoot ζ (p ^ k)) :
    ‖ζ - 1‖ = (p : ℝ) ^ (-(1 / ((p : ℝ) ^ (k - 1) * ((p : ℝ) - 1)))) := by
  sorry

/-- A root of unity of order prime to `p`, other than `1`, has distance one from `1`. -/
theorem norm_sub_one_of_coprime {ζ : PadicAlgCl p} {m : ℕ} (hm : IsPrimitiveRoot ζ m)
    (hcop : Nat.Coprime m p) (h1 : 1 < m) : ‖ζ - 1‖ = 1 := by
  sorry

/-- the ball `|λ - 1| < p^{-1/(p-1)}` has no nontrivial roots of
unity. -/
theorem eq_one_of_norm_sub_one_lt {ζ : PadicAlgCl p}
    (hζ : ‖ζ - 1‖ < (p : ℝ) ^ (-(1 / ((p : ℝ) - 1)))) {m : ℕ} (hm : 0 < m) (hζm : ζ ^ m = 1) :
    ζ = 1 := by
  sorry

/-- eigenvalues of `M ∈ 1 + p^a M_n(ℤ_p)` satisfy
`|λ - 1| ≤ p^{-a}`. -/
theorem norm_eigenvalue_sub_one_le {n : ℕ} (a : ℕ) (M : Matrix (Fin n) (Fin n) ℤ_[p])
    (hM : ∀ i j, ∃ y : ℤ_[p], (M - 1) i j = (p : ℤ_[p]) ^ a * y) (ev : PadicAlgCl p)
    (hev : Module.End.HasEigenvalue
      (Matrix.toLin' (M.map fun x => algebraMap ℚ_[p] (PadicAlgCl p) (x : ℚ_[p]))) ev) :
    ‖ev - 1‖ ≤ (p : ℝ) ^ (-(a : ℤ)) := by
  sorry

/-- a compact subgroup of `GL_n(ℚ_p)` stabilizes a lattice,
so it is conjugate into `GL_n(ℤ_p)`. -/
theorem exists_conj_le_integral {n : ℕ} (C : Subgroup (GL (Fin n) ℚ_[p]))
    (hC : IsCompact (C : Set (GL (Fin n) ℚ_[p]))) :
    ∃ g : GL (Fin n) ℚ_[p], ∀ c ∈ C, g * c * g⁻¹ ∈
      (Matrix.GeneralLinearGroup.map (algebraMap ℤ_[p] ℚ_[p])).range := by
  sorry

end NeatPadic

/-! ## Layer 4: Level quotients, groupoids and Hecke correspondences

For a compact open `U ⊂ G(𝔸_{F,f})` and a closed `K∞ ⊂ G(F_∞)`, `X_U = G(F)\G(𝔸_F)/K∞U`. -/

namespace LevelMaps

open AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The subgroup `K∞U` of `G(𝔸_F)`. -/
def levelSubgroup (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :
    Subgroup (AdelicPoints F H) :=
  Kinf.map (infiniteEmbed F H) ⊔ U.map (finiteEmbed F H)

/-- `x ∼ γ x k` for `γ ∈ G(F)` and `k ∈ K∞U`. -/
def levelSetoid (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :
    Setoid (AdelicPoints F H) where
  r x y := ∃ γ, ∃ k ∈ levelSubgroup F H U Kinf, y = diagonal F H γ * x * k
  iseqv := sorry

/-- `X_U = G(F)\G(𝔸_F)/K∞U`, with the quotient topology. -/
abbrev LevelQuotient (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :=
  Quotient (levelSetoid F H U Kinf)

variable {F H}

/-- The projection `G(𝔸_F) → X_U`. -/
def LevelQuotient.mk (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (x : AdelicPoints F H) : LevelQuotient F H U Kinf :=
  Quotient.mk _ x

theorem LevelQuotient.mk_rational (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) (γ : WithConv (H →ₐ[F] F)) (x : AdelicPoints F H) :
    LevelQuotient.mk U Kinf (diagonal F H γ * x) = LevelQuotient.mk U Kinf x := by
  sorry

/-- Hecke translation `X_{gUg⁻¹} ≃ X_U`, `[x] ↦ [x g]`. -/
def LevelQuotient.rightTranslate (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) (g : FiniteAdelicPoints F H) :
    LevelQuotient F H (U.map (MulAut.conj g).toMonoidHom) Kinf ≃ₜ LevelQuotient F H U Kinf :=
  sorry

theorem LevelQuotient.rightTranslate_mk (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) (g : FiniteAdelicPoints F H) (x : AdelicPoints F H) :
    LevelQuotient.rightTranslate U Kinf g (LevelQuotient.mk _ Kinf x) =
      LevelQuotient.mk U Kinf (x * finiteEmbed F H g) := by
  sorry

/-- The level map `X_{U'} → X_U` for `U' ≤ U`. -/
def LevelQuotient.levelMap {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    (Kinf : Subgroup (InfinitePoints F H)) :
    LevelQuotient F H U' Kinf → LevelQuotient F H U Kinf :=
  Quotient.map' id (by sorry)

/-- for compact open `U` and `K∞` containing `A_G(ℝ)^0` and compact
modulo it, `X_U` is Hausdorff and locally compact. -/
theorem LevelQuotient.t2Space_locallyCompact [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    T2Space (LevelQuotient F H U Kinf) ∧ LocallyCompactSpace (LevelQuotient F H U Kinf) := by
  sorry

/-- the full stabilizer `G(F) ∩ g K∞U g⁻¹` is finite. -/
theorem finite_rationalStabilizer [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (g : AdelicPoints F H) :
    Finite (((levelSubgroup F H U Kinf).map (MulAut.conj g).toMonoidHom).comap (diagonal F H)) := by
  sorry

/-- `K∞ ∩ ker H_{G,∞}` is compact and
`K∞ ≃ A_G(ℝ)^0 × (K∞ ∩ ker H_{G,∞})`. -/
theorem isCompact_inf_ker_logHeight [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (Kinf : Subgroup (InfinitePoints F H)) (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    IsCompact ((Kinf ⊓ ((logHeight F H).comp (infiniteEmbed F H)).ker : Subgroup _) :
      Set (InfinitePoints F H)) ∧
    ∀ k ∈ Kinf, ∃! ak : (SplitComponent F H).comap (infiniteEmbed F H) ×
        (Kinf ⊓ ((logHeight F H).comp (infiniteEmbed F H)).ker : Subgroup _),
      k = (ak.1 : InfinitePoints F H) * ak.2 := by
  sorry

/-- at neat level the level map is a finite covering of degree
`[U : U']`. -/
theorem LevelQuotient.isCoveringMap_levelMap [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (hU'o : IsOpen (U' : Set (FiniteAdelicPoints F H))) (hneat : Neat.IsNeatLevel n ρ U)
    (Kinf : Subgroup (InfinitePoints F H)) (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    IsCoveringMap (LevelQuotient.levelMap h Kinf) ∧
      ∀ x, Nat.card (LevelQuotient.levelMap h Kinf ⁻¹' {x}) = U'.relIndex U := by
  sorry

/-- for `U'` normal in a neat `U`, the right action of `U` on
`X_{U'}` factors through `U/U'` and is free. -/
theorem LevelQuotient.action_free [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U) (hnorm : (U'.subgroupOf U).Normal)
    (hneat : Neat.IsNeatLevel n ρ U)
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (u : FiniteAdelicPoints F H) (hu : u ∈ U) (x : AdelicPoints F H)
    (hfix : LevelQuotient.mk U' Kinf (x * finiteEmbed F H u) = LevelQuotient.mk U' Kinf x) :
    u ∈ U' := by
  sorry

/-- the action groupoid of `G(F)` on `G(𝔸_F)/K∞U`. -/
abbrev levelGroupoid (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :=
  CategoryTheory.ActionCategory (diagonal F H).range (AdelicPoints F H ⧸ levelSubgroup F H U Kinf)

/-- The automorphisms of an object are its stabilizer `G(F) ∩ x K∞U x⁻¹`: Mathlib's
`CategoryTheory.ActionCategory.stabilizerIsoEnd` read in the groupoid; fixed by
`levelGroupoid_aut_hom`. -/
def levelGroupoid_aut (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (x : AdelicPoints F H ⧸ levelSubgroup F H U Kinf) :
    MulAction.stabilizer (diagonal F H).range x ≃*
      CategoryTheory.Aut (CategoryTheory.ActionCategory.objEquiv (diagonal F H).range _ x) :=
  sorry

/-- The automorphism attached to `γ` is the morphism `γ` of the action groupoid, as in
`CategoryTheory.ActionCategory.stabilizerIsoEnd`. -/
theorem levelGroupoid_aut_hom (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) (x : AdelicPoints F H ⧸ levelSubgroup F H U Kinf)
    (γ : MulAction.stabilizer (diagonal F H).range x) :
    (levelGroupoid_aut U Kinf x γ).hom =
      CategoryTheory.ActionCategory.stabilizerIsoEnd (diagonal F H).range x ⟨γ.1, γ.2⟩ := by
  sorry

/-- Its isomorphism classes are the points of `X_U`; fixed by `levelGroupoid_isoClasses_mk`. -/
def levelGroupoid_isoClasses (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) :
    Quotient (CategoryTheory.isIsomorphicSetoid (levelGroupoid (F := F) (H := H) U Kinf)) ≃
      LevelQuotient F H U Kinf :=
  sorry

/-- The class of the object `[g]` is the point `[g]` of `X_U`. -/
theorem levelGroupoid_isoClasses_mk (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) (g : AdelicPoints F H) :
    levelGroupoid_isoClasses U Kinf (Quotient.mk _ (CategoryTheory.ActionCategory.objEquiv
        (diagonal F H).range _ (g : AdelicPoints F H ⧸ levelSubgroup F H U Kinf))) =
      LevelQuotient.mk U Kinf g := by
  sorry

-- Test LevelMaps.levelGroupoid_aut_underlying: the automorphism attached to `γ` has underlying
-- group element `γ`; composing with conjugation by a fixed element of the stabilizer gives another
-- isomorphism of the same groups, which moves every noncentral `γ`.
example (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (x : AdelicPoints F H ⧸ levelSubgroup F H U Kinf)
    (γ : MulAction.stabilizer (diagonal F H).range x) :
    ((levelGroupoid_aut U Kinf x γ).hom).hom = (γ : (diagonal F H).range) := by
  rw [levelGroupoid_aut_hom]
  rfl

theorem levelGroupoid_finite_aut [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (x : AdelicPoints F H ⧸ levelSubgroup F H U Kinf) :
    Finite (MulAction.stabilizer (diagonal F H).range x) := by
  sorry

/-- `G(F)` acts properly discontinuously on `G(𝔸_F)/K∞U`. -/
theorem properlyDiscontinuous_rational [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    ProperlyDiscontinuousSMul (diagonal F H).range (AdelicPoints F H ⧸ levelSubgroup F H U Kinf) := by
  sorry

/-- for `U' ≤ U` and a point `x = [g]` of `X_U` with finite full
stabilizer `A_x = G(F) ∩ g K∞U g⁻¹`, `∑_{y ↦ x} 1/|A_y| = [U : U']/|A_x|`. -/
theorem sum_inv_card_stabilizer {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    [(U'.subgroupOf U).FiniteIndex] (Kinf : Subgroup (InfinitePoints F H)) (g : AdelicPoints F H)
    (hfin : Finite (MulAction.stabilizer (diagonal F H).range
      (g : AdelicPoints F H ⧸ levelSubgroup F H U Kinf))) :
    (∑ᶠ y : (LevelQuotient.levelMap h Kinf ⁻¹' {LevelQuotient.mk U Kinf g}),
        ((Nat.card (MulAction.stabilizer (diagonal F H).range
          ((Quotient.out (y : LevelQuotient F H U' Kinf) : AdelicPoints F H) :
            AdelicPoints F H ⧸ levelSubgroup F H U' Kinf)) : ℚ))⁻¹) =
      (U'.relIndex U : ℚ) / Nat.card (MulAction.stabilizer (diagonal F H).range
        (g : AdelicPoints F H ⧸ levelSubgroup F H U Kinf)) := by
  sorry

-- Test LevelMaps.levelGroupoid_neat: at neat level, under the compact-modulo-`A_G` hypotheses, the
-- automorphism groups are trivial.
example [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (hneat : Neat.IsNeatLevel n ρ U)
    (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (x : AdelicPoints F H ⧸ levelSubgroup F H U Kinf) :
    Subsingleton (MulAction.stabilizer (diagonal F H).range x) := by
  sorry

/-- `T_g` is `X_U ← X_{U ∩ gUg⁻¹} → X_U`, `[x] ↦ [x]` and
`[x] ↦ [x g]`. -/
def hecke (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (g : FiniteAdelicPoints F H) :
    (LevelQuotient F H (U ⊓ U.map (MulAut.conj g).toMonoidHom) Kinf → LevelQuotient F H U Kinf) ×
      (LevelQuotient F H (U ⊓ U.map (MulAut.conj g).toMonoidHom) Kinf → LevelQuotient F H U Kinf) :=
  (Quotient.map' id (by sorry), Quotient.map' (· * finiteEmbed F H g) (by sorry))

theorem hecke_fst (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (g : FiniteAdelicPoints F H) (x : AdelicPoints F H) :
    (hecke U Kinf g).1 (LevelQuotient.mk _ Kinf x) = LevelQuotient.mk U Kinf x := by
  sorry

theorem hecke_snd (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (g : FiniteAdelicPoints F H) (x : AdelicPoints F H) :
    (hecke U Kinf g).2 (LevelQuotient.mk _ Kinf x) = LevelQuotient.mk U Kinf (x * finiteEmbed F H g) := by
  sorry

/-- At neat level the first leg has degree `[U : U ∩ gUg⁻¹]`. -/
theorem hecke_degree [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)
    (τ : F →+* ℂ) (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (hneat : Neat.IsNeatLevel n ρ U)
    (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (g : FiniteAdelicPoints F H) (x : LevelQuotient F H U Kinf) :
    Nat.card ((hecke U Kinf g).1 ⁻¹' {x}) = (U ⊓ U.map (MulAut.conj g).toMonoidHom).relIndex U := by
  sorry

-- Test LevelMaps.hecke_one: for `g = 1` the two legs agree.
example (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :
    (hecke U Kinf 1).1 = (hecke U Kinf 1).2 := by
  sorry

/-- for neat `U` and `U' L = U`, the square of level maps through
`X_{U' ∩ L}` is Cartesian. -/
theorem levelMap_cartesian [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    {U U' L : Subgroup (FiniteAdelicPoints F H)} (hU' : U' ≤ U) (hL : L ≤ U)
    (hprod : ∀ u ∈ U, ∃ a ∈ U', ∃ b ∈ L, u = a * b) (hneat : Neat.IsNeatLevel n ρ U)
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hopen : IsOpen (U' : Set (FiniteAdelicPoints F H)) ∧ IsOpen (L : Set (FiniteAdelicPoints F H)))
    (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    Function.Bijective (fun y : LevelQuotient F H (U' ⊓ L) Kinf =>
      (⟨(LevelQuotient.levelMap inf_le_left Kinf y, LevelQuotient.levelMap inf_le_right Kinf y),
        by sorry⟩ : {p : LevelQuotient F H U' Kinf × LevelQuotient F H L Kinf //
          LevelQuotient.levelMap hU' Kinf p.1 = LevelQuotient.levelMap hL Kinf p.2})) := by
  sorry

variable (F H)

-- Test LevelMaps.LevelQuotient.trivial_group: for the trivial group `X_U` is a point.
example (U : Subgroup (FiniteAdelicPoints F F)) (Kinf : Subgroup (InfinitePoints F F)) :
    Subsingleton (LevelQuotient F F U Kinf) := by
  sorry

-- Test LevelMaps.LevelQuotient.not_finite_adelic_only: for `SL_2/ℚ` with `K∞ = 1`, `X_U` is not a
-- point (it contains `SL_2(ℤ)\SL_2(ℝ)`), unlike `SL_2(ℚ)\SL_2(𝔸_f)/U`.
example (U : Subgroup (FiniteAdelicPoints ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2)))
    (hU : IsCompact (U : Set (FiniteAdelicPoints ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2))))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2)))) :
    ¬ Subsingleton (LevelQuotient ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) U ⊥) := by
  sorry

/-- Positive rational scalars give a neat noncompact level for `GL₁/ℚ` with a nontrivial stabilizer.
The scalar two fixes its class after the archimedean positive scalars are divided out. -/
example :
    let H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let ρ := Neat.algebraicPointMap (Rat.castHom ℂ) 1 (BialgHom.id ℚ H)
    let Kinf := (SplitComponent ℚ H).comap (infiniteEmbed ℚ H)
    ∃ U : Subgroup (FiniteAdelicPoints ℚ H), Neat.IsNeatLevel 1 ρ U ∧
      ¬ IsCompact (U : Set (FiniteAdelicPoints ℚ H)) ∧
      ∃ u ∈ U, u ≠ 1 ∧ LevelQuotient.mk ⊥ Kinf (finiteEmbed ℚ H u) =
        LevelQuotient.mk ⊥ Kinf 1 := by
  sorry

end LevelMaps

namespace LevelMaps

/-- `UgU` is the union of `[U : U ∩ gUg⁻¹]` left cosets `ugU`. -/
theorem card_doubleCoset_cosets {G : Type*} [Group G] (U : Subgroup G) (g : G)
    [((U ⊓ U.map (MulAut.conj g).toMonoidHom).subgroupOf U).FiniteIndex] :
    Nat.card (Set.range (fun u : U => ((u * g : G) : G ⧸ U))) =
      (U ⊓ U.map (MulAut.conj g).toMonoidHom).relIndex U := by
  sorry

/-- the index of a product subgroup equal to the ambient one
outside a finite set `B` is the product of the local indices over `B`. -/
theorem relIndex_pi {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] (K K' : ∀ i, Subgroup (G i))
    (hle : ∀ i, K' i ≤ K i) (B : Finset ι) (hB : ∀ i ∉ B, K' i = K i) :
    (Subgroup.pi Set.univ K').relIndex (Subgroup.pi Set.univ K) =
      ∏ i ∈ B, (K' i).relIndex (K i) := by
  sorry

end LevelMaps

/-! ## Layer 3: Arithmetic subgroups, class numbers, finiteness and compactness, heights and real
reduction for `GL_n`

-/

namespace Reduction

section AlgebraicLevi

open TauCeti.CommHopfAlgCat

variable (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H]
  [Algebra.FiniteType F H]

/-- A Levi decomposition of the closed subgroup cut out by `P`. The Hopf ideals specify
closed subgroup schemes, and unique multiplication is required on every coefficient algebra.
Normality and the unipotent/reductive conditions distinguish a Levi decomposition from an
arbitrary factorization. Borel, §1.13, p. 11. -/
structure LeviDecomposition (P : TauCeti.HopfIdeal F H) where
  N : TauCeti.HopfIdeal F H
  M : TauCeti.HopfIdeal F H
  unipotent : TauCeti.smoothUnipotentCommHopfAlgProperty F
    (TauCeti.FiniteTypeCommHopfAlgCat.quotient (AdelicPoints.finiteTypeObj F H) N)
  reductive : TauCeti.reductiveCommHopfAlgProperty F
    (TauCeti.FiniteTypeCommHopfAlgCat.quotient (AdelicPoints.finiteTypeObj F H) M)
  le_N : P ≤ N
  le_M : P ≤ M
  normal : ∀ (R : Type) [CommRing R] [Algebra F R],
    ∀ p ∈ quotientPointsSubgroup (CommHopfAlgCat.of F H) P (CommAlgCat.of F R),
    ∀ n ∈ quotientPointsSubgroup (CommHopfAlgCat.of F H) N (CommAlgCat.of F R),
      p * n * p⁻¹ ∈ quotientPointsSubgroup (CommHopfAlgCat.of F H) N (CommAlgCat.of F R)
  factorization : ∀ (R : Type) [CommRing R] [Algebra F R],
    ∀ p : quotientPointsSubgroup (CommHopfAlgCat.of F H) P (CommAlgCat.of F R),
      ∃! nm : quotientPointsSubgroup (CommHopfAlgCat.of F H) N (CommAlgCat.of F R) ×
          quotientPointsSubgroup (CommHopfAlgCat.of F H) M (CommAlgCat.of F R),
        nm.1.val * nm.2.val = p.val

/-- Characteristic-zero Levi existence for a geometrically connected closed subgroup.
The reductive factor and unipotent radical are conclusions, not input decompositions.
Borel, §1.13, p. 11. -/
theorem exists_leviDecomposition [CharZero F] (P : TauCeti.HopfIdeal F H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F
      (quotient (CommHopfAlgCat.of F H) P)) :
    Nonempty (LeviDecomposition F H P) := by
  sorry

/-- The real character space of the actual Levi coordinate Hopf algebra. -/
abbrev aP {P : TauCeti.HopfIdeal F H} (D : LeviDecomposition F H P) :=
  RealCharacterSpace F (H ⧸ D.M.toIdeal)

variable {F H}

/-- Restriction along a specified inclusion of Levi groups, with contravariant coordinate
map `i`, gives the canonical map on real character spaces. -/
def LeviDecomposition.characterMap {P Q : TauCeti.HopfIdeal F H}
    (D : LeviDecomposition F H P) (E : LeviDecomposition F H Q)
    (i : (H ⧸ E.M.toIdeal) →ₐc[F] (H ⧸ D.M.toIdeal)) :
    aP F H D →ₗ[ℝ] aP F H E := RealCharacterSpace.map i

theorem LeviDecomposition.characterMap_apply {P Q : TauCeti.HopfIdeal F H}
    (D : LeviDecomposition F H P) (E : LeviDecomposition F H Q)
    (i : (H ⧸ E.M.toIdeal) →ₐc[F] (H ⧸ D.M.toIdeal))
    (a : aP F H D) (χ : RationalCharacter F (H ⧸ E.M.toIdeal)) :
    LeviDecomposition.characterMap D E i a (Additive.ofMul χ) =
      a (Additive.ofMul ⟨i χ.val, χ.isGroupLikeElem_val.map i⟩) := by
  exact RealCharacterSpace.map_apply i a χ

-- Test Reduction.levi_torus: for a torus the unipotent radical is the identity.
example (D : LeviDecomposition F (LaurentPolynomial F) ⊥) :
    D.N = TauCeti.HopfIdeal.augmentation F (LaurentPolynomial F) ∧ D.M = ⊥ := by
  sorry

-- Test Reduction.levi_additive: the additive group has trivial reductive factor.
example [CharZero F] (D : LeviDecomposition F (SymmetricAlgebra F F) ⊥) :
    D.N = ⊥ ∧ D.M = TauCeti.HopfIdeal.augmentation F (SymmetricAlgebra F F) := by
  sorry

-- Test Reduction.levi_gl2: the whole reductive group is its own Levi.
example (D : LeviDecomposition F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2) ⊥) :
    D.M = ⊥ ∧ D.N = TauCeti.HopfIdeal.augmentation F
      (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2) := by
  sorry

-- Test Reduction.aP_torus: the character rank is retained, not quotiented out.
example (D : LeviDecomposition F (LaurentPolynomial F) ⊥) :
    Module.finrank ℝ (aP F _ D) = 1 := by
  sorry

-- Test Reduction.aP_additive: the trivial Levi contributes zero characters.
example [CharZero F] (D : LeviDecomposition F (SymmetricAlgebra F F) ⊥) :
    Subsingleton (aP F _ D) := by
  sorry

-- Test Reduction.aP_sl2: semisimplicity kills the full-group character space.
example (D : LeviDecomposition F (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2) ⊥) :
    Subsingleton (aP F _ D) := by
  sorry

-- Test Reduction.LeviDecomposition.characterMap_identity: the identity has zero kernel.
example {P : TauCeti.HopfIdeal F H} (D : LeviDecomposition F H P) :
    LinearMap.ker (LeviDecomposition.characterMap D D (BialgHom.id F _)) = ⊥ := by
  sorry

-- Test Reduction.LeviDecomposition.characterMap_square: t ↦ t² is not the identity on a_G.
example (D : LeviDecomposition F (LaurentPolynomial F) ⊥) :
    ∃ (i : (LaurentPolynomial F ⧸ D.M.toIdeal) →ₐc[F]
        (LaurentPolynomial F ⧸ D.M.toIdeal)) (a : aP F _ D),
      (∀ χ : RationalCharacter F (LaurentPolynomial F ⧸ D.M.toIdeal),
        i χ.val = (χ.val) ^ 2) ∧ a ≠ 0 ∧
      LeviDecomposition.characterMap D D i a = 2 • a ∧
      LeviDecomposition.characterMap D D i a ≠ a := by
  sorry

-- Test Reduction.LeviDecomposition.characterMap_trivial: the trivial homomorphism induces the zero map.
example {P Q : TauCeti.HopfIdeal F H}
    (D : LeviDecomposition F H P) (E : LeviDecomposition F H Q)
    (i : (H ⧸ E.M.toIdeal) →ₐc[F] (H ⧸ D.M.toIdeal))
    (hi : ∀ χ : RationalCharacter F (H ⧸ E.M.toIdeal), i χ.val = 1) :
    LeviDecomposition.characterMap D E i = 0 := by
  sorry

-- Test Reduction.sl2_fd_in_siegel_strip: the strip contains the closed modular domain.
example : ModularGroup.fd ⊆ {z : UpperHalfPlane | |z.re| < 1 ∧ (1 : ℝ) / 2 < z.im} := by
  sorry

-- Test Reduction.sl2_strip_not_fd: the point 3i/4 is in the strip but outside the domain.
example : ∃ z : UpperHalfPlane, z.re = 0 ∧ z.im = 3 / 4 ∧
    (|z.re| < 1 ∧ (1 : ℝ) / 2 < z.im) ∧ z ∉ ModularGroup.fd := by
  sorry

-- Test Reduction.sl2_strip_overlap: i and i+1 belong to the larger closed N-window.
example : ∃ z z' : UpperHalfPlane, z.re = 0 ∧ z.im = 1 ∧ z'.re = 1 ∧ z'.im = 1 ∧
    z ≠ z' ∧ (|z.re| ≤ 1 ∧ (1 : ℝ) / 2 < z.im) ∧
    (|z'.re| ≤ 1 ∧ (1 : ℝ) / 2 < z'.im) ∧
    z' = ModularGroup.T • z := by
  sorry

end AlgebraicLevi



namespace GeometricRoots
variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

abbrev subgroupPoints (S : TauCeti.HopfIdeal F H) := AlgebraicRelativeRoots.subgroupPoints S
abbrev Character (S : TauCeti.HopfIdeal F H) := AlgebraicRelativeRoots.Character S
abbrev Cocharacter (S : TauCeti.HopfIdeal F H) := AlgebraicRelativeRoots.Cocharacter S
abbrev characterValue (S : TauCeti.HopfIdeal F H) := AlgebraicRelativeRoots.characterValue S

theorem characterValue_coe (S : TauCeti.HopfIdeal F H) (χ : Character S)
    (R : Type) [CommRing R] [Algebra F R] (t : subgroupPoints S R)
    (a : H) (ha : Ideal.Quotient.mk S.toIdeal a = χ.toMul.val) :
    (characterValue S χ R t : R) = t.val.ofConv a := by sorry

/-- The shared algebraic adjoint action. -/
abbrev adjoint := AlgebraicRelativeRoots.adjoint (F := F) (H := H)

-- Test Reduction.cocharacter_zero: degree zero evaluates to zero on every character.
example (S : TauCeti.HopfIdeal F H) (χ : Character S) : (0 : Cocharacter S) χ = 0 := rfl
-- Test Reduction.cocharacter_double: doubling degree doubles every integer pairing.
example (S : TauCeti.HopfIdeal F H) (μ : Cocharacter S) (χ : Character S) :
    (2 • μ) χ = 2 * μ χ := by simp [two_smul, two_mul]
-- Test Reduction.cocharacter_gm: the standard character pairs to one, not zero or two.
example : ∃ (χ : Character (⊥ : TauCeti.HopfIdeal ℚ (LaurentPolynomial ℚ)))
    (μ : Cocharacter (⊥ : TauCeti.HopfIdeal ℚ (LaurentPolynomial ℚ))), μ χ = 1 := by sorry

-- Test Reduction.adjoint_identity: the identity does not rescale tangent vectors.
example (d : Derivation F H (TauCeti.Bialgebra.CounitAlgebra F H (AlgebraicClosure F))) :
    adjoint (1 : WithConv (H →ₐ[F] AlgebraicClosure F)) d = d := by sorry
-- Test Reduction.adjoint_torus: all torus conjugations act trivially.
example (g : WithConv (LaurentPolynomial F →ₐ[F] AlgebraicClosure F))
    (d : Derivation F (LaurentPolynomial F)
      (TauCeti.Bialgebra.CounitAlgebra F (LaurentPolynomial F) (AlgebraicClosure F))) :
    adjoint g d = d := by sorry
-- Test Reduction.adjoint_gl2: conjugation can double a nonzero root vector.
example : ∃ (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2 →ₐ[ℚ] AlgebraicClosure ℚ))
    (d : Derivation ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2)
      (TauCeti.Bialgebra.CounitAlgebra ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2)
        (AlgebraicClosure ℚ))), d ≠ 0 ∧ adjoint g d = 2 • d := by sorry

abbrev centralizer (S : TauCeti.HopfIdeal F H) := AlgebraicRelativeRoots.centralizer S
abbrev normalizer (S : TauCeti.HopfIdeal F H) := AlgebraicRelativeRoots.normalizer S
abbrev centralizerIdeal (S : TauCeti.HopfIdeal F H) := AlgebraicRelativeRoots.centralizerIdeal S

theorem centralizerIdeal_points (S : TauCeti.HopfIdeal F H)
    (R : Type) [CommRing R] [Algebra F R] (g : WithConv (H →ₐ[F] R)) :
    g ∈ subgroupPoints (centralizerIdeal S) R ↔
      ∀ (R' : Type) [CommRing R'] [Algebra F R'] (f : R →ₐ[F] R')
        (t : subgroupPoints S R'), Commute (TauCeti.AlgHom.mapValue f g) t.val := by sorry

abbrev rootGroup (S : TauCeti.HopfIdeal F H) := AlgebraicRelativeRoots.rootRayPoints S

end GeometricRoots

section RelativeRoots

open GeometricRoots

variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]
  [Algebra.FiniteType F H]

/-- The same weight submodule used by RG2. -/
abbrev relativeWeightSpace (S : TauCeti.HopfIdeal F H) := AlgebraicRelativeRoots.weightSpace S

instance relativeCentralizer_normal (S : TauCeti.HopfIdeal F H) :
    ((centralizer (H := H) S).subgroupOf (normalizer S)).Normal := by
  sorry

/-- The rational normalizer modulo the rational scheme-theoretic centralizer. -/
abbrev RelativeWeyl (S : TauCeti.HopfIdeal F H) :=
  normalizer (H := H) S ⧸
    (centralizer S).subgroupOf (normalizer S)

/-- Relative roots, with their actual adjoint weight spaces, rational Weyl action, and a base.
No reducedness is imposed: a root and its double can both occur. Borel–Tits §5;
Platonov–Rapinchuk–Rapinchuk, §2.1.14, pp. 75–76. -/
structure RelativeRootData (F : Type) [Field F] (H : Type) [CommRing H]
    [HopfAlgebra F H] [Algebra.FiniteType F H]
    where
  reductive : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H)
  splitTorus : TauCeti.HopfIdeal F H
  maximalSplit : Minimal (fun I : TauCeti.HopfIdeal F H =>
    TauCeti.splitTorusCommHopfAlgProperty F
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient (AdelicPoints.finiteTypeObj F H) I)) splitTorus
  roots : Finset (Character splitTorus)
  roots_eq : ∀ χ, χ ∈ roots ↔ χ ≠ 0 ∧ relativeWeightSpace splitTorus χ ≠ ⊥
  weight_decomposition : DirectSum.IsInternal (relativeWeightSpace splitTorus)
  lattice_free : Module.Free ℤ (Character splitTorus)
  lattice_finite : Module.Finite ℤ (Character splitTorus)
  pairing : RootPairing {χ // χ ∈ roots} ℤ (Character splitTorus) (Cocharacter splitTorus)
  pairing_eval : ∀ χ μ, pairing.toLinearMap χ μ = μ χ
  pairing_root : ∀ α, pairing.root α = α.val
  weylAction : RelativeWeyl splitTorus →* (Character splitTorus ≃ₗ[ℤ] Character splitTorus)
  weyl_faithful : Function.Injective weylAction
  weyl_value : ∀ (n : normalizer splitTorus) (χ : Character splitTorus)
    (t t' : subgroupPoints splitTorus (AlgebraicClosure F)),
    t'.val = (TauCeti.AlgHom.mapValue (Algebra.ofId F (AlgebraicClosure F)) n.val)⁻¹ *
      t.val * TauCeti.AlgHom.mapValue (Algebra.ofId F (AlgebraicClosure F)) n.val →
    characterValue splitTorus (weylAction (QuotientGroup.mk n) χ) _ t =
      characterValue splitTorus χ _ t'
  weyl_roots : ∀ w χ, weylAction w χ ∈ roots ↔ χ ∈ roots
  reflection : {χ // χ ∈ roots} → RelativeWeyl splitTorus
  reflection_apply : ∀ α χ,
    weylAction (reflection α) χ = χ - pairing.toLinearMap χ (pairing.coroot α) • α.val
  reflection_generates : Subgroup.closure (Set.range reflection) = ⊤
  simple : Finset (Character splitTorus)
  simple_subset : simple ⊆ roots
  simple_independent : LinearIndependent ℤ (fun α : {χ // χ ∈ simple} => α.val)
  positive : Finset (Character splitTorus)
  positive_eq : ∀ χ, χ ∈ positive ↔ χ ∈ roots ∧
    ∃ c : {χ // χ ∈ simple} → ℕ, χ = ∑ α, c α • α.val
  root_signed : ∀ χ ∈ roots, χ ∈ positive ∨ -χ ∈ positive
  positive_disjoint : ∀ χ ∈ positive, -χ ∉ positive

/-- The finite enumeration of roots has the canonical shared carrier; no root-index choice. -/
def RelativeRootData.rootEquiv (D : RelativeRootData F H) :
    {χ // χ ∈ D.roots} ≃ AlgebraicRelativeRoots.Root D.splitTorus where
  toFun a := ⟨a.val, (D.roots_eq a.val).1 a.property⟩
  invFun a := ⟨a.val, (D.roots_eq a.val).2 a.property⟩
  left_inv := fun _ => rfl
  right_inv := fun _ => rfl

/-- AA local factors and RG2 local factors use identical characters and adjoint weight spaces. -/
def localModulus (S : TauCeti.HopfIdeal F H)
    (positive : Finset (AlgebraicRelativeRoots.Root S)) (absValue : F → ℝ)
    (t : subgroupPoints S F) : ℝ :=
  ∏ a ∈ positive, absValue (characterValue S a.val F t) ^
    Module.finrank (AlgebraicClosure F) (relativeWeightSpace S a.val)

omit [Algebra.FiniteType F H] in
theorem localModulus_eq_rg2 (S : TauCeti.HopfIdeal F H)
    (positive : Finset (AlgebraicRelativeRoots.Root S)) (absValue : F → ℝ)
    (t : subgroupPoints S F) :
    localModulus S positive absValue t =
      AlgebraicRelativeRoots.localModulus S positive absValue t := rfl

-- Test localModulus_same_data
example (S : TauCeti.HopfIdeal F H)
    (positive : Finset (AlgebraicRelativeRoots.Root S)) (absValue : F → ℝ)
    (t : subgroupPoints S F) :
    localModulus S positive absValue t =
      AlgebraicRelativeRoots.localModulus S positive absValue t := rfl

-- Test localModulus_empty
example (S : TauCeti.HopfIdeal F H) (absValue : F → ℝ) (t : subgroupPoints S F) :
    localModulus S ∅ absValue t = 1 := by simp [localModulus]

-- Test localModulus_singleton
example (S : TauCeti.HopfIdeal F H) (a : AlgebraicRelativeRoots.Root S)
    (hm : Module.finrank (AlgebraicClosure F) (relativeWeightSpace S a.val) = 2)
    (absValue : F → ℝ) (t : subgroupPoints S F) :
    localModulus S {a} absValue t = absValue (characterValue S a.val F t) ^ 2 := by
  simp [localModulus, hm]

namespace RelativeRootData
variable (D : RelativeRootData F H)

abbrev X := Character (F := F) (H := H) D.splitTorus
abbrev W := RelativeWeyl (F := F) (H := H) D.splitTorus
abbrev Simple := {χ : D.X // χ ∈ D.simple}

/-- Multiplicity is dimension, not the cardinality of a chosen root index. -/
def multiplicity (χ : D.X) : ℕ :=
  Module.finrank (AlgebraicClosure F) (relativeWeightSpace (F := F) (H := H) D.splitTorus χ)

/-- A regular dominant cocharacter, zero on no root. The algebraic cocharacter is
specified by its pullback on every character of S. -/
def dominantCocharacter (D : RelativeRootData F H) : H →ₐc[F] LaurentPolynomial F := sorry

theorem dominantCocharacter_spec :
    (∀ a ∈ D.splitTorus.toIdeal, D.dominantCocharacter a = 0) ∧
    ∃ μ : Cocharacter (F := F) (H := H) D.splitTorus,
      (∀ α ∈ D.simple, 0 < μ α) ∧
      (∀ (χ : D.X) (a : H), Ideal.Quotient.mk D.splitTorus.toIdeal a = χ.toMul.val →
        D.dominantCocharacter a = LaurentPolynomial.T (μ χ)) := by sorry

-- Test Reduction.dominant_factors: no cocharacter outside the specified torus is admissible.
example (a : H) (ha : a ∈ D.splitTorus.toIdeal) : D.dominantCocharacter a = 0 := by sorry
-- Test Reduction.dominant_positive: a simple character pulls back to a strictly positive power.
example (α : D.Simple) (a : H) (ha : Ideal.Quotient.mk D.splitTorus.toIdeal a = α.val.toMul.val) :
    ∃ n : ℤ, 0 < n ∧ D.dominantCocharacter a = LaurentPolynomial.T n := by sorry
-- Test Reduction.dominant_nontrivial: the identity cocharacter fails when roots exist.
example (hs : D.simple.Nonempty) : ∃ a : H,
    D.dominantCocharacter a ≠ algebraMap F (LaurentPolynomial F) (Bialgebra.counitAlgHom F H a) := by sorry

theorem multiplicity_pos_iff (χ : D.X) (hχ : χ ≠ 0) :
    0 < D.multiplicity χ ↔ χ ∈ D.roots := by sorry

theorem multiplicity_weyl (w : D.W) (χ : D.X) :
    D.multiplicity (D.weylAction w χ) = D.multiplicity χ := by sorry

/-- The zero weight is the Lie algebra of the centralizer; it can be zero for G = 1. -/
theorem zeroWeight_dimension :
    D.multiplicity 0 = Module.finrank F (GaugeForm.cotangent F
      (H ⧸ (centralizerIdeal (F := F) (H := H) D.splitTorus).toIdeal)) := by
  sorry

end RelativeRootData

theorem exists_relativeRootData
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (S : TauCeti.HopfIdeal F H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal F H => TauCeti.splitTorusCommHopfAlgProperty F
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient (AdelicPoints.finiteTypeObj F H) I)) S) :
    ∃ R : RelativeRootData F H, R.splitTorus = S := by sorry

-- Test Reduction.relative_torus: no roots, but the one-dimensional zero weight remains.
example (D : RelativeRootData F (LaurentPolynomial F)) :
    D.roots = ∅ ∧ D.simple = ∅ ∧ Subsingleton D.W ∧ D.multiplicity 0 = 1 := by sorry

-- Test Reduction.relative_trivial: even the zero weight vanishes in dimension zero.
example (D : RelativeRootData F F) :
    D.roots = ∅ ∧ D.multiplicity 0 = 0 ∧ Subsingleton D.W := by sorry

-- Test Reduction.relative_gln: an actual diagonal torus, roots e_i-e_j and permutation Weyl group.
example (n : ℕ) : ∃ D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n),
    (∀ (R : Type) [CommRing R] [Algebra F R]
      (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐ[F] R)),
      g ∈ subgroupPoints D.splitTorus R ↔
        ∀ i j, i ≠ j → (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) R) i j = 0) ∧
    ∃ e : D.X ≃+ (Fin n → ℤ),
      (∀ χ, χ ∈ D.roots ↔ ∃ i j : Fin n, i ≠ j ∧
        e χ = Pi.single i 1 - Pi.single j 1) ∧
      (∀ χ ∈ D.roots, D.multiplicity χ = 1) ∧ Nonempty (D.W ≃* Equiv.Perm (Fin n)) := by
  sorry

-- Test Reduction.relative_sl2: the diagonal torus has two roots with one-dimensional spaces.
example : ∃ D : RelativeRootData F (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2),
    (∀ (R : Type) [CommRing R] [Algebra F R]
      (g : WithConv (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2 →ₐ[F] R)),
      g ∈ subgroupPoints D.splitTorus R ↔
        ∀ i j, i ≠ j → ((TauCeti.SpecialLinear.pointsMulEquiv F 2 (A := R)).toFun g : Matrix (Fin 2) (Fin 2) R) i j = 0) ∧
    ∃ α : D.X, α ≠ 0 ∧ D.roots = {α, -α} ∧ D.simple = {α} ∧
      D.multiplicity α = 1 ∧ D.multiplicity (-α) = 1 := by sorry

-- Test Reduction.centralizer_torus: the scheme centralizer and normalizer are the whole torus.
example (D : RelativeRootData F (LaurentPolynomial F)) :
    centralizerIdeal D.splitTorus = ⊥ ∧ centralizer D.splitTorus = ⊤ ∧
      normalizer D.splitTorus = ⊤ := by sorry

-- Test Reduction.centralizer_gl2: the diagonal centralizer is smaller than its normalizer.
example (D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2)) :
    centralizerIdeal D.splitTorus = D.splitTorus ∧ Nat.card D.W = 2 := by sorry

-- Test Reduction.centralizer_gl3: six Weyl elements, not the four standard parabolics.
example (D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 3)) :
    centralizerIdeal D.splitTorus = D.splitTorus ∧ Nat.card D.W = 6 := by sorry

-- Test Reduction.character_zero: additive zero is the constant unit character.
example (D : RelativeRootData F H) (t : subgroupPoints D.splitTorus (AlgebraicClosure F)) :
    characterValue D.splitTorus 0 _ t = 1 := by sorry

-- Test Reduction.character_inverse: the negative weight is the inverse character.
example (D : RelativeRootData F H) (χ : D.X)
    (t : subgroupPoints D.splitTorus (AlgebraicClosure F)) :
    characterValue D.splitTorus (-χ) _ t = (characterValue D.splitTorus χ _ t)⁻¹ := by sorry

-- Test Reduction.character_nontrivial: a nonzero character is detected on geometric points.
example (D : RelativeRootData F H) (χ : D.X) (hχ : χ ≠ 0) :
    ∃ t : subgroupPoints D.splitTorus (AlgebraicClosure F),
      characterValue D.splitTorus χ _ t ≠ 1 := by sorry

-- Test Reduction.rootGroup_zero: the unconstrained intersection at the zero character is top.
example (D : RelativeRootData F H) (R : Type) [CommRing R] [Algebra F R] :
    rootGroup D.splitTorus 0 R = ⊤ := by sorry

-- Test Reduction.rootGroup_upper: the positive GL2 root gives the upper additive subgroup.
example : ∃ (D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2)) (α : D.X),
    α ∈ D.roots ∧ ∀ (R : Type) [CommRing R] [Algebra F R] g,
      g ∈ rootGroup D.splitTorus α R ↔ ∃ x : R,
        (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) R) = !![1, x; 0, 1] := by sorry

-- Test Reduction.rootGroup_sign: opposite root-ray groups intersect only at the identity.
example (D : RelativeRootData F H) (α : D.X) (hα : α ∈ D.roots)
    (R : Type) [CommRing R] [Algebra F R] :
    rootGroup D.splitTorus α R ⊓ rootGroup D.splitTorus (-α) R = ⊥ := by sorry

-- Test Reduction.rootGroup_double: doubling a root leaves its contraction ray unchanged.
example (D : RelativeRootData F H) (α : D.X) (hα : α ∈ D.roots)
    (R : Type) [CommRing R] [Algebra F R] :
    rootGroup D.splitTorus (2 • α) R = rootGroup D.splitTorus α R := by sorry

/-- The algebraic parabolic functor represented by a dynamic cocharacter subgroup. -/
def IsRationalParabolic (I : TauCeti.HopfIdeal F H) : Prop :=
  ∃ ell : H →ₐc[F] LaurentPolynomial F,
    ∀ (R : Type) [CommRing R] [Algebra F R],
      subgroupPoints (H := H) I R = TauCeti.Cocharacter.parabolic R ell

/-- The three Hopf ideals represent exactly the three dynamic subgroup functors. -/
structure MinimalParabolic (D : RelativeRootData F H) where
  ideal : TauCeti.HopfIdeal F H
  decomposition : LeviDecomposition F H ideal
  parabolic_points : ∀ (R : Type) [CommRing R] [Algebra F R],
    subgroupPoints (H := H) ideal R =
      TauCeti.Cocharacter.parabolic R D.dominantCocharacter
  unipotent_points : ∀ (R : Type) [CommRing R] [Algebra F R],
    subgroupPoints (H := H) decomposition.N R =
      TauCeti.Cocharacter.unipotent R D.dominantCocharacter
  levi_points : ∀ (R : Type) [CommRing R] [Algebra F R],
    subgroupPoints (H := H) decomposition.M R =
      TauCeti.Cocharacter.levi R D.dominantCocharacter
  centralizer_eq : decomposition.M = centralizerIdeal
    (H := H) D.splitTorus

theorem exists_minimalParabolic (D : RelativeRootData F H) : Nonempty (MinimalParabolic D) := by
  sorry

/-- A standard parabolic is an algebraic parabolic containing the fixed minimal one.
The order on Hopf ideals reverses subgroup containment. -/
abbrev StandardParabolic {D : RelativeRootData F H} (P₀ : MinimalParabolic D) :=
  {I : TauCeti.HopfIdeal F H // IsRationalParabolic I ∧ I ≤ P₀.ideal}

namespace StandardParabolic
variable {D : RelativeRootData F H} {P₀ : MinimalParabolic D}

instance : PartialOrder (StandardParabolic P₀) where
  le P Q := Q.val ≤ P.val
  lt P Q := Q.val ≤ P.val ∧ ¬ P.val ≤ Q.val
  lt_iff_le_not_ge _ _ := Iff.rfl
  le_refl P := le_refl P.val
  le_trans P Q R hPQ hQR := le_trans hQR hPQ
  le_antisymm P Q hPQ hQP := Subtype.ext (le_antisymm hQP hPQ)

/-- The simple roots retained in the Levi are exactly those whose negative root group lies in P. -/
def subset (P : StandardParabolic P₀) : Finset D.Simple :=
  Finset.univ.filter fun α => ∀ (R : Type) [CommRing R] [Algebra F R],
    ∀ g ∈ rootGroup D.splitTorus (-α.val) R, g ∈ subgroupPoints P.val R

def decomposition (P : StandardParabolic P₀) : LeviDecomposition F H P.val := sorry

/-- The chosen Levi is the unique one containing the minimal Levi. -/
theorem decomposition_minimalLevi (P : StandardParabolic P₀) :
    P.decomposition.M ≤ P₀.decomposition.M := by sorry

/-- This uniqueness characterizes the choice of Levi and its radical. -/
theorem decomposition_unique (P : StandardParabolic P₀)
    (E : LeviDecomposition F H P.val) (hE : E.M ≤ P₀.decomposition.M) : E = P.decomposition := by
  sorry

theorem le_iff (P Q : StandardParabolic P₀) : P ≤ Q ↔ P.subset ⊆ Q.subset := by sorry

end StandardParabolic

/-- Classification by the simple roots of the Levi, with the subset map fixed above. -/
def standardParabolic_equiv_subsets {D : RelativeRootData F H} (P₀ : MinimalParabolic D) :
    StandardParabolic P₀ ≃ Finset D.Simple :=
  Equiv.ofBijective StandardParabolic.subset (by sorry)

theorem exists_unique_standard_conj {D : RelativeRootData F H} (P₀ : MinimalParabolic D)
    (I : TauCeti.HopfIdeal F H) (hI : IsRationalParabolic I) :
    ∃! P : StandardParabolic P₀, ∃ g : WithConv (H →ₐ[F] F),
      ∀ (R : Type) [CommRing R] [Algebra F R],
        (subgroupPoints (H := H) I R).map
          (MulAut.conj (TauCeti.AlgHom.mapValue (Algebra.ofId F R) g)).toMonoidHom =
            subgroupPoints P.val R := by sorry

-- Test Reduction.parabolic_torus: one standard parabolic, with zero unipotent radical.
example (D : RelativeRootData F (LaurentPolynomial F)) (P₀ : MinimalParabolic D) :
    P₀.ideal = ⊥ ∧ P₀.decomposition.M = ⊥ ∧
      P₀.decomposition.N = TauCeti.HopfIdeal.augmentation F (LaurentPolynomial F) ∧
      Nat.card (StandardParabolic P₀) = 1 := by sorry

-- Test Reduction.parabolic_gl2: the empty and full subsets give two parabolics.
example (D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2))
    (P₀ : MinimalParabolic D) : Nat.card (StandardParabolic P₀) = 2 := by sorry

-- Test Reduction.parabolic_gl3: rank two gives four, not six, standard parabolics.
example (D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 3))
    (P₀ : MinimalParabolic D) : Nat.card (StandardParabolic P₀) = 4 := by sorry

-- Test Reduction.parabolic_lower_borel: the lower Borel fails the containment test over Q.
example {D : RelativeRootData ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2)}
    (P₀ : MinimalParabolic D)
    (hupper : ∀ g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2 →ₐ[ℚ] ℚ),
      g ∈ subgroupPoints P₀.ideal ℚ ↔
        (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) ℚ) 1 0 = 0) :
    ∃ I : TauCeti.HopfIdeal ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2),
      IsRationalParabolic I ∧ ¬ I ≤ P₀.ideal ∧
      (∀ g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2 →ₐ[ℚ] ℚ),
        g ∈ subgroupPoints I ℚ ↔
          (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) ℚ) 0 1 = 0) := by sorry


namespace StandardParabolic
variable {D : RelativeRootData F H} {P₀ : MinimalParabolic D}

/-- Coordinate pullback for the actual inclusion of standard Levi groups. -/
def leviInclusion (P Q : StandardParabolic P₀) (h : P ≤ Q) :
    (H ⧸ Q.decomposition.M.toIdeal) →ₐc[F] (H ⧸ P.decomposition.M.toIdeal) := sorry

theorem leviInclusion_mk (P Q : StandardParabolic P₀) (h : P ≤ Q) (f : H) :
    leviInclusion P Q h (Ideal.Quotient.mk Q.decomposition.M.toIdeal f) =
      Ideal.Quotient.mk P.decomposition.M.toIdeal f := by sorry

/-- Restriction from a standard Levi to the chosen maximal split torus. -/
def restrictToSplit (P : StandardParabolic P₀) :
    (H ⧸ P.decomposition.M.toIdeal) →ₐc[F] (H ⧸ D.splitTorus.toIdeal) := sorry

theorem restrictToSplit_mk (P : StandardParabolic P₀) (f : H) :
    P.restrictToSplit (Ideal.Quotient.mk P.decomposition.M.toIdeal f) =
      Ideal.Quotient.mk D.splitTorus.toIdeal f := by sorry

/-- The canonical realization of a_P inside the real dual of X*(S₀). -/
def rootCoordinates (P : StandardParabolic P₀) :
    aP F H P.decomposition →ₗ[ℝ] (D.X →+ ℝ) := sorry

/-- Character evaluation and vanishing on the Levi roots uniquely determine the coordinates. -/
theorem rootCoordinates_iff (P : StandardParabolic P₀)
    (a : aP F H P.decomposition) (b : D.X →+ ℝ) :
    P.rootCoordinates a = b ↔
      (∀ χ : RationalCharacter F (H ⧸ P.decomposition.M.toIdeal),
        b (Additive.ofMul ⟨P.restrictToSplit χ.val,
          χ.isGroupLikeElem_val.map P.restrictToSplit⟩) = a (Additive.ofMul χ)) ∧
      (∀ α ∈ P.subset, b α.val = 0) := by sorry

-- Test Reduction.leviInclusion_identity: equal parabolics induce the identity on all coordinates.
example (P : StandardParabolic P₀) (a : H ⧸ P.decomposition.M.toIdeal) :
    leviInclusion P P le_rfl a = a := by sorry
-- Test Reduction.leviInclusion_generator: ambient coordinates pull back without an automorphism.
example (P Q : StandardParabolic P₀) (h : P ≤ Q) (a : H) :
    leviInclusion P Q h (Ideal.Quotient.mk Q.decomposition.M.toIdeal a) =
      Ideal.Quotient.mk P.decomposition.M.toIdeal a := by sorry
-- Test Reduction.leviInclusion_surjective: no coordinate of the smaller Levi is lost.
example (P Q : StandardParabolic P₀) (h : P ≤ Q) :
    Function.Surjective (leviInclusion P Q h) := by sorry

-- Test Reduction.restrict_generator: restriction retains the original torus coordinate.
example (P : StandardParabolic P₀) (a : H) :
    P.restrictToSplit (Ideal.Quotient.mk P.decomposition.M.toIdeal a) =
      Ideal.Quotient.mk D.splitTorus.toIdeal a := by sorry
-- Test Reduction.restrict_surjective: every regular function on the split torus occurs.
example (P : StandardParabolic P₀) : Function.Surjective P.restrictToSplit := by sorry
-- Test Reduction.restrict_proper: a strictly smaller torus forces a nonzero restriction kernel.
example (P : StandardParabolic P₀) (h : P.decomposition.M < D.splitTorus) :
    ¬ Function.Injective P.restrictToSplit := by sorry

-- Test Reduction.rootCoordinates_zero: zero character logarithm has zero torus coordinates.
example (P : StandardParabolic P₀) : P.rootCoordinates 0 = 0 := map_zero _
-- Test Reduction.rootCoordinates_character: actual Levi characters retain their value.
example (P : StandardParabolic P₀) (a : aP F H P.decomposition)
    (χ : RationalCharacter F (H ⧸ P.decomposition.M.toIdeal)) :
    P.rootCoordinates a (Additive.ofMul ⟨P.restrictToSplit χ.val,
      χ.isGroupLikeElem_val.map P.restrictToSplit⟩) = a (Additive.ofMul χ) := by sorry
-- Test Reduction.rootCoordinates_injective: central directions are not discarded.
example (P : StandardParabolic P₀) : Function.Injective P.rootCoordinates := by sorry

end StandardParabolic

variable {D : RelativeRootData F H} {P₀ : MinimalParabolic D}

/-- The projection dual to restriction of rational characters of the standard Levi groups. -/
def aPProjection (P Q : StandardParabolic P₀) (h : P ≤ Q) :
    aP F H P.decomposition →ₗ[ℝ] aP F H Q.decomposition :=
  RealCharacterSpace.map (StandardParabolic.leviInclusion P Q h)

/-- Inclusion induced by the split centres, characterized in the common torus coordinates. -/
def aPInclusion (P Q : StandardParabolic P₀) (h : P ≤ Q) :
    aP F H Q.decomposition →ₗ[ℝ] aP F H P.decomposition := sorry

theorem aPInclusion_coordinates (P Q : StandardParabolic P₀) (h : P ≤ Q)
    (a : aP F H Q.decomposition) :
    P.rootCoordinates (aPInclusion P Q h a) = Q.rootCoordinates a := by sorry

/-- A relative root is evaluated on the canonical split-centre inclusion. -/
def rootFunctional (P : StandardParabolic P₀) (α : D.X) :
    Module.Dual ℝ (aP F H P.decomposition) where
  toFun a := P.rootCoordinates a α
  map_add' := by sorry
  map_smul' := by sorry

/-- Duplicate restrictions are removed by Finset.image. -/
def simpleRoots (P : StandardParabolic P₀) : Finset (Module.Dual ℝ (aP F H P.decomposition)) :=
  (Finset.univ.filter fun α : D.Simple => α ∉ P.subset).image
    (fun α => rootFunctional P α.val)

/-- Half the sum of the weights on Lie N_P, with their adjoint multiplicities.
Positive Levi roots restrict to zero, so including them in this sum changes nothing. -/
def rho (P : StandardParabolic P₀) : Module.Dual ℝ (aP F H P.decomposition) :=
  (1 / 2 : ℝ) • ∑ α ∈ D.positive, (D.multiplicity α : ℝ) • rootFunctional P α

def positiveChamber (P : StandardParabolic P₀) : Set (aP F H P.decomposition) :=
  {a | ∀ α ∈ simpleRoots P, 0 < α a}

/-- Restricted simple roots are linearly independent; they span the full dual precisely
in the absence of a central rational-character direction. Arthur §5, pp. 24–25. -/
theorem simpleRoots_independent (P : StandardParabolic P₀) :
    LinearIndependent ℝ (fun α : {α // α ∈ simpleRoots P} => α.val) := by sorry

theorem simpleRoots_span (P : StandardParabolic P₀)
    (hchars : Subsingleton (RationalCharacter F H)) :
    Submodule.span ℝ (simpleRoots P : Set (Module.Dual ℝ (aP F H P.decomposition))) = ⊤ := by sorry

/-- The first coordinate is projection and the second removes its canonical central lift. -/
def aP_decomp (P Q : StandardParabolic P₀) (h : P ≤ Q) :
    aP F H P.decomposition ≃ₗ[ℝ]
      (aP F H Q.decomposition × LinearMap.ker (aPProjection P Q h)) := sorry

theorem aP_decomp_apply (P Q : StandardParabolic P₀) (h : P ≤ Q)
    (a : aP F H P.decomposition) :
    (aP_decomp P Q h a).1 = aPProjection P Q h a ∧
      ((aP_decomp P Q h a).2 : aP F H P.decomposition) =
        a - aPInclusion P Q h (aPProjection P Q h a) := by sorry

-- Test Reduction.chamber_torus: the central direction survives, with no inequalities or rho.
example (D : RelativeRootData F (LaurentPolynomial F)) (P₀ : MinimalParabolic D)
    (P : StandardParabolic P₀) :
    simpleRoots P = ∅ ∧ rho P = 0 ∧ positiveChamber P = Set.univ ∧
      LinearMap.ker (aPProjection P P (by rfl)) = ⊥ := by sorry

-- Test Reduction.chamber_gl2: root a-d, rho (a-d)/2, and the strict boundary at zero.
example (D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2))
    (P₀ : MinimalParabolic D) (P : StandardParabolic P₀) (hP : P.val = P₀.ideal) :
    ∃ α : D.X, D.simple = {α} ∧
      simpleRoots P = {rootFunctional P α} ∧
      rho P = (1 / 2 : ℝ) • rootFunctional P α ∧
      (∀ a, a ∈ positiveChamber P ↔ 0 < rootFunctional P α a) ∧
      (0 : aP F _ P.decomposition) ∉ positiveChamber P := by sorry

-- Test Reduction.chamber_gl3: the highest root alone misses one simple-root inequality.
example (D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 3))
    (P₀ : MinimalParabolic D) (P : StandardParabolic P₀) (hP : P.val = P₀.ideal) :
    ∃ α β : D.X, D.simple = {α, β} ∧ α ≠ β ∧
      ∃ a : aP F _ P.decomposition,
        rootFunctional P α a = -1 ∧ rootFunctional P β a = 2 ∧
        rootFunctional P (α + β) a = 1 ∧ a ∉ positiveChamber P := by sorry

-- Test Reduction.decomp_identity: the equal-parabolic decomposition has zero second coordinate.
example (P : StandardParabolic P₀) (a : aP F H P.decomposition) :
    (aP_decomp P P le_rfl a).1 = a ∧ (aP_decomp P P le_rfl a).2.val = 0 := by sorry

-- Test Reduction.decomp_kernel: a nonzero relative vector must not enter the quotient coordinate.
example (P Q : StandardParabolic P₀) (h : P ≤ Q)
    (a : LinearMap.ker (aPProjection P Q h)) :
    (aP_decomp P Q h a.val).1 = 0 ∧ (aP_decomp P Q h a.val).2.val = a.val := by sorry

-- Test Reduction.decomp_split: a lifted quotient vector has no relative component.
example (P Q : StandardParabolic P₀) (h : P ≤ Q) (a : aP F H Q.decomposition) :
    (aP_decomp P Q h (aPInclusion P Q h a)).1 = a ∧
      (aP_decomp P Q h (aPInclusion P Q h a)).2.val = 0 := by sorry

-- Test Reduction.projection_identity: both maps are identity and the relative summand is zero.
example (P : StandardParabolic P₀) :
    aPProjection P P (by rfl) = LinearMap.id ∧
      aPInclusion P P (by rfl) = LinearMap.id ∧
      LinearMap.ker (aPProjection P P (by rfl)) = ⊥ := by sorry

-- Test Reduction.projection_gl2: determinant is the sum; its central lift divides by two.
example (D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2))
    (P₀ : MinimalParabolic D) (P Q : StandardParabolic P₀)
    (hP : P.val = P₀.ideal) (hQ : Q.val = ⊥) (h : P ≤ Q) :
    ∃ (eP : aP F _ P.decomposition ≃ₗ[ℝ] (Fin 2 → ℝ))
      (eQ : aP F _ Q.decomposition ≃ₗ[ℝ] ℝ),
      (∀ a, eQ (aPProjection P Q h a) = eP a 0 + eP a 1) ∧
      (∀ b, eP (aPInclusion P Q h b) = fun _ => eQ b / 2) ∧
      Module.finrank ℝ (LinearMap.ker (aPProjection P Q h)) = 1 := by sorry

-- Test Reduction.projection_full_semisimple: a_G is zero for SL2.
example (D : RelativeRootData F (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2))
    (P₀ : MinimalParabolic D) (P Q : StandardParabolic P₀) (hQ : Q.val = ⊥)
    (h : P ≤ Q) : aPProjection P Q h = 0 ∧
      LinearMap.ker (aPProjection P Q h) = ⊤ := by sorry


namespace SU3
variable (F E : Type) [Field F] [Field E] [Algebra F E]
  [Module.Finite F E] [Module.Free F E]

abbrev Ambient := WeilRestriction.ResHopf F E (TauCeti.GeneralLinear.coordinateHopfAlgebra E 3)
instance : Algebra.FiniteType F (Ambient F E) := by sorry

/-- The antidiagonal hermitian form with middle coefficient one. -/
def form (R : Type) [CommRing R] : Matrix (Fin 3) (Fin 3) R :=
  fun i j => if i.val + j.val = 2 then 1 else 0

/-- The defining unitary and determinant equations, as a Hopf ideal of Res(GL₃). -/
def ideal (τ : E ≃ₐ[F] E) : TauCeti.HopfIdeal F (Ambient F E) := sorry

theorem ideal_points (τ : E ≃ₐ[F] E) (R : Type) [CommRing R] [Algebra F R]
    (g : WithConv (Ambient F E →ₐ[F] R)) :
    g ∈ subgroupPoints (ideal F E τ) R ↔
      let A := (TauCeti.GeneralLinear.pointsMulEquiv 3
        (WeilRestriction.pointsMulEquiv F E _ R g) : Matrix (Fin 3) (Fin 3) (E ⊗[F] R))
      A.det = 1 ∧
        (A.map (Algebra.TensorProduct.map τ.toAlgHom (AlgHom.id F R))).transpose *
          form (E ⊗[F] R) * A = form (E ⊗[F] R) := by sorry

-- Test Reduction.SU3.identity: the identity matrix preserves the defining form.
example : (1 : Matrix (Fin 3) (Fin 3) E).transpose * form E * 1 = form E := by simp

-- Test Reduction.SU3.diagonal: the split cocharacter is (t,1,t^-1), not (t,1,t).
example (t : Fˣ) :
    let A : Matrix (Fin 3) (Fin 3) F := Matrix.diagonal ![(t : F), 1, (t⁻¹ : Fˣ)]
    A.transpose * form F * A = form F ∧ A.det = 1 := by sorry

-- Test Reduction.SU3.not_scalar: scalar two does not preserve the form in characteristic zero.
example [CharZero F] :
    (2 : Matrix (Fin 3) (Fin 3) F).transpose * form F * 2 ≠ form F := by sorry

/-- The quasi-split special unitary group over a quadratic extension. -/
abbrev Coordinate (τ : E ≃ₐ[F] E) := Ambient F E ⧸ (ideal F E τ).toIdeal

-- Test Reduction.relative_su3: BC1, including the long root, with multiplicities 2 and 1.
-- This applies in particular to unramified quadratic extensions of characteristic-zero local fields.
example [CharZero F] (τ : E ≃ₐ[F] E) (hτ : τ ≠ AlgEquiv.refl)
    (hquadratic : Module.finrank F E = 2) :
    ∃ D : RelativeRootData F (Coordinate F E τ),
      ∃ e : D.X ≃+ ℤ,
        (∀ χ, χ ∈ D.roots ↔ e χ ∈ ({-2, -1, 1, 2} : Finset ℤ)) ∧
        D.simple = {e.symm 1} ∧
        D.multiplicity (e.symm 1) = 2 ∧ D.multiplicity (e.symm 2) = 1 ∧
        D.multiplicity (e.symm (-1)) = 2 ∧ D.multiplicity (e.symm (-2)) = 1 ∧
        Nat.card D.W = 2 := by sorry

end SU3

end RelativeRoots


section AdelicIwasawa
open GeometricRoots AdelicPoints
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H]
  [HopfAlgebra F H] [Algebra.FiniteType F H]
  {D : RelativeRootData F H} (P₀ : MinimalParabolic D)

/-- The canonical inclusion of a closed subgroup on adelic points. -/
abbrev subgroupEmbed (I : TauCeti.HopfIdeal F H) :
    AdelicPoints F (H ⧸ I.toIdeal) →* AdelicPoints F H :=
  TauCeti.AlgHom.mapDomain (Bialgebra.Quotient.mkBialgHom I.toIdeal)

/-- Positive real split component of the actual standard Levi, embedded in G(𝔸). -/
def StandardParabolic.A (P : StandardParabolic P₀) : Subgroup (AdelicPoints F H) :=
  (SplitComponent F (H ⧸ P.decomposition.M.toIdeal)).map (subgroupEmbed P.decomposition.M)

-- Test Reduction.subgroupEmbed_one: the closed inclusion preserves the identity.
example (I : TauCeti.HopfIdeal F H) : subgroupEmbed I 1 = 1 := map_one _
-- Test Reduction.subgroupEmbed_eval: an ambient function is evaluated through its quotient class.
example (I : TauCeti.HopfIdeal F H) (g : AdelicPoints F (H ⧸ I.toIdeal)) (a : H) :
    (subgroupEmbed I g).ofConv a = g.ofConv (Ideal.Quotient.mk I.toIdeal a) := rfl
-- Test Reduction.subgroupEmbed_injective: a closed inclusion identifies no distinct points.
example (I : TauCeti.HopfIdeal F H) : Function.Injective (subgroupEmbed I) := by sorry

-- Test Reduction.splitA_identity: the split component contains the identity.
example (P : StandardParabolic P₀) : (1 : AdelicPoints F H) ∈ P.A := P.A.one_mem
-- Test Reduction.splitA_finite: a positive real split point has no finite component.
example (P : StandardParabolic P₀) (a : P.A) : finiteProjection F H a.val = 1 := by sorry
-- Test Reduction.splitA_recovery: the embedded point uniquely determines its split-Levi preimage.
example (P : StandardParabolic P₀) (a : P.A) :
    ∃! b : SplitComponent F (H ⧸ P.decomposition.M.toIdeal),
      subgroupEmbed P.decomposition.M b.val = a.val := by sorry

/-- The canonical tensor-point comparison at a finite place. -/
def localBaseChangePoints (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    WithConv ((v.adicCompletion F ⊗[F] H) →ₐ[v.adicCompletion F] v.adicCompletion F) ≃*
      LocalPoints F H v := sorry

theorem localBaseChangePoints_apply
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g : WithConv ((v.adicCompletion F ⊗[F] H) →ₐ[v.adicCompletion F] v.adicCompletion F)) (h : H) :
    (localBaseChangePoints v g).ofConv h = g.ofConv (1 ⊗ₜ[F] h) := by sorry

-- Test Reduction.baseChange_identity: tensor evaluation preserves the identity point.
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    localBaseChangePoints (H := H) v 1 = 1 := by simp

-- Test Reduction.baseChange_scalar: the inverse extends g by a⊗h ↦ a*g(h).
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g : LocalPoints F H v) (a : v.adicCompletion F) (h : H) :
    ((localBaseChangePoints v).symm g).ofConv (a ⊗ₜ[F] h) = a * g.ofConv h := by sorry

-- Test Reduction.baseChange_injective: distinct local points remain distinct after extension.
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g h : LocalPoints F H v) (hne : g ≠ h) :
    (localBaseChangePoints v).symm g ≠ (localBaseChangePoints v).symm h := by
  exact (localBaseChangePoints v).symm.injective.ne hne

/-- Admissibility includes local good position and integral compatibility. Specialness is
expressed by compact representatives for the entire local relative Weyl group at a maximal
split torus containing S₀. Maximality rules out Iwahori subgroups. Arthur §4, pp. 23–24. -/
structure AdmissibleCompact where
  infiniteK : Subgroup (InfinitePoints F H)
  infinite_maximal : Maximal (fun K : Subgroup (InfinitePoints F H) => IsCompact K.carrier) infiniteK
  finiteK : ∀ v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F),
    Subgroup (LocalPoints F H v)
  finite_maximal : ∀ v, Maximal (fun K : Subgroup (LocalPoints F H v) => IsCompact K.carrier) (finiteK v)
  localRoots : ∀ v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F),
    RelativeRootData (v.adicCompletion F) (v.adicCompletion F ⊗[F] H)
  contains_split : ∀ (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (s : ↥(subgroupPoints D.splitTorus (v.adicCompletion F))),
    (localBaseChangePoints v).symm s.val ∈ subgroupPoints (localRoots v).splitTorus (v.adicCompletion F)
  special : ∀ v (w : (localRoots v).W),
    ∃ n : normalizer (localRoots v).splitTorus,
      QuotientGroup.mk n = w ∧ localBaseChangePoints v n.val ∈ finiteK v
  bad : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
  model : IntegralModel F H bad
  model_reductive : model.IsReductive
  integral_eq : ∀ v : {v // v ∉ bad}, finiteK v.val = model.localPoints v
  infinite_good_position : ∀ P : StandardParabolic P₀,
    (infiniteK ⊓ subgroupPoints P.val (NumberField.InfiniteAdeleRing F)).carrier =
      (infiniteK ⊓ subgroupPoints P.decomposition.N (NumberField.InfiniteAdeleRing F)).carrier *
      (infiniteK ⊓ subgroupPoints P.decomposition.M (NumberField.InfiniteAdeleRing F)).carrier
  finite_good_position : ∀ (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (P : StandardParabolic P₀),
    (finiteK v ⊓ subgroupPoints P.val (v.adicCompletion F)).carrier =
      (finiteK v ⊓ subgroupPoints P.decomposition.N (v.adicCompletion F)).carrier *
      (finiteK v ⊓ subgroupPoints P.decomposition.M (v.adicCompletion F)).carrier

namespace AdmissibleCompact
variable {P₀}

def toSubgroup (K : AdmissibleCompact P₀) : Subgroup (AdelicPoints F H) :=
  K.infiniteK.comap (infiniteProjection F H) ⊓ ⨅ v, (K.finiteK v).comap (proj F H v)

theorem isCompact (K : AdmissibleCompact P₀) : IsCompact (K.toSubgroup : Set (AdelicPoints F H)) := by
  sorry

theorem maximal (K : AdmissibleCompact P₀) :
    Maximal (fun J : Subgroup (AdelicPoints F H) => IsCompact J.carrier) K.toSubgroup := by sorry

theorem «exists» : Nonempty (AdmissibleCompact P₀) := by sorry

/-- Local Iwasawa is a consequence of admissibility, not a field of the carrier.
Arthur §4, pp. 23–24. -/
theorem infinite_iwasawa (K : AdmissibleCompact P₀) :
    (subgroupPoints P₀.ideal (NumberField.InfiniteAdeleRing F)).carrier *
      K.infiniteK.carrier = Set.univ := by sorry

theorem finite_iwasawa (K : AdmissibleCompact P₀)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    (subgroupPoints P₀.ideal (v.adicCompletion F)).carrier *
      (K.finiteK v).carrier = Set.univ := by sorry

end AdmissibleCompact

variable {P₀}

/-- Restricted-product Iwasawa, with the positive split component separated from norm-one Levi points. -/
theorem adelic_iwasawa (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (x : AdelicPoints F H) :
    ∃ (n : AdelicPoints F (H ⧸ P.decomposition.N.toIdeal))
      (m : normOne F (H ⧸ P.decomposition.M.toIdeal))
      (a : SplitComponent F (H ⧸ P.decomposition.M.toIdeal)) (k : K.toSubgroup),
      x = subgroupEmbed P.decomposition.N n *
        subgroupEmbed P.decomposition.M m.val * subgroupEmbed P.decomposition.M a.val * k.val := by
  sorry

/-- Openness, as well as surjectivity, of the actual multiplication map. -/
theorem adelic_iwasawa_open (P : StandardParabolic P₀) (K : AdmissibleCompact P₀) :
    IsOpenMap (fun x : AdelicPoints F (H ⧸ P.decomposition.N.toIdeal) ×
      normOne F (H ⧸ P.decomposition.M.toIdeal) ×
      SplitComponent F (H ⧸ P.decomposition.M.toIdeal) × K.toSubgroup =>
        subgroupEmbed P.decomposition.N x.1 * subgroupEmbed P.decomposition.M x.2.1.val *
          subgroupEmbed P.decomposition.M x.2.2.1.val * x.2.2.2.val) := by sorry

theorem integral_iwasawa (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (v : {v // v ∉ K.bad}) :
    (K.model.localPoints v ⊓ subgroupPoints P.val (v.val.adicCompletion F)).carrier =
      (K.model.localPoints v ⊓ subgroupPoints P.decomposition.N (v.val.adicCompletion F)).carrier *
        (K.model.localPoints v ⊓ subgroupPoints P.decomposition.M (v.val.adicCompletion F)).carrier := by sorry

/-- At a good integral place, a parabolic product is integral exactly when both Levi
coordinates are integral. Uniqueness of the algebraic Levi decomposition is essential. -/
theorem integral_levi_factors (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ K.bad})
    (n m : LocalPoints F H v.val)
    (hn : n ∈ subgroupPoints P.decomposition.N (v.val.adicCompletion F))
    (hm : m ∈ subgroupPoints P.decomposition.M (v.val.adicCompletion F)) :
    n * m ∈ K.model.localPoints v ↔
      n ∈ K.model.localPoints v ∧ m ∈ K.model.localPoints v := by sorry

/-- The adjoint Jacobian on the Levi, with positive-root multiplicities. -/
def leviModulus (P : StandardParabolic P₀)
    (m : AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)) : ℝ :=
  Real.exp (2 * rho P (Multiplicative.toAdd (logHeight F _ m)))

/-- Multiplication into the represented parabolic, with the inherited point topology. -/
def parabolicProduct (P : StandardParabolic P₀)
    (x : AdelicPoints F (H ⧸ P.decomposition.N.toIdeal) ×
      AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)) :
    subgroupPoints P.val (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :=
  ⟨subgroupEmbed P.decomposition.N x.1 * subgroupEmbed P.decomposition.M x.2, by sorry⟩

theorem parabolic_haar_jacobian (P : StandardParabolic P₀)
    (dn : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.N.toIdeal)))
    (dm : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)))
    [dn.IsHaarMeasure] [dm.IsHaarMeasure] :
    (MeasureTheory.Measure.map (parabolicProduct P)
      ((dn.prod dm).withDensity (fun x => ENNReal.ofReal (leviModulus P x.2)⁻¹))).IsHaarMeasure ∧
    (MeasureTheory.Measure.map (parabolicProduct P) (dn.prod dm)).IsMulRightInvariant := by sorry

theorem parabolic_modularCharacter (P : StandardParabolic P₀)
    (n : AdelicPoints F (H ⧸ P.decomposition.N.toIdeal))
    (m : AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)) :
    letI : LocallyCompactSpace
      (subgroupPoints P.val (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) := by sorry
    ((MeasureTheory.Measure.modularCharacter (parabolicProduct P (n, m))) : ℝ) =
      leviModulus P m := by sorry

-- Test Reduction.parabolicProduct_identity: coordinates (1,1) multiply to one.
example (P : StandardParabolic P₀) : parabolicProduct P (1, 1) = 1 := by sorry

-- Test Reduction.parabolicProduct_unique: the N and M factors cannot be shifted arbitrarily.
example (P : StandardParabolic P₀) : Function.Bijective (parabolicProduct P) := by sorry

-- Test Reduction.parabolicProduct_noncommuting: the product uses the order N then M.
example (P : StandardParabolic P₀)
    (n : AdelicPoints F (H ⧸ P.decomposition.N.toIdeal))
    (m : AdelicPoints F (H ⧸ P.decomposition.M.toIdeal))
    (h : ¬ Commute (subgroupEmbed P.decomposition.N n) (subgroupEmbed P.decomposition.M m)) :
    (parabolicProduct P (n, m)).val ≠
      subgroupEmbed P.decomposition.M m * subgroupEmbed P.decomposition.N n := by sorry

-- Test Reduction.parabolicProduct_gl2_order: n(1)m(2,1) and m(2,1)n(1) differ.
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![2, 0; 0, 1] =
    !![2, 1; 0, 1] ∧
    (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 1; 0, 1] =
    !![2, 2; 0, 1] := by norm_num [Matrix.mul_apply, Fin.sum_univ_two]

-- Test Reduction.integral_parabolic_not_compact: the Weyl matrix is integral but not upper triangular.
example : (!![0, -1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ).det = 1 ∧
    (!![0, -1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) 1 0 ≠ 0 := by norm_num [Matrix.det_fin_two]

/-- Haar measure normalized by the selected Haar measures on N, M and K. -/
def iwasawaMeasure (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (dn : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.N.toIdeal)))
    (dm : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)))
    (dk : MeasureTheory.Measure K.toSubgroup) : MeasureTheory.Measure (AdelicPoints F H) :=
  MeasureTheory.Measure.map
    (fun x => subgroupEmbed P.decomposition.N x.1 *
      subgroupEmbed P.decomposition.M x.2.1 * x.2.2.val)
    ((dn.prod (dm.prod dk)).withDensity (fun x => ENNReal.ofReal (leviModulus P x.2.1)⁻¹))

theorem iwasawaMeasure_isHaar (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (dn : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.N.toIdeal)))
    (dm : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)))
    (dk : MeasureTheory.Measure K.toSubgroup)
    [dn.IsHaarMeasure] [dm.IsHaarMeasure] [dk.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure dk] :
    (iwasawaMeasure P K dn dm dk).IsHaarMeasure := by sorry

theorem iwasawa_integral (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (dn : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.N.toIdeal)))
    (dm : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)))
    (dk : MeasureTheory.Measure K.toSubgroup)
    [dn.IsHaarMeasure] [dm.IsHaarMeasure] [dk.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure dk]
    (f : AdelicPoints F H → ℝ) (hf : MeasureTheory.Integrable f (iwasawaMeasure P K dn dm dk)) :
    (∫ g, f g ∂(iwasawaMeasure P K dn dm dk)) =
      ∫ k, ∫ m, ∫ n, f (subgroupEmbed P.decomposition.N n *
        subgroupEmbed P.decomposition.M m * k.val) / leviModulus P m ∂dn ∂dm ∂dk := by sorry

theorem iwasawa_integral_right_invariant (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (dn : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.N.toIdeal)))
    (dm : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)))
    (dk : MeasureTheory.Measure K.toSubgroup)
    [dn.IsHaarMeasure] [dm.IsHaarMeasure] [dk.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure dk]
    (g : AdelicPoints F H) :
    MeasureTheory.Measure.map (· * g) (iwasawaMeasure P K dn dm dk) =
      iwasawaMeasure P K dn dm dk := by sorry

-- Test Reduction.jacobian_torus: a torus has no root Jacobian.
example (D : RelativeRootData F (LaurentPolynomial F)) (P₀ : MinimalParabolic D)
    (P : StandardParabolic P₀) (m : AdelicPoints F (_ ⧸ P.decomposition.M.toIdeal)) :
    leviModulus P m = 1 := by sorry

-- Test Reduction.jacobian_gl2: root log 2 gives delta=2, hence density 1/2.
example (D : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2))
    (P₀ : MinimalParabolic D) (P : StandardParabolic P₀) (hP : P.val = P₀.ideal)
    (α : D.X) (hα : D.simple = {α})
    (m : AdelicPoints F (_ ⧸ P.decomposition.M.toIdeal))
    (hm : rootFunctional P α (Multiplicative.toAdd (logHeight F _ m)) = Real.log 2) :
    leviModulus P m = 2 ∧ (leviModulus P m)⁻¹ = 1 / 2 := by sorry

-- Test Reduction.jacobian_inverse: inversion reverses the density, not its sign.
example (P : StandardParabolic P₀) (m : AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)) :
    0 < leviModulus P m ∧ leviModulus P m⁻¹ = (leviModulus P m)⁻¹ := by sorry

/-- The Harish-Chandra projection for a fixed admissible K. -/
def HP (P : StandardParabolic P₀) (K : AdmissibleCompact P₀) :
    AdelicPoints F H → aP F H P.decomposition := sorry

/-- This equation determines HP on all of G(𝔸) by Iwasawa surjectivity. -/
theorem HP_nmk (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (n : AdelicPoints F (H ⧸ P.decomposition.N.toIdeal))
    (m : AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)) (k : K.toSubgroup) :
    HP P K (subgroupEmbed P.decomposition.N n * subgroupEmbed P.decomposition.M m * k.val) =
      Multiplicative.toAdd (logHeight F (H ⧸ P.decomposition.M.toIdeal) m) := by sorry

theorem HP_left_P (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (p : AdelicPoints F (H ⧸ P.val.toIdeal)) (x : AdelicPoints F H) :
    HP P K (subgroupEmbed P.val p * x) = HP P K (subgroupEmbed P.val p) + HP P K x := by sorry

theorem HP_rational (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (γ : WithConv ((H ⧸ P.val.toIdeal) →ₐ[F] F)) (x : AdelicPoints F H) :
    HP P K (subgroupEmbed P.val (diagonal F _ γ) * x) = HP P K x := by sorry

theorem continuous_HP (P : StandardParabolic P₀) (K : AdmissibleCompact P₀) :
    Continuous (HP P K) := by sorry

/-- Compact-window Siegel sets; the root inequalities are strict. -/
def siegelSet (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (T : aP F H P.decomposition) (ω : Set (AdelicPoints F H)) : Set (AdelicPoints F H) :=
  {x | ∃ p ∈ ω, ∃ a : P.A, ∃ k : K.toSubgroup,
    x = p * a.val * k.val ∧ HP P K a.val - T ∈ positiveChamber P}

theorem mem_siegelSet (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (T : aP F H P.decomposition) (ω : Set (AdelicPoints F H)) (x : AdelicPoints F H) :
    x ∈ siegelSet P K T ω ↔ ∃ p ∈ ω, ∃ a : P.A, ∃ k : K.toSubgroup,
      x = p * a.val * k.val ∧ ∀ α ∈ simpleRoots P, α T < α (HP P K a.val) := by sorry

theorem siegelSet_mono (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (T T' : aP F H P.decomposition) (ω ω' : Set (AdelicPoints F H))
    (hω : ω ⊆ ω') (hT : ∀ α ∈ simpleRoots P, α T' ≤ α T) :
    siegelSet P K T ω ⊆ siegelSet P K T' ω' := by sorry

theorem siegelSet_mul_K (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (T : aP F H P.decomposition) (ω : Set (AdelicPoints F H)) :
    siegelSet P K T ω * (K.toSubgroup : Set _) = siegelSet P K T ω := by sorry

theorem siegelSet_center (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (T : aP F H P.decomposition) (ω : Set (AdelicPoints F H)) :
    siegelSet P K T ω * (SplitComponent F H : Set _) = siegelSet P K T ω := by sorry

/-- The window belongs to N(𝔸)M(𝔸)^1; compactness is a separate hypothesis. -/
def windowSubgroup (P : StandardParabolic P₀) : Set (AdelicPoints F H) :=
  Set.range (subgroupEmbed P.decomposition.N) *
    (subgroupEmbed P.decomposition.M '' (normOne F (H ⧸ P.decomposition.M.toIdeal) : Set _))

-- Test Reduction.window_identity: the window carrier always contains one.
example (P : StandardParabolic P₀) : (1 : AdelicPoints F H) ∈ windowSubgroup P := by sorry

-- Test Reduction.window_height_zero: every window point has height zero for every admissible K.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀) (x : AdelicPoints F H)
    (hx : x ∈ windowSubgroup P) : HP P K x = 0 := by sorry

-- Test Reduction.window_excludes_split: nonzero split height is not a window coordinate.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (a : SplitComponent F (H ⧸ P.decomposition.M.toIdeal))
    (ha : Multiplicative.toAdd (logHeight F _ a.val) ≠ 0) :
    subgroupEmbed P.decomposition.M a.val ∉ windowSubgroup P := by sorry

theorem siegel_covering (P : StandardParabolic P₀) (hP : P.val = P₀.ideal)
    (K : AdmissibleCompact P₀) :
    ∃ T ω, IsCompact ω ∧ ω ⊆ windowSubgroup P ∧
      Set.range (diagonal F H) * siegelSet P K T ω = Set.univ := by sorry

theorem siegel_finite_overlap (P : StandardParabolic P₀) (hP : P.val = P₀.ideal)
    (K : AdmissibleCompact P₀) (T : aP F H P.decomposition)
    (ω : Set (AdelicPoints F H)) (hω : IsCompact ω) (hwindow : ω ⊆ windowSubgroup P) :
    {γ : WithConv (H →ₐ[F] F) | ((fun x => diagonal F H γ * x) '' siegelSet P K T ω ∩
      siegelSet P K T ω).Nonempty}.Finite := by sorry

theorem siegel_finite_measure (P : StandardParabolic P₀) (hP : P.val = P₀.ideal)
    (K : AdmissibleCompact P₀) (T : aP F H P.decomposition)
    (ω : Set (AdelicPoints F H)) (hω : IsCompact ω) (hwindow : ω ⊆ windowSubgroup P)
    (μ : MeasureTheory.Measure (normOne F H)) [μ.IsHaarMeasure] :
    μ {x | x.val ∈ siegelSet P K T ω} < ⊤ := by sorry

-- Test Reduction.iwasawa_zero_measure: a zero N measure gives the zero measure.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (dm : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)))
    (dk : MeasureTheory.Measure K.toSubgroup) : iwasawaMeasure P K 0 dm dk = 0 := by sorry

-- Test Reduction.iwasawa_scaling: doubling dn doubles the resulting normalization.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (dn : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.N.toIdeal)))
    (dm : MeasureTheory.Measure (AdelicPoints F (H ⧸ P.decomposition.M.toIdeal)))
    (dk : MeasureTheory.Measure K.toSubgroup) :
    iwasawaMeasure P K (2 • dn) dm dk = 2 • iwasawaMeasure P K dn dm dk := by sorry

-- Test Reduction.iwasawa_identity_mass: three point masses give the point mass at one.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀) :
    iwasawaMeasure P K (MeasureTheory.Measure.dirac 1) (MeasureTheory.Measure.dirac 1)
      (MeasureTheory.Measure.dirac 1) = MeasureTheory.Measure.dirac 1 := by sorry

-- Test Reduction.HP_compact: every compact factor has projection zero.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀) (k : K.toSubgroup) :
    HP P K k = 0 := by sorry

-- Test Reduction.HP_split: positive real split coordinates are retained exactly.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (a : SplitComponent F (H ⧸ P.decomposition.M.toIdeal)) :
    HP P K (subgroupEmbed P.decomposition.M a.val) =
      Multiplicative.toAdd (logHeight F _ a.val) := by sorry

-- Test Reduction.HP_rational_parabolic: a rational Levi translate leaves every projection unchanged.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀)
    (m : WithConv ((H ⧸ P.decomposition.M.toIdeal) →ₐ[F] F)) (x : AdelicPoints F H) :
    HP P K (subgroupEmbed P.decomposition.M (diagonal F _ m) * x) = HP P K x := by sorry

-- Test Reduction.siegel_empty: an empty window gives an empty set even when there are no roots.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀) (T : aP F H P.decomposition) :
    siegelSet P K T ∅ = ∅ := by sorry

-- Test Reduction.siegel_boundary: identity lies in the singleton-window set exactly below all walls.
example (P : StandardParabolic P₀) (K : AdmissibleCompact P₀) (T : aP F H P.decomposition) :
    (1 : AdelicPoints F H) ∈ siegelSet P K T {1} ↔ ∀ α ∈ simpleRoots P, α T < 0 := by sorry

-- Test Reduction.siegel_torus: empty root inequalities leave the window A K, not all ideles.
example (D : RelativeRootData ℚ (LaurentPolynomial ℚ)) (P₀ : MinimalParabolic D)
    (P : StandardParabolic P₀) (K : AdmissibleCompact P₀) (T : aP ℚ _ P.decomposition) :
    siegelSet P K T {1} = (P.A : Set _) * (K.toSubgroup : Set _) ∧
      siegelSet P K T {1} ≠ Set.univ := by sorry

-- Test Reduction.admissible_trivial: the only compact is the entire trivial group.
example (D : RelativeRootData F F) (P₀ : MinimalParabolic D) (K : AdmissibleCompact P₀) :
    K.toSubgroup = ⊤ := by sorry

-- Test Reduction.admissible_not_proper: proper subgroups of a compact subgroup cannot be maximal.
example (K : AdmissibleCompact P₀) (J : Subgroup (AdelicPoints F H))
    (hJ : IsCompact J.carrier) : ¬ K.toSubgroup < J := by sorry

end AdelicIwasawa

section MatrixChecks
open AdelicPoints GeometricRoots

/-- Evaluation of the infinite component at the unique real place of Q. -/
def realMatrix (n : ℕ) (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal) :
    InfinitePoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) →* GL (Fin n) ℝ :=
  (Matrix.GeneralLinearGroup.map
    ((NumberField.InfinitePlace.Completion.ringEquivRealOfIsReal hw).toRingHom.comp
      (Pi.evalRingHom (fun v : NumberField.InfinitePlace ℚ => v.Completion) w))).comp
    (TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) (A := NumberField.InfiniteAdeleRing ℚ) n).toMonoidHom

-- Test Reduction.admissible_gln: the ordinary orthogonal/integral compact actually exists.
example (n : ℕ) (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal) :
    ∃ (D : RelativeRootData ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n))
      (P₀ : MinimalParabolic D) (K : AdmissibleCompact P₀),
      (∀ g, g ∈ K.infiniteK ↔
        (realMatrix n w hw g : Matrix (Fin n) (Fin n) ℝ).transpose *
          (realMatrix n w hw g : Matrix (Fin n) (Fin n) ℝ) = 1) ∧
      (∀ v, K.finiteK v = (IntegralModel.standardGLn (F := ℚ) (S := ∅) n).localPoints
        ⟨v, by simp⟩) ∧
      (∀ (R : Type) [CommRing R] [Algebra ℚ R] g,
        g ∈ subgroupPoints P₀.ideal R ↔ ∀ i j : Fin n, j < i →
          (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) R) i j = 0) := by sorry

variable {D : RelativeRootData ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2)}
  {P₀ : MinimalParabolic D} (P : StandardParabolic P₀) (hP : P.val = P₀.ideal)
  (K : AdmissibleCompact P₀) (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal)
  (hupper : ∀ g : InfinitePoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2),
    g ∈ subgroupPoints P₀.ideal (NumberField.InfiniteAdeleRing ℚ) ↔
      (realMatrix 2 w hw g : Matrix (Fin 2) (Fin 2) ℝ) 1 0 = 0)
  (horthogonal : ∀ g, g ∈ K.infiniteK ↔
    (realMatrix 2 w hw g : Matrix (Fin 2) (Fin 2) ℝ).transpose *
      (realMatrix 2 w hw g : Matrix (Fin 2) (Fin 2) ℝ) = 1)

-- Test Reduction.admissible_not_iwahori: upper triangular reduction is too small, even at p=2.
example {F : Type} [Field F] [NumberField F]
    {D' : RelativeRootData F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2)}
    {P₀' : MinimalParabolic D'} (K' : AdmissibleCompact P₀')
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    (K'.finiteK v).carrier ≠ {g : LocalPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2) v |
      g ∈ (IntegralModel.standardGLn (F := F) (S := ∅) 2).localPoints ⟨v, by simp⟩ ∧
      ‖(TauCeti.GeneralLinear.pointsMulEquiv (R := F) (A := v.adicCompletion F) 2 g :
        Matrix (Fin 2) (Fin 2) (v.adicCompletion F)) 1 0‖ < 1} := by sorry

include hP hupper horthogonal

-- Test Reduction.HP_gl2_diagonal: H_P in the simple-root coordinate is log y.
example (y : ℝ) (hy : 0 < y)
    (g : InfinitePoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2))
    (hg : (realMatrix 2 w hw g : Matrix (Fin 2) (Fin 2) ℝ) = !![y, 0; 0, 1]) :
    2 * rho P (HP P K (infiniteEmbed ℚ _ g)) = Real.log y := by sorry

-- Test Reduction.HP_gl2_weyl: the orthogonal Weyl representative has projection zero.
example (g : InfinitePoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2))
    (hg : (realMatrix 2 w hw g : Matrix (Fin 2) (Fin 2) ℝ) = !![0, -1; 1, 0]) :
    HP P K (infiniteEmbed ℚ _ g) = 0 := by sorry

-- Test Reduction.HP_gl2_not_hom: w diag(2,1) has root height -log 2, not log 2.
example (g x : InfinitePoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2))
    (hg : (realMatrix 2 w hw g : Matrix (Fin 2) (Fin 2) ℝ) = !![0, -1; 1, 0])
    (hx : (realMatrix 2 w hw x : Matrix (Fin 2) (Fin 2) ℝ) = !![2, 0; 0, 1]) :
    2 * rho P (HP P K (infiniteEmbed ℚ _ (g * x))) = -Real.log 2 ∧
      HP P K (infiniteEmbed ℚ _ (g * x)) ≠
        HP P K (infiniteEmbed ℚ _ g) + HP P K (infiniteEmbed ℚ _ x) := by sorry

omit hP hupper horthogonal

-- Test Reduction.realMatrix_one: the counit is evaluated as the identity matrix.
example : realMatrix 2 w hw 1 = 1 := by simp

-- Test Reduction.realMatrix_injective: no infinite coordinate is lost over Q.
example : Function.Injective (realMatrix 2 w hw) := by sorry

-- Test Reduction.realMatrix_surjective: all real invertible matrices occur.
example : Function.Surjective (realMatrix 2 w hw) := by sorry

-- Test Reduction.sl2_closed_critical_cover: the closed critical strip covers every orbit.
example (z : UpperHalfPlane) : ∃ γ : Matrix.SpecialLinearGroup (Fin 2) ℤ,
    |(γ • z).re| ≤ 1 / 2 ∧ Real.sqrt 3 / 2 ≤ (γ • z).im := by sorry

-- Test Reduction.sl2_open_critical_fails: the elliptic boundary cannot meet the strict strip.
example : ∃ z : UpperHalfPlane, z.re = 1 / 2 ∧ z.im = Real.sqrt 3 / 2 ∧
    ∀ γ : Matrix.SpecialLinearGroup (Fin 2) ℤ, (γ • z).im ≤ Real.sqrt 3 / 2 := by sorry

-- Test Reduction.sl2_open_subcritical_cover: a strictly smaller positive t covers.
example (t : ℝ) (ht : 0 < t) (ht' : t < Real.sqrt 3 / 2) (z : UpperHalfPlane) :
    ∃ γ : Matrix.SpecialLinearGroup (Fin 2) ℤ, |(γ • z).re| ≤ 1 / 2 ∧ t < (γ • z).im := by sorry

end MatrixChecks


end Reduction

namespace RealSiegel
open Reduction Reduction.GeometricRoots AdelicPoints

variable {H : Type} [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]
  {D : RelativeRootData ℚ H} {P₀ : MinimalParabolic D}

/-- The real identity component, using ℚ∞ = ℝ. -/
abbrev ConnectedRealPoints (H : Type) [CommRing H] [HopfAlgebra ℚ H] :=
  Subgroup.connectedComponentOfOne (InfinitePoints ℚ H)

/-- Coordinate inclusion on the real points of a closed subgroup. -/
abbrev realSubgroupEmbed (I : TauCeti.HopfIdeal ℚ H) :
    InfinitePoints ℚ (H ⧸ I.toIdeal) →* InfinitePoints ℚ H :=
  TauCeti.AlgHom.mapDomain (Bialgebra.Quotient.mkBialgHom I.toIdeal)

def realN (P : StandardParabolic P₀) : Subgroup (ConnectedRealPoints H) :=
  (realSubgroupEmbed P.decomposition.N).range.subgroupOf (ConnectedRealPoints H)

/-- Conjugate the rational Levi's positive split centre by u in N(ℝ). -/
def realA (P : StandardParabolic P₀) (u : realN P) : Subgroup (ConnectedRealPoints H) :=
  ((((SplitComponent ℚ (H ⧸ P.decomposition.M.toIdeal)).map
    ((realSubgroupEmbed P.decomposition.M).comp (infiniteProjection ℚ _))).subgroupOf
      (ConnectedRealPoints H)).map (MulAut.conj u.val).toMonoidHom)

/-- The real norm-one part of the same Levi lift, intersected with G(ℝ)+. -/
def realM (P : StandardParabolic P₀) (u : realN P) : Subgroup (ConnectedRealPoints H) :=
  ((((normOne ℚ (H ⧸ P.decomposition.M.toIdeal)).comap (infiniteEmbed ℚ _)).map
    (realSubgroupEmbed P.decomposition.M)).subgroupOf (ConnectedRealPoints H)).map
      (MulAut.conj u.val).toMonoidHom

def realMK (P : StandardParabolic P₀) (u : realN P) (K : Subgroup (ConnectedRealPoints H)) :
    Set (ConnectedRealPoints H) := (realM P u : Set _) * (K : Set _)

-- Test RealSiegel.connected_trivial: the identity group has one connected real point.
example : Subsingleton (ConnectedRealPoints ℚ) := by sorry
-- Test RealSiegel.connected_gm: the negative component is excluded.
example : ∃ g : InfinitePoints ℚ (LaurentPolynomial ℚ), g ∉ ConnectedRealPoints (LaurentPolynomial ℚ) := by sorry
-- Test RealSiegel.connected_sl2: all real SL2 points lie in the identity component.
example : ConnectedRealPoints (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) = ⊤ := by sorry

-- Test RealSiegel.realEmbed_one: the real closed inclusion preserves one.
example (I : TauCeti.HopfIdeal ℚ H) : realSubgroupEmbed I 1 = 1 := map_one _
-- Test RealSiegel.realEmbed_eval: evaluation is by the exact quotient coordinate.
example (I : TauCeti.HopfIdeal ℚ H) (g : InfinitePoints ℚ (H ⧸ I.toIdeal)) (a : H) :
    (realSubgroupEmbed I g).ofConv a = g.ofConv (Ideal.Quotient.mk I.toIdeal a) := rfl
-- Test RealSiegel.realEmbed_injective: no real subgroup points collapse.
example (I : TauCeti.HopfIdeal ℚ H) : Function.Injective (realSubgroupEmbed I) := by sorry

-- Test RealSiegel.factors_trivial: all four factors are the one-point group or set.
example {D : RelativeRootData ℚ ℚ} {P₀ : MinimalParabolic D}
    (P : StandardParabolic P₀) (u : realN P) (K : Subgroup (ConnectedRealPoints ℚ)) :
    realN P = ⊥ ∧ realA P u = ⊥ ∧ realM P u = ⊥ ∧ realMK P u K = Set.univ := by sorry
-- Test RealSiegel.factors_gm: the connected split torus is entirely A, with N=M=1.
example {D : RelativeRootData ℚ (LaurentPolynomial ℚ)} {P₀ : MinimalParabolic D}
    (P : StandardParabolic P₀) (u : realN P)
    (K : Subgroup (ConnectedRealPoints (LaurentPolynomial ℚ))) :
    realN P = ⊥ ∧ realA P u = ⊤ ∧ realM P u = ⊥ ∧ realMK P u K = K.carrier := by sorry
-- Test RealSiegel.factors_full_nochars: for P=G with no characters, M is the whole connected group.
example (P : StandardParabolic P₀) (hP : P.val = ⊥)
    (hchars : Subsingleton (RationalCharacter ℚ H)) (u : realN P)
    (K : Subgroup (ConnectedRealPoints H)) :
    realN P = ⊥ ∧ realA P u = ⊥ ∧ realM P u = ⊤ ∧ realMK P u K = Set.univ := by sorry
-- Test RealSiegel.factors_proper: a proper parabolic in positive relative rank has nontrivial N.
example (P : StandardParabolic P₀) (hP : (Reduction.simpleRoots P).Nonempty) :
    realN P ≠ ⊥ := by sorry

/-- Fixed-K horospherical data. The involution has compact fixed subgroup K and inverts
A; multiplication pins the homeomorphism and excludes arbitrary coordinates. BKT §2.2, p. 8. -/
structure HoroData (P : StandardParabolic P₀) (K : Subgroup (ConnectedRealPoints H)) where
  maximal : Maximal (fun J : Subgroup (ConnectedRealPoints H) => IsCompact J.carrier) K
  theta : ConnectedRealPoints H ≃ₜ* ConnectedRealPoints H
  involution : ∀ g, theta (theta g) = g
  fixed : ∀ g, theta g = g ↔ g ∈ K
  u : realN P
  theta_split : ∀ a : realA P u, theta a.val = a.val⁻¹
  theta_levi : ∀ m, theta m ∈ realM P u ↔ m ∈ realM P u
  coordinates : ConnectedRealPoints H ≃ₜ (realN P × realA P u × realMK P u K)
  multiplication : ∀ x, (coordinates.symm x : ConnectedRealPoints H) =
    x.1.val * x.2.1.val * x.2.2.val

theorem exists_horoData (P : StandardParabolic P₀) (K : Subgroup (ConnectedRealPoints H))
    (hK : Maximal (fun J : Subgroup (ConnectedRealPoints H) => IsCompact J.carrier) K) :
    Nonempty (HoroData P K) := by sorry

variable {P : StandardParabolic P₀} {K : Subgroup (ConnectedRealPoints H)}

abbrev horoDecomp (C : HoroData P K) := C.coordinates

/-- The logarithm of the A-coordinate is characterized by the original Levi's characters. -/
def HoroData.aLog (C : HoroData P K) : realA P C.u → aP ℚ H P.decomposition := sorry

theorem HoroData.aLog_spec (C : HoroData P K) (a : realA P C.u)
    (b : SplitComponent ℚ (H ⧸ P.decomposition.M.toIdeal))
    (hab : (a.val : InfinitePoints ℚ H) = (C.u.val : InfinitePoints ℚ H) *
      realSubgroupEmbed P.decomposition.M (infiniteProjection ℚ _ b.val) *
        (C.u.val : InfinitePoints ℚ H)⁻¹) :
    C.aLog a = Multiplicative.toAdd (logHeight ℚ _ b.val) := by sorry

abbrev HoroData.simpleRoots (C : HoroData P K) := Reduction.simpleRoots P

def truncatedTorus (C : HoroData P K) (t : ℝ) : Set (realA P C.u) :=
  {a | ∀ α ∈ C.simpleRoots, t < Real.exp (α (C.aLog a))}

/-- Reciprocal simple-root values, indexed by the actual simple roots. -/
def cornerCoord (C : HoroData P K) (a : realA P C.u) :
    {α // α ∈ C.simpleRoots} → ℝ := fun α => Real.exp (-α.val (C.aLog a))

theorem cornerCoord_truncated (C : HoroData P K)
    (hchars : Subsingleton (RationalCharacter ℚ H)) (t : ℝ) (ht : 0 < t) :
    cornerCoord C '' truncatedTorus C t = Set.pi Set.univ (fun _ => Set.Ioo 0 t⁻¹) := by sorry

/-- With no rational characters of G, reciprocal roots recover the whole A-coordinate.
BKT §2.2, p. 8; for a reductive G with split centre this assertion fails. -/
theorem cornerCoord_homeomorphism (C : HoroData P K)
    (hchars : Subsingleton (RationalCharacter ℚ H)) :
    ∃ e : realA P C.u ≃ₜ {x : {α // α ∈ C.simpleRoots} → ℝ | ∀ α, 0 < x α},
      ∀ a, (e a).val = cornerCoord C a := by sorry

-- Test RealSiegel.corner_central_kernel: a split torus has nontrivial A and no roots.
example {D : RelativeRootData ℚ (LaurentPolynomial ℚ)} {P₀ : MinimalParabolic D}
    (P : StandardParabolic P₀) (K : Subgroup (ConnectedRealPoints (LaurentPolynomial ℚ)))
    (C : HoroData P K) : ¬ Function.Injective (cornerCoord C) := by sorry

/-- A Siegel set in the fixed horospherical coordinates. Relative compactness and
semialgebraicity of U,W are additional hypotheses when a finiteness theorem needs them. -/
def siegelSet (C : HoroData P K) (U : Set (realN P)) (t : ℝ)
    (W : Set (realMK P C.u K)) : Set (ConnectedRealPoints H) :=
  {g | (horoDecomp C g).1 ∈ U ∧ (horoDecomp C g).2.1 ∈ truncatedTorus C t ∧
    (horoDecomp C g).2.2 ∈ W}

theorem mem_siegelSet (C : HoroData P K) (U : Set (realN P)) (t : ℝ)
    (W : Set (realMK P C.u K)) (g : ConnectedRealPoints H) :
    g ∈ siegelSet C U t W ↔ ∃ n ∈ U, ∃ a ∈ truncatedTorus C t, ∃ m ∈ W,
      g = n.val * a.val * m.val := by sorry

def siegelSet_quotient (C : HoroData P K) (U : Set (realN P)) (t : ℝ)
    (W : Set (realMK P C.u K)) (M : Subgroup (ConnectedRealPoints H)) :
    Set (ConnectedRealPoints H ⧸ M) := QuotientGroup.mk '' siegelSet C U t W

-- Test RealSiegel.quotient_empty: quotienting cannot fill an empty window.
example (C : HoroData P K) (t : ℝ) (W : Set (realMK P C.u K))
    (M : Subgroup (ConnectedRealPoints H)) :
    siegelSet_quotient C ∅ t W M = ∅ := by sorry

-- Test RealSiegel.quotient_trivial: a trivial quotient subgroup loses no membership information.
example (C : HoroData P K) (U : Set (realN P)) (t : ℝ)
    (W : Set (realMK P C.u K)) (g : ConnectedRealPoints H) :
    QuotientGroup.mk g ∈ siegelSet_quotient C U t W ⊥ ↔ g ∈ siegelSet C U t W := by sorry

-- Test RealSiegel.quotient_full: a nonempty set maps onto the one-point full quotient.
example (C : HoroData P K) (U : Set (realN P)) (t : ℝ)
    (W : Set (realMK P C.u K)) (h : (siegelSet C U t W).Nonempty) :
    siegelSet_quotient C U t W ⊤ = Set.univ := by sorry

theorem siegelSet_mono (C : HoroData P K) (U U' : Set (realN P)) (t t' : ℝ)
    (W W' : Set (realMK P C.u K)) (hU : U ⊆ U') (hW : W ⊆ W') (ht : t' ≤ t) :
    siegelSet C U t W ⊆ siegelSet C U' t' W' := by sorry

/-- The coordinate action of n₀a₀m₀ uses conjugation on the N-coordinate. -/
theorem horoDecomp_left_mul (C : HoroData P K) (n₀ : realN P) (a₀ : realA P C.u)
    (m₀ : realM P C.u) (g : ConnectedRealPoints H) :
    let x := horoDecomp C g
    let y := horoDecomp C (n₀.val * a₀.val * m₀.val * g)
    y.1.val = n₀.val * (a₀.val * m₀.val) * x.1.val * (a₀.val * m₀.val)⁻¹ ∧
      y.2.1.val = a₀.val * x.2.1.val ∧ y.2.2.val = m₀.val * x.2.2.val := by sorry

/-- Changing K by a unipotent conjugation changes the logarithm by right translation. -/
theorem horoDecomp_change_K (C : HoroData P K) (u : realN P)
    (C' : HoroData P (K.map (MulAut.conj u.val).toMonoidHom)) (g : ConnectedRealPoints H) :
    C'.aLog (horoDecomp C' g).2.1 = C.aLog (horoDecomp C (g * u.val)).2.1 := by sorry

theorem horo_levis_unique (C C' : HoroData P K) :
    realA P C.u = realA P C'.u ∧ realM P C.u = realM P C'.u := by sorry

section Conjugation
variable {D' : RelativeRootData ℚ H} {P₀' : MinimalParabolic D'}
  {Q : StandardParabolic P₀'} (C : HoroData P K)
  (γ : WithConv (H →ₐ[ℚ] ℚ)) (g : ConnectedRealPoints H)
  (hg : g.val = TauCeti.AlgHom.mapValue (Algebra.ofId ℚ (NumberField.InfiniteAdeleRing ℚ)) γ)
  (hPQ : ∀ (R : Type) [CommRing R] [Algebra ℚ R],
    subgroupPoints Q.val R = (subgroupPoints P.val R).map
      (MulAut.conj (TauCeti.AlgHom.mapValue (Algebra.ofId ℚ R) γ)).toMonoidHom)
  (C' : HoroData Q (K.map (MulAut.conj g).toMonoidHom))
include hg hPQ

/-- Each coordinate is conjugated, on the actual subgroups of G(ℝ)+. -/
theorem horoDecomp_conj (x : ConnectedRealPoints H) :
    (horoDecomp C' (g * x * g⁻¹)).1.val = g * (horoDecomp C x).1.val * g⁻¹ ∧
    (horoDecomp C' (g * x * g⁻¹)).2.1.val = g * (horoDecomp C x).2.1.val * g⁻¹ ∧
    (horoDecomp C' (g * x * g⁻¹)).2.2.val = g * (horoDecomp C x).2.2.val * g⁻¹ := by sorry

theorem siegelSet_conj (U : Set (realN P)) (t : ℝ) (W : Set (realMK P C.u K)) :
    (fun x => g * x * g⁻¹) '' siegelSet C U t W =
      siegelSet C' {n | ∃ n₀ ∈ U, n.val = g * n₀.val * g⁻¹} t
        {m | ∃ m₀ ∈ W, m.val = g * m₀.val * g⁻¹} := by sorry

end Conjugation

/-- A common scalar truncation parameter need not be preserved by translation.
Containment is the invariant assertion; root-by-root thresholds give exact translated cones. -/
theorem siegelSet_right_translate (C : HoroData P K) (g : ConnectedRealPoints H)
    (C' : HoroData P (K.map (MulAut.conj g⁻¹).toMonoidHom))
    (U : Set (realN P)) (W : Set (realMK P C.u K))
    (hU : IsCompact (closure U)) (hW : IsCompact (closure W)) (t : ℝ) (ht : 0 < t) :
    ∃ (U' : Set (realN P)) (W' : Set (realMK P C'.u _)) (t' : ℝ),
      IsCompact (closure U') ∧ IsCompact (closure W') ∧ 0 < t' ∧
        (fun x => x * g) '' siegelSet C U t W ⊆ siegelSet C' U' t' W' := by sorry

theorem siegelSet_left_parabolic (C : HoroData P K) (g : ConnectedRealPoints H)
    (hg : g.val ∈ subgroupPoints P.val (NumberField.InfiniteAdeleRing ℚ))
    (U : Set (realN P)) (W : Set (realMK P C.u K))
    (hU : IsCompact (closure U)) (hW : IsCompact (closure W)) (t : ℝ) (ht : 0 < t) :
    ∃ (U' : Set (realN P)) (W' : Set (realMK P C.u K)) (t' : ℝ),
      IsCompact (closure U') ∧ IsCompact (closure W') ∧ 0 < t' ∧
        (fun x => g * x) '' siegelSet C U t W ⊆ siegelSet C U' t' W' := by sorry

-- Test RealSiegel.translate_identity: translation by one changes no set.
example (C : HoroData P K) (U : Set (realN P)) (t : ℝ) (W : Set (realMK P C.u K)) :
    (fun x => (1 : ConnectedRealPoints H) * x) '' siegelSet C U t W = siegelSet C U t W := by simp

-- Test RealSiegel.translate_unipotent: only the N-window moves under left N translation.
example (C : HoroData P K) (n : realN P) (U : Set (realN P)) (t : ℝ)
    (W : Set (realMK P C.u K)) :
    (fun x => n.val * x) '' siegelSet C U t W = siegelSet C ((fun x => n * x) '' U) t W := by sorry

-- Test RealSiegel.translate_compact: the unrestricted MK-factor absorbs right K translation.
example (C : HoroData P K) (k : K) (U : Set (realN P)) (t : ℝ) :
    (fun x => x * k.val) '' siegelSet C U t Set.univ = siegelSet C U t Set.univ := by sorry

-- Test RealSiegel.horo_identity: the identity has N=A=1; no shifted origin is allowed.
example (C : HoroData P K) :
    (horoDecomp C 1).1 = 1 ∧ (horoDecomp C 1).2.1 = 1 ∧ C.aLog 1 = 0 := by sorry

-- Test RealSiegel.aLog_product: multiplication adds the two character logarithms.
example (C : HoroData P K) (a b : realA P C.u) :
    C.aLog (a * b) = C.aLog a + C.aLog b := by sorry

-- Test RealSiegel.aLog_nontrivial: the logarithm retains central directions as well as roots.
example (C : HoroData P K) (a : realA P C.u) (ha : a ≠ 1) :
    C.aLog a ≠ 0 := by sorry

-- Test RealSiegel.sl2_change_K: the Weyl element has heights one and one half at the two basepoints.
example : ∃ z : UpperHalfPlane, z.re = 0 ∧ z.im = 1 ∧
    (ModularGroup.S • z).im = 1 ∧ (ModularGroup.S • (ModularGroup.T • z)).im = 1 / 2 := by sorry

-- Test RealSiegel.horo_compact: the whole fixed compact factor has A=1.
example (C : HoroData P K) (k : K) :
    (horoDecomp C k.val).1 = 1 ∧ (horoDecomp C k.val).2.1 = 1 := by sorry

-- Test RealSiegel.horo_split: each positive split factor is its own A-coordinate.
example (C : HoroData P K) (a : realA P C.u) :
    (horoDecomp C a.val).2.1 = a := by sorry

-- Test RealSiegel.truncation_wall: at t=1, the identity is excluded when simple roots exist.
example (C : HoroData P K) (h : C.simpleRoots.Nonempty) :
    (1 : realA P C.u) ∉ truncatedTorus C 1 ∧ cornerCoord C 1 = fun _ => 1 := by sorry

-- Test RealSiegel.truncation_rank_zero: no inequalities, and the corner tuple is empty.
example (C : HoroData P K) (h : C.simpleRoots = ∅) (t : ℝ) :
    truncatedTorus C t = Set.univ ∧ Subsingleton ({α // α ∈ C.simpleRoots} → ℝ) := by sorry

-- Test RealSiegel.truncation_scale: root value two gives reciprocal corner coordinate one half.
example (C : HoroData P K) (a : realA P C.u)
    (h : ∀ α ∈ C.simpleRoots, α (C.aLog a) = Real.log 2) :
    a ∈ truncatedTorus C 1 ∧ cornerCoord C a = fun _ => 1 / 2 := by sorry

-- Test RealSiegel.siegel_empty_window: no U means no points, even in rank zero.
example (C : HoroData P K) (t : ℝ) (W : Set (realMK P C.u K)) :
    siegelSet C ∅ t W = ∅ := by sorry

-- Test RealSiegel.siegel_identity: strict truncation at one excludes the compact factor.
example (C : HoroData P K) (h : C.simpleRoots.Nonempty) :
    (1 : ConnectedRealPoints H) ∉ siegelSet C Set.univ 1 Set.univ := by sorry

-- Test RealSiegel.siegel_rank_zero: all residual factors give the entire connected group.
example (C : HoroData P K) (h : C.simpleRoots = ∅) (t : ℝ) :
    siegelSet C Set.univ t Set.univ = Set.univ := by sorry

end RealSiegel

namespace Reduction

/-- In independent root coordinates the positive-chamber integral is the product of its
one-dimensional exponential tails; `volume` gives the rank-zero point mass one. -/
theorem integral_exp_chamber (r : ℕ) (c T : Fin r → ℝ) (hc : ∀ i, 0 < c i) :
    (∫ x : Fin r → ℝ in Set.pi Set.univ (fun i => Set.Ioi (T i)),
      Real.exp (-(∑ i, c i * x i))) = ∏ i, Real.exp (-(c i * T i)) / c i := by
  sorry

-- Test Reduction.chamber_rank_zero: the empty product is a point of mass one.
example : (∫ x : Fin 0 → ℝ in Set.pi Set.univ (fun _ => Set.Ioi (0 : ℝ)),
    Real.exp (-(∑ i : Fin 0, (1 : ℝ) * x i))) = 1 := by
  simpa using integral_exp_chamber 0 (fun _ => 1) (fun _ => 0) (by simp)

-- Test Reduction.chamber_rates: doubling the decay rate halves the integral.
example : (∫ x : ℝ in Set.Ioi 0, Real.exp (-x)) = 1 ∧
    (∫ x : ℝ in Set.Ioi 0, Real.exp (-2 * x)) = 1 / 2 := by
  constructor
  · simpa using integral_exp_mul_Ioi (a := -1) (by norm_num) 0
  · simpa using integral_exp_mul_Ioi (a := -2) (by norm_num) 0

-- Test Reduction.chamber_shift: shifting the lower bound from 0 to log 2 halves the mass.
example : (∫ x : ℝ in Set.Ioi (Real.log 2), Real.exp (-x)) = 1 / 2 := by
  simpa [Real.exp_neg, Real.exp_log (by norm_num : (0 : ℝ) < 2)] using
    integral_exp_mul_Ioi (a := -1) (by norm_num) (Real.log 2)


open AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The diagonal `G(F) → G(F_∞)`. -/
def infiniteDiagonal : WithConv (H →ₐ[F] F) →* InfinitePoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

-- Test Reduction.infiniteDiagonal_one: the identity remains the identity.
example : infiniteDiagonal F H 1 = 1 := (infiniteDiagonal F H).map_one
-- Test Reduction.infiniteDiagonal_evaluation: every coordinate is the diagonal scalar value.
example (g : WithConv (H →ₐ[F] F)) (h : H) :
    (infiniteDiagonal F H g).ofConv h =
      algebraMap F (NumberField.InfiniteAdeleRing F) (g.ofConv h) := rfl
-- Test Reduction.infiniteDiagonal_injective: archimedean projection retains rational points.
example : Function.Injective (infiniteDiagonal F H) := by sorry

/-- `Γ_{x,U} = G(F) ∩ x U x⁻¹`. -/
abbrev levelArithmetic (x : FiniteAdelicPoints F H) (U : Subgroup (FiniteAdelicPoints F H)) :
    Subgroup (WithConv (H →ₐ[F] F)) := Neat.rationalLevelAt U x

-- Test Reduction.level_full: no finite-level restriction gives all rational points.
example (x : FiniteAdelicPoints F H) : levelArithmetic F H x ⊤ = ⊤ := by sorry
-- Test Reduction.level_bottom: the identity finite level admits only the identity rational point.
example (x : FiniteAdelicPoints F H) : levelArithmetic F H x ⊥ = ⊥ := by sorry
-- Test Reduction.level_identity: at representative one, membership is exactly the finite diagonal condition.
example (U : Subgroup (FiniteAdelicPoints F H)) (γ : WithConv (H →ₐ[F] F)) :
    γ ∈ levelArithmetic F H 1 U ↔ finiteDiagonal F H γ ∈ U := by sorry

variable {F H}

theorem levelArithmetic_discrete [Algebra.FiniteType F H] (x : FiniteAdelicPoints F H)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) :
    DiscreteTopology ((levelArithmetic F H x U).map (infiniteDiagonal F H)) := by
  sorry

theorem levelArithmetic_conj (x : FiniteAdelicPoints F H) (U : Subgroup (FiniteAdelicPoints F H))
    (γ : WithConv (H →ₐ[F] F)) {u : FiniteAdelicPoints F H} (hu : u ∈ U) :
    levelArithmetic F H (finiteDiagonal F H γ * x * u) U =
      (levelArithmetic F H x U).map (MulAut.conj γ).toMonoidHom := by
  sorry

theorem levelArithmetic_commensurable [Algebra.FiniteType F H] (x : FiniteAdelicPoints F H)
    {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hU'o : IsOpen (U' : Set (FiniteAdelicPoints F H))) :
    (levelArithmetic F H x U').relIndex (levelArithmetic F H x U) ≠ 0 := by
  sorry

/-- Arithmetic groups from any two compact open levels and finite-adelic translates
are commensurable. Milne, Lemma 5.13, p. 57. -/
theorem levelArithmetic_commensurable_pair [Algebra.FiniteType F H]
    (x y : FiniteAdelicPoints F H) (U V : Subgroup (FiniteAdelicPoints F H))
    (hUc : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (hVc : IsCompact (V : Set (FiniteAdelicPoints F H)))
    (hVo : IsOpen (V : Set (FiniteAdelicPoints F H))) :
    (levelArithmetic F H x U).Commensurable (levelArithmetic F H y V) := by
  sorry

/-- The adelic quotient of a smooth unipotent number-field group is compact.
Borel, §4.6, p. 19, using the unipotent compactness input cited there. -/
theorem unipotent_adelicQuotient_compact [Algebra.FiniteType F H]
    (hN : TauCeti.smoothUnipotentCommHopfAlgProperty F (finiteTypeObj F H)) :
    CompactSpace (MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)) := by
  sorry

/-- Each finite-adelic double coset has a Levi representative. This applies to the
algebraic Levi decomposition of the whole group, and requires only an open level.
Borel, Proposition 2.7, p. 13. -/
theorem levi_meets_finite_doubleCoset [Algebra.FiniteType F H]
    (D : LeviDecomposition F H ⊥) (U : Subgroup (FiniteAdelicPoints F H))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (x : FiniteAdelicPoints F H) :
    ∃ (γ : WithConv (H →ₐ[F] F)) (m : FiniteAdelicPoints F (H ⧸ D.M.toIdeal)) (u : U),
      x = finiteDiagonal F H γ *
        TauCeti.AlgHom.mapDomain (Bialgebra.Quotient.mkBialgHom D.M.toIdeal) m * u.val := by
  sorry

/-- Borel Proposition 2.7, p. 13: the complement need not be reductive. The
normal unipotent subgroup and unique factorization on every algebra specify G=N⋊M. -/
theorem semidirect_meets_finite_doubleCoset [Algebra.FiniteType F H]
    (N M : TauCeti.HopfIdeal F H)
    (hN : TauCeti.smoothUnipotentCommHopfAlgProperty F
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient (finiteTypeObj F H) N))
    (hnormal : ∀ (R : Type) [CommRing R] [Algebra F R],
      (GeometricRoots.subgroupPoints N R).Normal)
    (hprod : ∀ (R : Type) [CommRing R] [Algebra F R],
      Function.Bijective (fun x : GeometricRoots.subgroupPoints N R ×
        GeometricRoots.subgroupPoints M R => x.1.val * x.2.val))
    (U : Subgroup (FiniteAdelicPoints F H)) (hUo : IsOpen U.carrier)
    (x : FiniteAdelicPoints F H) :
    ∃ (γ : WithConv (H →ₐ[F] F)) (m : FiniteAdelicPoints F (H ⧸ M.toIdeal)) (u : U),
      x = finiteDiagonal F H γ *
        TauCeti.AlgHom.mapDomain (Bialgebra.Quotient.mkBialgHom M.toIdeal) m * u.val := by sorry

/-- `G(F)\G(𝔸_{F,f})/U` is finite. -/
theorem finite_classes [Algebra.FiniteType F H] (U : Subgroup (FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    Finite (DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U) := by
  sorry

/-- for smooth unipotent `N`, `N(𝔸_f) = N(F) U`. -/
theorem classes_subsingleton_of_unipotent [Algebra.FiniteType F H]
    (hN : TauCeti.smoothUnipotentCommHopfAlgProperty F (finiteTypeObj F H))
    (U : Subgroup (FiniteAdelicPoints F H)) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    Subsingleton (DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U) := by
  sorry

/-- for representatives `x_c` of the classes,
`[g_∞] ↦ [(g_∞, x_c)]` is a homeomorphism `⊔_c Γ_{x_c,U}\G(F_∞) ≃ G(F)\G(𝔸_F)/U`. -/
def componentHomeomorph [Algebra.FiniteType F H] (U : Subgroup (FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (rep : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U →
      FiniteAdelicPoints F H)
    (hrep : ∀ c, DoubleCoset.mk (finiteDiagonal F H).range U (rep c) = c) :
    (Σ c, MulAction.orbitRel.Quotient ((levelArithmetic F H (rep c) U).map (infiniteDiagonal F H))
      (InfinitePoints F H)) ≃ₜ LevelMaps.LevelQuotient F H U ⊥ :=
  sorry

theorem componentHomeomorph_mk [Algebra.FiniteType F H] (U : Subgroup (FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (rep : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U →
      FiniteAdelicPoints F H)
    (hrep : ∀ c, DoubleCoset.mk (finiteDiagonal F H).range U (rep c) = c) (c) (g : InfinitePoints F H) :
    componentHomeomorph U hU hUo rep hrep ⟨c, Quotient.mk'' g⟩ =
      LevelMaps.LevelQuotient.mk U ⊥ (infiniteEmbed F H g * finiteEmbed F H (rep c)) := by
  sorry

/-- Right translation by an infinite point preserves the class index and agrees with
right translation on the adelic quotient. Both sides use the induced quotient maps. -/
theorem componentHomeomorph_right [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact U.carrier) (hUo : IsOpen U.carrier)
    (rep : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U →
      FiniteAdelicPoints F H)
    (hrep : ∀ c, DoubleCoset.mk (finiteDiagonal F H).range U (rep c) = c)
    (g : InfinitePoints F H) (c)
    (q : MulAction.orbitRel.Quotient
      ((levelArithmetic F H (rep c) U).map (infiniteDiagonal F H)) (InfinitePoints F H)) :
    componentHomeomorph U hU hUo rep hrep ⟨c, Quotient.map' (· * g) (by sorry) q⟩ =
      Quotient.map' (fun x : AdelicPoints F H => x * infiniteEmbed F H g) (by sorry)
        (componentHomeomorph U hU hUo rep hrep ⟨c, q⟩) := by sorry

-- Test Reduction.component_identity: the base point of each component retains its finite representative.
example [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact U.carrier) (hUo : IsOpen U.carrier)
    (rep : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U →
      FiniteAdelicPoints F H)
    (hrep : ∀ c, DoubleCoset.mk (finiteDiagonal F H).range U (rep c) = c) (c) :
    componentHomeomorph U hU hUo rep hrep ⟨c, Quotient.mk'' 1⟩ =
      LevelMaps.LevelQuotient.mk U ⊥ (finiteEmbed F H (rep c)) := by sorry

-- Test Reduction.component_distinct: distinct finite classes cannot be identified by the map.
example [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact U.carrier) (hUo : IsOpen U.carrier)
    (rep : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U →
      FiniteAdelicPoints F H)
    (hrep : ∀ c, DoubleCoset.mk (finiteDiagonal F H).range U (rep c) = c) (c d) (hcd : c ≠ d) :
    componentHomeomorph U hU hUo rep hrep ⟨c, Quotient.mk'' 1⟩ ≠
      componentHomeomorph U hU hUo rep hrep ⟨d, Quotient.mk'' 1⟩ := by sorry

-- Test Reduction.component_same: within a component equality is exactly an arithmetic left orbit.
example [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact U.carrier) (hUo : IsOpen U.carrier)
    (rep : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U →
      FiniteAdelicPoints F H)
    (hrep : ∀ c, DoubleCoset.mk (finiteDiagonal F H).range U (rep c) = c) (c)
    (g h : InfinitePoints F H) :
    componentHomeomorph U hU hUo rep hrep ⟨c, Quotient.mk'' g⟩ =
      componentHomeomorph U hU hUo rep hrep ⟨c, Quotient.mk'' h⟩ ↔
      ∃ γ ∈ levelArithmetic F H (rep c) U, h = infiniteDiagonal F H γ * g := by sorry

/-- Platonov–Rapinchuk–Rapinchuk, Theorem 5.24, pp. 318–321: connectedness suffices
for a nonzero finite invariant Radon measure on the norm-one quotient. -/
theorem exists_finite_invariant_normOne_measure [Algebra.FiniteType F H]
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F (CommHopfAlgCat.of F H)) :
    ∃ ν : MeasureTheory.Measure (AutomorphicQuotient.NormOneQuotient F H),
      ν ≠ 0 ∧ MeasureTheory.IsFiniteMeasure ν ∧ ν.Regular ∧
        ∀ g : AdelicPoints.normOne F H,
          MeasureTheory.Measure.map (AutomorphicQuotient.rightAct F H g) ν = ν := by
  sorry

/-- `G(F)\G(𝔸_F)^1` has finite positive volume. -/
theorem finite_volume [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (μ : MeasureTheory.Measure (AdelicPoints F H)) [μ.IsHaarMeasure] :
    0 < AutomorphicQuotient.measure F H hred μ Set.univ ∧
      AutomorphicQuotient.measure F H hred μ Set.univ < ⊤ := by
  sorry

theorem tamagawa_number_lt_top [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (ω : GaugeForm F H) (hω : ω ≠ 0) : Tamagawa.number F H hred ω < ⊤ := by
  sorry

/-- Right translation on `G(F)\G(𝔸_F)`. -/
def rightAct (g : AdelicPoints F H) :
    MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H) →
      MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H) :=
  Quotient.map' (· * g) (by sorry)

-- Test Reduction.rightAct_identity
example (q : MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)) :
    rightAct 1 q = q := by sorry
-- Test Reduction.rightAct_order: the first multiplier appears first in the product.
example (g h : AdelicPoints F H)
    (q : MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)) :
    rightAct h (rightAct g q) = rightAct (g * h) q := by sorry
-- Test Reduction.rightAct_split: translation in a nonzero height direction is not the identity.
example (g : AdelicPoints F (LaurentPolynomial F))
    (hg : logHeight F (LaurentPolynomial F) g ≠ 1) :
    rightAct g (Quotient.mk'' 1) ≠ Quotient.mk'' 1 := by sorry

instance : MeasurableSpace (MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)) :=
  borel _

/-- for connected `G`, `G(F)\G(𝔸_F)` carries a nonzero finite
invariant Radon measure exactly when `X*_F(G) = 0`. -/
theorem finite_volume_iff [Algebra.FiniteType F H]
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F (CommHopfAlgCat.of F H)) :
    (∃ ν : MeasureTheory.Measure (MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)),
      ν ≠ 0 ∧ MeasureTheory.IsFiniteMeasure ν ∧ ν.Regular ∧
        ∀ g, MeasureTheory.Measure.map (rightAct g) ν = ν) ↔
      Subsingleton (RationalCharacter F H) := by
  sorry

/-- The identity component is the largest geometrically connected closed subgroup;
its ideal is minimal among the ideals with connected quotient. Characteristic zero is
provided by the number-field assumption. -/
theorem exists_identityComponentIdeal [Algebra.FiniteType F H] :
    ∃ I : TauCeti.HopfIdeal F H, Minimal (fun J : TauCeti.HopfIdeal F H =>
      TauCeti.geometricallyConnectedCommHopfAlgProperty F
        (TauCeti.CommHopfAlgCat.quotient (CommHopfAlgCat.of F H) J)) I := by sorry

/-- PRR Theorem 5.22(2), pp. 314–316, including disconnected groups. The characters
belong to the identity component, rather than to the whole disconnected group. -/
theorem finite_volume_iff_identityComponent [Algebra.FiniteType F H]
    (I : TauCeti.HopfIdeal F H)
    (hI : Minimal (fun J : TauCeti.HopfIdeal F H =>
      TauCeti.geometricallyConnectedCommHopfAlgProperty F
        (TauCeti.CommHopfAlgCat.quotient (CommHopfAlgCat.of F H) J)) I) :
    (∃ ν : MeasureTheory.Measure
      (MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)),
      ν ≠ 0 ∧ MeasureTheory.IsFiniteMeasure ν ∧ ν.Regular ∧
        ∀ g, MeasureTheory.Measure.map (rightAct g) ν = ν) ↔
      Subsingleton (RationalCharacter F (H ⧸ I.toIdeal)) := by sorry

-- Test Reduction.identity_component_connected: the whole connected group has ideal zero.
example [Algebra.FiniteType F H]
    (hc : TauCeti.geometricallyConnectedCommHopfAlgProperty F (CommHopfAlgCat.of F H)) :
    Minimal (fun J : TauCeti.HopfIdeal F H =>
      TauCeti.geometricallyConnectedCommHopfAlgProperty F
        (TauCeti.CommHopfAlgCat.quotient (CommHopfAlgCat.of F H) J)) ⊥ := by sorry

-- Test Reduction.identity_component_finite: a finite characteristic-zero group has trivial identity component.
example [Algebra.FiniteType F H] [Module.Finite F H] (I : TauCeti.HopfIdeal F H)
    (hI : Minimal (fun J : TauCeti.HopfIdeal F H =>
      TauCeti.geometricallyConnectedCommHopfAlgProperty F
        (TauCeti.CommHopfAlgCat.quotient (CommHopfAlgCat.of F H) J)) I) :
    Subsingleton (RationalCharacter F (H ⧸ I.toIdeal)) := by sorry

-- Test Reduction.identity_component_torus: connectedness does not remove split characters.
example : ¬ Subsingleton (RationalCharacter F (LaurentPolynomial F)) := by sorry

/-- Unipotent rational points, through a faithful algebraic representation. -/
def IsUnipotentPoint (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)
    (γ : WithConv (H →ₐ[F] F)) : Prop :=
  IsNilpotent ((ρ γ : Matrix (Fin n) (Fin n) ℂ) - 1)

-- Test Reduction.unipotent_one
example (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) :
    IsUnipotentPoint n ρ 1 := by simp [IsUnipotentPoint]
-- Test Reduction.unipotent_shear: a nonidentity upper shear is unipotent.
example (ρ : WithConv (H →ₐ[F] F) →* GL (Fin 2) ℂ) (g : WithConv (H →ₐ[F] F))
    (hg : (ρ g : Matrix (Fin 2) (Fin 2) ℂ) = !![1, 1; 0, 1]) :
    IsUnipotentPoint 2 ρ g := by sorry
-- Test Reduction.unipotent_diagonal: determinant one alone does not imply unipotence.
example (ρ : WithConv (H →ₐ[F] F) →* GL (Fin 2) ℂ) (g : WithConv (H →ₐ[F] F))
    (hg : (ρ g : Matrix (Fin 2) (Fin 2) ℂ) = !![2, 0; 0, 1/2]) :
    ¬ IsUnipotentPoint 2 ρ g := by sorry

/-- (Godement's criterion): `G(F)\G(𝔸_F)^1` is compact exactly when
`G(F)` has no nontrivial unipotent element. -/
theorem compactSpace_normOneQuotient_iff [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ) :
    CompactSpace (AutomorphicQuotient.NormOneQuotient F H) ↔
      ∀ γ, IsUnipotentPoint n ρ γ → γ = 1 := by
  sorry

/-- `Γ\(G(F_∞)/A_G(ℝ)^0)` carries a nonzero finite
invariant measure for `Γ = G(F) ∩ U`. -/
theorem arithmeticQuotient_finite_volume [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    letI : MeasurableSpace (MulAction.orbitRel.Quotient
        ((levelArithmetic F H 1 U).map (infiniteDiagonal F H))
        (InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) := borel _
    ∃ ν : MeasureTheory.Measure (MulAction.orbitRel.Quotient
        ((levelArithmetic F H 1 U).map (infiniteDiagonal F H))
        (InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))),
      ν ≠ 0 ∧ MeasureTheory.IsFiniteMeasure ν ∧ ν.Regular ∧
        ∀ g : InfinitePoints F H,
          MeasureTheory.Measure.map (Quotient.map'
            (fun x : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H) =>
              Quotient.liftOn' x
                (fun y => ((y * g : InfinitePoints F H) :
                  InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H)))
                (by sorry)) (by sorry)) ν = ν := by
  sorry

/-- that quotient is compact exactly when `G(F)` has no nontrivial
unipotent element. -/
theorem arithmeticQuotient_compact_iff [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    CompactSpace (MulAction.orbitRel.Quotient ((levelArithmetic F H 1 U).map (infiniteDiagonal F H))
        (InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ↔
      ∀ γ, IsUnipotentPoint n ρ γ → γ = 1 := by
  sorry

/-- over `ℚ`, if `Γ\G(ℝ)` is compact then `Γ = G(ℚ) ∩ U` has no
nontrivial unipotent element. -/
theorem no_unipotent_of_cocompact {H : Type} [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]
    (hred : TauCeti.reductiveCommHopfAlgProperty ℚ (finiteTypeObj ℚ H)) (n : ℕ)
    (ρ : WithConv (H →ₐ[ℚ] ℚ) →* GL (Fin n) ℂ) (hρ : Neat.IsFaithfulAlgebraicPointHom (Rat.castHom ℂ) n ρ)
    (U : Subgroup (FiniteAdelicPoints ℚ H)) (hU : IsCompact (U : Set (FiniteAdelicPoints ℚ H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints ℚ H)))
    (hcpt : CompactSpace (MulAction.orbitRel.Quotient ((levelArithmetic ℚ H 1 U).map
      (infiniteDiagonal ℚ H)) (InfinitePoints ℚ H)))
    (γ : WithConv (H →ₐ[ℚ] ℚ)) (hγ : γ ∈ levelArithmetic ℚ H 1 U) (hu : IsUnipotentPoint n ρ γ) :
    γ = 1 := by
  sorry

/-- `‖x‖_r = ∏_v ‖(r ⊕ r^∨)(x)_v‖_v` for the algebraic representation with
coordinate map `r` augmented by its dual, with entrywise maxima of normalized absolute values at
finite places and Hilbert–Schmidt norms raised to `[F_w : ℝ]` at archimedean places. Every local
factor is at least one, and the height is symmetric under inversion. In rank zero the
height is defined to be one (the empty Hilbert–Schmidt norm would be zero). -/
def height {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) :
    AdelicPoints F H → ℝ :=
  sorry

/-- Finite local factor, including inverse coordinates and the rank-zero normalization. -/
def finiteHeight {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (x : LocalPoints F H v) : ℝ :=
  if m = 0 then 1 else
    let g := TauCeti.GeneralLinear.pointsMulEquiv (R := F) m (TauCeti.AlgHom.mapDomain r x)
    let gInv := g⁻¹
    ⨆ ij : Fin m × Fin m,
      max (((TauCeti.normalizedAbsoluteValue (v.adicCompletion F)
          ((g : Matrix (Fin m) (Fin m) (v.adicCompletion F)) ij.1 ij.2) : ℚ≥0) : ℝ))
        (((TauCeti.normalizedAbsoluteValue (v.adicCompletion F)
          ((gInv : Matrix (Fin m) (Fin m) (v.adicCompletion F)) ij.1 ij.2) : ℚ≥0) : ℝ))

/-- Archimedean local factor, with the real/complex multiplicity and inverse coordinates. -/
def infiniteHeight {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H)
    (w : NumberField.InfinitePlace F) (x : WithConv (H →ₐ[F] w.Completion)) : ℝ :=
  if m = 0 then 1 else
    let g := TauCeti.GeneralLinear.pointsMulEquiv (R := F) m (TauCeti.AlgHom.mapDomain r x)
    let gInv := g⁻¹
    Real.sqrt (∑ i, ∑ j, (‖(g : Matrix (Fin m) (Fin m) w.Completion) i j‖ ^ 2 +
      ‖(gInv : Matrix (Fin m) (Fin m) w.Completion) i j‖ ^ 2)) ^ w.mult

theorem finiteHeight_polynomial_comparison {m n : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) (hr : Function.Surjective r)
    (r' : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H) :
    ∃ (N : ℕ) (c : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) → ℝ),
      0 < N ∧ (∀ v, 0 < c v) ∧ {v | c v ≠ 1}.Finite ∧
      ∀ v x, finiteHeight r' v x ≤ c v * finiteHeight r v x ^ N := by sorry

theorem infiniteHeight_polynomial_comparison {m n : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) (hr : Function.Surjective r)
    (r' : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H) :
    ∃ (N : ℕ) (c : NumberField.InfinitePlace F → ℝ), 0 < N ∧ (∀ w, 0 < c w) ∧
      ∀ w x, infiniteHeight r' w x ≤ c w * infiniteHeight r w x ^ N := by sorry

-- Test Reduction.localHeight_rank_zero: the empty factor is one, never zero.
example (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F 0 →ₐc[F] H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (w : NumberField.InfinitePlace F) (x : LocalPoints F H v) (y : WithConv (H →ₐ[F] w.Completion)) :
    finiteHeight r v x = 1 ∧ infiniteHeight r w y = 1 := by simp [finiteHeight, infiniteHeight]

-- Test Reduction.localHeight_identity: finite identity factor one, infinite sqrt(2m)^mult.
example (m : ℕ) (hm : 0 < m)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (w : NumberField.InfinitePlace F) :
    finiteHeight (BialgHom.id F (TauCeti.GeneralLinear.coordinateHopfAlgebra F m)) v 1 = 1 ∧
      infiniteHeight (BialgHom.id F (TauCeti.GeneralLinear.coordinateHopfAlgebra F m)) w 1 =
        Real.sqrt (2 * m) ^ w.mult := by sorry

-- Test Reduction.localHeight_inverse: dual augmentation is symmetric under inversion.
example {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (w : NumberField.InfinitePlace F) (x : LocalPoints F H v) (y : WithConv (H →ₐ[F] w.Completion)) :
    finiteHeight r v x⁻¹ = finiteHeight r v x ∧ infiniteHeight r w y⁻¹ = infiniteHeight r w y := by sorry

/-- The defining formula in positive rank: with `g ∈ GL_m(𝔸_F)` the matrix of `r(x)`, the height is
the product over archimedean `w` of the Hilbert–Schmidt norm of `(g_w, g_w⁻¹)` raised to `[F_w : ℝ]`
and over finite `v` of the largest normalized absolute value of an entry of `g_v` or `g_v⁻¹`. -/
theorem height_eq {m : ℕ} (hm : 0 < m)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) (x : AdelicPoints F H) :
    let g : Matrix (Fin m) (Fin m) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :=
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := F) m (TauCeti.AlgHom.mapDomain r x) :
        GL (Fin m) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) :
          Matrix (Fin m) (Fin m) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F))
    let g' : Matrix (Fin m) (Fin m) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :=
      (((TauCeti.GeneralLinear.pointsMulEquiv (R := F) m (TauCeti.AlgHom.mapDomain r x))⁻¹ :
        GL (Fin m) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) :
          Matrix (Fin m) (Fin m) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F))
    height r x =
      (∏ w : NumberField.InfinitePlace F, Real.sqrt (∑ i, ∑ j,
          (‖(g i j).1 w‖ ^ 2 + ‖(g' i j).1 w‖ ^ 2)) ^ w.mult) *
        ∏ᶠ v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F),
          ⨆ ij : Fin m × Fin m,
            max (((TauCeti.normalizedAbsoluteValue (v.adicCompletion F) ((g ij.1 ij.2).2 v) : ℚ≥0) : ℝ))
              (((TauCeti.normalizedAbsoluteValue (v.adicCompletion F) ((g' ij.1 ij.2).2 v) : ℚ≥0) : ℝ)) := by
  sorry

/-- The zero-dimensional representation has height one. -/
example (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F 0 →ₐc[F] H)
    (x : AdelicPoints F H) : height r x = 1 := by
  sorry

/-- A cardinal bound using `ncard` alone would also accept an infinite set. -/
example : (Set.univ : Set ℕ).ncard = 0 ∧ ¬ (Set.univ : Set ℕ).Finite := by
  simp only [Set.ncard_univ, Nat.card_eq_zero_of_infinite, true_and]
  exact Set.infinite_univ

theorem height_mul_le {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H)
    (x y : AdelicPoints F H) : height r (x * y) ≤ height r x * height r y := by
  sorry

theorem height_inv_le {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) :
    ∃ C N : ℝ, 0 < C ∧ ∀ x, height r x⁻¹ ≤ C * height r x ^ N := by
  sorry

theorem isCompact_height_le [Algebra.FiniteType F H] {m : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) (hr : Function.Surjective r)
    (t : ℝ) : IsCompact {x | height r x ≤ t} := by
  sorry

theorem card_rational_height_le [Algebra.FiniteType F H] {m : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) (hr : Function.Surjective r) :
    ∃ C N : ℝ, 0 < C ∧ 0 < N ∧ ∀ t : ℝ, 1 ≤ t →
      {γ | height r (diagonal F H γ) ≤ t}.Finite ∧
      ({γ | height r (diagonal F H γ) ≤ t}.ncard : ℝ) ≤ C * t ^ N := by
  sorry

/-- `#{a ∈ F^d : ∏_v max(1, |a_1|_v, …, |a_d|_v) ≤ R}` is at
most `C R^N`, with Mathlib's product-formula normalized multiplicative height of `(1, a)`. -/
theorem card_height_le (d : ℕ) :
    ∃ C N : ℝ, 0 < C ∧ 0 < N ∧ ∀ R : ℝ, 1 ≤ R →
      {a : Fin d → F | Height.mulHeight (Fin.cons (1 : F) a) ≤ R}.Finite ∧
      ({a : Fin d → F | Height.mulHeight (Fin.cons (1 : F) a) ≤ R}.ncard : ℝ) ≤ C * R ^ N := by
  sorry

/-- Any algebraic representation is polynomially bounded by a closed embedding.
Applying this in both directions compares two closed embeddings. -/
theorem height_le_pow [Algebra.FiniteType F H] {m m' : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) (hr : Function.Surjective r)
    (r' : TauCeti.GeneralLinear.coordinateHopfAlgebra F m' →ₐc[F] H) :
    ∃ C N : ℝ, 0 < C ∧ 0 < N ∧ ∀ x, height r' x ≤ C * height r x ^ N := by
  sorry

theorem height_mul_compact_le {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H)
    (K : Set (AdelicPoints F H)) (hK : IsCompact K) :
    ∃ C : ℝ, 0 < C ∧ ∀ x, ∀ k ∈ K, height r (x * k) ≤ C * height r x ∧ height r (k * x) ≤ C * height r x := by
  sorry

/-- Exponential comparison on a compact-window minimal Siegel set, for any fixed norm.
The lower prefactor and exponent can be chosen to be the same small positive constant.
Arthur §13, p. 70; the root coordinates and central characters both enter this bound. -/
theorem height_siegel [Algebra.FiniteType F H] {D : RelativeRootData F H}
    {P₀ : MinimalParabolic D} (P : StandardParabolic P₀) (hP : P.val = P₀.ideal)
    (K : AdmissibleCompact P₀) (T : aP F H P.decomposition)
    (ω : Set (AdelicPoints F H)) (hω : IsCompact ω) (hwindow : ω ⊆ windowSubgroup P)
    (q : Seminorm ℝ (aP F H P.decomposition)) (hq : ∀ a, q a = 0 → a = 0)
    {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H)
    (hr : Function.Surjective r) :
    ∃ c C : ℝ, 0 < c ∧ 0 < C ∧ ∀ x ∈ siegelSet P K T ω,
      c * Real.exp (c * q (HP P K x)) ≤ height r x ∧
        height r x ≤ C * Real.exp (C * q (HP P K x)) := by sorry

/-- No proper rational parabolic is the intrinsic relative-anisotropy condition. -/
theorem compactSpace_normOneQuotient_iff_no_proper_parabolic [Algebra.FiniteType F H]
    (D : RelativeRootData F H) :
    CompactSpace (AutomorphicQuotient.NormOneQuotient F H) ↔
      ∀ I : TauCeti.HopfIdeal F H, IsRationalParabolic I → I = ⊥ := by sorry

theorem compactSpace_normOneQuotient_iff_roots_empty [Algebra.FiniteType F H]
    (D : RelativeRootData F H) :
    CompactSpace (AutomorphicQuotient.NormOneQuotient F H) ↔ D.roots = ∅ := by sorry

/-- For the actual derived subgroup, anisotropy means every F-cocharacter is trivial.
Borel Theorem 5.8, p. 22; PRR Theorem 5.24, p. 318. -/
theorem roots_empty_iff_derived_anisotropic [Algebra.FiniteType F H]
    (D : RelativeRootData F H) (I : TauCeti.HopfIdeal F H)
    (hI : I = sSup {J : TauCeti.HopfIdeal F H |
      ∀ (R : Type) [CommRing R] [Algebra F R] (g h : WithConv (H →ₐ[F] R)),
        g * h * g⁻¹ * h⁻¹ ∈ GeometricRoots.subgroupPoints J R}) :
    D.roots = ∅ ↔
      ∀ ell : (H ⧸ I.toIdeal) →ₐc[F]
        LaurentPolynomial F,
      ∀ h, ell h = algebraMap F (LaurentPolynomial F) (Bialgebra.counitAlgHom F _ h) := by sorry

/-- The reduced-norm-one division group in its left regular representation. The
geometric point equation uses determinant in a splitting matrix algebra, not determinant
of left multiplication. In characteristic zero this determines the closed subgroup.
PRR §2.3.1, pp. 90–91, Proposition 2.29; Example 4.46, pp. 252–253; Theorem 5.24. -/
theorem divisionNormOne_compact (A : Type) [DivisionRing A] [Algebra F A]
    [FiniteDimensional F A] [Algebra.IsCentral F A] (n : ℕ) (b : Module.Basis (Fin n) F A) :
    ∃ (d : ℕ) (e : (AlgebraicClosure F ⊗[F] A) ≃ₐ[AlgebraicClosure F]
        Matrix (Fin d) (Fin d) (AlgebraicClosure F))
      (I : TauCeti.HopfIdeal F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n)),
      0 < d ∧
      (∀ g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐ[F] AlgebraicClosure F),
        g ∈ GeometricRoots.subgroupPoints I (AlgebraicClosure F) ↔
          ∃ a : (AlgebraicClosure F ⊗[F] A)ˣ, (e a.val).det = 1 ∧
            ∀ x : AlgebraicClosure F ⊗[F] A,
              Matrix.mulVec (TauCeti.GeneralLinear.pointsMulEquiv n g :
                Matrix (Fin n) (Fin n) (AlgebraicClosure F))
                ((b.baseChange (AlgebraicClosure F)).repr x) =
                  (b.baseChange (AlgebraicClosure F)).repr (a.val * x)) ∧
      TauCeti.semisimpleCommHopfAlgProperty F
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient
          (finiteTypeObj F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n)) I) ∧
      (let B := TauCeti.GeneralLinear.coordinateHopfAlgebra F n ⧸ I.toIdeal
       CompactSpace (MulAction.orbitRel.Quotient (diagonal F B).range (AdelicPoints F B)) ∧
       ∀ U : Subgroup (FiniteAdelicPoints F B), IsCompact U.carrier → IsOpen U.carrier →
         CompactSpace (MulAction.orbitRel.Quotient
           ((levelArithmetic F B 1 U).map (infiniteDiagonal F B)) (InfinitePoints F B))) := by sorry

-- Test Reduction.normOne_degree_one: the degree-one reduced norm is the element itself.
example (x : ℚ) : (!![x] : Matrix (Fin 1) (Fin 1) ℚ).det = 1 ↔ x = 1 := by simp
-- Test Reduction.normOne_split_two: reciprocal eigenvalues have reduced norm one.
example : (!![2, 0; 0, 1 / 2] : Matrix (Fin 2) (Fin 2) ℚ).det = 1 := by norm_num [Matrix.det_fin_two]
-- Test Reduction.normOne_not_regular_det: left multiplication on M2 squares the reduced norm.
example : (!![-1, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ).det = -1 ∧
    (Matrix.diagonal ![-1, 1, -1, 1] : Matrix (Fin 4) (Fin 4) ℚ).det = 1 := by
  norm_num [Matrix.det_fin_two, Matrix.det_diagonal, Fin.prod_univ_succ]

/-- A faithful realization by left multiplications in a finite-dimensional division algebra
rules out nontrivial unipotents. With no rational characters it gives compactness of the
full adelic and arithmetic quotients, in particular for SL₁ of a central division algebra.
Borel Theorems 5.6(ii), 5.8, pp. 21–22. -/
theorem divisionUnits_compact [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (hchars : Subsingleton (RationalCharacter F H))
    (A : Type) [DivisionRing A] [Algebra F A] [FiniteDimensional F A]
    (n : ℕ) (b : Module.Basis (Fin n) F A)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H)
    (hr : Function.Surjective r)
    (hleft : ∀ γ : WithConv (H →ₐ[F] F), ∃ a : Aˣ, ∀ x : A,
      Matrix.mulVec (TauCeti.GeneralLinear.pointsMulEquiv n (TauCeti.AlgHom.mapDomain r γ) :
        Matrix (Fin n) (Fin n) F) (b.repr x) = b.repr ((a : A) * x))
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact U.carrier) (hUo : IsOpen U.carrier) :
    CompactSpace (MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)) ∧
      CompactSpace (MulAction.orbitRel.Quotient
        ((levelArithmetic F H 1 U).map (infiniteDiagonal F H)) (InfinitePoints F H)) := by sorry

theorem rational_flags_finite [Algebra.FiniteType F H] (D : RelativeRootData F H)
    (I : TauCeti.HopfIdeal F H) (hI : IsRationalParabolic I)
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact U.carrier) (hUo : IsOpen U.carrier) :
    Finite (DoubleCoset.Quotient ((levelArithmetic F H 1 U).carrier)
      (GeometricRoots.subgroupPoints I F).carrier) := by sorry

namespace SArithmetic

/-- S includes all infinite places; the parameter records its finite places. -/
abbrev Points (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :=
  InfinitePoints F H × ∀ v : {v // v ∈ S}, LocalPoints F H v.val

def projection (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :
    AdelicPoints F H →* Points (F := F) (H := H) S where
  toFun x := (infiniteProjection F H x, fun v => proj F H v.val x)
  map_one' := by sorry
  map_mul' := by sorry

/-- The actual away-S level condition: agreement with an integral-level point outside S. -/
def arithmetic (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (U : Subgroup (FiniteAdelicPoints F H)) : Subgroup (WithConv (H →ₐ[F] F)) where
  carrier := {γ | ∃ u ∈ U, ∀ v, v ∉ S →
    proj F H v (diagonal F H γ) = proj F H v (finiteEmbed F H u)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

abbrev diagonalS (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :=
  (projection (F := F) (H := H) S).comp (diagonal F H)

-- Test Reduction.SArithmetic.projection_one
example (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :
    projection (H := H) S 1 = 1 ∧ diagonalS (H := H) S 1 = 1 := by simp
-- Test Reduction.SArithmetic.projection_empty: the empty finite index leaves the infinite factor intact.
example (g : AdelicPoints F H) (γ : WithConv (H →ₐ[F] F)) :
    (projection ∅ g).1 = infiniteProjection F H g ∧
      (diagonalS ∅ γ).1 = infiniteDiagonal F H γ := by sorry
-- Test Reduction.SArithmetic.projection_selected: an included finite coordinate cannot be discarded.
example (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (v : {v // v ∈ S}) (g : AdelicPoints F H) (γ : WithConv (H →ₐ[F] F)) :
    (projection S g).2 v = proj F H v.val g ∧
      (diagonalS S γ).2 v = proj F H v.val (diagonal F H γ) := ⟨rfl, rfl⟩

theorem discrete [Algebra.FiniteType F H]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact U.carrier) :
    DiscreteTopology ((arithmetic S U).map (diagonalS S)) := by sorry

theorem finite_covolume [Algebra.FiniteType F H] (D : RelativeRootData F H)
    (hchars : Subsingleton (RationalCharacter F H))
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact U.carrier) (hUo : IsOpen U.carrier) :
    let Q := MulAction.orbitRel.Quotient ((arithmetic S U).map (diagonalS S))
      (Points (F := F) (H := H) S)
    letI : MeasurableSpace Q := borel Q
    ∃ ν : MeasureTheory.Measure Q, ν ≠ 0 ∧ MeasureTheory.IsFiniteMeasure ν ∧ ν.Regular ∧
      ∀ g : Points (F := F) (H := H) S,
        MeasureTheory.Measure.map (Quotient.map' (· * g) (by sorry)) ν = ν := by sorry

theorem compact_iff [Algebra.FiniteType F H] (D : RelativeRootData F H)
    (hchars : Subsingleton (RationalCharacter F H))
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact U.carrier) (hUo : IsOpen U.carrier) :
    CompactSpace (MulAction.orbitRel.Quotient ((arithmetic S U).map (diagonalS S))
      (Points (F := F) (H := H) S)) ↔ D.roots = ∅ := by sorry

-- Test Reduction.SArithmetic.empty: with no finite S-place this is the ordinary level group.
example (U : Subgroup (FiniteAdelicPoints F H)) : arithmetic ∅ U = levelArithmetic F H 1 U := by sorry

-- Test Reduction.SArithmetic.inverting_prime: a p-power denominator is permitted at p.
example (p : ℕ) [Fact p.Prime]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers ℚ))
    (hv : (p : NumberField.RingOfIntegers ℚ) ∈ v.asIdeal) :
    ∃ γ : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1 →ₐ[ℚ] ℚ),
      (TauCeti.GeneralLinear.pointsMulEquiv 1 γ : Matrix (Fin 1) (Fin 1) ℚ) 0 0 = p ∧
      γ ∈ arithmetic {v} (IntegralModel.standardGLn (F := ℚ) (S := ∅) 1).integralLevel ∧
      γ ∉ arithmetic ∅ (IntegralModel.standardGLn (F := ℚ) (S := ∅) 1).integralLevel := by sorry

-- Test Reduction.SArithmetic.trivial: every level in the trivial group gives the whole group.
example (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (U : Subgroup (FiniteAdelicPoints F F)) : arithmetic S U = ⊤ := by sorry

end SArithmetic

theorem tamagawa_number_pos [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (ω : GaugeForm F H) (hω : ω ≠ 0) : 0 < Tamagawa.number F H hred ω := by sorry

theorem finite_cusps [Algebra.FiniteType F H] (D : RelativeRootData F H)
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact U.carrier) (hUo : IsOpen U.carrier) :
    ∃ C : Finset (TauCeti.HopfIdeal F H),
      (∀ J ∈ C, IsRationalParabolic J) ∧
      ∀ I : TauCeti.HopfIdeal F H, IsRationalParabolic I →
        ∃ J ∈ C, ∃ γ ∈ levelArithmetic F H 1 U,
          ∀ (R : Type) [CommRing R] [Algebra F R],
            GeometricRoots.subgroupPoints I R = (GeometricRoots.subgroupPoints J R).map
              (MulAut.conj (TauCeti.AlgHom.mapValue (Algebra.ofId F R) γ)).toMonoidHom := by sorry

-- Test Reduction.height_one: over `ℚ` with `r` the standard representation of `GL_2`, `r ⊕ r^∨` has
-- size `m = 4` and the Hilbert–Schmidt factor gives `height 1 = m^{1/2} = 2`, not `1`.
example : height (F := ℚ) (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2)
    (BialgHom.id ℚ _) 1 = 2 := by
  sorry

-- Test Reduction.height_gl1: for `GL_1/ℚ` with `r` the standard character, `r ⊕ r^∨ = diag(x, x⁻¹)`;
-- the real factor is `√(x_∞² + x_∞⁻²)` and the finite factors are `max(|x_p|_p, |x_p⁻¹|_p)`.
example (x : AdelicPoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1)) :
    let a : NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ :=
      ((AdelicPoints.glnEquiv ℚ 1 x : GL (Fin 1) _) : Matrix (Fin 1) (Fin 1) _) 0 0
    let b : NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ :=
      (((AdelicPoints.glnEquiv ℚ 1 x)⁻¹ : GL (Fin 1) _) : Matrix (Fin 1) (Fin 1) _) 0 0
    height (BialgHom.id ℚ _) x =
      Real.sqrt (‖NumberField.adeleInfPart ℚ a (NumberField.InfinitePlace.mk (Rat.castHom ℂ))‖ ^ 2 +
        ‖NumberField.adeleInfPart ℚ b (NumberField.InfinitePlace.mk (Rat.castHom ℂ))‖ ^ 2) *
      ∏ᶠ v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers ℚ),
        max (((TauCeti.normalizedAbsoluteValue (v.adicCompletion ℚ) (RingHom.snd _ _ a v) : ℚ≥0) : ℝ))
          (((TauCeti.normalizedAbsoluteValue (v.adicCompletion ℚ) (RingHom.snd _ _ b v) : ℚ≥0) : ℝ)) := by
  sorry

-- Test Reduction.height_not_finite_only: for `G(F_∞)` noncompact the height is unbounded; a
-- height built from the finite places alone would be bounded on `G(F_∞)`.
example (n : ℕ) (hn : 1 ≤ n) :
    ¬ BddAbove (Set.range (height (F := ℚ) (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n)
      (BialgHom.id ℚ _))) := by
  sorry

end Reduction

namespace RealSiegel

/-! Fixed-K real finiteness uses the arithmetic group obtained from an actual compact open
finite level. No finiteness or covering assertion is hidden in the hypotheses. -/
section FixedCompactFiniteness
open Reduction Reduction.GeometricRoots AdelicPoints
variable {H : Type} [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]
  {D₁ D₂ : RelativeRootData ℚ H} {P₀₁ : MinimalParabolic D₁} {P₀₂ : MinimalParabolic D₂}
  {P : StandardParabolic P₀₁} {Q : StandardParabolic P₀₂}
  {K : Subgroup (ConnectedRealPoints H)}

theorem finite_overlap (C₁ : HoroData P K) (C₂ : HoroData Q K)
    (U₁ : Set (realN P)) (W₁ : Set (realMK P C₁.u K)) (t₁ : ℝ)
    (U₂ : Set (realN Q)) (W₂ : Set (realMK Q C₂.u K)) (t₂ : ℝ)
    (hU₁ : IsCompact (closure U₁)) (hW₁ : IsCompact (closure W₁)) (ht₁ : 0 < t₁)
    (hU₂ : IsCompact (closure U₂)) (hW₂ : IsCompact (closure W₂)) (ht₂ : 0 < t₂)
    (L : Subgroup (FiniteAdelicPoints ℚ H)) (hLc : IsCompact L.carrier) (hLo : IsOpen L.carrier) :
    {γ : ConnectedRealPoints H | γ.val ∈ (levelArithmetic ℚ H 1 L).map (infiniteDiagonal ℚ H) ∧
      ((fun x => γ * x) '' siegelSet C₁ U₁ t₁ W₁ ∩ siegelSet C₂ U₂ t₂ W₂).Nonempty}.Finite := by sorry

theorem deep_distinct_disjoint (C₁ : HoroData P K) (C₂ : HoroData Q K) (hPQ : P.val ≠ Q.val)
    (U₁ : Set (realN P)) (W₁ : Set (realMK P C₁.u K))
    (U₂ : Set (realN Q)) (W₂ : Set (realMK Q C₂.u K))
    (hU₁ : IsCompact (closure U₁)) (hW₁ : IsCompact (closure W₁))
    (hU₂ : IsCompact (closure U₂)) (hW₂ : IsCompact (closure W₂)) :
    ∃ T : ℝ, 0 < T ∧ ∀ t₁ ≥ T, ∀ t₂ ≥ T,
      Disjoint (siegelSet C₁ U₁ t₁ W₁) (siegelSet C₂ U₂ t₂ W₂) := by sorry

theorem deep_self_intersection (C : HoroData P K)
    (U : Set (realN P)) (W : Set (realMK P C.u K))
    (hU : IsCompact (closure U)) (hW : IsCompact (closure W))
    (L : Subgroup (FiniteAdelicPoints ℚ H)) (hLc : IsCompact L.carrier) (hLo : IsOpen L.carrier) :
    ∃ T : ℝ, 0 < T ∧ ∀ t ≥ T, ∀ γ : ConnectedRealPoints H,
      γ.val ∈ (levelArithmetic ℚ H 1 L).map (infiniteDiagonal ℚ H) →
      ((fun x => γ * x) '' siegelSet C U t W ∩ siegelSet C U t W).Nonempty →
        γ.val ∈ subgroupPoints P.val (NumberField.InfiniteAdeleRing ℚ) := by sorry

theorem inequivalent_cusps_separate (C₁ : HoroData P K) (C₂ : HoroData Q K)
    (U₁ : Set (realN P)) (W₁ : Set (realMK P C₁.u K))
    (U₂ : Set (realN Q)) (W₂ : Set (realMK Q C₂.u K))
    (hU₁ : IsCompact (closure U₁)) (hW₁ : IsCompact (closure W₁))
    (hU₂ : IsCompact (closure U₂)) (hW₂ : IsCompact (closure W₂))
    (L : Subgroup (FiniteAdelicPoints ℚ H)) (hLc : IsCompact L.carrier) (hLo : IsOpen L.carrier)
    (hne : ∀ γ : ConnectedRealPoints H,
      γ.val ∈ (levelArithmetic ℚ H 1 L).map (infiniteDiagonal ℚ H) →
      (subgroupPoints P.val (NumberField.InfiniteAdeleRing ℚ)).map
        (MulAut.conj γ.val).toMonoidHom ≠ subgroupPoints Q.val (NumberField.InfiniteAdeleRing ℚ)) :
    ∃ T : ℝ, 0 < T ∧ ∀ t₁ ≥ T, ∀ t₂ ≥ T, ∀ γ : ConnectedRealPoints H,
      γ.val ∈ (levelArithmetic ℚ H 1 L).map (infiniteDiagonal ℚ H) →
      Disjoint ((fun x => γ * x) '' siegelSet C₁ U₁ t₁ W₁) (siegelSet C₂ U₂ t₂ W₂) := by sorry

theorem fixed_K_covering (D : RelativeRootData ℚ H) (K : Subgroup (ConnectedRealPoints H))
    (hK : Maximal (fun J : Subgroup (ConnectedRealPoints H) => IsCompact J.carrier) K)
    (L : Subgroup (FiniteAdelicPoints ℚ H)) (hLc : IsCompact L.carrier) (hLo : IsOpen L.carrier) :
    ∃ (n : ℕ) (Ds : Fin n → RelativeRootData ℚ H)
      (P₀s : ∀ i, MinimalParabolic (Ds i)) (Ps : ∀ i, StandardParabolic (P₀s i))
      (Cs : ∀ i, HoroData (Ps i) K)
      (Us : ∀ i, Set (realN (Ps i))) (Ws : ∀ i, Set (realMK (Ps i) (Cs i).u K))
      (ts : Fin n → ℝ),
      (∀ i, IsOpen (Us i) ∧ IsOpen (Ws i) ∧
        IsCompact (closure (Us i)) ∧ IsCompact (closure (Ws i)) ∧ 0 < ts i) ∧
      (∀ i j, ∀ γ : ConnectedRealPoints H,
        γ.val ∈ (levelArithmetic ℚ H 1 L).map (infiniteDiagonal ℚ H) →
        (subgroupPoints (Ps i).val (NumberField.InfiniteAdeleRing ℚ)).map
          (MulAut.conj γ.val).toMonoidHom =
            subgroupPoints (Ps j).val (NumberField.InfiniteAdeleRing ℚ) → i = j) ∧
      (∀ I : TauCeti.HopfIdeal ℚ H, IsRationalParabolic I →
        ∃ i, ∃ γ : ConnectedRealPoints H,
          γ.val ∈ (levelArithmetic ℚ H 1 L).map (infiniteDiagonal ℚ H) ∧
          (subgroupPoints I (NumberField.InfiniteAdeleRing ℚ)).map
            (MulAut.conj γ.val).toMonoidHom =
              subgroupPoints (Ps i).val (NumberField.InfiniteAdeleRing ℚ)) ∧
      ∀ g : ConnectedRealPoints H, ∃ i, ∃ γ : ConnectedRealPoints H,
        γ.val ∈ (levelArithmetic ℚ H 1 L).map (infiniteDiagonal ℚ H) ∧
          γ * g ∈ siegelSet (Cs i) (Us i) (ts i) (Ws i) := by sorry

end FixedCompactFiniteness


open Matrix

variable {n : ℕ}

/-- if `∏ B_kk ≤ D det B` then `aᵀ B a ≥ a_k² B_kk / D`. -/
theorem quadForm_ge_diag (B : Matrix (Fin n) (Fin n) ℝ) (hB : B.PosDef) (D : ℝ) (hD : 1 ≤ D)
    (hdet : ∏ k, B k k ≤ D * B.det) (a : Fin n → ℝ) (k : Fin n) :
    a k ^ 2 * B k k / D ≤ a ⬝ᵥ (B *ᵥ a) := by
  sorry

/-- bounds for the Gram matrix in one basis transfer to another
basis, with the explicit constant `C'³ L_i L_j m_i⁻²`. -/
theorem gram_offdiag_transfer (B : Matrix (Fin n) (Fin n) ℝ) (hB : B.PosDef) (C' : ℝ) (hC' : 1 ≤ C')
    (h1 : ∀ a b, |B a b| ≤ C' * B a a) (h2 : ∀ a b, a < b → B a a ≤ C' * B b b)
    (h3 : ∏ a, B a a ≤ C' * B.det) (A : Matrix (Fin n) (Fin n) ℝ) (k : Fin n → Fin n)
    (hk : ∀ i, A (k i) i ≠ 0 ∧ ∀ a, k i < a → A a i = 0) (i j : Fin n) :
    |(Aᵀ * B * A) i j| ≤ C' ^ 3 * (∑ a, |A a i|) * (∑ a, |A a j|) * |A (k i) i|⁻¹ ^ 2 *
      (Aᵀ * B * A) i i := by
  sorry

/-- with determinant control, reducedness in one basis gives
reducedness in a reordering of another, with a constant depending only on the data. -/
theorem exists_perm_isReduced (C C' : ℝ) (hC : 1 ≤ C) (hC' : 1 ≤ C') (A : GL (Fin n) ℚ) :
    ∃ C'' : ℝ, 1 < C'' ∧ ∀ b : Matrix (Fin n) (Fin n) ℝ, b.PosDef → IsReduced C' b →
      let bA := ((A.map (algebraMap ℚ ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)ᵀ * b *
        ((A.map (algebraMap ℚ ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)
      ∏ i, bA i i ≤ C * bA.det →
        ∃ σ : Equiv.Perm (Fin n), Monotone (fun i => bA (σ i) (σ i)) ∧
          IsReduced C'' (bA.submatrix σ σ) := by
  sorry

-- Test RealSiegel.sorted_diagonal: reducedness alone does not force the requested ordering.
example : IsReduced 5 (!![4, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℝ) ∧
    ¬ Monotone (fun i : Fin 2 => (!![4, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℝ) i i) ∧
    Monotone (fun i : Fin 2 => (!![4, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℝ)
      (Equiv.swap 0 1 i) (Equiv.swap 0 1 i)) := by sorry

/-- The polynomial-set-algebra spelling of Tau Ceti's semialgebraic predicate,
in the original matrix entries. BKT Definition 4.11, pp. 17–18. -/
theorem reducedSet_semialgebraic (C : ℝ) :
    {x : Fin n × Fin n → ℝ | (fun i j => x (i, j)) ∈ reducedSet C} ∈
      MeasureTheory.generateSetAlgebra
        (Set.range (fun p : MvPolynomial (Fin n × Fin n) ℝ => {x | MvPolynomial.eval x p = 0}) ∪
          Set.range (fun p : MvPolynomial (Fin n × Fin n) ℝ => {x | 0 < MvPolynomial.eval x p})) := by sorry

section RealRegularity
variable {H : Type} [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]
  {D : Reduction.RelativeRootData ℚ H} {P₀ : Reduction.MinimalParabolic D}
  {P : Reduction.StandardParabolic P₀} {K : Subgroup (ConnectedRealPoints H)}

/-- In every faithful rational matrix realization the horospherical coordinate map
has smooth local extensions to the ambient matrix space. Its inverse is polynomial
multiplication. BKT §2.2, equations (2.1)–(2.2), p. 8. -/
theorem horoDecomp_smooth (C : HoroData P K)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (hr : Function.Surjective r) (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal) :
    let e : ConnectedRealPoints H → (Fin n × Fin n → ℝ) := fun g ij =>
      (Reduction.realMatrix n w hw (TauCeti.AlgHom.mapDomain r g.val) :
        Matrix (Fin n) (Fin n) ℝ) ij.1 ij.2
    ∀ g, ∃ V : Set (Fin n × Fin n → ℝ), IsOpen V ∧ e g ∈ V ∧
      ∃ f : (Fin n × Fin n → ℝ) →
        ((Fin n × Fin n → ℝ) × (Fin n × Fin n → ℝ) × (Fin n × Fin n → ℝ)),
        ContDiffOn ℝ (↑(⊤ : ℕ∞)) f V ∧ ∀ h, e h ∈ V →
          f (e h) = (e (C.coordinates h).1.val, e (C.coordinates h).2.1.val,
            e (C.coordinates h).2.2.val) := by sorry

/-- The entire coordinate graph is semialgebraic in a faithful rational matrix realization;
the four blocks encode g,n,a,m. BKT §2.2, p. 8. -/
theorem horoDecomp_semialgebraic (C : HoroData P K)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (hr : Function.Surjective r) (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal) :
    let e : ConnectedRealPoints H → (Fin n × Fin n → ℝ) := fun g ij =>
      (Reduction.realMatrix n w hw (TauCeti.AlgHom.mapDomain r g.val) :
        Matrix (Fin n) (Fin n) ℝ) ij.1 ij.2
    Set.range (fun g : ConnectedRealPoints H => fun ij : Fin 4 × (Fin n × Fin n) =>
      (![e g, e (C.coordinates g).1.val, e (C.coordinates g).2.1.val,
        e (C.coordinates g).2.2.val] ij.1) ij.2) ∈
      MeasureTheory.generateSetAlgebra
        (Set.range (fun p : MvPolynomial (Fin 4 × (Fin n × Fin n)) ℝ =>
          {x | MvPolynomial.eval x p = 0}) ∪
        Set.range (fun p : MvPolynomial (Fin 4 × (Fin n × Fin n)) ℝ =>
          {x | 0 < MvPolynomial.eval x p})) := by sorry

/-- Relatively compact windows admit relatively compact open semialgebraic enlargements.
This applies after any of the translation containments and to each cusp in fixed_K_covering.
The predicate is the existing polynomial set algebra in faithful matrix coordinates. -/
theorem semialgebraic_window_enlargement (C : HoroData P K)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (hr : Function.Surjective r) (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal)
    (U : Set (realN P)) (W : Set (realMK P C.u K))
    (hU : IsCompact (closure U)) (hW : IsCompact (closure W)) :
    let e : ConnectedRealPoints H → (Fin n × Fin n → ℝ) := fun g ij =>
      (Reduction.realMatrix n w hw (TauCeti.AlgHom.mapDomain r g.val) :
        Matrix (Fin n) (Fin n) ℝ) ij.1 ij.2
    let A := MeasureTheory.generateSetAlgebra
      (Set.range (fun p : MvPolynomial (Fin n × Fin n) ℝ => {x | MvPolynomial.eval x p = 0}) ∪
        Set.range (fun p : MvPolynomial (Fin n × Fin n) ℝ => {x | 0 < MvPolynomial.eval x p}))
    ∃ (U' : Set (realN P)) (W' : Set (realMK P C.u K)),
      U ⊆ U' ∧ W ⊆ W' ∧ IsOpen U' ∧ IsOpen W' ∧
      IsCompact (closure U') ∧ IsCompact (closure W') ∧
      ((fun x : realN P => e x.val) '' U') ∈ A ∧
      ((fun x : realMK P C.u K => e x.val) '' W') ∈ A := by sorry

/-- Semialgebraic windows give a semialgebraic Siegel set, for any positive threshold.
BKT Definition 2.3, p. 8, with its fixed-compact convention. -/
theorem siegelSet_semialgebraic (C : HoroData P K)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (hr : Function.Surjective r) (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal)
    (U : Set (realN P)) (W : Set (realMK P C.u K)) (t : ℝ) (ht : 0 < t) :
    let e : ConnectedRealPoints H → (Fin n × Fin n → ℝ) := fun g ij =>
      (Reduction.realMatrix n w hw (TauCeti.AlgHom.mapDomain r g.val) :
        Matrix (Fin n) (Fin n) ℝ) ij.1 ij.2
    let A := MeasureTheory.generateSetAlgebra
      (Set.range (fun p : MvPolynomial (Fin n × Fin n) ℝ => {x | MvPolynomial.eval x p = 0}) ∪
        Set.range (fun p : MvPolynomial (Fin n × Fin n) ℝ => {x | 0 < MvPolynomial.eval x p}))
    ((fun x : realN P => e x.val) '' U) ∈ A →
      ((fun x : realMK P C.u K => e x.val) '' W) ∈ A →
        (e '' siegelSet C U t W) ∈ A := by sorry

/-- Reciprocal root coordinates and their inverse are smooth in ambient matrix coordinates;
the inverse is defined smoothly on the positive orthant. BKT (2.4), p. 9. -/
theorem cornerCoord_smooth (C : HoroData P K)
    (hchars : Subsingleton (RationalCharacter ℚ H))
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (hr : Function.Surjective r) (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal) :
    let e : realA P C.u → (Fin n × Fin n → ℝ) := fun a ij =>
      (Reduction.realMatrix n w hw (TauCeti.AlgHom.mapDomain r a.val.val) :
        Matrix (Fin n) (Fin n) ℝ) ij.1 ij.2
    (∀ a, ∃ V : Set (Fin n × Fin n → ℝ), IsOpen V ∧ e a ∈ V ∧
      ∃ f : (Fin n × Fin n → ℝ) → ({α // α ∈ C.simpleRoots} → ℝ),
        ContDiffOn ℝ (↑(⊤ : ℕ∞)) f V ∧ ∀ b, e b ∈ V → f (e b) = cornerCoord C b) ∧
    ∃ f : ({α // α ∈ C.simpleRoots} → ℝ) → (Fin n × Fin n → ℝ),
      ContDiffOn ℝ (↑(⊤ : ℕ∞)) f {x | ∀ α, 0 < x α} ∧ ∀ a, f (cornerCoord C a) = e a := by sorry

/-- The graph of the reciprocal-root chart is semialgebraic, in the same realization.
Together with cornerCoord_homeomorphism and cornerCoord_smooth this is the Nash chart. -/
theorem cornerCoord_semialgebraic (C : HoroData P K)
    (hchars : Subsingleton (RationalCharacter ℚ H))
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (hr : Function.Surjective r) (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal) :
    let e : realA P C.u → (Fin n × Fin n → ℝ) := fun a ij =>
      (Reduction.realMatrix n w hw (TauCeti.AlgHom.mapDomain r a.val.val) :
        Matrix (Fin n) (Fin n) ℝ) ij.1 ij.2
    Set.range (fun a : realA P C.u => Sum.elim (e a) (cornerCoord C a)) ∈
      MeasureTheory.generateSetAlgebra
        (Set.range (fun p : MvPolynomial ((Fin n × Fin n) ⊕ {α // α ∈ C.simpleRoots}) ℝ =>
          {x | MvPolynomial.eval x p = 0}) ∪
        Set.range (fun p : MvPolynomial ((Fin n × Fin n) ⊕ {α // α ∈ C.simpleRoots}) ℝ =>
          {x | 0 < MvPolynomial.eval x p})) := by sorry

end RealRegularity

/-- every positive definite form is `GL_n(ℤ)`-equivalent to a reduced
one. -/
theorem exists_reduced_GLZ : ∃ C : ℝ, 0 < C ∧ ∀ b : Matrix (Fin n) (Fin n) ℝ, b.PosDef →
    ∃ γ : GL (Fin n) ℤ, IsReduced C
      (((γ.map (Int.castRingHom ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)ᵀ * b *
        ((γ.map (Int.castRingHom ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)) := by
  sorry

end RealSiegel

namespace Reduction

/-- `GL_n(𝔸_{ℚ,f}) = GL_n(ℚ) GL_n(ℤ̂)`, for the standard model. -/
theorem gln_classes_subsingleton (n : ℕ) :
    Subsingleton (DoubleCoset.Quotient
      ((AdelicPoints.finiteDiagonal ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n)).range :
        Set (AdelicPoints.FiniteAdelicPoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n)))
      (IntegralModel.standardGLn (F := ℚ) (S := ∅) n).integralLevel) := by
  sorry

/-- Real integral reduction implies full adelic reduction for `GL_n/ℚ`.
The real-domain hypothesis is independent of the asserted adelic covering.
Borel, Lemma 4.4, p. 17, inverted to the left-quotient convention. -/
theorem gln_adelic_reduction (n : ℕ) (hn : 0 < n)
    (domain : Set (AdelicPoints.InfinitePoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n)))
    (hdomain : ∀ g : AdelicPoints.InfinitePoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n),
      ∃ γ : levelArithmetic ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) 1
          (IntegralModel.standardGLn (F := ℚ) (S := ∅) n).integralLevel,
        ∃ s ∈ domain, g = infiniteDiagonal ℚ _ γ.val * s) :
    ∀ x : AdelicPoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n),
      ∃ (γ : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐ[ℚ] ℚ))
        (s : AdelicPoints.InfinitePoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n))
        (u : (IntegralModel.standardGLn (F := ℚ) (S := ∅) n).integralLevel),
        s ∈ domain ∧ x = AdelicPoints.diagonal ℚ _ γ *
          AdelicPoints.infiniteEmbed ℚ _ s * AdelicPoints.finiteEmbed ℚ _ u.val := by
  sorry

/-- A compact finite-adelic set bounds denominators of a rational representation and
its inverse at once. Borel, proof of Lemma 4.3, p. 17. -/
theorem compact_finite_denominators {F : Type} [Field F] [NumberField F]
    {H : Type} [CommRing H] [HopfAlgebra F H] [Algebra.FiniteType F H] {n : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H)
    (C : Set (AdelicPoints.FiniteAdelicPoints F H)) (hC : IsCompact C) :
    ∃ d : NumberField.RingOfIntegers F, d ≠ 0 ∧
      ∀ γ : WithConv (H →ₐ[F] F), AdelicPoints.finiteDiagonal F H γ ∈ C →
        ∀ i j : Fin n,
          IsIntegral ℤ ((d : F) *
            ((TauCeti.GeneralLinear.pointsMulEquiv n (TauCeti.AlgHom.mapDomain r γ) :
              Matrix (Fin n) (Fin n) F) i j)) ∧
          IsIntegral ℤ ((d : F) *
            (((TauCeti.GeneralLinear.pointsMulEquiv n (TauCeti.AlgHom.mapDomain r γ))⁻¹ :
              Matrix (Fin n) (Fin n) F) i j)) := by
  sorry

/-- In a chosen rational basis, one denominator clears every rational vector in the
finite-adelic orbit of a fixed vector over a compact set. Borel, Lemma 4.3, p. 17. -/
theorem compact_finite_orbit_denominators {F : Type} [Field F] [NumberField F]
    {H : Type} [CommRing H] [HopfAlgebra F H] [Algebra.FiniteType F H] {n : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H) (w : Fin n → F)
    (C : Set (AdelicPoints.FiniteAdelicPoints F H)) (hC : IsCompact C) :
    ∃ d : NumberField.RingOfIntegers F, d ≠ 0 ∧ ∀ v : Fin n → F,
      (∃ x ∈ C, ∀ j,
        (algebraMap F (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F)) (v j) =
          ∑ i, algebraMap F _ (w i) *
            ((TauCeti.GeneralLinear.pointsMulEquiv n (TauCeti.AlgHom.mapDomain r x) :
              Matrix (Fin n) (Fin n) _) i j)) →
        ∀ j, IsIntegral ℤ ((d : F) * v j) := by
  sorry

theorem gln_levelArithmetic (n : ℕ) :
    (levelArithmetic ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) 1
        (IntegralModel.standardGLn (F := ℚ) (S := ∅) n).integralLevel).map
      (TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) n).toMonoidHom =
      (Matrix.GeneralLinearGroup.map (Int.castRingHom ℚ)).range := by
  sorry

end Reduction

/-! ## Layer 5: GL₂ over ℚ: components, congruence groups and change of level

`GL (Fin 2) 𝔸_f` carries the topology of units of the matrix ring over Mathlib's finite adeles,
which is the evaluation topology of AA.1 for `GL₂`. The level quotient
`GL₂(ℚ)\GL₂(𝔸)/K∞U` with `K∞ = ℝ^×SO(2)` is written in the equivalent form
`GL₂(ℚ)^+\(ℍ × GL₂(𝔸_f)/U)`: identifies `GL₂(ℝ)/K∞` with `ℍ±`,
and a rational matrix of negative determinant exchanges the two half-planes. The
Riemann-surface structure on `Γ\ℍ` is the usual coarse Fuchsian quotient structure. -/

namespace AdelicExamples.GL2

open scoped MatrixGroups UpperHalfPlane
open Matrix

/-- The finite adeles of `ℚ`. -/
abbrev Af := IsDedekindDomain.FiniteAdeleRing ℤ ℚ

/-- `x ∈ ℤ̂`: every component of `x` lies in `ℤ_p`. -/
def IsAdelicInteger (x : Af) : Prop :=
  ∀ v : IsDedekindDomain.HeightOneSpectrum ℤ, x v ∈ v.adicCompletionIntegers ℚ

/-- `x ≡ y mod N` in `ℤ̂`: `x - y ∈ Nℤ̂`, including equality when `N = 0`. -/
def CongrMod (N : ℕ) (x y : Af) : Prop :=
  ∃ z : Af, IsAdelicInteger z ∧ x - y = (N : Af) * z

/-- Congruence modulo zero is equality, not a condition obtained by dividing by zero. -/
example (x y : Af) : CongrMod 0 x y ↔ x = y := by
  sorry

/-- Modulo one, integral differences are congruent. -/
example : CongrMod 1 (1 : Af) 0 := by
  sorry

/-- The unit difference is not divisible by two in the integral finite adeles. -/
example : ¬ CongrMod 2 (1 : Af) 0 := by
  sorry

/-- The inverse-based formula collapses at zero modulus. -/
example : IsAdelicInteger (algebraMap ℚ Af ((0 : ℚ)⁻¹) * ((1 : Af) - 0)) ∧
    ¬ CongrMod 0 (1 : Af) 0 := by
  sorry

/-- The diagonal embedding `GL₂(ℚ) → GL₂(𝔸_f)`. -/
def diag : GL (Fin 2) ℚ →* GL (Fin 2) Af := Matrix.GeneralLinearGroup.map (algebraMap ℚ Af)

/-- Rational matrices as real matrices; `GL₂(ℚ)^+` acts on `ℍ` through Mathlib's `glAction`. -/
def toReal : GL (Fin 2) ℚ →* GL (Fin 2) ℝ := Matrix.GeneralLinearGroup.map (Rat.castHom ℝ)

/-- `ℤ̂^×` inside `𝔸_f^×`. -/
def zhatUnits : Subgroup Afˣ where
  carrier := {x | IsAdelicInteger (x : Af) ∧ IsAdelicInteger ((x⁻¹ : Afˣ) : Af)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `GL₂(ℤ̂)`: integral matrices with integral inverse. -/
def GL2Zhat : Subgroup (GL (Fin 2) Af) where
  carrier := {g | ∀ i j, IsAdelicInteger ((g : Matrix (Fin 2) (Fin 2) Af) i j) ∧
    IsAdelicInteger (((g⁻¹ : GL (Fin 2) Af) : Matrix (Fin 2) (Fin 2) Af) i j)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `K(N) = ker(GL₂(ℤ̂) → GL₂(ℤ/N))`. -/
def principalLevel (N : ℕ) : Subgroup (GL (Fin 2) Af) where
  carrier := {g | g ∈ GL2Zhat ∧
    ∀ i j, CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) i j) ((1 : Matrix (Fin 2) (Fin 2) Af) i j)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `K₀(N)`: matrices of `GL₂(ℤ̂)` with `c ≡ 0 mod N`. -/
def level0 (N : ℕ) : Subgroup (GL (Fin 2) Af) where
  carrier := {g | g ∈ GL2Zhat ∧ CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) 1 0) 0}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `K₁(N)`: matrices of `GL₂(ℤ̂)` with `c ≡ 0` and `d ≡ 1 mod N`. -/
def level1 (N : ℕ) : Subgroup (GL (Fin 2) Af) where
  carrier := {g | g ∈ GL2Zhat ∧ CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) 1 0) 0 ∧
    CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) 1 1) 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem principalLevel_le_level1 (N : ℕ) : principalLevel N ≤ level1 N := by
  sorry

theorem level1_le_level0 (N : ℕ) : level1 N ≤ level0 N := by
  sorry

theorem isOpen_principalLevel (N : ℕ) (hN : 0 < N) :
    IsOpen (principalLevel N : Set (GL (Fin 2) Af)) := by
  sorry

theorem isCompact_principalLevel (N : ℕ) : IsCompact (principalLevel N : Set (GL (Fin 2) Af)) := by
  sorry

/-- The principal levels form a neighbourhood basis of `1` in `GL₂(𝔸_f)`. -/
theorem exists_principalLevel_le {V : Set (GL (Fin 2) Af)} (hV : V ∈ 𝓝 (1 : GL (Fin 2) Af)) :
    ∃ M : ℕ, 0 < M ∧ (principalLevel M : Set (GL (Fin 2) Af)) ⊆ V := by
  sorry

/-! ### The component groups `Γ_{g,U}` -/

/-- `Γ_{g,U} = GL₂(ℚ)^+ ∩ gUg⁻¹`, with `GL₂(ℚ)` embedded diagonally. -/
def componentGroup (U : Subgroup (GL (Fin 2) Af)) (g : GL (Fin 2) Af) : Subgroup (GL (Fin 2) ℚ) :=
  GLPos (Fin 2) ℚ ⊓ (U.map (MulAut.conj g).toMonoidHom).comap diag

/-- The image of `Γ_{g,U}` in `GL₂(ℝ)`, acting on `ℍ` by Möbius transformations. -/
def componentGroupReal (U : Subgroup (GL (Fin 2) Af)) (g : GL (Fin 2) Af) :
    Subgroup (GL (Fin 2) ℝ) :=
  (componentGroup U g).map toReal

variable {U U' : Subgroup (GL (Fin 2) Af)}

/-- elements of `Γ_{g,U}` have determinant one, since
`det U ⊆ ℤ̂^×` and `ℚ_{>0} ∩ ℤ̂^× = {1}`. -/
theorem det_eq_one_of_mem_componentGroup (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (g : GL (Fin 2) Af) {γ : GL (Fin 2) ℚ} (hγ : γ ∈ componentGroup U g) :
    Matrix.GeneralLinearGroup.det γ = 1 := by
  sorry

/-- If `K(M) ⊆ gUg⁻¹` then `Γ(M) ⊆ Γ_{g,U}`. -/
theorem gamma_le_componentGroup (g : GL (Fin 2) Af) {M : ℕ}
    (hM : principalLevel M ≤ U.map (MulAut.conj g).toMonoidHom) :
    (CongruenceSubgroup.Gamma M).map (SpecialLinearGroup.mapGL ℚ) ≤ componentGroup U g := by
  sorry

/-- `Γ_{g,U}` is commensurable with `SL₂(ℤ)`: its real image is arithmetic in Mathlib's sense.
Consequently it is discrete and acts properly discontinuously on `ℍ`
(`Subgroup.IsArithmetic.discreteTopology`, `Subgroup.IsArithmetic.properlyDiscontinuous`). -/
theorem isArithmetic_componentGroupReal (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (g : GL (Fin 2) Af) :
    (componentGroupReal U g).IsArithmetic := by
  sorry

-- Test: the component quotient is Hausdorff, from proper discontinuity.
example (hU : IsCompact (U : Set (GL (Fin 2) Af))) (hUo : IsOpen (U : Set (GL (Fin 2) Af)))
    (g : GL (Fin 2) Af) :
    T2Space (Quotient (MulAction.orbitRel (componentGroupReal U g) ℍ)) := by
  have := isArithmetic_componentGroupReal hU hUo g
  infer_instance

/-- Changing the representative `g` to `qgu` conjugates the component group by `q`. -/
theorem componentGroup_mul (g : GL (Fin 2) Af) {q : GL (Fin 2) ℚ} (hq : q ∈ GLPos (Fin 2) ℚ)
    {u : GL (Fin 2) Af} (hu : u ∈ U) :
    componentGroup U (diag q * g * u) = (componentGroup U g).map (MulAut.conj q).toMonoidHom := by
  sorry

/-- `z ↦ q • z` induces a homeomorphism `Γ_{g,U}\ℍ ≃ Γ_{qgu,U}\ℍ`; it is a biholomorphism for
the Fuchsian-orbifold complex structures. -/
def conjQuotientHomeomorph (g : GL (Fin 2) Af) {q : GL (Fin 2) ℚ} (hq : q ∈ GLPos (Fin 2) ℚ)
    {u : GL (Fin 2) Af} (hu : u ∈ U) :
    MulAction.orbitRel.Quotient (componentGroupReal U g) ℍ ≃ₜ
      MulAction.orbitRel.Quotient (componentGroupReal U (diag q * g * u)) ℍ :=
  sorry

theorem conjQuotientHomeomorph_mk (g : GL (Fin 2) Af) {q : GL (Fin 2) ℚ}
    (hq : q ∈ GLPos (Fin 2) ℚ) {u : GL (Fin 2) Af} (hu : u ∈ U) (z : ℍ) :
    conjQuotientHomeomorph g hq hu (Quotient.mk'' z) = Quotient.mk'' (toReal q • z) := by
  sorry

theorem componentGroup_mono (h : U' ≤ U) (g : GL (Fin 2) Af) :
    componentGroup U' g ≤ componentGroup U g := by
  sorry

/-- For compact open `U' ≤ U`, `Γ_{g,U'}` has finite index in `Γ_{g,U}`. -/
theorem relIndex_componentGroup_ne_zero (h : U' ≤ U) (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hU'o : IsOpen (U' : Set (GL (Fin 2) Af))) (g : GL (Fin 2) Af) :
    (componentGroup U' g).relIndex (componentGroup U g) ≠ 0 := by
  sorry

/-- The quotient map `Γ_{g,U'}\ℍ → Γ_{g,U}\ℍ` induced by the identity of `ℍ`; it is a finite
holomorphic map of the Fuchsian-orbifold Riemann surfaces. -/
def componentLevelMap (h : U' ≤ U) (g : GL (Fin 2) Af) :
    MulAction.orbitRel.Quotient (componentGroupReal U' g) ℍ →
      MulAction.orbitRel.Quotient (componentGroupReal U g) ℍ :=
  sorry

theorem componentLevelMap_mk (h : U' ≤ U) (g : GL (Fin 2) Af) (z : ℍ) :
    componentLevelMap h g (Quotient.mk'' z) = Quotient.mk'' z := by
  sorry

theorem continuous_componentLevelMap (h : U' ≤ U) (g : GL (Fin 2) Af) :
    Continuous (componentLevelMap h g) := by
  sorry

theorem finite_fibre_componentLevelMap (h : U' ≤ U) (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hU'o : IsOpen (U' : Set (GL (Fin 2) Af))) (g : GL (Fin 2) Af)
    (x : MulAction.orbitRel.Quotient (componentGroupReal U g) ℍ) :
    (componentLevelMap h g ⁻¹' {x}).Finite := by
  sorry

/-! ### The level quotient and its components -/

/-- `GL₂(ℚ)^+`, embedded diagonally in `GL₂(𝔸_f)`. -/
def ratPos : Subgroup (GL (Fin 2) Af) := (GLPos (Fin 2) ℚ).map diag

/-- The components `GL₂(ℚ)^+\GL₂(𝔸_f)/U`. -/
abbrev Components (U : Subgroup (GL (Fin 2) Af)) :=
  DoubleCoset.Quotient (ratPos : Set (GL (Fin 2) Af)) U

/-- `(z, a) ∼ (q • z, q a u)` for `q ∈ GL₂(ℚ)^+` and `u ∈ U`. -/
def levelSetoid (U : Subgroup (GL (Fin 2) Af)) : Setoid (ℍ × GL (Fin 2) Af) where
  r x y := ∃ q ∈ GLPos (Fin 2) ℚ, ∃ u ∈ U, y.1 = toReal q • x.1 ∧ y.2 = diag q * x.2 * u
  iseqv := sorry

/-- The level quotient `X_U = GL₂(ℚ)^+\(ℍ × GL₂(𝔸_f)/U)`, with the quotient topology. -/
abbrev LevelSpace (U : Subgroup (GL (Fin 2) Af)) := Quotient (levelSetoid U)

/-- for representatives `rep c` of the components,
`[z] ↦ [(z, rep c)]` is a homeomorphism `⊔_c Γ_{rep c, U}\ℍ ≃ X_U`. -/
def componentHomeomorph (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (rep : Components U → GL (Fin 2) Af)
    (hrep : ∀ c, DoubleCoset.mk ratPos U (rep c) = c) :
    (Σ c : Components U, MulAction.orbitRel.Quotient (componentGroupReal U (rep c)) ℍ) ≃ₜ
      LevelSpace U :=
  sorry

theorem componentHomeomorph_mk (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (rep : Components U → GL (Fin 2) Af)
    (hrep : ∀ c, DoubleCoset.mk ratPos U (rep c) = c)
    (c : Components U) (z : ℍ) :
    componentHomeomorph hU hUo rep hrep ⟨c, Quotient.mk'' z⟩ =
      (Quotient.mk (levelSetoid U) (z, rep c) : LevelSpace U) := by
  sorry

/-- `ℚ_{>0}` inside `𝔸_f^×`. -/
def posRatIdeles : Subgroup Afˣ :=
  (Units.posSubgroup ℚ).map (IsDedekindDomain.FiniteAdeleRing.unitEmbedding ℤ ℚ)

/-- The determinant identifies the components with `ℚ_{>0}\𝔸_f^×/det U`. -/
def componentsEquivDet (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) :
    Components U ≃ (Afˣ ⧸ (posRatIdeles ⊔ U.map Matrix.GeneralLinearGroup.det)) :=
  sorry

theorem componentsEquivDet_mk (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (g : GL (Fin 2) Af) :
    componentsEquivDet hU hUo (DoubleCoset.mk _ _ g) =
      QuotientGroup.mk (Matrix.GeneralLinearGroup.det g) := by
  sorry

theorem finite_components (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) : Finite (Components U) := by
  sorry

/-- With `det U = ℤ̂^×` there is a single component. -/
theorem subsingleton_components (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af)))
    (hdet : U.map Matrix.GeneralLinearGroup.det = zhatUnits) : Subsingleton (Components U) := by
  sorry

-- Test: at level `GL₂(ℤ̂)` the quotient is the single component `SL₂(ℤ)\ℍ`.
example : componentGroup GL2Zhat 1 = (⊤ : Subgroup SL(2, ℤ)).map (SpecialLinearGroup.mapGL ℚ) := by
  sorry

/-! ### Principal and standard levels -/

/-- `det K(N)` is the group of `x ∈ ℤ̂^×` with `x ≡ 1 mod N`. -/
theorem map_det_principalLevel (N : ℕ) (hN : 0 < N) :
    ((principalLevel N).map Matrix.GeneralLinearGroup.det : Set Afˣ) =
      {x | x ∈ zhatUnits ∧ CongrMod N (x : Af) 1} := by
  sorry

/-- The components of `X_{K(N)}` are indexed by `(ℤ/N)^×`: through `componentsEquivDet` and
`map_det_principalLevel` they are `ℤ̂^×/(1 + Nℤ̂)`. Only the indexing is asserted; no particular
bijection is specified. -/
theorem nonempty_componentsPrincipalEquiv (N : ℕ) (hN : 0 < N) :
    Nonempty (Components (principalLevel N) ≃ (ZMod N)ˣ) := by
  sorry

/-- Each component group at level `K(N)`, for a representative in `GL₂(ℤ̂)`, is `Γ(N)`. -/
theorem componentGroup_principalLevel (N : ℕ) (hN : 0 < N) {g : GL (Fin 2) Af}
    (hg : g ∈ GL2Zhat) :
    componentGroup (principalLevel N) g =
      (CongruenceSubgroup.Gamma N).map (SpecialLinearGroup.mapGL ℚ) := by
  sorry

-- Test: `N = 1` and `N = 2` give one component.
example : Nat.card (Components (principalLevel 1)) = 1 ∧
    Nat.card (Components (principalLevel 2)) = 1 := by
  sorry

/-- `K₀(N)` and `K₁(N)` have determinant `ℤ̂^×`, so their level
quotients are connected. -/
theorem map_det_level0 (N : ℕ) (hN : 0 < N) :
    (level0 N).map Matrix.GeneralLinearGroup.det = zhatUnits := by
  sorry

theorem map_det_level1 (N : ℕ) (hN : 0 < N) :
    (level1 N).map Matrix.GeneralLinearGroup.det = zhatUnits := by
  sorry

theorem componentGroup_level0 (N : ℕ) (hN : 0 < N) :
    componentGroup (level0 N) 1 =
      (CongruenceSubgroup.Gamma0 N).map (SpecialLinearGroup.mapGL ℚ) := by
  sorry

theorem componentGroup_level1 (N : ℕ) (hN : 0 < N) :
    componentGroup (level1 N) 1 =
      (CongruenceSubgroup.Gamma1 N).map (SpecialLinearGroup.mapGL ℚ) := by
  sorry

-- Test GL2.componentGroup_level_one: level one recovers the full integral special linear group.
example : componentGroup (principalLevel 1) 1 =
    (CongruenceSubgroup.Gamma 1).map (SpecialLinearGroup.mapGL ℚ) :=
  componentGroup_principalLevel 1 (by decide) (Subgroup.one_mem _)

-- Test GL2.componentGroup_sign: minus one survives at level two but not at level three.
example : (-1 : GL (Fin 2) ℚ) ∈ componentGroup (principalLevel 2) 1 ∧
    (-1 : GL (Fin 2) ℚ) ∉ componentGroup (principalLevel 3) 1 := by
  sorry

-- Test GL2.componentGroup_unipotent: the upper entry distinguishes principal from Gamma_1 level.
example :
    let u : GL (Fin 2) ℚ := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![1, 1; 0, 1]) (by norm_num [Matrix.det_fin_two]);
    u ∈ componentGroup (level0 3) 1 ∧ u ∈ componentGroup (level1 3) 1 ∧
      u ∉ componentGroup (principalLevel 3) 1 := by
  sorry

/-- The projection `X_{U'} → X_U` for `U' ≤ U`. -/
def levelMap (h : U' ≤ U) : LevelSpace U' → LevelSpace U :=
  Quotient.map' id (by sorry)

theorem levelMap_mk (h : U' ≤ U) (z : ℍ) (a : GL (Fin 2) Af) :
    levelMap h (Quotient.mk (levelSetoid U') (z, a)) = Quotient.mk (levelSetoid U) (z, a) := by
  sorry

theorem continuous_levelMap (h : U' ≤ U) : Continuous (levelMap h) := by
  sorry

/-- On components, the projection is `z ↦ q⁻¹ • z` followed by the finite-index quotient map: if
`g' = q g u` with `q ∈ GL₂(ℚ)^+` and `u ∈ U`, the class of `(z, g')` maps to that of `(q⁻¹ • z, g)`. -/
theorem levelMap_component (h : U' ≤ U) {g g' : GL (Fin 2) Af} {q : GL (Fin 2) ℚ}
    (hq : q ∈ GLPos (Fin 2) ℚ) {u : GL (Fin 2) Af} (hu : u ∈ U) (hg' : g' = diag q * g * u)
    (z : ℍ) :
    levelMap h (Quotient.mk (levelSetoid U') (z, g')) =
      Quotient.mk (levelSetoid U) (toReal q⁻¹ • z, g) := by
  sorry

/-- Right translation `T(h) : X_U → X_{h⁻¹Uh}`, `[(z, a)] ↦ [(z, a h)]`; a biholomorphism for the
transported complex structures. -/
def translate (h : GL (Fin 2) Af) :
    LevelSpace U ≃ₜ LevelSpace (U.map (MulAut.conj h⁻¹).toMonoidHom) :=
  sorry

theorem translate_mk (h : GL (Fin 2) Af) (z : ℍ) (a : GL (Fin 2) Af) :
    translate (U := U) h (Quotient.mk (levelSetoid U) (z, a)) =
      Quotient.mk (levelSetoid (U.map (MulAut.conj h⁻¹).toMonoidHom)) (z, a * h) := by
  sorry

-- Test: on the component of `1`, `K(N) ≤ K₁(N) ≤ K₀(N)` induce `Γ(N)\ℍ → Γ₁(N)\ℍ → Γ₀(N)\ℍ`.
example (N : ℕ) (hN : 0 < N) :
    componentGroup (principalLevel N) 1 ≤ componentGroup (level1 N) 1 ∧
      componentGroup (level1 N) 1 ≤ componentGroup (level0 N) 1 :=
  ⟨componentGroup_mono (principalLevel_le_level1 N) 1,
    componentGroup_mono (level1_le_level0 N) 1⟩

/-! ### `K∞ = ℝ^×O(2)` and the folded half-plane -/

/-- The components `GL₂(ℚ)\GL₂(𝔸_f)/U` for `K∞ = ℝ^×O(2)`. -/
abbrev ComponentsO2 (U : Subgroup (GL (Fin 2) Af)) :=
  DoubleCoset.Quotient (diag.range : Set (GL (Fin 2) Af)) U

/-- At level `K(N)` the `O(2)` components are indexed by `(ℤ/N)^×/{±1}`; only the indexing is
asserted. -/
theorem nonempty_componentsO2PrincipalEquiv (N : ℕ) (hN : 0 < N) :
    Nonempty (ComponentsO2 (principalLevel N) ≃ (ZMod N)ˣ ⧸ Subgroup.zpowers (-1 : (ZMod N)ˣ)) := by
  sorry

-- Test: at `N = 3` the `SO(2)` quotient has two components and the `O(2)` quotient one.
example : Nat.card (Components (principalLevel 3)) = 2 ∧
    Nat.card (ComponentsO2 (principalLevel 3)) = 1 := by
  sorry

-- Test: at `N = 5` the counts are four and two.
example : Nat.card (Components (principalLevel 5)) = 4 ∧
    Nat.card (ComponentsO2 (principalLevel 5)) = 2 := by
  sorry

/-! Neatness and Hecke degrees at `GL₂` levels, for the standard representation. -/

/-- The standard representation `GL₂(ℚ) → GL₂(ℂ)`. -/
def toComplex : GL (Fin 2) ℚ →* GL (Fin 2) ℂ := Matrix.GeneralLinearGroup.map (Rat.castHom ℂ)

-- Test Neat.isNeatLevel_U3: `U(3) = K(3)` is neat: every `GL₂(ℚ) ∩ x K(3) x⁻¹` is neat.
example (x : GL (Fin 2) Af) :
    ∀ γ ∈ ((principalLevel 3).map (MulAut.conj x).toMonoidHom).comap diag,
      Neat.IsNeatAut (toComplex γ) := by
  sorry

-- Test Neat.not_isNeatLevel_GL2Zhat: `GL₂(ℤ̂)` is not neat, since it contains `-1 ∈ GL₂(ℤ)`.
example : -1 ∈ GL2Zhat.comap diag ∧ ¬ Neat.IsNeatAut (toComplex (-1)) := by
  sorry

/-- `diag(p, 1)`. -/
def diagP (p : ℕ) [Fact p.Prime] : GL (Fin 2) Af :=
  diag (Matrix.GeneralLinearGroup.mkOfDetNeZero !![(p : ℚ), 0; 0, 1] (by sorry))

-- Test LevelMaps.hecke_Tp_degree: for `U = GL₂(ℤ̂)` and `g = diag(p, 1)`, `[U : U ∩ gUg⁻¹] = p + 1`.
example (p : ℕ) [Fact p.Prime] :
    (GL2Zhat ⊓ GL2Zhat.map (MulAut.conj (diagP p)).toMonoidHom).relIndex GL2Zhat = p + 1 := by
  sorry

-- Test Reduction.levelArithmetic_gl2: `GL₂(ℚ) ∩ GL₂(ℤ̂) = GL₂(ℤ)`.
example : GL2Zhat.comap diag = (Matrix.GeneralLinearGroup.map (Int.castRingHom ℚ)).range := by
  sorry

-- Test Reduction.levelArithmetic_not_conj_invariant: the arithmetic group depends on `x`: at
-- `x = diag(p, 1)` it is `diag(p,1) GL₂(ℤ) diag(p,1)⁻¹ ≠ GL₂(ℤ)`.
example (p : ℕ) [Fact p.Prime] :
    (GL2Zhat.map (MulAut.conj (diagP p)).toMonoidHom).comap diag ≠ GL2Zhat.comap diag := by
  sorry

end AdelicExamples.GL2

/-! ## Layer 5: GL₁ over a number field: idele classes, units and the quotients `X_Q`

`G_m(𝔸_F)` is identified with the idele group by `AdelicPoints.gmEquiv`; the statements below are
written on Mathlib's ideles. -/

namespace AdelicExamples.GL1

open _root_.NumberField NumberField

variable (F : Type) [Field F] [NumberField F]

/-- `G_m(F)\G_m(𝔸_F)` is the idele class group. -/
def quotientHomeomorph :
    MulAction.orbitRel.Quotient (AdelicPoints.diagonal F (LaurentPolynomial F)).range
        (AdelicPoints F (LaurentPolynomial F)) ≃ₜ
      IdeleClassGroup (RingOfIntegers F) F :=
  sorry

theorem quotientHomeomorph_mk (x : AdelicPoints F (LaurentPolynomial F)) :
    quotientHomeomorph F (Quotient.mk'' x) = QuotientGroup.mk (AdelicPoints.gmEquiv F x) := by
  sorry

/-- The real number `t` in the completion `F_w`. -/
def archComponent (t : ℝ) (w : InfinitePlace F) : w.Completion :=
  if hw : w.IsReal then (InfinitePlace.Completion.ringEquivRealOfIsReal hw).symm t
  else (InfinitePlace.Completion.ringEquivComplexOfIsComplex
    (InfinitePlace.not_isReal_iff_isComplex.mp hw)).symm (t : ℂ)

/-- The idele with component `t` at every archimedean place and `1` at every finite place
(for `t = 0` the junk value `1`). -/
def archimedeanScalar (t : ℝ) : IdeleGroup (RingOfIntegers F) F :=
  if ht : t = 0 then 1 else
    { val := ((fun w => archComponent F t w : InfiniteAdeleRing F), 1)
      inv := ((fun w => archComponent F t⁻¹ w : InfiniteAdeleRing F), 1)
      val_inv := by sorry
      inv_val := by sorry }

/-- `ℝ_{>0}`, embedded diagonally at the archimedean places. -/
def posRealsDiag : Subgroup (IdeleGroup (RingOfIntegers F) F) where
  carrier := {x | ∃ t : ℝ, 0 < t ∧ x = archimedeanScalar F t}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem ideleNorm_archimedeanScalar (t : ℝ) (ht : 0 < t) :
    ideleNorm F (archimedeanScalar F t) = t ^ Module.finrank ℚ F := by
  sorry

/-- At degree two, the positive diagonal scalar two has idele norm four. -/
example (hF : Module.finrank ℚ F = 2) :
    ideleNorm F (archimedeanScalar F 2) = 4 := by
  rw [ideleNorm_archimedeanScalar F 2 (by norm_num), hF]
  norm_num

/-- `A_{G_m}(ℝ)^0 = ℝ_{>0}` embedded diagonally. -/
theorem map_splitComponent :
    (AdelicPoints.SplitComponent F (LaurentPolynomial F)).map (AdelicPoints.gmEquiv F).toMonoidHom =
      posRealsDiag F := by
  sorry

/-- `𝔸_F^× = 𝔸_F^1 × ℝ_{>0}`. -/
def normOneProdEquiv : (normOneIdeles F × posRealsDiag F) ≃ₜ* IdeleGroup (RingOfIntegers F) F :=
  sorry

theorem normOneProdEquiv_apply (x : normOneIdeles F × posRealsDiag F) :
    normOneProdEquiv F x = (x.1 : IdeleGroup (RingOfIntegers F) F) * x.2 := by
  sorry

theorem not_compactSpace_ideleClassGroup :
    ¬ CompactSpace (IdeleClassGroup (RingOfIntegers F) F) := by
  sorry

/-- `Ô^× = ∏_v 𝒪_v^×` inside `𝔸_{F,f}^×`: Tau Ceti's `IsDedekindDomain.FiniteAdeleRing.integralUnits`. -/
abbrev integralUnits : Subgroup (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ :=
  IsDedekindDomain.FiniteAdeleRing.integralUnits (RingOfIntegers F) F

-- Test LevelMaps.LevelQuotient.gl1_rat: for `GL_1/ℚ`, `U = ℤ̂^×` and `K∞ = ℝ^×`, `X_U` is a point.
example : Subsingleton (LevelMaps.LevelQuotient ℚ (LaurentPolynomial ℚ)
    ((integralUnits ℚ).comap (AdelicPoints.gmFiniteEquiv ℚ).toMonoidHom) ⊤) := by
  sorry

-- Test Reduction.levelArithmetic_trivial_group: `ℚ^× ∩ ℤ̂^× = {±1}`, and with the congruence
-- condition `u ≡ 1 mod N`, `N ≥ 3`, the intersection is trivial.
example : (integralUnits ℚ).comap (IsDedekindDomain.FiniteAdeleRing.unitEmbedding (RingOfIntegers ℚ) ℚ) =
    Subgroup.zpowers (-1) := by
  sorry

example (N : ℕ) (hN : 3 ≤ N) :
    {q : ℚˣ | IsDedekindDomain.FiniteAdeleRing.unitEmbedding (RingOfIntegers ℚ) ℚ q ∈ integralUnits ℚ ∧
      ∀ v : IsDedekindDomain.HeightOneSpectrum (RingOfIntegers ℚ),
        (algebraMap ℚ (v.adicCompletion ℚ) (N : ℚ))⁻¹ * (algebraMap ℚ (v.adicCompletion ℚ) q - 1) ∈
          v.adicCompletionIntegers ℚ} = {1} := by
  sorry

/-- The global units in a subgroup `U ≤ Ô^×`: `Γ_U = F^× ∩ U`, as units of `𝒪_F`. -/
def levelUnits (U : Subgroup (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ) :
    Subgroup (RingOfIntegers F)ˣ :=
  U.comap ((IsDedekindDomain.FiniteAdeleRing.unitEmbedding (RingOfIntegers F) F).comp
    (Units.map (algebraMap (RingOfIntegers F) F).toMonoidHom))

/-- for compact open `U ≤ Ô^×`, `Γ_U` has finite index in `𝒪_F^×` and
its logarithmic image is a lattice of rank `r₁ + r₂ - 1`. -/
theorem levelUnits_finiteIndex (U : Subgroup (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ)
    (hU : IsOpen (U : Set (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ))
    (hle : U ≤ integralUnits F) : (levelUnits F U).FiniteIndex := by
  sorry

theorem levelUnits_lattice (U : Subgroup (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ)
    (hU : IsOpen (U : Set (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ))
    (hle : U ≤ integralUnits F) :
    DiscreteTopology (AddSubgroup.closure
        ((Units.logEmbedding F ∘ Additive.ofMul) '' (levelUnits F U : Set (RingOfIntegers F)ˣ))) ∧
      Module.finrank ℤ (Submodule.span ℤ
        ((Units.logEmbedding F ∘ Additive.ofMul) '' (levelUnits F U : Set (RingOfIntegers F)ˣ))) =
        Units.rank F := by
  sorry

/-! The quotients `X_Q`. Throughout, `Q` is a finite set of finite places with
`N(v) ≡ 1 mod p^n` for `v ∈ Q`. -/

/-- `U_Q = K_∞ × ∏_v U_{Q,v}`: `K_∞ = (S¹)^{r₂}` (trivial at real places, the unit circle at
complex places), `U_{Q,v} = 𝒪_v^×` for `v ∉ Q`, and the `p^n`-th powers of `𝒪_v^×` (the subgroup of
index `p^n`) for `v ∈ Q`. -/
def levelQ (Q : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) (p n : ℕ) :
    Subgroup (IdeleGroup (RingOfIntegers F) F) where
  carrier := {x |
    (∀ w : InfinitePlace F, w.IsReal →
      adeleInfPart F (x : AdeleRing (RingOfIntegers F) F) w = 1) ∧
    (∀ w : InfinitePlace F, w.IsComplex →
      ‖adeleInfPart F (x : AdeleRing (RingOfIntegers F) F) w‖ = 1) ∧
    (∀ v, v ∉ Q → RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v ∈
        v.adicCompletionIntegers F ∧
      RingHom.snd _ _ ((x⁻¹ : IdeleGroup (RingOfIntegers F) F) : AdeleRing (RingOfIntegers F) F) v ∈
        v.adicCompletionIntegers F) ∧
    (∀ v ∈ Q, ∃ y : (v.adicCompletionIntegers F)ˣ,
      RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v = ((y ^ (p ^ n) : (v.adicCompletionIntegers F)ˣ) :
        v.adicCompletion F))}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `X_Q = F^×\𝔸_F^×/U_Q A_∞^0`, with the quotient topology. -/
abbrev XQ (Q : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) (p n : ℕ) :=
  IdeleGroup (RingOfIntegers F) F ⧸
    (IdeleGroup.principalSubgroup (RingOfIntegers F) F ⊔ levelQ F Q p n ⊔ posRealsDiag F)

/-- `(F ⊗ ℝ)^{×,0}`: positive at real places, arbitrary at complex places, `1` at finite places. -/
def archIdentityComponent : Subgroup (IdeleGroup (RingOfIntegers F) F) where
  carrier := {x | (∀ v, RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v = 1) ∧
    ∀ w : InfinitePlace F, w.IsReal → ∃ t : ℝ, 0 < t ∧
      adeleInfPart F (x : AdeleRing (RingOfIntegers F) F) w =
        adeleInfPart F (archimedeanScalar F t : AdeleRing (RingOfIntegers F) F) w}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

variable (Q : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) (p n : ℕ)

/-- `XQ-components`: `π₀(X_Q) = F^×\𝔸_F^×/U_Q (F ⊗ ℝ)^{×,0}`; fixed by `componentsEquiv_mk`. -/
def componentsEquiv [Fact p.Prime] (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    ConnectedComponents (XQ F Q p n) ≃
      (IdeleGroup (RingOfIntegers F) F ⧸ (IdeleGroup.principalSubgroup (RingOfIntegers F) F ⊔
        levelQ F Q p n ⊔ archIdentityComponent F)) :=
  sorry

/-- The component of the class of an idele `x` is the class of `x`. -/
theorem componentsEquiv_mk [Fact p.Prime] (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n])
    (x : IdeleGroup (RingOfIntegers F) F) :
    componentsEquiv F Q p n hQ (ConnectedComponents.mk (QuotientGroup.mk x : XQ F Q p n)) =
      QuotientGroup.mk x := by
  sorry

-- Test AdelicExamples.GL1.componentsEquiv_identity: an idele of `(F ⊗ ℝ)^{×,0}` lies in the
-- identity component; a bijection permuting the components fails this.
example [Fact p.Prime] (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n])
    (x : IdeleGroup (RingOfIntegers F) F) (hx : x ∈ archIdentityComponent F) :
    componentsEquiv F Q p n hQ (ConnectedComponents.mk (QuotientGroup.mk x : XQ F Q p n)) = 1 := by
  sorry

theorem finite_components [Fact p.Prime] (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    Finite (ConnectedComponents (XQ F Q p n)) := by
  sorry

/-- The ideles supported on `Q` with unit components there. -/
def localUnitsQ : Subgroup (IdeleGroup (RingOfIntegers F) F) where
  carrier := {x | adeleInfPart F (x : AdeleRing (RingOfIntegers F) F) = 1 ∧
    (∀ v, v ∉ Q → RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v = 1) ∧
    ∀ v ∈ Q, RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v ∈ v.adicCompletionIntegers F ∧
      RingHom.snd _ _ ((x⁻¹ : IdeleGroup (RingOfIntegers F) F) : AdeleRing (RingOfIntegers F) F) v ∈
        v.adicCompletionIntegers F}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- The narrow class group, idelically: `F^×\𝔸_F^×/Ô^× (F ⊗ ℝ)^{×,0}`. -/
abbrev NarrowClasses :=
  IdeleGroup (RingOfIntegers F) F ⧸ (IdeleGroup.principalSubgroup (RingOfIntegers F) F ⊔
    levelQ F ∅ 0 0 ⊔ archIdentityComponent F)

/-- `π₀(X_Q)` is an extension of the narrow class group by a quotient of
`∏_{v ∈ Q} 𝒪_v^×/𝒪_v^{×p^n}`: the natural map is surjective and its kernel is generated by the
classes of ideles supported on `Q` with unit components there. -/
theorem components_to_narrow [Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    ∃ π : (IdeleGroup (RingOfIntegers F) F ⧸ (IdeleGroup.principalSubgroup (RingOfIntegers F) F ⊔
        levelQ F Q p n ⊔ archIdentityComponent F)) →* NarrowClasses F,
      Function.Surjective π ∧
      (∀ x : IdeleGroup (RingOfIntegers F) F, π (QuotientGroup.mk x) = QuotientGroup.mk x) ∧
      π.ker = (localUnitsQ F Q).map (QuotientGroup.mk' _) := by
  sorry

/-- The totally positive congruence units `F^× ∩ U_{Q,f}`, as units of `𝒪_F`. -/
def congruenceUnits : Subgroup (RingOfIntegers F)ˣ :=
  (levelQ F Q p n ⊔ archIdentityComponent F).comap
    ((Units.map (algebraMap F (AdeleRing (RingOfIntegers F) F))).comp
      (Units.map (algebraMap (RingOfIntegers F) F).toMonoidHom))

/-- `W/Λ_Q` with `W = ℝ^{r₁+r₂}/ℝ(1, …, 1)`, here in Mathlib's
coordinates `logSpace F` (omitting one place), and `Λ_Q` the logarithmic image of the totally
positive congruence units. -/
abbrev LogTorus :=
  Units.dirichletUnitTheorem.logSpace F ⧸
    AddSubgroup.closure ((Units.logEmbedding F ∘ Additive.ofMul) ''
      (congruenceUnits F Q p n : Set (RingOfIntegers F)ˣ))

/-- The identity component of `X_Q` is homeomorphic to the logarithmic torus, a compact real torus
of dimension `r₁ + r₂ - 1 = NumberField.Units.rank F` (this is the invariant `l₀` of `GL₁/F`). -/
theorem nonempty_identityComponentHomeomorph [Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    Nonempty (LogTorus F Q p n ≃ₜ connectedComponent (1 : XQ F Q p n)) := by
  sorry

theorem logTorus_homeomorph_torus [Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    Nonempty (LogTorus F Q p n ≃ₜ (Fin (Units.rank F) → UnitAddCircle)) := by
  sorry

/-- every component of `X_Q` is a torus of dimension
`NumberField.Units.rank F`. -/
theorem component_homeomorph_torus [Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) (x : XQ F Q p n) :
    Nonempty (connectedComponent x ≃ₜ (Fin (Units.rank F) → UnitAddCircle)) := by
  sorry

/-- `H0`: locally constant `ℤ_p`-valued functions on `X_Q` are functions on `π₀(X_Q)`; fixed by
`locallyConstantEquiv_apply`. -/
def locallyConstantEquiv [hp : Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    LocallyConstant (XQ F Q p n) ℤ_[p] ≃ₗ[ℤ_[p]] (ConnectedComponents (XQ F Q p n) → ℤ_[p]) :=
  sorry

/-- A locally constant function takes the value `f y` on the component of `y`. -/
theorem locallyConstantEquiv_apply [hp : Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n])
    (f : LocallyConstant (XQ F Q p n) ℤ_[p]) (y : XQ F Q p n) :
    locallyConstantEquiv F Q p n hQ f (ConnectedComponents.mk y) = f y := by
  sorry

/-- right translation by the class of a finite idele `a` (a uniformizer
at `v ∉ Q`, or a unit at `v ∈ Q` for the diamond operator) moves each component to the component
of its translate. -/
theorem translate_connectedComponent (a : IdeleGroup (RingOfIntegers F) F) (x : XQ F Q p n) :
    (fun y : XQ F Q p n => y * QuotientGroup.mk a) '' connectedComponent x =
      connectedComponent (x * QuotientGroup.mk a) := by
  sorry

-- Test SplitComponent.real_quadratic_antidiagonal
example (w₁ w₂ : InfinitePlace F) (hne : w₁ ≠ w₂)
    (hplaces : ∀ w : InfinitePlace F, w = w₁ ∨ w = w₂)
    (hreal : ∀ w : InfinitePlace F, w.IsReal) :
    ∃ x : IdeleGroup (RingOfIntegers F) F,
      (x.val.1 w₁ = archComponent F 2 w₁) ∧
      (x.val.1 w₂ = archComponent F (1 / 2) w₂) ∧ x.val.2 = 1 ∧
      ideleNorm F x = 1 ∧
      (AdelicPoints.gmEquiv F).symm x ∉ AdelicPoints.SplitComponent F (LaurentPolynomial F) := by
  sorry

-- Test AdelicPoints.normOneQuotient_larger_centre
example (w₁ w₂ : InfinitePlace F) (hne : w₁ ≠ w₂)
    (hplaces : ∀ w : InfinitePlace F, w = w₁ ∨ w = w₂)
    (hreal : ∀ w : InfinitePlace F, w.IsReal) :
    let H := LaurentPolynomial F
    let C := (AdelicPoints.finiteProjection F H).ker
    ∃ x : AdelicPoints.normOne F H,
      (Quotient.mk'' x : AutomorphicQuotient.NormOneQuotient F H) ≠ Quotient.mk'' 1 ∧
      ((x : AdelicPoints F H) : AdelicPoints F H ⧸ C) = (1 : AdelicPoints F H ⧸ C) ∧
      (AdelicPoints.gmEquiv F (x : AdelicPoints F H)).val.1 w₁ = archComponent F 2 w₁ ∧
      (AdelicPoints.gmEquiv F (x : AdelicPoints F H)).val.1 w₂ = archComponent F (1 / 2) w₂ := by
  sorry

-- Test NumberField.idele_squares_killed: the quotient kills actual squares.
example (x : IdeleClassGroup (RingOfIntegers F) F) :
    let D := Subgroup.closure (Set.range fun y : IdeleClassGroup (RingOfIntegers F) F => y ^ 2)
    ((x ^ 2 : IdeleClassGroup (RingOfIntegers F) F) :
      IdeleClassGroup (RingOfIntegers F) F ⧸ D) =
      ((1 : IdeleClassGroup (RingOfIntegers F) F) : IdeleClassGroup (RingOfIntegers F) F ⧸ D) := by
  sorry

-- Test NumberField.idele_squares_positive: norm directions disappear, not just norm one.
example :
    let C := IdeleClassGroup (RingOfIntegers F) F
    let D := Subgroup.closure (Set.range fun y : C => y ^ 2)
    ((QuotientGroup.mk (archimedeanScalar F 2) : C) : C ⧸ D) = ((1 : C) : C ⧸ D) := by
  sorry

-- Test NumberField.idele_squares_nontrivial: a nonsquare unit at 3 survives over Q.
example (v₃ : IsDedekindDomain.HeightOneSpectrum (RingOfIntegers ℚ))
    (hv₃ : Ideal.absNorm v₃.asIdeal = 3) :
    let C := IdeleClassGroup (RingOfIntegers ℚ) ℚ
    let D := Subgroup.closure (Set.range fun y : C => y ^ 2)
    ∃ x : IdeleGroup (RingOfIntegers ℚ) ℚ,
      x.val.1 = 1 ∧ x.val.2 v₃ = -1 ∧ (∀ v, v ≠ v₃ → x.val.2 v = 1) ∧
      ((QuotientGroup.mk x : C) : C ⧸ D) ≠ ((1 : C) : C ⧸ D) := by
  sorry

-- Test Parabolic.modulus_borel_two: only the real place is nonidentity.
example :
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2
    let X₁₀ : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv ℚ 2
      (TauCeti.GeneralLinear.coordinateRingMap ℚ 2 (MvPolynomial.X (1, 0)))
    let I : Ideal A := Ideal.span {X₁₀}
    letI : I.IsHopfIdeal ℚ := by sorry
    letI : FiniteDimensional ℚ (GaugeForm.cotangent ℚ (A ⧸ I)) := by sorry
    let u := archimedeanScalar ℚ 2
    let m := Matrix.GeneralLinearGroup.mk''
      (!![u.val, 0; 0, 1] : Matrix (Fin 2) (Fin 2) (AdeleRing (RingOfIntegers ℚ) ℚ)) (by sorry)
    let f : A →ₐ[ℚ] AdeleRing (RingOfIntegers ℚ) ℚ := WithConv.ofConv
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) 2).symm m)
    let p : AdelicPoints ℚ (A ⧸ I) := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    Parabolic.modulus ℚ (A ⧸ I) p = 2 ∧
      NumberField.ideleNorm ℚ (Matrix.GeneralLinearGroup.det m) = 2 := by
  sorry

-- Test Parabolic.modularCharacter_borel_two: Mathlib's modular character of `B(𝔸_ℚ)` at the real
-- point `diag(2, 1)` is `2`, not `1/2`: right translation by `diag(2, 1)` doubles left Haar measure.
example :
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2
    let X₁₀ : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv ℚ 2
      (TauCeti.GeneralLinear.coordinateRingMap ℚ 2 (MvPolynomial.X (1, 0)))
    let I : Ideal A := Ideal.span {X₁₀}
    letI : I.IsHopfIdeal ℚ := by sorry
    letI : FiniteDimensional ℚ (GaugeForm.cotangent ℚ (A ⧸ I)) := by sorry
    letI : Algebra.FiniteType ℚ (A ⧸ I) := by sorry
    let u := archimedeanScalar ℚ 2
    let m := Matrix.GeneralLinearGroup.mk''
      (!![u.val, 0; 0, 1] : Matrix (Fin 2) (Fin 2) (AdeleRing (RingOfIntegers ℚ) ℚ)) (by sorry)
    let f : A →ₐ[ℚ] AdeleRing (RingOfIntegers ℚ) ℚ := WithConv.ofConv
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) 2).symm m)
    let p : AdelicPoints ℚ (A ⧸ I) := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    MeasureTheory.Measure.modularCharacter p = 2 := by
  sorry

-- Test Parabolic.modulus_borel_reverse: only the real place is nonidentity.
example :
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2
    let X₁₀ : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv ℚ 2
      (TauCeti.GeneralLinear.coordinateRingMap ℚ 2 (MvPolynomial.X (1, 0)))
    let I : Ideal A := Ideal.span {X₁₀}
    letI : I.IsHopfIdeal ℚ := by sorry
    letI : FiniteDimensional ℚ (GaugeForm.cotangent ℚ (A ⧸ I)) := by sorry
    let u := archimedeanScalar ℚ 2
    let m := Matrix.GeneralLinearGroup.mk''
      (!![1, 0; 0, u.val] : Matrix (Fin 2) (Fin 2) (AdeleRing (RingOfIntegers ℚ) ℚ)) (by sorry)
    let f : A →ₐ[ℚ] AdeleRing (RingOfIntegers ℚ) ℚ := WithConv.ofConv
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) 2).symm m)
    let p : AdelicPoints ℚ (A ⧸ I) := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    Parabolic.modulus ℚ (A ⧸ I) p = (1 / 2) ∧
      NumberField.ideleNorm ℚ (Matrix.GeneralLinearGroup.det m) = 2 := by
  sorry

-- Test LevelMaps.elliptic_i: the full automorphism group, including the centre.
example (w : InfinitePlace ℚ) (hw : w.IsReal) :
    let H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2
    let ev : InfiniteAdeleRing ℚ →+* ℝ :=
      (InfinitePlace.Completion.ringEquivRealOfIsReal hw).toRingHom.comp
        (Pi.evalRingHom (fun v : InfinitePlace ℚ => v.Completion) w)
    let ρ : AdelicPoints.InfinitePoints ℚ H →* GL (Fin 2) ℝ :=
      (Matrix.GeneralLinearGroup.map ev).comp
        (TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) (A := InfiniteAdeleRing ℚ) 2).toMonoidHom
    let a : GL (Fin 2) ℝ := 1
    let K := (AdelicExamples.KInf.map (MulAut.conj a).toMonoidHom).comap ρ
    let U := (IntegralModel.standardGLn (F := ℚ) (S := ∅) 2).integralLevel
    let x : AdelicPoints ℚ H ⧸ LevelMaps.levelSubgroup ℚ H U K := QuotientGroup.mk 1
    Nat.card (CategoryTheory.Aut (CategoryTheory.ActionCategory.objEquiv
      (AdelicPoints.diagonal ℚ H).range _ x)) = 4 := by
  sorry

-- Test LevelMaps.elliptic_rho: the full automorphism group, including the centre.
example (w : InfinitePlace ℚ) (hw : w.IsReal) :
    let H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2
    let ev : InfiniteAdeleRing ℚ →+* ℝ :=
      (InfinitePlace.Completion.ringEquivRealOfIsReal hw).toRingHom.comp
        (Pi.evalRingHom (fun v : InfinitePlace ℚ => v.Completion) w)
    let ρ : AdelicPoints.InfinitePoints ℚ H →* GL (Fin 2) ℝ :=
      (Matrix.GeneralLinearGroup.map ev).comp
        (TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) (A := InfiniteAdeleRing ℚ) 2).toMonoidHom
    let a : GL (Fin 2) ℝ := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![Real.sqrt 3 / 2, -(1 / 2); 0, 1] : Matrix (Fin 2) (Fin 2) ℝ) (by sorry)
    let K := (AdelicExamples.KInf.map (MulAut.conj a).toMonoidHom).comap ρ
    let U := (IntegralModel.standardGLn (F := ℚ) (S := ∅) 2).integralLevel
    let x : AdelicPoints ℚ H ⧸ LevelMaps.levelSubgroup ℚ H U K := QuotientGroup.mk 1
    Nat.card (CategoryTheory.Aut (CategoryTheory.ActionCategory.objEquiv
      (AdelicPoints.diagonal ℚ H).range _ x)) = 6 := by
  sorry

end AdelicExamples.GL1

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `A_G(ℝ)^0` through the maximal central `F`-split torus `S ⊆ G`, cut out by the Hopf ideal `I`.
The maximal `ℚ`-split torus in the centre of `Res_{F/ℚ} G` is the maximal `ℚ`-split torus of
`Res_{F/ℚ} S`, whose real points are the points of `S` at which every character of `S` takes a
real scalar value. So `A_G(ℝ)^0` is the set of archimedean points of `S` at which every character
of `S` takes one positive real value `t` at all archimedean places. The group-theoretic clauses
above are also satisfied by a graph `{(t, φ(t))}` in `G_m × T¹`, with `T¹` a `ℚ`-anisotropic torus
split over `ℝ`; this clause excludes it. -/
theorem SplitComponent.eq_maximalCentralSplit [Algebra.FiniteType F H]
    (I : TauCeti.HopfIdeal F (CommHopfAlgCat.of F H))
    (hI : Minimal (fun J : TauCeti.HopfIdeal F (CommHopfAlgCat.of F H) => J.IsCentral ∧
      TauCeti.splitTorusCommHopfAlgProperty F
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient (finiteTypeObj F H) J)) I) :
    (SplitComponent F H : Set (AdelicPoints F H)) =
      {x | (∀ h ∈ I.toIdeal, x.ofConv h = 0) ∧ finiteProjection F H x = 1 ∧
        ∀ χ : H, IsGroupLikeElem F (Ideal.Quotient.mk I.toIdeal χ) →
          ∃ t : ℝ, 0 < t ∧ x.ofConv χ =
            ((AdelicExamples.GL1.archimedeanScalar F t : NumberField.IdeleGroup
              (NumberField.RingOfIntegers F) F) : NumberField.AdeleRing (NumberField.RingOfIntegers F) F)} := by
  sorry

end AdelicPoints

/-! ## Layer 5: Definite quaternion algebras over ℚ

`D = ℍ[ℚ, a, b]` with `a, b < 0` is a definite quaternion division algebra. Its finite adelic
points `(D ⊗ 𝔸_f)^×` are the units of `ℍ[𝔸_f, a, b]`, with the product topology on the four
coordinates. -/

namespace AdelicExamples.DefiniteQuaternion

open scoped Quaternion

/-- The finite adeles of `ℚ`. -/
abbrev Af := IsDedekindDomain.FiniteAdeleRing ℤ ℚ

variable (a b : ℚ)

instance : TopologicalSpace ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b] :=
  TopologicalSpace.induced (QuaternionAlgebra.equivTuple _ _ _) inferInstance

/-- Coefficientwise extension `D → D ⊗ 𝔸_f`. -/
def coeffMap : ℍ[ℚ, a, b] →+* ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b] where
  toFun x := ⟨algebraMap ℚ Af x.re, algebraMap ℚ Af x.imI, algebraMap ℚ Af x.imJ,
    algebraMap ℚ Af x.imK⟩
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

/-- The diagonal `D^× → (D ⊗ 𝔸_f)^×`. -/
def diag : ℍ[ℚ, a, b]ˣ →* ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ :=
  Units.map (coeffMap a b).toMonoidHom

/-- `Cl(U) = D^×\(D ⊗ 𝔸_f)^×/U`. -/
abbrev Classes (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) :=
  DoubleCoset.Quotient ((diag a b).range : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) U

/-- `Γ_{x,U} = D^× ∩ xUx⁻¹`. -/
def stab (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)
    (x : ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) : Subgroup ℍ[ℚ, a, b]ˣ :=
  (U.map (MulAut.conj x).toMonoidHom).comap (diag a b)

variable {a b} (ha : a < 0) (hb : b < 0)
include ha hb

/-- the class set is finite for every compact open level. -/
theorem finite_classes (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)
    (hU : IsCompact (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ))
    (hUo : IsOpen (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)) :
    Finite (Classes a b U) := by
  sorry

/-- Each `Γ_{x,U}` is finite. -/
theorem finite_stab (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)
    (hU : IsCompact (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ))
    (x : ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) : Finite (stab a b U x) := by
  sorry

/-- `D^×/ℚ^×` is discrete in `(D ⊗ 𝔸_f)^×/𝔸_f^×`: the diagonal meets every compact open level in
finitely many elements modulo rational scalars. -/
theorem finite_stab_mod_scalars (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)
    (hU : IsCompact (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ))
    (hUo : IsOpen (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)) :
    Finite ((U ⊔ (Units.map (algebraMap Af ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]).toMonoidHom).range).comap
      (diag a b) ⧸ ((Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range.subgroupOf
        ((U ⊔ (Units.map (algebraMap Af ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]).toMonoidHom).range).comap
          (diag a b)))) := by
  sorry

/-- The mass `∑_{x ∈ Cl(U)} 1/|Γ_x/(ℚ^× ∩ U)|` scales with the
index under `U' ≤ U` (an equality). -/
theorem mass_eq (U U' : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) (h : U' ≤ U)
    (hU : IsCompact (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ))
    (hU'o : IsOpen (U' : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)) :
    (∑ᶠ c : Classes a b U',
        ((Nat.card (stab a b U' (Quotient.out c)) : ℚ) / Nat.card ↥(stab a b U' 1 ⊓
          (Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range))⁻¹) =
      ((U'.relIndex U : ℚ) /
        ((stab a b U' 1 ⊓ (Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range).relIndex
          (stab a b U 1 ⊓ (Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range) : ℚ)) *
      ∑ᶠ c : Classes a b U,
        ((Nat.card (stab a b U (Quotient.out c)) : ℚ) / Nat.card ↥(stab a b U 1 ⊓
          (Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range))⁻¹ := by
  sorry

omit ha hb in
/-- `Nrd(B_p^×) = ℚ_p^×` at every prime. -/
theorem nrd_surjective_local (a b : ℚ) (ha : a ≠ 0) (hb : b ≠ 0)
    (p : ℕ) [Fact p.Prime] (c : ℚ_[p]) (hc : c ≠ 0) :
    ∃ x : ℍ[ℚ_[p], (a : ℚ_[p]), (b : ℚ_[p])], x ≠ 0 ∧ QuaternionAlgebra.normForm _ 0 _ x = c := by
  sorry

omit ha hb in
/-- At `∞`, `Nrd(B_∞^×)` is `ℝ^×` if `B` splits at `∞` and `ℝ_{>0}` otherwise. -/
theorem nrd_image_real (a b : ℚ) (ha : a ≠ 0) (hb : b ≠ 0) (c : ℝ) (hc : c ≠ 0) :
    (∃ x : ℍ[ℝ, (a : ℝ), (b : ℝ)], x ≠ 0 ∧ QuaternionAlgebra.normForm _ 0 _ x = c) ↔ (0 < c ∨ ¬ (a < 0 ∧ b < 0)) := by
  sorry

omit ha hb in
/-- Hasse–Schilling–Maass: `Nrd(B^×)` is `ℚ^×` if `B` splits at `∞` and `ℚ_{>0}` otherwise. -/
theorem nrd_image_global (a b : ℚ) (ha : a ≠ 0) (hb : b ≠ 0) (c : ℚ) (hc : c ≠ 0) :
    (∃ x : ℍ[ℚ, a, b], x ≠ 0 ∧ QuaternionAlgebra.normForm _ 0 _ x = c) ↔ (0 < c ∨ ¬ (a < 0 ∧ b < 0)) := by
  sorry

end AdelicExamples.DefiniteQuaternion

/-! ## Layer 1: restriction of scalars on adelic points

`WeilRestriction.ResHopf`, its Hopf structure, `pointsMulEquiv` and `mapHopf` are the Weil
restriction of ReductiveGroupsPartII, RG2.0a, imported from that roadmap. `adeleBaseChange` is
the topological base-change comparison `E ⊗_F 𝔸_F ≃ 𝔸_E` of the Global number fields roadmap,
layer 8, read as an `E`-algebra isomorphism through the left factor. -/

namespace WeilRestriction

variable (k : Type) [CommRing k] (k' : Type) [CommRing k'] [Algebra k k']
  [Module.Finite k k'] [Module.Projective k k']

/-- Transitivity `Res_{k'/k} ∘ Res_{k''/k'} ≅ Res_{k''/k}` in Hopf form. ReductiveGroupsPartII,
RG2.0a, states it for the underlying algebras (`compEquiv`); the Hopf form is stated here because
the tower maps of this layer are Hopf maps. -/
def compHopfEquiv (k'' : Type) [CommRing k''] [Algebra k' k''] [Algebra k k'']
    [IsScalarTower k k' k''] [Module.Finite k' k''] [Module.Projective k' k'']
    (H'' : Type) [CommRing H''] [HopfAlgebra k'' H''] :
    WeilRestriction.ResHopf k k' (WeilRestriction.ResHopf k' k'' H'') ≃ₐc[k]
      WeilRestriction.ResHopf k k'' H'' := sorry

/-- `compHopfEquiv` is the tensor associator on points: for every `k`-algebra `R`, an `R`-point of
`Res_{k''/k} H''` and the corresponding point of `Res_{k'/k} Res_{k''/k'} H''` have the same
`k''`-algebra map out of `H''`, through `k'' ⊗_{k'} (k' ⊗_k R) ≃ k'' ⊗_k R`. -/
theorem compHopfEquiv_pointsMulEquiv (k'' : Type) [CommRing k''] [Algebra k' k''] [Algebra k k'']
    [IsScalarTower k k' k''] [Module.Finite k' k''] [Module.Projective k' k'']
    (H'' : Type) [CommRing H''] [HopfAlgebra k'' H''] (R : Type) [CommRing R] [Algebra k R]
    (x : WithConv (WeilRestriction.ResHopf k k'' H'' →ₐ[k] R)) :
    (WeilRestriction.pointsMulEquiv k k'' H'' R x).ofConv =
      (Algebra.TensorProduct.cancelBaseChange k k' k'' k'' R).toAlgHom.comp
        (WeilRestriction.pointsMulEquiv k' k'' H'' (TensorProduct k k' R)
          (WeilRestriction.pointsMulEquiv k k' (WeilRestriction.ResHopf k' k'' H'') R
            (WithConv.toConv (x.ofConv.comp
              ((compHopfEquiv k k' k'' H'').toBialgHom :
                WeilRestriction.ResHopf k k' (WeilRestriction.ResHopf k' k'' H'') →ₐ[k]
                  WeilRestriction.ResHopf k k'' H''))))).ofConv := by
  sorry

end WeilRestriction

-- Test WeilRestriction.compHopfEquiv_trivial_tower: for `ℚ ⊂ ℚ ⊂ ℚ` and `G_m` the pin is the
-- identity on points up to `ℚ ⊗_ℚ (ℚ ⊗_ℚ R) ≃ ℚ ⊗_ℚ R`. An equivalence twisted by the inversion
-- automorphism `T ↦ T⁻¹` of `ℚ[T, T⁻¹]` is also a Hopf isomorphism, but it sends each point to its
-- inverse and fails this equation at the point `2 ∈ G_m(ℚ)`.
example (R : Type) [CommRing R] [Algebra ℚ R]
    (x : WithConv (WeilRestriction.ResHopf ℚ ℚ (LaurentPolynomial ℚ) →ₐ[ℚ] R)) :
    (WeilRestriction.pointsMulEquiv ℚ ℚ (LaurentPolynomial ℚ) R x).ofConv =
      (Algebra.TensorProduct.cancelBaseChange ℚ ℚ ℚ ℚ R).toAlgHom.comp
        (WeilRestriction.pointsMulEquiv ℚ ℚ (LaurentPolynomial ℚ) (TensorProduct ℚ ℚ R)
          (WeilRestriction.pointsMulEquiv ℚ ℚ (WeilRestriction.ResHopf ℚ ℚ (LaurentPolynomial ℚ)) R
            (WithConv.toConv (x.ofConv.comp
              ((WeilRestriction.compHopfEquiv ℚ ℚ ℚ (LaurentPolynomial ℚ)).toBialgHom :
                WeilRestriction.ResHopf ℚ ℚ (WeilRestriction.ResHopf ℚ ℚ (LaurentPolynomial ℚ)) →ₐ[ℚ]
                  WeilRestriction.ResHopf ℚ ℚ (LaurentPolynomial ℚ)))))).ofConv :=
  WeilRestriction.compHopfEquiv_pointsMulEquiv ℚ ℚ ℚ (LaurentPolynomial ℚ) R x

/-- Global number fields, layer 8: the base-change comparison `E ⊗_F 𝔸_F ≃ 𝔸_E` for a finite
extension `E/F` of number fields, as an `E`-algebra isomorphism; it is the left-factor form of
`TauCetiRoadmap.GlobalNumberFields.adeleBaseChangeEquiv` (`adeleBaseChange_eq_adeleBaseChangeEquiv`). Its continuity
in both directions is `continuous_adeleBaseChange`. -/
def adeleBaseChange (F : Type) [Field F] [NumberField F] (E : Type) [Field E] [NumberField E]
    [Algebra F E] :
    E ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F ≃ₐ[E]
      NumberField.AdeleRing (NumberField.RingOfIntegers E) E := sorry

/-- The comparison is a homeomorphism for the module topology on the tensor product (Global
number fields, layer 8). -/
theorem continuous_adeleBaseChange (F : Type) [Field F] [NumberField F] (E : Type) [Field E]
    [NumberField E] [Algebra F E] :
    letI : Algebra (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)
      (E ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :=
      Algebra.TensorProduct.rightAlgebra
    ∀ [TopologicalSpace (E ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F)]
      [IsModuleTopology (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)
        (E ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F)],
      Continuous (adeleBaseChange F E) ∧ Continuous (adeleBaseChange F E).symm := by
  sorry

/-- For `E = F` the comparison is the canonical `F ⊗_F 𝔸_F ≃ 𝔸_F`. -/
theorem adeleBaseChange_self (F : Type) [Field F] [NumberField F]
    (x : F ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :
    adeleBaseChange F F x = Algebra.TensorProduct.lid F _ x := by
  sorry

/-- The comparison agrees with `TauCetiRoadmap.GlobalNumberFields.adeleBaseChangeEquiv` after
swapping the tensor factors. -/
theorem adeleBaseChange_eq_adeleBaseChangeEquiv (F : Type) [Field F] [NumberField F] (E : Type)
    [Field E] [NumberField E] [Algebra F E]
    [TopologicalSpace (TensorProduct F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) E)]
    [IsModuleTopology (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)
      (TensorProduct F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) E)]
    (e : E) (a : NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :
    adeleBaseChange F E (e ⊗ₜ[F] a) =
      TauCetiRoadmap.GlobalNumberFields.adeleBaseChangeEquiv F E (a ⊗ₜ[F] e) := by
  sorry

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (E : Type) [Field E] [NumberField E] [Algebra F E]
  [FiniteDimensional F E] (H' : Type) [CommRing H'] [HopfAlgebra E H']

/-- the points of `Res_{E/F} G_E` over `𝔸_F` are the points
of `G_E` over `𝔸_E`. The map is fixed by `resEquiv_apply`: the point adjunction followed by the
base-change comparison on values. -/
def resEquiv : AdelicPoints F (WeilRestriction.ResHopf F E H') ≃* AdelicPoints E H' := sorry

theorem resEquiv_apply (x : AdelicPoints F (WeilRestriction.ResHopf F E H')) :
    (resEquiv F E H' x).ofConv =
      (adeleBaseChange F E).toAlgHom.comp
        (WeilRestriction.pointsMulEquiv F E H' _ x).ofConv := by
  sorry

/-- `resEquiv` is a homeomorphism for the evaluation topologies. -/
theorem continuous_resEquiv : Continuous (resEquiv F E H') ∧
    Continuous (resEquiv F E H').symm := by
  sorry

/-- The rational points of the restriction: `Res_{E/F} G_E (F) = G_E (E)`, through the point
adjunction and `E ⊗_F F ≃ E`; fixed by `resRationalEquiv_apply`. -/
def resRationalEquiv :
    WithConv (WeilRestriction.ResHopf F E H' →ₐ[F] F) ≃* WithConv (H' →ₐ[E] E) := sorry

theorem resRationalEquiv_apply (g : WithConv (WeilRestriction.ResHopf F E H' →ₐ[F] F)) :
    (resRationalEquiv F E H' g).ofConv =
      (Algebra.TensorProduct.rid F E E).toAlgHom.comp
        (WeilRestriction.pointsMulEquiv F E H' F g).ofConv := by
  sorry

/-- `resEquiv` carries the diagonal of `Res(F)` to the diagonal of `G_E(E)`. -/
theorem resEquiv_diagonal (g : WithConv (WeilRestriction.ResHopf F E H' →ₐ[F] F)) :
    resEquiv F E H' (diagonal F (WeilRestriction.ResHopf F E H') g) =
      diagonal E H' (resRationalEquiv F E H' g) := by
  sorry

/-- Naturality of `resEquiv` in coordinate Hopf maps `G_E → G'_E`. -/
theorem resEquiv_natural {H'' : Type} [CommRing H''] [HopfAlgebra E H''] (φ : H'' →ₐc[E] H')
    (x : AdelicPoints F (WeilRestriction.ResHopf F E H')) :
    map E H' φ (resEquiv F E H' x) =
      resEquiv F E H''
        (map F (WeilRestriction.ResHopf F E H') (WeilRestriction.mapHopf F E H' φ) x) := by
  sorry

/-- Transitivity in a tower `F ⊂ E ⊂ L`: `resEquiv` for `L/F` is the composite of those for
`L/E` and `E/F`, through `compHopfEquiv`. -/
theorem resEquiv_trans (L : Type) [Field L] [NumberField L] [Algebra E L] [Algebra F L]
    [IsScalarTower F E L] [FiniteDimensional E L] (H'' : Type) [CommRing H''] [HopfAlgebra L H'']
    (x : AdelicPoints F (WeilRestriction.ResHopf F L H'')) :
    resEquiv F L H'' x =
      resEquiv E L H'' (resEquiv F E (WeilRestriction.ResHopf E L H'')
        (map F (WeilRestriction.ResHopf F L H'')
          (WeilRestriction.compHopfEquiv F E L H'').toBialgHom x)) := by
  sorry

-- Test AdelicPoints.resEquiv_gm: for `G_E = G_m`, `resEquiv` is `(E ⊗ 𝔸_F)^× ≃ 𝔸_E^×` through
-- the base-change comparison on units.
example (x : AdelicPoints F (WeilRestriction.ResHopf F E (LaurentPolynomial E))) :
    TauCeti.MultiplicativeGroup.pointsMulEquiv (resEquiv F E (LaurentPolynomial E) x) =
      Units.map (adeleBaseChange F E : _ →* _)
        (TauCeti.MultiplicativeGroup.pointsMulEquiv
          (WeilRestriction.pointsMulEquiv F E (LaurentPolynomial E) _ x)) := by
  sorry

-- Test AdelicPoints.resEquiv_self: for `E = F` the comparison on values is `F ⊗_F 𝔸_F ≃ 𝔸_F`.
example (H₀ : Type) [CommRing H₀] [HopfAlgebra F H₀]
    (x : AdelicPoints F (WeilRestriction.ResHopf F F H₀)) (h : H₀) :
    (resEquiv F F H₀ x).ofConv h =
      Algebra.TensorProduct.lid F _ ((WeilRestriction.pointsMulEquiv F F H₀ _ x).ofConv h) := by
  sorry

-- Test AdelicPoints.res_not_base_change: `Res_{E/ℚ} G_m (ℚ) = E^×` is not `G_m(ℚ) = ℚ^×`: when
-- `E` contains a square root of `-1` the former has an element of order `4` and the latter
-- does not.
example (E : Type) [Field E] [NumberField E] (i : E) (hi : i * i = -1) :
    ¬ Nonempty (WithConv (WeilRestriction.ResHopf ℚ E (LaurentPolynomial E) →ₐ[ℚ] ℚ) ≃* ℚˣ) := by
  sorry

end AdelicPoints

-- Test RationalCharacter.res_norm: for a quadratic field `E`, the rational characters of
-- `Res_{E/ℚ} G_m` have rank `1` (the norm), not the rank `2` of the geometric character group.
example (E : Type) [Field E] [NumberField E] (hE : Module.finrank ℚ E = 2) :
    Nonempty (Additive (RationalCharacter ℚ (WeilRestriction.ResHopf ℚ E (LaurentPolynomial E)))
      ≃+ ℤ) := by
  sorry

-- Test RealCharacterSpace.res_gm_rank: for a quadratic field `E` and `G = Res_{E/ℚ} G_m`,
-- `a_G` has real dimension `1`, not `2`.
example (E : Type) [Field E] [NumberField E] (hE : Module.finrank ℚ E = 2) :
    Module.finrank ℝ
      (RealCharacterSpace ℚ (WeilRestriction.ResHopf ℚ E (LaurentPolynomial E))) = 1 := by
  sorry

/-! ## Layer 2: Tamagawa measures and restriction of scalars -/

namespace Tamagawa

variable (F : Type) [Field F] [NumberField F] (E : Type) [Field E] [NumberField E] [Algebra F E]
  [FiniteDimensional F E] (H' : Type) [CommRing H'] [HopfAlgebra E H'] [Algebra.FiniteType E H']
  [Algebra.FiniteType F (WeilRestriction.ResHopf F E H')]

/-- `resEquiv` carries the Tamagawa measure of `Res_{E/F} G_E` to that of `G_E`. Both sides are
independent of the nonzero gauge forms (`measure_smul`, the top-form line being one-dimensional). -/
theorem measure_res
    (hred : TauCeti.reductiveCommHopfAlgProperty E (AdelicPoints.finiteTypeObj E H'))
    (ω : GaugeForm F (WeilRestriction.ResHopf F E H')) (hω : ω ≠ 0)
    (ω' : GaugeForm E H') (hω' : ω' ≠ 0) :
    Measure.map (AdelicPoints.resEquiv F E H') (measure F (WeilRestriction.ResHopf F E H') ω) =
      measure E H' ω' := by
  sorry

/-- Tamagawa numbers are invariant under restriction of scalars. -/
theorem number_res
    (hred' : TauCeti.reductiveCommHopfAlgProperty F
      (AdelicPoints.finiteTypeObj F (WeilRestriction.ResHopf F E H')))
    (hred : TauCeti.reductiveCommHopfAlgProperty E (AdelicPoints.finiteTypeObj E H'))
    (ω : GaugeForm F (WeilRestriction.ResHopf F E H')) (hω : ω ≠ 0)
    (ω' : GaugeForm E H') (hω' : ω' ≠ 0) :
    number F (WeilRestriction.ResHopf F E H') hred' ω = number E H' hred ω' := by
  sorry

end Tamagawa

-- Test Tamagawa.number_res_gm: `τ(Res_{E/F} G_m) = τ(G_m) = 1`, although `Res_{E/F} G_m` has
-- dimension `[E : F]`. Omitting the factors `|d|^{-d/2}` would multiply the two sides by
-- `|d_F|^{[E:F]/2}` and `|d_E|^{1/2}`, which are `1` and `2` for `ℚ(i)/ℚ`.
example (F : Type) [Field F] [NumberField F] (E : Type) [Field E] [NumberField E] [Algebra F E]
    [FiniteDimensional F E] [Algebra.FiniteType F (WeilRestriction.ResHopf F E (LaurentPolynomial E))]
    (hred' : TauCeti.reductiveCommHopfAlgProperty F
      (AdelicPoints.finiteTypeObj F (WeilRestriction.ResHopf F E (LaurentPolynomial E))))
    (ω : GaugeForm F (WeilRestriction.ResHopf F E (LaurentPolynomial E))) (hω : ω ≠ 0) :
    Tamagawa.number F (WeilRestriction.ResHopf F E (LaurentPolynomial E)) hred' ω = 1 := by
  sorry

/-! ## Layer 4: torsors under simply connected groups -/

namespace Approximation

/-- (Kneser): over a nonarchimedean local field of
characteristic `0`, every torsor under a semisimple simply connected group is trivial, i.e.
`H¹(K, G) = 1`. Simple connectedness is Tau Ceti's
`simplyConnectedSemisimpleCommHopfAlgProperty`. -/
theorem Torsor.isTrivial_of_simplyConnected_local (K : Type) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K]
    (G : TauCeti.SemisimpleCommHopfAlgCat K)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty K G)
    (X : Torsor K (G.obj : Type)) : X.IsTrivial := by
  sorry

/-- (Kneser, Harder, Chernousov): over a number
field, a torsor under a semisimple simply connected group is trivial if and only if it is trivial
over `ℝ` at every real place. -/
theorem Torsor.isTrivial_iff_forall_real (F : Type) [Field F] [NumberField F]
    (G : TauCeti.SemisimpleCommHopfAlgCat F)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty F G)
    (X : Torsor F (G.obj : Type)) :
    X.IsTrivial ↔ ∀ (v : NumberField.InfinitePlace F) (hv : v.IsReal),
      letI := (NumberField.InfinitePlace.embedding_of_isReal hv).toAlgebra
      (X.baseChange ℝ).IsTrivial := by
  sorry

/-- The Hasse principle on any geometric class set equipped with the affine comparison.
For canonical torsorClasses the comparison is coordinate-to-geometric realization. -/
theorem Torsor.hasse_classSet (F : Type) [Field F] [NumberField F]
    (G : TauCeti.SemisimpleCommHopfAlgCat F)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty F G)
    {C : Type*} (c : Torsor.ClassComparison (k := F) (H := (G.obj : Type)) C)
    (base : C) (hbase : ∀ X, c.classOf X = base ↔ X.IsTrivial)
    (locallyTrivial : C → Prop)
    (hlocal : ∀ X, locallyTrivial (c.classOf X) ↔
      ∀ (v : NumberField.InfinitePlace F) (hv : v.IsReal),
        letI := (NumberField.InfinitePlace.embedding_of_isReal hv).toAlgebra
        (X.baseChange ℝ).IsTrivial) (z : C) :
    z = base ↔ locallyTrivial z := by
  obtain ⟨X, rfl⟩ := c.surjective z
  rw [hbase, hlocal]
  exact Torsor.isTrivial_iff_forall_real F G hsc X

-- Test Approximation.Torsor.hasse_fails_without_simply_connected: for `μ_2` over `ℚ` the torsor
-- `ℚ[x]/(x² - 2)` is trivial over `ℝ` but not over `ℚ`.
example : ∃ X : Torsor ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))),
    (X.baseChange ℝ).IsTrivial ∧ ¬ X.IsTrivial := by
  sorry

end Approximation



end


/-! ## Layer 3: algebraic Siegel triples, affine orbits and matrix domains -/
namespace SiegelGeometry
noncomputable section
open scoped PointTopology Pointwise Classical TensorProduct Topology
set_option linter.unusedVariables false
open Reduction Reduction.GeometricRoots AdelicPoints

abbrev Points (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H]
    (R : Type) [CommRing R] [Algebra F R] := WithConv (H →ₐ[F] R)

local instance {H : Type} [CommRing H] [HopfAlgebra ℚ H] :
    IsTopologicalGroup (Points ℚ H ℝ) := PointTopology.isTopologicalGroup

/-- Evaluation of a coordinate representation on any coefficient algebra. -/
abbrev matrixPoints {F H : Type} [Field F] [CommRing H] [HopfAlgebra F H]
    {n : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H)
    (R : Type) [CommRing R] [Algebra F R] : Points F H R →* GL (Fin n) R :=
  (TauCeti.GeneralLinear.pointsMulEquiv n).toMonoidHom.comp (TauCeti.AlgHom.mapDomain r)

-- Test SiegelGeometry.points_trivial
example (R : Type) [CommRing R] [Algebra ℚ R] : Subsingleton (Points ℚ ℚ R) := by sorry
-- Test SiegelGeometry.points_gm: the two signs survive over R.
example : ∃ g : Points ℚ (LaurentPolynomial ℚ) ℝ, g ≠ 1 ∧ g * g = 1 := by sorry
-- Test SiegelGeometry.points_dual: coefficients include nonreduced algebras.
example : ¬ Subsingleton (Points ℚ (SymmetricAlgebra ℚ ℚ) (TrivSqZeroExt ℚ ℚ)) := by sorry
-- Test SiegelGeometry.matrixPoints_identity
example (n : ℕ) (R : Type) [CommRing R] [Algebra ℚ R]
    (g : Points ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) R) :
    matrixPoints (BialgHom.id ℚ _) R g = TauCeti.GeneralLinear.pointsMulEquiv n g := rfl
-- Test SiegelGeometry.matrixPoints_trivial
example {n : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] ℚ)
    (g : Points ℚ ℚ ℝ) : matrixPoints r ℝ g = 1 := by sorry
-- Test SiegelGeometry.matrixPoints_faithful
example {H : Type} [CommRing H] [HopfAlgebra ℚ H] {n : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (hr : Function.Surjective r) : Function.Injective (matrixPoints r ℝ) := by sorry

/-- Full GL_n domain, with positive diagonal and both orthogonal components.
Orr §2.1, p. 5; PRR §4.2, pp. 205–208 (inverted convention). -/
def matrixDomain (n : ℕ) (u t : ℝ) : Set (GL (Fin n) ℝ) :=
  {g | ∃ (v k : GL (Fin n) ℝ) (a : Fin n → ℝ),
    (∀ i, 0 < a i) ∧ (∀ i j, j < i → (v : Matrix (Fin n) (Fin n) ℝ) i j = 0) ∧
    (∀ i, (v : Matrix (Fin n) (Fin n) ℝ) i i = 1) ∧
    (∀ i j, i < j → |(v : Matrix (Fin n) (Fin n) ℝ) i j| ≤ u) ∧
    (∀ i j, i.val + 1 = j.val → t ≤ a i / a j) ∧
    (k : Matrix (Fin n) (Fin n) ℝ).transpose * (k : Matrix (Fin n) (Fin n) ℝ) = 1 ∧
    (g : Matrix (Fin n) (Fin n) ℝ) = (v : Matrix (Fin n) (Fin n) ℝ) * Matrix.diagonal a * (k : Matrix (Fin n) (Fin n) ℝ)}

/-- Gram form attached to the right orthogonal coset of g; columns of g⁻¹ are
lattice basis vectors. BKT §4.5, pp. 17–18. -/
def gram {n : ℕ} (g : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ :=
  (g⁻¹ : Matrix (Fin n) (Fin n) ℝ).transpose * (g⁻¹ : Matrix (Fin n) (Fin n) ℝ)

theorem gram_posDef {n : ℕ} (g : GL (Fin n) ℝ) : (gram g).PosDef := by sorry

theorem gram_fiber {n : ℕ} (g h : GL (Fin n) ℝ) : gram g = gram h ↔
    ∃ k : GL (Fin n) ℝ, (k : Matrix (Fin n) (Fin n) ℝ).transpose * (k : Matrix (Fin n) (Fin n) ℝ) = 1 ∧ h = g * k := by sorry

theorem reduced_matrixDomain (n : ℕ) :
    (∀ C : ℝ, 0 < C → ∃ u > 0, ∃ t > 0,
      RealSiegel.reducedSet (n := n) C ⊆ gram '' matrixDomain n u t) ∧
    (∀ u t : ℝ, 0 < u → 0 < t → ∃ C > 0,
      gram '' matrixDomain n u t ⊆ RealSiegel.reducedSet C) := by sorry

/-- Cofinality on the determinant-one slice; dimension zero requires no rescaling.
BKT §4.5, p. 18, using positive scalar invariance. -/
theorem reduced_specialLinear (n : ℕ) (C : ℝ) (hC : 0 < C) :
    ∃ u > 0, ∃ t > 0, ∀ b ∈ RealSiegel.reducedSet (n := n) C, b.det = 1 →
      ∃ g ∈ matrixDomain n u t, (g : Matrix (Fin n) (Fin n) ℝ).det = 1 ∧ gram g = b := by sorry

theorem matrixDomain_reduction (n : ℕ) :
    ∃ u > 0, ∃ t > 0, ∀ g : GL (Fin n) ℝ,
      ∃ γ : GL (Fin n) ℤ, ∃ s ∈ matrixDomain n u t,
        g = Matrix.GeneralLinearGroup.map (Int.castRingHom ℝ) γ * s := by sorry

theorem matrixDomain_overlap (n : ℕ) (u t : ℝ) (hu : 0 < u) (ht : 0 < t)
    (d : ℕ) (hd : 0 < d) (c₁ c₂ : GL (Fin n) ℚ) :
    {γ : GL (Fin n) ℚ |
      (∀ i j, ∃ z : ℤ, (d : ℚ) * (γ : Matrix (Fin n) (Fin n) ℚ) i j = z) ∧
      (∀ i j, ∃ z : ℤ, (d : ℚ) * (γ⁻¹ : Matrix (Fin n) (Fin n) ℚ) i j = z) ∧
      ((fun s => Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ) (γ * c₁) * s) ''
        matrixDomain n u t ∩
        (fun s => Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ) c₂ * s) ''
        matrixDomain n u t).Nonempty}.Finite := by sorry

-- Test SiegelGeometry.domain_zero: rank zero is a point, even for arbitrary bounds.
example (u t : ℝ) : matrixDomain 0 u t = Set.univ := by sorry
-- Test SiegelGeometry.domain_sign: O(1), not SO(1), supplies the negative component.
example (u t : ℝ) : matrixDomain 1 u t = Set.univ := by sorry
-- Test SiegelGeometry.domain_sl2: n(x)a(y) has upper half-plane coordinate x+iy.
example (u t x y : ℝ) (hy : 0 < y) (g : GL (Fin 2) ℝ)
    (hg : (g : Matrix (Fin 2) (Fin 2) ℝ) = !![Real.sqrt y, x / Real.sqrt y; 0, 1 / Real.sqrt y]) :
    g ∈ matrixDomain 2 u t ↔ |x| ≤ u ∧ t ≤ y := by sorry
-- Test SiegelGeometry.gram_identity
example (n : ℕ) : gram (1 : GL (Fin n) ℝ) = 1 := by sorry
-- Test SiegelGeometry.gram_lattice: columns (1,0),(1,2) have this Gram matrix.
example (g : GL (Fin 2) ℝ) (hg : (g⁻¹ : Matrix (Fin 2) (Fin 2) ℝ) = !![1, 1; 0, 2]) :
    gram g = !![1, 1; 1, 5] := by sorry
-- Test SiegelGeometry.gram_diagonal: the diagonal-torus orbit fixes the inverse convention.
example (a : ℝ) (ha : a ≠ 0) (g : GL (Fin 2) ℝ)
    (hg : (g : Matrix (Fin 2) (Fin 2) ℝ) = Matrix.diagonal ![a, a⁻¹]) :
    gram g = Matrix.diagonal ![a⁻¹ ^ 2, a ^ 2] := by sorry

section RealGroups
variable {H : Type} [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]

/-- A Cartan involution in a faithful algebraic realization. The inverse-adjoint equation
ensures algebraicity; compactness alone would not characterize a Cartan involution.
BHC §§1.1, 1.6–1.9, pp. 486, 489–492. -/
structure Cartan (H : Type) [CommRing H] [HopfAlgebra ℚ H] where
  n : ℕ
  representation : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H
  closedImmersion : Function.Surjective representation
  form : Matrix (Fin n) (Fin n) ℝ
  positive : form.PosDef
  theta : Points ℚ H ℝ ≃* Points ℚ H ℝ
  equation : ∀ g, (matrixPoints representation ℝ (theta g) : Matrix (Fin n) (Fin n) ℝ) =
    form⁻¹ * (matrixPoints representation ℝ g⁻¹ : Matrix (Fin n) (Fin n) ℝ).transpose * form
  involutive : ∀ g, theta (theta g) = g
  K : Subgroup (Points ℚ H ℝ)
  fixed : ∀ g, g ∈ K ↔ theta g = g
  maximal : Maximal (fun J : Subgroup (Points ℚ H ℝ) => IsCompact J.carrier) K

/-- A rational minimal parabolic and its real Cartan-stable split lift. The real torus
is represented on every real algebra by u S₀ u⁻¹. Its positive component and M factor
are pinned, not arbitrary subgroups. Orr Lemma 2.1 and §2.2, pp. 6–7. -/
structure Triple (H : Type) [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H] where
  roots : RelativeRootData ℚ H
  minimal : MinimalParabolic roots
  cartan : Cartan H
  u : subgroupPoints minimal.decomposition.N ℝ
  S : Subgroup (Points ℚ H ℝ)
  S_eq : S = (subgroupPoints roots.splitTorus ℝ).map (MulAut.conj u.val).toMonoidHom
  stable : S.map cartan.theta.toMonoidHom = S
  A : Subgroup (Points ℚ H ℝ)
  A_eq : A = (Subgroup.connectedComponentOfOne S).map S.subtype
  M : Subgroup (Points ℚ H ℝ)
  M_eq : ∀ g, g ∈ M ↔ ∃ m : Points ℚ (H ⧸ minimal.decomposition.M.toIdeal) ℝ,
    g = u.val * TauCeti.AlgHom.mapDomain
      (Bialgebra.Quotient.mkBialgHom minimal.decomposition.M.toIdeal) m * u.val⁻¹ ∧
    ∀ χ : RationalCharacter ℚ (H ⧸ minimal.decomposition.M.toIdeal),
      |m.ofConv χ.val| = 1
  logA : A → RealCharacterSpace ℚ (H ⧸ roots.splitTorus.toIdeal)
  logA_eq : ∀ (a : A) (b : subgroupPoints roots.splitTorus ℝ),
    a.val = u.val * b.val * u.val⁻¹ → ∀ χ : roots.X,
      logA a χ = Real.log |(characterValue roots.splitTorus χ ℝ b : ℝ)|

namespace Triple
variable (T : Triple H)
abbrev N := subgroupPoints T.minimal.decomposition.N ℝ
abbrev Mplus := (Subgroup.connectedComponentOfOne T.M).map T.M.subtype
abbrev windowGroup : Set (Points ℚ H ℝ) := (T.N : Set _) * (T.Mplus : Set _)

/-- Compact N M⁺ window and positive, weak root threshold. -/
structure Window where
  omega : Set (Points ℚ H ℝ)
  compact : IsCompact omega
  in_NM : omega ⊆ T.windowGroup
  t : ℝ
  positive : 0 < t

/-- Weak root inequalities agree with Orr; strict horospherical inequalities are
compared by changing the threshold. -/
def cone (t : ℝ) : Set (Points ℚ H ℝ) :=
  {g | ∃ a : T.A, a.val = g ∧ ∀ α ∈ T.roots.simple, t ≤ Real.exp (T.logA a α)}

def domain (W : T.Window) : Set (Points ℚ H ℝ) :=
  W.omega * T.cone W.t * (T.cartan.K : Set _)

theorem mem_domain (W : T.Window) (g : Points ℚ H ℝ) : g ∈ T.domain W ↔
    ∃ p ∈ W.omega, ∃ a ∈ T.cone W.t, ∃ k ∈ T.cartan.K, g = p * a * k := by sorry

theorem domain_mono (W V : T.Window) (hω : W.omega ⊆ V.omega) (ht : V.t ≤ W.t) :
    T.domain W ⊆ T.domain V := by sorry

-- Test SiegelGeometry.cone_torus: central split directions are not truncated.
example (t : ℝ) (h : T.roots.simple = ∅) : T.cone t = T.A := by sorry
-- Test SiegelGeometry.cone_wall: weak threshold one contains the identity.
example : (1 : Points ℚ H ℝ) ∈ T.cone 1 := by sorry
-- Test SiegelGeometry.cone_above_wall
example (h : T.roots.simple.Nonempty) : (1 : Points ℚ H ℝ) ∉ T.cone 2 := by sorry
-- Test SiegelGeometry.window_empty
example : ∃ W : T.Window, W.omega = ∅ ∧ W.t = 1 := by sorry
-- Test SiegelGeometry.window_identity
example : ∃ W : T.Window, W.omega = {1} ∧ W.t = 1 := by sorry
-- Test SiegelGeometry.window_negative
example (W : T.Window) : W.t ≠ -1 := by sorry
-- Test SiegelGeometry.domain_empty
example (W : T.Window) (h : W.omega = ∅) : T.domain W = ∅ := by sorry
-- Test SiegelGeometry.domain_identity
example (W : T.Window) (hω : 1 ∈ W.omega) (ht : W.t ≤ 1) : 1 ∈ T.domain W := by sorry
-- Test SiegelGeometry.domain_torus
example (W : T.Window) (h : T.roots.simple = ∅) (hω : W.omega = {1}) :
    T.domain W = (T.A : Set _) * (T.cartan.K : Set _) := by sorry
-- Test SiegelGeometry.factors_gm
example (T : Triple (LaurentPolynomial ℚ)) :
    T.N = ⊥ ∧ T.Mplus = ⊥ ∧ T.windowGroup = {1} := by sorry
-- Test SiegelGeometry.factors_trivial
example (T : Triple ℚ) : T.N = ⊥ ∧ T.Mplus = ⊥ ∧ T.windowGroup = Set.univ := by sorry
-- Test SiegelGeometry.factors_sl2
example : ∃ T : Triple (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2),
    T.Mplus = ⊥ ∧ T.windowGroup = (T.N : Set _) ∧
    ∀ g, g ∈ T.N ↔ ∃ x : ℝ,
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) =
        !![1, x; 0, 1] := by sorry
end Triple

/-- Infinite adelic points over Q are the ordinary real points. The comparison is
coordinatewise evaluation at the unique archimedean place. -/
def realComparison : InfinitePoints ℚ H ≃ₜ* Points ℚ H ℝ := sorry

theorem realComparison_eval (g : InfinitePoints ℚ H) (a : H)
    (w : NumberField.InfinitePlace ℚ) (hw : w.IsReal) :
    (realComparison g).ofConv a =
      NumberField.InfinitePlace.Completion.ringEquivRealOfIsReal hw (g.ofConv a w) := by sorry

-- Test SiegelGeometry.realComparison_one
example : realComparison (H := H) 1 = 1 := by sorry
-- Test SiegelGeometry.realComparison_rational
example (g : Points ℚ H ℚ) : realComparison
    (TauCeti.AlgHom.mapValue (Algebra.ofId ℚ _) g) =
      TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) g := by sorry
-- Test SiegelGeometry.realComparison_injective
example (g h : InfinitePoints ℚ H) : realComparison g = realComparison h ↔ g = h := by sorry

/-- Minimal triple and fixed-K horospherical domains give the same cofinal family
on G(R)⁺. The M K-window is compact modulo its actual product realization. -/
theorem triple_horo_comparison (T : Triple H)
    (P : StandardParabolic T.minimal) (hP : P.val = T.minimal.ideal)
    (K : Subgroup (RealSiegel.ConnectedRealPoints H)) (C : RealSiegel.HoroData P K)
    (hK : K.map ((realComparison (H := H)).toMonoidHom.comp
      (RealSiegel.ConnectedRealPoints H).subtype) =
      T.cartan.K ⊓ (Subgroup.connectedComponentOfOne (Points ℚ H ℝ))) :
    (∀ W : T.Window, ∃ (U : Set (RealSiegel.realN P))
      (V : Set (RealSiegel.realMK P C.u K)) (t : ℝ),
      IsCompact (closure U) ∧ IsCompact (closure V) ∧ 0 < t ∧
      ∀ g : RealSiegel.ConnectedRealPoints H,
        realComparison g.val ∈ T.domain W → g ∈ RealSiegel.siegelSet C U t V) ∧
    (∀ (U : Set (RealSiegel.realN P)) (V : Set (RealSiegel.realMK P C.u K))
      (t : ℝ), IsCompact (closure U) → IsCompact (closure V) → 0 < t →
      ∃ W : T.Window, ∀ g ∈ RealSiegel.siegelSet C U t V,
        realComparison g.val ∈ T.domain W) := by sorry

-- Test SiegelGeometry.cartan_fixed
example (C : Cartan H) (g : Points ℚ H ℝ) : g ∈ C.K ↔ C.theta g = g := C.fixed g
-- Test SiegelGeometry.cartan_gm: the positive split direction is inverted.
example (C : Cartan (LaurentPolynomial ℚ)) (g : Points ℚ (LaurentPolynomial ℚ) ℝ) :
    C.theta g = g⁻¹ := by sorry
-- Test SiegelGeometry.cartan_sl2: the standard form fixes exactly the orthogonal matrices.
example (C : Cartan H) (h : C.form = 1) (g : Points ℚ H ℝ) :
    g ∈ C.K ↔ (matrixPoints C.representation ℝ g : Matrix (Fin C.n) (Fin C.n) ℝ).transpose *
      (matrixPoints C.representation ℝ g : Matrix (Fin C.n) (Fin C.n) ℝ) = 1 := by sorry
-- Test SiegelGeometry.triple_torus
example (T : Triple (LaurentPolynomial ℚ)) : T.roots.simple = ∅ ∧ T.S = ⊤ := by sorry
-- Test SiegelGeometry.triple_trivial
example (T : Triple ℚ) : T.A = ⊥ ∧ T.N = ⊥ := by sorry
-- Test SiegelGeometry.triple_cartan: a nonstable torus cannot be the split lift.
example (T : Triple H) : T.S.map T.cartan.theta.toMonoidHom = T.S := T.stable
end RealGroups

section Embeddings
variable {B H : Type} [CommRing B] [HopfAlgebra ℚ B] [Algebra.FiniteType ℚ B]
  [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]

/-- A closed algebraic embedding, contravariant on coordinates. -/
structure Embedding (B H : Type) [CommRing B] [HopfAlgebra ℚ B]
    [CommRing H] [HopfAlgebra ℚ H] where
  coordinate : B →ₐc[ℚ] H
  surjective : Function.Surjective coordinate

namespace Embedding
variable (e : Embedding B H)
abbrev points (R : Type) [CommRing R] [Algebra ℚ R] : Points ℚ H R →* Points ℚ B R :=
  TauCeti.AlgHom.mapDomain e.coordinate

/-- Character restriction is pinned on all real split-torus points after undoing the
specified unipotent conjugations. Its dual is the map of real character spaces. -/
structure Compatible (TH : Triple H) (TG : Triple B) where
  compact : TH.cartan.K.map (e.points ℝ) ≤ TG.cartan.K
  torus : TH.S.map (e.points ℝ) ≤ TG.S
  intersection : TG.S.comap (e.points ℝ) = TH.S
  unipotent : TH.N.map (e.points ℝ) ≤ TG.N
  restriction : TG.roots.X →+ TH.roots.X
  restriction_eq : ∀ (χ : TG.roots.X)
    (h : subgroupPoints TH.roots.splitTorus ℝ)
    (g : subgroupPoints TG.roots.splitTorus ℝ),
    e.points ℝ (TH.u.val * h.val * TH.u.val⁻¹) = TG.u.val * g.val * TG.u.val⁻¹ →
    characterValue TH.roots.splitTorus (restriction χ) ℝ h =
      characterValue TG.roots.splitTorus χ ℝ g

/-- Compatible parabolics and split lifts exist under the Cartan hypothesis.
The subgroup's rational split torus is the u=1 case. Orr §§4.1–4.2;
Orr–Schnell Theorem 1 and §A. -/
theorem compatible_exists (TH : Triple H) (CG : Cartan B)
    (hred : TauCeti.reductiveCommHopfAlgProperty ℚ (finiteTypeObj ℚ B))
    (hK : TH.cartan.K.map (e.points ℝ) ≤ CG.K)
    (hS : (TH.S.map (e.points ℝ)).map CG.theta.toMonoidHom = TH.S.map (e.points ℝ)) :
    ∃ TG : Triple B, TG.cartan = CG ∧ Nonempty (e.Compatible TH TG) := by sorry

/-- The rational-split case also supplies the intermediate parabolic with the
specified centralizer Levi. Orr Lemmas 4.2–4.6, pp. 15–17. -/
theorem compatible_parabolic (TH : Triple H) (CG : Cartan B)
    (hred : TauCeti.reductiveCommHopfAlgProperty ℚ (finiteTypeObj ℚ B))
    (hQ : TH.u.val = 1)
    (hK : TH.cartan.K.map (e.points ℝ) ≤ CG.K)
    (hS : (TH.S.map (e.points ℝ)).map CG.theta.toMonoidHom = TH.S.map (e.points ℝ)) :
    ∃ TG : Triple B, TG.cartan = CG ∧ Nonempty (e.Compatible TH TG) ∧
      ∃ Q : TauCeti.HopfIdeal ℚ B, IsRationalParabolic Q ∧ Q ≤ TG.minimal.ideal ∧
        ∃ L : LeviDecomposition ℚ B Q,
          subgroupPoints L.M ℝ = Subgroup.centralizer (TH.S.map (e.points ℝ) : Set _) ∧
          TH.N.map (e.points ℝ) ≤ subgroupPoints L.N ℝ := by sorry

/-- Algebraic Cartan stability of a connected subgroup restricts the Cartan involution.
A faithful representation makes the inverse-adjoint map algebraic. -/
theorem cartan_restrict (TH : Triple H) (CG : Cartan B)
    (hK : TH.cartan.K.map (e.points ℝ) ≤ CG.K)
    (hH : (e.points ℝ).range.map CG.theta.toMonoidHom = (e.points ℝ).range) :
    (∀ h, CG.theta (e.points ℝ h) = e.points ℝ (TH.cartan.theta h)) ∧
    (TH.S.map (e.points ℝ)).map CG.theta.toMonoidHom = TH.S.map (e.points ℝ) := by sorry

/-- The centralizer of the subgroup split torus cuts out N_Z inside N_G.
The representatives are conjugates of rational normalizer points, not purported
rational points of the generally nonrational Cartan-stable torus. -/
theorem finite_root_cones (TH : Triple H) (TG : Triple B) (c : e.Compatible TH TG)
    (hQ : TH.u.val = 1)
    (t : ℝ) (ht : 0 < t) :
    ∃ s : ℝ, 0 < s ∧ s ≤ 1 ∧ ∃ reps : Finset (Points ℚ B ℝ),
      (∀ w ∈ reps,
        TG.S.map (MulAut.conj w).toMonoidHom = TG.S ∧
        TH.N.map (e.points ℝ) ≤ TG.N.map (MulAut.conj w).toMonoidHom ∧
        (TG.N ⊓ Subgroup.centralizer (TH.S.map (e.points ℝ) : Set _)) ≤
          TG.N.map (MulAut.conj w).toMonoidHom) ∧
      ∀ a ∈ TH.cone t, ∃ w ∈ reps, w⁻¹ * e.points ℝ a * w ∈ TG.cone s := by sorry

/-- Rational and compact representatives with the connected-centralizer correction.
The rationalizing element lies in N_Z, as in Orr §4.4, pp. 20–21. -/
theorem weyl_representatives (TH : Triple H) (TG : Triple B) (c : e.Compatible TH TG)
    (hQ : TH.u.val = 1)
    (u : Points ℚ B ℝ)
    (hu : u ∈ TG.N ⊓ Subgroup.centralizer (TH.S.map (e.points ℝ) : Set _))
    (hrat : (TG.S.map (MulAut.conj u).toMonoidHom) = subgroupPoints TG.roots.splitTorus ℝ)
    (n : normalizer TG.roots.splitTorus)
    (hN : TH.N.map (e.points ℝ) ≤ TG.N.map (MulAut.conj
      (u⁻¹ * TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) n.val * u)).toMonoidHom)
    (hZ : (TG.N ⊓ Subgroup.centralizer (TH.S.map (e.points ℝ) : Set _)) ≤
      TG.N.map (MulAut.conj
        (u⁻¹ * TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) n.val * u)).toMonoidHom) :
    ∃ k ∈ TG.cartan.K,
      (u⁻¹ * TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) n.val * u)⁻¹ * k ∈
        (Subgroup.connectedComponentOfOne (Subgroup.centralizer (TG.S : Set (Points ℚ B ℝ)))).map
          (Subgroup.centralizer (TG.S : Set (Points ℚ B ℝ))).subtype ∧
      (TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) n.val)⁻¹ *
        (u⁻¹ * TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) n.val * u) ∈ TG.N := by sorry

/-- Uniform compact factors for finitely many rational/compact representatives.
The representative hypotheses are the algebraic conclusions of the preceding theorem,
not the compact-factor conclusion. Orr Lemmas 4.12–4.13, pp. 21–22. -/
theorem uniform_windows (TH : Triple H) (TG : Triple B) (c : e.Compatible TH TG)
    (hQ : TH.u.val = 1)
    (W : TH.Window) (ι : Type) [Fintype ι]
    (q : ι → Points ℚ B ℚ) (k : ι → Points ℚ B ℝ)
    (u : Points ℚ B ℝ)
    (hu : u ∈ TG.N ⊓ Subgroup.centralizer (TH.S.map (e.points ℝ) : Set _))
    (hrat : TG.S.map (MulAut.conj u).toMonoidHom = subgroupPoints TG.roots.splitTorus ℝ)
    (hrep : ∀ i,
      let w := u⁻¹ * TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) (q i) * u
      k i ∈ TG.cartan.K ∧ TG.S.map (MulAut.conj w).toMonoidHom = TG.S ∧
      w⁻¹ * k i ∈ (Subgroup.connectedComponentOfOne
        (Subgroup.centralizer (TG.S : Set (Points ℚ B ℝ)))).map (Subgroup.centralizer (TG.S : Set (Points ℚ B ℝ))).subtype ∧
      TH.N.map (e.points ℝ) ≤ TG.N.map (MulAut.conj w).toMonoidHom ∧
      (TG.N ⊓ Subgroup.centralizer (TH.S.map (e.points ℝ) : Set _)) ≤
        TG.N.map (MulAut.conj w).toMonoidHom) :
    ∃ V : TG.Window, ∃ b : ι → Set (Points ℚ B ℝ),
      (∀ i, IsCompact (b i) ∧ b i ⊆ TG.A) ∧
      ∀ i, (fun x => (TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) (q i))⁻¹ * e.points ℝ x) ''
        W.omega ⊆ V.omega * { (k i)⁻¹ } * b i *
          ((TG.cartan.K ⊓ Subgroup.centralizer (TH.S.map (e.points ℝ) : Set (Points ℚ B ℝ)) :
            Subgroup (Points ℚ B ℝ)) : Set (Points ℚ B ℝ)) := by sorry

theorem containment (TH : Triple H) (CG : Cartan B)
    (hred : TauCeti.reductiveCommHopfAlgProperty ℚ (finiteTypeObj ℚ B))
    (hK : TH.cartan.K.map (e.points ℝ) ≤ CG.K)
    (hS : (TH.S.map (e.points ℝ)).map CG.theta.toMonoidHom = TH.S.map (e.points ℝ))
    (W : TH.Window) :
    ∃ TG : Triple B, TG.cartan = CG ∧ Nonempty (e.Compatible TH TG) ∧
      ∃ V : TG.Window, ∃ C : Finset (Points ℚ B ℚ),
        e.points ℝ '' TH.domain W ⊆
          ⋃ γ ∈ C, (fun x => TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) γ * x) '' TG.domain V := by sorry

/-- Forward containment is an explicit separate hypothesis in the intersection theorem.
BGST Proposition 28.1; BKT erratum §1.5. -/
theorem intersection (TH : Triple H) (TG : Triple B)
    (hK : TG.cartan.K.comap (e.points ℝ) = TH.cartan.K)
    (forward : ∀ W : TH.Window, ∃ V : TG.Window, ∃ C : Finset (Points ℚ B ℚ),
      e.points ℝ '' TH.domain W ⊆
        ⋃ γ ∈ C, (fun x => TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) γ * x) '' TG.domain V)
    (V : TG.Window) :
    ∃ W : TH.Window, ∃ C : Finset (Points ℚ H ℚ),
      (e.points ℝ) ⁻¹' TG.domain V ⊆
        ⋃ γ ∈ C, (fun x => TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) γ * x) '' TH.domain W := by sorry

-- Test SiegelGeometry.embedding_identity
example : ∃ e : Embedding H H, ∀ R [CommRing R] [Algebra ℚ R],
    e.points R = MonoidHom.id _ := by sorry
-- Test SiegelGeometry.embedding_faithful
example (R : Type) [CommRing R] [Algebra ℚ R] : Function.Injective (e.points R) := by sorry
-- Test SiegelGeometry.embedding_trivial
example (e : Embedding B ℚ) (R : Type) [CommRing R] [Algebra ℚ R] :
    (e.points R).range = ⊥ := by sorry
-- Test SiegelGeometry.compatible_equal: H=G, with identical triples, needs no Weyl translates.
example (T : Triple H) : ∃ e : Embedding H H, ∃ c : e.Compatible T T,
    (∀ g, e.points ℝ g = g) ∧ c.restriction = AddMonoidHom.id _ := by sorry
-- Test SiegelGeometry.compatible_zero_root: a vanishing restriction has value one.
example (TH : Triple H) (TG : Triple B) (c : e.Compatible TH TG)
    (χ : TG.roots.X) (hχ : c.restriction χ = 0)
    (h : subgroupPoints TH.roots.splitTorus ℝ) :
    characterValue TH.roots.splitTorus (c.restriction χ) ℝ h = 1 := by sorry
-- Test SiegelGeometry.compatible_torus: no roots are manufactured on a torus H.
example (e : Embedding B (LaurentPolynomial ℚ)) (TH : Triple (LaurentPolynomial ℚ))
    (TG : Triple B) (c : e.Compatible TH TG) : TH.roots.roots = ∅ := by sorry
end Embedding
end Embeddings

/-- Reductivity without a connectedness requirement, in characteristic zero.
The geometric unipotent radical is trivial; finite component groups are allowed.
Borel §5.3, p. 19, including its disconnected-group argument. -/
def ReductiveComponents (F H : Type) [Field F] [CharZero F] [CommRing H]
    [HopfAlgebra F H] [Algebra.FiniteType F H] : Prop :=
  Algebra.Smooth F H ∧ ∀ I : TauCeti.HopfIdeal (AlgebraicClosure F)
    (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := AlgebraicClosure F) (finiteTypeObj F H)),
    I.IsNormal →
    TauCeti.smoothUnipotentCommHopfAlgProperty (AlgebraicClosure F)
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient
        (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := AlgebraicClosure F)
          (finiteTypeObj F H)) I) →
    I = TauCeti.HopfIdeal.augmentation (AlgebraicClosure F) _

theorem reductiveComponents_of_reductive {F H : Type} [Field F] [CharZero F]
    [CommRing H] [HopfAlgebra F H] [Algebra.FiniteType F H]
    (h : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    ReductiveComponents F H := by sorry
-- Test SiegelGeometry.redComponents_torus
example : ReductiveComponents ℚ (LaurentPolynomial ℚ) := by sorry
-- Test SiegelGeometry.redComponents_finite
example : ReductiveComponents ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))) := by sorry
-- Test SiegelGeometry.redComponents_additive
example [Algebra.FiniteType ℚ (SymmetricAlgebra ℚ ℚ)] :
    ¬ ReductiveComponents ℚ (SymmetricAlgebra ℚ ℚ) := by sorry

section AffineQuotients
variable {F H : Type} [Field F] [CommRing H] [HopfAlgebra F H] [Algebra.FiniteType F H]

/-- An affine realization of H_sub\G. Faithfully flat projection and exact scheme
fibres characterize the fppf quotient; pointwise surjectivity over F is not required.
This adds representability to the supplier's fppf homogeneous quotient, using inversion
for its opposite coset convention. BHC §3.8; Borel §5.3. -/
structure AffineQuotient (I : TauCeti.HopfIdeal F H) where
  coordinate : Type
  [ring : CommRing coordinate]
  [algebra : Algebra F coordinate]
  [finiteType : Algebra.FiniteType F coordinate]
  projection : coordinate →ₐ[F] H
  faithfullyFlat : letI := projection.toAlgebra; Module.FaithfullyFlat coordinate H
  fibers : ∀ (R : Type) [CommRing R] [Algebra F R] (g h : Points F H R),
    g.ofConv.comp projection = h.ofConv.comp projection ↔ g * h⁻¹ ∈ subgroupPoints I R
  action : ∀ (R : Type) [CommRing R] [Algebra F R],
    (coordinate →ₐ[F] R) → Points F H R → (coordinate →ₐ[F] R)
  action_one : ∀ (R : Type) [CommRing R] [Algebra F R] x, action R x 1 = x
  action_mul : ∀ (R : Type) [CommRing R] [Algebra F R] x g h,
    action R (action R x g) h = action R x (g * h)
  action_natural : ∀ (R S : Type) [CommRing R] [Algebra F R] [CommRing S] [Algebra F S]
    (f : R →ₐ[F] S) x g, f.comp (action R x g) =
      action S (f.comp x) (TauCeti.AlgHom.mapValue f g)
  equivariant : ∀ (R : Type) [CommRing R] [Algebra F R] (g h : Points F H R),
    action R (g.ofConv.comp projection) h = (g * h).ofConv.comp projection
attribute [instance] AffineQuotient.ring AffineQuotient.algebra AffineQuotient.finiteType

namespace AffineQuotient
variable {I : TauCeti.HopfIdeal F H} (Q : AffineQuotient I)
abbrev points (R : Type) [CommRing R] [Algebra F R] := Q.coordinate →ₐ[F] R
abbrev sigma (R : Type) [CommRing R] [Algebra F R] (g : Points F H R) : Q.points R :=
  g.ofConv.comp Q.projection

/-- The closed embedding into a representation is a surjective polynomial coordinate map;
the right action on vectors is rho(g⁻¹), ensuring the stabilizer defines left cosets. -/
theorem closed_orbit_realization [CharZero F] :
    ∃ n : ℕ, ∃ r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H,
    ∃ p : MvPolynomial (Fin n) F →ₐ[F] Q.coordinate, Function.Surjective p ∧
      ∀ (R : Type) [CommRing R] [Algebra F R] (x : Q.points R) (g : Points F H R),
        (fun i => Q.action R x g (p (MvPolynomial.X i))) =
          (matrixPoints r R g⁻¹ : Matrix (Fin n) (Fin n) R).mulVec (fun i => x (p (MvPolynomial.X i))) := by sorry

/-- Rational points lifting adelically have finitely many rational G-orbits.
Finite component groups are permitted by ReductiveComponents. -/
theorem rational_orbits [NumberField F] [CharZero F]
    (hG : ReductiveComponents F H)
    (hI : ReductiveComponents F (H ⧸ I.toIdeal)) :
    ∃ C : Finset (Q.points F),
      ∀ x : Q.points F,
        ((Algebra.ofId F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)).comp x ∈
          Set.range (Q.sigma (NumberField.AdeleRing (NumberField.RingOfIntegers F) F))) ↔
        ∃ c ∈ C, ∃ γ : Points F H F, x = Q.action F c γ := by sorry

-- Test SiegelGeometry.quotient_full: H_sub=G makes the quotient one point.
example (Q : AffineQuotient (F := F) (H := H) ⊥) : Subsingleton (Q.points F) := by sorry
-- Test SiegelGeometry.quotient_trivial: the identity subgroup loses no points.
example (Q : AffineQuotient (TauCeti.HopfIdeal.augmentation F H))
    (R : Type) [CommRing R] [Algebra F R] : Function.Bijective (Q.sigma R) := by sorry
-- Test SiegelGeometry.quotient_square: a rational quotient point need not have a rational lift.
example : ∃ I : TauCeti.HopfIdeal ℚ (LaurentPolynomial ℚ), ∃ Q : AffineQuotient I,
    ∃ z : Q.coordinate, ∃ x : Q.points ℚ,
      Q.projection z = LaurentPolynomial.T (2 : ℤ) ∧ x z = 2 ∧
        x ∉ Set.range (Q.sigma ℚ) := by sorry
end AffineQuotient

theorem affineQuotient_exists [CharZero F] (I : TauCeti.HopfIdeal F H)
    (hG : ReductiveComponents F H)
    (hI : ReductiveComponents F (H ⧸ I.toIdeal)) :
    Nonempty (AffineQuotient I) := by sorry
end AffineQuotients

section ClosedOrbits
/-- A rational representation with a closed complex orbit and a transpose-stable
real stabilizer. Rational lattices are specified by rational bases, not arbitrary
additive subgroups. BHC Lemma 5.4, pp. 505–506. -/
structure ClosedOrbit (n m : ℕ) where
  representation : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ m →ₐc[ℚ]
    TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n
  w : Fin m → ℝ
  closed : ∃ equations : Set (MvPolynomial (Fin m) ℂ),
    (Set.range fun g : Points ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) ℂ =>
      (matrixPoints representation ℂ g : Matrix (Fin m) (Fin m) ℂ).mulVec (fun i => (w i : ℂ))) =
      {v | ∀ p ∈ equations, MvPolynomial.eval v p = 0}
  stable : ∀ g h : Points ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) ℝ,
    (TauCeti.GeneralLinear.pointsMulEquiv n h : Matrix (Fin n) (Fin n) ℝ) =
      (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) ℝ).transpose →
    (matrixPoints representation ℝ g : Matrix (Fin m) (Fin m) ℝ).mulVec w = w →
      (matrixPoints representation ℝ h : Matrix (Fin m) (Fin m) ℝ).mulVec w = w

namespace ClosedOrbit
variable {n m : ℕ} (O : ClosedOrbit n m)
abbrev act (g : GL (Fin n) ℝ) : Fin m → ℝ :=
  (matrixPoints O.representation ℝ ((TauCeti.GeneralLinear.pointsMulEquiv n).symm g) :
    Matrix (Fin m) (Fin m) ℝ).mulVec O.w
abbrev lattice (b : Module.Basis (Fin m) ℚ (Fin m → ℚ)) : Set (Fin m → ℝ) :=
  {x | ∃ z : Fin m → ℤ, ∀ i, x i = ∑ j, (z j : ℝ) * (b j i : ℝ)}

theorem compact_weight_bound (u t : ℝ) (hu : 0 < u) (ht : 0 < t)
    (b : Module.Basis (Fin m) ℚ (Fin m → ℚ)) :
    ∃ Q : Set (GL (Fin n) ℝ), IsCompact Q ∧
      O.act '' matrixDomain n u t ∩ lattice b ⊆ O.act '' Q := by sorry

theorem lattice_finite (u t : ℝ) (hu : 0 < u) (ht : 0 < t)
    (b : Module.Basis (Fin m) ℚ (Fin m → ℚ)) (c : GL (Fin n) ℚ) :
    (O.act '' ((fun g => Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ) c * g) ''
      matrixDomain n u t) ∩ lattice b).Finite := by sorry

-- Test SiegelGeometry.orbit_zero: zero is a closed orbit for any rational representation.
example (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ m →ₐc[ℚ]
    TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) :
    ∃ O : ClosedOrbit n m, O.representation = r ∧ O.w = 0 := by sorry
-- Test SiegelGeometry.orbit_standard_nonclosed: the punctured line is not closed.
example : ¬ ∃ equations : Set (MvPolynomial (Fin 1) ℂ),
    {z : Fin 1 → ℂ | z 0 ≠ 0} = {v | ∀ p ∈ equations, MvPolynomial.eval v p = 0} := by sorry
-- Test SiegelGeometry.orbit_identity: the representation action has the prescribed base point.
example : O.act 1 = O.w := by sorry
-- Test SiegelGeometry.lattice_zero
example (b : Module.Basis (Fin 0) ℚ (Fin 0 → ℚ)) : lattice b = {0} := by sorry
-- Test SiegelGeometry.lattice_integral
example (x : Fin m → ℝ) : x ∈ lattice (Pi.basisFun ℚ (Fin m)) ↔
    ∀ i, ∃ z : ℤ, x i = z := by sorry
-- Test SiegelGeometry.lattice_half
example (b : Module.Basis (Fin 1) ℚ (Fin 1 → ℚ)) (hb : b 0 0 = 1/2) :
    (fun _ => (1/2 : ℝ)) ∈ lattice b ∧ (fun _ => (1/4 : ℝ)) ∉ lattice b := by sorry
-- Test SiegelGeometry.act_zero
example (h : O.w = 0) (g : GL (Fin n) ℝ) : O.act g = 0 := by sorry
-- Test SiegelGeometry.act_hyperbola: a nonzero closed orbit with weights +1 and -1.
example : ∃ O : ClosedOrbit 1 2, O.w = ![1, 1] ∧ ∀ g : GL (Fin 1) ℝ,
    O.act g = ![(g : Matrix (Fin 1) (Fin 1) ℝ) 0 0,
      (g⁻¹ : Matrix (Fin 1) (Fin 1) ℝ) 0 0] := by sorry
end ClosedOrbit

/-- Simultaneous self-adjointness for a finite nested chain of reductive
real algebraic subgroups. BHC Theorem 1.9, p. 492. -/
theorem simultaneous_selfAdjoint (n m : ℕ)
    (I : Fin m → TauCeti.HopfIdeal ℝ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℝ n))
    (hred : ∀ i, ReductiveComponents ℝ
      (TauCeti.GeneralLinear.coordinateHopfAlgebra ℝ n ⧸ (I i).toIdeal))
    (hnest : ∀ i j, i ≤ j → I i ≤ I j) :
    ∃ a : GL (Fin n) ℝ, (a : Matrix (Fin n) (Fin n) ℝ).det = 1 ∧
      ∀ i (g : subgroupPoints (I i) ℝ), ∃ h : subgroupPoints (I i) ℝ,
        (a * TauCeti.GeneralLinear.pointsMulEquiv n h.val * a⁻¹ : Matrix (Fin n) (Fin n) ℝ) =
          (a * TauCeti.GeneralLinear.pointsMulEquiv n g.val * a⁻¹ : Matrix (Fin n) (Fin n) ℝ).transpose := by sorry
end ClosedOrbits

section SymmetricSpaces
variable {H : Type} [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]

/-- Algebraic H in SL(V), a positive Gram form, and its restricted Cartan involution.
The determinant equation holds on every coefficient algebra. BKT §4.5, pp. 17–18,
with the Cartan hypothesis in the erratum's proof of Theorem 1.2. -/
structure OrbitMap (H : Type) [CommRing H] [HopfAlgebra ℚ H] (n : ℕ) where
  representation : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H
  faithful : Function.Surjective representation
  determinant : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (g : Points ℚ H R),
    (matrixPoints representation R g : Matrix (Fin n) (Fin n) R).det = 1
  b₀ : Matrix (Fin n) (Fin n) ℝ
  positive : b₀.PosDef
  cartan : Cartan H
  compatible : ∀ g, (matrixPoints representation ℝ (cartan.theta g) : Matrix (Fin n) (Fin n) ℝ) =
    b₀⁻¹ * (matrixPoints representation ℝ g⁻¹ : Matrix (Fin n) (Fin n) ℝ).transpose * b₀

/-- Cartan stability of the actual tangent space at the identity supplies the
algebraic orbit-map carrier. Dual-number matrix points express Lie(H_R), so no
arbitrary Lie subspace is an input. BKT §4.5, pp. 17–18 and erratum §1.5. -/
theorem orbitMap_of_lie {n : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (hr : Function.Surjective r)
    (hred : TauCeti.reductiveCommHopfAlgProperty ℚ (finiteTypeObj ℚ H))
    (hdet : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (g : Points ℚ H R),
      (matrixPoints r R g : Matrix (Fin n) (Fin n) R).det = 1)
    (b : Matrix (Fin n) (Fin n) ℝ) (hb : b.PosDef)
    (hLie : ∀ g : Points ℚ H (TrivSqZeroExt ℝ ℝ),
      ((matrixPoints r (TrivSqZeroExt ℝ ℝ) g :
          Matrix (Fin n) (Fin n) (TrivSqZeroExt ℝ ℝ)).map (fun z => z.fst)) = 1 →
      ∃ h : Points ℚ H (TrivSqZeroExt ℝ ℝ),
        ((matrixPoints r (TrivSqZeroExt ℝ ℝ) h :
          Matrix (Fin n) (Fin n) (TrivSqZeroExt ℝ ℝ)).map (fun z => z.fst)) = 1 ∧
        ((matrixPoints r (TrivSqZeroExt ℝ ℝ) h :
          Matrix (Fin n) (Fin n) (TrivSqZeroExt ℝ ℝ)).map (fun z => z.snd)) =
            b⁻¹ * ((matrixPoints r (TrivSqZeroExt ℝ ℝ) g :
          Matrix (Fin n) (Fin n) (TrivSqZeroExt ℝ ℝ)).map (fun z => z.snd)).transpose * b) :
    ∃ O : OrbitMap H n, O.representation = r ∧ O.b₀ = b := by sorry

namespace OrbitMap
variable {n : ℕ} (O : OrbitMap H n)
/-- The orbit consists of forms of determinant det(b₀); this avoids an unmentioned
normalization of the base form. -/
def value (g : Points ℚ H ℝ) : Matrix (Fin n) (Fin n) ℝ :=
  (matrixPoints O.representation ℝ g⁻¹ : Matrix (Fin n) (Fin n) ℝ).transpose * O.b₀ *
    (matrixPoints O.representation ℝ g⁻¹ : Matrix (Fin n) (Fin n) ℝ)

def quotient : (Points ℚ H ℝ ⧸ O.cartan.K) → Matrix (Fin n) (Fin n) ℝ :=
  Quotient.lift (O.value) (by sorry)

omit [Algebra.FiniteType ℚ H] in
theorem quotient_mk (g : Points ℚ H ℝ) : O.quotient (QuotientGroup.mk g) = O.value g := rfl

theorem value_fiber (g h : Points ℚ H ℝ) : O.value g = O.value h ↔ g⁻¹ * h ∈ O.cartan.K := by sorry

theorem preimage_siegel (T : Triple H) (hT : T.cartan = O.cartan)
    (C : ℝ) (hC : 0 < C) (b : GL (Fin n) ℚ) :
    ∃ W : T.Window, ∃ E : Finset (Points ℚ H ℚ),
      {g | RealSiegel.IsReduced C
        ((Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ) b : Matrix (Fin n) (Fin n) ℝ).transpose *
          O.value g * (Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ) b : Matrix (Fin n) (Fin n) ℝ))} ⊆
        ⋃ γ ∈ E, (fun g => TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) γ * g) '' T.domain W := by sorry

theorem image_siegel (T : Triple H) (hT : T.cartan = O.cartan) (W : T.Window) :
    ∃ C > 0, ∃ E : Finset (GL (Fin n) ℚ),
      ∀ g ∈ T.domain W, ∃ b ∈ E, RealSiegel.IsReduced C
        ((Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ) b : Matrix (Fin n) (Fin n) ℝ).transpose *
          O.value g * (Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ) b : Matrix (Fin n) (Fin n) ℝ)) := by sorry

-- Test SiegelGeometry.orbitMap_base
example : O.value 1 = O.b₀ := by sorry
-- Test SiegelGeometry.orbitMap_det
example (g : Points ℚ H ℝ) : (O.value g).det = O.b₀.det := by sorry
-- Test SiegelGeometry.orbitMap_diagonal
example (O : OrbitMap (LaurentPolynomial ℚ) 2) (g : Points ℚ (LaurentPolynomial ℚ) ℝ)
    (a : ℝ) (ha : a ≠ 0) (hb : O.b₀ = 1)
    (hg : (matrixPoints O.representation ℝ g : Matrix (Fin 2) (Fin 2) ℝ) = Matrix.diagonal ![a, a⁻¹]) :
    O.value g = Matrix.diagonal ![a⁻¹ ^ 2, a ^ 2] := by sorry
-- Test SiegelGeometry.quotient_base
example : O.quotient (QuotientGroup.mk 1) = O.b₀ := by sorry
-- Test SiegelGeometry.quotient_injective
example : Function.Injective O.quotient := by sorry
-- Test SiegelGeometry.quotient_positive
example (x : Points ℚ H ℝ ⧸ O.cartan.K) : (O.quotient x).PosDef := by sorry
end OrbitMap
end SymmetricSpaces

/-- The split torus n(1) diag(x,x⁻¹) n(-1) in SL₂, over Q.
Orr–Schnell §B, pp. 1232–1233. -/
def tiltedTorus : TauCeti.HopfIdeal ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) := sorry

theorem tiltedTorus_points (R : Type) [CommRing R] [Algebra ℚ R]
    (g : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) R) :
    g ∈ subgroupPoints tiltedTorus R ↔ ∃ x : Rˣ,
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := R) g : Matrix (Fin 2) (Fin 2) R) =
        !![(x : R), (↑x⁻¹ : R) - x; 0, ↑x⁻¹] := by sorry

theorem compact_inclusion_counterexample
    (T : Triple (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2))
    (hK : ∀ g, g ∈ T.cartan.K ↔
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ).transpose *
        (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) = 1) :
    (∀ W : T.Window, ∀ C : Finset (Points ℚ
      (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) ℚ),
      ¬ (subgroupPoints tiltedTorus ℝ : Set _) ⊆
        ⋃ γ ∈ C, (fun g => TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) γ * g) '' T.domain W) ∧
    (∀ g ∈ subgroupPoints tiltedTorus ℝ, g ∈ T.cartan.K ↔
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) = 1 ∨
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) = -1) := by sorry

-- Test SiegelGeometry.triple_nontilted: compact compatibility alone cannot specify S.
example (T : Triple (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2))
    (hK : ∀ g, g ∈ T.cartan.K ↔
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ).transpose *
        (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) = 1) :
    T.S ≠ subgroupPoints tiltedTorus ℝ := by sorry
-- Test SiegelGeometry.tilted_identity
example : (1 : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) ℝ) ∈
    subgroupPoints tiltedTorus ℝ := by sorry
-- Test SiegelGeometry.tilted_two
example (g : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) ℝ)
    (hg : (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) =
      !![2, -(3/2 : ℝ); 0, 1/2]) : g ∈ subgroupPoints tiltedTorus ℝ := by sorry
-- Test SiegelGeometry.tilted_transpose
example (g : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) ℝ)
    (hg : (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) =
      !![2, 0; -(3/2 : ℝ), 1/2]) : g ∉ subgroupPoints tiltedTorus ℝ := by sorry
-- Test SiegelGeometry.tilted_ray: the cusp direction is not a vertical strip.
example (y : ℝ) (hy : 0 < y) :
    ((Real.sqrt y : ℂ) * Complex.I + (1 / Real.sqrt y - Real.sqrt y)) /
      (1 / Real.sqrt y : ℂ) = (1 - y : ℝ) + (y : ℂ) * Complex.I := by sorry

/-- The norm-one torus of Q(sqrt(2)), in its rational two-dimensional representation.
Orr–Schnell Remark 2, pp. 1231–1232. -/
def nonsplitTorus : TauCeti.HopfIdeal ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) := sorry

theorem nonsplitTorus_points (R : Type) [CommRing R] [Algebra ℚ R]
    (g : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) R) :
    g ∈ subgroupPoints nonsplitTorus R ↔ ∃ a b : R, a^2 - 2*b^2 = 1 ∧
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := R) g : Matrix (Fin 2) (Fin 2) R) =
        !![a, 2*b; b, a] := by sorry

theorem cartan_stability_converse_fails
    (TG : Triple (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2))
    (hK : ∀ g, g ∈ TG.cartan.K ↔
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ).transpose *
        (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) = 1) :
    ∃ TH : Triple (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2 ⧸ nonsplitTorus.toIdeal),
      TH.S = ⊥ ∧ TH.cartan.K.map (TauCeti.AlgHom.mapDomain
        (Bialgebra.Quotient.mkBialgHom (R := ℚ) nonsplitTorus.toIdeal)) ≤ TG.cartan.K ∧
      (subgroupPoints nonsplitTorus ℝ).map TG.cartan.theta.toMonoidHom ≠
        subgroupPoints nonsplitTorus ℝ := by sorry

-- Test SiegelGeometry.nonsplit_identity
example : (1 : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) ℝ) ∈
    subgroupPoints nonsplitTorus ℝ := by sorry
-- Test SiegelGeometry.nonsplit_pell
example (g : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) ℝ)
    (hg : (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) =
      !![3, 4; 2, 3]) : g ∈ subgroupPoints nonsplitTorus ℝ := by sorry
-- Test SiegelGeometry.nonsplit_transpose
example (g : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) ℝ)
    (hg : (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ) g : Matrix (Fin 2) (Fin 2) ℝ) =
      !![3, 2; 4, 3]) : g ∉ subgroupPoints nonsplitTorus ℝ := by sorry

/-- The whole tilted torus is a Siegel set; its compact factor maps to {±1}. -/
theorem tiltedTorus_siegel :
    ∃ TH : Triple (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2 ⧸ tiltedTorus.toIdeal),
      ∃ W : TH.Window,
        TauCeti.AlgHom.mapDomain (Bialgebra.Quotient.mkBialgHom (R := ℚ) tiltedTorus.toIdeal) ''
          TH.domain W = (subgroupPoints tiltedTorus ℝ : Set _) ∧
        ∀ h ∈ TH.cartan.K,
          (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ)
            (TauCeti.AlgHom.mapDomain (Bialgebra.Quotient.mkBialgHom (R := ℚ) tiltedTorus.toIdeal) h) :
              Matrix (Fin 2) (Fin 2) ℝ) = 1 ∨
          (TauCeti.SpecialLinear.pointsMulEquiv ℚ 2 (A := ℝ)
            (TauCeti.AlgHom.mapDomain (Bialgebra.Quotient.mkBialgHom (R := ℚ) tiltedTorus.toIdeal) h) :
              Matrix (Fin 2) (Fin 2) ℝ) = -1 := by sorry

/-- The c=2 orthogonal example of Orr–Schnell §C, pp. 1233–1234.
The equation uses g B gᵀ=B, with B=eta J etaᵀ. -/
def twistedOrthogonal : TauCeti.HopfIdeal ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 3) := sorry

theorem twistedOrthogonal_points (R : Type) [CommRing R] [Algebra ℚ R]
    (g : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 3) R) :
    g ∈ subgroupPoints twistedOrthogonal R ↔
      let b : Matrix (Fin 3) (Fin 3) R := !![algebraMap ℚ R (-3/2), 0, algebraMap ℚ R (5/2); 0, 1, 0;
        algebraMap ℚ R (5/2), 0, algebraMap ℚ R (-3/2)]
      let m := (TauCeti.SpecialLinear.pointsMulEquiv ℚ 3 (A := R) g : Matrix (Fin 3) (Fin 3) R)
      m * b * m.transpose = b := by sorry

theorem twistedOrthogonal_semisimple : TauCeti.semisimpleCommHopfAlgProperty ℚ
    (TauCeti.FiniteTypeCommHopfAlgCat.quotient
      (finiteTypeObj ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 3)) twistedOrthogonal) := by sorry

theorem semisimple_compact_inclusion_counterexample
    (TG : Triple (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 3))
    (hK : ∀ g, g ∈ TG.cartan.K ↔
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ 3 (A := ℝ) g : Matrix (Fin 3) (Fin 3) ℝ).transpose *
        (TauCeti.SpecialLinear.pointsMulEquiv ℚ 3 (A := ℝ) g : Matrix (Fin 3) (Fin 3) ℝ) = 1) :
    ∃ TH : Triple (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 3 ⧸ twistedOrthogonal.toIdeal),
      TH.cartan.K.map (TauCeti.AlgHom.mapDomain
        (Bialgebra.Quotient.mkBialgHom (R := ℚ) twistedOrthogonal.toIdeal)) ≤ TG.cartan.K ∧
      ∃ W : TH.Window, ∀ V : TG.Window,
        ∀ C : Finset (Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 3) ℚ),
          ¬ TauCeti.AlgHom.mapDomain (Bialgebra.Quotient.mkBialgHom (R := ℚ) twistedOrthogonal.toIdeal) ''
            TH.domain W ⊆ ⋃ γ ∈ C,
              (fun g => TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) γ * g) '' TG.domain V := by sorry

-- Test SiegelGeometry.twisted_identity
example : (1 : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 3) ℝ) ∈
    subgroupPoints twistedOrthogonal ℝ := by sorry
-- Test SiegelGeometry.twisted_two: eta diag(2,1,1/2) eta^{-1}.
example (g : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 3) ℝ)
    (hg : (TauCeti.SpecialLinear.pointsMulEquiv ℚ 3 (A := ℝ) g : Matrix (Fin 3) (Fin 3) ℝ) =
      !![35/16, 0, 9/16; 0, 1, 0; -(9/16), 0, 5/16]) :
    g ∈ subgroupPoints twistedOrthogonal ℝ := by sorry
-- Test SiegelGeometry.twisted_transpose
example (g : Points ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 3) ℝ)
    (hg : (TauCeti.SpecialLinear.pointsMulEquiv ℚ 3 (A := ℝ) g : Matrix (Fin 3) (Fin 3) ℝ) =
      !![35/16, 0, -(9/16); 0, 1, 0; 9/16, 0, 5/16]) :
    g ∉ subgroupPoints twistedOrthogonal ℝ := by sorry
-- Test SiegelGeometry.twisted_gram: the off-diagonal entry obstructs the standard Siegel condition.
example : let eta : Matrix (Fin 3) (Fin 3) ℝ := !![3/2, 0, -(1/2); 0, 1, 0; -(1/2), 0, 3/2]
    (eta.transpose * eta) 0 2 = -(3/2) := by norm_num [Matrix.mul_apply, Fin.sum_univ_succ]

section PrimitiveReduction
variable {H : Type} [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]
  {n : ℕ}

/-- Intersection with the algebraic subgroup of finitely many rational translates
of the real domain times the standard integral finite level. Borel Theorem 4.5,
pp. 17–18, inverted to the left quotient convention. -/
def primitiveRegion
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (a : GL (Fin n) ℝ) (u t : ℝ)
    (C : Finset (Points ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) ℚ)) :
    Set (AdelicPoints ℚ H) :=
  {x | ∃ c ∈ C, ∃ s ∈ matrixDomain n u t,
    ∃ k : (IntegralModel.standardGLn (F := ℚ) (S := ∅) n).integralLevel,
      TauCeti.AlgHom.mapDomain r x = AdelicPoints.diagonal ℚ _ c *
        infiniteEmbed ℚ _ ((realComparison (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n)).symm
          ((TauCeti.GeneralLinear.pointsMulEquiv n).symm (s * a))) * finiteEmbed ℚ _ k.val}

theorem reductive_subgroup_reduction
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (hr : Function.Surjective r)
    (hred : ReductiveComponents ℚ H)
    (a : GL (Fin n) ℝ) (ha : (a : Matrix (Fin n) (Fin n) ℝ).det = 1)
    (hself : ∀ g : Points ℚ H ℝ, ∃ h : Points ℚ H ℝ,
      (a * matrixPoints r ℝ h * a⁻¹ : Matrix (Fin n) (Fin n) ℝ) =
        (a * matrixPoints r ℝ g * a⁻¹ : Matrix (Fin n) (Fin n) ℝ).transpose)
    (u t : ℝ) (hu : 0 < u) (ht : 0 < t)
    (hcover : ∀ g : GL (Fin n) ℝ, ∃ γ : GL (Fin n) ℤ,
      ∃ s ∈ matrixDomain n u t, g = Matrix.GeneralLinearGroup.map (Int.castRingHom ℝ) γ * s) :
    ∃ C : Finset (Points ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) ℚ),
      (∀ x : AdelicPoints ℚ H, ∃ γ : Points ℚ H ℚ,
        ∃ s ∈ primitiveRegion r a u t C, x = AdelicPoints.diagonal ℚ H γ * s) ∧
      {γ : Points ℚ H ℚ | ((fun x => AdelicPoints.diagonal ℚ H γ * x) ''
        primitiveRegion r a u t C ∩ primitiveRegion r a u t C).Nonempty}.Finite ∧
      IsCompact (closure (finiteProjection ℚ H '' primitiveRegion r a u t C)) := by sorry

-- Test SiegelGeometry.primitive_empty
example (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (a : GL (Fin n) ℝ) (u t : ℝ) : primitiveRegion r a u t ∅ = ∅ := by sorry
-- Test SiegelGeometry.primitive_identity
example (r : TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n →ₐc[ℚ] H)
    (u t : ℝ) (hu : 0 ≤ u) (ht : t ≤ 1) :
    1 ∈ primitiveRegion r 1 u t {1} := by sorry
-- Test SiegelGeometry.primitive_full_group
example (u t : ℝ) (x : AdelicPoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n)) :
    x ∈ primitiveRegion (BialgHom.id ℚ _) 1 u t {1} ↔
      TauCeti.GeneralLinear.pointsMulEquiv n (realComparison (infiniteProjection ℚ _ x)) ∈
        matrixDomain n u t ∧
      finiteProjection ℚ _ x ∈ (IntegralModel.standardGLn (F := ℚ) (S := ∅) n).integralLevel := by sorry
end PrimitiveReduction

section Comparisons
variable {H : Type} [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]

theorem cartan_exists (hred : TauCeti.reductiveCommHopfAlgProperty ℚ (finiteTypeObj ℚ H)) :
    Nonempty (Cartan H) := by sorry

theorem triple_exists (D : RelativeRootData ℚ H) (P : MinimalParabolic D) (C : Cartan H) :
    ∃ T : Triple H, T.cartan = C ∧ T.minimal.ideal = P.ideal := by sorry

/-- A general parabolic's bounded Levi window gives containment in a minimal-parabolic
triple domain. The reverse cofinal comparison is only asserted for minimal P. -/
theorem general_horo_in_triple (T : Triple H) (P : StandardParabolic T.minimal)
    (K : Subgroup (RealSiegel.ConnectedRealPoints H)) (C : RealSiegel.HoroData P K)
    (hK : K.map ((realComparison (H := H)).toMonoidHom.comp
      (RealSiegel.ConnectedRealPoints H).subtype) =
      T.cartan.K ⊓ Subgroup.connectedComponentOfOne (Points ℚ H ℝ))
    (U : Set (RealSiegel.realN P)) (V : Set (RealSiegel.realMK P C.u K))
    (t : ℝ) (hU : IsCompact (closure U)) (hV : IsCompact (closure V)) (ht : 0 < t) :
    ∃ W : T.Window, ∀ g ∈ RealSiegel.siegelSet C U t V,
      realComparison g.val ∈ T.domain W := by sorry

theorem fixed_minimal_comparison (T T' : Triple H) (hK : T.cartan.K = T'.cartan.K)
    (W : T.Window) : ∃ V : T'.Window, ∃ γ : Points ℚ H ℚ,
      T.domain W ⊆ (fun g => TauCeti.AlgHom.mapValue (Algebra.ofId ℚ ℝ) γ * g) '' T'.domain V := by sorry

theorem specialLinear_triple (n : ℕ) :
    ∃ T : Triple (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ n),
      ∀ g, g ∈ T.cartan.K ↔
        (TauCeti.SpecialLinear.pointsMulEquiv ℚ n (A := ℝ) g : Matrix (Fin n) (Fin n) ℝ).transpose *
          (TauCeti.SpecialLinear.pointsMulEquiv ℚ n (A := ℝ) g : Matrix (Fin n) (Fin n) ℝ) = 1 := by sorry

theorem matrixDomain_triple (n : ℕ) :
    ∃ T : Triple (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n),
      (∀ g, g ∈ T.cartan.K ↔
        (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) ℝ).transpose *
          (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) ℝ) = 1) ∧
      ∀ u t : ℝ, 0 < u → 0 < t → ∃ W : T.Window,
        TauCeti.GeneralLinear.pointsMulEquiv n '' T.domain W = matrixDomain n u t := by sorry
end Comparisons

end
end SiegelGeometry

noncomputable section
open scoped TensorProduct Classical

namespace Approximation

-- Test arithmeticClosure_same_prime
/-- Two places over one rational prime are simultaneous coordinates of the arithmetic closure. -/
example (F : Type) [Field F] [NumberField F] (p : ℕ) [Fact p.Prime]
    (v w : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (hvw : v ≠ w)
    (hv : ringChar (NumberField.RingOfIntegers F ⧸ v.asIdeal) = p)
    (hw : ringChar (NumberField.RingOfIntegers F ⧸ w.asIdeal) = p)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F
      (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2)))
    (hUc : IsCompact U.carrier) (hUo : IsOpen U.carrier) :
    DenseRange (fun γ : Reduction.SArithmetic.arithmetic (F := F)
        (H := TauCeti.SpecialLinear.coordinateHopfAlgebra F 2) {v, w} U =>
      (AdelicPoints.proj F _ v (AdelicPoints.diagonal F _ γ.val),
       AdelicPoints.proj F _ w (AdelicPoints.diagonal F _ γ.val))) := by sorry

-- Test arithmeticClosure_diagonal_not_ideal
/-- The diagonal in sl₂ × sl₂ contains (e,e), but its bracket with (h,0)
is (2e,0), outside the diagonal. Factorwise surjectivity cannot imply openness. -/
example (p : ℕ) [Fact p.Prime] :
    let h : Matrix (Fin 2) (Fin 2) ℚ_[p] := !![1, 0; 0, -1]
    let e : Matrix (Fin 2) (Fin 2) ℚ_[p] := !![0, 1; 0, 0]
    Matrix.trace h = 0 ∧ Matrix.trace e = 0 ∧
      h * e - e * h = 2 • e ∧ h * e - e * h ≠ 0 := by sorry

end Approximation

namespace PrimitiveThickening
variable (O : Type) [CommRing O]

/-- The relations for the primitive finite thickening of the trivial generic group. -/
def relations (p : ℕ) : Ideal (Polynomial O) :=
  Ideal.span {Polynomial.X ^ p, Polynomial.C (p : O) * Polynomial.X}

/-- The Hopf-ideal test for the additive polynomial coordinate algebra:
comultiplication kills the ideal in the quotient tensor square, evaluation at zero kills it,
and substitution X ↦ −X preserves it. -/
theorem relations_hopf (p : ℕ) (hp : p.Prime) :
    let I := relations O p
    let A := Polynomial O ⧸ I
    let e : A := Ideal.Quotient.mk I Polynomial.X
    (∀ f ∈ I, Polynomial.aeval (e ⊗ₜ[O] (1 : A) + (1 : A) ⊗ₜ[O] e) f = 0) ∧
    (∀ f ∈ I, Polynomial.eval 0 f = 0) ∧
    (∀ f ∈ I, Polynomial.aeval (-Polynomial.X : Polynomial O) f ∈ I) := by sorry

-- Test relations_hopf_prime_three
example :
    let I := relations ℤ 3
    let A := Polynomial ℤ ⧸ I
    let e : A := Ideal.Quotient.mk I Polynomial.X
    (e ⊗ₜ[ℤ] (1 : A) + (1 : A) ⊗ₜ[ℤ] e) ^ 3 = 0 ∧
      (3 : A ⊗[ℤ] A) * (e ⊗ₜ[ℤ] (1 : A) + (1 : A) ⊗ₜ[ℤ] e) = 0 := by sorry

-- Test relations_old_square_zero_rejected_three
example :
    let I : Ideal (Polynomial (ZMod 3)) := Ideal.span {Polynomial.X ^ 2}
    let A := Polynomial (ZMod 3) ⧸ I
    let e : A := Ideal.Quotient.mk I Polynomial.X
    (e ⊗ₜ[ZMod 3] (1 : A) + (1 : A) ⊗ₜ[ZMod 3] e) ^ 2 =
      2 * (e ⊗ₜ[ZMod 3] e) ∧ (2 : A ⊗[ZMod 3] A) * (e ⊗ₜ[ZMod 3] e) ≠ 0 := by sorry

-- Test relations_generic_fibre
example (p : ℕ) (hp : p.Prime) (K : Type) [Field K] [Algebra O K]
    (hpK : (p : K) ≠ 0) :
    Nonempty ((K ⊗[O] (Polynomial O ⧸ relations O p)) ≃ₐ[K] K) := by sorry

-- Test relations_integral_points
example [IsDomain O] (p : ℕ) (hp : p.Prime) (hpO : (p : O) ≠ 0)
    (f : (Polynomial O ⧸ relations O p) →ₐ[O] O) :
    f (Ideal.Quotient.mk (relations O p) Polynomial.X) = 0 := by sorry

-- Test relations_special_fibre_nonreduced
example (p : ℕ) [Fact p.Prime] :
    let I := relations (ZMod p) p
    let e := Ideal.Quotient.mk I Polynomial.X
    e ≠ 0 ∧ e ^ p = 0 := by sorry

end PrimitiveThickening

end

end TauCetiRoadmap.AdelicAlgebraicGroups
