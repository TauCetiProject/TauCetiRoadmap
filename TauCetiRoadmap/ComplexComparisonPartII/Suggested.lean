module

public import Mathlib
public import TauCeti.AlgebraicTopology.Cohomology.Basic
public import TauCeti.Analysis.Complex.LeviForm
public import TauCeti.Analysis.PDE.Perron.Basic
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

From the `L²` theory of C7, on open subsets of `ℂⁿ`, the file states Hörmander's `L²` theorem
for `(0,1)`-forms with both of its estimates (C7.1 (a), (b)) and with the datum measured by the
Levi form of a smooth weight (C7.2), Skoda's division theorem (C7.6), the Ohsawa–Takegoshi
extension theorem with the optimal constant (C7.7) and strong openness (C7.12). They need three
definitions with real bodies: plurisubharmonic functions (C5.4a), by the sub-mean-value inequality
on affine discs, pseudoconvex open sets (C7.1), and the operator `∂/∂z̄_j` on Mathlib's
complex-valued distributions (C7.1), built from the distributional derivatives along the real
coordinate directions; on `(0,1)`-forms the equation `∂̄u = g` and the condition `∂̄g = 0` are
equations between these coefficients. The Levi form of C7.2 is Tau Ceti's `TauCeti.leviForm`,
and the Green function of C7.7 is built from the pinned Perron solution `TauCeti.perronSolution`.

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
* C5.4a–C5.4j and C7: the other headline theorems are Hörmander's `L²` theorem for
  `(p,q)`-forms (the last clause of C7.1), its extensions C7.3–C7.5, and Nadel's vanishing
  theorem (C7.17). The `(p,q)` clause needs forms of every bidegree with distribution
  coefficients and `∂̄` on them, whose coefficients combine derivatives over multi-indices with
  signs; the pins have `∂̄` only on Tau Ceti's smooth forms. On functions and `(0,1)`-forms, the
  only degrees that C7.1 (a), (b) and C7.2 involve, `∂̄` is the coefficientwise operator above.
  C7.3–C7.5 need Kähler manifolds and Hermitian holomorphic bundles with their curvature
  operators. Nadel vanishing requires singular Hermitian metrics on holomorphic line bundles over
  compact Kähler manifolds, their multiplier ideal sheaves as coherent analytic sheaves (C5.4g,
  C7.9) and the cohomology of coherent analytic sheaves.

These missing carriers are constructions specified in the README; none is replaced here
by a predicate parameter or an arbitrary comparison map.
-/

@[expose] public section

namespace TauCetiRoadmap.ComplexComparisonPartII

open CategoryTheory MeasureTheory Filter Topology
open scoped ENNReal

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

/-- C5.4a, on a complex normed space `E`: `u : E → [−∞, ∞]` is *plurisubharmonic* on `Ω` if it
is upper semicontinuous on `Ω`, never `+∞` there, and for every closed affine disc
`z ↦ a + z • ξ`, `‖z‖ ≤ 1`, lying in `Ω`, the value `u a` at the centre is at most the mean over
the unit circle of every continuous majorant of `z ↦ u (a + z • ξ)` on that circle, that is, at
most the mean of C5.4a of `u` on the boundary circle. In finite dimension this is C5.4a's
definition in a chart, where affine discs suffice (Demailly, *Complex Analytic and Differential
Geometry*, I.5.1). -/
def IsPlurisubharmonicOn {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    (u : E → EReal) (Ω : Set E) : Prop :=
  UpperSemicontinuousOn u Ω ∧ (∀ x ∈ Ω, u x ≠ ⊤) ∧
    ∀ a ξ : E, (∀ z : ℂ, ‖z‖ ≤ 1 → a + z • ξ ∈ Ω) →
      ∀ g : ℂ → ℝ, Continuous g → (∀ z : ℂ, ‖z‖ = 1 → u (a + z • ξ) ≤ (g z : EReal)) →
        u a ≤ ((Real.circleAverage g 0 1 : ℝ) : EReal)

/-! ## Layer C7: L² estimates for ∂̄ with plurisubharmonic weights -/

/-- C7.1: an open subset `Ω` of a finite-dimensional complex normed space is *pseudoconvex* if
it has a continuous plurisubharmonic exhaustion function: a function `ψ`, continuous and
plurisubharmonic on `Ω`, each of whose sublevel sets `{z ∈ Ω | ψ z < c}` lies in a compact
subset of `Ω`. -/
def IsPseudoconvex {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (Ω : Set E) : Prop :=
  IsOpen Ω ∧ ∃ ψ : E → ℝ, ContinuousOn ψ Ω ∧ IsPlurisubharmonicOn (fun z ↦ (ψ z : EReal)) Ω ∧
    ∀ c : ℝ, ∃ K : Set E, IsCompact K ∧ K ⊆ Ω ∧ {z | z ∈ Ω ∧ ψ z < c} ⊆ K

section Hormander

open scoped Distributions ContDiff

/-- C7.1: the Cauchy–Riemann operator `∂/∂z̄_j = ½(∂/∂x_j + i ∂/∂y_j)` on complex-valued
distributions on an open subset `Ω` of `ℂⁿ`, with coordinates `z_j = x_j + i y_j`: `∂/∂x_j` and
`∂/∂y_j` are Mathlib's distributional derivatives along the real directions `e_j` and `i e_j`.
For a `(0,1)`-form `g = Σ_j g_j dz̄_j` with distribution coefficients, `∂̄u = g` means
`dbarDistribution j u = g_j` for every `j`, and `∂̄g = 0` means
`dbarDistribution k g_j = dbarDistribution j g_k` for all `j, k`. On the distributions of `C¹`
functions it is the Wirtinger derivative: `1` on `z̄_j` and `0` on `z_j`. -/
noncomputable def dbarDistribution {n : ℕ} {Ω : TopologicalSpace.Opens (EuclideanSpace ℂ (Fin n))}
    (j : Fin n) (T : 𝓓'(Ω, ℂ)) : 𝓓'(Ω, ℂ) :=
  (2 : ℂ)⁻¹ • (Distribution.lineDerivCLM (EuclideanSpace.single j 1) T +
    Complex.I • Distribution.lineDerivCLM (EuclideanSpace.single j Complex.I) T)

/-- C7.1 (a), Hörmander's `L²` theorem: let `Ω ⊆ ℂⁿ` be pseudoconvex and `φ` plurisubharmonic on
`Ω`. For every `(0,1)`-form `g = Σ_j g_j dz̄_j` with locally integrable coefficients, `∂̄g = 0` in
the sense of distributions and `∫_Ω |g|²e^{−φ} dλ < ∞`, where `|g|² = Σ_j |g_j|²`, there is a
locally integrable `u` with `∂̄u = g` and `∫_Ω |u|²e^{−φ}(1 + |z|²)^{−2} dλ ≤ ∫_Ω |g|²e^{−φ} dλ`
(Hörmander 1965; Hörmander, *An Introduction to Complex Analysis in Several Variables*,
chapter IV). -/
theorem hormanderL2 {n : ℕ} {Ω : TopologicalSpace.Opens (EuclideanSpace ℂ (Fin n))}
    (hΩ : IsPseudoconvex (Ω : Set (EuclideanSpace ℂ (Fin n))))
    {φ : EuclideanSpace ℂ (Fin n) → EReal} (hφ : IsPlurisubharmonicOn φ Ω)
    {g : Fin n → EuclideanSpace ℂ (Fin n) → ℂ} (hg : ∀ j, LocallyIntegrableOn (g j) Ω)
    (hg_closed : ∀ j k, dbarDistribution k (Distribution.ofFun Ω (g j) volume ⊤) =
      dbarDistribution j (Distribution.ofFun Ω (g k) volume ⊤))
    (hI : ∫⁻ z in Ω, (∑ j, ‖g j z‖ₑ ^ 2) * EReal.exp (-φ z) < ⊤) :
    ∃ u : EuclideanSpace ℂ (Fin n) → ℂ, LocallyIntegrableOn u Ω ∧
      (∀ j, dbarDistribution j (Distribution.ofFun Ω u volume ⊤) =
        Distribution.ofFun Ω (g j) volume ⊤) ∧
      ∫⁻ z in Ω, ‖u z‖ₑ ^ 2 * EReal.exp (-φ z) * ENNReal.ofReal ((1 + ‖z‖ ^ 2) ^ (-2 : ℤ)) ≤
        ∫⁻ z in Ω, (∑ j, ‖g j z‖ₑ ^ 2) * EReal.exp (-φ z) := by
  sorry

/-- C7.1 (b): if moreover `i∂∂̄φ ≥ c·i∂∂̄|z|²` as currents for a constant `c > 0`, that is, if
`φ − c|z|²` is plurisubharmonic on `Ω` (which makes `φ` plurisubharmonic), the solution can be
taken with `∫_Ω |u|²e^{−φ} dλ ≤ (1/c)·∫_Ω |g|²e^{−φ} dλ` (Demailly, *Complex Analytic and
Differential Geometry*, VIII.6.5 with (6.4)). For `Ω = ℂ`, `φ = |z|²`, `c = 1` and `g = dz̄` both
sides equal `π` for the solution `z̄`. -/
theorem hormanderL2_strict {n : ℕ} {Ω : TopologicalSpace.Opens (EuclideanSpace ℂ (Fin n))}
    (hΩ : IsPseudoconvex (Ω : Set (EuclideanSpace ℂ (Fin n))))
    {φ : EuclideanSpace ℂ (Fin n) → EReal} {c : ℝ} (hc : 0 < c)
    (hφ : IsPlurisubharmonicOn (fun z ↦ φ z - ((c * ‖z‖ ^ 2 : ℝ) : EReal)) Ω)
    {g : Fin n → EuclideanSpace ℂ (Fin n) → ℂ} (hg : ∀ j, LocallyIntegrableOn (g j) Ω)
    (hg_closed : ∀ j k, dbarDistribution k (Distribution.ofFun Ω (g j) volume ⊤) =
      dbarDistribution j (Distribution.ofFun Ω (g k) volume ⊤))
    (hI : ∫⁻ z in Ω, (∑ j, ‖g j z‖ₑ ^ 2) * EReal.exp (-φ z) < ⊤) :
    ∃ u : EuclideanSpace ℂ (Fin n) → ℂ, LocallyIntegrableOn u Ω ∧
      (∀ j, dbarDistribution j (Distribution.ofFun Ω u volume ⊤) =
        Distribution.ofFun Ω (g j) volume ⊤) ∧
      ∫⁻ z in Ω, ‖u z‖ₑ ^ 2 * EReal.exp (-φ z) ≤
        ENNReal.ofReal c⁻¹ * ∫⁻ z in Ω, (∑ j, ‖g j z‖ₑ ^ 2) * EReal.exp (-φ z) := by
  sorry

/-- C7.2, Hörmander's estimate with the datum measured by the Levi form: let `Ω ⊆ ℂⁿ` be
pseudoconvex and `φ` smooth and plurisubharmonic on `Ω`, with Levi form `θ = i∂∂̄φ`, so that
`θ(ξ, ξ) = Σ_{j,k} ∂²φ/∂z_j∂z̄_k ξ_j ξ̄_k` is the diagonal of `TauCeti.leviForm φ z`. For a
`(0,1)`-covector `v = Σ_k v_k dz̄_k` put `|v|²_θ = sup_ξ |Σ_k v_k ξ̄_k|²/θ(ξ, ξ) ∈ [0, ∞]`, with
`0/0 = 0` and `a/0 = ∞` for `a > 0` as division in `[0, ∞]` gives. For every `(0,1)`-form `v`
with locally integrable coefficients, `∂̄v = 0` and `∫_Ω |v|²_θ e^{−φ} dλ < ∞` there is a locally
integrable `u` with `∂̄u = v` and `∫_Ω |u|²e^{−φ} dλ ≤ ∫_Ω |v|²_θ e^{−φ} dλ` (Hörmander 1965;
Demailly 1982, Théorème 5.1). No lower bound for `θ` is assumed. The finiteness makes the
coefficients `L²_loc`, `θ` being locally bounded, and the solution of least norm in
`L²(Ω, e^{−φ}dλ)` satisfies the same bound, the solutions there forming a closed affine
subspace. -/
theorem hormanderL2_leviNorm {n : ℕ} {Ω : TopologicalSpace.Opens (EuclideanSpace ℂ (Fin n))}
    (hΩ : IsPseudoconvex (Ω : Set (EuclideanSpace ℂ (Fin n))))
    {φ : EuclideanSpace ℂ (Fin n) → ℝ} (hφ_smooth : ContDiffOn ℝ ∞ φ Ω)
    (hφ : IsPlurisubharmonicOn (fun z ↦ (φ z : EReal)) Ω)
    {v : Fin n → EuclideanSpace ℂ (Fin n) → ℂ} (hv : ∀ j, LocallyIntegrableOn (v j) Ω)
    (hv_closed : ∀ j k, dbarDistribution k (Distribution.ofFun Ω (v j) volume ⊤) =
      dbarDistribution j (Distribution.ofFun Ω (v k) volume ⊤))
    (hI : ∫⁻ z in Ω, (⨆ ξ : EuclideanSpace ℂ (Fin n),
        ‖∑ k, v k z * starRingEnd ℂ (ξ k)‖ₑ ^ 2 /
          ENNReal.ofReal (TauCeti.leviForm φ z ξ ξ).re) * ENNReal.ofReal (Real.exp (-φ z)) < ⊤) :
    ∃ u : EuclideanSpace ℂ (Fin n) → ℂ, LocallyIntegrableOn u Ω ∧
      (∀ j, dbarDistribution j (Distribution.ofFun Ω u volume ⊤) =
        Distribution.ofFun Ω (v j) volume ⊤) ∧
      ∫⁻ z in Ω, ‖u z‖ₑ ^ 2 * ENNReal.ofReal (Real.exp (-φ z)) ≤
        ∫⁻ z in Ω, (⨆ ξ : EuclideanSpace ℂ (Fin n),
          ‖∑ k, v k z * starRingEnd ℂ (ξ k)‖ₑ ^ 2 /
            ENNReal.ofReal (TauCeti.leviForm φ z ξ ξ).re) * ENNReal.ofReal (Real.exp (-φ z)) := by
  sorry

end Hormander

/-- C7.6, Skoda's division theorem: let `Ω ⊆ ℂⁿ` be pseudoconvex, `φ` plurisubharmonic on `Ω`
and `≢ −∞` near every point, and `g = (g₁, …, g_p)` holomorphic on `Ω` such that near every
point of `Ω` some `g_j` does not vanish identically; put `|g|² = Σ_j |g_j|²` and `q = min(n, p − 1)`. For real
`α > 1` and holomorphic `f` with `I = ∫_Ω |f|²|g|^{−2(αq+1)}e^{−φ} dλ < ∞` there are holomorphic
`h₁, …, h_p` on `Ω` with `f = Σ_j g_j h_j` and `∫_Ω Σ_j|h_j|²|g|^{−2αq}e^{−φ} dλ ≤ α/(α − 1)·I`
(Skoda 1972, Théorème 1). The powers of `|g|²` are taken in `[0, ∞]`, so that they are `∞` on
the common zeros of the `g_j`, a Lebesgue-null set. -/
theorem skodaDivision {n p : ℕ} {Ω : Set (EuclideanSpace ℂ (Fin n))} (hΩ : IsPseudoconvex Ω)
    {φ : EuclideanSpace ℂ (Fin n) → EReal} (hφ : IsPlurisubharmonicOn φ Ω)
    (hφ_ne : ∀ x ∈ Ω, ¬ ∀ᶠ z in 𝓝 x, φ z = ⊥)
    {g : Fin p → EuclideanSpace ℂ (Fin n) → ℂ} (hg : ∀ j, DifferentiableOn ℂ (g j) Ω)
    (hg_ne : ∀ x ∈ Ω, ∃ j, ¬ g j =ᶠ[𝓝 x] 0) {α : ℝ} (hα : 1 < α)
    {f : EuclideanSpace ℂ (Fin n) → ℂ} (hf : DifferentiableOn ℂ f Ω)
    (hI : ∫⁻ z in Ω, ‖f z‖ₑ ^ 2 * (∑ j, ‖g j z‖ₑ ^ 2) ^ (-(α * (min n (p - 1) : ℕ) + 1)) *
        EReal.exp (-φ z) < ⊤) :
    ∃ h : Fin p → EuclideanSpace ℂ (Fin n) → ℂ, (∀ j, DifferentiableOn ℂ (h j) Ω) ∧
      (∀ z ∈ Ω, f z = ∑ j, g j z * h j z) ∧
      ∫⁻ z in Ω, (∑ j, ‖h j z‖ₑ ^ 2) * (∑ j, ‖g j z‖ₑ ^ 2) ^ (-(α * (min n (p - 1) : ℕ))) *
          EReal.exp (-φ z) ≤
        ENNReal.ofReal (α / (α - 1)) *
          ∫⁻ z in Ω, ‖f z‖ₑ ^ 2 * (∑ j, ‖g j z‖ₑ ^ 2) ^ (-(α * (min n (p - 1) : ℕ) + 1)) *
            EReal.exp (-φ z) := by
  sorry

/-- C7.7, the Ohsawa–Takegoshi extension theorem from a hyperplane with the optimal constant
(Błocki 2013, Theorem 1; Guan–Zhou 2015): let `D ⊆ ℂ` be a bounded domain containing `0`, and
`h` the Perron solution on `D` of the boundary datum `ζ ↦ log |ζ|`, so that the Green function of
`D` with pole `0` is `log |ζ| − h(ζ)` and `c_D(0) = e^{−h(0)}`. Let `Ω ⊆ ℂ^m × D` be a
pseudoconvex domain, `φ` plurisubharmonic on `Ω`, and `f` holomorphic on the slice
`Ω ∩ {z_{m+1} = 0}` with `∫ |f|²e^{−φ} dλ_m < ∞` there. Then `f` extends to a holomorphic `F`
on `Ω` with `∫_Ω |F|²e^{−φ} dλ_{m+1} ≤ (π/c_D(0)²)·∫ |f|²e^{−φ} dλ_m`. On the disc of radius `r`,
`h ≡ log r` and the constant is `πr²`. -/
theorem ohsawaTakegoshi {m : ℕ} {D : Set ℂ} (hD : IsOpen D) (hDc : IsConnected D)
    (hDb : Bornology.IsBounded D) (hD0 : (0 : ℂ) ∈ D)
    {Ω : Set (EuclideanSpace ℂ (Fin m) × ℂ)} (hΩ : IsPseudoconvex Ω) (hΩc : IsConnected Ω)
    (hΩD : Ω ⊆ Set.univ ×ˢ D) {φ : EuclideanSpace ℂ (Fin m) × ℂ → EReal}
    (hφ : IsPlurisubharmonicOn φ Ω) {f : EuclideanSpace ℂ (Fin m) → ℂ}
    (hf : DifferentiableOn ℂ f {z | (z, (0 : ℂ)) ∈ Ω})
    (hfint : ∫⁻ z in {z | (z, (0 : ℂ)) ∈ Ω}, ‖f z‖ₑ ^ 2 * EReal.exp (-φ (z, 0)) < ⊤) :
    ∃ F : EuclideanSpace ℂ (Fin m) × ℂ → ℂ, DifferentiableOn ℂ F Ω ∧
      (∀ z, (z, (0 : ℂ)) ∈ Ω → F (z, 0) = f z) ∧
      ∫⁻ w in Ω, ‖F w‖ₑ ^ 2 * EReal.exp (-φ w) ≤
        ENNReal.ofReal
            (Real.pi * Real.exp (2 * TauCeti.perronSolution D (fun ζ ↦ Real.log ‖ζ‖) 0)) *
          ∫⁻ z in {z | (z, (0 : ℂ)) ∈ Ω}, ‖f z‖ₑ ^ 2 * EReal.exp (-φ (z, 0)) := by
  sorry

/-- C7.12, strong openness, at a point `x` of an open set `Ω ⊆ ℂⁿ`: for `φ` plurisubharmonic on
`Ω` and `F` holomorphic near `x`, `|F|²e^{−φ}` is integrable on a neighbourhood of `x` iff
`|F|²e^{−(1+ε)φ}` is integrable on a neighbourhood of `x` for some `ε > 0`. On stalks of the
multiplier ideals of C5.4g this is `J(φ)_x = ⋃_{ε>0} J((1 + ε)φ)_x`; the implication from left to
right is Guan and Zhou's theorem (*A proof of Demailly's strong openness conjecture*,
Theorem 1.1). -/
theorem strongOpenness {n : ℕ} {Ω : Set (EuclideanSpace ℂ (Fin n))} (hΩ : IsOpen Ω)
    {φ : EuclideanSpace ℂ (Fin n) → EReal} (hφ : IsPlurisubharmonicOn φ Ω)
    {x : EuclideanSpace ℂ (Fin n)} (hx : x ∈ Ω) {F : EuclideanSpace ℂ (Fin n) → ℂ}
    (hF : ∀ᶠ z in 𝓝 x, DifferentiableAt ℂ F z) :
    (∃ U ∈ 𝓝 x, ∫⁻ z in U, ‖F z‖ₑ ^ 2 * EReal.exp (-φ z) < ⊤) ↔
      ∃ ε : ℝ, 0 < ε ∧ ∃ V ∈ 𝓝 x,
        ∫⁻ z in V, ‖F z‖ₑ ^ 2 * EReal.exp (-(((1 + ε : ℝ) : EReal) * φ z)) < ⊤ := by
  sorry

end TauCetiRoadmap.ComplexComparisonPartII
