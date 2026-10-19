import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Comap
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic
import TauCeti.RingTheory.Huber.Basic


/-!
# Classical analytic étale cohomology: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below are suggested Lean forms for the light definitions and the milestones that
can be stated against the pinned Mathlib and Tau Ceti, so that contributors and reviewers converge
on names and signatures; proving all of them finishes neither a layer nor the roadmap. The étale,
pro-étale and pseudo-adic sites with their sheaf categories and derived functors, henselizations
of Huber pairs, formal specialization, valuation nearby cycles, proper supports, traces, duality
and the cohomology of radial regions have no carriers at the pins: they are README targets with
their intended signatures, listed by layer at the end of this file.

EnhancedDerivedSheaves §§0.1–0.4 supplies the ringed-site enhancements, tensor–Hom,
coherent derived limits, completion comparisons and functor calculus, with E0–E1 supplying
its foundations and comparisons and E4 its replete-topos completion refinements.
EtaleCohomologyFoundations §§0.5–0.11 supplies finite-presentation coefficient descent,
algebraic extension by zero, localization, D+ torsion proper supports, traces and cycle classes;
its G.1–G.3 supplies scheme compactification geometry, and F.2 supplies geometric exchange
and finite-coefficient ULA. SchemeAndStackFoundations §§2.1–2.2 supplies the underlying
abelian D+ functors. README §5.6 extends the supplied ULA notion with agreement on the
common finite-coefficient domain. Analytic applications carry their geometric hypotheses.

AdicSpacesPartII §§R0.19.1–R0.19.10 supplies constructible topology, spectral limits,
generic Pro categories and qcqs topoi. Its §§R0.20.1–R0.20.2 supplies the ordinary predicate
`TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsTildeLimit` and its affinoid and base-change API.
README §1.5(1) applies its completed-direct-limit criterion to the algebraic colimit with
compatible definition rings inside the plus rings, finitely generated definition ideals,
finite-stage detection of ideal powers, and the specified definition-ring topology. The plus
ring is the integral closure of the stage-plus image; completion takes its image closure.
The target pair is identified with this actual separated completion by a topological ring
isomorphism preserving the plus ring and all stage maps. Its kernel on the colimit is exactly
the closure of zero. The product projection and disc evaluation fail this identification;
README §1.5(2) uses the same actual completion criterion with genuine Tate definition rings.
Its separate reduction test in §1.5(3) requires a bounded target plus ring whose powers give
the actual topology, together with an independent topological-limit homeomorphism. Field
plus rings satisfy that boundedness condition. Strict localisations use their valuation and
rational-neighborhood shrinking argument for the homeomorphism; finite-type base changes
use the ordinary tilde-limit theorem without assuming boundedness of the new plus rings.
The base-change contract keeps qcqs spaces, adic transitions and cone maps, a final stage,
a locally weakly finite-type morphism and the required fibre products. README §1.5's
`SupportedTildeLimit.fullSupport_iff` identifies the full-support predicate with that same
ordinary predicate. PerfectoidSpaces P7 supplies the analytic and perfectoid refinements.
The exact inverse-image arguments in README §1.1 use underlying sheaves or fixed coefficients;
ringed-module direct images use its coefficient-forgetting/resolution comparison.

Design choices made explicit here:

* The ramification cutoff of the Bloch–Kato–Hyodo filtration is the natural ceiling of `pe/(p-1)`
  computed in `ℚ` and defined for all natural inputs. On a ramified base change to `K`, use
  `e = v_K(p)` and the new uniformizer; primality of `p` and positivity of `e` enter only its
  cohomological application.
* The variation of a left monodromy action is `u - 1` in Mathlib's `Module.End`, and the product
  term of its cocycle formula is composed in the order of the action. The imported fixed-element
  variation in README §§4.5a and 5.5 is a morphism after exact geometric restriction U, with
  composition identities using U(q) and pullback/descent conjugation covariance of the family.
  Normalized var and N retain their Tate twists and equivariance on the unipotent rational
  realization; `Trait.variation` remains an underlying module endomorphism.
* A surjective map of valuation spectra is a ring homomorphism whose `PrimeSpectrum.comap` is
  surjective. No topology is involved; for valuation domains it is equivalent to injectivity with
  locality and to Mathlib's `RingHom.FaithfullyFlat`.
* Discs and annuli are subsets of Tau Ceti's `TauCeti.ValuationSpectrum.spa` for an explicit plus
  subring, cut out by the valuative relation at every rank. A strict inequality is the negation of
  the reverse weak comparison, Mathlib's `ValuativeRel.vlt`. Open discs and annuli are unions of
  supplied exhausting families of closed ones; they are not the strict valuative loci.
-/

namespace TauCetiRoadmap.ClassicalAdicEtaleCohomology

/-! ## Layer 2: Henselian Huber rings -/

namespace Huber

variable {A : Type*} [CommRing A]

/-- Henselianity along the topologically nilpotent elements is independent of the open
power-bounded subring (README §2.1, `Huber.henselianRing_iff_of_isOpen`). -/
theorem henselianRing_iff_of_isOpen [TopologicalSpace A] [IsTopologicalRing A]
    [TauCeti.Huber.IsHuberRing A] (B C : Subring A)
    (hB : B ≤ TauCeti.Huber.powerBoundedSubring A)
    (hC : C ≤ TauCeti.Huber.powerBoundedSubring A)
    (hBopen : IsOpen (B : Set A)) (hCopen : IsOpen (C : Set A)) :
    HenselianRing B ((TauCeti.Huber.topologicallyNilpotentIdeal A).comap
      (Subring.inclusion hB)) ↔
    HenselianRing C ((TauCeti.Huber.topologicallyNilpotentIdeal A).comap
      (Subring.inclusion hC)) := by
  sorry

/-- A ring of definition in a complete Hausdorff Huber ring is complete for its ideal of
definition (README §2.1, `Huber.PairOfDefinition.isAdicComplete`). Its Tate specialization
is AdicEtaleGeometry A4.5's `PairOfDefinition.isAdicComplete_of_completeSpace`. -/
theorem PairOfDefinition.isAdicComplete [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [CompleteSpace A] [T2Space A]
    (P : TauCeti.Huber.PairOfDefinition A) :
    IsAdicComplete P.idealOfDefinition P.ringOfDefinition := by
  sorry

/-- Every open power-bounded subring of a complete Hausdorff Huber ring is henselian along
each open ideal of topologically nilpotent elements (README §2.1,
`Huber.henselianRing_of_completeSpace`). Since `B` is open, openness of `I` in `B` is
equivalent to openness of its image in `A`. -/
theorem henselianRing_of_completeSpace [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [CompleteSpace A] [T2Space A] [TauCeti.Huber.IsHuberRing A]
    (B : Subring A) (hBopen : IsOpen (B : Set A))
    (hB : B ≤ TauCeti.Huber.powerBoundedSubring A)
    (I : Ideal B) (hIopen : IsOpen (I : Set B))
    (hI : ∀ x : B, x ∈ I → IsTopologicallyNilpotent (x : A)) :
    HenselianRing B I := by
  sorry

end Huber

/-! ## Layer 4: Formal specialization and semistable nearby cycles -/

namespace Semistable

/-- The first integer at or beyond the ramification threshold `pe/(p-1)`.
In the nearby-cycle application `p` is prime and `e = v_K(p)` is the absolute ramification
index of the field after any finite ramified base change (README §4.7). -/
def filtrationCutoff (p e : ℕ) : ℕ :=
  ⌈((p : ℚ) * e) / (p - 1)⌉₊

/-- The cutoff is the natural ceiling of the rational threshold: it is at most an integral bound
`m` exactly when the threshold is. -/
theorem filtrationCutoff_le_iff (p e m : ℕ) :
    filtrationCutoff p e ≤ m ↔ ((p : ℚ) * e) / (p - 1) ≤ m := by
  sorry

/-- The cutoff is `2e` in residue characteristic two, including ramified bases. -/
theorem filtrationCutoff_two (e : ℕ) : filtrationCutoff 2 e = 2 * e := by
  sorry

end Semistable

/-! ## Layer 5: Nearby cycles over valuation rings -/

namespace Trait

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- The endomorphism underlying the variation of a left monodromy action (README §5.5). -/
def variation (u : Module.End R M) : Module.End R M := u - 1

/-- Trivial monodromy has zero variation. -/
theorem variation_one : variation (1 : Module.End R M) = 0 := by
  sorry

/-- The noncommutative cocycle formula uses the order of the left action. -/
theorem variation_mul (u v : Module.End R M) :
    variation (u * v) = variation u + variation v + variation u * variation v := by
  sorry

end Trait

/-! ## Layer 6: Valuation invariance, finiteness and supported exports -/

open TauCeti ValuationSpectrum
open scoped ValuationSpectrum

namespace ValuationBase

variable {A B : Type*} [CommRing A] [CommRing B]

/-- Surjectivity of the contravariant prime-spectrum map (README §6.1). The valuation-ring
hypotheses enter the equivalences below, not this predicate. -/
def IsSurjectiveValuationMap (φ : A →+* B) : Prop :=
  Function.Surjective (PrimeSpectrum.comap φ)

/-- For valuation domains, the spectrum condition is precisely injectivity and locality.
Fields are included as rank-zero valuation rings. -/
theorem isSurjectiveValuationMap_iff_injective_and_isLocalHom
    [IsDomain A] [ValuationRing A] [IsDomain B] [ValuationRing B] (φ : A →+* B) :
    IsSurjectiveValuationMap φ ↔ Function.Injective φ ∧ IsLocalHom φ := by
  sorry

/-- For valuation domains, the spectrum condition is faithful flatness: a torsion-free module
over a valuation ring is flat. -/
theorem isSurjectiveValuationMap_iff_faithfullyFlat
    [IsDomain A] [ValuationRing A] [IsDomain B] [ValuationRing B] (φ : A →+* B) :
    IsSurjectiveValuationMap φ ↔ φ.FaithfullyFlat := by
  sorry

/-- Every ring homomorphism between fields is a surjective map of valuation spectra. -/
theorem IsSurjectiveValuationMap.of_field {K L : Type*} [Field K] [Field L] (φ : K →+* L) :
    IsSurjectiveValuationMap φ := by
  sorry

/-- Between local domains, a surjective map of spectra sends the closed point to the closed
point and the generic point to the generic point. -/
theorem IsSurjectiveValuationMap.comap_closedPoint
    [IsDomain A] [IsLocalRing A] [IsDomain B] [IsLocalRing B] {φ : A →+* B}
    (hφ : IsSurjectiveValuationMap φ) :
    PrimeSpectrum.comap φ (IsLocalRing.closedPoint B) = IsLocalRing.closedPoint A ∧
      PrimeSpectrum.comap φ ⊥ = ⊥ := by
  sorry

/-- For valuation domains with height-one primes `p_A` and `p_B` and `φ(p_A) ⊆ p_B` (continuity
for the valuation topologies of microbial valuation rings), a surjective map of valuation spectra
pulls `p_B` back to `p_A`. Without `φ(p_A) ⊆ p_B` the height-one prime of `B` may contract to
zero. -/
theorem IsSurjectiveValuationMap.comap_heightOnePrime
    [IsDomain A] [ValuationRing A] [IsDomain B] [ValuationRing B] {φ : A →+* B}
    (hφ : IsSurjectiveValuationMap φ) {pA : Ideal A} {pB : Ideal B} [pA.IsPrime] [pB.IsPrime]
    (hA : pA.height = 1) (hB : pB.height = 1) (hcont : pA ≤ pB.comap φ) :
    pB.comap φ = pA := by
  sorry

/-- For valuation subrings `A ⊆ K` and `B ⊆ L` of fields, and `φ : A → B` induced by `K → L`, the
inclusion is a surjective map of valuation spectra exactly when `B ∩ K = A`. -/
theorem isSurjectiveValuationMap_iff_inter_eq {K L : Type*} [Field K] [Field L] [Algebra K L]
    (VA : ValuationSubring K) (VB : ValuationSubring L) (φ : VA →+* VB)
    (hφ : ∀ a : VA, (φ a : L) = algebraMap K L a) :
    IsSurjectiveValuationMap φ ↔ VB.comap (algebraMap K L) = VA := by
  sorry

/-- For a continuous extension `C₃ → C₁` of algebraically closed complete nonarchimedean fields
and open bounded valuation subrings `C₃⁺ ⊆ C₁⁺`, the map `Spa(C₁, C₁⁺) → Spa(C₃, C₃⁺)` is
surjective exactly when `C₃⁺ → C₁⁺` is a surjective map of valuation spectra. -/
theorem IsSurjectiveValuationMap.spa_surjective_iff {C₃ C₁ : Type*}
    [NontriviallyNormedField C₃] [IsUltrametricDist C₃] [CompleteSpace C₃] [IsAlgClosed C₃]
    [NontriviallyNormedField C₁] [IsUltrametricDist C₁] [CompleteSpace C₁] [IsAlgClosed C₁]
    [NormedAlgebra C₃ C₁] (P₃ : ValuationSubring C₃) (P₁ : ValuationSubring C₁)
    (hP₃ : IsOpen (P₃ : Set C₃)) (hP₁ : IsOpen (P₁ : Set C₁))
    (hb₃ : Bornology.IsBounded (P₃ : Set C₃)) (hb₁ : Bornology.IsBounded (P₁ : Set C₁))
    (hplus : ∀ a ∈ P₃.toSubring, algebraMap C₃ C₁ a ∈ P₁.toSubring)
    (φ : P₃ →+* P₁) (hφ : ∀ a : P₃, (φ a : C₁) = algebraMap C₃ C₁ a) :
    Function.Surjective (spaComap (algebraMap C₃ C₁) (continuous_algebraMap C₃ C₁)
        P₃.toSubring P₁.toSubring hplus) ↔
      IsSurjectiveValuationMap φ := by
  sorry

end ValuationBase

/-! ## Layer 10: Radial cohomology and smooth families -/

namespace Radial

variable {A : Type*} [CommRing A] [TopologicalSpace A]

/-- The weak outer-radius condition in the actual adic spectrum (README §10.1). -/
def closedDisc (Aplus : Subring A) (T b : A) : Set (Spv A) :=
  spa Aplus ∩ {v | v.toValuativeRel.vle T b}

/-- Removing the support of the coordinate gives a punctured closed-disc locus. -/
def puncturedDisc (Aplus : Subring A) (T b : A) : Set (Spv A) :=
  closedDisc Aplus T b ∩ {v | ¬ v.toValuativeRel.vle T 0}

/-- Both radius bounds are weak. In particular an equal-radius annulus is allowed. -/
def closedAnnulus (Aplus : Subring A) (T a b : A) : Set (Spv A) :=
  spa Aplus ∩ {v | v.toValuativeRel.vle a T ∧ v.toValuativeRel.vle T b ∧
    ¬ v.toValuativeRel.vle T 0}

/-- Strict inequalities are the negations of reverse weak comparisons at every rank
(README §10.2). -/
def strictAnnulus (Aplus : Subring A) (T a b : A) : Set (Spv A) :=
  spa Aplus ∩ {v | ¬ v.toValuativeRel.vle T a ∧ ¬ v.toValuativeRel.vle b T ∧
    ¬ v.toValuativeRel.vle T 0}

/-- An open annulus from a supplied cofinal exhaustion of closed annuli.
The set is defined for arbitrary sequences; analytic exhaustion hypotheses live in the README. -/
def openAnnulus (Aplus : Subring A) (T : A) (a b : ℕ → A) : Set (Spv A) :=
  ⋃ j, closedAnnulus Aplus T (a j) (b j)

/-- An open disc from a supplied cofinal exhaustion of closed discs. -/
def openDisc (Aplus : Subring A) (T : A) (b : ℕ → A) : Set (Spv A) :=
  ⋃ j, closedDisc Aplus T (b j)

section ClosedDisc

variable {Aplus : Subring A} {T b : A}

/-- Closed-disc membership is the outer-radius comparison inside the adic spectrum. -/
theorem mem_closedDisc {v : Spv A} :
    v ∈ closedDisc Aplus T b ↔ v ∈ spa Aplus ∧ v.toValuativeRel.vle T b := by
  sorry

/-- Every closed-disc point belongs to the ambient adic spectrum. -/
theorem closedDisc_subset_spa : closedDisc Aplus T b ⊆ spa Aplus := by
  sorry

/-- For a unit radius representative the closed disc is the rational subset `R({T}/b)`. -/
theorem closedDisc_eq_rational (hb : IsUnit b) :
    closedDisc Aplus T b = rationalSubset Aplus {T} b := by
  sorry

/-- For a unit radius representative the closed disc is relatively open in `Spa(A, A⁺)`. -/
theorem isOpen_closedDisc (hb : IsUnit b) :
    IsOpen (Subtype.val ⁻¹' closedDisc Aplus T b : Set (spa Aplus)) := by
  sorry

/-- Pulling a closed disc back along a continuous plus-preserving ring map, inside the target
spectrum, gives the closed disc of the image coordinate and radius. -/
theorem comap_preimage_closedDisc_inter_spa {B : Type*} [CommRing B] [TopologicalSpace B]
    {φ : A →+* B} (hφ : Continuous φ) {Bplus : Subring B} (hplus : ∀ a ∈ Aplus, φ a ∈ Bplus) :
    ValuationSpectrum.comap φ ⁻¹' closedDisc Aplus T b ∩ spa Bplus =
      closedDisc Bplus (φ T) (φ b) := by
  sorry

/-- Concentric closed discs are nested. -/
theorem closedDisc_mono {b' : A} (h : ∀ v ∈ spa Aplus, v.toValuativeRel.vle b b') :
    closedDisc Aplus T b ⊆ closedDisc Aplus T b' := by
  sorry

/-- Rescaling the coordinate and the radius by the same unit changes nothing. -/
theorem closedDisc_mul_unit {u : A} (hu : IsUnit u) :
    closedDisc Aplus (T * u) (b * u) = closedDisc Aplus T b := by
  sorry

end ClosedDisc

section PuncturedDisc

variable {Aplus : Subring A} {T b : A}

/-- Punctured-disc membership excludes the support of the coordinate from the closed disc. -/
theorem mem_puncturedDisc {v : Spv A} :
    v ∈ puncturedDisc Aplus T b ↔ v ∈ closedDisc Aplus T b ∧ ¬ v.toValuativeRel.vle T 0 := by
  sorry

/-- Puncturing a closed disc gives a subset of that disc. -/
theorem puncturedDisc_subset_closedDisc : puncturedDisc Aplus T b ⊆ closedDisc Aplus T b := by
  sorry

/-- The punctured disc is the closed disc minus the coordinate's support locus. -/
theorem puncturedDisc_eq_diff :
    puncturedDisc Aplus T b = closedDisc Aplus T b \ {v | v.toValuativeRel.vle T 0} := by
  sorry

/-- The annular exhaustion of the punctured disc by the powers of a topologically nilpotent
element. -/
theorem puncturedDisc_eq_iUnion_closedAnnulus {ϖ : A} (hϖ : IsTopologicallyNilpotent ϖ) :
    puncturedDisc Aplus T b = ⋃ n : ℕ, closedAnnulus Aplus T (ϖ ^ n) b := by
  sorry

end PuncturedDisc

section ClosedAnnulus

variable {Aplus : Subring A} {T a b : A}

/-- Closed-annulus membership imposes both weak bounds and excludes the coordinate's support. -/
theorem mem_closedAnnulus {v : Spv A} :
    v ∈ closedAnnulus Aplus T a b ↔ v ∈ spa Aplus ∧ v.toValuativeRel.vle a T ∧
      v.toValuativeRel.vle T b ∧ ¬ v.toValuativeRel.vle T 0 := by
  sorry

/-- A closed annulus is the intersection of two rational subsets, with no unit hypothesis. -/
theorem closedAnnulus_eq_inter :
    closedAnnulus Aplus T a b = rationalSubset Aplus {T} b ∩ rationalSubset Aplus {a} T := by
  sorry

/-- Every closed annulus is contained in its punctured outer disc. -/
theorem closedAnnulus_subset_puncturedDisc :
    closedAnnulus Aplus T a b ⊆ puncturedDisc Aplus T b := by
  sorry

/-- A concentric subannulus is contained in the larger annulus. -/
theorem closedAnnulus_mono {a' b' : A} (ha : ∀ v ∈ spa Aplus, v.toValuativeRel.vle a' a)
    (hb : ∀ v ∈ spa Aplus, v.toValuativeRel.vle b b') :
    closedAnnulus Aplus T a b ⊆ closedAnnulus Aplus T a' b' := by
  sorry

end ClosedAnnulus

section StrictAnnulus

variable {Aplus : Subring A} {T a b : A}

/-- Strict-annulus membership imposes the two strict bounds outside the coordinate's support. -/
theorem mem_strictAnnulus {v : Spv A} :
    v ∈ strictAnnulus Aplus T a b ↔ v ∈ spa Aplus ∧ ¬ v.toValuativeRel.vle T a ∧
      ¬ v.toValuativeRel.vle b T ∧ ¬ v.toValuativeRel.vle T 0 := by
  sorry

/-- Membership in the strict locus in Mathlib's `ValuativeRel.vlt` convention. -/
theorem strictAnnulus_vlt {v : Spv A} :
    v ∈ strictAnnulus Aplus T a b ↔ v ∈ spa Aplus ∧ v.toValuativeRel.vlt a T ∧
      v.toValuativeRel.vlt T b ∧ ¬ v.toValuativeRel.vle T 0 := by
  sorry

/-- Strict bounds imply the weak bounds of the corresponding closed annulus. -/
theorem strictAnnulus_subset_closedAnnulus :
    strictAnnulus Aplus T a b ⊆ closedAnnulus Aplus T a b := by
  sorry

end StrictAnnulus

section OpenRegions

variable {Aplus : Subring A} {T : A}

/-- An open-annulus point belongs to one of the supplied closed-annulus stages. -/
theorem mem_openAnnulus {a b : ℕ → A} {v : Spv A} :
    v ∈ openAnnulus Aplus T a b ↔ ∃ j, v ∈ closedAnnulus Aplus T (a j) (b j) := by
  sorry

/-- Every closed-annulus stage is contained in its open-annulus union. -/
theorem closedAnnulus_subset_openAnnulus (a b : ℕ → A) (j : ℕ) :
    closedAnnulus Aplus T (a j) (b j) ⊆ openAnnulus Aplus T a b := by
  sorry

/-- Constant exhaustion data gives the corresponding closed annulus, not a strict one. -/
theorem openAnnulus_constant (a b : A) :
    openAnnulus Aplus T (fun _ ↦ a) (fun _ ↦ b) = closedAnnulus Aplus T a b := by
  sorry

/-- The open annulus depends on its exhausting families only up to mutual cofinality, inner
radii compared downwards and outer radii upwards at every point of `Spa(A, A⁺)`. -/
theorem openAnnulus_eq_of_cofinal {a b a' b' : ℕ → A}
    (h : ∀ j, ∃ k, ∀ v ∈ spa Aplus,
      v.toValuativeRel.vle (a' k) (a j) ∧ v.toValuativeRel.vle (b j) (b' k))
    (h' : ∀ k, ∃ j, ∀ v ∈ spa Aplus,
      v.toValuativeRel.vle (a j) (a' k) ∧ v.toValuativeRel.vle (b' k) (b j)) :
    openAnnulus Aplus T a b = openAnnulus Aplus T a' b' := by
  sorry

/-- An open-disc point belongs to one of the supplied closed-disc stages. -/
theorem mem_openDisc {b : ℕ → A} {v : Spv A} :
    v ∈ openDisc Aplus T b ↔ ∃ j, v ∈ closedDisc Aplus T (b j) := by
  sorry

/-- Every closed-disc stage is contained in its open-disc union. -/
theorem closedDisc_subset_openDisc (b : ℕ → A) (j : ℕ) :
    closedDisc Aplus T (b j) ⊆ openDisc Aplus T b := by
  sorry

/-- Constant disc exhaustion data retains the closed boundary. -/
theorem openDisc_constant (b : A) : openDisc Aplus T (fun _ ↦ b) = closedDisc Aplus T b := by
  sorry

/-- The open disc depends on its exhausting family only up to mutual cofinality. -/
theorem openDisc_eq_of_cofinal {b b' : ℕ → A}
    (h : ∀ j, ∃ k, ∀ v ∈ spa Aplus, v.toValuativeRel.vle (b j) (b' k))
    (h' : ∀ k, ∃ j, ∀ v ∈ spa Aplus, v.toValuativeRel.vle (b' k) (b j)) :
    openDisc Aplus T b = openDisc Aplus T b' := by
  sorry

end OpenRegions

end Radial

/-
Further definitions specified in README.md, by layer, with no carriers at the pins:
Layer 1: AdicSpace.EtaleSheaf, AdicSpace.ProEtaleSheaf, AdicSpace.EtaleDPlus,
AdicSpace.RGamma, AdicSpace.Rpushforward, AdicSpace.PseudoAdic, AdicSpace.PseudoAdicSite,
AdicSpace.EtaleSheaf.extendByZero, locallyClosedExtensionByZero, Support,
AdicSpace.EtaleSheaf.IsLocallyConstant, AdicSpace.TorsionLocalSystem,
AdicSpace.EtaleSheaf.IsConstructible, AdicSpace.DbConstructible, AdicSpace.muN,
AdicSpace.tateTwist, SupportedTildeLimit, SupportedTildeLimit.fullSupport_iff,
ProEtaleSheaf.completedZp, LisseSheaf.
Layer 2: Huber.IsHenselian, Huber.Henselization, Huber.Pair.rationalHenselization,
Huber.specialSubset, Huber.specialSubset_eq_diff, Huber.IsSpecialSubset,
Huber.isSpecialSubset_rationalSubset, Huber.IsProSpecialSubset, Huber.Triple,
Huber.Pair.proSpecialHenselization, AdicSpace.PseudoAdic.schemeFibreProduct,
AdicSpace.henselianComparison, PerfectoidHuberApproximation.
Layer 3: AdicSpace.IsTaut, AdicSpace.IsTautMap (on AdicSpacesPartII R0.0 locally spectral maps), StrictAnalyticSpace, StrictAnalyticEtaleSite,
AdicBerkovichToposMorphism, OverconvergentEtaleSheaf, PreadicSpace.ZpLocalSystem,
PreadicSpace.IsogenyZpLocalSystem, PreadicSpace.QpLocalSystem, PreadicSpace.BoundedLattice,
AdicSpace.AnalyticEtaleCover, AdicSpace.AnalyticCoverFiber,
AdicSpace.AnalyticEtaleFundamentalGroup, AnalyticTateQuotient, AnalyticRationalLatticeCover.
README §§3.5 and 3.7 use covering descent and quotients on the Berkovich etale site.
For taut strict adic X this is u(X)_et,s, identified by s_0 with the partially proper
etale adic subsite; its covering families are jointly surjective in that subsite.
AnalyticRationalLatticeCover.boundedStratum has a natural-number index: stratum 0 is L_0(T),
and stratum m+1 is L_(m+1)(T) minus L_m(T). These finite etale strata decompose the lattice
sheaf on that same site. The zero system has stratum 0 equal to X and all successor strata empty.
AnalyticTateQuotient.finiteEtaleDegreeOneIso: a finite etale map of strict analytic spaces over
an algebraically closed complete nontrivially valued field, with nonempty connected target
and one classical fibre of cardinality one, is an analytic isomorphism, including all completed
residue fields. The glued Tate quotient is proper and etale over E_q^an, hence finite, before
this criterion applies; an invertible differential alone supplies etaleness.
Layer 4: FormalScheme.Hom.IsEtale, FormalScheme.SmallEtale,
FormalScheme.smallEtaleTopology, FormalScheme.specialisationFunctor, FormalScheme.Pair,
FormalScheme.Pair.SmallEtale, FormalScheme.Pair.specialisationFunctor,
FormalScheme.StrictLocalisationSystem, FormalScheme.CompletionData,
FormalScheme.CompletionData.phi, FormalScheme.CompletionData.derivedComparison,
FormalScheme.MicrobialBase, FormalScheme.IsSemistable, SemistableFormalNearbyCycles,
FormalNearbySymbol, FormalBKHFiltration, FormalBKHZeroSymbolMaps, FormalBKHPositiveSymbolMaps.
semistable_algebraic_symbol_generation: for a regular flat essentially finite-type semistable
model T over a mixed-characteristic henselian DVR R with perfect residue field and every finite
extension K/Frac(R), symbols generate i*R^qj* Z/p^N(q) on etale neighborhoods of T ×_R R_K,
q >= 0 and N >= 1. The base change need not be regular. Its mod-p U/V quotients use the
induced relative log differentials and the uniformizer of K, with the B/Z distinction of
README §4.7 and vanishing at m >= ceil(p v_K(p)/(p-1)). Hyodo's projective-line argument uses
both nilpotent action on the abutment and nonnilpotent action forced by a nonzero discrepancy.
Layer 5: ClassicalAlgebraic.relativeDuality (exceptional f^! on the left-completed ambient
etale category, separated finitely presented qcqs schemes and noetherian prime-power coefficients
invertible on the base), ClassicalAlgebraic.IsUniversallyLocallyAcyclic (strict-local acyclicity
after every scheme base change on the same perfect-constructible coefficient domain,
extending VanishingCycles.localAcyclicity and agreeing with it for finite coefficients),
AlgebraicGeometry.ValuationQuadruple, AlgebraicGeometry.ValuationQuadruple.Hom,
AlgebraicGeometry.ValuationQuadruple.nearbyCycles,
AlgebraicGeometry.ValuationQuadruple.galoisAction,
AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange, Valuation.gaussPoly,
Valuation.gauss, Valuation.gaussValuationSubring, OrientedEtaleProduct,
PlurinodalPresentation, aicGenericExtensionEquivalence_functor,
aicGenericExtensionEquivalence_inverse.
Layer 6: AdicSpace.ValuationBase.invarianceMap.
README §6.2's nearby-cycle finiteness (iii) uses a locally closed L in X_s separated over k(s),
with compact supports from EtaleCohomologyFoundations F.2.5 / VanishingCycles.compactSupportCohomology.
The finite-type morphism X -> Spec A in (i)-(ii) need not be separated.
Layer 7: AdicSpace.GeometricFieldPair, AdicSpace.FiniteTypeApprox.
Layer 8: AdicSpace.IsCompactifiable, AdicSpace.compactification,
RelativelyCompactRigidOpen, SCompactifiableFormalCurve, LocallySCompactifiableFormalCurve,
SemistableFormalCurveModel, proper_trait_comparison_agreement, FormalCurve.compactification_data,
FormalCurve.local_compactification_at, AdicSpace.properSupportSections,
AdicSpace.RProperSupportSections, AdicSpace.lowerShriek, AdicSpace.lowerShriekUnbounded,
AdicSpace.compactCohomology, AdicSpace.quasiFiniteTrace.
README §8.2 defines completed transcendence dimension dim.tr using Huber's iterated relative
algebraic and topological closures and the completed residue-field extensions. A quasi-compact
separated taut +weakly finite type f has proper universal compactification f^c with
dim.tr(f^c) = dim.tr(f). The open inclusion is bijective on rank-one points; the fibres over
rank-one base points can acquire higher-rank points. No locally finite-type fibre criterion
is required for this equality.
README §8.3's arbitrary-open model expression is the fixed proper-model composite
R pi_(P_0)* j_0!, agreeing with ClassicalAlgebraic.properSupports when the open is quasi-compact.
Layer 9: AdicSpace.IsSmoothCurve, AdicSpace.curveTrace, BoundaryPretrace,
BoundaryResidueTrace, AnalyticLCICycleClass, AffineSpaceTrace, AnalyticFirstChernClass,
SmoothRelativeTrace, SmoothRelativeTrace.topDegreeComposition (the top-degree Leray operation
for smooth partially proper taut rigid maps of pure dimensions d,e over a complete nontrivially
rank-one valued K, n > 0 invertible in K, with the 2d/2e support bounds; its trace compatibility is
SmoothRelativeTrace.comp), GeneralSmoothTrace (n invertible in O_Y over arbitrary analytic bases;
its GeneralSmoothTrace.comp specializes in top degree to SmoothRelativeTrace.comp on the common
rigid domain, and its affine-space normalization is AffineSpaceTrace),
IntegralSmoothProperTrace (derived inverse limit of the proper generic-fibre specialization of
GeneralSmoothTrace, with IntegralSmoothProperTrace.comp inherited from GeneralSmoothTrace.comp;
its Guo–Reinecke export is IntegralSmoothProperTrace.guoReineckeInput).
AdicSpace.curveTrace_generic: for a smooth separated taut curve f over S = Spa(C,Cplus),
C algebraically closed complete nontrivially valued, Cplus an open bounded valuation subring
and n > 0 a unit in Cplus, restriction identifies Hom_S(R^2 f_! mu_n, Z/n) with
Hom(H^2_c(X_eta,mu_n), Z/n). AdicSpace.curveTrace is the normalized sheaf morphism; it
induces the global-sections trace, which determines it when Cplus = O_C and need not determine
it at higher rank. For rank-two S and f : P^1_eta -> S the source is j_! Z/n with zero global
sections and Hom to Z/n = Z/n.
AdicSpace.curveTrace_isIso: over arbitrary Cplus, the generic fibre is connected and the top
proper-support direct image is constant. For quasi-compact smooth-model tubes a sufficient
condition is that the normalized scheme trace is an isomorphism over the whole residual base;
the tube P^1_eta over rank-two S fails this condition, with top direct image j_! Z/n.
Layer 10: AnnulusKummerGenerator.
README §10.4's extension-by-zero isomorphism on compact supports is for a nonempty concentric
closed subannulus retaining the same coordinate, inside a closed or analytic open annulus over
Spa(C,O_C), with C algebraically closed complete nontrivially valued and coefficients Z/n,
n > 0 prime to the residue characteristic. It is dual to the ordinary restriction isomorphism.
Layer 11: BallExhaustion, radiusBall.
-/
end TauCetiRoadmap.ClassicalAdicEtaleCohomology
