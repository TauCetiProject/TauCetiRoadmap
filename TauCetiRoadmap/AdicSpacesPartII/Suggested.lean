import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Adic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Completion.Homeomorph
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.GlobalSections
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.SheafyRing
import TauCeti.RingTheory.Huber.Padic.Field
import TauCeti.RingTheory.Huber.Completion
import TauCeti.Topology.Spectral.ProConstructible

/-!
# Foundations of adic spaces, Part II: representative target signatures

These signatures are suggested forms, not an exhaustive checklist. README.md is the definitive
specification.

Huber rings, Huber pairs, pairs of definition, restricted power series, the adic spectrum and
the category `TauCeti.AdicSpace` are Tau Ceti's. Completeness includes the Hausdorff property.
This file states the ring-level noetherian and adicness conditions, Huber's standing class of
f-adic rings (Huber 1996, (1.1.1)), the morphism classes of adic spaces (adic, finite type,
separated, proper, finite, quasi-finite, flat, unramified, smooth, étale) with their main
theorems, and the inclusion of polynomials into Tau Ceti's Tate algebras. Classical `K`-affinoid
algebras and affinoid subdomains are supplied by RigidAnalyticGeometry §§1–4; its §§6.2
and 8.3 supply rigid spaces, the comparison functor, products and the ringed-topos comparison.
Part II supplies the additional ringed-site finality and the adic morphism comparisons. The completed tensor product, continuous differentials, the spectral
seminorm and the analytification functor are README targets. R1.4 specifies general exact
module pullback and its stalk, tensor and ideal comparisons; the affinoid section comparison
for analytified associated modules and its associated-sheaf Checks belong to
AdicSpacesPartIII R3.1a. The generic spectral-limit,
Pro-category and qcqs-topos APIs are also README targets; adic-ring completions, locally spectral
spaces and maps, constructible separation and tilde-limits have prototypes below.
-/

/-!
The README also specifies interfaces on its completed-tensor, norm, continuous-differential,
rigid and analytification carriers. The names below identify those README contracts without executable prototypes; they require
the carrier constructions specified in the README.

R0.1a–R0.1b use Mathlib `isAdic_iff` and `IsAdic.isAdicComplete_iff` on the
chosen ideal. Tau Ceti's `IsAdic.isTopologicallyNilpotent_iff_mem_radical` and
`IsAdic.continuous_of_map_le_radical` supply the nilpotence and continuity criteria.
`TauCeti.IsAdic.isTopologicallyNilpotent_iff_mem_radical` and
`TauCeti.IsAdic.continuous_of_map_le_radical` are their fully qualified names.
The p-adic comparison uses the supplied `adicCompletion_padicIntegers`;
local spectrality of Spa uses `spectralSpace_spa_of_pairOfDefinition`.

R0.1–R0.2: `Huber.IsNoetherianType.completeSpace_quotient`,
`Huber.PairOfDefinition.isStrictMap_of_isNoetherianRing`,
`Huber.PairOfDefinition.completeSpace_isClosed_of_isNoetherianRing` and
`Huber.PairOfDefinition.isOpen_isAdicComplete_of_isNoetherianRing` provide quotient completeness,
strict finite-module maps, complete finite modules with closed submodules, and open complete
finite lattices, respectively, with the complete Hausdorff and noetherian-ring-of-definition
hypotheses specified there.

R0.3: `Huber.isTopologicalRing_tensorTopology`, `Huber.completedTensor_adicRing`,
`Huber.Pair.completedTensor.tmul_tmul` and `Huber.Pair.completedTensorRationalEquiv_preimage`
provide the tensor ring topology, adic-ring completion comparison, elementary-tensor formula,
and rational preimages under the two adic structure maps.
R0.4 and R0.9: `Huber.tateNorm_apply`, `Huber.tateNorm_pseudoUniformizer_mul`,
`Huber.tateNorm_hasBasis_nhds_zero` and `Huber.Affinoid.powerBoundedSubring_eq_integralClosure`
are carrier bridges to PadicFunctionalAnalysis §0.4 and RigidAnalyticGeometry §2.3, respectively,
with the chosen data and integral-presentation hypotheses in the README.

R0.7 and R0.11: `AdicSpace.affinoid_isPullback`, `AdicSpace.fibreProduct_weighted_exhaustion`
provide the sheafy tensor pullback and the weighted chart exhaustion over a stably sheafy base.
R0.13–R0.17: `Huber.Pair.Hom.IsFinite.isModuleTopology_tensorTopology`,
`Huber.Pair.Hom.IsFinite.bijective_completedTensor_tmul`,
`Huber.ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis_apply`,
`AdicSpace.Unramified.iff_closed_etale_factorisation`, `AdicSpace.Smooth.differentials_projective`,
`AdicSpace.smooth_iff_split_differentials` and `AdicSpace.Smooth.exists_etale_polydisc`
provide the finite Tate tensor comparisons, differential basis and local structure contracts,
with the noetherian or projective alternative and the standing-class hypotheses in the README.

R1: `AdicSpace.analytification.constructible_closure`,
`AdicSpace.analyticAffineSpace_globalSections_series`,
`AdicSpace.analyticAffineSpace_globalSections_ne_polynomial`,
`AdicSpace.analytification_proj_proper`, `AdicSpace.analytification.finite_iff`,
`AdicSpace.analytification.closedImmersion_iff`, `AdicSpace.analytification.separated_iff`,
`AdicSpace.rigidToAdic.separated_iff` and
`RigidSpace.isProper_iff_quasiCompact_and_isPartiallyProper` provide the closure, section-ring,
projective properness and morphism comparison contracts under their stated base hypotheses.
`RigidSpace.stalk_completion_equiv`, `RigidSpace.Sp_toLocallyGRingedSpace`,
`RigidSpace.Sp.sectionsEquiv`, `RigidSpace.Sp.map_sections`, `RigidSpace.IsInner` and
`RigidSpace.IsQuasiCompact` are bridges to the supplied rigid carriers and constructions.
-/


namespace TauCetiRoadmap.AdicSpacesPartII

open TauCeti

universe u w u₁ u₂

/-! ## Layer R0: Morphisms and admissible affinoid products -/

noncomputable section

open TensorProduct UniformSpace Topology Filter

/-! ### R0.0 Locally spectral spaces (*locally-spectral-space*) -/

/-- A topological space is *locally spectral* if it has an open cover by spectral subspaces
(ECD Definition 2.1, p. 10). -/
def IsLocallySpectralSpace (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ x : X, ∃ U : Set X, IsOpen U ∧ x ∈ U ∧ SpectralSpace U

-- Check: discrete `ℕ` is locally spectral and not quasicompact, so not spectral.
example : IsLocallySpectralSpace ℕ ∧ ¬ CompactSpace ℕ := sorry

-- Negative control: `ℝ` is not locally spectral (no nonempty open is quasicompact).
example : ¬ IsLocallySpectralSpace ℝ := sorry

-- Check `definition_IsLocallySpectralSpace_2`: the empty cover witnesses local spectrality.
example : IsLocallySpectralSpace Empty := sorry

/-- A space is spectral iff it is locally spectral, quasicompact and quasiseparated (KL15
§8.1, text after Definition 8.1.1, p. 157). -/
theorem spectralSpace_iff_isLocallySpectralSpace (X : Type u) [TopologicalSpace X] :
    SpectralSpace X ↔ IsLocallySpectralSpace X ∧ CompactSpace X ∧ QuasiSeparatedSpace X := sorry

/-- A map is *locally spectral* if it is continuous and, whenever open subspaces `U ⊆ X` and
`V ⊆ Y` are spectral and `f(U) ⊆ V`, the restriction `U → V` is a spectral map (ECD Definition 2.1,
p. 10, where this is the notion of a spectral map of locally spectral spaces). Unlike Mathlib's
global `IsSpectralMap`, it does not ask that preimages of quasicompact opens of `Y` be
quasicompact. -/
def IsLocallySpectralMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) :
    Prop :=
  Continuous f ∧ ∀ (U : Set X) (V : Set Y) (hUV : Set.MapsTo f U V), IsOpen U → IsOpen V →
    SpectralSpace U → SpectralSpace V → IsSpectralMap (Set.MapsTo.restrict f U V hUV)

-- Check `definition_IsLocallySpectralMap_1`: finite spectral opens of discrete ℕ map spectrally.
example : IsLocallySpectralMap (fun _ : ℕ ↦ (PUnit.unit : PUnit)) ∧
    ¬ IsSpectralMap (fun _ : ℕ ↦ (PUnit.unit : PUnit)) := sorry

-- Check `definition_IsLocallySpectralMap_2`: the point identity is locally spectral.
example : IsLocallySpectralMap (id : PUnit → PUnit) := sorry

-- Negative Check `definition_IsLocallySpectralMap_3`: the true fibre {0} is not open in ℝ.
example : ¬ IsLocallySpectralMap (fun x : ℝ ↦ x = 0) := sorry

-- Check `s0_1_locally_spectral_empty_map`: empty inverse images are compact open.
example (Y : Type) [TopologicalSpace Y] (f : Empty → Y) :
    IsLocallySpectralMap f ∧ IsSpectralMap f := sorry

/-- Between spectral spaces the local condition is Mathlib's global `IsSpectralMap` (ECD
Definition 2.1, p. 10). -/
theorem isLocallySpectralMap_iff_isSpectralMap {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y] {f : X → Y} :
    IsLocallySpectralMap f ↔ IsSpectralMap f := sorry

-- Negative control: the agreement needs a spectral source. The inclusion of discrete `ℕ` into its
-- one-point compactification is locally spectral (the spectral opens of `ℕ` are finite) but not
-- `IsSpectralMap`, since the preimage of the whole space is `ℕ`.
example : IsLocallySpectralMap ((↑) : ℕ → OnePoint ℕ) ∧ ¬ IsSpectralMap ((↑) : ℕ → OnePoint ℕ) :=
  sorry

-- Check: the projection `ℕ × ℕ → ℕ` of discrete spaces is locally spectral and not
-- `IsSpectralMap`, since the preimage of `{0}` is infinite.
example : IsLocallySpectralMap (Prod.fst : ℕ × ℕ → ℕ) ∧ ¬ IsSpectralMap (Prod.fst : ℕ × ℕ → ℕ) :=
  sorry

-- Negative control: `x ↦ (x ≠ ∞)` from the one-point compactification of `ℕ` to the Sierpiński
-- space is continuous between spectral spaces but not locally spectral, as the preimage of the
-- quasicompact open `{True}` is `ℕ`. It is the composite of `n ↦ 1/(n+1)`, `∞ ↦ 0` with positivity
-- `ℝ → Prop`, both locally spectral because `ℝ` has no nonempty spectral open.
example : Continuous (fun x : OnePoint ℕ ↦ x ≠ OnePoint.infty) ∧
    ¬ IsLocallySpectralMap (fun x : OnePoint ℕ ↦ x ≠ OnePoint.infty) := sorry

/-! ### R0.1a–R0.1b Adic rings and noetherian completions
(*adic-ring*, *adic-completion-noetherian*) -/

/-- A topological ring `A` is an *adic ring of finite ideal type* if its topology is the
`I`-adic topology of a finitely generated ideal `I` and `A` is `I`-adically complete and
separated (EGA I, Ch. 0, 7.1.9, p. 62). The topology is part of the data. -/
class IsAdicRing (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] : Prop where
  /-- A finitely generated ideal of definition for which `A` is complete. -/
  exists_isAdic : ∃ I : Ideal A, I.FG ∧ IsAdic I ∧ IsAdicComplete I A

namespace IsAdicRing

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]

/-- A chosen finitely generated ideal of definition. -/
def ideal [IsAdicRing A] : Ideal A :=
  Classical.choose (IsAdicRing.exists_isAdic (A := A))

theorem ideal_spec [IsAdicRing A] :
    (ideal A).FG ∧ IsAdic (ideal A) ∧ IsAdicComplete (ideal A) A :=
  Classical.choose_spec (IsAdicRing.exists_isAdic (A := A))

/-- An adic ring is a Huber ring, with pair of definition `(A, I)`. -/
instance (priority := 100) isHuberRing [IsAdicRing A] : Huber.IsHuberRing A :=
  Huber.isHuberRing_of_isAdic (ideal A) (ideal_spec A).2.1 (ideal_spec A).1

/-- The adic completion of a noetherian ring along any ideal `I`, with its `I·R̂`-adic topology,
is an adic noetherian ring (EGA I, Ch. 0, 7.3.1, p. 66). -/
theorem adicCompletion {R : Type*} [CommRing R] [IsNoetherianRing R] (I : Ideal R) :
    letI : WithIdeal (AdicCompletion I R) := ⟨I.map (algebraMap R (AdicCompletion I R))⟩
    IsAdicRing (AdicCompletion I R) ∧ IsNoetherianRing (AdicCompletion I R) := sorry

end IsAdicRing

/-- A ring complete for a finitely generated ideal `I` with `R ⧸ I` noetherian is noetherian
(EGA I, Ch. 0, 7.2.6, p. 64; Stacks, Tag 05GH). -/
theorem isNoetherianRing_of_isAdicComplete {R : Type*} [CommRing R] (I : Ideal R) (hI : I.FG)
    [IsAdicComplete I R] [IsNoetherianRing (R ⧸ I)] : IsNoetherianRing R := sorry

/-- `ℤ_p` is an adic noetherian ring with ideal of definition `(p)`. -/
example (p : ℕ) [Fact p.Prime] :
    IsAdicRing ℤ_[p] ∧ IsNoetherianRing ℤ_[p] ∧ IsAdic (Ideal.span {(p : ℤ_[p])}) := sorry

/-- Every discrete ring is adic, with ideal of definition `0`. -/
example (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]
    [DiscreteTopology R] : IsAdicRing R := sorry

/-- `ℚ_p` is not adic: its only open ideal is `ℚ_p`, whose powers do not shrink. -/
example (p : ℕ) [Fact p.Prime] : ¬ IsAdicRing ℚ_[p] := sorry

/-- A field is adic exactly for the discrete topology. -/
example (k : Type*) [Field k] [TopologicalSpace k] [IsTopologicalRing k] :
    IsAdicRing k ↔ DiscreteTopology k := sorry

/-- Completeness alone gives nothing: `k[X₀, X₁, …]` is complete for `I = 0` and is not
noetherian (here `R ⧸ I = R`). -/
example (k : Type*) [Field k] :
    IsAdicComplete (⊥ : Ideal (MvPolynomial ℕ k)) (MvPolynomial ℕ k) ∧
      ¬ IsNoetherianRing (MvPolynomial ℕ k) := sorry

namespace Huber

open TauCeti.Huber

/-! ### R0.1–R0.2 Rings of noetherian type and sheafiness
(*noetherian-type-huber-ring*, *noetherian-adic-completion*,
*topologically-finite-type-noetherian-type*, *noetherian-type-ideals-closed*,
*noetherian-rod-sheafy*, *noetherian-type-stably-sheafy*) -/

section NoetherianType

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- A Huber ring is *of noetherian type* if it has a pair of definition whose ring of definition
is noetherian, or it is a strongly noetherian Tate ring (Huber 1994, §2, Theorem 2.2, p. 524). -/
@[mk_iff isNoetherianType_iff]
class IsNoetherianType : Prop where
  /-- A noetherian ring of definition, or a strongly noetherian Tate ring. -/
  out : (∃ P : PairOfDefinition A, IsNoetherianRing P.ringOfDefinition) ∨
    (IsTateRing A ∧ IsStronglyNoetherian A)

variable {A}

/-- A noetherian ring of definition gives noetherian type. -/
theorem IsNoetherianType.of_pairOfDefinition (P : PairOfDefinition A)
    (hP : IsNoetherianRing P.ringOfDefinition) : IsNoetherianType A :=
  ⟨Or.inl ⟨P, hP⟩⟩

end NoetherianType

section NoetherianTypeTate

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]

/-- A strongly noetherian Tate ring is of noetherian type. -/
theorem IsNoetherianType.of_isStronglyNoetherian [IsStronglyNoetherian A] : IsNoetherianType A :=
  ⟨Or.inr ⟨inferInstance, inferInstance⟩⟩

/-- For a Tate ring, noetherian type is strong noetherianness (Wedhorn, Remark 6.37(3)). -/
theorem IsNoetherianType.isStronglyNoetherian : IsNoetherianType A ↔ IsStronglyNoetherian A :=
  sorry

end NoetherianTypeTate

/-! ### R0.1 Huber's standing class (*huber-standing-class*) -/

section HuberStandard

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- *Huber's standing class* (Huber 1996, (1.1.1), p. 37): `A` has a noetherian ring of
definition over which it is a finitely generated algebra, or `A` is a strongly noetherian Tate
ring, or `A` is discrete. Huber asks the first clause of the completion of `A`; for a complete
`A` the two readings agree. The unramified, smooth and étale theory of Huber 1996, §§1.6–1.7, is
developed for rings in this class. -/
@[mk_iff isHuberStandard_iff]
class IsHuberStandard : Prop where
  /-- A noetherian ring of definition over which `A` is of finite type, or a strongly noetherian
  Tate ring, or the discrete topology. -/
  out : (∃ P : PairOfDefinition A, IsNoetherianRing P.ringOfDefinition ∧
      Algebra.FiniteType P.ringOfDefinition A) ∨
    (IsTateRing A ∧ IsStronglyNoetherian A) ∨ DiscreteTopology A

variable {A}

/-- Rings in Huber's standing class are of noetherian type: in the first two clauses directly,
and a discrete ring has its prime subring, with ideal of definition `0`, as a noetherian ring of
definition. -/
theorem IsHuberStandard.isNoetherianType [IsHuberStandard A] : IsNoetherianType A := sorry

/-- Every discrete ring is in Huber's standing class (third clause), noetherian or not. -/
example [DiscreteTopology A] : IsHuberStandard A := ⟨Or.inr (Or.inr inferInstance)⟩

end HuberStandard

/-- `ℚ_p` is in Huber's standing class: it is a strongly noetherian Tate ring (BGR 5.2.6). -/
example (p : ℕ) [Fact p.Prime] : IsHuberStandard ℚ_[p] := sorry

/-- The discrete ring `ℤ[X₀, X₁, …]` is of noetherian type (its prime subring is an open
noetherian ring of definition) but is neither a noetherian ring nor strongly noetherian. -/
example :
    letI : TopologicalSpace (MvPolynomial ℕ ℤ) := ⊥
    haveI : DiscreteTopology (MvPolynomial ℕ ℤ) := ⟨rfl⟩
    ∃ _ : IsHuberRing (MvPolynomial ℕ ℤ),
      IsNoetherianType (MvPolynomial ℕ ℤ) ∧ ¬ IsNoetherianRing (MvPolynomial ℕ ℤ) ∧
        ¬ IsStronglyNoetherian (MvPolynomial ℕ ℤ) := sorry

/-- `ℂ_p` is of noetherian type (strongly noetherian, BGR 5.2.6) although no ring of definition
of `ℂ_p` is noetherian. -/
example (p : ℕ) [Fact p.Prime] :
    haveI : IsHuberRing ℂ_[p] := sorry
    IsNoetherianType ℂ_[p] ∧ ¬ ∃ P : PairOfDefinition ℂ_[p],
      IsNoetherianRing P.ringOfDefinition := sorry

section NoetherianTypeComplete

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A]

/-- The uniform completion of a noetherian adic ring is noetherian, via algebraic completion. -/
theorem isNoetherianRing_completion_of_isAdic [IsNoetherianRing A]
    (I : Ideal A) (hI : IsAdic I) (hfg : I.FG) : IsNoetherianRing (Completion A) := sorry

/-- A noetherian ring of definition remains noetherian after Huber completion. -/
theorem PairOfDefinition.isNoetherianRing_completion (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] :
    IsNoetherianRing P.completion.ringOfDefinition := sorry

/-- The Hausdorff completion of a Huber ring of noetherian type is of noetherian type
(EGA I, Ch. 0, (7.3.1); Wedhorn, proof of Proposition 6.35). -/
theorem IsNoetherianType.completion [IsNoetherianType A] :
    IsNoetherianType (Completion A) := sorry

variable [CompleteSpace A] [T2Space A]
  {B : Type*} [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
  [IsHuberRing B] [CompleteSpace B] [T2Space B]

/-- A complete Huber ring topologically of finite type over a complete ring of noetherian type is
of noetherian type (Huber 1994, Corollary 3.4(ii),(iii); Wedhorn, Proposition 6.35). -/
theorem IsNoetherianType.of_isTopologicallyFiniteType [IsNoetherianType A] {φ : A →+* B}
    (h : IsTopologicallyFiniteType φ) : IsNoetherianType B := sorry

/-- Every ideal of a complete Hausdorff ring of noetherian type is closed (Huber 1994, §2,
Lemma 2.3(ii)). -/
theorem IsNoetherianType.isClosed_ideal [IsNoetherianType A] (J : Ideal A) :
    IsClosed (J : Set A) := sorry

/-- A complete Hausdorff Huber ring of noetherian type is stably sheafy (Huber 1994, Theorem 2.2;
Wedhorn, Theorem 8.28). -/
theorem IsNoetherianType.isStablySheafy {A : Type u} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A]
    [IsNoetherianType A] : IsStablySheafyRing.{u, u} A := sorry

end NoetherianTypeComplete

/-- The Hausdorff hypothesis in `IsNoetherianType.isClosed_ideal` is needed: `ℤ` with the
indiscrete topology (pair of definition `(ℤ, (1))`) is complete, and `0` is not closed. -/
example :
    letI : TopologicalSpace ℤ := ⊤
    ¬ IsClosed ((⊥ : Ideal ℤ) : Set ℤ) := by
  let : TopologicalSpace ℤ := ⊤
  intro h
  have h1 := isClosed_iff_nhds.mp h 1 fun U hU ↦ by
    rw [_root_.nhds_top, Filter.mem_top] at hU
    exact ⟨0, by simp [hU]⟩
  simp at h1

/-- Huber's sheafiness theorem: a Huber ring with a noetherian ring of definition is sheafy
(Huber 1994, Theorem 2.2, case of a noetherian ring of definition). -/
theorem PairOfDefinition.isSheafyRing {A : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A]
    (P : PairOfDefinition A) [IsNoetherianRing P.ringOfDefinition] :
    IsSheafyRing A := sorry

/-! ### R0.1 Adic homomorphisms
(*adic-ring-homomorphism*, *topologically-finite-type-is-adic*, *spa-comap-analytic-locus*) -/

section AdicHom

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]

/-- `φ : A → B` is *adic* if there are pairs of definition `(A₀, I)` of `A` and `(B₀, J)` of `B`
with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀` (Huber 1994, §3; Wedhorn, Definition 6.23). -/
class IsAdicHom (φ : A →+* B) : Prop where
  /-- Pairs of definition `(A₀, I)`, `(B₀, J)` with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀`. -/
  exists_pairOfDefinition : ∃ (P : PairOfDefinition A) (Q : PairOfDefinition B)
    (h : ∀ a ∈ P.ringOfDefinition, φ a ∈ Q.ringOfDefinition),
    Q.idealOfDefinition = P.idealOfDefinition.map (φ.restrict _ _ h)

/-- Adic homomorphisms are continuous (Wedhorn, §6.5). -/
theorem IsAdicHom.continuous (φ : A →+* B) [IsAdicHom φ] : Continuous φ := sorry

/-- The identity of a Huber ring is adic. -/
theorem IsAdicHom.id [IsHuberRing A] : IsAdicHom (RingHom.id A) := sorry

/-- A continuous homomorphism out of a Tate ring is adic and its target is Tate
(Wedhorn, Proposition 6.25). -/
theorem IsAdicHom.of_isTateRing [IsTateRing A] [IsHuberRing B] {φ : A →+* B}
    (hφ : Continuous φ) : IsAdicHom φ ∧ IsTateRing B := sorry

/-- An adic map from a discrete Huber ring has discrete target, and the converse holds. -/
theorem IsAdicHom.of_discrete_iff [IsHuberRing A] [IsHuberRing B] [DiscreteTopology A]
    (φ : A →+* B) : IsAdicHom φ ↔ DiscreteTopology B := sorry

end AdicHom

/-- A homomorphism topologically of finite type into a complete Hausdorff Huber ring is adic
(Huber 1994, Lemma 3.3(ii); Wedhorn, Remark 8.49(2)). -/
theorem IsTopologicallyFiniteType.isAdicHom {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B] {φ : A →+* B}
    (h : IsTopologicallyFiniteType φ) : IsAdicHom φ := sorry

/-- `ℤ_p → ℚ_p` is adic. -/
example (p : ℕ) [Fact p.Prime] : IsAdicHom (algebraMap ℤ_[p] ℚ_[p]) := sorry

/-- `ℤ` is discrete and `ℤ_p` is not, so `ℤ → ℤ_p` is continuous and not adic. -/
example (p : ℕ) [Fact p.Prime] :
    Continuous (algebraMap ℤ ℤ_[p]) ∧ ¬ IsAdicHom (algebraMap ℤ ℤ_[p]) := sorry

section AnalyticPoints

open TauCeti.ValuationSpectrum

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- An adic homomorphism of Huber pairs maps analytic points to analytic points
(Wedhorn, Lemma 7.46(1)). -/
theorem IsAdicHom.spaComap_analytic [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] {S : Pair A} {T : Pair B} (φ : Pair.Hom S T) [IsAdicHom φ.toRingHom]
    (x : spa T.plus) (hx : IsAnalyticPoint x.val) : IsAnalyticPoint (φ.spaComap x).val := sorry

/-- For a complete Hausdorff target, preservation of analytic points characterises adic
homomorphisms (Wedhorn, Lemma 7.46(2)). -/
theorem isAdicHom_of_spaComap_analytic [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B]
    {S : Pair A} {T : Pair B} (φ : Pair.Hom S T)
    (hφ : ∀ x : spa T.plus, IsAnalyticPoint x.val → IsAnalyticPoint (φ.spaComap x).val) :
    IsAdicHom φ.toRingHom := sorry

/-- Adic base change preserves finite open weight families. -/
theorem IsAdicHom.isWeightFamily_image [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] [IsHuberRing B] {S : Pair A} {T : Pair B}
    (φ : Pair.Hom S T) [IsAdicHom φ.toRingHom] {n : ℕ} (M : Fin n → Set A)
    (hM : IsWeightFamily M) (hfin : ∀ i, (M i).Finite) :
    IsWeightFamily (fun i ↦ φ.toRingHom '' M i) ∧ ∀ i, (φ.toRingHom '' M i).Finite := sorry

end AnalyticPoints

/-! ### R0.13 Finite morphisms of Huber pairs (*finite-huber-pair-hom*) -/

section FiniteHom

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]

/-- A morphism `φ : (A, A⁺) → (B, B⁺)` of Huber pairs is *finite* if it is topologically of
finite type and both `A → B` and `A⁺ → B⁺` are integral (Huber 1996, (1.4.2)). -/
structure Pair.Hom.IsFinite {S : Pair A} {T : Pair B} (φ : Pair.Hom S T) : Prop where
  /-- `φ` is topologically of finite type. -/
  isTopologicallyFiniteType : IsTopologicallyFiniteType φ.toRingHom
  /-- The ring map `A → B` is integral. -/
  isIntegral : φ.toRingHom.IsIntegral
  /-- The ring map `A⁺ → B⁺` is integral. -/
  isIntegral_plus : (φ.toRingHom.restrict S.plus T.plus φ.map_mem_plus).IsIntegral

/-- `(A, A⁺) → (A, A'⁺)` with the identity ring map and `A⁺ ⊊ A'⁺` is not finite: `A'⁺` is not
integral over the integrally closed `A⁺`. -/
example {S S' : Pair A} (hSS' : S.plus < S'.plus) (φ : Pair.Hom S S')
    (hφ : φ.toRingHom = RingHom.id A) : ¬ Pair.Hom.IsFinite φ := sorry

/-- The identity of a complete Hausdorff Huber pair is finite. -/
example {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
    [IsTopologicalRing R] [IsHuberRing R] [CompleteSpace R] [T2Space R] (S : Pair R) :
    Pair.Hom.IsFinite (Pair.Hom.id S) := sorry

/-- A morphism from a complete Hausdorff Huber pair to the zero pair is finite. -/
example {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
    [IsTopologicalRing R] [IsHuberRing R] [CompleteSpace R] [T2Space R]
    [Subsingleton B] (S : Pair R) (Z : Pair B) (φ : Pair.Hom S Z) : Pair.Hom.IsFinite φ := sorry

/-- The finite map to a zero pair has full kernel and loses injectivity on a nonzero source. -/
example {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
    [IsTopologicalRing R] [IsHuberRing R] [CompleteSpace R] [T2Space R] [Nontrivial R]
    [Subsingleton B] (S : Pair R) (Z : Pair B) (φ : Pair.Hom S Z) :
    Pair.Hom.IsFinite φ ∧ RingHom.ker φ.toRingHom = ⊤ ∧
      ¬ Function.Injective φ.toRingHom := sorry

/-- The diagonal of the complete p-adic field pair is finite and omits `(1,0)`. -/
example (p : ℕ) [Fact p.Prime] [IsHuberRing (ℚ_[p] × ℚ_[p])]
    (φ : Pair.Hom (Pair.powerBounded ℚ_[p]) (Pair.powerBounded (ℚ_[p] × ℚ_[p])))
    (hφ : ∀ a, φ.toRingHom a = (a,a)) :
    Pair.Hom.IsFinite φ ∧ φ.toRingHom.Finite ∧
      (1,0) ∉ Set.range φ.toRingHom := sorry

end FiniteHom

/-! ### R0.9 The polynomial inclusion into Tate algebras

RigidAnalyticGeometry §1.1 supplies classical `K`-affinoid algebras through README R0.9’s
carrier bridge. RestrictedPowerSeries §6.2 supplies the comparison for complete normed
coefficients. The polynomial map below uses arbitrary nonarchimedean coefficient rings;
the disc Checks of R0.16–R0.17 use this general inclusion. -/

/-- The canonical polynomial homomorphism into the separated completion of the restricted
power-series ring; it is injective when `A` is Hausdorff. -/
def TateAlgebra.ofMvPolynomial (A : Type*) [CommRing A] [TopologicalSpace A]
    [NonarchimedeanRing A] (n : ℕ) :
    MvPolynomial (Fin n) A →+* restrictedMvPowerSeriesCompletion n A :=
  (UniformSpace.Completion.coeRingHom).comp
    (weightedPolynomialHom (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight)

/-- Over a Hausdorff coefficient ring the canonical completed polynomial map is injective. -/
theorem TateAlgebra.ofMvPolynomial_injective (A : Type*) [CommRing A] [TopologicalSpace A]
    [NonarchimedeanRing A] [T2Space A] (n : ℕ) :
    Function.Injective (TateAlgebra.ofMvPolynomial A n) := sorry

/-- With no variables, the polynomial map is the completion image of its constant coefficient. -/
example (K : Type*) [CommRing K] [TopologicalSpace K] [NonarchimedeanRing K]
    (q : MvPolynomial (Fin 0) K) :
    letI := IsTopologicalAddGroup.rightUniformSpace K
    letI : IsUniformAddGroup K := isUniformAddGroup_of_addCommGroup
    restrictedMvPowerSeriesCompletionFinZeroEquiv (TateAlgebra.ofMvPolynomial K 0 q) =
      UniformSpace.Completion.coeRingHom (MvPolynomial.constantCoeff q) := sorry

/-- Distinct polynomial coordinates stay distinct in the completed bidisc. -/
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] :
    TateAlgebra.ofMvPolynomial K 2 (MvPolynomial.X 0) ≠
      TateAlgebra.ofMvPolynomial K 2 (MvPolynomial.X 1) := sorry

/-- The completed polynomial map preserves the nonzero difference of the two coordinate powers. -/
example (p : ℕ) [Fact p.Prime] :
    TateAlgebra.ofMvPolynomial ℚ_[p] 2 (MvPolynomial.X 0 ^ 2 - MvPolynomial.X 1 ^ 3) ≠ 0 ∧
    TateAlgebra.ofMvPolynomial ℚ_[p] 2 (MvPolynomial.X 0 ^ 2 - MvPolynomial.X 1 ^ 3) =
      TateAlgebra.ofMvPolynomial ℚ_[p] 2 (MvPolynomial.X 0) ^ 2 -
        TateAlgebra.ofMvPolynomial ℚ_[p] 2 (MvPolynomial.X 1) ^ 3 := sorry

/-- Indiscrete coefficients can collapse under the separated polynomial completion. -/
example :
    letI : TopologicalSpace ℤ := ⊤
    haveI : NonarchimedeanRing ℤ := sorry
    TateAlgebra.ofMvPolynomial ℤ 0 0 = TateAlgebra.ofMvPolynomial ℤ 0 1 := sorry

end Huber

/-! ### R0.7 Valuations on tensor products (*valuation-amalgamation*) -/

namespace ValuationSpectrum

open TauCeti.ValuationSpectrum

/-- Valuations on `B` and `C` with the same restriction to `A` are the restrictions of one
valuation on `B ⊗[A] C` (Huber 1994, proof of Lemma 3.9(i); Wedhorn, proof of Proposition 8.63). -/
theorem exists_amalgamation {A B C : Type*} [CommRing A] [CommRing B] [CommRing C] [Algebra A B]
    [Algebra A C] (y : ValuationSpectrum B) (x : ValuationSpectrum C)
    (h : comap (algebraMap A B) y = comap (algebraMap A C) x) :
    ∃ v : ValuationSpectrum (B ⊗[A] C),
      comap Algebra.TensorProduct.includeLeftRingHom v = y ∧
        comap (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom v = x := sorry

end ValuationSpectrum

/-! ### R0.6, R0.16 Affinoid-level cores of the morphism classes
(*plus-weakly-finite-type*, *unramified-morphism*, *smooth-morphism*,
*differentials-unramified-smooth-etale*, *lifting-test-agreement*) -/

namespace AdicSpace

open TauCeti.Huber

/-- `f : (A, A⁺) → (B, B⁺)` is of *+weakly finite type* if it is topologically of finite type
and `B⁺` is the integral closure of the subring generated by `f(A⁺)`, a finite set and `B°°`
(Huber 1996, Definition 1.2.1(ii)). -/
def LocallyOfPlusWeaklyFiniteType_affinoid {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] {S : Pair A} {T : Pair B} (f : Pair.Hom S T) : Prop :=
  IsTopologicallyFiniteType f.toRingHom ∧
    ∃ E : Finset B, T.plus = (integralClosure
      (Subring.closure (f.toRingHom '' S.plus ∪ ↑E ∪ {b : B | IsTopologicallyNilpotent b}))
        B).toSubring

section InfinitesimalLifting


variable {A : Type u₁} {B : Type u₂} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
  [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A] [CommRing B] [UniformSpace B]
  [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B]
  {S : Pair A} {T : Pair B}

/-- Uniqueness of lifts: two morphisms `(B, B⁺) → (C, C⁺)` under `(A, A⁺)` that agree modulo a
closed square-zero ideal of a complete Huber pair `(C, C⁺)` are equal. This is the
complete-pair, closed-ideal specialisation of the test of Huber 1996, Definition 1.6.5, which
ranges over all affinoid rings and all ideals of square zero: Tau Ceti's quotient pair by a
non-closed ideal is not Hausdorff, and maps into it are not morphisms to Huber's `Spa(C/I)`,
which is formed from the completion. The two tests are not identified here. -/
def Unramified_affinoid (φ : Pair.Hom S T) : Prop :=
  ∀ (C : Type w) [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] (U : Pair C) (I : Ideal C),
    IsClosed (I : Set C) → I ^ 2 = ⊥ → ∀ g₁ g₂ : Pair.Hom T U, g₁.comp φ = g₂.comp φ →
      (Pair.quotientHom U I).comp g₁ = (Pair.quotientHom U I).comp g₂ → g₁ = g₂

/-- Existence of lifts across closed square-zero ideals of complete Huber pairs: the
complete-pair, closed-ideal specialisation of the test of Huber 1996, Definition 1.6.5 (all
affinoid rings, all ideals of square zero); the two tests are not identified here. -/
def Smooth_affinoid (φ : Pair.Hom S T) : Prop :=
  ∀ (C : Type w) [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] (U : Pair C) (I : Ideal C),
    IsClosed (I : Set C) → I ^ 2 = ⊥ → ∀ (a : Pair.Hom S U) (b : Pair.Hom T (U.quotient I)),
      (Pair.quotientHom U I).comp a = b.comp φ →
        ∃ g : Pair.Hom T U, g.comp φ = a ∧ (Pair.quotientHom U I).comp g = b

/-- Existence and uniqueness of lifts across closed square-zero ideals of complete Huber pairs:
the complete-pair, closed-ideal specialisation of the test of Huber 1996, Definition 1.6.5 (all
affinoid rings, all ideals of square zero); the two tests are not identified here. -/
def Etale_affinoid (φ : Pair.Hom S T) : Prop :=
  ∀ (C : Type w) [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] (U : Pair C) (I : Ideal C),
    IsClosed (I : Set C) → I ^ 2 = ⊥ → ∀ (a : Pair.Hom S U) (b : Pair.Hom T (U.quotient I)),
      (Pair.quotientHom U I).comp a = b.comp φ →
        ∃! g : Pair.Hom T U, g.comp φ = a ∧ (Pair.quotientHom U I).comp g = b

/-- The identity has all three lifting properties. -/
example : Unramified_affinoid (Pair.Hom.id S) ∧ Smooth_affinoid (Pair.Hom.id S) ∧
    Etale_affinoid (Pair.Hom.id S) := sorry

/-- The quotient by a nonzero closed square-zero ideal is unramified but neither smooth nor
étale: the identity of `A` does not factor through `A ⧸ I`. -/
example (I : Ideal A) (hI : IsClosed (I : Set A)) (hI2 : I ^ 2 = ⊥) (hne : I ≠ ⊥) :
    letI : UniformSpace (A ⧸ I) := IsTopologicalAddGroup.rightUniformSpace (A ⧸ I)
    haveI : IsUniformAddGroup (A ⧸ I) := isUniformAddGroup_of_addCommGroup
    haveI : CompleteSpace (A ⧸ I) := sorry
    haveI : T2Space (A ⧸ I) := sorry
    Unramified_affinoid.{u₁, u₁, u₁} (A := A) (B := A ⧸ I) (Pair.quotientHom S I) ∧
      ¬ Smooth_affinoid.{u₁, u₁, u₁} (A := A) (B := A ⧸ I) (Pair.quotientHom S I) ∧
      ¬ Etale_affinoid.{u₁, u₁, u₁} (A := A) (B := A ⧸ I) (Pair.quotientHom S I) := sorry

/-- The closed unit disc over `ℚ_p` is smooth and not unramified over the point. -/
example (p : ℕ) [Fact p.Prime]
    (f : Pair.Hom (Pair.powerBounded ℚ_[p])
      (Pair.powerBounded (restrictedMvPowerSeriesCompletion 1 ℚ_[p])))
    (hf : f.toRingHom = algebraMap ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :
    Smooth_affinoid f ∧ ¬ Unramified_affinoid f ∧ ¬ Etale_affinoid f := sorry

end InfinitesimalLifting

/-! ### R0.6 Affinoid charts, adic morphisms and the finite-type classes
(*adic-morphism*, *finite-type-morphism-classes*, *locally-finite-presentation*,
*locally-noetherian-adic-space*, *locally-huber-standard*) -/

open CategoryTheory Limits TopologicalSpace Opposite TauCeti.ValuationSpectrum


/-- A complete sheafy affinoid presentation `(A, A⁺)` with a pair of definition inside `A⁺`. -/
structure Affinoid where
  /-- The complete Huber ring `A`. -/
  ring : Type w
  [commRing : CommRing ring]
  [uniformSpace : UniformSpace ring]
  [uniformAdd : IsUniformAddGroup ring]
  [topologicalRing : IsTopologicalRing ring]
  [huberRing : IsHuberRing ring]
  [complete : CompleteSpace ring]
  [hausdorff : T2Space ring]
  /-- The Huber pair `(A, A⁺)`. -/
  pair : Pair ring
  /-- A pair of definition of `A`. -/
  basis : PairOfDefinition ring
  basis_le : basis.ringOfDefinition ≤ pair.plus
  /-- The structure presheaf of `Spa(A, A⁺)` is a sheaf. -/
  sheafy : TauCeti.PreAdicSpace.isSheafy
    (presentationLimitPreAdicSpace basis pair.plus
      pair.isRingOfIntegralElements.isPowerBounded_of_mem basis_le)

attribute [instance] Affinoid.commRing Affinoid.uniformSpace Affinoid.uniformAdd
  Affinoid.topologicalRing Affinoid.huberRing Affinoid.complete Affinoid.hausdorff

/-- The separated completion of a sheafy Huber pair provides a complete Hausdorff affinoid
presentation, with the closure of the image plus ring and the completed pair of definition
(Wedhorn, Remarks 6.7–6.8 and Proposition 7.48). -/
def Affinoid.ofSheafyCompletion {R : Type w} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsHuberRing R]
    (Q : Pair R) (P : PairOfDefinition R) (hP : P.ringOfDefinition ≤ Q.plus)
    (hR : IsSheafyRing R) : Affinoid.{w} := by
  let Qhat : Pair (Completion R) :=
    { plus := completionPlus Q.plus
      isRingOfIntegralElements := by
        rw [completionPlus_def]
        exact Q.isRingOfIntegralElements.completion }
  have hP' : P.completion.ringOfDefinition ≤ Qhat.plus := by
    rw [PairOfDefinition.completion_ringOfDefinition]
    change (P.ringOfDefinition.map Completion.coeRingHom).topologicalClosure ≤
      completionPlus Q.plus
    rw [completionPlus_def]
    apply Subring.topologicalClosure_mono
    rintro x ⟨r, hr, rfl⟩
    exact ⟨r, hP hr, rfl⟩
  exact
    { ring := Completion R
      pair := Qhat
      basis := P.completion
      basis_le := hP'
      sheafy := (isSheafy_presentationLimitPreAdicSpace_iff _ _ _ _).mpr
        ((hR.isSheafyForEveryPresentation_completionPlus Q.isRingOfIntegralElements).isSheaf
          P.completion hP') }

/-- The affinoid adic space `Spa(A, A⁺)`. -/
def Affinoid.spa (A : Affinoid.{w}) : TauCeti.AdicSpace.{w} :=
  ⟨presentationLimitPreAdicSpace A.basis A.pair.plus
      A.pair.isRingOfIntegralElements.isPowerBounded_of_mem A.basis_le,
    A.sheafy, (isPreAdic_presentationLimitPreAdicSpace _ _ _ _).isLocallyAffinoid⟩

/-- The canonical map from `A` to the global sections of `Spa(A, A⁺)`. -/
abbrev Affinoid.coeff (A : Affinoid.{w}) : A.ring →+*
    A.spa.obj.toRingPresheafedSpace.presheaf.obj (op ⊤) :=
  (toPresentationLimit (P := A.basis) A.pair.plus ⊤).hom.val

/-- `g : Spa(B, B⁺) → Spa(A, A⁺)` induces `φ : (A, A⁺) → (B, B⁺)` on global sections. -/
def Affinoid.IsInducedBy {A B : Affinoid.{w}} (g : B.spa ⟶ A.spa)
    (φ : Pair.Hom A.pair B.pair) : Prop :=
  ∀ a : A.ring, (TauCeti.PreAdicSpace.toRingPresheafedSpaceHom g.hom.toHom).c.app (op ⊤)
    (A.coeff a) = B.coeff (φ.toRingHom a)

/-- A complete sheafy affinoid has precisely its coefficient ring as global sections. -/
example (A : Affinoid.{w}) : Function.Bijective A.coeff := sorry

/-- The zero coefficient ring gives an empty spectrum and singleton global sections. -/
example (A : Affinoid.{w}) [Subsingleton A.ring] :
    IsEmpty A.spa.obj ∧ Subsingleton (A.spa.obj.toRingPresheafedSpace.presheaf.obj (op ⊤)) := sorry

/-- The identity pair map induces the identity morphism of the affinoid. -/
example (A : Affinoid.{w}) : Affinoid.IsInducedBy (𝟙 A.spa) (Pair.Hom.id A.pair) := sorry

/-- Composition of affinoid morphisms composes their coefficient homomorphisms. -/
example (A B C : Affinoid.{w}) (φ : Pair.Hom A.pair B.pair) (ψ : Pair.Hom B.pair C.pair)
    (f : B.spa ⟶ A.spa) (g : C.spa ⟶ B.spa)
    (hf : Affinoid.IsInducedBy f φ) (hg : Affinoid.IsInducedBy g ψ) :
    Affinoid.IsInducedBy (g ≫ f) (ψ.comp φ) := sorry

/-- Equal affinoid morphisms have equal induced coefficient homomorphisms. -/
example (A B : Affinoid.{w}) (φ ψ : Pair.Hom A.pair B.pair) (f : B.spa ⟶ A.spa)
    (hφ : Affinoid.IsInducedBy f φ) (hψ : Affinoid.IsInducedBy f ψ) :
    φ.toRingHom = ψ.toRingHom := sorry

/-- Sections over the empty open form the zero ring. -/
example (X : TauCeti.AdicSpace.{w}) :
    Subsingleton (X.obj.toRingPresheafedSpace.presheaf.obj (op ⊥)) := sorry

/-- Restriction identifies sections on two disjoint opens with the product of their sections. -/
example (X : TauCeti.AdicSpace.{w}) (U V : Opens X.obj) (hUV : Disjoint U V) :
    Function.Bijective (fun s : X.obj.toRingPresheafedSpace.presheaf.obj (op (U ⊔ V)) ↦
      (X.obj.toRingPresheafedSpace.presheaf.map (homOfLE le_sup_left).op s,
        X.obj.toRingPresheafedSpace.presheaf.map (homOfLE le_sup_right).op s)) := sorry

/-- An affinoid chart: an open immersion of an affinoid adic space. -/
structure Chart (X : TauCeti.AdicSpace.{w}) where
  /-- The affinoid presentation. -/
  affinoid : Affinoid.{w}
  /-- The open immersion. -/
  ι : affinoid.spa ⟶ X
  isOpenImmersion : TauCeti.PreAdicSpace.IsOpenImmersion ι.hom

/-- A chart of a morphism: charts of source and target, a morphism between them that induces a
morphism of Huber pairs on global sections, and the commuting square. -/
structure HomChart {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) where
  /-- The source chart. -/
  source : Chart X
  /-- The target chart. -/
  target : Chart Y
  /-- The restriction of `f` to the charts. -/
  map : source.affinoid.spa ⟶ target.affinoid.spa
  /-- The coordinate homomorphism. -/
  ringHom : Pair.Hom target.affinoid.pair source.affinoid.pair
  isInducedBy : Affinoid.IsInducedBy map ringHom
  commutes : source.ι ≫ f = map ≫ target.ι

/-- An affinoid has an identity chart with its original presentation. -/
example (A : Affinoid.{w}) :
    ∃ c : Chart A.spa, c.affinoid = A ∧ HEq c.ι (𝟙 A.spa) := sorry

/-- Every adic space has an empty affinoid chart. -/
example (X : TauCeti.AdicSpace.{w}) :
    ∃ c : Chart X, IsEmpty c.affinoid.spa.obj := sorry

/-- A chart inclusion is injective on valuation points. -/
example (X : TauCeti.AdicSpace.{w}) (c : Chart X) : Function.Injective c.ι.hom.base := by
  let := c.isOpenImmersion
  exact c.ι.hom.isOpenEmbedding.injective

/-- The identity of an affinoid has a morphism chart with equal embeddings and full image. -/
example (A : Affinoid.{w}) : ∃ c : HomChart (𝟙 A.spa),
    HEq c.source.ι c.target.ι ∧ Set.range c.source.ι.hom.base = Set.univ := sorry

/-- An induced affinoid map has a morphism chart whose two charts cover the whole spectra. -/
example (A B : Affinoid.{w}) (φ : Pair.Hom A.pair B.pair) (f : B.spa ⟶ A.spa)
    (hf : Affinoid.IsInducedBy f φ) : ∃ c : HomChart f,
      Set.range c.source.ι.hom.base = Set.univ ∧
      Set.range c.target.ι.hom.base = Set.univ := sorry

/-- A morphism chart commutes on every valuation point. -/
example {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (c : HomChart f)
    (x : c.source.affinoid.spa.obj) :
    f.hom.base (c.source.ι.hom.base x) = c.target.ι.hom.base (c.map.hom.base x) := by
  exact congrArg (fun g ↦ g.hom.base x) c.commutes

/-- `X` is *locally noetherian* if it is covered by charts of noetherian type
(this roadmap's noetherian-type chart convention; Wedhorn, Corollary 8.35(a)–(b),
for the underlying class and its stable sheafiness). -/
def IsLocallyNoetherian (X : TauCeti.AdicSpace.{w}) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧
    Huber.IsNoetherianType c.affinoid.ring

/-- Noetherian-type affinoid charts form a neighbourhood basis on a locally noetherian space. -/
theorem IsLocallyNoetherian.affinoid_basis (X : TauCeti.AdicSpace.{w})
    (hX : IsLocallyNoetherian X) (U : Opens X.obj) (x : X.obj) (hx : x ∈ U) :
    ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧
      Set.range c.ι.hom.base ⊆ (U : Set X.obj) ∧ Huber.IsNoetherianType c.affinoid.ring := sorry

/-- `X` is *locally Huber-standard* if it is covered by charts whose coordinate rings lie in
Huber's standing class `Huber.IsHuberStandard` (Huber 1996, (1.1.1)). -/
def IsLocallyHuberStandard (X : TauCeti.AdicSpace.{w}) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧
    Huber.IsHuberStandard c.affinoid.ring

/-- `X` is *analytic* if every point has a Tate affinoid neighbourhood (Huber 1996, §1.1). -/
def IsAnalytic (X : TauCeti.AdicSpace.{w}) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧ IsTateRing c.affinoid.ring

/-- `f` is *adic* if it is chart-locally given by adic homomorphisms (Huber 1994, §3, p. 532;
Huber 1996, §1.2). -/
def IsAdic {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    Huber.IsAdicHom c.ringHom.toRingHom

/-- `f` is *locally of weakly finite type* (Wedhorn, Definition 8.48(1); Huber 1996, Definition
1.2.1). -/
def LocallyOfWeaklyFiniteType {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    IsTopologicallyFiniteType c.ringHom.toRingHom

/-- `f` is *locally of +weakly finite type* (Huber 1996, Definition 1.2.1(ii)). -/
def LocallyOfPlusWeaklyFiniteType {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    LocallyOfPlusWeaklyFiniteType_affinoid c.ringHom

/-- Preimages of quasi-compact opens are quasi-compact. -/
def QuasiCompact {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ U : Opens Y.obj, IsCompact (U : Set Y.obj) → IsCompact (f.hom.base ⁻¹' (U : Set Y.obj))

/-- Topological finite type of complete pairs: a continuous open surjection from a completed
weighted restricted power series ring, with `B⁺` the integral closure of the closure of the
subring generated by `φ(A⁺)` and the weighted variables (Huber 1994, §3, p. 535;
AdicSpaces §5.2). -/
def IsTopologicallyFiniteTypePair {A B : Affinoid.{w}} (φ : Pair.Hom A.pair B.pair) : Prop :=
  ∃ (n : ℕ) (M : Fin n → Set A.ring) (hM : IsWeightFamily M),
    (∀ i, (M i).Finite) ∧
    ∃ θ : UniformSpace.Completion (weightedRestrictedSubring M hM) →+* B.ring,
      Continuous θ ∧ IsOpenQuotientMap θ ∧
      (∀ a, θ (UniformSpace.Completion.coeRingHom (weightedC M hM a)) = φ.toRingHom a) ∧
      B.pair.plus = (integralClosure
        (Subring.topologicalClosure (Subring.closure
          (φ.toRingHom '' (A.pair.plus : Set A.ring) ∪
            {b | ∃ (i : Fin n) (m : A.ring), m ∈ M i ∧ b =
              θ (UniformSpace.Completion.coeRingHom
                (weightedPolynomialHom M hM (MvPolynomial.C m * MvPolynomial.X i)))})))
        B.ring).toSubring

/-- The identity pair map has a zero-variable finite-type presentation, including its plus ring. -/
example (A : Affinoid.{w}) : IsTopologicallyFiniteTypePair (Pair.Hom.id A.pair) := sorry

/-- Finiteness of a pair map supplies its topological finite-type presentation. -/
example (A B : Affinoid.{w}) (φ : Pair.Hom A.pair B.pair)
    (hφ : Huber.Pair.Hom.IsFinite φ) : IsTopologicallyFiniteTypePair φ := sorry

/-- `f` is *locally of finite type* (Huber 1994, §3, p. 535). -/
def LocallyOfFiniteType {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    IsTopologicallyFiniteTypePair c.ringHom

/-- `f` is *locally of finite presentation*: finite type, witnessed on a target chart in Huber's
standing class (1.1.1), and finitely presented over discrete target charts (Huber 1996, Definition
1.2.1(v)). Huber's definition quantifies over the affinoid charts of his adic spaces, all of which
are in the class; demanding the witness chart to be in the class keeps that reading. Without it the
discrete clause can be switched off by a non-discrete, non-standard chart such as the whole of
`Spa(ℤ_p × E)` for `E` the eventually constant `𝔽_p`-sequences. -/
def LocallyOfFinitePresentation {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    Huber.IsHuberStandard c.target.affinoid.ring ∧
    IsTopologicallyFiniteTypePair c.ringHom ∧
      (DiscreteTopology c.target.affinoid.ring → c.ringHom.toRingHom.FinitePresentation)

/-- The standing-class clause is a condition on the base: if the identity of `S` is locally of
finite presentation then `S` is locally Huber-standard, since the target chart of a witness for
the identity also contains the point (the chart square commutes). -/
example (S : TauCeti.AdicSpace.{w}) (h : LocallyOfFinitePresentation (𝟙 S)) :
    IsLocallyHuberStandard S := by
  intro s
  obtain ⟨c, ⟨t, rfl⟩, hstd, -, -⟩ := h s
  refine ⟨c.target, ⟨c.map.hom.base t, ?_⟩, hstd⟩
  have hc := congrArg (fun φ => φ.hom.base t) c.commutes
  simpa using hc.symm

/-- Cancellation of local finite presentation on locally Huber-standard spaces
(Huber 1996, Proposition 1.6.7(iii); scheme analogue: Stacks, Tag 02FV). -/
theorem LocallyOfFinitePresentation.of_comp {X Y Z : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) (g : Y ⟶ Z) (hX : IsLocallyHuberStandard X)
    (hY : IsLocallyHuberStandard Y) (hZ : IsLocallyHuberStandard Z)
    (hfg : LocallyOfFinitePresentation (f ≫ g)) (hg : LocallyOfFiniteType g) :
    LocallyOfFinitePresentation f := sorry

/-- `X` is covered by charts with stably sheafy coordinate rings. -/
def HasStablySheafyCharts (X : TauCeti.AdicSpace.{w}) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧
    IsStablySheafyRing.{w, w} c.affinoid.ring

/-- A morphism of affinoids induced by `φ` is adic exactly when `φ` is (Huber 1994, §3). -/
theorem IsAdic.iff_isAdicHom {A B : Affinoid.{w}} (g : B.spa ⟶ A.spa)
    (φ : Pair.Hom A.pair B.pair) (hg : Affinoid.IsInducedBy g φ) :
    IsAdic g ↔ Huber.IsAdicHom φ.toRingHom := sorry

/-- Every morphism into an analytic adic space is adic (Huber 1996, §1.2; Wedhorn,
Proposition 6.25). -/
theorem IsAdic.of_isAnalytic {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (hY : IsAnalytic Y) :
    IsAdic f := sorry

/-- Local weak finite type implies adic (Huber 1996, §1.2, after Definition 1.2.1). -/
theorem LocallyOfWeaklyFiniteType.isAdic {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : LocallyOfWeaklyFiniteType f) : IsAdic f := sorry

/-- Local finite type implies local +weakly finite type (Huber 1996, §1.2, after Definition
1.2.1). -/
theorem LocallyOfFiniteType.locallyOfPlusWeaklyFiniteType {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) (hf : LocallyOfFiniteType f) : LocallyOfPlusWeaklyFiniteType f := sorry

/-- Over an analytic, locally Huber-standard base, finite presentation is finite type (Huber 1996,
Definition 1.2.1(v)); the standing-class clause is then witnessed on every chart. -/
theorem locallyOfFinitePresentation_iff_of_isAnalytic {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) (hY : IsAnalytic Y) (hY' : IsLocallyHuberStandard Y) :
    LocallyOfFinitePresentation f ↔ LocallyOfFiniteType f :=
  sorry

/-- `Spa` of a complete pair of noetherian type is locally noetherian (Huber 1994, §3). -/
theorem IsLocallyNoetherian.spa (A : Affinoid.{w}) [Huber.IsNoetherianType A.ring] :
    IsLocallyNoetherian A.spa := sorry

/-- Noetherian type ascends along local weak finite type (Huber 1994, 3.4(ii)–(iii)). -/
theorem IsLocallyNoetherian.of_locallyOfWeaklyFiniteType {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) (hf : LocallyOfWeaklyFiniteType f) (hY : IsLocallyNoetherian Y) :
    IsLocallyNoetherian X := sorry

/-- Locally noetherian adic spaces have stably sheafy charts (Huber 1994, Theorem 2.2; Wedhorn,
Definition 8.54). -/
theorem IsLocallyNoetherian.isStablySheafy {X : TauCeti.AdicSpace.{w}}
    (hX : IsLocallyNoetherian X) : HasStablySheafyCharts X := sorry

/-- Locally Huber-standard adic spaces are locally noetherian. -/
theorem IsLocallyHuberStandard.isLocallyNoetherian {X : TauCeti.AdicSpace.{w}}
    (hX : IsLocallyHuberStandard X) : IsLocallyNoetherian X :=
  fun x ↦ (hX x).imp fun _ hc ↦
    ⟨hc.1, @Huber.IsHuberStandard.isNoetherianType _ _ _ _ _ hc.2⟩

/-- `Spa` of a complete pair in Huber's standing class is locally Huber-standard. -/
theorem IsLocallyHuberStandard.spa (A : Affinoid.{w}) [Huber.IsHuberStandard A.ring] :
    IsLocallyHuberStandard A.spa := sorry

/-- Local finite presentation includes local finite type (Huber 1996, §1.2, after Definition
1.2.1). -/
theorem LocallyOfFinitePresentation.locallyOfFiniteType {X Y : TauCeti.AdicSpace.{w}}
    {f : X ⟶ Y} (hf : LocallyOfFinitePresentation f) : LocallyOfFiniteType f :=
  fun x ↦ (hf x).imp fun _ hc ↦ ⟨hc.1, hc.2.2.1⟩

/-! ### R0.7 Fibre products
(*fibre-products-existence*, *fibre-product-points*, *base-change-stability*) -/

/-- Fibre products exist when `f` is locally of finite type, or locally of weakly finite type and
`g` adic, and `Y` has stably sheafy charts (Huber 1994, Proposition 3.7; Huber 1996, Proposition
1.2.2). -/
theorem hasPullback_of_finiteType {X Y S : TauCeti.AdicSpace.{w}}
    (f : X ⟶ S) (g : Y ⟶ S) (hY : HasStablySheafyCharts Y)
    (hf : LocallyOfFiniteType f ∨ (LocallyOfWeaklyFiniteType f ∧ IsAdic g)) :
    HasPullback f g := sorry

/-- Compatible pairs of points lift to the fibre product; the lift need not be unique
(Huber 1996, Corollary 1.2.3(iii)(d)). -/
theorem exists_pullback_point {X Y S Z : TauCeti.AdicSpace.{w}} (f : X ⟶ S) (g : Y ⟶ S)
    (p : Z ⟶ X) (q : Z ⟶ Y) (hs : IsPullback p q f g) (hf : LocallyOfWeaklyFiniteType f)
    (hg : IsAdic g) (hY : HasStablySheafyCharts Y) (x : X.obj) (y : Y.obj)
    (hxy : f.hom.base x = g.hom.base y) :
    ∃ z : Z.obj, p.hom.base z = x ∧ q.hom.base z = y := sorry

/-- Adicness is stable under base change along a morphism locally of weakly finite type (Huber
1996, Corollary 1.2.3(iii)(a); Wedhorn, Remark 8.57(1), with the roles of `f` and `g` exchanged). -/
theorem IsAdic.baseChange {X Y Z W : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Z ⟶ Y)
    (p : W ⟶ X) (q : W ⟶ Z) (hs : IsPullback p q f g) (hf : IsAdic f)
    (hg : LocallyOfWeaklyFiniteType g) (hX : HasStablySheafyCharts X) : IsAdic q := sorry

/-- Local weak finite type is stable under adic base change from a space with stably sheafy charts
(Huber 1996, Corollary 1.2.3(iii)(a); Wedhorn, Remark 8.57(1)). -/
theorem LocallyOfWeaklyFiniteType.baseChange {X Y Z W : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (g : Z ⟶ Y) (p : W ⟶ X) (q : W ⟶ Z) (hs : IsPullback p q f g)
    (hf : LocallyOfWeaklyFiniteType f) (hg : IsAdic g) (hZ : HasStablySheafyCharts Z) :
    LocallyOfWeaklyFiniteType q := sorry

/-- Base change along the identity: the fibre product over the identity is the source. -/
example {X S Z : TauCeti.AdicSpace.{w}} (f : X ⟶ S)
    (p : Z ⟶ X) (q : Z ⟶ S) (hs : IsPullback p q f (𝟙 S)) (x : X.obj) :
    ∃! z : Z.obj, p.hom.base z = x ∧ q.hom.base z = f.hom.base x := sorry

/-! ### R0.8 Closed immersions and the diagonal
(*closed-adic-subspaces-and-embeddings*, *diagonal-locally-closed*) -/

/-- A closed immersion is affinoid-locally an open quotient map of Huber pairs, with the quotient
plus ring and the whole inverse image as source (AdicSpaces §5.1; Huber 1996, (1.4.1)). -/
def IsClosedImmersion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ y : Y.obj, ∃ c : HomChart f, y ∈ Set.range c.target.ι.hom.base ∧
    Set.range c.source.ι.hom.base = f.hom.base ⁻¹' Set.range c.target.ι.hom.base ∧
    IsOpenQuotientMap c.ringHom.toRingHom ∧
    c.source.affinoid.pair.plus = (integralClosure
      (c.target.affinoid.pair.plus.map c.ringHom.toRingHom) c.source.affinoid.ring).toSubring

/-- A locally closed immersion is a closed immersion into an open subspace. -/
def IsLocallyClosedImmersion {T X : TauCeti.AdicSpace.{w}} (f : T ⟶ X) : Prop :=
  ∃ (U : TauCeti.AdicSpace.{w}) (i : T ⟶ U) (j : U ⟶ X),
    IsClosedImmersion i ∧ TauCeti.PreAdicSpace.IsOpenImmersion j.hom ∧ i ≫ j = f

/-- A locally closed immersion is injective on points. -/
example {T X : TauCeti.AdicSpace.{w}} (f : T ⟶ X) (a b : T.obj)
    (hne : a ≠ b) (heq : f.hom.base a = f.hom.base b) : ¬ IsLocallyClosedImmersion f := sorry

/-- The discrete square-zero extension `A = 𝔽_p ⊕ ⊕_ℕ 𝔽_p` is in Huber's standing class, but the
kernel of its projection to `𝔽_p` is not a finitely generated ideal. On the one-point space
`Spa(A, A)` this kernel is the only stalk of the admissible kernel sheaf of the closed immersion of
`Spa(𝔽_p, 𝔽_p)`, which is therefore not coherent. -/
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace (TrivSqZeroExt (ZMod p) (ℕ →₀ ZMod p)) := ⊥
    haveI : DiscreteTopology (TrivSqZeroExt (ZMod p) (ℕ →₀ ZMod p)) := ⟨rfl⟩
    ∃ _ : IsHuberRing (TrivSqZeroExt (ZMod p) (ℕ →₀ ZMod p)),
      Huber.IsHuberStandard (TrivSqZeroExt (ZMod p) (ℕ →₀ ZMod p)) ∧
        ¬ (RingHom.ker (TrivSqZeroExt.fstHom (ZMod p) (ZMod p) (ℕ →₀ ZMod p))).FG := sorry

/-- The diagonal of a morphism locally of weakly finite type is a locally closed immersion
(Zavyalov-Q, Lemma B.7.3). -/
theorem diagonal_locallyClosed {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) [HasPullback f f]
    (hf : LocallyOfWeaklyFiniteType f) (hX : HasStablySheafyCharts X) :
    IsLocallyClosedImmersion (pullback.diagonal f) := sorry

/-! ### R0.10, R0.12 Separated, universally closed, partially proper and proper morphisms
(*separated-morphism*, *universally-closed-morphism*, *universally-specializing-morphism*,
*partially-proper-morphism*, *universally-closed-and-proper-morphism*,
*proper-iff-partially-proper-quasi-compact*, *separated-diagonal-closed-embedding*,
*proper-comp*, *proper-base-change*, *closed-embedding-proper*) -/

/-- `f` is *separated*: locally of weakly finite type, with `X` covered by stably sheafy affinoids
(so that `X ×_Y X` exists) and closed diagonal (Huber 1996, Definition 1.3.1, under (1.1.1)). -/
def IsSeparated {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfWeaklyFiniteType f ∧ HasStablySheafyCharts X ∧
    ∃ h : HasPullback f f, IsClosed (Set.range (@pullback.diagonal _ _ _ _ f h).hom.base)

/-- `f` is *universally closed*: locally of weakly finite type and closed after every adic base
change from a space with stably sheafy charts (Huber 1996, Definition 1.3.2(i), under (1.1.1); the
test spaces are stable in the sense of Wedhorn, Definition 8.54). -/
def UniversallyClosed {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfWeaklyFiniteType f ∧
    ∀ (Z W : TauCeti.AdicSpace.{w}) (g : Z ⟶ Y) (p : W ⟶ X) (q : W ⟶ Z),
      HasStablySheafyCharts Z → IsAdic g → IsPullback p q f g → IsClosedMap q.hom.base

/-- `f` is *universally specializing*: locally of weakly finite type and specializing after every
adic base change from a space with stably sheafy charts (Huber 1996, Definition 1.3.3(i), under
(1.1.1); the test spaces are stable in the sense of Wedhorn, Definition 8.54). -/
def UniversallySpecializing {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfWeaklyFiniteType f ∧
    ∀ (Z W : TauCeti.AdicSpace.{w}) (g : Z ⟶ Y) (p : W ⟶ X) (q : W ⟶ Z),
      HasStablySheafyCharts Z → IsAdic g → IsPullback p q f g → SpecializingMap q.hom.base

/-- `f` is *partially proper* (Huber 1996, Definition 1.3.3(ii)). -/
def IsPartiallyProper {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfPlusWeaklyFiniteType f ∧ IsSeparated f ∧ UniversallySpecializing f

/-- `f` is *proper* (Huber 1996, Definition 1.3.2(ii)). -/
def IsProper {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  QuasiCompact f ∧ LocallyOfPlusWeaklyFiniteType f ∧ IsSeparated f ∧ UniversallyClosed f

/-- Separatedness includes local weak finite type. -/
example {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : ¬ LocallyOfWeaklyFiniteType f) : ¬ IsSeparated f :=
  fun h ↦ hf h.1

/-- Proper is partially proper and quasi-compact (Huber 1996, Lemma 1.3.4). -/
theorem IsProper.iff_isPartiallyProper_and_quasiCompact {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) : IsProper f ↔ IsPartiallyProper f ∧ QuasiCompact f := sorry

/-- The diagonal of a separated morphism is a closed immersion (Zavyalov-Q, Lemma B.6.14,
Corollary B.7.4). -/
theorem IsSeparated.iff_closedImmersion_diagonal {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [HasPullback f f] (hf : LocallyOfWeaklyFiniteType f) (hX : HasStablySheafyCharts X) :
    IsSeparated f ↔ IsClosedImmersion (pullback.diagonal f) := sorry

/-- Composites of proper morphisms are proper (Stacks, Tag 01W3, for the scheme analogue). The
standing class of R0.12 is carried by the definitions, so no hypothesis on `Z` is needed:
`IsSeparated` gives `X` and `Y` stably sheafy charts, and `UniversallyClosed` tests only base
changes from spaces with stably sheafy charts. -/
theorem IsProper.comp {X Y Z : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hf : IsProper f) (hg : IsProper g) : IsProper (f ≫ g) := sorry

/-- Proper morphisms are stable under adic base change (Huber 1996, Proposition 1.2.2; Stacks,
Tag 01W4). -/
theorem IsProper.baseChange {X Y Z W : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Z ⟶ Y)
    (p : W ⟶ X) (q : W ⟶ Z) (hs : IsPullback p q f g) (hf : IsProper f) (hg : IsAdic g)
    (hZ : HasStablySheafyCharts Z) : IsProper q := sorry

/-- Closed immersions are proper (Huber 1996, Lemma 1.4.5; Zavyalov-Q, Corollary B.6.10(1)). -/
theorem IsClosedImmersion.isProper {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : IsClosedImmersion f) (hY : HasStablySheafyCharts Y) : IsProper f := sorry

/-- An open quotient with its integral quotient plus ring gives a closed and proper affinoid map. -/
example (A B : Affinoid.{w}) (hA : IsStablySheafyRing.{w, w} A.ring)
    (φ : Pair.Hom A.pair B.pair) (hφ : IsOpenQuotientMap φ.toRingHom)
    (hplus : B.pair.plus = (integralClosure (A.pair.plus.map φ.toRingHom) B.ring).toSubring)
    (g : B.spa ⟶ A.spa) (hg : Affinoid.IsInducedBy g φ) :
    IsClosedImmersion g ∧ IsProper g ∧ QuasiCompact g ∧ UniversallyClosed g ∧
      UniversallySpecializing g := sorry

/-! ### R0.11 Valuation rings and the valuative criteria
(*adic-valuation-rings-and-centres*, *valuation-ring-space-spectral*,
*valuative-criterion-separated*, *valuative-criterion-specializing*,
*separated-proper-partially-proper*) -/

/-- A point `x` with a valuation ring of `k(x)` inside the valuation ring of `v_x`
(Huber 1996, Definition 1.3.5). -/
structure ValuationRing (X : TauCeti.AdicSpace.{w}) where
  /-- The point. -/
  pt : X.obj
  /-- The valuation ring of the residue field. -/
  ring : ValuationSubring (IsLocalRing.ResidueField
    (X.obj.toRingPresheafedSpace.presheaf.stalk pt))
  le_plus : ring ≤ (X.obj.valuation pt).valuation.valuationSubring

/-- Huber's subbasic set `{(x, V) : x ∈ U, h(x) ∈ V}`. -/
def ValuationRing.basicOpen (X : TauCeti.AdicSpace.{w}) (U : Opens X.obj)
    (h : X.obj.toRingPresheafedSpace.presheaf.obj (op U)) : Set (ValuationRing X) :=
  {r | ∃ hx : r.pt ∈ U, IsLocalRing.residue _
    (X.obj.toRingPresheafedSpace.presheaf.germ U r.pt hx h) ∈ r.ring}

instance ValuationRing.instTopologicalSpace (X : TauCeti.AdicSpace.{w}) :
    TopologicalSpace (ValuationRing X) := TopologicalSpace.generateFrom
      {V | ∃ (U : Opens X.obj) (h : X.obj.toRingPresheafedSpace.presheaf.obj (op U)),
        V = ValuationRing.basicOpen X U h}

/-- The section `0` cuts out the whole preimage of `U`. -/
example (X : TauCeti.AdicSpace.{w}) (U : Opens X.obj) :
    ValuationRing.basicOpen X U 0 = ValuationRing.pt ⁻¹' (U : Set X.obj) := by
  ext r
  simp only [ValuationRing.basicOpen, Set.mem_ofPred_eq, Set.mem_preimage, map_zero,
    zero_mem, exists_prop, and_true, SetLike.mem_coe]

/-- A section over the empty open defines the empty subbasic set. -/
example (X : TauCeti.AdicSpace.{w})
    (h : X.obj.toRingPresheafedSpace.presheaf.obj (op ⊥)) :
    ValuationRing.basicOpen X ⊥ h = ∅ := sorry

/-- A section valued greater than one everywhere belongs to no refining valuation ring. -/
example (X : TauCeti.AdicSpace.{w}) (U : Opens X.obj)
    (h : X.obj.toRingPresheafedSpace.presheaf.obj (op U))
    (hh : ∀ (x : X.obj) (hx : x ∈ U),
      1 < (X.obj.valuation x).valuation (IsLocalRing.residue _
        (X.obj.toRingPresheafedSpace.presheaf.germ U x hx h))) :
    ValuationRing.basicOpen X U h = ∅ := sorry

/-- `(x, V)` has *centre* `y ∈ Y` under `f` if `f(x)` specialises to `y` and `V` dominates the
valuation ring of `v_y` (Huber 1996, Definition 1.3.5). -/
def ValuationRing.IsCentre {X Y : TauCeti.AdicSpace.{w}} (r : ValuationRing X)
    (f : X ⟶ Y) (y : Y.obj) : Prop :=
  ∃ h : f.hom.base r.pt ⤳ y,
    ∃ i : IsLocalRing.ResidueField (Y.obj.toRingPresheafedSpace.presheaf.stalk y) →+*
      IsLocalRing.ResidueField (X.obj.toRingPresheafedSpace.presheaf.stalk r.pt),
      i.comp (IsLocalRing.residue _) =
        (IsLocalRing.residue _).comp ((f.hom.stalkMap r.pt).hom.comp
          (Y.obj.toRingPresheafedSpace.presheaf.stalkSpecializes h).hom) ∧
      r.ring.comap i = (Y.obj.valuation y).valuation.valuationSubring

/-- The support is its own identity centre precisely for the original residue valuation ring. -/
example (X : TauCeti.AdicSpace.{w}) (r : ValuationRing X) :
    r.IsCentre (𝟙 X) r.pt ↔
      r.ring = (X.obj.valuation r.pt).valuation.valuationSubring := sorry

/-- A strict refinement has no identity centre at its original support. -/
example (X : TauCeti.AdicSpace.{w}) (r : ValuationRing X)
    (hr : r.ring < (X.obj.valuation r.pt).valuation.valuationSubring) :
    ¬ r.IsCentre (𝟙 X) r.pt := sorry

/-- A centre is a specialization of the image of the support. -/
example {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (r : ValuationRing X)
    (y : Y.obj) (hy : r.IsCentre f y) : f.hom.base r.pt ⤳ y := hy.1

/-- The affinoid criterion for a unique valuation centre (Huber 1996, Lemma 1.3.6). -/
theorem ValuationRing_affinoid (X : TauCeti.AdicSpace.{w}) (hX : IsAnalytic X)
    (r : ValuationRing X) (B : Affinoid.{w}) [IsTateRing B.ring] (f : X ⟶ B.spa) :
    (∃! y : B.spa.obj, r.IsCentre f y) ↔
      ∀ b : B.ring, b ∈ B.pair.plus →
        IsLocalRing.residue _ ((f.hom.stalkMap r.pt).hom
          (B.spa.obj.toRingPresheafedSpace.presheaf.germ ⊤ (f.hom.base r.pt)
            (by exact Set.mem_univ _) (B.coeff b))) ∈ r.ring := sorry

/-- The space of valuation rings of a quasi-compact quasi-separated analytic adic space is
spectral (Huber 1996, Lemma 1.3.12). -/
theorem ValuationRing.spectralSpace (X : TauCeti.AdicSpace.{w})
    [CompactSpace X.obj] [QuasiSeparatedSpace X.obj] (hX : IsAnalytic X) :
    SpectralSpace (ValuationRing X) := sorry

/-- Valuative criterion for separatedness (Huber 1996, Proposition 1.3.7). -/
theorem IsSeparated.iff_valuativeCriterion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [HasPullback f f] (hqs : QuasiCompact (pullback.diagonal f)) (hX : IsAnalytic X)
    (hY : IsAnalytic Y) (hc : HasStablySheafyCharts X) (hf : LocallyOfWeaklyFiniteType f) :
    IsSeparated f ↔ ∀ (r : ValuationRing X) (z z' : X.obj), r.IsCentre (𝟙 X) z →
      r.IsCentre (𝟙 X) z' → f.hom.base z = f.hom.base z' → z = z' := sorry

/-- Valuative criterion for universal specialization (Huber 1996, Proposition 1.3.8). -/
theorem UniversallySpecializing.iff_valuativeCriterion {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) (hX : IsAnalytic X) (hY : IsAnalytic Y) (hf : LocallyOfWeaklyFiniteType f) :
    UniversallySpecializing f ↔ ∀ (r : ValuationRing X) (y : Y.obj), r.IsCentre f y →
      ∃ z : X.obj, r.IsCentre (𝟙 X) z ∧ f.hom.base z = y := sorry

/-- Valuative criterion for partial properness (Huber 1996, Corollary 1.3.9). -/
theorem IsPartiallyProper.iff_valuativeCriterion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [HasPullback f f] (hqs : QuasiCompact (pullback.diagonal f)) (hX : IsAnalytic X)
    (hY : IsAnalytic Y) (hc : HasStablySheafyCharts X) (hf : LocallyOfPlusWeaklyFiniteType f) :
    IsPartiallyProper f ↔ ∀ (r : ValuationRing X) (y : Y.obj), r.IsCentre f y →
      ∃! z : X.obj, r.IsCentre (𝟙 X) z ∧ f.hom.base z = y := sorry

/-! ### R0.13–R0.14 Finite and quasi-finite morphisms
(*finite-morphism*, *finite-morphisms*, *closed-embedding-finite*, *quasi-finite-morphism*,
*quasi-finite-fibre-criteria*, *quasi-finite-and-finiteness-criteria*) -/

/-- `f` is *finite*: over target charts covering `Y`, the whole inverse image is one affinoid
chart and the coordinate map is a finite morphism of Huber pairs (Huber 1996, (1.4.4)). -/
def IsFinite {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ y : Y.obj, ∃ c : HomChart f, y ∈ Set.range c.target.ι.hom.base ∧
    Set.range c.source.ι.hom.base = f.hom.base ⁻¹' Set.range c.target.ι.hom.base ∧
    Huber.Pair.Hom.IsFinite c.ringHom

/-- `f` is *locally quasi-finite*: locally of weakly finite type with discrete fibres
(Huber 1996, Definition 1.5.1). -/
def LocallyQuasiFinite {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfWeaklyFiniteType f ∧ ∀ y : Y.obj, DiscreteTopology (f.hom.base ⁻¹' {y})

/-- Closed immersions are finite (Huber 1996, Lemma 1.4.5(iii)). -/
theorem IsFinite.of_isClosedImmersion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : IsClosedImmersion f) : IsFinite f := sorry

/-- Finite morphisms to analytic spaces are proper (Huber 1996, Lemma 1.4.5(ii)). -/
theorem IsFinite.isProper {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (hf : IsFinite f)
    (hY : IsAnalytic Y) (hc : HasStablySheafyCharts Y) : IsProper f := sorry

/-- Over a locally noetherian analytic base, finite is proper and locally quasi-finite
(Huber 1996, Proposition 1.5.5). -/
theorem IsFinite.iff_isProper_and_quasiFinite {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hX : IsAnalytic X) (hY : IsAnalytic Y) (hN : IsLocallyNoetherian Y)
    (hf : LocallyOfFiniteType f) : IsFinite f ↔ IsProper f ∧ LocallyQuasiFinite f := sorry

/-- Quasi-compact local quasi-finiteness is finiteness of the fibres (Huber 1996, Lemma 1.5.2). -/
theorem LocallyQuasiFinite.iff_finite_fibres {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hX : IsAnalytic X) (hY : IsAnalytic Y) (hf : LocallyOfWeaklyFiniteType f)
    (hq : QuasiCompact f) : LocallyQuasiFinite f ↔ ∀ y : Y.obj, (f.hom.base ⁻¹' {y}).Finite :=
  sorry

/-! ### R0.16–R0.17 Flat, unramified, smooth and étale morphisms
(*flat-morphism*, *open-embedding-etale*, *immersion-unramified*, *etale-smooth-composition*,
*smooth-etale-base-change*, *etale-flat-unramified*, *smooth-morphism-open*,
*etale-local-structure*, *finite-etale-algebra-comparison*, *etale-standing-class-control*) -/

/-- `f` is *flat* if every stalk map is flat (Zavyalov-Q, Definition B.4.1). -/
def Flat {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, (f.hom.stalkMap x).hom.Flat

/-- Stalkwise flatness supplies flatness of each stalk homomorphism. -/
theorem Flat.flat_stalkMap {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (hf : Flat f)
    (x : X.obj) : (f.hom.stalkMap x).hom.Flat := hf x

/-- For strongly noetherian Tate affinoids, stalkwise flatness gives flatness on coefficients
(Zavyalov-Q, Lemma B.4.3). -/
theorem Flat.flat_appTop_of_isStronglyNoetherian (A B : Affinoid.{w})
    [IsTateRing A.ring] [IsStronglyNoetherian A.ring]
    [IsTateRing B.ring] [IsStronglyNoetherian B.ring]
    (φ : Pair.Hom A.pair B.pair) (f : B.spa ⟶ A.spa)
    (hg : Affinoid.IsInducedBy f φ) (hf : Flat f) : φ.toRingHom.Flat := sorry

/-- `f` is *unramified*: locally of finite type with chart-local unique lifting
(Huber 1996, Definition 1.6.5). -/
def Unramified {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfFiniteType f ∧ ∀ x : X.obj, ∃ c : HomChart f,
    x ∈ Set.range c.source.ι.hom.base ∧ Unramified_affinoid.{w, w, w} c.ringHom

/-- For locally finite-type morphisms of locally Huber-standard spaces, unramifiedness
is equivalent to an open diagonal (Huber 1996, Proposition 1.6.8). -/
theorem Unramified.iff_openImmersion_diagonal {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [HasPullback f f] (hX : IsLocallyHuberStandard X) (hY : IsLocallyHuberStandard Y)
    (hf : LocallyOfFiniteType f) :
    Unramified f ↔ TauCeti.PreAdicSpace.IsOpenImmersion (pullback.diagonal f).hom := sorry

/-- `f` is *smooth*: locally of finite presentation with chart-local lifting
(Huber 1996, Definition 1.6.5). -/
def Smooth {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfFinitePresentation f ∧ ∀ x : X.obj, ∃ c : HomChart f,
    x ∈ Set.range c.source.ι.hom.base ∧ Smooth_affinoid.{w, w, w} c.ringHom

/-- `f` is *étale*: locally of finite presentation with chart-local unique lifting
(Huber 1996, Definition 1.6.5). -/
def Etale {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfFinitePresentation f ∧ ∀ x : X.obj, ∃ c : HomChart f,
    x ∈ Set.range c.source.ι.hom.base ∧ Etale_affinoid.{w, w, w} c.ringHom

/-- Open immersions between locally Huber-standard spaces are étale (Huber 1996, Proposition
1.6.7(i), under the standing assumption (1.1.1)). -/
theorem Etale.of_isOpenImmersion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [TauCeti.PreAdicSpace.IsOpenImmersion f.hom] (hX : IsLocallyHuberStandard X)
    (hY : IsLocallyHuberStandard Y) : Etale f := sorry

/-- Closed immersions between locally Huber-standard spaces are unramified (Huber 1996,
Proposition 1.6.7(i), under (1.1.1)). -/
theorem IsClosedImmersion.unramified {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : IsClosedImmersion f) (hX : IsLocallyHuberStandard X) (hY : IsLocallyHuberStandard Y) :
    Unramified f := sorry

/-- Composites of étale morphisms of locally Huber-standard spaces are étale (Huber 1996,
Proposition 1.6.7(ii), under (1.1.1)). -/
theorem Etale.comp {X Y Z : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hf : Etale f) (hg : Etale g) (hX : IsLocallyHuberStandard X)
    (hY : IsLocallyHuberStandard Y) (hZ : IsLocallyHuberStandard Z) : Etale (f ≫ g) := sorry

/-- Étale morphisms are stable under base change when all four spaces are locally
Huber-standard (Huber 1996, Proposition 1.6.7(iv), under (1.1.1)). Such a square exists by case
(a) of `hasPullback_of_finiteType`: `f` is locally of finite type and `Z`, being locally
noetherian, has stably sheafy charts. The class on `Y` makes the relation ideals of the charts
of `f` finitely generated, which is the condition under which finite presentation passes to
`q`. -/
theorem Etale.baseChange {X Y Z W : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Z ⟶ Y)
    (p : W ⟶ X) (q : W ⟶ Z) (hs : IsPullback p q f g) (hf : Etale f)
    (hX : IsLocallyHuberStandard X) (hY : IsLocallyHuberStandard Y)
    (hZ : IsLocallyHuberStandard Z) (hW : IsLocallyHuberStandard W) : Etale q := sorry

/-- Under the hypotheses of `Etale.baseChange` the fibre product exists, by case (a) of
`hasPullback_of_finiteType`. -/
example {X Y Z : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Z ⟶ Y) (hf : Etale f)
    (hZ : IsLocallyHuberStandard Z) : HasPullback f g :=
  hasPullback_of_finiteType f g hZ.isLocallyNoetherian.isStablySheafy
    (Or.inl hf.1.locallyOfFiniteType)

/-- For analytic, locally Huber-standard spaces, étale is flat and unramified (Huber 1996,
Proposition 1.7.5, under (1.1.1)). For analytic spaces the standing class is the same as being
locally noetherian. -/
theorem Etale.iff_flat_and_unramified {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hX : IsAnalytic X) (hY : IsAnalytic Y) (hXs : IsLocallyHuberStandard X)
    (hYs : IsLocallyHuberStandard Y) (hf : LocallyOfFiniteType f) :
    Etale f ↔ Flat f ∧ Unramified f := sorry

/-- Smooth morphisms of locally Huber-standard spaces are open (Huber 1996, (1.7.7),
Proposition 1.7.8, Lemma 1.7.9, under (1.1.1)). -/
theorem Smooth.isOpenMap {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (hf : Smooth f)
    (hX : IsLocallyHuberStandard X) (hY : IsLocallyHuberStandard Y) : IsOpenMap f.hom.base :=
  sorry

/-- Local structure of étale morphisms: an étale morphism of affinoids whose coordinate rings lie
in Huber's standing class has a standard étale presentation, with as many equations as
variables and an invertible Jacobian determinant (Huber 1996, Proposition 1.7.1, stated for
affinoid rings under (1.1.1)). -/
theorem Etale.exists_standardPresentation (A B : Affinoid.{w})
    (hA : Huber.IsHuberStandard A.ring) (hB : Huber.IsHuberStandard B.ring)
    (φ : Pair.Hom A.pair B.pair) (g : B.spa ⟶ A.spa)
    (hg : Affinoid.IsInducedBy g φ) (hf : Etale g) :
    ∃ (n : ℕ) (M : Fin n → Set A.ring) (hM : IsWeightFamily M),
      (∀ i, (M i).Finite) ∧
      ∃ (p : Fin n → MvPolynomial (Fin n) A.ring)
        (θ : UniformSpace.Completion (weightedRestrictedSubring M hM) →+* B.ring),
        Continuous θ ∧ IsOpenQuotientMap θ ∧
        (∀ a, θ (UniformSpace.Completion.coeRingHom (weightedC M hM a)) = φ.toRingHom a) ∧
        B.pair.plus = (integralClosure (Subring.topologicalClosure (Subring.closure
          ((φ.toRingHom '' (A.pair.plus : Set A.ring)) ∪
            {b | ∃ i m, m ∈ M i ∧ b = θ (UniformSpace.Completion.coeRingHom
              (weightedPolynomialHom M hM (MvPolynomial.C m * MvPolynomial.X i)))})))
          B.ring).toSubring ∧
        (let e := θ.comp (UniformSpace.Completion.coeRingHom.comp (weightedPolynomialHom M hM))
         RingHom.ker θ = Ideal.span (Set.range fun i ↦
           UniformSpace.Completion.coeRingHom (weightedPolynomialHom M hM (p i))) ∧
         IsUnit (Matrix.det (fun i j : Fin n ↦ e (MvPolynomial.pderiv j (p i))))) := sorry

/-- For finite morphisms of affinoids over a complete pair whose ring is noetherian, adic and
algebraic étaleness agree (Huber 1996, Example 1.6.6(ii), stated for noetherian complete f-adic
rings). Complete strongly noetherian Tate rings are noetherian
(`TauCeti.Huber.isNoetherianRing_of_isStronglyNoetherian`), so they are a special case. -/
theorem Etale.iff_ringHom_etale_of_finite (A B : Affinoid.{w}) [IsNoetherianRing A.ring]
    [Huber.IsHuberStandard A.ring] (φ : Pair.Hom A.pair B.pair)
    (hφ : Huber.Pair.Hom.IsFinite φ) (g : B.spa ⟶ A.spa) (hg : Affinoid.IsInducedBy g φ) :
    Etale g ↔ φ.toRingHom.Etale := sorry

/-- For discrete noetherian affinoids, finite presentation and finite plus-ring generation
identify adic smoothness with algebraic smoothness (Huber 1996, Example 1.6.6(i)). -/
example (A B : Affinoid.{w}) [DiscreteTopology A.ring] [DiscreteTopology B.ring]
    [IsNoetherianRing A.ring] [IsNoetherianRing B.ring] [Algebra A.ring B.ring]
    [Algebra.FinitePresentation A.ring B.ring]
    (φ : Pair.Hom A.pair B.pair) (hφ : φ.toRingHom = algebraMap A.ring B.ring)
    (hplus : ∃ s : Finset B.ring, B.pair.plus = (integralClosure
      (Subring.closure (φ.toRingHom '' (A.pair.plus : Set A.ring) ∪ (s : Set B.ring)))
      B.ring).toSubring)
    (g : B.spa ⟶ A.spa) (hg : Affinoid.IsInducedBy g φ) :
    Smooth g ↔ Algebra.Smooth A.ring B.ring := sorry

/-- Algebraic smoothness over discrete noetherian rings cannot supply adic smoothness when
the target plus ring has no finite generating set up to integral closure (Huber 1.6.6(i)). -/
example (A B : Affinoid.{w}) [DiscreteTopology A.ring] [DiscreteTopology B.ring]
    [IsNoetherianRing A.ring] [IsNoetherianRing B.ring] [Algebra A.ring B.ring]
    [Algebra.Smooth A.ring B.ring]
    (φ : Pair.Hom A.pair B.pair) (hφ : φ.toRingHom = algebraMap A.ring B.ring)
    (hplus : ∀ s : Finset B.ring, B.pair.plus ≠ (integralClosure
      (Subring.closure (φ.toRingHom '' (A.pair.plus : Set A.ring) ∪ (s : Set B.ring)))
      B.ring).toSubring)
    (g : B.spa ⟶ A.spa) (hg : Affinoid.IsInducedBy g φ) : ¬ Smooth g := sorry

/-- The ring-level part of the control showing that the étale package needs Huber's standing
class: on the ring `E` of eventually constant sequences `ℕ → ℤ/p`, the eventual-value map
`ε : E → ℤ/p` has kernel the finitely supported sequences, which is not a finitely generated
ideal. Hence `ℤ_p ×_{𝔽_p} E` is not of finite type over its noetherian ring of definition
`ℤ_p`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ (E : Subring (ℕ → ZMod p)) (ε : E →+* ZMod p),
      (E : Set (ℕ → ZMod p)) = {a | ∃ N, ∀ n ≥ N, a n = a N} ∧
        (∀ a : E, ∃ N, ∀ n ≥ N, (a : ℕ → ZMod p) n = ε a) ∧ ¬ (RingHom.ker ε).FG := sorry
/-! The identity, open-immersion and empty-space Checks use the geometric carriers above. -/

/-- The identity on a space with stable charts has the stated finiteness and closure properties. -/
example (X : TauCeti.AdicSpace.{w}) (hX : HasStablySheafyCharts X) :
    IsAdic (𝟙 X) ∧ LocallyOfWeaklyFiniteType (𝟙 X) ∧
      LocallyOfPlusWeaklyFiniteType (𝟙 X) ∧ LocallyOfFiniteType (𝟙 X) ∧
      Unramified (𝟙 X) ∧ LocallyQuasiFinite (𝟙 X) ∧ QuasiCompact (𝟙 X) ∧
      IsClosedImmersion (𝟙 X) ∧ IsSeparated (𝟙 X) ∧ UniversallyClosed (𝟙 X) ∧
      UniversallySpecializing (𝟙 X) ∧ IsProper (𝟙 X) := sorry

/-- Local Huber-standardness supplies finite presentation, smoothness and étaleness of identities. -/
example (X : TauCeti.AdicSpace.{w}) (hX : IsLocallyHuberStandard X) :
    LocallyOfFinitePresentation (𝟙 X) ∧ Smooth (𝟙 X) ∧ Etale (𝟙 X) := sorry

/-- Without local Huber-standardness the identity fails both smoothness and étaleness. -/
example (X : TauCeti.AdicSpace.{w}) (hX : ¬ IsLocallyHuberStandard X) :
    ¬ Smooth (𝟙 X) ∧ ¬ Etale (𝟙 X) := sorry

/-- An open immersion on a space with stable charts has the stated local finiteness properties. -/
example {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [TauCeti.PreAdicSpace.IsOpenImmersion f.hom] (hX : HasStablySheafyCharts X) :
    IsAdic f ∧ LocallyOfWeaklyFiniteType f ∧ LocallyOfPlusWeaklyFiniteType f ∧
      LocallyOfFiniteType f ∧ Unramified f ∧ LocallyQuasiFinite f ∧ IsSeparated f := sorry

/-- An open immersion into a locally Huber-standard space is finitely presented, smooth and étale. -/
example {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [TauCeti.PreAdicSpace.IsOpenImmersion f.hom] (hY : IsLocallyHuberStandard Y) :
    LocallyOfFinitePresentation f ∧ Smooth f ∧ Etale f := sorry

/-- An empty space satisfies all three chart conditions. -/
example (X : TauCeti.AdicSpace.{w}) [IsEmpty X.obj] :
    IsLocallyNoetherian X ∧ IsAnalytic X ∧ HasStablySheafyCharts X := sorry

/-- A complete strongly noetherian Tate affinoid satisfies the three chart conditions. -/
example (A : Affinoid.{w}) [IsTateRing A.ring] [IsStronglyNoetherian A.ring] :
    IsLocallyNoetherian A.spa ∧ IsAnalytic A.spa ∧ HasStablySheafyCharts A.spa := sorry

/-- A nonzero discrete noetherian affinoid is locally noetherian and stable, and is not analytic. -/
example (A : Affinoid.{w}) [DiscreteTopology A.ring] [IsNoetherianRing A.ring]
    [Nontrivial A.ring] :
    IsLocallyNoetherian A.spa ∧ HasStablySheafyCharts A.spa ∧ ¬ IsAnalytic A.spa := sorry

/-- A map from a nonzero Tate spectrum into a discrete spectrum is not adic. -/
example (A B : Affinoid.{w}) [DiscreteTopology A.ring] [IsTateRing B.ring]
    [Nontrivial B.ring] (φ : Pair.Hom A.pair B.pair) (f : B.spa ⟶ A.spa)
    (hf : Affinoid.IsInducedBy f φ) : ¬ IsAdic f := sorry

/-- Empty-source maps have the stated closure properties over a target with stable charts. -/
example {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) [IsEmpty X.obj]
    (hY : HasStablySheafyCharts Y) :
    IsClosedImmersion f ∧ IsProper f ∧ QuasiCompact f ∧ UniversallyClosed f ∧
      UniversallySpecializing f ∧ IsSeparated f ∧ LocallyQuasiFinite f ∧
      LocallyOfFinitePresentation f := sorry

/-- Flat identities have flat maps at every stalk. -/
example (X : TauCeti.AdicSpace.{w}) : Flat (𝟙 X) := sorry

/-- An open immersion is flat because it identifies the stalks. -/
example {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [TauCeti.PreAdicSpace.IsOpenImmersion f.hom] : Flat f := sorry

/-- Evaluation at zero gives a nonflat origin inclusion into the closed unit disc. -/
example (K : Type w) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] [NonarchimedeanRing K] [IsHuberRing K]
    (D P : Affinoid.{w})
    (eD : D.ring ≃+* restrictedMvPowerSeriesCompletion 1 K)
    (eP : P.ring ≃+* K)
    (hcD : Continuous eD) (hiD : Continuous eD.symm)
    (hcP : Continuous eP) (hiP : Continuous eP.symm)
    (hpD : D.pair.plus.map eD.toRingHom = powerBoundedSubring _)
    (hpP : P.pair.plus.map eP.toRingHom = powerBoundedSubring K)
    (φ : Pair.Hom D.pair P.pair) (g : P.spa ⟶ D.spa)
    (hφ : ∀ q : MvPolynomial (Fin 1) K,
      eP (φ.toRingHom (eD.symm (Huber.TateAlgebra.ofMvPolynomial K 1 q))) =
        MvPolynomial.eval (fun _ : Fin 1 ↦ (0 : K)) q)
    (hg : Affinoid.IsInducedBy g φ) : ¬ Flat g := sorry

/-- Finite-presentation cancellation through an identity fixes its original morphism. -/
example {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (hX : IsLocallyHuberStandard X)
    (hY : IsLocallyHuberStandard Y) (hf : LocallyOfFinitePresentation (f ≫ 𝟙 Y)) :
    LocallyOfFinitePresentation f := sorry

section DiscMorphisms

/-! Morphisms of the closed unit disc `D = Spa(K⟨T⟩, K°⟨T⟩)` given by `T ↦ q(T)`. -/

variable (K : Type w) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [IsHuberRing K]
  (A B : Affinoid.{w})
  (eA : A.ring ≃+* restrictedMvPowerSeriesCompletion 1 K)
  (eB : B.ring ≃+* restrictedMvPowerSeriesCompletion 1 K)
  (hcA : Continuous eA) (hiA : Continuous eA.symm)
  (hcB : Continuous eB) (hiB : Continuous eB.symm)
  (hpA : A.pair.plus.map eA.toRingHom = powerBoundedSubring _)
  (hpB : B.pair.plus.map eB.toRingHom = powerBoundedSubring _)
  (φ : Pair.Hom A.pair B.pair) (g : B.spa ⟶ A.spa) (hg : Affinoid.IsInducedBy g φ)

include hcA hiA hcB hiB hpA hpB hg

/-- `T ↦ T²` is finite, flat and locally quasi-finite. -/
example (hφ : ∀ p : MvPolynomial (Fin 1) K,
    eB (φ.toRingHom (eA.symm (Huber.TateAlgebra.ofMvPolynomial K 1 p))) =
      Huber.TateAlgebra.ofMvPolynomial K 1
        (MvPolynomial.aeval (fun _ : Fin 1 ↦ (MvPolynomial.X 0 : MvPolynomial (Fin 1) K) ^ 2) p)) :
    IsFinite g ∧ Flat g ∧ LocallyQuasiFinite g := sorry

/-- The inclusion of the smaller disc `|T| ≤ |ϖ|` (`T ↦ ϖT`) is étale but not finite, and the
ring map is not of finite type. -/
example (ϖ : K) (hϖ : 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1)
    (hφ : ∀ p : MvPolynomial (Fin 1) K,
      eB (φ.toRingHom (eA.symm (Huber.TateAlgebra.ofMvPolynomial K 1 p))) =
        Huber.TateAlgebra.ofMvPolynomial K 1
          (MvPolynomial.aeval (fun _ : Fin 1 ↦ MvPolynomial.C ϖ * MvPolynomial.X 0) p)) :
    Etale g ∧ ¬ IsFinite g ∧ ¬ φ.toRingHom.FiniteType := sorry

/-- In characteristic `p` the map `T ↦ T^p` is finite, flat and bijective on points, but neither
unramified nor étale. -/
example (p : ℕ) [Fact p.Prime] [CharP K p]
    (hφ : ∀ q : MvPolynomial (Fin 1) K,
      eB (φ.toRingHom (eA.symm (Huber.TateAlgebra.ofMvPolynomial K 1 q))) =
        Huber.TateAlgebra.ofMvPolynomial K 1
          (MvPolynomial.aeval (fun _ : Fin 1 ↦ (MvPolynomial.X 0 : MvPolynomial (Fin 1) K) ^ p)
            q)) :
    IsFinite g ∧ Flat g ∧ Function.Bijective g.hom.base ∧ ¬ Unramified g ∧ ¬ Etale g := sorry

end DiscMorphisms

section DiscProperness

variable (K : Type w) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [IsHuberRing K] (A D : Affinoid.{w})
  (eA : A.ring ≃+* K) (eD : D.ring ≃+* restrictedMvPowerSeriesCompletion 1 K)
  (hcA : Continuous eA) (hiA : Continuous eA.symm)
  (hcD : Continuous eD) (hiD : Continuous eD.symm)
  (hpA : A.pair.plus.map eA.toRingHom = powerBoundedSubring K)
  (hpD : D.pair.plus.map eD.toRingHom = powerBoundedSubring _)
  (φ : Pair.Hom A.pair D.pair)
  (hφ : ∀ a, eD (φ.toRingHom a) = algebraMap K _ (eA a))
  (g : D.spa ⟶ A.spa) (hg : Affinoid.IsInducedBy g φ)

include hcA hiA hcD hiD hpA hpD hφ hg

/-- The disc structure map is smooth and finitely presented, with the full plus ring,
but is neither unramified nor étale, and its coefficient map is not algebraically smooth. -/
example : IsTopologicallyFiniteTypePair φ ∧ LocallyOfFinitePresentation g ∧ Smooth g ∧
    ¬ Unramified g ∧ ¬ Etale g ∧ ¬ φ.toRingHom.Smooth := sorry

/-- The closed unit disc with plus ring `K°⟨T⟩` is quasi-compact and separated over `Spa K` but
neither partially proper nor universally closed. -/
example : QuasiCompact g ∧ IsSeparated g ∧ ¬ IsPartiallyProper g ∧ ¬ UniversallyClosed g :=
  sorry

/-- The open unit disc `{|T| < 1}` is partially proper over `Spa K` but not quasi-compact, hence
not proper. -/
example (ϖ : K) (hϖ : 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1)
    (U : TauCeti.AdicSpace.{w}) (j : U ⟶ D.spa)
    [TauCeti.PreAdicSpace.IsOpenImmersion j.hom]
    (hU : Set.range j.hom.base = {x : D.spa.obj |
      ∃ n : ℕ, 0 < n ∧
        x.val.valuation (eD.symm (Huber.TateAlgebra.ofMvPolynomial K 1 (MvPolynomial.X 0))) ^ n ≤
          x.val.valuation (eD.symm (algebraMap K _ ϖ))}) :
    IsPartiallyProper (j ≫ g) ∧ ¬ QuasiCompact (j ≫ g) ∧ ¬ IsProper (j ≫ g) := sorry

end DiscProperness

end AdicSpace

/-! ### R0.18 Spectral images (*spectral-map-image-proconstructible*) -/

/-- A spectral map between spectral spaces carries pro-constructible subsets to
pro-constructible subsets (Huber 1996, (1.1.13); Stacks Tags 0901 and 0A2S). Continuity for the
constructible topologies carries the compact source subset to a compact, hence closed, subset
of the Hausdorff target constructible space. For Hausdorffness, separate distinct points by a quasicompact open and its
complement in the constructible topology, using the spectral basis and T0 property. -/
theorem isProConstructible_image {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] {f : X → Y} {T : Set X}
    (hf : IsSpectralMap f) (hT : IsProConstructible T) :
    IsProConstructible (f '' T) := sorry

/-- The identity preserves every pro-constructible subset of a spectral space. -/
example {X : Type*} [TopologicalSpace X] [SpectralSpace X] (T : Set X)
    (hT : IsProConstructible T) : IsProConstructible (id '' T) := sorry

/-- A spectral map has empty pro-constructible image on the empty subset. -/
example {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] (f : X → Y) (hf : IsSpectralMap f) :
    f '' (∅ : Set X) = ∅ ∧ IsProConstructible (f '' (∅ : Set X)) := sorry

/-! ### R0.19 Spectral, categorical and topos foundations
(*constructible-topology-profinite*, *pro-constructible-subsets*,
*closure-of-pro-constructible*, *generalizing-surjection-is-quotient*,
*spectral-limit-lemma*, *cofiltered-limits-of-spectral-spaces*,
*spa-of-filtered-colimit-of-tate-pairs*, *quasicompact-opens-in-limits-of-spectral-spaces*,
*pro-category-of-finite-t0-spaces*, *quasicompact-objects-in-a-topos*) -/

/-- The constructible topology of a spectral space is Hausdorff and totally disconnected (ECD §2,
paragraph after Theorem 2.2, p. 10); with Mathlib's `compactSpace_withConstructibleTopology` it is
profinite. -/
theorem WithConstructibleTopology.t2Space_totallyDisconnectedSpace (X : Type u)
    [TopologicalSpace X] [SpectralSpace X] :
    T2Space (WithConstructibleTopology X) ∧
      TotallyDisconnectedSpace (WithConstructibleTopology X) := sorry

-- Check: on the Sierpiński space `Prop` (open point `True`) the constructible topology is
-- discrete.
example : constructibleTopology Prop = ⊥ := sorry

-- Check `s0_2_empty_and_point`: the constructible topologies are discrete in both cases.
example : constructibleTopology Empty = ⊥ ∧ constructibleTopology PUnit = ⊥ ∧
    CompactSpace (WithConstructibleTopology PUnit) := sorry

-- Check `closed_point_not_generalizing_topology`: the generic point generalizes the closed point.
example : IsProConstructible ({False} : Set Prop) ∧
    ¬ StableUnderGeneralization ({False} : Set Prop) := sorry

-- Check `generic_point_generalizing_topology`: the open singleton is stable under generalization.
example : IsOpen ({True} : Set Prop) ∧ IsProConstructible ({True} : Set Prop) ∧
    StableUnderGeneralization ({True} : Set Prop) := sorry

/-- The closure of a pro-constructible subset of a spectral space is its set of specializations
(ECD Lemma 2.4, pp. 10–11). -/
theorem closure_eq_setOf_specializes_of_isProConstructible {X : Type u} [TopologicalSpace X]
    [SpectralSpace X] {S : Set X} (hS : IsProConstructible S) :
    closure S = {y | ∃ x ∈ S, x ⤳ y} := sorry

-- Check: in the Sierpiński space `True` specializes to `False` and not conversely.
example : (True ⤳ False) ∧ ¬ (False ⤳ True) := sorry

/-- Dually, a pro-constructible subset of a spectral space that is stable under generalization is
the intersection of the quasicompact opens containing it (ECD proof of Lemma 2.7, p. 12). -/
theorem eq_sInter_of_isProConstructible_of_stableUnderGeneralization {X : Type u}
    [TopologicalSpace X] [SpectralSpace X] {S : Set X} (hS : IsProConstructible S)
    (hg : StableUnderGeneralization S) : S = ⋂₀ {U | IsOpen U ∧ IsCompact U ∧ S ⊆ U} := sorry

/-- A surjective generalizing spectral map of spectral spaces is a quotient map (ECD Lemma 2.5,
p. 11). -/
theorem isQuotientMap_of_generalizingMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] {f : X → Y} (hf : IsSpectralMap f)
    (hg : GeneralizingMap f) (hs : Function.Surjective f) : IsQuotientMap f := sorry

-- Negative control: the identity from the constructible topology of the Sierpiński space is a
-- continuous bijection that is not a quotient map; it is not generalizing.
example : ¬ IsQuotientMap (WithTopology.equiv Prop (constructibleTopology Prop)) := sorry

/-! R0.19's spectral-limit and generic Pro/topos constructions are README targets.
`SpectralSpace.FiniteTZeroPresentation.constructible_isLimit` compares the constructible
cone with the discrete finite-stage cone. The Pro API specifies the double-limit Hom
formula, its stage representatives and naturality, and the finite-T₀ spectral equivalence.
The topos API keeps object quasicompactness separate from relative quasicompactness.
-/

-- Check `residueSystem_prime_three`: the precision-two carrier and reduction depend on the prime.
example : Nat.card (ZMod 9) = 9 ∧
    ZMod.castHom (show 3 ∣ 9 by decide) (ZMod 3) (3 : ZMod 9) = 0 := sorry

/-! ### R0.20 Adic tilde-limits
(*tilde-limits-affinoid-criterion*, *tilde-limit-base-change*) -/

namespace AdicSpace

open CategoryTheory CategoryTheory.Limits TauCeti.Huber

/-- Huber's *tilde-limit* `X ∼ lim Xᵢ` for a cone `c` over `F`: the point map to the compatible
families is a homeomorphism, and every point has an affinoid chart in which the images of the
coordinate rings of charts of the `Xᵢ` through which it factors are dense (Huber96, Def. 2.4.2,
p. 125). -/
def IsTildeLimit {I : Type} [SmallCategory I] (F : I ⥤ TauCeti.AdicSpace) (c : Cone F) : Prop :=
  (∃ e : c.pt.obj ≃ₜ {v : ∀ i, (F.obj i).obj //
      ∀ (i j : I) (f : i ⟶ j), (F.map f).hom.base (v i) = v j},
    ∀ x i, (e x).1 i = (c.π.app i).hom.base x) ∧
  ∀ x : c.pt.obj, ∃ d : Chart c.pt, x ∈ Set.range d.ι.hom.base ∧
    Dense {a : d.affinoid.ring | ∃ (i : I) (e : Chart (F.obj i))
      (g : d.affinoid.spa ⟶ e.affinoid.spa) (φ : Pair.Hom e.affinoid.pair d.affinoid.pair),
      Affinoid.IsInducedBy g φ ∧ d.ι ≫ c.π.app i = g ≫ e.ι ∧ a ∈ Set.range φ.toRingHom}

/-- The affinoid criterion: a cone of affinoids with induced coordinate maps whose images have
dense union, and with the point-space homeomorphism, is a tilde-limit (Scholze–Weinstein 2013,
Prop. 2.4.2; Huber96, Def. 2.4.2). -/
theorem IsTildeLimit.affinoid {I : Type} [SmallCategory I] [IsCofiltered I]
    (F : I ⥤ TauCeti.AdicSpace) (c : Cone F) (A : Affinoid) (eA : c.pt ≅ A.spa)
    (B : I → Affinoid) (eB : ∀ i, F.obj i ≅ (B i).spa) (g : ∀ i, A.spa ⟶ (B i).spa)
    (φ : ∀ i, Pair.Hom (B i).pair A.pair) (hg : ∀ i, Affinoid.IsInducedBy (g i) (φ i))
    (hc : ∀ i, eA.hom ≫ g i = c.π.app i ≫ (eB i).hom)
    (he : ∃ e : c.pt.obj ≃ₜ {v : ∀ i, (F.obj i).obj //
      ∀ (i j : I) (f : i ⟶ j), (F.map f).hom.base (v i) = v j},
      ∀ x i, (e x).1 i = (c.π.app i).hom.base x)
    (hd : Dense (⋃ i, Set.range (φ i).toRingHom)) : IsTildeLimit F c := sorry

/-- Tilde-limits of quasi-compact quasi-separated spaces with adic transition maps are stable
under base change along an adic morphism locally of weakly finite type, given the pullback
squares (Huber96, Rem. 2.4.3(ii), p. 126). -/
theorem IsTildeLimit.baseChange {I : Type} [SmallCategory I] [IsCofiltered I]
    (F D : I ⥤ TauCeti.AdicSpace) (c : Cone F) (d : Cone D) (j : I) (hj : IsTerminal j)
    (Y : TauCeti.AdicSpace) (f : Y ⟶ F.obj j) (p : D ⟶ F) (q : D ⟶ (Functor.const I).obj Y)
    (a : d.pt ⟶ c.pt) (b : d.pt ⟶ Y) (hc : IsTildeLimit F c)
    [CompactSpace c.pt.obj] [QuasiSeparatedSpace c.pt.obj]
    [CompactSpace Y.obj] [QuasiSeparatedSpace Y.obj]
    (hF : ∀ i, CompactSpace (F.obj i).obj ∧ QuasiSeparatedSpace (F.obj i).obj)
    (htrans : ∀ (i k : I) (g : i ⟶ k), IsAdic (F.map g)) (hcone : ∀ i, IsAdic (c.π.app i))
    (hf : LocallyOfWeaklyFiniteType f)
    (hs : ∀ i, IsPullback (p.app i) (q.app i) (F.map (hj.from i)) f)
    (ht : IsPullback a b (c.π.app j) f) (ha : ∀ i, d.π.app i ≫ p.app i = a ≫ c.π.app i)
    (hb : ∀ i, d.π.app i ≫ q.app i = b) : IsTildeLimit D d := sorry

/-- The constant diagram is the tilde-limit of itself. -/
example (I : Type) [SmallCategory I] [IsCofiltered I] (X : TauCeti.AdicSpace) :
    IsTildeLimit ((Functor.const I).obj X) { pt := X, π := 𝟙 _ } := sorry

/-- A cone whose projection identifies distinct points is not a tilde-limit of the constant
diagram. -/
example (I : Type) [SmallCategory I] [IsCofiltered I] (X : TauCeti.AdicSpace)
    (c : Cone ((Functor.const I).obj X)) (i : I) (hi : ¬ Function.Injective (c.π.app i).hom.base) :
    ¬ IsTildeLimit ((Functor.const I).obj X) c := sorry

end AdicSpace


end

/-! ## Layer R1: Analytification and algebraic correspondences -/

noncomputable section

namespace Huber

open TauCeti.Huber

/-! ### R1.1 Plus rings of affinoid algebras (*tft-plus-ring-power-bounded*) -/

/-- On a `K`-affinoid algebra presented by an open surjection `K⟨T⟩ → A`, a ring of integral
elements makes `(K, K°) → (A, A⁺)` topologically of finite type exactly when `A⁺ = A°`
(Huber 1994, Lemma 4.4; Wedhorn, Definition 7.56). -/
theorem Pair.eq_powerBounded_iff_of_isTopologicallyFiniteType
    (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K]
    {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A] {n : ℕ}
    (g : restrictedMvPowerSeriesCompletion n K →+* A) (hg : IsOpenQuotientMap g) (P : Pair A) :
    (∃ (m : ℕ) (g' : restrictedMvPowerSeriesCompletion m K →+* A), IsOpenQuotientMap g' ∧
        P.plus = (integralClosure
          ((powerBoundedSubring (restrictedMvPowerSeriesCompletion m K)).map g') A).toSubring) ↔
      P = Pair.powerBounded A := sorry

end Huber

end

end TauCetiRoadmap.AdicSpacesPartII
