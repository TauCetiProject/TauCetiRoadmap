/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.Matrix
public import TauCeti.Algebra.Coalgebra.Subcomodule.Basic

/-!
# Quantum groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions (real bodies on native carriers) that those statements need.

Stated here: the weighted Schur orthogonality relations on a Hopf *-algebra with a positive
invariant functional (§3.1); the algebraic compact-type equivalence, the existence and uniqueness
of the modular automorphism of the Haar functional and the Kac equivalence between traciality of
the Haar functional and involutivity of the antipode (§4.1). A Hopf *-algebra is a native complex
Hopf algebra with a compatible star structure whose comultiplication preserves the star; these
statements take that condition, `Δ(a*) = Δ(a)*` for the tensor star `(x ⊗ y)* = x* ⊗ y*`, as the
hypothesis `hΔ`. Tau Ceti bundles the same equation as the class `TauCeti.StarCoalgebra`
(`Algebra/Coalgebra/Star.lean`), a module that the pinned Tau Ceti does not contain.

Proved in Tau Ceti and not restated, in modules that the pinned Tau Ceti does not contain (README
Layer 8 names the declarations): the Layer 8 algebra `TauCeti.UqSl2` with its universal property,
Ore-tower presentation, PBW basis and domain property for every `q ≠ 0`, its Hopf structure,
Casimir element and centre `ℂ[Ω]`, the Verma and signed ladder modules with the classification of
finite-dimensional simples, finite complete reducibility, the semisimplicity, ladder decomposition
and type-1 characterisations of locally finite modules (in particular
`TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`),
the Clebsch–Gordan isomorphisms and triple recoupling, contragredients, quantum traces, the
compact real form with its invariant metric and the classical specialisation, together with the
finite Hopf-module category `TauCeti.FiniteHopfModuleCat` of §8.5.

Not statable at the pins:

* Layer 0: the free-module coaction legs, the C*-categories with standard conjugates and the
  unitary Temperley–Lieb category are constructions of the roadmap; the Hilbert-module
  adjointable and compact operators and interior tensor products they rest on are
  HilbertModules' targets, the minimal C*-tensor product is VonNeumannAlgebras', and its
  functoriality, flip and commutative identifications are CStarAlgebras'. No carrier for any of
  them exists at the pins. The bicommutant theorem, Tomita–Takesaki theory and full left Hilbert
  algebras are VonNeumannAlgebras' targets and are not restated here.
* Layer 1 existence and uniqueness of the Haar state of a compact quantum group, and every
  Layer 1, 2, 4 and 7 statement about a C*-bialgebra `Δ : A → A ⊗_min A`: neither Mathlib nor Tau
  Ceti has the minimal (spatial) C*-tensor product of two C*-algebras.
* Layer 2 decomposition of unitary corepresentations on arbitrary Hilbert spaces and the
  analytic Peter–Weyl theorem: Mathlib's `CStarModule` exists, but the free Hilbert module
  `H ⊗ A` and its adjointable operators, on which the coaction is defined, do not.
* §§3.2–3.4, the Woronowicz characters `f_z` and the scaling and modular groups `τ_t`, `σ_t`:
  they are defined blockwise by the complex powers `F^z` of the positive matrices of the
  Peter–Weyl decomposition of the core, a construction of §3.1; the pivotal structure and
  intrinsic dimensions of §3.3 need the C*-tensor category of §0.2; and the Tomita comparison
  needs the full left Hilbert algebra of VonNeumannAlgebras Layer 11. None has a carrier at the
  pins.
* Layer 4 universal and reduced completions and the coamenability criteria: they need the
  C*-envelope of a Hopf *-algebra and the minimal tensor product above.
* Layer 5: the universal C*-algebras `C(SUq(2))` and `A_o(F)` as compact matrix quantum groups,
  whose coproducts take values in the minimal tensor product above.
* Layer 6 Tannaka–Krein reconstruction: there is no unitary rigid C*-tensor category, dagger
  fibre functor or finite Hilbert-space dagger category at the pins.
* Layer 7 fusion rules, dimensions and Haar laws of `SUq(2)` and `O_F^+`: they are statements
  about the universal C*-algebras of Layer 5, which need the minimal tensor product for their
  coproduct.
* §8.5 Biedenharn–Elliott pentagon: it needs the recoupling isomorphisms between the five
  bracketings of a quadruple tensor product of signed ladder modules, in channel coordinates,
  and Tau Ceti has recoupling only for triple products
  (`TauCeti.UqSl2.clebschGordanRecouplingEquiv`), in a module that the pinned Tau Ceti does not
  contain.
* §8.5 sphericity of the finite `U_q(sl₂)`-modules for `q ≠ 0` with `q − q⁻¹ ≠ 0`, with the rigid
  structure of the bijective antipode and the pivotal structure of the pivot `K⁻¹`: its carriers
  are Tau Ceti's `TauCeti.FiniteHopfModuleCat` with `TauCeti.FiniteHopfModuleCat.rigidCategory`
  and `TauCeti.FiniteHopfModuleCat.unitEvalNatIso`, the classes `TauCeti.PivotalCategory` and
  `TauCeti.SphericalCategory`, and `TauCeti.UqSl2` with `TauCeti.UqSl2.antipode_antipode`, in the
  modules `Algebra/Category/FiniteHopfModuleCat/{Rigid,Pivotal}.lean`,
  `CategoryTheory/Monoidal/Pivotal/Spherical.lean` and `QuantumGroups/UqSl2/Antipode.lean`; the
  pinned Tau Ceti contains none of these modules, so no statement of it elaborates here.
* §8.6 comparison of finite positive-`K` modules with the finite unitary corepresentations of
  `SUq(2)`: it needs the universal C*-algebra `C(SUq(2))` of Layer 5, which needs the minimal
  tensor product above.
-/

open scoped TensorProduct ComplexOrder

namespace TauCetiRoadmap.QuantumGroups

@[expose] public section

universe u v w

/-! ## Layer 3: The Hopf *-core, orthogonality and modular data -/

section HopfCore

variable {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A] [StarModule ℂ A]

variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [TauCeti.Comodule ℂ A H]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

/-- An algebraic Haar functional on a Hopf *-algebra: a normalised positive linear functional
`h` with `(id ⊗ h)Δ(a) = h(a)1` and `(h ⊗ id)Δ(a) = h(a)1`. -/
structure AlgebraicHaar where
  /-- The functional `h`. -/
  functional : A →ₗ[ℂ] ℂ
  normalized : functional 1 = 1
  left_invariant : ∀ a : A,
    (TensorProduct.rid ℂ A) ((TensorProduct.map (LinearMap.id) functional)
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  right_invariant : ∀ a : A,
    (TensorProduct.lid ℂ A) ((TensorProduct.map functional (LinearMap.id))
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  positive : ∀ a : A, 0 ≤ functional (star a * a)

/-- Schur orthogonality (§3.1; Neshveyev–Tuset, *Compact Quantum Groups and Their
Representation Categories*, Theorem 1.4.2, p. 9, whose `ρ_U` is the transpose of `F̃`): for an
irreducible finite comodule with unitary coefficient matrix `u` there is a positive invertible
`F̃` with `Tr F̃ = Tr F̃⁻¹`, `h(u_ij* u_kl) = δ_jl (F̃⁻¹)_ik / Tr F̃⁻¹` and
`h(u_ij u_kl*) = δ_ik F̃_jl / Tr F̃`. The matrix is the README's pre-antipode `F̃`, not its
transpose `F`. -/
theorem schur_orthogonality
    (hΔ : ∀ a : A, Coalgebra.comul (R := ℂ) (star a) = star (Coalgebra.comul (R := ℂ) a))
    [IsSimpleOrder (TauCeti.Subcomodule ℂ A H)]
    (h : AlgebraicHaar (A := A)) (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A)) :
    ∃ Ft : Matrix ι ι ℂ, Ft.PosDef ∧ Matrix.trace Ft = Matrix.trace Ft⁻¹ ∧
      (∀ i j k l,
        h.functional (star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j) *
          TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l) =
          (if j = l then Ft⁻¹ i k / Matrix.trace Ft⁻¹ else 0)) ∧
      (∀ i j k l,
        h.functional (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j *
          star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l)) =
          (if i = k then Ft j l / Matrix.trace Ft else 0)) := by
  sorry

end HopfCore

/-! ## Layer 4: Algebraic compact type -/

/-- The coefficients of all finite unitary native comodules of `A` in coordinate bases: the
entries of the coefficient matrices, in the standard basis of `ℂⁿ`, of those comodule structures
on `ℂⁿ` whose coefficient matrix is unitary. -/
def unitaryCoefficientSet (A : Type u) [Ring A] [HopfAlgebra ℂ A] [StarRing A] : Set A :=
  {a | ∃ (n : ℕ) (ρ : TauCeti.Comodule ℂ A (Fin n → ℂ)),
    letI := ρ
    let U := TauCeti.Comodule.coefficientMatrix (C := A) (Pi.basisFun ℂ (Fin n))
    U ∈ unitary (Matrix (Fin n) (Fin n) A) ∧ ∃ i j, a = U i j}

/-- Algebraic compact type (§4.1; Timmermann, Theorem 3.2.12): a nonzero Hopf *-algebra has a
normalized positive two-sided invariant integral exactly when it is spanned by the coefficients
of its finite unitary comodules. -/
theorem compactType_iff (A : Type u) [Ring A] [Nontrivial A] [HopfAlgebra ℂ A]
    [StarRing A] [StarModule ℂ A]
    (hΔ : ∀ a : A, Coalgebra.comul (R := ℂ) (star a) = star (Coalgebra.comul (R := ℂ) a)) :
    Nonempty (AlgebraicHaar (A := A)) ↔
      Submodule.span ℂ (unitaryCoefficientSet A) = ⊤ := by
  sorry

/-- The modular automorphism of the Haar functional (§4.1, from §3.2; Neshveyev–Tuset,
Theorem 1.7.3, p. 22): a positive normalized invariant integral `h` on a Hopf *-algebra has
exactly one algebra automorphism `θ` with `h(ab) = h(b θ(a))` for all `a, b`. On a unitary
coefficient matrix `θ(u) = F u F`; uniqueness is the faithfulness of `h`. -/
theorem haar_modular_automorphism {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A]
    [StarModule ℂ A]
    (hΔ : ∀ a : A, Coalgebra.comul (R := ℂ) (star a) = star (Coalgebra.comul (R := ℂ) a))
    (h : AlgebraicHaar (A := A)) :
    ∃! θ : A ≃ₐ[ℂ] A, ∀ a b : A, h.functional (a * b) = h.functional (b * θ a) := by
  sorry

/-- The Kac equivalence (§4.1, from §3.3; Neshveyev–Tuset, Proposition 1.7.7, p. 23): a positive
normalized invariant integral `h` on a Hopf *-algebra is a trace exactly when the antipode is
involutive. -/
theorem haar_trace_iff_antipode_involutive {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A]
    [StarModule ℂ A]
    (hΔ : ∀ a : A, Coalgebra.comul (R := ℂ) (star a) = star (Coalgebra.comul (R := ℂ) a))
    (h : AlgebraicHaar (A := A)) :
    (∀ a b : A, h.functional (a * b) = h.functional (b * a)) ↔
      ∀ a : A, HopfAlgebra.antipode ℂ (HopfAlgebra.antipode ℂ a) = a := by
  sorry

end

end TauCetiRoadmap.QuantumGroups
