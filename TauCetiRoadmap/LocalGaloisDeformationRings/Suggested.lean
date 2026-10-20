import Mathlib
import TauCeti.Topology.Algebra.Group.Generation
import TauCeti.Algebra.Lie.GeneralLinear.Basic

/-!
# LocalGaloisDeformationRings: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. It keeps fixed-basis matrix
conditions, ordered characters, Frobenius data, coefficient equations and actual quotient
rings explicit. The universal rings, period, flag-moduli and patching constructions
are specified in the README, where their full supplier contracts are available.

README F.0.1–F.0.2 specialize DeformationAndDerivedPatchingAlgebra §1.12's joint
completion and §§2.1–2.5's chosen presentations and relation spaces to the labelled
coefficient category. F.2.3–F.2.4 use §§2.6–2.7's continuous framed representing pair;
under Φ_p, the Schlessinger comparison preserves the actual universal lift and all
its reductions. README 0.1 uses §3.9's canonical-module/type interface, retaining the
graded Ext/completion comparison here. F.0.1 separates whole-ring dimensions of flat
completed products from component dimensions, which require equidimensional total factors.
Identification by tuples retains geometric integrality of the factor domain quotients.
The pointed tensor comparison uses §4.6 with flat domain factors, coefficient-ring points
and regular generic fibres over a finite extension of Q_p. Arithmetic tangent and
obstruction assignments and local conditions retain the hypotheses in the README.

README 1.7 owns the common ordinary flag predicate and elementary API. Its definitions
precede 0.3 and use geometric reciprocity, direct-summand full flags and the ordered
characters on open units; the exact-inertia condition uses all units. PadicHodgeTheory
uses the field-valued specialization as `RegularOrdinary`. The period comparisons of 0.3
and 1.7 consume these predicates. In the potentially Barsotti–Tate branch,
`RankTwoOrdinaryEndpoints` retains the unramified base field K, stable lattice T,
identified reduction, chosen residual unramified quotient and prescribed determinant.
For finite unramified F₀/K and L=F₀(μ_p), crystallinity over L, trivial residual diagonal
characters on G_L and det(T)|I_L=ε allow the supplied connected–étale adapter. The
unramified quotient over K additionally uses identification of the descended étale
quotient's reduction with the chosen residual quotient. Prime-to-p tame inertia and
injectivity of reduction then give trivial inertia; residual ordinarity alone gives
only the weaker potential conclusion in this branch.

README 1.6 owns `FLDeformation.coefficientRealization` and its common labelled coefficient
category, with the scalar Frobenius permutation. Free-lattice realization uses the linear
dual, finite torsion uses the Pontryagin dual, and coefficient extension, reduction,
kernels and lattice quotients preserve the actions. AutomorphicGaloisRepresentations
uses these specializations as `coefficientFontaineLaffaille`. Multiplicity one is a
hypothesis of deformation liftability, rather than of the common realization.

README 2.26.1 provides the canonical characteristic-zero Jacquet–Langlands equivalence from
irreducible admissible smooth division-algebra classes to essentially square-integrable general
linear classes over the algebraic closure of the coefficient field. It specifies coefficient
transport, both inverse identities, the elliptic sign, central characters and twists. Its inverse
extends by zero on the other irreducible classes in the finite-length Grothendieck group.
The degree-two specialization supplies GL2AutomorphicRepresentationsAndTransfer R17.1.1.
README 2.27 defines cycle multiplicities using absolutely irreducible admissible generic
representations over the algebraic closure, with prescribed WD inertia and monodromy. It provides
existence and independence of compact restriction, finite support and descent of each finite
collection to finite splitting coefficients. The type-detection identities in 2.26.1–2.26.2 use
these generic representatives; the inverse-zero convention applies to those outside the
essentially square-integrable subset.
For p>2 and arbitrary rank d at residue characteristic ℓ≠p,
`AwayFromP.arithmeticCycleFunctor` provides the restricted CM globalization and
finite-level arithmetic systems, including their ordinary automorphy and local–global
compatibility input. Its exact covariant H∞ on finitely generated O-modules with smooth
GL_d(O_K)^m-action commutes with reduction and preserves O-torsion-free objects.
Over R∞=(R□)^{⊗̂m}⊗̂A its generic cycle is c times the product of the local cycle maps,
with c=d! and A geometrically integral and flat. Abstract module patching and cycle
specialization use DeformationAndDerivedPatchingAlgebra Layer 5 and §6.7.
`AwayFromP.glCycleReductionDescent` gives ker(r_p^{GL})⊆ker(red∘cyc), hence the
unique additive cyc̄_GL on the mod-p Grothendieck group with values in dimension-d²
special cycles. Tensor powers detect nonzero cycles even when p divides c, as for
d=p=3 and c=6. Composing with JL_p gives cyc̄_D and its reduction identity.
-/

namespace TauCetiRoadmap.LocalGaloisDeformationRings

open scoped Matrix

section GenericFoundations

open Matrix

/-! ## Layer F.1: Generic deformation functors

Lifts use an unbundled commutative topological ring and residue map; statements that require
coefficient objects explicitly impose locality and the maximal-ideal kernel. Continuity is
continuity of matrix entries, strict equivalence is the reduction-kernel orbit relation, and
fixed determinant is a pointwise equation. The simultaneous framed quotient carries the
specified frames; local conditions are imposed through the README's condition interface.
-/

section Lifts

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {k : Type*} [Field k]
variable (n : ℕ) (ρbar : G →* GL (Fin n) k)
variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k)

/-- `Γ̂ₙ(A)`: invertible matrices reducing to the identity under `π`. -/
def strictKernel : Subgroup (GL (Fin n) A) :=
  (Matrix.GeneralLinearGroup.map (n := Fin n) π).ker

/-- A lift of `ρ̄` to `(A, π)`: a homomorphism `G → GLₙ(A)` with continuous matrix entries whose
reduction is `ρ̄` (README F.1.1). -/
@[ext]
structure Lift where
  /-- The underlying homomorphism. -/
  toHom : G →* GL (Fin n) A
  /-- Continuity of the matrix entries. -/
  continuous : Continuous fun g ↦ (toHom g : Matrix (Fin n) (Fin n) A)
  /-- The reduction is `ρ̄`. -/
  reduce : (Matrix.GeneralLinearGroup.map π).comp toHom = ρbar

/-- Strict conjugation of a lift by an element of `Γ̂ₙ(A)`. -/
def Lift.conj (a : strictKernel n π) (ρ : Lift n ρbar π) : Lift n ρbar π where
  toHom := (MulAut.conj (a : GL (Fin n) A)).toMonoidHom.comp ρ.toHom
  continuous := by
    have h : (fun g ↦ (((MulAut.conj (a : GL (Fin n) A)).toMonoidHom.comp ρ.toHom g :
        GL (Fin n) A) : Matrix (Fin n) (Fin n) A)) = fun g ↦
        ((a : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) * (ρ.toHom g : Matrix (Fin n) (Fin n) A) *
          (((a : GL (Fin n) A)⁻¹ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) := by
      funext g
      simp [MulAut.conj_apply]
    rw [h]
    exact (continuous_const.matrix_mul ρ.continuous).matrix_mul continuous_const
  reduce := by
    have ha : Matrix.GeneralLinearGroup.map π (a : GL (Fin n) A) = 1 := a.2
    refine Eq.trans ?_ ρ.reduce
    ext g : 1
    simp [MulAut.conj_apply, ha]

/-- Strict conjugation acts by the stated matrix conjugation. -/
theorem Lift.conj_apply (a : strictKernel n π) (ρ : Lift n ρbar π) (g : G) :
    (ρ.conj n ρbar π a).toHom g = (a : GL (Fin n) A) * ρ.toHom g * (a : GL (Fin n) A)⁻¹ := by
  simp [Lift.conj, MulAut.conj_apply]

/-- `Γ̂ₙ(A)` acts on lifts by conjugation. -/
instance : MulAction (strictKernel n π) (Lift n ρbar π) where
  smul := Lift.conj n ρbar π
  one_smul ρ := Lift.ext <| MonoidHom.ext fun g ↦ by
    show (ρ.conj n ρbar π 1).toHom g = ρ.toHom g
    simp [Lift.conj_apply]
  mul_smul a b ρ := Lift.ext <| MonoidHom.ext fun g ↦ by
    show (ρ.conj n ρbar π (a * b)).toHom g = ((ρ.conj n ρbar π b).conj n ρbar π a).toHom g
    simp only [Lift.conj_apply, Subgroup.coe_mul]
    group

/-- Deformations: lifts modulo strict conjugation (README F.1.3). -/
def Def : Type _ := MulAction.orbitRel.Quotient (strictKernel n π) (Lift n ρbar π)

/-- The strict class of a lift. -/
def Def.mk (ρ : Lift n ρbar π) : Def n ρbar π := Quotient.mk (MulAction.orbitRel _ _) ρ

/-- Two lifts have the same class iff they are conjugate by an element of `Γ̂ₙ(A)`. -/
theorem Def.mk_eq_mk_iff (ρ ρ' : Lift n ρbar π) :
    Def.mk n ρbar π ρ = Def.mk n ρbar π ρ' ↔
      ∃ a ∈ strictKernel n π, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := by
  sorry

/-- `def_rank_one_eq_lift`: scalar conjugation removes no rank-one lifts (README F.1.3). -/
theorem def_rank_one_eq_lift (ρbar : G →* GL (Fin 1) k) :
    ∃ e : Def 1 ρbar π ≃ Lift 1 ρbar π, ∀ ρ, e (Def.mk 1 ρbar π ρ) = ρ := by
  sorry

/-- Lifts with determinant `χ` (README F.1.7). -/
def LiftDet (χ : G →* Aˣ) : Set (Lift n ρbar π) :=
  {ρ | ∀ g, Matrix.GeneralLinearGroup.det (ρ.toHom g) = χ g}

omit [IsTopologicalRing A] in
/-- Membership in the fixed-determinant subfunctor is the pointwise determinant equation. -/
theorem mem_LiftDet_iff (χ : G →* Aˣ) (ρ : Lift n ρbar π) :
    ρ ∈ LiftDet n ρbar π χ ↔ ∀ g, Matrix.GeneralLinearGroup.det (ρ.toHom g) = χ g :=
  Iff.rfl

/-- Strict conjugation preserves the determinant. -/
theorem LiftDet.conj (χ : G →* Aˣ) (a : strictKernel n π) {ρ : Lift n ρbar π}
    (hρ : ρ ∈ LiftDet n ρbar π χ) : ρ.conj n ρbar π a ∈ LiftDet n ρbar π χ := by
  intro g
  rw [Lift.conj_apply, map_mul, map_mul, map_inv, hρ g, mul_inv_cancel_comm]

/-- Fixed-determinant lifts as a sub-action of the strict action. -/
def liftDetSubMulAction (χ : G →* Aˣ) : SubMulAction (strictKernel n π) (Lift n ρbar π) where
  carrier := LiftDet n ρbar π χ
  smul_mem' a _ hρ := LiftDet.conj n ρbar π χ a hρ

/-- Fixed-determinant deformations: the orbit quotient of the fixed-determinant lifts. -/
def DefDet (χ : G →* Aˣ) : Type _ :=
  MulAction.orbitRel.Quotient (strictKernel n π) (liftDetSubMulAction n ρbar π χ)

/-- `ρ̄` is Schur: its `k[G]`-endomorphisms are scalars (README F.1.5). -/
def IsSchur : Prop :=
  ∀ M : Matrix (Fin n) (Fin n) k, (∀ g, M * (ρbar g : Matrix (Fin n) (Fin n) k) =
    (ρbar g : Matrix (Fin n) (Fin n) k) * M) → ∃ c : k, M = c • (1 : Matrix (Fin n) (Fin n) k)

/-- Scalar extension preserves and reflects the Schur centralizer condition (README F.1.8). -/
theorem isSchur_baseChange (n : ℕ) (ρbar : G →* GL (Fin n) k) {k' : Type*} [Field k'] (f : k →+* k') :
    IsSchur n ρbar ↔ IsSchur n ((Matrix.GeneralLinearGroup.map f).comp ρbar) := by
  sorry

/-- For Schur `ρ̄`, lifts conjugate by `GLₙ(A)` are strictly conjugate, over a local ring whose
residue map `π` is surjective with kernel the maximal ideal (README F.1.5). -/
theorem strict_of_full [IsLocalRing A] (hres : RingHom.ker π = IsLocalRing.maximalIdeal A)
    (hπ : Function.Surjective π) (hS : IsSchur n ρbar) (ρ ρ' : Lift n ρbar π)
    (a : GL (Fin n) A) (h : ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹) :
    ∃ b ∈ strictKernel n π, ∀ g, ρ'.toHom g = b * ρ.toHom g * b⁻¹ := by
  sorry

end Lifts

section CoefficientMaps

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {k : Type*} [Field k]
variable (n : ℕ) (ρbar : G →* GL (Fin n) k)
variable {A B C : Type*} [CommRing A] [CommRing B] [CommRing C]
  [TopologicalSpace A] [TopologicalSpace B] [TopologicalSpace C]
  [IsTopologicalRing A] [IsTopologicalRing B] [IsTopologicalRing C]
  (πA : A →+* k) (πB : B →+* k) (πC : C →+* k)

/-- Pushforward of a lift along a continuous coefficient map respecting the residue maps. -/
def Lift.map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA) (ρ : Lift n ρbar πA) :
    Lift n ρbar πB where
  toHom := (Matrix.GeneralLinearGroup.map f).comp ρ.toHom
  continuous := ρ.continuous.matrix_map hf
  reduce := by
    subst hπ
    exact ρ.reduce

omit [IsTopologicalRing A] [IsTopologicalRing B] in
/-- Coefficient pushforward applies the ring map to every matrix entry. -/
theorem Lift.map_apply (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) (g : G) :
    (ρ.map n ρbar πA πB f hf hπ).toHom g = Matrix.GeneralLinearGroup.map f (ρ.toHom g) :=
  rfl

omit [IsTopologicalRing A] in
/-- Pushforward along the identity coefficient map fixes a lift. -/
theorem Lift.map_id (ρ : Lift n ρbar πA) :
    ρ.map n ρbar πA πA (RingHom.id A) continuous_id (RingHom.comp_id πA) = ρ :=
  Lift.ext <| by simp [Lift.map, Matrix.GeneralLinearGroup.map_id]

omit [IsTopologicalRing A] [IsTopologicalRing B] [IsTopologicalRing C] in
/-- Successive coefficient pushforwards agree with pushforward along the composite. -/
theorem Lift.map_comp (f : A →+* B) (hf : Continuous f) (hπf : πB.comp f = πA)
    (g : B →+* C) (hg : Continuous g) (hπg : πC.comp g = πB) (ρ : Lift n ρbar πA) :
    (ρ.map n ρbar πA πB f hf hπf).map n ρbar πB πC g hg hπg =
      ρ.map n ρbar πA πC (g.comp f) (hg.comp hf)
        (by rw [← RingHom.comp_assoc, hπg, hπf]) :=
  rfl

omit [IsTopologicalRing A] [IsTopologicalRing B] in
/-- Reduction of a coefficient pushforward is reduction along the composite residue map
(README F.1.1). -/
@[simp]
theorem Lift.reduce_map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) :
    (Matrix.GeneralLinearGroup.map πB).comp (ρ.map n ρbar πA πB f hf hπ).toHom =
      (Matrix.GeneralLinearGroup.map (πB.comp f)).comp ρ.toHom :=
  rfl

omit [IsTopologicalRing A] [IsTopologicalRing B] in
/-- Characteristic polynomials of lifts commute with coefficient pushforward
(README F.1.1). -/
@[simp]
theorem Lift.charpoly_map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) (g : G) :
    Matrix.charpoly ((ρ.map n ρbar πA πB f hf hπ).toHom g : Matrix (Fin n) (Fin n) B) =
      (Matrix.charpoly (ρ.toHom g : Matrix (Fin n) (Fin n) A)).map f := by
  exact Matrix.charpoly_map (ρ.toHom g : Matrix (Fin n) (Fin n) A) f

omit [IsTopologicalRing A] [IsTopologicalRing B] in
/-- Traces of lifts commute with coefficient pushforward (README F.1.1). -/
@[simp]
theorem Lift.trace_map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) (g : G) :
    Matrix.trace ((ρ.map n ρbar πA πB f hf hπ).toHom g : Matrix (Fin n) (Fin n) B) =
      f (Matrix.trace (ρ.toHom g : Matrix (Fin n) (Fin n) A)) := by
  exact (AddMonoidHom.map_trace f (ρ.toHom g : Matrix (Fin n) (Fin n) A)).symm

omit [IsTopologicalRing A] [IsTopologicalRing B] in
/-- Determinants of lifts commute with coefficient pushforward (README F.1.1). -/
@[simp]
theorem Lift.det_map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) (g : G) :
    Matrix.GeneralLinearGroup.det ((ρ.map n ρbar πA πB f hf hπ).toHom g) =
      Units.map f (Matrix.GeneralLinearGroup.det (ρ.toHom g)) := by
  exact Matrix.GeneralLinearGroup.map_det f (ρ.toHom g)

/-- Pushforward descends to strict classes. -/
def Def.map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA) :
    Def n ρbar πA → Def n ρbar πB :=
  Quotient.map' (Lift.map n ρbar πA πB f hf hπ) fun ρ ρ' h ↦ by
    obtain ⟨a, rfl⟩ := h
    refine ⟨⟨Matrix.GeneralLinearGroup.map f (a : GL (Fin n) A), ?_⟩, ?_⟩
    · change Matrix.GeneralLinearGroup.map πB (Matrix.GeneralLinearGroup.map f _) = 1
      rw [← MonoidHom.comp_apply, ← Matrix.GeneralLinearGroup.map_comp, hπ]
      exact a.2
    · refine Lift.ext <| MonoidHom.ext fun g ↦ ?_
      show ((ρ'.map n ρbar πA πB f hf hπ).conj n ρbar πB _).toHom g =
        ((ρ'.conj n ρbar πA a).map n ρbar πA πB f hf hπ).toHom g
      rw [Lift.conj_apply, Lift.map_apply, Lift.map_apply, Lift.conj_apply]
      simp [map_mul, map_inv]

/-- Pushforward of a strict class is the class of the pushed-forward lift. -/
theorem Def.map_mk (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) :
    Def.map n ρbar πA πB f hf hπ (Def.mk n ρbar πA ρ) =
      Def.mk n ρbar πB (ρ.map n ρbar πA πB f hf hπ) :=
  rfl

end CoefficientMaps

section Restriction

variable {G H : Type*} [Group G] [TopologicalSpace G] [Group H] [TopologicalSpace H]
variable {k : Type*} [Field k]
variable (n : ℕ) (ρbar : G →* GL (Fin n) k)
variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k)

/-- Restriction of a lift along a continuous homomorphism `ι : H → G` (README F.1.6). -/
def Lift.restrict (ι : H →* G) (hι : Continuous ι) (ρ : Lift n ρbar π) :
    Lift n (ρbar.comp ι) π where
  toHom := ρ.toHom.comp ι
  continuous := ρ.continuous.comp hι
  reduce := by rw [← MonoidHom.comp_assoc, ρ.reduce]

omit [IsTopologicalRing A] in
/-- Restriction evaluates a lift on the image of the group element. -/
theorem Lift.restrict_apply (ι : H →* G) (hι : Continuous ι) (ρ : Lift n ρbar π) (h : H) :
    (ρ.restrict n ρbar π ι hι).toHom h = ρ.toHom (ι h) :=
  rfl

omit [TopologicalSpace G] [TopologicalSpace H] [TopologicalSpace A] [IsTopologicalRing A] in
/-- The framed restriction `α⁻¹ (ρ ∘ ι) α` is invariant under `(ρ, α) ↦ (βρβ⁻¹, βα)`. -/
theorem framed_restrict_invariant (ι : H →* G) (ρ : G →* GL (Fin n) A)
    (α β : GL (Fin n) A) (h : H) :
    (β * α)⁻¹ * (β * ρ (ι h) * β⁻¹) * (β * α) = α⁻¹ * ρ (ι h) * α := by
  group

end Restriction

section Framed

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {k : Type*} [Field k]
variable (n : ℕ) (ρbar : G →* GL (Fin n) k)
variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k)
variable (T : Type*)

/-- A `T`-framed lift: a lift with frames `α_v ∈ Γ̂ₙ(A)` for `v ∈ T` (README F.2.6). Local problems,
ramification and determinant are imposed on top of this. -/
structure TFramedLift where
  /-- The lift. -/
  lift : Lift n ρbar π
  /-- The frames. -/
  frame : T → strictKernel n π

/-- The simultaneous action `(ρ, α) ↦ (βρβ⁻¹, βα)`. -/
instance : MulAction (strictKernel n π) (TFramedLift n ρbar π T) where
  smul b x := ⟨b • x.lift, fun v ↦ b * x.frame v⟩
  one_smul x := by
    obtain ⟨ρ, α⟩ := x
    show (⟨(1 : strictKernel n π) • ρ, fun v ↦ 1 * α v⟩ : TFramedLift n ρbar π T) = ⟨ρ, α⟩
    simp only [one_smul, one_mul]
  mul_smul a b x := by
    obtain ⟨ρ, α⟩ := x
    show (⟨(a * b) • ρ, fun v ↦ a * b * α v⟩ : TFramedLift n ρbar π T) =
      ⟨a • b • ρ, fun v ↦ a * (b * α v)⟩
    simp only [mul_smul, mul_assoc]

/-- The framed local lift `α_v⁻¹ ρ α_v`. -/
def TFramedLift.localLift (x : TFramedLift n ρbar π T) (v : T) (g : G) : GL (Fin n) A :=
  (x.frame v : GL (Fin n) A)⁻¹ * x.lift.toHom g * x.frame v

/-- The framed local lift is constant on classes. -/
theorem TFramedLift.localLift_smul (x : TFramedLift n ρbar π T) (b : strictKernel n π) (v : T)
    (g : G) : (b • x).localLift n ρbar π T v g = x.localLift n ρbar π T v g := by
  show ((b * x.frame v : strictKernel n π) : GL (Fin n) A)⁻¹ *
      (x.lift.conj n ρbar π b).toHom g * ((b * x.frame v : strictKernel n π) : GL (Fin n) A) =
    (x.frame v : GL (Fin n) A)⁻¹ * x.lift.toHom g * x.frame v
  rw [Lift.conj_apply, Subgroup.coe_mul]
  group

/-- Unrestricted simultaneous `T`-framed classes (README 2.6); type conditions are imposed
on this quotient. -/
def UnrestrictedTFramedDef : Type _ :=
  MulAction.orbitRel.Quotient (strictKernel n π) (TFramedLift n ρbar π T)

end Framed

/-! ## Layer F.2: Representability and universal lifts -/

section PhiP

/-- Mazur's condition `Φ_p`: every open subgroup has finitely many homomorphisms with open kernel
to `ℤ/p` (README F.2.1). -/
def PhiP (p : ℕ) (G : Type*) [Group G] [TopologicalSpace G] : Prop :=
  ∀ Δ : Subgroup G, IsOpen (Δ : Set G) →
    Finite {f : Δ →* Multiplicative (ZMod p) // IsOpen (f.ker : Set Δ)}

variable {p : ℕ} {G : Type*} [Group G] [TopologicalSpace G]

/-- `Φ_p` passes to open subgroups. -/
theorem PhiP.«open» (h : PhiP p G) (Δ : Subgroup G) (hΔ : IsOpen (Δ : Set G)) : PhiP p Δ := by
  sorry

/-- Topologically finitely generated profinite groups satisfy `Φ_p`. -/
theorem phiP_of_fg [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G) : PhiP p G := by
  sorry

/-- Every finite topological group satisfies `Φ_p`. -/
example [NeZero p] [IsTopologicalGroup G] [Finite G] : PhiP p G := by
  intro Δ _
  have : Finite (Multiplicative (ZMod p)) := inferInstanceAs (Finite (ZMod p))
  exact (TauCeti.isTopologicallyFinitelyGenerated_of_fg (G := Δ)).finite_monoidHom_isOpen_ker _

end PhiP

section NthRoot

/-- A unit of residue one over an Artinian local ring of residue characteristic `p` has a unique
residue-one `n`-th root when `p ∤ n` (README F.2.9). Existence follows from
`TauCeti.HenselianLocalRing.exists_pow_eq_of_residue_pow_eq` at `x₀ = 1`, using
`TauCeti.IsAdicComplete.henselianLocalRing`. This statement adds uniqueness and derives
`IsUnit (n : A)` from `p ∤ n`. -/
theorem exists_unique_nthRoot_of_residue_eq_one {A : Type*} [CommRing A] [IsLocalRing A]
    [IsArtinianRing A] (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField A) p] {n : ℕ}
    (hn : ¬ p ∣ n) (u : Aˣ) (hu : IsLocalRing.residue A (u : A) = 1) :
    ∃! v : Aˣ, IsLocalRing.residue A (v : A) = 1 ∧ v ^ n = u := by
  sorry

end NthRoot

/-! ## Layer F.3: Local deformation problems -/

/-- Full-adjoint coboundaries take values in the supplied trace-zero ideal, even when the rank
is divisible by the residue characteristic (README F.3.2). Strict-conjugacy stability then places
these cocycles in the pulled-back local tangent condition. -/
theorem adjoint_coboundary_mem_slIdeal {k : Type*} [Field k] {n : ℕ}
    (a : GL (Fin n) k) (X : Matrix (Fin n) (Fin n) k) :
    (a : Matrix (Fin n) (Fin n) k) * X * (a⁻¹ : GL (Fin n) k) - X ∈
      TauCeti.slIdeal k (Fin n) := by
  rw [TauCeti.mem_slIdeal_iff, Matrix.trace_sub, Matrix.trace_units_conj, sub_self]

section FoundationExamples

variable {G : Type*} [Group G] [TopologicalSpace G] {k : Type*} [Field k]

/-- `restrict_not_injective`: distinct lifts restrict to the same lift on the trivial subgroup
(README F.1.6). -/
example (n : ℕ) (ρbar : G →* GL (Fin n) k) {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k)
    (ρ ρ' : Lift n ρbar π) (h : ρ ≠ ρ') :
    ρ ≠ ρ' ∧
      ρ.restrict n ρbar π (1 : PUnit →* G) continuous_const =
        ρ'.restrict n ρbar π (1 : PUnit →* G) continuous_const := by
  constructor
  · exact h
  · apply Lift.ext
    apply MonoidHom.ext
    intro g
    simp [Lift.restrict]

/-- A lift to the residue field itself is `ρ̄` (README F.1.1, `lift_residue`). -/
example [TopologicalSpace k] [IsTopologicalRing k] (n : ℕ) (ρbar : G →* GL (Fin n) k)
    (ρ : Lift n ρbar (RingHom.id k)) : ρ.toHom = ρbar := by
  simpa [Matrix.GeneralLinearGroup.map_id] using ρ.reduce

/-- Every rank-one residual representation is Schur. -/
example (ρbar : G →* GL (Fin 1) k) : IsSchur 1 ρbar := by
  intro M _
  refine ⟨M 0 0, ?_⟩
  ext i j
  fin_cases i
  fin_cases j
  simp

/-- `1 ⊕ 1` is not Schur: `diag(1, 0)` commutes with it (README F.1.5, `isSchur_absIrred`). -/
example : ¬ IsSchur 2 (1 : G →* GL (Fin 2) k) := by
  intro h
  obtain ⟨c, hc⟩ := h (Matrix.diagonal ![1, 0]) (fun g ↦ by simp)
  have h0 := congrFun (congrFun hc 0) 0
  have h1 := congrFun (congrFun hc 1) 1
  simp at h0 h1
  exact one_ne_zero (h0.trans h1.symm)

end FoundationExamples

end GenericFoundations

/-! ## Layer 1: Universal lifting rings and coefficient infrastructure -/

section Height

variable {A : Type*} [CommRing A] {n : ℕ}

/-- The fixed free lattice's Frobenius cokernel is killed by `E ^ h`.
This matrix condition is not the functor of lattices in a fixed étale module. -/
def HasHeightLE (E : A) (X : Matrix (Fin n) (Fin n) A) (h : ℕ) : Prop :=
  ∃ Y : Matrix (Fin n) (Fin n) A, X * Y = E ^ h • (1 : Matrix (Fin n) (Fin n) A)

/-- Height zero is precisely invertibility of the square Frobenius matrix. -/
theorem height_zero_iff_isUnit (E : A) (X : Matrix (Fin n) (Fin n) A) :
    HasHeightLE E X 0 ↔ IsUnit X := by
  sorry

end Height

section RealPlace

variable {A : Type*} [CommRing A]

/-- An odd real rank-two involution in coordinates has equation `a²+bc=1`. -/
def OddInvolutionEquation (a b c : A) : Prop := a ^ 2 + b * c = 1

/-- Both involution and determinant equations, rather than their dimension count. -/
theorem odd_involution_matrix_iff (a b c : A) :
    OddInvolutionEquation a b c ↔
      (!![a, b; c, -a] : Matrix (Fin 2) (Fin 2) A) ^ 2 = 1 ∧
        Matrix.det (!![a, b; c, -a] : Matrix (Fin 2) (Fin 2) A) = -1 := by
  sorry

end RealPlace

/-! ## Layer 2: Tame and minimally ramified deformation conditions

README 2.19 retains p ≥ 3, ramification, conductor minimality among twists and the compatible
fixed determinant. Its integral ring is a complete intersection and its scheme generic fibre
is regular. At each closed characteristic-zero point with residue field E_x finite over E,
the completed local ring pro-represents a formally smooth framed fixed-determinant deformation
problem on finite local Artinian E_x-algebras with residue E_x. The completion carries
the maximal-ideal topology. For 𝒪[[X]], localization at p has uniformly bounded coefficient
denominators; completion of its local ring at X = 0 gives E[[X]].
-/

section Tame

variable {A : Type*} [CommRing A] {n : ℕ}

/-- The invertible fixed-basis matrix equation for arithmetic Frobenius and inertia.
Continuity and pro-p inertia are additional conditions for the profinite representation. -/
def IsTameMatrixPair (q : ℕ) (Φ σ : Matrix (Fin n) (Fin n) A) : Prop :=
  IsUnit Φ ∧ IsUnit σ ∧ Φ * σ = σ ^ q * Φ

/-- The tame relation makes the inertia characteristic polynomial invariant under the
arithmetic Frobenius power, a necessary condition for the types of README 2.15 and 2.22. -/
theorem IsTameMatrixPair.charpoly_pow (q : ℕ) (Φ σ : Matrix (Fin n) (Fin n) A)
    (h : IsTameMatrixPair q Φ σ) : σ.charpoly = (σ ^ q).charpoly := by
  sorry

/-- Rank-two Steinberg Frobenius has the eigenvalue relation with arithmetic ratio `q`. -/
def SteinbergFrobRelation (q : ℕ) (Φ : Matrix (Fin 2) (Fin 2) A) : Prop :=
  (q : A) * Matrix.trace Φ ^ 2 = (1 + (q : A)) ^ 2 * Matrix.det Φ

end Tame

section ModifiedNilpotent

variable {A : Type*} [CommRing A] [Invertible (2 : A)]

/-- The integral modified exponential in the rank-four symplectic local model. -/
def modifiedExp (N : Matrix (Fin 4) (Fin 4) A) : Matrix (Fin 4) (Fin 4) A :=
  1 + N + ⅟ (2 : A) • N ^ 2 + ⅟ (2 : A) • N ^ 3

/-- Its modified logarithm on `1+W`, retaining the cubic correction through composition. -/
def modifiedLog (U : Matrix (Fin 4) (Fin 4) A) : Matrix (Fin 4) (Fin 4) A :=
  (U - 1) - ⅟ (2 : A) • (U - 1) ^ 2

/-- The inverse formulas require fourth-power nilpotence, not nilpotence of unspecified order. -/
theorem modified_exp_log_inverse (N W : Matrix (Fin 4) (Fin 4) A)
    (hN : N ^ 4 = 0) (hW : W ^ 4 = 0) :
    modifiedLog (modifiedExp N) = N ∧ modifiedExp (modifiedLog (1 + W)) = 1 + W := by
  sorry

/-- `q*` is formed over the integers before reducing in a coefficient ring. -/
def modifiedPowerCoefficient (q : ℕ) : ℤ := ((q : ℤ) - (q : ℤ) ^ 3) / 3

/-- Modified powering retains the cubic term, including in characteristic three. -/
theorem modified_exp_pow (q : ℕ) (N : Matrix (Fin 4) (Fin 4) A) (hN : N ^ 4 = 0) :
    modifiedExp N ^ q = modifiedExp
      ((q : A) • N + (modifiedPowerCoefficient q : A) • N ^ 3) := by
  sorry

end ModifiedNilpotent

/-! ## Layer 3: Potentially semistable and crystalline quotient rings

The family quotients of README 3.5 carry a continuous finite-free representation,
a fixed Hodge interval or labelled Hodge type, and, for the potential variants,
a finite inertia type extending to the Weil group and a finite Galois extension
killing that type. Their point criteria include nilpotent finite local coefficients;
the potentially crystalline quotient imposes `N=0` on the bounded period module.
README 3.8 retains weights `{0,1}` and the inertia and extension data before fixing
the full Weil–Deligne parameter. README 3.11 retains the induced types and extension
in its general-linear family input and the tensor-compatible period comparison.

The G-valued integral type quotient is reduced and flat. Complete intersection,
equidimensionality and a dense regular open are properties of its localized scheme
generic fibre. Crystalline scheme generic fibres are regular; formal smoothness refers
to completed local deformation rings with the maximal-ideal topology.

README 3.7.1 uses finite length over O[GL₂(Q_p)] for block objects and the larger locally
admissible category for injective envelopes. README 3.7.2's `MontrealFunctor` has finite-length
smooth torsion inputs and Galois output of finite length over O. The compact extension uses
inverse limits and Pontryagin duality, with profinite output; residually finite-length
Banach inputs give finite-dimensional output after localization. The infinite sum of
I(1,ω²) at p=5 has split finite subsums of unbounded length, so an additive extension to
locally finite-length inputs cannot retain finite-length Galois output.
-/

section FiltrationProfile

/-- Multiplicities of jumps in a labelled filtration. This list does not specify a Hodge type:
it forgets the jump values and labels. -/
def filtrationFlagDimension (multiplicities : List ℕ) : ℕ :=
  (multiplicities.sum ^ 2 - (multiplicities.map (fun m ↦ m ^ 2)).sum) / 2

end FiltrationProfile

/-! ## Layer 4: Finite-flat and Barsotti–Tate geometry

README 4.1 uses FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.7's
`flatDeformationTangentSpace` for model closure and coefficient-linear self-Ext.
The finite-flat predicate on every Artinian quotient, its Schlessinger adapter and
representing quotients are constructed here from F.1.1–F.1.4, F.2.5 and F.3.1–F.3.2.
Closure and representing quotients apply at every prime and ramification index;
unframed representability requires scalar residual endomorphisms. Over Q_p, p>2,
the strict-class tangent is the supplied killed-by-p coefficient-linear self-Ext;
`flatTangent_finrank_le` gives dimension h⁰+a(n−a), where a=dim Fil¹ M.
The framed tangent is its inverse image in Z¹. For k(1)⊕k the strict-class
dimension is 3, and for k(1)²⊕k² the excess over h⁰ is 4.
For rank-two finite-flat Schur V over Q_p, p>2 and coefficient ring W(k),
`flatDeformationRing` is W(k)[[T₁,T₂]] for every finite k. If V is also irreducible
with det(V)|I equal to the residual cyclotomic character, the unrestricted ring
is W(k)[[T₁,…,T₅]] and its quotient onto the flat ring has a three-generated kernel.
These are unfixed-determinant presentations. Their universal-ring and filtered-module
carriers are README targets, as are the Schlessinger and formal-smoothness comparisons.

The height-one model resolution, finite-flat realization and generic-reducedness theorem
use the exact scheme and integral-Hodge contracts of the README.
README 4.9's `flatResolution.points` retains the coefficient map and generic-fibre
identification and requires scheme-theoretic factorization through the flat local model
of 4.7.1, including for nonreduced coefficients. The determinant condition alone describes
the naive model; 4.8 states when these models coincide. For p=3, e=4 and v=(2,2,0,0),
the residual lattice with Frobenius diag(1,u⁴) satisfies that determinant condition but
has Jordan type (4), which is not dominated by the required dual partition (2,2).
-/

/-! ## Layer 5: Dyadic connected-model and endpoint geometry

The connected dyadic category and selected weight endpoints require their integral-Hodge
carriers. Their point criteria and ordinary ring isomorphisms are specified in the README.
In 5.2 the ordinary reduced flat image quotient may be zero. Its generic dimension 3+f
requires nonzero quotient; outside the split-distinct exception the integral ring is zero
or a domain. The absolutely irreducible natural S₃-representation over F₂ at Q₂ has
compatible cyclotomic determinant but admits no ordinary lift, since a saturated ordinary
line would reduce to a residual stable line, also after finite coefficient extension.
In 5.11, determinant equal to the cyclotomic character on the full Galois group means that
there exists a Kisin basis in which the determinant unit specializes to one at u=0,
equivalently a basis with determinant Frobenius p*E(u)/E(0). The displayed unit changes by
φ(det B)/det B under a basis change B; normalization in an arbitrary fixed basis is not required.
-/

/-! ## Layer 6: Ordinary flags and component comparisons -/

section Components

/-- Two points connect when their kernels contain one common minimal prime.
This retains the component itself and does not assert transitivity at intersections. -/
def Connects {R B : Type*} [CommRing R] [CommRing B] (x y : R →+* B) : Prop :=
  ∃ P ∈ minimalPrimes R, P ≤ RingHom.ker x ∧ P ≤ RingHom.ker y

/-- The unique component through the middle point gives the transitivity used at regular points. -/
theorem connects_trans_of_unique_component {R B : Type*} [CommRing R] [CommRing B]
    {x y z : R →+* B}
    (hy : ∀ P ∈ minimalPrimes R, ∀ Q ∈ minimalPrimes R,
      P ≤ RingHom.ker y → Q ≤ RingHom.ker y → P = Q)
    (hxy : Connects x y) (hyz : Connects y z) : Connects x z := by
  sorry

/-- The affine rational node with its actual two-branch relation. -/
noncomputable def affineNodeIdeal : Ideal (MvPolynomial (Fin 2) ℚ) :=
  Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1}

/-- The coordinate ring of the affine node. -/
abbrev AffineNode := MvPolynomial (Fin 2) ℚ ⧸ affineNodeIdeal

/-- Evaluation at a rational point of the node, retaining the relation a*b=0. -/
noncomputable def affineNodePoint (a b : ℚ) (hab : a * b = 0) : AffineNode →+* ℚ :=
  Ideal.Quotient.lift affineNodeIdeal
    (MvPolynomial.eval₂Hom (RingHom.id ℚ) ![a, b]) (by
      sorry)

/-- The origin connects to a point on either branch, while the two outer points
have no common component; unconditional transitivity therefore fails (README 6.8). -/
theorem connects_not_transitive :
    Connects (affineNodePoint 1 0 (by norm_num)) (affineNodePoint 0 0 (by norm_num)) ∧
    Connects (affineNodePoint 0 0 (by norm_num)) (affineNodePoint 0 1 (by norm_num)) ∧
    ¬ Connects (affineNodePoint 1 0 (by norm_num)) (affineNodePoint 0 1 (by norm_num)) := by
  sorry

end Components

section EtaleCoefficients

variable {R : Type*} [CommRing R]

/-- The coefficient-adic completion of the ordinary Laurent-series ring.
For a split complete local Kisin coefficient factor the ideal is the maximal ideal. -/
abbrev EtaleCoeffRing (R : Type*) [CommRing R] (I : Ideal R) :=
  AdicCompletion (I.map (algebraMap R (LaurentSeries R))) (LaurentSeries R)

/-- A height factor becomes invertible in ordinary Laurent series for nilpotent coefficients. -/
theorem laurent_height_factor_isUnit_of_nilpotent (a : R) (ha : IsNilpotent a) :
    IsUnit (HahnSeries.single (1 : ℤ) (1 : R) + HahnSeries.C a : LaurentSeries R) := by
  sorry

/-- A height factor with constant coefficient in any coefficient ideal is a unit
in the completed étale carrier, completed at the extension of that ideal. -/
theorem etale_height_factor_isUnit (I : Ideal R) (a : R) (ha : a ∈ I) :
    IsUnit (AdicCompletion.of (I.map (algebraMap R (LaurentSeries R))) (LaurentSeries R)
      (HahnSeries.single (1 : ℤ) (1 : R) + HahnSeries.C a)) := by
  sorry

end EtaleCoefficients

section IdentityChart

variable {A : Type*} [CommRing A]

/-- The polynomial matrix underlying the residual identity shape of type `(η, τ)` and
actual weights `{0,1,2}`. The starred parameters occupy the chart's unit-coordinate positions. -/
noncomputable def identityFrobenius (a b c d e f g h i aStar eStar iStar : A) :
    Matrix (Fin 3) (Fin 3) (Polynomial A) :=
  !![Polynomial.C a + Polynomial.X * Polynomial.C aStar, Polynomial.C b, Polynomial.C c;
     Polynomial.X * Polynomial.C d, Polynomial.C e + Polynomial.X * Polynomial.C eStar,
       Polynomial.C f;
     Polynomial.X * Polynomial.C g, Polynomial.X * Polynomial.C h,
       Polynomial.C i + Polynomial.X * Polynomial.C iStar]

/-- The identity-chart determinant has the cubic equation at coefficient `v²`.
The coefficient `v³` is the product of its unit diagonal coordinates. -/
theorem identity_frobenius_determinant_coefficients
    (a b c d e f g h i aStar eStar iStar : A) :
    (Matrix.det (identityFrobenius a b c d e f g h i aStar eStar iStar)).coeff 2 =
      a * eStar * iStar + e * aStar * iStar + i * aStar * eStar -
        aStar * f * h - eStar * c * g - iStar * b * d + c * h * d ∧
    (Matrix.det (identityFrobenius a b c d e f g h i aStar eStar iStar)).coeff 3 =
      aStar * eStar * iStar := by
  sorry

end IdentityChart


section Eigenvalue

variable {A : Type*} [CommRing A]

/-- After writing `α=1+β`, the eigenvalue equation for determinant-one Frobenius of trace `2+t`. -/
def OrdinaryEigenvalueEquation (t β : A) : Prop := β ^ 2 - t * β - t = 0

/-- The condition is a characteristic-polynomial root, retaining Frobenius and its eigenvalue. -/
theorem ordinary_eigenvalue_equation_iff (Φ : Matrix (Fin 2) (Fin 2) A)
    (hdet : Matrix.det Φ = 1) (β : A) :
    OrdinaryEigenvalueEquation (Matrix.trace Φ - 2) β ↔
      Polynomial.eval (1 + β) Φ.charpoly = 0 := by
  sorry

end Eigenvalue

/-! ## Layer 7: Determinant-ordinary images and flags -/

section DeterminantOrdinary

variable {A G : Type*} [CommRing A] [Group G] {n : ℕ}

/-- The determinant-ordinary equations over their actual coefficient algebra:
characteristic polynomials and every ordered length-`n` product.
The extended universal coefficient ring and its descent image are separate README constructions. -/
def IsDetOrdinary (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) : Prop :=
  (∀ g, (ρ g : Matrix (Fin n) (Fin n) A).charpoly =
    ∏ i, (Polynomial.X - Polynomial.C ((χ i g : Aˣ) : A))) ∧
  ∀ g : Fin n → G,
    (List.ofFn fun i ↦ (ρ (g i) : Matrix (Fin n) (Fin n) A) -
      ((χ i (g i) : Aˣ) : A) • (1 : Matrix (Fin n) (Fin n) A)).prod = 0

/-- A simultaneous basis giving the prescribed ordered stable flag and its actual diagonal characters. -/
def HasOrderedTriangularization (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) : Prop :=
  ∃ B : GL (Fin n) A, ∀ g,
    (∀ i j : Fin n, j < i →
      ((B⁻¹ * ρ g * B : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) i j = 0) ∧
    (∀ i : Fin n,
      ((B⁻¹ * ρ g * B : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) i i =
        ((χ i g : Aˣ) : A))

/-- With pairwise distinct characters over a field, the full equations characterize the ordered flag.
This includes rank zero; distinct character functions need not have simultaneously distinct values. -/
theorem det_ordinary_iff_ordered_triangularization {F : Type*} [Field F]
    (ρ : G →* GL (Fin n) F) (χ : Fin n → G →* Fˣ)
    (hχ : Function.Injective χ) :
    IsDetOrdinary ρ χ ↔ HasOrderedTriangularization ρ χ := by
  sorry

/-- An explicit invertible matrix from a specified two-sided inverse. -/
def controlMatrixUnit (M N : Matrix (Fin 2) (Fin 2) A)
    (hMN : M * N = 1) (hNM : N * M = 1) : GL (Fin 2) A :=
  ⟨M, N, hMN, hNM⟩

/-- Nilpotently shifted reciprocal characters of the cyclic free group over Z/9. -/
def nilpotentShiftCharacters : Fin 2 → FreeGroup Unit →* (ZMod 9)ˣ :=
  ![FreeGroup.lift (fun _ => ⟨4, 7, by decide, by decide⟩),
    FreeGroup.lift (fun _ => ⟨7, 4, by decide, by decide⟩)]

/-- Over Z/9 the scalar representation satisfies determinant-ordinary equations for
nilpotently shifted characters, but has no direct-summand flag with those characters (README 7.1). -/
theorem det_ordinary_nilpotent_shift_not_flag :
    IsDetOrdinary (1 : FreeGroup Unit →* GL (Fin 2) (ZMod 9)) nilpotentShiftCharacters ∧
    ¬ HasOrderedTriangularization (1 : FreeGroup Unit →* GL (Fin 2) (ZMod 9))
      nilpotentShiftCharacters := by
  sorry

end DeterminantOrdinary

section NonreducedControl

/-- The nonreduced triangular family used to distinguish determinant polynomials from ordered products. -/
def z9Family (a b : ZMod 9) : Matrix (Fin 2) (Fin 2) (ZMod 9) :=
  !![1 + 3 * a, b; 0, 1 - 3 * a]

/-- Every family element has determinant one and repeated characteristic root one. -/
theorem z9_family_determinant_and_charpoly (a b : ZMod 9) :
    Matrix.det (z9Family a b) = 1 ∧
      (z9Family a b).charpoly = (Polynomial.X - 1) ^ 2 := by
  sorry

/-- The invertible generators M=diag(4,7) and U of the nonreduced subgroup. -/
def z9Generators : Fin 2 → GL (Fin 2) (ZMod 9) :=
  ![controlMatrixUnit (z9Family 1 0) (z9Family 2 0) (by decide) (by decide),
    controlMatrixUnit (z9Family 0 1) (z9Family 0 (-1)) (by decide) (by decide)]

/-- The actual subgroup generated by M and U. -/
def z9Subgroup : Subgroup (GL (Fin 2) (ZMod 9)) :=
  Subgroup.closure (Set.range z9Generators)

/-- Every subgroup element has the repeated-root polynomial, but the subgroup
representation fails determinant-ordinarity for the two trivial characters (README 7.1). -/
theorem charpoly_not_det_ordinary :
    (∀ g : z9Subgroup, (g.val : Matrix (Fin 2) (Fin 2) (ZMod 9)).charpoly =
      (Polynomial.X - 1) ^ 2) ∧
    ¬ IsDetOrdinary z9Subgroup.subtype (fun _ : Fin 2 => 1) := by
  sorry

end NonreducedControl

/-! ## Layer 8: Selected local conditions and global exports -/


section NodalRing

variable (A : Type*) [CommRing A]

/-- The actual integral formal node appearing in the selected rank-two branches. -/
noncomputable def nodalIdeal (π u : A) : Ideal (MvPowerSeries (Fin 2) A) :=
  Ideal.span {MvPowerSeries.X 0 * MvPowerSeries.X 1 - MvPowerSeries.C (π * u)}

/-- Its ring retains the node equation, rather than only its number of variables. -/
abbrev NodalRing (π u : A) := MvPowerSeries (Fin 2) A ⧸ nodalIdeal A π u

/-- The integral node over any DVR is a flat domain when its constant term is nonzero and nonunit. -/
theorem nodal_ring_flat_domain [IsDomain A] [IsDiscreteValuationRing A]
    (π u : A)
    (hπ : π ≠ 0) (hπnonunit : ¬ IsUnit π) (hu : IsUnit u) :
    IsDomain (NodalRing A π u) ∧ Module.Flat A (NodalRing A π u) := by
  sorry

end NodalRing

/-!
The README also specifies the following constructions with their full geometric carriers.

Layer F: `ModDef`, `ModDefFramed`, `DetDef`, `PseudoDefRing`, `univLift`,
`DeformationProblem` and inertia-rigid deformation rings. Empty type quotients are excluded
from `DeformationProblem`. Their README-only APIs include
`phiP_iff_fg` (F.2.1).
The names `univLift`, `univLift_reduce`, `liftEquivHom` and `univLift_continuous` in
F.2.4 specialize the common continuous framed pair of DeformationAndDerivedPatchingAlgebra
§2.7, under Φ_p and with the specified residue basis and maximal-ideal topology.

Layer 0: README 0.4 owns `CoefficientRobbaModule`, `D_rig`, its étale equivalence,
`HerrCohomology` and derived coefficient change. At A=E these give PadicHodgeTheory's
`D_(rig)^†` and `herrComplex`, preserving tensor, dual, cohomology, cup and signed trace.
On finite Gamma-torsion invariants the differentials are
x ↦ ((φ−1)x,(γ−1)x) and (a,b) ↦ (γ−1)a−(φ−1)b.
The adapter to Liu swaps degree-one coordinates and negates degree two;
arithmetic reciprocity gives trace one for the unramified-class-first Kummer cup.
Connections, B-pairs and further analytic period comparisons belong to PadicHodgeTheory.

Layer 0: `CanonicalModule`, `CanonicalModule.regularQuotient` and
`CanonicalModule.type_eq_socle` specialize DeformationAndDerivedPatchingAlgebra §3.9
for a nonzero complete CM quotient of a regular local power-series ring.
`CanonicalModule.completion` compares the completed graded Ext module, after forgetting
grading, with that same canonical module; its standard graded CM hypotheses are README 0.1.

Layer 1: `heightLatticeFunctor`, `ordinaryWeightRing`, `universalInertialCharacter`,
`ordinaryWeightRingTilde`, `FLDeformation`, `IsOrdinaryOfWeight`,
`IsSemistableOrdinaryOfWeight`, `ordinaryFlagScheme`, `ordinaryFlagImage`, `CoeffRing`,
`ArtinCat`, `liftFunctorΛ`, `GLift`, `GFramedRing`, `canonicalTorus`, `chiLambda`, `IsGOrdinary`,
`PhiGamma.defRing`, `PhiGamma.triangulineDefRing`, `PhiGamma.deRhamDefRing`.
For generalised reductive G, README 1.17, 1.20 and 1.22 use G^der=(G⁰)^der.
The fixed-quotient lift μ takes values in G/G^der, which can be noncommutative;
`GFramedRing.fixedMultiplier` specializes to a character for connected GSp.
The pinned schematic derived-group construction is applied to G⁰.
For the inversion semidirect product of the multiplicative group with C₂,
G^der is trivial but the full commutator subgroup is the multiplicative group.
Integral ordinary flag uniqueness requires residual inertial separation or vanishing Hom
modules between distinct graded characters; coefficient-change existence retains the flags.

Layer 2: `IsMinimallyRamified`, `SteinbergLifts`, `TameGroup`, `GSp4RamType`,
`typeQuotient`, the symplectic `GSp4.exp₂` and `GSp4.log₂`, `𝒩(q)`, `ℳ(x,y;q)`,
`LevelRaising.mix`, `LevelRaising.unr`, `LevelRaising.ram`, `InertialType`,
`fixedTypeRing`, `IsRigidFor`, `TaylorWilesBlock`, `GSp4.MinimalAt`.
The type P predicate of `GSp4RamType` requires decomposition-group character splitting,
an inertia-fixed isotropic plane and a complementary isotropic plane with one nontrivial
scalar inertia character, as well as `x−1` a unit. `GSp4RamType.not_P` excludes this
predicate when the similitude is trivial on inertia; cyclotomic powers have this property
at `x≠p`. `GSp4.MinimalAt` uses the same residual predicate for its type-P branch.

Layer 0: `RankTwoNonordinaryEndpoint.exists` supplies the odd-prime local induced lift.
Layer 3: `HodgeType` retains integer jumps; `HodgeType.tateTwist` transports the residual
representation, determinant and universal type quotient maps, with finite WD inertia unchanged.
The remaining APIs are `GaloisType`, `IsOfType`, `WDTypeRing`.
Layer 4: `flatLiftingRing`, `flatDeformationRing`, `finiteFlatModels`,
`flatHodgeTypeQuotient`, `flatResolution`.
The finite-flat model closure and coefficient-linear self-Ext calculation use
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.7, `flatDeformationTangentSpace`
and `flatTangent_finrank_le`. The condition, Schlessinger adapter and representing-ring
conclusions belong to 4.1; `CategoryCondition.flat` in 8.6 uses this same adapter.
Layer 5: `kisinGroupoid`, `DyadicMinimal.lift`.
Layer 6: the geometric APIs `Connects.sum_tensor_dual` and `Connects.trans_of_smooth`
of §6.8, `OrdinaryFixedInertia`, `DiscreteSeriesType`, `IsDiscreteSeriesLift`,
`discreteSeriesDeformation`,
`gOrdinaryFlagScheme`, `gOrdinaryRing`, `OrdinaryWithEigenvalue`, `GL3KisinChart`,
`partitionRing`, `IsTorsionCrystalline`, `IsCrystallineIntegral`, `GSp4.SiegelOrdinary`,
`rhoNM0`, `GSp4.IsPDistinguishedOrdinary`, `GSp4.BorelOrdinary`,
`GSp4.ParabolicOrdinary`, `GL3.explicitRing`, `GL3.comparisonDiagram`,
`GSp4.weightAlgebra`, `GSp4.ordinaryFlagScheme`, `GL3.WeakMinimalPatchingFunctor`,
`GL3.typeGeometry_of_weakMinimalPatching`, `GL3.auxiliaryLift`, `GL3.scopedGlobalization`,
`GL3.definiteUnitaryPatching`, `GL3.weakMinimalPatching_exists`,
`GL3.weakMinimalPatching_multiplicity`, `GL3.weakMinimalPatching_typeSupport`.
`IsDiscreteSeriesLift` is a predicate on arbitrary coefficient representations;
`discreteSeriesDeformation` requires a witness `IsDiscreteSeriesLift type ρbar` for the
fixed residual representation. The liftability, tangent dimension and smooth framed ring of
README 6.16 retain that witness. Incompatible residual data give an empty condition and a zero
condition quotient, excluded from `DeformationProblem`.
README 6.34 identifies the P-valued charts with
(R_A ⊗̂_𝒪 R_B) ⊗̂_D R_AB and (R_A ⊗̂_Λ R_B) ⊗̂_D R_AB,
where D is the ring of two characters, R_A and R_B have determinant ε⁻¹,
and R_AB has variable determinant. The character maps classify (χ_A,χ_B) and
(ξ₁,ε⁻¹ξ₂⁻¹); Λ identifies the top inertial weights. The chart dimensions ten
and nine become fifteen and fourteen after five full-framing variables.
README 6.15 denotes the four-dimensional B₂-valued chart by R^{B₂,◹}; a flag
splitting gives the fully framed R^{B₂}≅R^{B₂,◹}[[u]], of relative dimension five.
In README 6.34 case (2b), compatible flag splittings give the middle symplectic
subquotient W=Fil₃/Fil₁ with residual λ_βbar⊗(1⊕εbar⁻¹). Its triangular basis
induces R^{B₂,◹}(W)→R^B, formally smooth of relative dimension twelve. Retaining
one transverse W-frame coordinate gives R^{B₂}(W)→R^B of relative dimension
eleven. Thus both 4+12 and 5+11 give the ambient relative dimension sixteen.
The GL₃ type `(η, τ)` has actual weights `{0,1,2}` and determinant weight `3`.
Its Kisin Frobenius matrices lie over power series with a height condition;
`GL3KisinChart.frobMatrix` becomes invertible over the completed étale coefficient ring,
and `GL3KisinChart.shape` is defined on residual Laurent-series field fibres.
README 6.21 separates abstract polynomial quotients from their arithmetic identification.
The local length-at-least-two presentation assumes unramified K, semisimple residual data,
5-generic τ, its lowest-alcove presentation and the inertia and admissible-shape hypotheses
of LLHLM20 Lemma 3.5.4 at every embedding. Weight-labelled components and minimal-type matching
assume 10-generic semisimple residual data and a nonzero type quotient, hence 7-generic τ.
The local 5-generic branch of 6.30 is independent of the uniform weight assignment.
The auxiliary length-four lift theorem retains its own 6-generic semisimple residual hypotheses.
The conditional type theorem assumes the functor; its existence for `p > 3` uses
the separate auxiliary-lift, scoped-globalization and finite-level unitary patching targets.
Layer 7: `detOrdTilde`, `detOrd`.
Layer 8: `IrreducibleEndpointDeformation` retains the restricted endpoint category and
coefficient-compatible one-parameter normal form, including p=2. `CategoryCondition` uses
V-filtrations and subobjects and quotients inside that abelian category.
Its relative tangent Ext is taken in S_k, the discrete k-linear objects of S killed by ϖ,
with image L_S in H¹(ad). The fixed-determinant tangent is L_S ∩ ker(tr_*), using
trace-zero cocycles modulo full-adjoint coboundaries also when p divides the rank.
The trivial-action extension 𝒪/ϖ² belongs to S but is excluded from S_k;
for the trivial rank-one condition the relative tangent is zero. `KWCondition`
retains its selected branch data.
-/

end TauCetiRoadmap.LocalGaloisDeformationRings
