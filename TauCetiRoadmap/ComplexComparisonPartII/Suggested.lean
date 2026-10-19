import Mathlib
import TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.Basic
import TauCeti.Algebra.Category.ModuleCat.Sheaf.Quasicoherent.Monoidal
import TauCeti.Topology.Sheaves.Flasque
import TauCeti.Geometry.Hodge.Structure
import TauCeti.Geometry.Hodge.Conjugation
import TauCeti.Analysis.Complex.HolomorphicSheaf
import TauCeti.Analysis.Complex.Conformal.Montel.Basic
import TauCeti.AlgebraicTopology.Cohomology.Cup
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.AlgebraicTopology.Cohomology.Twisted.Basic
import TauCeti.AlgebraicTopology.Singular.Subdivision.Small.Equiv
import TauCeti.Analysis.Fredholm.CompactPerturbation
import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Function

/-!
# ComplexComparisonPartII: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular targets, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

The roadmap uses ComplexKahlerGeometry K2–K4 and GlobalHolomorphicFunctions GH0.3
to construct analytic-space local models and analytification (C−1), then compares complex
algebraic and complex analytic geometry: coherent analytic modules and
coherent analytification (Layer C0), analytic coherent cohomology (C1), the consequences of
coherent GAGA (C2), the derived upgrade on algebraic spaces (C3), Remmert,
Chow and the algebraization of morphisms using supplied scheme compactifications (C4), the de Rham–Betti comparison with Hodge theory, integration over analytic cycles,
logarithmic structures and regular singular connections (C5), and stratified topology,
Riemann existence and finite/adic Artin comparison (C6).

C−1.4's `analyticPolydisc`, `sncPolydiscChart` and `snc_exists_polydiscChart` provide
the analytic charts from ResolutionOfSingularitiesCharacteristicZero §§1.3, 6.2, 6.4's
`sncBoundary`, `sncCompactification` and `sncCoordinates`: the compactification preserves
the given smooth quasi-projective open and has globally smooth labelled boundary components;
the supplied étale equations are `t₁⋯t_b=0`. Analytification and the analytic inverse-function
theorem give the polydisc charts for any smooth finite-type complex SNC pair, without compactness.

C3.2a's `spaceDerivedLimits` obtains intrinsic quasi-coherent products and limits by
applying `spaceQuasiCoherator` to EnhancedDerivedSheaves §§0.1–0.4's shared ringed-site
products and coherent limits, retaining their projections and transition maps. C3.2b's
perfect-test systems use EnhancedDerivedSheaves E1.9's `perfect_proper_pushforward`
and DerivedModuleAlgebra §1.E.1's `perfectInverseSystemEffectivity`: every finite-stage
test complex is perfect, transitions have locally nilpotent kernels, and compatibility
is by derived tensor. The proper-support modules themselves need not be perfect.

EtaleCohomologyFoundations G.1–G.3 owns the shared scheme compactification category,
dense replacement, Nagata existence and refinement comparisons, in namespace
`TauCeti.AlgebraicGeometry`. C4.3 consumes those geometric targets with coherent coefficients. C6 owns the finite-stalk
sheaf/native-local-system dictionary and constructible coefficients, Riemann
existence, the comparison-site morphism and finite/adic Artin
comparison. C6.6 constructs the topological adic realization using
EtaleCohomologyFoundations F.4's étale normalized systems and
EnhancedDerivedSheaves’ generic derived limits/completion. F.0–F.4 supply C6;
LefschetzPencilsAndVanishingCycles §0.8a's nearby-cycle and inertia comparison consumes C6.

C−1.1 owns the general scheme analytification used by FormalConnectionsOpers F2.4's
fixed-model manifold and curve applications. C0.4 and C5.1–C5.2 supply its coherent,
differential-operator and connection adapters without proper GAGA. Ordinary algebraic
operators and all-order principal parts belong to FormalConnectionsOpers F2.2;
`commutatorWith` and `IsDifferentialOperator` below are local prototypes of that supplier's
canonical algebraic declarations.
C5.4's `analyticSetLocalFiniteMass` globalizes K6.1's chart-local Lelong estimates,
with restriction and compact-local metric comparisons. C6 uses TopologicalSheafCohomology
TS3.1–TS3.3's extension by zero and compact supports and identifies TS3.7's common CW
comparison maps with its support adapters.

C5.2's `holomorphicConnectionDictionary` identifies the finite locally free analytic
sheafification of CR.1 with K4's holomorphic bundle connections on C0.3's rank strata,
including operators, curvature, tensor/dual/Hom, pullback and horizontal sheaves.
C5.2 owns `analyticFlatConnectionLocalSystem`: local horizontal frames with holomorphic
parameters identify a finite locally free module with integrable relative connection with
the structure sheaf tensored with its horizontal sheaf. The unit and canonical evaluation
counit give the analytic equivalence, used by the coefficient `relativePoincare` contraction
and regular-singular comparison. Over a point base its core agrees with K4's absolute unit,
evaluation, stalk and source-to-target monodromy maps through tensor symmetry; the target here
includes all horizontal morphisms and holomorphic parameters. In `relativeDeRhamBetti` the
target order is `L ⊗ O`, so the connection is `1 ⊗ d` followed by forms-first tensor symmetry.
C5.2 also owns `artinDeRhamBetti`: for a finite-dimensional
local complex algebra with residue field `ℂ` and a smooth proper scheme over it, the nilpotent-retaining relative analytic de Rham
complex resolves the constant algebra sheaf. Operator-complex GAGA and constant-coefficient
sheaf–singular comparison identify its cohomology with special-fibre Betti cohomology tensored
with the algebra. This supplies the total length input to `relativeHodgeBundles`, including
nonreduced bases, before freeness of the Hodge pieces is proved. C5.4 owns `CurrentCalculus`,
the complementary-form specialization of K5a's `BundleTest` and `BundleDistribution` through
the complex orientation and bilinear wedge/density pairing. Its test and compact-convergence
dual equivalences intertwine restriction, gluing and real/complex comparisons; K5a's
distributional operator action gives the current differential signs. It adds
smooth wedge, positivity, mass and local regularization used by `closedCurrentExtension` and
the cycle and Chern targets. C5.4's `realComplexCurrentComparison` identifies
GeometricCurrents G1's real dimension-q tests and currents with K5a's real
exterior-dual/density specialization, without an ambient orientation. On the underlying
real 2n-manifold it gives the conjugation-fixed complex degree-(2n-q) current
`J_q(T)(φ + iψ) = T(φ) + i T(ψ)`, preserving support, restriction, gluing and integration.
For `1 ≤ q ≤ 2n` it satisfies `d J_q(T) = (−1)^(2n−q+1) J_(q−1)(∂T)`;
at q = 0 both differentials land in the zero endpoint. With complex-test comass
defined on real unit simple vectors its mass equals the real comass mass;
locally finite mass gives equality of Radon mass measures. Positive bidimension-(p,p)
currents have compact-local two-sided comparison with the trace mass, with equality
to volume for complex-submanifold integration. Positivity does not impose membership
in GeometricCurrents' integral subgroup. Its `integralLineBundleChernClass` forgets to the native smooth
complex line, uses SmoothBundlesConnections B6's integral class of the right unit-frame bundle
of the dual line, and identifies it integrally with CharacteristicClasses C1.5/C3's first Chern
class. The inverse-character cocycle gives the holomorphic coordinate-transition connecting
class, retaining torsion. The shared Čech–de Rham comparison identifies its real image with
normalized Chern curvature. `chernFubiniStudyIntersection` consumes this identification.
`ehresmannFibration` is C5.2's underlying-smooth holomorphic/analytification adapter to
SmoothBundlesConnections B1.5's general proper-surjective-submersion theorem, including
native smooth trivializations and their pullbacks; its realification maps come from
ComplexManifolds Milestone 1. C0.3 identifies ComplexKahlerGeometry K4's supplied
fixed-rank bundle–sheaf equivalence with C0.1 and assembles clopen rank strata.
RealAnalyticGeometry R3.2 supplies the native coherent module predicate, its
`CoherentAnalyticModule.presentation_iff` identification with finite presentation, and
manifold open/over-site, section/stalk and germ calculus. C0 descends that category on
C−1's analytic-space quotient charts and identifies its manifold and bundle transports.
RealAnalyticGeometry R3.1 supplies complete-metric weighted existence, graph-domain
density, weighted regularity, Stein criteria and approximation; R3.2 supplies coherent
manifold Cartan A/B. C1.4 transports the positive-definite `(n,k)` theorem and canonical
`E ⊗ K_M⁻¹` identification through C0.3, retaining completeness, curvature and finite
inverse-energy hypotheses. C1.5 extends the supplied manifold Cartan maps to strongly
1-complete analytic spaces, including nilpotents, and compares restriction and germ maps.
ComplexKahlerGeometry K5a's local bundle regularity, K5b.0's adjoint/symbol and K6.0's
Bochner identity feed R3.1 independently of compact Hodge theory. C5.3 uses K5's supplied
harmonic/Green machinery and K6.1's Kähler decomposition through its geometric comparison
maps. The stage order is K2–K4 → R3.2 item 0 → C−1/C0, R3.1–R3.2 → C1,
and R3–R5 → K6.1 → C5.3.
C0.7 constructs `analyticEtaleDescent` and `SpaceCoherentAnalytification`, with canonical
cohomology/exchange comparisons, before C1.9's `properSpaceComplexGaga`.
C5.1's nesting-small resolution extends and compares with CharacteristicClasses C1.2's
shared locally acyclic constant-coefficient resolution on Hausdorff CW representatives,
including the augmentation and maps from singular cochains.
C6.0 extends AffineMorseLefschetz A4's
compact closed-family triangulation foundation to noncompact locally closed pieces and
separated algebraic chart gluing. C6.1 uses AlgebraicTopology Stage 6.1's direct cochains
with actual vertex fibres; the pinned twisted Hom complex instead has dual coefficients.

Most of its carriers are not in Mathlib or Tau Ceti at the pinned commits: complex analytic spaces
with nilpotents, the analytification functor and proper coherent GAGA are built in the
local sections C−1.1–C−1.3 and C1.9, and algebraic spaces, compact
complex manifolds with their forms and currents, and global log schemes are not available here.
Statements about them live in `README.md` only; the closing comment of this file lists them.
What is recorded here:

* the library declarations the roadmap consumes, pinned by `#check`;
* light definitions with real bodies that are statable at the pins: the coherent-module category
  over a locally ringed space (C0.1), the Euclidean Hodge-Laplacian sign adapter (C1.2),
  Grothendieck's order of a differential operator (C5.1),
  chart maps and the intrinsic saturation adapter (C5.5), and the residue-strip and monodromy
  conventions (C5.6);
* end theorems and layer milestones whose carriers exist at the pins: the several-variable
  Montel theorem, Schwartz's finiteness theorem for Fréchet spaces and its Banach specialization,
  the additive sheaf–singular comparison for arbitrary abelian coefficients, connectedness of
  punctured Riemann surfaces, the pointwise form of the semipositive wedge inequality and the
  Fubini–Study normalisation.

Design choices made explicit: analytification of modules is Mathlib's pullback of sheaves of
modules, so coherent modules are `SheafOfModules.IsFinitePresentation` over the structure sheaf;
ordinary connections use CrystallineCohomology CR.1's `Crystalline.Connection` carrier,
with its coefficient-first tensor order; tensor symmetry gives the geometric order `Ω¹ ⊗ E`.
The Leibniz rule makes the shared additive map `k`-linear. Differential operators are `k`-linear
maps with Grothendieck's commutator condition. The ordinary algebraic de Rham core is
DerivedDeRhamCohomology Layer 2's `DeRham.complex` and `DeRham.complexMap`;
`AlgebraicDeRham` sheafifies that core. Algebraic logarithmic structures and differentials use
CrystallineCohomology CR.5:log-algebra and CR.5.1's algebraic carriers.
`logAnalytification` transports monoid sheaves, logification and log pullback;
`AnalyticLogDifferentials` uses the relative holomorphic cotangent sheaf and represents
log derivations satisfying the convergent chain rule, including on nonreduced analytic
charts. `logAnalytification.cotangentIso` compares ordinary algebraic differentials with
that holomorphic cotangent sheaf; `logAnalytification.logDifferentialsIso` compares the
log relation quotients and, through differential-operator analytification, their exterior
complexes. The analytic carrier does not represent unrestricted algebraic derivations
of analytic structure rings. The shared log structure maps take values in the
multiplicative monoid, so non-units (`0` included) are allowed; the Hodge Laplacian is the
nonnegative operator, the negative of Mathlib's `Δ = div ∘ grad`.
-/

namespace TauCetiRoadmap.ComplexComparisonPartII

open CategoryTheory AlgebraicGeometry
open scoped TensorProduct ContDiff Manifold Topology ZeroObject

universe u

noncomputable section

/-! ## Milestones on the pinned carriers -/

/-- **C1.6, `schwartzFiniteness`.** A compact perturbation of a continuous complex-linear
surjection between Fréchet spaces has closed range of finite codimension. Compactness is
Mathlib's neighbourhood-of-zero condition; the kernel of the surjection need not be finite.
This is the functional-analytic finiteness theorem used for coherent cohomology. -/
theorem schwartzFiniteness {E F : Type*}
    [AddCommGroup E] [UniformSpace E] [IsUniformAddGroup E] [Module ℂ E]
    [Module ℝ E] [IsScalarTower ℝ ℂ E] [ContinuousSMul ℂ E]
    [LocallyConvexSpace ℝ E] [TopologicalSpace.MetrizableSpace E] [T2Space E] [CompleteSpace E]
    [AddCommGroup F] [UniformSpace F] [IsUniformAddGroup F] [Module ℂ F]
    [Module ℝ F] [IsScalarTower ℝ ℂ F] [ContinuousSMul ℂ F]
    [LocallyConvexSpace ℝ F] [TopologicalSpace.MetrizableSpace F] [T2Space F] [CompleteSpace F]
    (g h : E →L[ℂ] F) (hg : Function.Surjective g) (hh : IsCompactOperator h) :
    IsClosed (LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F) : Set F) ∧
      FiniteDimensional ℂ (F ⧸ LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F)) := sorry

/-- **C5.1, `sheafSingularComparison`.** Existence of an additive isomorphism between
constant-sheaf cohomology and singular cohomology with arbitrary abelian coefficients on a
semilocally contractible space, without Hausdorff or paracompactness assumptions. The coefficient
`ULift ℤ` is the free rank-one integral module in the space's universe. -/
theorem sheafSingularComparison (T : TopCat.{u}) (hT : LocallyContractibleSpace T)
    (A : AddCommGrpCat.{u}) (q : ℕ) :
    Nonempty
      (Sheaf.H.{u}
        ((constantSheaf (Opens.grothendieckTopology T) AddCommGrpCat.{u}).obj A) q
        ≃+ T.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) q) := sorry

/-! Library declarations this roadmap builds on. -/

-- Finitely presented (coherent) sheaves of modules, and local freeness.
#check @SheafOfModules.IsFinitePresentation
#check @SheafOfModules.IsLocallyFree
#check @TauCeti.SheafOfModules.ringCatSheaf
#check @TauCeti.SheafOfModules.isMonoidal_isFinitePresentation
-- The algebraic coherent category of a scheme in Tau Ceti.
#check @TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf
-- Sheaf cohomology as Ext from the constant sheaf, and the Čech complex.
#check @CategoryTheory.Sheaf.H
#check @CategoryTheory.cechComplexFunctor
-- Flasque sheaves are acyclic (used for the small singular cochain resolution, C5.1).
#check @TauCeti.Topology.subsingleton_H_succ_of_isFlasque
-- A flat local homomorphism of local rings is faithfully flat (C0.4).
#check @Module.FaithfullyFlat.of_flat_of_isLocalHom
-- The map on Ext induced by an exact functor (Ext comparison of proper GAGA).
#check @CategoryTheory.Abelian.Ext.mapExactFunctor
-- The abstract pure Hodge structure that C5.3 instantiates.
#check @TauCeti.Hodge.HodgeStructureOn
#check @TauCeti.Hodge.Conjugation
-- The period of `dz/z` (C5.1, C5.7).
#check @circleIntegral.integral_sub_inv_of_mem_ball
-- Complements of countable sets in real dimension `≥ 2` are path connected (model for C4.5).
#check @Set.Countable.isPathConnected_compl_of_one_lt_rank
-- The one-variable holomorphic sheaf on `ℂ` (the `n = 1` case of the analytic structure sheaf).
#check @TauCeti.holomorphicSheaf
-- Montel's theorem on open subsets of `ℂ` (C1.6 states the several-variable case).
#check @TauCeti.montel
-- Singular cohomology and cover-small chains use the pinned constructions.
#check @TopCat.singularCohomology
#check @TopCat.singularCup
#check @TopCat.smallSingularSubcomplex
#check @TauCeti.smallSingularSubdivisionHomotopy
#check @TauCeti.smallSingularChainHomotopyEquiv
-- This finite-kernel case is a supplier, distinct from Schwartz's surjection theorem.
#check @ContinuousLinearMap.IsFredholm.add_of_isCompactOperator
-- Saturation after restriction to the generated group (C5.5).
#check @AddSubmonoid.NSMulSaturated
-- Schematic density, with flat base change, for compactification geometry (C4.3a).
#check @IsSchemeTheoreticallyDominant
#check @IsSchemeTheoreticallyDominant.of_isPullback
-- Native local coefficients; the twisted Hom complex computes the dual system (C6.1).
#check @TauCeti.LocalCoefficientSystem
#check @TauCeti.LocalCoefficientSystem.fiberFunctor
#check @TauCeti.LocalCoefficientSystem.transport
#check @TauCeti.LocalCoefficientSystem.pullback
#check @TauCeti.LocalCoefficientSystem.twistedCochainComplex
-- Semialgebraic carriers for the stratified triangulation target (C6.0).
#check @TauCeti.IsSemialgebraic
#check @TauCeti.IsSemialgebraicOn
#check @TauCeti.IsSemialgebraicMap
-- Chartwise coefficients and their topology for C5.4's test-form dual.
#check @TestFunction
#check @Distribution
#check @Distribution.lineDerivCLM
#check @Distribution.ofFun
#check @Distribution.delta
-- Smooth partitions of unity make smooth function and differential-form sheaves acyclic (C5.4).
#check @SmoothPartitionOfUnity.exists_isSubordinate
-- Length and the dual-number coefficient algebra in C5.2's Artin comparison.
#check @Module.length
#check @DualNumber

/-! ## Layer C0: Coherent analytic modules and coherent analytification -/

section C0

/-- **C0.1, `CoherentAnalyticModule`.** The finite-presentation form of
RealAnalyticGeometry R3.2's coherent module category: all finitely presented native modules,
with all module morphisms. Its supplied `CoherentAnalyticModule.presentation_iff` identifies
this with native coherence when the structure sheaf is coherent. C0 descends that category
on complex analytic quotient charts and compares its restrictions and manifold transports.
The displayed full subcategory is defined over any locally ringed space. On the locally ringed
space of a scheme `X` it is the pinned `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf X`;
the abbreviation extends that category to C−1.1's analytic spaces. -/
abbrev CoherentAnalyticModule (X : LocallyRingedSpace.{u}) : Type _ :=
  ObjectProperty.FullSubcategory
    (SheafOfModules.isFinitePresentation (TauCeti.SheafOfModules.ringCatSheaf X.sheaf))

/-- The underlying sheaf of a coherent module is finitely presented. -/
instance (X : LocallyRingedSpace.{u}) (M : CoherentAnalyticModule X) :
    M.obj.IsFinitePresentation :=
  M.property

end C0

/-! ## Layer C1: Analytic coherent cohomology -/

section C1

open MeasureTheory

/-- **C1.6, `montelTheorem`.** On an open subset of a finite-dimensional complex normed space, a
sequence of holomorphic functions that is uniformly bounded on every compact subset has a
subsequence converging locally uniformly, with holomorphic limit. Tau Ceti's `TauCeti.montel` is
the case of an open subset of `ℂ`; the several-variable domain is what the restriction maps
between polydisc charts need. -/
theorem montelTheorem {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [FiniteDimensional ℂ E] {Ω : Set E} (hΩ : IsOpen Ω) (f : ℕ → E → ℂ)
    (hf : ∀ n, DifferentiableOn ℂ (f n) Ω)
    (hb : ∀ K ⊆ Ω, IsCompact K → ∃ C : ℝ, ∀ n, ∀ z ∈ K, ‖f n z‖ ≤ C) :
    ∃ (φ : ℕ → ℕ) (g : E → ℂ), StrictMono φ ∧ DifferentiableOn ℂ g Ω ∧
      TendstoLocallyUniformlyOn (fun n => f (φ n)) g Filter.atTop Ω := sorry

/-- **C1.6, `frechetOpenMapping`.** A continuous complex-linear surjection between complete
metrizable Hausdorff locally convex complex vector spaces is open. Local convexity uses the
underlying real scalar structure; neither separability nor normability is required. -/
theorem frechetOpenMapping {E F : Type*}
    [AddCommGroup E] [UniformSpace E] [IsUniformAddGroup E] [Module ℂ E]
    [Module ℝ E] [IsScalarTower ℝ ℂ E] [ContinuousSMul ℂ E]
    [LocallyConvexSpace ℝ E] [TopologicalSpace.MetrizableSpace E] [T2Space E] [CompleteSpace E]
    [AddCommGroup F] [UniformSpace F] [IsUniformAddGroup F] [Module ℂ F]
    [Module ℝ F] [IsScalarTower ℝ ℂ F] [ContinuousSMul ℂ F]
    [LocallyConvexSpace ℝ F] [TopologicalSpace.MetrizableSpace F] [T2Space F] [CompleteSpace F]
    (g : E →L[ℂ] F) (hg : Function.Surjective g) : IsOpenMap g := sorry

/-- **C1.6, `schwartzFiniteness`, Banach case.** A compact perturbation of a continuous linear
surjection between complex Banach spaces has closed range of finite codimension. The README states
the theorem for Fréchet spaces, the generality its coherent-cohomology application needs; this is
its special case for Banach spaces. -/
theorem schwartzFiniteness_banach {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [CompleteSpace E] [NormedAddCommGroup F] [NormedSpace ℂ F] [CompleteSpace F]
    (g h : E →L[ℂ] F) (hg : Function.Surjective g) (hh : IsCompactOperator h) :
    IsClosed (LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F) : Set F) ∧
      FiniteDimensional ℂ (F ⧸ LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F)) := sorry

/-! ### C1.2 The sign of the Hodge Laplacian -/

section HodgeLaplacianSign

open Laplacian

/-- The Hodge Laplacian on functions, `Δ_Hodge = δd`, is the negative of Mathlib's Laplacian
`Δ = div ∘ grad` (DifferentialGeometry's `laplaceBeltrami` has the same sign as Mathlib's). -/
def hodgeLaplacianFun {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] (f : E → ℝ) : E → ℝ :=
  -(Δ f)

end HodgeLaplacianSign

end C1

/-! ## Layer C4: Analytic images, Chow algebraization and morphism comparison -/

section C4

/-- **C4.5, `puncturedRiemannSurfaceConnected`.** Removing finitely many points from a connected
Riemann surface leaves a path-connected set. Removing a point from a real interval can disconnect
it, so the real dimension two hypothesis matters. -/
theorem puncturedRiemannSurfaceConnected {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace ℂ M] [IsManifold 𝓘(ℂ) ω M] [ConnectedSpace M] {D : Set M} (hD : D.Finite) :
    IsPathConnected Dᶜ := sorry

end C4

/-! ## Layer C5: de Rham–Betti comparison, Hodge theory and logarithmic comparison -/

/-! ### C5.1 Differential operators -/

section DifferentialOperators

variable (k : Type*) {A M N : Type*} [CommRing k] [CommRing A] [Algebra k A]
  [AddCommGroup M] [Module A M] [Module k M] [IsScalarTower k A M]
  [AddCommGroup N] [Module A N] [Module k N] [IsScalarTower k A N]

/-- The commutator `[D, a] = D ∘ (a ·) − a · D` of a `k`-linear map with multiplication by
`a ∈ A`, modelling FormalConnectionsOpers F2.2's canonical algebraic commutator. -/
def commutatorWith (a : A) (D : M →ₗ[k] N) : M →ₗ[k] N :=
  D ∘ₗ (a • LinearMap.id) - a • D

/-- **F2.2, `IsDifferentialOperator`** (Grothendieck). A `k`-linear map has order `≤ 0` if it is
`A`-linear, and order `≤ m + 1` if all its commutators with multiplication by elements of `A` have
order `≤ m`. This characteristic-free predicate supplies C5.1's
`DifferentialOperatorAnalytification` through the all-order principal-parts factorization.
It models FormalConnectionsOpers F2.2's canonical algebraic order predicate. -/
def IsDifferentialOperator : ℕ → (M →ₗ[k] N) → Prop
  | 0, D => ∀ (a : A) (x : M), D (a • x) = a • D x
  | m + 1, D => ∀ a : A, IsDifferentialOperator m (commutatorWith k a D)

end DifferentialOperators

/-! ### C5.4 Positivity and the Chern normalisation -/

section Positivity

open scoped ComplexOrder

/-- **C5.4, `semipositiveWedge`, pointwise form.** In top degree `βᵈ / d!` and `αᵈ / d!` are
`det B` and `det A` times the volume form, so the wedge inequality for semipositive `(1,1)`-forms
`0 ≤ β ≤ α` is the determinant inequality for Hermitian matrices `0 ≤ B ≤ A`. -/
theorem det_le_det_of_posSemidef {n : Type*} [Fintype n] [DecidableEq n]
    {A B : Matrix n n ℂ} (hB : B.PosSemidef) (hAB : (A - B).PosSemidef) :
    B.det.re ≤ A.det.re := sorry

/-- **C5.4, `chernFubiniStudyIntersection`, the normalisation on a line.** The shared integral
class `integralLineBundleChernClass O(1)` agrees with the inverse-character Hopf class
from SmoothBundlesConnections B6 and is the positive integral generator on `P¹`, by the
shared Čech–curvature comparison and the following integral. In the affine chart
of `P¹`, the normalised Fubini–Study form `(i/2π) ∂∂̄ log(1 + |z|²)` is
`π⁻¹ (1 + |z|²)⁻² dx dy`, and its integral is `1`: `c₁(O(1))` has degree one. -/
theorem fubiniStudy_integral_eq_one :
    ∫ z : ℂ, (Real.pi)⁻¹ * ((1 + ‖z‖ ^ 2) ^ 2)⁻¹ = 1 := sorry

end Positivity

/-! ### C5.5 Chart-level logarithmic structures -/

section LogCharts

/-- **The standard log point** `ℕ → ℂ`, `n ↦ 0ⁿ` (so `1 ↦ 0`): a prelog structure that is not
a log structure; its logification is `ℂˣ × ℕ`. Restricting prelog targets to units would
exclude it. This is the chart map for `LogCrystalline.PrelogRing`, not a log-structure carrier. -/
def standardLogPoint : Multiplicative ℕ →* ℂ :=
  powersHom ℂ 0

/-- **Saturation** of a submonoid `Q` of an abelian group, measured in the subgroup `Q^gp` that
`Q` generates (its group completion): an element `x` of `Q^gp` with `n • x ∈ Q` for some `n > 0`
lies in `Q`. This Mathlib adapter agrees with CrystallineCohomology's
`LogCrystalline.IsSaturatedMonoid` for `Multiplicative Q`; it measures roots in `Q^gp`. -/
def IsSaturatedSubmonoid {G : Type*} [AddCommGroup G] (Q : AddSubmonoid G) : Prop :=
  (Q.comap (AddSubgroup.closure (Q : Set G)).subtype).NSMulSaturated

end LogCharts

/-! ### C5.6 Residue strips and monodromy -/

section Residues

/-- The representative of `a ∈ ℂ` modulo `ℤ` in the strip `0 ≤ Re < 1`, used for residues of
canonical logarithmic extensions. -/
def residueStripRep (a : ℂ) : ℂ :=
  a - (⌊a.re⌋ : ℂ)

/-- The strip representative lies in `0 ≤ Re < 1` and differs from `a` by an integer. -/
theorem residueStripRep_mem (a : ℂ) :
    0 ≤ (residueStripRep a).re ∧ (residueStripRep a).re < 1 ∧
      ∃ n : ℤ, residueStripRep a = a - n := sorry

/-- The monodromy `exp(−2πia)` along the positive loop of the rank-one connection
`d + a dz/z` (equivalently, of a logarithmic extension with residue `a`). -/
def localMonodromy (a : ℂ) : ℂ :=
  Complex.exp (-2 * Real.pi * Complex.I * a)

/-- Monodromy depends only on the residue modulo `ℤ`. -/
theorem localMonodromy_add_int (a : ℂ) (n : ℤ) : localMonodromy (a + n) = localMonodromy a :=
  sorry

end Residues

/-! ### C6.1 Finite fibres in the native local-coefficient category -/

/-- Finite local systems form the finite-fibre full subcategory of Tau Ceti's native
fundamental-groupoid functor category; no projectivity condition is imposed. -/
abbrev FiniteModuleLocalSystem (Λ : Type u) [CommRing Λ] (T : TopCat.{u}) : Type _ :=
  ObjectProperty.FullSubcategory
    (fun L : TauCeti.LocalCoefficientSystem.{u, u, u} Λ T => ∀ x, Finite (L.obj x))

/-- Every vertex fibre of a finite local system has a finite underlying set. -/
instance (Λ : Type u) [CommRing Λ] (T : TopCat.{u})
    (L : FiniteModuleLocalSystem Λ T) (x : FundamentalGroupoid T) :
    Finite (L.obj.obj x) :=
  L.property x

end

/-!
## Further targets in the README

The analytic spaces, global forms and sheaf constructions below are mathematical targets in
`README.md`, which states their exact hypotheses. Their carriers require those constructions;
the supporting presentation and curvature comparisons are also specified there.

* **Complex analytic spaces and analytification** (C−1.1–C−1.3/C1.9):
  `CoherentAnalyticModule` on analytic spaces, `coherentOperations`, `CoherentAnalyticIdeal`,
  `holomorphicBundleDictionary` (model fibre `Fin r → ℂ` at each fixed rank, using
  ComplexKahlerGeometry K4's section/reconstruction equivalence on clopen rank strata
  for locally constant ranks), `CoherentAnalytification`, `coherentAnalytification_faithful`,
  `coherentPullbackOperations`, `HigherImageComparison`, `analyticSetGeometry`, `fibreDimensionLoci`;
  `SteinManifold`, `StronglyOneComplete`, `StronglyOneComplete.completeKaehlerMetric`,
  `cartanTheoremB`, `cartanSerreFiniteness`, `projectiveLerayCover`,
  `AnalyticTwist`, `analyticTwistCohomology`, `analyticSerreGeneration`,
  `analyticSerreVanishing`, `twistPresentations`; `gagaBaseChange`,
  `projectiveGeometricDictionaries`; `remmertProperImage`, `remmertSteinExtension`,
  `projectiveChowNonreduced`, `properSupportAlgebraization`, `properSourceMorphismAlgebraicity`,
  `algebraicGraphRegular`, `familyMorphismInterface`, `affineCurveCompletionInterface`,
  `affineCurveConnectedness`; `DifferentialOperatorAnalytification`, `boundedOperatorHyperGaga`,
  `properDeRhamBetti`, `relativeDeRhamBetti`, `deligneRiemannHilbert`,
  `regularSingularDeRhamComparison`, `properLogGagaMonodromy`.
* **Analytic local foundations and Picard algebraicity (C−1/C1.9/C3.2a–g):**
  `HolomorphicStructureSheaf`, `ConvergentGerm` as comparisons with ComplexKahlerGeometry
  K3–K4's native sheaf and local algebra,
  `ComplexAnalyticSpace`, scheme/space analytification, completed-stalk comparison and
  proper coherent GAGA; `spaceDerivedLimits`, `strongProperSupportExistence`,
  `cohStack_algebraic`, Picard-stack and relative-Picard algebraicity, separatedness,
  Brauer obstruction, Cartier-dual torsors, torsion and identity components, and
  `picardParameter_formalEquiv`. The algebraic carriers and generic formal transport
  are supplied by AlgebraicModuliForArithmeticGeometry. `spaceDerivedLimits` uses
  EnhancedDerivedSheaves §§0.1–0.4's ambient products and coherent limits through
  `spaceQuasiCoherator`, with its X-dependent bound and perfect-test comparison.
  `strongProperSupportExistence` consumes EnhancedDerivedSheaves E1.9's perfect
  proper-support pushforward and DerivedModuleAlgebra §1.E.1's perfect-system effectivity.
* **Algebraic spaces and their derived categories:** `analyticEtaleDescent`,
  `SpaceCoherentAnalytification` in C0.7, followed by `spaceQuasiCoherator` (on AlgebraicModuliForArithmeticGeometry's
  `spaceDQCoh`), `pseudoCoherenceDetection`, `derivedGagaProperSpace`.
* **Forms, metrics and currents on complex manifolds** (the shared carriers are absent at the
  pins): `localDolbeault` identifies ComplexKahlerGeometry K2's resolution with C0's modules;
  K4 supplies Chern connections, K5a/K5b.0 supplies Hodge operators and local adjoints,
  and K6.0 supplies the Kähler/Bochner identities to RealAnalyticGeometry R3.1's
  weighted theorem, graph-domain density and regularity. C1.4's `weightedDolbeaultEstimate`
  transports its positive-definite `(n,k)` theorem to C0.3 and scalar forms with the
  canonical twist, and C1.5's `cartanTheoremA`/`cartanTheoremB` extends R3.2's coherent
  manifold Cartan package to strongly 1-complete analytic spaces;
  `HolomorphicDeRham`, `holomorphicPoincare`, `holomorphicConnectionDictionary`
  (finite locally free analytic sheafification of CR.1 identified with K4's holomorphic
  bundle connections on clopen rank strata, using the same local matrices and gauge law;
  compatibility with tensor symmetry, curvature, pullback, tensor/dual/Hom and horizontal sheaves),
  `analyticFlatConnectionLocalSystem`
  (finite locally free holomorphic coefficients on a holomorphic submersion of complex manifolds,
  local horizontal frames with holomorphic parameters; horizontal sheaf locally pulled back from
  a finite locally free base module of the same rank; the unit and connection-compatible evaluation
  `O_T ⊗_(f⁻¹O_S) ker ∇ → E`; naturality for horizontal morphisms, pullback with base scalar
  extension, tensors and duals; over a point the all-morphism finite-dimensional complex
  local-system equivalence whose core agrees with K4's unit, evaluation, stalk and
  source-to-target monodromy maps via tensor symmetry),
  `relativeDeRhamBetti` (target `L ⊗ O`, connection `1 ⊗ d` followed by symmetry to
  `Ω¹ ⊗ (L ⊗ O)`, sending `v ⊗ a` to `da ⊗ (v ⊗ 1)`),
  `relativePoincare` (the scalar radial contraction in fibre coordinates, transported to an
  integrable finite locally free coefficient connection through that evaluation isomorphism),
  `compactEllipticHodge`
  (operator-dependent shifted coercivity, graph-norm regularity and the original operator's kernel),
  ComplexKahlerGeometry K5a–K5b.1's harmonic/Green maps and K6.1's `∂∂̄` lemma feed
  `kaehlerHodgeDecomposition`, the compatibility with coherent cohomology and integration.
  `CurrentCalculus` (on finite-dimensional Hausdorff second-countable complex manifolds,
  specialize K5a's `BundleTest` and `BundleDistribution` to the complexified real exterior
  bundle `E_k`; the complex orientation and bilinear wedge pairing identify complementary
  test forms with `E_k* ⊗ DensityBundle M`, including their support, inductive-limit
  topology and real/complex coefficient comparison. The induced compact-convergence dual
  equivalence intertwines restriction, gluing and distributional operator action;
  degree `k` acts on degree `2n − k`, bidegree `(a,b)`
  on type `(n−a,n−b)`, differential sign `(−1)^{k+1}`; positivity dual to strongly positive forms,
  trace mass `T ∧ ω^p/p!` for `ω = (i/2)Σ h_jk dz_j ∧ dz̄_k`, finite-mass extension by zero and
  local convolution convergence), `realComplexCurrentComparison`
  (GeometricCurrents G1's real dimension-q carrier as K5a's real
  `BundleDistribution((Λ^q T* M)* ⊗ DensityBundle M)` without ambient orientation;
  complex-linear extension on tests identifies real currents with the conjugation-fixed
  complex degree-(2n-q) currents, with compact-convergence topology, support,
  restriction/gluing and integration compatibility;
  `d J_q(T) = (−1)^(2n−q+1) J_(q−1)(∂T)` for `1 ≤ q ≤ 2n`, zero endpoint at q = 0;
  real and complex-test comass masses agree, positive-current trace masses are
  comparable on compacts and both equal volume on complex submanifolds;
  no integer-rectifiability hypothesis on general complex or positive currents),
  `closedCurrentExtension`,
  `AnalyticCycleIntegration` (arbitrary finite-dimensional Hausdorff second-countable complex
  manifolds and pure-dimensional analytic subsets; uses C5.4's `analyticSetLocalFiniteMass`,
  which globalizes ComplexKahlerGeometry K6.1's chart-local Lelong estimates, and K5a's
  real/complex L¹ integration comparison, without compactness or a Kähler hypothesis),
  `AnalyticCycleIntegration.compactKaehler` (on compact Kähler manifolds, evaluation on
  the complexification of a real closed form equals the complex image of K6.1's real
  analytic-set de Rham functional, with the same complex orientation and cycle multiplicities;
  the shared L¹ integral includes nodal projective curves and twice their cycles),
  `semipositiveWedge` on analytic sets, `lelongPoincareSection`,
  `integralLineBundleChernClass` (holomorphic line bundles on arbitrary complex manifolds,
  forgetful adapter to SmoothBundlesConnections B2's smooth complex line carrier;
  integral equality with B6's inverse-character class of the dual-line unit-frame bundle
  and CharacteristicClasses C1.5/C3's first Chern class; the integral cocycle identity
  `−δφ^P/(2π) = δu` and shared Bockstein comparison, with pullback/tensor/dual compatibility;
  its real coefficient image equals `[(i/2π)Θ(L,h)]`, using `Θ(L) = −i F_P` and the
  shared Čech–de Rham comparison; bundle metrics are conjugate-first, and the Hodge pairing
  swaps the arguments),
  `chernFubiniStudyIntersection` in general consumes this integral class and curvature comparison
  before the projective divisor/intersection argument, `dghIntegrationApplication`.
* **Singular cohomology with coefficients** (AlgebraicTopology, Stage 6): `SmallSingularCochains`,
  `sheafSingularComparison` (the non-Hausdorff nesting extension, compared on Hausdorff
  CW representatives with CharacteristicClasses C1.2's shared locally acyclic resolution),
  `multiplicativePeriodInterface`, `relativeBettiLocalSystem`; and
  `ehresmannFibration` (the underlying-real smooth adapter for proper surjective holomorphic
  submersions of finite-dimensional Hausdorff second-countable complex manifolds without
  boundary and analytifications of smooth separated schemes; specializes ComplexManifolds
  Milestone 1's realification and consumes
  SmoothBundlesConnections B1.5's componentwise native smooth trivializations,
  with restriction and holomorphic-base pullback compatibility).
* **Stratified topology and finite/adic comparison** (C6): `complexAlgebraicTopology` uses
  the pinned semialgebraic carriers and AffineMorseLefschetz A4's compact closed-family
  triangulation leaf; it owns the noncompact/locally-closed extension, algebraic chart gluing,
  refinement maps and finiteness consequences on `complexSchemeAnalytification`.
  `topologicalCoefficientComparison` supplies the transport-preserving dictionary between
  locally constant module sheaves and `FiniteModuleLocalSystem`, constructs the direct-cochain
  sheaf resolution using AlgebraicTopology Stage 6.1, and adds stratified cochains and locally
  compact Hausdorff proper supports to C5.1's constant ordinary comparison. No finite
  projectivity or reflexivity is assumed; native twisted Hom cochains compute the dual system.
  `riemannExistence` compares finite-cover categories for all finite-type
  complex schemes. `artinComparison` and `artinComparisonCompactSupport` give canonical
  exchanges on bounded constructible coefficients, including finite local systems and
  constant finite abelian groups without finite Tor dimension. Their ctf restrictions
  retain the same maps and the Tor hypotheses for tensor, Künneth and derived reduction;
  `relativeArtinComparison` uses the ctf domain. `artinSmoothTrace` identifies
  EtaleCohomologyFoundations §0.11's `ClassicalAlgebraic.smoothTrace` with the oriented
  topological trace under the lower-shriek exchange for separated smooth morphisms of
  relative pure dimension d between finite-type complex schemes, with Λ = ℤ/n and n > 0.
  The relative complex orientation and positive Kummer coordinate normalize degree-one
  point classes; the comparison respects coefficient reduction, composition, open restriction
  and base change, including gluing over Hausdorff affine base opens. These exchanges use
  EtaleCohomologyFoundations F.0–F.3 and EnhancedDerivedSheaves’ enhancement.
  `adicArtinComparison` uses F.4's normalized étale systems and builds their topological
  derived-complete realization and rationalization, carrying the compatible finite-level
  smooth traces to integral and rational traces with the same reductions, composition
  and base change. C6 owns these topological carriers and
  comparison maps; LefschetzPencilsAndVanishingCycles §0.8a consumes them for nearby cycles and inertia. These analytic, triangulated and enhanced
  coefficient carriers are specified in the README; ordinary comparison admits nonseparated
  schemes, compact support requires separatedness, and the relative theorem glues over affine
  base opens. No separate analytification or étale adic category is defined here.
* **Coherent local presentations and sheaf connections:**
  `CoherentAnalyticModule.presentation_iff` is RealAnalyticGeometry R3.2's supplied
  identification of native coherence with finite presentation. C0.1 descends it on
  analytic-space charts and proves `CoherentAnalyticModule.hom_ext` for cover restrictions;
  C5.2 sheafifies `Crystalline.Connection` on arbitrary coherent coefficients and uses
  `Crystalline.Connection.curvature`,
  `.extend`, `.deRhamComplex`, `.tensor`, `.hom` and `.baseChange` from CrystallineCohomology CR.1
  (duals and Hom use finite locally free source coefficients).
  On affines its map takes values in `M ⊗ Ω¹`, and tensor symmetry gives the displayed geometric
  order `Ω¹ ⊗ M`; extension uses `DeRham.complex`, not a second de Rham differential.
* **Global de Rham, Hodge and log theory on schemes:** `AlgebraicDeRham`, `coherentFlatConnection_locallyFree`, `GaussManin`,
  `artinDeRhamBetti` (smooth proper over a finite-dimensional commutative local `ℂ`-algebra `A`
  with residue `ℂ`; augmentation `A_const → Ω•_(X^an/(Spec A)^an)` and
  `H^n_dR(X/A) ≅ H^n_sing(X₀^an, ℂ) ⊗_ℂ A`, of length
  `length_A(A) · dim_ℂ H^n_sing(X₀^an, ℂ)`; no Hodge-piece freeness assumption),
  `properPureHodge` (the Hodge-cohomology trace from SchemeAndStackFoundations §§2.19–2.20
  gives a left inverse to pullback for a proper birational modification of smooth proper schemes),
  `relativeHodgeBundles` (nonreduced locally Noetherian characteristic-zero bases, using
  `artinDeRhamBetti` for the Artin length argument), `RegularSingular`, `CanonicalLogExtension`,
  `CurveLogComplex`, `curveResidueLocalization`; the curve definition of `RegularSingular` precedes
  the analytic `CanonicalLogExtension` for arbitrary finite-rank local systems, which in turn
  supplies the logarithmic-lattice criterion and compactification independence;
  the sheaf-level `PrelogStructure`, `LogStructure`,
  `AssociatedLog`, `LogPullback`, `FineLogChart`, `DivisorialLog`, `LogSmooth`, `logChartCriterion`,
  `LogDeRham`, `logAnalytification`, `AnalyticLogDifferentials`,
  `logAnalytification.cotangentIso`, `logAnalytification.logDifferentialsIso`,
  `logDifferentialTransitivitySplit`. The algebraic prefix
  uses CrystallineCohomology CR.5:log-algebra.1–.4's `LogCrystalline.PrelogRing`,
  `LogCrystalline.PrelogRing.IsLog`, `LogCrystalline.LogStructure`,
  `LogCrystalline.IsFineMonoid`, `LogCrystalline.IsSaturatedMonoid`,
  `LogCrystalline.IsLogSmooth`, `LogCrystalline.divisorialLog`, and CR.5.1's
  `LogCrystalline.logDifferentials` and `LogCrystalline.logDeRham`. The analytic adapter
  constructs `Ω¹_hol(X/S)` by holomorphic conormal presentations and imposes the log
  relations on `Ω¹_hol(X/S) ⊕ (O_X ⊗_ℤ M_X^gp)`.
  `AnalyticLogDifferentials.lift`, `AnalyticLogDifferentials.d_alpha` and
  `AnalyticLogDifferentials.dlog_mul` provide the analytic log-derivation property and
  its defining identities, with coherence, logification invariance, restriction and analytic
  base change. For an arbitrary module sheaf, its derivations satisfy the convergent chain
  rule and kill base functions; their additive log maps vanish on the base monoid.
  For fine log schemes locally of finite type over `ℂ`, the ordinary cotangent comparison
  and exact analytification of finite chart relation quotients give the log isomorphism;
  exterior powers and differential operators compare the algebraic and holomorphic complexes.
  These preserve the base-monoid relations and first-factor residue convention.
  On `A = ℂ{z, ε}/(ε²)` with trivial logs the absolute module is
  `A dz ⊕ (A/(ε)) dε`; relative to `ℂ[ε]/(ε²)` it is `A dz`, retaining `ε dz`.
  `AlgebraicDeRham` restricts on `Spec A` to DerivedDeRhamCohomology Layer 2's
  `DeRham.complex k A`; restrictions and pullbacks use `DeRham.complexMap` and `DeRham.pullback`.
-/

end TauCetiRoadmap.ComplexComparisonPartII
