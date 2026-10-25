import Mathlib

/-!
# General lemmas from the formalisation of Grothendieck's working notes: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is permitted in this human-owned repository:
these are targets, not implementations. Definitions keep the bodies of the first formalisation.

The signatures are those of the first formalisation, under their Mathlib names, in
`lean/Grothendieck/Upstream/` of github.com/Commutator-IO/grothendieck-project (CC0), written
against Mathlib `715a03a9` (2026-10-12). This file compiles against the Mathlib this repository
pins.
-/


/-! ## Layer 1: Hasse derivatives and binomial coefficients in characteristic `p` -/

/-! ### `HasseDerivXPowMul` -/
section


/-! ## From `Mathlib/Algebra/Polynomial/HasseDeriv.lean` -/

section
noncomputable section
namespace Polynomial
open Nat Polynomial
open Function
variable {R : Type*} [Semiring R] (k : ℕ) (f : R[X])
theorem hasseDeriv_eq_zero_iff : hasseDeriv k f = 0 ↔ ∀ n, (n.choose k : R) * f.coeff n = 0 := by
  sorry

section
open AddMonoidHom Finset.Nat
open Finset (antidiagonal mem_antidiagonal)
theorem hasseDeriv_mul_of_forall_hasseDeriv_eq_zero
    (hf : ∀ i, 0 < i → i ≤ k → hasseDeriv i f = 0) (g : R[X]) :
    hasseDeriv k (f * g) = f * hasseDeriv k g := by
  sorry

end
end Polynomial
end

/-! ## From `Mathlib/Data/Nat/Choose/Lucas.lean` -/

section
open Finset hiding choose
open Nat Polynomial
namespace Choose
variable {n k a b p : ℕ} [Fact p.Prime]
/-- For primes `p`, `p ^ e` divides `n` if and only if `p` divides `choose n k` for all
`0 < k < p ^ e`. -/
theorem pow_dvd_iff_forall_dvd_choose {e : ℕ} :
    p ^ e ∣ n ↔ ∀ k, 0 < k → k < p ^ e → p ∣ choose n k := by
  sorry

end Choose
end

/-! ## From `Mathlib/Algebra/CharP/HasseDeriv.lean` (new file) -/

section
/-
Copyright (c) 2026 Michel Hua. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Michel Hua
-/


/-!
# Hasse derivatives in prime characteristic

Over a ring of prime characteristic `p`, the Hasse derivatives `hasseDeriv k f` of orders
`0 < k < p ^ e` all vanish if and only if `f` is a polynomial in `X ^ (p ^ e)`.

## Main statements

* `Polynomial.forall_hasseDeriv_eq_zero_iff`: the Hasse derivatives of `f` of orders
  `0 < k < p ^ e` vanish if and only if `p ^ e` divides every exponent of `f`.
* `Polynomial.forall_hasseDeriv_eq_zero_iff_exists_expand`: the same condition holds if and only if
  `f = expand R (p ^ e) g` for some `g`.
* `Polynomial.hasseDeriv_X_pow_mul`, `Polynomial.hasseDeriv_expand_mul`: for `k < p ^ e`,
  `hasseDeriv k` is linear over polynomials in `X ^ (p ^ e)`. In particular it maps multiples of
  `X ^ (p ^ e)` to multiples of `X ^ (p ^ e)`, so it descends to `R[X] ⧸ (X ^ (p ^ e))`.
-/


namespace Polynomial

variable {R : Type*} (p : ℕ) [hp : Fact p.Prime]

section Ring

variable [Ring R] [CharP R p]

/-- In characteristic `p`, the Hasse derivatives of `f` of orders `0 < k < p ^ e` vanish if and
only if `p ^ e` divides every exponent of `f`. -/
theorem forall_hasseDeriv_eq_zero_iff {e : ℕ} {f : R[X]} :
    (∀ k, 0 < k → k < p ^ e → hasseDeriv k f = 0) ↔ ∀ n, f.coeff n ≠ 0 → p ^ e ∣ n := by
  sorry

theorem hasseDeriv_X_pow_mul {e k : ℕ} (hk : k < p ^ e) (g : R[X]) :
    hasseDeriv k (X ^ p ^ e * g) = X ^ p ^ e * hasseDeriv k g := by
  sorry

end Ring

section CommRing

variable [CommRing R] [CharP R p]

/-- In characteristic `p`, the Hasse derivatives of `f` of orders `0 < k < p ^ e` vanish if and
only if `f` is a polynomial in `X ^ (p ^ e)`. -/
theorem forall_hasseDeriv_eq_zero_iff_exists_expand {e : ℕ} {f : R[X]} :
    (∀ k, 0 < k → k < p ^ e → hasseDeriv k f = 0) ↔ ∃ g, expand R (p ^ e) g = f := by
  sorry

/-- In characteristic `p`, `hasseDeriv k` is linear over polynomials in `X ^ (p ^ e)` for
`k < p ^ e`. -/
theorem hasseDeriv_expand_mul {e k : ℕ} (hk : k < p ^ e) (f g : R[X]) :
    hasseDeriv k (expand R (p ^ e) f * g) = expand R (p ^ e) f * hasseDeriv k g := by
  sorry

end CommRing

end Polynomial

end

end
/-! ### `ChoosePrimePowSubOne` -/
section


/-! ## From `Mathlib/Data/Nat/Choose/Lucas.lean` -/

open Finset hiding choose
open Nat Polynomial
namespace Choose
variable {n k a b p : ℕ} [Fact p.Prime]
/-- For primes `p` and `k ≤ p ^ a - 1`, `choose (p ^ a - 1) k` is congruent to `(-1) ^ k`
modulo `p`. -/
theorem choose_pow_sub_one_modEq_neg_one_pow (hk : k ≤ p ^ a - 1) :
    choose (p ^ a - 1) k ≡ (-1) ^ k [ZMOD p] := by
  sorry

/-- For primes `p` and `k ≤ p ^ a - 1`, `p` does not divide `choose (p ^ a - 1) k`. -/
theorem not_dvd_choose_pow_sub_one (hk : k ≤ p ^ a - 1) : ¬ p ∣ choose (p ^ a - 1) k := by
  sorry

end Choose

end
/-! ### `PolynomialIsCoprimeX` -/
section


/-! ## From `Mathlib/Algebra/Polynomial/RingDivision.lean` -/

section
noncomputable section
open Polynomial
namespace Polynomial
universe u v w z
variable {R : Type u} {S : Type v} {a b : R} {n : ℕ}
section CommRing
variable [CommRing R] {p q : R[X]}
section
variable [Semiring S]
end
section
variable [Ring S]
end
end CommRing
section NoZeroDivisors
variable [Semiring R] [NoZeroDivisors R] {p q : R[X]}
end NoZeroDivisors
section CommRing
variable [CommRing R]
section nonZeroDivisors
open scoped nonZeroDivisors
end nonZeroDivisors
theorem isCoprime_X_sub_C_iff {p : R[X]} :
    IsCoprime (X - C a) p ↔ IsUnit (p.eval a) := by
  sorry

@[simp]
theorem isCoprime_X_sub_C_iff_isUnit_sub :
    IsCoprime (X - C a) (X - C b) ↔ IsUnit (a - b) := by
  sorry

theorem isCoprime_X_iff {p : R[X]} : IsCoprime X p ↔ IsUnit (p.coeff 0) := by
  sorry

variable [IsDomain R] {p q : R[X]}
end CommRing
end Polynomial
end

/-! ## From `Mathlib/Analysis/Complex/Polynomial/Basic.lean` -/

section
open Polynomial Bornology Complex
open scoped ComplexConjugate
namespace Complex
end Complex
namespace Polynomial.Gal
section Rationals
attribute [local instance] splits_ℚ_ℂ
attribute [local ext] Complex.ext
end Rationals
end Polynomial.Gal
end
end

end
/-! ### `DetPascalMatrix` -/
section


/-! ## From `Mathlib/LinearAlgebra/Matrix/Block.lean` -/


open Finset Function OrderDual
open Matrix
universe v
variable {α m n : Type*} {m' : α → Type*}
variable {R : Type v} {A : Type*} {M N : Matrix m m R} {b : m → α}
namespace Matrix
section LT
variable [LT α]
section Zero
variable [Zero R]
end Zero
end LT
section Preorder
variable [Preorder α]
section Zero
variable [Zero R]
variable [DecidableEq m]
end Zero
variable [CommRing R] [DecidableEq m]
end Preorder
section LinearOrder
variable [LinearOrder α]
end LinearOrder
variable [CommRing R] [DecidableEq m] [Fintype m] [DecidableEq n] [Fintype n]
theorem isLowerTriangular_choose (n : ℕ) :
    (of fun i j : Fin n ↦ (i : ℕ).choose j).IsLowerTriangular := by
  sorry

/-- Vandermonde's identity in matrix form: the symmetric Pascal matrix `((i + j).choose i)` is
the product of the lower unitriangular matrix `(i.choose j)` and its transpose. -/
theorem choose_mul_transpose_choose (n : ℕ) :
    (of fun i j : Fin n ↦ (i : ℕ).choose j) * (of fun i j : Fin n ↦ (i : ℕ).choose j)ᵀ =
      of fun i j : Fin n ↦ (i + j : ℕ).choose i := by
  sorry

variable (R) in
/-- The symmetric Pascal matrix `((i + j).choose i)` has determinant `1`. -/
theorem det_pascal (n : ℕ) :
    (of fun i j : Fin n ↦ ((i + j : ℕ).choose i : R)).det = 1 := by
  sorry

open Polynomial
end Matrix

end

/-! ## Layer 2: modules, flatness, finite presentation -/

/-! ### `FlatProdPi` -/
section


/-! ## From `Mathlib/RingTheory/Flat/Basic.lean` -/

universe v' u v w
open TensorProduct
namespace Module
open Function (Injective Surjective)
open LinearMap Submodule DirectSum
section Semiring
variable {R : Type u} {M : Type v} {N P Q : Type*} [CommSemiring R] [AddCommMonoid M] [Module R M]
  [AddCommMonoid N] [Module R N] [AddCommMonoid P] [Module R P] [AddCommMonoid Q] [Module R Q]
namespace Flat
section DirectSum
variable {ι : Type v} {M : ι → Type w} [Π i, AddCommMonoid (M i)] [Π i, Module R (M i)]
theorem pi_iff [Finite ι] : Flat R (Π i, M i) ↔ ∀ i, Flat R (M i) := by
  sorry

/-- A finite product of flat `R`-modules is flat. -/
instance pi [Finite ι] [∀ i, Flat R (M i)] : Flat R (Π i, M i) := pi_iff.mpr ‹_›

end DirectSum
theorem prod_iff : Flat R (M × N) ↔ Flat R M ∧ Flat R N := by
  sorry

/-- The product of two flat `R`-modules is flat. -/
instance prod [Flat R M] [Flat R N] : Flat R (M × N) := prod_iff.mpr ⟨‹_›, ‹_›⟩

section Algebra
variable {S : Type*} [Semiring S] [Algebra R S]
variable (R S M)
end Algebra
end Flat
end Semiring
namespace Flat
variable {R : Type u} {M : Type v} [CommRing R] [AddCommGroup M] [Module R M]
variable {N : Type w} [AddCommGroup N] [Module R N]
end Flat
end Module
section Injective
variable {R S A B : Type*} [CommSemiring R] [Semiring A] [Algebra R A] [Semiring B] [Algebra R B]
  [CommSemiring S] [Algebra S A] [SMulCommClass R S A]
namespace Algebra.TensorProduct
end Algebra.TensorProduct
variable (A) [Module.Flat R A] {M : Type*} [AddCommMonoid M] [Module R M] (p : Submodule R M)
namespace Submodule
end Submodule
end Injective
section Nontrivial
variable (R : Type*) [CommSemiring R]
namespace TensorProduct
variable (M N : Type*) [AddCommMonoid M] [AddCommMonoid N] [Module R M] [Module R N]
variable {R M N}
variable {P Q : Type*} [AddCommMonoid P] [Module R P] [AddCommMonoid Q] [Module R Q]
variable {ι κ : Type*} {v : ι → M} {w : κ → N} {s : Set ι} {t : Set κ}
variable (p : Submodule R M) (q : Submodule R N)
end TensorProduct
namespace Algebra.TensorProduct
variable (A B : Type*) [Semiring A] [Semiring B] [Algebra R A] [Algebra R B]
end Algebra.TensorProduct
end Nontrivial
namespace IsTensorProduct
variable {R M N : Type*} [CommSemiring R] [AddCommMonoid M] [AddCommMonoid N]
  [Module R M] [Module R N] {M₁ M₂ N₁ N₂ : Type*} [AddCommMonoid M₁] [AddCommMonoid M₂]
  [Module R M₁] [Module R M₂] [AddCommMonoid N₁] [AddCommMonoid N₂] [Module R N₁] [Module R N₂]
  {f : M₁ →ₗ[R] M₂ →ₗ[R] M} {g : N₁ →ₗ[R] N₂ →ₗ[R] N}
  (hf : IsTensorProduct f) (hg : IsTensorProduct g) (i₁ : M₁ →ₗ[R] N₁) (i₂ : M₂ →ₗ[R] N₂)
end IsTensorProduct
section IsSMulRegular
variable {R S M N : Type*} [CommSemiring R] [CommSemiring S] [Algebra R S] [Module.Flat R S]
  [AddCommMonoid M] [Module R M] [AddCommMonoid N] [Module R N] [Module S N] [IsScalarTower R S N]
end IsSMulRegular

end
/-! ### `FinitePresentationPiRightHomBijective` -/
section


/-! ## From `Mathlib/Algebra/Exact/Basic.lean` -/

section
variable {R M M' N N' P P' : Type*}
namespace Function
variable (f : M → N) (g : N → P) (g' : P → P')
variable {f g}
namespace MulExact
@[to_additive /-- A product of exact pairs is exact. -/]
lemma piMap {ι : Type*} {α β γ : ι → Type*} [∀ i, One (γ i)] {f : ∀ i, α i → β i}
    {g : ∀ i, β i → γ i} (h : ∀ i, MulExact (f i) (g i)) : MulExact (Pi.map f) (Pi.map g) := by
  sorry

@[to_additive /-- A product of two exact pairs is exact. -/]
lemma prodMap {M₁ N₁ P₁ M₂ N₂ P₂ : Type*} [One P₁] [One P₂] {f₁ : M₁ → N₁} {g₁ : N₁ → P₁}
    {f₂ : M₂ → N₂} {g₂ : N₂ → P₂} (h₁ : MulExact f₁ g₁) (h₂ : MulExact f₂ g₂) :
    MulExact (Prod.map f₁ f₂) (Prod.map g₁ g₂) := by
  sorry

end MulExact
end Function
section MonoidHom
variable [Group M] [Group N] [Group P] {f : M →* N} {g : N →* P}
namespace MonoidHom
open Function
end MonoidHom
namespace Function.MulExact
open MonoidHom
section
variable {X₁ X₂ X₃ Y₁ Y₂ Y₃ : Type*} [CommMonoid X₁] [CommMonoid X₂] [CommMonoid X₃]
  [CommMonoid Y₁] [CommMonoid Y₂] [CommMonoid Y₃]
  (e₁ : X₁ ≃* Y₁) (e₂ : X₂ ≃* Y₂) (e₃ : X₃ ≃* Y₃)
  {f₁₂ : X₁ →* X₂} {f₂₃ : X₂ →* X₃} {g₁₂ : Y₁ →* Y₂} {g₂₃ : Y₂ →* Y₃}
end
end Function.MulExact
end MonoidHom
section LinearMap
open Function
variable [Semiring R] [AddCommMonoid M] [AddCommMonoid M'] [AddCommMonoid N]
  [AddCommMonoid N'] [AddCommMonoid P] [AddCommMonoid P'] [Module R M]
  [Module R M'] [Module R N] [Module R N'] [Module R P] [Module R P']
variable {f : M →ₗ[R] N} {g : N →ₗ[R] P}
namespace LinearMap
section Ring
variable {R M N P : Type*} [Ring R]
  [AddCommGroup M] [AddCommGroup N] [AddCommGroup P] [Module R M] [Module R N] [Module R P]
end Ring
end LinearMap
namespace Function
open LinearMap
namespace Exact
variable
    {f₁₂ : M →ₗ[R] N} {f₂₃ : N →ₗ[R] P} {g₁₂ : M' →ₗ[R] N'}
    {g₂₃ : N' →ₗ[R] P'} {e₁ : M ≃ₗ[R] M'} {e₂ : N ≃ₗ[R] N'} {e₃ : P ≃ₗ[R] P'}
end Exact
end Function
end LinearMap
namespace Function
section split
variable [Semiring R]
variable [AddCommGroup M] [AddCommGroup N] [AddCommGroup P] [Module R M] [Module R N] [Module R P]
variable {f : M →ₗ[R] N} {g : N →ₗ[R] P}
open LinearMap
end split
section Prod
variable [Semiring R] [AddCommMonoid M] [AddCommMonoid N] [Module R M] [Module R N]
end Prod
end Function
section Ring
open LinearMap Submodule
variable [Ring R] [AddCommGroup M] [AddCommGroup N] [AddCommGroup P]
    [Module R M] [Module R N] [Module R P]
    {f : M →ₗ[R] N} {g : N →ₗ[R] P}
namespace Function
end Function
namespace LinearMap
end LinearMap
end Ring
end

/-! ## From `Mathlib/Algebra/Module/FinitePresentation.lean` -/

section
open Finsupp
section Semiring
variable (R M) [Semiring R] [AddCommMonoid M] [Module R M]
end Semiring
section Ring
section
universe u v
variable (R : Type u) (M : Type*) [Ring R] [AddCommGroup M] [Module R M]
end
variable (R M N) [Ring R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
variable {R M N}
variable {ι} [Finite ι]
namespace Module.FinitePresentation
end Module.FinitePresentation
end Ring
section CommRing
variable {R M N N'} [CommRing R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
variable [AddCommGroup N'] [Module R N'] (S : Submonoid R) (f : N →ₗ[R] N') [IsLocalizedModule S f]
variable {M' : Type*} [AddCommGroup M'] [Module R M'] (f : M →ₗ[R] M') [IsLocalizedModule S f]
variable {N' : Type*} [AddCommGroup N'] [Module R N'] (g : N →ₗ[R] N') [IsLocalizedModule S g]
open TensorProduct LinearMap
section Pi

variable {ι : Type*} (P : ι → Type*) [∀ i, AddCommGroup (P i)] [∀ i, Module R (P i)]

variable (R) in
lemma Module.piRightHom_bijective_of_finite_free (κ : Type*) [Finite κ] :
    Function.Bijective (piRightHom R R (κ → R) P) := by
  sorry

variable (R M) in
/-- If `M` is a finitely presented `R`-module, then for any family of `R`-modules `P i`, the
canonical map `M ⊗[R] (Π i, P i) → Π i, M ⊗[R] P i` is bijective. -/
@[stacks 059K "(1) ⇒ (2)"]
theorem Module.FinitePresentation.piRightHom_bijective [Module.FinitePresentation R M] :
    Function.Bijective (piRightHom R R M P) := by
  sorry

end Pi

end CommRing
end

end
/-! ### `IsNoetherianRingIffFinitePresentation` -/
section


/-! ## From `Mathlib/Algebra/Module/FinitePresentation.lean` -/

open Finsupp
section Semiring
variable (R M) [Semiring R] [AddCommMonoid M] [Module R M]
end Semiring
section Ring
section
universe u v
variable (R : Type u) (M : Type*) [Ring R] [AddCommGroup M] [Module R M]
end
variable (R M N) [Ring R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
variable {R M N}
variable {ι} [Finite ι]
namespace Module.FinitePresentation
end Module.FinitePresentation
universe v in
variable (R) in
/-- A ring `R` is Noetherian if and only if every finitely generated `R`-module is finitely
presented. It suffices to consider modules in any universe in which `R` is small. -/
theorem isNoetherianRing_iff_forall_finitePresentation [Small.{v} R] :
    IsNoetherianRing R ↔ ∀ (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M],
      Module.FinitePresentation R M := by
  sorry

end Ring
section CommRing
variable {R M N N'} [CommRing R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
variable [AddCommGroup N'] [Module R N'] (S : Submonoid R) (f : N →ₗ[R] N') [IsLocalizedModule S f]
variable {M' : Type*} [AddCommGroup M'] [Module R M'] (f : M →ₗ[R] M') [IsLocalizedModule S f]
variable {N' : Type*} [AddCommGroup N'] [Module R N'] (g : N →ₗ[R] N') [IsLocalizedModule S g]
open TensorProduct LinearMap
end CommRing

end
/-! ### `TensorProductMemRangeRTensorBasis` -/
section


/-! ## From `Mathlib/LinearAlgebra/TensorProduct/Basis.lean` -/

noncomputable section
open LinearMap Module
open scoped TensorProduct
section CommSemiring
variable {R : Type*} {S : Type*} {M : Type*} {N : Type*} {ι : Type*} {κ : Type*}
  [CommSemiring R] [Semiring S] [Algebra R S] [AddCommMonoid M] [Module R M] [Module S M]
  [IsScalarTower R S M] [AddCommMonoid N] [Module R N]
namespace Module.Basis
variable (S : Type*) [Semiring S] [Algebra R S]
end Module.Basis
section
variable [DecidableEq ι] [DecidableEq κ]
variable (ℬ : Basis ι R M) (𝒞 : Basis κ R N) (x : M ⊗[R] N)
lemma TensorProduct.equivFinsuppOfBasisRight_rTensor {P : Type*} [AddCommMonoid P] [Module R P]
    (f : M →ₗ[R] P) (x : M ⊗[R] N) :
    equivFinsuppOfBasisRight 𝒞 (f.rTensor N x) =
      (equivFinsuppOfBasisRight 𝒞 x).mapRange f f.map_zero := by
  sorry

/-- Let `𝒞` be a basis of `N`. An element of `P ⊗[R] N` lies in the range of `f.rTensor N` if and
only if each of its coordinates with respect to `𝒞` lies in the range of `f`. -/
lemma TensorProduct.mem_range_rTensor_iff_equivFinsuppOfBasisRight {P : Type*} [AddCommMonoid P]
    [Module R P] (f : M →ₗ[R] P) (x : P ⊗[R] N) :
    x ∈ range (f.rTensor N) ↔ ∀ i, equivFinsuppOfBasisRight 𝒞 x i ∈ range f := by
  sorry

end
end CommSemiring
namespace LinearMap
variable {R A M N ι : Type*} [CommSemiring R] [CommSemiring A] [Algebra R A]
  [AddCommMonoid M] [Module R M] [AddCommMonoid N] [Module R N] [Module A N]
  [IsScalarTower R A N]
end LinearMap
end

end
/-! ### `PrimaryComponentInjective` -/
section


/-! ## From `Mathlib/Algebra/Module/Torsion/PrimaryComponent.lean` -/


variable {A M M₁ M₂ : Type*} [CommRing A]
open IsDedekindDomain Submodule Module HeightOneSpectrum Set Function
namespace Ideal
variable (I : Ideal A)
section CommRing
section AddCommMonoid
variable [AddCommMonoid M] [AddCommMonoid M₁] [AddCommMonoid M₂] [Module A M] [Module A M₁]
    [Module A M₂]
open Set Function Submodule Module
variable (M)
end AddCommMonoid
section AddCommGroup
variable [AddCommGroup M] [Module A M]
section IsDedekindDomain
variable [IsDedekindDomain A]
open scoped nonZeroDivisors
end IsDedekindDomain
end AddCommGroup
section Injective

universe v

variable {Q : Type v} [AddCommGroup Q] [Module A Q] [IsNoetherianRing A]
theorem baer_of_primaryComponent_eq_top (hQ : primaryComponent Q I = ⊤)
    (h : ∀ (n : ℕ) (N : Submodule A (A ⧸ I ^ n)) (f : N →ₗ[A] Q),
      ∃ g : A ⧸ I ^ n →ₗ[A] Q, ∀ x : N, g x = f x) :
    Module.Baer A Q := by
  sorry

/-- Over a Noetherian ring, a module `Q` with `Q(I) = Q` is injective as soon as linear maps
into `Q` extend along the inclusions of submodules of `A ⧸ I ^ n`, for all `n`. -/
theorem injective_of_primaryComponent_eq_top (hQ : primaryComponent Q I = ⊤)
    (h : ∀ (n : ℕ) (N : Submodule A (A ⧸ I ^ n)) (f : N →ₗ[A] Q),
      ∃ g : A ⧸ I ^ n →ₗ[A] Q, ∀ x : N, g x = f x) :
    Module.Injective A Q := by
  sorry

/-- Over a Noetherian ring, the `I`-primary component `Γ_I(Q)` of an injective module `Q` is
injective. -/
@[stacks 08XW "(2)"]
instance primaryComponent.injective [Small.{v} A] [Module.Injective A Q] :
    Module.Injective A (primaryComponent Q I) := by
  refine injective_of_primaryComponent_eq_top I (eq_top_iff.2 fun x _ ↦ ?_) fun n N f ↦ ?_
  · obtain ⟨n, hn⟩ := (primaryComponent_mem Q I x).1 x.2
    refine (primaryComponent_mem _ I x).2 ⟨n, (mem_torsionBySet_iff _ _).2 fun a ↦ ?_⟩
    exact Subtype.ext ((mem_torsionBySet_iff _ _).1 hn a)
  obtain ⟨v, hv⟩ := Module.Injective.extension_property A Q _ _ N.subtype N.injective_subtype
    ((primaryComponent Q I).subtype ∘ₗ f)
  -- The extension lands in `Γ_I(Q)`, because `A ⧸ I ^ n` is killed by `I ^ n`.
  refine ⟨v.codRestrict _ fun y ↦ (primaryComponent_mem Q I _).2 ⟨n,
    (mem_torsionBySet_iff _ _).2 fun a ↦ ?_⟩, fun x ↦ Subtype.ext congr($hv x)⟩
  obtain ⟨b, rfl⟩ := Submodule.Quotient.mk_surjective _ y
  rw [← map_smul, ← Submodule.Quotient.mk_smul, smul_eq_mul,
    (Submodule.Quotient.mk_eq_zero _).2 (Ideal.mul_mem_right b _ a.2), map_zero]

end Injective

end CommRing
end Ideal

end
/-! ### `IsAdicCompleteOfIsNilpotent` -/
section


/-! ## From `Mathlib/RingTheory/AdicCompletion/Basic.lean` -/

section
open Submodule Ideal Quotient
variable {R S T : Type*} [CommRing R] (I : Ideal R)
variable (M : Type*) [AddCommGroup M] [Module R M]
variable {N : Type*} [AddCommGroup N] [Module R N]
variable {I M}
variable (I M)
namespace IsHausdorff
variable {I M}
end IsHausdorff
namespace Hausdorffification
variable {I M}
variable (I M)
variable {M} [h : IsHausdorff I N]
end Hausdorffification
namespace IsPrecomplete
end IsPrecomplete
namespace AdicCompletion
variable {I M}
variable (I M)
variable {I M}
variable (I M)
variable {I M}
variable (I M)
namespace AdicCauchySequence
variable {I M}
end AdicCauchySequence
variable {M}
section Bijective
variable {I}
variable (I M)
variable [IsAdicComplete I M]
variable {M}
end Bijective
end AdicCompletion
namespace IsAdicComplete
open AdicCompletion
section lift
variable [IsAdicComplete I N]
variable {M}
end lift
namespace StrictMono
variable {a : ℕ → ℕ} (ha : StrictMono a)
    (f : (n : ℕ) → M →ₗ[R] N ⧸ (I ^ (a n) • ⊤ : Submodule R N))
variable {I M}
variable (hf : ∀ {m}, factorPow I N (ha.monotone m.le_succ) ∘ₗ (f (m + 1)) = f m)
variable [IsAdicComplete I N]
variable (I)
end StrictMono
variable {I} in
theorem of_isNilpotent (hI : IsNilpotent I) : IsAdicComplete I M := by
  sorry

open Finset
end IsAdicComplete
end

/-! ## From `Mathlib/RingTheory/AdicCompletion/Noetherian.lean` -/

section
open IsLocalRing Module
variable {R : Type*} [CommRing R] (I : Ideal R) (M : Type*) [AddCommGroup M] [Module R M]
variable [IsNoetherianRing R] [Module.Finite R M]
end

end
/-! ### `SubalgebraIsUnitOfIsIntegral` -/
section


/-! ## From `Mathlib/RingTheory/Artinian/Algebra.lean` -/

namespace IsArtinianRing
variable {R A : Type*}
variable [CommRing R] [IsArtinianRing R] [Ring A] [Algebra R A]
open nonZeroDivisors
theorem isUnit_of_isIntegral_of_isUnit {B : Subalgebra R A} {a : B} (hi : IsIntegral R (a : A))
    (ha : IsUnit (a : A)) : IsUnit a := by
  sorry

/-- Over an Artinian ring `R`, an `R`-subalgebra `B` of `A` contains the inverse of every unit
of `A` which lies in `B` and is integral over `R`. For instance, when `R = K` is a field, a
`K`-subalgebra of `Module.End K V` with `V` finite-dimensional is closed under taking inverses. -/
theorem inv_mem_of_isIntegral {B : Subalgebra R A} {u : Aˣ} (hi : IsIntegral R (u : A))
    (hu : (u : A) ∈ B) : ((u⁻¹ : Aˣ) : A) ∈ B := by
  sorry

end IsArtinianRing

end
/-! ### `SemilocalStableRange` -/
section


/-! ## From `Mathlib/RingTheory/LocalProperties/Semilocal.lean` -/

section CommSemiring
variable {R : Type*} [CommSemiring R] [Finite (MaximalSpectrum R)]
variable (M : Type*) [AddCommMonoid M] [Module R M]
variable
  (Rₚ : ∀ (P : Ideal R) [P.IsMaximal], Type*)
  [∀ (P : Ideal R) [P.IsMaximal], CommSemiring (Rₚ P)]
  [∀ (P : Ideal R) [P.IsMaximal], Algebra R (Rₚ P)]
  [∀ (P : Ideal R) [P.IsMaximal], IsLocalization.AtPrime (Rₚ P) P]
  (Mₚ : ∀ (P : Ideal R) [P.IsMaximal], Type*)
  [∀ (P : Ideal R) [P.IsMaximal], AddCommMonoid (Mₚ P)]
  [∀ (P : Ideal R) [P.IsMaximal], Module R (Mₚ P)]
  [∀ (P : Ideal R) [P.IsMaximal], Module (Rₚ P) (Mₚ P)]
  [∀ (P : Ideal R) [P.IsMaximal], IsScalarTower R (Rₚ P) (Mₚ P)]
  (f : ∀ (P : Ideal R) [P.IsMaximal], M →ₗ[R] Mₚ P)
  [∀ (P : Ideal R) [P.IsMaximal], IsLocalizedModule P.primeCompl (f P)]
section IsLocalized
end IsLocalized
section Localized
end Localized
section IsLocalization
end IsLocalization
end CommSemiring
section CommRing
section IsLocalization
variable {R : Type*} [CommRing R] [Finite (MaximalSpectrum R)]
variable
  (Rₚ : ∀ (P : Ideal R) [P.IsMaximal], Type*)
  [∀ (P : Ideal R) [P.IsMaximal], CommRing (Rₚ P)]
  [∀ (P : Ideal R) [P.IsMaximal], Algebra R (Rₚ P)]
  [∀ (P : Ideal R) [P.IsMaximal], IsLocalization.AtPrime (Rₚ P) P]
end IsLocalization
variable {R : Type*} [CommRing R] [Finite (MaximalSpectrum R)]

/-- A semilocal ring has stable range one: if `a` and `b` are coprime, then `a + t * b` is a
unit for some `t`. This is due to Bass, see [Bass, *K-theory and stable algebra*][bass1964]. -/
theorem IsCoprime.exists_isUnit_add_mul {a b : R} (h : IsCoprime a b) :
    ∃ t : R, IsUnit (a + t * b) := by
  sorry

end CommRing

end
/-! ### `FormallySmoothMapBaseChange` -/
section


/-! ## From `Mathlib/RingTheory/Etale/Kaehler.lean` -/

universe u
variable (R S T : Type*) [CommRing R] [CommRing S] [CommRing T]
variable [Algebra R S] [Algebra R T] [Algebra S T] [IsScalarTower R S T]
open TensorProduct
lemma KaehlerDifferential.mapBaseChange_injective [Subsingleton (Algebra.H1Cotangent S T)] :
    Function.Injective (mapBaseChange R S T) := by
  sorry

/-- The first fundamental sequence `0 → T ⊗[S] Ω[S⁄R] → Ω[T⁄R] → Ω[T⁄S] → 0` is split exact
when `H¹(L_{T⁄S}) = 0` and `Ω[T⁄S]` is projective, e.g. when `T` is a formally smooth `S`-algebra
([Matsumura, Theorem 25.1][matsumura1987]). -/
lemma KaehlerDifferential.exists_retraction_mapBaseChange [Subsingleton (Algebra.H1Cotangent S T)]
    [Module.Projective T Ω[T⁄S]] :
    ∃ l : Ω[T⁄R] →ₗ[T] T ⊗[S] Ω[S⁄R], l ∘ₗ mapBaseChange R S T = LinearMap.id := by
  sorry

namespace Algebra.Extension
open KaehlerDifferential
attribute [local instance] SMulCommClass.of_commMonoid
variable {R S T}
variable {P : Extension.{u} R S} {Q : Extension.{u} R T} (f : P.Hom Q)
end Extension
variable {S}
end Algebra

end
/-! ### `RatSmulMemIndivisible` -/
section


/-! ## From `Mathlib/LinearAlgebra/Unimodular.lean` -/

namespace Module
variable (R : Type*) [Semiring R] {M : Type*} [AddCommMonoid M] [Module R M]
variable {R} {v : M}
end Module
namespace Module.Basis
section CommSemiring
variable {R : Type*} [CommSemiring R] {M : Type*} [AddCommMonoid M] [Module R M]
end CommSemiring
section Algebra
variable {R : Type*} [CommRing R] {A : Type*} [Ring A] [Nontrivial A] [Algebra R A]
end Algebra
end Module.Basis
namespace Module.IsUnimodular
variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M] [Module.Free R M]
end Module.IsUnimodular

namespace AddSubgroup

theorem rat_smul_mem_iff {V : Type*} [AddCommGroup V] [Module ℚ V] {P : AddSubgroup V} {x : V}
    (hx : x ∈ P) (hx' : ∀ y ∈ P, ∀ m : ℤ, x = m • y → IsUnit m) {q : ℚ} :
    q • x ∈ P ↔ ∃ n : ℤ, q = n := by
  sorry

end AddSubgroup

end

/-! ## Layer 3: derivations -/

/-! ### `DerivationLeibnizProd` -/
section


/-! ## From `Mathlib/RingTheory/Derivation/Basic.lean` -/

open Algebra
namespace Derivation
section
variable {R : Type*} {A : Type*} {B : Type*} {M : Type*}
variable [CommSemiring R] [CommSemiring A] [CommSemiring B] [AddCommMonoid M]
variable [Algebra R A] [Algebra R B]
variable [Module A M] [Module B M] [Module R M]
variable (D : Derivation R A M) {D1 D2 : Derivation R A M} (r : R) (a b : A)
/-- The Leibniz rule for a finite product. -/
theorem leibniz_prod {ι : Type*} [DecidableEq ι] (s : Finset ι) (f : ι → A) :
    D (∏ i ∈ s, f i) = ∑ i ∈ s, (∏ j ∈ s.erase i, f j) • D (f i) := by
  sorry

section Scalar
variable {S T : Type*}
variable [Monoid S] [DistribMulAction S M] [SMulCommClass R S M] [SMulCommClass S A M]
variable [Monoid T] [DistribMulAction T M] [SMulCommClass R T M] [SMulCommClass T A M]
end Scalar
section PushForward
variable {N : Type*} [AddCommMonoid N] [Module A N] [Module R N] [IsScalarTower R A M]
  [IsScalarTower R A N]
variable (f : M →ₗ[A] N) (e : M ≃ₗ[A] N)
end PushForward
section RestrictScalars
variable {S : Type*} [CommSemiring S]
variable [Algebra S A] [Module S M] [LinearMap.CompatibleSMul A M R S]
variable (R)
end RestrictScalars
end
section Lift
variable {R : Type*} {A : Type*} {M : Type*}
variable [CommSemiring R] [CommRing A] [CommRing M]
variable [Algebra R A] [Algebra R M]
variable {F : Type*} [FunLike F A M] [AlgHomClass F R A M]
end Lift
section Cancel
variable {R : Type*} [CommSemiring R] {A : Type*} [CommSemiring A] [Algebra R A] {M : Type*}
  [AddCancelCommMonoid M] [Module R M] [Module A M]
end Cancel
section
variable {R : Type*} [CommRing R]
variable {A : Type*} [CommRing A] [Algebra R A]
section
variable {M : Type*} [AddCommGroup M] [Module A M] [Module R M]
variable (D : Derivation R A M) {D1 D2 : Derivation R A M} (a b : A)
/-- The Leibniz rule for integer powers of a unit. See `Derivation.leibniz_zpow` for fields. -/
theorem leibniz_zpow_units (u : Aˣ) (n : ℤ) :
    D ↑(u ^ n) = n • ((u ^ (n - 1) : Aˣ) : A) • D ↑u := by
  sorry

section Field
variable {K : Type*} [Field K] [Module K M] [Algebra R K] (D : Derivation R K M)
end Field
end
end
end Derivation

end
/-! ### `DerivationLieMulLeft` -/
section


/-! ## From `Mathlib/RingTheory/Derivation/Lie.lean` -/

namespace Derivation
variable {R : Type*} [CommRing R]
variable {A : Type*} [CommRing A] [Algebra R A]
variable {D1 D2 : Derivation R A A} (a : A)
section LieStructures
theorem lie_mulLeft (D : Derivation R A A) :
    ⁅(D : Module.End R A), LinearMap.mulLeft R a⁆ = LinearMap.mulLeft R (D a) := by
  sorry

/-- Conjugating a derivation by multiplication by a unit `u` subtracts multiplication by the
logarithmic derivative `u⁻¹ * D u`. -/
theorem mulLeft_mul_mul_mulLeft_inv (D : Derivation R A A) (u : Aˣ) :
    LinearMap.mulLeft R (u : A) * (D : Module.End R A) * LinearMap.mulLeft R ((u⁻¹ : Aˣ) : A) =
      (D : Module.End R A) - LinearMap.mulLeft R ((u⁻¹ : Aˣ) * D u) := by
  sorry

section CompatibleDerivations
variable {A' : Type*} [CommRing A'] [Algebra R A'] [Algebra A A'] [IsScalarTower R A A']
attribute [local instance 100] LieRing.ofAssociativeRing
namespace Compatible
end Compatible
end CompatibleDerivations
end LieStructures
end Derivation

end

/-! ## Layer 4: topology -/

/-! ### `CurryR1Space` -/
section


/-! ## From `Mathlib/Topology/CompactOpen.lean` -/

open Set Filter TopologicalSpace Topology
namespace ContinuousMap
section CompactOpen
variable {α X Y Z T : Type*}
variable [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z] [TopologicalSpace T]
variable {K : Set X} {U : Set Y}
section Curry
/-- Currying is continuous for `X` locally compact, with no hypothesis on `Y`. Mathlib's
`continuous_curry` asks for `LocallyCompactSpace (X × Y)`; the branch generalised it in place. -/
theorem continuous_curry_of_locallyCompactSpace [LocallyCompactSpace X] :
    Continuous (curry : C(X × Y, Z) → C(X, C(Y, Z))) := by
  sorry

theorem continuous_curry_of_r1Space [R1Space X] :
    Continuous (curry : C(X × Y, Z) → C(X, C(Y, Z))) := by
  sorry

end Curry
end CompactOpen
end ContinuousMap

open Set Filter TopologicalSpace Topology
namespace ContinuousMap
section CompactOpen
variable {α X Y Z T : Type*}
variable [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z] [TopologicalSpace T]
variable {K : Set X} {U : Set Y}
section Curry
set_option backward.defeqAttrib.useBackward true in
theorem continuous_uncurry_of_r1Space [R1Space X] [LocallyCompactSpace Y] :
    Continuous (uncurry : C(X, C(Y, Z)) → C(X × Y, Z)) := by
  sorry

end Curry
end CompactOpen
end ContinuousMap

open Set Filter TopologicalSpace Topology
open ContinuousMap
namespace Homeomorph
variable {X : Type*} {Y : Type*} {Z : Type*}
variable [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
/-- Currying as a homeomorphism between the function spaces `C(X × Y, Z)` and `C(X, C(Y, Z))`,
for `X` an `R1Space` (for instance a Hausdorff space) and `Y` locally compact. -/
def curryOfR1Space [R1Space X] [LocallyCompactSpace Y] : C(X × Y, Z) ≃ₜ C(X, C(Y, Z)) :=
  ⟨⟨ContinuousMap.curry, uncurry, by intro; ext; rfl, by intro; ext; rfl⟩,
    continuous_curry_of_r1Space, continuous_uncurry_of_r1Space⟩

end Homeomorph


end
/-! ### `NoetherianIsOpenOfStableUnderGeneralization` -/
section


/-! ## From `Mathlib/Topology/NoetherianSpace.lean` -/

open Topology
variable (α β : Type*) [TopologicalSpace α] [TopologicalSpace β]
namespace TopologicalSpace
variable {α β}
attribute [local instance] NoetherianSpace.discrete
/-- In a Noetherian quasi-sober space, a set `E` stable under generalization is open as soon as,
for every `x ∈ E`, some open neighbourhood `W` of `x` satisfies `W ∩ closure {x} ⊆ E` (that is,
`E ∩ closure {x}` contains a nonempty open subset of `closure {x}`). -/
theorem NoetherianSpace.isOpen_of_stableUnderGeneralization [NoetherianSpace α] [QuasiSober α]
    {E : Set α} (hE : StableUnderGeneralization E)
    (hE' : ∀ x ∈ E, ∃ W : Set α, IsOpen W ∧ x ∈ W ∧ W ∩ closure {x} ⊆ E) : IsOpen E := by
  sorry

end TopologicalSpace

end

/-! ## Layer 5: finite monoids and linear algebra -/

/-! ### `MonoidRightZero` -/
section


/-! ## From `Mathlib/GroupTheory/MonoidRightZero.lean` (new file) -/

/-
Copyright (c) 2026 Michel Hua. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Michel Hua
-/


/-!
# Right zeros in finite monoids

An element `p` of a monoid `M` is a *right zero* if `u * p = p` for every `u : M`.

## Main results

* `Monoid.exists_forall_mul_eq_self_of_finite`: a finite monoid in which any two
  principal right ideals meet, and which has no nontrivial morphism to a group, has a
  right zero.
* `Monoid.exists_forall_mul_eq_self_iff_of_finite`: for a finite monoid the two
  conditions together are equivalent to having a right zero.

Neither of the two conditions can be dropped. A nontrivial finite group satisfies the
first and has no right zero. The monoid `{1, a, b}` with `a`, `b` left zeros
(`x * y = x` for `x ≠ 1`) satisfies the second and has no right zero.

## Proof sketch

Finiteness and the meeting condition give `p` lying in every principal right ideal
`u * M`. Then `E = p * M` satisfies `E ⊆ u * E` for every `u`, hence `E = u * E`
since `E` is finite, so left multiplication defines a monoid morphism
`M →* Equiv.Perm E`. It is trivial by hypothesis, so `u * p = p`.

-/


universe u

namespace Monoid

variable {M : Type u} [Monoid M]

/-- In a finite monoid in which any two principal right ideals meet, some element lies
in every principal right ideal. -/
theorem exists_forall_exists_eq_mul_of_finite [Finite M]
    (h : ∀ u v : M, ∃ u' v' : M, u * u' = v * v') :
    ∃ p : M, ∀ u : M, ∃ v : M, p = u * v := by
  sorry

/-- A finite monoid in which any two principal right ideals meet, and which has no
nontrivial morphism to a group, has a right zero. -/
theorem exists_forall_mul_eq_self_of_finite [Finite M]
    (h : ∀ u v : M, ∃ u' v' : M, u * u' = v * v')
    (hG : ∀ (G : Type u) [Group G] (f : M →* G), f = 1) :
    ∃ p : M, ∀ u : M, u * p = p := by
  sorry

/-- A monoid with a right zero has no nontrivial morphism to a group. -/
theorem monoidHom_eq_one_of_forall_mul_eq_self {G : Type*} [Group G] {p : M}
    (hp : ∀ u : M, u * p = p) (f : M →* G) : f = 1 := by
  sorry

/-- A finite monoid has a right zero if and only if any two of its principal right
ideals meet and it has no nontrivial morphism to a group. -/
theorem exists_forall_mul_eq_self_iff_of_finite [Finite M] :
    (∃ p : M, ∀ u : M, u * p = p) ↔
      (∀ u v : M, ∃ u' v' : M, u * u' = v * v') ∧
        ∀ (G : Type u) [Group G] (f : M →* G), f = 1 := by
  sorry

end Monoid


end
/-! ### `MatrixDetFinTwoCauchyBinet` -/
section


/-! ## From `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean` -/

open Function
variable {R K M E : Type*} {n : ℕ}
  [CommRing R] [Field K] [AddCommGroup M] [Module R M] [AddCommGroup E] [Module K E]
namespace exteriorPower
open Module Set Set.powersetCard
variable (R n) {I : Type*} [LinearOrder I] (b : Basis I R M)
variable {R}
variable (R)
section FiniteFree
variable (M) [Module.Free R M] [Module.Finite R M]
end FiniteFree
end exteriorPower

namespace Matrix

open Set exteriorPower

variable {l o ι : Type*} [Fintype ι] [LinearOrder ι]

/-- The **Cauchy–Binet formula**: for `A : Matrix (Fin n) ι R` and `B : Matrix ι (Fin n) R`,
`det (A * B)` is the sum, over the `n`-element subsets `s` of `ι`, of the products of the
maximal minors of `A` and `B` indexed by `s`. -/
theorem det_mul_eq_sum_powersetCard (A : Matrix (Fin n) ι R) (B : Matrix ι (Fin n) R) :
    (A * B).det = ∑ s : powersetCard ι n,
      (A.submatrix id (powersetCard.ofFinEmbEquiv.symm s)).det *
        (B.submatrix (powersetCard.ofFinEmbEquiv.symm s) id).det := by
  sorry

/-- The **Cauchy–Binet formula** for minors: the minor of `A * B` on rows `I` and columns `K` is
the sum, over the `n`-element subsets `s` of `ι`, of the products of the minors of `A` on rows
`I` and columns `s` and of `B` on rows `s` and columns `K`. -/
theorem det_submatrix_mul (A : Matrix l ι R) (B : Matrix ι o R) (I : Fin n → l) (K : Fin n → o) :
    ((A * B).submatrix I K).det = ∑ s : powersetCard ι n,
      (A.submatrix I (powersetCard.ofFinEmbEquiv.symm s)).det *
        (B.submatrix (powersetCard.ofFinEmbEquiv.symm s) K).det := by
  sorry

end Matrix

end
/-! ### `SingularValuesSigmaTwo` -/
section


/-! ## From `Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean` -/

section
variable {ι R S : Type*}
namespace Finset
section OrderedSemiring
variable [Semiring R] [PartialOrder R] [IsOrderedRing R] {f : ι → R} {s : Finset ι}
end OrderedSemiring
section OrderedCommSemiring
variable [CommSemiring R] [PartialOrder R] [IsOrderedRing R] {f g : ι → R} {s t : Finset ι}
end OrderedCommSemiring
section StrictOrderedRing
variable [Semiring R] [LinearOrder R] [IsStrictOrderedRing R] [ExistsAddOfLE R]
    (s : Finset ι) (f : ι → R)
end StrictOrderedRing
section CanonicallyOrderedAdd
variable [CommSemiring R] [PartialOrder R] [CanonicallyOrderedAdd R]
  {f g h : ι → R} {s : Finset ι} {i : ι}
end CanonicallyOrderedAdd
/-- **The Binet–Cauchy identity**, with the sum over ordered pairs `(i, j)`:
`∑_{i,j} (a_i b_j - a_j b_i) (c_i d_j - c_j d_i)` is
`2 ((∑ a_i c_i)(∑ b_i d_i) - (∑ a_i d_i)(∑ b_i c_i))`. -/
lemma sum_sum_mul_sub_mul_mul_mul_sub_mul [CommRing R] (s : Finset ι) (a b c d : ι → R) :
    ∑ i ∈ s, ∑ j ∈ s, (a i * b j - a j * b i) * (c i * d j - c j * d i) =
      2 * ((∑ i ∈ s, a i * c i) * (∑ i ∈ s, b i * d i) -
        (∑ i ∈ s, a i * d i) * ∑ i ∈ s, b i * c i) := by
  sorry

/-- **Lagrange's identity**, with the sum over ordered pairs `(i, j)`:
`∑_{i,j} (f_i g_j - f_j g_i)² = 2 ((∑ f_i²)(∑ g_i²) - (∑ f_i g_i)²)`. -/
lemma sum_sum_mul_sub_mul_sq [CommRing R] (s : Finset ι) (f g : ι → R) :
    ∑ i ∈ s, ∑ j ∈ s, (f i * g j - f j * g i) ^ 2 =
      2 * ((∑ i ∈ s, f i ^ 2) * ∑ i ∈ s, g i ^ 2 - (∑ i ∈ s, f i * g i) ^ 2) := by
  sorry

end Finset
section AbsoluteValue
end AbsoluteValue
end

/-! ## From `Mathlib/Analysis/RCLike/Basic.lean` -/

section
open Fintype
open scoped BigOperators ComplexConjugate
section
local notation "𝓚" => algebraMap ℝ _
end
variable {K E : Type*} [RCLike K]
namespace RCLike
variable {z : K}
open OfScientific (ofScientific)
/-- **Lagrange's identity** over `ℝ` or `ℂ`, with the sum over ordered pairs `(i, j)`:
`∑_{i,j} |a_i b_j - a_j b_i|² = 2 ((∑ |a_i|²)(∑ |b_i|²) - |∑ conj a_i b_i|²)`. -/
theorem sum_sum_norm_mul_sub_mul_sq {ι : Type*} (s : Finset ι) (a b : ι → K) :
    ∑ i ∈ s, ∑ j ∈ s, ‖a i * b j - a j * b i‖ ^ 2 =
      2 * ((∑ i ∈ s, ‖a i‖ ^ 2) * ∑ i ∈ s, ‖b i‖ ^ 2 - ‖∑ i ∈ s, conj (a i) * b i‖ ^ 2) := by
  sorry

/-- **Lagrange's inequality** over `ℝ` or `ℂ`, with the sum over ordered pairs `(i, j)`:
`∑_{i,j} |a_i b_j - a_j b_i|² ≤ 2 (∑ |a_i|²)(∑ |b_i|²)`. -/
theorem sum_sum_norm_mul_sub_mul_sq_le {ι : Type*} (s : Finset ι) (a b : ι → K) :
    ∑ i ∈ s, ∑ j ∈ s, ‖a i * b j - a j * b i‖ ^ 2 ≤
      2 * (∑ i ∈ s, ‖a i‖ ^ 2) * ∑ i ∈ s, ‖b i‖ ^ 2 := by
  sorry

end RCLike
section
variable {A : Type*} [AddCommGroup A] [StarAddMonoid A] [Module K A] [StarModule K A] {a : A}
open RCLike
end
section Instances
end Instances
namespace RCLike
section NormedField
variable [NormedField E] [CharZero E] [NormedSpace K E]
include K
end NormedField
section Order
open scoped ComplexOrder
variable {z w : K}
end Order
section CleanupLemmas
local notation "reR" => @RCLike.re ℝ _
local notation "imR" => @RCLike.im ℝ _
local notation "IR" => @RCLike.I ℝ _
local notation "normSqR" => @RCLike.normSq ℝ _
end CleanupLemmas
section LinearMaps
end LinearMaps
section CaseSpecific
end CaseSpecific
end RCLike
namespace AddChar
variable {G : Type*} [Finite G]
end AddChar
section
end
namespace LinearIsometryEquiv
variable {𝕜 V W G : Type*} [RCLike 𝕜] [SeminormedAddCommGroup V] [Module 𝕜 V]
  [SeminormedAddCommGroup W] [NormedSpace 𝕜 W] [SeminormedAddCommGroup G] [NormedSpace 𝕜 G]
end LinearIsometryEquiv
namespace Function
end Function
end

/-! ## From `Mathlib/Analysis/InnerProductSpace/KyFan.lean` (new file) -/

section
/-
Copyright (c) 2026 Michel Hua. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Michel Hua
-/


/-!
# Ky Fan's inequality for singular values

For linear maps `u v : E →ₗ[𝕜] F` between finite-dimensional inner product spaces, the sum of
the `n` largest singular values is subadditive:
`∑ j < n, s_j(u + v) ≤ ∑ j < n, s_j(u) + ∑ j < n, s_j(v)`.

## Main statements

* `sum_norm_inner_sq_le_norm_sq_of_orthogonal`: Bessel's inequality for a finite family of
  pairwise orthogonal vectors of norm at most `1`.
* `LinearMap.norm_sum_inner_le_sum_singularValues`: Ky Fan's maximum principle: for pairwise
  orthogonal families `(x_i)` in `E` and `(y_i)` in `F` of vectors of norm at most `1`, indexed by
  a finite set with at most `n` elements, `‖∑ i, ⟪y_i, T x_i⟫‖ ≤ ∑ j < n, s_j(T)`.
* `LinearMap.sum_singularValues_add_le`: Ky Fan's inequality.
* `LinearMap.sum_powersetCard_two_prod_singularValues_add_le`: the same for the second elementary
  symmetric function `σ₂` of the `n` largest singular values:
  `σ₂(u + v) ≤ σ₂(u) + (∑ j < n, s_j(u)) (∑ j < n, s_j(v)) + σ₂(v)`. The proof works with
  `2 × 2` minors of the compressions `⟪y_i, T x_j⟫` instead of the second exterior power.

## References

* [K. Fan, *Maximum properties and inequalities for the eigenvalues of completely continuous
  operators*][fan1951]: the maximum principle is the case `m = 1` of Theorem 1 (inequality (8)),
  and Ky Fan's inequality is inequality (20) in the proof of Theorem 5
* [R. Bhatia, *Matrix Analysis*][bhatia1997]

## Tags

singular values, Ky Fan
-/


open Finset Module InnerProductSpace
open scoped ComplexConjugate

variable {𝕜 : Type*} [RCLike 𝕜]
  {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
  {F : Type*} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]

local notation "⟪" x ", " y "⟫" => inner 𝕜 x y

/-- **Bessel's inequality** for a finite family of pairwise orthogonal vectors of norm at most
`1`. See `Orthonormal.sum_inner_products_le` for orthonormal families. -/
theorem sum_norm_inner_sq_le_norm_sq_of_orthogonal {ι : Type*} (s : Finset ι) {y : ι → E}
    (horth : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → ⟪y i, y j⟫ = 0) (hle : ∀ i ∈ s, ‖y i‖ ≤ 1)
    (z : E) : ∑ i ∈ s, ‖⟪y i, z⟫‖ ^ 2 ≤ ‖z‖ ^ 2 := by
  sorry

/-! ### The second elementary symmetric function -/

section Frames

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H]

end Frames

namespace LinearMap

variable [FiniteDimensional 𝕜 E] [FiniteDimensional 𝕜 F]

/-- **Ky Fan's maximum principle.** For families `(x_i)` in `E` and `(y_i)` in `F`, indexed by
a finite set with at most `n` elements, each pairwise orthogonal and made of vectors of norm at
most `1`, `‖∑ i, ⟪y_i, T x_i⟫‖` is at most the sum of the `n` largest singular values of `T`. -/
theorem norm_sum_inner_le_sum_singularValues {ι : Type*} (s : Finset ι) {x : ι → E}
    {y : ι → F} (hx : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → ⟪x i, x j⟫ = 0) (hx1 : ∀ i ∈ s, ‖x i‖ ≤ 1)
    (hy : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → ⟪y i, y j⟫ = 0) (hy1 : ∀ i ∈ s, ‖y i‖ ≤ 1)
    (T : E →ₗ[𝕜] F) {n : ℕ} (hn : #s ≤ n) :
    ‖∑ i ∈ s, ⟪y i, T (x i)⟫‖ ≤ ∑ j ∈ Finset.range n, T.singularValues j := by
  sorry
/-- **Ky Fan's inequality**: the sum of the `n` largest singular values is subadditive. -/
theorem sum_singularValues_add_le (u v : E →ₗ[𝕜] F) (n : ℕ) :
    ∑ j ∈ Finset.range n, (u + v).singularValues j ≤
      ∑ j ∈ Finset.range n, u.singularValues j + ∑ j ∈ Finset.range n, v.singularValues j := by
  sorry

/-- Writing `σ₂(T)` for the second elementary symmetric function of the `n` largest singular
values of `T`, `σ₂(u + v) ≤ σ₂(u) + (∑ j < n, s_j(u)) (∑ j < n, s_j(v)) + σ₂(v)`.
Ky Fan's inequality `sum_singularValues_add_le` is the analogous statement for the first
elementary symmetric function. -/
theorem sum_powersetCard_two_prod_singularValues_add_le (u v : E →ₗ[𝕜] F) (n : ℕ) :
    ∑ t ∈ (Finset.range n).powersetCard 2, ∏ i ∈ t, (u + v).singularValues i ≤
      ∑ t ∈ (Finset.range n).powersetCard 2, ∏ i ∈ t, u.singularValues i +
        (∑ j ∈ Finset.range n, u.singularValues j) * ∑ j ∈ Finset.range n, v.singularValues j +
        ∑ t ∈ (Finset.range n).powersetCard 2, ∏ i ∈ t, v.singularValues i := by
  sorry

end LinearMap

end

end
/-! ### `PolynomialIntegerValued` -/
section


/-! ## From `Mathlib/RingTheory/Polynomial/IntegerValued.lean` (new file) -/

section
/-
Copyright (c) 2026 Michel Hua. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Michel Hua
-/


/-!
# Integer-valued polynomials

We define the `ℤ`-subalgebra `Polynomial.intValued` of `ℚ[X]` of polynomials that take integer
values at all integers, and show that the binomial polynomials `Ring.choose X n` form a `ℤ`-basis
of it (Pólya).

## Main results

* `Polynomial.eq_sum_fwdDiff_iter_smul_choose`: Newton's forward difference formula. Over a field
  of characteristic zero, `P = ∑ k ≤ deg P, (Δᵏ P)(0) • Ring.choose X k`.
* `Polynomial.mem_intValued_iff_forall_natCast`: a rational polynomial is integer-valued as soon
  as it takes integer values at all natural numbers.
* `Polynomial.exists_eq_sum_intCast_smul_choose`: **Pólya's theorem**. An integer-valued
  polynomial `P` is an integer combination of the `Ring.choose X k` with `k ≤ deg P`.
* `Polynomial.intValuedBasis`: the `Ring.choose X n` form a basis of `Polynomial.intValued` over
  `ℤ`.

## References

* [P.-J. Cahen and J.-L. Chabert, *Integer-valued polynomials*][cahen1997], Chapter I
* [G. Pólya, *Über ganzwertige Polynome in algebraischen Zahlkörpern*][polya1919]
-/


open Finset fwdDiff

namespace Polynomial

section Newton

variable {K : Type*} [Field K] [CharZero K]

theorem eval_choose_X (a : K) (n : ℕ) : (Ring.choose (X : K[X]) n).eval a = Ring.choose a n := by
  sorry

theorem eval_natCast_choose_X (m n : ℕ) :
    (Ring.choose (X : K[X]) n).eval (m : K) = (m.choose n : K) := by
  sorry

/-- **Newton's forward difference formula**: over a field of characteristic zero, a polynomial
is the combination of the binomial polynomials `Ring.choose X k` whose coefficients are its
iterated forward differences at `0`. -/
theorem eq_sum_fwdDiff_iter_smul_choose (P : K[X]) :
    P = ∑ k ∈ range (P.natDegree + 1), ((Δ_[1])^[k] P.eval 0) • Ring.choose (X : K[X]) k := by
  sorry

end Newton

/-- The integer-valued polynomials: the `ℤ`-subalgebra of `ℚ[X]` of polynomials taking integer
values at all integers. -/
noncomputable def intValued : Subalgebra ℤ ℚ[X] where
  carrier := {P | ∀ n : ℤ, P.eval (n : ℚ) ∈ Set.range ((↑) : ℤ → ℚ)}
  mul_mem' {P Q} hP hQ n := by
    obtain ⟨a, ha⟩ := hP n
    obtain ⟨b, hb⟩ := hQ n
    exact ⟨a * b, by simp [ha, hb]⟩
  add_mem' {P Q} hP hQ n := by
    obtain ⟨a, ha⟩ := hP n
    obtain ⟨b, hb⟩ := hQ n
    exact ⟨a + b, by simp [ha, hb]⟩
  algebraMap_mem' c _ := ⟨c, by simp⟩

theorem mem_intValued {P : ℚ[X]} :
    P ∈ intValued ↔ ∀ n : ℤ, P.eval (n : ℚ) ∈ Set.range ((↑) : ℤ → ℚ) := by
  sorry

theorem choose_X_mem_intValued (n : ℕ) : Ring.choose (X : ℚ[X]) n ∈ intValued := by
  sorry

/-- **Pólya's theorem**: a rational polynomial taking integer values at all natural numbers is an
integer combination of the binomial polynomials `Ring.choose X k` with `k ≤ deg P`. -/
theorem exists_eq_sum_intCast_smul_choose {P : ℚ[X]}
    (hP : ∀ m : ℕ, P.eval (m : ℚ) ∈ Set.range ((↑) : ℤ → ℚ)) :
    ∃ c : ℕ → ℤ, P = ∑ k ∈ range (P.natDegree + 1), (c k : ℚ) • Ring.choose (X : ℚ[X]) k := by
  sorry

theorem mem_intValued_iff_forall_natCast {P : ℚ[X]} :
    P ∈ intValued ↔ ∀ m : ℕ, P.eval (m : ℚ) ∈ Set.range ((↑) : ℤ → ℚ) := by
  sorry

theorem linearIndependent_choose_X : LinearIndependent ℤ fun n ↦ Ring.choose (X : ℚ[X]) n := by
  sorry

/-- **Pólya's basis**: the binomial polynomials `Ring.choose X n` form a `ℤ`-basis of the
integer-valued polynomials. -/
noncomputable def intValuedBasis : Module.Basis ℕ ℤ intValued :=
  Module.Basis.mk (v := fun n ↦ ⟨Ring.choose X n, choose_X_mem_intValued n⟩)
    (.of_comp intValued.val.toLinearMap linearIndependent_choose_X)
    (fun P _ ↦ by
      obtain ⟨c, hc⟩ := exists_eq_sum_intCast_smul_choose fun m ↦ P.2 m
      have : P = ∑ k ∈ range ((P : ℚ[X]).natDegree + 1),
          c k • (⟨Ring.choose X k, choose_X_mem_intValued k⟩ : intValued) := by
        refine Subtype.ext (hc.trans ?_)
        simp [Int.cast_smul_eq_zsmul]
      rw [this]
      exact Submodule.sum_mem _ fun k _ ↦ Submodule.smul_mem _ _ (Submodule.subset_span ⟨k, rfl⟩))

@[simp]
theorem coe_intValuedBasis (n : ℕ) : (intValuedBasis n : ℚ[X]) = Ring.choose X n := by
  sorry

instance : Module.Free ℤ intValued := .of_basis intValuedBasis

end Polynomial

end

end
