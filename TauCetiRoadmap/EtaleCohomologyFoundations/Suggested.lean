module

public import Mathlib
public import TauCeti.AlgebraicGeometry.FiniteEtale.Fiber
public import TauCeti.AlgebraicGeometry.RationalPoint.Count
public import TauCeti.RepresentationTheory.BaseChange

/-!
# Étale cohomology foundations: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

Headlines stated on the pinned libraries:

* `nagataCompactification`: every separated finite-type morphism to a qcqs scheme is
  compactifiable, as an instance of the `Prop`-class `HasCompactification` through which lower
  shriek is defined without a chosen compactification; `denseCompactification_cofiltered`,
  `denseCompactification_hom_unique` and `compactificationCommonRefinement` are the comparison
  geometry.
* `Scheme.isInvertibleOn_iff_ne_zero`: the single invertibility class `Scheme.IsInvertibleOn`
  agrees over a field with the explicit hypothesis `(ℓ : k) ≠ 0` used by finite-field headlines.
* `EtaleFundamentalGroup` with its `Small.{u}` instance: the canonical étale fundamental group
  at a geometric point, defined without connectedness; `EtalePath` is a path between points.
* `MonoidHom.weilGroup`: the Weil group as a subgroup of `π₁ × ℤ`.
* `ContinuousRep.exists_stable_lattice_iff`: a linear group stabilises a lattice exactly when its
  closure is compact.
* `Scheme.Hom.pointCount_eq_numberOfRationalPoints` and `VanishingCycles.frobeniusFixedPoints`:
  points over the degree-`r` extension of a finite field, counted on Tau Ceti's
  `Scheme.Hom.numberOfRationalPoints` and by fixed points of Frobenius.
* `PerfectComplex.projectiveTrace_independent`: the trace of a projective-module endomorphism
  does not depend on the split retract computing it.

Design choices made explicit: coefficients and test fields live in the universe of the scheme,
where Mathlib's small étale site is Grothendieck abelian
(`Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`); geometric points are separably closed
and unbundled, with stalks at Mathlib's `Scheme.pointSmallEtale`, conservative by
`Scheme.isConservative_pointSmallEtale`; finite fields are `[Finite k]`; definitions carry no
hypotheses; comparisons are data or `IsIso`, never `Nonempty (_ ≅ _)`.
The sheaf-theoretic targets of the README require the derived, constructible and adic carriers it
specifies and are absent from this file. Definitions below specify their mathematical data;
admitted terms fill proofs only. All names are relative to
`TauCetiRoadmap.EtaleCohomologyFoundations`.
-/

noncomputable section

@[expose] public section

namespace TauCetiRoadmap.EtaleCohomologyFoundations

open CategoryTheory AlgebraicGeometry
open scoped TensorProduct Pointwise

universe u u' v v' w w'

/-! ## Conventions: invertibility of an integer on a scheme -/

/-- **Conventions, `Scheme.IsInvertibleOn`.** The integer `ℓ` is invertible on `X`: it is a unit
in every residue field of `X`. This is the only invertibility hypothesis of the roadmap; headline
statements over a finite field take the explicit form `(ℓ : k) ≠ 0` instead. -/
class Scheme.IsInvertibleOn (ℓ : ℕ) (X : Scheme.{u}) : Prop where
  isUnit_residueField : ∀ x : X, IsUnit (ℓ : X.residueField x)

/-- Over a field, invertibility of `ℓ` on a nonempty scheme is the explicit finite-field
hypothesis `(ℓ : k) ≠ 0`. -/
theorem Scheme.isInvertibleOn_iff_ne_zero {k : Type u} [Field k] {X : Scheme.{u}} [Nonempty X]
    (f : X ⟶ Spec (.of k)) (ℓ : ℕ) :
    Scheme.IsInvertibleOn ℓ X ↔ (ℓ : k) ≠ 0 := by
  sorry

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

/-- **G.2, `HasCompactification`.** The morphism `f` admits a compactification. Lower shriek and
everything built from it assume this class; no construction takes a chosen compactification as an
argument. Dense replacement turns any compactification into a schematically dense one. -/
class HasCompactification {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  nonempty_compactification : Nonempty (Compactification f)

/-- **G.2, `nagataCompactification`.** A separated finite-type map to a qcqs scheme is
compactifiable. Finite type carries quasi-compactness. -/
instance nagataCompactification {X S : Scheme.{u}} [CompactSpace S] [QuasiSeparatedSpace S]
    (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f] :
    HasCompactification f := sorry

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

/-! ## F.0.2 The étale fundamental group and paths -/

/-- **F.0.2, `EtaleFundamentalGroup`.** The étale fundamental group of `S` at the geometric point
`x : Spec Ω ⟶ S`, `Ω` separably closed: the automorphism group of Tau Ceti's geometric fibre
functor on finite étale `S`-schemes, with Mathlib's profinite topology on automorphisms of a
functor to `FintypeCat`. The definition assumes no connectedness. -/
abbrev EtaleFundamentalGroup {S : Scheme.{u}} {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (x : Spec (.of Ω) ⟶ S) :=
  Aut (TauCeti.FiniteEtaleScheme.fiber x)

/-- **F.0.2.** The étale fundamental group has a model in the universe of the scheme. -/
instance EtaleFundamentalGroup.small {S : Scheme.{u}} {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (x : Spec (.of Ω) ⟶ S) : Small.{u} (EtaleFundamentalGroup x) := sorry

/-- **F.0.2, `EtalePath`.** An étale path from `x` to `y`: an isomorphism of geometric fibre
functors. Paths between points of different connected components do not exist. -/
abbrev EtalePath {S : Scheme.{u}} {Ω Ω' : Type u} [Field Ω] [IsSepClosed Ω] [Field Ω']
    [IsSepClosed Ω'] (x : Spec (.of Ω) ⟶ S) (y : Spec (.of Ω') ⟶ S) :=
  TauCeti.FiniteEtaleScheme.fiber x ≅ TauCeti.FiniteEtaleScheme.fiber y

/-! ## F.0.A2 Weil groups -/

/-- **F.0.A2, `MonoidHom.weilGroup`.** For `π : G →* Γ` and `Φ ∈ Γ`, the subgroup of `G × ℤ` of
pairs `(g, n)` with `π g = Φ ^ n`. For the map from the étale fundamental group of a scheme over a
finite field to the absolute Galois group, and `Φ` the geometric Frobenius, this is the Weil group;
it carries the subspace topology of `G × ℤ` with `ℤ` discrete. -/
def MonoidHom.weilGroup {G Γ : Type*} [Group G] [Group Γ] (π : G →* Γ) (Φ : Γ) :
    Subgroup (G × Multiplicative ℤ) :=
  MonoidHom.eqLocus (MonoidHom.comp π (MonoidHom.fst G (Multiplicative ℤ)))
    (MonoidHom.comp (zpowersHom Γ Φ) (MonoidHom.snd G (Multiplicative ℤ)))

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

/-- Homothety `c Λ` for `c ∈ E^×`, using Mathlib's action on lattices. -/
def smul (c : Eˣ) (Λ : IntegralModel O ρ) : IntegralModel O ρ where
  lattice := c • Λ.lattice
  stable := sorry
  fg := Submodule.IsLattice.fg (A := E) (M := c • Λ.lattice)
  span_eq_top := Submodule.IsLattice.span_eq_top (A := E) (M := c • Λ.lattice)

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

/-- **F.10.1, `VanishingCycles.arithmeticFrobenius`.** Mathlib's
`FiniteField.frobeniusAlgEquivOfAlgebraic`, `x ↦ x ^ Nat.card k`, for a finite field `k`; the
enumeration it uses is internal to the definition and does not change its value. -/
noncomputable def arithmeticFrobenius (k L : Type u) [Field k] [Finite k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] : L ≃ₐ[k] L :=
  letI := Fintype.ofFinite k
  FiniteField.frobeniusAlgEquivOfAlgebraic k L

/-- **F.10.1, `VanishingCycles.geometricFrobenius`.** The inverse field automorphism; the only
geometric Frobenius automorphism of the roadmap. -/
noncomputable def geometricFrobenius (k L : Type u) [Field k] [Finite k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] : L ≃ₐ[k] L :=
  (arithmeticFrobenius k L).symm

/-- Over an algebraic closure the fixed field of the `r`-th Frobenius has `q ^ r` elements;
positivity excludes the infinite zeroth fixed field. -/
theorem frobeniusFixedField_card (k L : Type u) [Field k] [Finite k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] [IsAlgClosed L]
    (r : ℕ) (hr : 0 < r) :
    Nat.card {x : L // (arithmeticFrobenius k L ^ r) x = x} = Nat.card k ^ r := by
  sorry

/-- **F.10.1**, `VanishingCycles.rationalPoints_finite`. A finite-type scheme over a finite
field has finitely many points valued in any finite extension field. -/
theorem rationalPoints_finite (k L : Type u) [Field k] [Finite k]
    [Field L] [Finite L] [Algebra k L]
    (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k))
    [LocallyOfFiniteType a] [QuasiCompact a] :
    Finite {x : Spec (CommRingCat.of L) ⟶ X //
      x ≫ a = Spec.map (CommRingCat.ofHom (algebraMap k L))} := by
  sorry

end VanishingCycles

/-- **F.10.1, `Scheme.Hom.pointCount`.** For `f : X ⟶ Spec k` with `k` finite of cardinality
`q`, the number of points of `X` with values in the degree-`r` extension of `k`, modelled as the
splitting field of `X ^ (q ^ r) - X` over `k`: Tau Ceti's `Scheme.Hom.numberOfRationalPoints` of
that field, multiplicative in fibre products by `Scheme.Hom.numberOfRationalPoints_pullback`. The
zeta series of `X` is formed from these counts downstream. -/
noncomputable def Scheme.Hom.pointCount {k : Type u} [Field k] [Finite k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (r : ℕ) : ℕ :=
  f.numberOfRationalPoints
    (Polynomial.SplittingField (Polynomial.X ^ Nat.card k ^ r - Polynomial.X : Polynomial k))

/-- **F.10.1, `Scheme.Hom.pointCount_eq_numberOfRationalPoints`.** Every finite extension `E` of
the finite field `k` gives the count at its degree, whatever model of the extension is used. -/
theorem Scheme.Hom.pointCount_eq_numberOfRationalPoints {k : Type u} [Field k] [Finite k]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) (E : Type u) [Field E] [Algebra k E]
    [Module.Finite k E] :
    Scheme.Hom.pointCount f (Module.finrank k E) = f.numberOfRationalPoints E := by
  sorry

/-- **F.10.1, `VanishingCycles.frobeniusFixedPoints`.** For `r > 0` and an algebraic closure `L`
of the finite field `k`, the points over the degree-`r` extension are counted by the `L`-points
fixed by the `r`-th power of arithmetic Frobenius. The underlying bijection is Tau Ceti's
`AlgEquiv.fromSpecFixedFieldEquiv`; no finite-type hypothesis is needed. -/
theorem VanishingCycles.frobeniusFixedPoints {k : Type u} [Field k] [Finite k]
    (L : Type u) [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] [IsAlgClosed L]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) (r : ℕ) (hr : 0 < r) :
    Scheme.Hom.pointCount f r =
      Nat.card {x : Spec (.of L) ⟶ X //
        x ≫ f = Spec.map (CommRingCat.ofHom (algebraMap k L)) ∧
        Spec.map (CommRingCat.ofHom
          (VanishingCycles.arithmeticFrobenius k L ^ r).toRingHom) ≫ x = x} := by
  sorry

/-! ## F.10.3 Split-retract comparison with the supplied projective trace -/

namespace PerfectComplex

/-- The finite-free split-retract expression for comparison with AdicSpacesPartIII §R3.8's
projective trace. README F.10.3. The retraction condition `r ∘ i = id` is a hypothesis of the
theorems below, not of the definition. -/
noncomputable def projectiveTraceOfRetract {R P : Type*} [CommRing R] [AddCommGroup P]
    [Module R P] {ι : Type*} [Fintype ι]
    (i : P →ₗ[R] (ι → R)) (r : (ι → R) →ₗ[R] P) (u : Module.End R P) : R :=
  LinearMap.trace R (ι → R) (i ∘ₗ u ∘ₗ r)

/-- The split-retract expression equals the contraction formula for the supplied projective trace. -/
theorem projectiveTraceOfRetract_eq_contract {R P : Type*} [CommRing R] [AddCommGroup P]
    [Module R P] [Module.Finite R P] [Module.Projective R P] {ι : Type*} [Fintype ι]
    (i : P →ₗ[R] (ι → R)) (r : (ι → R) →ₗ[R] P)
    (hi : r ∘ₗ i = LinearMap.id) (u : Module.End R P) :
    projectiveTraceOfRetract i r u =
      contractLeft R P ((dualTensorHomEquiv R P P).symm u) := by
  sorry

/-- Two finite-free split retracts compute the same trace of a projective-module endomorphism.
README F.10.3, projective trace algebra. -/
theorem projectiveTrace_independent {R P : Type*} [CommRing R] [AddCommGroup P]
    [Module R P] {ι κ : Type*} [Fintype ι] [Fintype κ]
    (i : P →ₗ[R] (ι → R)) (r : (ι → R) →ₗ[R] P)
    (j : P →ₗ[R] (κ → R)) (s : (κ → R) →ₗ[R] P)
    (hi : r ∘ₗ i = LinearMap.id) (hj : s ∘ₗ j = LinearMap.id) (u : Module.End R P) :
    projectiveTraceOfRetract i r u = projectiveTraceOfRetract j s u := by
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
separably closed field comparison. EtaleFundamentalGroup and EtalePath are defined for every
scheme and geometric point; connectedness enters only the theorems that need it.
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
including the empty rank-zero projectivization. The smooth trace is built over a qcqs base by
the diagonal argument; curve duality is its case of relative dimension one.
ClassicalAlgebraic.properSupports is the canonical lower shriek of a compactifiable morphism,
defined from the diagram of all compactifications and computed through any one of them.

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
