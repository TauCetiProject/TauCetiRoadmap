module

public import Mathlib
public import TauCeti.AlgebraicTopology.Cohomology.Basic
public import TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure
public import TauCeti.Geometry.Manifold.DifferentialForm.AlmostComplexType
public import TauCeti.Geometry.Manifold.DifferentialForm.Dolbeault.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.Pullback.Smooth
public import TauCeti.Geometry.Manifold.DifferentialForm.Regularity

/-!
# Complex comparison, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`.

The statements on the pinned carriers are the several-variable Montel theorem and
Schwartz's compact-perturbation finiteness theorem for Fréchet spaces (C1.6), and, in C5.1,
the holomorphic Poincaré lemma and the additive constant-sheaf/singular-cohomology
comparison for arbitrary abelian coefficients on semilocally contractible spaces, without
separation assumptions. The holomorphic Poincaré lemma is stated in its stalkwise form, on
Tau Ceti's smooth complex-valued forms of type `(p,0)` with vanishing `∂̄` on a complex
manifold: the pins have no complex of sheaves of holomorphic forms, so the quasi-isomorphism
`ℂ_T → Ω^•_T` of the README is stated as exactness near every point in positive degrees,
its degree-zero part being Tau Ceti's `TauCeti.mextDeriv_ofFunction_eq_zero_iff`. The
sheaf–singular statement asserts existence of an additive isomorphism; the construction of
the canonical map and its naturality are specified in the README.

The other headline targets require objects absent from the pins:

* C-1: `HolomorphicStructureSheaf`, `ComplexAnalyticSpace`, `complexSchemeAnalytification`
  and `complexSpaceAnalytification` are themselves the missing carriers, complex analytic
  spaces with nonreduced structure sheaves and the analytification functors on schemes and
  algebraic spaces; the pins have the reduced holomorphic structure sheaf of a complex
  manifold (`TauCeti.holomorphicStructureSheaf`) and Mathlib's locally ringed spaces.
  `completedAnalyticStalkComparison` compares stalks of `X^an` and `X`, and
  `sncPolydiscChart` with `snc_exists_polydiscChart` is a polydisc chart on the
  analytification of a smooth complex scheme or space with a labelled strict-SNC divisor;
  the pins have algebraic normal-crossings charts (`TauCeti.SmoothPair.AlgebraicChart`)
  but no analytification.
* C0: `CoherentAnalyticModule`, `coherentOperations`, `CoherentAnalyticIdeal`,
  `holomorphicBundleDictionary`, `CoherentAnalytification`, `HigherImageComparison`,
  `analyticEtaleDescent` and `SpaceCoherentAnalytification` require coherent modules on
  those analytic spaces and the analytification of modules along `X^an → X`.
  `fibreDimensionLoci` (Cartan–Remmert) requires holomorphic maps of analytic spaces, their
  closed analytic subsets and local fibre dimension. Native locally ringed spaces and finitely
  presented module sheaves alone do not supply these objects.
* C1: `localDolbeault` and `weightedDolbeaultEstimate` identify ComplexKahlerGeometry K2's
  Dolbeault resolution and RealAnalyticGeometry R3.1's weighted `L²` theorem with C0's
  coherent sheaves and bundle dictionary, so they require C0's carriers; the pinned `∂̄` on
  global smooth forms is not a resolution of those sheaves, and the pins have no Kähler
  manifolds. `cartanTheoremA`, `cartanTheoremB`, `cartanSerreFiniteness`,
  `AnalyticTwist`, `analyticTwistCohomology`, `analyticSerreGeneration`,
  `analyticSerreVanishing`, `projectiveComplexGaga`, `properSchemeGagaEquivalence` and
  `properSpaceComplexGaga` require coherent analytic modules on strongly 1-complete and
  compact analytic spaces, analytic projective space with its twisting sheaves, and
  analytification. So does C1.9's curve GAGA: the Riemann-surface structure on the
  analytification of a smooth complex curve and the named maps from rational functions to
  the pinned field of meromorphic functions (`TauCeti.RiemannSurface.MeromorphicFunction`)
  and from line-bundle classes to analytic Picard classes; the target field exists at the
  pins, the source analytification does not.
* C2: `gagaBaseChange` and `projectiveGeometricDictionaries` require the analytification of
  schemes, modules and morphisms.
* C3: `spaceQuasiCoherator`, `pseudoCoherenceDetection`, `spaceDerivedLimits`,
  `strongProperSupportExistence`, `cohStack_algebraic`, `relative_picard_algebraicSpace`,
  `picardZeroCriterion`, `picardParameter_formalEquiv` and `derivedGagaProperSpace` require
  the ringed small étale site of an algebraic space, its derived category of quasi-coherent
  complexes with its perfect objects, the stacks of coherent sheaves and of line bundles,
  and, for derived GAGA, analytification. The pins have only the predicate
  `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace` on presheaves of sets on schemes.
* C4: `remmertProperImage`, `remmertSteinExtension`, `projectiveChowNonreduced`,
  `properSupportAlgebraization`, `properSourceMorphismAlgebraicity` and
  `analyticConnectednessComparison` require closed analytic subspaces given by coherent ideals
  and the analytification of schemes and morphisms. For `analyticConnectednessComparison` the
  scheme side (`ConnectedComponents` and `IrreducibleSpace` of a scheme locally of finite type
  over `ℂ`) exists at the pins; the space `X^an`, the map `X^an → X` and the closed analytic
  subsets that define analytic irreducibility do not.
* C5: `AlgebraicDeRham`, `properDeRhamBetti`, `GaussManin`, `relativeHodgeBundles`,
  `kaehlerHodgeDecomposition`, `properPureHodge`, `AnalyticCycleIntegration`, `LogStructure`,
  `logChartCriterion`, `deligneRiemannHilbert`, `regularSingularDeRhamComparison` and
  `properLogGagaMonodromy` require the sheafified algebraic de Rham complex of a scheme, the
  sheaf complexes of holomorphic forms, connections on modules over schemes and analytic
  spaces, Kähler harmonic theory, currents of integration on analytic cycles and log
  structures, together with analytification. The pins have smooth forms with their `(p,q)`
  types on complex manifolds and the abstract pure Hodge structure
  `TauCeti.Hodge.HodgeStructureOn`, which supplies neither the geometric cohomology nor its
  filtration.
* C6: `complexAlgebraicTopology`, `riemannExistence`, `artinComparison`,
  `artinComparisonCompactSupport`, `relativeArtinComparison` and `adicArtinComparison`
  require the classical space of complex points of a general scheme, the analytic-to-étale
  site morphism, constructible étale coefficient categories and normalized adic systems.
  Artin comparison is `IsIso` of the named unit map of that site morphism, for
  `X : Scheme.{u}` and coefficients in `Type u`, never an existential.
  `topologicalCoefficientComparison` requires the locally constant sheaf attached to a
  local coefficient system (the pins have `TauCeti.LocalCoefficientSystem` but no functor
  from it to sheaves), the direct local-coefficient cochain complex (the pinned
  `TauCeti.LocalCoefficientSystem.twistedCochainComplex` is Hom from twisted chains, so it
  computes cohomology with coefficients in the dual system), derived compact-support
  sections through c-soft resolutions, and finite triangulations of `T_X` compatible with a
  constructible stratification.

These missing carriers are constructions specified in the README; none is replaced here
by a predicate parameter or an arbitrary comparison map.
-/

@[expose] public section

namespace TauCetiRoadmap.ComplexComparisonPartII

open CategoryTheory

universe u

/-! ## Layer C1: Analytic coherent cohomology and GAGA -/

/-- C1.6: locally bounded holomorphic sequences in several variables have holomorphic
locally uniform subsequential limits. This is the compactness input to Cartan–Serre
finiteness, on finite-dimensional complex domains. -/
theorem montelTheorem {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [FiniteDimensional ℂ E] {Ω : Set E} (hΩ : IsOpen Ω) (f : ℕ → E → ℂ)
    (hf : ∀ n, DifferentiableOn ℂ (f n) Ω)
    (hb : ∀ K ⊆ Ω, IsCompact K → ∃ C : ℝ, ∀ n, ∀ z ∈ K, ‖f n z‖ ≤ C) :
    ∃ (φ : ℕ → ℕ) (g : E → ℂ), StrictMono φ ∧ DifferentiableOn ℂ g Ω ∧
      TendstoLocallyUniformlyOn (fun n => f (φ n)) g Filter.atTop Ω := by
  sorry

/-- C1.6 (Schwartz): a compact perturbation of a surjection between complex Fréchet spaces
has closed image of finite codimension. No finite-dimensional-kernel hypothesis is imposed;
this is the functional-analytic finiteness theorem for coherent cohomology. -/
theorem schwartzFiniteness {E F : Type*}
    [AddCommGroup E] [UniformSpace E] [IsUniformAddGroup E] [Module ℂ E]
    [Module ℝ E] [IsScalarTower ℝ ℂ E] [ContinuousSMul ℂ E]
    [LocallyConvexSpace ℝ E] [TopologicalSpace.MetrizableSpace E] [T2Space E] [CompleteSpace E]
    [AddCommGroup F] [UniformSpace F] [IsUniformAddGroup F] [Module ℂ F]
    [Module ℝ F] [IsScalarTower ℝ ℂ F] [ContinuousSMul ℂ F]
    [LocallyConvexSpace ℝ F] [TopologicalSpace.MetrizableSpace F] [T2Space F] [CompleteSpace F]
    (g h : E →L[ℂ] F) (hg : Function.Surjective g) (hh : IsCompactOperator h) :
    IsClosed (LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F) : Set F) ∧
      FiniteDimensional ℂ (F ⧸ LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F)) := by
  sorry

/-! ## Layer C5: de Rham–Betti comparison, Hodge theory and logarithmic comparison -/

section HolomorphicPoincare

open TauCeti TauCeti.SmoothAlmostComplexStructure
open scoped Manifold ContDiff TauCeti.ComplexManifold

/-- C5.1 (holomorphic Poincaré lemma, stalkwise in positive degrees): on a complex manifold
`M` modelled on a complex normed space `E`, let `α` be a smooth complex-valued
`(k+1)`-form of type `(k+1,0)` for the complex structure of `M` with `∂̄α = 0`, that is a
holomorphic `(k+1)`-form, and suppose `dα = 0`. Then every point has an open neighbourhood
`U` carrying a holomorphic `k`-form `η` (type `(k,0)`, `∂̄η = 0`) with `dη = α|_U`. With the
degree-zero statement this is exactness of `ℂ_M → Ω^•_M` on stalks (Deligne, *Équations
différentielles à points singuliers réguliers*, I.2.23). No finite-dimensionality, Hausdorff
or countability hypothesis is needed. -/
theorem holomorphicPoincare {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]
    (k : ℕ) (α : SmoothForm 𝓘(ℝ, E) M ℂ (k + 1))
    (hα : α.IsOfType (ofComplexManifold E M) (k + 1) 0)
    (hα_hol : (ofComplexManifold E M).delBar α = 0)
    (hα_closed : mextDerivₗ 𝓘(ℝ, E) (k + 1) α = 0) (x : M) :
    ∃ U : TopologicalSpace.Opens M, x ∈ U ∧ ∃ η : SmoothForm 𝓘(ℝ, E) U ℂ k,
      η.IsOfType (ofComplexManifold E U) k 0 ∧
      (ofComplexManifold E U).delBar η = 0 ∧
      mextDerivₗ 𝓘(ℝ, E) k η =
        SmoothForm.mpullback (Subtype.val : U → M) contMDiff_subtype_val α := by
  sorry

end HolomorphicPoincare

/-- C5.1: constant-sheaf and singular cohomology agree for arbitrary abelian coefficients
on a semilocally contractible space. No Hausdorff or paracompactness assumption is imposed.
The singular chain coefficient object `ULift ℤ` is free of rank one in the space's universe. -/
theorem nonempty_sheafSingularComparison (T : TopCat.{u}) (hT : LocallyContractibleSpace T)
    (A : AddCommGrpCat.{u}) (q : ℕ) :
    Nonempty
      (Sheaf.H.{u}
        ((constantSheaf (Opens.grothendieckTopology T) AddCommGrpCat.{u}).obj A) q
        ≃+ T.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) q) := by
  sorry

end TauCetiRoadmap.ComplexComparisonPartII
