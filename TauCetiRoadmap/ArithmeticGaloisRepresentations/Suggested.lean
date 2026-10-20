import Mathlib
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.RepresentationTheory.CharacterTwist
import TauCeti.RepresentationTheory.SymmetricPower
import TauCeti.RepresentationTheory.ExteriorPower
import TauCeti.RepresentationTheory.Tensor.Power
import TauCeti.RepresentationTheory.Tensor.Induction
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Cyclotomic.Character
import TauCeti.NumberTheory.LocalField.Unramified.Inertia.Basic
import TauCeti.NumberTheory.LocalField.WildInertia
import TauCeti.NumberTheory.LocalField.Tame.PadicCharacter
import TauCeti.NumberTheory.LocalField.Teichmuller
import TauCeti.Algebra.CentralSimple.Index
import TauCeti.LinearAlgebra.GeneralLinearGroup.Unipotent
import TauCeti.NumberTheory.NumberField.Frobenius.Restriction
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.Torsion.Structure

/-!
# Arithmetic Galois representations and conductors: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap. Section references `§k.n` are to `README.md`.

Design choices made explicit here.

* EtaleCohomologyFoundations §F.4.0 owns `ContinuousRep`, `Iso`, `ofCharacter`, `baseChange`
  and the stable-lattice/integral-model foundation. The carrier, isomorphism, character,
  scalar-extension, lattice and restricted-action declarations below are local realizations of
  that supplied interface for consumer signatures, not additional construction targets.
  Mathlib's `ContRepresentation` only requires continuity of each operator; the supplied
  carrier requires a jointly continuous action and the finite-projective module topology.
* EtaleCohomologyFoundations §F.3a owns the henselian-trait/local-field tame-character
  comparison and its conjugation/restriction laws. Section 2.1a transports it to chosen
  global decomposition groups.
* PadicMeasuresIwasawaAlgebras §5.1 owns the rank-decomposed invertible determinant line
  and its endomorphism maps; EtaleCohomologyFoundations §F.10.3 owns their scalar realization.
  Section 1.1 evaluates this scalar on representation operators, proves continuity and the
  representation-operation comparisons, and identifies the free-complement and split-retract
  formulas with it. Its bundled `ContinuousRep.detLineRep` is specified in the README;
  the exterior and rank-two adjoint isomorphisms retain this line's carrier. The scalar-action
  statements below use free carriers, where the supplied scalar is `LinearMap.det ∘ ρ`.
* Frobenius is arithmetic: Tau Ceti's `TauCeti.IsArithFrobeniusLift` locally, Mathlib's
  `AlgHom.IsArithFrobAt` on the integral closure of `𝓞 F` in `F̄` globally
  (`GaloisRep.IsArithFrobAtIntegralPrime`). The local inertia and wild inertia subgroups are Tau
  Ceti's `TauCeti.inertiaSubgroup`, `TauCeti.wildInertiaSubgroup`; the `ℓ`-adic cyclotomic character
  is Tau Ceti's `TauCeti.continuousLocalCyclotomicCharacter`, and the `ℓ`-adic tame character is
  `TauCeti.inertiaPadicTameCharacter`.
* SmoothRepresentationsOfLocalGroups SR.5.2 supplies `wd-linear-substrate`, `nilpotent-exp-log`,
  `grothendieck-monodromy`, `wd-parameter-operations`, `full-wd-construction`,
  `wd-frobenius-semisimplification` and `classical-llc-normalization`. Section 2.4 specializes
  monodromy to `ContinuousRep` and packages its underlying action through the supplied full
  construction; §2.5 owns the agreement theorem and local factors.
  An arithmetic lift has degree `1` and relation `r(w) ∘ N = q^{deg w} • (N ∘ r(w))`;
  dual monodromy is `−Nᵗ`. The consumers below take these fields and their relation directly.
  Local factors use geometric Frobenius. The full functor and its inverse precede
  Frobenius semisimplification; the latter gives the supplier's normalized output.
* Data whose construction is a theorem (semisimplification, the Weil–Deligne representation of an
  `ℓ`-adic representation, conductors, local constants, Tate modules of abelian varieties) are README
  targets and do not appear here.
  Section 2.7 defines character constants and root numbers by finite Gauss sums, restates the
  supplied finite-order Hecke equation, and constructs local constants through finite-order
  globalisation and Brauer induction. AutomorphicLFunctionsAndLocalFactors AL.1's
  `hecke-l-functional-equation` is the all-unitary scalar endpoint from AL.2's Godement–Jacquet
  theorem at rank one. AutomorphicSpectralTheory §1.15c's `unitary-hecke-functional-equation`
  gives its Eisenstein construction; their conductor-balanced completions agree on the
  convergence half-plane and hence as meromorphic germs, with §2.7's Gauss-sum root number.
-/

noncomputable section

open scoped TensorProduct DirectSum

namespace TauCetiRoadmap.ArithmeticGaloisRepresentations

universe u u' v v' w w'

namespace LinearMap

/-- Consumer realization of AdicSpacesPartIII §R3.8 projective-trace-realization.
Provides the contraction trace used by the §7.2 alias; the supplier owns its categorical comparison. -/
def projectiveTrace (R : Type*) [CommRing R] (N : Type*) [AddCommGroup N] [Module R N]
    [Module.Finite R N] [Module.Projective R N] : Module.End R N →ₗ[R] R :=
  contractLeft R N ∘ₗ (dualTensorHomEquiv R N N).symm.toLinearMap

/-- Concrete scalar realization of AdicSpacesPartIII §R3.8 projective-module-trace.
Provides finite-free compatibility with Mathlib's linear trace through the contraction formula. -/
theorem projectiveTrace_eq_trace {R : Type*} [CommRing R] {N : Type*} [AddCommGroup N]
    [Module R N] [Module.Finite R N] [Module.Projective R N] [Module.Free R N] :
    projectiveTrace R N = _root_.LinearMap.trace R N := by
  exact (_root_.LinearMap.trace_eq_contract' R N).symm

end LinearMap

/-! ## Layer 1: continuous representations and integral models -/

/-- Consumer realization of EtaleCohomologyFoundations §F.4.0's shared representation carrier:
a finite-projective module with its module topology and jointly continuous action (§1.1). -/
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

/-- Morphisms of continuous representations: `Γ`-equivariant `A`-linear maps (automatically
continuous for the module topologies, `Hom.continuous`). -/
structure Hom (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) where
  /-- The underlying linear map. -/
  toLinearMap : M →ₗ[A] N
  /-- Equivariance. -/
  comm : ∀ g : Γ, toLinearMap ∘ₗ ρ g = σ g ∘ₗ toLinearMap

/-- Consumer realization of the equivariant isomorphisms supplied by
EtaleCohomologyFoundations §F.4.0. -/
structure Iso (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) where
  /-- The underlying linear equivalence. -/
  toLinearEquiv : M ≃ₗ[A] N
  /-- Equivariance. -/
  comm : ∀ (g : Γ) (m : M), toLinearEquiv (ρ g m) = σ g (toLinearEquiv m)

/-- The characteristic polynomial `det(X − ρ(g))`, for a free carrier. -/
def charpoly [Module.Free A M] (ρ : ContinuousRep Γ A M) (g : Γ) : Polynomial A :=
  (ρ g).charpoly

/-- Consumer realization of EtaleCohomologyFoundations §F.4.0's rank-one character action. -/
def ofCharacter [IsTopologicalRing A] (χ : Γ →ₜ* Aˣ) : ContinuousRep Γ A A where
  toRepresentation :=
    { toFun g := (χ g : A) • LinearMap.id
      map_one' := sorry
      map_mul' := sorry }
  continuous_action := sorry

/-- The trivial representation on `M`. -/
def trivial : ContinuousRep Γ A M := ⟨Representation.trivial A Γ M, sorry⟩

/-- Restriction along a continuous homomorphism `φ : Γ' → Γ` (open or closed subgroups,
decomposition groups, `G_L → G_K`). -/
def res {Γ' : Type u'} [Group Γ'] [TopologicalSpace Γ'] (φ : Γ' →ₜ* Γ)
    (ρ : ContinuousRep Γ A M) : ContinuousRep Γ' A M :=
  ⟨ρ.toRepresentation.comp φ.toMonoidHom, sorry⟩

/-- The underlying Mathlib `ContRepresentation`: each `ρ(g)` is continuous for the module
topology. -/
def toContRepresentation [IsTopologicalRing A] [IsTopologicalAddGroup M]
    (ρ : ContinuousRep Γ A M) : ContRepresentation A Γ M :=
  .ofMonoidHom
    { toFun g := { toLinearMap := ρ.toRepresentation g, cont := sorry }
      map_one' := sorry
      map_mul' := sorry }

/-- `ContinuousRep Γ A M` embeds in Mathlib's `ContRepresentation A Γ M`, with image the jointly
continuous ones (§1.1). -/
theorem toContRepresentation_injective [IsTopologicalRing A] [IsTopologicalAddGroup M] :
    Function.Injective (toContRepresentation : ContinuousRep Γ A M → ContRepresentation A Γ M) ∧
      Set.range (toContRepresentation : ContinuousRep Γ A M → ContRepresentation A Γ M) =
        {π | Continuous fun p : Γ × M => π p.1 p.2} := by
  sorry

/-- Every morphism of continuous representations is continuous. -/
theorem Hom.continuous [IsTopologicalRing A] {ρ : ContinuousRep Γ A M} {σ : ContinuousRep Γ A N}
    (f : ρ.Hom σ) : Continuous f.toLinearMap := by
  sorry

/-- For a carrier with a finite basis, joint continuity is continuity of the matrix coefficients
`Γ → M_n(A)`. -/
theorem continuous_iff_matrixCoeff [IsTopologicalRing A] {ι : Type*} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι A M) (ρ : Representation A Γ M) :
    (Continuous fun p : Γ × M => ρ p.1 p.2) ↔
      Continuous fun g => LinearMap.toMatrix b b (ρ g) := by
  sorry

/-- Joint continuity is continuity of all the orbit maps `g ↦ ρ(g) m`. -/
theorem continuous_iff_orbit [IsTopologicalRing A] (ρ : Representation A Γ M) :
    (Continuous fun p : Γ × M => ρ p.1 p.2) ↔ ∀ m : M, Continuous fun g : Γ => ρ g m := by
  sorry

/-- On a finite free carrier the determinant operators form a unique continuous unit-valued
character, the free-carrier realization of the determinant character of §1.1. -/
theorem exists_detCharacter [IsTopologicalRing A] [Module.Free A M]
    (ρ : ContinuousRep Γ A M) :
    ∃! χ : Γ →ₜ* Aˣ, ∀ g : Γ, (χ g : A) = LinearMap.det (ρ g) := by
  sorry

-- Over a field with the discrete topology a faithful representation of `ℤ_ℓ` (for instance
-- `a ↦ (1 + ℓ)^a` on `ℚ_ℓ` made discrete) has every operator continuous but is not a
-- `ContinuousRep`: its kernel `{0}` is not open in `ℤ_ℓ`.
/-- A faithful action of the additive p-adic integers on a discrete field does not have jointly continuous action. -/
theorem faithful_discrete_padic_not_continuous (ℓ : ℕ) [Fact ℓ.Prime] (K : Type) [Field K] [TopologicalSpace K] [DiscreteTopology K]
    (ρ : Representation K (Multiplicative ℤ_[ℓ]) K) (hρ : Function.Injective ρ) :
    ¬ ∃ r : ContinuousRep (Multiplicative ℤ_[ℓ]) K K, r.toRepresentation = ρ := by
  sorry

-- The characteristic polynomial of a character at `g` is `X − χ(g)`; on the zero carrier every
-- operator has determinant `1`.
/-- Characters have linear characteristic polynomial and the zero carrier has determinant one. -/
theorem charpoly_character_and_det_zero [IsTopologicalRing A] [Nontrivial A] (χ : Γ →ₜ* Aˣ) (g : Γ) :
    (ofCharacter χ).charpoly g = Polynomial.X - Polynomial.C (χ g : A) ∧
      LinearMap.det ((trivial : ContinuousRep Γ A (Fin 0 → A)) g) = 1 := by
  sorry

end Basic

/-! ### Framed representations `Γ → GL_n(A)` -/

section Framed

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]

/-- The continuous representation on `A^n` attached to a continuous homomorphism
`ρ : Γ → GL_n(A)` (units topology). -/
def ofFramed {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    ContinuousRep Γ A (Fin n → A) :=
  ⟨(Matrix.toLinAlgEquiv'.toRingEquiv.toMonoidHom :
      Matrix (Fin n) (Fin n) A →* Module.End A (Fin n → A)).comp
      ((Units.coeHom _).comp ρ.toMonoidHom), sorry⟩

/-- Framed representations give isomorphic continuous representations iff they are
`GL_n(A)`-conjugate, conjugacy over `A` itself and not over a larger ring. -/
theorem ofFramed_iso_iff {n : ℕ} (ρ ρ' : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    Nonempty (Iso (ofFramed ρ) (ofFramed ρ')) ↔
      ∃ P : Matrix.GeneralLinearGroup (Fin n) A, ∀ h : Γ, ρ' h = P * ρ h * P⁻¹ := by
  sorry

/-- Change of coefficients of a framed representation along a continuous ring homomorphism
(entrywise). -/
def Framed.map {B : Type v'} [CommRing B] [TopologicalSpace B] (f : A →+* B) (_hf : Continuous f)
    {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) B :=
  { (Matrix.GeneralLinearGroup.map f).comp ρ.toMonoidHom with continuous_toFun := sorry }

-- `(1 a; 0 1)` and `(1 ℓa; 0 1)` on `ℤ_ℓ²` are conjugate over `ℚ_ℓ` but not over `ℤ_ℓ`.
/-- The standard unipotent lattices are conjugate over the fraction field but not over the valuation ring. -/
theorem unipotent_integral_conjugacy_obstruction (ℓ : ℕ) [Fact ℓ.Prime]
    (ρ₁ ρ₂ : Multiplicative ℤ_[ℓ] →ₜ* Matrix.GeneralLinearGroup (Fin 2) ℤ_[ℓ])
    (h₁ : ∀ a, (ρ₁ a : Matrix (Fin 2) (Fin 2) ℤ_[ℓ]) = !![1, Multiplicative.toAdd a; 0, 1])
    (h₂ : ∀ a, (ρ₂ a : Matrix (Fin 2) (Fin 2) ℤ_[ℓ]) =
      !![1, (ℓ : ℤ_[ℓ]) * Multiplicative.toAdd a; 0, 1]) :
    (∃ P : Matrix.GeneralLinearGroup (Fin 2) ℚ_[ℓ], ∀ a,
      (ρ₂ a : Matrix (Fin 2) (Fin 2) ℤ_[ℓ]).map ((↑) : ℤ_[ℓ] → ℚ_[ℓ]) =
        (P : Matrix (Fin 2) (Fin 2) ℚ_[ℓ]) *
          (ρ₁ a : Matrix (Fin 2) (Fin 2) ℤ_[ℓ]).map ((↑) : ℤ_[ℓ] → ℚ_[ℓ]) *
          ((P⁻¹ : Matrix.GeneralLinearGroup (Fin 2) ℚ_[ℓ]) : Matrix (Fin 2) (Fin 2) ℚ_[ℓ])) ∧
      ¬ ∃ P : Matrix.GeneralLinearGroup (Fin 2) ℤ_[ℓ], ∀ a, ρ₂ a = P * ρ₁ a * P⁻¹ := by
  sorry

-- In rank one a framed representation is a character; in rank zero there is exactly one.
/-- Rank-one framed representations give characters and the rank-zero framed representation is unique. -/
theorem framed_rank_one_and_zero (χ : Γ →ₜ* Aˣ) (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 1) A)
    (h : ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) A) 0 0 = χ g)
    (ρ₀ ρ₀' : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 0) A) :
    Nonempty (Iso (ofFramed ρ) (ofCharacter χ)) ∧ ρ₀ = ρ₀' := by
  sorry

end Framed

/-! ### Extension of coefficients -/

section BaseChange

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- Consumer realization of EtaleCohomologyFoundations §F.4.0's scalar extension on the module
`B ⊗_A M` with its module topology and underlying `Representation.baseChange` action. -/
def baseChange (ρ : ContinuousRep Γ A M)
    (B : Type v') [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
    [ContinuousSMul A B] [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] :
    ContinuousRep Γ B (B ⊗[A] M) :=
  ⟨Representation.baseChange B ρ.toRepresentation, sorry⟩

variable (B : Type v') [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
  [ContinuousSMul A B]

/-- For a free carrier, `charpoly ρ_B(g) = (charpoly ρ(g)).map (A → B)`. -/
@[simp]
theorem charpoly_baseChange [Module.Free A M] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] (g : Γ) :
    (ρ.baseChange B).charpoly g = (ρ.charpoly g).map (algebraMap A B) := by
  sorry

/-- For an extension of topological fields `K ⊂ K'`, `(V_{K'})^Γ = K' ⊗_K V^Γ`; the statement is
algebraic. -/
theorem invariants_baseChange {K : Type v} [Field K] [TopologicalSpace K] [IsTopologicalRing K]
    {V : Type w} [AddCommGroup V] [Module K V] [FiniteDimensional K V] [TopologicalSpace V]
    [IsModuleTopology K V] (ρ : ContinuousRep Γ K V)
    (K' : Type v') [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)] [IsModuleTopology K' (K' ⊗[K] V)] :
    Nonempty ((ρ.baseChange K').toRepresentation.invariants ≃ₗ[K']
      K' ⊗[K] ρ.toRepresentation.invariants) := by
  sorry

/-- Scalar extension preserves the entire intertwiner space of finite-dimensional
representations, for an arbitrary acting monoid (§1.2). -/
theorem intertwining_baseChange {G : Type*} [Monoid G] {K : Type*} [Field K]
    {V W : Type*} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (ρ : Representation K G V) (σ : Representation K G W)
    (K' : Type*) [Field K'] [Algebra K K'] :
    Nonempty ((K' ⊗[K] (ρ.IntertwiningMap σ)) ≃ₗ[K']
      (ρ.baseChange K').IntertwiningMap (σ.baseChange K')) := by
  sorry

-- Base change along the identity changes nothing; along a discontinuous map to a discrete field
-- the cyclotomic character of `G_ℚ` is not a `ContinuousRep`.
/-- Extension along the identity coefficient algebra gives an isomorphic continuous representation. -/
theorem baseChange_self_iso (ρ : ContinuousRep Γ A M) [TopologicalSpace (A ⊗[A] M)]
    [IsModuleTopology A (A ⊗[A] M)] : Nonempty (Iso (ρ.baseChange A) ρ) := by
  sorry

/-- Extension of cyclotomic coefficients to a discrete characteristic-zero field fails joint continuity. -/
theorem cyclotomic_discrete_baseChange_obstruction (ℓ : ℕ) [Fact ℓ.Prime] (B : Type) [Field B] [TopologicalSpace B] [DiscreteTopology B]
    [Algebra ℚ_[ℓ] B] :
    ¬ ∃ r : ContinuousRep (Field.absoluteGaloisGroup ℚ) B B, ∀ g b,
      r g b = algebraMap ℚ_[ℓ] B
        ((TauCeti.continuousLocalCyclotomicCharacter ℓ ℚ g : ℤ_[ℓ]) : ℚ_[ℓ]) * b := by
  sorry

end BaseChange

/-! ### Duals, tensor products, Hom, twists and direct sums -/

section Operations

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]
  {N : Type w'} [AddCommGroup N] [Module A N] [Module.Finite A N] [Module.Projective A N]
  [TopologicalSpace N] [IsModuleTopology A N]

/-- The tensor product `M ⊗_A N` with the diagonal action. -/
def tensor (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [Module.Finite A (M ⊗[A] N)] [Module.Projective A (M ⊗[A] N)]
    [TopologicalSpace (M ⊗[A] N)] [IsModuleTopology A (M ⊗[A] N)] :
    ContinuousRep Γ A (M ⊗[A] N) :=
  ⟨ρ.toRepresentation.tprod σ.toRepresentation, sorry⟩

/-- The dual `M^∨ = Hom_A(M, A)` with `(g λ)(m) = λ(g⁻¹ m)`, so evaluation is invariant. -/
def dual (ρ : ContinuousRep Γ A M) [Module.Finite A (Module.Dual A M)]
    [Module.Projective A (Module.Dual A M)] [TopologicalSpace (Module.Dual A M)]
    [IsModuleTopology A (Module.Dual A M)] : ContinuousRep Γ A (Module.Dual A M) :=
  ⟨ρ.toRepresentation.dual, sorry⟩

/-- The convention of the dual: inverse transpose. -/
theorem dual_apply (ρ : ContinuousRep Γ A M) [Module.Finite A (Module.Dual A M)]
    [Module.Projective A (Module.Dual A M)] [TopologicalSpace (Module.Dual A M)]
    [IsModuleTopology A (Module.Dual A M)] (g : Γ) (f : Module.Dual A M) (m : M) :
    ρ.dual g f m = f (ρ g⁻¹ m) := by
  sorry

/-- The internal Hom `Hom_A(M, N)` with `g · f = ρ_N(g) ∘ f ∘ ρ_M(g)⁻¹` (Mathlib's
`Representation.linHom`). -/
def hom (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)] :
    ContinuousRep Γ A (M →ₗ[A] N) :=
  ⟨ρ.toRepresentation.linHom σ.toRepresentation, sorry⟩

/-- `Hom_A(M, N)^Γ = Hom_Γ(M, N)`: a linear map is invariant iff it is equivariant. -/
theorem mem_invariants_hom_iff (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)] (f : M →ₗ[A] N) :
    f ∈ (ρ.hom σ).toRepresentation.invariants ↔ ∀ g : Γ, f ∘ₗ ρ g = σ g ∘ₗ f := by
  sorry

/-- The twist `M(χ)` by a continuous character, realised on `M` with `g ↦ χ(g) ρ(g)`: Tau Ceti's
`Representation.charTwist`. -/
def twist (ρ : ContinuousRep Γ A M) (χ : Γ →ₜ* Aˣ) : ContinuousRep Γ A M :=
  ⟨Representation.charTwist χ.toMonoidHom ρ.toRepresentation, sorry⟩

/-- `M(χ) ≅ M ⊗_A A(χ)`. -/
theorem nonempty_iso_twist_tensor (ρ : ContinuousRep Γ A M) (χ : Γ →ₜ* Aˣ)
    [Module.Finite A (M ⊗[A] A)] [Module.Projective A (M ⊗[A] A)]
    [TopologicalSpace (M ⊗[A] A)] [IsModuleTopology A (M ⊗[A] A)] :
    Nonempty (Iso (ρ.twist χ) (ρ.tensor (ofCharacter χ))) := by
  sorry

/-- `M(χ)(ψ) = M(χψ)`. -/
theorem twist_twist (ρ : ContinuousRep Γ A M) (χ ψ χψ : Γ →ₜ* Aˣ)
    (h : ∀ g, χψ g = χ g * ψ g) : (ρ.twist χ).twist ψ = ρ.twist χψ := by
  sorry

/-- The direct sum `M ⊕ N` (as `M × N`). -/
def directSum (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) : ContinuousRep Γ A (M × N) :=
  ⟨ρ.toRepresentation.prod σ.toRepresentation, sorry⟩

/-- `Hom_A(M, N) ≅ M^∨ ⊗_A N`. -/
theorem nonempty_iso_hom_dual_tensor (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)]
    [Module.Finite A (Module.Dual A M)] [Module.Projective A (Module.Dual A M)]
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)]
    [Module.Finite A (Module.Dual A M ⊗[A] N)] [Module.Projective A (Module.Dual A M ⊗[A] N)]
    [TopologicalSpace (Module.Dual A M ⊗[A] N)] [IsModuleTopology A (Module.Dual A M ⊗[A] N)] :
    Nonempty (Iso (ρ.hom σ) (ρ.dual.tensor σ)) := by
  sorry

/-- Restriction commutes with coefficient extension. -/
theorem res_baseChange {Γ' : Type u'} [Group Γ'] [TopologicalSpace Γ']
    (φ : Γ' →ₜ* Γ) (ρ : ContinuousRep Γ A M)
    (B : Type v') [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
    [ContinuousSMul A B] [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] :
    (ρ.baseChange B).res φ = (ρ.res φ).baseChange B := by
  sorry

-- For a free carrier of rank `n` twisting multiplies the determinant by `χ^n`; twisting by the
-- trivial character changes nothing.
/-- Twisting scales the determinant by the character to the rank and the trivial twist is the identity. -/
theorem det_twist_and_twist_one [Module.Free A M] (ρ : ContinuousRep Γ A M) (χ : Γ →ₜ* Aˣ) (g : Γ) :
    LinearMap.det ((ρ.twist χ) g) = (χ g : A) ^ Module.finrank A M * LinearMap.det (ρ g) ∧
      ρ.twist 1 = ρ := by
  sorry

-- `g ↦ ρ(g)ᵀ` is not multiplicative on `GL₂(F₂) ≅ S₃`: the dual needs the inverse transpose.
/-- Transpose alone fails multiplicativity for the natural rank-two residual image over F₂. -/
theorem transpose_not_multiplicative : ¬ ∀ g h : Matrix.GeneralLinearGroup (Fin 2) (ZMod 2),
    Matrix.transpose ((g * h : Matrix.GeneralLinearGroup (Fin 2) (ZMod 2)) :
        Matrix (Fin 2) (Fin 2) (ZMod 2)) =
      Matrix.transpose (g : Matrix (Fin 2) (Fin 2) (ZMod 2)) *
        Matrix.transpose (h : Matrix (Fin 2) (Fin 2) (ZMod 2)) := by
  sorry

-- `hom` carries Mathlib's `Representation.linHom`.
omit [IsTopologicalGroup Γ] [IsTopologicalRing A] in
/-- The continuous internal Hom carries the supplied algebraic Hom action. -/
theorem hom_toRepresentation (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)] :
    (ρ.hom σ).toRepresentation = ρ.toRepresentation.linHom σ.toRepresentation :=
  rfl

end Operations

/-! ### The Tate twist `ℤ_ℓ(1)` -/

namespace TateTwist

variable {F : Type*} [Field F] {A : Type v} [CommRing A] [TopologicalSpace A]
  [IsTopologicalRing A] {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M]
  [Module.Projective A M] [TopologicalSpace M] [IsModuleTopology A M]

/-- `ℤ_ℓ(1) := ℤ_ℓ(χ_ℓ)` for the `ℓ`-adic cyclotomic character of `G_F`
(`TauCeti.continuousLocalCyclotomicCharacter`). -/
def zlOne (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] :
    ContinuousRep (Field.absoluteGaloisGroup F) ℤ_[ℓ] ℤ_[ℓ] :=
  ofCharacter (TauCeti.continuousLocalCyclotomicCharacter ℓ F)

/-- The character `χ_ℓ^n`, valued in `Aˣ` for a topological `ℤ_ℓ`-algebra `A`. -/
def cyclotomicPow (ℓ : ℕ) [Fact ℓ.Prime] [Algebra ℤ_[ℓ] A] [ContinuousSMul ℤ_[ℓ] A] (n : ℤ) :
    Field.absoluteGaloisGroup F →ₜ* Aˣ :=
  { toMonoidHom := ((Units.map (algebraMap ℤ_[ℓ] A).toMonoidHom).comp
      (TauCeti.localCyclotomicCharacter ℓ F)) ^ n
    continuous_toFun := sorry }

/-- The Tate twist `M(n) := M(χ_ℓ^n)`. -/
def tateTwist (ℓ : ℕ) [Fact ℓ.Prime] [Algebra ℤ_[ℓ] A] [ContinuousSMul ℤ_[ℓ] A]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (n : ℤ) :
    ContinuousRep (Field.absoluteGaloisGroup F) A M :=
  ρ.twist (cyclotomicPow ℓ n)

variable (ℓ : ℕ) [Fact ℓ.Prime] [Algebra ℤ_[ℓ] A] [ContinuousSMul ℤ_[ℓ] A]

theorem tateTwist_add (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (m n : ℤ) :
    tateTwist ℓ (tateTwist ℓ ρ m) n = tateTwist ℓ ρ (m + n) := by
  sorry

theorem tateTwist_zero (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) :
    tateTwist ℓ ρ 0 = ρ := by
  sorry

/-- `M(n)^∨ ≅ M^∨(−n)`. -/
theorem nonempty_iso_dual_tateTwist (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (n : ℤ)
    [Module.Finite A (Module.Dual A M)] [Module.Projective A (Module.Dual A M)]
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)] :
    Nonempty (Iso (tateTwist ℓ ρ n).dual (tateTwist ℓ ρ.dual (-n))) := by
  sorry

-- In characteristic `ℓ` the cyclotomic character is trivial; this is why `ℓ ≠ char F` is a
-- standing hypothesis for `ℤ_ℓ(1)`.
/-- The cyclotomic character in the characteristic of the base field is trivial. -/
theorem cyclotomic_eq_one_in_characteristic (F : Type*) [Field F] [CharP F ℓ] (g : Field.absoluteGaloisGroup F) :
    TauCeti.localCyclotomicCharacter ℓ F g = 1 := by
  sorry

-- On a free carrier of rank `r`, `det M(n) = det M · χ_ℓ^{n r}`.
/-- The determinant of a Tate twist is scaled by the cyclotomic character to the twist times the rank. -/
theorem det_tateTwist [Module.Free A M] (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (n : ℤ)
    (g : Field.absoluteGaloisGroup F) :
    LinearMap.det ((tateTwist ℓ ρ n) g) =
      ((cyclotomicPow ℓ (n * Module.finrank A M) g : Aˣ) : A) * LinearMap.det (ρ g) := by
  sorry

end TateTwist

/-! ### Induction from open subgroups -/

section Induction

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {U : Type w} [AddCommGroup U] [Module A U] [Module.Finite A U] [Module.Projective A U]
  [TopologicalSpace U] [IsModuleTopology A U]
  {M : Type w'} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- The inclusion of an open subgroup as a continuous homomorphism. -/
def openSubtype (H : OpenSubgroup Γ) : H →ₜ* Γ where
  toFun x := x.1
  map_one' := rfl
  map_mul' _ _ := rfl
  continuous_toFun := continuous_subtype_val

/-- The carrier of `Ind_H^Γ U`: the functions `f : Γ → U` with `f(h x) = σ(h) f(x)`, Mathlib's
`Representation.coindV` along `H → Γ`. -/
abbrev IndV (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) : Type _ :=
  Representation.coindV (openSubtype H).toMonoidHom σ.toRepresentation

/-- The induced representation `Ind_H^Γ U`, `(g f)(x) = f(x g)`, given the finiteness, projectivity
and module topology of its carrier (which hold for `Γ` compact, `IndV.finite`). -/
def ind (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) [Module.Finite A (IndV H σ)]
    [Module.Projective A (IndV H σ)] [TopologicalSpace (IndV H σ)]
    [IsModuleTopology A (IndV H σ)] : ContinuousRep Γ A (IndV H σ) :=
  ⟨Representation.coind (openSubtype H).toMonoidHom σ.toRepresentation, sorry⟩

/-- For `Γ` compact the carrier of `Ind_H^Γ U` is finitely generated projective of rank
`[Γ : H] · rank U`. -/
theorem IndV.finite [CompactSpace Γ] (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) :
    Module.Finite A (IndV H σ) ∧ Module.Projective A (IndV H σ) ∧
      ([Module.Free A U] → Module.finrank A (IndV H σ) =
        (H : Subgroup Γ).index * Module.finrank A U) := by
  sorry

variable (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) [Module.Finite A (IndV H σ)]
  [Module.Projective A (IndV H σ)] [TopologicalSpace (IndV H σ)]
  [IsModuleTopology A (IndV H σ)]

/-- The action on the function model: `(g f)(x) = f(x g)`. -/
theorem ind_apply (g : Γ) (f : IndV H σ) (x : Γ) :
    ((ind H σ g f : IndV H σ) : Γ → U) x = (f : Γ → U) (x * g) := by
  sorry

/-- For a right transversal `(t_i)` of `H` in `Γ` (`Γ = ⊔ H t_i`), `f ↦ (f(t_i))_i` is an
isomorphism onto `U^m`. -/
theorem exists_indEquivPi {m : ℕ} (t : Fin m → Γ) (ht : Function.Injective t)
    (hc : Subgroup.IsComplement (H : Set Γ) (Set.range t)) :
    ∃ e : IndV H σ ≃ₗ[A] (Fin m → U), ∀ f i, e f i = (f : Γ → U) (t i) := by
  sorry

/-- Frobenius reciprocity: `Hom_Γ(M, Ind U) ≃ Hom_H(Res M, U)` and `Hom_Γ(Ind U, M) ≃ Hom_H(U, Res M)`
(the second because `H` has finite index). -/
theorem nonempty_indResEquiv [CompactSpace Γ] (ρ : ContinuousRep Γ A M) :
    Nonempty (ρ.Hom (ind H σ) ≃ (ρ.res (openSubtype H)).Hom σ) ∧
      Nonempty ((ind H σ).Hom ρ ≃ σ.Hom (ρ.res (openSubtype H))) := by
  sorry

/-- Shapiro on invariants: `(Ind_H^Γ U)^Γ ≃ U^H`, `f ↦ f(1)`. -/
theorem exists_invariantsIndEquiv :
    ∃ e : (ind H σ).toRepresentation.invariants ≃ₗ[A] σ.toRepresentation.invariants,
      ∀ f, (e f : U) = ((f : IndV H σ) : Γ → U) 1 := by
  sorry

/-- The projection formula `Ind(Res M ⊗ U) ≅ M ⊗ Ind U`. -/
theorem nonempty_iso_ind_tensor_res (ρ : ContinuousRep Γ A M)
    [Module.Finite A (M ⊗[A] U)] [Module.Projective A (M ⊗[A] U)]
    [TopologicalSpace (M ⊗[A] U)] [IsModuleTopology A (M ⊗[A] U)]
    [Module.Finite A (IndV H ((ρ.res (openSubtype H)).tensor σ))]
    [Module.Projective A (IndV H ((ρ.res (openSubtype H)).tensor σ))]
    [TopologicalSpace (IndV H ((ρ.res (openSubtype H)).tensor σ))]
    [IsModuleTopology A (IndV H ((ρ.res (openSubtype H)).tensor σ))]
    [Module.Finite A (M ⊗[A] IndV H σ)] [Module.Projective A (M ⊗[A] IndV H σ)]
    [TopologicalSpace (M ⊗[A] IndV H σ)] [IsModuleTopology A (M ⊗[A] IndV H σ)] :
    Nonempty (Iso (ind H ((ρ.res (openSubtype H)).tensor σ)) (ρ.tensor (ind H σ))) := by
  sorry

/-- An `H`-equivariant function `Γ → U` is continuous (`Γ` compact, `H` open); evaluation at a
right transversal is a homeomorphism from the equivariant elements of `C(Γ, U)` onto `U^m`, so the
module topology of `IndV` is the compact-open one of Mathlib's `ContRepresentation.coind`. -/
theorem continuous_of_equivariant [CompactSpace Γ] (f : Γ → U)
    (hf : ∀ (h : H) (x : Γ), f ((h : Γ) * x) = σ h (f x)) : Continuous f := by
  sorry

/-- For `H` open of index `m` and a free `U` of rank `r`:
`det Ind_H^Γ U = sgn_{Γ/H}^r · (det U ∘ Ver)`, with Mathlib's transfer (Deligne 1973, Prop. 1.2). -/
theorem det_ind [Module.Free A U] [Module.Free A (IndV H σ)]
    [(H : Subgroup Γ).FiniteIndex] [Fintype (Γ ⧸ (H : Subgroup Γ))]
    [DecidableEq (Γ ⧸ (H : Subgroup Γ))] (g : Γ) :
    LinearMap.det ((ind H σ) g) =
      ((Equiv.Perm.sign (MulAction.toPermHom Γ (Γ ⧸ (H : Subgroup Γ)) g) : ℤ) : A) ^
          Module.finrank A U *
        ((MonoidHom.transfer (H := (H : Subgroup Γ))
          (LinearMap.det.comp σ.toRepresentation).toHomUnits g : Aˣ) : A) := by
  sorry

-- The underlying representation is Mathlib's `Representation.coind`.
omit [IsTopologicalGroup Γ] [IsTopologicalRing A] in
/-- Continuous induction has the supplied algebraic induced representation as underlying action. -/
theorem ind_toRepresentation : (ind H σ).toRepresentation =
    Representation.coind (openSubtype H).toMonoidHom σ.toRepresentation :=
  rfl

end Induction

-- For the closed subgroup `{0}` of `ℤ_ℓ` the module of all functions `ℤ_ℓ → K` is not finitely
-- generated: induction needs `H` open.
/-- Induction from the zero closed subgroup of the p-adic integers has an infinite-dimensional function carrier. -/
theorem closed_subgroup_induction_not_finite (ℓ : ℕ) [Fact ℓ.Prime] (K : Type) [Field K] :
    ¬ Module.Finite K (Multiplicative ℤ_[ℓ] → K) := by
  sorry

/-- The Mackey decomposition, in the function model: for `H` open and `D` closed in a compact
`Γ`, `H\Γ/D` is finite, and for representatives `s` of the double cosets
`Res_D Ind_H^Γ U ≅ ⊕_{HsD} Ind_{D_s}^D (Res U^s)`, `D_s = D ∩ s⁻¹Hs` (NT, proof of Lemma 3.7(3)).
The abstract isomorphism is Tau Ceti's `Rep.mackeyDecomposition`. -/
theorem finite_doubleCoset_mackey {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] (H : OpenSubgroup Γ) (D : Subgroup Γ)
    (hD : IsClosed (D : Set Γ)) : Finite (DoubleCoset.Quotient (H : Set Γ) (D : Set Γ)) := by
  sorry

/-! ### Discrete and complex coefficients, descent of coefficients -/

/-- For discrete `A`: joint continuity ⇔ open stabilisers ⇔ open kernel ⇔ factorisation through
`Γ/N`, `N` open normal; the image is then finite. A continuous `Γ → GL_n(ℂ)` has open kernel and
finite image (no small subgroups). -/
theorem continuous_iff_isOpen_ker {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ]
    {A : Type v} [CommRing A] [TopologicalSpace A] [DiscreteTopology A]
    {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M] (ρ : Representation A Γ M) :
    List.TFAE
        [∃ r : ContinuousRep Γ A M, r.toRepresentation = ρ,
          ∀ m : M, IsOpen {g : Γ | ρ g m = m},
          IsOpen (ρ.ker : Set Γ),
          ∃ N : Subgroup Γ, N.Normal ∧ IsOpen (N : Set Γ) ∧ N ≤ ρ.ker] ∧
      (IsOpen (ρ.ker : Set Γ) → (Set.range ρ).Finite) ∧
      ∀ (n : ℕ) (r : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) ℂ),
        IsOpen (r.toMonoidHom.ker : Set Γ) ∧ (Set.range r).Finite := by
  sorry

/-- In a real normed algebra, a subgroup of the units within distance `r < 1` of `1` is trivial. -/
theorem subgroup_units_eq_bot_of_norm_sub_one_le {R : Type*} [NormedRing R]
    [NormedAlgebra ℝ R] (G : Subgroup Rˣ) (r : ℝ) (hr : r < 1)
    (h : ∀ g ∈ G, ‖((g : Rˣ) : R) - 1‖ ≤ r) : G = ⊥ := by
  sorry

/-- A continuous `ρ : Γ → GL_n(F̄_p)` (discrete topology) has finite image, and its matrix entries
generate a finite subfield `k`, so `ρ` takes values in `GL_n(k)` (Serre 1987, 1.1). -/
theorem residual_descent_finite_field {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] (p : ℕ) [Fact p.Prime]
    [TopologicalSpace (AlgebraicClosure (ZMod p))]
    [DiscreteTopology (AlgebraicClosure (ZMod p))] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (AlgebraicClosure (ZMod p))) :
    (Set.range ρ).Finite ∧ ∃ k : Subfield (AlgebraicClosure (ZMod p)), Finite k ∧
      ∀ (g : Γ) (i j : Fin n),
        (ρ g : Matrix (Fin n) (Fin n) (AlgebraicClosure (ZMod p))) i j ∈ k := by
  sorry

/-- A continuous `ρ : Γ → GL_n(Q̄_ℓ)` of a compact Hausdorff group takes values in `GL_n(E)` for a
subfield `E ⊂ Q̄_ℓ` finite over `ℚ_ℓ` (Baire category; BHKT, proof of Thm 4.8). -/
theorem baire_descent {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ] [T2Space Γ] (ℓ : ℕ) [Fact ℓ.Prime] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (PadicAlgCl ℓ)) :
    ∃ E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ), FiniteDimensional ℚ_[ℓ] E ∧
      ∀ (g : Γ) (i j : Fin n), (ρ g : Matrix (Fin n) (Fin n) (PadicAlgCl ℓ)) i j ∈ E := by
  sorry

/-- The subfields of `Q̄_ℓ` finite over `ℚ_ℓ` are countably many, closed, and each is generated over
`ℚ_ℓ` by an element algebraic over `ℚ`. -/
theorem countable_coefficientFields (ℓ : ℕ) [Fact ℓ.Prime] :
    {E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ) | FiniteDimensional ℚ_[ℓ] E}.Countable ∧
      (∀ E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ), FiniteDimensional ℚ_[ℓ] E →
        IsClosed (E : Set (PadicAlgCl ℓ))) ∧
      ∀ E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ), FiniteDimensional ℚ_[ℓ] E →
        ∃ β : PadicAlgCl ℓ, IsAlgebraic ℚ β ∧ E = IntermediateField.adjoin ℚ_[ℓ] {β} := by
  sorry

/-- A continuous `ρ : Γ → GL_n(Q̄_ℓ)` of a compact Hausdorff group is conjugate to a representation
with values in `GL_n(O_E)` for a coefficient field `E ⊂ Q̄_ℓ`. -/
theorem exists_integral_conj_GL {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ] (ℓ : ℕ) [Fact ℓ.Prime] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (PadicAlgCl ℓ)) :
    ∃ (E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ))
        (P : Matrix.GeneralLinearGroup (Fin n) (PadicAlgCl ℓ)),
      FiniteDimensional ℚ_[ℓ] E ∧ ∀ (g : Γ) (i j : Fin n),
        ((P * ρ g * P⁻¹ : Matrix.GeneralLinearGroup (Fin n) (PadicAlgCl ℓ)) :
          Matrix (Fin n) (Fin n) (PadicAlgCl ℓ)) i j ∈ E ∧
        ‖((P * ρ g * P⁻¹ : Matrix.GeneralLinearGroup (Fin n) (PadicAlgCl ℓ)) :
          Matrix (Fin n) (Fin n) (PadicAlgCl ℓ)) i j‖ ≤ 1 := by
  sorry

end ContinuousRep

/-! ### Supplied integral-model interface for reduction

EtaleCohomologyFoundations §F.4.0 owns the stable-lattice criterion, model existence,
generic-fibre comparison, homotheties, saturation, duality and commensurability.
The declarations here realize only the carrier and restricted action used in §1.9.
-/

/-- Consumer realization of EtaleCohomologyFoundations §F.4.0's stable integral model:
a finitely generated `O`-lattice spanning `V`, with its invariant action (§1.6). -/
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
  {O : Type v} [CommRing O] [TopologicalSpace O]
  {E : Type v} [Field E] [TopologicalSpace E] [Algebra O E]
  {V : Type w} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
  {ρ : ContinuousRep Γ E V}

instance (Λ : IntegralModel O ρ) : Module.Finite O Λ.lattice :=
  Module.Finite.iff_fg.mpr Λ.fg

/-- A finite lattice over a DVR is free when its ambient field is the fraction field (§1.6). -/
instance (Λ : IntegralModel O ρ) [IsDomain O] [IsDiscreteValuationRing O]
    [IsFractionRing O E] : Module.Free O Λ.lattice := by
  sorry

/-- A lattice over a DVR with the specified fraction field is projective (§1.6). -/
instance (Λ : IntegralModel O ρ) [IsDomain O] [IsDiscreteValuationRing O]
    [IsFractionRing O E] : Module.Projective O Λ.lattice :=
  Module.Projective.of_free

variable [IsDomain O] [IsDiscreteValuationRing O] [IsFractionRing O E]

/-- Consumer realization of the continuous lattice action supplied by
EtaleCohomologyFoundations §F.4.0, used by reduction in §1.9. -/
def toContinuousRep (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice] :
    ContinuousRep Γ O Λ.lattice :=
  ⟨{ toFun g := ((ρ g).restrictScalars O).restrict (fun x hx => Λ.stable g x hx)
     map_one' := sorry
     map_mul' := sorry }, sorry⟩

end GaloisLattice.IntegralModel

/-! ### Semisimplicity, absolute irreducibility and Brauer–Nesbitt -/

namespace ContinuousRep

section FieldCoefficients

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {K : Type v} [Field K] [TopologicalSpace K] [IsTopologicalRing K]
  {V : Type w} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
  [TopologicalSpace V] [IsModuleTopology K V]
  {W : Type w'} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
  [TopologicalSpace W] [IsModuleTopology K W]

/-- A `Γ`-stable subspace `W`, with the subspace topology, is a continuous representation. -/
def subrep (ρ : ContinuousRep Γ K V) (W : Submodule K V) [IsModuleTopology K W]
    (hW : ∀ g : Γ, W ≤ W.comap (ρ g)) : ContinuousRep Γ K W :=
  ⟨{ toFun g := (ρ g).restrict (hW g)
     map_one' := sorry
     map_mul' := sorry }, sorry⟩

/-- The quotient `V/W` by a `Γ`-stable subspace. -/
def quotientRep (ρ : ContinuousRep Γ K V) (W : Submodule K V)
    (hW : ∀ g : Γ, W ≤ W.comap (ρ g)) : ContinuousRep Γ K (V ⧸ W) :=
  ⟨ρ.toRepresentation.quotient W hW, sorry⟩

/-- Semisimplification has a continuous realization on the original finite-dimensional carrier,
with the same characteristic polynomials; its isomorphism class is uniquely characterized by
these polynomials among semisimple representations (§§1.7–1.8). -/
theorem exists_semisimple_same_charpoly (ρ : ContinuousRep Γ K V) :
    ∃ σ : ContinuousRep Γ K V, σ.toRepresentation.IsSemisimpleRepresentation ∧
      (∀ g : Γ, σ.charpoly g = ρ.charpoly g) ∧
      (Nonempty (Iso ρ σ) ↔ ρ.toRepresentation.IsSemisimpleRepresentation) ∧
      ∀ τ : ContinuousRep Γ K W, τ.toRepresentation.IsSemisimpleRepresentation →
        (∀ g : Γ, τ.charpoly g = ρ.charpoly g) → Nonempty (Iso σ τ) := by
  sorry

/-- Absolute irreducibility over a field of coefficients, in Burnside's form: the carrier is
nonzero and the operators `ρ(g)` span `End_K(V)`; equivalent to irreducibility after every field
extension (§1.7). -/
def IsAbsolutelyIrreducible (ρ : ContinuousRep Γ K V) : Prop :=
  Nontrivial V ∧ Submodule.span K (Set.range fun g : Γ => ρ g) = ⊤

/-- For `V ≠ 0`, absolutely irreducible iff `K̄ ⊗_K V` is irreducible (no topology on `K̄`). -/
theorem isAbsolutelyIrreducible_iff_algebraicClosure [Nontrivial V] (ρ : ContinuousRep Γ K V) :
    ρ.IsAbsolutelyIrreducible ↔
      (Representation.baseChange (AlgebraicClosure K) ρ.toRepresentation).IsIrreducible := by
  sorry

/-- Invariance under extension of the coefficient field. -/
theorem isAbsolutelyIrreducible_baseChange_iff (ρ : ContinuousRep Γ K V)
    (K' : Type v') [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)] [IsModuleTopology K' (K' ⊗[K] V)] :
    (ρ.baseChange K').IsAbsolutelyIrreducible ↔ ρ.IsAbsolutelyIrreducible := by
  sorry

/-- Absolutely irreducible implies irreducible, with scalar `Γ`-endomorphisms. -/
theorem IsAbsolutelyIrreducible.isIrreducible_and_end {ρ : ContinuousRep Γ K V}
    (h : ρ.IsAbsolutelyIrreducible) :
    ρ.toRepresentation.IsIrreducible ∧
      ∀ f : ρ.Hom ρ, ∃ c : K, f.toLinearMap = c • LinearMap.id := by
  sorry

-- Dimension one is absolutely irreducible; the zero representation is not.
/-- A one-dimensional continuous representation is absolutely irreducible. -/
theorem absolutelyIrreducible_of_finrank_one (ρ : ContinuousRep Γ K V) (h : Module.finrank K V = 1) : ρ.IsAbsolutelyIrreducible := by
  sorry

/-- The zero representation is not absolutely irreducible. -/
theorem not_absolutelyIrreducible_zero [Subsingleton V] (ρ : ContinuousRep Γ K V) : ¬ ρ.IsAbsolutelyIrreducible := by
  sorry

-- The rotation by `!![0, -1; 1, 0]` of a cyclic group of order four on `ℚ²` is irreducible but not
-- absolutely irreducible.
/-- The rational cyclic rotation representation is irreducible and fails absolute irreducibility. -/
theorem rotation_irreducible_not_absolute {Γ : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] (γ : Γ)
    (hγ : ∀ x : Γ, ∃ n : ℕ, x = γ ^ n)
    (ρ : ContinuousRep Γ ℚ (Fin 2 → ℚ)) (hρ : LinearMap.toMatrix' (ρ γ) = !![0, -1; 1, 0]) :
    ρ.toRepresentation.IsIrreducible ∧ ¬ ρ.IsAbsolutelyIrreducible := by
  sorry

/-- Over a perfect field the base change of a semisimple representation to any extension is
semisimple (false for imperfect `K`). -/
theorem isSemisimple_baseChange_of_perfectField [PerfectField K] (ρ : ContinuousRep Γ K V)
    (hρ : ρ.toRepresentation.IsSemisimpleRepresentation)
    (K' : Type v') [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)] [IsModuleTopology K' (K' ⊗[K] V)] :
    (ρ.baseChange K').toRepresentation.IsSemisimpleRepresentation := by
  sorry

/-- Brauer–Nesbitt for semisimple representations: equal characteristic polynomials at every group
element give an isomorphism of continuous representations, over any field (DDT, Prop. 2.6). The
statement for the semisimplifications of arbitrary `V`, `W` is §1.8. -/
theorem iso_of_charpoly_eq (ρ : ContinuousRep Γ K V) (σ : ContinuousRep Γ K W)
    (hρ : ρ.toRepresentation.IsSemisimpleRepresentation)
    (hσ : σ.toRepresentation.IsSemisimpleRepresentation)
    (h : ∀ g : Γ, (ρ g).charpoly = (σ g).charpoly) : Nonempty (Iso ρ σ) := by
  sorry

/-- Brauer–Nesbitt with traces: if `(dim V)!` is invertible, semisimple representations of the
same dimension with equal traces are isomorphic. -/
theorem iso_of_trace_eq (ρ : ContinuousRep Γ K V) (σ : ContinuousRep Γ K W)
    (hρ : ρ.toRepresentation.IsSemisimpleRepresentation)
    (hσ : σ.toRepresentation.IsSemisimpleRepresentation)
    (hdim : Module.finrank K V = Module.finrank K W)
    (hfact : ((Module.finrank K V).factorial : K) ≠ 0)
    (h : ∀ g : Γ, LinearMap.trace K V (ρ g) = LinearMap.trace K W (σ g)) :
    Nonempty (Iso ρ σ) := by
  sorry

-- The unipotent `ℤ_p`-representation `(1 a; 0 1)` over `F_p` has the characteristic polynomials of
-- the trivial representation without being semisimple: semisimplicity is needed above.
/-- A residual unipotent plane has the characteristic polynomials of a trivial action without semisimplicity. -/
theorem unipotent_not_semisimple (p : ℕ) [Fact p.Prime] [TopologicalSpace (ZMod p)] [DiscreteTopology (ZMod p)]
    {M : Type} [AddCommGroup M] [Module (ZMod p) M] [Module.Finite (ZMod p) M]
    [Module.Free (ZMod p) M] [TopologicalSpace M] [IsModuleTopology (ZMod p) M]
    (b : Module.Basis (Fin 2) (ZMod p) M)
    (ρ : ContinuousRep (Multiplicative ℤ_[p]) (ZMod p) M)
    (hρ : ∀ a, LinearMap.toMatrix b b (ρ a) =
      !![1, PadicInt.toZMod (Multiplicative.toAdd a); 0, 1]) :
    ¬ ρ.toRepresentation.IsSemisimpleRepresentation ∧
      ∀ a, (ρ a).charpoly = (Polynomial.X - 1 : Polynomial (ZMod p)) ^ 2 := by
  sorry

-- For the three-dimensional unipotent Jordan block over `F_p` (`p ≥ 3`) with socle `W`, the sum
-- `soc(V) ⊕ V/soc(V)` is not semisimple: a semisimplification is not obtained in one step.
/-- Splitting off only the socle of a length-three Jordan block does not give its semisimplification. -/
theorem socle_plus_quotient_not_semisimple (p : ℕ) [Fact p.Prime] (hp : 3 ≤ p) [TopologicalSpace (ZMod p)] [DiscreteTopology (ZMod p)]
    {M : Type} [AddCommGroup M] [Module (ZMod p) M] [Module.Finite (ZMod p) M]
    [Module.Free (ZMod p) M] [TopologicalSpace M] [IsModuleTopology (ZMod p) M]
    (b : Module.Basis (Fin 3) (ZMod p) M)
    (ρ : ContinuousRep (Multiplicative ℤ_[p]) (ZMod p) M)
    (hρ : LinearMap.toMatrix b b (ρ (Multiplicative.ofAdd 1)) = !![1, 1, 0; 0, 1, 1; 0, 0, 1])
    (W : Submodule (ZMod p) M) [IsModuleTopology (ZMod p) W]
    (hW₁ : W = ρ.toRepresentation.invariants) (hW : ∀ g, W ≤ W.comap (ρ g)) :
    ¬ ((ρ.subrep W hW).directSum (ρ.quotientRep W hW)).toRepresentation.IsSemisimpleRepresentation := by
  sorry

end FieldCoefficients

end ContinuousRep

/-- Brauer–Nesbitt over an algebraically closed field: semisimple representations with equal traces
have multiplicities agreeing modulo the characteristic, and with equal characteristic polynomials
they are isomorphic (DDT, proof of Prop. 2.6). -/
theorem brauerNesbitt_of_isAlgClosed {k : Type*} [Field k] [IsAlgClosed k] {G : Type*} [Group G]
    {X : Type*} [AddCommGroup X] [Module k X] [FiniteDimensional k X]
    {Y : Type*} [AddCommGroup Y] [Module k Y] [FiniteDimensional k Y]
    (ρ : Representation k G X) (σ : Representation k G Y)
    (hρ : ρ.IsSemisimpleRepresentation) (hσ : σ.IsSemisimpleRepresentation) :
    ((∀ g : G, LinearMap.trace k X (ρ g) = LinearMap.trace k Y (σ g)) →
      ∀ {T : Type*} [AddCommGroup T] [Module k T] [FiniteDimensional k T]
        (τ : Representation k G T), τ.IsIrreducible →
        ((Module.finrank k (τ.IntertwiningMap ρ) : ℕ) : k) =
          ((Module.finrank k (τ.IntertwiningMap σ) : ℕ) : k)) ∧
      ((∀ g : G, (ρ g).charpoly = (σ g).charpoly) →
        ∃ e : X ≃ₗ[k] Y, ∀ (g : G) (x : X), e (ρ g x) = σ g (e x)) := by
  sorry

/-- The residue field of `Q̄_ℓ` is algebraically closed of characteristic `ℓ`, algebraic over
`F_ℓ`. -/
theorem residueField_padicAlgCl (ℓ : ℕ) [Fact ℓ.Prime] :
    IsAlgClosed (IsLocalRing.ResidueField ((PadicAlgCl.valued ℓ).v.valuationSubring)) ∧
      ringChar (IsLocalRing.ResidueField ((PadicAlgCl.valued ℓ).v.valuationSubring)) = ℓ ∧
      ∀ x : IsLocalRing.ResidueField ((PadicAlgCl.valued ℓ).v.valuationSubring),
        ∃ n : ℕ, 0 < n ∧ x ^ (ℓ ^ n) = x := by
  sorry

/-! ### Reduction of an integral model -/

namespace GaloisLattice.IntegralModel

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {O : Type v} [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
  {E : Type v} [Field E] [TopologicalSpace E] [Algebra O E] [IsFractionRing O E]
  {V : Type w} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
  {ρ : ContinuousRep Γ E V}
  [TopologicalSpace (IsLocalRing.ResidueField O)] [DiscreteTopology (IsLocalRing.ResidueField O)]

/-- The reduction `ρ̄_Λ := Λ/𝔪Λ = k ⊗_O Λ`, a continuous representation over the discrete residue
field, with continuous scalar multiplication through the residue map (§1.9). -/
def reduction [IsTopologicalRing O] [ContinuousSMul O (IsLocalRing.ResidueField O)]
    (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)] :
    ContinuousRep Γ (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice) :=
  ⟨Representation.baseChange (IsLocalRing.ResidueField O) Λ.toContinuousRep.toRepresentation,
    sorry⟩

variable [IsTopologicalRing O] [ContinuousSMul O (IsLocalRing.ResidueField O)]
  (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
  [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
  [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]

/-- `charpoly ρ̄_Λ(g)` is the reduction of `charpoly ρ|_Λ(g)`. -/
theorem charpoly_reduction (g : Γ) :
    Λ.reduction.charpoly g = (Λ.toContinuousRep.charpoly g).map (IsLocalRing.residue O) := by
  sorry

/-- Two integral models have reductions with the same characteristic polynomials, hence
(Brauer–Nesbitt) isomorphic semisimplifications. -/
theorem charpoly_reduction_eq (Λ' : IntegralModel O ρ) [IsModuleTopology O Λ'.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ'.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ'.lattice)]
    (g : Γ) : Λ.reduction.charpoly g = Λ'.reduction.charpoly g := by
  sorry

/-- Two lattices in the same representation have continuous semisimple reductions with
isomorphic underlying representations, over the residue field itself (§1.9). -/
theorem residual_semisimple_iso (Λ' : IntegralModel O ρ) [IsModuleTopology O Λ'.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ'.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ'.lattice)] :
    ∃ (σ : ContinuousRep Γ (IsLocalRing.ResidueField O)
        (IsLocalRing.ResidueField O ⊗[O] Λ.lattice))
      (τ : ContinuousRep Γ (IsLocalRing.ResidueField O)
        (IsLocalRing.ResidueField O ⊗[O] Λ'.lattice)),
      σ.toRepresentation.IsSemisimpleRepresentation ∧
      τ.toRepresentation.IsSemisimpleRepresentation ∧
      (∀ g : Γ, σ.charpoly g = Λ.reduction.charpoly g) ∧
      (∀ g : Γ, τ.charpoly g = Λ'.reduction.charpoly g) ∧
      Nonempty (ContinuousRep.Iso σ τ) := by
  sorry

/-- For a finite residue field the reduction has open kernel and finite image. -/
theorem finite_image_reduction [Finite (IsLocalRing.ResidueField O)] :
    IsOpen {g : Γ | Λ.reduction g = LinearMap.id} ∧
      (Set.range fun g : Γ => Λ.reduction g).Finite := by
  sorry

/-- An irreducible residual representation forces all integral models to be homothetic, and a
perfect symmetric or alternating pairing with multiplier `μ` then has `μ` valued in `O^×` and a
self-dual model for `c ⟨ , ⟩`, `c ∈ {1, ϖ}` (CG20, §6.2, proof of Prop. 6.8). -/
theorem integralModel_unique_and_selfDual [CompactSpace Γ] (ϖ : O) (hϖ : Irreducible ϖ)
    (hirr : Λ.reduction.toRepresentation.IsIrreducible) :
    (∀ Λ' : IntegralModel O ρ, ∃ k : ℤ, Λ'.lattice =
      Λ.lattice.map ((((algebraMap O E ϖ) ^ k) • LinearMap.id : V →ₗ[E] V).restrictScalars O)) ∧
    ∀ (B : LinearMap.BilinForm E V), B.Nondegenerate → (B.IsSymm ∨ B.IsAlt) →
      ∀ μ : Γ →ₜ* Eˣ, (∀ g x y, B (ρ g x) (ρ g y) = (μ g : E) * B x y) →
        (∀ g, ∃ u : Oˣ, algebraMap O E u = μ g) ∧
        ∃ (Λ' : IntegralModel O ρ) (c : O), (c = 1 ∨ c = ϖ) ∧
          ∀ y : V, y ∈ Λ'.lattice ↔
            ∀ x ∈ Λ'.lattice, algebraMap O E c * B x y ∈ Set.range (algebraMap O E) := by
  sorry

-- The trivial representation reduces to the trivial representation.
/-- The reduction of a trivial integral action is trivial. -/
theorem reduction_trivial (h : ∀ g : Γ, ρ g = LinearMap.id) (g : Γ) : Λ.reduction g = LinearMap.id := by
  sorry

end GaloisLattice.IntegralModel

-- The reductions of the lattices `ℤ_ℓ²` and `ℤ_ℓ e₁ ⊕ ℓℤ_ℓ e₂` of `(1 a; 0 1)` are not isomorphic
-- (non-split versus trivial): the reduction depends on the lattice.
/-- The two standard unipotent lattices have nonisomorphic raw reductions. -/
theorem unipotent_reductions_not_iso (ℓ : ℕ) [Fact ℓ.Prime] [TopologicalSpace (IsLocalRing.ResidueField ℤ_[ℓ])]
    [DiscreteTopology (IsLocalRing.ResidueField ℤ_[ℓ])]
    [ContinuousSMul ℤ_[ℓ] (IsLocalRing.ResidueField ℤ_[ℓ])]
    (ρ : ContinuousRep (Multiplicative ℤ_[ℓ]) ℚ_[ℓ] (Fin 2 → ℚ_[ℓ]))
    (hρ : ∀ a, LinearMap.toMatrix' (ρ a) =
      !![1, ((Multiplicative.toAdd a : ℤ_[ℓ]) : ℚ_[ℓ]); 0, 1])
    (Λ₁ Λ₂ : GaloisLattice.IntegralModel ℤ_[ℓ] ρ)
    (h₁ : Λ₁.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 1})
    (h₂ : Λ₂.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 (ℓ : ℚ_[ℓ])})
    [IsModuleTopology ℤ_[ℓ] Λ₁.lattice] [IsModuleTopology ℤ_[ℓ] Λ₂.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ₁.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField ℤ_[ℓ])
      (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ₁.lattice)]
    [TopologicalSpace (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ₂.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField ℤ_[ℓ])
      (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ₂.lattice)] :
    IsEmpty (ContinuousRep.Iso Λ₁.reduction Λ₂.reduction) := by
  sorry

/-! ### Coefficient twists and Teichmüller lifts -/

namespace ContinuousRep

section CoeffTwist

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A]

/-- The coefficient twist `ρ^σ` of a framed representation by a continuous ring automorphism `σ`
of `A`: `ρ^σ(g) = σ(ρ(g))` entrywise. -/
def coeffTwist (σ : A ≃+* A) (hσ : Continuous σ) {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A :=
  Framed.map (σ : A →+* A) hσ ρ

/-- Characteristic polynomials and determinants transform by `σ`. -/
theorem charpoly_coeffTwist (σ : A ≃+* A) (hσ : Continuous σ) {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) (g : Γ) :
    (coeffTwist σ hσ ρ g : Matrix (Fin n) (Fin n) A).charpoly =
        (ρ g : Matrix (Fin n) (Fin n) A).charpoly.map (σ : A →+* A) ∧
      (coeffTwist σ hσ ρ g : Matrix (Fin n) (Fin n) A).det =
        σ (ρ g : Matrix (Fin n) (Fin n) A).det := by
  sorry

/-- The residual coefficient Frobenius twist `ρ̄^{(p)} := ρ̄^{Frob_p}` over a perfect field of
characteristic `p` with the discrete topology. -/
def frobTwist (p : ℕ) [Fact p.Prime] {k : Type v} [Field k] [CharP k p] [PerfectRing k p]
    [TopologicalSpace k] [DiscreteTopology k] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) k) : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) k :=
  coeffTwist (frobeniusEquiv k p) continuous_of_discreteTopology ρ

-- A character `χ̄ : Γ → GL₁(F_{p²})` with an element of order `p² − 1` in its image twists to
-- `χ̄^p ≠ χ̄`, although conjugating its argument returns `χ̄`; over `F_p` the twist is trivial.
/-- A character of full quadratic-field order changes under coefficient Frobenius. -/
theorem frobTwist_nontrivial_character (p : ℕ) [Fact p.Prime] [TopologicalSpace (GaloisField p 2)]
    [DiscreteTopology (GaloisField p 2)]
    (χ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 1) (GaloisField p 2))
    (hχ : ∃ g, orderOf (χ g) = p ^ 2 - 1) :
    (∀ g, frobTwist p χ g = χ g ^ p) ∧ (∀ φ g : Γ, χ (φ * g * φ⁻¹) = χ g) ∧ frobTwist p χ ≠ χ := by
  sorry

/-- Coefficient Frobenius fixes every representation defined over the prime field. -/
theorem frobTwist_prime_field (p : ℕ) [Fact p.Prime] [TopologicalSpace (ZMod p)] [DiscreteTopology (ZMod p)] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (ZMod p)) : frobTwist p ρ = ρ := by
  sorry

end CoeffTwist

namespace Teichmuller

open ValuativeRel

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  (K : Type v) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- The Teichmüller lift `[ψ̄] : Γ → 𝒪[K]ˣ` of a residual character with open kernel, through Tau
Ceti's `TauCeti.teichmullerLift` (§1.10). -/
def lift (ψ : Γ →* 𝓀[K]ˣ) (_hψ : IsOpen (ψ.ker : Set Γ)) : Γ →ₜ* 𝒪[K]ˣ :=
  { toMonoidHom := (Units.map (TauCeti.teichmullerLift K).toMonoidHom).comp ψ
    continuous_toFun := sorry }

variable {K} (ψ : Γ →* 𝓀[K]ˣ) (hψ : IsOpen (ψ.ker : Set Γ))

/-- `[ψ̄] mod 𝔪 = ψ̄`. -/
theorem residue_lift (g : Γ) :
    Units.map (IsLocalRing.residue 𝒪[K]).toMonoidHom (lift K ψ hψ g) = ψ g := by
  sorry

/-- Uniqueness among the lifts with values in `μ_{q−1}(𝒪[K])`. -/
theorem eq_lift (χ : Γ →ₜ* 𝒪[K]ˣ) (h1 : ∀ g, χ g ^ (Nat.card 𝓀[K] - 1) = 1)
    (h2 : ∀ g, Units.map (IsLocalRing.residue 𝒪[K]).toMonoidHom (χ g) = ψ g) :
    χ = lift K ψ hψ := by
  sorry

theorem orderOf_lift (g : Γ) : orderOf (lift K ψ hψ g) = orderOf (ψ g) := by
  sorry

-- The lift of the trivial character is trivial.
/-- The Teichmüller lift of the trivial character is trivial. -/
theorem lift_trivial (h1 : IsOpen ((1 : Γ →* 𝓀[K]ˣ).ker : Set Γ)) (g : Γ) :
    lift K (1 : Γ →* 𝓀[K]ˣ) h1 g = 1 := by
  sorry

end Teichmuller

/-- Clifford theory and averaging (§1.12), with `N` the normal core of the open subgroup `H`:
(a) `H` normal and `V` semisimple give `Res_H V` semisimple; (b) `[Γ : H]` invertible and `Res_H V`
semisimple give `V` semisimple; (c) `[H : N]` invertible and `V` semisimple give `Res_H V`
semisimple; (d) `[Γ : N]` invertible and `U` semisimple give `Ind_H^Γ U` semisimple. -/
theorem isSemisimple_res_ind {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ] {K : Type v} [Field K] [TopologicalSpace K] [IsTopologicalRing K]
    {V : Type w} [AddCommGroup V] [Module K V] [FiniteDimensional K V] [TopologicalSpace V]
    [IsModuleTopology K V]
    {U : Type w} [AddCommGroup U] [Module K U] [FiniteDimensional K U] [TopologicalSpace U]
    [IsModuleTopology K U]
    (H : OpenSubgroup Γ) (ρ : ContinuousRep Γ K V) (σ : ContinuousRep H K U)
    [Module.Finite K (IndV H σ)] [Module.Projective K (IndV H σ)]
    [TopologicalSpace (IndV H σ)] [IsModuleTopology K (IndV H σ)] :
    (((H : Subgroup Γ).Normal → ρ.toRepresentation.IsSemisimpleRepresentation →
        (ρ.res (openSubtype H)).toRepresentation.IsSemisimpleRepresentation) ∧
      (IsUnit ((H : Subgroup Γ).index : K) →
        (ρ.res (openSubtype H)).toRepresentation.IsSemisimpleRepresentation →
        ρ.toRepresentation.IsSemisimpleRepresentation) ∧
      (IsUnit (((H : Subgroup Γ).normalCore.relIndex (H : Subgroup Γ) : ℕ) : K) →
        ρ.toRepresentation.IsSemisimpleRepresentation →
        (ρ.res (openSubtype H)).toRepresentation.IsSemisimpleRepresentation) ∧
      (IsUnit ((H : Subgroup Γ).normalCore.index : K) →
        σ.toRepresentation.IsSemisimpleRepresentation →
        (ind H σ).toRepresentation.IsSemisimpleRepresentation)) := by
  sorry

end ContinuousRep

/-! ## Layer 2: decomposition groups, inertia and Weil–Deligne representations -/

open scoped ValuativeRel
open NumberField IsDedekindDomain Polynomial

namespace GaloisRep

/-! ### Places, decomposition and inertia groups, Frobenius -/

section Places

variable (F : Type*) [Field F] [NumberField F]

/-- The action of `σ ∈ G_F` on the integral closure of `𝓞 F` in `F̄`. -/
def toIntegralClosure (σ : Field.absoluteGaloisGroup F) :
    integralClosure (𝓞 F) (AlgebraicClosure F) ≃ₐ[𝓞 F] integralClosure (𝓞 F) (AlgebraicClosure F) :=
  ((show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from σ).restrictScalars (𝓞 F)).mapIntegralClosure

variable {F} in
/-- `σ ∈ G_F` is an arithmetic Frobenius at the prime `Q` of the integral closure of `𝓞 F` in `F̄`:
Mathlib's `AlgHom.IsArithFrobAt` for the action of `σ`, i.e. `σ x ≡ x^{q} mod Q` with `q` the
cardinality of the residue field of `Q ∩ 𝓞 F` (§2.1). -/
def IsArithFrobAtIntegralPrime (σ : Field.absoluteGaloisGroup F)
    (Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F))) : Prop :=
  (toIntegralClosure F σ).toAlgHom.IsArithFrobAt Q

/-- The decomposition group `D_Q = {σ : σ(Q) = Q}` of a prime `Q` of `F̄`. -/
def decompositionGroup (Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F))) :
    Subgroup (Field.absoluteGaloisGroup F) where
  carrier := {σ | Q.comap (toIntegralClosure F σ).toAlgHom = Q}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The inertia group `I_Q = {σ : σ x − x ∈ Q for all x}`; its carrier agrees with
`AddSubgroup.inertia Q.toAddSubgroup` for the integral-closure action (§2.1). -/
def inertiaGroup (Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F))) :
    Subgroup (Field.absoluteGaloisGroup F) where
  carrier := {σ | ∀ x, toIntegralClosure F σ x - x ∈ Q}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- Frobenius lifts at a maximal ideal `Q` above a finite place exist, lie in `D_Q`, and form one
coset of `I_Q`; `D_{σQ} = σ D_Q σ⁻¹`, `I_Q ≤ D_Q`, and `D_Q/I_Q` maps isomorphically onto the
automorphisms of the residue field over `k_v` (§2.1). -/
theorem exists_isArithFrobAt (Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F)))
    [Q.IsMaximal] (hQ : Q.under (𝓞 F) ≠ ⊥) :
    (∃ σ ∈ decompositionGroup F Q, IsArithFrobAtIntegralPrime σ Q) ∧
      (∀ σ σ', IsArithFrobAtIntegralPrime σ Q →
        (IsArithFrobAtIntegralPrime σ' Q ↔ σ' * σ⁻¹ ∈ inertiaGroup F Q)) ∧
      inertiaGroup F Q ≤ decompositionGroup F Q := by
  sorry

/-- An arithmetic Frobenius in the global closure restricts to arithmetic Frobenius
at the contracted prime in every finite Galois subextension (§2.1). -/
theorem isArithFrobAtIntegralPrime_restrict
    (L : Type*) [Field L] [NumberField L] [Algebra F L] [IsGalois F L]
    [Algebra L (AlgebraicClosure F)] [IsScalarTower F L (AlgebraicClosure F)]
    (Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F))) [Q.IsMaximal]
    (hQ : Q.under (𝓞 F) ≠ ⊥) (σ : Field.absoluteGaloisGroup F)
    (hσ : IsArithFrobAtIntegralPrime σ Q) :
    let j : 𝓞 L →ₐ[𝓞 F] integralClosure (𝓞 F) (AlgebraicClosure F) :=
      (((IsScalarTower.toAlgHom F L (AlgebraicClosure F)).restrictScalars (𝓞 F)).mapIntegralClosure).comp
        (NumberField.RingOfIntegers.algEquiv F L (integralClosure (𝓞 F) L)).toAlgHom
    (MulSemiringAction.toAlgHom (𝓞 F) (𝓞 L)
      ((show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from σ).restrictNormal L)).IsArithFrobAt
        (Q.comap j.toRingHom) := by
  sorry

/-- Raising a Frobenius lift by the intermediate residue degree gives relative Frobenius
whenever that power fixes the intermediate field (§2.1). -/
theorem isArithFrobAt_pow_relative
    (M L : Type*) [Field M] [Field L] [NumberField M] [NumberField L]
    [Algebra F M] [Algebra M L] [Algebra F L] [IsScalarTower F M L] [IsGalois F L]
    (Q : Ideal (𝓞 L)) [Q.IsMaximal] (hQ : Q.under (𝓞 F) ≠ ⊥)
    (σ : L ≃ₐ[F] L) (τ : L ≃ₐ[M] L)
    (hσ : (MulSemiringAction.toAlgHom (𝓞 F) (𝓞 L) σ).IsArithFrobAt Q)
    (hτ : τ.restrictScalars F = σ ^ (Q.under (𝓞 M)).inertiaDeg (𝓞 F)) :
    (MulSemiringAction.toAlgHom (𝓞 M) (𝓞 L) τ).IsArithFrobAt Q := by
  sorry

variable {F}
variable {A : Type*} [CommRing A] {V : Type*} [AddCommGroup V] [Module A V]

/-- `ρ` is unramified at the finite place `v`: the inertia group of every prime of `F̄` above `v`
acts trivially (equivalently, of one such prime, `isUnramifiedAt_iff_exists`). -/
def IsUnramifiedAt (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (v : HeightOneSpectrum (𝓞 F)) : Prop :=
  ∀ Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F)), Q.IsMaximal →
    Q.under (𝓞 F) = v.asIdeal → ∀ g ∈ inertiaGroup F Q, ρ g = LinearMap.id

/-- The ramification set `Ram(ρ)` (finite places only). -/
def ramificationSet (ρ : Representation A (Field.absoluteGaloisGroup F) V) :
    Set (HeightOneSpectrum (𝓞 F)) :=
  {v | ¬ IsUnramifiedAt ρ v}

theorem isUnramifiedAt_iff_exists (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (v : HeightOneSpectrum (𝓞 F)) :
    IsUnramifiedAt ρ v ↔ ∃ Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F)), Q.IsMaximal ∧
      Q.under (𝓞 F) = v.asIdeal ∧ inertiaGroup F Q ≤ ρ.ker := by
  sorry

/-- A representation whose kernel is open (continuous with finite image for a Hausdorff target)
is ramified at finitely many places: the primes ramified in its kernel field. Finiteness of the
image alone is not enough. -/
theorem finite_ramificationSet (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (hρ : IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F))) :
    (ramificationSet ρ).Finite := by
  sorry

/-- `Ram(ρ ⊗ ρ') ⊆ Ram ρ ∪ Ram ρ'` and `Ram(ρ^∨) ⊆ Ram ρ`. -/
theorem ramificationSet_tprod_dual {V' : Type*} [AddCommGroup V'] [Module A V']
    (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (ρ' : Representation A (Field.absoluteGaloisGroup F) V') :
    ramificationSet (ρ.tprod ρ') ⊆ ramificationSet ρ ∪ ramificationSet ρ' ∧
      ramificationSet ρ.dual ⊆ ramificationSet ρ := by
  sorry

/-- Any equivariant quotient (for instance `Λ → Λ/𝔪Λ`) of a representation unramified at `v` is
unramified at `v`; the converse fails. -/
theorem isUnramifiedAt_of_surjective {N : Type*} [AddCommGroup N] [Module A N]
    (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (ρ' : Representation A (Field.absoluteGaloisGroup F) N) (f : V →ₗ[A] N)
    (hf : Function.Surjective f) (hfρ : ∀ g, f ∘ₗ ρ g = ρ' g ∘ₗ f)
    (v : HeightOneSpectrum (𝓞 F)) (h : IsUnramifiedAt ρ v) : IsUnramifiedAt ρ' v := by
  sorry

-- The trivial representation is unramified everywhere.
/-- The trivial representation has empty ramification set. -/
theorem ramificationSet_trivial : ramificationSet (Representation.trivial A (Field.absoluteGaloisGroup F) V) = ∅ := by
  sorry

end Places

/-- For `ℚ(i)` and a prime `Q` of `ℚ̄` above `p`, the inertia group of `Q` acts nontrivially on
`ℚ(i)` iff `p = 2`, and the decomposition group acts trivially iff `p ≡ 1 mod 4`. -/
theorem gaussian_character_inertia_decomposition (i : AlgebraicClosure ℚ) (hi : i ^ 2 = -1) (p : ℕ) (hp : p.Prime)
    (Q : Ideal (integralClosure (𝓞 ℚ) (AlgebraicClosure ℚ))) [Q.IsMaximal]
    (hQ : algebraMap (𝓞 ℚ) (integralClosure (𝓞 ℚ) (AlgebraicClosure ℚ)) p ∈ Q) :
    ((∃ σ ∈ inertiaGroup ℚ Q,
        (show AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ from σ) i ≠ i) ↔ p = 2) ∧
      ((∀ σ ∈ decompositionGroup ℚ Q,
        (show AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ from σ) i = i) ↔ p % 4 = 1) := by
  sorry

/-! ### Local restriction -/

section LocalRestriction

/-- The map `G_{F_v} → G_F` determined by an embedding of algebraic closures over `F → F_v`
(Mathlib's `Field.absoluteGaloisGroup.mapOfAlgebra`, `τ ↦ ι⁻¹ τ ι`). -/
def localEmbeddingMap (F K : Type*) [Field F] [Field K] [Algebra F K]
    [Algebra (AlgebraicClosure F) (AlgebraicClosure K)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure K)] :
    Field.absoluteGaloisGroup K →ₜ* Field.absoluteGaloisGroup F :=
  Field.absoluteGaloisGroup.mapOfAlgebra F K

variable (F K : Type*) [Field F] [Field K] [Algebra F K]
  [Algebra (AlgebraicClosure F) (AlgebraicClosure K)]
  [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure K)]

/-- The local restriction `ρ_ι = ρ ∘ ι^*`. For `ι' = ι ∘ σ`, the change-of-embedding
isomorphism from `ρ_ι` to `ρ_ι'` is `ρ(σ⁻¹)` (§2.1). -/
def localRestriction {A : Type*} [CommRing A] [TopologicalSpace A]
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) :
    ContinuousRep (Field.absoluteGaloisGroup K) A M :=
  ρ.res (localEmbeddingMap F K)

/-- For `F` a number field dense in the local field `K = F_v`, `K̄ = K · ι(F̄)` (Krasner), so `ι^*`
is a closed embedding whose image is the decomposition group of the prime `Q(ι)` and which carries
`I_K`, `P_K` onto the inertia and wild inertia groups of `Q(ι)` (Deligne 1973, 3.12). -/
theorem localEmbeddingMap_isClosedEmbedding [NumberField F] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (hK : DenseRange (algebraMap F K)) :
    IntermediateField.adjoin K
        (Set.range (algebraMap (AlgebraicClosure F) (AlgebraicClosure K))) = ⊤ ∧
      Topology.IsClosedEmbedding (localEmbeddingMap F K) ∧
      ∃ Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F)), Q.IsMaximal ∧
        (localEmbeddingMap F K).toMonoidHom.range = decompositionGroup F Q ∧
        (TauCeti.inertiaSubgroup K).map (localEmbeddingMap F K).toMonoidHom =
          inertiaGroup F Q := by
  sorry

end LocalRestriction

/-! ### Unramified and tamely ramified local representations; Frobenius polynomials -/

section Local

variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  {A : Type*} [CommRing A] [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- `ρ` is unramified: the inertia subgroup `TauCeti.inertiaSubgroup K` acts trivially. -/
def IsUnramified (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) : Prop :=
  ∀ g ∈ TauCeti.inertiaSubgroup K, ρ g = LinearMap.id

/-- `ρ` is tamely ramified: the wild inertia subgroup `TauCeti.wildInertiaSubgroup K` acts
trivially. -/
def IsTamelyRamified (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) : Prop :=
  ∀ g ∈ TauCeti.wildInertiaSubgroup K, ρ g = LinearMap.id

variable (K) in
/-- A chosen arithmetic Frobenius lift (Tau Ceti's `TauCeti.exists_isArithFrobeniusLift`); only
statements independent of the choice are made about it. -/
def arithFrobLift : Field.absoluteGaloisGroup K :=
  Classical.choose (TauCeti.exists_isArithFrobeniusLift K)

/-- The Frobenius characteristic polynomial `P(ρ, X) = det(X − ρ(Frob))` (arithmetic Frobenius;
independent of the lift for unramified `ρ`, `frobCharpoly_eq_charpoly`). -/
def frobCharpoly [Module.Free A M] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) :
    Polynomial A :=
  ρ.charpoly (arithFrobLift K)

variable [Module.Free A M]

/-- For unramified `ρ`, `P(ρ, X)` is the characteristic polynomial of `ρ(σ)` for every arithmetic
Frobenius lift `σ`. -/
theorem frobCharpoly_eq_charpoly (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M)
    (hρ : IsUnramified ρ) (σ : Field.absoluteGaloisGroup K)
    (hσ : TauCeti.IsArithFrobeniusLift K σ) : frobCharpoly ρ = (ρ σ).charpoly := by
  sorry

/-- `P(ρ, X)` is monic of degree `rank M`, with `nextCoeff = −tr ρ(Frob)` and constant term
`(−1)^n det ρ(Frob)`; the dual gives the geometric polynomial `det(X − ρ(Frob⁻¹))`. -/
theorem frobCharpoly_monic [Nontrivial A] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) :
    (frobCharpoly ρ).Monic ∧ (frobCharpoly ρ).natDegree = Module.finrank A M ∧
      (frobCharpoly ρ).nextCoeff = -LinearMap.trace A M (ρ (arithFrobLift K)) ∧
      (frobCharpoly ρ).coeff 0 =
        (-1) ^ Module.finrank A M * LinearMap.det (ρ (arithFrobLift K)) ∧
      (ρ.toRepresentation.dual (arithFrobLift K)).charpoly =
        (ρ (arithFrobLift K)⁻¹).charpoly := by
  sorry

/-- Twisting by an unramified character `χ` rescales: `P(ρ ⊗ χ, X) = χ(Frob)^n P(ρ, χ(Frob)⁻¹ X)`. -/
theorem frobCharpoly_twist [IsTopologicalRing A] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M)
    (χ : Field.absoluteGaloisGroup K →ₜ* Aˣ) (hχ : ∀ g ∈ TauCeti.inertiaSubgroup K, χ g = 1) :
    frobCharpoly (ρ.twist χ) =
      C ((χ (arithFrobLift K) : A) ^ Module.finrank A M) *
        (frobCharpoly ρ).comp (C ((χ (arithFrobLift K))⁻¹ : Aˣ).val * X) := by
  sorry

/-- For `L/K` finite with residue degree `f`, `P(ρ|_{G_L}, X)` is the characteristic polynomial of
`ρ(Frob_K)^f`. -/
theorem frobCharpoly_restrict (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] (f : ℕ)
    (hf : Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ f)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) (hρ : IsUnramified ρ) :
    frobCharpoly (ρ.res (localEmbeddingMap K L)) = ((ρ (arithFrobLift K)) ^ f).charpoly := by
  sorry

-- For `ℓ ≠ p`, `P(ℤ_ℓ(1), X) = X − q`: arithmetic Frobenius, not `X − q⁻¹`.
/-- The local cyclotomic characteristic polynomial uses arithmetic Frobenius and residue cardinality. -/
theorem frobCharpoly_cyclotomic (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0) (u : ℤ_[ℓ])
    (hu : u * (Nat.card 𝓀[K] : ℤ_[ℓ]) = 1) :
    frobCharpoly (ContinuousRep.ofCharacter (TauCeti.continuousLocalCyclotomicCharacter ℓ K)) =
      X - C (Nat.card 𝓀[K] : ℤ_[ℓ]) ∧
    frobCharpoly (ContinuousRep.ofCharacter (TauCeti.continuousLocalCyclotomicCharacter ℓ K)) ≠
      X - C u := by
  sorry

-- The trivial representation of rank `n` has `P = (X − 1)^n`.
/-- The trivial representation has arithmetic Frobenius polynomial `(X − 1)^n`. -/
theorem frobCharpoly_trivial [Nontrivial A] [IsTopologicalRing A] (n : ℕ) :
    frobCharpoly (ContinuousRep.trivial :
      ContinuousRep (Field.absoluteGaloisGroup K) A (Fin n → A)) = ((X : Polynomial A) - 1) ^ n := by
  sorry

end Local

/-! ### Unramified characters -/

section UnramifiedCharacter

variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- Unramified characters are determined by their value at a Frobenius lift (Hausdorff target). -/
theorem unramifiedCharacter_unique {R : Type*} [CommRing R] [TopologicalSpace R]
    [IsTopologicalRing R] [T2Space R] (χ₁ χ₂ : Field.absoluteGaloisGroup K →ₜ* Rˣ)
    (h₁ : ∀ τ ∈ TauCeti.inertiaSubgroup K, χ₁ τ = 1)
    (h₂ : ∀ τ ∈ TauCeti.inertiaSubgroup K, χ₂ τ = 1)
    (h : χ₁ (arithFrobLift K) = χ₂ (arithFrobLift K)) : χ₁ = χ₂ := by
  sorry

/-- For `E` finite over `ℚ_ℓ`, an unramified character with `λ(α)(Frob) = α` exists iff
`α ∈ O_E^×`; for `R = ℂ` iff `α` is a root of unity (§2.2). -/
theorem exists_unramifiedCharacter_iff (ℓ : ℕ) [Fact ℓ.Prime] {E : Type*}
    [NontriviallyNormedField E] [NormedAlgebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E] (α : Eˣ)
    (β : ℂˣ) :
    ((∃ χ : Field.absoluteGaloisGroup K →ₜ* Eˣ,
      (∀ τ ∈ TauCeti.inertiaSubgroup K, χ τ = 1) ∧ χ (arithFrobLift K) = α) ↔
        ‖(α : E)‖ = 1) ∧
    ((∃ χ : Field.absoluteGaloisGroup K →ₜ* ℂˣ,
      (∀ τ ∈ TauCeti.inertiaSubgroup K, χ τ = 1) ∧ χ (arithFrobLift K) = β) ↔
        ∃ n : ℕ, 0 < n ∧ β ^ n = 1) := by
  sorry

-- There is no unramified `ℚ_ℓ`-valued character sending Frobenius to `ℓ`.
/-- A continuous unramified p-adic character cannot send arithmetic Frobenius to a nonunit uniformizer. -/
theorem unramified_character_nonunit_obstruction (ℓ : ℕ) [Fact ℓ.Prime] :
    ¬ ∃ χ : Field.absoluteGaloisGroup K →ₜ* ℚ_[ℓ]ˣ,
      (∀ τ ∈ TauCeti.inertiaSubgroup K, χ τ = 1) ∧ (χ (arithFrobLift K) : ℚ_[ℓ]) = ℓ := by
  sorry

/-- The unramified character `λ_W(α)(w) = α^{deg w}` of a Weil group `W` (any `α ∈ R^×`). -/
def weilUnramifiedCharacter {W : Type*} [Group W] (deg : W →* Multiplicative ℤ) {R : Type*}
    [CommRing R] (α : Rˣ) : W →* Rˣ :=
  (zpowersHom Rˣ α).comp deg

end UnramifiedCharacter

/-! ### The cyclotomic and tame characters -/

/-- For `p` odd, `χ_p = ω · ⟨χ_p⟩` with `ω` of order dividing `p − 1` (the Teichmüller lift of
`χ_p mod p`) and `⟨χ_p⟩` valued in `1 + pℤ_p`. -/
theorem localCyclotomicCharacter_eq_teichmuller_mul (F : Type*) [Field F] (p : ℕ) [Fact p.Prime]
    (hp : p ≠ 2) :
    ∃ ω ψ : Field.absoluteGaloisGroup F →* ℤ_[p]ˣ, (∀ g, ω g ^ (p - 1) = 1) ∧
      (∀ g, ‖(ψ g : ℤ_[p]) - 1‖ < 1) ∧
      ∀ g, TauCeti.localCyclotomicCharacter p F g = ω g * ψ g := by
  sorry

/-- Every continuous homomorphism with open kernel from `I_K` to a finite `ℓ`-group factors uniquely
through Tau Ceti's `ℓ`-adic tame character `t_ℓ : I_K → ℤ_ℓ(1)` (§2.3). -/
theorem exists_unique_factor_inertiaPadicTameCharacter (K : Type*) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] {ℓ : ℕ} [Fact ℓ.Prime]
    (hℓ : ℓ.Coprime (ringChar 𝓀[K])) (P : Type*) [Group P] [Finite P] (hP : IsPGroup ℓ P)
    (f : TauCeti.inertiaSubgroup K →* P) (hf : IsOpen (f.ker : Set (TauCeti.inertiaSubgroup K))) :
    ∃! g : Multiplicative (TauCeti.PadicTateTwist ℓ (AlgebraicClosure K)) →* P,
      f = g.comp (TauCeti.inertiaPadicTameCharacter K hℓ).toMonoidHom := by
  sorry

/-! Section 2.3 owns `fundamentalCharacter`, `fundamentalCharacter_pow_p` and
`cyclotomic_restrict_tameInertia`, including the norm API for local fields with finite residue
field, together with the rank-two tame
classification over `ℚ_p`. The downstream FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.26
consumes this API and owns its extension to arbitrary perfect residue fields and the agreement
with the finite-residue API; R07.1.27–R07.1.32 own Raynaud exponent bounds and finite-flat
applications. -/

/-- Over a nonarchimedean local field with finite residue field of characteristic `p`, a semisimple
continuous residual representation is tamely ramified and inertia acts through a cyclic group
of order prime to `p` (Serre 1972, 1.6). -/
theorem tame_of_semisimple_residual (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (p : ℕ) [Fact p.Prime] (hp : ringChar 𝓀[K] = p)
    (k₁ : Type*) [Field k₁] [CharP k₁ p] [TopologicalSpace k₁] [DiscreteTopology k₁]
    {V : Type*} [AddCommGroup V] [Module k₁ V] [Module.Finite k₁ V] [TopologicalSpace V]
    [IsModuleTopology k₁ V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) k₁ V)
    (hρ : ρ.toRepresentation.IsSemisimpleRepresentation) :
    IsTamelyRamified ρ ∧
      (∃ g₀ ∈ TauCeti.inertiaSubgroup K, ∀ σ ∈ TauCeti.inertiaSubgroup K, ∃ n : ℕ,
        ρ σ = ρ g₀ ^ n) ∧
      ∃ m : ℕ, 0 < m ∧ m.Coprime p ∧ ∀ σ ∈ TauCeti.inertiaSubgroup K, ρ σ ^ m = 1 := by
  sorry

end GaloisRep

/-! ### Arithmetic monodromy and the shared Weil–Deligne interface

SmoothRepresentationsOfLocalGroups SR.5.2 owns `wd-linear-substrate`, `nilpotent-exp-log`,
`grothendieck-monodromy`, `wd-parameter-operations`, `full-wd-construction` and
`wd-frobenius-semisimplification`, including the finite-coefficient inverse for Frobenius
eigenvalues of ℓ-adic absolute value one. The exp/log signatures below represent that supplier's
mathematics. Section 2.4 supplies the `ContinuousRep` monodromy specialization and arithmetic
adapter; §2.5 identifies its semisimplified output with the supplier's
`classical-llc-normalization` and defines local factors on the same parameter fields. -/

namespace LinearMap.GeneralLinearGroup.IsUnipotent

/-- Representative of SmoothRepresentationsOfLocalGroups SR.5.2 `nilpotent-exp-log`:
the finite unipotent logarithm, with a truncation bound given by the nilpotency class. -/
def log {R V : Type*} [CommRing R] [Algebra ℚ R] [AddCommGroup V]
    [Module R V] [Module ℚ V] [IsScalarTower ℚ R V]
    (u : _root_.LinearMap.GeneralLinearGroup R V)
    (_hu : _root_.LinearMap.GeneralLinearGroup.IsUnipotent u) : Module.End R V :=
  ∑ i ∈ Finset.range (_root_.nilpotencyClass ((u : Module.End R V) - 1)),
    (((-1 : ℚ) ^ (i + 1)) / (i : ℚ)) • ((u : Module.End R V) - 1) ^ i

/-- Representative of SmoothRepresentationsOfLocalGroups SR.5.2 `nilpotent-exp-log`:
the finite nilpotent exponential and unipotent logarithm are inverse. -/
theorem log_exp_and_exp_log {R V : Type*} [CommRing R] [Algebra ℚ R]
    [AddCommGroup V] [Module R V] [Module ℚ V] [IsScalarTower ℚ R V]
    (N : Module.End R V) (hN : IsNilpotent N)
    (u : _root_.LinearMap.GeneralLinearGroup R V)
    (hu : _root_.LinearMap.GeneralLinearGroup.IsUnipotent u) :
    (∃ (v : _root_.LinearMap.GeneralLinearGroup R V)
      (hv : _root_.LinearMap.GeneralLinearGroup.IsUnipotent v),
      (v : Module.End R V) = IsNilpotent.exp N ∧ log v hv = N) ∧
      IsNilpotent.exp (log u hu) = (u : Module.End R V) := by
  sorry

-- The identity unit has zero logarithm over `ℚ`.
/-- The identity unipotent operator has zero logarithm. -/
theorem log_one : log (1 : _root_.LinearMap.GeneralLinearGroup ℚ (Fin 2 → ℚ))
    _root_.LinearMap.GeneralLinearGroup.isUnipotent_one = 0 := by
  sorry

-- The square-zero Jordan block gives a unipotent unit `1 + E₁₂` with logarithm `E₁₂`.
/-- The square-zero unipotent Jordan block has its nilpotent part as logarithm. -/
theorem log_jordan_two :
    let N := Matrix.toLin' (!![(0 : ℚ), 1; 0, 0])
    ∃ u : _root_.LinearMap.GeneralLinearGroup ℚ (Fin 2 → ℚ),
      (u : Module.End ℚ (Fin 2 → ℚ)) = 1 + N ∧ ∃ hu, log u hu = N := by
  let N := Matrix.toLin' (!![(0 : ℚ), 1; 0, 0])
  have hmat : (!![(0 : ℚ), 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [pow_succ, Matrix.mul_apply, Fin.sum_univ_succ]
  have hN : N ^ 2 = 0 := by
    dsimp [N]
    rw [← Matrix.toLin'_pow, hmat, map_zero]
  have hunit := (show IsNilpotent N from ⟨2, hN⟩).isUnit_one_add
  let u : _root_.LinearMap.GeneralLinearGroup ℚ (Fin 2 → ℚ) := hunit.unit
  have hu : _root_.LinearMap.GeneralLinearGroup.IsUnipotent u := by
    change IsNilpotent ((hunit.unit : Module.End ℚ (Fin 2 → ℚ)) - 1)
    rw [hunit.unit_spec]
    simpa using (show IsNilpotent N from ⟨2, hN⟩)
  refine ⟨u, hunit.unit_spec, hu, ?_⟩
  sorry

-- The length-three block retains the quadratic term in its logarithm.
/-- The length-three unipotent Jordan block retains the quadratic term of its logarithm. -/
theorem log_jordan_three :
    let N := Matrix.toLin' (!![(0 : ℚ), 1, 0; 0, 0, 1; 0, 0, 0])
    ∃ u : _root_.LinearMap.GeneralLinearGroup ℚ (Fin 3 → ℚ),
      (u : Module.End ℚ (Fin 3 → ℚ)) = 1 + N ∧ ∃ hu,
        log u hu = N - (1 / 2 : ℚ) • N ^ 2 := by
  let N := Matrix.toLin' (!![(0 : ℚ), 1, 0; 0, 0, 1; 0, 0, 0])
  have hmat : (!![(0 : ℚ), 1, 0; 0, 0, 1; 0, 0, 0] : Matrix (Fin 3) (Fin 3) ℚ) ^ 3 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [pow_succ, Matrix.mul_apply, Fin.sum_univ_succ]
  have hN : N ^ 3 = 0 := by
    dsimp [N]
    rw [← Matrix.toLin'_pow, hmat, map_zero]
  have hunit := (show IsNilpotent N from ⟨3, hN⟩).isUnit_one_add
  let u : _root_.LinearMap.GeneralLinearGroup ℚ (Fin 3 → ℚ) := hunit.unit
  have hu : _root_.LinearMap.GeneralLinearGroup.IsUnipotent u := by
    change IsNilpotent ((hunit.unit : Module.End ℚ (Fin 3 → ℚ)) - 1)
    rw [hunit.unit_spec]
    simpa using (show IsNilpotent N from ⟨3, hN⟩)
  refine ⟨u, hunit.unit_spec, hu, ?_⟩
  sorry

-- A square-zero operator has the unipotent square root `1 + N/2`.
/-- A square-zero nilpotent operator gives a unipotent square root by halving its coefficient. -/
theorem squareZero_unipotent_sqrt (N : Module.End ℚ (Fin 2 → ℚ)) (hN : N ^ 2 = 0) :
    ∃ u : _root_.LinearMap.GeneralLinearGroup ℚ (Fin 2 → ℚ),
      (u : Module.End ℚ (Fin 2 → ℚ)) = 1 + (1 / 2 : ℚ) • N ∧
      _root_.LinearMap.GeneralLinearGroup.IsUnipotent u ∧
      (u : Module.End ℚ (Fin 2 → ℚ)) ^ 2 = 1 + N := by
  have hhalf : ((1 / 2 : ℚ) • N) ^ 2 = 0 := by
    rw [_root_.smul_pow, hN, smul_zero]
  have hunit := (show IsNilpotent ((1 / 2 : ℚ) • N) from ⟨2, hhalf⟩).isUnit_one_add
  let u : _root_.LinearMap.GeneralLinearGroup ℚ (Fin 2 → ℚ) := hunit.unit
  have hu : _root_.LinearMap.GeneralLinearGroup.IsUnipotent u := by
    change IsNilpotent ((hunit.unit : Module.End ℚ (Fin 2 → ℚ)) - 1)
    rw [hunit.unit_spec]
    simpa using (show IsNilpotent ((1 / 2 : ℚ) • N) from ⟨2, hhalf⟩)
  refine ⟨u, hunit.unit_spec, hu, ?_⟩
  sorry

end LinearMap.GeneralLinearGroup.IsUnipotent

namespace GaloisRep

/-- `ContinuousRep` specialization of SmoothRepresentationsOfLocalGroups SR.5.2
`grothendieck-monodromy` (Deligne 1973, Thm 8.2): for `ℓ ≠ p`
and a continuous representation of `G_K` on a finite-dimensional space over a finite extension `E` of `ℚ_ℓ`, there are
a unique nilpotent `N` and an open subgroup `J` of `I_K` with `ρ(σ) = exp(t(σ) N)` on `J`, where
`t = T ∘ t_ℓ` for a trivialisation `T` of `ℤ_ℓ(1)`, and `ρ(w) N = χ_ℓ(w) N ρ(w)`. -/
theorem grothendieck_quasiUnipotent (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ.Coprime (ringChar 𝓀[K]))
    (T : TauCeti.PadicTateTwist ℓ (AlgebraicClosure K) ≃ₗ[ℤ_[ℓ]] ℤ_[ℓ])
    {E : Type*} [Field E] [TopologicalSpace E] [Algebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E]
    [IsModuleTopology ℚ_[ℓ] E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [TopologicalSpace V]
    [IsModuleTopology E V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) E V) :
    ∃! N : Module.End E V, IsNilpotent N ∧
      (∀ w, ρ w ∘ₗ N = algebraMap ℚ_[ℓ] E
        ((TauCeti.localCyclotomicCharacter ℓ K w : ℤ_[ℓ]) : ℚ_[ℓ]) • (N ∘ₗ ρ w)) ∧
      ∃ J : Subgroup (TauCeti.inertiaSubgroup K), IsOpen (J : Set (TauCeti.inertiaSubgroup K)) ∧
        ∀ σ ∈ J, ρ (σ : Field.absoluteGaloisGroup K) =
          ∑ i ∈ Finset.range (Module.finrank E V),
            ((i.factorial : E)⁻¹ * (algebraMap ℚ_[ℓ] E
              (T (TauCeti.inertiaPadicTameCharacter K hℓ σ).toAdd : ℚ_[ℓ])) ^ i) • N ^ i := by
  sorry

end GaloisRep

/-! ### Local factors on the supplied Weil–Deligne fields -/

namespace WeilDeligneRep

section LocalFactor

variable {W : Type*} [Group W] {deg : W →* Multiplicative ℤ} {q : ℕ}
  {Ω : Type*} [Field Ω]
  {V : Type*} [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]

/-- The arithmetic local-factor subspace `(ker N)^{r(I)}`, with `I = ker deg`, computed from the
canonical parameter fields used in §2.4. -/
def kerMonodromyInvariants (deg : W →* Multiplicative ℤ) (r : Representation Ω W V)
    (N : Module.End Ω V) : Submodule Ω V :=
  LinearMap.ker N ⊓ ⨅ σ ∈ deg.ker, LinearMap.ker (r σ - LinearMap.id)

/-- The arithmetic local factor `det(1 − X r(F) | (ker N)^{r(I)})`, computed from the canonical
parameter fields and conjugation relation. For geometric `F` it is independent of the lift
(Deligne 1973, 8.12). -/
def localFactor (r : Representation Ω W V) (N : Module.End Ω V)
    (hrel : ∀ w, r w ∘ₗ N = ((q : Ω) ^ Multiplicative.toAdd (deg w)) • (N ∘ₗ r w))
    (F : W) : Polynomial Ω :=
  (LinearMap.restrict (r F) (p := kerMonodromyInvariants deg r N)
    (q := kerMonodromyInvariants deg r N) sorry).charpoly.reverse

/-- Independence of the geometric Frobenius lift for the local factor on the canonical fields. -/
theorem localFactor_indep (r : Representation Ω W V) (N : Module.End Ω V)
    (hrel : ∀ w, r w ∘ₗ N = ((q : Ω) ^ Multiplicative.toAdd (deg w)) • (N ∘ₗ r w))
    (F F' : W) (hF : deg F = Multiplicative.ofAdd (-1))
    (hF' : deg F' = Multiplicative.ofAdd (-1)) :
    localFactor r N hrel F = localFactor r N hrel F' := by
  sorry

/-- Local factors multiply on direct sums, including pairs with nonzero monodromy (§2.5). -/
theorem localFactor_directSum {V' : Type*} [AddCommGroup V'] [Module Ω V']
    [FiniteDimensional Ω V'] (r : Representation Ω W V) (r' : Representation Ω W V')
    (N : Module.End Ω V) (N' : Module.End Ω V')
    (hrel : ∀ w, r w ∘ₗ N = ((q : Ω) ^ Multiplicative.toAdd (deg w)) • (N ∘ₗ r w))
    (hrel' : ∀ w, r' w ∘ₗ N' = ((q : Ω) ^ Multiplicative.toAdd (deg w)) • (N' ∘ₗ r' w))
    (F : W) :
    ∃ hsum : ∀ w, (r.prod r') w ∘ₗ N.prodMap N' =
      ((q : Ω) ^ Multiplicative.toAdd (deg w)) • (N.prodMap N' ∘ₗ (r.prod r') w),
      localFactor (r.prod r') (N.prodMap N') hsum F =
        localFactor r N hrel F * localFactor r' N' hrel' F := by
  sorry

/-- Local polynomials commute with every extension of coefficient fields, through scalar
extension of the monodromy kernel and inertia invariants (§§2.5–2.5a). -/
theorem localFactor_baseChange (r : Representation Ω W V) (N : Module.End Ω V)
    (hrel : ∀ w, r w ∘ₗ N = ((q : Ω) ^ Multiplicative.toAdd (deg w)) • (N ∘ₗ r w))
    (Ω' : Type*) [Field Ω'] [Algebra Ω Ω'] (F : W) :
    ∃ hbase : ∀ w, (r.baseChange Ω') w ∘ₗ N.baseChange Ω' =
      ((q : Ω') ^ Multiplicative.toAdd (deg w)) •
        (N.baseChange Ω' ∘ₗ (r.baseChange Ω') w),
      localFactor (r.baseChange Ω') (N.baseChange Ω') hbase F =
        (localFactor r N hrel F).map (algebraMap Ω Ω') := by
  sorry

-- The fields of `Sp(2)` have geometric Frobenius `diag(1, q⁻¹)` and `N e₀ = e₁`.
-- Its factor is computed on `ker N`, and differs from the factor of the same action with `N = 0`.
/-- The special pair of rank two has local factor computed on the monodromy kernel. -/
theorem localFactor_special_two (hq : (q : Ω) ≠ 0) (r : Representation Ω W (Fin 2 → Ω)) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1))
    (hI : ∀ σ ∈ deg.ker, r σ = LinearMap.id)
    (hr : r F = Matrix.toLin' (Matrix.diagonal ![1, (q : Ω)⁻¹]))
    (hrel : ∀ w, r w ∘ₗ Matrix.toLin' !![(0 : Ω), 0; 1, 0] =
      ((q : Ω) ^ Multiplicative.toAdd (deg w)) •
        (Matrix.toLin' !![(0 : Ω), 0; 1, 0] ∘ₗ r w)) :
    localFactor r (Matrix.toLin' !![(0 : Ω), 0; 1, 0]) hrel F = 1 - C (q : Ω)⁻¹ * X ∧
      localFactor (deg := deg) (q := q) r 0 (by simp) F = (1 - X) * (1 - C (q : Ω)⁻¹ * X) ∧
      localFactor r (Matrix.toLin' !![(0 : Ω), 0; 1, 0]) hrel F ≠
        localFactor (deg := deg) (q := q) r 0 (by simp) F := by
  sorry

-- The zero representation has factor `1`; the trivial character has factor `1 − X`.
/-- The zero and trivial Weil–Deligne pairs have local factors one and `1 − X`. -/
theorem localFactor_zero_and_trivial (F : W) :
    localFactor (deg := deg) (q := q) (Representation.trivial Ω W (Fin 0 → Ω))
      0 (by simp) F = 1 ∧
    localFactor (deg := deg) (q := q) (Representation.trivial Ω W Ω) 0 (by simp) F = 1 - X := by
  sorry

-- In characteristic three, nontrivial tame inertia has only a one-dimensional fixed space.
/-- A characteristic-three unipotent inertia action changes the local factor through its fixed subspace. -/
theorem localFactor_modular_inertia :
    letI : AddCommGroup (ZMod 3) := (ZMod.commRing 3).toAddCommGroup
    let r : Representation (ZMod 3) (Multiplicative (ZMod 3) × Multiplicative ℤ)
        (Fin 2 → ZMod 3) :=
      { toFun := fun w => Matrix.toLin' !![1, Multiplicative.toAdd w.1; 0, 1]
        map_one' := by sorry
        map_mul' := by sorry }
    let deg := MonoidHom.snd (Multiplicative (ZMod 3)) (Multiplicative ℤ)
    let F : Multiplicative (ZMod 3) × Multiplicative ℤ := (1, Multiplicative.ofAdd (-1))
    localFactor (Ω := ZMod 3) (V := Fin 2 → ZMod 3) (deg := deg) (q := 7)
      r 0 (by simp) F = 1 - X ∧
      localFactor (Ω := ZMod 3) (V := Fin 2 → ZMod 3) (deg := deg) (q := 7)
        r 0 (by simp) F ≠ (1 - X) ^ 2 := by
  sorry

end LocalFactor

/-- The cyclic block endomorphism `φ_{n+1}` of `V^{n+1}`: `(φ_{n+1} c)_0 = φ(c_n)` and
`(φ_{n+1} c)_i = c_{i−1}` for `i ≥ 1`. -/
def cyclicBlock {A V : Type*} [CommRing A] [AddCommGroup V] [Module A V] (φ : V →ₗ[A] V) (n : ℕ) :
    (Fin (n + 1) → V) →ₗ[A] (Fin (n + 1) → V) where
  toFun c i := if (i : ℕ) = 0 then φ (c (Fin.last n))
    else c ⟨(i : ℕ) - 1, by have := i.isLt; omega⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- Deligne 1973, Lemme 3.9: `det(1 − X φ_{n+1}) = det(1 − X^{n+1} φ)`, equivalently
`charpoly(φ_{n+1})(X) = charpoly(φ)(X^{n+1})`. -/
theorem charpoly_cyclicBlock {A V : Type*} [CommRing A] [AddCommGroup V] [Module A V]
    [Module.Free A V] [Module.Finite A V] (φ : V →ₗ[A] V) (n : ℕ) :
    (cyclicBlock φ n).charpoly = φ.charpoly.comp (X ^ (n + 1)) := by
  sorry

-- Two rank-one blocks apply the scalar only on the wraparound from the last block to the first.
/-- The cyclic block applies its scalar on the wraparound and has the corresponding characteristic polynomial. -/
theorem cyclicBlock_wraparound : (cyclicBlock (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) 1).charpoly = X ^ 2 - C 2 ∧
    LinearMap.toMatrix' (cyclicBlock (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) 1) =
      !![(0 : ℚ), 2; 1, 0] := by
  sorry

/-- Two identity blocks give characteristic polynomial `X² − 1`. -/
theorem cyclicBlock_identity : (cyclicBlock (LinearMap.id : ℚ →ₗ[ℚ] ℚ) 1).charpoly = X ^ 2 - 1 := by
  sorry

/-- Three zero blocks give a nilpotent cyclic operator with characteristic polynomial `X³`. -/
theorem cyclicBlock_zero : (cyclicBlock (0 : ℚ →ₗ[ℚ] ℚ) 2).charpoly = X ^ 3 := by
  sorry

/-! ### The monodromy filtration and purity -/

section Purity

variable {k : Type*} [Field k] {V : Type*} [AddCommGroup V] [Module k V]

/-- The monodromy filtration of a nilpotent `N`: `M_a = Σ_{i−j=a} (ker N^{i+1} ∩ im N^j)`. -/
def monodromyFiltration (N : Module.End k V) (a : ℤ) : Submodule k V :=
  ⨆ (i : ℕ) (j : ℕ) (_ : (i : ℤ) - j = a), LinearMap.ker (N ^ (i + 1)) ⊓ LinearMap.range (N ^ j)

/-- The filtration is increasing, `N M_a ⊆ M_{a−2}`, `N^{d+1} = 0` gives `M_{−d−1} = 0` and
`M_d = V`, and conjugation transports it (§2.6). -/
theorem monodromyFiltration_basic (N : Module.End k V) (d : ℕ) (hN : N ^ (d + 1) = 0)
    (g : V ≃ₗ[k] V) (a : ℤ) :
    Monotone (monodromyFiltration N) ∧
      (monodromyFiltration N a).map N ≤ monodromyFiltration N (a - 2) ∧
      monodromyFiltration N (-(d : ℤ) - 1) = ⊥ ∧ monodromyFiltration N d = ⊤ ∧
      monodromyFiltration (g.toLinearMap ∘ₗ N ∘ₗ g.symm.toLinearMap) a =
        (monodromyFiltration N a).map g.toLinearMap := by
  sorry

/-- In characteristic zero, the monodromy filtration of tensor monodromy is the convolution
of the two monodromy filtrations (Deligne 1980, Proposition 1.6.9(i), §2.6). -/
theorem monodromyFiltration_tensor [CharZero k] [FiniteDimensional k V]
    {V' : Type*} [AddCommGroup V'] [Module k V'] [FiniteDimensional k V']
    (N : Module.End k V) (N' : Module.End k V') (hN : IsNilpotent N)
    (hN' : IsNilpotent N') (c : ℤ) :
    monodromyFiltration
      (TensorProduct.map N LinearMap.id + TensorProduct.map LinearMap.id N') c =
      ⨆ (a : ℤ) (b : ℤ) (_ : a + b = c),
        LinearMap.range (TensorProduct.map (monodromyFiltration N a).subtype
          (monodromyFiltration N' b).subtype) := by
  sorry

-- On a two-step Jordan string the graded degrees are `−1` and `1`; for `N = 0` everything sits in
-- degree `0`: the filtration is centred, and is not the kernel filtration.
/-- The monodromy filtration of a two-step Jordan string has graded degrees minus one and one. -/
theorem monodromyFiltration_jordan_two : let N := Matrix.toLin' !![(0 : ℚ), 1; 0, 0]
    monodromyFiltration N (-2) = ⊥ ∧ monodromyFiltration N (-1) = LinearMap.ker N ∧
      monodromyFiltration N 0 = LinearMap.ker N ∧ monodromyFiltration N 1 = ⊤ := by
  sorry

/-- Zero monodromy has its entire carrier in graded degree zero. -/
theorem monodromyFiltration_zero : monodromyFiltration (0 : Module.End ℚ (Fin 2 → ℚ)) (-1) = ⊥ ∧
    monodromyFiltration (0 : Module.End ℚ (Fin 2 → ℚ)) 0 = ⊤ := by
  sorry

variable [FiniteDimensional k V] [CharZero k]

/-- `α` is a `q`-Weil number of weight `m`: algebraic over `ℚ` with every complex conjugate of
absolute value `q^{m/2}`. -/
def IsWeilNumber (q : ℕ) (m : ℤ) (α : k) : Prop :=
  IsAlgebraic ℚ α ∧ ∀ z ∈ (minpoly ℚ α).aroots ℂ, ‖z‖ = (q : ℝ) ^ ((m : ℝ) / 2)

/-- Purity of weight `w` of a pair `(φ, N)`: every eigenvalue of `φ` on `gr^M_a` (in an algebraic
closure) is a `q`-Weil number of weight `w + a`. -/
def IsPureEnd (q : ℕ) (w : ℤ) (φ N : Module.End k V) : Prop :=
  ∀ (a : ℤ) (α : AlgebraicClosure k) (v : AlgebraicClosure k ⊗[k] V),
    v ∈ (monodromyFiltration N a).baseChange (AlgebraicClosure k) →
    v ∉ (monodromyFiltration N (a - 1)).baseChange (AlgebraicClosure k) →
    φ.baseChange (AlgebraicClosure k) v - α • v ∈
      (monodromyFiltration N (a - 1)).baseChange (AlgebraicClosure k) →
    IsWeilNumber q (w + a) α

/-- Purity on the canonical parameter fields `r`, `N`, read at a geometric lift `F`. -/
def IsPure {W : Type*} [Group W] (r : Representation k W V) (N : Module.End k V)
    (q : ℕ) (w : ℤ) (F : W) : Prop :=
  IsPureEnd q w (r F) N

/-- Purity from a pure graded, one step `0 ⊂ U ⊂ V` (Fresán–Sabbah–Yu 2022, Lemma 5.40): if
`N φ = q φ N`, `q ≥ 2`, characteristic zero, and the pairs on `U` and `V/U` are pure of weight `w`,
then `(φ, N)` is pure of weight `w` with the Jordan type of the graded. -/
theorem isPureEnd_of_graded (q : ℕ) (hq : 2 ≤ q) (w : ℤ) (φ N : Module.End k V)
    (hN : IsNilpotent N) (hφ : IsUnit φ) (h : N ∘ₗ φ = (q : k) • (φ ∘ₗ N))
    (U : Submodule k V) (hUφ : U ≤ U.comap φ) (hUN : U ≤ U.comap N)
    (h₁ : IsPureEnd q w (φ.restrict (p := U) (q := U) fun _ hx => hUφ hx)
      (N.restrict (p := U) (q := U) fun _ hx => hUN hx))
    (h₂ : IsPureEnd q w (U.mapQ U φ hUφ) (U.mapQ U N hUN)) :
    IsPureEnd q w φ N ∧ ∀ j : ℕ, Module.finrank k (LinearMap.range (N ^ j)) =
      Module.finrank k (LinearMap.range ((N.restrict (p := U) (q := U) fun _ hx => hUN hx) ^ j)) +
        Module.finrank k (LinearMap.range ((U.mapQ U N hUN) ^ j)) := by
  sorry

-- `Sp(2)` is pure of weight `−1`; its underlying action with `N = 0` is pure of no weight.
/-- The special pair is pure although its underlying action with zero monodromy is pure of no weight. -/
theorem special_two_pure_underlying_not_pure {W : Type*} [Group W] (q : ℕ) (hq : 1 < q)
    (r : Representation ℚ W (Fin 2 → ℚ)) (F : W)
    (hr : r F = Matrix.toLin' (Matrix.diagonal ![1, (q : ℚ)⁻¹])) (w : ℤ) :
    IsPure r (Matrix.toLin' !![(0 : ℚ), 0; 1, 0]) q (-1) F ∧
      ¬ IsPure r 0 q w F := by
  sorry

end Purity

end WeilDeligneRep

namespace GaloisRep

/-- The local Euler factor `L(ρ, X) = det(1 − X ρ(F) | V^{ρ(I)})` of a continuous representation of
the Weil group, `I = ker deg`, for a geometric Frobenius lift `F`. -/
def localEulerFactor {W : Type*} [Group W] [TopologicalSpace W] [IsTopologicalGroup W] (deg : W →* Multiplicative ℤ)
    {E : Type*} [Field E] [TopologicalSpace E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V] (ρ : ContinuousRep W E V) (F : W) :
    Polynomial E :=
  let U : Submodule E V := ⨅ σ ∈ deg.ker, LinearMap.ker (ρ σ - LinearMap.id)
  (LinearMap.restrict (ρ F) (p := U) (q := U) sorry).charpoly.reverse

/-- At an unramified place the Euler factor is `det(1 − X ρ(F))`, the reversed characteristic
polynomial of the geometric Frobenius, equivalently of the arithmetic Frobenius on the dual. -/
theorem localEulerFactor_unramified {W : Type*} [Group W] [TopologicalSpace W] [IsTopologicalGroup W]
    (deg : W →* Multiplicative ℤ) {E : Type*} [Field E] [TopologicalSpace E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V] (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (hρ : ∀ σ ∈ deg.ker, ρ σ = LinearMap.id) :
    localEulerFactor deg ρ F = (ρ F).charpoly.reverse := by
  sorry

/-- For finite inertia image in characteristic zero, geometric Frobenius on the dual has the
arithmetic Frobenius polynomial of the original inertia invariants (§2.5a). -/
theorem localEulerFactor_dual_eq_arithmetic {W : Type*} [Group W] [TopologicalSpace W]
    [IsTopologicalGroup W] (deg : W →* Multiplicative ℤ)
    {E V : Type*} [Field E] [CharZero E] [TopologicalSpace E] [IsTopologicalRing E]
    [AddCommGroup V] [Module E V] [FiniteDimensional E V]
    [TopologicalSpace V] [IsModuleTopology E V]
    [TopologicalSpace (Module.Dual E V)] [IsModuleTopology E (Module.Dual E V)]
    (ρ : ContinuousRep W E V) (F : W) (hF : deg F = Multiplicative.ofAdd 1)
    (hI : (Set.range fun σ : deg.ker => ρ (σ : W)).Finite) :
    localEulerFactor deg ρ.dual F⁻¹ =
      (LinearMap.restrict (ρ F)
        (p := ⨅ σ ∈ deg.ker, LinearMap.ker (ρ σ - LinearMap.id))
        (q := ⨅ σ ∈ deg.ker, LinearMap.ker (ρ σ - LinearMap.id)) (by sorry)).charpoly.reverse := by
  sorry

end GaloisRep

/-! ## Layer 3: Artin and Swan conductors

The conductors themselves rest on the absolute upper-numbering filtration of §3.1 and are README
targets; the finiteness statements on which their definition depends are stated here. -/

namespace Conductor

open scoped ValuativeRel

/-- For coefficients in a nonarchimedean local field `E` of residue characteristic `ℓ ≠ p`, the image
of wild inertia under a continuous representation of `G_K` is finite, and `ρ` is trivial on
`U ∩ P_K` for an open normal subgroup `U` of `G_K` (Ulmer 2016, §§4–5). -/
theorem finite_range_wildInertia {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {E : Type*} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (hℓ : ringChar 𝓀[E] ≠ ringChar 𝓀[K])
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [TopologicalSpace V]
    [IsModuleTopology E V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) E V) :
    (Set.range fun σ : TauCeti.wildInertiaSubgroup K => ρ σ).Finite ∧
      ∃ U : Subgroup (Field.absoluteGaloisGroup K), U.Normal ∧
        IsOpen (U : Set (Field.absoluteGaloisGroup K)) ∧
        ∀ σ ∈ U, σ ∈ TauCeti.wildInertiaSubgroup K → ρ σ = LinearMap.id := by
  sorry

/-- Invariants of an induced representation under a normal subgroup: for `H` of finite index and `D`
normal, `dim (Ind_H^Γ σ)^D = [Γ : H D] · dim σ^{H ∩ D}` (Brumer–Kramer 1994, §6). -/
theorem finrank_invariants_ind {Γ : Type*} [Group Γ] (H D : Subgroup Γ) [H.FiniteIndex] [D.Normal]
    {F : Type*} [Field F] {U : Type*} [AddCommGroup U] [Module F U] [FiniteDimensional F U]
    (σ : Representation F H U) :
    Module.finrank F (Representation.invariants ((Representation.ind H.subtype σ).comp D.subtype)) =
      (H ⊔ D).index *
        Module.finrank F (Representation.invariants (σ.comp (D.subgroupOf H).subtype)) := by
  sorry

end Conductor

/-! ## Layer 4: residual images and oddness -/

open NumberField Polynomial

namespace GaloisRep

/-! ### Complex conjugation and oddness -/

section Oddness

variable {F : Type*} [Field F] [NumberField F]

/-- `c ∈ G_F` is a complex conjugation at the infinite place `v`: for some embedding
`ι : F̄ → ℂ` above `v`, `ι ∘ c = conj ∘ ι`. -/
def IsComplexConjugation (v : InfinitePlace F) (c : Field.absoluteGaloisGroup F) : Prop :=
  ∃ ι : AlgebraicClosure F →+* ℂ, InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v ∧
    ∀ x, ι ((show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from c) x) = starRingEnd ℂ (ι x)

/-- At a real place complex conjugations exist, have order two, and form one conjugacy class. -/
theorem isComplexConjugation_isReal (v : InfinitePlace F) (hv : v.IsReal) :
    (∃ c, IsComplexConjugation v c) ∧
      (∀ c, IsComplexConjugation v c → orderOf c = 2) ∧
      ∀ c c', IsComplexConjugation v c → IsComplexConjugation v c' → IsConj c c' := by
  sorry

variable {A : Type*} [CommRing A]

/-- A character `μ : G_F → Aˣ` is totally odd if `μ(c_v) = −1` at every real place. -/
def IsTotallyOddChar (μ : Field.absoluteGaloisGroup F →* Aˣ) : Prop :=
  ∀ v : InfinitePlace F, v.IsReal → ∀ c, IsComplexConjugation v c → μ c = -1

variable [TopologicalSpace A] {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M]
  [Module.Projective A M] [Module.Free A M] [TopologicalSpace M] [IsModuleTopology A M]

/-- A rank-two representation is odd at the real place `v` if `det ρ(c_v) = −1`; over a reduced
ring with `2 = 0` this is automatic, and `ρ(c_v) ≠ 1` is the separate condition
`IsNontrivialAt` (§4.1). -/
def IsOddAt (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (v : InfinitePlace F) : Prop :=
  ∀ c, IsComplexConjugation v c → LinearMap.det (ρ c) = -1

/-- `ρ` is odd if it is odd at every real place (vacuous without real places). -/
def IsOdd (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) : Prop :=
  ∀ v : InfinitePlace F, v.IsReal → IsOddAt ρ v

/-- `ρ(c_v) ≠ 1` for the complex conjugations at `v`. -/
def IsNontrivialAt (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (v : InfinitePlace F) :
    Prop :=
  ∀ c, IsComplexConjugation v c → ρ c ≠ LinearMap.id

/-- Oddness is preserved by twisting with a continuous character (rank two). -/
theorem isOdd_twist [IsTopologicalRing A] (hM : Module.finrank A M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (ψ : Field.absoluteGaloisGroup F →ₜ* Aˣ) : IsOdd (ρ.twist ψ) ↔ IsOdd ρ := by
  sorry

/-- Over a field of characteristic `≠ 2`, a rank-two `ρ` is odd at `v` iff `ρ(c_v)` is conjugate to
`diag(1, −1)`, iff `tr ρ(c_v) = 0`. -/
theorem isOddAt_iff_conj_diag {K : Type*} [Field K] [TopologicalSpace K]
    {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [TopologicalSpace V]
    [IsModuleTopology K V] (hK : (2 : K) ≠ 0) (hV : Module.finrank K V = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) K V) (v : InfinitePlace F) (hv : v.IsReal) :
    (IsOddAt ρ v ↔ ∀ c, IsComplexConjugation v c → ∃ b : Module.Basis (Fin 2) K V,
      LinearMap.toMatrix b b (ρ c) = Matrix.diagonal ![1, -1]) ∧
    (IsOddAt ρ v ↔ ∀ c, IsComplexConjugation v c → LinearMap.trace K V (ρ c) = 0) := by
  sorry

/-- An irreducible rank-two `ρ` over a field, odd at a real place (characteristic `≠ 2`) or with
`ρ(c_v) ≠ 1` (characteristic `2`), is absolutely irreducible (Serre 1987, 3.3; Khare–Wintenberger
2009 I, Lemma 6.1). -/
theorem isAbsolutelyIrreducible_of_isOddAt {k : Type*} [Field k] [TopologicalSpace k]
    [IsTopologicalRing k] {V : Type*} [AddCommGroup V] [Module k V] [Module.Finite k V]
    [TopologicalSpace V] [IsModuleTopology k V] (hV : Module.finrank k V = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k V) (v : InfinitePlace F) (hv : v.IsReal)
    (hirr : ρ.toRepresentation.IsIrreducible) :
    ((2 : k) ≠ 0 → IsOddAt ρ v → ρ.IsAbsolutelyIrreducible) ∧
      ((2 : k) = 0 → IsNontrivialAt ρ v → ρ.IsAbsolutelyIrreducible) := by
  sorry

-- `−1` at complex conjugation is not odd (determinant `1`), although it is nontrivial there.
/-- Scalar minus one at complex conjugation fails rank-two oddness. -/
theorem scalar_minus_one_not_odd {k : Type*} [Field k] [TopologicalSpace k] (hk : (2 : k) ≠ 0)
    {V : Type*} [AddCommGroup V] [Module k V] [Module.Finite k V] [TopologicalSpace V]
    [IsModuleTopology k V] (hV : Module.finrank k V = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) k V) (v : InfinitePlace ℚ) (hv : v.IsReal)
    (hc : ∀ c, IsComplexConjugation v c → ρ c = -LinearMap.id) :
    ¬ IsOddAt ρ v ∧ IsNontrivialAt ρ v := by
  sorry

-- Over `F₂` every rank-two representation is odd: the condition is vacuous there.
/-- Every rank-two residual representation in characteristic two satisfies the determinant oddness condition. -/
theorem rank_two_char_two_odd {V : Type*} [AddCommGroup V] [Module (ZMod 2) V] [Module.Finite (ZMod 2) V]
    [TopologicalSpace (ZMod 2)] [TopologicalSpace V] [IsModuleTopology (ZMod 2) V]
    (hV : Module.finrank (ZMod 2) V = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 2) V) : IsOdd ρ := by
  sorry

-- Without real places every representation is odd.
omit [NumberField F] [Module.Free A M] in
/-- Oddness at real places is vacuous over a totally imaginary field. -/
theorem totally_imaginary_odd (hF : ∀ v : InfinitePlace F, ¬ v.IsReal)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) : IsOdd ρ :=
  fun v hv => absurd hv (hF v)

end Oddness

end GaloisRep

/-! ### Subgroups of `GL₂` over finite fields -/

namespace GL2Cartan

section Cartan

variable {k : Type*} [Field k] {V : Type*} [AddCommGroup V] [Module k V]

/-- The split Cartan subgroup `C_s(D₁, D₂)`, the stabiliser of two lines (§4.2). -/
def split (D₁ D₂ : Submodule k V) : Subgroup (LinearMap.GeneralLinearGroup k V) where
  carrier := {s | D₁.map (s : V →ₗ[k] V) = D₁ ∧ D₂.map (s : V →ₗ[k] V) = D₂}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The non-split Cartan subgroup `C_ns(k') = k'ˣ ⊂ GL(V)` of a quadratic subfield
`k' ⊂ End_k(V)`. -/
def nonsplit (k' : Subalgebra k (Module.End k V)) : Subgroup (LinearMap.GeneralLinearGroup k V) :=
  (Units.map k'.val.toRingHom.toMonoidHom).range

/-- The split half-Cartan `C'(D₁, D₂)`: elements of `C_s(D₁, D₂)` acting trivially on `D₂`. -/
def halfSplit (D₁ D₂ : Submodule k V) : Subgroup (LinearMap.GeneralLinearGroup k V) where
  carrier := {s | D₁.map (s : V →ₗ[k] V) = D₁ ∧ ∀ x ∈ D₂, (s : V →ₗ[k] V) x = x}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `C` is a Cartan subgroup: split for two distinct lines, or non-split for a quadratic subfield
of `End_k(V)`. -/
def IsCartan (C : Subgroup (LinearMap.GeneralLinearGroup k V)) : Prop :=
  (∃ D₁ D₂ : Submodule k V, Module.finrank k D₁ = 1 ∧ Module.finrank k D₂ = 1 ∧ D₁ ≠ D₂ ∧
      C = split D₁ D₂) ∨
    ∃ k' : Subalgebra k (Module.End k V), IsField k' ∧ Module.finrank k k' = 2 ∧ C = nonsplit k'

/-- `[N(C) : C] = 2` for `C` non-split, or split with `q ≥ 3`. -/
theorem normalizer_index [Finite k] (hV : Module.finrank k V = 2)
    (C : Subgroup (LinearMap.GeneralLinearGroup k V)) (hC : IsCartan C)
    (h3 : 3 ≤ Nat.card k ∨ ∃ k' : Subalgebra k (Module.End k V), IsField k' ∧
      Module.finrank k k' = 2 ∧ C = nonsplit k') :
    C.relIndex (Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup k V))) = 2 := by
  sorry

/-- For `p ≠ 2` and `Tr(s)² − 4 det(s) ≠ 0`, `s` lies in a unique Cartan subgroup, split iff the
discriminant is a square. -/
theorem exists_unique_of_disc_ne_zero [Finite k] (hk : ringChar k ≠ 2)
    (hV : Module.finrank k V = 2) (s : LinearMap.GeneralLinearGroup k V)
    (hs : LinearMap.trace k V (s : V →ₗ[k] V) ^ 2 - 4 * LinearMap.det (s : V →ₗ[k] V) ≠ 0) :
    (∃! C : Subgroup (LinearMap.GeneralLinearGroup k V), IsCartan C ∧ s ∈ C) ∧
      (IsSquare (LinearMap.trace k V (s : V →ₗ[k] V) ^ 2 - 4 * LinearMap.det (s : V →ₗ[k] V)) ↔
        ∃ D₁ D₂ : Submodule k V, Module.finrank k D₁ = 1 ∧ Module.finrank k D₂ = 1 ∧
          D₁ ≠ D₂ ∧ s ∈ split D₁ D₂) := by
  sorry

-- A non-split Cartan has `q² − 1` elements and its normaliser `2(q² − 1)`; outside a Cartan in its
-- normaliser (non-split, or split with `q ≥ 3`) elements have trace zero and scalar square.
/-- A nonsplit Cartan and its normalizer have the expected orders and the outside elements have trace zero. -/
theorem nonsplit_cartan_card_and_normalizer [Finite k] (hV : Module.finrank k V = 2) (k' : Subalgebra k (Module.End k V))
    (hk' : IsField k') (hcard : Nat.card k' = Nat.card k ^ 2) :
    Nat.card (nonsplit k') = Nat.card k ^ 2 - 1 ∧
      Nat.card (Subgroup.normalizer (nonsplit k' : Set (LinearMap.GeneralLinearGroup k V))) =
        2 * (Nat.card k ^ 2 - 1) := by
  sorry

-- For `q = 2` the split Cartan is trivial and its normaliser is everything (index `6 ≠ 2`).
-- In a basis along the two lines, `[[0,1],[1,1]]` normalises it but does not preserve their pair.
/-- Over F₂ the trivial split Cartan has the full linear group as normalizer. -/
theorem split_cartan_F2_normalizer (hk : Nat.card k = 2) (hV : Module.finrank k V = 2) (D₁ D₂ : Submodule k V)
    (h₁ : Module.finrank k D₁ = 1) (h₂ : Module.finrank k D₂ = 1) (hne : D₁ ≠ D₂) :
    split D₁ D₂ = ⊥ ∧
      Subgroup.normalizer (split D₁ D₂ : Set (LinearMap.GeneralLinearGroup k V)) = ⊤ ∧
      ∃ g : LinearMap.GeneralLinearGroup k V,
        g ∈ Subgroup.normalizer (split D₁ D₂ : Set (LinearMap.GeneralLinearGroup k V)) ∧
        D₁.map (g : V →ₗ[k] V) = D₂ ∧ D₂.map (g : V →ₗ[k] V) ≠ D₁ ∧
        D₂.map (g : V →ₗ[k] V) ≠ D₂ := by
  sorry

end Cartan

/-- Serre's Proposition 14 over `F_ℓ`: a Cartan subgroup (resp. split half-Cartan) inside the
normaliser of a Cartan subgroup `C` equals `C` (resp. lies in `C`), provided `ℓ ≥ 5` when it is
split and `ℓ ≥ 3` otherwise (Serre 1972, §2.2). -/
theorem eq_of_le_normalizer {ℓ : ℕ} [Fact ℓ.Prime] {V : Type*} [AddCommGroup V]
    [Module (ZMod ℓ) V] (hV : Module.finrank (ZMod ℓ) V = 2)
    (C : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) (hC : IsCartan C) :
    (∀ D₁ D₂ : Submodule (ZMod ℓ) V, Module.finrank (ZMod ℓ) D₁ = 1 →
        Module.finrank (ZMod ℓ) D₂ = 1 → D₁ ≠ D₂ → 5 ≤ ℓ →
        (split D₁ D₂ ≤ Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) →
          split D₁ D₂ = C) ∧
        (halfSplit D₁ D₂ ≤
            Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) →
          halfSplit D₁ D₂ ≤ C)) ∧
      ∀ k' : Subalgebra (ZMod ℓ) (Module.End (ZMod ℓ) V), IsField k' →
        Module.finrank (ZMod ℓ) k' = 2 → 3 ≤ ℓ →
        nonsplit k' ≤ Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) →
        nonsplit k' = C := by
  sorry

end GL2Cartan

namespace GL2Subgroup

open Matrix

/-- Serre's Propositions 15–16: for `G ≤ GL(V)`, `V` a plane over `F_ℓ`: if `ℓ ∣ #G` then `G ⊇ SL(V)`
or `G` fixes a line; otherwise `G` lies in a Cartan subgroup or its normaliser, or has projective
image `A₄`, `S₄` or `A₅` (Serre 1972, Props. 15–16). -/
theorem serre_prop15_prop16 {ℓ : ℕ} [Fact ℓ.Prime] {V : Type*} [AddCommGroup V]
    [Module (ZMod ℓ) V] (hV : Module.finrank (ZMod ℓ) V = 2)
    (G : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) :
    let π := QuotientGroup.mk' (Subgroup.center (LinearMap.GeneralLinearGroup (ZMod ℓ) V))
    (ℓ ∣ Nat.card G →
        (∀ s : LinearMap.GeneralLinearGroup (ZMod ℓ) V,
          LinearMap.det (s : V →ₗ[ZMod ℓ] V) = 1 → s ∈ G) ∨
        ∃ D : Submodule (ZMod ℓ) V, Module.finrank (ZMod ℓ) D = 1 ∧
          ∀ s ∈ G, D.map (s : V →ₗ[ZMod ℓ] V) = D) ∧
      (¬ ℓ ∣ Nat.card G →
        (∃ C : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V), GL2Cartan.IsCartan C ∧ G ≤ C) ∨
        (∃ C : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V), GL2Cartan.IsCartan C ∧
          G ≤ Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod ℓ) V))) ∨
        Nonempty (G.map π ≃* alternatingGroup (Fin 4)) ∨
        Nonempty (G.map π ≃* Equiv.Perm (Fin 4)) ∨
        Nonempty (G.map π ≃* alternatingGroup (Fin 5))) := by
  sorry

/-- A nontrivial finite `p`-subgroup of `GL(V)`, `V` a plane in characteristic `p`, consists of
unipotent elements of exponent `p`, fixes exactly one line pointwise, and its normaliser stabilises
that line (Serre 1972, §2.3). -/
theorem pSubgroup_fixes_unique_line {p : ℕ} [Fact p.Prime] {k : Type*} [Field k] [CharP k p]
    {V : Type*} [AddCommGroup V] [Module k V] (hV : Module.finrank k V = 2)
    (P : Subgroup (LinearMap.GeneralLinearGroup k V)) [Finite P] (hP : IsPGroup p P)
    (hP1 : P ≠ ⊥) :
    (∀ s ∈ P, IsNilpotent ((s : Module.End k V) - 1) ∧ s ^ p = 1) ∧
      ∃! D : Submodule k V, Module.finrank k D = 1 ∧
        (∀ s ∈ P, ∀ x ∈ D, (s : V →ₗ[k] V) x = x) ∧
        ∀ s ∈ Subgroup.normalizer (P : Set (LinearMap.GeneralLinearGroup k V)),
          D.map (s : V →ₗ[k] V) = D := by
  sorry

/-- Dickson: for a finite field `k` and `G ≤ GL₂(k)` spanning `M₂(k̄)`, the projective image in
`PGL₂(k̄)` is dihedral of order `2n` (`n ≥ 2`, `p ∤ n`), `A₄`, `S₄`, `A₅`, or conjugate to the image
of `SL₂(F₀)` or `GL₂(F₀)` with `F₀` generated by the `Tr(g)²/det(g)` (DDT, Thm 2.47;
Khare–Wintenberger 2009 I, §6). -/
theorem dickson_projectiveImage {p : ℕ} [Fact p.Prime] {k : Type*} [Field k] [Finite k]
    [CharP k p] (G : Subgroup (GL (Fin 2) k))
    (hG : Submodule.span (AlgebraicClosure k)
      (Set.range fun g : G => ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k).map
        (algebraMap k (AlgebraicClosure k))) = ⊤) :
    let πG : Subgroup (ProjGenLinGroup (Fin 2) (AlgebraicClosure k)) :=
      (G.map (GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k)))).map ProjGenLinGroup.mk
    let F₀ : Subfield k := Subfield.closure
      (Set.range fun g : G => (Matrix.trace ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k)) ^ 2 /
        Matrix.det ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k))
    let ι : F₀ →+* AlgebraicClosure k := (algebraMap k (AlgebraicClosure k)).comp F₀.subtype
    (∃ n : ℕ, 2 ≤ n ∧ ¬ p ∣ n ∧ Nonempty (πG ≃* DihedralGroup n)) ∨
      Nonempty (πG ≃* alternatingGroup (Fin 4)) ∨ Nonempty (πG ≃* Equiv.Perm (Fin 4)) ∨
      Nonempty (πG ≃* alternatingGroup (Fin 5)) ∨
      ∃ x : ProjGenLinGroup (Fin 2) (AlgebraicClosure k),
        πG = ((SpecialLinearGroup.map ι).range.map
            (ProjGenLinGroup.mk.comp SpecialLinearGroup.toGL)).map (MulAut.conj x).toMonoidHom ∨
        πG = ((GeneralLinearGroup.map ι).range.map ProjGenLinGroup.mk).map
            (MulAut.conj x).toMonoidHom := by
  sorry

/-- A finite subgroup of `PGL₂(K)`, `K` algebraically closed, of order prime to the
characteristic, is cyclic, dihedral, `A₄`, `S₄` or `A₅` (Dickson 1901, §256). -/
theorem finite_subgroup_PGL2_of_prime_to_char {K : Type*} [Field K] [IsAlgClosed K]
    (H : Subgroup (Matrix.ProjGenLinGroup (Fin 2) K)) [Finite H]
    (hH : ¬ ringChar K ∣ Nat.card H) :
    IsCyclic H ∨ (∃ n : ℕ, 2 ≤ n ∧ Nonempty (H ≃* DihedralGroup n)) ∨
      Nonempty (H ≃* alternatingGroup (Fin 4)) ∨ Nonempty (H ≃* Equiv.Perm (Fin 4)) ∨
      Nonempty (H ≃* alternatingGroup (Fin 5)) := by
  sorry

/-- For `ℓ` prime and `a, b ≠ 0`, `(1 a; 0 1)` and `(1 0; b 1)` generate `SL₂(F_ℓ)` (false over
`F₉`) (Serre 1972, Prop. 15). -/
theorem closure_two_transvections_eq_top {ℓ : ℕ} [Fact ℓ.Prime] (a b : ZMod ℓ) (ha : a ≠ 0)
    (hb : b ≠ 0) (x y : Matrix.SpecialLinearGroup (Fin 2) (ZMod ℓ))
    (hx : (x : Matrix (Fin 2) (Fin 2) (ZMod ℓ)) = !![1, a; 0, 1])
    (hy : (y : Matrix (Fin 2) (Fin 2) (ZMod ℓ)) = !![1, 0; b, 1]) :
    Subgroup.closure {x, y} = ⊤ := by
  sorry

/-- An irreducible `G ≤ GL₂(k)`, `k` algebraically closed, with abelian projective image has
`char k ≠ 2` and projective image `(ℤ/2)²`; its non-scalar elements have trace zero
(Dieulefait–Pacetti 2021, Lemma 1.13). -/
theorem projImage_klein_of_irreducible_of_abelian {k : Type*} [Field k] [IsAlgClosed k]
    (G : Subgroup (GL (Fin 2) k))
    (hirr : Submodule.span k
      (Set.range fun g : G => ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k)) = ⊤)
    (hab : ∀ x ∈ G.map Matrix.ProjGenLinGroup.mk, ∀ y ∈ G.map Matrix.ProjGenLinGroup.mk,
      x * y = y * x) :
    (2 : k) ≠ 0 ∧ Nat.card (G.map Matrix.ProjGenLinGroup.mk) = 4 ∧
      (∀ x ∈ G.map Matrix.ProjGenLinGroup.mk, x ^ 2 = 1) ∧
      ∀ g ∈ G, (∀ a : k, ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k) ≠
        Matrix.scalar (Fin 2) a) → Matrix.trace ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k) = 0 := by
  sorry

/-- A proper subgroup of `PSL₂(F_q)`, `q ∉ {2, 3, 5, 7, 9, 11}`, has index at least `q + 1`
(Dickson 1901, §262). -/
theorem index_ge_of_ne_top_PSL2 {k : Type*} [Field k] [Finite k]
    (hq : Nat.card k ∉ ({2, 3, 5, 7, 9, 11} : Set ℕ))
    (H : Subgroup (Matrix.ProjectiveSpecialLinearGroup (Fin 2) k)) (hH : H ≠ ⊤) :
    Nat.card k + 1 ≤ H.index := by
  sorry

/-- For `q ≥ 4`, every normal subgroup of `GL₂(F_q)` contains `SL₂(F_q)` or is central.
Mathlib's `Matrix.SL2.commutator_eq_top` provides matrix `SL₂` perfectness, and
`Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'` provides `PSL₂` simplicity, using an
element outside `{0, 1, −1}` in `F_q` (§4.3). -/
theorem normal_subgroups_GL2 {k : Type*} [Field k] [Finite k] (hq : 4 ≤ Nat.card k) :
    ∀ N : Subgroup (GL (Fin 2) k), N.Normal →
      (Matrix.SpecialLinearGroup.toGL : Matrix.SpecialLinearGroup (Fin 2) k →* _).range ≤ N ∨
        N ≤ Subgroup.center (GL (Fin 2) k) := by
  sorry

/-- For `p ≥ 5`, `a ≥ 2` and a finite `G ≤ GL₂(F̄_p)` containing `g SL₂(F_{p^a}) g⁻¹`, every
subgroup of index `< 2p` contains the same conjugate (Dickson 1901, §262, through
`index_ge_of_ne_top_PSL2` and `Matrix.SL2.commutator_eq_top`; Newton–Thorne 2026, Lemma 2.3(3),
states persistence for `a ≥ a₀(p) ≥ 3`). -/
theorem le_of_relIndex_lt {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p) (a : ℕ) (ha : 2 ≤ a)
    (F₀ : Subfield (AlgebraicClosure (ZMod p))) (hF₀ : Nat.card F₀ = p ^ a)
    (g : GL (Fin 2) (AlgebraicClosure (ZMod p)))
    (G H : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod p)))) [Finite G]
    (hSG : ((Matrix.SpecialLinearGroup.toGL.comp
      (Matrix.SpecialLinearGroup.map F₀.subtype)).range.map (MulAut.conj g).toMonoidHom) ≤ G)
    (hHG : H ≤ G) (hindex : H.relIndex G < 2 * p) :
    ((Matrix.SpecialLinearGroup.toGL.comp
      (Matrix.SpecialLinearGroup.map F₀.subtype)).range.map (MulAut.conj g).toMonoidHom) ≤ H := by
  sorry

/-- Characteristic two: for `F₀ ⊂ F` finite of characteristic `2` with `#F₀ ≥ 4`, the
`SL₂(F₀)`-invariants of `M₂(F)` are the scalars and its only stable subspaces are `0`, `F·1`, the
trace-zero matrices and `M₂(F)` (Khare–Wintenberger 2009 II, Lemma 4.3). -/
theorem sl2_submodules_charTwo {F : Type*} [Field F] [Finite F] [CharP F 2] (F₀ : Subfield F)
    (hF₀ : 4 ≤ Nat.card F₀) :
    let G₀ := (Matrix.SpecialLinearGroup.map F₀.subtype :
      Matrix.SpecialLinearGroup (Fin 2) F₀ →* Matrix.SpecialLinearGroup (Fin 2) F).range
    (∀ X : Matrix (Fin 2) (Fin 2) F,
      (∀ g ∈ G₀, (g : Matrix (Fin 2) (Fin 2) F) * X = X * (g : Matrix (Fin 2) (Fin 2) F)) ↔
        X ∈ Submodule.span F {(1 : Matrix (Fin 2) (Fin 2) F)}) ∧
    ∀ W : Submodule F (Matrix (Fin 2) (Fin 2) F),
      (∀ g ∈ G₀, ∀ X ∈ W, (g : Matrix (Fin 2) (Fin 2) F) * X *
          ((g⁻¹ : Matrix.SpecialLinearGroup (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) ∈ W) →
        W = ⊥ ∨ W = Submodule.span F {1} ∨ W = LinearMap.ker (Matrix.traceLinearMap (Fin 2) F F) ∨
          W = ⊤ := by
  sorry

end GL2Subgroup

namespace GaloisRep

/-! ### Dihedral and bad dihedral images -/

/-- For profinite `Γ`, algebraically closed `k` and `ρ : Γ → GL₂(k)` with finite projective image,
`ρ` is irreducible with dihedral projective image of order `2n` (`n ≥ 2`) iff it is induced from
an open index-two `Δ` and a character `χ ≠ χ^σ` (Serre 1972, §2.6). -/
theorem dihedral_iff_induced {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ] [TotallyDisconnectedSpace Γ] {k : Type*} [Field k] [IsAlgClosed k]
    (ρ : Γ →* GL (Fin 2) k)
    (hopen : IsOpen ((Matrix.ProjGenLinGroup.mk.comp ρ).ker : Set Γ))
    (hfin : Finite (Matrix.ProjGenLinGroup.mk.comp ρ).range) :
    ((Submodule.span k (Set.range fun g => ((ρ g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k)) = ⊤) ∧
        ∃ n : ℕ, 2 ≤ n ∧ Nonempty ((Matrix.ProjGenLinGroup.mk.comp ρ).range ≃* DihedralGroup n)) ↔
      ∃ Δ : Subgroup Γ, IsOpen (Δ : Set Γ) ∧ Δ.index = 2 ∧
        ∃ D : Submodule k (Fin 2 → k), Module.finrank k D = 1 ∧
          (∀ δ ∈ Δ, D.map (Matrix.toLin' (ρ δ : Matrix (Fin 2) (Fin 2) k)) = D) ∧
          (∀ g ∉ Δ, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) ≠ D) ∧
          ∃ δ ∈ Δ, ∀ a : k, (ρ δ : Matrix (Fin 2) (Fin 2) k) ≠ Matrix.scalar (Fin 2) a := by
  sorry

section BadDihedral

/-- The cyclotomic field `F(ζ_p)` inside `F̄`. -/
def cyclotomicSubfield (F : Type*) [Field F] (p : ℕ) : IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.adjoin F {ζ : AlgebraicClosure F | IsPrimitiveRoot ζ p}

/-- `F' ⊂ F(ζ_p)`: the fixed field of the squares of `Gal(F(ζ_p)/F)` (`F' = F` when
`[F(ζ_p) : F]` is odd). -/
def cyclotomicSquareSubfield (F : Type*) [Field F] (p : ℕ) :
    IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.lift (IntermediateField.fixedField
    (Subgroup.closure {σ : cyclotomicSubfield F p ≃ₐ[F] cyclotomicSubfield F p | ∃ τ, σ = τ ^ 2}))

/-- Restriction of a representation of `G_F` to the fixing subgroup `G_E` of an intermediate field. -/
def resFixingSubgroup {F : Type*} [Field F] (E : IntermediateField F (AlgebraicClosure F))
    {A : Type*} [CommRing A] [TopologicalSpace A]
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) :
    ContinuousRep (E.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)) A M :=
  ρ.res ⟨(E.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)).subtype,
    continuous_subtype_val⟩

/-- For `F = ℚ` and `p` odd, `F' = ℚ(√p*)`, `p* = (−1)^{(p−1)/2} p`. -/
theorem cyclotomicSquareSubfield_rat (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    cyclotomicSquareSubfield ℚ p = IntermediateField.adjoin ℚ
      {x : AlgebraicClosure ℚ | x ^ 2 = (((-1) ^ ((p - 1) / 2) * p : ℤ) : AlgebraicClosure ℚ)} := by
  sorry

variable {F : Type*} [Field F] {k : Type*} [Field k] [TopologicalSpace k] [IsTopologicalRing k]
  {M : Type*} [AddCommGroup M] [Module k M] [Module.Finite k M] [TopologicalSpace M]
  [IsModuleTopology k M]

/-- `ρ̄` is bad dihedral at `p` if it is absolutely irreducible while its restriction to `G_{F'}` is
not (Dieulefait–Pacetti 2021, Def. 1.12). -/
def IsBadDihedral (p : ℕ) (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) : Prop :=
  ρ.IsAbsolutelyIrreducible ∧
    ¬ (resFixingSubgroup (cyclotomicSquareSubfield F p) ρ).IsAbsolutelyIrreducible

/-- For `p` odd, absolute irreducibility on `G_{F'}`, on `G_{F(ζ_p)}` and on `G_{F(ζ_{p^m})}` are
equivalent; in particular bad dihedral iff absolutely irreducible but not on `G_{F(ζ_p)}`
(Dieulefait–Pacetti 2021, Lemmas 1.13–1.14). -/
theorem isAbsolutelyIrreducible_res_cyclotomic_iff [NumberField F] {p : ℕ} [Fact p.Prime]
    (hp : p ≠ 2) (m : ℕ) (hm : 1 ≤ m) [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) :
    ((resFixingSubgroup (cyclotomicSquareSubfield F p) ρ).IsAbsolutelyIrreducible ↔
        (resFixingSubgroup (cyclotomicSubfield F p) ρ).IsAbsolutelyIrreducible) ∧
      ((resFixingSubgroup (cyclotomicSubfield F p) ρ).IsAbsolutelyIrreducible ↔
        (resFixingSubgroup (cyclotomicSubfield F (p ^ m)) ρ).IsAbsolutelyIrreducible) := by
  sorry

/-- A bad dihedral `ρ̄` has `[F' : F] = 2`, is induced from `G_{F'}` (over `k̄`, a `G_{F'}`-stable line
moved by `G_F ∖ G_{F'}`) and has image of order prime to `p`; being bad dihedral is invariant
under twists. -/
theorem IsBadDihedral.isInduced [NumberField F] {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    {ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M} (hρ : IsBadDihedral p ρ)
    (ψ : Field.absoluteGaloisGroup F →ₜ* kˣ) :
    ((cyclotomicSquareSubfield F p).fixingSubgroup :
        Subgroup (Field.absoluteGaloisGroup F)).index = 2 ∧
    (∃ D : Submodule (AlgebraicClosure k) (AlgebraicClosure k ⊗[k] M),
        Module.finrank (AlgebraicClosure k) D = 1 ∧
        (∀ g ∈ ((cyclotomicSquareSubfield F p).fixingSubgroup :
            Subgroup (Field.absoluteGaloisGroup F)),
          D.map ((ρ g).baseChange (AlgebraicClosure k)) = D) ∧
        ∀ g ∉ ((cyclotomicSquareSubfield F p).fixingSubgroup :
            Subgroup (Field.absoluteGaloisGroup F)),
          D.map ((ρ g).baseChange (AlgebraicClosure k)) ≠ D) ∧
      Nat.Coprime (Nat.card ρ.toRepresentation.toHomUnits.range) p ∧
      IsBadDihedral p (ρ.twist ψ) := by
  sorry

/-- If `ρ̄` is irreducible and `ρ̄|_{G_{F(ζ_p)}}` is not absolutely irreducible, the image of `ρ̄`
lies in the normaliser of a Cartan subgroup (Caraiani–Newton 2023, Lemma 7.1.1(1), stated there
over `F_p` with `det ρ̄ = ε̄_p`; Clifford theory for the cyclic cyclotomic quotient gives the
finite-coefficient-field statement without that determinant hypothesis). -/
theorem image_le_normalizer_cartan_of_res_cyclotomic [NumberField F] {p : ℕ} [Fact p.Prime]
    [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M)
    (hirr : ρ.toRepresentation.IsIrreducible)
    (hred : ¬ (resFixingSubgroup (cyclotomicSubfield F p) ρ).IsAbsolutelyIrreducible) :
    ∃ C : Subgroup (LinearMap.GeneralLinearGroup k M), GL2Cartan.IsCartan C ∧
      ρ.toRepresentation.toHomUnits.range ≤
        Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup k M)) := by
  sorry

-- If `[F(ζ_p) : F]` is odd then `F' = F` and nothing is bad dihedral.
/-- Odd cyclotomic degree makes the square subfield trivial and excludes bad-dihedral representations. -/
theorem odd_cyclotomic_degree_not_bad_dihedral [NumberField F] {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) [Finite k] [CharP k p]
    (hodd : Odd (Module.finrank F (cyclotomicSubfield F p)))
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) :
    cyclotomicSquareSubfield F p = ⊥ ∧ ¬ IsBadDihedral p ρ := by
  sorry

-- For `F = ℚ(√5)` and `p = 5`, `F(√p*) = F` but `F' = F(ζ₅) ≠ F`: adjoining `√p*` is the wrong
-- definition of `F'`.
/-- Over a field containing the square root of five the cyclotomic square subfield is not obtained by adjoining that root. -/
theorem cyclotomic_square_subfield_sqrt_five [NumberField F] (h5 : ∃ x : F, x ^ 2 = 5) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ 5) :
    IntermediateField.adjoin F {x : AlgebraicClosure F | x ^ 2 = 5} = ⊥ ∧
      cyclotomicSquareSubfield F 5 = cyclotomicSubfield F 5 ∧ cyclotomicSubfield F 5 ≠ ⊥ := by
  sorry

end BadDihedral

-- The representation of `G_ℚ` over `F₂₃` cutting out the splitting field of `x³ − x − 1` (image
-- `S₃`) is bad dihedral at `23`, although its restriction to `G_{ℚ(√−23)}` is irreducible over `F₂₃`.
/-- The cubic S₃ representation at twenty-three distinguishes irreducibility from absolute irreducibility in bad-dihedral restriction. -/
theorem bad_dihedral_F23_not_absolute [Fact (Nat.Prime 23)] [TopologicalSpace (ZMod 23)] [IsTopologicalRing (ZMod 23)]
    {M : Type*} [AddCommGroup M] [Module (ZMod 23) M] [Module.Finite (ZMod 23) M]
    [TopologicalSpace M] [IsModuleTopology (ZMod 23) M] (hM : Module.finrank (ZMod 23) M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 23) M)
    (hker : ρ.toRepresentation.ker = ((IntermediateField.adjoin ℚ
      ((X ^ 3 - X - 1 : (Polynomial ℚ)).rootSet (AlgebraicClosure ℚ))).fixingSubgroup :
        Subgroup (Field.absoluteGaloisGroup ℚ))) :
    IsBadDihedral 23 ρ ∧
      (resFixingSubgroup (cyclotomicSquareSubfield ℚ 23) ρ).toRepresentation.IsIrreducible := by
  sorry

/-- For discrete coefficients and the kernel field `K`, if a finite `F' ⊂ F̄` meets `K` only in `F`
then `ρ(G_{F'}) = ρ(G_F)` (Allen et al. 2023, proof of Lemma 7.1.6, p. 1090). -/
theorem image_res_eq_of_disjoint {F : Type*} [Field F] {A : Type*} [CommRing A]
    [TopologicalSpace A] [DiscreteTopology A]
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (F' : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F F']
    (hdisj : IntermediateField.fixedField
      (ρ.toRepresentation.ker : Subgroup (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F)) ⊓ F' = ⊥) :
    (F'.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)).map
        ρ.toRepresentation.toHomUnits = ρ.toRepresentation.toHomUnits.range := by
  sorry

end GaloisRep

/-! ## Layer 5: recognition by Frobenius polynomials -/

namespace GaloisRep

section Frobenius

variable {K : Type*} [Field K] [NumberField K]

/-- The set of arithmetic Frobenius lifts at the primes of `K̄` above a set `Pl` of places. -/
def frobeniusSet (Pl : Set (HeightOneSpectrum (𝓞 K))) : Set (Field.absoluteGaloisGroup K) :=
  {σ | ∃ Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K)), Q.IsMaximal ∧
    (∃ v ∈ Pl, Q.under (𝓞 K) = v.asIdeal) ∧ IsArithFrobAtIntegralPrime σ Q}

/-- The Frobenius elements above a set of places of Dirichlet density one are dense in `G_K`
(Deligne–Serre 1974, 6.12); hence two continuous maps to a Hausdorff space agreeing on them are
equal (DDT, Thm 2.3). -/
theorem dense_frobeniusSet (Pl : Set (HeightOneSpectrum (𝓞 K)))
    (hPl : NumberField.Set.HasDirichletDensity Pl 1) : Dense (frobeniusSet Pl) := by
  sorry

/-- For `φ : G_K → H` continuous onto a finite discrete group and `h` in its image, the places
above which some Frobenius lift maps to `h` have Dirichlet density
`#(class of h in φ(G_K))/#φ(G_K)` inside any density-one set `Pl` (Serre 1981, §2.1, Thm 1). -/
theorem hasDirichletDensity_frobenius_of_mem_range {H : Type*} [Group H] [Finite H]
    [TopologicalSpace H] [DiscreteTopology H] (φ : Field.absoluteGaloisGroup K →ₜ* H) (h : H)
    (hh : h ∈ φ.toMonoidHom.range) (Pl : Set (HeightOneSpectrum (𝓞 K)))
    (hPl : NumberField.Set.HasDirichletDensity Pl 1) :
    NumberField.Set.HasDirichletDensity
      {v : HeightOneSpectrum (𝓞 K) | v ∈ Pl ∧ ∃ σ ∈ frobeniusSet {v}, φ σ = h}
      ((Nat.card {x : φ.toMonoidHom.range // IsConj x ⟨h, hh⟩} : ℝ) /
        Nat.card φ.toMonoidHom.range) := by
  sorry

end Frobenius

/-- Infinitely many odd primes `p ∤ ∏ dᵢ` have prescribed Legendre symbols `(dᵢ/p) = εᵢ` iff
`∏_{i∈J} εᵢ = 1` whenever `∏_{i∈J} dᵢ` is a square (DDT, Thm 2.3 and remark after Thm 2.4). -/
theorem infinite_primes_jacobiSym_iff {r : ℕ} (d : Fin r → ℤ) (hd : ∀ i, d i ≠ 0)
    (ε : Fin r → ℤ) (hε : ∀ i, ε i = 1 ∨ ε i = -1) :
    {p : ℕ | p.Prime ∧ p ≠ 2 ∧ ¬ (p : ℤ) ∣ ∏ i, d i ∧ ∀ i, jacobiSym (d i) p = ε i}.Infinite ↔
      ∀ J : Finset (Fin r), IsSquare (∏ i ∈ J, d i) → ∏ i ∈ J, ε i = 1 := by
  sorry

-- Three non-squares whose product is a square are never simultaneously nonresidues.
/-- A product-square relation prevents simultaneous quadratic nonresiduosity at Frobenius primes. -/
theorem nonresidue_product_obstruction : ¬ ∃ p : ℕ, p.Prime ∧ 7 < p ∧
    jacobiSym 2 p = -1 ∧ jacobiSym 3 p = -1 ∧ jacobiSym 6 p = -1 := by
  sorry

/-! ### Recognition on a dense subset -/

section Recognition

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [CompactSpace Γ]
  [TotallyDisconnectedSpace Γ]
  {E : Type*} [Field E] [TopologicalSpace E] [IsTopologicalRing E] [T2Space E]
  {V₁ : Type*} [AddCommGroup V₁] [Module E V₁] [Module.Finite E V₁]
  [TopologicalSpace V₁] [IsModuleTopology E V₁]
  {V₂ : Type*} [AddCommGroup V₂] [Module E V₂] [Module.Finite E V₂]
  [TopologicalSpace V₂] [IsModuleTopology E V₂]

/-- Semisimple representations over a Hausdorff topological field with equal characteristic
polynomials on a dense subset are isomorphic (DDT, Prop. 2.6; Deligne–Serre 1974, Lemme 3.2). For
arbitrary representations the semisimplifications are compared (§5.3). -/
theorem iso_of_charpoly_eq_on_dense (ρ₁ : ContinuousRep Γ E V₁) (ρ₂ : ContinuousRep Γ E V₂)
    (h₁ : ρ₁.toRepresentation.IsSemisimpleRepresentation)
    (h₂ : ρ₂.toRepresentation.IsSemisimpleRepresentation) (D : Set Γ) (hD : Dense D)
    (hchar : ∀ γ ∈ D, (ρ₁ γ).charpoly = (ρ₂ γ).charpoly) : Nonempty (ContinuousRep.Iso ρ₁ ρ₂) := by
  sorry

/-- With `(dim)!` invertible, equal traces on a dense subset suffice; over `F₄` the representations
`1 ⊕ 1` and `χ ⊕ χ` of `ℤ/3` (`χ` faithful) show the hypothesis is needed. -/
theorem iso_of_trace_eq_on_dense (ρ₁ : ContinuousRep Γ E V₁) (ρ₂ : ContinuousRep Γ E V₂)
    (h₁ : ρ₁.toRepresentation.IsSemisimpleRepresentation)
    (h₂ : ρ₂.toRepresentation.IsSemisimpleRepresentation)
    (hdim : Module.finrank E V₁ = Module.finrank E V₂)
    (hfact : ((Module.finrank E V₁).factorial : E) ≠ 0) (D : Set Γ) (hD : Dense D)
    (htr : ∀ γ ∈ D, LinearMap.trace E V₁ (ρ₁ γ) = LinearMap.trace E V₂ (ρ₂ γ)) :
    Nonempty (ContinuousRep.Iso ρ₁ ρ₂) := by
  sorry

end Recognition

/-- Chebotarev recognition: semisimple representations of `G_K` whose characteristic polynomials
agree at every Frobenius element above a set of places of Dirichlet density one are isomorphic; no
finiteness of the ramification sets is assumed (DDT, Prop. 2.6 (b)). -/
theorem iso_of_frobenius_charpoly_eq {K : Type*} [Field K] [NumberField K]
    {E : Type*} [Field E] [TopologicalSpace E] [IsTopologicalRing E] [T2Space E]
    {V₁ : Type*} [AddCommGroup V₁] [Module E V₁] [Module.Finite E V₁]
    [TopologicalSpace V₁] [IsModuleTopology E V₁]
    {V₂ : Type*} [AddCommGroup V₂] [Module E V₂] [Module.Finite E V₂]
    [TopologicalSpace V₂] [IsModuleTopology E V₂]
    (ρ₁ : ContinuousRep (Field.absoluteGaloisGroup K) E V₁)
    (ρ₂ : ContinuousRep (Field.absoluteGaloisGroup K) E V₂)
    (h₁ : ρ₁.toRepresentation.IsSemisimpleRepresentation)
    (h₂ : ρ₂.toRepresentation.IsSemisimpleRepresentation)
    (Pl : Set (HeightOneSpectrum (𝓞 K))) (hPl : NumberField.Set.HasDirichletDensity Pl 1)
    (hchar : ∀ σ ∈ frobeniusSet Pl, (ρ₁ σ).charpoly = (ρ₂ σ).charpoly) :
    Nonempty (ContinuousRep.Iso ρ₁ ρ₂) := by
  sorry

-- Without continuity, agreement on the dense finite-support subgroup of `∏ ℤ/2` does not determine
-- a character: the constant-one sequence survives in the quotient.
/-- An abstract character can be trivial on the dense finite-support subgroup without being trivial everywhere. -/
theorem discontinuous_character_dense_kernel : ∃ χ : (ℕ → Multiplicative (ZMod 2)) →* (ZMod 3)ˣ,
    (∀ g, {i : ℕ | g i ≠ 1}.Finite → χ g = 1) ∧ χ (fun _ => Multiplicative.ofAdd (1 : ZMod 2)) ≠ 1 := by
  sorry

/-! ### Rank two -/

/-- For `ρ : Γ → GL₂(A)`, `T = tr ρ`, `δ = det ρ`: `T(1) = 2`, `T(gh) = T(hg)` and
`δ(g) T(g⁻¹h) − T(g) T(h) + T(gh) = 0` (Chenevier 2008, Lemma 1.9). -/
theorem trace_det_identities_of_rankTwo {A Γ : Type*} [CommRing A] [Group Γ]
    (ρ : Γ →* GL (Fin 2) A) :
    Matrix.trace ((ρ 1 : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) = 2 ∧
    (∀ g h, Matrix.trace ((ρ (g * h) : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) =
      Matrix.trace ((ρ (h * g) : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A)) ∧
    ∀ g h, Matrix.det ((ρ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) *
        Matrix.trace ((ρ (g⁻¹ * h) : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) -
      Matrix.trace ((ρ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) *
        Matrix.trace ((ρ h : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) +
      Matrix.trace ((ρ (g * h) : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) = 0 := by
  sorry

/-- For continuous `ρ₁, ρ₂ : Γ → GL₂(A)` into a Hausdorff ring, equal trace and determinant on a
dense subset give equal characteristic polynomials everywhere, in every characteristic
(Dieulefait–Pacetti 2021, Remark 4). -/
theorem charpoly_eq_of_trace_det_eq_on_dense {A Γ : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [T2Space A] [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    (ρ₁ ρ₂ : Γ →* GL (Fin 2) A)
    (h₁ : Continuous fun g => ((ρ₁ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A))
    (h₂ : Continuous fun g => ((ρ₂ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A))
    (D : Set Γ) (hD : Dense D)
    (h : ∀ g ∈ D,
      Matrix.trace ((ρ₁ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) =
        Matrix.trace ((ρ₂ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) ∧
      Matrix.det ((ρ₁ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) =
        Matrix.det ((ρ₂ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A)) :
    ∀ g, Matrix.charpoly ((ρ₁ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) =
      Matrix.charpoly ((ρ₂ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) := by
  sorry

/-! ### Image algebra, Brauer class and descent -/

section BrauerClass

universe uK

variable {k : Type*} [Field k] {K : Type uK} [Field K] [Algebra k K]
  {Γ : Type*} [Group Γ] {n : ℕ}

/-- The field of traces `k(ρ) = k(tr ρ(γ) : γ ∈ Γ)`. -/
def traceField (ρ : Γ →* GL (Fin n) K) : IntermediateField k K :=
  IntermediateField.adjoin k
    (Set.range fun γ => Matrix.trace ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K))

/-- The image algebra `B(ρ)`: the `k(ρ)`-subalgebra of `M_n(K)` generated by `ρ(Γ)`. -/
def imageAlgebra (ρ : Γ →* GL (Fin n) K) :
    Subalgebra (traceField (k := k) ρ) (Matrix (Fin n) (Fin n) K) :=
  Algebra.adjoin (traceField (k := k) ρ)
    (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K))

/-- For `ρ` absolutely irreducible (`ρ(Γ)` spans `M_n(K)`, `K` algebraically closed, `n ≥ 1`),
`B(ρ)` is central simple of dimension `n²` over `k(ρ)`, `K ⊗_{k(ρ)} B(ρ) ≅ M_n(K)` by
multiplication, and the characteristic polynomial of every `b ∈ B(ρ)` has coefficients in `k(ρ)`
(BLGGT 2014, proof of Lemma A.1.5; Chenevier 2008, Def.-Prop. 2.18). -/
theorem imageAlgebra_isCentralSimple [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    Algebra.IsCentral (traceField (k := k) ρ) (imageAlgebra (k := k) ρ) ∧
      IsSimpleRing (imageAlgebra (k := k) ρ) ∧
      Module.finrank (traceField (k := k) ρ) (imageAlgebra (k := k) ρ) = n ^ 2 ∧
      (∃ e : K ⊗[traceField (k := k) ρ] imageAlgebra (k := k) ρ ≃ₐ[K] Matrix (Fin n) (Fin n) K,
        ∀ (c : K) (b : imageAlgebra (k := k) ρ),
          e (c ⊗ₜ[traceField (k := k) ρ] b) = c • (b : Matrix (Fin n) (Fin n) K)) ∧
      ∀ (b : imageAlgebra (k := k) ρ) (i : ℕ),
        (Matrix.charpoly (b : Matrix (Fin n) (Fin n) K)).coeff i ∈ traceField (k := k) ρ := by
  sorry

/-- The Schur index `s(ρ)`: Tau Ceti's index of the central simple `k(ρ)`-algebra `B(ρ)`. -/
def schurIndex [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) : ℕ :=
  haveI := (imageAlgebra_isCentralSimple (k := k) ρ hρ).1
  haveI := (imageAlgebra_isCentralSimple (k := k) ρ hρ).2.1
  haveI : FiniteDimensional (traceField (k := k) ρ) (imageAlgebra (k := k) ρ) := sorry
  TauCeti.Algebra.index (traceField (k := k) ρ) (imageAlgebra (k := k) ρ)

/-- `s(ρ)` divides `n`, and `s(ρ) = 1` iff `B(ρ) ≅ M_n(k(ρ))` iff `ρ` is conjugate into
`GL_n(k(ρ))`; for an extension `k(ρ) ⊂ k' ⊂ K`, `ρ` is realisable over `k'` iff `k'` splits `B(ρ)`.
A finite `k(ρ)` forces `s(ρ) = 1`. -/
theorem schurIndex_dvd_and_eq_one_iff [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤)
    (k' : IntermediateField (traceField (k := k) ρ) K) :
    schurIndex (k := k) ρ hρ ∣ n ∧
      (schurIndex (k := k) ρ hρ = 1 ↔ Nonempty (imageAlgebra (k := k) ρ ≃ₐ[traceField (k := k) ρ]
        Matrix (Fin n) (Fin n) (traceField (k := k) ρ))) ∧
      (Nonempty (imageAlgebra (k := k) ρ ≃ₐ[traceField (k := k) ρ]
          Matrix (Fin n) (Fin n) (traceField (k := k) ρ)) ↔
        ∃ g : GL (Fin n) K, ∀ γ i j,
          ((g * ρ γ * g⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) i j ∈ traceField (k := k) ρ) ∧
      ((∃ g : GL (Fin n) K, ∀ γ i j,
          ((g * ρ γ * g⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) i j ∈ k') ↔
        Nonempty (k' ⊗[traceField (k := k) ρ] imageAlgebra (k := k) ρ ≃ₐ[k']
          Matrix (Fin n) (Fin n) k')) ∧
      ([Finite (traceField (k := k) ρ)] → schurIndex (k := k) ρ hρ = 1) := by
  sorry

-- For the two-dimensional irreducible representation of `Q₈` over `ℂ` and `k = ℝ`, `k(ρ) = ℝ` and
-- `B(ρ)` is Hamilton's quaternions, so `s(ρ) = 2`; for a character `B(ρ) = k(ρ)`.
/-- The complex irreducible quaternion representation has real trace field and Schur index two. -/
theorem quaternion_schurIndex_two (ρ : QuaternionGroup 2 →* GL (Fin 2) ℂ)
    (hρ : Submodule.span ℂ
      (Set.range fun γ => ((ρ γ : GL (Fin 2) ℂ) : Matrix (Fin 2) (Fin 2) ℂ)) = ⊤) :
    traceField (k := ℝ) ρ = ⊥ ∧ Nonempty (imageAlgebra (k := ℝ) ρ ≃+* Quaternion ℝ) ∧
      schurIndex (k := ℝ) ρ hρ = 2 := by
  sorry

-- For a faithful character of `ℤ/3` the `ℚ`-span of the image has dimension `2`, while the image
-- algebra over `k(χ) = ℚ(ζ₃)` has dimension `1`: the span is taken over `k(ρ)`, not `k`.
/-- A faithful cubic character has image algebra of dimension one over its trace field and dimension two over the rationals. -/
theorem cubic_character_imageAlgebra (χ : Multiplicative (ZMod 3) →* GL (Fin 1) (AlgebraicClosure ℚ))
    (hχ : Function.Injective χ) :
    Module.finrank ℚ (Submodule.span ℚ (Set.range fun γ =>
      ((χ γ : GL (Fin 1) (AlgebraicClosure ℚ)) : Matrix (Fin 1) (Fin 1) (AlgebraicClosure ℚ)))) =
        2 ∧
      Module.finrank (traceField (k := ℚ) χ) (imageAlgebra (k := ℚ) χ) = 1 := by
  sorry

end BrauerClass

/-- Absolutely irreducible representations (Burnside form) with the same trace function have the
same dimension, and in equal dimension they are conjugate, in every characteristic (Chenevier
2008, Def.-Prop. 2.18). -/
theorem conj_of_trace_eq_of_span_eq_top {k Γ : Type*} [Field k] [Group Γ] {n m : ℕ}
    [NeZero n] [NeZero m] (ρ₁ : Γ →* GL (Fin n) k) (ρ₂ : Γ →* GL (Fin m) k)
    (h₁ : Submodule.span k
      (Set.range fun γ => ((ρ₁ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)) = ⊤)
    (h₂ : Submodule.span k
      (Set.range fun γ => ((ρ₂ γ : GL (Fin m) k) : Matrix (Fin m) (Fin m) k)) = ⊤)
    (htr : ∀ γ, Matrix.trace ((ρ₁ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) =
      Matrix.trace ((ρ₂ γ : GL (Fin m) k) : Matrix (Fin m) (Fin m) k)) :
    n = m ∧ ∀ ρ₃ : Γ →* GL (Fin n) k, (∀ γ, Matrix.trace ((ρ₃ γ : GL (Fin n) k) :
        Matrix (Fin n) (Fin n) k) = Matrix.trace ((ρ₁ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)) →
      Submodule.span k
        (Set.range fun γ => ((ρ₃ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)) = ⊤ →
      ∃ g : GL (Fin n) k, ∀ γ, ρ₃ γ = g * ρ₁ γ * g⁻¹ := by
  sorry

/-- Deligne–Serre 6.13: a semisimple `φ : Φ → GL_n(k')`, `k'` finite, is realisable over every
subfield containing the coefficients of all its characteristic polynomials. -/
theorem realizable_of_charpoly_mem {Φ : Type*} [Group Φ] {k' : Type*} [Field k'] [Finite k']
    {n : ℕ} (φ : Φ →* GL (Fin n) k')
    (hss : IsSemisimpleModule (MonoidAlgebra k' Φ)
      (Representation.asModule ((Units.coeHom _).comp
        ((Matrix.GeneralLinearGroup.toLin : GL (Fin n) k' ≃* _).toMonoidHom.comp φ))))
    (k : Subfield k')
    (hk : ∀ s i, (Matrix.charpoly ((φ s : GL (Fin n) k') : Matrix (Fin n) (Fin n) k')).coeff i ∈ k) :
    ∃ g : GL (Fin n) k', ∀ s i j,
      ((g * φ s * g⁻¹ : GL (Fin n) k') : Matrix (Fin n) (Fin n) k') i j ∈ k := by
  sorry

/-- BLGGT 2014, Lemma A.1.5: for `M` of characteristic zero and `r : Γ → GL_n(M̄)` semisimple with
traces in `M` and one `r(γ₀)` with `n` distinct eigenvalues in `M`, `r` is conjugate into
`GL_n(M)`. -/
theorem conj_into_of_trace_mem_of_distinct_eigenvalues {Γ : Type*} [Group Γ]
    {M : Type*} [Field M] [CharZero M] {Mbar : Type*} [Field Mbar] [Algebra M Mbar]
    [IsAlgClosure M Mbar] {n : ℕ} (r : Γ →* GL (Fin n) Mbar)
    (hss : IsSemisimpleModule (MonoidAlgebra Mbar Γ)
      (Representation.asModule ((Units.coeHom _).comp
        ((Matrix.GeneralLinearGroup.toLin : GL (Fin n) Mbar ≃* _).toMonoidHom.comp r))))
    (htr : ∀ γ, Matrix.trace ((r γ : GL (Fin n) Mbar) : Matrix (Fin n) (Fin n) Mbar) ∈
      (algebraMap M Mbar).range)
    (γ₀ : Γ) (a : Fin n → M) (ha : Function.Injective a)
    (hγ₀ : Matrix.charpoly ((r γ₀ : GL (Fin n) Mbar) : Matrix (Fin n) (Fin n) Mbar) =
      ∏ i, (X - C (algebraMap M Mbar (a i)))) :
    ∃ g : GL (Fin n) Mbar, ∀ γ i j,
      ((g * r γ * g⁻¹ : GL (Fin n) Mbar) : Matrix (Fin n) (Fin n) Mbar) i j ∈
        (algebraMap M Mbar).range := by
  sorry

/-! ### Haar measure and Chebotarev for compact images -/

/-- For `ρ : G_K → G` continuous onto a profinite `G` with Haar probability `μ` and a clopen
conjugation-stable `C ⊂ G`, the places with a Frobenius mapped into `C` have Dirichlet density
`μ(C)`; for `C` closed and `μ`-null they have density `0` (Serre 1981, §7.2, Thm 15; CG20, App.
§A.4). -/
theorem hasDirichletDensity_frobenius_mem {K : Type*} [Field K] [NumberField K]
    {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
    (μ : MeasureTheory.Measure G) [μ.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μ]
    (ρ : Field.absoluteGaloisGroup K →ₜ* G) (hρ : Function.Surjective ρ)
    (C : Set G) (hCc : IsClosed C) (hconj : ∀ g h, g ∈ C → h * g * h⁻¹ ∈ C) :
    (IsOpen C → NumberField.Set.HasDirichletDensity
      {v : HeightOneSpectrum (𝓞 K) | ∃ σ ∈ frobeniusSet {v}, ρ σ ∈ C} (μ C).toReal) ∧
    (μ C = 0 → NumberField.Set.HasDirichletDensity
      {v : HeightOneSpectrum (𝓞 K) | ∃ σ ∈ frobeniusSet {v}, ρ σ ∈ C} 0) := by
  sorry

/-- On a compact Hausdorff second-countable topological domain without isolated points the zero set
of a nonzero polynomial in `N` variables is null for the product of additive Haar measures (Serre
1981, §6.4, proof of Prop. 13); for a finite ring this fails (`X^q − X` on `F_q`). -/
theorem measure_pi_zeroSet_eq_zero {A : Type*} [CommRing A] [IsDomain A] [TopologicalSpace A]
    [IsTopologicalRing A] [CompactSpace A] [T2Space A] [SecondCountableTopology A]
    [MeasurableSpace A] [BorelSpace A] [(nhdsWithin (0 : A) {0}ᶜ).NeBot]
    (μ : MeasureTheory.Measure A) [μ.IsAddHaarMeasure] {N : ℕ}
    (f : MvPolynomial (Fin N) A) (hf : f ≠ 0) :
    MeasureTheory.Measure.pi (fun _ : Fin N => μ)
      {x : Fin N → A | MvPolynomial.eval x f = 0} = 0 := by
  sorry

/-- On a compact Hausdorff ring, multiplication by a unit preserves additive Haar measure, and a
Haar probability measure on an open subgroup `G ≤ Aˣ` is the normalised restriction of additive
Haar measure (Serre 1981, Introduction). -/
theorem haar_eq_addHaar_div_of_isOpen {A : Type*} [Ring A] [TopologicalSpace A]
    [IsTopologicalRing A] [CompactSpace A] [T2Space A] [MeasurableSpace A] [BorelSpace A]
    (μ : MeasureTheory.Measure A) [μ.IsAddHaarMeasure]
    (G : Subgroup Aˣ) (hG : IsOpen ((fun g : Aˣ => (g : A)) '' (G : Set Aˣ)))
    [MeasurableSpace G] [BorelSpace G]
    (ν : MeasureTheory.Measure G) [ν.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure ν]
    (S : Set G) (hS : MeasurableSet S) (u : Aˣ) (T : Set A) :
    μ ((fun x => (u : A) * x) '' T) = μ T ∧
      ν S = μ ((fun g : G => ((g : Aˣ) : A)) '' S) /
        μ ((fun g : Aˣ => (g : A)) '' (G : Set Aˣ)) := by
  sorry

/-- Every `R`-algebra endomorphism of `M_d(R)`, `R` commutative local, is conjugation by an
element of `GL_d(R)`. In positive size, residue-field bijectivity makes its linear determinant a
unit, giving an algebra automorphism to which IntegralHeckeAndGaloisDeterminants §1.3's inner
conjugacy applies. Size zero has a single endomorphism and conjugator. Locality is needed
(`ℤ[√−5]` and the ideal `(2, 1 + √−5)`) (Chenevier 2008, proof of Thm 2.22 (i)). -/
theorem algHom_matrix_eq_conj_of_isLocalRing {R : Type*} [CommRing R] [IsLocalRing R] {d : ℕ}
    (φ : Matrix (Fin d) (Fin d) R →ₐ[R] Matrix (Fin d) (Fin d) R) :
    ∃ g : GL (Fin d) R, ∀ x : Matrix (Fin d) (Fin d) R,
      φ x = (g : Matrix (Fin d) (Fin d) R) * x * ((g⁻¹ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R) := by
  sorry

/-- Carayol's lemma: for `R` complete Noetherian local with finite residue field and its
`𝔪`-adic topology, two continuous lifts `r, r' : Γ → GL_d(R)` of the same absolutely irreducible
residual representation with equal traces (or characteristic polynomials) on a dense subset are
conjugate by an element congruent to `1` mod `𝔪` (Chenevier 2008, Thm 2.22 (i)). -/
theorem carayol_conj_of_trace_eq {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ] [TotallyDisconnectedSpace Γ]
    {R : Type*} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] [Finite (IsLocalRing.ResidueField R)]
    [TopologicalSpace R] [IsTopologicalRing R] (hadic : ∀ s : Set R, s ∈ nhds (0 : R) ↔
      ∃ m : ℕ, ((IsLocalRing.maximalIdeal R ^ m : Ideal R) : Set R) ⊆ s)
    {d : ℕ} (r r' : Γ →* GL (Fin d) R)
    (hr : Continuous fun γ => ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R))
    (hr' : Continuous fun γ => ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R))
    (hres : ∀ γ, ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R) =
      ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R))
    (habs : Submodule.span (IsLocalRing.ResidueField R) (Set.range fun γ =>
      ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R)) = ⊤)
    (D : Set Γ) (hD : Dense D)
    (htr : ∀ γ ∈ D, Matrix.trace ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R) =
      Matrix.trace ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R)) :
    ∃ g : GL (Fin d) R, ((g : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R) = 1) ∧
      ∀ γ, r' γ = g * r γ * g⁻¹ := by
  sorry

/-- The first step of the `GSp₄` semisimplicity criteria: if `char_ρ(Frob)(s(Frob)) = 0` at the
Frobenius elements above a density-one set of primes then `char_ρ(g)(s(g)) = 0` for every `g`
(BCGP25, §4.11). -/
theorem aeval_charpoly_eq_zero_of_frobenius {E : Type*} [Field E] [TopologicalSpace E]
    [IsTopologicalRing E] [T2Space E] {n : ℕ}
    (ρ : Field.absoluteGaloisGroup ℚ →* GL (Fin 4) E) (s : Field.absoluteGaloisGroup ℚ →* GL (Fin n) E)
    (hρ : Continuous fun g => ((ρ g : GL (Fin 4) E) : Matrix (Fin 4) (Fin 4) E))
    (hs : Continuous fun g => ((s g : GL (Fin n) E) : Matrix (Fin n) (Fin n) E))
    (Pl : Set (HeightOneSpectrum (𝓞 ℚ))) (hPl : NumberField.Set.HasDirichletDensity Pl 1)
    (hann : ∀ σ ∈ frobeniusSet Pl,
        aeval ((s σ : GL (Fin n) E) : Matrix (Fin n) (Fin n) E)
          (Matrix.charpoly ((ρ σ : GL (Fin 4) E) : Matrix (Fin 4) (Fin 4) E)) = 0) :
    ∀ g : Field.absoluteGaloisGroup ℚ,
      aeval ((s g : GL (Fin n) E) : Matrix (Fin n) (Fin n) E)
        (Matrix.charpoly ((ρ g : GL (Fin 4) E) : Matrix (Fin 4) (Fin 4) E)) = 0 := by
  sorry

/-- A potentially abelian irreducible `ρ` over an algebraically closed field of characteristic zero
restricts to `G_L` as `⊕_{i=1}^b χᵢ^{⊕a}` with `ab = n` and the `χᵢ` distinct (BCGP25,
Lemma 10.2.3). -/
theorem restrict_eq_sum_isotypic {F : Type*} [Field F] {E : Type*} [Field E] [IsAlgClosed E]
    [CharZero E] [TopologicalSpace E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V]
    [TopologicalSpace V] [IsModuleTopology E V]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) E V)
    (hirr : ρ.toRepresentation.IsIrreducible)
    (L : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F L] [IsGalois F L]
    (hab : ∀ g ∈ (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)),
      ∀ h ∈ (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)), ρ g * ρ h = ρ h * ρ g) :
    ∃ (a b : ℕ) (χ : Fin b → (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)) →* Eˣ),
      Function.Injective χ ∧ a * b = Module.finrank E V ∧
      (∀ i, Module.finrank E
        (⨅ h : (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)),
          LinearMap.ker (ρ h.1 - ((χ i h : Eˣ) : E) • LinearMap.id) : Submodule E V) = a) ∧
      (⨆ i, ⨅ h : (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)),
          LinearMap.ker (ρ h.1 - ((χ i h : Eˣ) : E) • LinearMap.id) : Submodule E V) = ⊤ := by
  sorry

end GaloisRep

/-! ## Layer 6: Tate modules of elliptic curves and abelian varieties

The arithmetic adapters of §§6.1–6.4 use AbelianSchemesAndArithmeticModuli A4.1's
`AbelianTate` and its dual pairing from the A3.5 torsion pairings; in dimension one they compare
with `TauCeti.TateModule ℓ (W⁄(AlgebraicClosure K)).toAffine.Point` for an elliptic `W` over `K`
and `ℓ ≠ char K`, carrying `W.tateModuleGaloisRepresentation (K := AlgebraicClosure K) ℓ`.
Its acting group is Mathlib's `Field.absoluteGaloisGroup K` by definition. The finite étale
`ℓ^n`-torsion comparisons between `K^sep` and `AlgebraicClosure K` identify this carrier with
the supplier's separable-closure carrier, compatibly with transitions and
`TauCeti.absoluteGaloisGroupRestrictEquiv`. This same comparison transports isogeny maps and
`(W⁄(AlgebraicClosure K)).tateModuleWeilPairing`, including its cyclotomic target (§6.1).
The linear algebra of the oddness comparison is stated here. -/

namespace TateModule

section EllipticResidual

open scoped WeierstrassCurve

variable {K : Type*} [Field K] [DecidableEq (AlgebraicClosure K)]
    (E : WeierstrassCurve K) [E.IsElliptic] (p : ℕ) [Fact p.Prime]

/-- The basis-free action on geometric elliptic `p`-torsion over `ZMod p` (§6.1).
The acting group is the automorphism group underlying the absolute Galois group. -/
def residualRep : Representation (ZMod p)
    (AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K)
    (AddSubgroup.torsionBy (E⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ)) where
  toFun σ := (Multiplicative.toAdd (E.torsionGaloisAction (p : ℤ) σ)).toAddMonoidHom.toZModLinearMap p
  map_one' := by
    apply LinearMap.ext
    intro P
    change Multiplicative.toAdd (E.torsionGaloisAction (p : ℤ) 1) P = P
    rw [map_one]
    rfl
  map_mul' σ τ := by
    apply LinearMap.ext
    intro P
    change Multiplicative.toAdd (E.torsionGaloisAction (p : ℤ) (σ * τ)) P =
      Multiplicative.toAdd (E.torsionGaloisAction (p : ℤ) σ)
        (Multiplicative.toAdd (E.torsionGaloisAction (p : ℤ) τ) P)
    rw [map_mul]
    rfl

/-- The carrier of the residual elliptic action is two-dimensional when `p` is invertible (§6.1). -/
theorem finrank_residualRep (hp : (p : K) ≠ 0) :
    Module.finrank (ZMod p)
      (AddSubgroup.torsionBy (E⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ)) = 2 := by
  sorry

/-- The residual elliptic action has open kernel in the Krull topology away from the characteristic (§6.1). -/
theorem residualRep_isOpen_ker (hp : (p : K) ≠ 0) :
    IsOpen ((residualRep E p).ker : Set (AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K)) := by
  sorry

end EllipticResidual

/-- A similitude of a nondegenerate alternating space of dimension `2g` has determinant
equal to the `g`-th power of its multiplier, in every characteristic (§6.2). -/
theorem det_eq_multiplier_pow {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (g : ℕ) (hdim : Module.finrank K V = 2 * g)
    (B : LinearMap.BilinForm K V) (hB : B.Nondegenerate) (hAlt : B.IsAlt)
    (h : V ≃ₗ[K] V) (μ : Kˣ) (hμ : ∀ x y, B (h x) (h y) = (μ : K) * B x y) :
    LinearMap.det h.toLinearMap = (μ : K) ^ g := by
  sorry

/-- An anti-symplectic involution in characteristic different from two has complementary
isotropic eigenspaces of half the dimension, the linear algebra of Tate-module oddness (§6.2). -/
theorem antisymplectic_involution_eigenspaces {K V : Type*} [Field K] (h2 : (2 : K) ≠ 0)
    [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (g : ℕ) (hdim : Module.finrank K V = 2 * g)
    (B : LinearMap.BilinForm K V) (hB : B.Nondegenerate) (hAlt : B.IsAlt)
    (c : Module.End K V) (hc : c * c = 1) (hanti : ∀ x y, B (c x) (c y) = -B x y) :
    Module.finrank K (LinearMap.ker (c - 1)) = g ∧
      Module.finrank K (LinearMap.ker (c + 1)) = g ∧
      Disjoint (LinearMap.ker (c - 1)) (LinearMap.ker (c + 1)) ∧
      LinearMap.ker (c - 1) ⊔ LinearMap.ker (c + 1) = ⊤ ∧
      (∀ x ∈ LinearMap.ker (c - 1), ∀ y ∈ LinearMap.ker (c - 1), B x y = 0) ∧
      (∀ x ∈ LinearMap.ker (c + 1), ∀ y ∈ LinearMap.ker (c + 1), B x y = 0) := by
  sorry

/-- The intersection of maximal proper open subgroups detects equality of closed subgroups
of a profinite group, even when this intersection is not open (§6.4a). -/
theorem frattini_closed_subgroup_eq_top {P : Type*} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [T2Space P] [TotallyDisconnectedSpace P]
    (J : Subgroup P) (hJ : IsClosed (J : Set P))
    (hgen : J ⊔ (⨅ (M : OpenSubgroup P) (_ : IsCoatom M), M.toSubgroup) = ⊤) :
    J = ⊤ := by
  sorry

/-- A compact matrix group over a finite extension of `ℚ_ℓ` has open profinite Frattini
subgroup and hence a finite quotient detecting full closed image (§6.4a). -/
theorem compact_matrix_frattini_isOpen (ℓ : ℕ) [Fact ℓ.Prime]
    {E : Type*} [Field E] [Algebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E]
    [TopologicalSpace E] [IsTopologicalRing E] [IsModuleTopology ℚ_[ℓ] E] {n : ℕ}
    (P : Subgroup (Matrix.GeneralLinearGroup (Fin n) E))
    (hP : IsCompact (P : Set (Matrix.GeneralLinearGroup (Fin n) E))) :
    IsOpen ((⨅ (M : OpenSubgroup P) (_ : IsCoatom M), M.toSubgroup) : Set P) := by
  sorry

end TateModule

namespace Involution

variable {A T : Type*} [CommRing A] [AddCommGroup T] [Module A T]

/-- The sum of the plus and minus eigenmodules of an endomorphism `c`. For an involution,
invertibility of `2` guarantees a direct-sum decomposition of the whole module (§6.2). -/
def eigensum (c : Module.End A T) : Submodule A T :=
  LinearMap.ker (c - 1) ⊔ LinearMap.ker (c + 1)

/-- For an involution, `2x` lies in the eigensum, and the eigensum is everything when `2` is a
unit. -/
theorem two_smul_mem_eigensum (c : Module.End A T) (hc : c * c = 1) (x : T) :
    (2 : A) • x ∈ eigensum c ∧ (IsUnit (2 : A) → eigensum c = ⊤) := by
  sorry

-- The swap involution of `ℤ²` has the index-two eigensum `{x₀ ≡ x₁ mod 2}`; over `ℚ` it is
-- everything; `diag(1, −1)` has eigensum `ℤ²`, strictly larger than `2ℤ²`.
/-- The swap involution has the index-two integral eigensum given by equal coordinate parity. -/
theorem eigensum_swap_integral : let c := Matrix.toLin' !![(0 : ℤ), 1; 1, 0]
    (∀ x : Fin 2 → ℤ, x ∈ eigensum c ↔ Even (x 0 - x 1)) ∧
      (![1, 1] : Fin 2 → ℤ) ∈ eigensum c ∧ (![1, 0] : Fin 2 → ℤ) ∉ eigensum c := by
  sorry

/-- The rational swap and the integral diagonal involution have full eigensum. -/
theorem eigensum_swap_rational_and_diagonal : eigensum (Matrix.toLin' !![(0 : ℚ), 1; 1, 0]) = ⊤ ∧
    eigensum (Matrix.toLin' !![(1 : ℤ), 0; 0, -1]) = ⊤ := by
  sorry

end Involution

/-! ## Layer 7: dimension-general arithmetic API -/

namespace ContinuousRep

/-! ### Powers, tensor induction and restriction of scalars -/

section Powers

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- `Sym^d ρ` on the quotient symmetric power `Sym[A]^d M`, through Tau Ceti's
`Representation.symmetricPower` (`d!` not assumed invertible), given finiteness, projectivity and
the module topology of the carrier (§7.1). -/
def symPower (ρ : ContinuousRep Γ A M) (d : ℕ) [Module.Finite A (Sym[A]^d M)]
    [Module.Projective A (Sym[A]^d M)] [TopologicalSpace (Sym[A]^d M)]
    [IsModuleTopology A (Sym[A]^d M)] : ContinuousRep Γ A (Sym[A]^d M) :=
  ⟨ρ.toRepresentation.symmetricPower d, sorry⟩

/-- `∧^d ρ` on `⋀[A]^d M`, through Tau Ceti's `Representation.exteriorPower`.
In constant rank `n`, the top power is the determinant-line representation `Dρ` of §1.1;
identification with the scalar-character representation requires a trivialization of that line. -/
def extPower (ρ : ContinuousRep Γ A M) (d : ℕ) [Module.Finite A (⋀[A]^d M)]
    [Module.Projective A (⋀[A]^d M)] [TopologicalSpace (⋀[A]^d M)]
    [IsModuleTopology A (⋀[A]^d M)] : ContinuousRep Γ A (⋀[A]^d M) :=
  ⟨ρ.toRepresentation.exteriorPower d, sorry⟩

/-- For `M` finitely generated projective, its symmetric, exterior and tensor powers are finitely
generated projective; for `M` free of rank `n` over a nonzero ring they are free of ranks
`binom(n + d − 1, d)`, `binom(n, d)` and `n^d`. -/
theorem powers_finite_projective (d : ℕ) :
    (Module.Finite A (Sym[A]^d M) ∧ Module.Projective A (Sym[A]^d M)) ∧
      (Module.Finite A (⋀[A]^d M) ∧ Module.Projective A (⋀[A]^d M)) ∧
      ([Module.Free A M] → [Nontrivial A] →
        Module.finrank A (Sym[A]^d M) = Nat.choose (Module.finrank A M + d - 1) d ∧
        Module.finrank A (⋀[A]^d M) = Nat.choose (Module.finrank A M) d) := by
  sorry

/-- The tensor-power action is jointly continuous in the module topology on its finite
projective carrier, of rank `(rank M)^d` for a finite free input (§7.1). -/
theorem tensorPower_continuous (ρ : ContinuousRep Γ A M) (d : ℕ)
    [TopologicalSpace (⨂[A] _ : Fin d, M)] [IsModuleTopology A (⨂[A] _ : Fin d, M)] :
    Module.Finite A (⨂[A] _ : Fin d, M) ∧ Module.Projective A (⨂[A] _ : Fin d, M) ∧
      (Continuous fun p : Γ × (⨂[A] _ : Fin d, M) =>
        ρ.toRepresentation.tensorPower d p.1 p.2) ∧
      ([Module.Free A M] → [Nontrivial A] →
        Module.finrank A (⨂[A] _ : Fin d, M) = Module.finrank A M ^ d) := by
  sorry

/-- If `det(X − ρ(g)) = ∏ (X − αᵢ)` the roots of `Sym^d ρ(g)` and `∧^d ρ(g)` are the `d`-fold products
with, resp. without, repetition. On a free carrier the action on the top exterior line is
multiplication by `det ρ(g)`; a basis trivializes this line (§§1.1, 7.1). -/
theorem charpoly_symPower_extPower [Module.Free A M] (ρ : ContinuousRep Γ A M) (g : Γ) {n : ℕ}
    (α : Fin n → A) (h : ρ.charpoly g = ∏ i, (X - C (α i))) (d : ℕ)
    [Module.Finite A (Sym[A]^d M)] [Module.Projective A (Sym[A]^d M)] [Module.Free A (Sym[A]^d M)]
    [TopologicalSpace (Sym[A]^d M)] [IsModuleTopology A (Sym[A]^d M)]
    [Module.Finite A (⋀[A]^d M)] [Module.Projective A (⋀[A]^d M)] [Module.Free A (⋀[A]^d M)]
    [TopologicalSpace (⋀[A]^d M)] [IsModuleTopology A (⋀[A]^d M)] :
    (ρ.symPower d).charpoly g =
        ∏ s ∈ (Finset.univ : Finset (Fin n)).sym d, (X - C ((s : Multiset (Fin n)).map α).prod) ∧
      (ρ.extPower d).charpoly g =
        ∏ s ∈ (Finset.univ : Finset (Fin n)).powersetCard d, (X - C (∏ i ∈ s, α i)) ∧
      (d = Module.finrank A M → (ρ.extPower d) g = LinearMap.det (ρ g) • LinearMap.id) := by
  sorry

/-- When `2 ∈ Aˣ`, `ρ ⊗ ρ ≅ Sym² ρ ⊕ ∧² ρ` equivariantly; over `F₂` this fails for the standard
representation of `GL₂(F₂)`. -/
theorem exists_tensorSquareEquiv [Invertible (2 : A)] (ρ : ContinuousRep Γ A M)
    [Module.Finite A (Sym[A]^2 M)] [Module.Projective A (Sym[A]^2 M)]
    [TopologicalSpace (Sym[A]^2 M)] [IsModuleTopology A (Sym[A]^2 M)]
    [Module.Finite A (⋀[A]^2 M)] [Module.Projective A (⋀[A]^2 M)]
    [TopologicalSpace (⋀[A]^2 M)] [IsModuleTopology A (⋀[A]^2 M)] :
    ∃ e : M ⊗[A] M ≃ₗ[A] (Sym[A]^2 M) × (⋀[A]^2 M), ∀ (g : Γ) (x : M ⊗[A] M),
      e (TensorProduct.map (ρ g) (ρ g) x) = ((ρ.symPower 2) g (e x).1, (ρ.extPower 2) g (e x).2) := by
  sorry

-- `Sym² ρ(g)` for `det(X − ρ(g)) = (X − α)(X − β)` has roots `α², αβ, β²`.
/-- The symmetric-square characteristic polynomial has the three expected products of the rank-two eigenvalues. -/
theorem charpoly_symSq_split [Module.Free A M] (ρ : ContinuousRep Γ A M) (g : Γ) (α β : A)
    (h : ρ.charpoly g = (X - C α) * (X - C β))
    [Module.Finite A (Sym[A]^2 M)] [Module.Projective A (Sym[A]^2 M)] [Module.Free A (Sym[A]^2 M)]
    [TopologicalSpace (Sym[A]^2 M)] [IsModuleTopology A (Sym[A]^2 M)] :
    (ρ.symPower 2).charpoly g = (X - C (α ^ 2)) * (X - C (α * β)) * (X - C (β ^ 2)) := by
  sorry

end Powers

/-- If `det(X − f) = ∏ (X − αᵢ)` for an endomorphism of a finite free module then
`det(X − ∧^d f) = ∏_{|s| = d} (X − ∏_{i∈s} αᵢ)`; in general the coefficients are universal integer
polynomials in those of `det(X − f)` (BCG 2025, proof of Thm 2.1). -/
theorem charpoly_exteriorPower_map {R : Type*} [CommRing R] {N : Type*} [AddCommGroup N]
    [Module R N] [Module.Free R N] [Module.Finite R N] (f : N →ₗ[R] N) {n : ℕ} (α : Fin n → R)
    (h : f.charpoly = ∏ i, (X - C (α i))) (d : ℕ) :
    (exteriorPower.map d f).charpoly =
      ∏ s ∈ (Finset.univ : Finset (Fin n)).powersetCard d, (X - C (∏ i ∈ s, α i)) := by
  sorry

section TensorInduction

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {V : Type*} [AddCommGroup V] [Module A V] [Module.Finite A V] [Module.Projective A V]
  [TopologicalSpace V] [IsModuleTopology A V]

/-- The tensor induction `⊗-Ind_H^Γ ρ` on `⨂_{Γ/H} V` for a transversal `s`, through Tau Ceti's
`Subgroup.tensorInducedRepresentation`, given the finiteness, projectivity and module topology of
the carrier (`H` open of finite index) (§7.1). -/
def tensorInd (H : Subgroup Γ) [H.FiniteIndex] (hH : IsOpen (H : Set Γ)) (s : H.LeftTransversal) (ρ : ContinuousRep H A V)
    [Module.Finite A (⨂[A] _ : Γ ⧸ H, V)] [Module.Projective A (⨂[A] _ : Γ ⧸ H, V)]
    [TopologicalSpace (⨂[A] _ : Γ ⧸ H, V)] [IsModuleTopology A (⨂[A] _ : Γ ⧸ H, V)] :
    ContinuousRep Γ A (⨂[A] _ : Γ ⧸ H, V) :=
  ⟨H.tensorInducedRepresentation s ρ.toRepresentation, sorry⟩

variable (H : Subgroup Γ) [H.FiniteIndex] (hH : IsOpen (H : Set Γ)) [Module.Finite A (⨂[A] _ : Γ ⧸ H, V)]
  [Module.Projective A (⨂[A] _ : Γ ⧸ H, V)] [TopologicalSpace (⨂[A] _ : Γ ⧸ H, V)]
  [IsModuleTopology A (⨂[A] _ : Γ ⧸ H, V)]

/-- Tensor induction does not depend on the transversal, up to the isomorphism `⨂ ρ(u_x)⁻¹`
(Berger 1977, Prop. 2.14, pp. 12–13; the pure-tensor intertwiner works over every commutative
ring); for `H` of finite index and `V` free its rank is `(rank V)^{[Γ : H]}`. -/
theorem tensorInd_indep_rank (s s' : H.LeftTransversal) (ρ : ContinuousRep H A V) :
    Nonempty ((tensorInd H hH s ρ).Iso (tensorInd H hH s' ρ)) ∧
      ([Module.Free A V] → [Nontrivial A] →
        Module.finrank A (⨂[A] _ : Γ ⧸ H, V) = Module.finrank A V ^ H.index) := by
  sorry

/-- The Asai case: for `[Γ : H] = 2`, `g ∉ H` and `det(X − ρ(g²)) = ∏ (X − βᵢ)`,
`det(X − As(ρ)(g)) = ∏ᵢ (X − βᵢ) · ∏_{i<j} (X² − βᵢβⱼ)` over any commutative coefficient ring,
including characteristic two (CG20, §4, proof of Ex. 4.11). -/
theorem charpoly_asai [Module.Free A V] [Module.Free A (⨂[A] _ : Γ ⧸ H, V)] (h2 : H.index = 2)
    (s : H.LeftTransversal) (ρ : ContinuousRep H A V) (g : Γ) (hg : g ∉ H) (hg2 : g ^ 2 ∈ H)
    {n : ℕ} (β : Fin n → A) (hβ : ρ.charpoly ⟨g ^ 2, hg2⟩ = ∏ i, (X - C (β i))) :
    (tensorInd H hH s ρ).charpoly g =
      (∏ i, (X - C (β i))) *
        ∏ p ∈ (Finset.univ : Finset (Fin n × Fin n)).filter (fun p => p.1 < p.2),
          (X ^ 2 - C (β p.1 * β p.2)) := by
  sorry

-- In rank one tensor induction is the transfer: `⊗-Ind ψ = ψ ∘ Ver`; for index two and `g ∉ H` the
-- rank-two Asai polynomial is `(X² − aX + b)(X² − b)`.
/-- Tensor induction of a character is its composite with transfer. -/
theorem tensorInd_rank_one_transfer (s : H.LeftTransversal) (ψ : H →ₜ* Aˣ)
    [Module.Finite A (⨂[A] _ : Γ ⧸ H, A)] [Module.Projective A (⨂[A] _ : Γ ⧸ H, A)]
    [TopologicalSpace (⨂[A] _ : Γ ⧸ H, A)] [IsModuleTopology A (⨂[A] _ : Γ ⧸ H, A)]
    (g : Γ) (x : ⨂[A] _ : Γ ⧸ H, A) :
    tensorInd H hH s (ofCharacter ψ) g x = ((MonoidHom.transfer ψ.toMonoidHom g : Aˣ) : A) • x := by
  sorry

-- Over `F₂`, every rank-one character is trivial, so twisting the rank-one Asai representation
-- by the quadratic character gives the same extension.
omit [IsTopologicalGroup Γ] in
/-- Rank-one characters over `F₂` and their quadratic twists are trivial; twisting preserves
the associated representation (§7.1). -/
theorem rank_one_f2_twist_trivial [TopologicalSpace (ZMod 2)] [IsTopologicalRing (ZMod 2)]
    (ψ η : Γ →ₜ* (ZMod 2)ˣ) :
    ψ = 1 ∧ η = 1 ∧ ofCharacter (ψ * η) = ofCharacter ψ := by
  have hu : ∀ u : (ZMod 2)ˣ, u = 1 := by decide
  have hψ : ψ = 1 := by
    apply ContinuousMonoidHom.ext
    intro g
    exact hu (ψ g)
  have hη : η = 1 := by
    apply ContinuousMonoidHom.ext
    intro g
    exact hu (η g)
  have hmul : ψ * η = ψ := by
    apply ContinuousMonoidHom.ext
    intro g
    rw [hu ((ψ * η) g), hu (ψ g)]
  exact ⟨hψ, hη, congrArg ofCharacter hmul⟩

end TensorInduction

/-- The cyclic tensor `v ⊗ w ↦ A₂ w ⊗ A₁ v` has trace `tr(A₂A₁)` and, if `det(X − A₂A₁) = ∏(X − βᵢ)`,
characteristic polynomial `∏ᵢ (X − βᵢ) · ∏_{i<j} (X² − βᵢβⱼ)` (one period per orbit, not the full
product); the roots of `det(X − B ⊗ B')` are the products `αᵢα'ⱼ`. -/
theorem charpoly_swap_tensor {R : Type*} [CommRing R] {W : Type*} [AddCommGroup W] [Module R W]
    [Module.Free R W] [Module.Finite R W] (A₁ A₂ : W →ₗ[R] W) {n : ℕ} (β : Fin n → R)
    (h : (A₂ ∘ₗ A₁).charpoly = ∏ i, (X - C (β i))) :
    LinearMap.trace R (W ⊗[R] W) (TensorProduct.map A₂ A₁ ∘ₗ (TensorProduct.comm R W W).toLinearMap) =
        LinearMap.trace R W (A₂ ∘ₗ A₁) ∧
      (TensorProduct.map A₂ A₁ ∘ₗ (TensorProduct.comm R W W).toLinearMap).charpoly =
        (∏ i, (X - C (β i))) *
          ∏ p ∈ (Finset.univ : Finset (Fin n × Fin n)).filter (fun p => p.1 < p.2),
            (X ^ 2 - C (β p.1 * β p.2)) := by
  sorry

section RestrictionOfScalars

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {B : Type*} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
  {M : Type*} [AddCommGroup M] [Module B M] [Module.Finite B M] [Module.Projective B M]
  [TopologicalSpace M] [IsModuleTopology B M]

/-- `Res_{B/A} ρ`: the carrier `M` as an `A`-module, same action (§7.1). -/
def resScalars [Module A M] [IsScalarTower A B M] [Module.Finite A M] [Module.Projective A M]
    [IsModuleTopology A M] (ρ : ContinuousRep Γ B M) : ContinuousRep Γ A M :=
  ⟨{ toFun := fun g => (ρ g).restrictScalars A
     map_one' := sorry
     map_mul' := sorry }, sorry⟩

/-- `det_A(X − ρ(g)) = N_{B[X]/A[X]} det_B(X − ρ(g))` for `B` free over `A` and `M` free over `B`
(Mathlib `LinearMap.det_restrictScalars`, applied over `A[X] → B[X]` to `X − ρ(g)`). -/
theorem charpoly_resScalars [Module A M] [IsScalarTower A B M] [Module.Finite A M]
    [Module.Projective A M] [IsModuleTopology A M] [Module.Free A B] [Module.Finite A B]
    [Module.Free B M] [Module.Free A M] (ρ : ContinuousRep Γ B M) (g : Γ) :
    letI : Algebra (Polynomial A) (Polynomial B) := (Polynomial.mapRingHom (algebraMap A B)).toAlgebra
    (resScalars (A := A) ρ).charpoly g = Algebra.norm (Polynomial A) (ρ.charpoly g) := by
  sorry

-- For `B` free of rank two and a character `ψ`, `det_A(X − ψ(g)) = X² − tr(ψ(g)) X + N(ψ(g))`.
/-- Restriction of scalars of a character over a quadratic free algebra has trace and norm as polynomial coefficients. -/
theorem charpoly_resScalars_rank_two [Module.Free A B] [Module.Finite A B] [IsModuleTopology A B]
    (h2 : Module.finrank A B = 2) (ψ : Γ →ₜ* Bˣ) (g : Γ) :
    (resScalars (A := A) (ofCharacter ψ)).charpoly g =
      X ^ 2 - C (Algebra.trace A B (ψ g : B)) * X + C (Algebra.norm A (ψ g : B)) := by
  sorry

end RestrictionOfScalars

/-! ### The adjoint representation -/

section Adjoint

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- Local consumer alias for AdicSpacesPartIII §R3.8 `LinearMap.projectiveTrace`, whose agreement
with the categorical trace is supplied by `LinearMap.projectiveTrace_eq_categoricalTrace` there.
Provides the scalar trace used by `adZero`, `tracePairing_perfect` and `adZero_to_adQuot` (§7.2). -/
def endTrace (R : Type*) [CommRing R] (N : Type*) [AddCommGroup N] [Module R N]
    [Module.Finite R N] [Module.Projective R N] : Module.End R N →ₗ[R] R :=
  LinearMap.projectiveTrace R N

/-- `ad ρ` on `End_A(M)` by conjugation: Mathlib's `Representation.linHom ρ ρ`. -/
def ad (ρ : ContinuousRep Γ A M) [Module.Finite A (Module.End A M)]
    [Module.Projective A (Module.End A M)] [TopologicalSpace (Module.End A M)]
    [IsModuleTopology A (Module.End A M)] : ContinuousRep Γ A (Module.End A M) :=
  ⟨Representation.linHom ρ.toRepresentation ρ.toRepresentation, sorry⟩

/-- `ad⁰ ρ = ker(endTrace)` with the conjugation action. In constant rank two, §7.2 identifies
it with `(Sym² ρ)^∨ ⊗ Dρ`, retaining the determinant-line carrier. -/
def adZero (ρ : ContinuousRep Γ A M) [Module.Finite A (LinearMap.ker (endTrace A M))]
    [Module.Projective A (LinearMap.ker (endTrace A M))]
    [TopologicalSpace (LinearMap.ker (endTrace A M))]
    [IsModuleTopology A (LinearMap.ker (endTrace A M))] :
    ContinuousRep Γ A (LinearMap.ker (endTrace A M)) :=
  ⟨(Representation.linHom ρ.toRepresentation ρ.toRepresentation).subrepresentation _ sorry, sorry⟩

/-- `ad ρ / A·1`, the quotient by the scalars. In constant rank two, §7.2 identifies it with
`Sym² ρ ⊗ Dρ^∨`, retaining the determinant-line carrier, including in characteristic two. -/
def adQuot (ρ : ContinuousRep Γ A M)
    [Module.Finite A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)})]
    [Module.Projective A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)})]
    [TopologicalSpace (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)})]
    [IsModuleTopology A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)})] :
    ContinuousRep Γ A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)}) :=
  ⟨(Representation.linHom ρ.toRepresentation ρ.toRepresentation).quotient _ sorry, sorry⟩

/-- The trace pairing on `End_A(M)` is perfect and `Γ`-invariant, and induces
`ad⁰ ≅ (ad / A·1)^∨` for every `A` (CHT08, §2.1). -/
theorem tracePairing_perfect (ρ : ContinuousRep Γ A M) :
    Function.Bijective (fun X : Module.End A M => endTrace A M ∘ₗ LinearMap.mulLeft A X) ∧
    (∀ (g : Γ) (X Y : Module.End A M),
      endTrace A M (ρ g * X * Ring.inverse (ρ g) * (ρ g * Y * Ring.inverse (ρ g))) =
        endTrace A M (X * Y)) ∧
    ∃ e : LinearMap.ker (endTrace A M) ≃ₗ[A]
        Module.Dual A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)}),
      ∀ X Y, e X (Submodule.Quotient.mk Y) = endTrace A M ((X : Module.End A M) * Y) := by
  sorry

/-- For `M` free of rank `n ≥ 1`: `1 ∈ ad⁰` iff `n = 0` in `A`; the natural composite
`ad⁰ ↪ ad → ad/A·1` has kernel
`A[n]·1` and cokernel `A/nA`, and is an isomorphism with `ad = A·1 ⊕ ad⁰` exactly when `n ∈ Aˣ`. -/
theorem adZero_to_adQuot [Module.Free A M] (hn : 0 < Module.finrank A M) :
    ((1 : Module.End A M) ∈ LinearMap.ker (endTrace A M) ↔ (Module.finrank A M : A) = 0) ∧
    (∀ X : LinearMap.ker (endTrace A M),
      (Submodule.span A {(1 : Module.End A M)}).mkQ (X : Module.End A M) = 0 ↔
        ∃ a : A, (Module.finrank A M : A) * a = 0 ∧ (X : Module.End A M) = a • 1) ∧
    (Function.Bijective ((Submodule.span A {(1 : Module.End A M)}).mkQ ∘ₗ
        (LinearMap.ker (endTrace A M)).subtype) ↔ IsUnit (Module.finrank A M : A)) ∧
    (IsUnit (Module.finrank A M : A) →
      IsCompl (LinearMap.ker (endTrace A M)) (Submodule.span A {(1 : Module.End A M)})) := by
  sorry

-- `endTrace` is `LinearMap.trace` on a free module; on a non-free projective module Mathlib's
-- trace vanishes; over `F₂` in rank two `1 ∈ ad⁰`.
/-- On a free carrier the continuous adjoint trace is Mathlib's linear trace. -/
theorem endTrace_free (R : Type*) [CommRing R] (N : Type*) [AddCommGroup N] [Module R N] [Module.Free R N]
    [Module.Finite R N] : endTrace R N = LinearMap.trace R N := by
  exact LinearMap.projectiveTrace_eq_trace

/-- Mathlib's total linear trace vanishes on a nonfree projective carrier. -/
theorem mathlib_trace_nonfree_zero (R : Type*) [CommRing R] (N : Type*) [AddCommGroup N] [Module R N] [Module.Finite R N]
    [Module.Projective R N] (h : ¬ Module.Free R N) : LinearMap.trace R N = 0 := by
  sorry

-- In rank two over `F₂`, both adjoint carriers have dimension three, so are isomorphic for a
-- trivial action, although the natural comparison map kills the nonzero identity.
/-- The two rank-two adjoint carriers in characteristic two are isomorphic although their natural comparison kills the identity. -/
theorem adZero_adQuot_char_two {N : Type*} [AddCommGroup N] [Module (ZMod 2) N] [Module.Finite (ZMod 2) N]
    (h : Module.finrank (ZMod 2) N = 2) :
    (1 : Module.End (ZMod 2) N) ∈ LinearMap.ker (endTrace (ZMod 2) N) ∧
      Nonempty (LinearMap.ker (endTrace (ZMod 2) N) ≃ₗ[ZMod 2]
        (Module.End (ZMod 2) N ⧸ Submodule.span (ZMod 2) {(1 : Module.End (ZMod 2) N)})) ∧
      ¬ Function.Injective
        ((Submodule.span (ZMod 2) {(1 : Module.End (ZMod 2) N)}).mkQ ∘ₗ
          (LinearMap.ker (endTrace (ZMod 2) N)).subtype) := by
  sorry

end Adjoint

end ContinuousRep

/-! The Weil–Deligne adjoint in §7.2 is formed on §2.4's canonical parameter fields:
`Representation.linHom r r` and the monodromy commutator `[N, −]`. -/

/-- The trace pairing `(X, Y) ↦ tr(XY)` on `M_n(A)` is perfect over every commutative ring (Tau
Ceti's `traceBilinForm` gives nondegeneracy only). -/
theorem tracePairing_matrix_perfect (A : Type*) [CommRing A] (n : Type*) [Fintype n]
    [DecidableEq n] :
    Function.Bijective (fun X : Matrix n n A =>
      (Matrix.traceLinearMap n A A ∘ₗ LinearMap.mulLeft A X : Matrix n n A →ₗ[A] A)) := by
  sorry

open scoped Matrix

/-! ### Similitude groups and polarised representations -/

namespace SimilitudeGroup

variable {n : Type*} [Fintype n] [DecidableEq n] {R : Type*} [CommRing R]

/-- The `R'`-points of the similitude group scheme of the form with Gram matrix `J`:
`{(g, ν) ∈ GL_n(R') × R'ˣ : gᵀ J g = ν J}` (§7.3). -/
def groupScheme (J : Matrix n n R) (R' : Type*) [CommRing R'] [Algebra R R'] :
    Subgroup (GL n R' × R'ˣ) where
  carrier := {p | (p.1 : Matrix n n R')ᵀ * J.map (algebraMap R R') * (p.1 : Matrix n n R') =
    (p.2 : R') • J.map (algebraMap R R')}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The multiplier `ν : GAut(M, B) → G_m`. -/
def multiplier (J : Matrix n n R) (R' : Type*) [CommRing R'] [Algebra R R'] :
    groupScheme J R' →* R'ˣ :=
  (MonoidHom.snd _ _).comp (groupScheme J R').subtype

/-- `GSp_{2m}(R)` for `J_{2m} = (0, 1_m; −1_m, 0) = −Matrix.J` (BLGGT 2014, §1.1). -/
abbrev GSp (m : ℕ) (R : Type*) [CommRing R] : Subgroup (GL (Fin m ⊕ Fin m) R × Rˣ) :=
  groupScheme (-Matrix.J (Fin m) R) R

/-- `GO_m(R)` for the form `1_m`. -/
abbrev GO (m : ℕ) (R : Type*) [CommRing R] : Subgroup (GL (Fin m) R × Rˣ) :=
  groupScheme (1 : Matrix (Fin m) (Fin m) R) R

/-- The matrix projection `{X : ∃ c, Xᵀ J + J X = c J}` of the similitude Lie algebra.
For nonempty `n` and perfect `J`, this identifies with the full Lie algebra of `groupScheme J`;
under that identification the kernel of `dν` is `skewAdjointMatricesSubmodule J` (§7.3). -/
def lie (J : Matrix n n R) : Submodule R (Matrix n n R) where
  carrier := {X | ∃ c : R, Xᵀ * J + J * X = c • J}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `g ∈ GAut(M, B)` iff `B(gx, gy) = ν B(x, y)`; the points of `GSp_{2m}` are also characterised by
`g J gᵀ = ν J`; if `2 ∈ Rˣ` and `det J ∈ Rˣ`, `gsp = sp ⊕ R·1`; `det g = ν^m` on `GSp_{2m}`. -/
theorem mem_iff (J : Matrix n n R) (p : GL n R × Rˣ) (m : ℕ) (g : GL (Fin m ⊕ Fin m) R) (ν : Rˣ) :
    (p ∈ groupScheme J R ↔ ∀ x y : n → R,
      ((p.1 : Matrix n n R) *ᵥ x) ⬝ᵥ (J *ᵥ ((p.1 : Matrix n n R) *ᵥ y)) =
        (p.2 : R) * (x ⬝ᵥ (J *ᵥ y))) ∧
    ((g, ν) ∈ GSp m R ↔
      (g : Matrix (Fin m ⊕ Fin m) (Fin m ⊕ Fin m) R) * Matrix.J (Fin m) R *
          (g : Matrix (Fin m ⊕ Fin m) (Fin m ⊕ Fin m) R)ᵀ = (ν : R) • Matrix.J (Fin m) R) ∧
    ((g, ν) ∈ GSp m R → (g : Matrix (Fin m ⊕ Fin m) (Fin m ⊕ Fin m) R).det = (ν : R) ^ m) ∧
    ([Invertible (2 : R)] → IsUnit J.det →
      Disjoint (skewAdjointMatricesSubmodule J) (Submodule.span R {(1 : Matrix n n R)}) ∧
        skewAdjointMatricesSubmodule J ⊔ Submodule.span R {(1 : Matrix n n R)} = lie J ∧
        skewAdjointMatricesSubmodule J ≤ lie J) := by
  sorry

-- With zero Gram matrix in rank one, every infinitesimal multiplier projects to the same matrix.
/-- The zero rank-one Gram matrix has the full matrix Lie algebra and does not determine an infinitesimal multiplier. -/
theorem similitude_lie_rank_one : lie (0 : Matrix (Fin 1) (Fin 1) ℚ) = ⊤ ∧
    ∀ c : ℚ, (0 : Matrix (Fin 1) (Fin 1) ℚ)ᵀ * 0 + 0 * 0 = c • 0 := by
  constructor
  · ext X
    simp [lie]
  · intro c
    simp

-- `GSp₂ = GL₂` with `ν = det`; `Sp_{2m}` is Mathlib's `Matrix.symplecticGroup`; over `F₂` the
-- identity lies in `sp₄`, so `gsp = sp ⊕ R·1` needs `2 ∈ Rˣ`.
/-- Rank-two similitudes have determinant multiplier and multiplier-one symplectic points agree with Mathlib. -/
theorem GSp_two_and_Sp_comparison (g : GL (Fin 1 ⊕ Fin 1) R) (ν : Rˣ) (m : ℕ) (h : GL (Fin m ⊕ Fin m) R) :
    ((g, ν) ∈ GSp 1 R ↔ (ν : R) = (g : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R).det) ∧
      ((h, 1) ∈ GSp m R ↔
        (h : Matrix (Fin m ⊕ Fin m) (Fin m ⊕ Fin m) R) ∈ Matrix.symplecticGroup (Fin m) R) := by
  sorry

/-- The identity belongs to the characteristic-two symplectic Lie algebra. -/
theorem identity_mem_sp_char_two : (1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) (ZMod 2)) ∈
    skewAdjointMatricesSubmodule (-Matrix.J (Fin 2) (ZMod 2)) := by
  sorry

-- In rank four the two summands span `gsp₄`, a proper subspace of all matrices.
/-- In rank four over the rationals the symplectic and scalar summands form the proper similitude Lie subspace. -/
theorem gsp_four_scalar_decomposition :
    Disjoint (skewAdjointMatricesSubmodule (-Matrix.J (Fin 2) ℚ))
      (Submodule.span ℚ {(1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℚ)}) ∧
    skewAdjointMatricesSubmodule (-Matrix.J (Fin 2) ℚ) ⊔
      Submodule.span ℚ {(1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℚ)} =
        lie (-Matrix.J (Fin 2) ℚ) ∧
    lie (-Matrix.J (Fin 2) ℚ) ≠ ⊤ := by
  sorry

/-- The Gram matrix `J₄ = (0, 1₂; −1₂, 0)` of `GSp₄`. -/
abbrev J4 (K : Type*) [CommRing K] : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) K :=
  -Matrix.J (Fin 2) K

/-- `GSp₄` for `J₄` and for the antidiagonal form `(0, s; −s, 0)`, `s = (0 1; 1 0)` of BCGP 2021 and
CG20, are isomorphic compatibly with `ν`, by conjugation with a permutation matrix. -/
theorem exists_mulEquiv_gsp4_antidiagonal (A : Type*) [CommRing A] :
    ∃ e : GSp 2 A ≃* groupScheme
      (Matrix.of ![![0, 0, 0, 1], ![0, 0, 1, 0], ![0, -1, 0, 0], ![-1, 0, 0, 0]] :
        Matrix (Fin 4) (Fin 4) A) A, ∀ g, (e g).1.2 = g.1.2 := by
  sorry

end SimilitudeGroup

section Polarized

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- A polarisation of `ρ ∈ ContinuousRep Δ A M` at an involution `c ∈ Γ` (`Δ ≤ Γ` open of index at
most two in the arithmetic case, and normalized by `c` in general; for a CM field `Γ = G_{F⁺}`,
`Δ = G_F`, `c` a complex conjugation): a continuous multiplier `μ : Γ → Aˣ`, a perfect pairing with `⟨ρ(σ)x, ρ(cσc)y⟩ = μ(σ)⟨x, y⟩`, a sign `ε` with
`⟨x, y⟩ = ε⟨y, x⟩`, and `ε = −μ(c)` when `c ∉ Δ` (BLGGT 2014, §2.1) (§7.4). -/
structure PolarizedRep (Δ : Subgroup Γ) (ρ : ContinuousRep Δ A M) (c : Γ) where
  /-- The multiplier `μ : Γ → Aˣ`. -/
  multiplier : Γ →ₜ* Aˣ
  /-- The perfect pairing `⟨ , ⟩`. -/
  pairing : LinearMap.BilinForm A M
  /-- The sign `ε ∈ {±1}`. -/
  sign : ℤˣ
  /-- `c` is an involution. -/
  sq_c : c ^ 2 = 1
  /-- Perfectness: `M → M^∨` is an isomorphism. -/
  pairing_perfect : Function.Bijective pairing
  /-- Conjugation by `c` preserves `Δ`, so the conjugate representation is defined. -/
  conj_mem : ∀ σ : Δ, c * (σ : Γ) * c ∈ Δ
  /-- Covariance `⟨ρ(σ)x, ρ(cσc)y⟩ = μ(σ)⟨x, y⟩`. -/
  covariance : ∀ (σ : Δ) (x y : M),
    pairing (ρ σ x) (ρ ⟨c * (σ : Γ) * c, conj_mem σ⟩ y) = (multiplier σ : A) * pairing x y
  /-- Symmetry with sign `ε`. -/
  symm : ∀ x y : M, pairing x y = ((sign : ℤ) : A) * pairing y x
  /-- The CM sign condition `ε = −μ(c)` when `c ∉ Δ`. -/
  cm_sign : c ∉ Δ → ((sign : ℤ) : A) = -(multiplier c : A)

namespace PolarizedRep

variable {Δ : Subgroup Γ} {ρ : ContinuousRep Δ A M} {c : Γ}

/-- A polarised representation is essentially conjugate self-dual, `ρ^c ≅ ρ^∨ ⊗ μ|_Δ`; on a free
carrier of rank `n`, `det ρ(cσc) det ρ(σ) = μ(σ)^n`. -/
theorem essConjSelfDual (P : PolarizedRep Δ ρ c) :
    (∃ e : M ≃ₗ[A] Module.Dual A M, ∀ (σ : Δ) (y : M),
      e (ρ ⟨c * (σ : Γ) * c, P.conj_mem σ⟩ y) =
        (P.multiplier σ : A) • Representation.dual ρ.toRepresentation σ (e y)) ∧
    ([Module.Free A M] → ∀ σ : Δ,
      LinearMap.det (ρ ⟨c * (σ : Γ) * c, P.conj_mem σ⟩) * LinearMap.det (ρ σ) =
        (P.multiplier σ : A) ^ Module.finrank A M) := by
  sorry

/-- For `c ∈ Δ` (totally real), `2 ∈ Aˣ` and `Spec A` connected, `ρ` is polarisable iff it preserves
a perfect `±`-symmetric form up to a multiplier, i.e. factors through `GSp` or `GO`. -/
theorem nonempty_iff_similitude (hc : c ∈ Δ) (hc2 : c ^ 2 = 1) (h2 : IsUnit (2 : A))
    (hconn : ∀ e : A, e * e = e → e = 0 ∨ e = 1) :
    Nonempty (PolarizedRep Δ ρ c) ↔ ∃ (B : LinearMap.BilinForm A M) (μ : Γ →ₜ* Aˣ) (ε : ℤˣ),
      Function.Bijective B ∧ (∀ x y, B x y = ((ε : ℤ) : A) * B y x) ∧
      ∀ (σ : Δ) x y, B (ρ σ x) (ρ σ y) = (μ σ : A) * B x y := by
  sorry

/-- If the multiplier at an internal involution is minus the pairing sign and `2` is a unit,
the form `B(x,y) = ⟨x,ρ(c)y⟩` is alternating, including for the zero carrier (§7.4). -/
theorem isAlt_comp_of_multiplier (P : PolarizedRep Δ ρ c) (hc : c ∈ Δ)
    (h2 : IsUnit (2 : A)) (hμ : (P.multiplier c : A) = -((P.sign : ℤ) : A)) :
    (P.pairing.compl₂ (ρ ⟨c, hc⟩)).IsAlt := by
  sorry

/-- On a faithful carrier, alternation of `B(x,y) = ⟨x,ρ(c)y⟩` characterizes the multiplier
at an internal involution as minus the pairing sign when `2` is a unit (§7.4). -/
theorem isAlt_comp_iff [FaithfulSMul A M] (P : PolarizedRep Δ ρ c) (hc : c ∈ Δ)
    (h2 : IsUnit (2 : A)) :
    (P.pairing.compl₂ (ρ ⟨c, hc⟩)).IsAlt ↔
      (P.multiplier c : A) = -((P.sign : ℤ) : A) := by
  sorry

/-- The twist `(ρ ⊗ χ, μ')` by a continuous character `χ` of `Δ` is polarised with the same pairing
and sign, for the multiplier `μ'` with `μ'(σ) = μ(σ) χ(σ) χ(cσc)` on `Δ` and `μ'(c) = μ(c)` if
`c ∉ Δ`. In the CM/index-two case, the tensor product of two polarisations is polarised with
the product pairing, sign `εε'` and multiplier `μμ'δ` (§7.4, BLGGT 2014, §1.1). -/
theorem exists_twist_tensor (P : PolarizedRep Δ ρ c) (χ : Δ →ₜ* Aˣ) (μ' : Γ →ₜ* Aˣ)
    (hμ : ∀ σ : Δ,
      μ' σ = P.multiplier σ * χ σ * χ ⟨c * (σ : Γ) * c, P.conj_mem σ⟩)
    (hc : c ∉ Δ → μ' c = P.multiplier c) :
    ∃ P' : PolarizedRep Δ (ρ.twist χ) c,
      P'.multiplier = μ' ∧ P'.pairing = P.pairing ∧ P'.sign = P.sign := by
  sorry

/-- Totally odd (BLGGT 2014, §2.1): `ε μ(c c') = 1` for every complex conjugation `c'` in `C`; for
`c ∉ Δ` this is `μ(c') = −1` for all `c' ∈ C`. -/
def IsTotallyOdd (P : PolarizedRep Δ ρ c) (C : Set Γ) : Prop :=
  ∀ c' ∈ C, ((P.sign : ℤ) : A) * (P.multiplier (c * c') : A) = 1

theorem isTotallyOdd_iff_multiplier (P : PolarizedRep Δ ρ c) (hc : c ∉ Δ) (C : Set Γ) :
    P.IsTotallyOdd C ↔ ∀ c' ∈ C, (P.multiplier c' : A) = -1 := by
  sorry

-- The transposition subgroup of `S₃` is not preserved by a different transposition.
/-- A transposition subgroup not normalized by another transposition cannot support the required conjugation operation. -/
theorem polarization_normalization_obstruction :
    let Δ : Subgroup (Equiv.Perm (Fin 3)) := Subgroup.zpowers (Equiv.swap 0 1)
    let c : Equiv.Perm (Fin 3) := Equiv.swap 1 2
    ¬ ∀ σ : Δ, c * (σ : Equiv.Perm (Fin 3)) * c ∈ Δ := by
  sorry

-- A multiplier on a product of involutions squares to one over every commutative coefficient ring.
omit [IsTopologicalGroup Γ] [IsTopologicalRing A] in
/-- The multiplier on a product of two involutions squares to one. -/
theorem multiplier_product_involutions_sq (P : PolarizedRep Δ ρ c) (c' : Γ) (hc' : c' ^ 2 = 1) :
    P.multiplier (c * c') ^ 2 = 1 := by
  calc
    P.multiplier (c * c') ^ 2 = P.multiplier c ^ 2 * P.multiplier c' ^ 2 := by
      rw [map_mul, mul_pow]
    _ = 1 := by simp only [← map_pow, P.sq_c, hc', map_one, mul_one]

-- In rank one over a domain with `2 ≠ 0` and `c ∉ Δ`, a polarisation forces `μ(c) = −1`; a
-- multiplier with `μ(c) = 1` is impossible.
/-- A rank-one polarization over a domain forces multiplier minus one on the outside involution. -/
theorem polarization_rank_one_multiplier [IsDomain A] (h2 : (2 : A) ≠ 0) [Module.Free A M] (hM : Module.finrank A M = 1)
    (hc : c ∉ Δ) (P : PolarizedRep Δ ρ c) : (P.multiplier c : A) = -1 := by
  sorry

-- For `Δ = Γ` (totally real), the trivial rank-one representation has multiplier and sign one
-- and perfect pairing `xy`; the CM sign condition is vacuous.
/-- The trivial rank-one representation over the full subgroup has the product pairing and trivial multiplier and sign. -/
theorem polarization_trivial_totally_real (c : Γ) (hc2 : c ^ 2 = 1) :
    ∃ P : PolarizedRep (⊤ : Subgroup Γ)
      (ContinuousRep.trivial : ContinuousRep (⊤ : Subgroup Γ) A A) c,
      P.multiplier = 1 ∧ P.sign = 1 ∧ ∀ x y : A, P.pairing x y = x * y := by
  sorry

-- For `G_ℚ` on the zero `ℚ₃`-module, every involution, including complex conjugation, admits
-- the perfect alternating zero form with multiplier and sign one, although `1 ≠ -1`.
/-- A zero carrier permits a polarization whose sign cannot be recovered from the multiplier. -/
theorem polarization_sign_nonfaithful [Fact (Nat.Prime 3)] (c : Field.absoluteGaloisGroup ℚ) (hc : c ^ 2 = 1) :
    ∃ P : PolarizedRep (⊤ : Subgroup (Field.absoluteGaloisGroup ℚ))
      (ContinuousRep.trivial : ContinuousRep (⊤ : Subgroup (Field.absoluteGaloisGroup ℚ))
        ℚ_[3] (Fin 0 → ℚ_[3])) c,
      P.multiplier = 1 ∧ P.sign = 1 ∧ P.pairing = 0 ∧ P.pairing.IsAlt ∧
        (P.multiplier c : ℚ_[3]) ≠ -((P.sign : ℤ) : ℚ_[3]) := by
  refine ⟨
    { multiplier := 1
      pairing := 0
      sign := 1
      sq_c := hc
      pairing_perfect := Function.bijective_of_subsingleton' _
      conj_mem := fun _ => Subgroup.mem_top _
      covariance := ?_
      symm := ?_
      cm_sign := ?_ }, rfl, rfl, rfl, LinearMap.BilinForm.isAlt_zero, ?_⟩
  · intro σ x y
    simp
  · intro x y
    simp
  · simp
  · norm_num

end PolarizedRep

/-- The balance condition at an involution `c` (characteristic `≠ 2`): the `±1`-eigenspaces of
`ρ(c)` have dimensions differing by at most one (§7.4). -/
def GaloisRep.IsBalancedAt {K : Type*} [Field K] [TopologicalSpace K]
    {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [TopologicalSpace V]
    [IsModuleTopology K V] (ρ : ContinuousRep Γ K V) (c : Γ) : Prop :=
  |(Module.finrank K (Module.End.eigenspace (ρ c) 1) : ℤ) -
      Module.finrank K (Module.End.eigenspace (ρ c) (-1))| ≤ 1

/-- In characteristic `0`, or `ℓ > n + 1` (`n` even), `ℓ > n` (`n` odd), balance holds iff
`Tr ρ(c) ∈ {−1, 0, 1}`; `dim H⁰(⟨c⟩, ad⁰) = a² + b² − 1`, minimal exactly in the balanced case; in
rank two balance is `det ρ(c) = −1`. -/
theorem GaloisRep.isBalancedAt_iff_trace {K : Type*} [Field K] [TopologicalSpace K]
    {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [TopologicalSpace V]
    [IsModuleTopology K V] (ρ : ContinuousRep Γ K V) (c : Γ) (hc : c ^ 2 = 1) (h2 : (2 : K) ≠ 0)
    (hchar : ringChar K = 0 ∨ (Even (Module.finrank K V) ∧ Module.finrank K V + 1 < ringChar K) ∨
      (Odd (Module.finrank K V) ∧ Module.finrank K V < ringChar K)) :
    (GaloisRep.IsBalancedAt ρ c ↔ LinearMap.trace K V (ρ c) ∈ ({-1, 0, 1} : Set K)) ∧
      (Module.finrank K V = 2 → (GaloisRep.IsBalancedAt ρ c ↔ LinearMap.det (ρ c) = -1)) := by
  sorry

-- In characteristic `3` the identity of a plane has trace `−1` but is not balanced: `ℓ = n + 1` is
-- sharp.
/-- At characteristic equal to rank plus one the trace condition does not force balanced involution eigenspaces. -/
theorem trace_boundary_not_balanced {k V : Type*} [Field k] [CharP k 3] [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (hV : Module.finrank k V = 2) :
    LinearMap.trace k V 1 = -1 ∧
      ¬ |(Module.finrank k (Module.End.eigenspace (1 : Module.End k V) 1) : ℤ) -
        Module.finrank k (Module.End.eigenspace (1 : Module.End k V) (-1))| ≤ 1 := by
  sorry

end Polarized

-- The dual numbers are F₂[t]/(t²): a multiplier square identity does not force total oddness.
/-- A characteristic-two dual-number multiplier square identity does not force total oddness. -/
theorem multiplier_square_not_totallyOdd [TopologicalSpace (DualNumber (ZMod 2))] [DiscreteTopology (DualNumber (ZMod 2))]
    [TopologicalSpace (Multiplicative (ZMod 2))] [DiscreteTopology (Multiplicative (ZMod 2))] :
    letI : AddCommGroup (ZMod 2) := (ZMod.commRing 2).toAddCommGroup
    let R := DualNumber (ZMod 2)
    letI : CommRing R := inferInstanceAs (CommRing (DualNumber (ZMod 2)))
    letI : AddCommGroup R := (inferInstance : CommRing R).toAddCommGroup
    let G := Multiplicative (ZMod 2)
    let Γ := G × G
    let Δ : Subgroup Γ := (MonoidHom.fst G G).ker
    let c : Γ := (Multiplicative.ofAdd 1, 1)
    let c' : Γ := (1, Multiplicative.ofAdd 1)
    ∃ (ρ : ContinuousRep Δ R (Fin 2 → R)) (P : PolarizedRep Δ ρ c),
      (∀ σ : Δ, ρ σ = if (σ : Γ).2 = 1 then LinearMap.id
        else Matrix.toLin' (Matrix.diagonal ![(1 : R), 1 + (DualNumber.eps : R)])) ∧
      (∀ x y, P.pairing x y = x 0 * y 1 - x 1 * y 0) ∧
      P.sign = -1 ∧ P.multiplier c = 1 ∧
      (P.multiplier c' : R) = 1 + (DualNumber.eps : R) ∧
      (∀ g : Γ, P.multiplier g ^ 2 = 1) ∧
      ¬ P.IsTotallyOdd {c, c * c'} := by
  sorry

/-- For `d!, 2 ∈ Fˣ` and `r` preserving an alternating perfect form `h` on `F²` with multiplier `μ`,
the normalised symmetrisation `B_d` is a perfect `(−1)^d`-symmetric form on `Sym^d F²` with
multiplier `μ^d` (§7.4). -/
theorem symPower_polarization {Γ : Type*} [Group Γ] {F : Type} [Field F] (d : ℕ)
    (hd : (d.factorial : F) ≠ 0) (h2 : (2 : F) ≠ 0) (r : Representation F Γ (Fin 2 → F))
    (μ : Γ →* Fˣ) (h : LinearMap.BilinForm F (Fin 2 → F)) (halt : ∀ x, h x x = 0)
    (hperf : Function.Bijective h) (hr : ∀ g x y, h (r g x) (r g y) = (μ g : F) * h x y) :
    ∃ B : LinearMap.BilinForm F (Sym[F]^d (Fin 2 → F)),
      (∀ u w : Fin d → Fin 2 → F, B (⨂ₛ[F] i, u i) (⨂ₛ[F] i, w i) =
        ((d.factorial : F))⁻¹ * ∑ s : Equiv.Perm (Fin d), ∏ j, h (u j) (w (s j))) ∧
      Function.Bijective B ∧ (∀ u w, B w u = (-1) ^ d * B u w) ∧
      ∀ (g : Γ) (u w : Fin d → Fin 2 → F),
        B (⨂ₛ[F] i, r g (u i)) (⨂ₛ[F] i, r g (w i)) =
          (μ g : F) ^ d * B (⨂ₛ[F] i, u i) (⨂ₛ[F] i, w i) := by
  sorry

/-! ### `GSp₄`-valued representations -/

namespace ResidualImage

variable {K : Type*} [Field K] {n : Type*} [Fintype n] [DecidableEq n]

/-- The representation of `G` on `n → K` through `r : G → GL_n(K)`. -/
def matrixRep {G : Type*} [Monoid G] {K : Type*} [CommRing K] (r : G →* GL n K) :
    Representation K G (n → K) :=
  (Matrix.toLinAlgEquiv' : Matrix n n K ≃ₐ[K] Module.End K (n → K)).toRingEquiv.toMonoidHom.comp
    ((Units.coeHom (Matrix n n K)).comp r)

/-- The conjugation action `X ↦ r(g) X r(g)⁻¹` on `n × n` matrices. -/
def matConjRep {G : Type*} [Monoid G] {K : Type*} [CommRing K] (r : G →* GL n K) :
    Representation K G (Matrix n n K) where
  toFun g :=
    { toFun := fun X => (r g : Matrix n n K) * X * (((r g)⁻¹ : GL n K) : Matrix n n K)
      map_add' := sorry
      map_smul' := sorry }
  map_one' := sorry
  map_mul' := sorry

end ResidualImage

/-- A continuous `r : Γ → GSp₄(A)` (§7.5). -/
structure GSp4Rep (Γ : Type*) [Group Γ] [TopologicalSpace Γ] (A : Type*) [CommRing A]
    [TopologicalSpace A] where
  /-- The underlying continuous homomorphism. -/
  toHom : Γ →ₜ* SimilitudeGroup.GSp 2 A

namespace GSp4Rep

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] {A : Type*} [CommRing A] [TopologicalSpace A]

/-- Oddness: `ν(r(c)) = −1` for the complex conjugations `c ∈ C`. -/
def IsOdd (r : GSp4Rep Γ A) (C : Set Γ) : Prop :=
  ∀ c ∈ C, ((r.toHom c).1.2 : A) = -1

/-- `ad⁰ r` on `sp₄ = skewAdjointMatricesSubmodule J₄` (rank `10`), not the trace-zero `sl₄`. -/
def adZero (r : GSp4Rep Γ A) :
    Representation A Γ (skewAdjointMatricesSubmodule (SimilitudeGroup.J4 A)) :=
  (ResidualImage.matConjRep
    ((MonoidHom.fst _ _).comp ((SimilitudeGroup.GSp 2 A).subtype.comp r.toHom.toMonoidHom))).subrepresentation
    _ sorry

/-- For `2 ∈ Aˣ`, `ad⁰ r ≅ Sym² r ⊗ ν⁻¹` (BCGP 2021, §7.5.16, p. 202, gives
`ad⁰(W) = Sym²(W)` for symplectic `W`; the similitude twist comes from `V^∨ ≅ V ⊗ ν⁻¹`). -/
theorem adZero_equiv_symSq {A : Type} [CommRing A] [TopologicalSpace A] [Invertible (2 : A)]
    (r : GSp4Rep Γ A) :
    ∃ e : skewAdjointMatricesSubmodule (SimilitudeGroup.J4 A) ≃ₗ[A] Sym[A]^2 (Fin 2 ⊕ Fin 2 → A),
      ∀ (g : Γ) (v : Fin 2 → Fin 2 ⊕ Fin 2 → A),
        e (r.adZero g (e.symm (⨂ₛ[A] i, v i))) =
          ((((r.toHom g).1.2)⁻¹ : Aˣ) : A) •
            ⨂ₛ[A] i, (((r.toHom g).1.1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) A) *ᵥ v i) := by
  sorry

-- An odd `r` over a field with `2 ≠ 0` has `r(c)` with eigenvalues `1, 1, −1, −1`.
/-- Odd symplectic rank-four representations have balanced plus and minus one eigenvalues at the involution. -/
theorem odd_GSp4_charpoly {K : Type*} [Field K] [TopologicalSpace K] (r : GSp4Rep Γ K) (h2 : (2 : K) ≠ 0) (c : Γ)
    (hc : c ^ 2 = 1) (hodd : r.IsOdd {c}) :
    ((r.toHom c).1.1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) K).charpoly =
      (X - 1) ^ 2 * (X + 1) ^ 2 := by
  sorry

end GSp4Rep

/-- Over an algebraically closed field of characteristic `≠ 2`, semisimple `r, r' : Γ → GSp₄(L)` are
`GSp₄(L)`-conjugate iff they are `GL₄`-conjugate with `ν ∘ r = ν ∘ r'` (BCGP 2021, Lemma 2.1.3). -/
theorem gsp4_conj_iff_gl4_conj {Γ : Type*} [Group Γ] {L : Type*} [Field L] [IsAlgClosed L]
    (h2 : ringChar L ≠ 2) (r r' : Γ →* SimilitudeGroup.GSp 2 L)
    (hr : (ResidualImage.matrixRep
      ((MonoidHom.fst _ _).comp ((SimilitudeGroup.GSp 2 L).subtype.comp r))).IsSemisimpleRepresentation)
    (hr' : (ResidualImage.matrixRep
      ((MonoidHom.fst _ _).comp ((SimilitudeGroup.GSp 2 L).subtype.comp r'))).IsSemisimpleRepresentation) :
    (∃ P : SimilitudeGroup.GSp 2 L, ∀ g, r' g = P * r g * P⁻¹) ↔
      (∃ Q : GL (Fin 2 ⊕ Fin 2) L, ∀ g, (r' g).1.1 = Q * (r g).1.1 * Q⁻¹) ∧
        ∀ g, (r' g).1.2 = (r g).1.2 := by
  sorry

/-! ### Strong irreducibility, projective images and characters -/

namespace GaloisRep

section Strong

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {K : Type*} [Field K] [TopologicalSpace K]
  {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [TopologicalSpace V]
  [IsModuleTopology K V]

/-- `ρ` is strongly irreducible: irreducible on every open subgroup (§7.6). -/
def IsStronglyIrreducible (ρ : ContinuousRep Γ K V) : Prop :=
  ∀ Γ' : Subgroup Γ, IsOpen (Γ' : Set Γ) →
    (ρ.res ⟨Γ'.subtype, continuous_subtype_val⟩).toRepresentation.IsIrreducible

/-- `ρ` is absolutely strongly irreducible: absolutely irreducible on every open subgroup. -/
def IsAbsStronglyIrreducible (ρ : ContinuousRep Γ K V) : Prop :=
  ∀ Γ' : Subgroup Γ, IsOpen (Γ' : Set Γ) →
    (ρ.res ⟨Γ'.subtype, continuous_subtype_val⟩).IsAbsolutelyIrreducible

/-- Strongly irreducible implies irreducible; for `G_F`, strongly irreducible iff irreducible on
`G_L` for every finite `L/F`. -/
theorem isStronglyIrreducible_iff_finiteExt {F : Type} [Field F]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) K V) :
    (IsStronglyIrreducible ρ → ρ.toRepresentation.IsIrreducible) ∧
    (IsStronglyIrreducible ρ ↔ ∀ (L : Type) [Field L] [Algebra F L] [FiniteDimensional F L]
      [Algebra (AlgebraicClosure F) (AlgebraicClosure L)]
      [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure L)],
      (ρ.res (localEmbeddingMap F L)).toRepresentation.IsIrreducible) := by
  sorry

-- Dimension one is strongly irreducible.
/-- A one-dimensional continuous representation is strongly irreducible. -/
theorem stronglyIrreducible_of_finrank_one (ρ : ContinuousRep Γ K V) (h : Module.finrank K V = 1) : IsStronglyIrreducible ρ := by
  sorry

end Strong

/-- Goursat for `PGL₂`: a subgroup of `PGL₂(Ω) × PGL₂(Ω)` with both projections surjective is the
whole product or the graph of an automorphism of the abstract group (NT26, proof of Lemma 2.2). -/
theorem pgl_two_goursat (Ω : Type*) [Field Ω] [IsAlgClosed Ω]
    (G : Subgroup (Matrix.ProjGenLinGroup (Fin 2) Ω × Matrix.ProjGenLinGroup (Fin 2) Ω))
    (h₁ : ∀ a, ∃ x ∈ G, x.1 = a) (h₂ : ∀ b, ∃ x ∈ G, x.2 = b) :
    G = ⊤ ∨ ∃ φ : Matrix.ProjGenLinGroup (Fin 2) Ω ≃* Matrix.ProjGenLinGroup (Fin 2) Ω,
      ∀ x, x ∈ G ↔ x.2 = φ x.1 := by
  sorry

/-- A continuous character `χ : Γ → Q̄_ℓˣ` of a profinite group is `χ₁^m χ₀` with `χ₀` of finite
order, for every `m ≠ 0` (Patrikis 2019, Lemma 2.3.15); `χ₀` cannot be dropped (the sign character
of `ℤ/2`, `m = 2`). -/
theorem exists_root_mul_finiteOrder {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [TotallyDisconnectedSpace Γ] (ℓ : ℕ) [Fact ℓ.Prime]
    (χ : Γ →ₜ* (PadicAlgCl ℓ)ˣ) (m : ℤ) (hm : m ≠ 0) :
    ∃ χ₁ χ₀ : Γ →ₜ* (PadicAlgCl ℓ)ˣ,
      (∃ N : ℕ, 0 < N ∧ ∀ g, χ₀ g ^ N = 1) ∧ ∀ g, χ g = χ₁ g ^ m * χ₀ g := by
  sorry

/-- Schur's lemma over a local ring: if the reduction of `ρ : Γ → GL_n(A)` is absolutely irreducible
then `ρ(Γ)` spans `M_n(A)` and its centraliser is the scalars (CHT08, Lemma 2.1.8). -/
theorem span_eq_top_and_centralizer_of_residually_absIrred {A : Type*} [CommRing A]
    [IsLocalRing A] {Γ : Type*} [Group Γ] {n : Type*} [Fintype n] [DecidableEq n] [Nonempty n]
    (ρ : Γ →* GL n A)
    (hirr : Submodule.span (IsLocalRing.ResidueField A)
      (Set.range fun g : Γ => (ρ g : Matrix n n A).map (IsLocalRing.residue A)) = ⊤) :
    Submodule.span A (Set.range fun g : Γ => (ρ g : Matrix n n A)) = ⊤ ∧
    ∀ X : Matrix n n A, (∀ g, X * (ρ g : Matrix n n A) = (ρ g : Matrix n n A) * X) →
      ∃ a : A, X = Matrix.scalar n a := by
  sorry

end GaloisRep

/-! ### Clebsch–Gordan -/

namespace ContinuousRep

/-- Clebsch–Gordan for a plane: the tensor product of its symmetric powers splits into
determinant twists when `(a+b)!` is invertible, for any acting group (§7.8). -/
theorem clebschGordan {k : Type} [Field k] {G V : Type*} [Group G]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ρ : Representation k G V) (hdim : Module.finrank k V = 2)
    (δ : G →* kˣ) (hδ : ∀ g : G, (δ g : k) = LinearMap.det (ρ g))
    (a b : ℕ) (hba : b ≤ a) (hfact : IsUnit ((a + b).factorial : k)) :
    ∃ e : ((Sym[k]^a V) ⊗[k] (Sym[k]^b V)) ≃ₗ[k]
        (⨁ i : Fin (b + 1), Sym[k]^(a + b - 2 * (i : ℕ)) V),
      ∀ (g : G) (x : (Sym[k]^a V) ⊗[k] (Sym[k]^b V)),
        e ((ρ.symmetricPower a).tprod (ρ.symmetricPower b) g x) =
          Representation.directSum (fun i : Fin (b + 1) =>
            Representation.charTwist (δ ^ (i : ℕ))
              (ρ.symmetricPower (a + b - 2 * (i : ℕ)))) g (e x) := by
  sorry

end ContinuousRep

/-! ### Adequate and enormous subgroups -/

namespace ResidualImage

variable {K : Type*} [Field K] {n : Type*} [Fintype n] [DecidableEq n]

/-- `ad` of `r : G → GL_n(K)`: Mathlib's `linHom` of the tautological representation with itself. -/
def adRep {G : Type*} [Group G] (r : G →* GL n K) : Representation K G (Module.End K (n → K)) :=
  Representation.linHom (matrixRep r) (matrixRep r)

/-- `ad⁰ ⊆ ad`, the trace-zero subrepresentation. -/
def adZeroRep {G : Type*} [Group G] (r : G →* GL n K) :
    Representation K G (LinearMap.ker (LinearMap.trace K (n → K))) :=
  (adRep r).subrepresentation _ sorry

/-- `ad₀ := ad / K·1`, the quotient by the scalar line. -/
def adQuotRep {G : Type*} [Group G] (r : G →* GL n K) :
    Representation K G (Module.End K (n → K) ⧸ Submodule.span K {(1 : Module.End K (n → K))}) :=
  (adRep r).quotient _ sorry

/-- `W` is a simple `K[G]`-submodule of `V`. -/
def IsSimpleStable {G V : Type*} [Monoid G] [AddCommMonoid V] [Module K V]
    (ρ : Representation K G V) (W : Submodule K V) : Prop :=
  W ≠ ⊥ ∧ (∀ g, W ≤ W.comap (ρ g)) ∧
    ∀ W' : Submodule K V, (∀ g, W' ≤ W'.comap (ρ g)) → W' ≤ W → W' = ⊥ ∨ W' = W

/-- `e` is the projection `e_{f,α}` onto the generalised `α`-eigenspace of `f` along the sum of the
other generalised eigenspaces. -/
def IsEigenProjection {V : Type*} [AddCommGroup V] [Module K V] (f e : Module.End K V) (α : K) :
    Prop :=
  e * e = e ∧ LinearMap.range e = f.maxGenEigenspace α ∧
    LinearMap.ker e = ⨆ (β : K) (_ : β ≠ α), f.maxGenEigenspace β

variable {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n]

/-- Thorne's trace condition (A3): every simple `k̄[H]`-submodule `W ⊆ ad⁰ ⊗ k̄` has `tr(e_{g,α} W) ≠ 0`
for some `g ∈ H` and `α ∈ k̄`. -/
def AdZeroTraceCondition (H : Subgroup (GL n k)) : Prop :=
  ∀ W : Submodule (AlgebraicClosure k) (Module.End (AlgebraicClosure k) (n → AlgebraicClosure k)),
    IsSimpleStable
      (adRep ((Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))).comp H.subtype)) W →
    W ≤ LinearMap.ker (LinearMap.trace _ _) →
    ∃ g ∈ H, ∃ α : AlgebraicClosure k, ∃ e, IsEigenProjection
        (matrixRep (Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))) g) e α ∧
      ∃ w ∈ W, LinearMap.trace _ _ (e * w) ≠ 0

/-- In positive rank, `H` is weakly adequate: its semisimple elements span `M_n(k)`. -/
def IsWeaklyAdequate (H : Subgroup (GL n k)) : Prop :=
  Nonempty n ∧ Submodule.span k {X : Matrix n n k | ∃ g ∈ H, (minpoly k (g : Matrix n n k)).Separable ∧
    X = (g : Matrix n n k)} = ⊤

/-- In positive rank, `H` is adequate (Thorne 2012, Def. 2.3): `H¹(H, k) = 0`, `H⁰(H, ad⁰) = H¹(H, ad⁰) = 0`, and the
trace condition (A3) (§7.9). -/
def IsAdequate (H : Subgroup (GL n k)) : Prop :=
  Nonempty n ∧ Subsingleton (groupCohomology (Rep.of (Representation.trivial k H k)) 1) ∧
  Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace k (n → k))) (adZeroRep H.subtype)) 0) ∧
  Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace k (n → k))) (adZeroRep H.subtype)) 1) ∧
  AdZeroTraceCondition H

/-- In positive rank, `H` is GHT-adequate (Thorne 2017, Def. 2.20): `H¹(H, k) = 0`, `H¹(H, ad₀) = 0` and weak
adequacy. -/
def IsGHTAdequate (H : Subgroup (GL n k)) : Prop :=
  Nonempty n ∧ Subsingleton (groupCohomology (Rep.of (Representation.trivial k H k)) 1) ∧
  Subsingleton (groupCohomology (Rep.of (X := Module.End k (n → k) ⧸ Submodule.span k {(1 : Module.End k (n → k))})
    (adQuotRep H.subtype)) 1) ∧ IsWeaklyAdequate H

/-- For finite `H` in positive rank and positive characteristic, (A3) ⇔ weakly adequate; adequate forces `p ∤ n` and absolute irreducibility; if `p ∤ n`,
adequate ⇔ GHT-adequate (GHTT appendix, Lemma 1; Thorne 2017). -/
theorem isAdequate_iff [Nonempty n] (H : Subgroup (GL n k)) [Finite H]
    (hp : (ringChar k).Prime) :
    (AdZeroTraceCondition H ↔ IsWeaklyAdequate H) ∧
      (IsAdequate H → ¬ ringChar k ∣ Fintype.card n ∧
        Submodule.span k ((fun g : GL n k => (g : Matrix n n k)) '' (H : Set (GL n k))) = ⊤) ∧
      (¬ ringChar k ∣ Fintype.card n → (IsAdequate H ↔ IsGHTAdequate H)) := by
  sorry

/-- An absolutely irreducible finite `H ⊆ GL_n(k)` is adequate if `p ∤ #H` or `p ≥ 2(n + 1)`
(BLGG13, Rem. A.1.2; GHTT, Thm 9). -/
theorem isAdequate_of_coprime_or_large [Nonempty n] (H : Subgroup (GL n k)) [Finite H] (hp : (ringChar k).Prime)
    (hirr : Submodule.span k ((fun g : GL n k => (g : Matrix n n k)) '' (H : Set (GL n k))) = ⊤)
    (h : ¬ ringChar k ∣ Nat.card H ∨ 2 * (Fintype.card n + 1) ≤ ringChar k) : IsAdequate H := by
  sorry

/-- Tensoring an adequate finite image with a prime-to-characteristic image preserves adequacy
when the second factor is absolutely irreducible on the first factor's kernel
(BLGG, Lemma A.3.1; §7.9). -/
theorem isAdequate_tensor {Γ : Type*} {m : Type} [Group Γ] [Fintype m] [DecidableEq m]
    [Nonempty n] [Nonempty m] (r₁ : Γ →* GL n k) (r₂ : Γ →* GL m k)
    (r : Γ →* GL (n × m) k) [Finite r₁.range] [Finite r₂.range]
    (hp : (ringChar k).Prime) (h₁ : IsAdequate r₁.range)
    (h₂ : Submodule.span k
      (Set.range fun g : r₁.ker => (r₂ g : Matrix m m k)) = ⊤)
    (horder : ¬ ringChar k ∣ Nat.card r₂.range)
    (htensor : ∀ g, r g = (r₁ g).kronecker (r₂ g)) : IsAdequate r.range := by
  sorry

/-- The cyclic cubic action on F₅² is irreducible but has a nonzero trace-zero centralizer,
so its prime-to-five image is not adequate (§7.9). -/
theorem cyclicThree_F5_not_adequate [Fact (Nat.Prime 5)]
    (r : Multiplicative (ZMod 3) →* GL (Fin 2) (ZMod 5))
    (hr : (r (Multiplicative.ofAdd 1) : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![0, 4; 1, 4]) :
    letI : AddCommGroup (ZMod 5) := (ZMod.commRing 5).toAddCommGroup
    Representation.IsIrreducible (k := ZMod 5) (V := Fin 2 → ZMod 5)
      (matrixRep r) ∧ ¬ IsAdequate r.range ∧
      ∃ B : Matrix (Fin 2) (Fin 2) (ZMod 5), B ≠ 0 ∧ B.trace = 0 ∧
        ∀ g, B * (r g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = (r g : Matrix (Fin 2) (Fin 2) (ZMod 5)) * B := by
  sorry

/-- The simple natural GL₂(F₂)-module restricts nonsemisimply to its transvection subgroup;
residual restriction therefore needs an outer semisimplification (§1.9). -/
theorem natural_GL2_F2_restrict_not_semisimple
    (u : GL (Fin 2) (ZMod 2))
    (hu : (u : Matrix (Fin 2) (Fin 2) (ZMod 2)) = !![1, 1; 0, 1]) :
    letI : AddCommGroup (ZMod 2) := (ZMod.commRing 2).toAddCommGroup
    Representation.IsIrreducible (k := ZMod 2) (V := Fin 2 → ZMod 2)
      (matrixRep (MonoidHom.id (GL (Fin 2) (ZMod 2)))) ∧
      ¬ Representation.IsSemisimpleRepresentation (k := ZMod 2) (V := Fin 2 → ZMod 2)
        (matrixRep (Subgroup.zpowers u).subtype) := by
  sorry

-- `SL₂(F₅)` is not adequate (`H¹(SL₂(F₅), ad⁰) ≠ 0`); the trivial subgroup of `GL₂` is not adequate.
/-- The natural SL₂(F₅) image and the trivial rank-two image fail adequacy. -/
theorem SL2_F5_and_trivial_not_adequate [Fact (Nat.Prime 5)] :
    ¬ IsAdequate (Matrix.SpecialLinearGroup.toGL :
      Matrix.SpecialLinearGroup (Fin 2) (ZMod 5) →* GL (Fin 2) (ZMod 5)).range ∧
    ¬ IsAdequate (⊥ : Subgroup (GL (Fin 2) (ZMod 5))) := by
  sorry

-- The zero-dimensional subgroup satisfies the raw trace/cohomology conditions but has no
-- nonzero carrier, so it satisfies none of the adequacy predicates.
/-- The three adequacy predicates exclude rank zero despite vacuous cohomology and trace conditions. -/
theorem zero_rank_not_adequate (H : Subgroup (GL (Fin 0) k)) :
    ¬ IsWeaklyAdequate H ∧ ¬ IsAdequate H ∧ ¬ IsGHTAdequate H := by
  simp [IsWeaklyAdequate, IsAdequate, IsGHTAdequate]

/-- Restriction on `H¹` is injective for a subgroup of index invertible in `k`; in particular
`H¹(G, A) = 0` for `#G ∈ kˣ` (BLGG13, Rem. A.1.2). -/
theorem isCoboundary₁_of_restrict_of_index_isUnit {k G A : Type*} [CommRing k] [Group G]
    [AddCommGroup A] [Module k A] [DistribMulAction G A] [SMulCommClass G k A]
    (S : Subgroup G) [S.FiniteIndex] (hS : IsUnit (S.index : k)) (f : G → A)
    (hf : groupCohomology.IsCocycle₁ f)
    (hres : groupCohomology.IsCoboundary₁ (fun s : S => f (s : G))) :
    groupCohomology.IsCoboundary₁ f := by
  sorry

/-- For a finite field `F` of odd characteristic with `#F ≠ 5`, `H⁰` and `H¹` of `SL₂(F)` with
coefficients in `ad⁰` vanish; `H¹(SL₂(F₅), ad⁰) ≠ 0` while `H¹(GL₂(F₅), ad⁰) = 0`
(DDT, Lemma 2.48; CHT08, proof of Cor. 2.5.4). -/
theorem h1_SL2_adZero_eq_zero (F : Type) [Field F] [Fintype F] (hp : ringChar F ≠ 2)
    (h5 : Fintype.card F ≠ 5) :
    Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace F (Fin 2 → F)))
      (adZeroRep (Matrix.SpecialLinearGroup.toGL :
        Matrix.SpecialLinearGroup (Fin 2) F →* GL (Fin 2) F))) 0) ∧
    Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace F (Fin 2 → F)))
      (adZeroRep (Matrix.SpecialLinearGroup.toGL :
        Matrix.SpecialLinearGroup (Fin 2) F →* GL (Fin 2) F))) 1) := by
  sorry

/-- `h` is regular semisimple: its characteristic polynomial is separable. -/
def IsRegularSemisimple (h : GL n k) : Prop := (Matrix.charpoly (h : Matrix n n k)).Separable

/-- In positive rank, `H ≤ GL_n(k)` is enormous (Allen et al. 2023, Def. 6.2.29): absolutely irreducible, no
nontrivial `p`-power quotient, `H⁰(H, ad⁰) = H¹(H, ad⁰) = 0`, and every simple `k[H]`-submodule of
`ad⁰` has a nonzero vector fixed by a regular semisimple `h ∈ H` (§7.10). -/
def IsEnormous (H : Subgroup (GL n k)) : Prop :=
  Nonempty n ∧ Submodule.span k ((fun g : GL n k => (g : Matrix n n k)) '' (H : Set (GL n k))) = ⊤ ∧
  (∀ (N : Subgroup H) [N.Normal], IsPGroup (ringChar k) (H ⧸ N) → N = ⊤) ∧
  Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace k (n → k))) (adZeroRep H.subtype)) 0) ∧
  Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace k (n → k))) (adZeroRep H.subtype)) 1) ∧
  ∀ W : Submodule k (LinearMap.ker (LinearMap.trace k (n → k))),
    IsSimpleStable (adZeroRep H.subtype) W →
    ∃ h : H, IsRegularSemisimple (h : GL n k) ∧ ∃ w ∈ W, w ≠ 0 ∧ adZeroRep H.subtype h w = w

/-- Enormity forces `p ∤ n`; for `k` algebraic over `F_p` with all eigenvalues in `k`, a finite
enormous `H` is adequate, and for `n = 2`, `p` odd, `H` finite irreducible, enormous ⇔ adequate
(Allen et al. 2023, Lemma 6.2.30; Gee–Newton 2022, Lemma 3.2.3). -/
theorem IsEnormous.isAdequate (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) k]
    [Algebra.IsAlgebraic (ZMod p) k] (H : Subgroup (GL n k)) [Finite H] (hH : IsEnormous H)
    (heig : ∀ h ∈ H, (Matrix.charpoly (h : Matrix n n k)).Splits) :
    ¬ p ∣ Fintype.card n ∧ IsAdequate H := by
  sorry

-- `SL₂(F₇)` is enormous; `SL₂(F₅)` is not (`H¹ ≠ 0`); `SL₂(F₃)` is not (it has a quotient of order
-- three).
/-- The natural SL₂ images at seven, five and three distinguish the small-characteristic enormity conditions. -/
theorem SL2_small_enormity [Fact (Nat.Prime 7)] [Fact (Nat.Prime 5)] [Fact (Nat.Prime 3)] :
    IsEnormous (Matrix.SpecialLinearGroup.toGL :
      Matrix.SpecialLinearGroup (Fin 2) (ZMod 7) →* GL (Fin 2) (ZMod 7)).range ∧
    ¬ IsEnormous (Matrix.SpecialLinearGroup.toGL :
      Matrix.SpecialLinearGroup (Fin 2) (ZMod 5) →* GL (Fin 2) (ZMod 5)).range ∧
    ¬ IsEnormous (Matrix.SpecialLinearGroup.toGL :
      Matrix.SpecialLinearGroup (Fin 2) (ZMod 3) →* GL (Fin 2) (ZMod 3)).range := by
  sorry

/-- In positive rank, the characteristic-zero enormity of Newton–Thorne 2023, Def. 2.23: every simple
`E[H]`-submodule of `M_n(E)` has `tr(e_{h,α} V) ≠ 0` for some `h ∈ H` with `n` distinct eigenvalues
in `E`; such `H` acts absolutely irreducibly (Lemma 2.25). -/
def IsEnormousCharZero {O : Type*} [CommRing O] {E : Type*} [Field E] [Algebra O E]
    (H : Subgroup (GL n O)) : Prop :=
  Nonempty n ∧ ∀ W : Submodule E (Module.End E (n → E)),
    IsSimpleStable (adRep ((Matrix.GeneralLinearGroup.map (algebraMap O E)).comp H.subtype)) W →
    ∃ h ∈ H, (∃ s : Multiset E, s.Nodup ∧
        Matrix.charpoly ((h : Matrix n n O).map (algebraMap O E)) = (s.map fun a => X - C a).prod) ∧
      ∃ α : E, ∃ e, IsEigenProjection (matrixRep (Matrix.GeneralLinearGroup.map (algebraMap O E)) h) e α ∧
        ∃ w ∈ W, LinearMap.trace E (n → E) (e * w) ≠ 0

/-- Characteristic-zero enormity forces absolute irreducibility: the scalar-extended image
spans the full matrix algebra (Newton–Thorne 2023, Lemma 2.25, §7.10). -/
theorem IsEnormousCharZero.span_eq_top {O : Type*} [CommRing O]
    {E : Type*} [Field E] [CharZero E] [Algebra O E]
    (H : Subgroup (GL n O)) (hH : IsEnormousCharZero (E := E) H) :
    Submodule.span E (Set.range fun h : H =>
      ((h : GL n O) : Matrix n n O).map (algebraMap O E)) = ⊤ := by
  sorry

/-- The fixing subgroup `G_{F(μ_m)}` of the `m`-th roots of unity. -/
def cyclotomicSubgroup (F : Type*) [Field F] (m : ℕ) : Subgroup (Field.absoluteGaloisGroup F) :=
  IntermediateField.fixingSubgroup (IntermediateField.adjoin F {x : AlgebraicClosure F | x ^ m = 1})

/-- The Taylor–Wiles image conditions (BCGNT 2025, Def. 5.2.1): `s̄(G_{F(ζ_p)})` adequate and some
`σ ∉ G_{F(ζ_p)}` with `s̄(σ)` scalar (§7.12). -/
def TaylorWilesImageConditions {F : Type} [Field F] (s : Field.absoluteGaloisGroup F →* GL n k) :
    Prop :=
  IsAdequate ((cyclotomicSubgroup F (ringChar k)).map s) ∧
  ∃ σ, σ ∉ cyclotomicSubgroup F (ringChar k) ∧ s σ ∈ (Matrix.GeneralLinearGroup.scalar n).range

/-- The enormous variant. -/
def EnormousTaylorWilesImageConditions {F : Type} [Field F]
    (s : Field.absoluteGaloisGroup F →* GL n k) : Prop :=
  IsEnormous ((cyclotomicSubgroup F (ringChar k)).map s) ∧
  ∃ σ, σ ∉ cyclotomicSubgroup F (ringChar k) ∧ s σ ∈ (Matrix.GeneralLinearGroup.scalar n).range

/-- (TW3) iff `ζ_p` is not in the field cut out by `ad s̄`, for `F` of characteristic zero; the
conditions are invariant under twisting (`k` finite) (BCGNT 2025, §5.2). -/
theorem tw3_iff_zeta_not_mem {F : Type} [Field F] [CharZero F] (hk : (ringChar k).Prime)
    (s : Field.absoluteGaloisGroup F →* GL n k) :
    (∃ σ, σ ∉ cyclotomicSubgroup F (ringChar k) ∧
        s σ ∈ (Matrix.GeneralLinearGroup.scalar n).range) ↔
      ∀ ζ : AlgebraicClosure F, IsPrimitiveRoot ζ (ringChar k) →
        ζ ∉ IntermediateField.fixedField
          (Subgroup.comap s (Matrix.GeneralLinearGroup.scalar n).range) := by
  sorry

-- In rank one the conditions hold iff `ζ_p ∉ F`.
/-- For rank-one finite residual coefficients the Taylor–Wiles image conditions are equivalent to absence of the primitive root of unity. -/
theorem TaylorWiles_rank_one {F : Type} [Field F] [NumberField F] [Finite k] (hk : (ringChar k).Prime)
    (s : Field.absoluteGaloisGroup F →* GL (Fin 1) k) :
    TaylorWilesImageConditions s ↔ ∀ ζ : F, ¬ IsPrimitiveRoot ζ (ringChar k) := by
  sorry

end ResidualImage

/-! ### Enormous, tidy and vast subgroups of `GSp₄` -/

namespace ResidualImage.GSp4

variable {k : Type} [Field k]

/-- The adjoint action of `r : G → GSp₄(K)` on `sp₄ = skewAdjointMatricesSubmodule J₄`. -/
def adZeroOf {G : Type*} [Group G] {K : Type*} [Field K] (r : G →* SimilitudeGroup.GSp 2 K) :
    Representation K G (skewAdjointMatricesSubmodule (SimilitudeGroup.J4 K)) :=
  (matConjRep ((MonoidHom.fst _ _).comp ((SimilitudeGroup.GSp 2 K).subtype.comp r))).subrepresentation
    _ sorry

/-- The map `GSp₄(K) → GSp₄(L)` induced by `K → L`. -/
def baseChange (K L : Type*) [Field K] [Field L] [Algebra K L] :
    SimilitudeGroup.GSp 2 K →* SimilitudeGroup.GSp 2 L where
  toFun g := ⟨(Matrix.GeneralLinearGroup.map (algebraMap K L) g.1.1,
    Units.map (algebraMap K L).toMonoidHom g.1.2), sorry⟩
  map_one' := sorry
  map_mul' := sorry

/-- Weakly enormous (BCGP 2021, Def. 7.5.2): (E2) absolutely irreducible on `k⁴`, and (E3) every
simple `k̄[H]`-submodule of `sp₄ ⊗ k̄` has eigenvalue `1` for some `h` with four distinct eigenvalues
(§7.11). -/
def IsWeaklyEnormous (H : Subgroup (SimilitudeGroup.GSp 2 k)) : Prop :=
  Submodule.span k (Set.range fun h : H =>
    ((h : SimilitudeGroup.GSp 2 k).1.1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k)) = ⊤ ∧
  ∀ W : Submodule (AlgebraicClosure k)
      (skewAdjointMatricesSubmodule (SimilitudeGroup.J4 (AlgebraicClosure k))),
    IsSimpleStable (adZeroOf ((baseChange k (AlgebraicClosure k)).comp H.subtype)) W →
    ∃ h : H, ((h : SimilitudeGroup.GSp 2 k).1.1 :
        Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k).charpoly.Separable ∧
      ∃ w ∈ W, w ≠ 0 ∧ adZeroOf ((baseChange k (AlgebraicClosure k)).comp H.subtype) h w = w

/-- Enormous: (E1) `H¹(H, sp₄) = 0` together with (E2), (E3); no `p`-power quotient condition. -/
def IsEnormous (H : Subgroup (SimilitudeGroup.GSp 2 k)) : Prop :=
  Subsingleton (groupCohomology
    (Rep.of (X := skewAdjointMatricesSubmodule (SimilitudeGroup.J4 k)) (adZeroOf H.subtype)) 1) ∧ IsWeaklyEnormous H

/-- Tidy (BCGP 2021, Def. 7.5.11): some `h ∈ H` has `ν(h) ≠ 1` and no two eigenvalues in ratio
`ν(h)`. -/
def IsTidy (H : Subgroup (SimilitudeGroup.GSp 2 k)) : Prop :=
  ∃ h ∈ H, h.1.2 ≠ 1 ∧
    ∀ a ∈ ((h.1.1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k).map
        (algebraMap k (AlgebraicClosure k))).charpoly.roots,
      ∀ b ∈ ((h.1.1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k).map
          (algebraMap k (AlgebraicClosure k))).charpoly.roots,
        a ≠ algebraMap k (AlgebraicClosure k) (h.1.2 : k) * b

/-- A symplectic image with identically trivial multiplier cannot be tidy (§7.11). -/
theorem not_isTidy_of_multiplier_eq_one (H : Subgroup (SimilitudeGroup.GSp 2 k))
    (hν : ∀ h ∈ H, h.1.2 = 1) : ¬ IsTidy H := by
  rintro ⟨h, hh, hne, _⟩
  exact hne (hν h hh)

/-- Vast (BCGP 2021, Def. 7.5.6): `ρ̄(G_{F(ζ_{p^N})})` enormous for all large `N`, or weakly enormous
for all large `N` with `ζ_p` outside the field cut out by `ad⁰ ρ̄`. -/
def IsVast {F : Type} [Field F] (ρ : Field.absoluteGaloisGroup F →* SimilitudeGroup.GSp 2 k) :
    Prop :=
  (∀ᶠ N in Filter.atTop, IsEnormous ((cyclotomicSubgroup F (ringChar k ^ N)).map ρ)) ∨
  ((∀ᶠ N in Filter.atTop, IsWeaklyEnormous ((cyclotomicSubgroup F (ringChar k ^ N)).map ρ)) ∧
    ¬ (MonoidHom.ker (adZeroOf ρ) ≤ cyclotomicSubgroup F (ringChar k)))

/-- For `p ≥ 3`, `Sp₄(F_p)` is enormous and `GSp₄(F_p)` is tidy; a surjection `G_F → GSp₄(F_p)` with
similitude `ε̄⁻¹` is vast and tidy (BCGP 2021, Lemma 7.5.15). -/
theorem isEnormous_Sp4_isTidy_GSp4 (p : ℕ) [Fact p.Prime] (hp : 3 ≤ p) :
    IsEnormous (SimilitudeGroup.multiplier (SimilitudeGroup.J4 (ZMod p)) (ZMod p)).ker ∧
    IsTidy (⊤ : Subgroup (SimilitudeGroup.GSp 2 (ZMod p))) := by
  sorry

-- A central scalar `λ` with `λ² ≠ 1` makes a group tidy (`ν = λ²`); over `F₃` every scalar has
-- `ν = 1`.
/-- A scalar with nontrivial squared multiplier witnesses tidiness. -/
theorem scalar_implies_tidy (H : Subgroup (SimilitudeGroup.GSp 2 k)) (lam : kˣ) (hlam : lam ^ 2 ≠ 1)
    (s : SimilitudeGroup.GSp 2 k) (hs : s.1.1 = Matrix.GeneralLinearGroup.scalar (Fin 2 ⊕ Fin 2) lam)
    (hν : s.1.2 = lam ^ 2) (hsH : s ∈ H) : IsTidy H := by
  sorry

end ResidualImage.GSp4

end TauCetiRoadmap.ArithmeticGaloisRepresentations
