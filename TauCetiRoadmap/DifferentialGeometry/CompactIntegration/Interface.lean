import TauCetiRoadmap.AlgebraicTopology.Suggested
import TauCetiRoadmap.AlgebraicTopology.OrientationComparison
import TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws
import TauCetiRoadmap.DifferentialGeometry.Suggested
import TauCetiRoadmap.DifferentialGeometry.SuggestedRelative
import TauCeti.Algebra.Homology.Kronecker
import TauCeti.AlgebraicTopology.Singular.Empty
import TauCeti.AlgebraicTopology.Singular.Twisted.ConstantNaturality

/-!
DG 9.3 compact fundamental-class integration adapter. It consumes AlgebraicTopology 6.3
local-section and class data; each `sorry` is an explicit implementation target.
-/

noncomputable section

universe u v w

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 800000

open CategoryTheory
open scoped ContDiff Manifold
open TauCetiRoadmap.AlgebraicTopology
open TauCetiRoadmap.DifferentialGeometry

namespace TauCetiRoadmap.DifferentialGeometry.CompactIntegration

abbrev EuclideanModel (m : ℕ) :=
  modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))

abbrev ConstantIntegralSystem (M : Type) [TopologicalSpace M] :=
  (TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
    (ModuleCat.of ℤ ℤ)

abbrev ConstantRealSystem (M : Type) [TopologicalSpace M] :=
  (TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj (ModuleCat.of ℝ ℝ)

abbrev IntLocalHomology (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] (x : M) :=
  TauCetiRoadmap.AlgebraicTopology.twistedRelativeHomology ℤ
    (puncturedPair (TopCat.of M) x) (ConstantIntegralSystem M) m

abbrev RealLocalHomology (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] (x : M) :=
  (ModuleCat.restrictScalars (Int.castRingHom ℝ)).obj
    (TauCetiRoadmap.AlgebraicTopology.twistedRelativeHomology ℝ
      (puncturedPair (TopCat.of M) x) (ConstantRealSystem M) m)

abbrev IntRelativeHomology (m : ℕ) (M : Type) [TopologicalSpace M]
    (K : Set M) :=
  twistedRelativeHomology ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
    (ConstantIntegralSystem M) m

abbrev RealRelativeHomology (m : ℕ) (M : Type) [TopologicalSpace M]
    (K : Set M) :=
  (ModuleCat.restrictScalars (Int.castRingHom ℝ)).obj
    (twistedRelativeHomology ℝ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
      (ConstantRealSystem M) m)

/-- Restrict AT's constant-system isomorphism to the integral scalar ring. This is the exact
carrier bridge for coefficient images stored as ℤ-modules; the ℝ-linear isomorphism itself cannot
be applied directly to a `RealLocalHomology` object. -/
noncomputable def restrictedConstantHomologyIso (P : TopPair) (m : ℕ) :
    (ModuleCat.restrictScalars (Int.castRingHom ℝ)).obj
        (twistedRelativeHomology ℝ P
          ((TauCeti.LocalCoefficientSystem.constantFunctor P.fst).obj (ModuleCat.of ℝ ℝ)) m) ≅
      (ModuleCat.restrictScalars (Int.castRingHom ℝ)).obj
        (P.singularHomology (ModuleCat.of ℝ ℝ) m) :=
  (ModuleCat.restrictScalars (Int.castRingHom ℝ)).mapIso
    (P.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m)

/-- The pair map on homology with a constant coefficient system.  The coefficient system on the
source of `twistedHomologyMap` is the pullback of the target's constant system, so this map first
uses the inverse of the canonical `pullbackConstantIso` to identify the source constant system
with that pullback. -/
abbrev constantSystemHomologyMap {R : Type u} [Ring R] {P Q : TopPair.{v}}
    (f : P ⟶ Q) (V : ModuleCat.{max v w} R) (m : ℕ) :=
  TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.constantSystemHomologyMap f V m

/-- Natural comparison square for AT's constant-system isomorphism after restriction of scalars.
This isolates the precise local-pair naturality law needed to compare smooth real chains with the
integer-to-real image of the orientation class. -/
theorem restrictedConstantHomologyIso_naturality
    (P Q : TopPair) (f : P ⟶ Q) (m : ℕ)
    (z : twistedRelativeHomology ℝ P
      ((TauCeti.LocalCoefficientSystem.constantFunctor P.fst).obj (ModuleCat.of ℝ ℝ)) m) :
    (restrictedConstantHomologyIso Q m).hom
      ((constantSystemHomologyMap f (ModuleCat.of ℝ ℝ) m).hom z) =
    ((ModuleCat.restrictScalars (Int.castRingHom ℝ)).map
      (TopPair.singularHomologyMap (C := ModuleCat.{0} ℝ) f (ModuleCat.of ℝ ℝ) m)).hom
      ((restrictedConstantHomologyIso P m).hom z) := by
  let e := TauCeti.LocalCoefficientSystem.pullbackConstantIso
    (TopPair.Hom.fst f).hom (ModuleCat.of ℝ ℝ)
  have hnative := TopPair.twistedHomologyConstantIso_hom_pair_naturality
    (P := P) (Q := Q) (M := ModuleCat.of ℝ ℝ) f m
  have hinv : P.twistedHomologyCoefficientMap e.inv m ≫
      P.twistedHomologyCoefficientMap e.hom m = 𝟙 _ := by
    rw [← TopPair.twistedHomologyCoefficientMap_comp (P := P)
      (L := (TauCeti.LocalCoefficientSystem.constantFunctor P.fst).obj
        (ModuleCat.of ℝ ℝ)) (f := e.inv) (g := e.hom) m]
    simp
  have hmap : P.twistedHomologyCoefficientMap e.inv m ≫
      TopPair.twistedHomologyMap f
        ((TauCeti.LocalCoefficientSystem.constantFunctor Q.fst).obj
          (ModuleCat.of ℝ ℝ)) m ≫
      (Q.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m).hom =
    (P.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m).hom ≫
      P.singularHomologyMap f (ModuleCat.of ℝ ℝ) m := by
    calc
      _ = P.twistedHomologyCoefficientMap e.inv m ≫
          P.twistedHomologyCoefficientMap e.hom m ≫
          (P.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m).hom ≫
          P.singularHomologyMap f (ModuleCat.of ℝ ℝ) m := by
        rw [hnative]
      _ = _ := by
        rw [← Category.assoc]
        rw [hinv]
        simp
  let F := ModuleCat.restrictScalars (Int.castRingHom ℝ)
  have hrestricted := congrArg (fun g => F.map g) hmap
  rw [CategoryTheory.Functor.map_comp, CategoryTheory.Functor.map_comp] at hrestricted
  have hrestricted' := congrArg (fun g => g.hom z) hrestricted
  change (F.map (Q.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m).hom).hom
      (((F.map (constantSystemHomologyMap f (ModuleCat.of ℝ ℝ) m)).hom) z) =
    (F.map (P.singularHomologyMap f (ModuleCat.of ℝ ℝ) m)).hom
      (((F.map (P.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m).hom).hom) z)
  exact hrestricted'

abbrev orderedSimplexVertex := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.orderedVertex
abbrev orderedSimplexVector := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.orderedVector
abbrev orderedSimplexEdgeMatrix := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.orderedEdgeMatrix
abbrev ChartSimplexWitness := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.ChartSimplex
abbrev chartSimplexWitness_exists := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chartSimplexWitness_exists
abbrev chartSimplexPairMap := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chartSimplexPairMap
abbrev orderedChartSimplexImage := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.orderedChartImage

/-- The complement pair has support K: every point outside its subspace belongs to K. -/
theorem supportPair_mem_of_not_range
    (M : Type) [TopologicalSpace M] (K : Set M) (x : M)
    (hx : x ∉ Set.range ((TopPair.ofSubset (X := TopCat.of M) Kᶜ).map :
      (TopPair.ofSubset (X := TopCat.of M) Kᶜ).snd → TopCat.of M)) : x ∈ K := by
  by_contra hK
  exact hx ⟨⟨x, hK⟩, rfl⟩

/-- A support point is outside the subspace of its complement pair. -/
theorem supportPair_point_not_subspace
    (M : Type) [TopologicalSpace M] (K : Set M) (x : M) (hx : x ∈ K) :
    x ∉ Set.range ((TopPair.ofSubset (X := TopCat.of M) Kᶜ).map :
      (TopPair.ofSubset (X := TopCat.of M) Kᶜ).snd → TopCat.of M) := by
  intro h
  rcases h with ⟨y, hxy⟩
  have hy : (TopPair.ofSubset (X := TopCat.of M) Kᶜ).map y ∈ K := hxy ▸ hx
  change y.val ∈ K at hy
  exact y.property hy

/-- On this support pair, the AT support-local map is the generic relative-local map. -/
theorem supportLocalMap_eq_relativeLocalMap
    (R : Type) [CommRing R] (M : Type) [TopologicalSpace M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (m : ℕ) (K : Set M)
    (x : M) (hx : x ∈ K) :
    twistedSupportLocalMap R (TopCat.of M) L m K x hx =
      twistedRelativeLocalMap R (TopPair.ofSubset (X := TopCat.of M) Kᶜ) L m x
        (by
          intro h
          rcases h with ⟨y, hxy⟩
          have hy : (TopPair.ofSubset (X := TopCat.of M) Kᶜ).map y ∈ K := hxy ▸ hx
          change y.val ∈ K at hy
          exact y.property hy) := by
  rfl

abbrev modelOrientationSign :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.modelOrientationSign
/-- DG compatibility name for AT6.3's selected chart-local orientation generator. -/
abbrev orientedLocalGenerator :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator

/-! The simplex's native `ULift ℤ` coefficient is transported exactly once in
`orderedChartSimplexImage`. All subsequent integral local and relative carriers are AT's
`ModuleCat.of ℤ ℤ` orientation-system carrier. -/

/-- Coefficient-system map induced by the integer cast into the restricted real system. -/
noncomputable def integerToRealConstantSystemMap (M : Type) [TopologicalSpace M] :
    ConstantIntegralSystem M ⟶
      restrictCoefficientSystem ℝ (TopCat.of M) (ConstantRealSystem M) := by
  letI : Module ℤ ℝ := Module.compHom ℝ (Int.castRingHom ℝ)
  let φ : ModuleCat.of ℤ ℤ ⟶
      (ModuleCat.restrictScalars (Int.castRingHom ℝ)).obj (ModuleCat.of ℝ ℝ) :=
    ModuleCat.ofHom (LinearMap.toSpanSingleton ℤ ℝ 1)
  refine { app := fun _ => φ, naturality := ?_ }
  intro X Y f
  simp [ConstantIntegralSystem, ConstantRealSystem, restrictCoefficientSystem]

/-- The integer-to-real map is AT's coefficient map followed by its exact scalar-restriction
homology isomorphism. Its codomain is viewed as an ℤ-module only to express the canonical map. -/
noncomputable def integerToRealLocalHomologyMap (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M]
    (x : M) : IntLocalHomology m M x →ₗ[ℤ] RealLocalHomology m M x := by
  let P := puncturedPair (TopCat.of M) x
  let coeff := P.twistedHomologyCoefficientMap (integerToRealConstantSystemMap M) m
  let scalar := twistedRestrictScalarsHomologyIso ℝ P (ConstantRealSystem M) m
  exact (coeff ≫ scalar.hom).hom

abbrev orientedLocalGenerator_chartFormula :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator_chartFormula

abbrev orientedLocalGenerator_chartWitness_independent :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator_chartWitness_independent

abbrev orientedLocalGenerator_quotient_congr :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator_quotient_congr

/-- The chart-to-integral bridge is kept as an explicit certificate with three separate pieces:
the smooth simplex map, its AT local-homology class, and the one-chart integral identity. This
prevents a final Kronecker rewrite from concealing all of the geometric work in one admission. -/
structure ChartSimplexIntegrationRoute (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    (x : M) (w : ChartSimplexWitness m M x)
    (l : OrientationLift (EuclideanModel m) M (Fin m)) where
  simplex : SmoothSimplex (EuclideanModel m) M m
  simplex_formula : ∀ t : fullSimplex m,
    simplex.1 t = w.map (ULift.up (fullSimplexEquivStdSimplex m t))
  simplex_injective : Function.Injective simplex.1
  oneChartIntegral : ∀ (α : RoughForm (EuclideanModel m) M ℝ m),
    IsSmoothForm (EuclideanModel m) 0 α → IsCompact α.tsupport →
    α.tsupport ⊆ Set.range simplex.1 →
      integralTopForm (Quotient.mk _ l) α =
        ((modelOrientationSign m l *
          (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) : ℝ) *
          chainIntegral (Finsupp.single simplex 1) α)

/-- Existence of the genuine chart-simplex comparison and its local integration formula. This is
the remaining DG/AT bridge target; its proof uses the affine determinant lemma above, DG5.2
`integralTopForm_of_tsupport_subset_chart`, and simplex change-of-variables. -/
theorem chartSimplexIntegrationRoute_exists (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    (x : M) (w : ChartSimplexWitness m M x)
    (l : OrientationLift (EuclideanModel m) M (Fin m)) :
    Nonempty (ChartSimplexIntegrationRoute m M x w l) := by
  sorry

/- Finite partition assembly is proved once as P7 in RelativeIntegration. -/

/-- Reuse AT's integral open-embedding local map, including its canonical constant-system
pullback comparison. This is definitionally not a second construction by conjugating untwisted
maps. -/
abbrev openEmbeddingLocalHomologyMap {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    (m : ℕ) [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (EuclideanModel m) ∞ M] [IsManifold (EuclideanModel m) ∞ N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (x : M) :=
  TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.localOpenEmbeddingHomologyMap
    m f hf x

/-- AT owns the pure local-generator naturality law; this compatibility theorem preserves the DG
name while the tangent, orientation, and open-embedding hypotheses remain explicit. -/
theorem orientedLocalGenerator_openEmbedding_natural
    {M N : Type} [TopologicalSpace M] [TopologicalSpace N]
    [T2Space M] [T2Space N] [SecondCountableTopology M] [SecondCountableTopology N]
    (m : ℕ) [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    [IsManifold (EuclideanModel m) ∞ N] [BoundarylessManifold (EuclideanModel m) N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f)
    (d : ∀ x, TangentSpace (EuclideanModel m) x ≃ₗ[ℝ]
      TangentSpace (EuclideanModel m) (f x))
    (hd : ∀ x, (d x).toLinearMap = mfderiv (EuclideanModel m) (EuclideanModel m) f x)
    (oM : Manifold.Orientation (EuclideanModel m) M (Fin m))
    (oN : Manifold.Orientation (EuclideanModel m) N (Fin m))
    (hori : ∀ x, Orientation.map (Fin m) (d x) (orientationAt oM x) =
      orientationAt oN (f x)) (x : M) :
    (openEmbeddingLocalHomologyMap m f hf x).hom (orientedLocalGenerator m M oM x) =
      orientedLocalGenerator m N oN (f x) := by
  exact TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.pointGenerator_openEmbedding_natural
    m f hf d hd oM oN hori x

/-- AT's point-generator negation law, exposed under the DG compatibility name. -/
theorem orientedLocalGenerator_neg (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (EuclideanModel m) ∞ M]
    [BoundarylessManifold (EuclideanModel m) M]
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m)) (x : M) :
    orientedLocalGenerator m M o.neg x = -orientedLocalGenerator m M o x :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator_neg m M o x

/-! ## Native integer-to-real coefficient map -/

/-- AT's twisted coefficient map followed by its exact homology isomorphism for restriction of
scalars. This is a linear map over ℤ into the underlying restricted ℝ-homology module. -/
noncomputable def integerToRealRelativeHomologyMap (m : ℕ) (M : Type)
    [TopologicalSpace M] (K : Set M) :
    IntRelativeHomology m M K →ₗ[ℤ] RealRelativeHomology m M K := by
  let P := TopPair.ofSubset (X := TopCat.of M) Kᶜ
  let coeff := P.twistedHomologyCoefficientMap (integerToRealConstantSystemMap M) m
  let scalar := twistedRestrictScalarsHomologyIso ℝ P (ConstantRealSystem M) m
  exact (coeff ≫ scalar.hom).hom

/-- The support-local square is inherited from AT's map naturality and scalar comparison. -/
theorem integerToRealLocalHomologyMap_naturality
    (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M]
    (K : Set M) (x : M) (hx : x ∈ K)
    (z : IntRelativeHomology m M K) :
    integerToRealLocalHomologyMap m M x
      ((twistedSupportLocalMap ℤ (TopCat.of M) (ConstantIntegralSystem M) m K x hx).hom z) =
    (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M) m K x hx).hom
      (integerToRealRelativeHomologyMap m M K z) := by
  sorry

/-- Thin DG view of AT's existing relative twisted-class datum. The underlying carrier is
AT's `RelativeTwistedClassDatum`; DG does not introduce a second relative-homology class
structure. The real class is the coefficient image of AT's integral class. -/
abbrev CompactFundamentalClass (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    (K : Set M) (_hK : IsCompact K)
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m)) :=
  RelativeTwistedClassDatum ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
    (ConstantIntegralSystem M) m (fun x _ => orientedLocalGenerator m M o x)

namespace CompactFundamentalClass

variable {m : ℕ} {M : Type} [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    {K : Set M} {hK : IsCompact K}
    {o : Manifold.Orientation (EuclideanModel m) M (Fin m)}

/-- The integer class is the AT-owned datum's class. -/
noncomputable def integralClass (c : CompactFundamentalClass m M K hK o) :
    IntRelativeHomology m M K := c.fundamentalClass

/-- Real coefficients are obtained by AT's coefficient-extension map, not independently stored. -/
noncomputable def realClass (c : CompactFundamentalClass m M K hK o) :
    RealRelativeHomology m M K :=
  integerToRealRelativeHomologyMap m M K c.fundamentalClass

/-- Comparison of the AT local-pair normalization with DG's support-local map. -/
theorem integral_local_image (c : CompactFundamentalClass m M K hK o) (x : M) (hx : x ∈ K) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (ConstantIntegralSystem M) m K x hx).hom
      c.fundamentalClass = orientedLocalGenerator m M o x := by
  have hxNot := supportPair_point_not_subspace M K x hx
  rw [supportLocalMap_eq_relativeLocalMap ℤ M (ConstantIntegralSystem M) m K x hx]
  exact c.local_eq x hxNot

theorem real_local_image (c : CompactFundamentalClass m M K hK o) (x : M) (hx : x ∈ K) :
    (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M) m K x hx).hom
      c.realClass = integerToRealLocalHomologyMap m M x (orientedLocalGenerator m M o x) := by
  change (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M) m K x hx).hom
      (integerToRealRelativeHomologyMap m M K c.fundamentalClass) =
    integerToRealLocalHomologyMap m M x (orientedLocalGenerator m M o x)
  rw [← integerToRealLocalHomologyMap_naturality m M K x hx c.fundamentalClass]
  rw [c.integral_local_image]

theorem real_is_integer_image (c : CompactFundamentalClass m M K hK o) :
    c.realClass = integerToRealRelativeHomologyMap m M K c.fundamentalClass := rfl

end CompactFundamentalClass

/-- Compatibility name: AT6.3 owns this actual locally represented section and its proof. -/
abbrev orientedLocalGeneratorSection :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chosenSection

/-- Compatibility name: this is the integral projection of AT6.3's selected datum. -/
noncomputable def orientedCompactIntegralClass (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    (K : Set M) (hK : IsCompact K)
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m)) : IntRelativeHomology m M K :=
  (TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chosenCompactDatum
    m M K hK o).fundamentalClass

theorem orientedCompactIntegralClass_local_image (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    (K : Set M) (hK : IsCompact K)
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m)) (x : M) (hx : x ∈ K) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (ConstantIntegralSystem M) m K x hx).hom
      (orientedCompactIntegralClass m M K hK o) = orientedLocalGenerator m M o x := by
  change (twistedSupportLocalMap ℤ (TopCat.of M) (ConstantIntegralSystem M) m K x hx).hom
      (TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chosenCompactClass
        m M K hK o) = orientedLocalGenerator m M o x
  exact TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chosenCompactClass_local
    m M K hK o x hx

/-- The DG name is a transparent alias of AT's existing normalized class datum. -/
abbrev orientedCompactClass :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chosenCompactDatum

/-- Compact absolute fundamental class is the pair class for `(M,∅)` under the native inclusion
isomorphism. This applies only when `M` is compact; the relative compact-support class above does
not require compactness of `M`. The following exact-carrier isomorphism is an implementation
target, to be built from the native inclusion isomorphism and the canonical identification of
`TopPair.ofSubset ∅` with `TopPair.incl.obj`.
-/
abbrev AbsoluteRealHomology (m : ℕ) (M : Type) [TopologicalSpace M] :=
  (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℝ) m).obj
      (ModuleCat.of ℝ ℝ)).obj (TopCat.of M))

/-- The relative pair `(M,∅)` and `TopPair.incl.obj M` have the same ambient space; their empty
subspaces are identified by the unique map between the empty subtype and `PEmpty`. -/
noncomputable def emptySubsetPairIso (X : TopCat) :
    TopPair.ofSubset (X := X) (∅ : Set X) ≅ TopPair.incl.obj X := by
  let P := TopPair.ofSubset (X := X) (∅ : Set X)
  let Q := TopPair.incl.obj X
  let f : P ⟶ Q := TopPair.ofHom (𝟙 X)
    (TopCat.ofHom ⟨fun a => False.elim a.2, by fun_prop⟩) (by
      ext a
      exact False.elim a.2)
  have hfst : IsIso (TopPair.Hom.fst f) := by
    change IsIso (𝟙 X)
    infer_instance
  letI := hfst
  have hsurj : Function.Surjective (TopPair.Hom.snd f) := by
    intro y
    change PEmpty at y
    exact PEmpty.elim y
  haveI : IsIso f := TopPair.isIso_of_isIso_fst_of_surjective_snd f hsurj
  exact asIso f

/-- Adapter between Tau Ceti's native simplicial-pair homology functor and the roadmap's
chain-complex homology carrier. The equality is the native
`singularHomologyFunctor_eq_chainComplexFunctor`, not a free carrier isomorphism. -/
noncomputable def nativeToRoadmapRelativeHomologyIso (m : ℕ) (P : TopPair) :
    P.singularHomology (ModuleCat.of ℝ ℝ) m ≅
      (((AlgebraicTopology.relativeSingularHomology ℝ m).obj (ModuleCat.of ℝ ℝ)).obj P) := by
  let h := TopPair.singularHomologyFunctor_eq_chainComplexFunctor
    (ModuleCat.of ℝ ℝ) m
  have hp : (TopPair.singularHomologyFunctor (ModuleCat.of ℝ ℝ) m).obj P =
      (((AlgebraicTopology.relativeSingularHomology ℝ m).obj (ModuleCat.of ℝ ℝ)).obj P) := by
    simpa [AlgebraicTopology.relativeSingularHomology,
      AlgebraicTopology.relativeSingularChainComplex, Functor.comp_obj] using
        congrArg (fun F => F.obj P) h
  exact eqToIso hp

noncomputable def nativeEmptyPairToAbsoluteIso (m : ℕ) (M : Type)
    [TopologicalSpace M] :
    (TopPair.incl.obj (TopCat.of M)).singularHomology (ModuleCat.of ℝ ℝ) m ≅
      AbsoluteRealHomology m M := by
  simpa only [Functor.comp_obj, TopPair.singularHomologyFunctor_obj,
    AbsoluteRealHomology] using
    ((TopPair.singularHomologyInclIso (ModuleCat ℝ) (ModuleCat.of ℝ ℝ) m).app
      (TopCat.of M)).symm

noncomputable def relativeEmptyToAbsoluteHomologyIso (m : ℕ) (M : Type)
    [TopologicalSpace M] :
    (TopPair.ofSubset (X := TopCat.of M) (∅ : Set M)).singularHomology
        (ModuleCat.of ℝ ℝ) m ≅ AbsoluteRealHomology m M := by
  let e := emptySubsetPairIso (TopCat.of M)
  exact (((AlgebraicTopology.relativeSingularHomology ℝ m).obj
      (ModuleCat.of ℝ ℝ)).mapIso e ≪≫
    (nativeToRoadmapRelativeHomologyIso m (TopPair.incl.obj (TopCat.of M))).symm) ≪≫
      nativeEmptyPairToAbsoluteIso m M

noncomputable def absoluteRealFundamentalClass (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M] [CompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (EuclideanModel m) ∞ M]
    [BoundarylessManifold (EuclideanModel m) M]
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m))
    (c : CompactFundamentalClass m M Set.univ isCompact_univ o) :
    AbsoluteRealHomology m M := by
  let P : TopPair := TopPair.ofSubset (X := TopCat.of M) (Set.univ : Set M)ᶜ
  have hp : P = TopPair.ofSubset (X := TopCat.of M) (∅ : Set M) := by
    simp [P]
  exact (relativeEmptyToAbsoluteHomologyIso m M).hom
    (hp ▸ ((P.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m).hom c.realClass))

/-- The relative `(M,∅)` carrier and AT's `TopPair.incl` carrier are related by the canonical
pair-inclusion comparison. This records the exact bridge needed by `FundamentalClassDatum`. -/
noncomputable def absoluteHomologyToFundamentalDatumIso (m : ℕ) (M : Type)
    [TopologicalSpace M] :
    AbsoluteRealHomology m M ≅
      (((AlgebraicTopology.relativeSingularHomology ℝ m).obj (ModuleCat.of ℝ ℝ)).obj
        (TopPair.incl.obj (TopCat.of M))) := by
  exact (nativeEmptyPairToAbsoluteIso m M).symm ≪≫
    nativeToRoadmapRelativeHomologyIso m (TopPair.incl.obj (TopCat.of M))

/-- A top-degree form on a finite-dimensional manifold is closed because its exterior derivative
lands in the zero module of forms of degree `m+1`. -/
theorem topForm_closed_of_finrank {E H N : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace N] [ChartedSpace H N] [IsManifold I 1 N] [IsManifold I ∞ N]
    (m : ℕ) (hm : Module.finrank ℝ E = m) (η : SmoothForm I N ℝ m) :
    η ∈ closedForms I N m := by
  sorry

/-- Euclidean specialization used by the integration wrappers. -/
theorem euclideanTopForm_closed (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) 1 M] [IsManifold (EuclideanModel m) ∞ M]
    (α : SmoothForm (EuclideanModel m) M ℝ m) :
    α ∈ closedForms (EuclideanModel m) M m := by
  sorry

/-- Consumer-facing absolute class in the actual AT `FundamentalClassDatum` carrier. The local
spanning proof is the orientation-normalization comparison, not a sign-free arbitrary generator. -/
noncomputable def absoluteFundamentalClassDatum (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M] [CompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (EuclideanModel m) ∞ M]
    [BoundarylessManifold (EuclideanModel m) M]
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m))
    (c : CompactFundamentalClass m M Set.univ isCompact_univ o) :
    FundamentalClassDatum ℝ (TopCat.of M) m where
  fundamentalClass := (absoluteHomologyToFundamentalDatumIso m M).hom
    (absoluteRealFundamentalClass m M o c)
  spans := by
    intro x
    sorry

/-- Already normalized compact-support class data are equal by AT uniqueness. -/
theorem compactFundamentalClass_unique (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    (K : Set M) (hK : IsCompact K)
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m))
    (a b : CompactFundamentalClass m M K hK o)
    : a = b := by
  exact TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.relativeClass_unique
    m M K hK o a b

/-- Pair map induced by K⊆K′, directed from the larger support pair to the smaller one. -/
abbrev supportEnlargementMap {M : Type} [TopologicalSpace M]
    (K K' : Set M) (hKK' : K ⊆ K') :=
  TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.supportEnlargementPairMap
    (M := M) K K' hKK'

/-- AT-owned coefficient-correct homology map associated to support enlargement. -/
abbrev supportEnlargementHomologyMap (m : ℕ) (M : Type) [TopologicalSpace M]
    (K K' : Set M) (hKK' : K ⊆ K') :=
  TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.supportEnlargementHomologyMap
    m M K K' hKK'

/-- The fundamental classes are compatible with the actual relative-pair map on enlargement. -/
theorem compactFundamentalClass_enlarge (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    (K K' : Set M) (hK : IsCompact K) (hK' : IsCompact K') (hKK' : K ⊆ K')
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m))
    (c : CompactFundamentalClass m M K hK o) (c' : CompactFundamentalClass m M K' hK' o) :
    (supportEnlargementHomologyMap m M K K' hKK').hom c'.fundamentalClass = c.fundamentalClass := by
  exact TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.relativeClass_enlarge
    m M K K' hK hK' hKK' o c c'

/-- Real support-enlargement compatibility is obtained from the same AT scalar-restriction
coefficient map, not a separately normalized real class. -/
theorem compactFundamentalClass_real_enlarge (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [BoundarylessManifold (EuclideanModel m) M]
    (K K' : Set M) (hK : IsCompact K) (hK' : IsCompact K') (hKK' : K ⊆ K')
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m))
    (c : CompactFundamentalClass m M K hK o) (c' : CompactFundamentalClass m M K' hK' o) :
    (constantSystemHomologyMap (supportEnlargementMap (M := M) K K' hKK')
      (ModuleCat.of ℝ ℝ) m).hom c'.realClass = c.realClass := by
  sorry

/-- Pair map carrying support in `K` along an open embedding to support in its image. -/
abbrev compactSupportOpenEmbeddingPairMap {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M) :=
  TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.supportOpenEmbeddingPairMap f hf K

/-- AT owns this integral support-pair map; DG keeps the coefficient/form adapters. -/
abbrev compactSupportOpenEmbeddingHomologyMap {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M) (m : ℕ) :=
  TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.supportOpenEmbeddingHomologyMap
    f hf K m

/-- Compact-class naturality under an oriented open embedding. The orientation hypothesis is
exactly the tangent-orientation transport used by local generator naturality. -/
theorem compactFundamentalClass_openEmbedding_natural (m : ℕ) {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (EuclideanModel m) ∞ M] [IsManifold (EuclideanModel m) ∞ N]
    [BoundarylessManifold (EuclideanModel m) M] [BoundarylessManifold (EuclideanModel m) N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f)
    (d : ∀ x, TangentSpace (EuclideanModel m) x ≃ₗ[ℝ]
      TangentSpace (EuclideanModel m) (f x))
    (hd : ∀ x, (d x).toLinearMap = mfderiv (EuclideanModel m) (EuclideanModel m) f x)
    (oM : Manifold.Orientation (EuclideanModel m) M (Fin m))
    (oN : Manifold.Orientation (EuclideanModel m) N (Fin m))
    (hori : ∀ x, Orientation.map (Fin m) (d x) (orientationAt oM x) = orientationAt oN (f x))
    (K : Set M) (hK : IsCompact K) (hK' : IsCompact (f '' K))
    (c : CompactFundamentalClass m M K hK oM)
    (c' : CompactFundamentalClass m N (f '' K) hK' oN) :
    (compactSupportOpenEmbeddingHomologyMap f hf K m).hom c.fundamentalClass =
      c'.fundamentalClass := by
  exact TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.relativeClass_openEmbedding_natural
    m f hf d hd oM oN hori K hK hK' c c'

/-- Reversal of manifold orientation negates the compactly supported integral class; this is a
global uniqueness consequence of the pointwise sign law, not just the local-generator lemma. -/
theorem compactFundamentalClass_orientation_neg (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (EuclideanModel m) ∞ M]
    [BoundarylessManifold (EuclideanModel m) M] (K : Set M) (hK : IsCompact K)
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m)) :
    (orientedCompactClass m M K hK o.neg).fundamentalClass =
      -(orientedCompactClass m M K hK o).fundamentalClass := by
  simpa [orientedCompactClass, TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.chosenCompactDatum]
    using TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.chosenCompactClass_orientation_neg
      m M K hK o

/-- Canonical map from union support to the two component supports. Its components are the
actual relative homology maps induced by the support-enlargement inclusions `Kᵢ ⊆ K₁ ∪ K₂`.
The inverse excision theorem is only asserted for compact disjoint supports. -/
abbrev disjointSupportComponentMap (m : ℕ) (M : Type) [TopologicalSpace M]
    (K₁ K₂ : Set M) :=
  TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.disjointSupportComponentMap m M K₁ K₂

/-- Compact disjoint-support excision. Disjointness alone does not suffice for arbitrary
noncompact, nonclosed supports: for `M = ℝ`, `m = 0`, `K₁ = (-∞,0)` and `K₂ = [0,∞)`, both
component relative groups vanish while the union-supported relative group is `H₀(ℝ,∅) ≅ ℤ`.
This example does not establish that compactness is necessary when supports are closed. -/
abbrev disjointSupportExcisionIso (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    (K₁ K₂ : Set M) (hK₁ : IsCompact K₁) (hK₂ : IsCompact K₂) (hdisj : Disjoint K₁ K₂) :=
  TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.disjointSupportExcisionIso
    m M K₁ K₂ hK₁ hK₂ hdisj

/-- Component additivity of the canonical integral fundamental class under disjoint support
excision. The map is explicit and AT's excision equivalence is its proof dependency. -/
theorem disjointComponentFundamentalClass_additivity (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (EuclideanModel m) ∞ M]
    [BoundarylessManifold (EuclideanModel m) M] (K₁ K₂ : Set M)
    (h₁ : IsCompact K₁) (h₂ : IsCompact K₂) (hdisj : Disjoint K₁ K₂)
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m)) :
    disjointSupportExcisionIso m M K₁ K₂ h₁ h₂ hdisj
      ((orientedCompactClass m M (K₁ ∪ K₂) (h₁.union h₂) o).fundamentalClass) =
      ((orientedCompactClass m M K₁ h₁ o).fundamentalClass,
       (orientedCompactClass m M K₂ h₂ o).fundamentalClass) := by
  exact TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.disjointComponentFundamentalClass_additivity
    m M K₁ K₂ h₁ h₂ hdisj o

/-- Integral evaluation reverses sign with orientation. This is stated independently of the
relative theorem so consumers can use the sign law without reconstructing its proof route. -/
theorem integralTopForm_orientation_neg {E H M : Type} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    {I' : ModelWithCorners ℝ E H} [ChartedSpace H M] [IsManifold I' 1 M]
    (o : Manifold.Orientation I' M (Fin (Module.finrank ℝ E)))
    (η : SmoothForm I' M ℝ (Module.finrank ℝ E)) :
    integralTopForm o.neg (η : RoughForm I' M ℝ (Module.finrank ℝ E)) =
      -integralTopForm o (η : RoughForm I' M ℝ (Module.finrank ℝ E)) := by
  exact integralTopForm_neg o (η : RoughForm I' M ℝ (Module.finrank ℝ E))

/-- Relative Kronecker evaluation on Tau Ceti's actual pair chain complex. -/
def relativePairKronecker (P : TopPair) (m : ℕ) :
    P.singularCohomology (ModuleCat.of ℝ ℝ) ℝ (ModuleCat.of ℝ ℝ) m →ₗ[ℝ]
      (P.singularHomology (ModuleCat.of ℝ ℝ) m ⟶ ModuleCat.of ℝ ℝ) :=
  TauCeti.ChainComplex.kronecker ℝ
    (P.singularChainComplex (ModuleCat.of ℝ ℝ)) (ModuleCat.of ℝ ℝ) m

/-! AT6.3's `GeneralModelOrientation` owns the fresh recharted carrier, selected point
and compact classes, and class-level choice independence. `GeneralModelIntegration` consumes
that module and this interface's scalar/smooth-chain comparison maps. -/

end TauCetiRoadmap.DifferentialGeometry.CompactIntegration

end
