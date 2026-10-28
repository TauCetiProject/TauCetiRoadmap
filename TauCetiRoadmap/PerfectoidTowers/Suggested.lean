import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Comap
import TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Adic
import TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Affinoid
import TauCetiRoadmap.PerfectoidSpaces.Suggested

/-!
# Perfectoid towers: target signatures

The README is the specification of this roadmap. This file states those of its headline
theorems whose objects Mathlib, Tau Ceti and the perfectoid carriers of PerfectoidSpaces already
provide: the invariant Huber pair of a finite group action on a Tate ring and the orbit space of
its adic spectrum (P8.1–P8.2), invariants of a perfectoid Tate ring (P8.4), categorical quotients
of pre-adic spaces with invertible group order and of perfectoid spaces under an invariant affinoid
perfectoid cover (P8.6–P8.9), clean neighbourhoods (P8.13), perfectoidisation of integral
extensions and of integral extensions of perfectoid pairs (P8.18), and the affine forms of torsor
descent: descent of finite projective modules (P9.8), twisted invariants and their finite-level
comparison (P9.9–P9.10) and integral effectivity in a chosen frame (P9.13).

The following headlines are not statable at the pins and stay README targets:
the diamond of a finite quotient and free quotients as torsors (P8.11–P8.12), which need
quotients of v-sheaves and the diamond functor of DiamondsAndVStacks; the closed-locus comparison
in perfectoid towers (HJ Lemma 5.7, P8.21), which needs limits of v-sheaves over perfectoid test
spaces; finite quotients of analytically separated perfectoid spaces and of good towers (HJ
Theorem 5.8 and Proposition 5.13, P8.17 and P8.20), which need
analytic separation and good towers, both defined through diamonds; and the geometric descent
statements of P9 (functions, finite locally free modules and twisted character sheaves along a
pro-étale Galois tower, P9.2–P9.12), which need the completed structure sheaves of the pro-étale
site and pro-étale Galois towers. The boundary theorems below are named Checks of the README.
-/

noncomputable section

namespace TauCetiRoadmap.PerfectoidTowers

open TauCeti TauCeti.Huber CategoryTheory Topology TensorProduct
open TauCetiRoadmap.PerfectoidSpaces TauCetiRoadmap.PerfectoidSpaces.Perfectoid
  TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace

universe u

/-! ## Layer P8: finite quotients and closed perfectoid loci in towers -/

/-! ### The invariant Huber pair -/

section InvariantPair

variable {A : Type*} [CommRing A] (G : Type*) [Group G] [MulSemiringAction G A]

/-- The fixed subring of a continuous action on a Hausdorff ring is closed. -/
theorem isClosed_fixedPoints [TopologicalSpace A] [T2Space A] [ContinuousConstSMul G A] :
    IsClosed (FixedPoints.subring A G : Set A) := by
  have h : (FixedPoints.subring A G : Set A) = ⋂ g : G, {a | g • a = a} := by
    ext a
    rw [Set.mem_iInter]
    rfl
  rw [h]
  exact isClosed_iInter fun g ↦ isClosed_eq (continuous_const_smul g) continuous_id

instance [UniformSpace A] [IsUniformAddGroup A] :
    IsUniformAddGroup (FixedPoints.subring A G) :=
  (FixedPoints.subring A G).toAddSubgroup.isUniformAddGroup

instance [UniformSpace A] [CompleteSpace A] [T2Space A] [ContinuousConstSMul G A] :
    CompleteSpace (FixedPoints.subring A G) :=
  (isClosed_fixedPoints G).completeSpace_coe

variable [TopologicalSpace A] [IsTopologicalRing A]

/-- For a finite group acting by continuous ring automorphisms on a Tate ring, `A^G` with the
subspace topology is a Tate ring: `A₀^G` is a ring of definition for a `G`-stable ring of
definition `A₀`, and `N(ϖ)` is a pseudouniformiser (Hansen Theorem 3.1(i), pp. 4–6). -/
theorem isTateRing_fixedPoints [IsTateRing A] [Finite G] [ContinuousConstSMul G A] :
    IsTateRing (FixedPoints.subring A G) := sorry

attribute [instance] isTateRing_fixedPoints

variable [IsTateRing A]

/-- `A⁺ ∩ A^G` is a ring of integral elements of `A^G` (Hansen Theorem 3.1(iii), p. 6). -/
theorem isRingOfIntegralElements_comap_fixedPoints [Finite G] [ContinuousConstSMul G A]
    (P : Pair A) :
    IsRingOfIntegralElements (P.plus.comap (FixedPoints.subring A G).subtype) := sorry

/-- The invariant Huber pair `(A^G, A^{+G})`, `A^{+G} = A⁺ ∩ A^G`, of a finite group acting by
continuous ring automorphisms on a Tate ring (Hansen §2 and Theorem 3.1, pp. 3–6). No hypothesis
on `|G|` is made. The theorems about it assume that `G` preserves `A⁺`. -/
def invariantPair [Finite G] [ContinuousConstSMul G A] (P : Pair A) :
    Pair (FixedPoints.subring A G) where
  plus := P.plus.comap (FixedPoints.subring A G).subtype
  isRingOfIntegralElements := isRingOfIntegralElements_comap_fixedPoints G P

/-- **The orbit space of the adic spectrum.** For `G` finite acting continuously on a Tate ring
and preserving `A⁺`, restriction `Spa(A, A⁺) → Spa(A^G, A^{+G})`, `v ↦ v|_{A^G}`, is a quotient
map whose fibres are the orbits of `v ↦ v ∘ g`; hence `|Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|`
(Hansen Theorem 3.1, p. 4). No completeness or sheafiness is assumed. -/
theorem invariant_spectrum_homeomorphism [Finite G] [ContinuousConstSMul G A] (P : Pair A)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    let q := ValuationSpectrum.spaComap (FixedPoints.subring A G).subtype continuous_subtype_val
      (invariantPair G P).plus P.plus (fun _ ha ↦ ha)
    IsQuotientMap q ∧ ∀ v w : ValuationSpectrum.spa P.plus,
      q v = q w ↔ ∃ g : G, w.1 = ValuationSpectrum.comap (MulSemiringAction.toRingHom G A g) v.1 :=
  sorry

end InvariantPair

/-! ### Invariants of a perfectoid Tate ring -/

section PerfectoidInvariants

variable (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
  [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A] [hA : IsPerfectoidTateRing p A]
  (G : Type*) [Group G] [Finite G] [MulSemiringAction G A] [ContinuousConstSMul G A]

include hA

/-- **Invariants of a perfectoid Tate ring are perfectoid.** For a finite group acting by
continuous ring automorphisms, `A^G` with the subspace topology is a perfectoid Tate ring; `p`
may divide `|G|` and no base field is fixed (KL16 Theorem 3.3.26, p. 68; Hansen Theorem 3.6,
p. 9). -/
theorem invariants_perfectoid : IsPerfectoidTateRing p (FixedPoints.subring A G) := sorry

end PerfectoidInvariants

/-! ### Categorical quotients of pre-adic spaces -/

section Quotient

variable {G : Type*} [Group G]

/-- `q : X ⟶ Y` is a *categorical quotient* of the pre-adic space `X` by the left action `ρ`: it
is `G`-invariant, every `G`-invariant morphism of pre-adic spaces out of `X` factors uniquely
through it, and on points it is a quotient map whose fibres are the orbits (Hansen Definition
2.2 and Proposition 2.3, pp. 3–4). Morphisms of Tau Ceti pre-adic spaces are the morphisms of
Huber's category `V`, so this is the universal property in `V` restricted to pre-adic spaces. -/
structure IsCategoricalQuotient {X Y : PreAdicSpace.{u}} (ρ : G →* Aut X) (q : X ⟶ Y) : Prop where
  /-- `q` is `G`-invariant. -/
  invariant : ∀ g : G, (ρ g).hom ≫ q = q
  /-- Every `G`-invariant morphism out of `X` factors uniquely through `q`. -/
  universal : ∀ (Z : PreAdicSpace.{u}) (f : X ⟶ Z), (∀ g : G, (ρ g).hom ≫ f = f) →
    ∃! k : Y ⟶ Z, q ≫ k = f
  /-- On points, `q` is a quotient map. -/
  isQuotientMap : IsQuotientMap q.base
  /-- The fibres of `q` on points are the `G`-orbits. -/
  fibres : ∀ x y : X, q.base x = q.base y ↔ ∃ g : G, (ρ g).hom.base x = y

-- Negative control: if some group element acts nontrivially, the identity is not a quotient.
example {X : PreAdicSpace.{u}} (ρ : G →* Aut X) (g : G) (hg : ρ g ≠ 1) :
    ¬ IsCategoricalQuotient ρ (𝟙 X) := fun h ↦
  hg (Iso.ext ((Category.comp_id (ρ g).hom).symm.trans (h.invariant g)))

-- Check: for the trivial action the identity is a categorical quotient.
example {X : PreAdicSpace.{u}} (ρ : G →* Aut X) (h : ∀ g, ρ g = 1) :
    IsCategoricalQuotient ρ (𝟙 X) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro g
    rw [h g]
    change (𝟙 X) ≫ 𝟙 X = 𝟙 X
    simp
  · intro Z f _
    exact ⟨f, by simp, fun k hk ↦ by simpa using hk⟩
  · exact IsQuotientMap.id
  · intro x y
    constructor
    · intro hxy
      refine ⟨1, ?_⟩
      rw [h 1]
      exact hxy
    · rintro ⟨g, hg⟩
      rw [h g] at hg
      exact hg

/-- An affinoid pre-adic space `Spa(A, A⁺)` with `A` a Tate ring. -/
def isTateAffinoidModel : ObjectProperty PreAdicSpace.{u} := fun X ↦
  ∃ (A : Type u) (_ : CommRing A) (_ : TopologicalSpace A) (_ : IsTopologicalRing A)
    (_ : IsTateRing A) (S : Pair A) (P : PairOfDefinition A) (hP : P.ringOfDefinition ≤ S.plus),
    X = ValuationSpectrum.presentationLimitPreAdicSpace P S.plus
      S.isRingOfIntegralElements.isPowerBounded_of_mem hP

/-- The pre-adic spaces isomorphic to `Spa(A, A⁺)` with `A` a Tate ring. -/
abbrev isTateAffinoid : ObjectProperty PreAdicSpace.{u} :=
  isTateAffinoidModel.isoClosure

-- Check (`isTateAffinoid_le_isAffinoid`): a Tate affinoid is affinoid in Tau Ceti's sense.
example : isTateAffinoid.{u} ≤ PreAdicSpace.isAffinoid := by
  rintro X ⟨Y, ⟨A, iA, tA, hA, hT, S, P, hP, rfl⟩, ⟨e⟩⟩
  exact ⟨_, ⟨A, iA, tA, hA, hT.toIsHuberRing, S, P, hP, rfl⟩, ⟨e⟩⟩

-- Check (`isTateAffinoid_spa`): `Spa(A, A⁺)` of a Tate–Huber pair is a Tate affinoid.
example {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]
    (S : Pair A) (P : PairOfDefinition A) (hP : P.ringOfDefinition ≤ S.plus) :
    isTateAffinoid (ValuationSpectrum.presentationLimitPreAdicSpace P S.plus
      S.isRingOfIntegralElements.isPowerBounded_of_mem hP) :=
  ObjectProperty.le_isoClosure _ _ ⟨A, inferInstance, inferInstance, inferInstance, inferInstance,
    S, P, hP, rfl⟩

/-- The boundary Check `isTateAffinoid_zero` of P8.9: the zero pair is a Tate affinoid
with empty spectrum. -/
theorem isTateAffinoid_zero :
    ∃ hT : IsTateRing PUnit,
      letI := hT
      let S := Pair.discrete PUnit
      let P := PairOfDefinition.discrete PUnit
      ∃ hP : P.ringOfDefinition ≤ S.plus,
        isTateAffinoid (ValuationSpectrum.presentationLimitPreAdicSpace P S.plus
          S.isRingOfIntegralElements.isPowerBounded_of_mem hP) ∧
        IsEmpty (ValuationSpectrum.spa S.plus) := sorry

/-- The boundary Check `isTateAffinoid_not_padic_integers` of P8.9: the integral p-adic
spectrum is not Tate affinoid because it has a nonanalytic point with support `(p)`. -/
theorem isTateAffinoid_not_padic_integers (p : ℕ) [Fact p.Prime]
    (S : Pair ℤ_[p]) (P : PairOfDefinition ℤ_[p])
    (hP : P.ringOfDefinition ≤ S.plus) :
    ¬ isTateAffinoid (ValuationSpectrum.presentationLimitPreAdicSpace P S.plus
      S.isRingOfIntegralElements.isPowerBounded_of_mem hP) := sorry

/-- **Adic quotients with invertible group order.** Let `X` be an adic space with an action of a
finite group `G` whose order is invertible in `O_X(X)`, covered by `G`-stable open Tate affinoids
`Spa(A_i, A_i⁺)`. Then the categorical quotient `X/G` exists, is an adic space with underlying
space `|X|/G`, and is covered by the Tate affinoids `Spa(A_i^G, A_i^{+G})` (Hansen Theorem 1.1,
p. 1, and Theorem 3.3, p. 7). -/
theorem exists_isCategoricalQuotient_of_invertible_order [Fintype G] (X : PreAdicSpace.{u})
    (hX : PreAdicSpace.isAdic X) (ρ : G →* Aut X)
    (horder : IsUnit (Fintype.card G : X.toRingPresheafedSpace.presheaf.obj (Opposite.op ⊤)))
    (hcov : ∀ x : X, ∃ U : TopologicalSpace.Opens X, x ∈ U ∧
      (∀ g : G, (ρ g).hom.base ⁻¹' U = U) ∧ isTateAffinoid (X.restrict U.isOpenEmbedding)) :
    ∃ (Y : PreAdicSpace.{u}) (q : X ⟶ Y), PreAdicSpace.isAdic Y ∧ IsCategoricalQuotient ρ q ∧
      ∀ U : TopologicalSpace.Opens X, (∀ g : G, (ρ g).hom.base ⁻¹' U = U) →
        isTateAffinoid (X.restrict U.isOpenEmbedding) →
        ∃ V : TopologicalSpace.Opens Y, q.base ⁻¹' V = U ∧
          isTateAffinoid (Y.restrict V.isOpenEmbedding) :=
  sorry

/-- **Perfectoid quotients under an invariant affinoid perfectoid cover.** Let `X` be a
perfectoid space with an action of a finite group `G`, covered by `G`-stable open affinoid
perfectoid subspaces `U_i = Spa(A_i, A_i⁺)`. Then the categorical quotient `X/G` is a perfectoid
space, `|X/G| = |X|/G`, and every `G`-stable open affinoid perfectoid `U` maps onto an open
affinoid perfectoid `U/G = Spa(A^G, A^{+G})` with preimage `U`. There is no condition on `|G|`
(CGJ Theorem 2.1.2, p. 5, and Proposition 2.1.3(2), p. 5). -/
theorem exists_isCategoricalQuotient_of_invariant_cover (p : ℕ) [Fact p.Prime] [Finite G]
    (X : Perfd.{u} p) (ρ : G →* Aut X.obj)
    (hcov : ∀ x : X.obj, ∃ U : TopologicalSpace.Opens X.obj, x ∈ U ∧
      (∀ g : G, (ρ g).hom.base ⁻¹' U = U) ∧
      isAffinoidPerfectoid p (X.obj.restrict U.isOpenEmbedding)) :
    ∃ (Y : Perfd.{u} p) (q : X.obj ⟶ Y.obj), IsCategoricalQuotient ρ q ∧
      ∀ U : TopologicalSpace.Opens X.obj, (∀ g : G, (ρ g).hom.base ⁻¹' U = U) →
        isAffinoidPerfectoid p (X.obj.restrict U.isOpenEmbedding) →
        ∃ V : TopologicalSpace.Opens Y.obj, q.base ⁻¹' V = U ∧
          isAffinoidPerfectoid p (Y.obj.restrict V.isOpenEmbedding) :=
  sorry

end Quotient

/-! ### Clean neighbourhoods -/

namespace MulAction

variable {G X : Type*} [Group G] [TopologicalSpace X] [MulAction G X]

/-- An open neighbourhood `U` of `x` is *`G`-clean* if it is stable under the stabiliser of `x`
and disjoint from its translates by the other elements of `G` (HJ, definition before Lemma 5.2,
pp. 27–28). For a right action, apply it to the left action of the opposite group. -/
structure IsGClean (G : Type*) {X : Type*} [Group G] [TopologicalSpace X] [MulAction G X]
    (x : X) (U : Set X) : Prop where
  /-- `U` is open. -/
  isOpen : IsOpen U
  /-- `U` contains `x`. -/
  mem : x ∈ U
  /-- `U` is stable under the stabiliser of `x`. -/
  smul_eq : ∀ g : G, g • x = x → (g • ·) '' U = U
  /-- `U` is disjoint from its translates by elements not fixing `x`. -/
  disjoint_smul : ∀ g : G, g • x ≠ x → Disjoint U ((g • ·) '' U)

/-- **Clean neighbourhoods exist.** For a finite group acting continuously on a Hausdorff space,
every neighbourhood of a point contains a `G`-clean open neighbourhood (HJ Lemma 5.2, p. 28). -/
theorem exists_isGClean [Finite G] [ContinuousConstSMul G X] [T2Space X] (x : X) (V : Set X)
    (hV : V ∈ nhds x) : ∃ U ⊆ V, IsGClean G x U := sorry

-- Negative control: if `g • x ≠ x` and both `y` and `g • y` lie in `U`, then `U` is not clean.
example (x : X) (U : Set X) (g : G) (hg : g • x ≠ x) (y : X) (hy : y ∈ U) (hgy : g • y ∈ U) :
    ¬ IsGClean G x U := fun h ↦
  Set.disjoint_left.mp (h.disjoint_smul g hg) hgy ⟨y, hy, rfl⟩

-- Check: for the trivial action every open neighbourhood of `x` is clean.
example (h : ∀ (g : G) (y : X), g • y = y) (x : X) (U : Set X) :
    IsGClean G x U ↔ IsOpen U ∧ x ∈ U := by
  refine ⟨fun hU ↦ ⟨hU.isOpen, hU.mem⟩, fun ⟨hU, hx⟩ ↦ ⟨hU, hx, fun g _ ↦ ?_, fun g hg ↦ ?_⟩⟩
  · simp [h]
  · exact absurd (h g x) hg

end MulAction

/-! ### Perfectoidisation of integral extensions -/

section Perfectoidization

variable (p : ℕ) [Fact p.Prime]

/-- **Perfectoidisation of an integral extension.** For an integral map `R → S` out of an
integral perfectoid ring there is an initial integral perfectoid ring `S_perfd` under `S`
(BS22 Theorem 1.17(1), p. 9, and Theorem 10.11, p. 82). In characteristic `p` it is the
perfection of `S`. -/
theorem exists_perfectoidization {R S : Type u} [CommRing R] [CommRing S]
    [IsIntegralPerfectoid p R] (f : R →+* S) (hf : f.IsIntegral) :
    ∃ (T : Type u) (_ : CommRing T) (_ : IsIntegralPerfectoid p T) (ι : S →+* T),
      ∀ (B : Type u) [CommRing B] [IsIntegralPerfectoid p B] (g : S →+* B),
        ∃! h : T →+* B, h.comp ι = g :=
  sorry

/-- **Integral extensions of perfectoid pairs.** For a map of Tate–Huber pairs
`(R, R⁺) → (S, S⁺)` with `R` perfectoid and `R⁺ → S⁺` integral, there is a perfectoid Tate pair
`(T, T⁺)` under `(S, S⁺)` such that maps of pairs `(T, T⁺) → (B, B⁺)` correspond to maps
`(S, S⁺) → (B, B⁺)` for every perfectoid Tate pair; thus `Spd(S, S⁺)` is represented by the
affinoid perfectoid space `Spa(T, T⁺)` (HJ Lemma 5.10, p. 32). -/
theorem integral_extension_of_perfectoid_pair {R S : Type u} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
    [IsPerfectoidTateRing p R] [CommRing S] [TopologicalSpace S] [IsTopologicalRing S]
    [IsTateRing S] (P : Pair R) (Q : Pair S) (f : Pair.Hom P Q)
    (hf : (f.toRingHom.restrict P.plus Q.plus f.map_mem_plus).IsIntegral) :
    ∃ (T : Type u) (_ : CommRing T) (_ : UniformSpace T) (_ : IsUniformAddGroup T)
      (_ : IsTopologicalRing T) (_ : IsTateRing T) (_ : CompleteSpace T) (_ : T2Space T)
      (_ : IsPerfectoidTateRing p T) (Tplus : Pair T) (g : Pair.Hom Q Tplus),
      ∀ (B : Type u) [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
        [IsTateRing B] [CompleteSpace B] [T2Space B] [IsPerfectoidTateRing p B] (Bplus : Pair B)
        (h : Pair.Hom Q Bplus),
        ∃! k : T →+* B, Continuous k ∧ (∀ t ∈ Tplus.plus, k t ∈ Bplus.plus) ∧
          k.comp g.toRingHom = h.toRingHom :=
  sorry

end Perfectoidization

/-! ## Layer P9: continuous torsor descent with coefficients -/

/-! ### Continuous coefficients

The cochain model of P9.0 requires joint continuity of the representation action. The following
boundary theorem gives the discrete regular-representation counterexample. The completed
tower-section actions use the lattice-preservation argument of P9.5 with their integral and
rational topologies.
-/

/-- The boundary Check `cech_operators_without_joint_continuity` of P9.5: translation
on the discrete regular module over `ℤ₂` has a discontinuous degree-zero differential. -/
theorem cech_operators_without_joint_continuity :
    letI : TopologicalSpace (PadicInt 2 →₀ ℤ) := ⊥
    ¬ Continuous (fun h : PadicInt 2 ↦
      Finsupp.single h (1 : ℤ) - Finsupp.single 0 (1 : ℤ)) := sorry

/-! ### Twisted invariants -/

section TwistedInvariants

variable {G R : Type*} [Group G] [CommRing R] [MulSemiringAction G R]

/-- The `c`-twisted invariants `{f | γ • f = c(γ)⁻¹ f for all γ}`, an `R^G`-submodule of `R`: the
sections of the twisted character sheaf `ω_c` over one affinoid (CHJ Definition 2.18, p. 17). A
cocycle is needed for the descent interpretation, not for closure under addition and invariant
scalars. -/
def twistedInvariants (c : G → Rˣ) : Submodule (FixedPoints.subring R G) R where
  carrier := {f | ∀ γ : G, γ • f = ((c γ)⁻¹ : Rˣ) * f}
  zero_mem' := by simp
  add_mem' := by
    intro f g hf hg γ
    simp only [smul_add, hf γ, hg γ, mul_add]
  smul_mem' := by
    intro a f hf γ
    change γ • ((a : R) * f) = (((c γ)⁻¹ : Rˣ) : R) * ((a : R) * f)
    rw [smul_mul', a.property γ, hf γ]
    ring

-- Check: for the trivial cocycle the twisted invariants are the invariants.
example (f : R) :
    f ∈ twistedInvariants (fun _ : G ↦ (1 : Rˣ)) ↔ f ∈ FixedPoints.subring R G := by
  change (∀ γ : G, γ • f = (((1 : Rˣ)⁻¹ : Rˣ) : R) * f) ↔ _
  simp only [inv_one, Units.val_one, one_mul]
  rfl

end TwistedInvariants

/-! ### Finite-level comparison of character sheaves -/

/-- **Finite-level comparison.** Let `C` carry an action of `G`, `B` an action of a quotient
`H = G/N` with `B → C` injective, equivariant and onto the `N`-fixed elements of `C`. If
`c(γ) u = γ(u) c₀(γ̄)` for a unit `u` of `C` and a cocycle `c₀` of `H` with values in `B`, then
multiplication by `u` identifies the `c`-twisted invariants of `C` with the `c₀`-twisted invariants
of `B`, linearly over any common scalar ring `A` acting compatibly through both fixed rings; the
additive form is the case `A = ℤ` (CHJ, paragraph after Proposition 2.27, pp. 21–22). In the tower
application `A` is `O(U) ⊗̂ A`, identified with both fixed rings (CHJ Theorem 2.28, proof,
p. 22). -/
theorem finite_character_comparison_linear {A B C G H : Type*}
    [CommRing A] [CommRing B] [CommRing C] [Group G] [Group H]
    [MulSemiringAction G C] [MulSemiringAction H B]
    [Algebra A B] [Algebra A C]
    [Algebra A (FixedPoints.subring B H)] [Algebra A (FixedPoints.subring C G)]
    [IsScalarTower A (FixedPoints.subring B H) B]
    [IsScalarTower A (FixedPoints.subring C G) C]
    (q : G →* H) (hq : Function.Surjective q) (i : B →ₐ[A] C)
    (hi : Function.Injective i) (hequiv : ∀ g b, i (q g • b) = g • i b)
    (hfixed : ∀ z : C, (∀ g : q.ker, g.val • z = z) ↔ ∃ b, i b = z)
    (c : G → Cˣ) (c₀ : H → Bˣ) (u : Cˣ)
    (hc₀ : ∀ g h, (c₀ (g * h) : B) = c₀ g * (g • (c₀ h : B)))
    (hc : ∀ g, (c g : C) * u = (g • (u : C)) * i (c₀ (q g))) :
    ∃ e : (twistedInvariants c).restrictScalars A ≃ₗ[A]
        (twistedInvariants c₀).restrictScalars A,
      ∀ z, i (e z).val = z.val * u := sorry

/-! ### Descent of finite projective modules -/

/-- **Degree-zero descent of finite projective modules.** If `A → B` is injective and every
`G`-fixed element of `B` comes from `A`, then for a finite projective `A`-module `M` the map
`m ↦ 1 ⊗ m` is injective with image the `G`-fixed tensors. The finite-projective hypothesis
is an input, also for integral rings. Rational affinoid Kiehl supplies it for `O`-bundles; integral
`O⁺`-bundle full faithfulness instead uses local frames and matrix gluing (KL16 Corollary 8.2.4,
p. 163, for the rational comparison). -/
theorem finite_projective_sections_descent (A B G : Type*) [CommRing A] [CommRing B]
    [Algebra A B] [Group G] [MulSemiringAction G B] [SMulCommClass G A B] [FaithfulSMul A B]
    (hfixed : Algebra.IsInvariant A B G) (M : Type*) [AddCommGroup M] [Module A M]
    [Module.Projective A M] [Module.Finite A M] :
    Function.Injective (fun m : M ↦ (1 : B) ⊗ₜ[A] m) ∧
      ∀ x : B ⊗[A] M,
        (∀ g : G, (MulSemiringAction.toAlgHom A B g).toLinearMap.rTensor M x = x) ↔
          ∃ m : M, x = (1 : B) ⊗ₜ[A] m :=
  sorry

/-! ### Integral effectivity in a chosen frame -/

/-- **Integral effectivity.** For matrices `C(g) ∈ GL_n(R)` and an invertible frame
`P ∈ GL_n(R)` with `C(g) g(P) = P`, every vector fixed by `v ↦ C(g) g(v)` is uniquely `P a` with
`a` invariant. The frame equation gives `C(g) = P g(P)⁻¹`, so the cocycle identity of `C` is a
consequence, not a hypothesis. Both `P` and `P⁻¹` are integral, so this applies to `O⁺` without
inverting `p` (rank one: BHW Theorem 4.8, proof, p. 18). -/
theorem integral_matrix_coboundary_effectivity {G R : Type*} [Group G] [CommRing R]
    [MulSemiringAction G R] (n : ℕ) (C : G → (Matrix (Fin n) (Fin n) R)ˣ)
    (P : (Matrix (Fin n) (Fin n) R)ˣ)
    (hP : ∀ g, (C g).val * (P.val.map (fun r ↦ g • r)) = P.val) :
    ∀ v : Fin n → R,
      (∀ g, (C g).val.mulVec (fun i ↦ g • v i) = v) ↔
        ∃! a : Fin n → FixedPoints.subring R G, P.val.mulVec (fun i ↦ (a i).val) = v :=
  sorry

end TauCetiRoadmap.PerfectoidTowers
