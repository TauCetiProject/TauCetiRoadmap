import Mathlib
import TauCeti.AlgebraicGeometry.Fibers
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
open scoped TensorProduct

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

/-- The identity construction retains the original scheme and factorization as data. -/
example {X S : Scheme.{u}} (f : X ⟶ S) [IsProper f] :
    (Compactification.identity f).Xbar = X ∧
      (Compactification.identity f).j = 𝟙 X ∧ (Compactification.identity f).p = f :=
  ⟨rfl, rfl, rfl⟩

/-- Base change uses the pullback of the proper factor. -/
example {X S S' : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) (g : S' ⟶ S) :
    (C.baseChange g).Xbar = Limits.pullback C.p g := rfl

/-- Dense replacement uses the schematic image, including the interior's nilpotents. -/
example {X S : Scheme.{u}} {f : X ⟶ S} (C : Compactification f) :
    C.denseReplacement.obj.Xbar = C.j.image := rfl

/-- The canonical dense-replacement map is the schematic image's closed immersion. -/
example {X S : Scheme.{u}} {f : X ⟶ S} (C : Compactification f) :
    IsClosedImmersion C.denseReplacementMap.hom := by
  change IsClosedImmersion C.j.imageι
  infer_instance

/-- The standard affine-line chart in the projective line has exactly one boundary point. -/
example (k : Type u) [Field k] :
    let A := Spec (CommRingCat.of (Polynomial k))
    let f : A ⟶ Spec (CommRingCat.of k) :=
      Spec.map (CommRingCat.ofHom (Polynomial.C : k →+* Polynomial k))
    let grading := MvPolynomial.homogeneousSubmodule (Fin 2) k
    letI : GradedAlgebra grading := MvPolynomial.gradedAlgebra
    ∃ C : DenseCompactification f, ∃ e : C.obj.Xbar ≅ Proj grading,
      Set.range (C.obj.j ≫ e.hom) =
        (Proj.basicOpen grading (MvPolynomial.X (0 : Fin 2)) : Set (Proj grading)) ∧
      ∃! x : Proj grading, x ∉ Set.range (C.obj.j ≫ e.hom) := by
  sorry

/-- Schematic closure of the affine line over dual numbers retains its nonzero square-zero section. -/
example (k : Type u) [Field k]
    (C : Compactification
      (Spec.map (CommRingCat.ofHom
        (Polynomial.C : DualNumber k →+* Polynomial (DualNumber k))))) :
    ∃ e : Γ(C.denseReplacement.obj.Xbar, ⊤), e ≠ 0 ∧ e ^ 2 = 0 ∧
      (Scheme.ΓSpecIso (CommRingCat.of (Polynomial (DualNumber k)))).hom
        (C.denseReplacement.obj.j.appTop e) = Polynomial.C (DualNumber.eps : DualNumber k) := by
  sorry

/-- The dense open D(t) becomes empty at t=0; its new dense replacement is empty inside a point. -/
example (k : Type u) [Field k] :
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

/-! ## F.0.A0 Tate-module coordinates -/

/- The characteristic-zero Tate-module parametrization is `e_ζ : ẑ → T`,
`a ↦ (ζ_n^a)_n`, and the coordinate map is its inverse `c_ζ : T → ẑ`.
For a profinite unit `u`, `e_(ζ^u) = e_ζ ∘ [u]` and `c_(ζ^u) = [u⁻¹] ∘ c_ζ`,
where `[u]` denotes multiplication by `u`. The scheme fundamental-group identification
is a README target. -/

-- A unit reducing to `2 mod 5` changes the coordinate of `ζ₅` to `3 mod 5`.
example {M : Type*} [CommMonoid M] {ζ : M} (hζ : IsPrimitiveRoot ζ 5) :
    (ζ ^ 2) ^ 3 = ζ := by
  calc
    (ζ ^ 2) ^ 3 = ζ ^ 6 := (pow_mul ζ 2 3).symm
    _ = ζ := by rw [show 6 = 5 + 1 from rfl, pow_succ, hζ.pow_eq_one, one_mul]


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

/-- The continuous trivial character gives the identity operator at every group element. -/
example [IsTopologicalRing A] (g : Γ) :
    (ofCharacter (1 : Γ →ₜ* Aˣ)).toRepresentation g = LinearMap.id := by
  change ((1 : Γ →ₜ* Aˣ) g : A) • (LinearMap.id : A →ₗ[A] A) = LinearMap.id
  simp

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

/-- A nontrivial rank-one character acts after scalar extension by its image in the new ring. -/
example (χ : Γ →ₜ* Aˣ) (_hχ : χ ≠ 1)
    (B : Type v') [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
    [ContinuousSMul A B] [TopologicalSpace (B ⊗[A] A)] [IsModuleTopology B (B ⊗[A] A)]
    (g : Γ) (b : B) (a : A) :
    ((ofCharacter χ).baseChange B).toRepresentation g (b ⊗ₜ[A] a) =
      (algebraMap A B (χ g : A)) • (b ⊗ₜ[A] a) := by
  sorry

end BaseChange

/-- Multiplication by p-adic units on the discrete field has continuous operators and a discontinuous action. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    letI : TopologicalSpace ℚ_[ℓ] := ⊥
    (∀ g : ℤ_[ℓ]ˣ, Continuous fun x : ℚ_[ℓ] => ((g : ℤ_[ℓ]) : ℚ_[ℓ]) * x) ∧
      ¬ Continuous (fun p : ℤ_[ℓ]ˣ × ℚ_[ℓ] => ((p.1 : ℤ_[ℓ]) : ℚ_[ℓ]) * p.2) := by
  sorry

open ValuativeRel in
/-- A subgroup of `GL_n(E)` stabilises an `O_E`-lattice iff its closure is compact (DDT, §2.1). -/
theorem exists_stable_lattice_iff {E : Type v} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (n : ℕ)
    (K : Subgroup (Matrix.GeneralLinearGroup (Fin n) E)) :
    IsCompact (closure (K : Set (Matrix.GeneralLinearGroup (Fin n) E))) ↔
      ∃ L : Submodule 𝒪[E] (Fin n → E), L.FG ∧ Submodule.span E (L : Set (Fin n → E)) = ⊤ ∧
        ∀ k ∈ K, ∀ x ∈ L, (k : Matrix (Fin n) (Fin n) E).mulVec x ∈ L := by
  sorry

/-- The full p-adic field is not a finitely generated module over its ring of integers. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    ¬ (⊤ : Submodule ℤ_[ℓ] ℚ_[ℓ]).FG := by
  sorry

/-- The cyclic subgroup generated by a uniformizer scalar preserves no full lattice. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (π : ℚ_[ℓ]ˣ) (hπ : (π : ℚ_[ℓ]) = ℓ) :
    let K := Subgroup.zpowers (Matrix.GeneralLinearGroup.scalar (Fin 1) π)
    ¬ ∃ L : Submodule ℤ_[ℓ] (Fin 1 → ℚ_[ℓ]),
      L.FG ∧ Submodule.span ℚ_[ℓ] (L : Set (Fin 1 → ℚ_[ℓ])) = ⊤ ∧
        ∀ k ∈ K, ∀ x ∈ L, (k : Matrix (Fin 1) (Fin 1) ℚ_[ℓ]).mulVec x ∈ L := by
  sorry

end ContinuousRep

/-- A `Γ`-stable lattice in a representation `V` over a field `E` with ring of integers `O`: a
finitely generated `O`-submodule, stable under `Γ`, spanning `V` over `E` (README F.4.0). -/
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

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {O : Type v} [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
  {E : Type v} [Field E] [TopologicalSpace E] [Algebra O E] [IsFractionRing O E]
  {V : Type w} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
  {ρ : ContinuousRep Γ E V}

instance (Λ : IntegralModel O ρ) : Module.Finite O Λ.lattice :=
  Module.Finite.iff_fg.mpr Λ.fg

instance (Λ : IntegralModel O ρ) : Module.Free O Λ.lattice := by
  sorry

instance (Λ : IntegralModel O ρ) : Module.Projective O Λ.lattice :=
  Module.Projective.of_free

/-- The lattice `(Λ, ρ|_Λ)` as a continuous representation over `O`. -/
def toContinuousRep (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice] :
    ContinuousRep Γ O Λ.lattice :=
  ⟨{ toFun g := ((ρ g).restrictScalars O).restrict (fun x hx => Λ.stable g x hx)
     map_one' := sorry
     map_mul' := sorry }, sorry⟩

/-- The generic fibre: `E ⊗_O Λ ≅ V` as continuous representations. -/
theorem nonempty_iso_genericFibre [IsTopologicalRing O] [IsTopologicalRing E] [ContinuousSMul O E]
    (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
    [TopologicalSpace (E ⊗[O] Λ.lattice)] [IsModuleTopology E (E ⊗[O] Λ.lattice)]
    [Module.Finite E (E ⊗[O] Λ.lattice)] [Module.Projective E (E ⊗[O] Λ.lattice)] :
    Nonempty (ContinuousRep.Iso (Λ.toContinuousRep.baseChange E) ρ) := by
  sorry

/-- Homothety `c Λ` for `c ∈ E^×`. -/
def smul (c : Eˣ) (Λ : IntegralModel O ρ) : IntegralModel O ρ where
  lattice := Λ.lattice.map (((c : E) • LinearMap.id : V →ₗ[E] V).restrictScalars O)
  stable := sorry
  fg := sorry
  span_eq_top := sorry

/-- Existence of integral models for compact `Γ` and `O` compact open in the local field `E`. -/
theorem nonempty [CompactSpace Γ] [CompactSpace O] [IsTopologicalRing E]
    (hO : Topology.IsOpenEmbedding (algebraMap O E)) : Nonempty (IntegralModel O ρ) := by
  sorry

/-- Any two lattices are commensurable: `𝔪^a Λ ⊂ Λ' ⊂ 𝔪^{-a} Λ` for some `a`. -/
theorem exists_pow_le (Λ Λ' : IntegralModel O ρ) :
    ∃ a : ℕ, (IsLocalRing.maximalIdeal O ^ a) • Λ.lattice ≤ Λ'.lattice ∧
      (IsLocalRing.maximalIdeal O ^ a) • Λ'.lattice ≤ Λ.lattice := by
  sorry

-- The zero representation has only the zero lattice.
example [Subsingleton V] (Λ : IntegralModel O ρ) : Λ.lattice = ⊥ := by
  sorry

/-- The additive group of p-adic integers has two non-homothetic stable unipotent lattices. -/
example (ℓ : ℕ) [Fact ℓ.Prime]
    (ρ : ContinuousRep (Multiplicative ℤ_[ℓ]) ℚ_[ℓ] (Fin 2 → ℚ_[ℓ]))
    (hρ : ∀ a, LinearMap.toMatrix' (ρ a) =
      !![1, ((Multiplicative.toAdd a : ℤ_[ℓ]) : ℚ_[ℓ]); 0, 1])
    (Λ₁ Λ₂ : IntegralModel ℤ_[ℓ] ρ)
    (h₁ : Λ₁.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 1})
    (h₂ : Λ₂.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 (ℓ : ℚ_[ℓ])}) :
    ∀ c : ℚ_[ℓ]ˣ, (IntegralModel.smul c Λ₁).lattice ≠ Λ₂.lattice := by
  sorry

/-- For a unit-valued character every uniformizer-power lattice is stable, and these are all models. -/
example (Γ : Type u) [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    (ℓ : ℕ) [Fact ℓ.Prime] (χ : Γ →ₜ* ℤ_[ℓ]ˣ) (ψ : Γ →ₜ* ℚ_[ℓ]ˣ)
    (_hψ : ∀ g, (ψ g : ℚ_[ℓ]) = ((χ g : ℤ_[ℓ]) : ℚ_[ℓ])) :
    (∀ Λ : IntegralModel ℤ_[ℓ] (ContinuousRep.ofCharacter ψ),
      ∃! k : ℤ, Λ.lattice = Submodule.span ℤ_[ℓ] {(ℓ : ℚ_[ℓ]) ^ k}) ∧
    (∀ k : ℤ, ∃ Λ : IntegralModel ℤ_[ℓ] (ContinuousRep.ofCharacter ψ),
      Λ.lattice = Submodule.span ℤ_[ℓ] {(ℓ : ℚ_[ℓ]) ^ k}) := by
  sorry

end GaloisLattice.IntegralModel

/-! ## F.10.1 Finite-field descent and rational-point fixed points -/

namespace VanishingCycles

/-- Arithmetic Frobenius on an algebraic extension of a finite field, acting on coordinates
by the cardinality power. README F.10.1, `frobeniusFixedPoints`. -/
noncomputable def arithmeticFrobenius (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] : L ≃ₐ[k] L :=
  FiniteField.frobeniusAlgEquivOfAlgebraic k L

/-- Geometric Frobenius is the inverse field automorphism. README F.10.1. -/
noncomputable def geometricFrobenius (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] : L ≃ₐ[k] L :=
  (arithmeticFrobenius k L).symm

/-- Every Frobenius power acts by the corresponding cardinality power. README F.10.1. -/
theorem arithmeticFrobenius_pow_apply (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] (r : ℕ) (x : L) :
    (arithmeticFrobenius k L ^ r) x = x ^ (Fintype.card k ^ r) := by
  sorry

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

/-- Arithmetic and geometric Frobenius are inverse in both orders. -/
example (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] (x : L) :
    arithmeticFrobenius k L (geometricFrobenius k L x) = x ∧
      geometricFrobenius k L (arithmeticFrobenius k L x) = x := by
  exact ⟨(arithmeticFrobenius k L).apply_symm_apply x,
    (arithmeticFrobenius k L).symm_apply_apply x⟩

/-- A degree-m finite field extension has m rational points over k_r exactly when m divides r. -/
example (k L k_m : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] [IsAlgClosed L]
    [Field k_m] [Fintype k_m] [Algebra k k_m] (r : ℕ) (hr : 0 < r) :
    let k_r := IntermediateField.fixedField (Subgroup.zpowers (arithmeticFrobenius k L ^ r))
    numberOfRationalPoints k k_r (Spec (CommRingCat.of k_m))
      (Spec.map (CommRingCat.ofHom (algebraMap k k_m))) =
        if Module.finrank k k_m ∣ r then Module.finrank k k_m else 0 := by
  sorry

/-- The affine line has q^r fixed geometric points, using morphisms over Spec k. -/
example (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] [IsAlgClosed L]
    (r : ℕ) (hr : 0 < r) :
    Nat.card {x : Spec (CommRingCat.of L) ⟶ Spec (CommRingCat.of (Polynomial k)) //
      x ≫ Spec.map (CommRingCat.ofHom (Polynomial.C : k →+* Polynomial k)) =
        Spec.map (CommRingCat.ofHom (algebraMap k L)) ∧
      Spec.map (CommRingCat.ofHom (arithmeticFrobenius k L ^ r).toRingHom) ≫ x = x} =
        Fintype.card k ^ r := by
  sorry

/-- Rational-point counts preserve fibre products over the ground field. -/
example (k L : Type u) [Field k] [Field L] [Algebra k L]
    (X Y : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k))
    (b : Y ⟶ Spec (CommRingCat.of k)) :
    numberOfRationalPoints k L (Limits.pullback a b) (Limits.pullback.fst a b ≫ a) =
      numberOfRationalPoints k L X a * numberOfRationalPoints k L Y b := by
  sorry

/-- Fixed geometric points of a fibre product are pairs of fixed geometric points. -/
example (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L]
    (r : ℕ) (X Y : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k))
    (b : Y ⟶ Spec (CommRingCat.of k)) :
    let F := Spec.map (CommRingCat.ofHom (arithmeticFrobenius k L ^ r).toRingHom)
    let c := Spec.map (CommRingCat.ofHom (algebraMap k L))
    Nonempty ({z : Spec (CommRingCat.of L) ⟶ Limits.pullback a b //
      z ≫ (Limits.pullback.fst a b ≫ a) = c ∧ F ≫ z = z} ≃
      ({x : Spec (CommRingCat.of L) ⟶ X // x ≫ a = c ∧ F ≫ x = x} ×
       {y : Spec (CommRingCat.of L) ⟶ Y // y ≫ b = c ∧ F ≫ y = y})) := by
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

/-- Zero endomorphisms have trace zero through every split retract. -/
example {R P : Type*} [CommRing R] [AddCommGroup P] [Module R P]
    {ι : Type*} [Fintype ι] (i : P →ₗ[R] (ι → R)) (r : (ι → R) →ₗ[R] P)
    (hi : r ∘ₗ i = LinearMap.id) :
    projectiveTraceOfRetract i r hi 0 = 0 := by
  simp [projectiveTraceOfRetract]

/-- Zero inclusion with identity retraction cannot supply splitting data on the integers. -/
example : ¬ (LinearMap.id : ℤ →ₗ[ℤ] ℤ) ∘ₗ (0 : ℤ →ₗ[ℤ] ℤ) = LinearMap.id := by
  intro h
  have hz := LinearMap.congr_fun h (1 : ℤ)
  norm_num at hz

/-- The standard rank-n free retract has identity trace n, including rank zero. -/
example {R : Type*} [CommRing R] (n : ℕ) :
    projectiveTraceOfRetract (LinearMap.id : (Fin n → R) →ₗ[R] (Fin n → R))
      LinearMap.id (by simp) LinearMap.id = (n : R) := by
  sorry

/-- A diagonal rank-two endomorphism has the sum of its diagonal entries as trace. -/
example {R : Type*} [CommRing R] (a b : R) :
    projectiveTraceOfRetract (LinearMap.id : (Fin 2 → R) →ₗ[R] (Fin 2 → R))
      LinearMap.id (by simp) (LinearMap.mulLeft (R := R) ![a, b]) = a + b := by
  sorry

/-- Adjoining a zero third coordinate to the split retract preserves diagonal trace. -/
example {R : Type*} [CommRing R] (a b : R) :
    let i : (Fin 2 → R) →ₗ[R] (Fin 3 → R) :=
      LinearMap.pi ![LinearMap.proj 0, LinearMap.proj 1, 0]
    let r : (Fin 3 → R) →ₗ[R] (Fin 2 → R) :=
      LinearMap.pi ![LinearMap.proj 0, LinearMap.proj 1]
    ∃ hi : r ∘ₗ i = LinearMap.id,
      projectiveTraceOfRetract i r hi (LinearMap.mulLeft (R := R) ![a, b]) = a + b := by
  sorry

end PerfectComplex

/-!
The remaining signatures are specified in the README, using the following intended names.
They require the shared sheaf and enhancement carriers; this list declares no placeholder objects.

The README's Exact supplier contracts table specifies the prerequisites. In particular,
F.10.3 consumes the projective trace of AdicSpacesPartIII R3.8, the enhancement of
EnhancedDerivedSheaves §§0.1–0.4, module-derived tensor and perfectness from
DerivedModuleAlgebra §§0.2/1.E.0, and the DGAInfinity and PadicMeasuresIwasawaAlgebras
interfaces listed below. PerfectoidSpaces P7 supplies the site-continuity and finite-cover
detection hypotheses for §0.5's conditional analytic instantiation.

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
The based finite-cover construction applies to every connected nonempty scheme.
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
tameCharacter_puiseux,
tameCharacter_restrict_quadratic, tameCharacter_wild.

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
