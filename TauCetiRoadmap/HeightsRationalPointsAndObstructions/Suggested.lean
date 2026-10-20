import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import TauCeti.AlgebraicGeometry.Cohomology.Genus
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic

/-!
# Heights, rational points and obstructions: representative target signatures

The roadmap is README.md. This file records light definitions and representative theorem
signatures statable against the pinned Mathlib and Tau Ceti APIs; it is not exhaustive.
The height quotient uses uniformly bounded functions on the whole domain. Tate limits use
an expanding factor, and the elliptic (O)-height is one half of the native canonical x-height.
Affine points have the evaluation topology, and adelic integrality is relative to a chosen
integral model. Finite rank means finite rational dimension, without finite generation.
-/

noncomputable section
namespace TauCetiRoadmap.HeightsRationalPointsAndObstructions
universe u v w
open CategoryTheory _root_.AlgebraicGeometry Height
open scoped CategoryTheory.MonObj TensorProduct

/-! ## Curve finiteness -/

/-- Mordell finiteness (§§5.12, 6.4): a smooth proper geometrically connected curve of genus
at least two over a number field has finitely many rational points. -/
theorem mordell_finite (K : Type u) [Field K] [NumberField K]
    (C : Scheme.{u}) [C.Over (Spec (.of K))]
    [Smooth (C ↘ Spec (.of K))] [IsProper (C ↘ Spec (.of K))]
    [GeometricallyConnected (C ↘ Spec (.of K))]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial C).obj 1)]
    (hdim : topologicalKrullDim C = 1) (hg : 2 ≤ C.genus K) :
    Finite (Over.mk (𝟙 (Spec (.of K))) ⟶ Over.mk (C ↘ Spec (.of K))) := by sorry

/-! ## Layer 0: height classes and canonical heights -/

/-- Heights modulo uniformly bounded real functions, using the native quotient module. -/
abbrev HeightClass (X : Type u) :=
  (X → ℝ) ⧸ Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)

namespace HeightClass
variable {X : Type u}

/-- The linear projection of a real-valued function to its bounded-error class. -/
abbrev mk : (X → ℝ) →ₗ[ℝ] HeightClass X :=
  (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)).mkQ

/-- Two representatives agree precisely when their difference is uniformly bounded. -/
theorem mk_eq_mk_iff (h g : X → ℝ) :
    mk h = mk g ↔ ∃ C : ℝ, 0 ≤ C ∧ ∀ x, |h x - g x| ≤ C := by sorry

/-- Northcott finiteness is a property of a bounded-error class. -/
theorem northcott_congr {h g : X → ℝ} (H : mk h = mk g) :
    Northcott h ↔ Northcott g := by sorry

/-- Pullback of height classes along an arbitrary map, `[h] ↦ [h ∘ f]`. No finite-fibre
hypothesis is needed to define it; Northcott transfer along it needs finite fibres. -/
def pullback {Y : Type v} (f : X → Y) : HeightClass Y →ₗ[ℝ] HeightClass X :=
  (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter Y)).mapQ
    (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X))
    (LinearMap.funLeft ℝ ℝ f) (fun h hh => by
      have : (h ∘ f) =O[⊤] ((1 : Y → ℝ) ∘ f) :=
        Asymptotics.IsBigO.comp_tendsto hh Filter.tendsto_top
      exact this)

/-- Pullback of bounded-error classes reverses composition (§0.4). -/
theorem pullback_comp {Y : Type v} {Z : Type w} (f : X → Y) (g : Y → Z) :
    pullback (g ∘ f) = (pullback f).comp (pullback g) := by sorry

/-- A surjective map detects equality of height classes (§0.5). -/
theorem pullback_injective_of_surjective {Y : Type v} (f : X → Y)
    (hf : Function.Surjective f) : Function.Injective (pullback f) := by sorry

/-- A lower comparison transfers Northcott finiteness (§0.6). -/
theorem northcott_of_le_add {h g : X → ℝ} (hh : Northcott h) (C : ℝ)
    (hcomp : ∀ x, h x ≤ g x + C) : Northcott g := by sorry

/-- A bounded-error pullback preserves Northcott finiteness when its fibres are finite (§0.8). -/
theorem northcott_of_pullback_eq {Y : Type v} (f : X → Y) [Filter.TendstoCofinite f]
    {h : Y → ℝ} {g : X → ℝ} (hh : Northcott h) (H : mk g = pullback f (mk h)) :
    Northcott g := by sorry

end HeightClass

/-- The Tate limit written as its telescoping series. Its convergence theorem assumes d > 1. -/
def tateLimit {S : Type u} (φ : S → S) (d : ℝ) (f : S → ℝ) (s : S) : ℝ :=
  f s + ∑' m : ℕ, (d⁻¹) ^ (m + 1) * (f (φ^[m + 1] s) - d * f (φ^[m] s))

section TateLimit
variable {S : Type u} (φ : S → S) {d : ℝ} (f : S → ℝ)

/-- An expanding orbit with bounded functional-equation error has the Tate limit. -/
theorem tendsto_tateLimit (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C) (s : S) :
    Filter.Tendsto (fun m : ℕ => (d⁻¹) ^ m * f (φ^[m] s)) Filter.atTop
      (nhds (tateLimit φ d f s)) := by sorry

/-- The uniform error is bounded by C/(d−1), with positive denominator. -/
theorem abs_tateLimit_sub_le (hd : 1 < d) {C : ℝ} (hf : ∀ s, |f (φ s) - d * f s| ≤ C) (s : S) :
    |tateLimit φ d f s - f s| ≤ C / (d - 1) := by sorry

/-- The limit satisfies the exact scaling equation. -/
theorem tateLimit_comp (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C) (s : S) :
    tateLimit φ d f (φ s) = d * tateLimit φ d f s := by sorry

/-- Exact scaling and bounded distance from the representative characterize the limit. -/
theorem tateLimit_unique (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C) (g : S → ℝ)
    (hg : ∀ s, g (φ s) = d * g s) (hb : ∃ C, ∀ s, |g s - f s| ≤ C) :
    g = tateLimit φ d f := by sorry

/-- Boundedly equal representatives have the same expanding limit (§0.18). -/
theorem congr_bounded (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C)
    (g : S → ℝ) (hb : ∃ C, ∀ s, |g s - f s| ≤ C) :
    tateLimit φ d g = tateLimit φ d f := by sorry

end TateLimit

/-- The general Tate limit recovers the native elliptic height with the `(O)` normalization
(§0.18 and the elliptic normalization convention). -/
theorem tateLimit_elliptic {F : Type u} [Field F] [AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] :
    tateLimit (fun P : W.Point => 2 • P) 4 (fun P => P.naiveHeight / 2) =
      fun P => P.canonicalHeight / 2 := by sorry

/-- A fixed-field linear coordinate change changes projective height by a bounded amount. -/
theorem logHeight_linearChange_bounded (K : Type u) [Field K] [NumberField K]
    {n : ℕ} (T : (Fin (n + 1) → K) ≃ₗ[K] (Fin (n + 1) → K)) :
    ∃ C : ℝ, ∀ x : Fin (n + 1) → K, x ≠ 0 →
      |logHeight (T x) - logHeight x| ≤ C := by sorry

/-! ## Layer 1: Mordell–Weil on native abelian-variety points -/

/-- The native additive group of L-points over K, with its number-field interface supplied by
SelmerIwasawaCohomology §2.12a. -/
abbrev AbelianVariety.Points {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (L : Type u) [Field L] [Algebra K L] : Type u :=
  Additive (Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K L))) ⟶ A.toOver)

namespace AbelianVariety
variable {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)

/-- The native point-level multiplication kernel, with its number-field interface supplied by
SelmerIwasawaCohomology §2.12a. -/
def torsion (n : ℕ) (L : Type u) [Field L] [Algebra K L] : AddSubgroup (Points A L) :=
  (nsmulAddMonoidHom n : Points A L →+ Points A L).ker

/-- Weak Mordell–Weil (§1.6): quotienting number-field points by a positive integer is finite. -/
theorem finite_quotient_nsmul [NumberField K] (n : ℕ) (hn : 0 < n) :
    Finite (Points A K ⧸ (nsmulAddMonoidHom n : Points A K →+ Points A K).range) := by sorry

/-- Mordell–Weil (§1.7): the native point group of an abelian variety over a number field is
finitely generated. -/
theorem fg_points [NumberField K] : AddGroup.FG (Points A K) := by sorry

end AbelianVariety

/-! ## Layer 2: adelic points -/

section Adelic
open NumberField IsDedekindDomain
variable (K : Type u) [Field K] [NumberField K]
  (A : Type u) [CommRing A] [Algebra K A]

/-- Affine adelic points, using the native number-field adele algebra. -/
def AdelicPoints := A →ₐ[K] AdeleRing (𝓞 K) K

/-- The evaluation topology of ReductiveGroupsPartII §RG2.0.1 on affine adelic points. -/
instance : TopologicalSpace (AdelicPoints K A) :=
  TopologicalSpace.induced (fun x : AdelicPoints K A => (x : A →ₐ[K] AdeleRing (𝓞 K) K))
    (TopologicalSpace.induced (fun x : A →ₐ[K] AdeleRing (𝓞 K) K => (⇑x : A → AdeleRing (𝓞 K) K))
      inferInstance)

/-- The affine number-field diagonal is discrete and closed. -/
theorem discrete_closed_diagonal [Algebra.FiniteType K A] :
    let diag : (A →ₐ[K] K) → AdelicPoints K A :=
      fun x => (Algebra.ofId K (AdeleRing (𝓞 K) K)).comp x
    IsClosed (Set.range diag) ∧ DiscreteTopology (Set.range diag) := by sorry

/-- Evaluation at the coordinate identifies affine-line adelic points with native adeles (§2.1). -/
theorem adelicPoints_affineLine_homeomorph :
    ∃ e : AdelicPoints K (Polynomial K) ≃ₜ AdeleRing (𝓞 K) K,
      ∀ x, e x = (show Polynomial K →ₐ[K] AdeleRing (𝓞 K) K from x) Polynomial.X := by sorry

end Adelic

/-! ## Layers 3–4: torsor descent, curve covers and integral points

Torsors, descent sets, integral models and integral points use the geometric interfaces
specified in the README and named in the closing comment.
-/

/-! ## Layer 5: finite rank and difference maps -/

/-- Finite rational rank, without an assumption of finite generation. -/
def HasFiniteRank (G : Type u) [AddCommGroup G] : Prop := FiniteDimensional ℚ (ℚ ⊗[ℤ] G)

/-- A finitely generated abelian group has finite rational rank (§5.5). -/
theorem HasFiniteRank.of_fg {G : Type u} [AddCommGroup G] (hG : AddGroup.FG G) :
    HasFiniteRank G := by sorry

/-- Finite rank is equivalent to containment in a finitely generated division hull (§5.5). -/
theorem finiteRank_iff_le_divisionHull {G : Type u} [AddCommGroup G] (Γ : AddSubgroup G) :
    HasFiniteRank Γ ↔ ∃ Γ₀ : AddSubgroup G, AddGroup.FG Γ₀ ∧ Γ₀ ≤ Γ ∧
      ∀ x ∈ Γ, ∃ N : ℕ, 0 < N ∧ N • x ∈ Γ₀ := by sorry

/-- The point-level difference map (x₀,…,x_M) ↦ (x₁−x₀,…,x_M−x₀), with target G^M. -/
def differenceMap {G : Type u} [AddCommGroup G] (M : ℕ) :
    (Fin (M + 1) → G) →+ (Fin M → G) where
  toFun P := fun i => P i.succ - P 0
  map_zero' := by
    funext i
    simp
  map_add' := by
    intro P Q
    funext i
    simp only [Pi.add_apply]
    abel

/-- The difference map has exactly the diagonal as its kernel, including `M = 0` (§5.14). -/
theorem differenceMap_eq_zero_iff {G : Type u} [AddCommGroup G] (M : ℕ)
    (P : Fin (M + 1) → G) : differenceMap M P = 0 ↔ ∀ i, P i = P 0 := by sorry

/-- Simultaneously translating all points leaves their differences unchanged (§5.14). -/
theorem differenceMap_translate {G : Type u} [AddCommGroup G] (M : ℕ)
    (P : Fin (M + 1) → G) (a : G) :
    differenceMap M (fun i => P i + a) = differenceMap M P := by sorry

/-!
## Layer 6 and the definitions not stated here

The following README definitions need geometric or cohomological carriers beyond the native
point groups and light carriers used above.

Layer 0: GeneralizedGlobalField, extension and polarization structures,
normalized geometric projective height; generated difference presentations; weilHeight;
general neronTateHeight and neronTateForm; PointHeightMetricFamily, canonicalPointMetric,
LocalWeilFunction and neronFunction; integral models and naive/canonical subvariety heights.

Layer 1: positive-dimensional AbelianVariety.quotient; arbitrary-field fppf kummer maps
with comparison to the supplied number-field abelianKummer; function-field
localKummer_unramified; abelianHom_primaryExtension, chowImage, chowImage_constantExtension, chowImage_summationSmooth,
the K/k-trace and the strengthened diagonal_closedImmersion; TwoCovering, W2 and
order-k Selmer sets; IntegralCommutativeFormalGroup, smooth formal identity charts and
formalLogarithm. Native finite-module Selmer constructors and finite-subgroup quotients
are supplier interfaces, not replacements for these geometric inputs.

Layer 2: adelicPoints_nonempty_iff; integral models/points and GlobalFunctionFieldIntegralModel; TwistedModule and the
native projective-K-zero tensor/rank and support-filtration adapters, extending
ClassicalArithmeticCompletion §§7.23–7.24, 7.42's stable equality and additive scalar extension;
geometric adelic points and the model direct limit; Brauer pairing, brauerSet, brauerManinSet and HasObstruction; brauerZero,
brauerOne, supported cohomology, unramifiedBrauer, algebraicUnramifiedBrauer and brauerOmega;
finite-flat Brauer corestriction and zero-cycle evaluation; cyclic-algebra classes and local
invariant matrices; numberField_h3_units_zero on continuous Galois cohomology. Affine Azumaya
and scheme Brauer evaluation are imported interfaces.

Layer 3: torsor evaluation/twist/Selmer sets, descentSet, descentObstructionSet, etaleSet,
connectedSet, pglSet, etaleBrauerSet and etaleDescentSet; KDprime, UniversalNTorsor,
compatible finite torsors, minimal compatible isogenies and invariant Brauer; coflasque
enlargement and nonabelian H2 links; galoisStableSmoothProjectiveFan_exists,
torusCompactification_splitField and
torusCompactification_galoisDescent; UniversalTorsor, relativeBrauerOne and residual Sha
functional; CasselsTate.biextension_comparison (torsor/divisor and Poincaré realizations
of the supplied cohomological pairing), BrauerPic0 and BrauerPic0_n; PencilSelmerOrbit,
chart comparisons binaryForm_orientedIdeal, pencilFano_doubleClass and
pencilOrbit_integralRepresentative on the pencil, oriented-ideal and Fano carriers supplied by
ArithmeticStatisticsPartI §0.22 and ArithmeticStatisticsPartII §1.12;
pencilOrbit_congruenceCount and pencilOrbit_cuspBound compare ordinary and reciprocal-stabilizer
counts using ArithmeticStatisticsPartIII §2.17 on the full fundamental domain. Its weighted
upper bound and the quantitative Ekedahl geometric sieve of its §2.1 supply
pencilOrbit_sieveUpperBound and codimensionTwo_congruenceTail; this roadmap's
pencilOrbit_localMass supplies the particular mass comparison. The common isogeny Q invariant
and Selmer_isogenyEulerCharacteristic retain the full Sha carrier and use only finite reduced
p-primary groups for primes dividing the isogeny degree, with Q([p]) for every prime p;
biquadratic_SelmerParity and realEffectiveFraction are its applications. The function-field
place estimate langWeil_functionFieldPlace supplies uniform finite-field point counts.

SelmerIwasawaCohomology §2.12a supplies the number-field interfaces for the native
AbelianVariety.Points and AbelianVariety.torsion specializations above, together with abelianKummer,
kummerSelmerStructure, abelianSelmerGroup, abelianSha, abelian_localH1_comparison,
abelianDescent_exact and abelianSelmerGroup_finite, with all local Kummer conditions.
It supplies the antilinear real-conjugation adapter for complex uniformization: compatibility
with the exponential and its kernel lattice, Galois-equivariance on lattice torsion and
compatibility with Poincaré duality and conjugation on roots of unity. Sections 1.0a and 1.3–1.5
consume these interfaces on the native points, retaining all real two-primary conditions.
The arbitrary-field fppf map specializes to these carriers. It also supplies finite Selmer
and reduced primary carriers, finiteCotype_primaryDecomposition, KummerLocal.dual_annihilator
and KummerLocal.globalPlusLocal. Its §4.29 supplies CasselsTate and
CasselsTate.finiteCoefficient_formula, CasselsTate.isogeny_adjoint,
CasselsTate.annihilator_nTorsion, CasselsTate.left_radical, CasselsTate.right_radical and
CasselsTate.reduced_primary_perfect, without finite Sha or a polarization. The elliptic
pullback uses the supplied positive-(O) polarization and sign comparison. Sections 3.17b–d
apply those interfaces to torsor detection, Brauer evaluation and multiplication covers;
§6.3's genus-one sufficiency assumes the divisible Sha subgroup is zero, in particular when
Sha is finite.

Layer 4: good reduction outside S, shafarevichSet and ShafarevichFiniteness;
KodairaParshin covers, S-integral points and section jets. SubspaceTheorem §6.2 supplies
NumberField.exists_finset_submodule_of_approxProd_le; §4.7a transports relative products
and heights to their absolute versions with the same epsilon and projectivizes the result.

Layer 5: IsCoset, IsTorsionCoset and IsTorsionSubvariety; scheme stabilizer,
generatedByDifferences, uenoLocus, cosetFreeOpen and orthogonalComplement;
ConnectedDieudonneModule on the supplied DieudonneModule carrier, its covector/crystalline
scalar and cotangent comparisons, and formalWeight with beta>0, gamma>=0 and the lattice
sum of phi^i F^j N over integers i,j satisfying i r + j s >= 0, for r>=0, s>0 and r/s=gamma/beta;
invariant_finiteStabilizer_bijective provides geometric bijectivity of psi on X and of phi on
the difference-generated abelian subvariety when psi=phi+a preserves integral X and its full
stabilizer is finite; uniform torsion closure;
blockIndex, blockIndexLocus, projectiveCycleHeight, bounded projection presentations,
weightedGap_smallSection, weightedGap_jetLowerBound and multiblock admissible jets;
geometric difference maps, with generic birationality on geometrically integral X;
torsionEnvelope and torsionDimension on reduced geometric closed subvarieties, with inputs
over the base field geometrically reduced and extended to its algebraic closure; intersections,
finite unions and the fixed-point equalities use reduced geometric carriers, and the single-coset
criterion requires geometric integrality; essentialMinimum on geometrically integral X with
finite-extension scaling as for point heights (invariant for absolute number-field heights); ArithmeticRealForms, ArithmeticRealCurrents,
ArithmeticCycleClass with conjugation parity (-1)^(p-1) for Green currents, metrized divisor
action, arithmeticDegree and arithmeticIntersection; AdelicMetrizedLineBundle, SemipositiveAdelic, IntegrableAdelic,
adelicCycleHeight and cycleProbabilityMeasure; BergmanDensity, AdelicSectionLattice,
arithmeticEulerCharacteristic, AdelicSuccessiveMinimum and canonicalAdelicMetric.

Layer 6: IsLocallySoluble, SatisfiesHassePrinciple and SatisfiesWeakApproximation;
BombieriLangConjecture, VojtaConjecture, BrauerManinOnlyObstructionConjecture and
ShaFinitenessConjecture. The genus-classification and small-point measure theorems need the
geometric hypotheses stated in the README; Bogomolov uses geometrically integral X, and
constant sequences are generic on a geometric singleton. The curve gap argument uses
L = O(Theta + [-1]*Theta), with b_L/2 equal to the unhalved theta pairing. Its auxiliary divisor
V=d1 F1+d2 F2+d Delta' requires positive integers d1,d2,d with d1*d2>g*d^2;
sections are asserted at every sufficiently large common divisible scale after fixing the
ratios. The balancing choice retains these positivity and scale hypotheses. Class
pushforward requires proper maps with smooth generic fibre between equidimensional
arithmetic varieties, with codimension shifted by their dimension difference. The
finite-cover strong-approximation obstruction requires proper X in positive characteristic. No bare point-group signature asserts these geometric results.
-/

end TauCetiRoadmap.HeightsRationalPointsAndObstructions
