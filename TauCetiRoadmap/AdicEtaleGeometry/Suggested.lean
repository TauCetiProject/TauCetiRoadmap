import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Adic
import TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Restrict
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.SheafyRing
import TauCeti.RingTheory.Huber.Bounded
import TauCeti.RingTheory.Huber.LocalizationTopology.Completion
import TauCeti.RingTheory.Huber.LocalizationTopology.Plus
import TauCeti.RingTheory.Huber.Padic.Field
import TauCeti.RingTheory.Huber.Pair
import TauCeti.RingTheory.Huber.PowerBounded
import TauCeti.RingTheory.Huber.StronglyNoetherian
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Completion
import TauCetiRoadmap.AdicSpacesPartIII.Suggested

/-!
# Analytic adic geometry for diamonds: representative target signatures

Huber rings and pairs, adic spectra, rational localisations and the category `TauCeti.AdicSpace`
are Tau Ceti's; AdicSpacesPartII supplies affinoid charts (`AdicSpace.Affinoid`, `Chart`,
`HomChart`), adic and analytic spaces and Huber's morphism classes. Completeness includes the
Hausdorff property. This file states the parts of the roadmap that are a few lines over these
carriers:

* A0: the completed pushout of complete Huber pairs and the analytic locus of an adic space;
* A1: strongly sheafy rings, the Huber pair of a finite étale algebra, finite étale and étale
  morphisms of analytic adic spaces by the Kedlaya–Liu local description, geometric points;
* A2: relative closed polydiscs and tori over a Huber pair, dimension, smooth morphisms by ball
  charts;
* A3: pseudocoherent and stably pseudocoherent modules, Kedlaya–Liu's acyclicity in its sheafy
  form, standard étale presentations;
* A4: rings without nonsplit finite étale covers, finite étale torsors and the torsor tower, the
  ring core of Scholze's Lemma 15.3, and the orbit description of `Spa` of a torsor.

The étale, finite étale and pro-étale sites, strict localisations, Yoneda-adic spaces, the
completed tower and the perfectoid torsor presentation are README targets.
-/

set_option autoImplicit false

open TauCetiRoadmap.AdicSpacesPartII.AdicSpace
  (Chart HomChart Affinoid IsAdic IsAnalytic IsFinite Etale Smooth IsLocallyNoetherian
    LocallyOfWeaklyFiniteType)

namespace TauCetiRoadmap.AdicEtaleGeometry

open TauCeti TauCeti.Huber
open TauCetiRoadmap.AdicSpacesPartII TauCetiRoadmap.AdicSpacesPartII.Huber

/-! ## Perfectoid Tate rings -/

namespace PerfectoidInput

/-- A perfectoid Tate ring for a prime `p`: a complete Hausdorff uniform Tate ring with a
pseudouniformiser `ϖ ∈ A°` such that `ϖ ^ p ∣ p` in `A°` and Frobenius is surjective on `A° / p`
(Scholze, ECD, §3, Def. 3.1, p. 14; the modulo-`p` form of PerfectoidSpaces P1.1). -/
structure IsPerfectoidTateRing (p : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] : Prop where
  /-- The residue parameter is prime. -/
  prime : p.Prime
  /-- `A` is complete for its canonical uniformity. -/
  completeSpace : @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A)
  /-- `A` is Hausdorff. -/
  t2Space : T2Space A
  /-- `A` is a Tate ring. -/
  isTateRing : IsTateRing A
  /-- `A` is uniform: the power-bounded subring `A°` is bounded. -/
  isBounded_powerBoundedSubring :
    haveI := isTateRing
    IsBounded (powerBoundedSubring A : Set A)
  /-- There is a pseudouniformiser `ϖ ∈ A°` with `ϖ ^ p ∣ p` in `A°`. -/
  exists_isPseudoUniformizer_pow_dvd :
    haveI := isTateRing
    ∃ ϖ : powerBoundedSubring A, IsPseudoUniformizer (ϖ : A) ∧ ϖ ^ p ∣ (p : powerBoundedSubring A)
  /-- Frobenius `x ↦ x ^ p` is surjective on `A° / p`. -/
  surjective_frobenius :
    haveI := isTateRing
    Function.Surjective fun x : powerBoundedSubring A ⧸ Ideal.span {(p : powerBoundedSubring A)} ↦
      x ^ p

/-- `ℚ_p` is not perfectoid: Frobenius on `ℤ_p / p = 𝔽_p` is surjective, but no
pseudouniformiser `ϖ` of `ℤ_p` has `ϖ ^ p ∣ p`, since `v(ϖ) ≥ 1`. -/
example (p : ℕ) [Fact p.Prime] : ¬ IsPerfectoidTateRing p ℚ_[p] := sorry

/-- The prime is part of the data: no ring is perfectoid for `p = 4`. -/
example (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] :
    ¬ IsPerfectoidTateRing 4 A := fun h ↦ by
  have := h.prime
  norm_num at this

end PerfectoidInput

/-! ## Layer A0: completed tensor products and the fibre products actually used -/

noncomputable section

open CategoryTheory CategoryTheory.Limits Opposite TopologicalSpace Topology ValuationSpectrum

namespace Huber

/-! ### A0.1 The completed pushout of complete Huber pairs (*supplier-contract-fibre-products*) -/

universe u

section CompletedPushout

variable {A B C E : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [IsHuberRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
  [CommRing E] [TopologicalSpace E] [IsTopologicalRing E] [IsHuberRing E]
  {S : Pair A} {T : Pair B} {U : Pair C} {W : Pair E}

/-- The square `f : (A, A⁺) → (B, B⁺)`, `g : (A, A⁺) → (C, C⁺)`, `i : (B, B⁺) → (E, E⁺)`,
`j : (C, C⁺) → (E, E⁺)` of morphisms of Huber pairs commutes and is a pushout for morphisms into
complete Huber pairs: two morphisms into a complete pair `(D, D⁺)` that agree on `(A, A⁺)` factor
uniquely through `(E, E⁺)`. This is the universal property of the completed tensor product
`B ⊗̂_A C` (Huber 1994, §3, proof of Prop. 3.7, p. 536; AdicSpacesPartII R0,
*completed-tensor-product-universal-property*). -/
def IsCompletedPushout (f : Pair.Hom S T) (g : Pair.Hom S U) (i : Pair.Hom T W)
    (j : Pair.Hom U W) : Prop :=
  i.comp f = j.comp g ∧
    ∀ (D : Type u) [CommRing D] [UniformSpace D] [IsUniformAddGroup D] [IsTopologicalRing D]
      [IsHuberRing D] [CompleteSpace D] [T2Space D] (V : Pair D) (a : Pair.Hom T V)
      (b : Pair.Hom U V), a.comp f = b.comp g →
        ∃! h : Pair.Hom W V, h.comp i = a ∧ h.comp j = b

/-- A completed pushout commutes. -/
example {f : Pair.Hom S T} {g : Pair.Hom S U} {i : Pair.Hom T W} {j : Pair.Hom U W}
    (h : IsCompletedPushout f g i j) : i.comp f = j.comp g := h.1

end CompletedPushout

/-- Pushing out along the identity changes nothing: for a complete pair `(C, C⁺)` the square
`(id, g, g, id)` is a completed pushout. -/
example {A C : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [IsHuberRing C]
    [CompleteSpace C] [T2Space C] {S : Pair A} {U : Pair C} (g : Pair.Hom S U) :
    IsCompletedPushout (Pair.Hom.id S) g g (Pair.Hom.id U) := sorry

/-- Completed tensor products exist along adic maps: for adic morphisms `f`, `g` out of a Huber
pair there is a completed pushout `(E, E⁺)` with `E` complete, adic legs, and the subring
generated by the images of `B` and `C` dense in `E` (Huber 1994, §3, proof of Lemma 3.9(i),
p. 537; Morel, Prop. II.3.2.1; AdicSpacesPartII R0, *completed-tensor-product*). -/
theorem exists_isCompletedPushout {A B C : Type u} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
    {S : Pair A} {T : Pair B} {U : Pair C} (f : Pair.Hom S T) (g : Pair.Hom S U)
    [IsAdicHom f.toRingHom] [IsAdicHom g.toRingHom] :
    ∃ (E : Type u) (_ : CommRing E) (_ : UniformSpace E) (_ : IsUniformAddGroup E)
      (_ : IsTopologicalRing E) (_ : IsHuberRing E) (_ : CompleteSpace E) (_ : T2Space E)
      (W : Pair E) (i : Pair.Hom T W) (j : Pair.Hom U W),
      IsCompletedPushout f g i j ∧ IsAdicHom i.toRingHom ∧ IsAdicHom j.toRingHom ∧
        Dense (Subring.closure (Set.range i.toRingHom ∪ Set.range j.toRingHom) : Set E) := sorry

end Huber

/-! ### A0.8 Open subspaces, fibre products and the analytic locus
(*analytic-locus-restriction*) -/

namespace AdicSpace

/-- The open subspace of `X` on an open set `U`, with the structure inherited from Tau Ceti. -/
def restrict (X : TauCeti.AdicSpace) (U : Opens X.obj) : TauCeti.AdicSpace :=
  ⟨X.obj.restrict U.isOpenEmbedding, PreAdicSpace.isAdic_restrict U.isOpenEmbedding X.property⟩

/-- The inclusion of an open subspace. -/
def ofRestrict (X : TauCeti.AdicSpace) (U : Opens X.obj) : restrict X U ⟶ X :=
  ObjectProperty.homMk (X.obj.ofRestrict U.isOpenEmbedding)

/-- A fibre product of adic spaces: a pullback cone with its limit property. Fibre products of
adic spaces do not exist in general; existence is always asserted with hypotheses (Huber 1996,
Prop. 1.2.2, pp. 47–49). -/
structure FibreProduct {X Y Z : TauCeti.AdicSpace} (f : X ⟶ Z) (g : Y ⟶ Z) where
  /-- The fibre product. -/
  space : TauCeti.AdicSpace
  /-- The first projection. -/
  fst : space ⟶ X
  /-- The second projection. -/
  snd : space ⟶ Y
  condition : fst ≫ f = snd ≫ g
  isLimit : IsLimit (PullbackCone.mk fst snd condition)

/-- The identity square is a fibre product: `X ×_X X = X`. -/
example (X : TauCeti.AdicSpace) : FibreProduct (𝟙 X) (𝟙 X) where
  space := X
  fst := 𝟙 X
  snd := 𝟙 X
  condition := rfl
  isLimit := PullbackCone.isLimitMkIdId (𝟙 X)

/-- A point is *analytic* if some open neighbourhood carries a section that is a topologically
nilpotent unit (Huber 1994, §3, p. 532; Wedhorn, Prop. and Def. 8.36, p. 85). -/
def analyticPoints (X : TauCeti.AdicSpace) : Set X.obj :=
  {x | ∃ U : Opens X.obj, x ∈ U ∧
    ∃ t : X.obj.toPresheafedSpace.presheaf.obj (op U), IsUnit t ∧ IsTopologicallyNilpotent t}

/-- The analytic locus is open (Hübner, Lemma 6.10; Wedhorn, Rem. 8.37(1)). -/
theorem analyticPoints_isOpen (X : TauCeti.AdicSpace) : IsOpen (analyticPoints X) := sorry

/-- An adic space is analytic exactly when all its points are analytic (Wedhorn, Prop. and
Def. 8.36). -/
theorem isAnalytic_iff_analyticPoints (X : TauCeti.AdicSpace) :
    IsAnalytic X ↔ analyticPoints X = Set.univ := sorry

/-- The analytic locus is compatible with open subspaces (Wedhorn, Rem. 8.37(2)). -/
theorem analyticPoints_restrict (X : TauCeti.AdicSpace) (U : Opens X.obj) :
    analyticPoints (restrict X U) = (ofRestrict X U).hom.base ⁻¹' analyticPoints X := sorry

/-- On an affinoid `Spa(A, A⁺)` the analytic locus is Tau Ceti's `spaAnalytic`: the points whose
support is not open (Huber 1994, §3, p. 532). -/
theorem analyticPoints_spa (A : Affinoid) :
    analyticPoints A.spa = Subtype.val ⁻¹' spaAnalytic A.pair.plus := sorry

/-- A morphism is adic exactly when it maps analytic points to analytic points
(AdicSpacesPartII R0, *adic-iff-analytic-locus*; Wedhorn, Prop. 8.39). -/
theorem isAdic_iff_mapsTo_analyticPoints {Y X : TauCeti.AdicSpace} (f : Y ⟶ X) :
    IsAdic f ↔ Set.MapsTo f.hom.base (analyticPoints Y) (analyticPoints X) := sorry

/-- A discrete affinoid has empty analytic locus: no topologically nilpotent unit exists in a
nonzero discrete ring. -/
example (A : Affinoid) [DiscreteTopology A.ring] : analyticPoints A.spa = ∅ := sorry

/-- A Tate affinoid is analytic. -/
example (A : Affinoid) [IsTateRing A.ring] : analyticPoints A.spa = Set.univ := sorry

end AdicSpace

end

/-! ## Layer A1: finite étale and étale geometry -/

noncomputable section

open CategoryTheory CategoryTheory.Limits Opposite TopologicalSpace Topology ValuationSpectrum

namespace Huber

/-! ### A1.1 Strongly sheafy rings (*strongly-sheafy-huber-pair*, *finite-etale-strongly-sheafy*) -/

/-- A complete Tate ring is *strongly sheafy* if every `A⟨T₁, …, Tₙ⟩` is sheafy
(Hansen–Kedlaya, Def. 4.1, p. 11). -/
def IsStronglySheafy (A : Type*) [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A] : Prop :=
  ∀ n : ℕ, IsSheafyRing (restrictedMvPowerSeriesCompletion n A)

section StrongSheafiness

universe u

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
  [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A]

/-- Strongly sheafy rings are sheafy (the case `n = 0`). -/
theorem IsStronglySheafy.isSheafyRing (h : IsStronglySheafy A) : IsSheafyRing A := sorry

/-- `A⟨S₁, …, S_m⟩` is strongly sheafy when `A` is. -/
theorem IsStronglySheafy.restrictedMvPowerSeries (h : IsStronglySheafy A) (m : ℕ) :
    IsStronglySheafy (restrictedMvPowerSeriesCompletion m A) := sorry

/-- Strongly noetherian Tate rings are strongly sheafy (Hansen–Kedlaya, §4). -/
theorem IsStronglySheafy.of_isStronglyNoetherian [IsStronglyNoetherian A] :
    IsStronglySheafy A := sorry

/-- Stably sheafy Tate rings (Wedhorn, Def. 8.26) are strongly sheafy, each `A⟨T⟩` being
topologically of finite type over `A`. -/
theorem IsStronglySheafy.of_isStablySheafyRing (h : IsStablySheafyRing.{u, u} A) :
    IsStronglySheafy A := sorry

/-- Finite étale algebras, with their natural topology, over a strongly sheafy ring are strongly
sheafy (Hansen–Kedlaya, §1, p. 2; Kedlaya–Liu I, Rem. 8.2.18, p. 162, for why sheafiness alone
is not enough). -/
theorem IsStronglySheafy.finiteEtale (h : IsStronglySheafy A) (B : Type*)
    [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
    [IsTateRing B] [CompleteSpace B] [T2Space B] [Algebra A B] [IsModuleTopology A B]
    [Module.Finite A B] [Algebra.Etale A B] : IsStronglySheafy B := sorry

end StrongSheafiness

/-- `ℚ_p` is strongly sheafy (it is strongly noetherian). -/
example (p : ℕ) [Fact p.Prime] : IsStronglySheafy ℚ_[p] := sorry

/-! ### A1.2 The Huber pair of a finite étale algebra (*finite-etale-affinoid-algebra*) -/

/-- A finite algebra over a Tate ring, with its natural (module) topology, is a Tate ring, and it
is Hausdorff when it is projective over a Hausdorff base (Kedlaya–Liu I, Lemma 2.2.12). Its
completeness over a complete base is Tau Ceti's `completeSpace_moduleTopology`. -/
theorem isTateRing_moduleTopology {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsTateRing A] (B : Type*) [CommRing B] [Algebra A B]
    [Module.Finite A B] :
    letI : TopologicalSpace B := moduleTopology A B
    haveI : IsTopologicalRing B := IsModuleTopology.isTopologicalRing A B
    IsTateRing B ∧ (T2Space A → Module.Projective A B → T2Space B) := sorry

section FiniteEtalePair

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]

/-- `φ : (A, A⁺) → (B, B⁺)` is *finite étale*: `A → B` is finite étale, `B` carries its natural
`A`-module topology and `B⁺` is the integral closure of the image of `A⁺` (never `B°`)
(Kedlaya–Liu I, Def. 8.2.16 and Lemma 2.2.12). -/
def Pair.Hom.IsFiniteEtale {S : Pair A} {T : Pair B} (φ : Pair.Hom S T) : Prop :=
  letI := φ.toRingHom.toAlgebra
  Module.Finite A B ∧ Algebra.Etale A B ∧ IsModuleTopology A B ∧
    T.plus = (integralClosure ↥(S.plus.map φ.toRingHom) B).toSubring

/-- The identity of `(A, A⁺)` is finite étale exactly when `A⁺` is integrally closed in `A`,
which holds for every ring of integral elements. -/
example (S : Pair A) : Pair.Hom.IsFiniteEtale (Pair.Hom.id S) := sorry

/-- The plus ring of a finite étale morphism is the integral closure, not `B°`: for `B = A` and
`A⁺ ⊊ A°` the identity `(A, A⁺) → (A, A°)` is not finite étale. -/
example (S : Pair A) (hS : S.plus < powerBoundedSubring A) (φ : Pair.Hom S (Pair.powerBounded A))
    (hφ : φ.toRingHom = RingHom.id A) : ¬ Pair.Hom.IsFiniteEtale φ := sorry

variable {S : Pair A} {T : Pair B}

/-- Universal property: for a finite étale `φ : (A, A⁺) → (B, B⁺)` and a morphism
`χ : (A, A⁺) → (D, D⁺)`, every ring map `ψ : B → D` extending `χ` is a morphism of Huber pairs
(continuity comes from the module topology, `B⁺ → D⁺` from integral closedness of `D⁺`). -/
theorem Pair.Hom.IsFiniteEtale.exists_hom {φ : Pair.Hom S T} (hφ : Pair.Hom.IsFiniteEtale φ)
    {D : Type*} [CommRing D] [TopologicalSpace D] [IsTopologicalRing D] [IsHuberRing D]
    {V : Pair D} (χ : Pair.Hom S V) (ψ : B →+* D) (hψ : ψ.comp φ.toRingHom = χ.toRingHom) :
    ∃ ψ' : Pair.Hom T V, ψ'.toRingHom = ψ := sorry

end FiniteEtalePair

section FiniteEtaleComplete

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]

/-- For a complete Tate pair `(A, A⁺)` and a finite étale `A`-algebra `B` with its natural
topology, the integral closure of `A⁺` in `B` is a ring of integral elements and `A → B` is a
finite étale morphism of Huber pairs (Kedlaya–Liu I, Lemma 2.2.12, Def. 8.2.16); `B` is a Tate
ring by `isTateRing_moduleTopology`. -/
theorem Pair.exists_isFiniteEtale (S : Pair A)
    (B : Type*) [CommRing B] [Algebra A B] [Module.Finite A B] [Algebra.Etale A B]
    [TopologicalSpace B] [IsTopologicalRing B] [IsTateRing B] [IsModuleTopology A B] :
    ∃ (T : Pair B) (φ : Pair.Hom S T), φ.toRingHom = algebraMap A B ∧
      Pair.Hom.IsFiniteEtale φ := sorry

variable {B : Type*} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  {S : Pair A} {T : Pair B}

/-- Over a complete Tate base, a finite étale morphism of Huber pairs is finite in Huber's sense
(AdicSpacesPartII R0, *finite-huber-pair-hom*; Huber 1996, Example 1.6.6(ii)); completeness of
`A` is needed for the topological finite type clause. -/
theorem Pair.Hom.IsFiniteEtale.isFinite {φ : Pair.Hom S T} (hφ : Pair.Hom.IsFiniteEtale φ) :
    Pair.Hom.IsFinite φ := sorry

/-- Over a complete Tate base, the fibres of `Spa(B, B⁺) → Spa(A, A⁺)` under a finite étale
morphism are finite, of cardinality at most the rank of `B` at the support of the point: a
point over `x` extends `x` to the finite étale algebra `B ⊗ k(supp x)`. -/
theorem Pair.Hom.IsFiniteEtale.finite_fibre {φ : Pair.Hom S T} (hφ : Pair.Hom.IsFiniteEtale φ)
    (x : spa S.plus) :
    letI := φ.toRingHom.toAlgebra
    Finite {y : spa T.plus // φ.spaComap y = x} ∧
      Nat.card {y : spa T.plus // φ.spaComap y = x} ≤ Module.rankAtStalk B (suppFun x.1) := sorry

/-- Over a complete Tate base, a finite étale morphism of Huber pairs is surjective on adic
spectra exactly when `B` is faithfully flat over `A` (completeness excludes Tate rings with empty
spectrum, over which the zero algebra would be a counterexample). -/
theorem Pair.Hom.IsFiniteEtale.surjective_spaComap_iff {φ : Pair.Hom S T}
    (hφ : Pair.Hom.IsFiniteEtale φ) :
    letI := φ.toRingHom.toAlgebra
    Function.Surjective φ.spaComap ↔ Module.FaithfullyFlat A B := sorry

end FiniteEtaleComplete

end Huber

namespace AdicSpace

/-! ### A1.1 Locally strongly sheafy spaces -/

/-- `X` is covered by affinoid charts with strongly sheafy Tate coordinate rings. -/
def IsLocallyStronglySheafy (X : TauCeti.AdicSpace) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, ∃ hT : IsTateRing c.affinoid.ring,
    @Huber.IsStronglySheafy c.affinoid.ring _ _ _ _ hT _ _ ∧ x ∈ Set.range c.ι.hom.base

/-- `X` is covered by charts with strongly noetherian Tate coordinate rings. -/
def IsLocallyNoetherianAnalytic (X : TauCeti.AdicSpace) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧
    IsTateRing c.affinoid.ring ∧ IsStronglyNoetherian c.affinoid.ring

/-- Locally noetherian analytic adic spaces are locally strongly sheafy. -/
theorem IsLocallyNoetherianAnalytic.isLocallyStronglySheafy {X : TauCeti.AdicSpace}
    (h : IsLocallyNoetherianAnalytic X) : IsLocallyStronglySheafy X := sorry

/-! ### A1.3 Finite étale and étale morphisms (*finite-etale-morphism*, *etale-morphism*,
*etale-composition*, *etale-base-change*, *etale-cancellation*, *etale-open-map*) -/

/-- `f : Y → X` is *finite étale*: `X` and `Y` are analytic and `X` is covered by Tate affinoid
charts whose whole preimage is one affinoid chart of `Y`, with a finite étale coordinate map
(Kedlaya–Liu I, Def. 8.2.16, p. 162). -/
def IsFiniteEtale {Y X : TauCeti.AdicSpace} (f : Y ⟶ X) : Prop :=
  IsAnalytic X ∧ IsAnalytic Y ∧ ∀ x : X.obj,
    ∃ c : HomChart f, IsTateRing c.target.affinoid.ring ∧
      x ∈ Set.range c.target.ι.hom.base ∧
      Set.range c.source.ι.hom.base = f.hom.base ⁻¹' Set.range c.target.ι.hom.base ∧
      Huber.Pair.Hom.IsFiniteEtale c.ringHom

/-- `f : Y → X` is *étale*: `X` and `Y` are analytic and locally on `Y`, `f` is an open
immersion followed by a finite étale morphism followed by an open immersion (Kedlaya–Liu I,
Def. 8.2.16, p. 162; Scholze, ECD, §6, Def. 6.2(ii)). No separatedness is imposed. -/
def IsEtaleLocalDescription {Y X : TauCeti.AdicSpace} (f : Y ⟶ X) : Prop :=
  IsAnalytic X ∧ IsAnalytic Y ∧ ∀ y : Y.obj,
    ∃ (U V W : TauCeti.AdicSpace) (u : U ⟶ Y) (i : V ⟶ X) (j : U ⟶ W) (g : W ⟶ V),
      PreAdicSpace.IsOpenImmersion u.hom ∧ y ∈ Set.range u.hom.base ∧
        PreAdicSpace.IsOpenImmersion i.hom ∧ PreAdicSpace.IsOpenImmersion j.hom ∧
        IsFiniteEtale g ∧ u ≫ f = j ≫ g ≫ i

/-- Étale morphisms have analytic source and target, so no morphism out of a non-analytic space is
étale. -/
example {Y X : TauCeti.AdicSpace} (f : Y ⟶ X) (hY : ¬ IsAnalytic Y) :
    ¬ IsEtaleLocalDescription f := fun h ↦ hY h.2.1

/-- Open immersions into analytic spaces are étale. -/
theorem IsEtaleLocalDescription.of_isOpenImmersion {Y X : TauCeti.AdicSpace} (f : Y ⟶ X)
    (hX : IsAnalytic X) (hf : PreAdicSpace.IsOpenImmersion f.hom) :
    IsEtaleLocalDescription f := sorry

/-- Finite étale morphisms are étale. -/
theorem IsEtaleLocalDescription.of_isFiniteEtale {Y X : TauCeti.AdicSpace} {f : Y ⟶ X}
    (hf : IsFiniteEtale f) : IsEtaleLocalDescription f := sorry

section Stability

variable {X Y Z : TauCeti.AdicSpace}

/-- Composites of étale morphisms over a locally strongly sheafy base are étale (Kedlaya–Liu I,
Lemma 8.2.17(c); Berkeley, Prop. 7.5.2(1)). -/
theorem IsEtaleLocalDescription.comp {f : Y ⟶ X} {g : Z ⟶ Y} (hX : IsLocallyStronglySheafy X)
    (hf : IsEtaleLocalDescription f) (hg : IsEtaleLocalDescription g) :
    IsEtaleLocalDescription (g ≫ f) := sorry

/-- Composites of finite étale morphisms over a locally strongly sheafy base are finite étale. -/
theorem IsFiniteEtale.comp {f : Y ⟶ X} {g : Z ⟶ Y} (hX : IsLocallyStronglySheafy X)
    (hf : IsFiniteEtale f) (hg : IsFiniteEtale g) : IsFiniteEtale (g ≫ f) := sorry

/-- Cancellation: if `f` and `g ≫ f` are étale, so is `g` (Berkeley, Prop. 7.5.2(3); de Jong–van
der Put, §3.2, p. 23). -/
theorem IsEtaleLocalDescription.of_comp {f : Y ⟶ X} {g : Z ⟶ Y}
    (hX : IsLocallyStronglySheafy X) (hf : IsEtaleLocalDescription f)
    (hgf : IsEtaleLocalDescription (g ≫ f)) : IsEtaleLocalDescription g := sorry

/-- Fibre products along étale maps exist between locally strongly sheafy spaces (Kedlaya–Liu I,
§8.2, after Def. 8.2.16, p. 162; Huber 1996, Cor. 1.2.3, p. 49). -/
theorem IsEtaleLocalDescription.exists_fibreProduct {f : Y ⟶ X}
    (hf : IsEtaleLocalDescription f) (g : Z ⟶ X) (hX : IsLocallyStronglySheafy X)
    (hZ : IsLocallyStronglySheafy Z) : Nonempty (FibreProduct f g) := sorry

/-- Étale morphisms are stable under base change between locally strongly sheafy spaces. -/
theorem IsEtaleLocalDescription.baseChange {f : Y ⟶ X} {g : Z ⟶ X} (P : FibreProduct f g)
    (hX : IsLocallyStronglySheafy X) (hZ : IsLocallyStronglySheafy Z)
    (hf : IsEtaleLocalDescription f) : IsEtaleLocalDescription P.snd := sorry

/-- Finite étale morphisms are stable under base change between locally strongly sheafy spaces. -/
theorem IsFiniteEtale.baseChange {f : Y ⟶ X} {g : Z ⟶ X} (P : FibreProduct f g)
    (hX : IsLocallyStronglySheafy X) (hZ : IsLocallyStronglySheafy Z)
    (hf : IsFiniteEtale f) : IsFiniteEtale P.snd := sorry

/-- Étale morphisms to locally strongly sheafy spaces are open (Kedlaya–Liu I, Lemma 8.2.17(b);
de Jong–van der Put, Prop. 3.1.7(1)). -/
theorem IsEtaleLocalDescription.isOpenMap {f : Y ⟶ X} (hX : IsLocallyStronglySheafy X)
    (hf : IsEtaleLocalDescription f) : IsOpenMap f.hom.base := sorry

end Stability

/-! ### A1.4 Comparison with Huber's definitions
(*etale-morphisms-local-description-and-comparison*) -/

/-- Over a locally noetherian analytic base the local description agrees with Huber's étale
morphisms (Huber 1996, Def. 1.6.5 and §2.1, p. 109; de Jong–van der Put, Prop. 3.1.4;
AdicSpacesPartII R0, *etale-local-structure*). -/
theorem IsEtaleLocalDescription.iff_etale {Y X : TauCeti.AdicSpace} (f : Y ⟶ X)
    (hX : IsLocallyNoetherianAnalytic X) (hY : IsAnalytic Y) :
    IsEtaleLocalDescription f ↔ Etale f := sorry

/-- Over a locally noetherian analytic base, finite étale means finite and étale in Huber's sense
(Huber 1996, Example 1.6.6(ii)). -/
theorem IsFiniteEtale.iff_isFinite_and_etale {Y X : TauCeti.AdicSpace} (f : Y ⟶ X)
    (hX : IsLocallyNoetherianAnalytic X) (hY : IsAnalytic Y) :
    IsFiniteEtale f ↔ IsFinite f ∧ Etale f := sorry

/-! ### A1.7 Geometric points (*etale-site-and-geometric-points*) -/

/-- A *geometric point* of `X`: a morphism `Spa(C, C⁺) → X` where `C` is a complete algebraically
closed nontrivially valued field (a Tate field all of whose nonconstant polynomials have roots)
and `C⁺` is an open bounded valuation subring of any rank (Huber 1996, §2.5, Defs. 2.5.1 and
2.5.11). -/
structure GeometricPoint (X : TauCeti.AdicSpace) where
  /-- The affinoid `Spa(C, C⁺)`. -/
  affinoid : Affinoid
  isField : IsField affinoid.ring
  isTateRing : IsTateRing affinoid.ring
  exists_root : ∀ q : Polynomial affinoid.ring, 0 < q.degree → ∃ c, q.IsRoot c
  /-- `C⁺` is a valuation subring of `C`. -/
  mem_or_inv_mem : ∀ c : affinoid.ring,
    c ∈ affinoid.pair.plus ∨ ∃ d ∈ affinoid.pair.plus, c * d = 1
  /-- The morphism `Spa(C, C⁺) → X`. -/
  map : affinoid.spa ⟶ X

/-- Every point of an analytic adic space, including points of higher rank, is the image of the
closed point of a geometric point (Huber 1996, §2.5). -/
theorem exists_geometricPoint (X : TauCeti.AdicSpace) (hX : IsAnalytic X) (x : X.obj) :
    ∃ (ξ : GeometricPoint X) (z : ξ.affinoid.spa.obj),
      (∀ w : ξ.affinoid.spa.obj, w ⤳ z) ∧ ξ.map.hom.base z = x := sorry

end AdicSpace

end

/-! ## Layer A2: separatedness, smooth charts, and classical analytic geometry -/

noncomputable section

open CategoryTheory TopologicalSpace Topology ValuationSpectrum

namespace Huber

/-! ### A2.2 Relative closed polydiscs and A2.3 relative tori over a Huber pair
(*relative-closed-polydisc*, *relative-torus*) -/

/-- The coordinate `Tᵢ` of the Tate algebra `A⟨T₁, …, Tₙ⟩` (Tau Ceti's `weightedX` at trivial
weights, in the completion). -/
abbrev Pair.polydiscVar (n : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A]
    [NonarchimedeanRing A] (i : Fin n) : restrictedMvPowerSeriesCompletion n A :=
  ((weightedX (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight i :
    weightedRestrictedSubring (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight) :
      restrictedMvPowerSeriesCompletion n A)

section Polydisc

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A]

/-- `A⁺⟨T₁, …, Tₙ⟩`: the closure in `A⟨T⟩` of the subring generated by `A⁺` and the coordinates.
It is not `A⟨T⟩°` unless `A⁺ = A°`. -/
def Pair.polydiscPlus (S : Pair A) (n : ℕ) : Subring (restrictedMvPowerSeriesCompletion n A) :=
  (Subring.closure (algebraMap A (restrictedMvPowerSeriesCompletion n A) '' S.plus ∪
    Set.range (Pair.polydiscVar n A))).topologicalClosure

/-- For a complete Huber pair, `A⁺⟨T⟩` is a ring of integral elements of `A⟨T⟩`, equal to the set
of `h` with `v(h) ≤ 1` on `Spa(A⟨T⟩, A⁺⟨T⟩)` (Berkeley, Lecture 4, §4.1, p. 27; Scholze, ECD,
§24, after Prop. 24.4, p. 156). -/
theorem Pair.isRingOfIntegralElements_polydiscPlus [CompleteSpace A] [T2Space A] (S : Pair A)
    (n : ℕ) : IsRingOfIntegralElements (Pair.polydiscPlus S n) ∧
      (Pair.polydiscPlus S n : Set (restrictedMvPowerSeriesCompletion n A)) =
        {h | ∀ v ∈ spa (Pair.polydiscPlus S n), v.toValuativeRel.vle h 1} := sorry

variable [CompleteSpace A] [T2Space A]

/-- The relative closed unit polydisc over `Spa(A, A⁺)`: the Huber pair `(A⟨T₁, …, Tₙ⟩, A⁺⟨T⟩)`. -/
def Pair.polydisc (S : Pair A) (n : ℕ) : Pair (restrictedMvPowerSeriesCompletion n A) where
  plus := Pair.polydiscPlus S n
  isRingOfIntegralElements := (Pair.isRingOfIntegralElements_polydiscPlus S n).1

/-- The structure morphism `(A, A⁺) → (A⟨T⟩, A⁺⟨T⟩)`, whose `Spa` is the projection. -/
def Pair.polydisc.proj (S : Pair A) (n : ℕ) : Pair.Hom S (Pair.polydisc S n) where
  toRingHom := algebraMap A (restrictedMvPowerSeriesCompletion n A)
  continuous_toRingHom := continuous_algebraMap_restrictedMvPowerSeriesCompletion n A
  map_mem_plus a ha :=
    Subring.le_topologicalClosure _ (Subring.subset_closure (Or.inl ⟨a, ha, rfl⟩))

/-- Universal property of the polydisc: morphisms `(A⟨T⟩, A⁺⟨T⟩) → (C, C⁺)` into a complete pair
under `(A, A⁺)` correspond to `n`-tuples in `C⁺`, by evaluation at the coordinates (Scholze, ECD,
§24, after Prop. 24.4, p. 156, the ball `B^n_Y`). -/
theorem Pair.polydisc.existsUnique_hom {C : Type*} [CommRing C] [UniformSpace C]
    [IsUniformAddGroup C] [IsTopologicalRing C] [IsHuberRing C] [CompleteSpace C] [T2Space C]
    {S : Pair A} {U : Pair C} (z : Pair.Hom S U) (n : ℕ) (t : Fin n → U.plus) :
    ∃! h : Pair.Hom (Pair.polydisc S n) U, h.comp (Pair.polydisc.proj S n) = z ∧
      ∀ i, h.toRingHom (Pair.polydiscVar n A i) = t i := sorry

/-- The relative torus inside the polydisc: the rational subset `{|T₁ ⋯ Tₙ| ≥ 1}`, on which every
coordinate has absolute value `1` (Scholze, PH, §4, Ex. 4.4, p. 23; ECD, §24, proof of
Prop. 24.4). -/
def Pair.torusLocus (S : Pair A) (n : ℕ) :
    Set (ValuationSpectrum (restrictedMvPowerSeriesCompletion n A)) :=
  rationalSubset (Pair.polydiscPlus S n) {1} (∏ i, Pair.polydiscVar n A i)

/-- A morphism out of the polydisc factors through the torus exactly when every coordinate goes to
a unit whose inverse lies in the plus ring. -/
theorem Pair.mem_torusLocus_iff {C : Type*} [CommRing C] [UniformSpace C] [IsUniformAddGroup C]
    [IsTopologicalRing C] [IsHuberRing C] [CompleteSpace C] [T2Space C] {S : Pair A} {U : Pair C}
    (n : ℕ) (h : Pair.Hom (Pair.polydisc S n) U) :
    (∀ v : spa U.plus, (h.spaComap v).1 ∈ Pair.torusLocus S n) ↔
      ∀ i, ∃ u : Cˣ, (u : C) = h.toRingHom (Pair.polydiscVar n A i) ∧
        ((u⁻¹ : Cˣ) : C) ∈ U.plus := sorry

/-- The `0`-dimensional torus is the whole (one-point) polydisc: the empty product is `1`. -/
example (S : Pair A) : spa (Pair.polydiscPlus S 0) ⊆ Pair.torusLocus S 0 := sorry

end Polydisc

end Huber

namespace AdicSpace

/-! ### A2.6 Dimension (*dimension-of-adic-spaces*, *weakly-finite-type-finite-dimension*) -/

/-- A space is *pure of dimension `d`* if every nonempty open subset has topological Krull
dimension `d`. -/
def IsPureDim (X : Type*) [TopologicalSpace X] (d : ℕ) : Prop :=
  ∀ U : Set X, IsOpen U → U.Nonempty → topologicalKrullDim U = (d : WithBot ℕ∞)

/-- The relative dimension of a map: the supremum of the dimensions of its fibres. -/
def relDim {X Y : Type*} [TopologicalSpace X] (f : X → Y) : WithBot ℕ∞ :=
  ⨆ y, topologicalKrullDim (f ⁻¹' {y})

/-- A map is of pure relative dimension `d` if every nonempty fibre is pure of dimension `d`. -/
def IsPureRelDim {X Y : Type*} [TopologicalSpace X] (f : X → Y) (d : ℕ) : Prop :=
  ∀ y, (f ⁻¹' {y}).Nonempty → IsPureDim (f ⁻¹' {y}) d

/-- Empty fibres impose nothing: a map from the empty space is of every pure relative dimension. -/
example {Y : Type*} (f : Empty → Y) (d : ℕ) : IsPureRelDim f d :=
  fun _ ⟨x, _⟩ ↦ x.elim

/-- `Spa(K, K⁺)` for a valuation ring `K⁺` of a complete nonarchimedean field is a chain of
specialisations whose length is one less than the rank of `K⁺` (Hübner, §2, p. 5). -/
theorem topologicalKrullDim_spa_field (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [IsTateRing K] (S : Pair K) [ValuationRing S.plus] :
    topologicalKrullDim (spa S.plus) + 1 = ringKrullDim S.plus := sorry

/-- The closed unit `n`-polydisc over a complete nonarchimedean field is pure of dimension `n`
(Huber 1996, §1.8; Zavyalov, §3, Lemma 3.3, p. 5). -/
theorem isPureDim_spa_polydisc (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] [IsTateRing K] (n : ℕ) :
    IsPureDim (spa (Huber.Pair.polydiscPlus (Pair.powerBounded K) n)) n := sorry

/-- A quasi-compact morphism locally of weakly finite type between locally noetherian analytic
spaces with quasi-compact target has finite relative dimension (Zavyalov, §3, Lemma 3.7, p. 7). -/
theorem relDim_lt_top_of_locallyOfWeaklyFiniteType {X Y : TauCeti.AdicSpace} (f : X ⟶ Y)
    (hX : IsLocallyNoetherianAnalytic X) (hY : IsLocallyNoetherianAnalytic Y)
    [CompactSpace Y.obj] (hf : LocallyOfWeaklyFiniteType f)
    (hqc : AdicSpacesPartII.AdicSpace.QuasiCompact f) : relDim f.hom.base < ⊤ := sorry

/-! ### A2.4 Smooth morphisms by ball charts (*smooth-morphism-ball-charts*) -/

/-- The affinoid `D` is the relative closed `n`-polydisc over the affinoid `A`, with structure
morphism `q`: `D ≅ (A⟨T₁, …, Tₙ⟩, A⁺⟨T⟩)` compatibly with `q`. -/
def IsPolydiscOver (A D : Affinoid) (n : ℕ) (q : D.spa ⟶ A.spa) : Prop :=
  ∃ e : D.ring ≃+* restrictedMvPowerSeriesCompletion n A.ring, IsHomeomorph e ∧
    D.pair.plus.map e.toRingHom = Huber.Pair.polydiscPlus A.pair n ∧
    ∃ φ : Pair.Hom A.pair D.pair, AdicSpacesPartII.AdicSpace.Affinoid.IsInducedBy q φ ∧
      ∀ a, e (φ.toRingHom a) = algebraMap A.ring _ a

/-- `f : Y → X` is *smooth by ball charts*: both spaces are analytic and locally on `Y`, `f` is an
étale morphism to a relative closed polydisc over an affinoid chart of `X`, followed by the
projection (Huber 1996, Cor. 1.6.10, p. 80; Scholze, ECD, §24, Prop. 24.4, p. 156). -/
def IsLocallyEtaleOverPolydisc {Y X : TauCeti.AdicSpace} (f : Y ⟶ X) : Prop :=
  IsAnalytic X ∧ IsAnalytic Y ∧ ∀ y : Y.obj,
    ∃ (U : Opens Y.obj) (_ : y ∈ U) (c : Chart X) (n : ℕ) (D : Affinoid)
      (q : D.spa ⟶ c.affinoid.spa) (g : restrict Y U ⟶ D.spa),
      IsPolydiscOver c.affinoid D n q ∧ IsEtaleLocalDescription g ∧
        g ≫ q ≫ c.ι = ofRestrict Y U ≫ f

/-- Étale morphisms are smooth by ball charts, with `0`-dimensional balls. -/
example {Y X : TauCeti.AdicSpace} (f : Y ⟶ X) (hX : IsLocallyStronglySheafy X)
    (hf : IsEtaleLocalDescription f) : IsLocallyEtaleOverPolydisc f := sorry

/-- Between locally noetherian analytic spaces, smoothness by ball charts is Huber's smoothness
(AdicSpacesPartII R0, *smooth-morphism*; Huber 1996, Cor. 1.6.10, p. 80). -/
theorem IsLocallyEtaleOverPolydisc.iff_smooth {Y X : TauCeti.AdicSpace} (f : Y ⟶ X)
    (hX : IsLocallyNoetherianAnalytic X) (hY : IsLocallyNoetherianAnalytic Y) :
    IsLocallyEtaleOverPolydisc f ↔ Smooth f := sorry

end AdicSpace

end

/-! ## Layer A3: the nonnoetherian affinoid étale approximation input -/

noncomputable section

open TensorProduct Topology Filter ValuationSpectrum

/-! ### A3.1 Pseudocoherent modules (*pseudocoherent-module*) -/

namespace Module

/-- `M` is *`m`-fpd* over `R`: it has a resolution `0 → P_m → ⋯ → P₀ → M → 0` by finite projective
modules (Kedlaya–Liu II, Def. 1.1.1, p. 10). Stated with finite free terms whose `m`-th syzygy is
projective, which is equivalent by Schanuel's lemma. -/
def IsFPD (R : Type*) (M : Type*) [CommRing R] [AddCommGroup M] [Module R M] (m : ℕ) : Prop :=
  ∃ (n : ℕ → ℕ) (d : ∀ i, (Fin (n (i + 1)) → R) →ₗ[R] (Fin (n i) → R))
    (ε : (Fin (n 0) → R) →ₗ[R] M),
    Function.Surjective ε ∧ Function.Exact (d 0) ε ∧ (∀ i, Function.Exact (d (i + 1)) (d i)) ∧
      (m = 0 → Module.Projective R M) ∧
      ∀ k : ℕ, m = k + 1 → Module.Projective R (LinearMap.range (d k))

end Module

namespace Huber

section PseudoCoherent

variable (R : Type*) (M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- `M` is *`m`-pseudocoherent* over `R`, `m : ℕ∞`: there is a resolution by finite free modules
`⋯ → F₁ → F₀ → M → 0` exact in degrees `≤ m` (Kedlaya–Liu II, Def. 1.1.1, p. 10; the
`(-m)`-pseudo-coherence of Stacks, Tag 064Q). `0`-pseudocoherent is finite, `1`-pseudocoherent is
finitely presented. No topology is involved. -/
def IsPseudoCoherentOver (m : ℕ∞) : Prop :=
  ∃ (n : ℕ → ℕ) (d : ∀ i, (Fin (n (i + 1)) → R) →ₗ[R] (Fin (n i) → R))
    (ε : (Fin (n 0) → R) →ₗ[R] M),
    Function.Surjective ε ∧ (1 ≤ m → Function.Exact (d 0) ε) ∧
      ∀ i : ℕ, ((i + 2 : ℕ) : ℕ∞) ≤ m → Function.Exact (d (i + 1)) (d i)

variable {R M}

/-- `0`-pseudocoherent means finitely generated. -/
theorem IsPseudoCoherentOver.zero_iff : IsPseudoCoherentOver R M 0 ↔ Module.Finite R M := sorry

/-- `1`-pseudocoherent means finitely presented. -/
theorem IsPseudoCoherentOver.one_iff :
    IsPseudoCoherentOver R M 1 ↔ Module.FinitePresentation R M := sorry

end PseudoCoherent

/-- Over `ℤ`, the module `ℤ ⧸ 2` is pseudocoherent and `1`-fpd (`0 → ℤ → ℤ → ℤ ⧸ 2 → 0`) but not
projective, so not `0`-fpd. -/
example : IsPseudoCoherentOver ℤ (ZMod 2) ⊤ ∧ Module.IsFPD ℤ (ZMod 2) 1 ∧
    ¬ Module.IsFPD ℤ (ZMod 2) 0 := sorry

end Huber

/-- An fpd module is pseudocoherent (Kedlaya–Liu II, §1.1). -/
theorem Module.IsFPD.isPseudoCoherent {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    {m : ℕ} (h : Module.IsFPD R M m) : Huber.IsPseudoCoherentOver R M ⊤ := sorry

namespace Huber

/-! ### A3.1 The natural topology and stably pseudocoherent modules
(*natural-topology-strict-exactness*, *stably-pseudocoherent-module*, *pseudoflat-module*) -/

/-- The `B`-module `N` is complete and Hausdorff for its natural topology, Mathlib's
`moduleTopology B N` with the canonical uniformity (Kedlaya–Liu II, Def. 1.2.2, p. 14). -/
def IsNaturallyComplete (B : Type*) (N : Type*) [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] [AddCommGroup N] [Module B N] : Prop :=
  letI := moduleTopology B N
  haveI : IsModuleTopology B N := ⟨rfl⟩
  letI : UniformSpace N :=
    @IsTopologicalAddGroup.rightUniformSpace N _ _ (IsModuleTopology.isTopologicalAddGroup B N)
  CompleteSpace N ∧ T2Space N

section RatLoc

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  (P : PairOfDefinition A) (T : Finset A) (s : A)
  (hden : P.HasDenominatorPower T s (Localization.Away s))

/-- The completed rational localisation `A⟨T/s⟩`: Tau Ceti's completion of `A[1/s]` for the
localisation topology of the pair of definition `P`. -/
def ratLoc : Type _ :=
  @UniformSpace.Completion (Localization.Away s) (P.locUniformSpace T s _ hden)

instance : UniformSpace (ratLoc P T s hden) :=
  @UniformSpace.Completion.uniformSpace _ (P.locUniformSpace T s _ hden)

set_option warn.classDefReducibility false in
/-- The ring structure of `A⟨T/s⟩`, that of the completion. -/
def ratLocCommRing : CommRing (ratLoc P T s hden) :=
  letI := P.locUniformSpace T s (Localization.Away s) hden
  haveI := P.isUniformAddGroup_locUniformSpace T s (Localization.Away s) hden
  haveI := P.isTopologicalRing_locUniformSpace T s (Localization.Away s) hden
  UniformSpace.Completion.commRing (Localization.Away s)

instance : CommRing (ratLoc P T s hden) := ratLocCommRing P T s hden

instance : IsUniformAddGroup (ratLoc P T s hden) :=
  letI := P.locUniformSpace T s (Localization.Away s) hden
  haveI := P.isUniformAddGroup_locUniformSpace T s (Localization.Away s) hden
  haveI := P.isTopologicalRing_locUniformSpace T s (Localization.Away s) hden
  inferInstanceAs (IsUniformAddGroup (UniformSpace.Completion (Localization.Away s)))

instance : IsTopologicalRing (ratLoc P T s hden) :=
  letI := P.locUniformSpace T s (Localization.Away s) hden
  haveI := P.isUniformAddGroup_locUniformSpace T s (Localization.Away s) hden
  haveI := P.isTopologicalRing_locUniformSpace T s (Localization.Away s) hden
  inferInstanceAs (IsTopologicalRing (UniformSpace.Completion (Localization.Away s)))

instance : CompleteSpace (ratLoc P T s hden) :=
  @UniformSpace.Completion.completeSpace _ (P.locUniformSpace T s _ hden)

instance : T2Space (ratLoc P T s hden) :=
  letI := P.locUniformSpace T s (Localization.Away s) hden
  inferInstanceAs (T2Space (UniformSpace.Completion (Localization.Away s)))

instance : Algebra A (ratLoc P T s hden) :=
  letI := P.locUniformSpace T s (Localization.Away s) hden
  haveI := P.isUniformAddGroup_locUniformSpace T s (Localization.Away s) hden
  haveI := P.isTopologicalRing_locUniformSpace T s (Localization.Away s) hden
  (P.toCompletionLoc T s (Localization.Away s) hden).toAlgebra

instance : IsHuberRing (ratLoc P T s hden) :=
  P.isHuberRing_completion_locTopology T s (Localization.Away s) hden

instance [IsTateRing A] : IsTateRing (ratLoc P T s hden) :=
  P.isTateRing_completion_locTopology_of_isTateRing T s (Localization.Away s) hden

/-- The rational localisation as a Huber pair, with Tau Ceti's completed plus ring. -/
def ratLocPair [IsHuberRing A] (Aplus : Pair A) : Pair (ratLoc P T s hden) where
  plus := P.completedPlusSubring Aplus.plus T s (Localization.Away s) hden
  isRingOfIntegralElements :=
    P.isRingOfIntegralElements_completedPlusSubring Aplus.plus
      (fun _ hj ↦ Aplus.isRingOfIntegralElements.mem_of_isTopologicallyNilpotent
        (P.isTopologicallyNilpotent_of_mem_idealOfDefinition hj))
      (fun _ ha ↦ Aplus.isRingOfIntegralElements.isPowerBounded_of_mem ha) T s _ hden

end RatLoc

section StablyPseudoCoherent

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  (M : Type*) [AddCommGroup M] [Module A M]

/-- `M` is *stably `m`-pseudocoherent*: it is `m`-pseudocoherent and every base change
`A⟨T/s⟩ ⊗[A] M` to a rational localisation (`T` generating an open ideal) is complete for its
natural topology (Kedlaya–Liu II, Def. 2.4.1, p. 35). -/
def IsStablyPseudoCoherent (m : ℕ∞) : Prop :=
  IsPseudoCoherentOver A M m ∧
    ∀ (P : PairOfDefinition A) (T : Finset A) (s : A)
      (hden : P.HasDenominatorPower T s (Localization.Away s)),
      IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A) →
        IsNaturallyComplete (ratLoc P T s hden) (ratLoc P T s hden ⊗[A] M)

/-- The `A`-module `B` is *`m`-pseudoflat*: `Tor₁^A(Q, B) = 0` for every stably
`m`-pseudocoherent `Q`, written for `Q = Aⁿ ⧸ K` as injectivity of `K ⊗ B → Aⁿ ⊗ B`
(Kedlaya–Liu II, Def. 2.4.4, p. 36). -/
def IsPseudoFlat (B : Type*) [AddCommGroup B] [Module A B] (m : ℕ∞) : Prop :=
  ∀ (n : ℕ) (K : Submodule A (Fin n → A)),
    IsStablyPseudoCoherent A ((Fin n → A) ⧸ K) m → Function.Injective (K.subtype.rTensor B)

end StablyPseudoCoherent

/-- Flat modules are pseudoflat for every `m`. -/
example (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (B : Type*)
    [AddCommGroup B] [Module A B] [Module.Flat A B] (m : ℕ∞) : IsPseudoFlat A B m := sorry

/-! ### A3.1 Acyclicity and Kiehl glueing for stably pseudocoherent modules
(*rational-localisation-pseudoflat*, *pseudocoherent-tate-acyclicity*, *fpd-local-to-global*,
*pseudocoherent-kiehl-gluing*) -/

section Sheafy

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]

/-- Rational localisations of a sheafy complete Tate ring are `2`-pseudoflat (Kedlaya–Liu II,
Thm. 2.4.15, p. 40). -/
theorem isPseudoFlat_ratLoc (hA : IsSheafyRing A) (P : PairOfDefinition A)
    (T : Finset A) (s : A) (hden : P.HasDenominatorPower T s (Localization.Away s))
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) :
    IsPseudoFlat A (ratLoc P T s hden) 2 := sorry

/-- Tate acyclicity in degree `0`: for a sheafy complete Tate pair, a finite rational covering and
a stably pseudocoherent `M`, the map `M → ∏ᵢ A⟨Tᵢ/sᵢ⟩ ⊗[A] M` is injective (Kedlaya–Liu II,
Thm. 2.5.1, p. 41). -/
theorem cech_injective_of_isStablyPseudoCoherent (hA : IsSheafyRing A) (Aplus : Pair A) {r : ℕ}
    (P : PairOfDefinition A) (T : Fin r → Finset A) (s : Fin r → A)
    (hden : ∀ i, P.HasDenominatorPower (T i) (s i) (Localization.Away (s i)))
    (hT : ∀ i, IsOpen ((Ideal.span (T i : Set A) : Ideal A) : Set A))
    (hcov : spa Aplus.plus ⊆ ⋃ i, rationalSubset Aplus.plus (T i) (s i))
    {M : Type*} [AddCommGroup M] [Module A M] (hM : IsStablyPseudoCoherent A M ⊤) :
    Function.Injective fun x : M ↦ fun i ↦ (1 : ratLoc P (T i) (s i) (hden i)) ⊗ₜ[A] x := sorry

/-- A stably pseudocoherent module that is `m`-fpd on the members of a finite rational covering
is `m`-fpd; for `m = 0`, local finite projectivity is global (Kedlaya–Liu II, Cor. 2.5.2,
p. 41). -/
theorem IsStablyPseudoCoherent.isFPD_of_cover (hA : IsSheafyRing A) (Aplus : Pair A) {r : ℕ}
    (P : PairOfDefinition A) (T : Fin r → Finset A) (s : Fin r → A)
    (hden : ∀ i, P.HasDenominatorPower (T i) (s i) (Localization.Away (s i)))
    (hT : ∀ i, IsOpen ((Ideal.span (T i : Set A) : Ideal A) : Set A))
    (hcov : spa Aplus.plus ⊆ ⋃ i, rationalSubset Aplus.plus (T i) (s i))
    {M : Type*} [AddCommGroup M] [Module A M] (hM : IsStablyPseudoCoherent A M ⊤) (m : ℕ)
    (h : ∀ i, Module.IsFPD (ratLoc P (T i) (s i) (hden i))
      (ratLoc P (T i) (s i) (hden i) ⊗[A] M) m) :
    Module.IsFPD A M m := sorry

/-- Base extension to a rational localisation is exact on short exact sequences whose cokernel is
stably pseudocoherent (Kedlaya–Liu II, Cor. 2.5.6, p. 43). -/
theorem exact_tensor_ratLoc (hA : IsSheafyRing A) (P : PairOfDefinition A) (T : Finset A) (s : A)
    (hden : P.HasDenominatorPower T s (Localization.Away s))
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) {M₁ M M₂ : Type*}
    [AddCommGroup M₁] [Module A M₁] [AddCommGroup M] [Module A M] [AddCommGroup M₂] [Module A M₂]
    {f : M₁ →ₗ[A] M} {g : M →ₗ[A] M₂} (hf : Function.Injective f) (hfg : Function.Exact f g)
    (hg : Function.Surjective g) (hM₂ : IsStablyPseudoCoherent A M₂ ⊤) :
    Function.Injective (f.lTensor (ratLoc P T s hden)) ∧
      Function.Exact (f.lTensor (ratLoc P T s hden)) (g.lTensor (ratLoc P T s hden)) ∧
      Function.Surjective (g.lTensor (ratLoc P T s hden)) := sorry

end Sheafy

/-! ### A3.2 Standard étale presentations (*standard-etale-presentation*,
*standard-presentation-basic-pieces*) -/

section TateSeries

variable (N : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A] [NonarchimedeanRing A]

/-- The ring `A⟨T₁, …, T_N⟩` of restricted power series (Tau Ceti's `weightedRestrictedSubring` at
trivial weights); for complete `A` it is the Tate algebra `restrictedMvPowerSeriesCompletion N A`,
and as a ring of series it carries termwise partial derivatives. -/
abbrev tateSeries : Type _ :=
  weightedRestrictedSubring (fun _ : Fin N ↦ ({1} : Set A)) isWeightFamily_one_weight

/-- The variable `Tᵢ ∈ A⟨T⟩`. -/
def tateSeries.X (i : Fin N) : tateSeries N A :=
  weightedX (fun _ : Fin N ↦ ({1} : Set A)) isWeightFamily_one_weight i

/-- `A⁺⟨T⟩`: the restricted series all of whose coefficients lie in `A⁺`. -/
def tateSeriesPlus (Aplus : Subring A) : Subring (tateSeries N A) :=
  (MvPowerSeries.map Aplus.subtype).range.comap (Subring.subtype _)

end TateSeries

/-- Coefficients of a series in `A⁺⟨T⟩` lie in `A⁺`. -/
example (N : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A] [NonarchimedeanRing A]
    (Aplus : Subring A) (f : tateSeries N A) (hf : f ∈ tateSeriesPlus N A Aplus)
    (ν : Fin N →₀ ℕ) : MvPowerSeries.coeff ν (f : MvPowerSeries (Fin N) A) ∈ Aplus := sorry

/-- A *standard étale presentation* `(N, F, k, π)` of the complete Huber pair `(C, C⁺)` over the
complete Tate pair `(A, A⁺)` with pseudouniformiser `ϖ`: equations `F ∈ A⁺⟨T₁, …, T_N⟩^N` (as many
equations as variables) and a quotient map `π : A⟨T⟩ → C` over `A` with kernel the closure of
`(F₁, …, F_N)`, `C⁺` the integral closure of `π(A⁺⟨T⟩)`, and Jacobian `J_F = det(∂Fᵢ/∂T_j)` mapping
to a unit `u` of `C` with `ϖᵏ u⁻¹ ∈ C⁺` (Scholze, ECD, §6, proof of Prop. 6.4(iv); Huber 1996,
Prop. 1.7.1, p. 80). -/
structure StandardEtalePresentation {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A] (Aplus : Pair A) (ϖ : A)
    {C : Type*} [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
    [Algebra A C] (Cplus : Pair C) where
  /-- `ϖ` is a pseudouniformiser of `A`. -/
  isPseudoUniformizer : IsPseudoUniformizer ϖ
  /-- The number of variables and of equations. -/
  N : ℕ
  /-- The equations. -/
  F : Fin N → tateSeries N A
  F_mem_plus : ∀ i, F i ∈ tateSeriesPlus N A Aplus.plus
  /-- The exponent bounding the inverse Jacobian. -/
  k : ℕ
  /-- The quotient map `π : A⟨T⟩ → C`. -/
  π : tateSeries N A →ₐ[A] C
  isQuotientMap_π : IsQuotientMap π
  ker_π : RingHom.ker π = (Ideal.span (Set.range F)).closure
  mem_plus_iff : ∀ c : C, c ∈ Cplus.plus ↔
    ((tateSeriesPlus N A Aplus.plus).map (π : tateSeries N A →+* C)).subtype.IsIntegralElem c
  exists_unit_jacobian : ∃ J : tateSeries N A,
    (J : MvPowerSeries (Fin N) A) =
      (Matrix.of fun i j ↦ MvPowerSeries.pderiv j (F i : MvPowerSeries (Fin N) A)).det ∧
    ∃ u : Cˣ, (u : C) = π J ∧ algebraMap A C (ϖ ^ k) * ↑u⁻¹ ∈ Cplus.plus

section StandardEtale

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] {Aplus : Pair A} {ϖ : A}

/-- Rational localisations have standard étale presentations: for `s₁, …, sₙ, t ∈ A⁺` with some
`sᵢ = ϖ^c`, the equations `t Tᵢ − sᵢ` present `A⟨s/t⟩` with exponent `c n` (Kedlaya–Liu I,
Lemma 2.4.13(a)). -/
theorem StandardEtalePresentation.nonempty_ratLocPair [DecidableEq A]
    (hϖ : IsPseudoUniformizer ϖ) {n : ℕ} (s : Fin n → A) (t : A) (c : ℕ)
    (hs : ∀ i, s i ∈ Aplus.plus) (ht : t ∈ Aplus.plus) (hc : ∃ i, s i = ϖ ^ c)
    (P₀ : PairOfDefinition A)
    (hden : P₀.HasDenominatorPower (Finset.univ.image s) t (Localization.Away t)) :
    Nonempty (StandardEtalePresentation Aplus ϖ
      (ratLocPair P₀ (Finset.univ.image s) t hden Aplus)) := sorry

/-- Finite étale algebras with their natural topology and integral-closure plus ring have
standard étale presentations: an étale algebra is presented by as many equations as variables
with invertible Jacobian, and the presentation completes. -/
theorem StandardEtalePresentation.nonempty_of_finiteEtale (hϖ : IsPseudoUniformizer ϖ)
    {S : Type*} [CommRing S] [Algebra A S] [Module.Finite A S] [Algebra.Etale A S]
    [TopologicalSpace S] [IsModuleTopology A S] [IsTopologicalRing S] [IsHuberRing S]
    (Splus : Pair S)
    (hplus : Splus.plus = (integralClosure ↥(Aplus.plus.map (algebraMap A S)) S).toSubring) :
    Nonempty (StandardEtalePresentation Aplus ϖ Splus) := sorry

end StandardEtale

end Huber

end

/-! ## Layer A4: analytic adic presentations for diamondification -/

noncomputable section

universe u

open TensorProduct Topology UniformSpace Polynomial

/-! ### A4.1 Rings without nonsplit finite étale covers (*finite-etale-split-ring*) -/

namespace Algebra

/-- `T` is *totally split* over `R` if `T ≃ₐ[R] ∏_{j < m} R ⧸ (1 − e_j)` for finitely many
idempotents `e_j` (Scholze, ECD, Lemma 15.3, p. 90); over a connected ring this is Mathlib's
`Algebra.IsFiniteSplit`, over a disconnected ring the rank may vary. -/
def IsTotallySplit (R T : Type*) [CommRing R] [CommRing T] [_root_.Algebra R T] : Prop :=
  ∃ (m : ℕ) (e : Fin m → R), (∀ j, IsIdempotentElem (e j)) ∧
    Nonempty (T ≃ₐ[R] ((j : Fin m) → R ⧸ Ideal.span {1 - e j}))

/-- The zero algebra is totally split (the empty product). -/
example (R : Type) [CommRing R] : IsTotallySplit R (Fin 0 → R) :=
  ⟨0, Fin.elim0, fun j ↦ j.elim0, ⟨AlgEquiv.piCongrRight fun j ↦ j.elim0⟩⟩

/-- Ranks one and zero on the two components of `ℚ × ℚ`: totally split, not finite split. -/
example :
    let R := ℚ × ℚ
    let S := R ⧸ Ideal.span {1 - ((1, 0) : R)}
    IsTotallySplit R S ∧ ¬ _root_.Algebra.IsFiniteSplit R S := sorry

end Algebra

/-- `R` *has no nonsplit finite étale covers* if every finite étale `R`-algebra is totally split
(the conclusion of Scholze, ECD, Lemma 15.3, p. 90, for the colimit of the tower). -/
class IsFiniteEtaleSplit (R : Type u) [CommRing R] : Prop where
  /-- Every finite étale `R`-algebra is totally split. -/
  isTotallySplit : ∀ (T : Type u) [CommRing T] [_root_.Algebra R T] [_root_.Algebra.Etale R T]
    [Module.Finite R T], Algebra.IsTotallySplit R T

/-- Equivalently, every finite étale faithfully flat algebra has a section; faithful flatness is
needed, since the zero algebra has no section over a nonzero ring. -/
theorem isFiniteEtaleSplit_iff_exists_section (R : Type u) [CommRing R] :
    IsFiniteEtaleSplit R ↔ ∀ (T : Type u) [CommRing T] [_root_.Algebra R T]
      [_root_.Algebra.Etale R T] [Module.Finite R T] [Module.FaithfullyFlat R T],
      Nonempty (T →ₐ[R] R) := sorry

/-- A monic `P` of positive degree whose derivative is a unit modulo `P` has a root (the form in
which the proof of ECD Lemma 15.3 uses the hypothesis). -/
theorem IsFiniteEtaleSplit.exists_root {R : Type u} [CommRing R] [IsFiniteEtaleSplit R]
    {P : R[X]} (hP : P.Monic) (hd : 0 < P.natDegree)
    (hu : IsUnit (AdjoinRoot.mk P (derivative P))) : ∃ r : R, P.IsRoot r := sorry

/-- A field has no nonsplit finite étale covers iff it is separably closed. -/
theorem isFiniteEtaleSplit_iff_isSepClosed (K : Type u) [Field K] :
    IsFiniteEtaleSplit K ↔ IsSepClosed K := sorry

/-- `ℚ_p` has nonsplit finite étale covers: `ℚ_p[X]/(X² − p)` has no section (also for `p = 2`). -/
example (p : ℕ) [Fact p.Prime] : ¬ IsFiniteEtaleSplit ℚ_[p] := sorry

/-- A strictly henselian local ring has none, without being a field: `𝒪_{ℂ_p}` is an instance. -/
example (R : Type) [CommRing R] [HenselianLocalRing R]
    [IsSepClosed (IsLocalRing.ResidueField R)] : IsFiniteEtaleSplit R := sorry

/-! ### A4.2 Finite étale torsors (*finite-etale-galois-torsor*,
*splitting-torsor-of-finite-etale-algebra*) -/

namespace Algebra

section Torsor

variable (G A B : Type*) [Group G] [CommRing A] [CommRing B] [_root_.Algebra A B]
  [MulSemiringAction G B] [SMulCommClass G A B]

/-- The Galois map `B ⊗[A] B → Map(G, B)`, `b ⊗ b' ↦ (g ↦ b * g • b')`. -/
def galoisTensorMap : B ⊗[A] B →ₐ[B] (G → B) :=
  _root_.Algebra.TensorProduct.lift (_root_.Algebra.ofId B (G → B))
    (AlgHom.pi fun g ↦ MulSemiringAction.toAlgHom A B g) fun _ _ ↦ Commute.all _ _

/-- `B` is a *finite étale `G`-torsor* over `A`: finite étale, faithfully flat, with bijective
Galois map (`Spec B → Spec A` is a torsor under the constant group `G`; Scholze, ECD, §15, proof
of Prop. 15.4, p. 91). -/
class IsFiniteEtaleTorsor [Finite G] : Prop where
  etale : _root_.Algebra.Etale A B
  finite : Module.Finite A B
  faithfullyFlat : Module.FaithfullyFlat A B
  bijective_galoisTensorMap : Function.Bijective (galoisTensorMap G A B)

end Torsor

/-- A finite étale `G`-torsor has constant rank `|G|`. -/
example {G A B : Type*} [Group G] [Finite G] [CommRing A] [CommRing B] [_root_.Algebra A B]
    [MulSemiringAction G B] [SMulCommClass G A B] [IsFiniteEtaleTorsor G A B] (q) :
    Module.rankAtStalk (R := A) B q = Nat.card G := sorry

/-- For fields, a finite étale `G`-torsor is a Galois extension with group `G`. -/
theorem IsFiniteEtaleTorsor.iff_isGalois {G : Type*} [Group G] [Finite G] {K L : Type*} [Field K]
    [Field L] [_root_.Algebra K L] [MulSemiringAction G L] [SMulCommClass G K L] :
    IsFiniteEtaleTorsor G K L ↔
      IsGalois K L ∧ Function.Bijective (MulSemiringAction.toAlgAut G K L) := sorry

/-- Every finite étale algebra is split by a finite étale torsor, a Galois closure (Scholze, ECD,
§15, proof of Lemma 15.3, p. 90; Kedlaya–Liu I, Rem. 1.4.7(c); Stacks, Tag 0BN2). -/
theorem exists_isFiniteEtaleTorsor_isTotallySplit (A S : Type u) [CommRing A]
    [CommRing S] [_root_.Algebra A S] [_root_.Algebra.Etale A S] [Module.Finite A S] :
    ∃ (G : Type u) (_ : Group G) (_ : Finite G) (P : Type u) (_ : CommRing P)
      (_ : _root_.Algebra A P) (_ : MulSemiringAction G P) (_ : SMulCommClass G A P),
      IsFiniteEtaleTorsor G A P ∧ IsTotallySplit P (P ⊗[A] S) := sorry

end Algebra

/-! ### A4.3 The finite étale torsor tower (*finite-etale-torsor-tower*) -/

/-- A *finite étale torsor tower* over `A`: a directed system of finite étale `Gᵢ`-torsors `Aᵢ`
with surjective transition maps on groups, equivariant transition maps on rings, and colimit
`A_∞` without nonsplit finite étale covers (Scholze, ECD, §15, before Lemma 15.3). -/
structure FiniteEtaleTorsorTower (A : Type u) [CommRing A] where
  /-- The directed index set. -/
  ι : Type u
  [preorder : Preorder ι]
  [directed : IsDirectedOrder ι]
  [nonempty : Nonempty ι]
  /-- The finite groups `Gᵢ`. -/
  G : ι → Type u
  [instGroup : ∀ i, Group (G i)]
  [finite : ∀ i, Finite (G i)]
  /-- The surjections `G_j → G_i`. -/
  π : ∀ ⦃i j : ι⦄, i ≤ j → G j →* G i
  π_surjective : ∀ ⦃i j : ι⦄ (h : i ≤ j), Function.Surjective (π h)
  π_id : ∀ i (g : G i), π (le_refl i) g = g
  π_comp : ∀ ⦃i j k : ι⦄ (hij : i ≤ j) (hjk : j ≤ k) (g : G k),
    π hij (π hjk g) = π (hij.trans hjk) g
  /-- The levels `Aᵢ`. -/
  level : ι → Type u
  [commRing : ∀ i, CommRing (level i)]
  [algebra : ∀ i, _root_.Algebra A (level i)]
  [action : ∀ i, MulSemiringAction (G i) (level i)]
  [smulCommClass : ∀ i, SMulCommClass (G i) A (level i)]
  isTorsor : ∀ i, Algebra.IsFiniteEtaleTorsor (G i) A (level i)
  /-- The transition maps `Aᵢ → A_j`. -/
  transition : ∀ ⦃i j : ι⦄, i ≤ j → level i →ₐ[A] level j
  transition_smul : ∀ ⦃i j : ι⦄ (h : i ≤ j) (g : G j) (a : level i),
    transition h (π h g • a) = g • transition h a
  transition_id : ∀ i (a : level i), transition (le_refl i) a = a
  transition_comp : ∀ ⦃i j k : ι⦄ (hij : i ≤ j) (hjk : j ≤ k) (a : level i),
    transition hjk (transition hij a) = transition (hij.trans hjk) a
  /-- The colimit `A_∞` has no nonsplit finite étale covers. -/
  split : IsFiniteEtaleSplit (_root_.Ring.DirectLimit level fun _ _ h ↦ transition h)

namespace FiniteEtaleTorsorTower

attribute [instance] preorder directed nonempty instGroup finite commRing algebra action
  smulCommClass

variable {A : Type u} [CommRing A] (T : FiniteEtaleTorsorTower A)

/-- The colimit `A_∞ = colim_i Aᵢ`. -/
def colim : Type u := _root_.Ring.DirectLimit T.level fun _ _ h ↦ T.transition h

/-- Every ring has a finite étale torsor tower (index the finite sets of finite étale algebras
and take Galois closures; Scholze, ECD, proof of Lemma 15.3). -/
theorem nonempty_tower (A : Type u) [CommRing A] : Nonempty (FiniteEtaleTorsorTower A) :=
  sorry

/-- Every finite étale `A`-algebra becomes totally split at some level. -/
theorem exists_level_totallySplit (S : Type u) [CommRing S] [_root_.Algebra A S]
    [_root_.Algebra.Etale A S] [Module.Finite A S] :
    ∃ i, Algebra.IsTotallySplit (T.level i) (T.level i ⊗[A] S) := sorry

end FiniteEtaleTorsorTower

/-! ### A4.5–A4.6 Henselian property and perfectoidness of split Tate rings
(*power-bounded-henselian-along-pseudouniformizer*, *pseudouniformizer-dividing-p*,
*split-tate-ring-is-perfectoid*) -/

namespace Huber

/-- For a complete Tate ring and a pseudouniformiser `ϖ ∈ A°`, the pair `(A°, ϖ A°)` is henselian:
`A°` is the directed union of the `ϖ`-adically complete rings of definition containing `ϖ`
(Wedhorn, Cor. 6.4(3), p. 47; Stacks, Tag 0FWT), although it need not be `ϖ`-adically separated. -/
theorem henselianRing_powerBoundedSubring {A : Type u} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A]
    (ϖ : powerBoundedSubring A) (hϖ : IsPseudoUniformizer (ϖ : A)) :
    HenselianRing (powerBoundedSubring A) (Ideal.span {ϖ}) := sorry

section SplitTate

variable {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R] [IsFiniteEtaleSplit R]

/-- If `p` is topologically nilpotent in a complete Tate ring without nonsplit finite étale
covers, there is a pseudouniformiser `ϖ ∈ R°` with `p = ϖ^p y`, `y ∈ R°` topologically nilpotent
(a root of `X^{p^n} − ϖ₀ X − ϖ₀`; Scholze, ECD, proof of Lemma 15.3, p. 90). -/
theorem exists_isPseudoUniformizer_pow_dvd_p (p : ℕ) [Fact p.Prime]
    (hp : IsTopologicallyNilpotent (p : R)) :
    ∃ ϖ : R, IsPseudoUniformizer ϖ ∧ ϖ ∈ powerBoundedSubring R ∧
      ∃ y ∈ powerBoundedSubring R, (p : R) = ϖ ^ p * y ∧ IsTopologicallyNilpotent y := sorry

/-- A complete uniform Tate ring without nonsplit finite étale covers in which `p` is
topologically nilpotent is perfectoid (Scholze, ECD, Lemma 15.3, p. 90; Berkeley, Lemma 10.1.6,
p. 75). -/
theorem isPerfectoid_of_isFiniteEtaleSplit (p : ℕ) [Fact p.Prime]
    (hp : IsTopologicallyNilpotent (p : R)) (hu : IsBounded (powerBoundedSubring R : Set R)) :
    PerfectoidInput.IsPerfectoidTateRing p R := sorry

end SplitTate

end Huber

/-- Equality `p^{n−1} = n` is not enough in the proof of Lemma 15.3: over `ℂ_2`, a root `ϖ` of
`X⁴ − 4X − 4` has `|ϖ²| = |2|`, so `2/ϖ²` is a unit, not topologically nilpotent. -/
example (ϖ : ℂ_[2]) (hϖ : ϖ ^ 4 - 4 * ϖ - 4 = 0) :
    ‖ϖ ^ 2‖ = ‖(2 : ℂ_[2])‖ ∧ IsUnit (2 / ϖ ^ 2) ∧ ¬ IsTopologicallyNilpotent (2 / ϖ ^ 2) := sorry

/-! ### A4.7 Adic spectra of a torsor (*torsor-spa-orbits*) -/

namespace ValuationSpectrum

open TauCeti.ValuationSpectrum

/-- For a finite étale `G`-torsor `B` over a complete Tate pair `(A, A⁺)`, with `B` carrying its
natural topology and `B⁺` the integral closure of `A⁺`, the map `Spa(B, B⁺) → Spa(A, A⁺)` is
surjective and open, with fibres the `G`-orbits for `(g • y)(b) = y(g⁻¹ b)`; hence
`|Spa(B, B⁺)| / G ≅ |Spa(A, A⁺)|` (Scholze, ECD, §15, proof of Prop. 15.4, p. 91; Kedlaya–Liu I,
proof of Lemma 9.1.9, p. 191). -/
theorem spaComap_orbits_of_isFiniteEtaleTorsor {G A B : Type u} [Group G] [Finite G]
    [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A]
    [CompleteSpace A] [T2Space A] [CommRing B] [_root_.Algebra A B] [MulSemiringAction G B]
    [SMulCommClass G A B] [Algebra.IsFiniteEtaleTorsor G A B] [TopologicalSpace B]
    [IsModuleTopology A B] [IsTopologicalRing B] [IsTateRing B] (S : Pair A) (T : Pair B)
    (hT : T.plus = (integralClosure (S.plus.map (algebraMap A B)) B).toSubring)
    (q : Pair.Hom S T) (hq : q.toRingHom = algebraMap A B) :
    Function.Surjective q.spaComap ∧ IsOpenMap q.spaComap ∧
      ∀ x y : spa T.plus, q.spaComap x = q.spaComap y ↔
        ∃ g : G, (y : Spv B) = comap (MulSemiringAction.toRingHom G B g⁻¹) x := sorry

end ValuationSpectrum

end

end TauCetiRoadmap.AdicEtaleGeometry
