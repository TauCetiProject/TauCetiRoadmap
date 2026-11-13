import Mathlib
import TauCeti.RepresentationTheory.BaseChange

/-!
# Étale cohomology foundations: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

Scheme compactifications, finite-field descent, finite-free retract traces and stable lattices
can be stated on the pinned libraries. The sheaf-theoretic targets in the README require the
specified enhanced, constructible and adic carriers and are recorded by name in the final comment.
Definitions below specify their mathematical data; admitted terms fill proofs only.
All names are relative to `TauCetiRoadmap.EtaleCohomologyFoundations`.
-/

noncomputable section

namespace TauCetiRoadmap.EtaleCohomologyFoundations

open CategoryTheory AlgebraicGeometry
open scoped TensorProduct Pointwise

universe u u' v v' w w'

/-! ## G.1–G.3 Scheme compactifications -/

/-- **G.1, `Compactification`.** The shared scheme compactification carrier for coherent
and étale consumers: a proper factorization with a quasi-compact open interior.
Existence is asserted for separated finite-type maps over qcqs bases. -/
structure Compactification {X S : Scheme.{u}} (f : X ⟶ S) where
  Xbar : Scheme.{u}
  j : X ⟶ Xbar
  p : Xbar ⟶ S
  fac : j ≫ p = f
  openImmersion : IsOpenImmersion j
  quasiCompact : QuasiCompact j
  proper : IsProper p

attribute [instance] Compactification.openImmersion Compactification.quasiCompact
  Compactification.proper

/-- A compactification morphism is a scheme map over the base fixing the given interior. -/
structure Compactification.Hom {X S : Scheme.{u}} {f : X ⟶ S}
    (C D : Compactification f) where
  hom : C.Xbar ⟶ D.Xbar
  comm_j : C.j ≫ hom = D.j
  comm_p : hom ≫ D.p = C.p

/-- Compactification maps compose as their underlying scheme maps. -/
instance {X S : Scheme.{u}} (f : X ⟶ S) : Category (Compactification f) where
  Hom C D := Compactification.Hom C D
  id C := ⟨𝟙 C.Xbar, by simp, by simp⟩
  comp α β := ⟨α.hom ≫ β.hom,
    by rw [← Category.assoc, α.comm_j, β.comm_j],
    by rw [Category.assoc, β.comm_p, α.comm_p]⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- **G.1, `DenseCompactification`.** The full subcategory with schematically dense interior,
using the existing scheme-theoretic dominance property. -/
abbrev DenseCompactification {X S : Scheme.{u}} (f : X ⟶ S) :=
  ObjectProperty.FullSubcategory
    (fun C : Compactification f => IsSchemeTheoreticallyDominant C.j)

/-- A proper map has the identity compactification. -/
def Compactification.identity {X S : Scheme.{u}} (f : X ⟶ S) [IsProper f] :
    Compactification f where
  Xbar := X
  j := 𝟙 X
  p := f
  fac := by simp
  openImmersion := by infer_instance
  quasiCompact := by infer_instance
  proper := inferInstance

/-- Pulling back a compactification gives a compactification of the pulled-back map. -/
def Compactification.baseChange {X S S' : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) (g : S' ⟶ S) :
    Compactification (Limits.pullback.snd f g) where
  Xbar := Limits.pullback C.p g
  j := Limits.pullback.lift (Limits.pullback.fst f g ≫ C.j) (Limits.pullback.snd f g)
    (by rw [Category.assoc, C.fac, Limits.pullback.condition])
  p := Limits.pullback.snd C.p g
  fac := by simp
  openImmersion := by sorry
  quasiCompact := by sorry
  proper := by infer_instance

/-- Schematic closure of the open interior gives a dense compactification. -/
def Compactification.denseReplacement {X S : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) : DenseCompactification f where
  obj :=
    { Xbar := C.j.image
      j := C.j.toImage
      p := C.j.imageι ≫ C.p
      fac := by rw [← Category.assoc, Scheme.Hom.toImage_imageι, C.fac]
      openImmersion := by infer_instance
      quasiCompact := by infer_instance
      proper := by infer_instance }
  property := by sorry

/-- Dense replacement maps canonically to the original compactification, fixing the interior. -/
def Compactification.denseReplacementMap {X S : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) : C.denseReplacement.obj ⟶ C where
  hom := C.j.imageι
  comm_j := by exact Scheme.Hom.toImage_imageι C.j
  comm_p := rfl

/-- The canonical dense-replacement map is the schematic image's closed immersion. -/
example {X S : Scheme.{u}} {f : X ⟶ S} (C : Compactification f) :
    IsClosedImmersion C.denseReplacementMap.hom := by
  change IsClosedImmersion C.j.imageι
  infer_instance

/-- **G.1**, `Compactification.denseReplacement_dualNumber_section`. Schematic closure
of the affine line over dual numbers retains its nonzero square-zero section. -/
theorem Compactification.denseReplacement_dualNumber_section (k : Type u) [Field k]
    (C : Compactification
      (Spec.map (CommRingCat.ofHom
        (Polynomial.C : DualNumber k →+* Polynomial (DualNumber k))))) :
    ∃ e : Γ(C.denseReplacement.obj.Xbar, ⊤), e ≠ 0 ∧ e ^ 2 = 0 ∧
      (Scheme.ΓSpecIso (CommRingCat.of (Polynomial (DualNumber k)))).hom
        (C.denseReplacement.obj.j.appTop e) = Polynomial.C (DualNumber.eps : DualNumber k) := by
  sorry

/-- **G.1**, `Compactification.denseReplacement_specialFiber_empty`. The dense open D(t)
becomes empty at t=0; its new dense replacement is empty inside a point. -/
theorem Compactification.denseReplacement_specialFiber_empty (k : Type u) [Field k] :
    let A := Spec (CommRingCat.of (Polynomial k))
    let U : A.Opens := PrimeSpectrum.basicOpen (Polynomial.X : Polynomial k)
    let C : Compactification U.ι :=
      { Xbar := A
        j := U.ι
        p := 𝟙 A
        fac := by simp
        openImmersion := by infer_instance
        quasiCompact := by sorry
        proper := by infer_instance }
    let g : Spec (CommRingCat.of k) ⟶ A :=
      Spec.map (CommRingCat.ofHom (Polynomial.evalRingHom (0 : k)))
    IsSchemeTheoreticallyDominant C.j ∧ Nonempty (C.baseChange g).Xbar ∧
      IsEmpty (Limits.pullback (C := Scheme) U.ι g) ∧ IsEmpty (C.baseChange g).denseReplacement.obj.Xbar := by
  sorry

/-- Every compactification morphism is proper over the fixed base. -/
theorem Compactification.Hom.proper {X S : Scheme.{u}} {f : X ⟶ S}
    {C D : Compactification f} (h : C ⟶ D) : IsProper h.hom := sorry

/-- **G.2, `nagataCompactification`.** A separated finite-type map over a qcqs scheme
admits a schematically dense compactification. Finite type carries quasi-compactness. -/
theorem nagataCompactification {X S : Scheme.{u}} [CompactSpace S] [QuasiSeparatedSpace S]
    (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f] :
    Nonempty (DenseCompactification f) := sorry

/-- **G.3, `compactificationCommonRefinement`.** Two compactifications admit a dense
common refinement with specified maps fixing the same interior. -/
theorem compactificationCommonRefinement {X S : Scheme.{u}}
    [CompactSpace S] [QuasiSeparatedSpace S] (f : X ⟶ S)
    [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f]
    (C₁ C₂ : Compactification f) :
    ∃ C : DenseCompactification f, Nonempty (C.obj ⟶ C₁) ∧ Nonempty (C.obj ⟶ C₂) := sorry

/-- Maps from a schematically dense compactification into a fixed compactification are unique. -/
theorem denseCompactification_hom_unique {X S : Scheme.{u}} {f : X ⟶ S}
    (C : DenseCompactification f) (D : Compactification f) (h k : C.obj ⟶ D) :
    h = k := sorry

/-- Dense compactifications form a nonempty cofiltered category on the Nagata domain. -/
theorem denseCompactification_cofiltered {X S : Scheme.{u}}
    [CompactSpace S] [QuasiSeparatedSpace S] (f : X ⟶ S)
    [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f] :
    IsCofiltered (DenseCompactification f) := sorry

/-! ## F.4.0 Stable lattices and integral models

`ContinuousRep` is only the representation with its joint-continuity proof needed by these
lattice signatures. Scalar extension is the supplied `Representation.baseChange`.
-/

/-- A continuous representation of `Γ` on the finitely generated projective `A`-module `M` carrying
the module topology: a linear representation whose action map `Γ × M → M` is jointly continuous
(README F.4.0). Mathlib's `ContRepresentation` only asks each operator to be continuous. -/
structure ContinuousRep (Γ : Type u) [Group Γ] [TopologicalSpace Γ]
    (A : Type v) [CommRing A] [TopologicalSpace A]
    (M : Type w) [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M] where
  /-- The underlying linear representation. -/
  toRepresentation : Representation A Γ M
  /-- Joint continuity of the action map. -/
  continuous_action : Continuous fun p : Γ × M => toRepresentation p.1 p.2

namespace ContinuousRep

section Basic

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A]
  {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]
  {N : Type w'} [AddCommGroup N] [Module A N] [Module.Finite A N] [Module.Projective A N]
  [TopologicalSpace N] [IsModuleTopology A N]

instance : CoeFun (ContinuousRep Γ A M) (fun _ => Γ → M →ₗ[A] M) :=
  ⟨fun ρ g => ρ.toRepresentation g⟩

/-- Isomorphisms of continuous representations. -/
structure Iso (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) where
  /-- The underlying linear equivalence. -/
  toLinearEquiv : M ≃ₗ[A] N
  /-- Equivariance. -/
  comm : ∀ (g : Γ) (m : M), toLinearEquiv (ρ g m) = σ g (toLinearEquiv m)

/-- The rank-one representation `A(χ)` of a continuous character `χ`. -/
def ofCharacter [IsTopologicalRing A] (χ : Γ →ₜ* Aˣ) : ContinuousRep Γ A A where
  toRepresentation :=
    { toFun g := (χ g : A) • LinearMap.id
      map_one' := sorry
      map_mul' := sorry }
  continuous_action := sorry

/-- **F.4.0**, `ContinuousRep.ofCharacter_iso_iff`. Character lines over a commutative
ring are isomorphic exactly for equal characters. -/
theorem ofCharacter_iso_iff [IsTopologicalRing A] (χ χ' : Γ →ₜ* Aˣ) :
    Nonempty (Iso (ofCharacter χ) (ofCharacter χ')) ↔ χ = χ' := by
  sorry

end Basic

section BaseChange

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- Base change `M_B := B ⊗_A M` along a continuous ring homomorphism `A → B`, with the module
topology over `B`; the underlying representation is Tau Ceti's `Representation.baseChange`. -/
def baseChange (ρ : ContinuousRep Γ A M)
    (B : Type v') [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
    [ContinuousSMul A B] [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] :
    ContinuousRep Γ B (B ⊗[A] M) :=
  ⟨Representation.baseChange B ρ.toRepresentation, sorry⟩

/-- **F.4.0**, `ContinuousRep.baseChange_self_iso`. Identity coefficient extension has
the canonical tensor-unit equivariant isomorphism. -/
theorem baseChange_self_iso (ρ : ContinuousRep Γ A M) [ContinuousSMul A A]
    [TopologicalSpace (A ⊗[A] M)] [IsModuleTopology A (A ⊗[A] M)] :
    ∃ e : Iso (ρ.baseChange A) ρ, e.toLinearEquiv = TensorProduct.lid A M := by
  sorry

/-- **F.4.0**, `ContinuousRep.baseChange_trans_iso`. Successive coefficient extensions
agree with extension along the composite. -/
theorem baseChange_trans_iso (ρ : ContinuousRep Γ A M)
    (B C : Type v') [CommRing B] [CommRing C]
    [TopologicalSpace B] [IsTopologicalRing B] [TopologicalSpace C] [IsTopologicalRing C]
    [Algebra A B] [Algebra B C] [Algebra A C] [IsScalarTower A B C]
    [ContinuousSMul A B] [ContinuousSMul B C] [ContinuousSMul A C]
    [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)]
    [TopologicalSpace (C ⊗[B] (B ⊗[A] M))] [IsModuleTopology C (C ⊗[B] (B ⊗[A] M))]
    [TopologicalSpace (C ⊗[A] M)] [IsModuleTopology C (C ⊗[A] M)] :
    ∃ e : Iso ((ρ.baseChange B).baseChange C) (ρ.baseChange C),
      ∀ (c : C) (b : B) (m : M),
        e.toLinearEquiv (c ⊗ₜ[B] (b ⊗ₜ[A] m)) = (c * algebraMap B C b) ⊗ₜ[A] m := by
  sorry

end BaseChange

open ValuativeRel in
/-- A subgroup of `GL_n(E)` stabilises an `O_E`-lattice iff its closure is compact (DDT, §2.1).
The full-span lattice condition is Mathlib's `Submodule.IsLattice`. -/
theorem exists_stable_lattice_iff {E : Type v} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (n : ℕ)
    (K : Subgroup (Matrix.GeneralLinearGroup (Fin n) E)) :
    IsCompact (closure (K : Set (Matrix.GeneralLinearGroup (Fin n) E))) ↔
      ∃ L : Submodule 𝒪[E] (Fin n → E), Submodule.IsLattice E L ∧
        ∀ k ∈ K, ∀ x ∈ L, (k : Matrix (Fin n) (Fin n) E).mulVec x ∈ L := by
  sorry

/-- **F.4.0**, `ContinuousRep.uniformizer_zpowers_no_stable_lattice`. The cyclic subgroup
generated by a uniformizer scalar preserves no full lattice. -/
theorem uniformizer_zpowers_no_stable_lattice (ℓ : ℕ) [Fact ℓ.Prime]
    (π : ℚ_[ℓ]ˣ) (hπ : (π : ℚ_[ℓ]) = ℓ) :
    let K := Subgroup.zpowers (Matrix.GeneralLinearGroup.scalar (Fin 1) π)
    ¬ ∃ L : Submodule ℤ_[ℓ] (Fin 1 → ℚ_[ℓ]),
      Submodule.IsLattice ℚ_[ℓ] L ∧
        ∀ k ∈ K, ∀ x ∈ L, (k : Matrix (Fin 1) (Fin 1) ℚ_[ℓ]).mulVec x ∈ L := by
  sorry

end ContinuousRep

/-- A `Γ`-stable lattice in a representation `V` over a field `E` with ring of integers `O`: a
finitely generated `O`-submodule, stable under `Γ`, spanning `V` over `E`.
Its underlying submodule carries Mathlib's `Submodule.IsLattice` instance (README F.4.0). -/
structure GaloisLattice.IntegralModel {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
    (O : Type v) [CommRing O] {E : Type v} [Field E] [TopologicalSpace E] [Algebra O E]
    {V : Type w} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
    (ρ : ContinuousRep Γ E V) where
  /-- The lattice. -/
  lattice : Submodule O V
  /-- Stability under the group. -/
  stable : ∀ (g : Γ) (x : V), x ∈ lattice → ρ g x ∈ lattice
  /-- Finite generation over `O`. -/
  fg : lattice.FG
  /-- The lattice spans the representation. -/
  span_eq_top : Submodule.span E (lattice : Set V) = ⊤

namespace GaloisLattice.IntegralModel

/-- The underlying submodule of an integral model is a lattice in Mathlib's sense. -/
instance isLattice {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
    {O : Type v} [CommRing O] {E : Type v} [Field E] [TopologicalSpace E] [Algebra O E]
    {V : Type w} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
    {ρ : ContinuousRep Γ E V} (Λ : IntegralModel O ρ) : Submodule.IsLattice E Λ.lattice where
  fg := Λ.fg
  span_eq_top := Λ.span_eq_top

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {O : Type v} [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
  {E : Type v} [Field E] [TopologicalSpace E] [Algebra O E] [IsFractionRing O E]
  {V : Type w} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
  {ρ : ContinuousRep Γ E V}

/-- The restricted action is jointly continuous in the inherited subspace topology,
assumed to be the `O`-module topology. -/
def toContinuousRep (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice] :
    ContinuousRep Γ O Λ.lattice :=
  ⟨{ toFun g := ((ρ g).restrictScalars O).restrict (fun x hx => Λ.stable g x hx)
     map_one' := sorry
     map_mul' := sorry }, by
    exact (ρ.continuous_action.comp
      (continuous_fst.prodMk (continuous_subtype_val.comp continuous_snd))).subtype_mk _⟩

/-- The generic fibre: `E ⊗_O Λ ≅ V` as continuous representations. -/
theorem nonempty_iso_genericFibre [IsTopologicalRing O] [IsTopologicalRing E] [ContinuousSMul O E]
    (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
    [TopologicalSpace (E ⊗[O] Λ.lattice)] [IsModuleTopology E (E ⊗[O] Λ.lattice)]
    [Module.Finite E (E ⊗[O] Λ.lattice)] [Module.Projective E (E ⊗[O] Λ.lattice)] :
    Nonempty (ContinuousRep.Iso (Λ.toContinuousRep.baseChange E) ρ) := by
  sorry

/-- Homothety `c Λ` for `c ∈ E^×`, using Mathlib's action on lattices. -/
def smul (c : Eˣ) (Λ : IntegralModel O ρ) : IntegralModel O ρ where
  lattice := c • Λ.lattice
  stable := sorry
  fg := Submodule.IsLattice.fg (A := E) (M := c • Λ.lattice)
  span_eq_top := Submodule.IsLattice.span_eq_top (A := E) (M := c • Λ.lattice)

/-- Inclusion of a restricted representation intertwines its action with the ambient one. -/
example (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice] (g : Γ) (x : Λ.lattice) :
    (Λ.toContinuousRep g x : V) = ρ g (x : V) := rfl

/-- Existence of integral models for compact `Γ` and `O` compact open in the local field `E`. -/
theorem nonempty [CompactSpace Γ] [CompactSpace O] [IsTopologicalRing E]
    (hO : Topology.IsOpenEmbedding (algebraMap O E)) : Nonempty (IntegralModel O ρ) := by
  sorry

/-- Any two lattices are commensurable: `𝔪^a Λ ⊂ Λ' ⊂ 𝔪^{-a} Λ` for some `a`. -/
theorem exists_pow_le (Λ Λ' : IntegralModel O ρ) :
    ∃ a : ℕ, (IsLocalRing.maximalIdeal O ^ a) • Λ.lattice ≤ Λ'.lattice ∧
      (IsLocalRing.maximalIdeal O ^ a) • Λ'.lattice ≤ Λ.lattice := by
  sorry

end GaloisLattice.IntegralModel

/-! ## F.10.1 Finite-field descent and rational-point fixed points -/

namespace VanishingCycles

/-- An abbreviation of Mathlib's `FiniteField.frobeniusAlgEquivOfAlgebraic`, fixing the
arithmetic/geometric naming. README F.10.1, `frobeniusFixedPoints`. -/
noncomputable abbrev arithmeticFrobenius (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] : L ≃ₐ[k] L :=
  FiniteField.frobeniusAlgEquivOfAlgebraic k L

/-- Geometric Frobenius is the inverse field automorphism. README F.10.1. -/
noncomputable def geometricFrobenius (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] : L ≃ₐ[k] L :=
  (arithmeticFrobenius k L).symm

/-- Over an algebraic closure the fixed field of the r-th Frobenius has q^r elements.
README F.10.1, `frobeniusFixedPoints`; positivity excludes the infinite zeroth fixed field. -/
theorem frobeniusFixedField_card (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] [IsAlgClosed L]
    (r : ℕ) (hr : 0 < r) :
    Nat.card {x : L // (arithmeticFrobenius k L ^ r) x = x} = Fintype.card k ^ r := by
  sorry

open CategoryTheory AlgebraicGeometry

/-- The cardinality of L-valued points over the given structure morphism, total even before
point finiteness is proved. README F.10.1. -/
noncomputable def numberOfRationalPoints (k L : Type u) [Field k] [Field L] [Algebra k L]
    (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k)) : ℕ :=
  Nat.card {x : Spec (CommRingCat.of L) ⟶ X //
    x ≫ a = Spec.map (CommRingCat.ofHom (algebraMap k L))}

/-- **F.10.1**, `VanishingCycles.rationalPoints_finite`. A finite-type scheme over a finite
field has finitely many points valued in any finite extension field. -/
theorem rationalPoints_finite (k L : Type u) [Field k] [Fintype k]
    [Field L] [Fintype L] [Algebra k L]
    (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k))
    [LocallyOfFiniteType a] [QuasiCompact a] :
    Finite {x : Spec (CommRingCat.of L) ⟶ X //
      x ≫ a = Spec.map (CommRingCat.ofHom (algebraMap k L))} := by
  sorry

/-- Rational points over the fixed subfield are exactly fixed geometric points, without a
finite-type hypothesis on the scheme. README F.10.1. -/
theorem frobeniusFixedPoints (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] [IsAlgClosed L]
    (r : ℕ) (hr : 0 < r) (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k)) :
    let k_r := IntermediateField.fixedField (Subgroup.zpowers (arithmeticFrobenius k L ^ r))
    Nonempty ({x : Spec (CommRingCat.of k_r) ⟶ X //
      x ≫ a = Spec.map (CommRingCat.ofHom (algebraMap k k_r))} ≃
      {x : Spec (CommRingCat.of L) ⟶ X //
        x ≫ a = Spec.map (CommRingCat.ofHom (algebraMap k L)) ∧
        Spec.map (CommRingCat.ofHom (arithmeticFrobenius k L ^ r).toRingHom) ≫ x = x}) := by
  sorry

/-- **F.10.1**, `VanishingCycles.numberOfRationalPoints_pullback`. Rational-point counts
preserve fibre products over the ground field. -/
theorem numberOfRationalPoints_pullback (k L : Type u) [Field k] [Field L] [Algebra k L]
    (X Y : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k))
    (b : Y ⟶ Spec (CommRingCat.of k)) :
    numberOfRationalPoints k L (Limits.pullback a b) (Limits.pullback.fst a b ≫ a) =
      numberOfRationalPoints k L X a * numberOfRationalPoints k L Y b := by
  sorry

end VanishingCycles

/-! ## F.10.3 Split-retract comparison with the supplied projective trace -/

namespace PerfectComplex

/-- The finite-free split-retract expression for comparison with AdicSpacesPartIII §R3.8's projective trace.
README F.10.3. -/
noncomputable def projectiveTraceOfRetract {R P : Type*} [CommRing R] [AddCommGroup P]
    [Module R P] {ι : Type*} [Fintype ι]
    (i : P →ₗ[R] (ι → R)) (r : (ι → R) →ₗ[R] P)
    (_hi : r ∘ₗ i = LinearMap.id) (u : Module.End R P) : R :=
  LinearMap.trace R (ι → R) (i ∘ₗ u ∘ₗ r)

/-- The split-retract expression equals the contraction formula for the supplied projective trace. -/
theorem projectiveTraceOfRetract_eq_contract {R P : Type*} [CommRing R] [AddCommGroup P]
    [Module R P] [Module.Finite R P] [Module.Projective R P] {ι : Type*} [Fintype ι]
    (i : P →ₗ[R] (ι → R)) (r : (ι → R) →ₗ[R] P)
    (hi : r ∘ₗ i = LinearMap.id) (u : Module.End R P) :
    projectiveTraceOfRetract i r hi u =
      contractLeft R P ((dualTensorHomEquiv R P P).symm u) := by
  sorry

/-- Two finite-free split retracts compute the same trace of a projective-module endomorphism.
README F.10.3, projective trace algebra. -/
theorem projectiveTrace_independent {R P : Type*} [CommRing R] [AddCommGroup P]
    [Module R P] {ι κ : Type*} [Fintype ι] [Fintype κ]
    (i : P →ₗ[R] (ι → R)) (r : (ι → R) →ₗ[R] P)
    (j : P →ₗ[R] (κ → R)) (s : (κ → R) →ₗ[R] P)
    (hi : r ∘ₗ i = LinearMap.id) (hj : s ∘ₗ j = LinearMap.id) (u : Module.End R P) :
    projectiveTraceOfRetract i r hi u = projectiveTraceOfRetract j s hj u := by
  sorry

end PerfectComplex

/-!
The remaining signatures are specified in the README, using the following intended names.
They require the shared sheaf and enhancement carriers; this list declares no placeholder objects.

The README's Exact supplier contracts table specifies the prerequisites. In particular,
F.10.3 consumes the projective trace of AdicSpacesPartIII R3.8, the enhancement of
EnhancedDerivedSheaves §§0.1–0.4, module-derived tensor and perfectness from
DerivedModuleAlgebra §§0.2/1.E.0, and the DGAInfinity and PadicMeasuresIwasawaAlgebras
interfaces listed below. PerfectoidSpaces P5.10–P5.12 (qcqs étale 2-colimit and finite-stage
detection) and P7.15 (étale-topos comparison for tilde-limits) supply the hypotheses for §0.5's conditional analytic instantiation.

DerivedModuleAlgebra §§0.2, 1.1–1.5 and 1.T.1 supply module tensor, towers, ML/Milnor
and completion comparisons, with bounded power-torsion for principal quotient-tower completion.
SchemeAndStackFoundations §0.29 supplies SchemeFrobenius.absoluteFrobenius,
SchemeFrobenius.schemeFrobeniusTwist, SchemeFrobenius.relativeFrobenius,
SchemeFrobenius.iteratedSchemeFrobenius and SchemeFrobenius.qPowerFrobenius.
Its §0.23a supplies universalHomeomorphismEtaleEquivalence on sites;
VanishingCycles.universalHomeomorphismEtaleEquivalence is the sheaf/cohomology transport.
AdicSpacesPartIII §R3.8 supplies LinearMap.projectiveTrace, LinearMap.projectiveTrace_eq_trace,
LinearMap.projectiveTrace_baseChange and LinearMap.projectiveTrace_cyclic.
DGAInfinity Layer 5 supplies the perfect/compact equivalence for the one-object DG category R.
PadicMeasuresIwasawaAlgebras §5.1 supplies projectiveDeterminant and projectiveDeterminantMap.

F.0.1–F.0.4 and F.1:
VanishingCycles.constructibleEtale, VanishingCycles.finiteEtaleGaloisCategory,
VanishingCycles.lisseMonodromyEquiv, VanishingCycles.fieldSheavesEquiv,
VanishingCycles.etaleTateTwists, VanishingCycles.universalHomeomorphismEtaleEquivalence,
VanishingCycles.constructibleDerivedCategory, VanishingCycles.finiteCoefficientCohomology,
VanishingCycles.filteredColimit_cohomology.

F.0.A1: SchemeInertia.decomposition, SchemeInertia.inertia, SchemeInertia.conjugate,
SchemeInertia.intermediateOrbits. F.0.A0–F.0.A2 give the intrinsic field and multiplicative-group
identifications and the arithmetic exact sequence, with section/path choices retained.
The finite-cover carrier is TauCeti.FiniteEtaleScheme from
TauCeti.AlgebraicGeometry.FiniteEtale.Basic, with its affine algebra anti-equivalence and
separably closed field comparison. The based construction applies to every connected nonempty scheme.
SchemeInertia.intermediateOrbits identifies points by decomposition orbits; its ramification
indices require defectless discrete valuations with separable residue extensions.

0.5–0.11:
ClassicalCoefficients.finitePresentationDescent, ClassicalCoefficients.constructibleDerivedDescent,
ClassicalCoefficients.constructibleHomContinuity, ClassicalAlgebraic.supportLocalization,
ClassicalAlgebraic.supportLocalization.mayerVietoris, ClassicalAlgebraic.properSupports,
ClassicalAlgebraic.properSupports.derivedComparison, ClassicalAlgebraic.finiteTrace,
ClassicalAlgebraic.cycleClasses, ClassicalAlgebraic.lciCycleClass,
ClassicalAlgebraic.smoothBoundaryPurity, ClassicalAlgebraic.smoothTrace,
ClassicalAlgebraic.curveDuality. Projective-bundle summands are indexed by 0 ≤ i < r,
including the empty rank-zero projectivization. Relative smooth trace includes étale-local
reduction and spreading/base-change comparisons to pointed smooth proper field-curve Jacobians.

F.2–F.3: VanishingCycles.etaleBaseChange, VanishingCycles.properBaseChange,
VanishingCycles.smoothBaseChange, VanishingCycles.localAcyclicity,
VanishingCycles.etaleCompactSupports, VanishingCycles.compactSupportCohomology,
VanishingCycles.etaleKunneth, VanishingCycles.etaleKunnethCompactSupport,
VanishingCycles.etaleCohomologicalDimension, VanishingCycles.affineArtinVanishing,
VanishingCycles.etaleFiniteness, VanishingCycles.lisseDirectImageTransport,
VanishingCycles.compactSupportFiniteness, VanishingCycles.genericLocalAcyclicity.
F.3.0 establishes VanishingCycles.etaleCohomologicalDimension before F.2.6 uses its
coefficient-specific finite bound for the global-sections projection formula in etaleKunneth.
VanishingCycles.localAcyclicity includes tensor stability for ULA K and a locally constant
perfect Λ-complex L on X with global Tor amplitude [c,d]. Cohomological or Tor amplitude
[a,b] for K gives the corresponding bound [a+c,b+d] for the tensor.
VanishingCycles.lisseDirectImageTransport requires proper f:X→S. On a connected locally
closed Noetherian stratum T, write f_T:X×_S T→T and K_T for the restriction of a bounded
constructible K with finite invertible coefficients. Constructibility of R(f_T)_*K_T and
ULA of (f_T,K_T) give lisse Rⁱ(f_T)_*K_T, identified with (Rⁱf_*K)|_T by proper base change.

F.3a: VanishingCycles.HenselianTrait, VanishingCycles.HenselianTrait.inertia,
VanishingCycles.HenselianTrait.inertia_exact, VanishingCycles.HenselianTrait.genericFiber,
VanishingCycles.HenselianTrait.specialFiber, VanishingCycles.inertia_eq_top_of_strictlyHenselian,
VanishingCycles.inertia_puiseux, VanishingCycles.inertia_eq_valuation_inertia,
VanishingCycles.wild_inertia_ne_bot, VanishingCycles.tameCharacter_kummer,
VanishingCycles.tameCharacter_surjective, VanishingCycles.tameCharacter_conj,
VanishingCycles.tameCharacter_restrict, VanishingCycles.tameCharacter_eq_inertiaTameCharacter,
VanishingCycles.tameCharacter_puiseux,
VanishingCycles.tameCharacter_restrict_quadratic, VanishingCycles.tameCharacter_wild.

F.4.1–F.4.6: VanishingCycles.adicRealization, VanishingCycles.normalizedAdicSystems,
VanishingCycles.classicalAdicRealization, VanishingCycles.etaleProetaleAdicComparison,
VanishingCycles.adicFiniteness, VanishingCycles.rationalAdicRealization,
VanishingCycles.adicFunctoriality. A general lisse rational pro-étale sheaf can have only a
constructible integral model. The global-lisse-lattice subcategory is distinguished; all lisse
rational sheaves belong to it on geometrically unibranch schemes.

F.5–F.8: VanishingCycles.etaleExceptionalInverseImage, VanishingCycles.etaleVerdierDuality,
VanishingCycles.smoothPurity, VanishingCycles.smoothPairGysin, VanishingCycles.etaleGaussBonnet,
VanishingCycles.etaleBlowup for a smooth separated finite-type k-scheme and a smooth closed
k-subscheme of pure codimension c ≥ 1, with summands indexed by 1 ≤ i < c and shifts/twists
(−i)[−2i], for ordinary and compact-support cohomology. VanishingCycles.etaleWeakLefschetz,
VanishingCycles.fieldPerverseTStructure, VanishingCycles.intermediateExtension, for finite-type
schemes over a field with invertible finite coefficients or ℓ-adic coefficients ℓ ≠ char(k).
Geometric projective-space cohomology uses a separably closed ground field; over arbitrary
fields the projective-bundle decomposition is relative to RΓ(k). Affine perverse vanishing
is geometric: for finite/rational coefficients, H^i = 0 for i > 0 and H_c^i = 0 for i < 0.
For integral p objects the ordinary upper bound is 0; for p⁺ objects it is 1 with torsion H¹.
Both integral hearts have H_c^i = 0 for i < 0, and p⁺ objects have torsion-free H_c⁰.

F.10.2/F.10.2b: VanishingCycles.frobeniusCohomology carries coefficient descent data, first
at finite level, then through normalized realization. F.10.3: PerfectComplex.lefschetzNumber,
PerfectComplex.filteredTraceAdditivity require perfect/filtered enhanced module objects.
DerivedModuleAlgebra §1.E.0 supplies DerivedDeRham.IsPerfect and its PerfectComplex.IsPerfect
alias on DerivedCategory (ModuleCat R). For commutative R, PerfectComplexInput(R) realizes
the perfect DG objects as exactly this full subcategory and identifies them with the
dualizable objects for the tensor of DerivedModuleAlgebra §0.2. Its unit, counit and comparisons
are natural in module morphisms and coefficient maps and commute with shifts, scalar
extension, tensor, duals and finite filtered graded-piece maps. Bounded finite-projective
representatives realize to their usual derived objects and traces to alternating termwise traces.
F.10.4–F.10.5: VanishingCycles.freeTorsorEquivariantPerfectness and
VanishingCycles.freeTorsorCoefficientDescent use total-complex perfectness over the actual
possibly noncommutative group ring and inverse deck action for right modules. Their proofs
include the noncommutative projection and Tor argument, rather than assuming projectivity of
cohomology or invertibility of the group order.
-/

end TauCetiRoadmap.EtaleCohomologyFoundations
