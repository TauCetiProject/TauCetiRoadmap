import Mathlib
import TauCeti.RepresentationTheory.CharacterTwist
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic
import TauCeti.NumberTheory.HeckeRing.Associativity
import TauCeti.NumberTheory.HeckeRing.Normalizer
import TauCeti.NumberTheory.HeckeRing.Representation
import TauCeti.Algebra.AlgebraicGroup.FiniteType.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Dynamic.Parabolic
import TauCeti.Algebra.AlgebraicGroup.Dynamic.LeviDecomposition.Basic
import TauCeti.NumberTheory.LocalField.Tame.PadicCharacter
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Cyclotomic.Character
import TauCetiRoadmap.ReductiveGroupsPartII.Suggested

/-!
# Smooth representations of local groups: representative target signatures

The mathematical roadmap is `README.md`. This file records the definitions and the headline
theorems that can already be stated against the pinned Mathlib and Tau Ceti APIs and the
`ReductiveGroupsPartII` roadmap. It is not an exhaustive list of the targets of any layer.

Design choices.
* A representation is Mathlib's `Representation A G V` on an `A`-module with no topology; it is
  smooth when every vector has an open stabiliser, and `SmoothRep A G` is the full subcategory of
  `Rep A G` on the smooth representations. The coefficient ring `A` is arbitrary.
* Smooth induction is the smooth part of Mathlib's coinduction, compact induction from an open
  subgroup is Mathlib's algebraic induction, and the Jacquet module is Mathlib's coinvariants of
  the normal subgroup `N` of `P`, restricted along `M → P ⧸ N`. These functors are unnormalised.
* For a connected reductive group `Spec H` over a nonarchimedean local field `F` the rational
  points carry the point topology of `ReductiveGroupsPartII`, and the parabolic, Levi and unipotent
  subgroups of a cocharacter are Tau Ceti's dynamic subgroups.
* The modulus `δ_P` is Mathlib's modular character of `P`; for the upper Borel subgroup of
  `GL₂(ℚ_p)` it sends `diag(a, d)` to `|a/d|_p`.
* SR.5.2 `wd-raw-parameters` exposes the common raw Weil–Deligne fields below LLC and the
  arithmetic adapter. SR.5.2 owns `wd-linear-substrate`: `nilpotent-exp-log`,
  `wd-parameter-operations`, `grothendieck-monodromy` / `wd-complete-coefficients`,
  `full-wd-construction` and `wd-frobenius-semisimplification`.
  They supply `WD = F-ss ∘ WD_full` independently of LLC and the arithmetic adapter.
-/

namespace TauCetiRoadmap.SmoothRepresentationsOfLocalGroups


noncomputable section

open CategoryTheory

universe u

/-! ## Layer SR.0: the smooth category -/

/-- van Dantzig's theorem ([Ber92], Ch. I §1.1, p. 7): in a locally compact, totally disconnected
Hausdorff topological group every neighbourhood of `1` contains a compact open subgroup. -/
theorem exists_compactOpenSubgroup_le {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    {U : Set G} (hU : U ∈ nhds (1 : G)) :
    ∃ K : OpenSubgroup G, IsCompact (K : Set G) ∧ (K : Set G) ⊆ U := sorry

namespace Representation

variable {A : Type*} [CommRing A] {G : Type*} [Group G] [TopologicalSpace G]
  {V : Type*} [AddCommGroup V] [Module A V]

/-- A representation on an `A`-module (with no topology on the module) is smooth when every vector
has an open stabiliser ([Ber92], Ch. I, Definition 2, p. 7). -/
class IsSmooth (ρ : _root_.Representation A G V) : Prop where
  isOpen_stabilizer : ∀ v : V, IsOpen ((ρ.stabilizer v : Subgroup G) : Set G)

/-- The smooth vectors `V^∞`, those with open stabiliser, as a subrepresentation
([Ber92], Ch. I §1.1, p. 7). -/
def smoothVectors [IsTopologicalGroup G] (ρ : _root_.Representation A G V) :
    Subrepresentation ρ where
  toSubmodule :=
    { carrier := {v | IsOpen ((ρ.stabilizer v : Subgroup G) : Set G)}
      zero_mem' := sorry
      add_mem' := sorry
      smul_mem' := sorry }
  apply_mem_toSubmodule := sorry

/-- Admissibility: smooth, and the invariants of every compact open subgroup are a finitely
generated `A`-module ([Cas95], §0, p. 2, with finite generation in place of finite dimension). -/
def IsAdmissible (ρ : _root_.Representation A G V) : Prop :=
  IsSmooth ρ ∧ ∀ U : OpenSubgroup G, IsCompact (U : Set G) →
    Module.Finite A (_root_.Representation.invariants (ρ.comp U.toSubgroup.subtype))

-- The trivial representation is smooth.
example [IsTopologicalGroup G] : IsSmooth (_root_.Representation.trivial A G V) :=
  ⟨fun v => by
    convert isOpen_univ
    ext g
    simp [_root_.Representation.stabilizer]⟩

-- Reduction modulo `p^n` gives `U = p^n ℤ_p`; its permutation module is smooth and U-fixed.
example (p n : ℕ) [Fact p.Prime] :
    let U := (PadicInt.toZModPow (p := p) n).toAddMonoidHom.toMultiplicative.ker
    let ρ := _root_.Representation.ofMulAction ℤ (Multiplicative ℤ_[p])
      (Multiplicative ℤ_[p] ⧸ U)
    IsSmooth ρ ∧ ∀ (g : U) v, ρ g v = v := sorry

-- The left regular representation of `ℤ_p` on `ℤ[ℤ_p]` is not smooth.
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSmooth (_root_.Representation.ofMulAction ℤ (Multiplicative ℤ_[p])
      (Multiplicative ℤ_[p])) := sorry

-- Without compact open subgroups the finiteness clause is empty: on `ℚ_p^ℕ` every smooth
-- representation, for instance the trivial action on `ℚ^(ℕ)`, is admissible.
example (p : ℕ) [Fact p.Prime] :
    IsAdmissible (_root_.Representation.trivial ℚ (Multiplicative (ℕ → ℚ_[p])) (ℕ →₀ ℚ)) := sorry

-- For a compact group the trivial action on `ℚ^(ℕ)` is smooth but not admissible.
example (p : ℕ) [Fact p.Prime] :
    ¬ IsAdmissible (_root_.Representation.trivial ℚ (Multiplicative ℤ_[p]) (ℕ →₀ ℚ)) := sorry

-- The product of the permutation modules has no common open stabilizer for its basepoints.
example (p : ℕ) [Fact p.Prime] :
    let U := fun n => (PadicInt.toZModPow (p := p) n).toAddMonoidHom.toMultiplicative.ker
    let X := fun n => Rep.of (_root_.Representation.ofMulAction ℤ (Multiplicative ℤ_[p])
      (Multiplicative ℤ_[p] ⧸ U n))
    ¬ IsSmooth (Limits.piObj X).ρ := sorry

-- The smooth vectors of the integral regular representation of `ℤ_p` are zero.
example (p : ℕ) [Fact p.Prime] :
    smoothVectors (_root_.Representation.ofMulAction ℤ (Multiplicative ℤ_[p])
      (Multiplicative ℤ_[p])) = ⊥ := sorry

-- Finite permutation modules of `ℤ_p` are admissible, with one-dimensional full invariants.
example (p n : ℕ) [Fact p.Prime] :
    let U := (PadicInt.toZModPow (p := p) n).toAddMonoidHom.toMultiplicative.ker
    let ρ := _root_.Representation.ofMulAction ℚ (Multiplicative ℤ_[p])
      (Multiplicative ℤ_[p] ⧸ U)
    IsAdmissible ρ ∧ Module.finrank ℚ (_root_.Representation.invariants ρ) = 1 := sorry

-- The permutation module of `ℚ_p/ℤ_p` is smooth but has infinitely generated compact invariants.
example (p : ℕ) [Fact p.Prime] :
    let U := PadicInt.subring p |>.toAddSubgroup.toSubgroup
    let ρ := _root_.Representation.ofMulAction ℚ (Multiplicative ℚ_[p])
      (Multiplicative ℚ_[p] ⧸ U)
    IsSmooth ρ ∧ ¬ IsAdmissible ρ := sorry

-- The zero representation is admissible over every commutative ring.
example [IsTopologicalGroup G] :
    IsAdmissible (_root_.Representation.trivial A G (Fin 0 → A)) := sorry

-- A finite coefficient module with trivial action is admissible.
example [IsTopologicalGroup G] [IsNoetherianRing A] [Module.Finite A V] :
    IsAdmissible (_root_.Representation.trivial A G V) := sorry

-- `ℚ_p^ℕ` has no compact open subgroup in its product topology.
example (p : ℕ) [Fact p.Prime] (U : OpenSubgroup (Multiplicative (ℕ → ℚ_[p]))) :
    ¬ IsCompact (U : Set (Multiplicative (ℕ → ℚ_[p]))) := sorry

-- A zero representation has all its vectors in the smooth part.
example [IsTopologicalGroup G] :
    smoothVectors (_root_.Representation.trivial A G (Fin 0 → A)) = ⊤ := sorry

-- A topology generated by one nonnormal subgroup does not preserve smoothness under translation.
example :
    let G := Equiv.Perm (Fin 3)
    let H : Subgroup G := Subgroup.zpowers (Equiv.swap (0 : Fin 3) 1)
    letI : TopologicalSpace G := TopologicalSpace.generateFrom {(H : Set G)}
    let ρ := _root_.Representation.ofMulAction ℚ G (G ⧸ H)
    let v := MonoidAlgebra.single (QuotientGroup.mk (1 : G) : G ⧸ H) (1 : ℚ)
    IsOpen ((ρ.stabilizer v : Subgroup G) : Set G) ∧
      ¬ IsOpen ((ρ.stabilizer (ρ (Equiv.swap (1 : Fin 3) 2) v) : Subgroup G) : Set G) := sorry

end Representation

/-- A subgroup `K` has pro-order invertible in `A` when every quotient of `K` by an open normal
subgroup has order a unit of `A` ([Ber87], §1.3, p. 4). -/
def HasUnitProOrder (A : Type*) [CommRing A] {G : Type*} [Group G] [TopologicalSpace G]
    (K : Subgroup G) : Prop :=
  ∀ U : OpenNormalSubgroup K, IsUnit ((Nat.card (K ⧸ U.toSubgroup) : ℕ) : A)

-- `ℤ_p` has pro-order invertible in a nonzero ring `A` exactly when `p` is a unit of `A`.
example (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A] [Nontrivial A] :
    HasUnitProOrder A (⊤ : Subgroup (Multiplicative ℤ_[p])) ↔ IsUnit (p : A) := sorry

-- The trivial subgroup has invertible pro-order over every coefficient ring.
example (A : Type*) [CommRing A] (G : Type*) [Group G] [TopologicalSpace G] :
    HasUnitProOrder A (⊥ : Subgroup G) := sorry

-- Compactness excludes this discrete infinite 2-group, whose full quotient has Nat.card zero.
example :
    letI : TopologicalSpace (Multiplicative (ℕ →₀ ZMod 2)) := ⊥
    ¬ HasUnitProOrder ℚ (⊤ : Subgroup (Multiplicative (ℕ →₀ ZMod 2))) := sorry

-- Connected compact groups need not pass unit pro-order to closed subgroups.
example (p : ℕ) [Fact p.Prime] :
    HasUnitProOrder (ZMod p) (⊤ : Subgroup Circle) ∧
      ¬ HasUnitProOrder (ZMod p) (powMonoidHom p : Circle →* Circle).ker := sorry

-- For a finite discrete group the condition is that the group order is a unit.
example (A : Type*) [CommRing A] (G : Type*) [Group G] [Finite G] [TopologicalSpace G]
    [DiscreteTopology G] :
    HasUnitProOrder A (⊤ : Subgroup G) ↔ IsUnit (Nat.card G : A) := sorry

/-- A character `χ : G →* Aˣ` is smooth when its kernel is open ([BZ76], Ch. I, 1.19, p. 11). -/
def IsSmoothCharacter {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    (χ : G →* Aˣ) : Prop :=
  IsOpen ((χ.ker : Subgroup G) : Set G)

-- `x ↦ (1 + p)^x` on `ℤ_p` is not smooth for the discrete topology on `ℤ_pˣ`: its kernel is
-- trivial and `ℤ_p` is not discrete.
example (p : ℕ) [Fact p.Prime] (χ : Multiplicative ℤ_[p] →* ℤ_[p]ˣ)
    (hχ : Function.Injective χ) : ¬ IsSmoothCharacter χ := sorry

section SmoothRepCategory

variable (A : Type u) [CommRing A] (G : Type u) [Group G] [TopologicalSpace G]

/-- The category of smooth representations of `G` over `A`: the full subcategory of `Rep A G` on
the smooth representations ([Ber92], Ch. I §2, p. 11). -/
abbrev SmoothRep : Type (u + 1) :=
  ObjectProperty.FullSubcategory fun X : Rep.{u} A G => Representation.IsSmooth X.ρ

/-- The fully faithful inclusion `SmoothRep A G ⥤ Rep A G`. -/
abbrev SmoothRep.ι : SmoothRep A G ⥤ Rep.{u} A G :=
  ObjectProperty.ι fun X : Rep.{u} A G => Representation.IsSmooth X.ρ

/-- The smooth part `V ↦ V^∞` as a functor `Rep A G ⥤ SmoothRep A G`. -/
def SmoothRep.smoothPart [IsTopologicalGroup G] : Rep.{u} A G ⥤ SmoothRep A G where
  obj X := ⟨Rep.of (Representation.smoothVectors X.ρ).toRepresentation, sorry⟩
  map {X Y} f := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap :=
        { toFun := fun v => ⟨f.hom (v : X.V), sorry⟩
          map_add' := sorry
          map_smul' := sorry }
      isIntertwining' := sorry })
  map_id := sorry
  map_comp := sorry

/-- The smooth part is right adjoint to the inclusion, so `SmoothRep A G` is coreflective in
`Rep A G` ([Ber92], Ch. I §1.1, Proposition 1, p. 7). -/
theorem SmoothRep.nonempty_smoothPartAdjunction [IsTopologicalGroup G] :
    Nonempty (SmoothRep.ι A G ⊣ SmoothRep.smoothPart A G) := sorry

/-- Smooth representations form an abelian category, with kernels, cokernels and colimits computed
in `Rep A G` ([Ber87], §1.1, p. 3). -/
instance SmoothRep.instAbelian [IsTopologicalGroup G] : Abelian (SmoothRep A G) where
  toPreadditive := inferInstance
  toIsNormalMonoCategory := sorry
  toIsNormalEpiCategory := sorry
  has_finite_products := sorry
  has_kernels := sorry
  has_cokernels := sorry

/-- The invariants `V ↦ V^U` of a subgroup `U`: Mathlib's invariants after restriction to `U`
([Ber92], Ch. I §2.2, p. 14). -/
abbrev SmoothRep.invariantsFunctor (U : Subgroup G) : SmoothRep A G ⥤ ModuleCat.{u} A :=
  SmoothRep.ι A G ⋙ Rep.resFunctor U.subtype ⋙ Rep.invariantsFunctor A U

/-- For a compact open subgroup `U` of pro-order invertible in `A`, the invariants functor, which is
always left exact, is exact ([Ber92], Ch. I §3.3, Proposition 10(2), p. 17). -/
theorem SmoothRep.preservesFiniteColimits_invariantsFunctor [IsTopologicalGroup G] (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hU : HasUnitProOrder A U.toSubgroup) :
    Limits.PreservesFiniteColimits (SmoothRep.invariantsFunctor A G U.toSubgroup) := sorry

/-- Twisting by a smooth character, `V ↦ V ⊗ χ`, via Tau Ceti's `Representation.charTwist`
([BZ76], Ch. I §2, 2.25(c), p. 23). -/
def SmoothRep.twistFunctor [IsTopologicalGroup G] (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    SmoothRep A G ⥤ SmoothRep A G where
  obj V := ⟨Rep.of (_root_.Representation.charTwist χ V.obj.ρ), sorry⟩
  map {V W} f := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap := f.hom.hom.toLinearMap
      isIntertwining' := sorry })
  map_id := sorry
  map_comp := sorry

-- For a discrete group every vector is smooth.
example [IsTopologicalGroup G] [DiscreteTopology G] (X : Rep.{u} A G) :
    Representation.smoothVectors X.ρ = ⊤ := sorry

-- For a discrete group the bundled inclusion is an equivalence.
example [DiscreteTopology G] : (SmoothRep.ι A G).IsEquivalence := sorry

-- The trivial rank-one smooth object has coefficient ring as its endomorphism ring.
example :
    let X : SmoothRep A G := ⟨Rep.of (_root_.Representation.trivial A G A), by
      constructor
      intro v
      convert isOpen_univ
      ext g
      simp [_root_.Representation.stabilizer]⟩
    Nonempty (End X ≃+* A) := sorry

-- The invariants of a trivial representation are everything.
example (U : Subgroup G) (X : SmoothRep A G) (hX : ∀ g : G, X.obj.ρ g = LinearMap.id) :
    ((SmoothRep.invariantsFunctor A G U).obj X : Type u) ≃ X.obj.V := sorry

-- The smooth part sends a morphism to its restriction on smooth vectors.
example [IsTopologicalGroup G] {X Y : Rep.{u} A G} (f : X ⟶ Y)
    (v : Representation.smoothVectors X.ρ) :
    (show Representation.smoothVectors Y.ρ from
      ((SmoothRep.smoothPart A G).map f).hom.hom v).val = f.hom (v : X.V) := rfl

-- Trivial twisting preserves the action; inverse twisting restores it.
example [IsTopologicalGroup G] (X : SmoothRep A G) :
    ((SmoothRep.twistFunctor A G 1 (by simp [IsSmoothCharacter])).obj X).obj.ρ = X.obj.ρ := sorry

example [IsTopologicalGroup G] {V : Type u} [AddCommGroup V] [Module A V]
    (χ : G →* Aˣ) (ρ : _root_.Representation A G V) :
    _root_.Representation.charTwist χ⁻¹ (_root_.Representation.charTwist χ ρ) = ρ := sorry

-- The trivial character is smooth.
example : IsSmoothCharacter (1 : G →* Aˣ) := by
  simp [IsSmoothCharacter]

end SmoothRepCategory

-- Over `𝔽_p` the invariants of `ℤ/p` are not exact: `𝔽_p[ℤ/p] → 𝔽_p` is onto, its invariants
-- map is not. This is why `HasUnitProOrder` is assumed.
example (p : ℕ) [Fact p.Prime] :
    ¬ HasUnitProOrder (ZMod p) (⊤ : Subgroup (Multiplicative (ZMod p))) := sorry

-- In characteristic p the augmentation is surjective, but kills every full invariant vector.
example (p : ℕ) [Fact p.Prime] :
    let ρ := _root_.Representation.ofMulAction (ZMod p) (Multiplicative (ZMod p))
      (Multiplicative (ZMod p))
    Function.Surjective (Finsupp.linearCombination (ZMod p)
      (fun _ : Multiplicative (ZMod p) => (1 : ZMod p))) ∧
      ∀ v : _root_.Representation.invariants ρ,
        Finsupp.linearCombination (ZMod p) (fun _ => (1 : ZMod p))
          (v : MonoidAlgebra (ZMod p) (Multiplicative (ZMod p))).coeff = 0 := sorry

/-! ## Layer SR.1: Hecke algebras over rings -/

/-- An `A`-valued left Haar measure: a finitely additive, left-invariant function on the compact
open subsets ([He18], §1.2, pp. 6–7). -/
structure HaarMeasureWithValues (G A : Type*) [Group G] [TopologicalSpace G]
    [AddCommMonoid A] where
  /-- The volume of a compact open subset. -/
  vol : TopologicalSpace.CompactOpens G → A
  vol_bot : vol ⊥ = 0
  vol_sup_of_disjoint (K L : TopologicalSpace.CompactOpens G) :
    Disjoint (K : Set G) (L : Set G) → vol (K ⊔ L) = vol K + vol L
  vol_translate (g : G) (K L : TopologicalSpace.CompactOpens G) :
    (L : Set G) = (g * ·) '' (K : Set G) → vol L = vol K

/-- For a locally profinite `G` and a compact open subgroup `U₀` of pro-order invertible in `A`,
there is exactly one `A`-valued Haar measure with `μ(U₀) = 1` ([He18], §1.2, pp. 6–7). -/
theorem HaarMeasureWithValues.existsUnique_vol_eq_one {G A : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    [CommRing A] (U₀ : OpenSubgroup G) (hc : IsCompact (U₀ : Set G))
    (hU₀ : HasUnitProOrder A U₀.toSubgroup) :
    ∃! μ : HaarMeasureWithValues G A, μ.vol ⟨⟨(U₀ : Set G), hc⟩, U₀.isOpen⟩ = 1 := sorry

-- There is no `𝔽_p`-valued Haar measure on `ℤ_p` with `μ(ℤ_p) = 1`: the `p` cosets of `pℤ_p`
-- would give `1 = p · μ(pℤ_p) = 0`.
example (p : ℕ) [Fact p.Prime] (μ : HaarMeasureWithValues (Multiplicative ℤ_[p]) (ZMod p))
    (hc : IsCompact (Set.univ : Set (Multiplicative ℤ_[p]))) :
    μ.vol ⟨⟨Set.univ, hc⟩, isOpen_univ⟩ ≠ 1 := sorry

-- The empty compact open has zero volume.
example {G A : Type*} [Group G] [TopologicalSpace G] [AddCommMonoid A]
    (μ : HaarMeasureWithValues G A) : μ.vol ⊥ = 0 := μ.vol_bot

-- The unnormalized axioms admit the zero measure.
example {G A : Type*} [Group G] [TopologicalSpace G] [AddCommMonoid A] :
    ∃ μ : HaarMeasureWithValues G A, ∀ K, μ.vol K = 0 :=
  ⟨⟨fun _ => 0, rfl, fun _ _ _ => (zero_add 0).symm, fun _ _ _ _ => rfl⟩, fun _ => rfl⟩

/-- The linear map `q_v(δ_x) = ρ(x)⁻¹v` on the left regular representation, used to compare
right Hecke actions with Tau Ceti's Hecke sum on invariant maps ([TV], §2.10, pp. 187–188). -/
def heckeInvariantMap {A G V : Type*} [CommRing A] [Group G] [AddCommGroup V] [Module A V]
    (ρ : _root_.Representation A G V) (v : V) : MonoidAlgebra A G →ₗ[A] V where
  toFun x := Finsupp.linearCombination A (fun g => ρ g⁻¹ v) x.coeff
  map_add' := by intro x y; simp
  map_smul' := by intro a x; simp

/-- If `v` is `U`-fixed, `q_v` is `U`-invariant on the algebraic left regular representation. -/
theorem heckeInvariantMap_comp_of_mem {A G V : Type*} [CommRing A] [Group G]
    [AddCommGroup V] [Module A V] (ρ : _root_.Representation A G V) (U : Subgroup G)
    (v : V) (hv : ∀ u : U, ρ u v = v) (u : U) :
    heckeInvariantMap ρ v ∘ₗ (_root_.Representation.ofMulAction A G G) u =
      heckeInvariantMap ρ v := sorry

/-- The supplier's left-regular Hecke sum at `δ_1` is the inverse-representative vector sum,
which gives the right action on invariants ([TV], §2.10, pp. 187–188). -/
theorem heckeSum_invariantMap_apply_one {A G V : Type*} [CommRing A] [Group G]
    [AddCommGroup V] [Module A V] (ρ : _root_.Representation A G V) (U : Subgroup G)
    [IsHeckeTriple (⊤ : Submonoid G) U U] (D : HeckeCoset (⊤ : Submonoid G) U U)
    (v : V) (hv : ∀ u : U, ρ u v = v) :
    letI := Fintype.ofFinite (DoubleCoset.DecompQuotient U U (D.out : G)⁻¹)
    HeckeCoset.heckeSum D
        ((_root_.Representation.ofMulAction A G G).comp (⊤ : Submonoid G).subtype)
        (by trivial) (by intro x hx; trivial) (heckeInvariantMap ρ v)
        (MonoidAlgebra.single 1 1) =
      ∑ a : DoubleCoset.DecompQuotient U U (D.out : G)⁻¹, ρ (DoubleCoset.rightCosetRep D a)⁻¹ v := sorry

/-- The Hecke algebra of level `U` over an arbitrary coefficient ring: the endomorphism ring of the
permutation module `A[G/U]`, with no measure or averaging ([TV], §2.10, pp. 187–188). -/
abbrev HeckeAlgebraLevel (A G : Type u) [CommRing A] [Group G] (U : Subgroup G) :=
  Module.End (MonoidAlgebra A G) (Representation.ofMulAction A G (G ⧸ U)).asModule

/-- For a compact open subgroup `U`, the Hecke algebra of level `U` is isomorphic to the
double-coset Hecke ring `𝕋 ⊤ U A` with Shimura's product, the basis element of `UgU` reading the
coefficient of `g⁻¹U` in the image of the coset `U` ([He18], §1.2, p. 7, formula (a)). -/
theorem HeckeAlgebraLevel.exists_ringEquiv_heckeRing {A G : Type u} [CommRing A] [Group G]
    [TopologicalSpace G] (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    [IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup] :
    Nonempty (HeckeAlgebraLevel A G U.toSubgroup ≃+*
      HeckeRing (⊤ : Submonoid G) U.toSubgroup A) := sorry

/-- The degree of an Iwahori basis coset is `q ^ n` from its residue-field Bruhat-cell
parametrization, where `n` is its affine length and `q` the residue cardinality
([IM65], Proposition 3.2, p. 44). The split Iwahori application supplies the parametrization
from RG2.4 root-cell products, without a positive-depth intersection hypothesis. -/
theorem HeckeAlgebraLevel.iwahoriBasis_index {G k : Type*} [Group G] [Field k] [Fintype k]
    (I : Subgroup G) (D : HeckeCoset (⊤ : Submonoid G) I I) (n : ℕ)
    (cell : DoubleCoset.DecompQuotient I I (D.rep : G) ≃ (Fin n → k)) :
    D.degree = Fintype.card k ^ n := by
  rw [HeckeCoset.degree_eq_natCard_decompQuotient, Nat.card_congr cell]
  simp only [Nat.card_eq_fintype_card, Fintype.card_fun, Fintype.card_fin]

-- For `U` normal the Hecke algebra of level `U` is the group algebra of `G ⧸ U`.
example (A G : Type u) [CommRing A] [Group G] (U : Subgroup G) [U.Normal] :
    Nonempty (HeckeAlgebraLevel A G U ≃+* MonoidAlgebra A (G ⧸ U)) := sorry

-- On the valuation quotient an unramified character with value 2 gives inverse right action.
example :
    let χ : Multiplicative ℤ →* ℚˣ := zpowersHom ℚˣ (Units.mk0 2 two_ne_zero)
    let ρ := _root_.Representation.ofLinearCharacter χ
    ρ (Multiplicative.ofAdd 1) 1 = 2 ∧
      ρ (Multiplicative.ofAdd (-1)) 1 = 1 / 2 ∧
      heckeInvariantMap ρ 1 (MonoidAlgebra.single (Multiplicative.ofAdd 1) 1) = 1 / 2 := by
  norm_num [heckeInvariantMap, Finsupp.linearCombination_single,
    _root_.Representation.ofLinearCharacter_apply, zpowersHom]

-- The left-regular comparison preserves coefficient scalars at the identity basis vector.
example {A G V : Type*} [CommRing A] [Group G] [AddCommGroup V] [Module A V]
    (ρ : _root_.Representation A G V) (v : V) :
    heckeInvariantMap ρ v (MonoidAlgebra.single 1 1) = v := by
  simp [heckeInvariantMap]


/-- In the integral Levi Hecke ring, two elements normalizing the level subgroup have a
coefficient-one basis product. For positive elements, the homomorphism of [ACC], §2.1.9,
Lemma 2.1.12, p. 914, transports this product to the group Hecke algebra. -/
theorem heckeBasis_mul_of_mem_normalizer {M : Type*} [Group M] (U_M : Subgroup M)
    [IsHeckeTriple (⊤ : Submonoid M) U_M U_M] (m m' : (⊤ : Submonoid M))
    (h : (m : M) ∈ Subgroup.normalizer (U_M : Set M) ∧
      (m' : M) ∈ Subgroup.normalizer (U_M : Set M)) :
    HeckeCosetModule.single ℤ (HeckeCoset.mk U_M U_M m) 1 *
      HeckeCosetModule.single ℤ (HeckeCoset.mk U_M U_M m') 1 =
    HeckeCosetModule.single ℤ (HeckeCoset.mk U_M U_M (m * m')) 1 :=
  HeckeCosetModule.single_mul_single_of_mem_normalizer ℤ h.1

/-! ## Layer SR.0d: the derived smooth category -/

/-- The smooth category is a Grothendieck abelian category: filtered colimits are exact and the
permutation modules `A[G/U]`, `U` open, form a generating family; hence it has enough injectives,
`Ext` groups and a derived category ([Ber87], §1.1–1.2, pp. 3–4). -/
instance SmoothRep.instIsGrothendieckAbelian (A : Type u) [CommRing A] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] :
    IsGrothendieckAbelian.{u} (SmoothRep A G) := sorry

section DerivedChecks

variable (A : Type u) [CommRing A] (G : Type u) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [HasDerivedCategory.{u + 1} (SmoothRep A G)]

-- The single-degree embedding gives a bijection on Hom.
example (X Y : SmoothRep A G) :
    Function.Bijective (fun f : X ⟶ Y => (DerivedCategory.singleFunctor (SmoothRep A G) 0).map f) :=
  sorry

-- Negative Ext between objects of the heart vanishes.
example (X Y : SmoothRep A G) :
    Subsingleton (((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj X) ⟶
      ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj Y)⟦(-1 : ℤ)⟧) := sorry

-- A zero smooth object stays zero in the derived category.
example (X : SmoothRep A G) (hX : Limits.IsZero X) :
    Limits.IsZero ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj X) := sorry

-- The zero complex is K-injective.
example : CochainComplex.IsKInjective
    (HomologicalComplex.zero : CochainComplex (SmoothRep A G) ℤ) := sorry

-- The identity resolution of a K-injective complex is a quasi-isomorphism.
example (I : CochainComplex (SmoothRep A G) ℤ) [I.IsKInjective] : QuasiIso (𝟙 I) := inferInstance

-- Bounded-below complexes of injective smooth objects are K-injective.
example (I : CochainComplex (SmoothRep A G) ℤ) (d : ℤ) [I.IsStrictlyGE d]
    [∀ n : ℤ, Injective (I.X n)] : I.IsKInjective :=
  CochainComplex.isKInjective_of_injective I d

end DerivedChecks

/-! ## Layer SR.2: induction, compact induction and Jacquet functors -/

section Induction

variable (A : Type u) [CommRing A] {G : Type u} [Group G] [TopologicalSpace G]

/-- Restriction along a continuous homomorphism. -/
def SmoothRep.res {H : Type u} [Group H] [TopologicalSpace H] (f : H →* G) (hf : Continuous f) :
    SmoothRep A G ⥤ SmoothRep A H :=
  ObjectProperty.lift _ (SmoothRep.ι A G ⋙ Rep.resFunctor f) fun V =>
    ⟨fun v => (V.property.isOpen_stabilizer v).preimage hf⟩

/-- Smooth induction `Ind_H^G`: the smooth part of Mathlib's coinduction along `H ≤ G`, functions
`f : G → W` with `f(hg) = σ(h) f(g)` that are right invariant under an open subgroup, `G` acting
by right translation ([Cas95], §2.4, p. 26). It is unnormalised. -/
def SmoothRep.indFunctor [IsTopologicalGroup G] (H : Subgroup G) : SmoothRep A H ⥤ SmoothRep A G :=
  SmoothRep.ι A H ⋙ Rep.coindFunctor A H.subtype ⋙ SmoothRep.smoothPart A G

/-- Compact induction from an open subgroup `H`: Mathlib's algebraic induction
`A[G] ⊗_{A[H]} −`, equivalently the functions in `Ind_H^G` with support compact modulo `H`
([Cas95], §2.4, p. 26). -/
def SmoothRep.cIndFunctor [IsTopologicalGroup G] (H : OpenSubgroup G) :
    SmoothRep A H ⥤ SmoothRep A G :=
  ObjectProperty.lift _ (SmoothRep.ι A H ⋙ Rep.indFunctor A H.toSubgroup.subtype) fun _ => sorry

/-- Frobenius reciprocity: smooth induction is right adjoint to restriction
([Cas95], Theorem 2.4.1(e), p. 26). -/
theorem SmoothRep.frobeniusReciprocity [IsTopologicalGroup G] (H : Subgroup G) :
    Nonempty (SmoothRep.res A H.subtype continuous_subtype_val ⊣ SmoothRep.indFunctor A H) :=
  sorry

/-- For an open subgroup, compact induction is left adjoint to restriction; this fails for closed
subgroups that are not open ([Cas95], Theorem 2.4.1(e), p. 26). -/
theorem SmoothRep.compactFrobeniusReciprocity [IsTopologicalGroup G] (H : OpenSubgroup G) :
    Nonempty (SmoothRep.cIndFunctor A H ⊣
      SmoothRep.res A H.toSubgroup.subtype continuous_subtype_val) := sorry

-- Inducing a restriction from the whole group recovers the original smooth object.
example [IsTopologicalGroup G] :
    Nonempty ((SmoothRep.res A (⊤ : Subgroup G).subtype continuous_subtype_val ⋙
      SmoothRep.indFunctor A (⊤ : Subgroup G)) ≅ 𝟭 (SmoothRep A G)) := sorry

-- Induction from the trivial subgroup of `ℤ_p` gives locally constant functions.
example (p : ℕ) [Fact p.Prime] :
    let ρ := _root_.Representation.coind (⊥ : Subgroup (Multiplicative ℤ_[p])).subtype
      (_root_.Representation.trivial A (⊥ : Subgroup (Multiplicative ℤ_[p])) A)
    Nonempty ((Representation.smoothVectors ρ).toSubmodule ≃ₗ[A] LocallyConstant (Multiplicative ℤ_[p]) A) := sorry

-- Compact induction from the whole open subgroup has the same identity comparison.
example [IsTopologicalGroup G] :
    Nonempty ((SmoothRep.res A (⊤ : OpenSubgroup G).toSubgroup.subtype continuous_subtype_val ⋙
      SmoothRep.cIndFunctor A (⊤ : OpenSubgroup G)) ≅ 𝟭 (SmoothRep A G)) := sorry

-- Coinduction contains the delta function at zero on `ℤ_p`, which is not a smooth vector.
example (p : ℕ) [Fact p.Prime] :
    let ρ := _root_.Representation.coind (⊥ : Subgroup (Multiplicative ℤ_[p])).subtype
      (_root_.Representation.trivial ℤ (⊥ : Subgroup (Multiplicative ℤ_[p])) ℤ)
    Representation.smoothVectors ρ ≠ ⊤ := sorry

end Induction

/-- A Levi decomposition `P = M ⋉ N` inside `G`: closed subgroups with a continuous retraction of
`P` onto `M` whose kernel is `N`. -/
structure LeviDecomposition (G : Type*) [Group G] [TopologicalSpace G] where
  /-- The parabolic subgroup. -/
  P : Subgroup G
  /-- The Levi subgroup. -/
  M : Subgroup G
  /-- The unipotent radical. -/
  N : Subgroup G
  M_le : M ≤ P
  N_le : N ≤ P
  isClosed_P : IsClosed (P : Set G)
  isClosed_M : IsClosed (M : Set G)
  isClosed_N : IsClosed (N : Set G)
  /-- The projection `P → M`. -/
  projection : P →* M
  continuous_projection : Continuous projection
  projection_inclusion : ∀ m : M, projection (Subgroup.inclusion M_le m) = m
  ker_projection : projection.ker = N.subgroupOf P

namespace LeviDecomposition

variable {G : Type u} [Group G] [TopologicalSpace G] (L : LeviDecomposition G)

instance normal : (L.N.subgroupOf L.P).Normal := L.ker_projection ▸ L.projection.normal_ker

/-- The modulus `δ_P` on `M`, with values in `ℂˣ`: Mathlib's modular character of `P` restricted to
`M`. When `M` is unimodular, as for a Levi subgroup of a reductive group, it is the factor by which
conjugation by `m` scales a Haar measure of `N` ([Cas95], §1.5, p. 16). -/
def modulusCharacter [IsTopologicalGroup G] [LocallyCompactSpace L.P] : L.M →* ℂˣ :=
  (Units.map ((Complex.ofRealHom.toMonoidHom).comp NNReal.toRealHom.toMonoidHom)).comp
    ((MeasureTheory.Measure.modularCharacter (G := L.P)).comp
      (Subgroup.inclusion L.M_le)).toHomUnits

/-- The modulus character is smooth when `G` is locally profinite: a compact open subgroup of `M`
maps into the compact subgroups of `ℝ_{>0}`, hence into the kernel. Total disconnectedness is
needed: on the real affine group `{(a, b) : a > 0}` with `M = {(a, 0)}` the modular character
is `(a, 0) ↦ a`, whose kernel is not open. -/
theorem modulusCharacter_isSmooth [IsTopologicalGroup G] [T2Space G] [TotallyDisconnectedSpace G]
    [LocallyCompactSpace L.P] :
    IsSmoothCharacter L.modulusCharacter := sorry

-- On the upper Borel subgroup of `GL₂(ℚ_p)` the modulus sends `diag(a, d)` to `|a/d|_p`: it is
-- `p⁻¹` at `diag(p, 1)` and `p` at `diag(1, p)`.
example (p : ℕ) [Fact p.Prime] (L : LeviDecomposition (GL (Fin 2) ℚ_[p]))
    (hP : ∀ g : GL (Fin 2) ℚ_[p], g ∈ L.P ↔ (g : Matrix (Fin 2) (Fin 2) ℚ_[p]).IsUpperTriangular)
    (hM : ∀ g : GL (Fin 2) ℚ_[p], g ∈ L.M ↔ (g : Matrix (Fin 2) (Fin 2) ℚ_[p]).IsDiag)
    (hN : L.N = TauCeti.upperUnitriangularGroup (Fin 2) ℚ_[p])
    (hπ : ∀ g : L.P, ((L.projection g : GL (Fin 2) ℚ_[p]) : Matrix (Fin 2) (Fin 2) ℚ_[p]) =
      Matrix.diagonal fun i => ((g : GL (Fin 2) ℚ_[p]) : Matrix (Fin 2) (Fin 2) ℚ_[p]) i i)
    [LocallyCompactSpace L.P] (a d : L.M)
    (ha : ((a : GL (Fin 2) ℚ_[p]) : Matrix (Fin 2) (Fin 2) ℚ_[p]) =
      Matrix.diagonal ![(p : ℚ_[p]), 1])
    (hd : ((d : GL (Fin 2) ℚ_[p]) : Matrix (Fin 2) (Fin 2) ℚ_[p]) =
      Matrix.diagonal ![1, (p : ℚ_[p])]) :
    (L.modulusCharacter a : ℂ) = (p : ℂ)⁻¹ ∧ (L.modulusCharacter d : ℂ) = p := sorry

end LeviDecomposition

section Jacquet

variable (A : Type u) [CommRing A] {G : Type u} [Group G] [TopologicalSpace G]
  (L : LeviDecomposition G)

/-- The unnormalised Jacquet functor `V ↦ V_N`: Mathlib's coinvariants of `N` as a representation
of `P ⧸ N`, restricted along `M → P ⧸ N` ([Cas95], §3.2, pp. 33–34). -/
def SmoothRep.jacquetFunctor [IsTopologicalGroup G] : SmoothRep A G ⥤ SmoothRep A L.M :=
  ObjectProperty.lift _
    (SmoothRep.ι A G ⋙ Rep.resFunctor L.P.subtype ⋙
      Rep.quotientToCoinvariantsFunctor A (L.N.subgroupOf L.P) ⋙
      Rep.resFunctor ((QuotientGroup.mk' (L.N.subgroupOf L.P)).comp (Subgroup.inclusion L.M_le)))
    fun _ => sorry

/-- Unnormalised parabolic induction `Ind_P^G ∘ infl_M^P` ([Cas95], §3.1, p. 32). -/
def SmoothRep.parabolicInduction [IsTopologicalGroup G] : SmoothRep A L.M ⥤ SmoothRep A G :=
  SmoothRep.res A L.projection L.continuous_projection ⋙ SmoothRep.indFunctor A L.P

/-- First adjointness: the Jacquet functor is left adjoint to parabolic induction along the same
parabolic, `Hom_G(V, Ind_P^G infl σ) ≅ Hom_M(V_N, σ)` ([Cas95], Theorem 3.2.4, p. 34). -/
theorem SmoothRep.firstAdjointness [IsTopologicalGroup G] :
    Nonempty (SmoothRep.jacquetFunctor A L ⊣ SmoothRep.parabolicInduction A L) := sorry

-- With trivial unipotent radical the Jacquet action is just the restricted Levi action.
example [IsTopologicalGroup G] (hN : L.N = ⊥) (X : SmoothRep A G) :
    Nonempty (_root_.Representation.Equiv ((SmoothRep.jacquetFunctor A L).obj X).obj.ρ
      (X.obj.ρ.comp L.M.subtype)) := sorry

end Jacquet

/-! ## Layer SR.3a: admissibility of irreducible representations -/

section Reductive

open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology

variable {F : Type} [Field F] [TopologicalSpace F]

/-- The rational points `𝐆(F)` of an affine group `Spec H` over `F`, with the point topology. -/
abbrev Points (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} F) : Type :=
  WithConv ((H : Type) →ₐ[F] F)

-- The trivial Hopf algebra has just one rational point.
example [IsTopologicalRing F] :
    Subsingleton (Points (TauCeti.FiniteTypeCommHopfAlgCat.of F F)) := sorry

-- The multiplicative group has the usual topology on field units.
example [IsTopologicalRing F] :
    Nonempty (Points (TauCeti.FiniteTypeCommHopfAlgCat.of F (LaurentPolynomial F)) ≃ₜ Fˣ) := sorry

-- The general linear coordinate Hopf algebra recovers the matrix-units topology.
example [IsTopologicalRing F] :
    Nonempty (Points (TauCeti.FiniteTypeCommHopfAlgCat.of F
      (TauCeti.GeneralLinear.coordinateHopfAlgebra F 2)) ≃ₜ GL (Fin 2) F) := sorry

variable {H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} F}

/-- Every irreducible smooth complex representation of a connected reductive group over a
nonarchimedean local field is admissible ([Ber92], Ch. II §1.3, Theorem 12, p. 37). -/
theorem isAdmissible_of_isIrreducible [ValuativeRel F] [IsNonarchimedeanLocalField F]
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (Points H)) (hV : V.obj.ρ.IsIrreducible) :
    Representation.IsAdmissible V.obj.ρ := sorry

-- For the ramified quadratic norm-one torus over an odd-residue local field, take
-- T₀ to be its connected parahoric and u = -1. Its two parahoric classes become one
-- class for the full compact subgroup T, the quotient used in the Hecke decomposition.
example {T : Type*} [CommGroup T] (T₀ : Subgroup T) (hindex : T₀.index = 2)
    (u : T) (hu : u ∉ T₀) :
    Nat.card (T ⧸ T₀) = 2 ∧ Nat.card (T ⧸ (⊤ : Subgroup T)) = 1 ∧
      (QuotientGroup.mk u : T ⧸ T₀) ≠ QuotientGroup.mk 1 ∧
      (QuotientGroup.mk u : T ⧸ (⊤ : Subgroup T)) = QuotientGroup.mk 1 := by
  refine ⟨hindex, Subgroup.index_top, ?_, ?_⟩
  · intro h
    apply hu
    simpa only [div_one] using (QuotientGroup.eq_iff_div_mem.mp h)
  · exact QuotientGroup.eq_iff_div_mem.mpr (Subgroup.mem_top _)

/-- Uniform admissibility: for a compact open `K` the dimensions of `V^K` are bounded uniformly in
the irreducible smooth complex representation `V` ([Ber92], Ch. II §1.4, pp. 37–38). -/
theorem exists_finrank_invariants_le [ValuativeRel F] [IsNonarchimedeanLocalField F]
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (K : OpenSubgroup (Points H)) (hK : IsCompact (K : Set (Points H))) :
    ∃ c : ℕ, ∀ V : SmoothRep ℂ (Points H), V.obj.ρ.IsIrreducible →
      Module.finrank ℂ (_root_.Representation.invariants (V.obj.ρ.comp K.toSubgroup.subtype)) ≤ c := sorry

/-! ## Layer SR.3: admissible complex representations -/

/-- Howe's theorem: a finitely generated admissible smooth complex representation has finite
length ([Cas95], Corollaries 6.3.7–6.3.8 and Theorem 6.3.10, pp. 59–61). -/
theorem isFiniteLength_of_isAdmissible [ValuativeRel F] [IsNonarchimedeanLocalField F]
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (Points H))
    (hfg : Module.Finite (MonoidAlgebra ℂ (Points H)) V.obj.ρ.asModule)
    (hadm : Representation.IsAdmissible V.obj.ρ) :
    IsFiniteLength (MonoidAlgebra ℂ (Points H)) V.obj.ρ.asModule := sorry

/-- Noetherianity: subrepresentations of finitely generated smooth complex representations are
finitely generated ([Ber92], Ch. III §2.2, Lemma 29 and Propositions 32–33, pp. 59–61). -/
theorem isNoetherian_of_finite [ValuativeRel F] [IsNonarchimedeanLocalField F]
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (Points H))
    (hfg : Module.Finite (MonoidAlgebra ℂ (Points H)) V.obj.ρ.asModule) :
    IsNoetherian (MonoidAlgebra ℂ (Points H)) V.obj.ρ.asModule := sorry

/-! ## Layer SR.2a: second adjointness -/

/-- The Levi decomposition of the dynamic parabolic `P(λ)` of a cocharacter `λ`: Tau Ceti's
parabolic, Levi and unipotent subgroups of the rational points, with the limit map as
projection. -/
def cocharacterDecomposition [ValuativeRel F] [IsNonarchimedeanLocalField F]
    (l : (H : Type) →ₐc[F] LaurentPolynomial F) :
    LeviDecomposition (Points H) where
  P := TauCeti.Cocharacter.parabolic F l
  M := TauCeti.Cocharacter.levi F l
  N := TauCeti.Cocharacter.unipotent F l
  M_le := TauCeti.Cocharacter.levi_le_parabolic
  N_le := TauCeti.Cocharacter.unipotent_le_parabolic
  isClosed_P := sorry
  isClosed_M := sorry
  isClosed_N := sorry
  projection := TauCeti.Cocharacter.limitToLevi F l
  continuous_projection := sorry
  projection_inclusion := sorry
  ker_projection := sorry

/-- The opposite cocharacter `t ↦ λ(t⁻¹)`: composition with the inversion `T ↦ T⁻¹` of `𝔾ₘ`. -/
def oppositeCocharacter (l : (H : Type) →ₐc[F] LaurentPolynomial F) :
    (H : Type) →ₐc[F] LaurentPolynomial F :=
  (BialgHom.ofAlgHom (LaurentPolynomial.invert (R := F)).toAlgHom sorry sorry).comp l

-- Taking the opposite twice gives back the cocharacter.
example (l : (H : Type) →ₐc[F] LaurentPolynomial F) :
    oppositeCocharacter (oppositeCocharacter l) = l := by
  ext x
  simp [oppositeCocharacter]

/-- A cocharacter and its opposite have the same Levi subgroup. -/
theorem levi_oppositeCocharacter (l : (H : Type) →ₐc[F] LaurentPolynomial F) :
    TauCeti.Cocharacter.levi F (oppositeCocharacter l) = TauCeti.Cocharacter.levi F l := sorry

/-- The opposite parabolic `P(λ⁻¹) = M ⋉ N̄`, with the same Levi subgroup `M` as `P(λ)`. -/
def oppositeDecomposition [ValuativeRel F] [IsNonarchimedeanLocalField F]
    (l : (H : Type) →ₐc[F] LaurentPolynomial F) :
    LeviDecomposition (Points H) where
  P := TauCeti.Cocharacter.parabolic F (oppositeCocharacter l)
  M := TauCeti.Cocharacter.levi F l
  N := TauCeti.Cocharacter.unipotent F (oppositeCocharacter l)
  M_le := levi_oppositeCocharacter l ▸ TauCeti.Cocharacter.levi_le_parabolic
  N_le := TauCeti.Cocharacter.unipotent_le_parabolic
  isClosed_P := sorry
  isClosed_M := sorry
  isClosed_N := sorry
  projection := (Subgroup.inclusion (levi_oppositeCocharacter l).le).comp
    (TauCeti.Cocharacter.limitToLevi F (oppositeCocharacter l))
  continuous_projection := sorry
  projection_inclusion := sorry
  ker_projection := sorry

/-- The rational points of a dynamic parabolic of a finite-type group are locally compact. -/
instance instLocallyCompactSpaceParabolic [ValuativeRel F] [IsNonarchimedeanLocalField F]
    (l : (H : Type) →ₐc[F] LaurentPolynomial F) :
    LocallyCompactSpace (cocharacterDecomposition l).P := sorry

/-- Bernstein's second adjointness, unnormalised: for a connected reductive group over a
nonarchimedean local field and complex coefficients, the right adjoint of parabolic induction
along `P = P(λ)` is `δ_P ⊗ (−)_{N̄}`, the Jacquet functor along the opposite parabolic twisted by
the modulus of `P` ([Ber87], §0.1, Main theorem, p. 1). -/
theorem secondAdjointness [ValuativeRel F] [IsNonarchimedeanLocalField F]
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : (H : Type) →ₐc[F] LaurentPolynomial F) :
    Nonempty (SmoothRep.parabolicInduction ℂ (cocharacterDecomposition l) ⊣
      (SmoothRep.jacquetFunctor ℂ (oppositeDecomposition l) ⋙
        SmoothRep.twistFunctor ℂ _ (cocharacterDecomposition l).modulusCharacter
          (cocharacterDecomposition l).modulusCharacter_isSmooth)) := sorry

end Reductive

/-! ## Layer SR.4: spherical representations and Satake -/

section Pseudoroot

variable {W T : Type*} [Group W] [CommGroup T]

/-- A local pseudoroot ([TV], §7.4 (a)–(b) and (7.4.2), p. 209): a point `x` of the dual torus `T`
whose square is the prescribed `sigmaQ = Σ*(q)⁻¹` and which is fixed by the twisted Weyl action
`y ↦ a(w)(y) · twist(w)`, where `twist w = ((wΣ* − Σ*)/2)(q)`. Both conditions are required. -/
def Pseudoroot (a : W →* MulAut T) (twist : W → T) (sigmaQ x : T) : Prop :=
  x * x = sigmaQ ∧ ∀ w, a w x * twist w = x

/-- Inverting the point inverts both the twist and the prescribed square: the point formulas
printed in [TV], (7.2.1), p. 206, are those of `x⁻¹`. -/
theorem Pseudoroot.inv_iff (a : W →* MulAut T) (d : W → T) (s x : T) :
    Pseudoroot a (fun w => (d w)⁻¹) s⁻¹ x⁻¹ ↔ Pseudoroot a d s x := by
  simp only [Pseudoroot, map_inv, ← mul_inv, inv_inj]

-- For a torus (`Σ* = 0`) the identity is a pseudoroot.
example (a : W →* MulAut T) : Pseudoroot a (fun _ => 1) 1 1 :=
  ⟨mul_one 1, fun w => by simp⟩

-- The square condition cannot be dropped: multiplying a pseudoroot by a Weyl-invariant `c` with
-- `c² ≠ 1` keeps the twisted fixed-point condition and breaks the square condition.
example (a : W →* MulAut T) (d : W → T) (s x c : T) (hx : Pseudoroot a d s x)
    (hc : ∀ w, a w c = c) (hc2 : c * c ≠ 1) :
    (∀ w, a w (x * c) * d w = x * c) ∧ ¬ Pseudoroot a d s (x * c) := by
  refine ⟨fun w => ?_, fun h => hc2 ?_⟩
  · rw [map_mul, hc, mul_right_comm, hx.2 w]
  · have h1 := h.1
    rw [← hx.1] at h1
    have : x * x * (c * c) = x * x * 1 := by
      rw [mul_one, mul_mul_mul_comm]; exact h1
    exact mul_left_cancel this

-- Trivial action at q = 2 gives the pseudoroot 1/2 with square 1/4.
example : Pseudoroot (1 : Unit →* MulAut ℚˣ) (fun _ => 1)
    (Units.mk0 (1 / 4) (by norm_num)) (Units.mk0 (1 / 2) (by norm_num)) := sorry

-- If the prescribed square is nontrivial, the identity cannot be a pseudoroot.
example (a : W →* MulAut T) (d : W → T) (s : T) (hs : s ≠ 1) :
    ¬ Pseudoroot a d s 1 := sorry

-- Squaring is injective in characteristic two, so a pseudoroot is unique when it exists.
example {k : Type*} [Field k] [CharP k 2] (a : W →* MulAut kˣ) (d : W → kˣ)
    (s x y : kˣ) (hx : Pseudoroot a d s x) (hy : Pseudoroot a d s y) : x = y := sorry

end Pseudoroot

-- The sign of the twisted Weyl action, for `GL₂` with `q = 3`: the raw Satake transform of
-- `1_{K diag(ϖ,1) K}` is `3` at `diag(ϖ,1)` and `1` at `diag(1,ϖ)`; as a function on `ℤ²` it is
-- invariant under `c ↦ (λ ↦ q^{λ₁ − λ₂} c(λ₂, λ₁))`, the reflection twisted by
-- `((sΣ* − Σ*)/2)(q)`, and not under the reflection twisted by the inverse.
example :
    let c : ℤ × ℤ → ℚ := fun l => if l = (1, 0) then 3 else if l = (0, 1) then 1 else 0
    (∀ l : ℤ × ℤ, (3 : ℚ) ^ (l.1 - l.2) * c (l.2, l.1) = c l) ∧
      ¬ ∀ l : ℤ × ℤ, (3 : ℚ) ^ (l.2 - l.1) * c (l.2, l.1) = c l := by
  intro c
  refine ⟨fun l => ?_, fun h => ?_⟩
  · rcases l with ⟨a, b⟩
    by_cases h1 : (a, b) = (1, 0)
    · simp only [Prod.mk.injEq] at h1; obtain ⟨rfl, rfl⟩ := h1; simp [c]
    by_cases h2 : (a, b) = (0, 1)
    · simp only [Prod.mk.injEq] at h2; obtain ⟨rfl, rfl⟩ := h2; norm_num [c]
    have h3 : (b, a) ≠ (1, 0) := by
      intro h; apply h2; simp only [Prod.mk.injEq] at h ⊢; omega
    have h4 : (b, a) ≠ (0, 1) := by
      intro h; apply h1; simp only [Prod.mk.injEq] at h ⊢; omega
    simp [c, h1, h2, h3, h4]
  · have := h (1, 0)
    norm_num [c] at this

section Spin

open Polynomial

variable {A : Type*} [CommRing A]

/-- The spherical spin polynomial of `GSp₄` ([Pil], §5.1.3–5.1.5, pp. 21–22), for the residue
size `q` and the spherical generators `T₀` (the central scalar `ϖ`), `T₁` and `T₂`:
`Q(X) = 1 − T₂X + q(T₁ + (q² + 1)T₀)X² − q³T₂T₀X³ + q⁶T₀²X⁴`. -/
def SpinPolynomial (q T0 T1 T2 : A) : A[X] :=
  1 - C T2 * X + C (q * (T1 + (q ^ 2 + 1) * T0)) * X ^ 2 -
    C (q ^ 3 * T2 * T0) * X ^ 3 + C (q ^ 6 * T0 ^ 2) * X ^ 4

/-- The reciprocal monic polynomial `X⁴ Q(1/X)` has coefficients `1, −T₂, qT₁ + (q³ + q)T₀,
−q³T₂T₀, q⁶T₀²` ([Pil], §5.1.5, p. 21). -/
theorem SpinPolynomial.reciprocal (q T0 T1 T2 : A) :
    Polynomial.reflect 4 (SpinPolynomial q T0 T1 T2) =
      X ^ 4 - C T2 * X ^ 3 + C (q * T1 + (q ^ 3 + q) * T0) * X ^ 2 -
        C (q ^ 3 * T2 * T0) * X + C (q ^ 6 * T0 ^ 2) := by
  have h1 : reflect 4 (X : A[X]) = X ^ 3 := by
    simpa using reflect_monomial (R := A) 4 1
  have r2 : revAt 4 2 = 2 := by decide
  have r3 : revAt 4 3 = 1 := by decide
  have r4 : revAt 4 4 = 0 := by decide
  simp only [SpinPolynomial, reflect_add, reflect_sub, reflect_one, reflect_C_mul,
    reflect_monomial, h1, r2, r3, r4, pow_one, pow_zero, mul_one]
  congr 2
  ring_nf

-- At `(q, T₀, T₁, T₂) = (1, 1, 4, 4)` the spin polynomial is `(1 − X)⁴`.
example : SpinPolynomial (1 : ℤ) 1 4 4 = (1 - X) ^ 4 := by
  simp only [SpinPolynomial, eq_intCast]
  ring

-- At `q = 0` only the linear term survives: `Q = 1 − T₂X`.
example : SpinPolynomial (0 : ℤ) 1 2 3 = 1 - 3 * X := by
  simp only [SpinPolynomial, eq_intCast]
  push_cast
  ring

-- At q = 2 the middle coefficient includes q³ + q.
example : SpinPolynomial (2 : ℤ) 1 2 3 =
    1 - 3 * X + 14 * X ^ 2 - 24 * X ^ 3 + 64 * X ^ 4 := by
  simp only [SpinPolynomial, eq_intCast]
  ring

-- The constant term is one and scaling spin roots scales coefficient j by c^j.
example (q T0 T1 T2 : A) : (SpinPolynomial q T0 T1 T2).coeff 0 = 1 := by
  simp [SpinPolynomial]

example (q T0 T1 T2 c : A) :
    SpinPolynomial q (c ^ 2 * T0) (c ^ 2 * T1) (c * T2) =
      (SpinPolynomial q T0 T1 T2).comp (C c * X) := sorry

end Spin

/-! ## Layer SR.5: integral local families for `GL_n` -/

section WeilDeligne

/-- Every unipotent element of a rational algebra has a unique nilpotent logarithm,
inverse to the finite exponential (Deligne 1973, §8.4). -/
theorem nilpotent_log_exists_unique {A : Type*} [Ring A] [Algebra ℚ A]
    (u : A) (hu : IsNilpotent (u - 1)) :
    ∃! N : A, IsNilpotent N ∧ IsNilpotent.exp N = u := by sorry

variable {E W V V' : Type*} [Field E] [CharZero E] [Group W] [TopologicalSpace W]
  [AddCommGroup V] [Module E V] [FiniteDimensional E V]
  [AddCommGroup V'] [Module E V'] [FiniteDimensional E V']

/-- The shared raw Weil–Deligne fields, with nilpotent monodromy and the arithmetic degree
relation, before imposing Frobenius semisimplicity (Deligne 1973, §8.4.1, p. 568).
The local construction uses the ClassFieldTheory Weil group and its degree homomorphism. -/
structure WeilDeligneParameter (E W V : Type*) [Field E] [CharZero E] [Group W]
    [TopologicalSpace W] [AddCommGroup V] [Module E V] [FiniteDimensional E V]
    (deg : W →* Multiplicative ℤ) (q : ℕ) where
  /-- The Weil action. -/
  r : _root_.Representation E W V
  /-- The action is locally constant. -/
  open_kernel : IsOpen {w : W | r w = 1}
  /-- The monodromy operator. -/
  N : Module.End E V
  /-- Monodromy is nilpotent. -/
  nilpotent : IsNilpotent N
  /-- Arithmetic Frobenius scales monodromy by the residue cardinality. -/
  relation : ∀ w, r w * N * r w⁻¹ = (q : E) ^ Multiplicative.toAdd (deg w) • N

/-- Frobenius semisimplicity is a predicate on the raw fields: every Weil element of nonzero
degree acts semisimply (Deligne 1973, §§8.5–8.6, p. 570). -/
def WeilDeligneParameter.IsFrobeniusSemisimple {deg : W →* Multiplicative ℤ} {q : ℕ}
    (D : WeilDeligneParameter E W V deg q) : Prop :=
  ∀ w, Multiplicative.toAdd (deg w) ≠ 0 → Module.End.IsSemisimple (D.r w)

/-- Transport of the raw Weil action and monodromy along a change of basis. -/
def WeilDeligneParameter.congr {deg : W →* Multiplicative ℤ} {q : ℕ}
    (D : WeilDeligneParameter E W V deg q) (e : V ≃ₗ[E] V') :
    WeilDeligneParameter E W V' deg q where
  r :=
    { toFun := fun w => e.toLinearMap ∘ₗ D.r w ∘ₗ e.symm.toLinearMap
      map_one' := sorry
      map_mul' := sorry }
  open_kernel := sorry
  N := e.toLinearMap ∘ₗ D.N ∘ₗ e.symm.toLinearMap
  nilpotent := sorry
  relation := sorry

/-- Change of basis conjugates the Weil action. -/
theorem WeilDeligneParameter.congr_r {deg : W →* Multiplicative ℤ} {q : ℕ}
    (D : WeilDeligneParameter E W V deg q) (e : V ≃ₗ[E] V') (w : W) :
    (D.congr e).r w = e.toLinearMap ∘ₗ D.r w ∘ₗ e.symm.toLinearMap := rfl

/-- Change of basis conjugates monodromy. -/
theorem WeilDeligneParameter.congr_N {deg : W →* Multiplicative ℤ} {q : ℕ}
    (D : WeilDeligneParameter E W V deg q) (e : V ≃ₗ[E] V') :
    (D.congr e).N = e.toLinearMap ∘ₗ D.N ∘ₗ e.symm.toLinearMap := rfl

-- Identity transport preserves both raw fields.
example {deg : W →* Multiplicative ℤ} {q : ℕ}
    (D : WeilDeligneParameter E W V deg q) :
    D.congr (LinearEquiv.refl E V) = D := by sorry

-- The unramified Jordan block is excluded by Frobenius semisimplicity.
example (D : WeilDeligneParameter ℚ (Multiplicative ℤ) (Fin 2 → ℚ)
    (MonoidHom.id _) 2)
    (hD : D.r (Multiplicative.ofAdd 1) = Matrix.toLin' !![1, 1; 0, 1]) :
    ¬ D.IsFrobeniusSemisimple := by sorry

-- The arithmetic relation retains nonzero monodromy in Sp(2).
example :
    let N : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    N ≠ 0 ∧ N ^ 2 = 0 ∧ Matrix.diagonal ![2, 1] * N *
      Matrix.diagonal ![(1 / 2 : ℚ), 1] = 2 • N := by sorry

end WeilDeligne

open ValuativeRel in
/-- Grothendieck monodromy over a complete normed extension of `ℚ_ℓ`: there is a unique
nilpotent operator giving the tame exponential on open inertia and the cyclotomic conjugation
relation. The linear construction uses these fields without an arithmetic `ContinuousRep`
wrapper (Deligne 1973, §8.1 and Theorem 8.2, p. 566). -/
theorem grothendieck_quasiUnipotent_complete
    (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : ℓ.Coprime (ringChar 𝓀[K]))
    (T : TauCeti.PadicTateTwist ℓ (AlgebraicClosure K) ≃ₗ[ℤ_[ℓ]] ℤ_[ℓ])
    {E : Type*} [NormedField E] [NormedAlgebra ℚ_[ℓ] E] [CompleteSpace E]
    {V : Type*} [AddCommGroup V] [Module E V] [FiniteDimensional E V]
    [TopologicalSpace V] [IsModuleTopology E V]
    (ρ : _root_.Representation E (Field.absoluteGaloisGroup K) V)
    (hρ : Continuous fun gv : Field.absoluteGaloisGroup K × V => ρ gv.1 gv.2) :
    ∃! N : Module.End E V, IsNilpotent N ∧
      (∀ w, ρ w ∘ₗ N = algebraMap ℚ_[ℓ] E
        ((TauCeti.localCyclotomicCharacter ℓ K w : ℤ_[ℓ]) : ℚ_[ℓ]) • (N ∘ₗ ρ w)) ∧
      ∃ J : Subgroup (TauCeti.inertiaSubgroup K),
        IsOpen (J : Set (TauCeti.inertiaSubgroup K)) ∧
        ∀ σ ∈ J, ρ (σ : Field.absoluteGaloisGroup K) =
          ∑ i ∈ Finset.range (Module.finrank E V),
            ((i.factorial : E)⁻¹ * (algebraMap ℚ_[ℓ] E
              (T (TauCeti.inertiaPadicTameCharacter K hℓ σ).toAdd : ℚ_[ℓ])) ^ i) • N ^ i :=
  sorry

/-! `wd-complete-coefficients` applies the shared `wd-linear-substrate` full formula to this
monodromy operator. `classical-llc-normalization` is its composite with SR.5.2's
`wd-frobenius-semisimplification`. The full unramified Jordan block and the nonzero monodromy
of `Sp(2)` remain distinct through these two operations; the Gauss-norm rank-one example in the
README supplies the complete-coefficient boundary without finite coefficient descent. -/

section IntegralInterfaces

/-- Multiplication by `χ(x)⁻¹` identifies induced functions with their `χ`-twist under right
translation, when `χ` is trivial on the inducing subgroup. Its inverse multiplies by `χ(x)`
([Cas95], §2.4, p. 26; Tau Ceti's `Representation.charTwist`). -/
def coindUnramifiedTwistEquiv {A G V : Type*} [CommRing A] [Group G]
    [AddCommGroup V] [Module A V] (H : Subgroup G)
    (σ : _root_.Representation A H V) (χ : G →* Aˣ) (hχ : ∀ h : H, χ (h : G) = 1) :
    _root_.Representation.Equiv (_root_.Representation.coind H.subtype σ)
      (_root_.Representation.charTwist χ (_root_.Representation.coind H.subtype σ)) where
  toFun f := ⟨fun x => (↑((χ x)⁻¹) : A) • (f : G → V) x, sorry⟩
  invFun f := ⟨fun x => (χ x : A) • (f : G → V) x, sorry⟩
  left_inv := sorry
  right_inv := sorry
  map_add' := sorry
  map_smul' := sorry
  isIntertwining' := sorry

-- On the valuation quotient of `ℚ₂ˣ`, `χ(2) = 2` distinguishes the two map directions.
-- At `x = 1/2` and `g = 2`, the indicator of the unit subgroup has `f(xg) = 1`.
example :
    let χ : Multiplicative ℤ →* ℚˣ := zpowersHom ℚˣ (Units.mk0 2 two_ne_zero)
    let f : ℤ → ℚ := fun z => if z = 0 then 1 else 0
    (χ (Multiplicative.ofAdd (-1)) : ℚ) * f (-1 + 1) = 1 / 2 ∧
      (χ (Multiplicative.ofAdd 1) : ℚ) *
        ((χ (Multiplicative.ofAdd (-1 + 1)) : ℚ) * f (-1 + 1)) = 2 ∧
      (↑((χ (Multiplicative.ofAdd (-1)))⁻¹) : ℚ) * f (-1 + 1) = 2 ∧
      (χ (Multiplicative.ofAdd 1) : ℚ) *
        ((↑((χ (Multiplicative.ofAdd (-1 + 1)))⁻¹) : ℚ) * f (-1 + 1)) = 2 := by
  norm_num [zpowersHom]

/-- A product in the smooth category is the smooth part of the algebraic product with
coordinatewise action ([DHKM1], Lemma 4.8, p. 14). -/
def SmoothRep.smoothProduct (A : Type u) [CommRing A] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] {J : Type u} (V : J → SmoothRep A G) :
    SmoothRep A G :=
  (SmoothRep.smoothPart A G).obj (Limits.piObj fun j => (V j).obj)

/-- Invariants under an open subgroup of a smooth product are the product of the coordinate
invariants: every fixed tuple is smooth ([DHKM1], following Corollary 4.6, p. 14). -/
theorem SmoothRep.nonempty_invariants_smoothProduct (A : Type u) [CommRing A] (G : Type u)
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] {J : Type u}
    (V : J → SmoothRep A G) (K : OpenSubgroup G) :
    Nonempty (((SmoothRep.invariantsFunctor A G K.toSubgroup).obj
        (SmoothRep.smoothProduct A G V)) ≃ₗ[A]
      ((j : J) → (SmoothRep.invariantsFunctor A G K.toSubgroup).obj (V j))) := sorry

/-- Stability of an endomorphism `T` of a module ([DHKM1], §4, pp. 13–14; [Hel16], Definition 11.9,
p. 58): for some `c ≥ 1`, `M = ker(T^c) ⊕ I` with `I` stable under `T` and `T` bijective on `I`. -/
def StableOperator {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (T : Module.End R M) : Prop :=
  ∃ (c : ℕ) (I : Submodule R M), 0 < c ∧ IsCompl (LinearMap.ker (T ^ c)) I ∧
    (∀ x ∈ I, T x ∈ I) ∧ ∀ y ∈ I, ∃! x : I, T x = y

/-- A common positive stability exponent gives a stable coordinatewise product operator
([DHKM1], the product statement following Corollary 4.6, p. 14). -/
theorem StableOperator.pi_of_uniform {R J : Type*} [CommRing R] {M : J → Type*}
    [∀ j, AddCommGroup (M j)] [∀ j, Module R (M j)] (T : ∀ j, Module.End R (M j))
    (c : ℕ) (hc : 0 < c) (I : ∀ j, Submodule R (M j))
    (hsplit : ∀ j, IsCompl (LinearMap.ker (T j ^ c)) (I j))
    (hstable : ∀ j, ∀ x ∈ I j, T j x ∈ I j)
    (hinvertible : ∀ j, ∀ y ∈ I j, ∃! x : I j, T j x = y) :
    StableOperator (LinearMap.piMap T) := sorry

-- An automorphism is stable with nilpotent part zero, a nilpotent operator with invertible part
-- zero.
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] :
    StableOperator (LinearMap.id : Module.End R M) := sorry

example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] :
    StableOperator (0 : Module.End R M) := sorry


-- A one-factor smooth product is the original smooth object.
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (X : SmoothRep A G) :
    Nonempty (SmoothRep.smoothProduct A G (fun _ : PUnit.{u + 1} => X) ≅ X) := sorry

-- A smooth product of zero objects is zero.
example {A G J : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (X : J → SmoothRep A G) (hX : ∀ j, Limits.IsZero (X j)) :
    Limits.IsZero (SmoothRep.smoothProduct A G X) := sorry

-- On a product of trivial actions every tuple is smooth and fixed.
example {A G J : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (X : J → SmoothRep A G) (hX : ∀ j g v, (X j).obj.ρ g v = v) :
    ∀ g v, (SmoothRep.smoothProduct A G X).obj.ρ g v = v := sorry

-- A mixed nilpotent/invertible operator is stable on the direct sum.
example {A M N : Type*} [CommRing A] [AddCommGroup M] [Module A M]
    [AddCommGroup N] [Module A N] :
    StableOperator (LinearMap.prodMap (0 : Module.End A M) (LinearMap.id : Module.End A N)) := sorry

-- Nilpotent factors without a common exponent do not give a stable product.
example :
    let I : ℕ → Ideal (Polynomial ℚ) := fun j => Ideal.span {Polynomial.X ^ (j + 1)}
    let M := fun j : ℕ => Polynomial ℚ ⧸ I j
    let T : ∀ j, Module.End ℚ (M j) := fun j =>
      LinearMap.mul ℚ (M j) (Ideal.Quotient.mk (I j) Polynomial.X)
    (∀ j, StableOperator (T j)) ∧ ¬ StableOperator (LinearMap.piMap T) := sorry

-- The evaluation pairing of an infinite trivial sum with its full dual does not give biduality.
example (k : Type*) [Field k] :
    ¬ Function.Surjective (Module.Dual.eval k (ℕ →₀ k)) := sorry

end IntegralInterfaces

section Whittaker

/-- The Whittaker coinvariants `V_{U,ψ}`: Mathlib's coinvariants of `Representation.charTwist ψ⁻¹ ρ`,
the quotient of `V` by the span of the `ρ(u)v − ψ(u)v` ([EH], §3.1, pp. 12–15). -/
abbrev WhittakerCoinvariants {A U V : Type*} [CommRing A] [Group U] [AddCommGroup V] [Module A V]
    (ρ : _root_.Representation A U V) (ψ : U →* Aˣ) :=
  _root_.Representation.Coinvariants (_root_.Representation.charTwist ψ⁻¹ ρ)

-- For `ψ = 1` these are Mathlib's ordinary coinvariants.
example {A U V : Type*} [CommRing A] [Group U] [AddCommGroup V] [Module A V]
    (ρ : _root_.Representation A U V) :
    WhittakerCoinvariants ρ 1 = _root_.Representation.Coinvariants ρ := by
  have h : (1 : U →* Aˣ)⁻¹ = 1 := by ext; simp
  rw [WhittakerCoinvariants, h, _root_.Representation.charTwist_one]

-- For a trivial subgroup the quotient is the original module.
example {A V : Type*} [CommRing A] [AddCommGroup V] [Module A V]
    (ρ : _root_.Representation A Unit V) :
    Function.Bijective (_root_.Representation.Coinvariants.mk
      (_root_.Representation.charTwist (1 : Unit →* Aˣ)⁻¹ ρ)) := sorry

-- The inverse twist acts by the inverse character value, rather than the character value.
example :
    let χ : Multiplicative ℤ →* ℚˣ := zpowersHom ℚˣ (Units.mk0 2 two_ne_zero)
    (_root_.Representation.charTwist χ⁻¹
      (_root_.Representation.trivial ℚ (Multiplicative ℤ) ℚ)) (Multiplicative.ofAdd 1) 1 = 1 / 2 := by
  norm_num [_root_.Representation.charTwist_apply_apply, zpowersHom]

-- The ordinary regular coinvariants identify every basis class with one.
example {A G : Type*} [CommRing A] [Group G] :
    let ρ := _root_.Representation.ofMulAction A G G
    ∃ e : _root_.Representation.Coinvariants ρ ≃ₗ[A] A,
      ∀ g, e (_root_.Representation.Coinvariants.mk ρ (MonoidAlgebra.single g 1)) = 1 := sorry

-- The ψ-character line has a Whittaker quotient of rank one.
example {A U : Type*} [CommRing A] [Group U] (ψ : U →* Aˣ) :
    Nonempty (WhittakerCoinvariants (_root_.Representation.ofLinearCharacter ψ) ψ ≃ₗ[A] A) := sorry

-- A nontrivial sign character on the trivial integral line gives `ℤ/2`, not zero.
example :
    let ψ : (ZMod 6)ˣ →* ℤˣ :=
      { toFun := fun g => if g = 1 then 1 else -1
        map_one' := by simp
        map_mul' := by sorry }
    Nonempty (WhittakerCoinvariants (_root_.Representation.trivial ℤ (ZMod 6)ˣ ℤ) ψ ≃ₗ[ℤ] ZMod 2) ∧
      _root_.Representation.Coinvariants.mk
        (_root_.Representation.charTwist ψ⁻¹ (_root_.Representation.trivial ℤ (ZMod 6)ˣ ℤ)) 1 ≠ 0 :=
  sorry

-- Over the rationals the same sign quotient is zero because 2 is a unit.
example :
    let ψ : (ZMod 6)ˣ →* ℚˣ :=
      { toFun := fun g => if g = 1 then 1 else -1
        map_one' := by simp
        map_mul' := by sorry }
    Subsingleton (WhittakerCoinvariants (_root_.Representation.trivial ℚ (ZMod 6)ˣ ℚ) ψ) ∧
      _root_.Representation.Coinvariants.mk
        (_root_.Representation.charTwist ψ⁻¹ (_root_.Representation.trivial ℚ (ZMod 6)ˣ ℚ)) 1 = 0 :=
  sorry

-- On the trivial line a character value with `ψ(u) − 1` a unit kills the Whittaker quotient.
example {A U : Type*} [CommRing A] [Group U] (ψ : U →* Aˣ) (u : U)
    (hu : IsUnit ((ψ u : A) - 1)) :
    Subsingleton (WhittakerCoinvariants (_root_.Representation.trivial A U A) ψ) := sorry

variable {k G V : Type u} [Field k] [Group G] [TopologicalSpace G] [AddCommGroup V] [Module k V]

/-- Absolute irreducibility: irreducible after every extension of the coefficient field. -/
def AbsolutelyIrreducible (ρ : _root_.Representation k G V) : Prop :=
  ∀ (L : Type u) [Field L] [Algebra k L], (_root_.Representation.baseChange L ρ).IsIrreducible

/-- Genericity for Whittaker data `(U, ψ)`: the Whittaker coinvariants are nonzero. -/
def IsGeneric (ρ : _root_.Representation k G V) (U : Subgroup G) (ψ : U →* kˣ) : Prop :=
  Nontrivial (WhittakerCoinvariants (ρ.comp U.subtype) ψ)

/-- Essentially AIG ([Hel12], Definition 3.3, p. 5): smooth, with an absolutely irreducible
generic socle `S` (an absolutely irreducible subrepresentation containing every irreducible one),
zero Whittaker coinvariants of `V/S`, and every vector in a finite-length subrepresentation. -/
def EssentiallyAIG (ρ : _root_.Representation k G V) (U : Subgroup G) (ψ : U →* kˣ) : Prop :=
  Representation.IsSmooth ρ ∧ ∃ S : Subrepresentation ρ,
    AbsolutelyIrreducible S.toRepresentation ∧ IsGeneric S.toRepresentation U ψ ∧
    (∀ T : Subrepresentation ρ, T.toRepresentation.IsIrreducible → T ≤ S) ∧
    Subsingleton (WhittakerCoinvariants
      ((ρ.quotient S.toSubmodule fun g => S.apply_mem_toSubmodule g).comp U.subtype) ψ) ∧
    ∀ v : V, ∃ T : Subrepresentation ρ, v ∈ T.toSubmodule ∧
      IsFiniteLength (MonoidAlgebra k G) T.toRepresentation.asModule

-- Absolute irreducibility excludes the zero representation and a trivial rank-two module.
example : ¬ AbsolutelyIrreducible (_root_.Representation.trivial k G (Fin 0 → k)) := sorry

example : ¬ AbsolutelyIrreducible (_root_.Representation.trivial k G (Fin 2 → k)) := sorry

-- Genericity also excludes zero.
example (U : Subgroup G) (ψ : U →* kˣ) :
    ¬ IsGeneric (_root_.Representation.trivial k G (Fin 0 → k)) U ψ := sorry

-- For the rational sign line the object-valued dual is nonzero, but equivariant Hom to the
-- trivial line is zero.
example :
    let χ : (ZMod 6)ˣ →* ℚˣ :=
      { toFun := fun g => if g = 1 then 1 else -1
        map_one' := by simp
        map_mul' := by sorry }
    let ρ := _root_.Representation.ofLinearCharacter χ
    Nontrivial (Module.Dual ℚ ℚ) ∧
      Subsingleton (ρ.IntertwiningMap (_root_.Representation.trivial ℚ (ZMod 6)ˣ ℚ)) ∧
      Module.finrank ℚ (_root_.Representation.invariants (_root_.Representation.dual ρ)) = 0 :=
  sorry

-- The direct sum of two trivial lines is not essentially AIG, even with trivial Whittaker data.
example : ¬ EssentiallyAIG (_root_.Representation.trivial k G (Fin 2 → k)) ⊥ 1 := sorry

-- An absolutely irreducible generic smooth representation is essentially AIG.
example (ρ : _root_.Representation k G V) (U : Subgroup G) (ψ : U →* kˣ)
    (hs : Representation.IsSmooth ρ) (hi : AbsolutelyIrreducible ρ) (hg : IsGeneric ρ U ψ) :
    EssentiallyAIG ρ U ψ := sorry

-- The trivial line is absolutely irreducible and generic for `U = ⊥`.
example : AbsolutelyIrreducible (_root_.Representation.trivial k G k) := sorry

example : IsGeneric (_root_.Representation.trivial k G k) ⊥ 1 := sorry

-- The trivial line is not generic for a nontrivial character.
example (U : Subgroup G) (ψ : U →* kˣ) (hψ : ψ ≠ 1) :
    ¬ IsGeneric (_root_.Representation.trivial k G k) U ψ := sorry

-- The zero representation is not essentially AIG.
example (U : Subgroup G) (ψ : U →* kˣ) :
    ¬ EssentiallyAIG (_root_.Representation.trivial k G (Fin 0 → k)) U ψ := sorry

end Whittaker

section CoWhittaker

/-- The generic character `u ↦ ψ(u₁₂ + u₂₃ + ⋯ + u_{n−1,n})` of Tau Ceti's upper unitriangular
subgroup of `GL_n(F)`, attached to an additive character `ψ` of `F`. -/
def genericCharacter (n : ℕ) {F A : Type*} [Field F] [CommRing A]
    (ψ : Multiplicative F →* Aˣ) : TauCeti.upperUnitriangularGroup (Fin n) F →* Aˣ where
  toFun u := ψ (Multiplicative.ofAdd (∑ i : Fin n, ∑ j : Fin n,
    if (j : ℕ) = i + 1 then ((u : GL (Fin n) F) : Matrix (Fin n) (Fin n) F) i j else 0))
  map_one' := sorry
  map_mul' := sorry

-- For `n = 1` the generic character is trivial.
example {F A : Type*} [Field F] [CommRing A] (ψ : Multiplicative F →* Aˣ)
    (u : TauCeti.upperUnitriangularGroup (Fin 1) F) : genericCharacter 1 ψ u = 1 := by
  simp [genericCharacter]

-- For `n = 2` the generic character is the additive character of the upper-right entry.
example {F A : Type*} [Field F] [CommRing A] (ψ : Multiplicative F →* Aˣ) (x : F)
    (u : TauCeti.upperUnitriangularGroup (Fin 2) F)
    (hu : ((u : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) = !![1, x; 0, 1]) :
    genericCharacter 2 ψ u = ψ (Multiplicative.ofAdd x) := by
  simp [genericCharacter, hu, Fin.sum_univ_succ]

-- For `n = 3` the value at `[[1, a, b], [0, 1, c], [0, 0, 1]]` is `ψ(a + c)`, whatever `b` is.
example {F A : Type*} [Field F] [CommRing A] (ψ : Multiplicative F →* Aˣ) (a b c : F)
    (u : TauCeti.upperUnitriangularGroup (Fin 3) F)
    (hu : ((u : GL (Fin 3) F) : Matrix (Fin 3) (Fin 3) F) = !![1, a, b; 0, 1, c; 0, 0, 1]) :
    genericCharacter 3 ψ u = ψ (Multiplicative.ofAdd (a + c)) := by
  simp [genericCharacter, hu, Fin.sum_univ_succ]

-- For `n = 2` the values at `[[1, x], [0, 1]]` and `[[1, y], [0, 1]]` multiply to the value at
-- their product `[[1, x + y], [0, 1]]`, computed from the formula and not from `map_mul'`.
example {F A : Type*} [Field F] [CommRing A] (ψ : Multiplicative F →* Aˣ) (x y : F)
    (u v : TauCeti.upperUnitriangularGroup (Fin 2) F)
    (hu : ((u : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) = !![1, x; 0, 1])
    (hv : ((v : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) = !![1, y; 0, 1]) :
    genericCharacter 2 ψ (u * v) = genericCharacter 2 ψ u * genericCharacter 2 ψ v := by
  simp [genericCharacter, hu, hv, Fin.sum_univ_succ, Matrix.mul_apply, ← map_mul, ← ofAdd_add]
  rw [add_comm]

variable {A G V : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [AddCommGroup V] [Module A V]

/-- Co-Whittaker families ([Hel12], Definition 6.1, p. 12): admissible, with Whittaker coinvariants
free of rank one over `A`, and with the smooth dual of every fibre `κ(𝔭) ⊗_A V` at a prime `𝔭`
essentially AIG. -/
def CoWhittaker (ρ : _root_.Representation A G V) (U : Subgroup G) (ψ : U →* Aˣ) : Prop :=
  Representation.IsAdmissible ρ ∧
    Nonempty (WhittakerCoinvariants (ρ.comp U.subtype) ψ ≃ₗ[A] A) ∧
    ∀ (P : Ideal A) [P.IsPrime],
      EssentiallyAIG (Representation.smoothVectors
          (_root_.Representation.dual (_root_.Representation.baseChange P.ResidueField ρ))).toRepresentation
        U ((Units.map (algebraMap A P.ResidueField).toMonoidHom).comp ψ)

-- The trivial line with `U = ⊥` and `ψ = 1` is co-Whittaker over every commutative ring.
example : CoWhittaker (_root_.Representation.trivial A G A) ⊥ 1 := sorry

-- Over the zero coefficient ring the zero representation satisfies the relative predicate.
example [Subsingleton A] : CoWhittaker (_root_.Representation.trivial A G (Fin 0 → A)) ⊥ 1 := sorry

-- Over a nonzero ring the zero derivative prevents co-Whittaker rank one.
example [Nontrivial A] : ¬ CoWhittaker (_root_.Representation.trivial A G (Fin 0 → A)) ⊥ 1 := sorry

-- Two trivial co-Whittaker lines have a derivative of rank two.
example [Nontrivial A] : ¬ CoWhittaker (_root_.Representation.trivial A G (Fin 2 → A)) ⊥ 1 := sorry

end CoWhittaker

open ValuativeRel in
/-- For a `p`-adic field `F`, an algebraically closed field `k` of characteristic `ℓ ≠ p`, a
nontrivial smooth character `ψ : F → W(k)ˣ` and a noetherian `W(k)`-algebra `A`, every
equivariant endomorphism of a co-Whittaker `A[GL_n(F)]`-module is a unique scalar
([Hel12], Proposition 6.2, p. 12). -/
theorem CoWhittaker.scalars {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [CharZero F] {ℓ : ℕ} [Fact ℓ.Prime] {k : Type} [Field k]
    [IsAlgClosed k] [CharP k ℓ] (hℓ : ringChar 𝓀[F] ≠ ℓ) {A : Type} [CommRing A]
    [IsNoetherianRing A] [Algebra (WittVector ℓ k) A] (n : ℕ)
    (ψ : Multiplicative F →* (WittVector ℓ k)ˣ) (hψ : IsSmoothCharacter ψ) (hψ1 : ψ ≠ 1)
    {V : Type} [AddCommGroup V] [Module A V] (ρ : _root_.Representation A (GL (Fin n) F) V)
    (h : CoWhittaker ρ (TauCeti.upperUnitriangularGroup (Fin n) F)
      (genericCharacter n ((Units.map (algebraMap (WittVector ℓ k) A).toMonoidHom).comp ψ)))
    (f : ρ.IntertwiningMap ρ) : ∃! a : A, ∀ v, f v = a • v := sorry

/-! ## Layer SR.6: finite-wild parameters and stable operators -/

section Cocycles

variable {Γ H : Type*} [Group Γ] [Group H]

/-- A crossed cocycle of `Γ` with values in a group `H` on which `Γ` acts by `α`:
`c(γδ) = c(γ) · α(γ)(c(δ))` ([DHKM2], §1.2, pp. 4–6). -/
structure CrossedCocycle (α : Γ →* MulAut H) where
  /-- The value of the cocycle. -/
  value : Γ → H
  cocycle : ∀ γ δ, value (γ * δ) = value γ * α γ (value δ)

/-- Gauge conjugation `(h · c)(γ) = h c(γ) α(γ)(h)⁻¹`, an action of `H` on crossed cocycles
([DHKM2], §1.2, pp. 4–5 (cocycles and L-homomorphisms); §2.1, p. 11 (twisted conjugation)). -/
def CrossedCocycle.gauge (α : Γ →* MulAut H) (h : H) (c : CrossedCocycle α) :
    CrossedCocycle α where
  value γ := h * c.value γ * (α γ h)⁻¹
  cocycle γ δ := by
    simp only [c.cocycle, map_mul, MulAut.mul_apply, map_inv, mul_assoc, inv_mul_cancel_left]

-- A crossed cocycle takes the group identity to the coefficient identity.
example (α : Γ →* MulAut H) (c : CrossedCocycle α) : c.value 1 = 1 := sorry

-- Gauging by h and then its inverse restores the cocycle.
example (α : Γ →* MulAut H) (h : H) (c : CrossedCocycle α) (γ : Γ) :
    (CrossedCocycle.gauge α h⁻¹ (CrossedCocycle.gauge α h c)).value γ = c.value γ := by
  simp [CrossedCocycle.gauge, mul_assoc]

-- For trivial coefficient action the cocycle identity is the homomorphism identity.
example (c : CrossedCocycle (1 : Γ →* MulAut H)) (γ δ : Γ) :
    c.value (γ * δ) = c.value γ * c.value δ := by simpa using c.cocycle γ δ

-- Gauge by one is the identity, and successive gauges multiply in the specified order.
example (α : Γ →* MulAut H) (c : CrossedCocycle α) (γ : Γ) :
    (CrossedCocycle.gauge α 1 c).value γ = c.value γ := by simp [CrossedCocycle.gauge]

example (α : Γ →* MulAut H) (h k : H) (c : CrossedCocycle α) (γ : Γ) :
    (CrossedCocycle.gauge α h (CrossedCocycle.gauge α k c)).value γ =
      (CrossedCocycle.gauge α (h * k) c).value γ := by
  simp [CrossedCocycle.gauge, mul_assoc]

-- A cocycle with trivial target has only the identity value.
example (α : Γ →* MulAut Unit) (c : CrossedCocycle α) (γ : Γ) : c.value γ = 1 := rfl

-- Inverse gauges also recover a nonidentity cocycle, with generator value 2.
example :
    let χ : Multiplicative ℤ →* ℚˣ := zpowersHom ℚˣ (Units.mk0 2 two_ne_zero)
    let c : CrossedCocycle (1 : Multiplicative ℤ →* MulAut ℚˣ) :=
      ⟨χ, by intro γ δ; simp⟩
    ((CrossedCocycle.gauge 1 1 (CrossedCocycle.gauge 1 1 c)).value
      (Multiplicative.ofAdd 1) : ℚ) = 2 := by
  norm_num [CrossedCocycle.gauge, zpowersHom]

end Cocycles

-- For `ℤ` acting on `ℚˣ` by inversion at the generator, gauging the identity cocycle by `2`
-- gives the value `2 · (2⁻¹)⁻¹ = 4` at the generator: this pins the side and the inverse.
example :
    let α : Multiplicative ℤ →* MulAut ℚˣ := zpowersHom (MulAut ℚˣ) (MulEquiv.inv ℚˣ)
    ((CrossedCocycle.gauge α (Units.mk0 2 two_ne_zero)
      ⟨fun _ => 1, fun _ _ => by simp⟩).value (Multiplicative.ofAdd 1) : ℚ) = 4 := by
  intro α
  simp [CrossedCocycle.gauge, α]
  norm_num


end

end TauCetiRoadmap.SmoothRepresentationsOfLocalGroups
