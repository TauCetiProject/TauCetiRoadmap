import Mathlib
import TauCeti.Algebra.AlgebraicGroup.BaseChange.Basic
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Smooth.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.CharacterLattice.Basic
import TauCeti.Algebra.AlgebraicGroup.Derived.Basic
import TauCeti.Algebra.AlgebraicGroup.Dynamic.Parabolic
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic
import TauCeti.Algebra.AlgebraicGroup.Tangent.FiniteType
import TauCeti.Algebra.AlgebraicGroup.Tangent.Representation
import TauCeti.NumberTheory.LocalField.NormalizedValuation

/-!
# Reductive algebraic groups, Part II: headline theorems

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
These statements give Lean forms for headline results; discharging them finishes neither a layer
nor the roadmap.

The statements cover affine Weil representability (RG2.0a), Steinberg–Borel–Springer vanishing
and existence of z-extensions (RG2.1), Ihara's amalgam theorem and tame fixed-scheme smoothness
(RG2.2), the Bruhat–Tits extension principle and finite-type and pro-algebraic Lang theorems
(RG2.3), and the local adjoint-modulus formula, reductive unimodularity and local Kneser–Tits
(RG2.4). Points are Tau Ceti's convolution groups of algebra maps. The modulus and unimodularity
statements use right pushforwards of Haar measures, with the evaluation topology, to express the
modular-character identities without auxiliary topology hypotheses.

The general valued-root-datum existence and Kottwitz theorems need the relative-root realization,
absolute root datum with its Galois action, and algebraic fundamental group attached to an arbitrary
reductive group. Those carriers are absent at the pins. Bruhat–Tits buildings, facets, parahoric
models, Néron models of tori and Moy–Prasad filtrations are absent as well, so their existence, descent and comparison
theorems, the general Cartan, Iwasawa and Iwahori–Bruhat decompositions, double-coset counts and
admissible-set comparisons have no signatures here. The parabolic adjoint-determinant identity
needs a represented arbitrary parabolic with its Levi decomposition and tangent comparison;
the native cocharacter point subgroups alone do not provide these objects. The integral dual-group and L-group theorems
need the Chevalley–Demazure construction for an arbitrary based reductive root datum and its
identification with the group's absolute datum; these are also absent. Root-pairing flips and
abstract semidirect products alone do not state those results.
-/

namespace TauCetiRoadmap.ReductiveGroupsPartII

noncomputable section

open CategoryTheory
open scoped TensorProduct

universe u v

namespace WeilRestriction

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  (A' : Type u) [CommRing A'] [Algebra k' A']

/-- The functor of points of the Weil restriction: `R ↦ Hom_{k'}(A', k' ⊗_k R)`. -/
def functor : CommAlgCat.{u} k ⥤ Type u where
  obj R := A' →ₐ[k'] k' ⊗[k] R
  map {R S} f := TypeCat.ofHom fun g => (Algebra.TensorProduct.map (AlgHom.id k' k') f.hom).comp g
  map_id _ := by
    ext g a
    simp
  map_comp _ _ := by
    ext g a
    simp [Algebra.TensorProduct.map_id_comp]

/-- For `k → k'` finite locally free, the Weil restriction of every affine `k'`-scheme is an affine
`k`-scheme: its functor of points is corepresentable (Bruhat–Tits II, 1.5.1–1.5.7, pp. 26–29). -/
theorem functor_isCorepresentable [Module.Finite k k'] [Module.Projective k k'] :
    (functor k k' A').IsCorepresentable := sorry

end WeilRestriction

namespace ZExtension

/-- The scheme-theoretic derived subgroup is semisimple and simply connected. -/
def DerivedSimplyConnected {K : Type u} [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) : Prop :=
  ∃ h : TauCeti.semisimpleCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (TauCeti.CommHopfAlgCat.derivedDefiningIdeal H)),
    TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty K
      ⟨TauCeti.FiniteTypeCommHopfAlgCat.quotient H (TauCeti.CommHopfAlgCat.derivedDefiningIdeal H), h⟩

/-- `f` is the coordinate map of a z-extension `G̃ → G` (Nguyễn Quốc Thắng, §2.0, p. 4): both groups
reductive, `f` injective, `G̃_der` simply connected, and the kernel, cut out by the Hopf ideal `I`,
a central induced torus (its geometric characters have a finite Galois-permuted basis). -/
def IsZExtension {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : (G : Type u) →ₐc[K] (Gt : Type u)) : Prop :=
  TauCeti.reductiveCommHopfAlgProperty K G ∧
  TauCeti.reductiveCommHopfAlgProperty K Gt ∧
  Function.Injective f ∧ DerivedSimplyConnected Gt ∧
  ∃ I : TauCeti.HopfIdeal K Gt,
    TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient Gt I) ∧
    (∃ (B : Type u) (_ : Fintype B)
      (b : Module.Basis B ℤ (TauCeti.CommHopfAlgCat.additiveCharacterGroup
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient Gt I).obj)),
      ∀ (γ : Field.absoluteGaloisGroup K) (x : B), ∃ y : B, γ • b x = b y) ∧
    (∀ (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (Gt →ₐ[K] R)),
      g ∈ TauCeti.CommHopfAlgCat.quotientPointsSubgroup Gt.obj I (CommAlgCat.of K R) ↔
        WithConv.toConv (g.ofConv.comp (f : G →ₐ[K] Gt)) = (1 : WithConv (G →ₐ[K] R))) ∧
    (∀ (R : Type u) [CommRing R] [Algebra K R]
      (z : TauCeti.CommHopfAlgCat.quotientPointsSubgroup Gt.obj I (CommAlgCat.of K R))
      (g : WithConv (Gt →ₐ[K] R)), Commute z.val g)

/-- Every connected reductive group over a field has a z-extension (Nguyễn Quốc Thắng, Lemma 2.1(a),
p. 4). -/
theorem exists_zExtension {K : Type u} [Field K] (G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (_hG : TauCeti.reductiveCommHopfAlgProperty K G) :
    ∃ (Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (f : (G : Type u) →ₐc[K] (Gt : Type u)),
      IsZExtension f := sorry

end ZExtension

namespace Steinberg

open ValuativeRel

/-- Steinberg–Borel–Springer vanishing over a henselian discretely valued field with algebraically
closed residue field, expressed on every finite Galois splitting extension (RG2.1.1).
In characteristic zero the assertion holds for every smooth geometrically connected affine group;
in arbitrary characteristic it holds for every connected reductive group. -/
theorem h1_vanishes (K : Type u) [Field K] [ValuativeRel K]
    [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    [HenselianLocalRing 𝒪[K]] [IsAlgClosed 𝓀[K]]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (hsm : TauCeti.smoothCommHopfAlgProperty K H.obj)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj)
    (hH : ringChar K = 0 ∨ TauCeti.reductiveCommHopfAlgProperty K H)
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    (c : (L ≃ₐ[K] L) → WithConv (H →ₐ[K] L))
    (hc : ∀ γ δ, c (γ * δ) = c γ * TauCeti.AlgHom.mapValue γ.toAlgHom (c δ)) :
    ∃ b : WithConv (H →ₐ[K] L), ∀ γ,
      c γ = b⁻¹ * TauCeti.AlgHom.mapValue γ.toAlgHom b := sorry

end Steinberg

namespace BTTree

open scoped Pointwise

/-- Ihara's theorem for any two adjacent lattice classes over a discretely valued field:
the canonical map from the amalgam of their SL₂ stabilizers onto SL₂ is an isomorphism
(Serre, *Trees*, Ch. II §1.4, Theorem 3, p. 110). -/
theorem ihara (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (K : Type u) [Field K] [Algebra O K] [IsFractionRing O K]
    (Λ₀ Λ₁ : Submodule O (Fin 2 → K)) [Λ₀.IsLattice K] [Λ₁.IsLattice K]
    (ϖ : O) (hϖ : Irreducible ϖ)
    (h₀ : Submodule.span O ((fun x : Fin 2 → K => ϖ • x) '' (Λ₀ : Set (Fin 2 → K))) < Λ₁)
    (h₁ : Λ₁ < Λ₀) :
    let C₀ := MulAction.stabilizer (Matrix.SpecialLinearGroup (Fin 2) K) (Λ₀ : Set (Fin 2 → K))
    let C₁ := MulAction.stabilizer (Matrix.SpecialLinearGroup (Fin 2) K) (Λ₁ : Set (Fin 2 → K))
    let C : Bool → Subgroup (Matrix.SpecialLinearGroup (Fin 2) K) := fun b => if b then C₁ else C₀
    let J := C₀ ⊓ C₁
    let φ : ∀ b, J →* C b := fun b => Subgroup.inclusion (by
      cases b
      · exact inf_le_left
      · exact inf_le_right)
    Function.Bijective (Monoid.PushoutI.lift (φ := φ) (fun b => (C b).subtype) J.subtype
      (fun _ => rfl)) := sorry

end BTTree

namespace TameDescent

/-- Edixhoven's theorem: fixed points of a finite group of invertible order acting on a smooth
affine group are represented by a smooth closed subgroup (Props. 3.1 and 3.4, pp. 293–295). -/
theorem smooth_fixedPoints {k : Type u} [CommRing k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hH : TauCeti.smoothCommHopfAlgProperty k H.obj) (Θ : Type u) [Group Θ] [Finite Θ]
    (ρ : Θ →* CategoryTheory.Aut H) (hΘ : IsUnit (Nat.card Θ : k)) :
    ∃ (H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) (f : H ⟶ H'),
      TauCeti.smoothCommHopfAlgProperty k H'.obj ∧ Function.Surjective f.hom.hom ∧
      ∀ (R : Type u) [CommRing R] [Algebra k R],
        Set.range (TauCeti.AlgHom.mapDomain (A := R) (f.hom.hom : (H : Type u) →ₐc[k] H')) =
          {g | ∀ θ : Θ,
            TauCeti.AlgHom.mapDomain (A := R) ((ρ θ).hom.hom.hom : (H : Type u) →ₐc[k] H) g = g} :=
  sorry

end TameDescent

namespace IntegralModel

/-- The integral-point subgroup in the generic fibre, via coefficient inclusion and base change. -/
def integralPoints (O : Type u) [CommRing O] (K : Type u) [Field K] [Algebra O K]
    (A : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} O) :
    Subgroup (WithConv (K ⊗[O] A →ₐ[K] K)) :=
  ((TauCeti.AlgHom.baseChangePointsMulEquiv (k := O) (K := K) (A := A) (R := K)).toMonoidHom.comp
    (TauCeti.AlgHom.mapValue (H := A) (Algebra.ofId O K))).range

/-- The Bruhat–Tits extension principle: a generic-fibre homomorphism extends uniquely to smooth
models over a strictly henselian DVR exactly when it preserves integral points
(Bruhat–Tits II, 1.7.3 c) and 1.7.6, pp. 38–39). -/
theorem extend_iff (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [HenselianLocalRing O] [IsSepClosed (IsLocalRing.ResidueField O)]
    (K : Type u) [Field K] [Algebra O K] [IsFractionRing O K]
    (A A' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} O)
    [Algebra.Smooth O A] [Algebra.Smooth O A']
    (f : TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) A' ⟶
      TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) A) :
    (∃! F : A' ⟶ A, TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) F = f) ↔
      ∀ g ∈ integralPoints O K A,
        TauCeti.AlgHom.mapDomain f.hom.hom g ∈ integralPoints O K A' := sorry

end IntegralModel

namespace Lang

/-- Lang's theorem: for a smooth geometrically connected finite-type group over a finite field `F`
and `σ` the `|F|`-power Frobenius, `g ↦ g⁻¹ σ(g)` is surjective on `H(F̄)` (Milne, *Algebraic
groups*, Prop. 27.54 and Cor. 27.55, v2.00 pp. 487–488). -/
theorem lang_surjective {F : Type u} [Field F] [Fintype F]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (_hsm : TauCeti.smoothCommHopfAlgProperty F H.obj)
    (_hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F H.obj)
    (σ : AlgebraicClosure F →ₐ[F] AlgebraicClosure F)
    (_hσ : ∀ z, σ z = z ^ Fintype.card F) :
    Function.Surjective fun g : WithConv (H →ₐ[F] AlgebraicClosure F) =>
      g⁻¹ * WithConv.toConv (σ.comp g.ofConv) := sorry

/-- Lang's theorem for a directed inverse system of smooth geometrically connected finite-type
groups over a finite field, on compatible families of geometric points: the Lang fibres are finite
and nonempty (Milne, *Algebraic groups*, Cor. 27.55, v2.00 p. 488), so they have a compatible
section. -/
theorem lang_proAlgebraic_surjective {F : Type u} [Field F] [Fintype F]
    {ι : Type v} [Preorder ι] [Nonempty ι]
    (hdir : ∀ i j : ι, ∃ k, i ≤ k ∧ j ≤ k)
    (H : ι → TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (hsm : ∀ i, TauCeti.smoothCommHopfAlgProperty F (H i).obj)
    (hconn : ∀ i, TauCeti.geometricallyConnectedCommHopfAlgProperty F (H i).obj)
    (f : ∀ i j, i ≤ j → (H i ⟶ H j))
    (fid : ∀ i, f i i le_rfl = 𝟙 (H i))
    (fcomp : ∀ i j k (hij : i ≤ j) (hjk : j ≤ k),
      f i j hij ≫ f j k hjk = f i k (hij.trans hjk))
    (σ : AlgebraicClosure F →ₐ[F] AlgebraicClosure F)
    (hσ : ∀ z, σ z = z ^ Fintype.card F)
    (a : ∀ i, WithConv (H i →ₐ[F] AlgebraicClosure F))
    (ha : ∀ i j (hij : i ≤ j),
      WithConv.toConv ((a j).ofConv.comp
        (TauCeti.FiniteTypeCommHopfAlgCat.toBialgHom (f i j hij)).toAlgHom) = a i) :
    ∃ g : ∀ i, WithConv (H i →ₐ[F] AlgebraicClosure F),
      (∀ i j (hij : i ≤ j),
        WithConv.toConv ((g j).ofConv.comp
          (TauCeti.FiniteTypeCommHopfAlgCat.toBialgHom (f i j hij)).toAlgHom) = g i) ∧
      ∀ i, (g i)⁻¹ * WithConv.toConv (σ.comp (g i).ofConv) = a i := sorry

end Lang

namespace Decomposition

/-- Absolute almost simplicity: a nontrivial semisimple group has no proper nontrivial smooth
connected normal subgroup over the algebraic closure. -/
def IsAbsolutelyAlmostSimple (K : Type u) [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) : Prop :=
  TauCeti.semisimpleCommHopfAlgProperty K H ∧ TauCeti.HopfIdeal.augmentation K H ≠ ⊥ ∧
    ∀ I : TauCeti.HopfIdeal (AlgebraicClosure K)
        (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := AlgebraicClosure K) H),
      I.IsNormal →
      TauCeti.smoothCommHopfAlgProperty (AlgebraicClosure K)
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient
          (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := AlgebraicClosure K) H) I).obj →
      TauCeti.geometricallyConnectedCommHopfAlgProperty (AlgebraicClosure K)
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient
          (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := AlgebraicClosure K) H) I).obj →
      I = ⊥ ∨ I = TauCeti.HopfIdeal.augmentation (AlgebraicClosure K)
        (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := AlgebraicClosure K) H)

/-- The subgroup generated by the unipotent radicals of rational parabolics, expressed through
Tau Ceti's cocharacter unipotent subgroups. -/
def plusSubgroup (K : Type u) [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) : Subgroup (WithConv (H →ₐ[K] K)) :=
  ⨆ l : (H : Type u) →ₐc[K] LaurentPolynomial K,
    TauCeti.Cocharacter.unipotent (CommAlgCat.of K K) l

/-- Local Kneser–Tits: the rational unipotent subgroups generate an isotropic simply connected
absolutely almost simple group over a nonarchimedean local field, in either characteristic
(Prasad–Raghunathan, *On the Kneser–Tits problem*, pp. 107–121). -/
theorem kneserTits_local (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E)
    (hH : IsAbsolutelyAlmostSimple E H)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty E ⟨H, hH.1⟩)
    (hisotropic : ∃ l : (H : Type u) →ₐc[E] LaurentPolynomial E,
      TauCeti.Cocharacter.unipotent (CommAlgCat.of E E) l ≠ ⊥) :
    plusSubgroup E H = ⊤ := sorry

end Decomposition

namespace PointTopology

/-- The evaluation topology on the convolution-group carrier of affine points. -/
scoped instance instTopologicalSpaceWithConv (k : Type u) [CommRing k]
    (H : Type v) [CommRing H] [Algebra k H]
    (R : Type u) [CommRing R] [Algebra k R] [TopologicalSpace R] :
    TopologicalSpace (WithConv (H →ₐ[k] R)) :=
  TopologicalSpace.induced (fun g : WithConv (H →ₐ[k] R) => (g.ofConv : H → R)) inferInstance

end PointTopology

namespace LocalIntegration

open scoped PointTopology NNReal

/-- The normalized absolute determinant of the adjoint action on the native cotangent dual. -/
def adjointModulus (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (H : Type u) [CommRing H] [HopfAlgebra E H]
    [Algebra.FiniteType E H] (g : WithConv (H →ₐ[E] E)) : ℝ≥0 :=
  (TauCeti.normalizedAbsoluteValue E
    (LinearEquiv.det ((Derivation.adjointAction (R := E) (H := H)
      (CommAlgCat.of E E) g).toLinearEquiv) : E) : ℝ≥0)

/-- The local adjoint-modulus formula, in right-pushforward form, for smooth affine groups over
nonarchimedean local fields of either characteristic (RG2.4, Iwasawa integration and unimodularity).
The factor is the absolute adjoint determinant, with Mathlib's modular-character convention. -/
theorem modularCharacter_eq_adjointModulus (E : Type u) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    (H : Type u) [CommRing H] [HopfAlgebra E H] [Algebra.FiniteType E H] [Algebra.Smooth E H] :
    letI : MeasurableSpace (WithConv (H →ₐ[E] E)) := borel _
    ∀ (μ : MeasureTheory.Measure (WithConv (H →ₐ[E] E))) [μ.IsHaarMeasure]
      (g : WithConv (H →ₐ[E] E)),
      μ.map (fun x => x * g) = adjointModulus E H g • μ := sorry

end LocalIntegration

namespace Decomposition

open scoped PointTopology

/-- Reductive groups over nonarchimedean local fields are unimodular: every left Haar measure
is right invariant (Cartier, Corvallis Part 1, §4.1, p. 144). -/
theorem modularCharacter_eq_one (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E)
    (hH : TauCeti.reductiveCommHopfAlgProperty E H) :
    letI : MeasurableSpace (WithConv (H →ₐ[E] E)) := borel _
    ∀ (μ : MeasureTheory.Measure (WithConv (H →ₐ[E] E))) [μ.IsHaarMeasure], μ.IsMulRightInvariant :=
  sorry

end Decomposition

end

end TauCetiRoadmap.ReductiveGroupsPartII
