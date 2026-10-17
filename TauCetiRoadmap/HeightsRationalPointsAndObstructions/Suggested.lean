import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
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

example {Y : Type v} (f : X → Y) (h : Y → ℝ) : pullback f (mk h) = mk (h ∘ f) := rfl
example : pullback (fun _ : ℕ => (0 : ℕ)) (mk (fun n : ℕ => (n : ℝ))) = 0 := by sorry

example (h : Empty → ℝ) : mk h = 0 := by sorry
example : mk (fun n : ℕ => (-1 : ℝ)^n) = 0 := by sorry
example : mk (fun n : ℕ => (n : ℝ)) ≠ 0 := by sorry
example : mk (fun _ : ℕ => (1 : ℝ)) = mk (fun _ : ℕ => (0 : ℝ)) ∧
    mk (fun n : ℕ => (1 : ℝ) * n) ≠ mk (fun n : ℕ => (0 : ℝ) * n) := by sorry

example : mk (fun n : ℕ => (n : ℝ) + 7) = mk (fun n : ℕ => (n : ℝ)) := by sorry
example : mk (fun n : ℕ => (n : ℝ) + (-1 : ℝ)^n) =
    mk (fun n : ℕ => (n : ℝ)) := by sorry
example : mk (fun n : ℕ => 2 * (n : ℝ)) ≠ mk (fun n : ℕ => (n : ℝ)) := by sorry
example [Finite X] (h : X → ℝ) : mk h = 0 := by sorry
example : mk (fun n : ℕ => (n : ℝ) + 7) = mk (fun n : ℕ => (n : ℝ)) ∧
    (fun n : ℕ => (n : ℝ) + 7) 0 ≠ (fun n : ℕ => (n : ℝ)) 0 := by sorry

example : pullback (fun n : ℕ => 2 * n) (mk (fun n : ℕ => (n : ℝ))) =
    2 • mk (fun n : ℕ => (n : ℝ)) := by sorry
example {Y : Type v} {Z : Type w} (f : X → Y) (g : Y → Z) (h : Z → ℝ) :
    pullback (g ∘ f) (mk h) = pullback f (pullback g (mk h)) := by sorry
example : ¬ Function.Injective (pullback (fun _ : ℕ => (0 : ℕ))) := by sorry
example : Function.Injective (pullback (Prod.fst : ℕ × ℕ → ℕ)) := by sorry

end HeightClass

example {X : Type u} {Y : Type v} (e : X ≃ Y) (H : HeightClass X) :
    HeightClass.pullback e (HeightClass.pullback e.symm H) = H := by sorry

example : Northcott (fun n : ℕ => (n : ℝ) + (-1 : ℝ)^n) := by sorry
example : ¬ Northcott (fun _ : ℕ => (0 : ℝ)) := by sorry
example : ¬ Northcott (fun n : ℕ => -(n : ℝ)) := by sorry
example : Northcott (fun x : ℕ × Fin 2 => (x.1 : ℝ)) := by sorry
example : ¬ Northcott (fun x : ℕ × ℕ => (x.1 : ℝ)) := by sorry

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

end TateLimit

example : tateLimit (fun n : ℕ => 2 * n) 2 (fun n => (n : ℝ)) =
    fun n : ℕ => (n : ℝ) := by sorry
example : tateLimit (id : ℕ → ℕ) 2 (fun _ => 1) = fun _ => 0 := by sorry
example : |tateLimit (id : ℕ → ℕ) 2 (fun _ => 1) 0 - 1| = 1 := by sorry
example {F : Type u} [Field F] [AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] :
    tateLimit (fun P : W.Point => 2 • P) 4 (fun P => P.naiveHeight / 2) =
      fun P => P.canonicalHeight / 2 := by sorry

-- The expanding-factor hypothesis is necessary.
example : ¬ ∃ l : ℝ, Filter.Tendsto (fun m : ℕ => (m : ℝ))
    Filter.atTop (nhds l) := by sorry

/-- A fixed-field linear coordinate change changes projective height by a bounded amount. -/
theorem logHeight_linearChange_bounded (K : Type u) [Field K] [NumberField K]
    {n : ℕ} (T : (Fin (n + 1) → K) ≃ₗ[K] (Fin (n + 1) → K)) :
    ∃ C : ℝ, ∀ x : Fin (n + 1) → K, x ≠ 0 →
      |logHeight (T x) - logHeight x| ≤ C := by sorry

example : Set.ncard {x : Projectivization ℚ (Fin 2 → ℚ) |
    Projectivization.logHeight x ≤ Real.log 2} = 8 := by sorry

example : Set.ncard {x : Projectivization ℚ (Fin 2 → ℚ) |
    Projectivization.logHeight x = 0} = 4 := by sorry
example (F : Type u) [Field F] : Nonempty (Projectivization F (Fin 1 → F)) ∧
    Subsingleton (Projectivization F (Fin 1 → F)) := by sorry
example (x : Fin 2 → ℚ) (hx : x ≠ 0) :
    logHeight ![x 0 ^ 2, x 0 * x 1, x 1 ^ 2] = 2 * logHeight x := by sorry

-- The native height is the (2O)-height; its halved polar form is the unhalved (O)-pairing.
#check WeierstrassCurve.Affine.neronTatePairing_apply

example {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P Q : W.Point) :
    (P + Q).canonicalHeight / 2 - P.canonicalHeight / 2 - Q.canonicalHeight / 2 =
      W.neronTatePairing P Q := by sorry

example {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P : W.Point) :
    W.neronTatePairing P P = 2 * (P.canonicalHeight / 2) := by sorry

example {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P : W.Point) :
    W.neronTatePairing 0 P = 0 := by sorry

example {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] :
    (0 : W.Point).canonicalHeight / 2 = 0 := by sorry

example {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P : W.Point) :
    (2 • P).canonicalHeight / 2 = 4 * (P.canonicalHeight / 2) := by sorry

example : logHeight ![(2 : ℚ), 1] = Real.log 2 := by sorry

/-! ## Layer 1: Mordell–Weil on native abelian-variety points -/

/-- The native additive group of L-points over K, with its number-field interface supplied by
SelmerIwasawaCohomology §2.12a. -/
abbrev AbelianVariety.Points {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (L : Type u) [Field L] [Algebra K L] : Type u :=
  Additive (Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K L))) ⟶ A.toOver)

namespace AbelianVariety
variable {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)

example (P : Points A K) : (-P) + P = 0 := by simp
example (P : Points A K) : 2 • P = P + P := by simp [two_nsmul]
example (P : Points A K) : (0 : Points A K) + P = P := by simp

/-- The native point-level multiplication kernel, with its number-field interface supplied by
SelmerIwasawaCohomology §2.12a. -/
def torsion (n : ℕ) (L : Type u) [Field L] [Algebra K L] : AddSubgroup (Points A L) :=
  (nsmulAddMonoidHom n : Points A L →+ Points A L).ker

/-- Weak Mordell–Weil for a number field; n=0 is excluded. -/
theorem finite_quotient_nsmul [NumberField K] (n : ℕ) (hn : 0 < n) :
    Finite (Points A K ⧸ (nsmulAddMonoidHom n : Points A K →+ Points A K).range) := by sorry

/-- General abelian-variety Mordell–Weil over a number field. -/
theorem fg_points [NumberField K] : AddGroup.FG (Points A K) := by sorry

example (L : Type u) [Field L] [Algebra K L] : torsion A 1 L = ⊥ := by sorry
example (L : Type u) [Field L] [Algebra K L] : torsion A 0 L = ⊤ := by sorry

example (L : Type u) [Field L] [Algebra K L] (P : Points A L) :
    P ∈ torsion A 2 L ↔ P + P = 0 := by simp [torsion, two_nsmul]

end AbelianVariety


/-! ## Layer 2: adelic points -/

section Adelic
open NumberField IsDedekindDomain
variable (K : Type) [Field K] [NumberField K]
  (A : Type) [CommRing A] [Algebra K A]

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

end Adelic

example (K : Type) [Field K] [NumberField K] : Subsingleton (AdelicPoints K K) := by sorry
example : IsEmpty (AdelicPoints ℚ
    (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X ^ 2 + 1 : Polynomial ℚ)})) := by sorry

example (K : Type) [Field K] [NumberField K] :
    Nonempty (AdelicPoints K (Polynomial K)) := by sorry

example (K : Type) [Field K] [NumberField K] :
    ∃ e : AdelicPoints K (Polynomial K) ≃ₜ
        NumberField.AdeleRing (NumberField.RingOfIntegers K) K,
      ∀ x, e x = (show Polynomial K →ₐ[K]
        NumberField.AdeleRing (NumberField.RingOfIntegers K) K from x) Polynomial.X := by sorry

example (K : Type) [Field K] [NumberField K] (A : Type) [CommRing A]
    [Algebra K A] (a : A) : Continuous (fun x : AdelicPoints K A =>
      (AlgHom.toRingHom (show A →ₐ[K] NumberField.AdeleRing (NumberField.RingOfIntegers K) K from x)) a) := by sorry

example : ((1 / 2 : ℚ) : AddCircle (1 : ℚ)) + (1 / 2 : ℚ) = 0 := by sorry

/-! ## Layers 3–4: torsor descent, curve covers and integral points

Torsors, descent sets, curve models and integral points need scheme-level carriers; they are
README targets and are named in the closing comment.
-/


/-! ## Layer 5: finite rank and difference maps -/

/-- Finite rational rank, without an assumption of finite generation. -/
def HasFiniteRank (G : Type u) [AddCommGroup G] : Prop := FiniteDimensional ℚ (ℚ ⊗[ℤ] G)

/-- Finite rank is equivalent to containment in a finitely generated division hull. -/
theorem finiteRank_iff_le_divisionHull {G : Type u} [AddCommGroup G] (Γ : AddSubgroup G) :
    HasFiniteRank Γ ↔ ∃ Γ₀ : AddSubgroup G, AddGroup.FG Γ₀ ∧ Γ₀ ≤ Γ ∧
      ∀ x ∈ Γ, ∃ N : ℕ, 0 < N ∧ N • x ∈ Γ₀ := by sorry

example (r : ℕ) : HasFiniteRank (Fin r → ℤ) := by sorry
example : HasFiniteRank ℚ ∧ ¬ AddGroup.FG ℚ := by sorry
example : HasFiniteRank (ZMod 2) := by sorry
example : HasFiniteRank (ℕ →₀ ZMod 2) ∧ ¬ AddGroup.FG (ℕ →₀ ZMod 2) := by sorry
example : Finite (ZMod 2) ∧ Infinite (ℕ →₀ ZMod 2) := by sorry
example : ¬ HasFiniteRank (ℕ →₀ ℤ) := by sorry

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

example {G : Type u} [AddCommGroup G] (P Q : G) :
    differenceMap 1 ![P, Q] 0 = Q - P := rfl

example {G : Type u} [AddCommGroup G] (M : ℕ) (P : Fin (M + 1) → G) :
    differenceMap M P = 0 ↔ ∀ i, P i = P 0 := by sorry

example {G : Type u} [AddCommGroup G] (P : Fin 1 → G) :
    differenceMap 0 P = 0 := by sorry
example : differenceMap 1 ![(2 : ℤ), 5] 0 = 3 := by rfl
example {G : Type u} [AddCommGroup G] (P : G) :
    differenceMap 2 ![0, P, 2 • P] = ![P, 2 • P] := by sorry


/-!
## Layer 6 and the definitions not stated here

The following README definitions need geometric or cohomological carriers beyond the native
point groups and light carriers used above.

Layer 0: the height-class API pullback_comp and pullback_injective_of_surjective;
GeneralizedGlobalField, extension and polarization structures,
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
native projective-K-zero support-filtration adapter; geometric adelic points and the model
direct limit; Brauer pairing, brauerSet, brauerManinSet and HasObstruction; brauerZero,
brauerOne, supported cohomology, unramifiedBrauer, algebraicUnramifiedBrauer and brauerOmega;
finite-flat Brauer corestriction and zero-cycle evaluation; cyclic-algebra classes and local
invariant matrices. Affine Azumaya and scheme Brauer evaluation are imported interfaces.

Layer 3: torsor evaluation/twist/Selmer sets, descentSet, descentObstructionSet, etaleSet,
connectedSet, pglSet, etaleBrauerSet and etaleDescentSet; KDprime, UniversalNTorsor,
compatible finite torsors, minimal compatible isogenies and invariant Brauer; coflasque
enlargement and nonabelian H2 links; galoisStableSmoothProjectiveFan_exists,
torusCompactification_splitField and
torusCompactification_galoisDescent; UniversalTorsor, relativeBrauerOne and residual Sha
functional; CasselsTate.biextension_comparison (torsor/divisor and Poincaré realizations
of the supplied cohomological pairing), BrauerPic0 and BrauerPic0_n; PencilSelmerOrbit,
oriented ideals, the isogeny Q invariant and realEffectiveFraction.

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

Layer 5: HasFiniteRank.of_fg; IsCoset, IsTorsionCoset and IsTorsionSubvariety; scheme stabilizer,
generatedByDifferences, uenoLocus, cosetFreeOpen and orthogonalComplement;
ConnectedDieudonneModule on the supplied DieudonneModule carrier, its covector/crystalline
scalar and cotangent comparisons, and formalWeight; uniform torsion closure;
blockIndex, blockIndexLocus, projectiveCycleHeight, bounded projection presentations,
weightedGap_smallSection, weightedGap_jetLowerBound and multiblock admissible jets;
geometric difference maps, with generic birationality on geometrically integral X;
torsionEnvelope and torsionDimension on geometric finite unions, its single-coset criterion
on geometrically integral X, and essentialMinimum on geometrically integral X with
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
L = O(Theta + [-1]*Theta), with b_L/2 equal to the unhalved theta pairing. Class
pushforward requires proper maps with smooth generic fibre between equidimensional
arithmetic varieties, with codimension shifted by their dimension difference. The
finite-cover strong-approximation obstruction requires proper X in positive characteristic. No bare point-group signature asserts these geometric results.
-/

end TauCetiRoadmap.HeightsRationalPointsAndObstructions
