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
  Lift.ext rfl

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

/-- The `n`-th root used to split off the determinant when `p ∤ n` (README F.2.9): over an Artinian
local ring with residue characteristic `p`, a unit with residue `1` has a unique `n`-th root with
residue `1`. -/
theorem exists_unique_nthRoot_of_residue_eq_one {A : Type*} [CommRing A] [IsLocalRing A]
    [IsArtinianRing A] (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField A) p] {n : ℕ}
    (hn : ¬ p ∣ n) (u : Aˣ) (hu : IsLocalRing.residue A (u : A) = 1) :
    ∃! v : Aˣ, IsLocalRing.residue A (v : A) = 1 ∧ v ^ n = u := by
  sorry

/-- In characteristic three with `ε² = 0`, every expression `1 + aε` has cube one. -/
example {R : Type*} [CommRing R] (a e : R) (h3 : (3 : R) = 0) (he : e ^ 2 = 0) :
    (1 + a * e) ^ 3 = 1 := by
  linear_combination (a * e) * h3 + (3 * a ^ 2 + a ^ 3 * e) * he

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

/-- `restrict_id`: precomposition by the identity fixes the underlying lift (README F.1.6). -/
example [TopologicalSpace k] [IsTopologicalRing k] (n : ℕ)
    (ρbar : G →* GL (Fin n) k) {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] (π : A →+* k) (ρ : Lift n ρbar π) :
    ρ.restrict n ρbar π (MonoidHom.id G) continuous_id = ρ := by
  apply Lift.ext
  rfl

/-- `def_residue`: a continuous residual lift gives the unique strict class over `k` (README F.1.3). -/
example [TopologicalSpace k] [IsTopologicalRing k] (n : ℕ)
    (ρbar : G →* GL (Fin n) k) (ρ : Lift n ρbar (RingHom.id k)) :
    Subsingleton (Def n ρbar (RingHom.id k)) ∧ Nonempty (Def n ρbar (RingHom.id k)) := by
  sorry

/-- `def_rank_one_eq_lift`: scalar conjugation removes no rank-one lifts (README F.1.3). -/
example (ρbar : G →* GL (Fin 1) k) {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] (π : A →+* k) :
    ∃ e : Def 1 ρbar π ≃ Lift 1 ρbar π, ∀ ρ, e (Def.mk 1 ρbar π ρ) = ρ := by
  sorry

/-- `liftDet_rank_one`: the determinant equation fixes the entire rank-one homomorphism
(README F.1.7). -/
example (ρbar : G →* GL (Fin 1) k) {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] (π : A →+* k) (χ : G →* Aˣ) (ρ : Lift 1 ρbar π) :
    ρ ∈ LiftDet 1 ρbar π χ ↔
      ρ.toHom = (Matrix.GeneralLinearGroup.scalar (Fin 1)).comp χ := by
  sorry

/-- `liftDet_residue`: with compatible determinant, every residual lift is the same
fixed-determinant lift (README F.1.7). -/
example [TopologicalSpace k] [IsTopologicalRing k] (n : ℕ)
    (ρbar : G →* GL (Fin n) k) (ρ : Lift n ρbar (RingHom.id k)) :
    ρ ∈ LiftDet n ρbar (RingHom.id k) (Matrix.GeneralLinearGroup.det.comp ρbar) ∧
      Set.Subsingleton (LiftDet n ρbar (RingHom.id k) (Matrix.GeneralLinearGroup.det.comp ρbar)) := by
  sorry

/-- `liftDet_wrong_char`: a determinant with incompatible reduction admits no lift
(README F.1.7). -/
example (n : ℕ) (ρbar : G →* GL (Fin n) k) {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k) (χ : G →* Aˣ)
    (hχ : (Units.map (π : A →* k)).comp χ ≠ Matrix.GeneralLinearGroup.det.comp ρbar) :
    LiftDet n ρbar π χ = ∅ := by
  sorry

/-- `tframed_empty_T`: forgetting the unique empty frame tuple identifies the unrestricted
framed quotient with strict classes (README F.2.6). -/
example (n : ℕ) (ρbar : G →* GL (Fin n) k) {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k) :
    ∃ e : UnrestrictedTFramedDef n ρbar π Empty ≃ Def n ρbar π,
      ∀ x : TFramedLift n ρbar π Empty,
        e (Quotient.mk (MulAction.orbitRel _ _) x) = Def.mk n ρbar π x.lift := by
  sorry

/-- `nthRoot_fails_p_dvd_n`: the nonzero dual-number direction has no residue-one cube root,
even among arbitrary elements (README F.2.9). -/
example :
    let ε : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    ε ≠ 0 ∧ ¬ ∃ v : DualNumber (ZMod 3), v.fst = 1 ∧ v ^ 3 = 1 + ε := by
  constructor
  · intro h
    have hs := congrArg TrivSqZeroExt.snd h
    exact one_ne_zero hs
  · rintro ⟨v, hv, he⟩
    have hs := congrArg TrivSqZeroExt.snd he
    norm_num [TrivSqZeroExt.snd_pow, hv] at hs
    have h3 : (3 : ZMod 3) = 0 := by decide
    rw [h3, zero_mul] at hs
    exact zero_ne_one hs

/-- `nthRoot_unique`: prime-to-residue-characteristic powers are injective on residue-one units
(README F.2.9). -/
example {A : Type*} [CommRing A] [IsLocalRing A] [IsArtinianRing A]
    (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField A) p] {n : ℕ}
    (hn : ¬ p ∣ n) (u v : Aˣ)
    (hu : IsLocalRing.residue A (u : A) = 1) (hv : IsLocalRing.residue A (v : A) = 1)
    (h : u ^ n = v ^ n) : u = v := by
  obtain ⟨_, _, huniq⟩ := exists_unique_nthRoot_of_residue_eq_one p hn (u ^ n) (by simp [hu])
  exact (huniq u ⟨hu, rfl⟩).trans (huniq v ⟨hv, h.symm⟩).symm

/-- `def_not_full_conj` and `strict_of_full_not_schur`: two rank-two dual-number matrices are
conjugate by the swap, but no matrix reducing to one intertwines them (README F.1.3, F.1.5). -/
example :
    let ε : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    let D : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1 + ε, 0; 0, 1]
    let D' : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; 0, 1 + ε]
    let P : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![0, 1; 1, 0]
    P * D * P = D' ∧ D ≠ D' ∧
      ¬ ∃ b : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)),
        b.map (TrivSqZeroExt.fstHom (ZMod 3) (ZMod 3) (ZMod 3)).toRingHom = 1 ∧
        b * D = D' * b := by
  sorry

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

/-- `changeCoeff_schur`: extending the residue field preserves the scalar-centralizer condition
(README F.1.8). -/
example (n : ℕ) (ρbar : G →* GL (Fin n) k) {k' : Type*} [Field k'] (f : k →+* k') :
    IsSchur n ρbar ↔ IsSchur n ((Matrix.GeneralLinearGroup.map f).comp ρbar) := by
  sorry

/-- `framed_normalisation_unique`: a distinguished unit frame entry admits exactly one scalar
normalization (README F.2.6). -/
example {A : Type*} [CommRing A] (u : Aˣ) : ∃! c : Aˣ, c * u = 1 := by
  refine ⟨u⁻¹, inv_mul_cancel u, ?_⟩
  intro c hc
  exact mul_right_cancel (hc.trans (inv_mul_cancel u).symm)

/-- `phiP_Zp`: the additive p-adic integers satisfy Mazur's finiteness condition (README F.2.1). -/
example (p : ℕ) [Fact p.Prime] : PhiP p (Multiplicative ℤ_[p]) := by
  sorry

/-- `phiP_open`: the finiteness condition persists on each open subgroup (README F.2.1). -/
example (p : ℕ) (h : PhiP p G) (Δ : Subgroup G) (hΔ : IsOpen (Δ : Set G)) :
    PhiP p Δ :=
  h.«open» Δ hΔ

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

/-- `defProblem_not_conj_stable` and `ideal_maximal_not_invariant` (README F.3.1–F.3.2):
a strict conjugator over `𝔽₃[ε]` moves the constant residual lift `diag(1, −1)`.
The conjugate leaves both the upper-triangular matrices and the family factoring through `k`. -/
example :
    let ε₃ : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    let D₃ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; 0, -1]
    let b₃ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; ε₃, 1]
    let b₃inv : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; -ε₃, 1]
    D₃ ^ 2 = 1 ∧ b₃ * b₃inv = 1 ∧ b₃inv * b₃ = 1 ∧
      b₃.map (TrivSqZeroExt.fstHom (ZMod 3) (ZMod 3) (ZMod 3)).toRingHom = 1 ∧
      b₃ * D₃ * b₃inv = !![1, 0; 2 * ε₃, -1] ∧ (b₃ * D₃ * b₃inv) 1 0 ≠ 0 ∧
      b₃ * D₃ * b₃inv ≠ D₃ := by
  let : DecidableEq (DualNumber (ZMod 3)) := inferInstanceAs (DecidableEq (ZMod 3 × ZMod 3))
  decide

/-- `strict_of_full_nonlocal`: the integral `S₃` generators, and an integral unit matrix reducing
to the scalar `2` modulo `5`; only `±1` are integral scalar units. -/
example :
    let C : Matrix (Fin 2) (Fin 2) ℤ := !![0, -1; 1, -1]
    let S : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 1, 0]
    let a : Matrix (Fin 2) (Fin 2) ℤ := !![2, 5; 5, 12]
    let ainv : Matrix (Fin 2) (Fin 2) ℤ := !![-12, 5; 5, -2]
    C ^ 3 = 1 ∧ S ^ 2 = 1 ∧ S * C * S = C ^ 2 ∧ a * ainv = 1 ∧ ainv * a = 1 ∧
      a.map (Int.castRingHom (ZMod 5)) = (2 : ZMod 5) • (1 : Matrix (Fin 2) (Fin 2) (ZMod 5)) ∧
      a.map (Int.castRingHom (ZMod 5)) ≠ 1 ∧ (-a).map (Int.castRingHom (ZMod 5)) ≠ 1 := by
  decide

/-- The integral common centralizer of the `S₃` generators consists of scalar matrices. -/
example (x y z w : ℤ)
    (hC : !![x, y; z, w] * !![0, -1; 1, -1] = !![0, -1; 1, -1] * !![x, y; z, w])
    (hS : !![x, y; z, w] * !![0, 1; 1, 0] = !![0, 1; 1, 0] * !![x, y; z, w]) :
    y = 0 ∧ z = 0 ∧ x = w := by
  have hc00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ ↦ M 0 0) hC
  have hc01 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ ↦ M 0 1) hC
  have hs00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ ↦ M 0 0) hS
  simp [Matrix.mul_apply, Fin.sum_univ_two] at hc00 hc01 hs00
  omega

/-- Over the local ring `ℤ/25` the unit `13 = 2⁻¹` normalises the same conjugator into the strict
kernel. -/
example : (2 * 13 : ZMod 25) = 1 ∧
    ((13 : ZMod 25) • ((!![2, 5; 5, 12] : Matrix (Fin 2) (Fin 2) ℤ).map
      (Int.castRingHom (ZMod 25)))).map (ZMod.castHom (by norm_num : 5 ∣ 25) (ZMod 5)) = 1 := by
  decide

/-- Rank one has no trace-zero matrix directions, so its pulled-back fixed-determinant local
condition is zero even when the unrestricted local condition contains characters (README F.3.2). -/
example (X : Matrix (Fin 1) (Fin 1) k) (hX : X.trace = 0) : X = 0 := by
  ext i j
  fin_cases i
  fin_cases j
  simpa [Matrix.trace, Fin.sum_univ_one] using hX

end FoundationExamples

section FoundationBoundaryExamples

/-- Evaluation at one parametrizes trivial-residual rank-one lifts of the additive p-adic
integers by residue-one units of finite discrete local coefficients (README F.1.1). -/
example (p : ℕ) [Fact p.Prime] {A : Type*} [CommRing A] [IsLocalRing A] [Finite A]
    [TopologicalSpace A] [DiscreteTopology A] [IsTopologicalRing A]
    (π : A →+* ZMod p) (hπ : Function.Surjective π)
    (hres : RingHom.ker π = IsLocalRing.maximalIdeal A) :
    Function.Bijective (fun ρ : Lift 1
      (1 : Multiplicative ℤ_[p] →* GL (Fin 1) (ZMod p)) π =>
      (⟨Matrix.GeneralLinearGroup.det (ρ.toHom (Multiplicative.ofAdd 1)), by
        sorry⟩ : {u : Aˣ // π (u : A) = 1})) := by
  sorry

/-- The infinitesimal scalar character attached to a linear functional on the product group. -/
def productDualCharacter (f : (ℕ → ZMod 3) →ₗ[ZMod 3] ZMod 3) :
    Multiplicative (ℕ → ZMod 3) →* GL (Fin 1) (DualNumber (ZMod 3)) where
  toFun g := Matrix.GeneralLinearGroup.scalar (Fin 1)
    ⟨1 + TrivSqZeroExt.inr (f (Multiplicative.toAdd g)),
      1 - TrivSqZeroExt.inr (f (Multiplicative.toAdd g)), by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- A functional killing the direct sum and taking the constant one sequence to one gives
an algebraic trivial-residual character which fails the continuity condition (README F.1.1). -/
example : ∃ f : (ℕ → ZMod 3) →ₗ[ZMod 3] ZMod 3,
    (∀ x, Set.Finite (Function.support x) → f x = 0) ∧ f (fun _ => 1) = 1 ∧
    ¬ Continuous f ∧
    (∀ g, ((productDualCharacter f g :
      Matrix (Fin 1) (Fin 1) (DualNumber (ZMod 3))) 0 0).fst = 1) ∧
    ¬ Continuous (fun g => (productDualCharacter f g :
      Matrix (Fin 1) (Fin 1) (DualNumber (ZMod 3)))) := by
  sorry

/-- The involution acts on the product of cyclic groups by inversion. -/
def inversionAction : Multiplicative (ZMod 2) →* MulAut (Multiplicative (ℕ → ZMod 3)) where
  toFun c := if c = 1 then MulEquiv.refl _ else
    { toFun := fun x => x⁻¹
      invFun := fun x => x⁻¹
      left_inv := inv_inv
      right_inv := inv_inv
      map_mul' := by intros; exact mul_inv _ _ }
  map_one' := by
    simp only [ite_true]
    rfl
  map_mul' := by sorry

/-- The inversion semidirect product used to test the open-subgroup quantifier in Φ_p. -/
abbrev InversionSemidirect :=
  SemidirectProduct (Multiplicative (ℕ → ZMod 3)) (Multiplicative (ZMod 2)) inversionAction

/-- The semidirect product has the product topology through its coordinate equivalence. -/
instance : TopologicalSpace InversionSemidirect :=
  TopologicalSpace.induced SemidirectProduct.equivProd
    (inferInstanceAs (TopologicalSpace
      (Multiplicative (ℕ → ZMod 3) × Multiplicative (ZMod 2))))

/-- The normal factor is open; every character of the whole group is trivial, while
its infinitely many coordinate characters make Φ₃ fail (README F.2.1). -/
example :
    IsTopologicalGroup InversionSemidirect ∧ CompactSpace InversionSemidirect ∧
    T2Space InversionSemidirect ∧ TotallyDisconnectedSpace InversionSemidirect ∧
    (∀ f : InversionSemidirect →* Multiplicative (ZMod 3), f = 1) ∧
    IsOpen ((SemidirectProduct.rightHom (φ := inversionAction)).ker :
      Set InversionSemidirect) ∧
    ¬ PhiP 3 InversionSemidirect := by
  sorry

/-- The ideal defining the truncated polynomial coefficient ring in the square-lifting test. -/
noncomputable def truncatedIdeal (n : ℕ) : Ideal (Polynomial (ZMod 3)) :=
  Ideal.span {Polynomial.X ^ n}

/-- Reduction from the cubic truncation to the quadratic truncation. -/
noncomputable def truncateCubeToSquare :
    (Polynomial (ZMod 3) ⧸ truncatedIdeal 3) →+*
      (Polynomial (ZMod 3) ⧸ truncatedIdeal 2) :=
  Ideal.Quotient.factor (by sorry)

/-- The cubic-to-quadratic truncation has square-zero kernel, but the square-zero class
of t in the quadratic quotient has no square-zero lift. This realizes the quadratic
relation obstruction specialized in README F.0.2 from DeformationAndDerivedPatchingAlgebra
§§2.2–2.4. -/
example :
    (∀ x y, truncateCubeToSquare x = 0 → truncateCubeToSquare y = 0 → x * y = 0) ∧
    (Ideal.Quotient.mk (truncatedIdeal 2) Polynomial.X) ^ 2 = 0 ∧
    ¬ ∃ x, truncateCubeToSquare x = Ideal.Quotient.mk (truncatedIdeal 2) Polynomial.X ∧
      x ^ 2 = 0 := by
  sorry

end FoundationBoundaryExamples

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

/-- Frobenius `E` on a rank-one lattice has height at most one. -/
example (E : A) : HasHeightLE E !![E] 1 := by
  refine ⟨1, ?_⟩
  ext i j
  fin_cases i
  fin_cases j
  simp

/-- The fixed lattice with Frobenius `u` over `ℚ[[u]]` has no finite `u+3` height. -/
example (h : ℕ) :
    ¬ HasHeightLE (PowerSeries.X + 3 : PowerSeries ℚ) !![PowerSeries.X] h := by
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

/-- The diagonal odd involution satisfies the integral equation. -/
example : OddInvolutionEquation (1 : ℤ) 0 0 := by
  norm_num [OddInvolutionEquation]

/-- At residue characteristic two there is also a nonidentity unipotent odd point. -/
example : OddInvolutionEquation (1 : ZMod 2) 1 0 := by
  norm_num [OddInvolutionEquation]

/-- Trace zero alone does not give an involution. -/
example : ¬ OddInvolutionEquation (0 : ℚ) 1 0 := by
  norm_num [OddInvolutionEquation]

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

/-- At `q = 11`, a primitive order-25 inertia value paired with one admits no Frobenius
matrix (README 2.15), despite its trivial reduction over `ℤ₅[ζ₂₅]`. -/
example {F : Type*} [Field F] (ζ : F) (hζ : orderOf ζ = 25) :
    ¬ ∃ Φ : Matrix (Fin 2) (Fin 2) F,
      IsTameMatrixPair 11 Φ !![1, 0; 0, ζ] := by
  sorry

/-- The same order-25 datum is already impossible in rank one (README 2.15). -/
example {F : Type*} [Field F] (ζ : F) (hζ : orderOf ζ = 25) :
    ¬ ∃ Φ : Matrix (Fin 1) (Fin 1) F, IsTameMatrixPair 11 Φ !![ζ] := by
  sorry

/-- Order-five values satisfy the split-character Frobenius condition at `q = 11`
and give a tame pair with distinct inertia eigenvalues (README 2.15). -/
example {F : Type*} [Field F] (ζ : F) (hζ : orderOf ζ = 5) :
    IsTameMatrixPair 11 (1 : Matrix (Fin 2) (Fin 2) F) !![1, 0; 0, ζ] ∧ ζ ≠ 1 := by
  sorry

/-- The order-25 reciprocal eigenvalues fail Frobenius stability even in `GL₄`,
so cannot define the fixed-similitude type of README 2.22. -/
example {F : Type*} [Field F] (ζ : F) (hζ : orderOf ζ = 25) :
    ¬ ∃ Φ : Matrix (Fin 4) (Fin 4) F,
      IsTameMatrixPair 11 Φ (Matrix.diagonal ![ζ, ζ ^ 2, ζ⁻¹ ^ 2, ζ⁻¹]) := by
  sorry

/-- Order-five reciprocal eigenvalues give a tame symplectic pair in the anti-diagonal
Gram convention, with four distinct inertia eigenvalues (README 2.22). -/
example {F : Type*} [Field F] (ζ : F) (hζ : orderOf ζ = 5) :
    let σ : Matrix (Fin 4) (Fin 4) F := Matrix.diagonal ![ζ, ζ ^ 2, ζ⁻¹ ^ 2, ζ⁻¹]
    let J : Matrix (Fin 4) (Fin 4) F :=
      !![0, 0, 0, 1; 0, 0, 1, 0; 0, -1, 0, 0; -1, 0, 0, 0]
    IsTameMatrixPair 11 1 σ ∧ σ.transpose * J * σ = J ∧
      Function.Injective (![ζ, ζ ^ 2, ζ⁻¹ ^ 2, ζ⁻¹] : Fin 4 → F) := by
  sorry

/-- Trivial Frobenius and inertia satisfy the tame equation. -/
example (q : ℕ) : IsTameMatrixPair q (1 : Matrix (Fin n) (Fin n) A) 1 := by
  simp [IsTameMatrixPair]

/-- At `p=7`, `K=ℚ₁₃`, reciprocal nontrivial inertia characters give a finite tame pair
with cyclotomic multiplier and zero inertia invariants. Thus this representation fails
the inertia-fixed plane requirement of type P and its minimal branch (README 2.7, 2.25). -/
example :
    let σ : Matrix (Fin 4) (Fin 4) (ZMod 7) := Matrix.diagonal ![2, 2, 4, 4]
    let Φ : Matrix (Fin 4) (Fin 4) (ZMod 7) := Matrix.diagonal ![6, 6, 1, 1]
    let J : Matrix (Fin 4) (Fin 4) (ZMod 7) :=
      !![0, 0, 1, 0; 0, 0, 0, 1; -1, 0, 0, 0; 0, -1, 0, 0]
    IsTameMatrixPair 13 Φ σ ∧ σ ^ 3 = 1 ∧ σ ≠ 1 ∧ Φ ^ 2 = 1 ∧
      IsUnit ((13 : ZMod 7) - 1) ∧ σ.transpose * J * σ = J ∧
      Φ.transpose * J * Φ = (6 : ZMod 7) • J ∧
      ∀ v : Fin 4 → ZMod 7, σ.mulVec v = v → v = 0 := by
  sorry

/-- A nontrivial unipotent pair records the direction of the arithmetic exponent. -/
example : IsTameMatrixPair 2 (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ)
    !![1, 1; 0, 1] := by
  sorry

/-- Zero inertia is not a group element, even when the multiplication equation vanishes. -/
example : ¬ IsTameMatrixPair 2 (1 : Matrix (Fin 1) (Fin 1) ℚ) 0 := by
  simp [IsTameMatrixPair]

/-- Rank-two Steinberg Frobenius has the eigenvalue relation with arithmetic ratio `q`. -/
def SteinbergFrobRelation (q : ℕ) (Φ : Matrix (Fin 2) (Fin 2) A) : Prop :=
  (q : A) * Matrix.trace Φ ^ 2 = (1 + (q : A)) ^ 2 * Matrix.det Φ

/-- The actual diagonal Frobenius matrix satisfies the relation. -/
example (q : ℕ) (α : A) : SteinbergFrobRelation q !![α, 0; 0, (q : A) * α] := by
  simp [SteinbergFrobRelation, Matrix.trace_fin_two, Matrix.det_fin_two]
  ring

/-- Unramified scalar Frobenius need not satisfy the Steinberg condition. -/
example : ¬ SteinbergFrobRelation 2 (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  norm_num [SteinbergFrobRelation, Matrix.trace_fin_two, Matrix.det_fin_two]

/-- The nontrivial quadratic finite inertia datum extends with arithmetic Frobenius. -/
example : IsTameMatrixPair 3 (1 : Matrix (Fin 1) (Fin 1) ℚ) !![-1] ∧
    (!![-1] : Matrix (Fin 1) (Fin 1) ℚ) ^ 2 = 1 ∧
    (!![-1] : Matrix (Fin 1) (Fin 1) ℚ) ≠ 1 := by
  sorry

/-- Finite inertia image alone does not give a Weil extension: scalar Frobenius
cannot conjugate the primitive cube root two in F₇ to its square. -/
example : (!![2] : Matrix (Fin 1) (Fin 1) (ZMod 7)) ^ 3 = 1 ∧
    ¬ ∃ Φ : Matrix (Fin 1) (Fin 1) (ZMod 7), IsTameMatrixPair 2 Φ !![2] := by
  sorry

/-- For q=11 scalar Frobenius satisfies the split-chain tame data but fails
its rank-two Steinberg equation. -/
example : IsTameMatrixPair 11 (1 : Matrix (Fin 2) (Fin 2) ℚ) 1 ∧
    ¬ SteinbergFrobRelation 11 (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  constructor
  · simp [IsTameMatrixPair]
  · norm_num [SteinbergFrobRelation, Matrix.trace_fin_two, Matrix.det_fin_two]

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

/-- Zero nilpotent gives the identity group element and its logarithm is zero. -/
example : modifiedExp (0 : Matrix (Fin 4) (Fin 4) A) = 1 := by
  simp [modifiedExp]

/-- The logarithm of the identity is zero. -/
example : modifiedLog (1 : Matrix (Fin 4) (Fin 4) A) = 0 := by
  simp [modifiedLog]

/-- In characteristic three the arithmetic Frobenius exponent two has nonzero cubic correction. -/
example : (modifiedPowerCoefficient 2 : ZMod 3) = 1 := by
  decide

/-- Exponent one has no cubic correction. -/
example : modifiedPowerCoefficient 1 = 0 := by
  norm_num [modifiedPowerCoefficient]

/-- A regular nilpotent makes the characteristic-three cubic term visible on the matrix itself. -/
example (N : Matrix (Fin 4) (Fin 4) (ZMod 3)) (hN : N ^ 4 = 0) (hN3 : N ^ 3 ≠ 0) :
    (2 : ZMod 3) • N + (modifiedPowerCoefficient 2 : ZMod 3) • N ^ 3 ≠
      (2 : ZMod 3) • N := by
  sorry

/-- The square-zero corner matrix used by the rank-four logarithm controls. -/
def cornerNilpotent : Matrix (Fin 4) (Fin 4) A :=
  Matrix.of fun i j => if i = 0 ∧ j = 3 then 1 else 0

/-- Square-zero inertia retains its nonzero linear term in the modified exponential. -/
example : modifiedExp (cornerNilpotent : Matrix (Fin 4) (Fin 4) A) =
    1 + cornerNilpotent := by
  have h2 : (cornerNilpotent : Matrix (Fin 4) (Fin 4) A) ^ 2 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [pow_two, cornerNilpotent, Matrix.mul_apply]
  have h3 : (cornerNilpotent : Matrix (Fin 4) (Fin 4) A) ^ 3 = 0 := by
    rw [pow_succ, h2, zero_mul]
  simp [modifiedExp, h2, h3]

/-- The modified logarithm of the square-zero unipotent is its corner matrix. -/
example : modifiedLog (1 + cornerNilpotent : Matrix (Fin 4) (Fin 4) A) =
    cornerNilpotent := by
  have h2 : (cornerNilpotent : Matrix (Fin 4) (Fin 4) A) ^ 2 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [pow_two, cornerNilpotent, Matrix.mul_apply]
  simp [modifiedLog, h2]

/-- The regular rank-four Jordan nilpotent retains its nonzero square and cube. -/
def regularJordan : Matrix (Fin 4) (Fin 4) ℚ :=
  Matrix.of fun i j => if i.val + 1 = j.val then 1 else 0

/-- A regular unipotent's logarithm has a nonzero quadratic correction. -/
example [Invertible (2 : ℚ)] :
    modifiedLog (1 + regularJordan) = regularJordan - (1 / 2 : ℚ) • regularJordan ^ 2 ∧
    modifiedLog (1 + regularJordan) ≠ regularJordan := by
  constructor
  · simp [modifiedLog, invOf_eq_inv]
  · intro h
    have he := congrArg (fun M : Matrix (Fin 4) (Fin 4) ℚ => M 0 2) h
    norm_num [modifiedLog, regularJordan, pow_two, Matrix.mul_apply,
      Fin.sum_univ_succ, invOf_eq_inv] at he

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

/-- Three distinct jumps give the rank-three full flag dimension. -/
example : filtrationFlagDimension [1, 1, 1] = 3 := by
  decide

/-- Repeating a jump changes the partial flag dimension. -/
example : filtrationFlagDimension [2, 1] = 2 := by
  decide

/-- A scalar filtration has no flag parameter. -/
example : filtrationFlagDimension [3] = 0 := by
  decide

end FiltrationProfile

/-! ## Layer 4: Finite-flat and Barsotti–Tate geometry

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

/-- The identity point of a field lies on its sole component. -/
example : Connects (RingHom.id ℚ) (RingHom.id ℚ) := by
  sorry

/-- The two projections of a product of fields lie on separate components. -/
example : ¬ Connects (RingHom.fst ℚ ℚ) (RingHom.snd ℚ ℚ) := by
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
have no common component; unconditional transitivity therefore fails. -/
example :
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

/-- A height factor with constant coefficient in the coefficient ideal is a unit
in the completed étale carrier. The completion uses that ideal, not the series variable. -/
theorem etale_height_factor_isUnit (I : Ideal R) (hI : I.FG) (a : R) (ha : a ∈ I) :
    IsUnit (AdicCompletion.of (I.map (algebraMap R (LaurentSeries R))) (LaurentSeries R)
      (HahnSeries.single (1 : ℤ) (1 : R) + HahnSeries.C a)) := by
  sorry

/-- Integral positive height does not imply invertibility in ordinary Laurent series. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsUnit (HahnSeries.single (1 : ℤ) (1 : PadicInt p) +
      HahnSeries.C (p : PadicInt p) : LaurentSeries (PadicInt p)) := by
  sorry

/-- At each Artinian level the height factor has a finite geometric-series inverse. -/
example (p n : ℕ) [Fact p.Prime] (hn : 0 < n) :
    IsUnit (HahnSeries.single (1 : ℤ) (1 : ZMod (p ^ n)) +
      HahnSeries.C (p : ZMod (p ^ n)) : LaurentSeries (ZMod (p ^ n))) := by
  sorry

/-- The compatible Artinian inverses make the height factor a unit in the completed ring. -/
example (p : ℕ) [Fact p.Prime] :
    IsUnit (AdicCompletion.of
      ((Ideal.span {(p : PadicInt p)}).map
        (algebraMap (PadicInt p) (LaurentSeries (PadicInt p))))
      (LaurentSeries (PadicInt p))
      (HahnSeries.single (1 : ℤ) (1 : PadicInt p) + HahnSeries.C (p : PadicInt p))) := by
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

/-- A residual diagonal entry detects the actual cubic determinant relation. -/
example : (Matrix.det
    (identityFrobenius (1 : ℤ) 0 0 0 0 0 0 0 0 1 1 1)).coeff 2 = 1 := by
  norm_num [identityFrobenius, Matrix.det_fin_three, Matrix.cons_val_succ,
    Matrix.cons_val_zero, Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons,
    Polynomial.coeff_X, Polynomial.coeff_X_pow, Polynomial.coeff_mul_X,
    Polynomial.coeff_X_mul]

/-- Killing coefficient `v²` alone does not kill coefficient `v`. -/
example : (Matrix.det
    (identityFrobenius (0 : ℤ) 1 0 0 0 1 1 0 0 1 1 1)).coeff 2 = 0 ∧
    (Matrix.det (identityFrobenius (0 : ℤ) 1 0 0 0 1 1 0 0 1 1 1)).coeff 1 = 1 := by
  norm_num [identityFrobenius, Matrix.det_fin_three, Matrix.cons_val_succ,
    Matrix.cons_val_zero, Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons,
    Polynomial.coeff_X, Polynomial.coeff_X_pow, Polynomial.coeff_mul_X,
    Polynomial.coeff_X_mul]

/-- The base identity chart has determinant `v³`, with no extra lower coefficient. -/
example : Matrix.det (identityFrobenius (0 : ℤ) 0 0 0 0 0 0 0 0 1 1 1) =
    Polynomial.X ^ 3 := by
  simp [identityFrobenius, Matrix.det_fin_three, pow_succ]


end IdentityChart

section MinimalTypeControl

/- The following polynomial identities hold over the displayed coefficient rings. Their
interpretation as weight-labelled minimal-type components uses README 6.21's 10-generic
semisimple residual data and nonzero type quotient. -/

/-- The matching formula for the minimal-type `γαγ` chart fixes the coefficient `-1-b+c`.
At these constants the printed `1-b+c` instead gives a nonzero value. -/
example :
    (-1 - 24 + 0 : ZMod 79) * 1 * 1 - (-1 - 12 + 0) * 1 * 8 = 0 ∧
    (-1 - 24 + 0 : ZMod 79) * 1 * 1 - (1 - 12 + 0) * 1 * 8 = 63 := by
  decide

/-- With c33=T the corrected gamma-alpha-gamma product vanishes, whereas the
conflicting coefficient gives the nonzero series 63*T^3. -/
example :
    let T : PowerSeries (ZMod 79) := PowerSeries.X
    T * ((-1 - 24 + 0) * T * T - (-1 - 12 + 0) * 1 * (8 * T ^ 2)) = 0 ∧
    T * ((-1 - 24 + 0) * T * T - (1 - 12 + 0) * 1 * (8 * T ^ 2)) = 63 * T ^ 3 ∧
    (63 : PowerSeries (ZMod 79)) * T ^ 3 ≠ 0 := by
  sorry

/-- With c33=0 the product vanishes even when its second factor is nonzero. -/
example :
    let T : PowerSeries (ZMod 79) := PowerSeries.X
    (0 : PowerSeries (ZMod 79)) *
      ((-1 - 24 + 0) * T * T - (-1 - 12 + 0) * 1 * T) = 0 ∧
    ((-1 - 24 + 0) * T * T - (-1 - 12 + 0) * 1 * T) ≠ 0 := by
  sorry

end MinimalTypeControl

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

/-- Scalar Frobenius permits the repeated eigenvalue one. -/
example : OrdinaryEigenvalueEquation (0 : ℤ) 0 := by
  norm_num [OrdinaryEigenvalueEquation]

/-- Over a nonreduced coefficient ring the same scalar root can have a nonzero nilpotent shift. -/
example : OrdinaryEigenvalueEquation (0 : ZMod 9) 3 := by
  unfold OrdinaryEigenvalueEquation
  decide

/-- A unit shift is not an eigenvalue of scalar Frobenius. -/
example : ¬ OrdinaryEigenvalueEquation (0 : ZMod 9) 1 := by
  unfold OrdinaryEigenvalueEquation
  decide

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
Distinct character functions are enough; no one group element need separate all their values. -/
theorem det_ordinary_iff_ordered_triangularization {F : Type*} [Field F]
    (ρ : G →* GL (Fin n) F) (χ : Fin n → G →* Fˣ)
    (hn : 0 < n) (hχ : Function.Injective χ) :
    IsDetOrdinary ρ χ ↔ HasOrderedTriangularization ρ χ := by
  sorry

/-- In rank one the full determinant-ordinary equations identify the actual character. -/
example (ρ : G →* GL (Fin 1) A) (χ : Fin 1 → G →* Aˣ) :
    IsDetOrdinary ρ χ ↔
      ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) A) 0 0 = ((χ 0 g : Aˣ) : A) := by
  sorry

/-- Rank-one triangularization is the same character equality, over any coefficient ring. -/
example (ρ : G →* GL (Fin 1) A) (χ : Fin 1 → G →* Aˣ) :
    HasOrderedTriangularization ρ χ ↔
      ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) A) 0 0 = ((χ 0 g : Aˣ) : A) := by
  sorry

/-- An explicit invertible matrix from a specified two-sided inverse. -/
def controlMatrixUnit (M N : Matrix (Fin 2) (Fin 2) A)
    (hMN : M * N = 1) (hNM : N * M = 1) : GL (Fin 2) A :=
  ⟨M, N, hMN, hNM⟩

/-- The diagonal rank-two representation of the product of unit groups. -/
def diagonalControlRep : (Aˣ × Aˣ) →* GL (Fin 2) A where
  toFun g := controlMatrixUnit !![(g.1 : A), 0; 0, (g.2 : A)]
    !![(↑g.1⁻¹ : A), 0; 0, (↑g.2⁻¹ : A)] (by sorry) (by sorry)
  map_one' := by sorry
  map_mul' := by sorry

/-- The two diagonal characters in their specified order. -/
def diagonalControlCharacters : Fin 2 → (Aˣ × Aˣ) →* Aˣ :=
  ![MonoidHom.fst Aˣ Aˣ, MonoidHom.snd Aˣ Aˣ]

/-- The actual diagonal group representation satisfies both ordered conditions. -/
example : IsDetOrdinary (diagonalControlRep (A := A)) diagonalControlCharacters ∧
    HasOrderedTriangularization (diagonalControlRep (A := A)) diagonalControlCharacters := by
  sorry

/-- Generators of a nonsplit rank-two extension over Q: diagonal(2,1) and a unipotent. -/
def orderedExtensionGenerators : Fin 2 → GL (Fin 2) ℚ :=
  ![controlMatrixUnit !![2, 0; 0, 1] !![1 / 2, 0; 0, 1] (by sorry) (by sorry),
    controlMatrixUnit !![1, 1; 0, 1] !![1, -1; 0, 1] (by sorry) (by sorry)]

/-- The nonsplit extension as a representation of the free group on the two generators. -/
def orderedExtensionRep : FreeGroup (Fin 2) →* GL (Fin 2) ℚ :=
  FreeGroup.lift orderedExtensionGenerators

/-- The extension's diagonal character followed by its trivial quotient character. -/
def orderedExtensionCharacters : Fin 2 → FreeGroup (Fin 2) →* ℚˣ :=
  ![FreeGroup.lift ![⟨2, 1 / 2, by norm_num, by norm_num⟩, 1], 1]

/-- The upper extension has the prescribed ordered flag and determinant products. -/
example : HasOrderedTriangularization orderedExtensionRep orderedExtensionCharacters ∧
    IsDetOrdinary orderedExtensionRep orderedExtensionCharacters := by
  sorry

/-- Reversing the order in a nonsplit extension destroys both ordered conditions. -/
example :
    ¬ HasOrderedTriangularization orderedExtensionRep
      (fun i => orderedExtensionCharacters (1 - i)) ∧
    ¬ IsDetOrdinary orderedExtensionRep (fun i => orderedExtensionCharacters (1 - i)) := by
  sorry

/-- Nilpotently shifted reciprocal characters of the cyclic free group over Z/9. -/
def nilpotentShiftCharacters : Fin 2 → FreeGroup Unit →* (ZMod 9)ˣ :=
  ![FreeGroup.lift (fun _ => ⟨4, 7, by decide, by decide⟩),
    FreeGroup.lift (fun _ => ⟨7, 4, by decide, by decide⟩)]

/-- Over Z/9 the scalar representation satisfies determinant-ordinary equations for
nilpotently shifted characters, but has no direct-summand flag with those characters. -/
example :
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

/-- The family contains `M=diag(4,7)`. -/
example : z9Family 1 0 = !![4, 0; 0, 7] := by
  decide

/-- It also contains the unipotent `U` with upper-right entry one. -/
example : z9Family 0 1 = !![1, 1; 0, 1] := by
  decide

/-- The ordered product is nonzero even though both characteristic polynomials are `(X−1)²`. -/
example : (z9Family 1 0 - 1) * (z9Family 0 1 - 1) = !![0, 3; 0, 0] ∧
    (z9Family 1 0 - 1) * (z9Family 0 1 - 1) ≠ 0 := by
  decide

/-- The invertible generators M=diag(4,7) and U of the nonreduced subgroup. -/
def z9Generators : Fin 2 → GL (Fin 2) (ZMod 9) :=
  ![controlMatrixUnit (z9Family 1 0) (z9Family 2 0) (by decide) (by decide),
    controlMatrixUnit (z9Family 0 1) (z9Family 0 (-1)) (by decide) (by decide)]

/-- The actual subgroup generated by M and U. -/
def z9Subgroup : Subgroup (GL (Fin 2) (ZMod 9)) :=
  Subgroup.closure (Set.range z9Generators)

/-- Every subgroup element has the repeated-root polynomial, but the subgroup
representation fails determinant-ordinarity for the two trivial characters. -/
example :
    (∀ g : z9Subgroup, (g.val : Matrix (Fin 2) (Fin 2) (ZMod 9)).charpoly =
      (Polynomial.X - 1) ^ 2) ∧
    ¬ IsDetOrdinary z9Subgroup.subtype (fun _ : Fin 2 => 1) := by
  sorry

end NonreducedControl

/-! ## Layer 8: Selected local conditions and global exports -/

section TraceControl

/-- In characteristic two scalar endomorphisms have trace zero, while trace on all
endomorphisms is surjective. Scalar splitting cannot identify fixed-determinant strict
classes with `H¹(ad⁰)` in this case. -/
example : Matrix.trace (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) = 0 ∧
    Matrix.trace (!![1, 0; 0, 0] : Matrix (Fin 2) (Fin 2) (ZMod 2)) = 1 := by
  decide

/-- The two-scalar Taylor–Wiles inertia direction has determinant derivative zero;
ramifying only the selected line has nonzero determinant derivative. -/
example : Matrix.trace (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) (ZMod 5)) = 0 ∧
    Matrix.trace (!![1, 0; 0, 0] : Matrix (Fin 2) (Fin 2) (ZMod 5)) = 1 := by
  decide

end TraceControl

section NodalRing

variable (A : Type*) [CommRing A]

/-- The actual integral formal node appearing in the selected rank-two branches. -/
noncomputable def nodalIdeal (π u : A) : Ideal (MvPowerSeries (Fin 2) A) :=
  Ideal.span {MvPowerSeries.X 0 * MvPowerSeries.X 1 - MvPowerSeries.C (π * u)}

/-- Its ring retains the node equation, rather than only its number of variables. -/
abbrev NodalRing (π u : A) := MvPowerSeries (Fin 2) A ⧸ nodalIdeal A π u

/-- The integral node over a DVR is a flat domain when its constant term is nonzero and nonunit. -/
theorem nodal_ring_flat_domain [IsDomain A] [IsDiscreteValuationRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] (π u : A)
    (hπ : π ≠ 0) (hπnonunit : ¬ IsUnit π) (hu : IsUnit u) :
    IsDomain (NodalRing A π u) ∧ Module.Flat A (NodalRing A π u) := by
  sorry

/-- With zero constant term the actual quotient contains the two coordinate branches. -/
example : nodalIdeal ℚ 0 1 =
    Ideal.span {MvPowerSeries.X (0 : Fin 2) * MvPowerSeries.X 1} := by
  simp [nodalIdeal]

/-- A unit constant term makes the formal equation a unit and the quotient the zero ring. -/
example : nodalIdeal ℚ 1 1 = ⊤ := by
  sorry

/-- With zero constant term the two nonzero coordinate classes have zero product. -/
example : ∃ x y : NodalRing ℚ 0 1, x ≠ 0 ∧ y ≠ 0 ∧ x * y = 0 := by
  sorry

end NodalRing

/-!
The README also specifies the following constructions with their full geometric carriers.

Layer F: `ModDef`, `ModDefFramed`, `DetDef`, `PseudoDefRing`, `univLift`,
`DeformationProblem` and inertia-rigid deformation rings. Empty type quotients are excluded
from `DeformationProblem`. Their README-only APIs include
`isSchur_baseChange` (F.1.8) and `phiP_iff_fg` (F.2.1).
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
The finite-flat condition and its Fontaine–Laffaille tangent calculation use
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.7.
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
