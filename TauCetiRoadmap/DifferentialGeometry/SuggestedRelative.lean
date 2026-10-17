import TauCetiRoadmap.DifferentialGeometry.Suggested
import Mathlib.Algebra.Homology.Embedding.ExtendHomology
import TauCeti.AlgebraicTopology.Cohomology.Kronecker
import TauCeti.Topology.Category.TopPair

/-!
Suggested forms, not an exhaustive checklist. The README is the definitive
specification. These prototypes pin the relative chain, evaluation and exact
sequence interfaces of DG 8.3–8.5; admissions are mathematical targets.
-/

noncomputable section
open CategoryTheory CategoryTheory.Limits HomologicalComplex
open scoped Manifold Bundle Topology ContDiff
namespace TauCetiRoadmap.DifferentialGeometry

section RelativeChains
variable {E H : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] [IsManifold I ∞ M]

/-- Actual quotient of smooth chains by the chains of the open submanifold. -/
def smoothRelativeSingularChainComplex (W : TopologicalSpace.Opens M) :
    ChainComplex (ModuleCat ℝ) ℕ :=
  cokernel (smoothChainMap (I := I) (I' := I)
    (f := fun x : W => (x : M)) contMDiff_subtype_val)

def smoothRelativeChainProjection (W : TopologicalSpace.Opens M) :
    smoothSingularChainComplex I M ⟶ smoothRelativeSingularChainComplex I W :=
  cokernel.π (smoothChainMap (I := I) (I' := I)
    (f := fun x : W => (x : M)) contMDiff_subtype_val)

omit [IsManifold I 1 M] [IsManifold I ∞ M] in
/-- Naturality and the native pair-chain quotient kill the chains of W. -/
theorem smoothToRelative_comp_inclusion_zero (W : TopologicalSpace.Opens M) :
    smoothChainMap (I := I) (I' := I)
      (f := fun x : W => (x : M)) contMDiff_subtype_val ≫
      (smoothToSingular I M ≫
        (openManifoldPair W).singularChainComplexπ (ModuleCat.of ℝ ℝ)) = 0 := by
  let pairProjection := (openManifoldPair W).singularChainComplexπ (ModuleCat.of ℝ ℝ)
  let i := SSet.chainComplexMap
    (TopCat.toSSet.map (TopCat.ofHom
      ⟨fun x : W => (x : M), continuous_subtype_val⟩))
    (ModuleCat.of ℝ ℝ)
  have hzero : i ≫ pairProjection = 0 :=
    TopPair.chainComplexMap_comp_singularChainComplexπ
      (openManifoldPair W) (ModuleCat.of ℝ ℝ)
  have hnat : smoothChainMap (I := I) (I' := I)
      (f := fun x : W => (x : M)) contMDiff_subtype_val ≫ smoothToSingular I M =
      smoothToSingular I W ≫ i := smoothToSingular_naturality contMDiff_subtype_val
  change (smoothChainMap (I := I) (I' := I)
    (f := fun x : W => (x : M)) contMDiff_subtype_val) ≫ smoothToSingular I M ≫ pairProjection = 0
  calc
    _ = (smoothChainMap (I := I) (I' := I)
        (f := fun x : W => (x : M)) contMDiff_subtype_val ≫ smoothToSingular I M) ≫ pairProjection :=
      (Category.assoc _ _ _).symm
    _ = (smoothToSingular I W ≫ i) ≫ pairProjection := congrArg (fun f => f ≫ pairProjection) hnat
    _ = smoothToSingular I W ≫ (i ≫ pairProjection) := Category.assoc _ _ _
    _ = smoothToSingular I W ≫ 0 := congrArg (fun f => smoothToSingular I W ≫ f) hzero
    _ = 0 := comp_zero


/-- The quotient comparison is induced by the actual forget-smooth map. -/
def smoothRelativeToSingular (W : TopologicalSpace.Opens M) :
    smoothRelativeSingularChainComplex I W ⟶
      (openManifoldPair W).singularChainComplex (ModuleCat.of ℝ ℝ) :=
  cokernel.desc (smoothChainMap (I := I) (I' := I)
      (f := fun x : W => (x : M)) contMDiff_subtype_val)
    (smoothToSingular I M ≫
      (openManifoldPair W).singularChainComplexπ (ModuleCat.of ℝ ℝ))
    (smoothToRelative_comp_inclusion_zero I W)

omit [IsManifold I 1 M] [IsManifold I ∞ M] in
theorem smoothRelativeChainProjection_comp (W : TopologicalSpace.Opens M) :
    smoothRelativeChainProjection I W ≫ smoothRelativeToSingular I W =
      smoothToSingular I M ≫
        (openManifoldPair W).singularChainComplexπ (ModuleCat.of ℝ ℝ) := by
  exact cokernel.π_desc _ _ _

/-- Open-pair smoothing, including corner models, uses absolute smoothing on
both members and the degreewise quotient exact sequence. -/
theorem smoothRelativeToSingular_quasiIso [FiniteDimensional ℝ E] [T2Space M]
    [SigmaCompactSpace M] (W : TopologicalSpace.Opens M) :
    QuasiIso (smoothRelativeToSingular I W) := by
  sorry

def smoothRelativeHomologyClass (W : TopologicalSpace.Opens M) (q : ℕ)
    (c : (smoothRelativeSingularChainComplex I W).cycles q) :
    ((openManifoldPair W).singularChainComplex (ModuleCat.of ℝ ℝ)).homology q :=
  homologyMap (smoothRelativeToSingular I W) q
    ((smoothRelativeSingularChainComplex I W).homologyπ q c)

/-- The quotient differential vanishes when the ambient boundary comes from W. -/
theorem smoothRelativeProjection_d_eq_zero (W : TopologicalSpace.Opens M) (q : ℕ)
    (c : SmoothSimplex I M (q + 1) →₀ ℝ) (b : SmoothSimplex I W q →₀ ℝ)
    (hb : smoothBoundary I M q c =
      (smoothChainMap (I := I) (I' := I)
        (f := fun x : W => (x : M)) contMDiff_subtype_val).f q b) :
    (smoothRelativeSingularChainComplex I W).d (q + 1) q
      ((smoothRelativeChainProjection I W).f (q + 1) c) = 0 := by
  sorry

/-- A boundary supported in W gives a cycle in the actual quotient. -/
def smoothRelativeCycleOfBoundary (W : TopologicalSpace.Opens M) (q : ℕ)
    (c : SmoothSimplex I M (q + 1) →₀ ℝ) (b : SmoothSimplex I W q →₀ ℝ)
    (hb : smoothBoundary I M q c =
      (smoothChainMap (I := I) (I' := I)
        (f := fun x : W => (x : M)) contMDiff_subtype_val).f q b) :
    (smoothRelativeSingularChainComplex I W).cycles (q + 1) :=
  (smoothRelativeSingularChainComplex I W).moduleCatCyclesMk
    ((smoothRelativeChainProjection I W).f (q + 1) c) q
    (by apply (ComplexShape.down ℕ).next_eq'; rfl)
    (smoothRelativeProjection_d_eq_zero I W q c b hb)

def smoothRelativeZeroCycle (W : TopologicalSpace.Opens M)
    (c : SmoothSimplex I M 0 →₀ ℝ) :
    (smoothRelativeSingularChainComplex I W).cycles 0 :=
  (smoothRelativeSingularChainComplex I W).moduleCatCyclesMk
    ((smoothRelativeChainProjection I W).f 0 c) ((ComplexShape.down ℕ).next 0) rfl (by simp)

/-- Reuse the native generic Kronecker pairing, on the native pair chains. -/
abbrev relativeKronecker (W : TopologicalSpace.Opens M) (q : ℕ) :=
  TauCeti.ChainComplex.kronecker ℝ
    ((openManifoldPair W).singularChainComplex (ModuleCat.of ℝ ℝ))
    (ModuleCat.of ℝ ℝ) q

end RelativeChains

section RelativeComparison
variable {E H : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] [IsManifold I ∞ M]

def relativeDeRhamPairCochain (W : TopologicalSpace.Opens M) (q : ℕ)
    (α : SmoothForm I M ℝ (q + 1)) (β : SmoothForm I W ℝ q) :
    (relativeDeRhamComplex (I := I) W).X ((q + 1 : ℕ) : ℤ) := by
  exact (relativeDeRhamCoordinates (I := I) W q).symm (α, β)

def relativeDeRhamPairCycle (W : TopologicalSpace.Opens M) (q : ℕ)
    (α : SmoothForm I M ℝ (q + 1)) (β : SmoothForm I W ℝ q)
    (hα : α ∈ closedForms I M (q + 1))
    (hβ : mpullbackₗ (I := I) (I' := I) (f := fun x : W => (x : M))
      contMDiff_subtype_val (q + 1) α = mextDerivₗ I W q β) :
    (relativeDeRhamComplex (I := I) W).cycles ((q + 1 : ℕ) : ℤ) :=
  (relativeDeRhamComplex (I := I) W).moduleCatCyclesMk
    (relativeDeRhamPairCochain I W q α β) (((q + 1 : ℕ) : ℤ) + 1)
    (by apply (ComplexShape.up ℤ).next_eq'; rfl) (by sorry)

def relativeDeRhamPairClass (W : TopologicalSpace.Opens M) (q : ℕ)
    (α : SmoothForm I M ℝ (q + 1)) (β : SmoothForm I W ℝ q)
    (hα : α ∈ closedForms I M (q + 1))
    (hβ : mpullbackₗ (I := I) (I' := I) (f := fun x : W => (x : M))
      contMDiff_subtype_val (q + 1) α = mextDerivₗ I W q β) :
    (relativeDeRhamComplex (I := I) W).homology ((q + 1 : ℕ) : ℤ) :=
  (relativeDeRhamComplex (I := I) W).homologyπ ((q + 1 : ℕ) : ℤ)
    (relativeDeRhamPairCycle I W q α β hα hβ)

/-- Positive-degree vanishing classes are the beta=0 pair classes. -/
theorem relativeDeRhamClassOfVanishing_succ (W : TopologicalSpace.Opens M) (q : ℕ)
    (α : SmoothForm I M ℝ (q + 1)) (hα : α ∈ closedForms I M (q + 1))
    (hW : mpullbackₗ (I := I) (I' := I) (f := fun x : W => (x : M))
      contMDiff_subtype_val (q + 1) α = 0) :
    relativeDeRhamClassOfVanishing (I := I) W (q + 1) α hα hW =
      relativeDeRhamPairClass I W q α 0 hα (by simpa using hW) := by
  rfl

/-- The evaluation law fixes the comparison on every positive-degree class,
including pairs whose beta does not extend to M. -/
theorem relativeDeRhamHom_eval_pair [FiniteDimensional ℝ E] [T2Space M]
    [SigmaCompactSpace M] (W : TopologicalSpace.Opens M) (q : ℕ)
    (α : SmoothForm I M ℝ (q + 1)) (β : SmoothForm I W ℝ q)
    (hα : α ∈ closedForms I M (q + 1))
    (hβ : mpullbackₗ (I := I) (I' := I) (f := fun x : W => (x : M))
      contMDiff_subtype_val (q + 1) α = mextDerivₗ I W q β)
    (c : SmoothSimplex I M (q + 1) →₀ ℝ) (b : SmoothSimplex I W q →₀ ℝ)
    (hb : smoothBoundary I M q c =
      (smoothChainMap (I := I) (I' := I)
        (f := fun x : W => (x : M)) contMDiff_subtype_val).f q b) :
    relativeKronecker W (q + 1)
      (relativeDeRhamHom (I := I) W (q + 1) (relativeDeRhamPairClass I W q α β hα hβ))
      (smoothRelativeHomologyClass I W (q + 1)
        (smoothRelativeCycleOfBoundary I W q c b hb)) =
      chainIntegral c (α : RoughForm I M ℝ (q + 1)) -
        chainIntegral b (β : RoughForm I W ℝ q) := by
  sorry

/-- Degree zero has only alpha, and includes the point-class normalization. -/
theorem relativeDeRhamHom_eval_zero [FiniteDimensional ℝ E] [T2Space M]
    [SigmaCompactSpace M] (W : TopologicalSpace.Opens M)
    (α : SmoothForm I M ℝ 0) (hα : α ∈ closedForms I M 0)
    (hW : mpullbackₗ (I := I) (I' := I) (f := fun x : W => (x : M))
      contMDiff_subtype_val 0 α = 0) (c : SmoothSimplex I M 0 →₀ ℝ) :
    relativeKronecker W 0
      (relativeDeRhamHom (I := I) W 0 (relativeDeRhamClassOfVanishing (I := I) W 0 α hα hW))
      (smoothRelativeHomologyClass I W 0 (smoothRelativeZeroCycle I W c)) =
      chainIntegral c (α : RoughForm I M ℝ 0) := by
  sorry

/-- Forget beta via the native cocone projection, then remove the integer extension. -/
def relativeDeRhamAbsolute (W : TopologicalSpace.Opens M) (q : ℕ) :
    (relativeDeRhamComplex (I := I) W).homology (q : ℤ) ⟶
      ModuleCat.of ℝ (deRhamCohomology I M q) :=
  homologyMap (CochainComplex.mappingCocone.fst (relativeDeRhamRestrictionZ I W)) (q : ℤ) ≫
    ((deRhamComplex I M).extendHomologyIso ComplexShape.embeddingUpNat rfl).hom

/-- The actual (alpha,0) class has the promised absolute image. -/
theorem relativeDeRhamAbsolute_classOfVanishing (W : TopologicalSpace.Opens M) (q : ℕ)
    (α : SmoothForm I M ℝ q) (hα : α ∈ closedForms I M q)
    (hW : mpullbackₗ (I := I) (I' := I) (f := fun x : W => (x : M))
      contMDiff_subtype_val q α = 0) :
    relativeDeRhamAbsolute I W q (relativeDeRhamClassOfVanishing (I := I) W q α hα hW) =
      deRhamCohomology.mk I M q ⟨α, hα⟩ := by
  sorry

theorem relativeDeRhamHom_absolute [FiniteDimensional ℝ E] [T2Space M]
    [SigmaCompactSpace M] (W : TopologicalSpace.Opens M) (q : ℕ)
    (z : (relativeDeRhamComplex (I := I) W).homology (q : ℤ)) :
    (openManifoldPair W).singularCohomologyπ (ModuleCat.of ℝ ℝ) ℝ
      (ModuleCat.of ℝ ℝ) q (relativeDeRhamHom (I := I) W q z) =
      deRhamHom I M q (relativeDeRhamAbsolute I W q z) := by
  sorry

/-- In the exported coordinates the connecting map sends [beta] to -[(0,beta)]. -/
def relativeDeRhamConnecting (W : TopologicalSpace.Opens M) (q : ℕ) :
    deRhamCohomology I W q →ₗ[ℝ]
      (relativeDeRhamComplex (I := I) W).homology ((q + 1 : ℕ) : ℤ) := by
  sorry

theorem relativeDeRhamConnecting_mk (W : TopologicalSpace.Opens M) (q : ℕ)
    (β : SmoothForm I W ℝ q) (hβ : β ∈ closedForms I W q) :
    relativeDeRhamConnecting I W q (deRhamCohomology.mk I W q ⟨β, hβ⟩) =
      -relativeDeRhamPairClass I W q 0 β (closedForms I M (q + 1)).zero_mem
        (by simpa using (show mextDerivₗ I W q β = 0 from hβ).symm) := by
  sorry

theorem relativeDeRhamHom_connecting [FiniteDimensional ℝ E] [T2Space M]
    [SigmaCompactSpace M] (W : TopologicalSpace.Opens M) (q : ℕ)
    (z : deRhamCohomology I W q) :
    letI := sigmaCompactSpace_openManifold (I := I) W
    relativeDeRhamHom (I := I) W (q + 1) (relativeDeRhamConnecting I W q z) =
      (openManifoldPair W).singularCohomologyδ (ModuleCat.of ℝ ℝ) ℝ
        (ModuleCat.of ℝ ℝ) q (q + 1) rfl (deRhamHom I W q z) := by
  sorry

end RelativeComparison

section RelativeNaturality
variable {E H : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] [IsManifold I ∞ M]
  {E' H' : Type} [NormedAddCommGroup E'] [NormedSpace ℝ E']
  [TopologicalSpace H'] (I' : ModelWithCorners ℝ E' H')
  {N : Type} [TopologicalSpace N] [ChartedSpace H' N]
  [IsManifold I' 1 N] [IsManifold I' ∞ N]

def smoothOpenPairRestriction (W : TopologicalSpace.Opens M)
    (V : TopologicalSpace.Opens N) (f : M → N) (h : Set.MapsTo f W V) : W → V :=
  fun x => ⟨f x, h x.2⟩

omit [IsManifold I 1 M] [IsManifold I ∞ M]
    [IsManifold I' 1 N] [IsManifold I' ∞ N] in
theorem contMDiff_smoothOpenPairRestriction (W : TopologicalSpace.Opens M)
    (V : TopologicalSpace.Opens N) (f : M → N) (h : Set.MapsTo f W V)
    (hf : ContMDiff I I' ∞ f) :
    ContMDiff I I' ∞ (smoothOpenPairRestriction W V f h) := by
  exact (ContMDiff.subtypeVal_comp_iff V _).mp (hf.comp contMDiff_subtype_val)

/-- Pull back both entries of the native restriction cocone. -/
def relativeDeRhamComplexMap (W : TopologicalSpace.Opens M)
    (V : TopologicalSpace.Opens N) (f : M → N) (h : Set.MapsTo f W V)
    (hf : ContMDiff I I' ∞ f) : relativeDeRhamComplex (I := I') V ⟶ relativeDeRhamComplex (I := I) W := by
  sorry

theorem relativeDeRhamComplexMap_coordinates (W : TopologicalSpace.Opens M)
    (V : TopologicalSpace.Opens N) (f : M → N) (h : Set.MapsTo f W V)
    (hf : ContMDiff I I' ∞ f) (q : ℕ)
    (z : (relativeDeRhamComplex (I := I') V).X ((q : ℤ) + 1)) :
    relativeDeRhamCoordinates (I := I) W q
      ((relativeDeRhamComplexMap I I' W V f h hf).f ((q : ℤ) + 1) z) =
      (mpullbackₗ hf (q + 1) (relativeDeRhamCoordinates (I := I') V q z).1,
       mpullbackₗ (contMDiff_smoothOpenPairRestriction I I' W V f h hf) q
         (relativeDeRhamCoordinates (I := I') V q z).2) := by
  sorry

theorem relativeDeRhamComplexMap_coordinatesZero (W : TopologicalSpace.Opens M)
    (V : TopologicalSpace.Opens N) (f : M → N) (h : Set.MapsTo f W V)
    (hf : ContMDiff I I' ∞ f) (z : (relativeDeRhamComplex (I := I') V).X 0) :
    relativeDeRhamCoordinatesZero (I := I) W
      ((relativeDeRhamComplexMap I I' W V f h hf).f 0 z) =
      mpullbackₗ hf 0 (relativeDeRhamCoordinatesZero (I := I') V z) := by
  sorry

theorem relativeDeRhamHom_naturality [FiniteDimensional ℝ E] [T2Space M]
    [SigmaCompactSpace M] [FiniteDimensional ℝ E'] [T2Space N] [SigmaCompactSpace N]
    (W : TopologicalSpace.Opens M) (V : TopologicalSpace.Opens N)
    (f : M → N) (h : Set.MapsTo f W V) (hf : ContMDiff I I' ∞ f)
    (q : ℕ) (z : (relativeDeRhamComplex (I := I') V).homology (q : ℤ)) :
    relativeDeRhamHom (I := I) W q
      (homologyMap (relativeDeRhamComplexMap I I' W V f h hf) (q : ℤ) z) =
      TopPair.singularCohomologyMap (R := ModuleCat.of ℝ ℝ) (k := ℝ)
        (M := ModuleCat.of ℝ ℝ)
        (TopPair.ofSubsetMap (TopCat.ofHom ⟨f, hf.continuous⟩) h) q
        (relativeDeRhamHom (I := I') V q z) := by
  sorry
end RelativeNaturality

end TauCetiRoadmap.DifferentialGeometry
