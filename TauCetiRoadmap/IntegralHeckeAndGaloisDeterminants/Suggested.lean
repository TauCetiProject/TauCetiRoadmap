import Mathlib
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Coordinate.HopfAlgebra
import TauCeti.Algebra.Coalgebra.Comodule.Basic
import TauCeti.Algebra.Coalgebra.Comodule.Trivial
import TauCeti.Algebra.Coalgebra.Comodule.Corestrict
import TauCeti.Algebra.Coalgebra.Comodule.Cat
import TauCeti.Algebra.Coalgebra.Comodule.TensorProduct
import TauCeti.RingTheory.FittingIdeal.Basic
import TauCeti.RingTheory.FittingIdeal.BaseChange
import TauCeti.RingTheory.Idempotents.Corner
import TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.Suggested

/-!
# Integral Hecke actions, determinants and interpolation: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

A determinant is a bundled `PolynomialLaw` with homogeneity
and multiplicativity after every scalar extension, with coefficient algebras in the universe of
the base ring (`PolynomialLaw.toFun'`). The characteristic polynomial is `D_{A[t]}(t - x)`,
transported along `A[t] ⊗_A A ≅ A[t]`. Pseudocharacters use the explicit cycle expansion `T^σ`
(one factor per cycle, fixed points included). Injectivity of `D ↦ Tr` carries the hypothesis
`d! ∈ Aˣ`. Affine group schemes enter through commutative Hopf algebras. Their invariant
coordinate algebras impose simultaneous conjugation over every coefficient algebra. The zeroth
Fitting ideal is Tau Ceti's `TauCeti.fittingIdeal`, and the GSp₄ spin polynomials are those of
SmoothRepresentationsOfLocalGroups, SR.4 (`SpinPolynomial`), imported from that roadmap. The
Koszul complex of a finite sequence is defined here: neither pinned library has one.
-/

universe u w

open TensorProduct Polynomial

namespace TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

noncomputable section

/-! ## Layer IHG.0: polynomial laws, determinants, kernels and continuity (with the Cayley–Hamilton ideal of Layer IHG.1) -/

section

variable {A : Type u} [CommRing A]

namespace PolynomialLaw

variable {M N : Type*} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]

/-- `f` is homogeneous of degree `n`:
`f_S(s • x) = s ^ n • f_S(x)` for every commutative `A`-algebra `S`. -/
def IsHomogeneousOfDegree (n : ℕ) (f : M →ₚₗ[A] N) : Prop :=
  ∀ (S : Type u) [CommRing S] [Algebra A S] (s : S) (x : S ⊗[A] M),
    f.toFun' S (s • x) = s ^ n • f.toFun' S x

variable {R B : Type*} [Ring R] [Algebra A R] [Ring B] [Algebra A B]

/-- `f` sends `1` to `1` and products to products after
every scalar extension to a commutative `A`-algebra. -/
def IsMultiplicative (f : R →ₚₗ[A] B) : Prop :=
  ∀ (S : Type u) [CommRing S] [Algebra A S],
    f.toFun' S 1 = 1 ∧ ∀ x y : S ⊗[A] R, f.toFun' S (x * y) = f.toFun' S x * f.toFun' S y

/-- API: the zero law is homogeneous of every degree. -/
theorem isHomogeneousOfDegree_zero (n : ℕ) : IsHomogeneousOfDegree n (0 : M →ₚₗ[A] N) := sorry

/-- API: homogeneous laws of degree `n` are closed under addition. -/
theorem IsHomogeneousOfDegree.add {n : ℕ} {f g : M →ₚₗ[A] N} (hf : IsHomogeneousOfDegree n f)
    (hg : IsHomogeneousOfDegree n g) : IsHomogeneousOfDegree n (f + g) := sorry

/-- API: composition multiplies degrees. -/
theorem IsHomogeneousOfDegree.comp {P : Type*} [AddCommGroup P] [Module A P] {m n : ℕ}
    {g : N →ₚₗ[A] P} {f : M →ₚₗ[A] N} (hg : IsHomogeneousOfDegree m g)
    (hf : IsHomogeneousOfDegree n f) : IsHomogeneousOfDegree (m * n) (g.comp f) := sorry

/-- API (Chenevier, Example 1.2(i)): degree-one laws are the base changes of linear maps. -/
theorem isHomogeneousOfDegree_one_iff (f : M →ₚₗ[A] N) :
    IsHomogeneousOfDegree 1 f ↔ ∃ ℓ : M →ₗ[A] N, ∀ (S : Type u) [CommRing S] [Algebra A S]
      (x : S ⊗[A] M), f.toFun' S x = ℓ.lTensor S x := sorry

/-- API: the identity law is multiplicative. -/
theorem isMultiplicative_id : IsMultiplicative (PolynomialLaw.id : R →ₚₗ[A] R) := sorry

/-- API: multiplicative laws compose. -/
theorem IsMultiplicative.comp {C : Type*} [Ring C] [Algebra A C] {g : B →ₚₗ[A] C}
    {f : R →ₚₗ[A] B} (hg : IsMultiplicative g) (hf : IsMultiplicative f) :
    IsMultiplicative (g.comp f) := sorry

end PolynomialLaw

/-- (Chenevier, §1.5). A `d`-dimensional `A`-valued determinant on an
`A`-algebra `R`: a multiplicative `A`-polynomial law `R → A`, homogeneous of degree `d`. -/
structure Determinant (A : Type u) [CommRing A] (R : Type*) [Ring R] [Algebra A R] (d : ℕ) where
  /-- The underlying polynomial law. -/
  toLaw : R →ₚₗ[A] A
  isHomogeneous : PolynomialLaw.IsHomogeneousOfDegree d toLaw
  isMultiplicative : PolynomialLaw.IsMultiplicative toLaw

namespace Determinant

variable {R : Type*} [Ring R] [Algebra A R] {d : ℕ}

/-- The value `D(x) ∈ A`. -/
def eval (D : Determinant A R d) (x : R) : A := D.toLaw.ground x

/-- `χ(x, t) := D_{A[t]}(t - x)`. -/
def charpoly (D : Determinant A R d) (x : R) : A[X] :=
  Algebra.TensorProduct.rid A A A[X] (D.toLaw.toFun' A[X] ((X : A[X]) ⊗ₜ[A] (1 : R) - 1 ⊗ₜ[A] x))

/-- The trace `Λ₁ = -(coefficient of t^{d-1})`. -/
def trace (D : Determinant A R d) (x : R) : A :=
  if d = 0 then 0 else -(D.charpoly x).coeff (d - 1)

/-- API: `D` is multiplicative on `R`. -/
theorem eval_mul (D : Determinant A R d) (x y : R) : D.eval (x * y) = D.eval x * D.eval y := sorry

/-- API: `D(1) = 1`. -/
theorem eval_one (D : Determinant A R d) : D.eval 1 = 1 := sorry

/-- API: `D(a x) = a ^ d D(x)`. -/
theorem eval_smul (D : Determinant A R d) (a : A) (x : R) : D.eval (a • x) = a ^ d * D.eval x :=
  sorry

/-- API: units go to units. -/
theorem isUnit_eval (D : Determinant A R d) {x : R} (hx : IsUnit x) : IsUnit (D.eval x) := sorry

/-- API: `χ(x, t)` is monic of degree `d`. -/
theorem charpoly_monic (D : Determinant A R d) (x : R) : (D.charpoly x).Monic := sorry

theorem charpoly_natDegree [Nontrivial A] (D : Determinant A R d) (x : R) :
    (D.charpoly x).natDegree = d := sorry

/-- API: the constant coefficient is `(-1)^d D(x)`. -/
theorem charpoly_coeff_zero (D : Determinant A R d) (x : R) :
    (D.charpoly x).coeff 0 = (-1) ^ d * D.eval x := sorry

/-- API: the trace is `A`-linear. -/
def traceLinear (D : Determinant A R d) : R →ₗ[A] A where
  toFun := D.trace
  map_add' := sorry
  map_smul' := sorry

/-- API: `Tr(1) = d`. -/
theorem trace_one (D : Determinant A R d) : D.trace 1 = d := sorry

/-- (Chenevier, Lemma 1.12(i)). -/
theorem eval_one_add_mul_comm (D : Determinant A R d) (r r' : R) :
    D.eval (1 + r * r') = D.eval (1 + r' * r) := sorry

/-- `det ∘ ρ` for an `A`-algebra map
`ρ : R → M_d(A)`. -/
def ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) : Determinant A R d := sorry

theorem eval_ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) :
    (ofMatrix ρ).eval x = (ρ x).det := sorry

theorem trace_ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) :
    (ofMatrix ρ).trace x = (ρ x).trace := sorry

theorem charpoly_ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) :
    (ofMatrix ρ).charpoly x = Matrix.charpoly (ρ x) := sorry

/-- Integral Newton relation, using the signed coefficient convention; no division by k.
Chenevier, Example 1.11(ii), equation (1.3). -/
theorem newton (D : Determinant A R d) (r : R) (k : ℕ) (hk : 1 ≤ k) (hkd : k ≤ d) :
    (k : A) * ((-1 : A)^k * (D.charpoly r).coeff (d-k)) =
      ∑ j ∈ Finset.Icc 1 k,
        (-1 : A)^(j-1) * ((-1 : A)^(k-j) * (D.charpoly r).coeff (d-(k-j))) * D.trace (r^j) := sorry

/-- API: conjugate representations have the same determinant. -/
theorem ofMatrix_conj (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (P : (Matrix (Fin d) (Fin d) A)ˣ)
    (ρ' : R →ₐ[A] Matrix (Fin d) (Fin d) A) (h : ∀ x, ρ' x = P * ρ x * P⁻¹) :
    ofMatrix ρ' = ofMatrix ρ := sorry

/-- The product of determinants of dimensions `d₁` and `d₂`
is a determinant of dimension `d₁ + d₂` (the direct sum). -/
def mul {d₁ d₂ : ℕ} (D₁ : Determinant A R d₁) (D₂ : Determinant A R d₂) :
    Determinant A R (d₁ + d₂) := sorry

theorem eval_mul_det {d₁ d₂ : ℕ} (D₁ : Determinant A R d₁) (D₂ : Determinant A R d₂) (x : R) :
    (D₁.mul D₂).eval x = D₁.eval x * D₂.eval x := sorry

theorem trace_mul_det {d₁ d₂ : ℕ} (D₁ : Determinant A R d₁) (D₂ : Determinant A R d₂) (x : R) :
    (D₁.mul D₂).trace x = D₁.trace x + D₂.trace x := sorry

theorem charpoly_mul_det {d₁ d₂ : ℕ} (D₁ : Determinant A R d₁) (D₂ : Determinant A R d₂)
    (x : R) : (D₁.mul D₂).charpoly x = D₁.charpoly x * D₂.charpoly x := sorry

/-- Pull back along an `A`-algebra map (for instance
`A[H] → A[G]` for a subgroup `H ≤ G`). -/
def comap {R' : Type*} [Ring R'] [Algebra A R'] (φ : R' →ₐ[A] R) (D : Determinant A R d) :
    Determinant A R' d := sorry

theorem eval_comap {R' : Type*} [Ring R'] [Algebra A R'] (φ : R' →ₐ[A] R)
    (D : Determinant A R d) (x : R') : (D.comap φ).eval x = D.eval (φ x) := sorry

theorem comap_id (D : Determinant A R d) : D.comap (AlgHom.id A R) = D := sorry

theorem comap_comp {R' R'' : Type*} [Ring R'] [Algebra A R'] [Ring R''] [Algebra A R'']
    (ψ : R' →ₐ[A] R) (φ : R'' →ₐ[A] R') (D : Determinant A R d) :
    D.comap (ψ.comp φ) = (D.comap ψ).comap φ := sorry

/-- Scalar extension to a commutative `A`-algebra `S`. -/
def baseChange (D : Determinant A R d) (S : Type u) [CommRing S] [Algebra A S] :
    Determinant S (S ⊗[A] R) d := sorry

theorem eval_baseChange_tmul (D : Determinant A R d) (S : Type u) [CommRing S] [Algebra A S]
    (x : R) : (D.baseChange S).eval (1 ⊗ₜ x) = algebraMap A S (D.eval x) := sorry

theorem charpoly_baseChange_tmul (D : Determinant A R d) (S : Type u) [CommRing S]
    [Algebra A S] (x : R) :
    (D.baseChange S).charpoly (1 ⊗ₜ x) = (D.charpoly x).map (algebraMap A S) := sorry

theorem trace_baseChange_tmul (D : Determinant A R d) (S : Type u) [CommRing S] [Algebra A S]
    (x : R) : (D.baseChange S).trace (1 ⊗ₜ x) = algebraMap A S (D.trace x) := sorry

/-- One-dimensional determinants are `A`-algebra maps
`R → A`. -/
def dimOneEquiv : Determinant A R 1 ≃ (R →ₐ[A] A) := sorry

theorem dimOneEquiv_apply (D : Determinant A R 1) (r : R) :
    dimOneEquiv D r = D.eval r := sorry

end Determinant

section Pseudocharacter

variable {R : Type*} [Ring R] [Algebra A R]

/-- The product of `x` along the cycle of `σ` through `i`, starting at `i`:
`x_i * x_{σ i} * ⋯`. -/
def cycleProduct {n : ℕ} (σ : Equiv.Perm (Fin n)) (x : Fin n → R) (i : Fin n) : R :=
  ((List.range (Function.minimalPeriod σ i)).map fun k ↦ x ((σ ^ k) i)).prod

/-- `T^σ(x) = ∏_{cycles c of σ} T(product of x along c)`, one factor per cycle (its least
element), fixed points included. -/
def cycleTerm {n : ℕ} (T : R → A) (σ : Equiv.Perm (Fin n)) (x : Fin n → R) : A :=
  ∏ i ∈ Finset.univ.filter (fun i ↦ ∀ j, σ.SameCycle i j → i ≤ j), T (cycleProduct σ x i)

/-- A `d`-dimensional pseudocharacter: an `A`-linear central
`T : R → A` with `T(1) = d` and the pseudocharacter identity
`∑_{σ ∈ S_{d+1}} sgn(σ) T^σ(x₁, …, x_{d+1}) = 0`. -/
def IsPseudocharacter (d : ℕ) (T : R →ₗ[A] A) : Prop :=
  T 1 = d ∧ (∀ x y : R, T (x * y) = T (y * x)) ∧
    ∀ x : Fin (d + 1) → R,
      ∑ σ : Equiv.Perm (Fin (d + 1)), (Equiv.Perm.sign σ : ℤ) • cycleTerm T σ x = 0

/-- (Chenevier, Lemma 1.12(iii)). -/
theorem Determinant.isPseudocharacter_trace {d : ℕ} (D : Determinant A R d) :
    IsPseudocharacter d D.traceLinear := sorry

/-- (Chenevier, Proposition 1.27, with the hypothesis
`d! ∈ Aˣ` used in Newton reconstruction). -/
theorem Determinant.injective_trace {d : ℕ} (hd : IsUnit (d.factorial : A)) :
    Function.Injective (fun D : Determinant A R d ↦ D.traceLinear) := sorry

/-- (Chenevier, Proposition 1.27). Over a
`ℚ`-algebra every pseudocharacter is the trace of a unique determinant. -/
theorem Determinant.exists_unique_trace_eq [Algebra ℚ A] {d : ℕ} (T : R →ₗ[A] A)
    (hT : IsPseudocharacter d T) : ∃! D : Determinant A R d, D.traceLinear = T := sorry

/-- (Chenevier, Proposition 1.29). The same when
`(2d)!` is invertible, or `d = 2` and `2` is invertible. -/
theorem Determinant.exists_unique_trace_eq_of_isUnit {d : ℕ}
    (hd : IsUnit ((2 * d).factorial : A) ∨ (d = 2 ∧ IsUnit (2 : A))) (T : R →ₗ[A] A)
    (hT : IsPseudocharacter d T) : ∃! D : Determinant A R d, D.traceLinear = T := sorry

end Pseudocharacter

section DimensionTwo

variable (G : Type*) [Group G]

/-- (Chenevier, Lemma 1.9). Two-dimensional determinants on
a group are pairs `(T, D)` with `D : G → Aˣ` a homomorphism, `T(1) = 2`, `T(gh) = T(hg)` and
`D(g) T(g⁻¹h) - T(g) T(h) + T(gh) = 0`. -/
def dimTwoEquiv : Determinant A (MonoidAlgebra A G) 2 ≃
    {p : (G →* Aˣ) × (G → A) // p.2 1 = 2 ∧ (∀ g h, p.2 (g * h) = p.2 (h * g)) ∧
      ∀ g h, (p.1 g : A) * p.2 (g⁻¹ * h) - p.2 g * p.2 h + p.2 (g * h) = 0} := sorry

theorem dimTwoEquiv_trace (D : Determinant A (MonoidAlgebra A G) 2) (g : G) :
    (dimTwoEquiv G D).val.2 g = D.trace (MonoidAlgebra.of A G g) := sorry
theorem dimTwoEquiv_det (D : Determinant A (MonoidAlgebra A G) 2) (g : G) :
    ((dimTwoEquiv G D).val.1 g : A) = D.eval (MonoidAlgebra.of A G g) := sorry

end DimensionTwo

section KernelsAndCayleyHamilton

namespace PolynomialLaw

variable {M N : Type*} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]

/-- (Chenevier §1.17). `x ∈ Ker(P)` iff
`P_S(b ⊗ x + m) = P_S(m)` for every commutative `A`-algebra `S`, `b ∈ S`, `m ∈ S ⊗ M`. -/
def ker (f : M →ₚₗ[A] N) : Submodule A M where
  carrier := {x | ∀ (S : Type u) [CommRing S] [Algebra A S] (b : S) (m : S ⊗[A] M),
    f.toFun' S (b ⊗ₜ x + m) = f.toFun' S m}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `P` is faithful if its kernel is zero. -/
def IsFaithful (f : M →ₚₗ[A] N) : Prop := ker f = ⊥

/-- the degree-one law of a linear map. -/
def ofLinearMap (ℓ : M →ₗ[A] N) : M →ₚₗ[A] N where
  toFun' S _ _ := ℓ.lTensor S
  isCompat' := sorry

theorem ofLinearMap_ground (ℓ : M →ₗ[A] N) : (ofLinearMap ℓ).ground = ℓ := sorry

/-- (Chenevier, Lemma 1.18(i)). `P` factors
through `M ⧸ K` exactly when `K ≤ Ker(P)`. -/
theorem exists_factor_iff_le_ker (f : M →ₚₗ[A] N) (K : Submodule A M) :
    (∃ g : (M ⧸ K) →ₚₗ[A] N, g.comp (ofLinearMap K.mkQ) = f) ↔ K ≤ ker f := sorry

/-- (Chenevier, Lemma 1.18(ii)). -/
theorem isFaithful_factor (f : M →ₚₗ[A] N) (g : (M ⧸ ker f) →ₚₗ[A] N)
    (hg : g.comp (ofLinearMap (ker f).mkQ) = f) : IsFaithful g := sorry

/-- The kernel translation identity at a coefficient algebra (Chenevier, §1.17). -/
theorem tmul_mem_ker_baseChange (f : M →ₚₗ[A] N) {x : M} (hx : x ∈ ker f) (S : Type u)
    [CommRing S] [Algebra A S] (b : S) (m : S ⊗[A] M) :
    f.toFun' S (b ⊗ₜ x + m) = f.toFun' S m := sorry

/-- Kernel translations after a further extension; the tensor coefficient may be arbitrary. -/
theorem ker_translation_tower (f : M →ₚₗ[A] N) {x : M} (hx : x ∈ ker f)
    (B S : Type u) [CommRing B] [Algebra A B] [CommRing S] [Algebra A S]
    [Algebra B S] [IsScalarTower A B S] (b : B) (s : S) (m : S ⊗[A] M) :
    f.toFun' S ((s * algebraMap B S b) ⊗ₜ[A] x + m) = f.toFun' S m := sorry

end PolynomialLaw

namespace Determinant

variable {R : Type*} [Ring R] [Algebra A R] {d : ℕ}

/-- Pullback is composition of polynomial laws on every coefficient algebra. -/
theorem comap_toLaw {R' : Type*} [Ring R'] [Algebra A R']
    (φ : R' →ₐ[A] R) (D : Determinant A R d) :
    (D.comap φ).toLaw = D.toLaw.comp (PolynomialLaw.ofLinearMap φ.toLinearMap) := sorry

/-- The product determinant multiplies values on arbitrary scalar-extended inputs. -/
theorem mul_toFun {d₁ d₂ : ℕ} (D₁ : Determinant A R d₁) (D₂ : Determinant A R d₂)
    (S : Type u) [CommRing S] [Algebra A S] (x : S ⊗[A] R) :
    (D₁.mul D₂).toLaw.toFun' S x = D₁.toLaw.toFun' S x * D₂.toLaw.toFun' S x := sorry

/-- Scalar extension is specified on the full law, including mixed tensors. -/
theorem baseChange_toFun (D : Determinant A R d) (B S : Type u)
    [CommRing B] [Algebra A B] [CommRing S] [Algebra A S]
    [Algebra B S] [IsScalarTower A B S] (x : S ⊗[A] R) :
    Algebra.TensorProduct.rid B S S ((D.baseChange B).toLaw.toFun' S
      ((TensorProduct.AlgebraTensorModule.cancelBaseChange A B S S R).symm x)) =
      Algebra.TensorProduct.rid A S S (D.toLaw.toFun' S x) := sorry

/-- The matrix determinant law on every scalar extension; the input representation is fixed
on pure tensors, which span the scalar-extended algebra. -/
theorem ofMatrix_toFun (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A)
    (S : Type u) [CommRing S] [Algebra A S]
    (ρS : S ⊗[A] R →ₐ[S] Matrix (Fin d) (Fin d) S)
    (hρS : ∀ r, ρS (1 ⊗ₜ[A] r) = (ρ r).map (algebraMap A S)) (x : S ⊗[A] R) :
    Algebra.TensorProduct.rid A S S ((ofMatrix ρ).toLaw.toFun' S x) = (ρS x).det := sorry

/-- The kernel of a determinant. -/
abbrev ker (D : Determinant A R d) : Submodule A R := PolynomialLaw.ker D.toLaw

/-- (Chenevier, Lemma 1.19(i)). `r ∈ Ker(D)` iff
`D_S(1 + r r') = 1` for every commutative `A`-algebra `S` and `r' ∈ S ⊗ R`, iff the same with
`r' r`. -/
theorem mem_ker_iff (D : Determinant A R d) (r : R) :
    r ∈ D.ker ↔ ∀ (S : Type u) [CommRing S] [Algebra A S] (r' : S ⊗[A] R),
      D.toLaw.toFun' S (1 + (1 ⊗ₜ r) * r') = 1 := sorry

theorem mem_ker_iff' (D : Determinant A R d) (r : R) :
    r ∈ D.ker ↔ ∀ (S : Type u) [CommRing S] [Algebra A S] (r' : S ⊗[A] R),
      D.toLaw.toFun' S (1 + r' * (1 ⊗ₜ r)) = 1 := sorry

/-- (Chenevier, Lemma 1.19(ii)). The kernel is a two-sided
ideal; it is proper when `d > 0` and `R` is nontrivial. -/
def kerTwoSided (D : Determinant A R d) : TwoSidedIdeal R := sorry

theorem mem_kerTwoSided (D : Determinant A R d) (r : R) : r ∈ D.kerTwoSided ↔ r ∈ D.ker := sorry

theorem kerTwoSided_ne_top [Nontrivial R] (D : Determinant A R d) (hd : 0 < d) :
    D.kerTwoSided ≠ ⊤ := sorry

/-- The polynomial law
`χ : R → R, r ↦ r^d - Λ₁(r) r^{d-1} + ⋯ + (-1)^d Λ_d(r)`. -/
def charpolyLaw (D : Determinant A R d) : R →ₚₗ[A] R := sorry

theorem charpolyLaw_toFun (D : Determinant A R d)
    (S : Type u) [CommRing S] [Algebra A S] (x : S ⊗[A] R) :
    D.charpolyLaw.toFun' S x =
      Polynomial.eval₂ (algebraMap S (S ⊗[A] R)) x ((D.baseChange S).charpoly x) := sorry

theorem isHomogeneousOfDegree_charpolyLaw (D : Determinant A R d) :
    PolynomialLaw.IsHomogeneousOfDegree d D.charpolyLaw := sorry

/-- `χ_α(r₁, …, rₙ)`: the coefficient of `t^α` in `χ(t₁ r₁ + ⋯ + tₙ rₙ)`. -/
def chiCoeff (D : Determinant A R d) {n : ℕ} (r : Fin n → R) (α : Fin n →₀ ℕ) : R :=
  TensorProduct.finsuppScalarLeft A R (Fin n →₀ ℕ)
    ((MvPolynomial.basisMonomials (Fin n) A).repr.rTensor R
      (D.charpolyLaw.toFun' (MvPolynomial (Fin n) A)
        (∑ i, (MvPolynomial.X i : MvPolynomial (Fin n) A) ⊗ₜ[A] r i))) α

/-- (Chenevier, Lemma 1.12(iv)). -/
theorem eval_one_add_chiCoeff_mul (D : Determinant A R d) {n : ℕ} (r₀ : R) (r : Fin n → R)
    (α : Fin n →₀ ℕ) : D.eval (1 + D.chiCoeff r α * r₀) = 1 := sorry

/-- (Chenevier §1.17). `CH(D)`, the two-sided ideal generated by
all `χ_α(r₁, …, rₙ)`. -/
def chIdeal (D : Determinant A R d) : TwoSidedIdeal R :=
  TwoSidedIdeal.span {c | ∃ (n : ℕ) (r : Fin n → R) (α : Fin n →₀ ℕ), c = D.chiCoeff r α}

theorem chiCoeff_mem_chIdeal (D : Determinant A R d) {n : ℕ} (r : Fin n → R) (α : Fin n →₀ ℕ) :
    D.chiCoeff r α ∈ D.chIdeal := sorry

/-- `D` is Cayley–Hamilton if `CH(D) = 0`. -/
def IsCayleyHamilton (D : Determinant A R d) : Prop := D.chIdeal = ⊥

/-- API: Cayley–Hamilton iff the law `χ` vanishes identically. -/
theorem isCayleyHamilton_iff (D : Determinant A R d) :
    D.IsCayleyHamilton ↔ D.charpolyLaw = 0 := sorry


theorem IsCayleyHamilton.baseChange {D : Determinant A R d} (hD : D.IsCayleyHamilton)
    (S : Type u) [CommRing S] [Algebra A S] : (D.baseChange S).IsCayleyHamilton := sorry

/-- (Chenevier, Example 1.20(ii)). -/
theorem IsCayleyHamilton.comap {R' : Type*} [Ring R'] [Algebra A R'] {φ : R' →ₐ[A] R}
    (hφ : Function.Injective φ) {D : Determinant A R d} (hD : D.IsCayleyHamilton) :
    (D.comap φ).IsCayleyHamilton := sorry

/-- (Chenevier, Lemma 1.21). -/
theorem chIdeal_le_kerTwoSided (D : Determinant A R d) : D.chIdeal ≤ D.kerTwoSided := sorry

/-- (Chenevier, Lemma 1.21). -/
theorem IsFaithful.isCayleyHamilton {D : Determinant A R d}
    (hD : PolynomialLaw.IsFaithful D.toLaw) : D.IsCayleyHamilton := sorry

/-- The coefficient subring. -/
def coefficientSubring {G : Type*} [Monoid G]
    (D : Determinant A (MonoidAlgebra A G) d) : Subring A :=
  Subring.closure {a | ∃ (g : G) (i : ℕ),
    a = (D.charpoly (MonoidAlgebra.of A G g)).coeff i}

/-- Corollary 1.14: the entire law descends, not just its named coefficients.
The scalar-extension/group-algebra identification is expressed on every coefficient algebra. -/
theorem exists_restrict_coefficients {G : Type u} [Monoid G]
    (D : Determinant A (MonoidAlgebra A G) d) :
    ∃! D₀ : Determinant D.coefficientSubring (MonoidAlgebra D.coefficientSubring G) d,
      ∀ (S : Type u) [CommRing S] [Algebra A S]
        [Algebra D.coefficientSubring S] [IsScalarTower D.coefficientSubring A S]
        (φ : S ⊗[D.coefficientSubring] MonoidAlgebra D.coefficientSubring G →ₐ[S]
          S ⊗[A] MonoidAlgebra A G)
        (hφ : ∀ g : G, φ (1 ⊗ₜ MonoidAlgebra.of D.coefficientSubring G g) =
          1 ⊗ₜ MonoidAlgebra.of A G g)
        (x : S ⊗[D.coefficientSubring] MonoidAlgebra D.coefficientSubring G),
        Algebra.TensorProduct.rid D.coefficientSubring S S (D₀.toLaw.toFun' S x) =
          Algebra.TensorProduct.rid A S S (D.toLaw.toFun' S (φ x)) := sorry

/-- Chenevier, Corollary 1.14: group-word characteristic polynomials determine the entire law. -/
theorem eq_of_charpoly_eq {G : Type u} [Monoid G]
    (D E : Determinant A (MonoidAlgebra A G) d)
    (h : ∀ g : G, D.charpoly (MonoidAlgebra.of A G g) =
      E.charpoly (MonoidAlgebra.of A G g)) : D = E := sorry

end Determinant

end KernelsAndCayleyHamilton

section Continuity

variable {G : Type*} [Group G] [TopologicalSpace G] [TopologicalSpace A] {d : ℕ}

/-- (Chenevier §2.30). A determinant on a topological group is continuous if every
coefficient `g ↦ Λ_i(g)` is continuous. When `A` is a topological ring this is equivalent, by
Amitsur's formula, to continuity of the maps `D^{[α]} : Gⁿ → A`; only a topology on `A` is
assumed here. -/
def Determinant.IsContinuous (D : Determinant A (MonoidAlgebra A G) d) : Prop :=
  ∀ i, Continuous fun g : G ↦ (D.charpoly (MonoidAlgebra.of A G g)).coeff i

/-- (Chenevier, Example 2.31).
Two continuous determinants on a group with Hausdorff coefficients that agree on a dense subgroup
are equal. -/
theorem Determinant.eq_of_eqOn_dense [T2Space A] {D₁ D₂ : Determinant A (MonoidAlgebra A G) d}
    (h₁ : D₁.IsContinuous) (h₂ : D₂.IsContinuous) (H : Subgroup G)
    (hH : Dense (H : Set G))
    (heq : ∀ h ∈ H, D₁.charpoly (MonoidAlgebra.of A G h) = D₂.charpoly (MonoidAlgebra.of A G h)) :
    D₁ = D₂ := sorry

/-- (Chenevier, Lemma 2.33). For discrete `A` and a
profinite `G`, a determinant is continuous iff its kernel contains
`J(H) = ker(A[G] → A[G/H])` for some open normal subgroup `H`. -/
theorem Determinant.isContinuous_iff_exists_openNormal [DiscreteTopology A] [CompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] [IsTopologicalGroup G]
    (D : Determinant A (MonoidAlgebra A G) d) :
    D.IsContinuous ↔ ∃ H : Subgroup G, H.Normal ∧ IsOpen (H : Set G) ∧
      ∀ g : G, ∀ h ∈ H, MonoidAlgebra.of A G g - MonoidAlgebra.of A G (g * h) ∈ D.ker := sorry

end Continuity

end

/-! ## Layer IHG.0: Roby algebras, representability, duals and reduced norms -/

section
open CategoryTheory
universe v
variable {A : Type u} [CommRing A]

/-! The fixed-degree divided-power module reuses Mathlib's raw algebra.
`internalRing` supplies a different multiplication on this same underlying module. -/
namespace DividedPower
variable (A) (M : Type u) [AddCommGroup M] [Module A M]

def degree (d : ℕ) : Submodule A (DividedPowerAlgebra A M) :=
  Submodule.span A {x | ∃ (k : ℕ) (n : Fin k → ℕ) (m : Fin k → M),
    (∑ i, n i) = d ∧ x = ∏ i, DividedPowerAlgebra.dp A (n i) (m i)}
variable {A M}
def gamma (d : ℕ) (m : M) : degree A M d :=
  ⟨DividedPowerAlgebra.dp A d m, sorry⟩
def degree_map {N : Type u} [AddCommGroup N] [Module A N]
    (d : ℕ) (f : M →ₗ[A] N) : degree A M d →ₗ[A] degree A N d := sorry

theorem degree_map_val {N : Type u} [AddCommGroup N] [Module A N]
    (d : ℕ) (f : M →ₗ[A] N) (x : degree A M d) :
    (degree_map d f x).val = DividedPowerAlgebra.map A f x.val := sorry

def universalLaw (d : ℕ) : M →ₚₗ[A] degree A M d := sorry
theorem universalLaw_ground (d : ℕ) (m : M) :
    (universalLaw (A := A) d).ground m = gamma d m := sorry
/-- Universal mixed evaluation; all multidegrees of total degree d occur. -/
theorem universalLaw_mixed (d k : ℕ) (s : Fin k → A) (m : Fin k → M) :
    (universalLaw d).ground (∑ i, s i • m i) =
      ⟨∑ n : Fin k → Fin (d+1), if (∑ i, (n i).val) = d then
        (∏ i, s i ^ (n i).val) • ∏ i, DividedPowerAlgebra.dp A (n i).val (m i) else 0,
        sorry⟩ := sorry

def tensorMap {N : Type u} [AddCommGroup N] [Module A N] (d : ℕ) :
    degree A M d ⊗[A] degree A N d →ₗ[A] degree A (M ⊗[A] N) d := sorry
theorem tensorMap_gamma {N : Type u} [AddCommGroup N] [Module A N]
    (d : ℕ) (m : M) (n : N) : tensorMap d (gamma d m ⊗ₜ gamma d n) =
      gamma d (m ⊗ₜ[A] n) := sorry
theorem tensorMap_naturality {N M' N' : Type u}
    [AddCommGroup N] [Module A N] [AddCommGroup M'] [Module A M']
    [AddCommGroup N'] [Module A N'] (d : ℕ) (f : M →ₗ[A] M') (g : N →ₗ[A] N')
    (x : degree A M d ⊗[A] degree A N d) :
    degree_map d (TensorProduct.map f g) (tensorMap d x) =
      tensorMap d (TensorProduct.map (degree_map d f) (degree_map d g) x) := sorry
/-- Arbitrary scalar extension of the homogeneous piece (Roby, Theorem III.3). -/
def degree_baseChange (d : ℕ) (B : Type u) [CommRing B] [Algebra A B] :
    B ⊗[A] degree A M d ≃ₗ[B] degree B (B ⊗[A] M) d := sorry

theorem degree_baseChange_gamma (d : ℕ) (B : Type u) [CommRing B] [Algebra A B] (m : M) :
    degree_baseChange d B (1 ⊗ₜ[A] gamma d m) = gamma d (1 ⊗ₜ[A] m) := sorry

/-- The base-change map is fixed on mixed divided-power monomials, which span the piece. -/
theorem degree_baseChange_monomial (d : ℕ) (B : Type u) [CommRing B] [Algebra A B]
    (k : ℕ) (e : Fin k → ℕ) (m : Fin k → M) (he : ∑ i, e i = d) :
    (degree_baseChange d B (1 ⊗ₜ[A]
      (⟨∏ i, DividedPowerAlgebra.dp A (e i) (m i), by sorry⟩ : degree A M d))).val =
      ∏ i, DividedPowerAlgebra.dp B (e i) (1 ⊗ₜ[A] m i) := sorry

/-- Scalar-extended universal evaluation on arbitrary finite sums. -/
theorem universalLaw_baseChange (d : ℕ) (B : Type u) [CommRing B] [Algebra A B]
    (x : B ⊗[A] M) :
    degree_baseChange d B ((universalLaw d).toFun' B x) = gamma d x := sorry

/-- Mixed coefficients of the separately homogeneous tensor law (Roby, Proposition IV.9). -/
theorem tensorMap_mixed {N : Type u} [AddCommGroup N] [Module A N]
    (d k l : ℕ) (a : Fin k → ℕ) (b : Fin l → ℕ)
    (ha : ∑ i, a i = d) (hb : ∑ j, b j = d) (m : Fin k → M) (n : Fin l → N) :
    (tensorMap d
      ((⟨∏ i, DividedPowerAlgebra.dp A (a i) (m i), by sorry⟩ : degree A M d) ⊗ₜ[A]
       (⟨∏ j, DividedPowerAlgebra.dp A (b j) (n j), by sorry⟩ : degree A N d))).val =
      ∑ c : Fin k → Fin l → Fin (d+1),
        if (∀ i, ∑ j, (c i j).val = a i) ∧ (∀ j, ∑ i, (c i j).val = b j)
        then ∏ i, ∏ j, DividedPowerAlgebra.dp A (c i j).val (m i ⊗ₜ[A] n j)
        else 0 := sorry

/-- The homogeneous pieces give the full direct-sum grading (Roby, III §§1–2). -/
theorem grading : ∃ e : (DirectSum ℕ (fun d => ↥(degree A M d))) ≃ₗ[A] DividedPowerAlgebra A M,
    ∀ (d : ℕ) (x : degree A M d), e (DirectSum.lof A ℕ (fun d => ↥(degree A M d)) d x) = x.val := sorry

theorem graded_mul (a b : ℕ) (x : degree A M a) (y : degree A M b) :
    x.val * y.val ∈ degree A M (a+b) := sorry

/-- For a free module, divided powers are the symmetric tensors (Roby, Theorem IV.2). -/
theorem symmetricTensor_equiv [Module.Free A M] (d : ℕ) :
    ∃ e : degree A M d ≃ₗ[A]
      ↥(⨅ σ : Equiv.Perm (Fin d), (LinearMap.ker
        ((PiTensorProduct.reindex A (fun _ : Fin d => M) σ).toLinearMap - LinearMap.id) :
          Submodule A (TensorPower A d M))),
      ∀ m : M, (e (gamma d m)).val = PiTensorProduct.tprod A (fun _ : Fin d => m) := sorry

variable {R : Type u} [Ring R] [Algebra A R]
/-- The carrier is Γᵈ(R); multiplication is internal. -/
@[instance_reducible] def internalRing (d : ℕ) : Ring (degree A R d) where
  toAddCommGroup := inferInstance
  mul := sorry
  one := gamma d 1
  natCast n := n • gamma d 1
  intCast z := z • gamma d 1
  natCast_zero := sorry
  natCast_succ := sorry
  intCast_ofNat := sorry
  intCast_negSucc := sorry
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  zero_mul := sorry
  mul_zero := sorry
  left_distrib := sorry
  right_distrib := sorry
attribute [instance] internalRing
@[instance_reducible] def internalAlgebra (d : ℕ) : Algebra A (degree A R d) where
  smul := fun a x => ⟨a • x.val, (degree A R d).smul_mem a x.property⟩
  algebraMap :=
    { toFun := fun a => a • gamma d 1
      map_zero' := sorry
      map_one' := sorry
      map_add' := sorry
      map_mul' := sorry }
  commutes' := sorry
  smul_def' := sorry
attribute [instance] internalAlgebra
theorem internal_mul_gamma (d : ℕ) (x y : R) :
    gamma (A := A) d x * gamma (A := A) d y = gamma (A := A) d (x*y) := sorry
theorem internal_mul (d : ℕ) (x y : degree A R d) :
    x*y = degree_map d (LinearMap.mul' A R) (tensorMap d (x ⊗ₜ[A] y)) := sorry
def multiplicativeLawEquiv (d : ℕ) (S : Type w) [CommRing S] [Algebra A S] :
    (degree A R d →ₐ[A] S) ≃ {f : R →ₚₗ[A] S //
      PolynomialLaw.IsHomogeneousOfDegree d f ∧ PolynomialLaw.IsMultiplicative f} := sorry
theorem multiplicativeLawEquiv_ground (d : ℕ) (S : Type w) [CommRing S] [Algebra A S]
    (f : degree A R d →ₐ[A] S) (r : R) :
    ((multiplicativeLawEquiv d S) f).val.ground r = f (gamma d r) := sorry
/-- The representing equivalence is composition with the entire universal law. -/
theorem multiplicativeLawEquiv_law (d : ℕ) (S : Type w) [CommRing S] [Algebra A S]
    (f : degree A R d →ₐ[A] S) :
    ((multiplicativeLawEquiv d S) f).val =
      (PolynomialLaw.ofLinearMap f.toLinearMap).comp (universalLaw d) := sorry
end DividedPower

namespace Determinant
variable {R : Type u} [Ring R] [Algebra A R] {d : ℕ}

def coordinateRing (A : Type u) [CommRing A] (R : Type u) [Ring R] [Algebra A R]
    (d : ℕ) : CommAlgCat A := sorry
/-- The quotient map from the internal Roby algebra to its abelianization. -/
def coordinateQuotient (d : ℕ) : DividedPower.degree A R d →ₐ[A] coordinateRing A R d := sorry

theorem coordinateQuotient_surjective (d : ℕ) :
    Function.Surjective (coordinateQuotient (A := A) (R := R) d) := sorry

theorem coordinateQuotient_ker (d : ℕ) :
    TwoSidedIdeal.ker (coordinateQuotient (A := A) (R := R) d).toRingHom =
      TwoSidedIdeal.span {z | ∃ x y : DividedPower.degree A R d, z = x*y-y*x} := sorry

def universal (A : Type u) [CommRing A] (R : Type u) [Ring R] [Algebra A R] (d : ℕ) :
    Determinant (coordinateRing A R d) (coordinateRing A R d ⊗[A] R) d := sorry
def coordinateRingEquiv (d : ℕ) (B : Type w) [CommRing B] [Algebra A B] :
    (coordinateRing A R d →ₐ[A] B) ≃ Determinant B (B ⊗[A] R) d := sorry
def coordinateRing_baseChange (d : ℕ) (B : Type u) [CommRing B] [Algebra A B] :
    B ⊗[A] coordinateRing A R d ≃ₐ[B] coordinateRing B (B ⊗[A] R) d := sorry
/-- The representing equivalence is evaluated on the full scalar-extended law,
not only on pure tensors. Chenevier, Proposition 1.6. -/
theorem coordinateRingEquiv_toFun (d : ℕ) (B : Type w) [CommRing B] [Algebra A B]
    (φ : coordinateRing A R d →ₐ[A] B) (S : Type v) [CommRing S]
    [Algebra B S] [Algebra A S] [IsScalarTower A B S] (x : S ⊗[A] R) :
    Algebra.TensorProduct.rid B S S
      ((coordinateRingEquiv d B φ).toLaw.toFun S
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange A B S S R).symm x)) =
    (Algebra.TensorProduct.lift (AlgHom.id A S) (IsScalarTower.toAlgHom A B S)
      (fun x y => Commute.all x (algebraMap B S y)))
      (((DividedPower.multiplicativeLawEquiv d B) (φ.comp (coordinateQuotient d))).val.toFun S x) := sorry

theorem universal_eq (d : ℕ) : universal A R d =
    coordinateRingEquiv d (coordinateRing A R d) (AlgHom.id A _) := sorry

/-- Base change takes the class of every divided-power element to its scalar extension. -/
theorem coordinateRing_baseChange_eval (d : ℕ) (B : Type u) [CommRing B] [Algebra A B]
    (x : DividedPower.degree A R d) :
    coordinateRing_baseChange d B (1 ⊗ₜ[A] coordinateQuotient d x) =
      coordinateQuotient d (DividedPower.degree_baseChange d B (1 ⊗ₜ[A] x)) := sorry

/-- Coefficient naturality, including arbitrary sums of pure tensors. -/
theorem coordinateRingEquiv_natural (d : ℕ) (B : Type w) (S : Type v) [CommRing B] [Algebra A B]
    [CommRing S] [Algebra A S] (φ : coordinateRing A R d →ₐ[A] B) (ψ : B →ₐ[A] S)
    (x : B ⊗[A] R) :
    (coordinateRingEquiv d S (ψ.comp φ)).eval
      (Algebra.TensorProduct.map ψ (AlgHom.id A R) x) =
      ψ ((coordinateRingEquiv d B φ).eval x) := sorry

/-- inversion is an anti-involution. -/
def dual {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) d) :
    Determinant A (MonoidAlgebra A G) d := sorry
/-- Inversion of group elements determines the dual determinant on characteristic polynomials. -/
theorem dual_charpoly_of {G : Type u} [Group G]
    (D : Determinant A (MonoidAlgebra A G) d) (g : G) :
    D.dual.charpoly (MonoidAlgebra.of A G g) =
      D.charpoly (MonoidAlgebra.of A G g⁻¹) := sorry
theorem dual_involutive {G : Type u} [Group G]
    (D : Determinant A (MonoidAlgebra A G) d) : D.dual.dual = D := sorry
theorem dual_charpoly {G : Type u} [Group G]
    (D : Determinant A (MonoidAlgebra A G) d) (g : G) (i : ℕ) (hi : i ≤ d) :
    (D.dual.charpoly (MonoidAlgebra.of A G g)).coeff i *
      (D.charpoly (MonoidAlgebra.of A G g)).coeff 0 =
      (D.charpoly (MonoidAlgebra.of A G g)).coeff (d-i) := sorry
/-- Representation duality is expressed by its transpose-inverse matrix coefficients. -/
theorem dual_ofRepresentation {G : Type u} [Group G]
    (ρ ρdual : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A)
    (hρ : ∀ g : G, ρdual (MonoidAlgebra.of A G g) =
      (ρ (MonoidAlgebra.of A G g⁻¹)).transpose) :
    (ofMatrix ρ).dual = ofMatrix ρdual := sorry
/-- Determinant of the top exterior power. -/
def ofFiniteProjective {V : Type u} [AddCommGroup V] [Module A V]
    [Module.Finite A V] [Module.Projective A V]
    (d : ℕ) (hRank : Module.rankAtStalk (R := A) V = d)
    (ρ : R →ₐ[A] Module.End A V) : Determinant A R d := sorry
theorem ofFiniteProjective_exterior {V : Type u} [AddCommGroup V] [Module A V]
    [Module.Finite A V] [Module.Projective A V] (d : ℕ)
    (hRank : Module.rankAtStalk (R := A) V = d)
    (ρ : R →ₐ[A] Module.End A V) (x : R) :
    exteriorPower.map d (ρ x) = (ofFiniteProjective d hRank ρ).eval x • LinearMap.id := sorry
theorem ofFiniteProjective_basis {V : Type u} [AddCommGroup V] [Module A V]
    [Module.Finite A V] [Module.Projective A V] (b : Module.Basis (Fin d) A V)
    (hRank : Module.rankAtStalk (R := A) V = d)
    (ρ : R →ₐ[A] Module.End A V) (ρmat : R →ₐ[A] Matrix (Fin d) (Fin d) A)
    (hρ : ∀ x, ρmat x = LinearMap.toMatrix b b (ρ x)) :
    ofFiniteProjective d hRank ρ = ofMatrix ρmat := sorry
theorem ofFiniteProjective_baseChange {V : Type u} [AddCommGroup V] [Module A V]
    [Module.Finite A V] [Module.Projective A V] (d : ℕ)
    (hRank : Module.rankAtStalk (R := A) V = d)
    (ρ : R →ₐ[A] Module.End A V) (B : Type u) [CommRing B] [Algebra A B]
    [Module.Finite B (B ⊗[A] V)] [Module.Projective B (B ⊗[A] V)]
    (hRankB : Module.rankAtStalk (R := B) (B ⊗[A] V) = d)
    (ρB : B ⊗[A] R →ₐ[B] Module.End B (B ⊗[A] V))
    (hρB : ∀ x, ρB (1 ⊗ₜ x) = (ρ x).lTensor B) :
    (ofFiniteProjective d hRank ρ).baseChange B = ofFiniteProjective d hRankB ρB := sorry
/-- the integral reduced norm. -/
def ofAzumaya (d : ℕ) [IsAzumaya A R]
    (hd : 0 < d) (hRank : Module.rankAtStalk (R := A) R = (d * d : ℕ)) : Determinant A R d := sorry
theorem ofAzumaya_split (d : ℕ) [IsAzumaya A R]
    (hd : 0 < d) (hRank : Module.rankAtStalk (R := A) R = (d * d : ℕ))
    (φ : R ≃ₐ[A] Matrix (Fin d) (Fin d) A) :
    ofAzumaya d hd hRank = ofMatrix φ.toAlgHom := sorry
theorem ofAzumaya_unique (d : ℕ) [IsAzumaya A R]
    (hd : 0 < d) (hRank : Module.rankAtStalk (R := A) R = (d * d : ℕ))
    (D : Determinant A R d) : D = ofAzumaya d hd hRank := sorry
end Determinant

end

/-! ## Layer IHG.0: invariant coordinate evaluations and reductive pseudocharacters -/

section
open CategoryTheory
variable (O : Type u) [CommRing O]
/-- A represented affine group, with its full Hopf algebra of functions. -/
abbrev InvariantCoordinateInput := CommHopfAlgCat.{u} O

variable {O}
def mergeLast {G : Type u} [Mul G] {n : ℕ} (g : Fin (n+2) → G) : Fin (n+1) → G :=
  fun i ↦ if hi : i.val < n then g ⟨i.val, by omega⟩
    else g ⟨n, by omega⟩ * g ⟨n+1, by omega⟩

namespace InvariantCoordinateInput
/-- The coordinate algebra of the n-fold product, including the terminal scheme at n=0. -/
def tensorCoordinates (C : InvariantCoordinateInput O) : ℕ → CommAlgCat.{u} O
  | 0 => CommAlgCat.of O O
  | n+1 => CommAlgCat.of O (tensorCoordinates C n ⊗[O] C)

/-- Evaluation of regular functions on every coefficient-algebra-valued point tuple. -/
def tensorEvaluate (C : InvariantCoordinateInput O) (n : ℕ)
    {S : Type u} [CommRing S] [Algebra O S]
    (g : Fin n → TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S)) :
    tensorCoordinates C n →ₐ[O] S := sorry

theorem tensorEvaluate_zero (C : InvariantCoordinateInput O)
    {S : Type u} [CommRing S] [Algebra O S] (g : Fin 0 → TauCeti.HopfAlgebra.points
      (H := C) (CommAlgCat.of O S)) (a : O) : tensorEvaluate C 0 g a = algebraMap O S a := sorry

theorem tensorEvaluate_succ (C : InvariantCoordinateInput O) (n : ℕ)
    {S : Type u} [CommRing S] [Algebra O S]
    (g : Fin (n+1) → TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S))
    (a : tensorCoordinates C n) (b : C) :
    tensorEvaluate C (n+1) g (a ⊗ₜ[O] b) =
      tensorEvaluate C n (fun i => g i.castSucc) a * (g (Fin.last n)).ofConv b := sorry

/-- Scheme invariants: conjugation is tested after every coefficient extension. -/
def ring (C : InvariantCoordinateInput O) (n : ℕ) : Subalgebra O (tensorCoordinates C n) where
  carrier := {f | ∀ (S : Type u) [CommRing S] [Algebra O S]
    (p : TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S))
    (g : Fin n → TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S)),
    tensorEvaluate C n (fun i => p * g i * p⁻¹) f = tensorEvaluate C n g f}
  algebraMap_mem' := by sorry
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry

def reindex (C : InvariantCoordinateInput O) {n m : ℕ} (σ : Fin n → Fin m) :
    C.ring n →ₐ[O] C.ring m := sorry
def multiply (C : InvariantCoordinateInput O) (n : ℕ) :
    C.ring (n+1) →ₐ[O] C.ring (n+2) := sorry

theorem reindex_evaluate (C : InvariantCoordinateInput O) {n m : ℕ} (σ : Fin n → Fin m)
    {S : Type u} [CommRing S] [Algebra O S] (f : C.ring n)
    (g : Fin m → TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S)) :
    tensorEvaluate C m g (C.reindex σ f).val = tensorEvaluate C n (g ∘ σ) f.val := sorry

theorem multiply_evaluate (C : InvariantCoordinateInput O) (n : ℕ)
    {S : Type u} [CommRing S] [Algebra O S] (f : C.ring (n+1))
    (g : Fin (n+2) → TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S)) :
    tensorEvaluate C (n+2) g (C.multiply n f).val =
      tensorEvaluate C (n+1) (mergeLast g) f.val := sorry

/-- `tensor_coordinates_zero`: tensor coordinates zero. -/
example (C : InvariantCoordinateInput O) : C.tensorCoordinates 0 = CommAlgCat.of O O := rfl
/-- `tensor_coordinates_one`: tensor coordinates one. -/
example (C : InvariantCoordinateInput O) : C.tensorCoordinates 1 = CommAlgCat.of O (O ⊗[O] C) := rfl
/-- `tensor_coordinates_two`: tensor coordinates two. -/
example (C : InvariantCoordinateInput O) : C.tensorCoordinates 2 = CommAlgCat.of O ((O ⊗[O] C) ⊗[O] C) := rfl
/-- `tensor_evaluate_zero`: tensor evaluate zero. -/
example (C : InvariantCoordinateInput O) {S : Type u} [CommRing S] [Algebra O S]
    (g : Fin 0 → TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S)) (a : O) :
    C.tensorEvaluate 0 g a = algebraMap O S a := sorry
/-- `tensor_evaluate_one`: tensor evaluate one. -/
example (C : InvariantCoordinateInput O) {S : Type u} [CommRing S] [Algebra O S]
    (g : Fin 1 → TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S)) (b : C) :
    C.tensorEvaluate 1 g ((1 : O) ⊗ₜ[O] b) = (g 0).ofConv b := sorry
/-- `tensor_evaluate_two`: tensor evaluate two. -/
example (C : InvariantCoordinateInput O) {S : Type u} [CommRing S] [Algebra O S]
    (g : Fin 2 → TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S)) (b c : C) :
    C.tensorEvaluate 2 g (((1 : O) ⊗ₜ[O] b) ⊗ₜ[O] c) = (g 0).ofConv b * (g 1).ofConv c := sorry
/-- `invariant_ring_zero`: invariant ring zero. -/
example (C : InvariantCoordinateInput O) : C.ring 0 = ⊤ := sorry
/-- `invariant_ring_torus`: invariant ring torus. -/
example (n : ℕ) : ring (TauCeti.GeneralLinear.coordinateHopfAlgebra O 1) n = ⊤ := sorry
/-- `invariant_ring_matrix_nonexample`: invariant ring matrix nonexample. -/
example [Nontrivial O] :
    Algebra.TensorProduct.includeRight (TauCeti.GeneralLinear.genericMatrix O 2 0 0) ∉
      ring (TauCeti.GeneralLinear.coordinateHopfAlgebra O 2) 1 := sorry
/-- `reindex_id`: reindex id. -/
example (C : InvariantCoordinateInput O) (n : ℕ) : C.reindex (id : Fin n → Fin n) = AlgHom.id O _ := sorry
/-- `reindex_swap_twice`: reindex swap twice. -/
example (C : InvariantCoordinateInput O) (f : C.ring 2) :
    C.reindex (Equiv.swap (0 : Fin 2) 1) (C.reindex (Equiv.swap (0 : Fin 2) 1) f) = f := sorry
/-- `reindex_empty_scalar`: reindex empty scalar. -/
example (C : InvariantCoordinateInput O) (a : O) :
    C.reindex (Fin.elim0 : Fin 0 → Fin 1) (algebraMap O (C.ring 0) a) = algebraMap O (C.ring 1) a := sorry
/-- `multiply_pair`: multiply pair. -/
example (C : InvariantCoordinateInput O) {S : Type u} [CommRing S] [Algebra O S]
    (g h : TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S)) (f : C.ring 1) :
    C.tensorEvaluate 2 ![g,h] (C.multiply 0 f).val = C.tensorEvaluate 1 ![g*h] f.val := sorry
/-- `multiply_triple`: multiply triple. -/
example (C : InvariantCoordinateInput O) {S : Type u} [CommRing S] [Algebra O S]
    (g h k : TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O S)) (f : C.ring 2) :
    C.tensorEvaluate 3 ![g,h,k] (C.multiply 1 f).val = C.tensorEvaluate 2 ![g,h*k] f.val := sorry
/-- `multiply_scalar`: multiply scalar. -/
example (C : InvariantCoordinateInput O) (n : ℕ) (a : O) :
    C.multiply n (algebraMap O (C.ring (n+1)) a) = algebraMap O (C.ring (n+2)) a := sorry
/-- `merge_pair`: merge pair. -/
example {G : Type u} [Mul G] (g h : G) : mergeLast ![g,h] = ![g*h] := sorry
/-- `merge_triple`: merge triple. -/
example {G : Type u} [Mul G] (g h k : G) : mergeLast ![g,h,k] = ![g,h*k] := sorry
/-- `merge_unit`: merge unit. -/
example {G : Type u} [Group G] (g : G) : mergeLast ![g,1] = ![g] := sorry
end InvariantCoordinateInput

/-- Evaluation is induced by an actual homomorphism to points of the represented group. -/
structure InvariantEvaluation {O : Type u} [CommRing O]
    (C : InvariantCoordinateInput O) (H : Type u) [Group H]
    (A : Type u) [CommRing A] [Algebra O A] where
  point : H →* TauCeti.HopfAlgebra.points (H := C) (CommAlgCat.of O A)

namespace InvariantEvaluation
variable {O H A : Type u} [CommRing O] [Group H] [CommRing A] [Algebra O A]
    {C : InvariantCoordinateInput O}
def evaluate (E : InvariantEvaluation C H A) (n : ℕ) :
    C.ring n →ₐ[O] ((Fin n → H) → A) :=
  { toFun := fun f g => C.tensorEvaluate n (E.point ∘ g) f.val
    map_zero' := by sorry
    map_one' := by sorry
    map_add' := by sorry
    map_mul' := by sorry
    commutes' := by sorry }
end InvariantEvaluation

namespace InvariantEvaluation
/-- Matrix form of regularity and simultaneous conjugation invariance for `GL_d` over an
algebraically closed field: each evaluated invariant is a polynomial in the entries and the
inverse determinants, invariant under simultaneous conjugation. -/
def IsRegularMatrixInvariant {k : Type u} [Field k] [IsAlgClosed k] {d : ℕ}
    {C : InvariantCoordinateInput k}
    (E : InvariantEvaluation C (Matrix (Fin d) (Fin d) k)ˣ k) : Prop :=
  ∀ n (f : C.ring n),
    (∃ p : MvPolynomial ((Fin n × (Fin d × Fin d)) ⊕ Fin n) k,
      ∀ g : Fin n → (Matrix (Fin d) (Fin d) k)ˣ,
        E.evaluate n f g = MvPolynomial.eval
          (fun v ↦ match v with
            | Sum.inl (i,a,b) => (g i : Matrix (Fin d) (Fin d) k) a b
            | Sum.inr i => Matrix.det (↑((g i)⁻¹) : Matrix (Fin d) (Fin d) k)) p) ∧
    ∀ (P : (Matrix (Fin d) (Fin d) k)ˣ) (g : Fin n → (Matrix (Fin d) (Fin d) k)ˣ),
      E.evaluate n f (fun i ↦ P*g i*P⁻¹) = E.evaluate n f g
end InvariantEvaluation

/-- Compatible evaluations on the actual scheme-invariant coordinate algebras.
Reductive reconstruction additionally requires a reductive represented group. -/
structure ReductivePseudocharacter (G : Type u) [Group G]
    (C : InvariantCoordinateInput O) (A : Type u) [CommRing A] [Algebra O A] where
  theta : ∀ n : ℕ, C.ring n →ₐ[O] (Fin n → G) → A
  reindex_eq : ∀ {n m : ℕ} (σ : Fin n → Fin m) (f : C.ring n) (g : Fin m → G),
    theta m (C.reindex σ f) g = theta n f (g ∘ σ)
  multiply_eq : ∀ (n : ℕ) (f : C.ring (n+1)) (g : Fin (n+2) → G),
    theta (n+2) (C.multiply n f) g = theta (n+1) f (mergeLast g)

namespace ReductivePseudocharacter
variable {G H A B : Type u} [Group G] [Group H] [CommRing A] [Algebra O A]
    [CommRing B] [Algebra O B] (C : InvariantCoordinateInput O)
/-- Pull back compatible invariant evaluation at point tuples along ρ. -/
def ofRepresentation (ρ : G →* H)
    (evaluate : InvariantEvaluation C H A) :
    ReductivePseudocharacter G C A := sorry
theorem ofRepresentation_theta (ρ : G →* H) (evaluate : InvariantEvaluation C H A)
    (n : ℕ) (f : C.ring n) (g : Fin n → G) :
    (ofRepresentation C ρ evaluate).theta n f g = evaluate.evaluate n f (ρ ∘ g) := sorry
theorem ext (Θ Ψ : ReductivePseudocharacter G C A)
    (h : ∀ n (f : C.ring n) (g : Fin n → G), Θ.theta n f g = Ψ.theta n f g) : Θ = Ψ := sorry
def map (Θ : ReductivePseudocharacter G C A) (φ : A →ₐ[O] B) :
    ReductivePseudocharacter G C B := sorry
theorem map_theta (Θ : ReductivePseudocharacter G C A) (φ : A →ₐ[O] B)
    (n : ℕ) (f : C.ring n) (g : Fin n → G) :
    (map C Θ φ).theta n f g = φ (Θ.theta n f g) := sorry

/-- Restriction is separate from coefficient change. -/
def restrict {G' : Type u} [Group G'] (Θ : ReductivePseudocharacter G C A) (φ : G' →* G) :
    ReductivePseudocharacter G' C A := sorry

theorem restrict_theta {G' : Type u} [Group G'] (Θ : ReductivePseudocharacter G C A)
    (φ : G' →* G) (n : ℕ) (f : C.ring n) (g : Fin n → G') :
    (restrict C Θ φ).theta n f g = Θ.theta n f (φ ∘ g) := sorry

def IsContinuous [TopologicalSpace G] [TopologicalSpace A]
    (Θ : ReductivePseudocharacter G C A) : Prop :=
  ∀ n (f : C.ring n), Continuous (Θ.theta n f)
theorem continuous_ofRepresentation [TopologicalSpace G] [TopologicalSpace H]
    [TopologicalSpace A] (ρ : G →* H) (hρ : Continuous ρ)
    (evaluate : InvariantEvaluation C H A)
    (heval : ∀ n (f : C.ring n), Continuous (evaluate.evaluate n f)) :
    (ofRepresentation C ρ evaluate).IsContinuous := sorry
theorem continuous_dense_ext [TopologicalSpace G] [TopologicalSpace A] [T2Space A]
    (Θ Ψ : ReductivePseudocharacter G C A) (hΘ : Θ.IsContinuous) (hΨ : Ψ.IsContinuous)
    (S : Subgroup G) (hS : Dense (S : Set G))
    (heq : ∀ n (f : C.ring n) (g : Fin n → S),
      Θ.theta n f (fun i ↦ g i) = Ψ.theta n f (fun i ↦ g i)) : Θ = Ψ := sorry

def kernel (Θ : ReductivePseudocharacter G C A) : Subgroup G where
  carrier := {δ | ∀ n (f : C.ring n) (g : Fin n → G) (i : Fin n),
    Θ.theta n f (Function.update g i (g i * δ)) = Θ.theta n f g}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry
theorem kernel_mem (Θ : ReductivePseudocharacter G C A) (δ : G) :
    δ ∈ kernel C Θ ↔ ∀ n (f : C.ring n) (g : Fin n → G) (i : Fin n),
      Θ.theta n f (Function.update g i (g i * δ)) = Θ.theta n f g := sorry
instance kernel_normal (Θ : ReductivePseudocharacter G C A) : (kernel C Θ).Normal := sorry
def quotient (Θ : ReductivePseudocharacter G C A) (Δ : Subgroup G) [Δ.Normal]
    (hΔ : Δ ≤ kernel C Θ) : ReductivePseudocharacter (G ⧸ Δ) C A := sorry

theorem quotient_theta (Θ : ReductivePseudocharacter G C A) (Δ : Subgroup G) [Δ.Normal]
    (hΔ : Δ ≤ kernel C Θ) (n : ℕ) (f : C.ring n) (g : Fin n → G) :
    (quotient C Θ Δ hΔ).theta n f (fun i => QuotientGroup.mk (g i)) = Θ.theta n f g := sorry

def universalRing (G : Type u) [Group G] (C : InvariantCoordinateInput O) : CommAlgCat O := sorry
def universalRing_equiv : (universalRing G C →ₐ[O] A) ≃ ReductivePseudocharacter G C A := sorry

/-- Naturality makes the identity map correspond to the universal compatible evaluation.
Quast, Theorem 3.20; no reductivity is used in the generators-and-relations argument. -/
theorem universalRing_equiv_natural (φ : universalRing G C →ₐ[O] A) (ψ : A →ₐ[O] B) :
    universalRing_equiv C (ψ.comp φ) = map C (universalRing_equiv C φ) ψ := sorry

theorem universalRing_generated :
    Algebra.adjoin O {a : universalRing G C | ∃ (n : ℕ) (f : C.ring n) (g : Fin n → G),
      a = (universalRing_equiv C (AlgHom.id O (universalRing G C))).theta n f g} = ⊤ := sorry


section UntwistedExcursions
open CategoryTheory
open TauCetiRoadmap.SmoothRepresentationsOfLocalGroups
variable {O G : Type} [CommRing O] [Group G] (C : InvariantCoordinateInput O)

/-- Trivial-action free cocycles are tuples of points, with simultaneous conjugation.
Quast §3.1, pp.10–11 and §3.6–3.7, pp.19–20; SR.6.3's invariant-word colimit. -/
def untwistedFreeCoordinates (n : ℕ) : C.ring n ≃ₐ[O]
    CocycleScheme.invariants C (1 : FreeGroup (Fin n) →* Aut C) := sorry

/-- The coordinate comparison is fixed on points over every coefficient algebra. -/
theorem untwistedFreeCoordinates_evaluate (n : ℕ) {S : Type} [CommRing S] [Algebra O S]
    (c : CocycleScheme.coordinateRing C (1 : FreeGroup (Fin n) →* Aut C) →ₐ[O] S)
    (f : C.ring n) :
    c (untwistedFreeCoordinates C n f).val = C.tensorEvaluate n
      (fun i => (CocycleScheme.points C 1 S c).value (FreeGroup.of i)) f.val := sorry

/-- The common untwisted colimit, with SR owning the generic word-colimit construction.
Quast Theorem 3.20 and SR.6.3 `ExcursionAlgebra.algebra_universal`. -/
def excursionEquiv : ExcursionAlgebra.algebra C (1 : G →* Aut C) ≃ₐ[O]
    universalRing G C := sorry

theorem excursionEquiv_generator (n : ℕ) (g : Fin n → G) (f : C.ring n) :
    excursionEquiv C (ExcursionAlgebra.generator C (1 : G →* Aut C) n g
      (untwistedFreeCoordinates C n f)) =
      (universalRing_equiv C (AlgHom.id O (universalRing G C))).theta n f g := sorry

/-- Evaluation and coefficient postcomposition commute with the comparison. -/
theorem excursionEquiv_evaluate {S : Type} [CommRing S] [Algebra O S]
    (φ : universalRing G C →ₐ[O] S) (n : ℕ) (g : Fin n → G) (f : C.ring n) :
    (φ.comp (excursionEquiv C).toAlgHom)
      (ExcursionAlgebra.generator C (1 : G →* Aut C) n g
        (untwistedFreeCoordinates C n f)) =
      (universalRing_equiv C φ).theta n f g := sorry

/-- `untwistedFreeCoordinates_empty`: the empty tuple preserves a scalar. -/
example : untwistedFreeCoordinates C 0 (algebraMap O _ 7) = algebraMap O _ 7 := by simp
/-- `untwistedFreeCoordinates_single`: one generator evaluates at its actual point. -/
example {S : Type} [CommRing S] [Algebra O S]
    (c : CocycleScheme.coordinateRing C (1 : FreeGroup (Fin 1) →* Aut C) →ₐ[O] S)
    (f : C.ring 1) :
    c (untwistedFreeCoordinates C 1 f).val = C.tensorEvaluate 1
      ![(CocycleScheme.points C 1 S c).value (FreeGroup.of 0)] f.val := sorry
/-- `untwistedFreeCoordinates_swap`: two coordinates are simultaneously reindexed. -/
example {S : Type} [CommRing S] [Algebra O S]
    (c : CocycleScheme.coordinateRing C (1 : FreeGroup (Fin 2) →* Aut C) →ₐ[O] S)
    (f : C.ring 2) :
    c (untwistedFreeCoordinates C 2 (C.reindex (Equiv.swap (0 : Fin 2) 1) f)).val =
      C.tensorEvaluate 2
        ![(CocycleScheme.points C 1 S c).value (FreeGroup.of 1),
          (CocycleScheme.points C 1 S c).value (FreeGroup.of 0)] f.val := sorry

/-- `excursionEquiv_scalar`: the colimit comparison preserves the coefficient seven. -/
example : excursionEquiv (G := G) C (algebraMap O _ 7) = algebraMap O _ 7 := by simp
/-- `excursionEquiv_empty`: the empty excursion is the same scalar generator. -/
example : excursionEquiv (G := G) C
    (ExcursionAlgebra.generator C (1 : G →* Aut C) 0 Fin.elim0
      (untwistedFreeCoordinates C 0 (algebraMap O _ 1))) = 1 := by simp
/-- `excursionEquiv_product_word`: multiplication of source elements is word substitution. -/
example (g h : G) (f : C.ring 1) :
    excursionEquiv C (ExcursionAlgebra.generator C (1 : G →* Aut C) 2 ![g,h]
      (untwistedFreeCoordinates C 2 (C.multiply 0 f))) =
    (universalRing_equiv C (AlgHom.id O (universalRing G C))).theta 1 f ![g*h] := sorry

end UntwistedExcursions

end ReductivePseudocharacter
end

namespace LayerZeroChecks


/-- `matrix_empty`: rank zero has value one, polynomial one, trace zero and CH law one. -/
example :
    let D := Determinant.ofMatrix (Algebra.ofId ℤ (Matrix (Fin 0) (Fin 0) ℤ))
    D.eval 0 = 1 ∧ D.charpoly 0 = 1 ∧ D.traceLinear 0 = 0 ∧
      D.charpolyLaw.ground 0 = 1 ∧ D.chIdeal = ⊤ ∧ ¬ D.IsCayleyHamilton := sorry

/-- `matrix_one`: in rank one at -3 the polynomial is X+3 and its trace is -3. -/
example :
    let D := Determinant.ofMatrix (Algebra.ofId ℤ (Matrix (Fin 1) (Fin 1) ℤ))
    D.eval (-3) = -3 ∧ D.charpoly (-3) = X + 3 ∧ D.traceLinear (-3) = -3 ∧
      D.charpolyLaw.ground (-3) = 0 ∧ D.chIdeal = ⊥ ∧ D.IsCayleyHamilton := sorry

/-- `matrix_two`: the two-term sign is ad-bc; the trace coefficient has a minus sign. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id ℤ (Matrix (Fin 2) (Fin 2) ℤ))
    D.eval !![2,3;4,5] = -2 ∧ D.charpoly !![2,3;4,5] = X^2 - 7*X - 2 ∧
      D.traceLinear !![2,3;4,5] = 7 ∧ D.charpolyLaw.ground !![2,3;4,5] = 0 ∧
      D.chIdeal = ⊥ ∧ D.IsCayleyHamilton := sorry

/-- `linear_double`: scalar extension of multiplication by two sends 3 to 6. -/
example : (PolynomialLaw.ofLinearMap (2 • (LinearMap.id : ℤ →ₗ[ℤ] ℤ))).ground 3 = 6 := sorry

/-- `product_two`: the product of two identity characters at 3 has value 9 and trace 6. -/
example :
    let D := Determinant.dimOneEquiv.symm (AlgHom.id ℤ ℤ)
    (D.mul D).eval 3 = 9 ∧ (D.mul D).charpoly 3 = X^2 - 6*X + 9 ∧
      (D.mul D).trace 3 = 6 := sorry

/-- `product_zero`: a zero eigenvalue kills the determinant but retains the other trace. -/
example :
    let D := (Determinant.dimOneEquiv.symm (AlgHom.fst ℤ ℤ ℤ)).mul
      (Determinant.dimOneEquiv.symm (AlgHom.snd ℤ ℤ ℤ))
    D.eval (0,3) = 0 ∧ D.charpoly (0,3) = X^2 - 3*X ∧ D.trace (0,3) = 3 := sorry

/-- `restriction_eval_two`: pulling evaluation at two back from Z[X] sends X to two. -/
example :
    let D := Determinant.dimOneEquiv.symm (AlgHom.id ℤ ℤ)
    (D.comap (Polynomial.aeval (2 : ℤ))).eval X = 2 := sorry

/-- `restriction_eval_zero`: evaluation at zero kills X but preserves the unit. -/
example :
    let D := Determinant.dimOneEquiv.symm (AlgHom.id ℤ ℤ)
    (D.comap (Polynomial.aeval (0 : ℤ))).eval X = 0 ∧
      (D.comap (Polynomial.aeval (0 : ℤ))).eval 1 = 1 := sorry

/-- `base_change_mod_two`: reduction sends the integral scalar determinant 2 to zero. -/
example :
    let D := Determinant.dimOneEquiv.symm (AlgHom.id ℤ ℤ)
    (D.baseChange (ZMod 2)).eval (1 ⊗ₜ[ℤ] (2 : ℤ)) = 0 := sorry

/-- `base_change_rational`: rational extension retains the off-diagonal determinant sign. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id ℤ (Matrix (Fin 2) (Fin 2) ℤ))
    (D.baseChange ℚ).eval (1 ⊗ₜ[ℤ] !![2,3;4,5]) = -2 := sorry

/-- `base_change_empty`: the degree-zero determinant stays one even at zero. -/
example :
    let D := Determinant.ofMatrix (Algebra.ofId ℤ (Matrix (Fin 0) (Fin 0) ℤ))
    (D.baseChange (ZMod 2)).eval 0 = 1 := sorry

/-- `gamma_zero`: gamma_0(0) is one, not zero. -/
example : (DividedPower.gamma (A := ℤ) 0 (0 : ℤ)).val = 1 := sorry
/-- `gamma_one`: gamma_1(2) is twice gamma_1(1). -/
example : DividedPower.gamma (A := ℤ) 1 (2 : ℤ) = 2 • DividedPower.gamma 1 (1 : ℤ) := sorry
/-- `gamma_two`: gamma_2(2) is four times gamma_2(1). -/
example : DividedPower.gamma (A := ℤ) 2 (2 : ℤ) = 4 • DividedPower.gamma 2 (1 : ℤ) := sorry

/-- `degree_base_zero`: scalar extension preserves the degree-zero generator. -/
example : DividedPower.degree_baseChange (A := ℤ) 0 (ZMod 2)
    (1 ⊗ₜ[ℤ] DividedPower.gamma 0 (0 : ℤ)) = 1 := sorry
/-- `degree_base_one`: the degree-one generator remains nonzero modulo two. -/
example : DividedPower.degree_baseChange (A := ℤ) 1 (ZMod 2)
    (1 ⊗ₜ[ℤ] DividedPower.gamma 1 (1 : ℤ)) ≠ 0 := sorry
/-- `degree_base_two`: nonflat reduction kills gamma_2(2). -/
example : DividedPower.degree_baseChange (A := ℤ) 2 (ZMod 2)
    (1 ⊗ₜ[ℤ] DividedPower.gamma 2 (2 : ℤ)) = 0 := sorry

/-- `coordinate_zero`: the universal scalar law of degree zero is one. -/
example :
    letI : Module ℤ (Determinant.coordinateRing ℤ ℤ 0) := Algebra.toModule

    Determinant.coordinateQuotient (A := ℤ) 0 (DividedPower.gamma 0 (0 : ℤ)) = 1 ∧
    (Determinant.universal ℤ ℤ 0).eval 0 = 1 ∧
    ∀ φ : Determinant.coordinateRing ℤ ℤ 0 →ₐ[ℤ] ℚ,
      (Determinant.coordinateRingEquiv 0 ℚ φ).eval 0 = 1 := sorry
/-- `coordinate_one`: the universal scalar law takes 3 to 3 in degree one. -/
example :
    letI : Module ℤ (Determinant.coordinateRing ℤ ℤ 1) := Algebra.toModule

    Determinant.coordinateQuotient (A := ℤ) 1 (DividedPower.gamma 1 (3 : ℤ)) = 3 ∧
    (Determinant.universal ℤ ℤ 1).eval (1 ⊗ₜ[ℤ] (3 : ℤ)) = 3 ∧
    ∀ φ : Determinant.coordinateRing ℤ ℤ 1 →ₐ[ℤ] ℚ,
      (Determinant.coordinateRingEquiv 1 ℚ φ).eval (1 ⊗ₜ[ℤ] (3 : ℤ)) = 3 := sorry
/-- `coordinate_two`: the universal scalar law takes 3 to 9 in degree two. -/
example :
    letI : Module ℤ (Determinant.coordinateRing ℤ ℤ 2) := Algebra.toModule

    Determinant.coordinateQuotient (A := ℤ) 2 (DividedPower.gamma 2 (3 : ℤ)) = 9 ∧
    (Determinant.universal ℤ ℤ 2).eval (1 ⊗ₜ[ℤ] (3 : ℤ)) = 9 ∧
    ∀ φ : Determinant.coordinateRing ℤ ℤ 2 →ₐ[ℤ] ℚ,
      (Determinant.coordinateRingEquiv 2 ℚ φ).eval (1 ⊗ₜ[ℤ] (3 : ℤ)) = 9 := sorry

/-- `coordinate_base_zero`: the degree-zero class remains the unit after reduction. -/
example :
    letI : Module ℤ (Determinant.coordinateRing ℤ ℤ 0) := Algebra.toModule
    Determinant.coordinateRing_baseChange (A := ℤ) (R := ℤ) 0 (ZMod 2)
    (1 ⊗ₜ[ℤ] Determinant.coordinateQuotient 0 (DividedPower.gamma 0 (0 : ℤ))) = 1 := sorry
/-- `coordinate_base_one`: the degree-one class of two vanishes after reduction. -/
example :
    letI : Module ℤ (Determinant.coordinateRing ℤ ℤ 1) := Algebra.toModule
    Determinant.coordinateRing_baseChange (A := ℤ) (R := ℤ) 1 (ZMod 2)
    (1 ⊗ₜ[ℤ] Determinant.coordinateQuotient 1 (DividedPower.gamma 1 (2 : ℤ))) = 0 := sorry
/-- `coordinate_base_two`: rational extension retains the square value nine. -/
example :
    letI : Module ℤ (Determinant.coordinateRing ℤ ℤ 2) := Algebra.toModule
    Determinant.coordinateRing_baseChange (A := ℤ) (R := ℤ) 2 ℚ
    (1 ⊗ₜ[ℤ] Determinant.coordinateQuotient 2 (DividedPower.gamma 2 (3 : ℤ))) = 9 := sorry

/-- `newton_two`: 2 det(M) = tr(M)^2-tr(M^2), without dividing by two. -/
example :
    let M : Matrix (Fin 2) (Fin 2) ℤ := !![2,3;4,5]
    2*M.det = M.trace^2 - (M^2).trace ∧ M.det = -2 := by
  norm_num [pow_two, Matrix.det_fin_two, Matrix.trace, Matrix.mul_apply, Fin.sum_univ_two]

/-- `ordered_products`: a two-coordinate invariant detects reversal of the last product. -/
example :
    let x : Matrix (Fin 2) (Fin 2) ℤ := !![2,0;0,1]
    let g : Matrix (Fin 2) (Fin 2) ℤ := !![1,1;0,1]
    let h : Matrix (Fin 2) (Fin 2) ℤ := !![1,0;1,1]
    (x * (mergeLast ![x,g,h] 1)).trace = 5 ∧ (x*(h*g)).trace = 4 := by
  norm_num [mergeLast, Matrix.trace, Matrix.mul_apply, Fin.sum_univ_two]

/-- `three_cycle`: reindexing a tuple is precomposition, distinguished from its inverse. -/
example :
    let σ : Equiv.Perm (Fin 3) := Equiv.swap 0 1 * Equiv.swap 1 2
    (![2,3,5] ∘ σ : Fin 3 → ℤ) = ![3,5,2] ∧
      (![2,3,5] ∘ (fun i => σ.symm i) : Fin 3 → ℤ) = ![5,2,3] := by decide

/-- `cycle_order`: changing the cycle starting point reverses a noncommuting pair. -/
example :
    let x : Fin 2 → Matrix (Fin 2) (Fin 2) ℤ := ![!![0,1;0,0], !![0,0;1,0]]
    cycleProduct (Equiv.swap 0 1) x 0 = !![1,0;0,0] ∧
      cycleProduct (Equiv.swap 0 1) x 1 = !![0,0;0,1] := sorry

/-- `cycle_sign`: the two-permutation sum is T(x)T(y)-T(xy). -/
example :
    let T : ℤ → ℤ := id
    cycleTerm T (1 : Equiv.Perm (Fin 2)) ![2,3] = 6 ∧
      cycleTerm T (Equiv.swap 0 1) ![2,3] = 6 ∧
      (∑ σ : Equiv.Perm (Fin 2), (Equiv.Perm.sign σ : ℤ) * cycleTerm T σ ![2,3]) = 0 := sorry

/-- `regular_trivial`: the constant identity-point evaluation is regular in every rank. -/
example {k : Type u} [Field k] [IsAlgClosed k] (C : InvariantCoordinateInput k) (d : ℕ) :
    (InvariantEvaluation.IsRegularMatrixInvariant
      (⟨1⟩ : InvariantEvaluation C (Matrix (Fin d) (Fin d) k)ˣ k)) := sorry

/-- `regular_standard`: actual GL points give regular invariant evaluation. -/
example {k : Type u} [Field k] [IsAlgClosed k] (d : ℕ)
    (E : InvariantEvaluation (TauCeti.GeneralLinear.coordinateHopfAlgebra k d)
      (Matrix (Fin d) (Fin d) k)ˣ k)
    (hE : ∀ g i j, (E.point g).ofConv (TauCeti.GeneralLinear.genericMatrix k d i j) =
      (g : Matrix (Fin d) (Fin d) k) i j) : E.IsRegularMatrixInvariant := sorry

/-- `regular_conjugation_not`: complex conjugation on GL1 points is not algebraic regularity. -/
example (E : InvariantEvaluation (TauCeti.GeneralLinear.coordinateHopfAlgebra ℂ 1)
      (Matrix (Fin 1) (Fin 1) ℂ)ˣ ℂ)
    (hE : ∀ g, (E.point g).ofConv (TauCeti.GeneralLinear.genericMatrix ℂ 1 0 0) =
      star ((g : Matrix (Fin 1) (Fin 1) ℂ) 0 0)) : ¬ E.IsRegularMatrixInvariant := sorry

end LayerZeroChecks

namespace LayerZeroChecks


/-- `evaluation_identity`: an identity tuple evaluates each tensor factor at the counit. -/
example {O A : Type u} [CommRing O] [CommRing A] [Algebra O A]
    (C : InvariantCoordinateInput O) :
    let E : InvariantEvaluation C PUnit.{u+1} A := ⟨1⟩
    ∀ (b c : C) (h : ((1 : O) ⊗ₜ[O] b) ⊗ₜ[O] c ∈ C.ring 2),
      E.evaluate 2 ⟨((1 : O) ⊗ₜ[O] b) ⊗ₜ[O] c, h⟩ ![1,1] =
        algebraMap O A (Coalgebra.counit b) * algebraMap O A (Coalgebra.counit c) := sorry

/-- `evaluation_scalar`: scalar three is evaluated as three in arity zero. -/
example {H : Type} [Group H] (C : InvariantCoordinateInput ℤ)
    (E : InvariantEvaluation C H ℚ) : E.evaluate 0 (algebraMap ℤ (C.ring 0) 3) Fin.elim0 = 3 := sorry

/-- `evaluation_reduce_two`: scalar two evaluates to zero after reduction to F2. -/
example {H : Type} [Group H] (C : InvariantCoordinateInput ℤ)
    (E : InvariantEvaluation C H (ZMod 2)) (g : Fin 2 → H) :
    E.evaluate 2 (algebraMap ℤ (C.ring 2) 2) g = 0 := sorry

/-- `universal_pseudo_scalar`: specialization to Q preserves the scalar three. -/
example {G : Type} [Group G] (C : InvariantCoordinateInput ℤ)
    (φ : ReductivePseudocharacter.universalRing G C →ₐ[ℤ] ℚ) :
    (ReductivePseudocharacter.universalRing_equiv C φ).theta 0
      (algebraMap ℤ (C.ring 0) 3) Fin.elim0 = 3 := sorry

/-- `universal_pseudo_reduction`: specialization to F2 kills scalar two at a two-term tuple. -/
example {G : Type} [Group G] (C : InvariantCoordinateInput ℤ)
    (φ : ReductivePseudocharacter.universalRing G C →ₐ[ℤ] ZMod 2) (g : Fin 2 → G) :
    (ReductivePseudocharacter.universalRing_equiv C φ).theta 2
      (algebraMap ℤ (C.ring 2) 2) g = 0 := sorry

/-- `universal_pseudo_separates`: distinct homomorphisms differ on a universal evaluation. -/
example {O A G : Type u} [CommRing O] [CommRing A] [Algebra O A] [Group G]
    (C : InvariantCoordinateInput O)
    (φ ψ : ReductivePseudocharacter.universalRing G C →ₐ[O] A) (h : φ ≠ ψ) :
    ∃ (n : ℕ) (f : C.ring n) (g : Fin n → G),
      (ReductivePseudocharacter.universalRing_equiv C φ).theta n f g ≠
      (ReductivePseudocharacter.universalRing_equiv C ψ).theta n f g := sorry

/-- `quotient_bottom`: descent by the trivial subgroup retains every value. -/
example {O A G : Type u} [CommRing O] [CommRing A] [Algebra O A] [Group G]
    (C : InvariantCoordinateInput O) (Θ : ReductivePseudocharacter G C A)
    (n : ℕ) (f : C.ring n) (g : Fin n → G) :
    (ReductivePseudocharacter.quotient C Θ ⊥ bot_le).theta n f
      (fun i => QuotientGroup.mk (g i)) = Θ.theta n f g := sorry

/-- `quotient_trivial`: the trivial representation descends to the one-element quotient. -/
example {O A G : Type u} [CommRing O] [CommRing A] [Algebra O A] [Group G]
    (C : InvariantCoordinateInput O) (n : ℕ) (f : C.ring n) (g : Fin n → G) :
    let E : InvariantEvaluation C G A := ⟨1⟩
    let Θ := ReductivePseudocharacter.ofRepresentation C (MonoidHom.id G) E
    ∃ h : (⊤ : Subgroup G) ≤ ReductivePseudocharacter.kernel C Θ,
      (ReductivePseudocharacter.quotient C Θ ⊤ h).theta n f
        (fun i => QuotientGroup.mk (g i)) = E.evaluate n f (fun _ => 1) := sorry

/-- `quotient_obstruction`: a coordinate that distinguishes gδ from g prevents descent. -/
example {O A G : Type u} [CommRing O] [CommRing A] [Algebra O A] [Group G]
    (C : InvariantCoordinateInput O) (Θ : ReductivePseudocharacter G C A)
    (Δ : Subgroup G) [Δ.Normal] (δ : G) (hδ : δ ∈ Δ)
    (f : C.ring 1) (g : G)
    (h : Θ.theta 1 f ![g*δ] ≠ Θ.theta 1 f ![g]) :
    ¬ ∃ Ψ : ReductivePseudocharacter (G ⧸ Δ) C A,
      ReductivePseudocharacter.restrict C Ψ (QuotientGroup.mk' Δ) = Θ := sorry

/-- `degree_two_rank`: the quadratic piece on two free generators has rank three. -/
example : Module.finrank ℚ (DividedPower.degree ℚ (Fin 2 → ℚ) 2) = 3 := sorry

/-- `map_identity`: coefficient change by the identity preserves a pseudocharacter. -/
example {O A G : Type u} [CommRing O] [CommRing A] [Algebra O A] [Group G]
    (C : InvariantCoordinateInput O) (Θ : ReductivePseudocharacter G C A) :
    ReductivePseudocharacter.map C Θ (AlgHom.id O A) = Θ := sorry

/-- `map_reduction`: an integral invariant value two becomes zero in F2. -/
example {G : Type} [Group G] (C : InvariantCoordinateInput ℤ)
    (Θ : ReductivePseudocharacter G C ℤ) (n : ℕ) (f : C.ring n) (g : Fin n → G)
    (h : Θ.theta n f g = 2) :
    (ReductivePseudocharacter.map C Θ (Algebra.ofId ℤ (ZMod 2))).theta n f g = 0 := sorry

/-- `map_extension`: an integral invariant value minus three stays minus three in Q. -/
example {G : Type} [Group G] (C : InvariantCoordinateInput ℤ)
    (Θ : ReductivePseudocharacter G C ℤ) (n : ℕ) (f : C.ring n) (g : Fin n → G)
    (h : Θ.theta n f g = -3) :
    (ReductivePseudocharacter.map C Θ (Algebra.ofId ℤ ℚ)).theta n f g = -3 := sorry

/-- `coefficient_dyadic`: a nonintegral coefficient is retained, without adjoining 1/3. -/
example :
    let χ : Multiplicative ℕ →* ℚ :=
      { toFun := fun n => (1/2 : ℚ) ^ Multiplicative.toAdd n
        map_one' := by norm_num
        map_mul' := by intros; exact pow_add _ _ _ }
    let D := Determinant.dimOneEquiv.symm (MonoidAlgebra.lift ℚ ℚ (Multiplicative ℕ) χ)
    (1/2 : ℚ) ∈ D.coefficientSubring ∧ (1/3 : ℚ) ∉ D.coefficientSubring := sorry

/-- `dimension_two_diagonal`: the ordered pair is determinant 6, trace 5. -/
example {G : Type} [Group G]
    (ρ : MonoidAlgebra ℚ G →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ) (g : G)
    (hg : ρ (MonoidAlgebra.of ℚ G g) = !![2,0;0,3]) :
    let p := (dimTwoEquiv (A := ℚ) G (Determinant.ofMatrix ρ)).val
    (p.1 g : ℚ) = 6 ∧ p.2 g = 5 := sorry

/-- `dimension_two_swap`: an odd permutation gives determinant -1 and trace zero. -/
example {G : Type} [Group G]
    (ρ : MonoidAlgebra ℚ G →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ) (g : G)
    (hg : ρ (MonoidAlgebra.of ℚ G g) = !![0,1;1,0]) :
    let p := (dimTwoEquiv (A := ℚ) G (Determinant.ofMatrix ρ)).val
    (p.1 g : ℚ) = -1 ∧ p.2 g = 0 := sorry

/-- `universal_torus_two`: specialization of the universal coordinate at a point of value 2. -/
example {G : Type} [Group G]
    (E : InvariantEvaluation (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) G ℚ)
    (g : G) (hg : (E.point g).ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 2) :
    let C := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let f : InvariantCoordinateInput.ring C 1 := ⟨Algebra.TensorProduct.includeRight
      (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0), by sorry⟩
    let φ := (ReductivePseudocharacter.universalRing_equiv C).symm
      (ReductivePseudocharacter.ofRepresentation C (MonoidHom.id G) E)
    φ ((ReductivePseudocharacter.universalRing_equiv C (AlgHom.id ℚ _)).theta 1 f ![g]) = 2 := sorry

/-- `universal_torus_negative`: a negative coordinate retains its sign under specialization. -/
example {G : Type} [Group G]
    (E : InvariantEvaluation (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) G ℚ)
    (g : G) (hg : (E.point g).ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = -3) :
    let C := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let f : InvariantCoordinateInput.ring C 1 := ⟨Algebra.TensorProduct.includeRight
      (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0), by sorry⟩
    let φ := (ReductivePseudocharacter.universalRing_equiv C).symm
      (ReductivePseudocharacter.ofRepresentation C (MonoidHom.id G) E)
    φ ((ReductivePseudocharacter.universalRing_equiv C (AlgHom.id ℚ _)).theta 1 f ![g]) = -3 := sorry

/-- `universal_torus_identity`: the universal torus coordinate at the identity specializes to 1. -/
example {G : Type} [Group G]
    (E : InvariantEvaluation (TauCeti.GeneralLinear.coordinateHopfAlgebra (ZMod 2) 1) G (ZMod 2)) :
    let C := TauCeti.GeneralLinear.coordinateHopfAlgebra (ZMod 2) 1
    let f : InvariantCoordinateInput.ring C 1 := ⟨Algebra.TensorProduct.includeRight
      (TauCeti.GeneralLinear.genericMatrix (ZMod 2) 1 0 0), by sorry⟩
    let φ := (ReductivePseudocharacter.universalRing_equiv C).symm
      (ReductivePseudocharacter.ofRepresentation C (MonoidHom.id G) E)
    φ ((ReductivePseudocharacter.universalRing_equiv C (AlgHom.id (ZMod 2) _)).theta 1 f ![1]) = 1 := sorry

/-- `dual_diagonal`: the two roots 2,3 become 1/2,1/3. -/
example {G : Type} [Group G]
    (ρ : MonoidAlgebra ℚ G →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ) (g : G)
    (hg : ρ (MonoidAlgebra.of ℚ G g) = !![2,0;0,3]) :
    (Determinant.ofMatrix ρ).dual.charpoly (MonoidAlgebra.of ℚ G g) =
      X^2 - C (5/6)*X + C (1/6) := sorry

/-- `coordinates_rank_zero`: the coordinate module at arity zero has dimension one. -/
example : Module.finrank ℚ
    (InvariantCoordinateInput.tensorCoordinates (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) 0) = 1 := sorry

/-- `coordinates_torus_variable`: the torus variable is not idempotent. -/
example :
    let C := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let t : InvariantCoordinateInput.tensorCoordinates C 1 :=
      (1 : ℚ) ⊗ₜ[ℚ] TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0
    t*t ≠ t := sorry

/-- `coordinates_two_distinct`: coordinates on different torus factors are independent. -/
example :
    let C := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let t := TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0
    ((((1 : ℚ) ⊗ₜ[ℚ] t) ⊗ₜ[ℚ] (1 : C)) :
      InvariantCoordinateInput.tensorCoordinates C 2) ≠
      (((1 : ℚ) ⊗ₜ[ℚ] (1 : C)) ⊗ₜ[ℚ] t) := sorry

/-- `tensor_value_scalar`: arity-zero evaluation sends the rational scalar 3 to 3. -/
example : InvariantCoordinateInput.tensorEvaluate
    (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) 0
    (S := ℚ) Fin.elim0 3 = 3 := sorry

/-- `tensor_value_square`: a point with torus coordinate 2 evaluates its square to 4. -/
example (g : TauCeti.HopfAlgebra.points
    (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) (CommAlgCat.of ℚ ℚ))
    (hg : g.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 2) :
    InvariantCoordinateInput.tensorEvaluate (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1)
      1 ![g] ((1 : ℚ) ⊗ₜ[ℚ] (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0)^2) = 4 := sorry

/-- `tensor_value_product`: the two torus coordinates 2,3 evaluate their tensor to 6. -/
example (g h : TauCeti.HopfAlgebra.points
    (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) (CommAlgCat.of ℚ ℚ))
    (hg : g.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 2)
    (hh : h.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 3) :
    InvariantCoordinateInput.tensorEvaluate (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1)
      2 ![g,h] (((1 : ℚ) ⊗ₜ[ℚ] TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) ⊗ₜ[ℚ]
        TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 6 := sorry

/-- `internal_product_six`: internal degree-two multiplication multiplies the inputs. -/
example : DividedPower.gamma (A := ℤ) 2 (2 : ℤ) * DividedPower.gamma 2 (3 : ℤ) =
    36 • DividedPower.gamma 2 (1 : ℤ) := sorry

/-- `internal_scalar_not_gamma`: the algebra map is linear in the coefficient, not quadratic. -/
example : algebraMap ℤ (DividedPower.degree ℤ ℤ 2) 2 ≠ DividedPower.gamma 2 (2 : ℤ) := sorry

/-- `internal_scalar_action`: the scalar 3 acts on gamma_2(2) as 12 gamma_2(1). -/
example : algebraMap ℤ (DividedPower.degree ℤ ℤ 2) 3 * DividedPower.gamma 2 (2 : ℤ) =
    12 • DividedPower.gamma 2 (1 : ℤ) := sorry

/-- `internal_scalar_zero_degree`: degree zero still retains the negative scalar -3. -/
example : (algebraMap ℤ (DividedPower.degree ℤ ℤ 0) (-3)).val = -3 := sorry

/-- `reindex_first`: selection of coordinate 0 evaluates to 2. -/
example
    (g h : TauCeti.HopfAlgebra.points
      (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) (CommAlgCat.of ℚ ℚ))
    (hg : g.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 2)
    (hh : h.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 3) :
    let C : InvariantCoordinateInput ℚ := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let t := TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0
    let f : C.ring 1 := ⟨(1 : ℚ) ⊗ₜ[ℚ] t, by sorry⟩
    C.tensorEvaluate 2 ![g,h] (C.reindex (fun _ : Fin 1 => (0 : Fin 2)) f).val = 2 := sorry

/-- `reindex_second`: selection of coordinate 1 evaluates to 3. -/
example
    (g h : TauCeti.HopfAlgebra.points
      (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) (CommAlgCat.of ℚ ℚ))
    (hg : g.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 2)
    (hh : h.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 3) :
    let C : InvariantCoordinateInput ℚ := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let t := TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0
    let f : C.ring 1 := ⟨(1 : ℚ) ⊗ₜ[ℚ] t, by sorry⟩
    C.tensorEvaluate 2 ![g,h] (C.reindex (fun _ : Fin 1 => (1 : Fin 2)) f).val = 3 := sorry

/-- `reindex_repeat`: repeating the point of value 2 makes the two-variable product 4. -/
example
    (g h : TauCeti.HopfAlgebra.points
      (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) (CommAlgCat.of ℚ ℚ))
    (hg : g.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 2)
    (hh : h.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 3) :
    let C : InvariantCoordinateInput ℚ := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let t := TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0
    let f : C.ring 2 := ⟨((1 : ℚ) ⊗ₜ[ℚ] t) ⊗ₜ[ℚ] t, by sorry⟩
    C.tensorEvaluate 1 ![g] (C.reindex (fun _ : Fin 2 => (0 : Fin 1)) f).val = 4 := sorry

/-- `multiply_six`: multiplication pullback sends the torus coordinate at 2,3 to 6. -/
example
    (g h : TauCeti.HopfAlgebra.points
      (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) (CommAlgCat.of ℚ ℚ))
    (hg : g.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 2)
    (hh : h.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 3) :
    let C : InvariantCoordinateInput ℚ := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let t := TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0
    let f : C.ring 1 := ⟨(1 : ℚ) ⊗ₜ[ℚ] t, by sorry⟩
    C.tensorEvaluate 2 ![g,h] (C.multiply 0 f).val = 6 := sorry

/-- `multiply_retains_first`: on values 2,3,5 the selected coordinate gives 2. -/
example
    (g h k : TauCeti.HopfAlgebra.points
      (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) (CommAlgCat.of ℚ ℚ))
    (hg : g.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 2)
    (hh : h.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 3)
    (hk : k.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 5) :
    let C : InvariantCoordinateInput ℚ := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let t := TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0
    let f : C.ring 2 := ⟨((1 : ℚ) ⊗ₜ[ℚ] t) ⊗ₜ[ℚ] (1 : C), by sorry⟩
    C.tensorEvaluate 3 ![g,h,k] (C.multiply 1 f).val = 2 := sorry

/-- `multiply_last_fifteen`: on values 2,3,5 the selected coordinate gives 15. -/
example
    (g h k : TauCeti.HopfAlgebra.points
      (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1) (CommAlgCat.of ℚ ℚ))
    (hg : g.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 2)
    (hh : h.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 3)
    (hk : k.ofConv (TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0) = 5) :
    let C : InvariantCoordinateInput ℚ := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    let t := TauCeti.GeneralLinear.genericMatrix ℚ 1 0 0
    let f : C.ring 2 := ⟨((1 : ℚ) ⊗ₜ[ℚ] (1 : C)) ⊗ₜ[ℚ] t, by sorry⟩
    C.tensorEvaluate 3 ![g,h,k] (C.multiply 1 f).val = 15 := sorry

/-- `merge_numeric`: the last two entries multiply, while a preceding entry is retained. -/
example : mergeLast ![(2 : ℕ),3] = ![6] ∧ mergeLast ![(2 : ℕ),3,5] = ![2,15] := by decide

end LayerZeroChecks

/-! ## Layer IHG.1: corner and residual determinants -/

section
variable {A : Type u} [CommRing A] {R : Type u} [Ring R] [Algebra A R]
/-- Proof-indexed corner type; the unit is the supplied idempotent. -/
abbrev Corner (A : Type u) [CommRing A] (R : Type u) [Ring R] [Algebra A R]
    (e : R) (he : e*e=e) : Type u := (show IsIdempotentElem e from he).Corner
instance cornerCoe (e : R) (he : e*e=e) : CoeOut (Corner A R e he) R := ⟨Subtype.val⟩
def cornerLift (e : R) (he : e*e=e) (x : R) (hx : x ∈ TauCeti.cornerSubmodule A e e) :
    Corner A R e he := ⟨x, by sorry⟩

namespace Determinant
/-- Mathlib supplies the corner ring with unit e.
Connectedness is the absence of nontrivial idempotents in the nonzero coefficient ring.
The degree returned is the polynomial degree of D(1-e+te), never its trace. -/
def corner [Nontrivial A] {d : ℕ} (D : Determinant A R d)
    (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) (e : R) (he : e*e=e) :
    Σ r : ℕ, Determinant A (Corner A R e he) r := sorry
theorem corner_rank [Nontrivial A] {d : ℕ} (D : Determinant A R d)
    (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) (e : R) (he : e*e=e) :
    Algebra.TensorProduct.rid A A A[X]
      (D.toLaw.toFun' A[X] (1 ⊗ₜ[A] (1-e) + X ⊗ₜ[A] e)) =
      X ^ (corner D hconnected e he).1 := sorry
/-- Evaluation fixes the corner law, including its normalization at the complement. -/
theorem corner_eval [Nontrivial A] {d : ℕ} (D : Determinant A R d)
    (hc : ∀ a : A, a*a=a → a=0 ∨ a=1) (e : R) (he : e*e=e)
    (x : Corner A R e he) : (corner D hc e he).2.eval x = D.eval ((x : R) + (1-e)) := sorry

/-- The evaluation contract holds over every coefficient algebra, including nonreduced ones. -/
theorem corner_eval_baseChange [Nontrivial A] {d : ℕ} (D : Determinant A R d)
    (hc : ∀ a : A, a*a=a → a=0 ∨ a=1) (e : R) (he : e*e=e)
    (B : Type u) [CommRing B] [Algebra A B] (x : B ⊗[A] Corner A R e he) :
    let inclusion : Corner A R e he →ₗ[A] R :=
      { toFun := fun x => (x : R), map_add' := by sorry, map_smul' := by sorry }
    (corner D hc e he).2.toLaw.toFun' B x =
      D.toLaw.toFun' B (TensorProduct.map LinearMap.id inclusion x + 1 ⊗ₜ[A] (1-e)) := sorry
theorem corner_rank_add [Nontrivial A] {d : ℕ} (D : Determinant A R d)
    (hc : ∀ a : A, a*a=a → a=0 ∨ a=1) (e : R) (he : e*e=e) :
    (corner D hc e he).1 + (corner D hc (1-e) (by sorry)).1 = d := sorry

/-- Corner-complement values; scalar extensions obey the same identity. -/
theorem corner_complement [Nontrivial A] {d : ℕ} (D : Determinant A R d)
    (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) (e : R) (he : e*e=e)
    (x y : R) (hx : x ∈ TauCeti.cornerSubmodule A e e)
    (hy : y ∈ TauCeti.cornerSubmodule A (1-e) (1-e)) :
    D.eval (x+y) = (corner D hconnected e he).2.eval (cornerLift e he x hx) *
      (corner D hconnected (1-e) (by sorry)).2.eval (cornerLift (1-e) (by sorry) y hy) := sorry
variable [IsLocalRing A]
def residual {d : ℕ} (D : Determinant A R d) :
    Determinant (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField A ⊗[A] R) d :=
  D.baseChange (IsLocalRing.ResidueField A)

/-- `residual_empty`: reduction preserves the degree-zero value at zero. -/
example : (ofMatrix (AlgHom.id A (Matrix (Fin 0) (Fin 0) A))).residual.eval 0 = 1 := sorry
/-- `residual_line`: the scalar law reduces 7 to 7, rather than to its square. -/
example : ((dimOneEquiv (A := ℚ) (R := ℚ)).symm (AlgHom.id ℚ ℚ)).residual.eval
    (1 ⊗ₜ[ℚ] (7 : ℚ)) = 7 := sorry
/-- `residual_mixed`: reduction retains both terms of the two-by-two determinant. -/
example : (ofMatrix (AlgHom.id ℚ (Matrix (Fin 2) (Fin 2) ℚ))).residual.eval
    (1 ⊗ₜ[ℚ] (!![2,3;5,7] : Matrix (Fin 2) (Fin 2) ℚ)) = -1 := sorry
end Determinant

end

/-! ## Layer IHG.1: residual determinant properties -/

section
variable {K : Type u} [CommRing K] {R : Type u} [Ring R] [Algebra K R] {d : ℕ}
/-- The vector module restricted along the matrix-to-endomorphism algebra map. -/
def matrixModule (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) : ModuleCat R :=
  letI := Module.compHom (Fin d → K) (Matrix.toLinAlgEquiv'.toAlgHom.comp ρ).toRingHom
  ModuleCat.of R (Fin d → K)

theorem matrixModule_smul (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) (r : R) (x : Fin d → K) :
    r • (show matrixModule ρ from x) = (show matrixModule ρ from (ρ r).mulVec x) := rfl

/-- R-submodules are exactly the K-submodules closed under the represented matrices. -/
def matrixModule_submoduleEquiv (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) :
    Submodule R (matrixModule ρ) ≃o
      {W : Submodule K (Fin d → K) // ∀ r x, x ∈ W → (ρ r).mulVec x ∈ W} := sorry

theorem matrixModule_submoduleEquiv_mem (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K)
    (W : Submodule R (matrixModule ρ)) (x : Fin d → K) :
    x ∈ (matrixModule_submoduleEquiv ρ W).val ↔ (show matrixModule ρ from x) ∈ W := sorry

theorem matrixModule_isSimple_iff (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) :
    IsSimpleModule R (matrixModule ρ) ↔ Nontrivial (Fin d → K) ∧
      ∀ W : Submodule K (Fin d → K),
        (∀ r x, x ∈ W → (ρ r).mulVec x ∈ W) → W = ⊥ ∨ W = ⊤ := sorry

theorem matrixModule_isSemisimple_iff (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) :
    IsSemisimpleModule R (matrixModule ρ) ↔
      ∀ W : Submodule K (Fin d → K),
        (∀ r x, x ∈ W → (ρ r).mulVec x ∈ W) →
        ∃ W' : Submodule K (Fin d → K),
          (∀ r x, x ∈ W' → (ρ r).mulVec x ∈ W') ∧ IsCompl W W' := sorry

/-- `irreducible_zero_rejected`: the zero-dimensional representation is not simple. -/
example : ¬ IsSimpleModule (Matrix (Fin 0) (Fin 0) ℚ)
    (matrixModule (AlgHom.id ℚ (Matrix (Fin 0) (Fin 0) ℚ))) := by
  rw [matrixModule_isSimple_iff]
  rintro ⟨⟨⟨x, y, hxy⟩⟩, _⟩
  exact hxy (Subsingleton.elim x y)

/-- `irreducible_positive_matrix`: the natural action is simple in positive dimension. -/
example {k : Type u} [Field k] (n : ℕ) (hn : 0 < n) :
    IsSimpleModule (Matrix (Fin n) (Fin n) k) (matrixModule (AlgHom.id k (Matrix (Fin n) (Fin n) k))) := sorry

end

section
variable {K : Type u} [Field K] {R : Type u} [Ring R] [Algebra K R] {d : ℕ}
namespace Determinant
/-- These predicates apply over a field, in particular to the residual law.
Split means all simple factors of the faithful quotient are matrices over K.
Arbitrary matrix realizability is weaker: the real regular representation of ℂ
realizes its norm but does not split its faithful quotient because its faithful quotient is the field ℂ. -/
def IsSplit (D : Determinant K R d) : Prop :=
  ∃ (s : ℕ) (size : Fin s → ℕ), (∀ i, 0 < size i) ∧
    ∃ ρ : R →ₐ[K] (∀ i : Fin s, Matrix (Fin (size i)) (Fin (size i)) K),
      Function.Surjective ρ ∧ ∀ r, ρ r = 0 ↔ r ∈ D.ker
def IsAbsolutelyIrreducible (D : Determinant K R d) : Prop :=
  0 < d ∧ ∀ (L : Type u) [Field L] [Algebra K L] [IsAlgClosed L],
    ∃ ρ : L ⊗[K] R →ₐ[L] Matrix (Fin d) (Fin d) L,
      ofMatrix ρ=D.baseChange L ∧ IsSimpleModule (L ⊗[K] R) (matrixModule ρ)
/-- Semisimple multiplicity one is detected by the commutative commutant after
algebraic closure. The signature uses every algebraically closed coefficient field. -/
def IsMultiplicityFree (D : Determinant K R d) : Prop :=
  ∀ (L : Type u) [Field L] [Algebra K L] [IsAlgClosed L],
    ∃ ρ : L ⊗[K] R →ₐ[L] Matrix (Fin d) (Fin d) L,
      ofMatrix ρ=D.baseChange L ∧ IsSemisimpleModule (L ⊗[K] R) (matrixModule ρ) ∧
        ∀ P Q : Matrix (Fin d) (Fin d) L,
          (∀ r, P*ρ r=ρ r*P) → (∀ r, Q*ρ r=ρ r*Q) → P*Q=Q*P
end Determinant
end

/-! ## Layer IHG.1: generalized matrix algebras and universal Cayley–Hamilton algebras -/

section
variable {A : Type u} [CommRing A] {R : Type u} [Ring R] [Algebra A R]
namespace GMA
/-- All fields are actual data or explicit equations. -/
structure Data (A : Type u) [CommRing A] (R : Type u) [Ring R] [Algebra A R]
    (s : ℕ) (size : Fin s → ℕ) where
  size_pos : ∀ i, 0 < size i
  idempotent : Fin s → R
  idem : ∀ i, idempotent i * idempotent i = idempotent i
  orthogonal : ∀ i j, i ≠ j → idempotent i * idempotent j = 0
  sum_one : ∑ i, idempotent i = 1
  diagonal : ∀ i, Corner A R (idempotent i) (idem i) ≃ₐ[A]
    Matrix (Fin (size i)) (Fin (size i)) A
  trace : R →ₗ[A] A
  trace_cyclic : ∀ x y, trace (x*y) = trace (y*x)
  trace_diagonal : ∀ i (x : Corner A R (idempotent i) (idem i)),
    trace (x : R) = Matrix.trace (diagonal i x)
variable {s : ℕ} {size : Fin s → ℕ} (E : Data A R s size)
abbrev blockModule (i j : Fin s) : Submodule A R :=
  TauCeti.cornerSubmodule A (E.idempotent i) (E.idempotent j)
theorem mem_blockModule (i j : Fin s) (x : R) :
    x ∈ blockModule E i j ↔ E.idempotent i * x = x ∧ x * E.idempotent j = x := by
  constructor
  · intro hx
    exact ⟨TauCeti.mul_eq_self_of_mem_cornerSubmodule (E.idem i) hx,
      TauCeti.mul_eq_self_of_mem_cornerSubmodule_right (E.idem j) hx⟩
  · rintro ⟨hl, hr⟩
    exact (TauCeti.mem_cornerSubmodule_iff A (E.idem i) (E.idem j)).2 (by rw [hl, hr])
def peirce : R ≃ₗ[A] (∀ i j : Fin s, blockModule E i j) := sorry
/-- Primitive diagonal matrix unit, using the positive block size. -/
def primitive (i : Fin s) : R :=
  ((E.diagonal i).symm (Matrix.single ⟨0,E.size_pos i⟩ ⟨0,E.size_pos i⟩ 1) :
    Corner A R (E.idempotent i) (E.idem i))
theorem primitive_idempotent (i : Fin s) : IsIdempotentElem (primitive E i) := sorry
abbrev entryModule (i j : Fin s) : Submodule A R :=
  TauCeti.cornerSubmodule A (primitive E i) (primitive E j)
theorem mem_entryModule (i j : Fin s) (x : R) :
    x ∈ entryModule E i j ↔ primitive E i * x = x ∧ x * primitive E j = x := by
  constructor
  · intro hx
    exact ⟨TauCeti.mul_eq_self_of_mem_cornerSubmodule (primitive_idempotent E i) hx,
      TauCeti.mul_eq_self_of_mem_cornerSubmodule_right (primitive_idempotent E j) hx⟩
  · rintro ⟨hl, hr⟩
    exact (TauCeti.mem_cornerSubmodule_iff A (primitive_idempotent E i)
      (primitive_idempotent E j)).2 (by rw [hl, hr])
def pairing {i j k : Fin s} : entryModule E i j →ₗ[A]
    entryModule E j k →ₗ[A] entryModule E i k := sorry
theorem pairing_coe {i j k : Fin s} (x : entryModule E i j)
    (y : entryModule E j k) : (pairing E x y : R) = (x : R) * (y : R) := sorry
theorem peirce_apply (r : R) (i j : Fin s) :
    (peirce E r i j : R) = E.idempotent i * r * E.idempotent j := sorry
theorem pairing_assoc {i j k l : Fin s} (x : entryModule E i j)
    (y : entryModule E j k) (z : entryModule E k l) :
    pairing E (pairing E x y) z = pairing E x (pairing E y z) := sorry

def adaptedRing (E : Data A R s size) : CommAlgCat.{u} A := sorry
def universalAdapted : R →ₐ[A] Matrix (Σ i : Fin s, Fin (size i)) (Σ i : Fin s, Fin (size i)) (adaptedRing E) := sorry
/-- Diagonal compatibility is given by the concrete chosen block entries. -/
def adaptedRing_equiv (B : Type u) [CommRing B] [Algebra A B] :
    (adaptedRing E →ₐ[A] B) ≃
      {ρ : R →ₐ[A] Matrix (Σ i : Fin s, Fin (size i)) (Σ i : Fin s, Fin (size i)) B //
        (∀ i j k (a : Fin (size j)) (b : Fin (size k)),
          ρ (E.idempotent i) ⟨j,a⟩ ⟨k,b⟩ =
            if j=i ∧ k=i ∧ (⟨j,a⟩ : Σ t : Fin s, Fin (size t))=⟨k,b⟩ then 1 else 0) ∧
        ∀ i (x : Corner A R (E.idempotent i) (E.idem i)) (a b : Fin (size i)),
          ρ (x : R) ⟨i,a⟩ ⟨i,b⟩ = algebraMap A B (E.diagonal i x a b)} := sorry

/-- The representing bijection is evaluation of the specified universal representation. -/
theorem adaptedRing_equiv_apply (B : Type u) [CommRing B] [Algebra A B]
    (f : adaptedRing E →ₐ[A] B) (r : R) :
    (adaptedRing_equiv E B f).val r = (universalAdapted E r).map f := sorry
/-- An A-linear retraction implies injectivity after every scalar extension. -/
theorem universalAdapted_split : ∃ l :
    Matrix (Σ i : Fin s, Fin (size i)) (Σ i : Fin s, Fin (size i)) (adaptedRing E) →ₗ[A] R,
    l.comp (universalAdapted E).toLinearMap = LinearMap.id := sorry

def determinant (E : Data A R s size) : Determinant A R (∑ i, size i) := sorry
theorem trace_determinant : (determinant E).traceLinear = E.trace := sorry
theorem determinant_adapted (x : R) :
    algebraMap A (adaptedRing E) ((determinant E).eval x) = (universalAdapted E x).det := sorry
/-- The GMA determinant agrees, as a full law, with the determinant of every adapted
representation `f ∘ universalAdapted` after scalar extension (Wang–Erickson Proposition 2.23). -/
theorem determinant_adapted_toFun (S : Type u) [CommRing S] [Algebra A S]
    (f : adaptedRing E →ₐ[A] S)
    (ρS : S ⊗[A] R →ₐ[S] Matrix (Σ i : Fin s, Fin (size i)) (Σ i : Fin s, Fin (size i)) S)
    (hρS : ∀ r, ρS (1 ⊗ₜ[A] r) = (universalAdapted E r).map f) (x : S ⊗[A] R) :
    Algebra.TensorProduct.rid A S S ((determinant E).toLaw.toFun' S x) = (ρS x).det := sorry
/-- the opposite scalar pairing ideal. -/
def reducibilityIdeal (i j : Fin s) : Ideal A :=
  Ideal.span {a | ∃ (x : entryModule E i j) (y : entryModule E j i),
    algebraMap A R a * primitive E i = (x : R)*(y : R)}
/-- Quotient entry corners must come from the same primitive matrix units. -/
theorem reducibilityIdeal_baseChange (i j : Fin s) (J : Ideal A)
    (EJ : Data (A ⧸ J) ((A ⧸ J) ⊗[A] R) s size)
    (hprimitive : ∀ k, primitive EJ k=1 ⊗ₜ[A] primitive E k) :
    (reducibilityIdeal E i j).map (Ideal.Quotient.mk J) = reducibilityIdeal EJ i j := sorry
/-- The labels encode the nonempty partition parts. -/
def partitionReducibilityIdeal {t : ℕ} (part : Fin s → Fin t) : Ideal A :=
  ⨆ i : Fin s, ⨆ j : Fin s, if part i ≠ part j then reducibilityIdeal E i j else ⊥

/-- These are the actual ordered residual constituents,
with full-law product, absolute irreducibility, pairwise nonisomorphism and corner data. -/
structure ResidualData [IsLocalRing A] {s : ℕ} {size : Fin s → ℕ}
    (E : Data A R s size) where
  representation : ∀ i, IsLocalRing.ResidueField A ⊗[A] R →ₐ[IsLocalRing.ResidueField A]
    Matrix (Fin (size i)) (Fin (size i)) (IsLocalRing.ResidueField A)
  absolutelyIrreducible : ∀ i, (Determinant.ofMatrix (representation i)).IsAbsolutelyIrreducible
  distinct : ∀ i j, i ≠ j → ¬ ∃ T :
      (Fin (size j) → IsLocalRing.ResidueField A) ≃ₗ[IsLocalRing.ResidueField A]
      (Fin (size i) → IsLocalRing.ResidueField A),
    ∀ r x, T ((representation j r).mulVec x) = (representation i r).mulVec (T x)
  projectors : ∀ i j, representation i (1 ⊗ₜ[A] E.idempotent j) = if j=i then 1 else 0
  diagonal : ∀ i (x : Corner A R (E.idempotent i) (E.idem i)),
    representation i (1 ⊗ₜ[A] (x : R)) = (E.diagonal i x).map (IsLocalRing.residue A)
  factorization : ∀ (B : Type u) [CommRing B] [Algebra (IsLocalRing.ResidueField A) B]
      (x : B ⊗[IsLocalRing.ResidueField A] (IsLocalRing.ResidueField A ⊗[A] R)),
    (determinant E).residual.toLaw.toFun' B x =
      ∏ i, (Determinant.ofMatrix (representation i)).toLaw.toFun' B x

/-- Canonical tensor reassociation, valid for a noncommutative R as well. -/
def quotientResidualTransport [IsLocalRing A] (J : Ideal A)
    (hJ : J ≤ IsLocalRing.maximalIdeal A) :
    letI : Algebra (A ⧸ J) (IsLocalRing.ResidueField A) := (Ideal.Quotient.factorₐ A hJ).toRingHom.toAlgebra
    (IsLocalRing.ResidueField A ⊗[A ⧸ J] ((A ⧸ J) ⊗[A] R)) ≃ₐ[IsLocalRing.ResidueField A]
      (IsLocalRing.ResidueField A ⊗[A] R) := sorry
theorem quotientResidualTransport_tmul [IsLocalRing A] (J : Ideal A)
    (hJ : J ≤ IsLocalRing.maximalIdeal A) (c : IsLocalRing.ResidueField A) (a : A) (r : R) :
    letI : Algebra (A ⧸ J) (IsLocalRing.ResidueField A) := (Ideal.Quotient.factorₐ A hJ).toRingHom.toAlgebra
    quotientResidualTransport (R := R) J hJ (c ⊗ₜ[A ⧸ J] (Ideal.Quotient.mk J a ⊗ₜ[A] r)) =
      (c * IsLocalRing.residue A a) ⊗ₜ[A] r := sorry

/-- Reduction of the entire polynomial law, not just evaluations on R. -/
def residualFactor [IsLocalRing A] (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A)
    {n : ℕ} (F : Determinant (A ⧸ J) ((A ⧸ J) ⊗[A] R) n) :
    Determinant (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField A ⊗[A] R) n :=
  letI : Algebra (A ⧸ J) (IsLocalRing.ResidueField A) := (Ideal.Quotient.factorₐ A hJ).toRingHom.toAlgebra
  (F.baseChange (IsLocalRing.ResidueField A)).comap
    (quotientResidualTransport (R := R) J hJ).symm.toAlgHom

theorem residualFactor_baseChange [IsLocalRing A] {n : ℕ} (D : Determinant A R n)
    (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A) :
    residualFactor J hJ (D.baseChange (A ⧸ J)) = D.residual := sorry

/-- Allen–Newton–Thorne, Proposition 2.5, for a labelled nonempty partition. The reductions are
products of precisely the residual constituents in that part. -/
theorem partition_reducibility [HenselianLocalRing A]
    (res : ResidualData E) (hCH : (determinant E).IsCayleyHamilton)
    {t : ℕ} (part : Fin s → Fin t) (hpart : Function.Surjective part)
    (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A) :
    partitionReducibilityIdeal E part ≤ J ↔
      ∃! F : ∀ m : Fin t, Determinant (A ⧸ J) ((A ⧸ J) ⊗[A] R)
          (∑ i ∈ Finset.univ.filter (fun i ↦ part i=m), size i),
        (∀ (B : Type u) [CommRing B] [Algebra (A ⧸ J) B]
          (x : B ⊗[A ⧸ J] ((A ⧸ J) ⊗[A] R)),
          ((determinant E).baseChange (A ⧸ J)).toLaw.toFun' B x =
            ∏ m, (F m).toLaw.toFun' B x) ∧
        ∀ m (B : Type u) [CommRing B] [Algebra (IsLocalRing.ResidueField A) B]
          (x : B ⊗[IsLocalRing.ResidueField A] (IsLocalRing.ResidueField A ⊗[A] R)),
          (residualFactor J hJ (F m)).toLaw.toFun' B x =
            ∏ i ∈ Finset.univ.filter (fun i ↦ part i=m),
              (Determinant.ofMatrix (res.representation i)).toLaw.toFun' B x := sorry

/-- Two blocks, prescribed reductions and uniqueness are explicit (Allen–Newton–Thorne,
Proposition 2.5). -/
theorem reducibilityIdeal_le_iff [HenselianLocalRing A] {size : Fin 2 → ℕ}
    (E : Data A R 2 size) (res : ResidualData E) (hCH : (determinant E).IsCayleyHamilton)
    (i j : Fin 2) (hij : i ≠ j) (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A) :
    reducibilityIdeal E i j ≤ J ↔
      ∃! pair : Determinant (A ⧸ J) ((A ⧸ J) ⊗[A] R) (size i) ×
        Determinant (A ⧸ J) ((A ⧸ J) ⊗[A] R) (size j),
        ((determinant E).baseChange (A ⧸ J)).toLaw = (pair.1.mul pair.2).toLaw ∧
        residualFactor J hJ pair.1 = Determinant.ofMatrix (res.representation i) ∧
        residualFactor J hJ pair.2 = Determinant.ofMatrix (res.representation j) := sorry

/-- A singleton part makes its diagonal compression
multiplicative modulo the partition ideal. The residual ordering remains fixed. -/
def quotientRepresentation {t : ℕ} (part : Fin s → Fin t) (i : Fin s)
    (hi : ∀ k, part k=part i → k=i) (J : Ideal A)
    (hIP : partitionReducibilityIdeal E part ≤ J) :
    (A ⧸ J) ⊗[A] R →ₐ[A ⧸ J] Matrix (Fin (size i)) (Fin (size i)) (A ⧸ J) := sorry
theorem quotientRepresentation_apply {t : ℕ} (part : Fin s → Fin t) (i : Fin s)
    (hi : ∀ k, part k=part i → k=i) (J : Ideal A)
    (hIP : partitionReducibilityIdeal E part ≤ J) (r : R) :
    quotientRepresentation E part i hi J hIP (1 ⊗ₜ[A] r) =
      (E.diagonal i (cornerLift (E.idempotent i) (E.idem i)
        (E.idempotent i*r*E.idempotent i) (by sorry))).map (Ideal.Quotient.mk J) := sorry
/-- The vector module is restricted along the actual quotient matrix action. -/
def quotientConstituent {t : ℕ} (part : Fin s → Fin t) (i : Fin s)
    (hi : ∀ k, part k=part i → k=i) (J : Ideal A)
    (hIP : partitionReducibilityIdeal E part ≤ J) : ModuleCat.{u} ((A ⧸ J) ⊗[A] R) :=
  let action := (Matrix.toLinAlgEquiv'.toAlgHom).comp
    (quotientRepresentation E part i hi J hIP)
  letI := Module.compHom (Fin (size i) → A ⧸ J) action.toRingHom
  ModuleCat.of ((A ⧸ J) ⊗[A] R) (Fin (size i) → A ⧸ J)

/-- Intermediate products are killed. -/
def intermediateProducts (i j : Fin s) : Submodule A (entryModule E i j) :=
  Submodule.span A {z | ∃ k : Fin s, k ≠ i ∧ k ≠ j ∧
    ∃ (x : entryModule E i k) (y : entryModule E k j), z = pairing E x y}
def extensionModule (i j : Fin s) : ModuleCat.{u} A :=
  ModuleCat.of A (entryModule E i j ⧸ intermediateProducts E i j)
theorem extension_offDiagonal (i j k : Fin s) (hki : k ≠ i) (hkj : k ≠ j)
    (x : entryModule E i k) (y : entryModule E k j) :
    Submodule.Quotient.mk (p := intermediateProducts E i j) (pairing E x y) = 0 := sorry
def extensionModule_twoBlocks {size2 : Fin 2 → ℕ} (E : Data A R 2 size2) :
    extensionModule E 0 1 ≃ₗ[A] entryModule E 0 1 := sorry
theorem extensionModule_twoBlocks_mk {size2 : Fin 2 → ℕ} (E : Data A R 2 size2)
    (x : entryModule E 0 1) :
    extensionModule_twoBlocks E (Submodule.Quotient.mk x) = x := sorry

namespace Checks

/-- `adapted_diagonal`: chosen standard diagonal coordinates retain the indicated matrix entry. -/
example (E : Data ℤ (Matrix (Fin 2) (Fin 2) ℤ) 1 (fun _ => 2))
    (hdiag : ∀ x, E.diagonal 0 x = (x : Matrix (Fin 2) (Fin 2) ℤ))
    (f : adaptedRing E →ₐ[ℤ] ℤ) :
    universalAdapted E !![2,0;0,3] ⟨0,0⟩ ⟨0,0⟩ = 2 ∧
      (adaptedRing_equiv E ℤ f).val !![2,0;0,3] ⟨0,0⟩ ⟨0,0⟩ = 2 := sorry

/-- `adapted_upper`: chosen standard diagonal coordinates retain the indicated matrix entry. -/
example (E : Data ℤ (Matrix (Fin 2) (Fin 2) ℤ) 1 (fun _ => 2))
    (hdiag : ∀ x, E.diagonal 0 x = (x : Matrix (Fin 2) (Fin 2) ℤ))
    (f : adaptedRing E →ₐ[ℤ] ℤ) :
    universalAdapted E !![0,2;3,0] ⟨0,0⟩ ⟨0,1⟩ = 2 ∧
      (adaptedRing_equiv E ℤ f).val !![0,2;3,0] ⟨0,0⟩ ⟨0,1⟩ = 2 := sorry

/-- `adapted_product`: chosen standard diagonal coordinates retain the indicated matrix entry. -/
example (E : Data ℤ (Matrix (Fin 2) (Fin 2) ℤ) 1 (fun _ => 2))
    (hdiag : ∀ x, E.diagonal 0 x = (x : Matrix (Fin 2) (Fin 2) ℤ))
    (f : adaptedRing E →ₐ[ℤ] ℤ) :
    universalAdapted E (!![0,2;0,0] * !![0,0;3,0]) ⟨0,0⟩ ⟨0,0⟩ = 6 ∧
      (adaptedRing_equiv E ℤ f).val (!![0,2;0,0] * !![0,0;3,0]) ⟨0,0⟩ ⟨0,0⟩ = 6 := sorry

/-- `residual_one_block`: the full matrix algebra has its single standard constituent. -/
example {k : Type u} [Field k] (n : ℕ) (hn : 0 < n)
    (E : Data k (Matrix (Fin n) (Fin n) k) 1 (fun _ => n)) :
    Nonempty (ResidualData E) := sorry
/-- `residual_triangular_exists`: vanishing lower entries give the two distinct diagonal lines. -/
example {k S : Type u} [Field k] [Ring S] [Algebra k S]
    (E : Data k S 2 (fun _ => 1)) (hlower : blockModule E 1 0 = ⊥) :
    Nonempty (ResidualData E) := sorry
/-- `residual_full_matrix_rejected`: a full two-by-two algebra has no one-dimensional factors. -/
example {k : Type u} [Field k]
    (E : Data k (Matrix (Fin 2) (Fin 2) k) 2 (fun _ => 1)) :
    ¬ Nonempty (ResidualData E) := sorry

/-- `residue_field_seven`: quotienting a field by zero retains a nontrivial scalar. -/
example : Ideal.Quotient.factorₐ ℚ (show (⊥ : Ideal ℚ) ≤ IsLocalRing.maximalIdeal ℚ from bot_le) (Ideal.Quotient.mk _ 7) = 7 := sorry
/-- `residue_maximal_injective`: at the maximal ideal the map is an isomorphism onto k. -/
example [IsLocalRing A] : Function.Bijective
    (Ideal.Quotient.factorₐ A (le_refl (IsLocalRing.maximalIdeal A))) := sorry
/-- `residue_nilpotent`: a nilpotent survives some coefficient quotients but dies in k. -/
example [IsLocalRing A] (a : A) (ha : IsNilpotent a) :
    Ideal.Quotient.factorₐ A (show (⊥ : Ideal A) ≤ IsLocalRing.maximalIdeal A from bot_le) (Ideal.Quotient.mk _ a) = 0 := sorry

/-- `transport_scalar_product`: the middle coefficient multiplies the outer one. -/
example :
    letI : Algebra (ℚ ⧸ (⊥ : Ideal ℚ)) (IsLocalRing.ResidueField ℚ) :=
      (Ideal.Quotient.factorₐ ℚ (show (⊥ : Ideal ℚ) ≤ IsLocalRing.maximalIdeal ℚ from bot_le)).toRingHom.toAlgebra
    quotientResidualTransport (R := ℚ) (⊥ : Ideal ℚ) bot_le
      ((3 : IsLocalRing.ResidueField ℚ) ⊗ₜ[ℚ ⧸ (⊥ : Ideal ℚ)]
        (Ideal.Quotient.mk _ 2 ⊗ₜ[ℚ] (7 : ℚ))) = 42 := sorry
/-- `transport_matrix_order`: reassociation preserves the order of matrix factors. -/
example :
    letI : Algebra (ℚ ⧸ (⊥ : Ideal ℚ)) (IsLocalRing.ResidueField ℚ) :=
      (Ideal.Quotient.factorₐ ℚ (show (⊥ : Ideal ℚ) ≤ IsLocalRing.maximalIdeal ℚ from bot_le)).toRingHom.toAlgebra
    quotientResidualTransport (R := Matrix (Fin 2) (Fin 2) ℚ) (⊥ : Ideal ℚ) bot_le
      ((1 : IsLocalRing.ResidueField ℚ) ⊗ₜ[ℚ ⧸ (⊥ : Ideal ℚ)]
        (1 ⊗ₜ[ℚ] ((!![0,2;0,0] : Matrix (Fin 2) (Fin 2) ℚ) * !![0,0;3,0]))) =
      1 ⊗ₜ[ℚ] (!![6,0;0,0] : Matrix (Fin 2) (Fin 2) ℚ) := sorry
/-- `transport_zero_coefficient`: a zero middle tensor coefficient kills a nonzero matrix. -/
example :
    letI : Algebra (ℚ ⧸ (⊥ : Ideal ℚ)) (IsLocalRing.ResidueField ℚ) :=
      (Ideal.Quotient.factorₐ ℚ (show (⊥ : Ideal ℚ) ≤ IsLocalRing.maximalIdeal ℚ from bot_le)).toRingHom.toAlgebra
    quotientResidualTransport (R := Matrix (Fin 2) (Fin 2) ℚ) (⊥ : Ideal ℚ) bot_le
      ((3 : IsLocalRing.ResidueField ℚ) ⊗ₜ[ℚ ⧸ (⊥ : Ideal ℚ)]
        (0 ⊗ₜ[ℚ] (!![0,2;3,0] : Matrix (Fin 2) (Fin 2) ℚ))) = 0 := sorry

/-- `residual_factor_empty`: the degree-zero law remains constant one, even at zero. -/
example [IsLocalRing A] (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A) :
    (residualFactor J hJ ((Determinant.ofMatrix
      (AlgHom.id A (Matrix (Fin 0) (Fin 0) A))).baseChange (A ⧸ J))).eval 0 = 1 := sorry
/-- `residual_factor_line`: the degree-one scalar law reduces the scalar, not its square. -/
example :
    (residualFactor (⊥ : Ideal ℚ) bot_le
      (((Determinant.dimOneEquiv (A := ℚ) (R := ℚ)).symm (AlgHom.id ℚ ℚ)).baseChange
        (ℚ ⧸ (⊥ : Ideal ℚ)))).eval (1 ⊗ₜ[ℚ] (7 : ℚ)) = 7 := sorry
/-- `residual_factor_matrix`: mixed determinant terms survive the tensor transport. -/
example :
    (residualFactor (⊥ : Ideal ℚ) bot_le
      ((Determinant.ofMatrix (AlgHom.id ℚ (Matrix (Fin 2) (Fin 2) ℚ))).baseChange
        (ℚ ⧸ (⊥ : Ideal ℚ)))).eval
        (1 ⊗ₜ[ℚ] (!![2,3;5,7] : Matrix (Fin 2) (Fin 2) ℚ)) = -1 := sorry

/-- `quotient_rep_selected`: a two-term diagonal sum selects the specified summand. -/
example {s t : ℕ} {size : Fin s → ℕ} (E : Data A R s size)
    (part : Fin s → Fin t) (i j : Fin s) (hij : i ≠ j)
    (hi : ∀ k, part k=part i → k=i) (J : Ideal A)
    (hIP : partitionReducibilityIdeal E part ≤ J) :
    quotientRepresentation E part i hi J hIP
      (1 ⊗ₜ[A] (2 • E.idempotent i + 3 • E.idempotent j)) =
      (2 : Matrix (Fin (size i)) (Fin (size i)) (A ⧸ J)) := sorry
/-- `quotient_rep_off_diagonal`: a cross-block entry acts by zero on either constituent. -/
example {s t : ℕ} {size : Fin s → ℕ} (E : Data A R s size)
    (part : Fin s → Fin t) (i j : Fin s) (hij : i ≠ j)
    (hi : ∀ k, part k=part i → k=i) (J : Ideal A)
    (hIP : partitionReducibilityIdeal E part ≤ J) (r : R) :
    quotientRepresentation E part i hi J hIP
      (1 ⊗ₜ[A] (E.idempotent i*r*E.idempotent j)) = 0 := sorry
/-- `quotient_rep_unit_ideal`: the coefficient unit ideal produces the zero representation ring. -/
example {s t : ℕ} {size : Fin s → ℕ} (E : Data A R s size)
    (part : Fin s → Fin t) (i : Fin s) (hi : ∀ k, part k=part i → k=i) (r : R) :
    quotientRepresentation E part i hi ⊤ le_top (1 ⊗ₜ[A] r) = 0 := sorry

/-- `constituent_selected`: the vector module has the selected, ordered diagonal action. -/
example {s t : ℕ} {size : Fin s → ℕ} (E : Data A R s size)
    (part : Fin s → Fin t) (i j : Fin s) (hij : i ≠ j)
    (hi : ∀ k, part k=part i → k=i) (J : Ideal A)
    (hIP : partitionReducibilityIdeal E part ≤ J)
    (v : quotientConstituent E part i hi J hIP) :
    ((1 : A ⧸ J) ⊗ₜ[A] (2 • E.idempotent i + 3 • E.idempotent j)) • v = 2 • v := sorry
/-- `constituent_proper_nonzero`: a proper coefficient ideal never gives a zero endpoint. -/
example {s t : ℕ} {size : Fin s → ℕ} (E : Data A R s size)
    (part : Fin s → Fin t) (i : Fin s) (hi : ∀ k, part k=part i → k=i)
    (J : Ideal A) (hJ : J ≠ ⊤) (hIP : partitionReducibilityIdeal E part ≤ J) :
    Nontrivial (quotientConstituent E part i hi J hIP) := sorry
/-- `constituent_unit_ideal`: quotienting the coefficients by one kills the endpoint. -/
example {s t : ℕ} {size : Fin s → ℕ} (E : Data A R s size)
    (part : Fin s → Fin t) (i : Fin s) (hi : ∀ k, part k=part i → k=i) :
    Subsingleton (quotientConstituent E part i hi ⊤ le_top) := sorry

/-- `two_block_sum`: the two-block equivalence retains both summands with positive sign. -/
example {size : Fin 2 → ℕ} (E : Data A R 2 size) (x y : entryModule E 0 1) :
    extensionModule_twoBlocks E (Submodule.Quotient.mk (2 • x + 3 • y)) = 2 • x + 3 • y := sorry
/-- `two_block_nonzero`: a nonzero entry remains nonzero after the empty path quotient. -/
example {size : Fin 2 → ℕ} (E : Data A R 2 size) (x : entryModule E 0 1) (hx : x ≠ 0) :
    extensionModule_twoBlocks E (Submodule.Quotient.mk x) ≠ 0 := sorry
/-- `two_block_inverse`: the inverse returns the class of the same entry, with no transpose. -/
example {size : Fin 2 → ℕ} (E : Data A R 2 size) (x : entryModule E 0 1) :
    (extensionModule_twoBlocks E).symm (2 • x) = Submodule.Quotient.mk (2 • x) := sorry

/-- `two_block_seven`: the quotient identification preserves the upper entry, including its sign. -/
example (E : Data ℚ (Matrix (Fin 2) (Fin 2) ℚ) 2 (fun _ => 1))
    (he : ∀ i, E.idempotent i = Matrix.single i i 1) :
    let x : entryModule E 0 1 := ⟨Matrix.single 0 1 7, by sorry⟩
    ((extensionModule_twoBlocks E) (Submodule.Quotient.mk x) : Matrix (Fin 2) (Fin 2) ℚ) =
      !![0,7;0,0] := sorry
/-- `two_block_negative`: the reverse identification retains a negative upper entry. -/
example (E : Data ℚ (Matrix (Fin 2) (Fin 2) ℚ) 2 (fun _ => 1))
    (he : ∀ i, E.idempotent i = Matrix.single i i 1) :
    let x : entryModule E 0 1 := ⟨Matrix.single 0 1 (-3), by sorry⟩
    (extensionModule_twoBlocks E).symm x = Submodule.Quotient.mk x := sorry
/-- `two_block_integral_product`: the integral entry retains the product 3·2. -/
example (E : Data ℤ (Matrix (Fin 2) (Fin 2) ℤ) 2 (fun _ => 1))
    (he : ∀ i, E.idempotent i = Matrix.single i i 1) :
    let x : entryModule E 0 1 := ⟨Matrix.single 0 1 2, by sorry⟩
    ((extensionModule_twoBlocks E) (Submodule.Quotient.mk (3 • x)) : Matrix (Fin 2) (Fin 2) ℤ) =
      !![0,6;0,0] := sorry

open scoped ModuleCat.Algebra

/-- `ext_triangular_upper`: a one-dimensional upper entry gives one extension direction. -/
example {k S : Type u} [Field k] [Ring S] [Algebra k S]
    (E : Data k S 2 (fun _ => 1))
    (hlower : entryModule E 1 0 = ⊥)
    (hupper : Module.finrank k (entryModule E 0 1) = 1) :
    let Mi := quotientConstituent E (fun i => i) 0 (by simp) ⊥ (by sorry)
    let Mj := quotientConstituent E (fun i => i) 1 (by simp) ⊥ (by sorry)
    Module.finrank (k ⧸ (⊥ : Ideal k)) (CategoryTheory.Abelian.Ext Mj Mi 1) = 1 := sorry
/-- `ext_triangular_reverse`: reversing the endpoints kills the upper-triangular class. -/
example {k S : Type u} [Field k] [Ring S] [Algebra k S]
    (E : Data k S 2 (fun _ => 1)) (hlower : entryModule E 1 0 = ⊥) :
    let Mi := quotientConstituent E (fun i => i) 0 (by simp) ⊥ (by sorry)
    let Mj := quotientConstituent E (fun i => i) 1 (by simp) ⊥ (by sorry)
    Subsingleton (CategoryTheory.Abelian.Ext Mi Mj 1) := sorry
/-- `ext_diagonal_split`: both off-diagonal directions vanish for the product algebra. -/
example {k S : Type u} [Field k] [Ring S] [Algebra k S]
    (E : Data k S 2 (fun _ => 1))
    (hlower : entryModule E 1 0 = ⊥) (hupper : entryModule E 0 1 = ⊥) :
    let Mi := quotientConstituent E (fun i => i) 0 (by simp) ⊥ (by sorry)
    let Mj := quotientConstituent E (fun i => i) 1 (by simp) ⊥ (by sorry)
    Subsingleton (CategoryTheory.Abelian.Ext Mj Mi 1) := sorry

/-- `extension_coboundary_sign`: upper conjugation changes the upper entry by t(ψ−χ). -/
example : (!![1,5;0,1] : Matrix (Fin 2) (Fin 2) ℚ) * !![2,0;0,3] *
    !![1,-5;0,1] = !![2,5;0,3] := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]
/-- `extension_equal_characters`: equal characters cannot kill a nonzero upper entry. -/
example (t : ℚ) : (!![1,t;0,1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1,1;0,1] *
    !![1,-t;0,1] = !![1,1;0,1] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

end Checks

end GMA

/-- The Cayley–Hamilton quotient `R / CH(D)`; its `A`-algebra structure is Mathlib's
`RingCon` quotient algebra. -/
abbrev CHQuotient {d : ℕ} (D : Determinant A R d) := D.chIdeal.ringCon.Quotient
/-- The quotient map `R → R / CH(D)`, which is Mathlib's `RingCon.mkₐ`. -/
abbrev chQuotientMap {d : ℕ} (D : Determinant A R d) : R →ₐ[A] CHQuotient D :=
  D.chIdeal.ringCon.mkₐ A

namespace CayleyHamilton
variable {d : ℕ} {G : Type} [Group G]
/-- The carrier is the actual CH quotient. -/
def universalAlgebra (G : Type) [Group G] (d : ℕ) :
    AlgCat (Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d) :=
  AlgCat.of (Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d)
    (CHQuotient (Determinant.universal ℤ (MonoidAlgebra ℤ G) d))
def universalAlgebra_quotientMap (G : Type) [Group G] (d : ℕ) :
    MonoidAlgebra (Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d) G →ₐ[
      Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d] universalAlgebra G d := sorry
theorem universalAlgebra_quotientMap_single (G : Type) [Group G] (d : ℕ)
    (c : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d) (g : G) :
    universalAlgebra_quotientMap G d (MonoidAlgebra.single g c) =
      chQuotientMap (Determinant.universal ℤ (MonoidAlgebra ℤ G) d)
        (by
          letI : Module ℤ (Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d) := Algebra.toModule
          exact c ⊗ₜ[ℤ] MonoidAlgebra.of ℤ G g) := sorry

/-- The same explicit coefficient map determines the specialized universal law. -/
def universalSpecialization (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B) :
    Determinant B (B ⊗[ℤ] MonoidAlgebra ℤ G) d :=
  Determinant.coordinateRingEquiv d B φ
/-- The full determinant compatibility is an explicit input to the quotient lift. -/
def universalAlgebra_lift (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B)
    {S : Type u} [Ring S] [Algebra B S] (DS : Determinant B S d)
    (hDS : DS.IsCayleyHamilton)
    (r : B ⊗[ℤ] MonoidAlgebra ℤ G →ₐ[B] S)
    (hcompat : DS.comap r = universalSpecialization d φ) :
    letI := Algebra.compHom S φ.toRingHom
    universalAlgebra G d →ₐ[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d] S := sorry
/-- The compatible lift has the prescribed value on every group-algebra coefficient. -/
theorem universalAlgebra_lift_single (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B)
    {S : Type u} [Ring S] [Algebra B S] (DS : Determinant B S d)
    (hDS : DS.IsCayleyHamilton)
    (r : B ⊗[ℤ] MonoidAlgebra ℤ G →ₐ[B] S)
    (hcompat : DS.comap r = universalSpecialization d φ) :
    letI := Algebra.compHom S φ.toRingHom
    ∀ c g, universalAlgebra_lift d φ DS hDS r hcompat
      (universalAlgebra_quotientMap G d (MonoidAlgebra.single g c)) =
        r (φ c ⊗ₜ[ℤ] MonoidAlgebra.of ℤ G g) := sorry
/-- Coefficients and group generators determine the compatible quotient map uniquely. -/
theorem universalAlgebra_lift_unique (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B)
    {S : Type u} [Ring S] [Algebra B S] (DS : Determinant B S d)
    (hDS : DS.IsCayleyHamilton)
    (r : B ⊗[ℤ] MonoidAlgebra ℤ G →ₐ[B] S)
    (hcompat : DS.comap r = universalSpecialization d φ) :
    letI := Algebra.compHom S φ.toRingHom
    ∀ f : universalAlgebra G d →ₐ[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d] S,
      (∀ c g, f (universalAlgebra_quotientMap G d (MonoidAlgebra.single g c))=
        r (φ c ⊗ₜ[ℤ] MonoidAlgebra.of ℤ G g)) →
      f = universalAlgebra_lift d φ DS hDS r hcompat := sorry
/-- Scalar extension of the very same universal quotient along φ. -/
def universalAlgebra_baseChange (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B) : AlgCat B :=
  letI := φ.toRingHom.toAlgebra
  AlgCat.of B (B ⊗[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d] universalAlgebra G d)
/-- Characteristic-coefficient ideals commute with arbitrary scalar extension. -/
def universalAlgebra_specializationEquiv (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B) :
    universalAlgebra_baseChange d φ ≃ₐ[B] CHQuotient (universalSpecialization d φ) := sorry
theorem universalAlgebra_specializationEquiv_tmul (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B)
    (b : B) (g : G) :
    letI := φ.toRingHom.toAlgebra
    universalAlgebra_specializationEquiv d φ
      (b ⊗ₜ[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d]
        universalAlgebra_quotientMap G d (MonoidAlgebra.of _ G g)) =
      chQuotientMap (universalSpecialization d φ) (b ⊗ₜ[ℤ] MonoidAlgebra.of ℤ G g) := sorry

/-- finite type, not module finite. -/
def genericRepresentationRing (D : Determinant A R d) (hD : D.IsCayleyHamilton)
    [Module.Finite A R] : CommAlgCat A := sorry
def genericRepresentation (D : Determinant A R d) (hD : D.IsCayleyHamilton)
    [Module.Finite A R] : R →ₐ[A]
      Matrix (Fin d) (Fin d) (genericRepresentationRing D hD) := sorry
def genericRepresentationRing_equiv (D : Determinant A R d) (hD : D.IsCayleyHamilton)
    [Module.Finite A R] (B : Type u) [CommRing B] [Algebra A B] :
    (genericRepresentationRing D hD →ₐ[A] B) ≃
      {ρ : B ⊗[A] R →ₐ[B] Matrix (Fin d) (Fin d) B //
        Determinant.ofMatrix ρ = D.baseChange B} := sorry
theorem genericRepresentationRing_finiteType (D : Determinant A R d)
    (hD : D.IsCayleyHamilton) [Module.Finite A R] :
    Algebra.FiniteType A (genericRepresentationRing D hD) := sorry
/-- Specialization sends the universal matrix to the prescribed representation. -/
theorem genericRepresentationRing_equiv_apply (D : Determinant A R d)
    (hD : D.IsCayleyHamilton) [Module.Finite A R]
    (B : Type u) [CommRing B] [Algebra A B]
    (f : genericRepresentationRing D hD →ₐ[A] B) (r : R) :
    (genericRepresentationRing_equiv D hD B f).val (1 ⊗ₜ[A] r) =
      (genericRepresentation D hD r).map f := sorry

namespace Checks

/-- `specialization_empty`: the scalar 7 has degree-0 value 1. -/
example (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ Unit) 0 →ₐ[ℤ] ℚ) :
    (universalSpecialization 0 φ).eval (7 ⊗ₜ[ℤ] (1 : MonoidAlgebra ℤ Unit)) = 1 := sorry

/-- `specialization_line`: the scalar 7 has degree-1 value 7. -/
example (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ Unit) 1 →ₐ[ℤ] ℚ) :
    (universalSpecialization 1 φ).eval (7 ⊗ₜ[ℤ] (1 : MonoidAlgebra ℤ Unit)) = 7 := sorry

/-- `specialization_square`: the scalar 7 has degree-2 value 49. -/
example (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ Unit) 2 →ₐ[ℤ] ℚ) :
    (universalSpecialization 2 φ).eval (7 ⊗ₜ[ℤ] (1 : MonoidAlgebra ℤ Unit)) = 49 := sorry

/-- `universal_zero_degree`: the characteristic law is 1, so the quotient is the zero ring. -/
example : Subsingleton (universalAlgebra Unit 0) := sorry
/-- `universal_quotient_zero_degree`: the degree-zero quotient kills every group generator. -/
example {G : Type} [Group G] (g : G) :
    universalAlgebra_quotientMap G 0 (MonoidAlgebra.of _ G g) = 0 := sorry
/-- `baseChange_zero_degree`: even a nonzero coefficient field gives the zero algebra. -/
example (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ Unit) 0 →ₐ[ℤ] ℚ) :
    Subsingleton (universalAlgebra_baseChange 0 φ) := sorry
/-- `baseChange_trivial_line`: the trivial group and degree one give exactly the coefficients. -/
example (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ Unit) 1 →ₐ[ℤ] ℚ) :
    Function.Bijective (algebraMap ℚ (universalAlgebra_baseChange 1 φ)) := sorry
/-- `baseChange_trivial_square`: repeated degree two retains the coefficients in characteristic two. -/
example (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ Unit) 2 →ₐ[ℤ] ZMod 2) :
    Function.Bijective (algebraMap (ZMod 2) (universalAlgebra_baseChange 2 φ)) := sorry

/-- `generic_line`: specializing at the identity representation retains the entire matrix. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id (ℚ) (Matrix (Fin 1) (Fin 1) (ℚ)))
    let hD : D.IsCayleyHamilton := by sorry
    let ρ := (Algebra.TensorProduct.lid (ℚ) (Matrix (Fin 1) (Fin 1) (ℚ))).toAlgHom
    let f := (genericRepresentationRing_equiv D hD (ℚ)).symm ⟨ρ, by sorry⟩
    (genericRepresentation D hD (Matrix.scalar (Fin 1) (7 : ℚ))).map f = Matrix.scalar (Fin 1) (7 : ℚ) ∧
      (genericRepresentationRing_equiv D hD (ℚ) f).val (1 ⊗ₜ[ℚ] Matrix.scalar (Fin 1) (7 : ℚ)) = Matrix.scalar (Fin 1) (7 : ℚ) := sorry

/-- `generic_mixed`: specializing at the identity representation retains the entire matrix. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id (ℚ) (Matrix (Fin 2) (Fin 2) (ℚ)))
    let hD : D.IsCayleyHamilton := by sorry
    let ρ := (Algebra.TensorProduct.lid (ℚ) (Matrix (Fin 2) (Fin 2) (ℚ))).toAlgHom
    let f := (genericRepresentationRing_equiv D hD (ℚ)).symm ⟨ρ, by sorry⟩
    (genericRepresentation D hD (!![2,3;5,7] : Matrix (Fin 2) (Fin 2) ℚ)).map f = (!![2,3;5,7] : Matrix (Fin 2) (Fin 2) ℚ) ∧
      (genericRepresentationRing_equiv D hD (ℚ) f).val (1 ⊗ₜ[ℚ] (!![2,3;5,7] : Matrix (Fin 2) (Fin 2) ℚ)) = (!![2,3;5,7] : Matrix (Fin 2) (Fin 2) ℚ) := sorry

/-- `generic_char_two`: specializing at the identity representation retains the entire matrix. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id (ZMod 2) (Matrix (Fin 2) (Fin 2) (ZMod 2)))
    let hD : D.IsCayleyHamilton := by sorry
    let ρ := (Algebra.TensorProduct.lid (ZMod 2) (Matrix (Fin 2) (Fin 2) (ZMod 2))).toAlgHom
    let f := (genericRepresentationRing_equiv D hD (ZMod 2)).symm ⟨ρ, by sorry⟩
    (genericRepresentation D hD (!![1,1;1,0] : Matrix (Fin 2) (Fin 2) (ZMod 2))).map f = (!![1,1;1,0] : Matrix (Fin 2) (Fin 2) (ZMod 2)) ∧
      (genericRepresentationRing_equiv D hD (ZMod 2) f).val (1 ⊗ₜ[ZMod 2] (!![1,1;1,0] : Matrix (Fin 2) (Fin 2) (ZMod 2))) = (!![1,1;1,0] : Matrix (Fin 2) (Fin 2) (ZMod 2)) := sorry

/-- `universal_quotient_line_commutes`: degree one kills all group commutators. -/
example {G : Type} [Group G] (g h : G) :
    universalAlgebra_quotientMap G 1 (MonoidAlgebra.of _ G g) *
      universalAlgebra_quotientMap G 1 (MonoidAlgebra.of _ G h) =
    universalAlgebra_quotientMap G 1 (MonoidAlgebra.of _ G h) *
      universalAlgebra_quotientMap G 1 (MonoidAlgebra.of _ G g) := sorry
/-- `universal_quotient_two_noncommutes`: degree two retains the noncommuting unipotent specialization. -/
example :
    universalAlgebra_quotientMap (FreeGroup (Fin 2)) 2
      (MonoidAlgebra.of _ _ (FreeGroup.of 0)) *
    universalAlgebra_quotientMap (FreeGroup (Fin 2)) 2
      (MonoidAlgebra.of _ _ (FreeGroup.of 1)) ≠
    universalAlgebra_quotientMap (FreeGroup (Fin 2)) 2
      (MonoidAlgebra.of _ _ (FreeGroup.of 1)) *
    universalAlgebra_quotientMap (FreeGroup (Fin 2)) 2
      (MonoidAlgebra.of _ _ (FreeGroup.of 0)) := sorry

section
variable {G : Type} [Group G]
variable (r : ℚ ⊗[ℤ] MonoidAlgebra ℤ G →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ)
variable (g h : G)
variable (hg : r (1 ⊗ₜ[ℤ] MonoidAlgebra.of ℤ G g) = !![1,2;0,1])
variable (hh : r (1 ⊗ₜ[ℤ] MonoidAlgebra.of ℤ G h) = !![1,0;3,1])
include hg hh
/-- `lift_product_order`: the lift preserves the ordered product UV, not VU. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id ℚ (Matrix (Fin 2) (Fin 2) ℚ))
    let φ := (Determinant.coordinateRingEquiv 2 ℚ).symm (D.comap r)
    letI := Algebra.compHom (Matrix (Fin 2) (Fin 2) ℚ) φ.toRingHom
    universalAlgebra_lift 2 φ D (by sorry) r (by sorry)
      (universalAlgebra_quotientMap G 2 (MonoidAlgebra.of _ G (g*h))) = !![7,2;3,1] := sorry
/-- `lift_reverse_order`: reversing the two generators moves the diagonal cross term. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id ℚ (Matrix (Fin 2) (Fin 2) ℚ))
    let φ := (Determinant.coordinateRingEquiv 2 ℚ).symm (D.comap r)
    letI := Algebra.compHom (Matrix (Fin 2) (Fin 2) ℚ) φ.toRingHom
    universalAlgebra_lift 2 φ D (by sorry) r (by sorry)
      (universalAlgebra_quotientMap G 2 (MonoidAlgebra.of _ G (h*g))) = !![1,2;3,7] := sorry
/-- `lift_difference`: the two-term commutator is diag(6,-6). -/
example :
    let D := Determinant.ofMatrix (AlgHom.id ℚ (Matrix (Fin 2) (Fin 2) ℚ))
    let φ := (Determinant.coordinateRingEquiv 2 ℚ).symm (D.comap r)
    letI := Algebra.compHom (Matrix (Fin 2) (Fin 2) ℚ) φ.toRingHom
    universalAlgebra_lift 2 φ D (by sorry) r (by sorry)
      (universalAlgebra_quotientMap G 2
        (MonoidAlgebra.of _ G (g*h) - MonoidAlgebra.of _ G (h*g))) = !![6,0;0,-6] := sorry

/-- `specialization_equiv_product`: tensor specialization preserves the ordered group product. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id ℚ (Matrix (Fin 2) (Fin 2) ℚ))
    let φ := (Determinant.coordinateRingEquiv 2 ℚ).symm (D.comap r)
    letI := φ.toRingHom.toAlgebra
    let x := universalAlgebra_specializationEquiv 2 φ
      (1 ⊗ₜ[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) 2]
        universalAlgebra_quotientMap G 2 (MonoidAlgebra.of _ G (g*h)))
    ∃ f : CHQuotient (universalSpecialization 2 φ) →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ,
      (∀ z, f (chQuotientMap _ z) = r z) ∧ f x = !![7,2;3,1] := sorry
/-- `specialization_equiv_reverse`: the other product has diagonal entries 1 and 7. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id ℚ (Matrix (Fin 2) (Fin 2) ℚ))
    let φ := (Determinant.coordinateRingEquiv 2 ℚ).symm (D.comap r)
    letI := φ.toRingHom.toAlgebra
    let x := universalAlgebra_specializationEquiv 2 φ
      (1 ⊗ₜ[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) 2]
        universalAlgebra_quotientMap G 2 (MonoidAlgebra.of _ G (h*g)))
    ∃ f : CHQuotient (universalSpecialization 2 φ) →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ,
      (∀ z, f (chQuotientMap _ z) = r z) ∧ f x = !![1,2;3,7] := sorry
/-- `specialization_equiv_difference`: the two-term image detects both order and sign. -/
example :
    let D := Determinant.ofMatrix (AlgHom.id ℚ (Matrix (Fin 2) (Fin 2) ℚ))
    let φ := (Determinant.coordinateRingEquiv 2 ℚ).symm (D.comap r)
    letI := φ.toRingHom.toAlgebra
    let x := universalAlgebra_specializationEquiv 2 φ
      (1 ⊗ₜ[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) 2]
        universalAlgebra_quotientMap G 2
          (MonoidAlgebra.of _ G (g*h) - MonoidAlgebra.of _ G (h*g)))
    ∃ f : CHQuotient (universalSpecialization 2 φ) →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ,
      (∀ z, f (chQuotientMap _ z) = r z) ∧ f x = !![6,0;0,-6] := sorry
end

end Checks

end CayleyHamilton
end

/-! ## Layer IHG.2: integral and derived Hecke actions -/

namespace HeckeImage
open CategoryTheory
open scoped ModuleCat.Algebra ZeroObject
variable {A : Type u} [CommRing A]
local instance derivedAvailable : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
variable {H : Type u} [CommRing H] [Algebra A H]
/-- Actual derived cohomology action, using Mathlib's homology functor. -/
def cohomologyAction (C : DerivedCategory (ModuleCat.{u} A)) :
    End C →ₐ[A] ∀ i : ℤ, End ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C) := sorry

theorem cohomologyAction_apply (C : DerivedCategory (ModuleCat.{u} A)) (f : End C) (i : ℤ) :
    cohomologyAction C f i = (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map f := sorry

def ghostIdeal (C : DerivedCategory (ModuleCat.{u} A)) : TwoSidedIdeal (End C) :=
  TwoSidedIdeal.ker (cohomologyAction C).toRingHom
theorem mem_ghostIdeal (C : DerivedCategory (ModuleCat.{u} A)) (f : End C) :
    f ∈ ghostIdeal C ↔ ∀ i : ℤ, (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map f=0 := sorry
/-- Kernel on the source algebra, including the kernel of the derived action. -/
def actionGhostKernel (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) : Ideal H :=
  RingHom.ker ((cohomologyAction C).comp α).toRingHom

instance derivedCommRing (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    CommRing ((α).range) := { (inferInstance : Ring ((α).range)) with mul_comm := sorry }
def imageGhostIdeal (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    Ideal ((α).range) :=
  RingHom.ker ((cohomologyAction C).comp ((α).range).val).toRingHom
def cohomologyImage_quotient (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    (((α).range) ⧸ imageGhostIdeal C α) ≃ₐ[A] ((HeckeImage.cohomologyAction C).comp α).range := sorry
/-- The image of a specified derived idempotent, with its splitting maps below. -/
def localizedComplex (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Inclusion of the selected summand. -/
def localizedComplex_ι (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) :
    localizedComplex C e he ⟶ C := sorry
/-- Projection onto the selected summand. -/
def localizedComplex_π (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) :
    C ⟶ localizedComplex C e he := sorry
theorem localizedComplex_split (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) :
    localizedComplex_ι C e he ≫ localizedComplex_π C e he = 𝟙 _ ∧
    localizedComplex_π C e he ≫ localizedComplex_ι C e he = e := sorry

def localizedComplex_homology (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e)
    (i : ℤ) : (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj (localizedComplex C e he) ≅
      ModuleCat.of A (LinearMap.range
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map e).hom) := sorry
/-- Two complementary factors; the finite multi-factor statement is obtained iteratively. -/
def localizedComplex_decomposition (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) :
    localizedComplex C e he ⊞ localizedComplex C (1-e) (IsIdempotentElem.one_sub he) ≅ C := sorry
/-- the mapping telescope, for arbitrary operators. -/
def operatorLocalization (C : DerivedCategory (ModuleCat.{u} A)) (t : End C) :
    DerivedCategory (ModuleCat.{u} A) := sorry
/-- The canonical sequential colimit with transition from i to j given by t^(j-i). -/
abbrev moduleTelescope (M : ModuleCat.{u} A) (t : M →ₗ[A] M) : ModuleCat.{u} A :=
  ModuleCat.of A (Module.DirectLimit (fun _ : ℕ => M) (fun i j _ => t^(j-i)))
/-- Mathlib's insertion of the nth stage into the sequential colimit. -/
abbrev moduleTelescope_ι (M : ModuleCat.{u} A) (t : M →ₗ[A] M) (n : ℕ) :
    M →ₗ[A] moduleTelescope M t :=
  Module.DirectLimit.of A ℕ (fun _ : ℕ => M) (fun i j _ => t^(j-i)) n
def operatorLocalization_homology (C : DerivedCategory (ModuleCat.{u} A)) (t : End C) (i : ℤ) :
    (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj (operatorLocalization C t) ≅
      moduleTelescope ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map t).hom := sorry
/-- The selected summand is t-invertible and the complementary summand is nilpotent.
These conditions use only the derived category. -/
def operatorLocalization_idempotent (C : DerivedCategory (ModuleCat.{u} A)) (t e : End C)
    (he : e*e=e) (hte : t*e=e*t)
    (hinv : ∃ u : End C, u=e*u*e ∧ t*u=e ∧ u*t=e)
    (hnil : ∃ n : ℕ, 0 < n ∧ (t*(1-e))^n=0) :
    operatorLocalization C t ≅ localizedComplex C e he := sorry

/-- The quotient sends the derived class of h to its action on every cohomology group. -/
theorem cohomologyImage_quotient_mk (C : DerivedCategory (ModuleCat.{u} A))
    (α : H →ₐ[A] End C) (h : H) :
    (cohomologyImage_quotient C α
      (Ideal.Quotient.mk _ (α.rangeRestrict h))).val = cohomologyAction C (α h) := sorry

theorem localizedComplex_homology_ι (C : DerivedCategory (ModuleCat.{u} A))
    (e : End C) (he : e*e=e) (i : ℤ) :
    (localizedComplex_homology C e he i).hom ≫
      ModuleCat.ofHom (LinearMap.range
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map e).hom).subtype =
    (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map (localizedComplex_ι C e he) := sorry

theorem localizedComplex_decomposition_hom (C : DerivedCategory (ModuleCat.{u} A))
    (e : End C) (he : e*e=e) :
    (localizedComplex_decomposition C e he).hom =
      Limits.biprod.desc (localizedComplex_ι C e he)
        (localizedComplex_ι C (1-e) (IsIdempotentElem.one_sub he)) := sorry

/-- The map from the nth copy of C to its telescope. -/
def operatorLocalization_ι (C : DerivedCategory (ModuleCat.{u} A)) (t : End C) (n : ℕ) :
    C ⟶ operatorLocalization C t := sorry

theorem operatorLocalization_relation (C : DerivedCategory (ModuleCat.{u} A))
    (t : End C) (n : ℕ) : t ≫ operatorLocalization_ι C t (n+1) =
      operatorLocalization_ι C t n := sorry

theorem operatorLocalization_homology_ι (C : DerivedCategory (ModuleCat.{u} A))
    (t : End C) (i : ℤ) (n : ℕ)
    (x : (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C) :
    (operatorLocalization_homology C t i).hom.hom
      (((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map
        (operatorLocalization_ι C t n)).hom x) =
    moduleTelescope_ι _ ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map t).hom n x := sorry

/-- The identification sends the initial copy of C to its selected projection. -/
theorem operatorLocalization_idempotent_ι (C : DerivedCategory (ModuleCat.{u} A))
    (t e : End C) (he : e*e=e) (hte : t*e=e*t)
    (hinv : ∃ u : End C, u=e*u*e ∧ t*u=e ∧ u*t=e)
    (hnil : ∃ n : ℕ, 0 < n ∧ (t*(1-e))^n=0) :
    operatorLocalization_ι C t 0 ≫
      (operatorLocalization_idempotent C t e he hte hinv hnil).hom =
    localizedComplex_π C e he := sorry

/-- A telescope is characterized by the cone of identity minus the forward shift.
The coproduct and its cohomology comparison are constructed for module derived categories. -/
instance derivedCountableCoproducts :
    Limits.HasCoproductsOfShape ℕ (DerivedCategory (ModuleCat.{u} A)) := sorry

theorem operatorLocalization_triangle (C : DerivedCategory (ModuleCat.{u} A)) (t : End C) :
    ∃ δ : operatorLocalization C t ⟶ (∐ fun _ : ℕ => C)⟦(1 : ℤ)⟧,
      Pretriangulated.Triangle.mk
        (Limits.Sigma.desc (fun n : ℕ => Limits.Sigma.ι (fun _ : ℕ => C) n -
          t ≫ Limits.Sigma.ι (fun _ : ℕ => C) (n+1)))
        (Limits.Sigma.desc (operatorLocalization_ι C t)) δ ∈
      distTriang (DerivedCategory (ModuleCat.{u} A)) := sorry


/-- Adjacent relations present the canonical sequential colimit. -/
theorem moduleTelescope_presentation (M : ModuleCat.{u} A) (t : M →ₗ[A] M) :
    ∃ ε : ((ℕ →₀ M) ⧸ Submodule.span A
        {z | ∃ n x, z = Finsupp.single n x - Finsupp.single (n+1) (t x)}) ≃ₗ[A]
        moduleTelescope M t,
      ∀ n x, ε (Submodule.Quotient.mk (Finsupp.single n x)) =
        moduleTelescope_ι M t n x := sorry

/-! Scalar, ghost and projector computations. -/

attribute [-instance] CategoryTheory.Linear.preadditiveIntLinear in
set_option maxHeartbeats 800000 in
/-- `hecke_zero`: the zero object has zero image, and the entire source acts as ghosts. -/
example :
    let C : DerivedCategory (ModuleCat ℤ) := 0
    let α : ℤ →ₐ[ℤ] End C := Algebra.ofId ℤ _
    cohomologyAction C (α 7) = 0 ∧ ghostIdeal C = ⊥ ∧
    actionGhostKernel C α = ⊤ ∧ imageGhostIdeal C α = ⊤ ∧
    (cohomologyImage_quotient C α (Ideal.Quotient.mk _ (α.rangeRestrict 7))).val = 0 := sorry

attribute [-instance] CategoryTheory.Linear.preadditiveIntLinear in
set_option maxHeartbeats 800000 in
/-- `hecke_scalar`: on Z[0], the scalar 2 sends 3 to 6 and neither ghost kernel is nonzero. -/
example :
    let M := ModuleCat.of ℤ ℤ
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj M
    let ε := (DerivedCategory.singleFunctorCompHomologyFunctorIso (ModuleCat ℤ) 0).app M
    let α : ℤ →ₐ[ℤ] End C := Algebra.ofId ℤ _
    ε.hom.hom ((cohomologyAction C (α 2) 0).hom (ε.inv.hom (3 : ℤ))) = (6 : ℤ) ∧
    ghostIdeal C = ⊥ ∧ actionGhostKernel C α = ⊥ ∧ imageGhostIdeal C α = ⊥ ∧
    ε.hom.hom (((cohomologyImage_quotient C α
      (Ideal.Quotient.mk _ (α.rangeRestrict 2))).val 0).hom (ε.inv.hom (3 : ℤ))) = (6 : ℤ) := sorry

attribute [-instance] CategoryTheory.Linear.preadditiveIntLinear in
set_option maxHeartbeats 800000 in
/-- `hecke_ext_two`: X acts as a nonzero Ext^1 ghost on F₂[0] ⊕ F₂[−1].
The action kernel is (2,X²), whereas its cohomology kernel is (2,X). -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ (ZMod 2)) ⊞
      (DerivedCategory.singleFunctor (ModuleCat ℤ) 1).obj (ModuleCat.of ℤ (ZMod 2))
    ∃ α : Polynomial ℤ →ₐ[ℤ] End C,
      α X ≠ 0 ∧ α X * α X = 0 ∧ α X ∈ ghostIdeal C ∧
      cohomologyAction C (α X) = 0 ∧
      RingHom.ker α.toRingHom = Ideal.span {(2 : Polynomial ℤ), X^2} ∧
      actionGhostKernel C α = Ideal.span {(2 : Polynomial ℤ), X} ∧
      α.rangeRestrict X ∈ imageGhostIdeal C α ∧
      α.rangeRestrict X ≠ 0 ∧ imageGhostIdeal C α ^ 2 = ⊥ ∧
      (cohomologyImage_quotient C α (Ideal.Quotient.mk _ (α.rangeRestrict X))).val = 0 ∧
      (cohomologyImage_quotient C α (Ideal.Quotient.mk _ (α.rangeRestrict 1))).val ≠ 0 := sorry

attribute [-instance] CategoryTheory.Linear.preadditiveIntLinear in
set_option maxHeartbeats 800000 in
/-- `hecke_kernel_not_image`: evaluation X↦0 on Z[0] has source ghost kernel (X),
but the ideal inside its faithful derived image is zero. -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ ℤ)
    let α := (Algebra.ofId ℤ (End C)).comp (Polynomial.aeval (0 : ℤ))
    actionGhostKernel C α = Ideal.span {X} ∧ imageGhostIdeal C α = ⊥ := sorry

/-- `summand_zero`: the chosen projector sends (2,3) to (0, 0);
the decomposition sends the two test inputs (2,5),(7,3) to (7, 3). -/
example :
    let M := ModuleCat.of ℤ (ℤ × ℤ)
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj M
    let F := DerivedCategory.homologyFunctor (ModuleCat ℤ) 0
    let ε := (DerivedCategory.singleFunctorCompHomologyFunctorIso (ModuleCat ℤ) 0).app M
    let e : End C := 0
    let he : e*e=e := by sorry
    let x := ε.inv.hom (2, 3)
    let y := (F.map (localizedComplex_π C e he)).hom x
    ε.hom.hom ((localizedComplex_homology C e he 0).hom.hom y).val = (0, 0) ∧
    ε.hom.hom ((F.map (localizedComplex_ι C e he)).hom y) = (0, 0) ∧
    ε.hom.hom ((F.map (localizedComplex_decomposition C e he).hom).hom
      ((F.map (localizedComplex_π C e he ≫ Limits.biprod.inl)).hom (ε.inv.hom (2, 5)) +
       (F.map (localizedComplex_π C (1-e) (IsIdempotentElem.one_sub he) ≫ Limits.biprod.inr)).hom
         (ε.inv.hom (7, 3)))) = (7, 3) := sorry

/-- `summand_identity`: the chosen projector sends (2,3) to (2, 3);
the decomposition sends the two test inputs (2,5),(7,3) to (2, 5). -/
example :
    let M := ModuleCat.of ℤ (ℤ × ℤ)
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj M
    let F := DerivedCategory.homologyFunctor (ModuleCat ℤ) 0
    let ε := (DerivedCategory.singleFunctorCompHomologyFunctorIso (ModuleCat ℤ) 0).app M
    let e : End C := 1
    let he : e*e=e := by sorry
    let x := ε.inv.hom (2, 3)
    let y := (F.map (localizedComplex_π C e he)).hom x
    ε.hom.hom ((localizedComplex_homology C e he 0).hom.hom y).val = (2, 3) ∧
    ε.hom.hom ((F.map (localizedComplex_ι C e he)).hom y) = (2, 3) ∧
    ε.hom.hom ((F.map (localizedComplex_decomposition C e he).hom).hom
      ((F.map (localizedComplex_π C e he ≫ Limits.biprod.inl)).hom (ε.inv.hom (2, 5)) +
       (F.map (localizedComplex_π C (1-e) (IsIdempotentElem.one_sub he) ≫ Limits.biprod.inr)).hom
         (ε.inv.hom (7, 3)))) = (2, 5) := sorry

/-- `summand_first`: the chosen projector sends (2,3) to (2, 0);
the decomposition sends the two test inputs (2,5),(7,3) to (2, 3). -/
example :
    let M := ModuleCat.of ℤ (ℤ × ℤ)
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj M
    let F := DerivedCategory.homologyFunctor (ModuleCat ℤ) 0
    let ε := (DerivedCategory.singleFunctorCompHomologyFunctorIso (ModuleCat ℤ) 0).app M
    let e : End C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).map (ModuleCat.ofHom ((LinearMap.inl ℤ ℤ ℤ).comp (LinearMap.fst ℤ ℤ ℤ)))
    let he : e*e=e := by sorry
    let x := ε.inv.hom (2, 3)
    let y := (F.map (localizedComplex_π C e he)).hom x
    ε.hom.hom ((localizedComplex_homology C e he 0).hom.hom y).val = (2, 0) ∧
    ε.hom.hom ((F.map (localizedComplex_ι C e he)).hom y) = (2, 0) ∧
    ε.hom.hom ((F.map (localizedComplex_decomposition C e he).hom).hom
      ((F.map (localizedComplex_π C e he ≫ Limits.biprod.inl)).hom (ε.inv.hom (2, 5)) +
       (F.map (localizedComplex_π C (1-e) (IsIdempotentElem.one_sub he) ≫ Limits.biprod.inr)).hom
         (ε.inv.hom (7, 3)))) = (2, 3) := sorry

/-- `summand_object_zero`: the selected object has rank zero in degree zero. -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ (ℤ × ℤ))
    Limits.IsZero (localizedComplex C 0 (by simp)) := sorry

/-- `summand_object_identity`: the selected object has rank two in degree zero. -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ (ℤ × ℤ))
    Nonempty (localizedComplex C 1 (by simp) ≅ C) := sorry

/-- `summand_object_first`: the selected object has rank one in degree zero. -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ (ℤ × ℤ))
    let e : End C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).map
      (ModuleCat.ofHom ((LinearMap.inl ℤ ℤ ℤ).comp (LinearMap.fst ℤ ℤ ℤ)))
    Nonempty (localizedComplex C e (by sorry) ≅ (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ ℤ)) := sorry

/-- `telescope_zero`: stage one of (2,3) is represented at stage zero by (0, 0);
the comparison with the idempotent image has the same coordinates. -/
example :
    let M := ModuleCat.of ℤ (ℤ × ℤ)
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj M
    let F := DerivedCategory.homologyFunctor (ModuleCat ℤ) 0
    let ε := (DerivedCategory.singleFunctorCompHomologyFunctorIso (ModuleCat ℤ) 0).app M
    let e : End C := 0
    let he : e*e=e := by sorry
    let hinv : ∃ u : End C, u=e*u*e ∧ e*u=e ∧ u*e=e := by sorry
    let hnil : ∃ n : ℕ, 0<n ∧ (e*(1-e))^n=0 := by sorry
    let z := (F.map (operatorLocalization_ι C e 1)).hom (ε.inv.hom (2, 3))
    (operatorLocalization_homology C e 0).hom.hom z =
      moduleTelescope_ι (F.obj C) (F.map e).hom 0 (ε.inv.hom (0, 0)) ∧
    ε.hom.hom ((F.map ((operatorLocalization_idempotent C e e he rfl hinv hnil).hom ≫
      localizedComplex_ι C e he)).hom z) = (0, 0) := sorry

/-- `telescope_identity`: stage one of (2,3) is represented at stage zero by (2, 3);
the comparison with the idempotent image has the same coordinates. -/
example :
    let M := ModuleCat.of ℤ (ℤ × ℤ)
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj M
    let F := DerivedCategory.homologyFunctor (ModuleCat ℤ) 0
    let ε := (DerivedCategory.singleFunctorCompHomologyFunctorIso (ModuleCat ℤ) 0).app M
    let e : End C := 1
    let he : e*e=e := by sorry
    let hinv : ∃ u : End C, u=e*u*e ∧ e*u=e ∧ u*e=e := by sorry
    let hnil : ∃ n : ℕ, 0<n ∧ (e*(1-e))^n=0 := by sorry
    let z := (F.map (operatorLocalization_ι C e 1)).hom (ε.inv.hom (2, 3))
    (operatorLocalization_homology C e 0).hom.hom z =
      moduleTelescope_ι (F.obj C) (F.map e).hom 0 (ε.inv.hom (2, 3)) ∧
    ε.hom.hom ((F.map ((operatorLocalization_idempotent C e e he rfl hinv hnil).hom ≫
      localizedComplex_ι C e he)).hom z) = (2, 3) := sorry

/-- `telescope_first`: stage one of (2,3) is represented at stage zero by (2, 0);
the comparison with the idempotent image has the same coordinates. -/
example :
    let M := ModuleCat.of ℤ (ℤ × ℤ)
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj M
    let F := DerivedCategory.homologyFunctor (ModuleCat ℤ) 0
    let ε := (DerivedCategory.singleFunctorCompHomologyFunctorIso (ModuleCat ℤ) 0).app M
    let e : End C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).map (ModuleCat.ofHom ((LinearMap.inl ℤ ℤ ℤ).comp (LinearMap.fst ℤ ℤ ℤ)))
    let he : e*e=e := by sorry
    let hinv : ∃ u : End C, u=e*u*e ∧ e*u=e ∧ u*e=e := by sorry
    let hnil : ∃ n : ℕ, 0<n ∧ (e*(1-e))^n=0 := by sorry
    let z := (F.map (operatorLocalization_ι C e 1)).hom (ε.inv.hom (2, 3))
    (operatorLocalization_homology C e 0).hom.hom z =
      moduleTelescope_ι (F.obj C) (F.map e).hom 0 (ε.inv.hom (2, 0)) ∧
    ε.hom.hom ((F.map ((operatorLocalization_idempotent C e e he rfl hinv hnil).hom ≫
      localizedComplex_ι C e he)).hom z) = (2, 0) := sorry

/-- `telescope_object_zero`: the selected object has rank zero in degree zero. -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ (ℤ × ℤ))
    Limits.IsZero (operatorLocalization C 0) := sorry

/-- `telescope_object_identity`: the selected object has rank two in degree zero. -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ (ℤ × ℤ))
    Nonempty (operatorLocalization C 1 ≅ C) := sorry

/-- `telescope_object_first`: the selected object has rank one in degree zero. -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ (ℤ × ℤ))
    let e : End C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).map
      (ModuleCat.ofHom ((LinearMap.inl ℤ ℤ ℤ).comp (LinearMap.fst ℤ ℤ ℤ)))
    Nonempty (operatorLocalization C e ≅ (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ ℤ)) := sorry

/-- `module_telescope_zero`: zero transitions kill the generator at stage seven. -/
example : moduleTelescope_ι (ModuleCat.of ℤ ℤ) 0 7 3 = 0 := sorry

/-- `module_telescope_identity`: the canonical sum map sends every [n,x] to x. -/
example : ∃ ε : moduleTelescope (ModuleCat.of ℤ ℤ) LinearMap.id ≃ₗ[ℤ] ℤ,
    ∀ n x, ε (moduleTelescope_ι (ModuleCat.of ℤ ℤ) LinearMap.id n x) = x := sorry

/-- `module_telescope_first`: the limit of the first projection sends [7,(2,3)] to 2. -/
example :
    let t := (LinearMap.inl ℤ ℤ ℤ).comp (LinearMap.fst ℤ ℤ ℤ)
    ∃ ε : moduleTelescope (ModuleCat.of ℤ (ℤ × ℤ)) t ≃ₗ[ℤ] ℤ,
      ∀ n x, ε (moduleTelescope_ι (ModuleCat.of ℤ (ℤ × ℤ)) t n x) = x.1 := sorry

/-- `telescope_two_term_sign`: for t=-1, the relation is [0,3]+[1,3]=0,
and the homology comparison sends stage one of 3 to minus stage zero of 3. -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ ℤ)
    let F := DerivedCategory.homologyFunctor (ModuleCat ℤ) 0
    let ε := (DerivedCategory.singleFunctorCompHomologyFunctorIso (ModuleCat ℤ) 0).app
      (ModuleCat.of ℤ ℤ)
    let x := ε.inv.hom (3 : ℤ)
    (operatorLocalization_homology C (-1) 0).hom.hom
      ((F.map (operatorLocalization_ι C (-1) 1)).hom x) =
      -moduleTelescope_ι (F.obj C) (F.map (-1 : End C)).hom 0 x ∧
    moduleTelescope_ι (ModuleCat.of ℤ ℤ) (-LinearMap.id) 0 3 +
      moduleTelescope_ι (ModuleCat.of ℤ ℤ) (-LinearMap.id) 1 3 = 0 := sorry

/-- `telescope_nonunit`: inverting 2 on Z does not give the zero module. -/
example : ∃ ε : moduleTelescope (ModuleCat.of ℤ ℤ) (2 • LinearMap.id) ≃ₗ[ℤ]
      Localization.Away (2 : ℤ),
    ε (moduleTelescope_ι (ModuleCat.of ℤ ℤ) (2 • LinearMap.id) 0 1) = 1 := sorry

/-- `endomorphism_two_term_order`: E₀₁E₁₀ sends (2,3) to (2,0),
whereas E₁₀E₀₁ sends it to (0,3), with multiplication g≫f. -/
example :
    let M := ModuleCat.of ℤ (Fin 2 → ℤ)
    let S := DerivedCategory.singleFunctor (ModuleCat ℤ) 0
    let F := DerivedCategory.homologyFunctor (ModuleCat ℤ) 0
    let ε := (DerivedCategory.singleFunctorCompHomologyFunctorIso (ModuleCat ℤ) 0).app M
    let f : End (S.obj M) := S.map (ModuleCat.ofHom (Matrix.toLin' !![0,1;0,0]))
    let g : End (S.obj M) := S.map (ModuleCat.ofHom (Matrix.toLin' !![0,0;1,0]))
    ε.hom.hom ((F.map (f*g)).hom (ε.inv.hom ![2,3])) = ![2,0] ∧
    ε.hom.hom ((F.map (g*f)).hom (ε.inv.hom ![2,3])) = ![0,3] := sorry

end HeckeImage

/-! ## Layers IHG.3a and IHG.3b: Hecke polynomials and maximal ideals of Galois type -/

namespace Spherical
attribute [local instance] Ideal.Quotient.field

variable {A : Type u} [CommRing A]

def glnPolynomial (n : ℕ) (q : A) (T : Fin (n+1) → A) : A[X] :=
  ∑ i : Fin (n+1), C ((-1)^i.val * q^(i.val*(i.val-1)/2) * T i) * X^(n-i.val)
theorem glnPolynomial_coeff (n : ℕ) (q : A) (T : Fin (n+1) → A) (i : Fin (n+1)) :
    (glnPolynomial n q T).coeff (n-i.val) = (-1)^i.val * q^(i.val*(i.val-1)/2)*T i := sorry
theorem glnPolynomial_monic (n : ℕ) (q : A) (T : Fin (n+1) → A) (hT : T 0=1) :
    (glnPolynomial n q T).Monic := sorry
/-- The monic GSp₄ spin polynomial: the reflection `SpinPolynomial.reciprocal` of the spin polynomial
of SmoothRepresentationsOfLocalGroups, SR.4, with `T₁, T₂` here equal to its `T2, T1`. -/
def gsp4SpinPolynomial (q T₀ T₁ T₂ : A) : A[X] :=
  Polynomial.reflect 4 (SmoothRepresentationsOfLocalGroups.SpinPolynomial q T₀ T₂ T₁)
theorem gsp4SpinPolynomial_constant (q T₀ T₁ T₂ : A) :
    (gsp4SpinPolynomial q T₀ T₁ T₂).coeff 0=q^6*T₀^2 := sorry
theorem gsp4SpinPolynomial_map {B : Type u} [CommRing B] (φ : A →+* B)
    (q T₀ T₁ T₂ : A) : (gsp4SpinPolynomial q T₀ T₁ T₂).map φ =
    gsp4SpinPolynomial (φ q) (φ T₀) (φ T₁) (φ T₂) := sorry
/-- with an actual inverted central unit. -/
def gsp4DualSpinPolynomial (q : A) (T₀ : Aˣ) (T₁ T₂ : A) : A[X] :=
  X^4-C ((↑T₀⁻¹)*T₁)*X^3+C ((↑T₀⁻¹)^2*(q*T₂+(q^3+q)*↑T₀))*X^2-
    C (q^3*(↑T₀⁻¹)^2*T₁)*X+C (q^6*(↑T₀⁻¹)^2)
theorem gsp4DualSpinPolynomial_constant (q : A) (T₀ : Aˣ) (T₁ T₂ : A) :
    (gsp4DualSpinPolynomial q T₀ T₁ T₂).coeff 0=q^6*(↑T₀⁻¹)^2 := sorry
/-- Coefficient-by-coefficient identity P(X)Q(0)=X⁴Q(q³/X). -/
theorem gsp4DualSpinPolynomial_reciprocal (q : Aˣ) (T₀ : Aˣ) (T₁ T₂ : A)
    (i : ℕ) (hi : i ≤ 4) :
    (gsp4DualSpinPolynomial (q : A) T₀ T₁ T₂).coeff i * ((q : A)^6*(T₀ : A)^2) =
      (gsp4SpinPolynomial (q : A) T₀ T₁ T₂).coeff (4-i)*(q : A)^(3*(4-i)) := sorry
/-- Degree requires a nonzero coefficient ring; monicity itself does not. -/
theorem glnPolynomial_natDegree [Nontrivial A] (n : ℕ) (q : A)
    (T : Fin (n+1) → A) (hT : T 0 = 1) : (glnPolynomial n q T).natDegree = n := sorry

/-- Integral coefficient change, with no square root of q. -/
theorem glnPolynomial_map {B : Type u} [CommRing B] (φ : A →+* B)
    (n : ℕ) (q : A) (T : Fin (n+1) → A) :
    (glnPolynomial n q T).map φ = glnPolynomial n (φ q) (φ ∘ T) := sorry

/-- The Satake coefficient formula over any commutative ring; no invertibility is needed
for this polynomial identity. The inner sum is the i-th elementary symmetric function. -/
theorem glnPolynomial_satake (n : ℕ) (s : A) (z : Fin n → A) :
    glnPolynomial n (s^2) (fun i ↦ s^(i.val*(n-i.val)) *
      ∑ I ∈ (Finset.univ : Finset (Fin n)).powersetCard i.val, ∏ j ∈ I, z j) =
      ∏ j : Fin n, (X - C (s^(n-1)*z j)) := sorry

/-- Coefficient form of double-coset inversion. The transformed generators are
T_(n-i)/T_n; the factor q^(i(n-1)) is the cyclotomic twist on inverse roots. -/
theorem glnPolynomial_inversion (n : ℕ) (q U : Aˣ) (T : Fin (n+1) → A)
    (hzero : T 0 = 1) (htop : T (Fin.last n) = (U : A)) (i : Fin (n+1)) :
    (glnPolynomial n (q : A)
      (fun j ↦ T ⟨n-j.val, by omega⟩ * (↑U⁻¹ : A))).coeff (n-i.val) *
        (glnPolynomial n (q : A) T).coeff 0 =
      (q : A)^(i.val*(n-1)) * (glnPolynomial n (q : A) T).coeff i.val := sorry

/-- Classical coefficient comparison with natural weights at least two. -/
theorem glnPolynomial_classical (q a ω : A) (k : ℕ) (hk : 2 ≤ k) :
    glnPolynomial 2 q ![1, a, ω*q^(k-2)] = X^2 - C a*X + C (ω*q^(k-1)) := sorry

/-- `l3a_gln_empty`: the empty determinant is 1, even at q=0. -/
example : glnPolynomial 0 (0 : ℤ) ![1] = 1 := by
  simp [glnPolynomial]
/-- `l3a_gln_linear`: rank one has no q factor. -/
example : glnPolynomial 1 (7 : ℤ) ![1, 3] = X - 3 := by
  norm_num [glnPolynomial, Fin.sum_univ_succ]; ring
/-- `l3a_gln_quadratic`: both signs and the first nonzero q exponent. -/
example : glnPolynomial 2 (2 : ℤ) ![1, 3, 5] = X^2 - 3*X + 10 := by
  norm_num [glnPolynomial, Fin.sum_univ_succ]; ring
/-- `l3a_gln_mod_two`: coefficient change kills the constant term, not monicity. -/
example : glnPolynomial 2 (0 : ZMod 2) ![1, 1, 1] = X^2 + X := by
  norm_num [glnPolynomial, Fin.sum_univ_succ]
  exact CharTwo.neg_eq _
/-- `l3a_gln_nonmonic`: the normalization T₀=1 is necessary. -/
example : ¬ (glnPolynomial 0 (1 : ℤ) ![0]).Monic := by
  simp [glnPolynomial, Polynomial.Monic]
/-- `l3a_satake_pair`: q=4, s=2 and parameters 3,5 give roots 6,10. -/
example : glnPolynomial 2 (4 : ℤ) ![1, 16, 15] = (X-6)*(X-10) := by
  norm_num [glnPolynomial, Fin.sum_univ_succ]; ring
/-- `l3a_inversion_pair`: q=2 and T=(1,5,3) distinguish inversion from reversal. -/
example : glnPolynomial 2 (2 : ℚ) ![1, 5/3, 1/3] =
    C (2/3) * (Polynomial.reflect 2 (glnPolynomial 2 (2 : ℚ) ![1,5,3])).comp
      (C (1/2)*X) := sorry
/-- `l3a_classical_pair`: weight four, q=2, a=3 and trivial nebentype. -/
example : glnPolynomial 2 (2 : ℤ) ![1,3,4] = X^2-3*X+8 := by
  norm_num [glnPolynomial, Fin.sum_univ_succ]; ring
/-- `l3a_weight_one_boundary`: natural subtraction would give the wrong determinant. -/
example : glnPolynomial 2 (2 : ℤ) ![1,3,1] ≠ X^2-3*X+1 := by
  intro h
  have h0 := congrArg (fun p : ℤ[X] ↦ p.eval 0) h
  norm_num [glnPolynomial, Fin.sum_univ_succ] at h0

/-- `l3a_spin_identity`: the identity parameter has four unit roots. -/
example : gsp4SpinPolynomial (1 : ℤ) 1 4 4 = (X-1)^4 := by
  rw [gsp4SpinPolynomial, SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal]
  norm_num; ring
/-- `l3a_spin_q_zero`: fixed-degree reflection retains a cubic term when the degree drops. -/
example : gsp4SpinPolynomial (0 : ℤ) 1 3 5 = X^4-3*X^3 := by
  rw [gsp4SpinPolynomial, SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal]
  norm_num
/-- `l3a_spin_index_order`: T₁=3 and T₂=5 distinguish the supplier's swapped indices. -/
example : gsp4SpinPolynomial (2 : ℤ) 1 3 5 = X^4-3*X^3+20*X^2-24*X+64 := by
  rw [gsp4SpinPolynomial, SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal]
  norm_num
/-- `l3a_dual_identity`: central and residue units equal to one. -/
example : gsp4DualSpinPolynomial (1 : ℤ) 1 4 4 = (X-1)^4 := by
  norm_num [gsp4DualSpinPolynomial]; ring
/-- `l3a_dual_q_zero`: the definition exists even when q is not invertible. -/
example : gsp4DualSpinPolynomial (0 : ℚ) (Units.mk0 2 (by norm_num)) 3 5 =
    X^4-C (3/2)*X^3 := by
  norm_num [gsp4DualSpinPolynomial]
/-- `l3a_dual_central`: q=T₀=2 gives a genuinely different monic polynomial. -/
example : gsp4DualSpinPolynomial (2 : ℚ) (Units.mk0 2 (by norm_num)) 3 5 =
    X^4-C (3/2)*X^3+C (15/2)*X^2-C 6*X+C 16 := by
  norm_num [gsp4DualSpinPolynomial]
/-- `l3a_scaled_reciprocal`: with q=2,T₀=2, Q(0)=256 and P(0)=16, not 1/256. -/
example : (gsp4SpinPolynomial (2 : ℚ) 2 3 5).coeff 0 = 256 ∧
    (gsp4DualSpinPolynomial (2 : ℚ) (Units.mk0 2 (by norm_num)) 3 5).coeff 0 = 16 := by
  rw [gsp4SpinPolynomial_constant, gsp4DualSpinPolynomial_constant]
  norm_num

/-- The finite residue field is explicit.
Residual semisimplicity uses the canonical module predicate. -/
def IsGaloisType {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G]
    (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ)
    (Frob : V → G) (P : V → (T ⧸ m)[X]) : Prop :=
  ∃ ρ : MonoidAlgebra (T ⧸ m) G →ₐ[T ⧸ m] Matrix (Fin n) (Fin n) (T ⧸ m),
    Continuous (fun g : G ↦ ρ (MonoidAlgebra.of (T ⧸ m) G g)) ∧
      IsSemisimpleModule (MonoidAlgebra (T ⧸ m) G) (matrixModule ρ) ∧
      ∀ v, Matrix.charpoly (ρ (MonoidAlgebra.of (T ⧸ m) G (Frob v)))=P v
/-- The same residue representation realizing the Frobenius polynomials is absolutely
irreducible. The Frobenius family is arbitrary data here. -/
def IsNonEisenstein {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G]
    (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ)
    (Frob : V → G) (P : V → (T ⧸ m)[X]) : Prop :=
  ∃ ρ : MonoidAlgebra (T ⧸ m) G →ₐ[T ⧸ m] Matrix (Fin n) (Fin n) (T ⧸ m),
    Continuous (fun g : G ↦ ρ (MonoidAlgebra.of (T ⧸ m) G g)) ∧
      IsSemisimpleModule (MonoidAlgebra (T ⧸ m) G) (matrixModule ρ) ∧ (Determinant.ofMatrix ρ).IsAbsolutelyIrreducible ∧
      ∀ v, Matrix.charpoly (ρ (MonoidAlgebra.of (T ⧸ m) G (Frob v)))=P v
/-- Density of the conjugacy saturation, continuity and Hausdorff coefficients are explicit.
Equality of determinants over an algebraic closure gives the semisimple isomorphism by IHG.1. -/
theorem galoisType_unique {G V : Type u} [Group G] [TopologicalSpace G]
    {k : Type u} [Field k] [TopologicalSpace k] [T2Space k] (n : ℕ) (Frob : V → G)
    (hdense : Dense {g : G | ∃ v h, g=h*Frob v*h⁻¹})
    (D E : Determinant k (MonoidAlgebra k G) n)
    (hD : D.IsContinuous) (hE : E.IsContinuous)
    (h : ∀ v, D.charpoly (MonoidAlgebra.of k G (Frob v)) =
      E.charpoly (MonoidAlgebra.of k G (Frob v))) : D=E := sorry

/-- Forget absolute irreducibility without changing the realizing representation. -/
theorem IsNonEisenstein.isGaloisType {T G V : Type u} [CommRing T] [Group G]
    [TopologicalSpace G] (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)]
    [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ)
    (Frob : V → G) (P : V → (T ⧸ m)[X]) (h : IsNonEisenstein m n Frob P) :
    IsGaloisType m n Frob P := by
  obtain ⟨ρ, hc, hs, _, hp⟩ := h
  exact ⟨ρ, hc, hs, hp⟩

/-- A non-Eisenstein system has positive rank, including with no Frobenius observations. -/
theorem IsNonEisenstein.pos {T G V : Type u} [CommRing T] [Group G]
    [TopologicalSpace G] (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)]
    [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ)
    (Frob : V → G) (P : V → (T ⧸ m)[X]) (h : IsNonEisenstein m n Frob P) :
    0 < n := by
  obtain ⟨_, _, _, hirr, _⟩ := h
  exact hirr.1

/-- Each observed polynomial is monic of the specified degree with nonzero constant term.
The latter uses that the observed element belongs to a group. -/
theorem IsGaloisType.polynomial {T G V : Type u} [CommRing T] [Group G]
    [TopologicalSpace G] (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)]
    [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ)
    (Frob : V → G) (P : V → (T ⧸ m)[X]) (h : IsGaloisType m n Frob P) (v : V) :
    (P v).Monic ∧ (P v).natDegree = n ∧ (P v).coeff 0 ≠ 0 := sorry

/-- Tensor by a continuous unit-valued character. Roots are multiplied by its value. -/
theorem galoisType_twist {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G]
    (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)]
    [DiscreteTopology (T ⧸ m)] (n : ℕ) (Frob : V → G) (P : V → (T ⧸ m)[X])
    (θ : G →* (T ⧸ m)ˣ) (hθ : Continuous θ) (h : IsGaloisType m n Frob P) :
    IsGaloisType m n Frob (fun v ↦ (P v).scaleRoots (θ (Frob v) : T ⧸ m)) := sorry

/-- The character twist of a non-Eisenstein system remains non-Eisenstein. -/
theorem nonEisenstein_twist {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G]
    (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)]
    [DiscreteTopology (T ⧸ m)] (n : ℕ) (Frob : V → G) (P : V → (T ⧸ m)[X])
    (θ : G →* (T ⧸ m)ˣ) (hθ : Continuous θ) (h : IsNonEisenstein m n Frob P) :
    IsNonEisenstein m n Frob (fun v ↦ (P v).scaleRoots (θ (Frob v) : T ⧸ m)) := sorry

/-- Contragredient followed by a continuous character twist. The nonzero constant
coefficient normalizes the reflected polynomial to be monic, also in rank zero. -/
theorem galoisType_dual_twist {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G]
    (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)]
    [DiscreteTopology (T ⧸ m)] (n : ℕ) (Frob : V → G) (P : V → (T ⧸ m)[X])
    (θ : G →* (T ⧸ m)ˣ) (hθ : Continuous θ) (h : IsGaloisType m n Frob P) :
    IsGaloisType m n Frob (fun v ↦
      (C ((P v).coeff 0)⁻¹ * (P v).reflect n).scaleRoots (θ (Frob v) : T ⧸ m)) := sorry

/-- Absolute irreducibility is preserved by contragredient and character twist. -/
theorem nonEisenstein_dual_twist {T G V : Type u} [CommRing T] [Group G]
    [TopologicalSpace G] (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)]
    [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ)
    (Frob : V → G) (P : V → (T ⧸ m)[X]) (θ : G →* (T ⧸ m)ˣ)
    (hθ : Continuous θ) (h : IsNonEisenstein m n Frob P) :
    IsNonEisenstein m n Frob (fun v ↦
      (C ((P v).coeff 0)⁻¹ * (P v).reflect n).scaleRoots (θ (Frob v) : T ⧸ m)) := sorry

/-- `l3b_zero`: the zero-dimensional system has polynomial 1 and is not non-Eisenstein. -/
example : IsGaloisType (⊥ : Ideal (ZMod 2)) 0 (id : Unit → Unit) (fun _ ↦ 1) ∧
    ¬ IsNonEisenstein (⊥ : Ideal (ZMod 2)) 0 (id : Unit → Unit) (fun _ ↦ 1) := by
  constructor
  · sorry
  · intro h
    exact (Nat.lt_irrefl 0) (IsNonEisenstein.pos _ _ _ _ h)

/-- `l3b_line`: the trivial line over F₂ is Galois type and absolutely irreducible. -/
example : IsGaloisType (⊥ : Ideal (ZMod 2)) 1 (id : Unit → Unit) (fun _ ↦ X - 1) ∧
    IsNonEisenstein (⊥ : Ideal (ZMod 2)) 1 (id : Unit → Unit) (fun _ ↦ X - 1) := sorry

/-- `l3b_split_pair`: even two equal characters give a semisimple, reducible system. -/
example : IsGaloisType (⊥ : Ideal (ZMod 2)) 2 (id : Unit → Unit) (fun _ ↦ (X - 1)^2) ∧
    ¬ IsNonEisenstein (⊥ : Ideal (ZMod 2)) 2 (id : Unit → Unit)
      (fun _ ↦ (X - 1)^2) := sorry

/-- `l3b_wrong_identity`: at the identity in rank one, X-2 over F₅ is impossible. -/
example : letI : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩
    ¬ IsGaloisType (⊥ : Ideal (ZMod 5)) 1 (id : Unit → Unit)
    (fun _ ↦ X - C 2) := by
  let : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩
  rintro ⟨ρ, _, _, hp⟩
  have h := hp ()
  have hone : MonoidAlgebra.of ((ZMod 5) ⧸ (⊥ : Ideal (ZMod 5))) Unit () = 1 :=
    map_one (MonoidAlgebra.of _ _)
  rw [hone, map_one, Matrix.charpoly_one] at h
  have hc := congrArg (fun p ↦ p.coeff 0) h
  norm_num at hc
  have hz : (1 : (ZMod 5) ⧸ (⊥ : Ideal (ZMod 5))) = 0 := by
    linear_combination -hc
  exact one_ne_zero hz

/-- `l3b_zero_root`: an invertible group action cannot have zero as an eigenvalue. -/
example : ¬ IsGaloisType (⊥ : Ideal (ZMod 2)) 1 (id : Unit → Unit) (fun _ ↦ X) := by
  intro h
  have hc := (IsGaloisType.polynomial _ _ _ _ h ()).2.2
  exact hc (by simp)

/-- `l3b_wrong_degree`: the degree does not collapse in residue characteristic two. -/
example : ¬ IsGaloisType (⊥ : Ideal (ZMod 2)) 2 (id : Unit → Unit)
    (fun _ ↦ X - 1) := by
  intro h
  have hd := (IsGaloisType.polynomial _ _ _ _ h ()).2.1
  have hdeg := Polynomial.natDegree_X_sub_C (1 : (ZMod 2) ⧸ (⊥ : Ideal (ZMod 2)))
  simp only [map_one] at hdeg
  omega

/-- `l3b_empty_observations`: no observations impose no characteristic-polynomial conditions;
for the trivial group a line exists and is non-Eisenstein. -/
example : IsGaloisType (⊥ : Ideal (ZMod 2)) 1 (fun v : Empty ↦ v.elim : Empty → Unit)
      (fun v ↦ v.elim) ∧
    IsNonEisenstein (⊥ : Ideal (ZMod 2)) 1 (fun v : Empty ↦ v.elim : Empty → Unit)
      (fun v ↦ v.elim) := sorry

/-- `l3b_character`: the tautological character of the residue-field units is nontrivial. -/
example : letI : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩
    IsNonEisenstein (⊥ : Ideal (ZMod 5)) 1
    (id : ((ZMod 5) ⧸ (⊥ : Ideal (ZMod 5)))ˣ →
      ((ZMod 5) ⧸ (⊥ : Ideal (ZMod 5)))ˣ)
    (fun g ↦ X - C (g : (ZMod 5) ⧸ (⊥ : Ideal (ZMod 5)))) := sorry

/-- `l3b_split_charpoly`: in characteristic two, trace zero does not mean rank zero. -/
example : Matrix.charpoly (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) = X^2 + 1 := by
  rw [Matrix.charpoly_one]
  change (X - 1)^2 = X^2 + (1 : (ZMod 2)[X])
  have htwo : (2 : (ZMod 2)[X]) = 0 := by
    exact CharP.cast_eq_zero (ZMod 2)[X] 2
  linear_combination -X * htwo

/-- `l3b_twist_pair`: roots 2,3 become 10,15 under the character value 5. -/
example : ((X - 2) * (X - 3) : ℚ[X]).scaleRoots 5 = (X - 10) * (X - 15) := by
  simp only [sub_eq_add_neg, ← C_ofNat, ← C_neg,
    Polynomial.mul_scaleRoots_of_noZeroDivisors, Polynomial.X_add_C_scaleRoots]
  norm_num

/-- `l3b_dual_pair`: normalize by the constant 6 before reading inverse roots. -/
example : C (1/6 : ℚ) * (((X - 2) * (X - 3) : ℚ[X]).reflect 2) =
    (X - C (1/2)) * (X - C (1/3)) := by
  have hp : ((X - 2) * (X - 3) : ℚ[X]) = X^2 + C (-5)*X^1 + C 6 := by
    norm_num [Polynomial.C_ofNat]; ring
  rw [hp, Polynomial.reflect_add, Polynomial.reflect_add,
    Polynomial.reflect_monomial, Polynomial.reflect_C_mul_X_pow, Polynomial.reflect_C]
  norm_num [Polynomial.revAt_le, Polynomial.C_ofNat]
  ring_nf
  ext i
  rcases i with _ | _ | _ | i <;> norm_num [Polynomial.coeff_X, Polynomial.coeff_one]

/-- `l3b_geometric_pair`: n=2, q=5 and ε(Frob)=1/5 give dual-twist roots 5/2,5/3. -/
example : (C (1/6 : ℚ) * (((X - 2) * (X - 3) : ℚ[X]).reflect 2)).scaleRoots 5 =
    (X - C (5/2)) * (X - C (5/3)) := by
  have hp : ((X - 2) * (X - 3) : ℚ[X]) = X^2 + C (-5)*X^1 + C 6 := by
    norm_num [Polynomial.C_ofNat]; ring
  have href : C (1/6 : ℚ) * (((X - 2)*(X - 3) : ℚ[X]).reflect 2) =
      (X + C (-1/2)) * (X + C (-1/3)) := by
    rw [hp, Polynomial.reflect_add, Polynomial.reflect_add,
      Polynomial.reflect_monomial, Polynomial.reflect_C_mul_X_pow, Polynomial.reflect_C]
    norm_num [Polynomial.revAt_le, Polynomial.C_ofNat]
    ring_nf
    ext i
    rcases i with _ | _ | _ | i <;> norm_num [Polynomial.coeff_X, Polynomial.coeff_one]
  rw [href, Polynomial.mul_scaleRoots_of_noZeroDivisors]
  simp only [Polynomial.X_add_C_scaleRoots]
  norm_num; ring

/-- `l3b_empty_dual`: normalization and root scaling preserve the empty polynomial. -/
example : (C ((1 : ℚ[X]).coeff 0)⁻¹ * (1 : ℚ[X]).reflect 0).scaleRoots 5 = 1 := by
  simp

/-- `l3b_density_needed`: two F₃-valued characters of C₂ agree at the identity only.
Their characteristic polynomials at the other element are X-1 and X+1. -/
example : Matrix.charpoly (!![(1 : ZMod 3)] : Matrix (Fin 1) (Fin 1) (ZMod 3)) ≠
    Matrix.charpoly (!![(-1 : ZMod 3)] : Matrix (Fin 1) (Fin 1) (ZMod 3))  := by
  intro h
  have hc := congrArg (fun p : (ZMod 3)[X] ↦ p.coeff 0) h
  norm_num [Matrix.charpoly, Matrix.charmatrix, Matrix.det_fin_one] at hc
  exact (by decide : (1 : ZMod 3) ≠ -1) hc

end Spherical

/-! ## Layer IHG.4: interpolation over integral coefficient rings -/

section
variable {A B G : Type u} [CommRing A] [CommRing B] [Group G] {d : ℕ}
namespace Determinant
variable {G : Type w} [Group G]
/-- Group-algebra coefficient change uses its canonical scalar-extension isomorphism. -/
def mapCoefficients (D : Determinant A (MonoidAlgebra A G) d) (φ : A →+* B) :
    Determinant B (MonoidAlgebra B G) d := sorry
theorem mapCoefficients_charpoly (D : Determinant A (MonoidAlgebra A G) d)
    (φ : A →+* B) (g : G) :
    (D.mapCoefficients φ).charpoly (MonoidAlgebra.of B G g) =
      (D.charpoly (MonoidAlgebra.of A G g)).map φ := sorry
theorem mapCoefficients_id (D : Determinant A (MonoidAlgebra A G) d) :
    D.mapCoefficients (RingHom.id A) = D := sorry
theorem mapCoefficients_comp {C : Type u} [CommRing C]
    (D : Determinant A (MonoidAlgebra A G) d) (φ : A →+* B) (ψ : B →+* C) :
    (D.mapCoefficients φ).mapCoefficients ψ = D.mapCoefficients (ψ.comp φ) := sorry
end Determinant
namespace Theorems
/-- Let G be a group with a topology, A compact Hausdorff, all A_i Hausdorff, and ι:A→∏A_i a continuous injective ring map. Let D_i be continuous degree-d determinants. If for each g in a dense subset X⊂G the tuple of characteristic polynomials lies in ι(A)[X], there is a unique continuous determinant D over A with D⊗A_i=D_i. The compact closed embedding gives integrality on all G; an injective map without closed image does not suffice. -/
theorem compact_determinant_gluing {G : Type u} [Group G] [TopologicalSpace G]
    [TopologicalSpace A] [CompactSpace A] [T2Space A]
    (ι : Type w) (B : ι → Type u) [∀ i, CommRing (B i)] [∀ i, TopologicalSpace (B i)] [∀ i, T2Space (B i)]
    (φ : ∀ i, A →+* B i) (hinj : Function.Injective (fun a : A ↦ fun i ↦ φ i a))
    (hφ : ∀ i, Continuous (φ i))
    (D : ∀ i, Determinant (B i) (MonoidAlgebra (B i) G) d) (hD : ∀ i, (D i).IsContinuous)
    (S : Set G) (hS : Dense S)
    (hcoeff : ∀ g ∈ S, ∀ k, ∃ a : A, ∀ i,
      ((D i).charpoly (MonoidAlgebra.of (B i) G g)).coeff k=φ i a) :
    ∃! E : Determinant A (MonoidAlgebra A G) d,
      E.IsContinuous ∧ ∀ i, E.mapCoefficients (φ i)=D i := sorry

end Theorems
namespace Interpolation
variable [TopologicalSpace G]

structure FiniteQuotientData (A : Type u) [CommRing A] (G : Type u) [Group G]
    [TopologicalSpace G] (d : ℕ) (J : ℕ → Ideal A) (hJ : Antitone J) where
  determinant : ∀ r, Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) G) d
  continuous : ∀ r i, @Continuous G (A ⧸ J r) _ ⊥
    (fun g ↦ ((determinant r).charpoly (MonoidAlgebra.of (A ⧸ J r) G g)).coeff i)
  compatible : ∀ r s (hrs : r ≤ s),
    (determinant s).mapCoefficients (Ideal.Quotient.factor (hJ hrs))=determinant r
namespace FiniteQuotientData
variable {J : ℕ → Ideal A} {hJ : Antitone J} (F : FiniteQuotientData A G d J hJ)
theorem reduce (r s : ℕ) (hrs : r ≤ s) :
    (F.determinant s).mapCoefficients (Ideal.Quotient.factor (hJ hrs)) =
      F.determinant r := F.compatible r s hrs
/-- Refinement is precomposition along the actual quotient homomorphism. -/
def refineGroup (r : ℕ) (U V : Subgroup G) [U.Normal] [V.Normal] (hVU : V ≤ U)
    (D : Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) (G ⧸ U)) d) :
    Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) (G ⧸ V)) d :=
  D.comap (MonoidAlgebra.mapDomainAlgHom (A ⧸ J r) (A ⧸ J r)
    (QuotientGroup.map V U (MonoidHom.id G) (by simpa using hVU)))
theorem refineGroup_charpoly (r : ℕ) (U V : Subgroup G) [U.Normal] [V.Normal]
    (hVU : V ≤ U)
    (D : Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) (G ⧸ U)) d) (g : G) :
    (refineGroup (J := J) r U V hVU D).charpoly
      (MonoidAlgebra.of (A ⧸ J r) (G ⧸ V) (QuotientGroup.mk g)) =
    D.charpoly (MonoidAlgebra.of (A ⧸ J r) (G ⧸ U) (QuotientGroup.mk g)) := sorry
end FiniteQuotientData
/-- Compatible elements in the quotient system, with componentwise ring structure. -/
def quotientLimit (J : ℕ → Ideal A) (hJ : Antitone J) : Subring (∀ r, A ⧸ J r) where
  carrier := {a | ∀ r s (hrs : r ≤ s), Ideal.Quotient.factor (hJ hrs) (a s)=a r}
  one_mem' := sorry
  zero_mem' := sorry
  add_mem' := sorry
  neg_mem' := sorry
  mul_mem' := sorry
/-- The separated complete identification is an actual ring equivalence. -/
def inverseLimitDeterminant {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : FiniteQuotientData A G d J hJ) (complete : A ≃+* quotientLimit J hJ)
    (hcomplete : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a) :
    Determinant A (MonoidAlgebra A G) d := sorry
theorem inverseLimitDeterminant_reduce {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : FiniteQuotientData A G d J hJ) (complete : A ≃+* quotientLimit J hJ)
    (hcomplete : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a) (r : ℕ) :
    (inverseLimitDeterminant F complete hcomplete).mapCoefficients (Ideal.Quotient.mk (J r)) =
      F.determinant r := sorry
theorem inverseLimitDeterminant_unique {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : FiniteQuotientData A G d J hJ) (complete : A ≃+* quotientLimit J hJ)
    (hcomplete : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a)
    (D : Determinant A (MonoidAlgebra A G) d)
    (hD : ∀ r, D.mapCoefficients (Ideal.Quotient.mk (J r))=F.determinant r) :
    D=inverseLimitDeterminant F complete hcomplete := sorry
/-- for one fixed compact coefficient quotient.
Compactness and continuity make the injective coefficient map a closed embedding.
The uniform adic modulus across levels is an input from the geometric application. -/
structure CongruenceWitness (A : Type u) [CommRing A] (G V : Type u) [Group G]
    [TopologicalSpace A] [CompactSpace A] [T2Space A]
    [TopologicalSpace G] (d : ℕ) (Frob : V → G) where
  count : ℕ
  coefficient : Fin count → CommAlgCat.{u} A
  coefficientTopology : ∀ i, TopologicalSpace (coefficient i)
  coefficientT2 : ∀ i, @T2Space (coefficient i) (coefficientTopology i)
  coefficient_continuous : ∀ i, @Continuous A (coefficient i) _ (coefficientTopology i)
    (algebraMap A (coefficient i))
  classical : ∀ i, Determinant (coefficient i) (MonoidAlgebra (coefficient i) G) d
  classical_continuous : ∀ i k, @Continuous G (coefficient i) _ (coefficientTopology i)
    (fun g ↦ ((classical i).charpoly (MonoidAlgebra.of (coefficient i) G g)).coeff k)
  frobenius_dense : Dense {g : G | ∃ v h, g=h*Frob v*h⁻¹}
  injective : Function.Injective (fun a : A ↦ fun i ↦ algebraMap A (coefficient i) a)
  frobenius_mem : ∀ v k, ∃ a : A, ∀ i,
    ((classical i).charpoly (MonoidAlgebra.of (coefficient i) G (Frob v))).coeff k =
      algebraMap A (coefficient i) a
namespace CongruenceWitness
variable {V : Type u} {Frob : V → G}
variable [TopologicalSpace A] [CompactSpace A] [T2Space A]
/-- Apply compact coefficient gluing to the conjugacy-saturated Frobenius set. -/
def determinant (W : CongruenceWitness A G V d Frob) :
    Determinant A (MonoidAlgebra A G) d := by
  letI := W.coefficientTopology
  letI := W.coefficientT2
  exact Classical.choose (Theorems.compact_determinant_gluing
    (Fin W.count) (fun i => W.coefficient i)
    (fun i => algebraMap A (W.coefficient i)) W.injective W.coefficient_continuous
    W.classical (by intro i; exact W.classical_continuous i)
    {g : G | ∃ v h, g = h * Frob v * h⁻¹} W.frobenius_dense
    (by sorry))
theorem determinant_continuous (W : CongruenceWitness A G V d Frob) :
    (determinant W).IsContinuous := sorry
/-- Descent is equality of polynomial laws, not only equality at Frobenius elements. -/
theorem determinant_classical (W : CongruenceWitness A G V d Frob) (i : Fin W.count) :
    (determinant W).mapCoefficients (algebraMap A (W.coefficient i))=W.classical i := sorry
/-- With levelwise witnesses, exact reductions express the required integral compatibility. -/
theorem compatible (W : CongruenceWitness A G V d Frob)
    [TopologicalSpace B] [CompactSpace B] [T2Space B]
    (φ : A →+* B) (hφ : Continuous φ) (W' : CongruenceWitness B G V d Frob)
    (h : ∀ v, ((determinant W).charpoly (MonoidAlgebra.of A G (Frob v))).map φ =
      (determinant W').charpoly (MonoidAlgebra.of B G (Frob v))) :
    (determinant W).mapCoefficients φ=determinant W' := sorry
end CongruenceWitness

namespace Checks

/-- `coeff_rank_zero`: the empty determinant stays one, even at zero. -/
example (D : Determinant ℤ (MonoidAlgebra ℤ PUnit) 0) :
    (D.mapCoefficients (Int.castRingHom (ZMod 2))).eval 0 = 1 := sorry

/-- `interpolation_polynomial_convention`: at eigenvalues 1,-1 the monic and
Scholze polynomials have opposite constant/top coefficients. -/
example : ((X - 1) * (X + 1) : Polynomial ℤ) = X^2 - 1 ∧
    ((1 - X) * (1 + X) : Polynomial ℤ) = 1 - X^2 := by
  constructor <;> ring

/-- `coeff_two_term`: coefficient reduction preserves the monic convention at eigenvalues 1,-1. -/
example (D : Determinant ℤ (MonoidAlgebra ℤ G) 2) (g : G)
    (h : D.charpoly (MonoidAlgebra.of ℤ G g) = X^2 - 1) :
    (D.mapCoefficients (Int.castRingHom (ZMod 2))).charpoly
      (MonoidAlgebra.of (ZMod 2) G g) = X^2 + 1 := sorry

/-- `coeff_nilpotent`: a rank-one value 3 in Z/4 is retained by identity change,
but its reduction modulo 2 is 1. -/
example (D : Determinant (ZMod 4) (MonoidAlgebra (ZMod 4) G) 1) (g : G)
    (h : D.eval (MonoidAlgebra.of (ZMod 4) G g) = 3) :
    (D.mapCoefficients (RingHom.id _)).eval (MonoidAlgebra.of (ZMod 4) G g) = 3 ∧
    (D.mapCoefficients (ZMod.castHom (by norm_num : 2 ∣ 4) (ZMod 2))).eval
      (MonoidAlgebra.of (ZMod 2) G g) = 1 := sorry

/-- `family_constant`: the augmentation law gives a constant discrete quotient family. -/
example {G : Type} [Group G] [TopologicalSpace G] [DiscreteTopology G] :
    ∃ F : FiniteQuotientData (ZMod 2) G 1 (fun _ ↦ ⊥) (by intro _ _ _; rfl),
      ∀ r, F.determinant r = Determinant.dimOneEquiv.symm
        (MonoidAlgebra.lift _ _ G (1 : G →* (ZMod 2 ⧸ (⊥ : Ideal (ZMod 2))))) := sorry

/-- `family_unit_ideal`: every level of the unit-ideal system has the unique zero-ring law,
in every degree, without a positive-rank assumption. -/
example : ∃ F : FiniteQuotientData A G d (fun _ ↦ ⊤) (by intro _ _ _; rfl),
    ∀ r x, (F.determinant r).eval x = 0 := sorry

/-- `family_incompatible`: values 1 and -1 cannot coexist at two levels of the
constant zero-ideal system over F3. -/
example {G : Type} [Group G] [TopologicalSpace G] (F : FiniteQuotientData (ZMod 3) G 1 (fun _ ↦ ⊥) (by intro _ _ _; rfl))
    (g : G) (h : (F.determinant 0).eval (MonoidAlgebra.of _ G g) = 1) :
    (F.determinant 1).eval (MonoidAlgebra.of _ G g) ≠ -1 := sorry

/-- `refine_identity`: equal subgroups leave the whole law unchanged. -/
example (J : ℕ → Ideal A) (r : ℕ) (U : Subgroup G) [U.Normal]
    (D : Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) (G ⧸ U)) d) :
    FiniteQuotientData.refineGroup r U U le_rfl D = D := sorry

/-- `refine_trivial_quotient`: pulling back from G/G sends every group element to
the identity polynomial; the refinement does not introduce a new character. -/
example (J : ℕ → Ideal A) (r : ℕ)
    (D : Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) (G ⧸ (⊤ : Subgroup G))) 2)
    (g : G) :
    (FiniteQuotientData.refineGroup r ⊤ ⊥ bot_le D).charpoly
      (MonoidAlgebra.of _ (G ⧸ (⊥ : Subgroup G)) (QuotientGroup.mk g)) = (X - 1)^2 := sorry

/-- `refine_two_term`: a sum supported at two different quotient classes becomes
one term with coefficient 5 on the trivial quotient, not coefficient 1. -/
example {G : Type} [Group G] [TopologicalSpace G] (J : ℕ → Ideal ℤ) (r : ℕ)
    (D : Determinant (ℤ ⧸ J r)
      (MonoidAlgebra (ℤ ⧸ J r) (G ⧸ (⊤ : Subgroup G))) 2) (g h : G) :
    (FiniteQuotientData.refineGroup r ⊤ ⊥ bot_le D).eval
      (2 • MonoidAlgebra.of _ (G ⧸ (⊥ : Subgroup G)) (QuotientGroup.mk g) +
       3 • MonoidAlgebra.of _ (G ⧸ (⊥ : Subgroup G)) (QuotientGroup.mk h)) = 25 := sorry

/-- `limit_carrier_constant`: compatibility in a constant zero-ideal system forces
all coordinates to be equal. -/
example (a : ∀ _ : ℕ, ℤ ⧸ (⊥ : Ideal ℤ)) :
    a ∈ quotientLimit (fun _ ↦ (⊥ : Ideal ℤ)) (by intro _ _ _; rfl) ↔
      ∀ r, a r = a 0 := by
  change (∀ r s (_hrs : r ≤ s), Ideal.Quotient.factor (show (⊥ : Ideal ℤ) ≤ ⊥ from le_rfl) (a s) = a r) ↔ _
  constructor
  · intro h r
    simpa using h 0 r (Nat.zero_le r)
  · intro h r s _
    simpa using (h s).trans (h r).symm

/-- `limit_carrier_unit`: the constant unit-ideal limit is the zero ring. -/
example (a : quotientLimit (fun _ ↦ (⊤ : Ideal ℤ)) (by intro _ _ _; rfl)) :
    a = 0 := by
  apply Subtype.ext
  funext r
  exact Subsingleton.elim _ _

/-- `limit_carrier_direction`: an initial zero-ring quotient discards the first
coordinate; the tail retains the integer 3. -/
example :
    let J : ℕ → Ideal ℤ := fun r ↦ if r = 0 then ⊤ else ⊥
    let hJ : Antitone J := by
      intro r s hrs
      dsimp [J]
      split_ifs <;> simp_all
    (fun r ↦ Ideal.Quotient.mk (J r) 3) ∈ quotientLimit J hJ ∧
      Ideal.Quotient.mk (J 0) 3 = 0 ∧ Ideal.Quotient.mk (J 1) 3 ≠ 0 := sorry

/-- `interpolate_rank_zero`: an empty determinant has value one at the zero input. -/
example {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : FiniteQuotientData A G 0 J hJ) (c : A ≃+* quotientLimit J hJ)
    (hc : ∀ a r, (c a).val r = Ideal.Quotient.mk (J r) a) :
    (inverseLimitDeterminant F c hc).eval 0 = 1 := sorry

/-- `interpolate_two_term`: reconstruction retains addition at nongroup inputs. -/
example {G : Type} [Group G] [TopologicalSpace G] {J : ℕ → Ideal ℤ} {hJ : Antitone J}
    (F : FiniteQuotientData ℤ G 1 J hJ) (c : ℤ ≃+* quotientLimit J hJ)
    (hc : ∀ a r, (c a).val r = Ideal.Quotient.mk (J r) a) (g h : G)
    (hg : ∀ r, (F.determinant r).eval (MonoidAlgebra.of _ G g) = 1)
    (hh : ∀ r, (F.determinant r).eval (MonoidAlgebra.of _ G h) = -1) :
    (inverseLimitDeterminant F c hc).eval
      (2 • MonoidAlgebra.of ℤ G g + 3 • MonoidAlgebra.of ℤ G h) = -1 := sorry

/-- `interpolate_nilpotent`: 3=1+2 in Z/4 survives reconstruction although all
field-valued reductions kill 2. -/
example {G : Type} [Group G] [TopologicalSpace G] (F : FiniteQuotientData (ZMod 4) G 1 (fun _ ↦ ⊥) (by intro _ _ _; rfl))
    (c : ZMod 4 ≃+* quotientLimit (fun _ ↦ (⊥ : Ideal (ZMod 4))) (by intro _ _ _; rfl))
    (hc : ∀ a r, (c a).val r = Ideal.Quotient.mk ⊥ a) (g : G)
    (hg : (F.determinant 0).eval (MonoidAlgebra.of _ G g) = 3) :
    (inverseLimitDeterminant F c hc).eval (MonoidAlgebra.of _ G g) = 3 ∧
      (inverseLimitDeterminant F c hc).eval (MonoidAlgebra.of _ G g) ≠ 1 := sorry

section Witnesses
local instance : TopologicalSpace PUnit := ⊥
local instance : TopologicalSpace (ZMod 2) := ⊥
local instance : TopologicalSpace (ZMod 3) := ⊥
local instance : TopologicalSpace (ZMod 1) := ⊥

/-- `witness_identity`: the one-component identity witness reconstructs the
augmentation, whose value on the sum of two units is zero in F2. -/
example :
    let D : Determinant (ZMod 2) (MonoidAlgebra (ZMod 2) PUnit) 1 :=
      Determinant.dimOneEquiv.symm (MonoidAlgebra.lift _ _ PUnit 1)
    let W : CongruenceWitness (ZMod 2) PUnit PUnit 1 id :=
      { count := 1
        coefficient := fun _ ↦ CommAlgCat.of (ZMod 2) (ZMod 2)
        coefficientTopology := fun _ ↦ ⊥
        coefficientT2 := fun _ ↦ inferInstance
        coefficient_continuous := by intro i; exact @continuous_of_discreteTopology _ _ _ _ ⊥ _
        classical := fun _ ↦ D
        classical_continuous := by intro i k; exact @continuous_of_discreteTopology _ _ _ _ ⊥ _
        frobenius_dense := by sorry
        injective := by sorry
        frobenius_mem := by sorry }
    W.count = 1 ∧ W.determinant = D ∧ W.determinant.eval (1 + 1) = 0 := sorry

/-- `witness_product`: two projections jointly retain (0,2) in F2×F3;
neither projection alone is injective. -/
example :
    let A := ZMod 2 × ZMod 3
    letI : Algebra A (ZMod 2) := (RingHom.fst (ZMod 2) (ZMod 3)).toAlgebra
    letI : Algebra A (ZMod 3) := (RingHom.snd (ZMod 2) (ZMod 3)).toAlgebra
    let D : Determinant A (MonoidAlgebra A PUnit) 1 :=
      Determinant.dimOneEquiv.symm (MonoidAlgebra.lift _ _ PUnit 1)
    let W : CongruenceWitness A PUnit PUnit 1 id :=
      { count := 2
        coefficient := fun i ↦ if i = 0 then CommAlgCat.of A (ZMod 2)
          else CommAlgCat.of A (ZMod 3)
        coefficientTopology := fun _ ↦ ⊥
        coefficientT2 := by intro i; exact @DiscreteTopology.toT2Space _ ⊥ (discreteTopology_bot _)
        coefficient_continuous := by intro i; exact @continuous_of_discreteTopology _ _ _ _ ⊥ _
        classical := fun i ↦ Determinant.dimOneEquiv.symm (MonoidAlgebra.lift _ _ PUnit 1)
        classical_continuous := by intro i k; exact @continuous_of_discreteTopology _ _ _ _ ⊥ _
        frobenius_dense := by sorry
        injective := by sorry
        frobenius_mem := by sorry }
    W.count = 2 ∧ W.determinant = D ∧ W.determinant.eval (1 + 1) = (0, 2) := sorry

/-- `witness_empty_zero_ring`: the empty family is legitimate exactly at a
subsingleton coefficient ring; it reconstructs the unique law. -/
example :
    let W : CongruenceWitness (ZMod 1) PUnit PUnit 2 id :=
      { count := 0
        coefficient := Fin.elim0
        coefficientTopology := fun i ↦ Fin.elim0 i
        coefficientT2 := fun i ↦ Fin.elim0 i
        coefficient_continuous := fun i ↦ Fin.elim0 i
        classical := fun i ↦ Fin.elim0 i
        classical_continuous := fun i ↦ Fin.elim0 i
        frobenius_dense := by sorry
        injective := by intro a b _; exact Subsingleton.elim _ _
        frobenius_mem := by intro v k; exact ⟨0, fun i ↦ Fin.elim0 i⟩ }
    W.count = 0 ∧ W.determinant.eval 0 = 0 := by
  exact ⟨rfl, Subsingleton.elim _ _⟩

/-- `witness_empty_rejected`: omitting every classical component cannot detect F2. -/
example (W : CongruenceWitness (ZMod 2) PUnit PUnit 1 id) : W.count ≠ 0 := by
  intro h
  have h01 : (0 : ZMod 2) = 1 := W.injective (by
    funext i
    exact Fin.elim0 (i.cast h))
  exact zero_ne_one h01
end Witnesses
end Checks
end Interpolation
end

/-! ## Layer IHG.6: Fitting ideals and Ribet modules -/


namespace IntegralRibet
variable {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B] [Group G]

def differenceMap (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (ψ : G →* Aˣ) : MonoidAlgebra A G →ₗ[A] Matrix (Fin 2) (Fin 2) B :=
  ρ.toLinearMap - (Algebra.linearMap A (Matrix (Fin 2) (Fin 2) B)).comp ((MonoidAlgebra.lift A A _ ((Units.coeHom A).comp ψ))).toLinearMap
def differenceModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (ψ : G →* Aˣ) : Submodule A (Matrix (Fin 2) (Fin 2) B) := (differenceMap ρ ψ).range
theorem differenceModule_generators (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (ψ : G →* Aˣ) : differenceModule ρ ψ = Submodule.span A
      {x | ∃ g : G, x = ρ (MonoidAlgebra.of A G g) - algebraMap A _ (ψ g)} := sorry
def differenceProduct (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule A (Matrix (Fin 2) (Fin 2) B) :=
  Submodule.span A {z | ∃ x ∈ differenceModule ρ χ, ∃ y ∈ differenceModule ρ ψ, z=x*y}
/-- Product containment is a separate lemma; comap implements it inside Δψ. -/
def productInside (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule A (differenceModule ρ ψ) :=
  (differenceProduct ρ χ ψ).comap (differenceModule ρ ψ).subtype

def initialModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : ModuleCat.{u} A :=
  ModuleCat.of A (differenceModule ρ ψ ⧸ productInside ρ χ ψ)
def initialModule_mk (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : differenceModule ρ ψ →ₗ[A] initialModule ρ χ ψ :=
  (productInside ρ χ ψ).mkQ
def differenceClass (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (g : G) : initialModule ρ χ ψ :=
  initialModule_mk ρ χ ψ ⟨differenceMap ρ ψ (MonoidAlgebra.of A G g), sorry⟩
theorem initialModule_generators (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule.span A (Set.range (differenceClass ρ χ ψ)) = ⊤ := sorry

def canonicalCocycle (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (g : G) : initialModule ρ χ ψ :=
  (↑(ψ g)⁻¹ : A) • differenceClass ρ χ ψ g
theorem canonicalCocycle_apply (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (g : G) :
    canonicalCocycle ρ χ ψ g = (↑(ψ g)⁻¹ : A) • differenceClass ρ χ ψ g := sorry
theorem canonicalCocycle_span (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule.span A (Set.range (canonicalCocycle ρ χ ψ))=⊤ := sorry
/-- Actual local data, with a chosen distinguished Σ place when Σ is nonempty. -/
structure LocalData (G : Type u) [Group G] where
  count : ℕ
  sigma : Finset (Fin count)
  subgroup : Fin count → Subgroup G
  inertia : Fin count → Subgroup G
  inertia_le : ∀ v, inertia v ≤ subgroup v
  distinguished : Option (Fin count)
  distinguished_mem : ∀ v, distinguished=some v → v ∈ sigma
  distinguished_exists : sigma.Nonempty → ∃ v, distinguished=some v
variable (L : LocalData G)
def extraPlaces : Finset (Fin L.count) := L.sigma.filter (fun v ↦ L.distinguished ≠ some v)
def enlargedModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : ModuleCat.{u} A :=
  ModuleCat.of A (initialModule ρ χ ψ × ({v // v ∈ extraPlaces L} → A))
def localRelations (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule A (enlargedModule L ρ χ ψ) :=
  Submodule.span A {z | (∃ v g, L.distinguished=some v ∧ g ∈ L.subgroup v ∧
      z=(canonicalCocycle ρ χ ψ g,0)) ∨
    (∃ (v : {v // v ∈ extraPlaces L}) (g : G), g ∈ L.subgroup v ∧
      z=(canonicalCocycle ρ χ ψ g,
        -((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)-1) • Pi.single v 1)) ∨
    (∃ v g, v ∉ L.sigma ∧ g ∈ L.inertia v ∧ z=(canonicalCocycle ρ χ ψ g,0))}

def localModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : ModuleCat.{u} A :=
  ModuleCat.of A (enlargedModule L ρ χ ψ ⧸ localRelations L ρ χ ψ)
def localCocycle (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (g : G) : localModule L ρ χ ψ :=
  (localRelations L ρ χ ψ).mkQ (canonicalCocycle ρ χ ψ g,0)
def localVector (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (v : {v // v ∈ extraPlaces L}) : localModule L ρ χ ψ :=
  (localRelations L ρ χ ψ).mkQ (0,Pi.single v 1)
theorem localCocycle_restriction (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) :
    (∀ v g, L.distinguished=some v → g ∈ L.subgroup v → localCocycle L ρ χ ψ g=0) ∧
    (∀ (v : {v // v ∈ extraPlaces L}) g, g ∈ L.subgroup v →
      localCocycle L ρ χ ψ g=((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)-1) • localVector L ρ χ ψ v) ∧
    (∀ v g, v ∉ L.sigma → g ∈ L.inertia v → localCocycle L ρ χ ψ g=0) := sorry
theorem localModule_span (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule.span A
      (Set.range (localCocycle L ρ χ ψ) ∪ Set.range (localVector L ρ χ ψ))=⊤ := sorry

/-- Products of character differences are again differences for the right character. -/
theorem differenceProduct_le (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : differenceProduct ρ χ ψ ≤ differenceModule ρ ψ := sorry

/-- The scalar left action is χ/ψ; the first group element acts on the second value. -/
theorem canonicalCocycle_mul (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (g h : G) :
    canonicalCocycle ρ χ ψ (g*h) = canonicalCocycle ρ χ ψ g +
      ((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)) • canonicalCocycle ρ χ ψ h := sorry

/-- Noetherian submodules and finite quotients give the canonical module's finiteness.
DKSW §2.1, pp.8–9, with finite coefficient containment as an explicit input. -/
theorem modules_finite_of_lattice [IsNoetherianRing A]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (Λ : Submodule A (Matrix (Fin 2) (Fin 2) B)) [Module.Finite A Λ]
    (hχΛ : differenceModule ρ χ ≤ Λ) (hψΛ : differenceModule ρ ψ ≤ Λ) :
    Module.Finite A (differenceModule ρ χ) ∧ Module.Finite A (differenceModule ρ ψ) ∧
      Module.Finite A (initialModule ρ χ ψ) ∧ Module.Finite A (localModule L ρ χ ψ) := sorry

/-- Artin–Rees identifies the subspace topology; quotient maps give the adic quotient topology.
Stacks, Lemma 10.51.2 and Section 10.96; DKSW §2.1, pp.8–9 for the modules. -/
theorem lattice_submodule_topology [IsNoetherianRing A] (m : Ideal A)
    [TopologicalSpace B] (Λ : Submodule A (Matrix (Fin 2) (Fin 2) B))
    [Module.Finite A Λ]
    (hΛtop : m.adicModuleTopology Λ =
      TopologicalSpace.induced (fun x : Λ => (x : Matrix (Fin 2) (Fin 2) B)) inferInstance)
    (D : Submodule A (Matrix (Fin 2) (Fin 2) B)) (hD : D ≤ Λ) :
    m.adicModuleTopology D =
      TopologicalSpace.induced (fun x : D => (x : Matrix (Fin 2) (Fin 2) B)) inferInstance := sorry

/-- Powers of the ideal commute with a surjective linear map, hence its adic topology is final.
Stacks, Section 10.96, definition of the I-adic module topology. -/
theorem adic_quotient_topology {M : Type u} [AddCommGroup M] [Module A M]
    (m : Ideal A) (Q : Submodule A M) :
    m.adicModuleTopology (M ⧸ Q) =
      TopologicalSpace.coinduced Q.mkQ (m.adicModuleTopology M) := sorry

/-- Continuity into the finite lattice passes to both canonical quotients.
DKSW §2.1, pp.8–9, with the induced/adic topology comparison stated explicitly. -/
theorem cocycles_continuous_of_lattice [IsNoetherianRing A] [IsLocalRing A]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B]
    [TopologicalSpace G] (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (hAB : Continuous (algebraMap A B))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous (fun g : G => ρ (MonoidAlgebra.of A G g)))
    (χ ψ : G →* Aˣ) (hψ : Continuous ψ)
    (Λ : Submodule A (Matrix (Fin 2) (Fin 2) B)) [Module.Finite A Λ]
    (hψΛ : differenceModule ρ ψ ≤ Λ)
    (hΛtop : (IsLocalRing.maximalIdeal A).adicModuleTopology Λ =
      TopologicalSpace.induced (fun x : Λ => (x : Matrix (Fin 2) (Fin 2) B)) inferInstance) :
    letI : TopologicalSpace (initialModule ρ χ ψ) :=
      (IsLocalRing.maximalIdeal A).adicModuleTopology _
    letI : TopologicalSpace (localModule L ρ χ ψ) :=
      (IsLocalRing.maximalIdeal A).adicModuleTopology _
    Continuous (canonicalCocycle ρ χ ψ) ∧ Continuous (localCocycle L ρ χ ψ) := sorry

/-- A finite coefficient order contains both difference modules, including scalar differences.
DKSW §2.1, equation (13), with an explicit finite order instead of compactness. -/
theorem differences_le_order
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (Ω : Subalgebra A (Matrix (Fin 2) (Fin 2) B))
    (hρΩ : ∀ g, ρ (MonoidAlgebra.of A G g) ∈ Ω) :
    differenceModule ρ χ ≤ Ω.toSubmodule ∧ differenceModule ρ ψ ≤ Ω.toSubmodule := sorry

/-- A finite lattice in a total quotient ring has its adic subspace topology.
Clear one common regular denominator, then apply Artin–Rees (Stacks, Lemma 10.51.2). -/
theorem fraction_lattice_topology [IsNoetherianRing A] [IsLocalRing A]
    [IsLocalization (nonZeroDivisors A) B]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (hAB : Topology.IsEmbedding (algebraMap A B))
    (Λ : Submodule A (Matrix (Fin 2) (Fin 2) B)) [Module.Finite A Λ] :
    (IsLocalRing.maximalIdeal A).adicModuleTopology Λ =
      TopologicalSpace.induced (fun x : Λ => (x : Matrix (Fin 2) (Fin 2) B)) inferInstance := sorry

/-- `difference_product_sign_character`: products are nonzero although commutators vanish. -/
example :
    let ρ : MonoidAlgebra ℤ ℤˣ →ₐ[ℤ] Matrix (Fin 2) (Fin 2) ℤ :=
      MonoidAlgebra.lift ℤ _ _ ((algebraMap ℤ (Matrix (Fin 2) (Fin 2) ℤ)).toMonoidHom.comp
        (Units.coeHom ℤ))
    differenceModule ρ 1 = Submodule.span ℤ {(2 : Matrix (Fin 2) (Fin 2) ℤ)} ∧
    differenceProduct ρ 1 1 = Submodule.span ℤ {(4 : Matrix (Fin 2) (Fin 2) ℤ)} ∧
    differenceProduct ρ 1 1 ≠ ⊥ := sorry

/-- `sign_character_quotient`: 2I survives and 4I dies in the quotient 2ℤI/4ℤI. -/
example :
    let ρ : MonoidAlgebra ℤ ℤˣ →ₐ[ℤ] Matrix (Fin 2) (Fin 2) ℤ :=
      MonoidAlgebra.lift ℤ _ _ ((algebraMap ℤ (Matrix (Fin 2) (Fin 2) ℤ)).toMonoidHom.comp
        (Units.coeHom ℤ))
    ∃ z : differenceModule ρ 1,
      (z : Matrix (Fin 2) (Fin 2) ℤ) = 2 ∧
      z ∉ productInside ρ 1 1 ∧ (2 : ℤ) • z ∈ productInside ρ 1 1 ∧
      initialModule_mk ρ 1 1 z ≠ 0 ∧ initialModule_mk ρ 1 1 ((2 : ℤ) • z) = 0 := sorry

/-- `local_cocycle_sign_nonzero`: no local places preserve the nonzero sign-character class. -/
example :
    let ρ : MonoidAlgebra ℤ ℤˣ →ₐ[ℤ] Matrix (Fin 2) (Fin 2) ℤ :=
      MonoidAlgebra.lift ℤ _ _ ((algebraMap ℤ (Matrix (Fin 2) (Fin 2) ℤ)).toMonoidHom.comp
        (Units.coeHom ℤ))
    let L : LocalData ℤˣ :=
      { count := 0, sigma := ∅, subgroup := Fin.elim0, inertia := Fin.elim0
        inertia_le := by intro v; exact v.elim0
        distinguished := none
        distinguished_mem := by intro v; exact v.elim0
        distinguished_exists := by simp }
    localCocycle L ρ 1 1 (-1) ≠ 0 := sorry

/-- `ribet_two_factor_normalization`: the lower diagonal normalizes the upper extension entry. -/
example :
    let g : Matrix (Fin 2) (Fin 2) ℚ := !![2,0;0,3]
    let h : Matrix (Fin 2) (Fin 2) ℚ := !![1,1;0,1]
    (g*h) 0 1 / (g*h) 1 1 = 2/3 ∧
      g 0 1 / g 1 1 + (g 0 0 / g 1 1) * (h 0 1 / h 1 1) = 2/3 ∧
      (g*h) 0 1 / (g*h) 0 0 = 1 := by norm_num [Matrix.mul_apply, Fin.sum_univ_two]

end IntegralRibet

/-! ## Layer IHG.6: the formal Ribet ring and its relation ideals -/

namespace IntegralRibet
open CategoryTheory
/-- Coefficient variables remain distinct by their row indices. -/
abbrev formalRing (c n : ℕ) (triangular : Finset (Fin n)) : Type :=
  MvPolynomial (Fin c ⊕ (Fin n × Fin 2 × Fin 2)) ℤ ⧸
    Ideal.span {z : MvPolynomial (Fin c ⊕ (Fin n × Fin 2 × Fin 2)) ℤ |
      ∃ i ∈ triangular, z=MvPolynomial.X (Sum.inr (i,0,1))}
def formalMatrix (c n : ℕ) (triangular : Finset (Fin n)) (i : Fin n) :
    Matrix (Fin 2) (Fin 2) (formalRing c n triangular) :=
  fun j k ↦ Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inr (i,j,k)))
/-- The coefficient variables in the formal ring; the lower Borel fixes them. -/
def formalCoefficient (c n : ℕ) (triangular : Finset (Fin n)) (i : Fin c) :
    formalRing c n triangular :=
  Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl i))
def formalRing_eval (c n : ℕ) (triangular : Finset (Fin n))
    (K : Type u) [CommRing K] (a : Fin c → K) (X : Fin n → Matrix (Fin 2) (Fin 2) K)
    (hX : ∀ i ∈ triangular, X i 0 1=0) : formalRing c n triangular →ₐ[ℤ] K := sorry
/-- Coordinate algebra of the lower Borel: x,z invertible and y unrestricted. -/
abbrev lowerBorelRing : Type :=
  MvPolynomial (Fin 5) ℤ ⧸ Ideal.span
    ({MvPolynomial.X 0*MvPolynomial.X 3-1, MvPolynomial.X 1*MvPolynomial.X 4-1} :
      Set (MvPolynomial (Fin 5) ℤ))
/-- The five coordinates are x,z,y,x⁻¹,z⁻¹. -/
def borelCoordinate (i : Fin 5) : lowerBorelRing :=
  Ideal.Quotient.mk _ (MvPolynomial.X i)

/-- `borel_x_not_one`: the first torus coordinate is not collapsed to the identity. -/
example : borelCoordinate 0 ≠ 1 := sorry
/-- `borel_y_nonzero`: the unipotent coordinate survives in the coordinate algebra. -/
example : borelCoordinate 2 ≠ 0 := sorry
/-- `borel_distinct_diagonals`: the two diagonal coordinates remain independent. -/
example : borelCoordinate 0 ≠ borelCoordinate 1 := sorry

/-- The Hopf algebra of lower triangular invertible matrices. -/
instance lowerBorelHopf : HopfAlgebra ℤ lowerBorelRing where
  toAlgebra := inferInstance
  comul := sorry
  counit := sorry
  coassoc := sorry
  rTensor_counit_comp_comul := sorry
  lTensor_counit_comp_comul := sorry
  counit_one := sorry
  mul_compr₂_counit := sorry
  comul_one := sorry
  mul_compr₂_comul := sorry
  antipode := sorry
  mul_antipode_rTensor_comul := sorry
  mul_antipode_lTensor_comul := sorry
instance lowerBorelFlat : Module.Flat ℤ lowerBorelRing := sorry

/-- `lower_borel_product_order`: the mixed coproduct is y⊗x+z⊗y in this order. -/
example :
    (!![2,0;3,5] : Matrix (Fin 2) (Fin 2) ℚ) * !![7,0;11,13] = !![14,0;76,65] ∧
    (!![7,0;11,13] : Matrix (Fin 2) (Fin 2) ℚ) * !![2,0;3,5] = !![14,0;61,65] := by
  constructor <;> ext i j <;> fin_cases i <;> fin_cases j <;>
    norm_num [Matrix.mul_apply, Fin.sum_univ_two]

theorem borel_comul (i : Fin 5) :
    Coalgebra.comul (R := ℤ) (borelCoordinate i) =
      ![borelCoordinate 0 ⊗ₜ[ℤ] borelCoordinate 0,
        borelCoordinate 1 ⊗ₜ[ℤ] borelCoordinate 1,
        borelCoordinate 2 ⊗ₜ[ℤ] borelCoordinate 0 +
          borelCoordinate 1 ⊗ₜ[ℤ] borelCoordinate 2,
        borelCoordinate 3 ⊗ₜ[ℤ] borelCoordinate 3,
        borelCoordinate 4 ⊗ₜ[ℤ] borelCoordinate 4] i := sorry

theorem borel_counit (i : Fin 5) :
    Coalgebra.counit (R := ℤ) (borelCoordinate i) = ![1,1,0,1,1] i := sorry

theorem borel_antipode (i : Fin 5) :
    HopfAlgebra.antipode ℤ (borelCoordinate i) =
      ![borelCoordinate 3, borelCoordinate 4,
        -(borelCoordinate 3 * borelCoordinate 2 * borelCoordinate 4),
        borelCoordinate 0, borelCoordinate 1] i := sorry

/-- Restriction of regular functions along the inclusion B⁻ ⊆ GL₂. -/
def borelRestriction :
    TauCeti.GeneralLinear.coordinateHopfAlgebra ℤ 2 →ₐc[ℤ] lowerBorelRing := sorry

theorem borelRestriction_matrix :
    (TauCeti.GeneralLinear.genericMatrix ℤ 2).map borelRestriction.toAlgHom =
      !![borelCoordinate 0, 0; borelCoordinate 2, borelCoordinate 1] := sorry

example : borelCoordinate 0 * borelCoordinate 3 = 1 := sorry
example : borelCoordinate 1 * borelCoordinate 4 = 1 := sorry
example : Coalgebra.counit (R := ℤ) (borelCoordinate 2) = 0 := sorry
example : borelRestriction (TauCeti.GeneralLinear.genericMatrix ℤ 2 0 1) = 0 := sorry
example : borelRestriction (TauCeti.GeneralLinear.genericMatrix ℤ 2 1 0) = borelCoordinate 2 := sorry
example : borelRestriction (TauCeti.GeneralLinear.genericMatrix ℤ 2).det =
    borelCoordinate 0 * borelCoordinate 1 := sorry

def formalRing_borel (c n : ℕ) (triangular : Finset (Fin n)) :
    formalRing c n triangular →ₐ[ℤ] lowerBorelRing ⊗[ℤ] formalRing c n triangular := sorry
variable {R : Type u} [CommRing R]
theorem formalRing_eval_matrix (c n : ℕ) (triangular : Finset (Fin n))
    (K : Type u) [CommRing K] (a : Fin c → K) (X : Fin n → Matrix (Fin 2) (Fin 2) K)
    (hX : ∀ i ∈ triangular, X i 0 1 = 0) (i : Fin n) :
    (formalMatrix c n triangular i).map (formalRing_eval c n triangular K a X hX) = X i := sorry

theorem formalRing_eval_coefficient (c n : ℕ) (triangular : Finset (Fin n))
    (K : Type u) [CommRing K] (a : Fin c → K) (X : Fin n → Matrix (Fin 2) (Fin 2) K)
    (hX : ∀ i ∈ triangular, X i 0 1 = 0) (i : Fin c) :
    formalRing_eval c n triangular K a X hX (formalCoefficient c n triangular i) = a i := sorry

/-- The right coaction obtained by exchanging the coordinate and module factors. -/
instance formalComodule (c n : ℕ) (triangular : Finset (Fin n)) :
    TauCeti.Comodule ℤ lowerBorelRing (formalRing c n triangular) where
  coact := (TensorProduct.comm ℤ lowerBorelRing (formalRing c n triangular)).toLinearMap ∘ₗ
    (formalRing_borel c n triangular).toLinearMap
  coassoc := sorry
  lTensor_counit_comp_coact := sorry

/-- Rows are the selected linear, product and local matrices. -/
def relationIdeal {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R) : Ideal R :=
  Ideal.span {z | ∃ t i j, z=rows t i j}
def upperRelationIdeal {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R) : Ideal R :=
  Ideal.span {z | ∃ t, z=rows t 0 1}
theorem upperRelationIdeal_le {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R) :
    upperRelationIdeal rows ≤ relationIdeal rows := sorry
/-- The actual local matrix generator, with Dστ=Aτσ. -/
def localRelationMatrix (X Y : Matrix (Fin 2) (Fin 2) R) (x y : R) :
    Matrix (Fin 2) (Fin 2) R :=
  !![X 0 1*Y 1 0-(y-Y 1 1)*(x-X 0 0), X 0 1*(y-Y 0 0)-Y 0 1*(x-X 0 0);
     X 1 0*(y-Y 1 1)-Y 1 0*(x-X 1 1), Y 0 1*X 1 0-(x-X 1 1)*(y-Y 0 0)]
/-- The local relation matrix is `−(x − X)·adj(y − Y)`; this is why it transforms as the
adjoint (DKSW Lemma 4.18). -/
theorem localRelationMatrix_eq_adjugate (X Y : Matrix (Fin 2) (Fin 2) R) (x y : R) :
    localRelationMatrix X Y x y =
      -((Matrix.scalar (Fin 2) x - X) * (Matrix.scalar (Fin 2) y - Y).adjugate) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [localRelationMatrix, Matrix.adjugate_fin_two, Matrix.mul_apply, Fin.sum_univ_two] <;> ring
/-- Universal lower-Borel conjugation, using x,z,y,x⁻¹,z⁻¹ in the coordinate ring. -/
def lowerBorelConjugate (M : Matrix (Fin 2) (Fin 2) R) :
    Matrix (Fin 2) (Fin 2) (lowerBorelRing ⊗[ℤ] R) :=
  let b : Fin 5 → lowerBorelRing ⊗[ℤ] R :=
    fun i ↦ (Ideal.Quotient.mk _ (MvPolynomial.X i) : lowerBorelRing) ⊗ₜ[ℤ] (1 : R)
  let P : Matrix (Fin 2) (Fin 2) (lowerBorelRing ⊗[ℤ] R) := !![b 0,0;b 2,b 1]
  let Pinv : Matrix (Fin 2) (Fin 2) (lowerBorelRing ⊗[ℤ] R) :=
    !![b 3,0;-(b 4*b 2*b 3),b 4]
  Pinv * M.map (Algebra.TensorProduct.includeRight : R →ₐ[ℤ] lowerBorelRing ⊗[ℤ] R) * P
/-- If two matrices transform by inverse conjugation and the two scalars are invariant, their
local relation matrix also transforms by inverse conjugation (DKSW Lemma 4.18). -/
theorem localRelationMatrix_conj (δ : R →ₐ[ℤ] lowerBorelRing ⊗[ℤ] R)
    (X Y : Matrix (Fin 2) (Fin 2) R) (x y : R)
    (hX : X.map δ = lowerBorelConjugate X) (hY : Y.map δ = lowerBorelConjugate Y)
    (hx : δ x = 1 ⊗ₜ[ℤ] x) (hy : δ y = 1 ⊗ₜ[ℤ] y) :
    (localRelationMatrix X Y x y).map δ = lowerBorelConjugate (localRelationMatrix X Y x y) :=
  sorry
/-- Generic matrix coordinates transform by inverse conjugation (DKSW Example 4.2). -/
theorem formalRing_borel_matrix (c n : ℕ) (triangular : Finset (Fin n)) (i : Fin n) :
    (formalMatrix c n triangular i).map (formalRing_borel c n triangular) =
      lowerBorelConjugate (formalMatrix c n triangular i) := sorry

theorem formalRing_borel_coefficient (c n : ℕ) (triangular : Finset (Fin n)) (i : Fin c) :
    formalRing_borel c n triangular (formalCoefficient c n triangular i) =
      (1 : lowerBorelRing) ⊗ₜ[ℤ] formalCoefficient c n triangular i := sorry

example : formalRing_borel 1 0 ∅ (formalCoefficient 1 0 ∅ 0) =
    (1 : lowerBorelRing) ⊗ₜ[ℤ] formalCoefficient 1 0 ∅ 0 := sorry
example : formalRing_borel 0 1 ∅ (formalMatrix 0 1 ∅ 0 0 1) =
    (borelCoordinate 1 * borelCoordinate 3) ⊗ₜ[ℤ] formalMatrix 0 1 ∅ 0 0 1 := sorry
example : formalRing_borel 0 1 ∅ (Matrix.trace (formalMatrix 0 1 ∅ 0)) =
    (1 : lowerBorelRing) ⊗ₜ[ℤ] Matrix.trace (formalMatrix 0 1 ∅ 0) := sorry

theorem relationIdeal_stable {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (δ : R →ₐ[ℤ] lowerBorelRing ⊗[ℤ] R)
    (hrows : ∀ t, (rows t).map δ=lowerBorelConjugate (rows t)) :
    (∀ a ∈ relationIdeal rows,
      Algebra.TensorProduct.map (AlgHom.id ℤ lowerBorelRing)
        (Ideal.Quotient.mkₐ ℤ (relationIdeal rows)) (δ a)=0) ∧
    (∀ a ∈ upperRelationIdeal rows,
      Algebra.TensorProduct.map (AlgHom.id ℤ lowerBorelRing)
        (Ideal.Quotient.mkₐ ℤ (upperRelationIdeal rows)) (δ a)=0) := sorry
/-- Noncommutative polynomial evaluation over the coefficient generators. -/
def wordEvaluation {c n : ℕ} (coefficient : Fin c → R)
    (X : Fin n → Matrix (Fin 2) (Fin 2) R) :
    FreeAlgebra ℤ (Fin c ⊕ Fin n) →ₐ[ℤ] Matrix (Fin 2) (Fin 2) R := sorry

theorem wordEvaluation_coefficient {c n : ℕ} (coefficient : Fin c → R)
    (X : Fin n → Matrix (Fin 2) (Fin 2) R) (i : Fin c) :
    wordEvaluation coefficient X (FreeAlgebra.ι ℤ (Sum.inl i)) = Matrix.scalar (Fin 2) (coefficient i) := sorry
theorem wordEvaluation_matrix {c n : ℕ} (coefficient : Fin c → R)
    (X : Fin n → Matrix (Fin 2) (Fin 2) R) (i : Fin n) :
    wordEvaluation coefficient X (FreeAlgebra.ι ℤ (Sum.inr i)) = X i := sorry

def invariantSubring {c n : ℕ} (coefficient : Fin c → R)
    (X : Fin n → Matrix (Fin 2) (Fin 2) R) (triangular : Finset (Fin n)) : Subalgebra ℤ R :=
  Algebra.adjoin ℤ (Set.range coefficient ∪
    {a | ∃ f : FreeAlgebra ℤ (Fin c ⊕ Fin n), a=Matrix.trace (wordEvaluation coefficient X f)} ∪
    {a | ∃ f : FreeAlgebra ℤ (Fin c ⊕ Fin n), a=(wordEvaluation coefficient X f).det} ∪
    {a | ∃ i ∈ triangular, a=X i 1 1})
theorem trace_mem_invariantSubring {c n : ℕ} (coefficient : Fin c → R)
    (X : Fin n → Matrix (Fin 2) (Fin 2) R) (triangular : Finset (Fin n))
    (f : FreeAlgebra ℤ (Fin c ⊕ Fin n)) :
    Matrix.trace (wordEvaluation coefficient X f) ∈ invariantSubring coefficient X triangular := sorry
/-- Invariant subalgebra is the equalizer of the actual coaction and a↦1⊗a. -/
def borelInvariants (δ : R →ₐ[ℤ] lowerBorelRing ⊗[ℤ] R) : Subalgebra ℤ R where
  carrier := {a | δ a=1 ⊗ₜ[ℤ] a}
  algebraMap_mem' := sorry
  zero_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  mul_mem' := sorry
/-- The formal ring, its generators and its conjugation coaction are fixed together. -/
theorem invariantSubring_eq_borel (c n : ℕ) (triangular : Finset (Fin n)) :
    invariantSubring (formalCoefficient c n triangular) (formalMatrix c n triangular) triangular =
      borelInvariants (formalRing_borel c n triangular) := sorry
end IntegralRibet

/-! ## Layer IHG.6: Koszul and Buchsbaum–Rim complexes -/

namespace Koszul
open CategoryTheory
variable {A : Type u} [CommRing A] {n : ℕ}
/-- The Koszul complex `K(x₁, …, xₙ)` of a finite sequence in `A`:
the exterior algebra of `Aⁿ` with the differential contracting against `x`, as a nonnegative chain
complex. -/
def complex (x : Fin n → A) : ChainComplex (ModuleCat.{u} A) ℕ :=
  ChainComplex.of (fun k ↦ ModuleCat.of A (⋀[A]^k (Fin n → A)))
    (fun k ↦ ModuleCat.ofHom (show (⋀[A]^(k+1) (Fin n → A)) →ₗ[A]
      (⋀[A]^k (Fin n → A)) from by
        have _ := x
        exact sorry)) (by sorry)
/-- The terms are the exterior powers themselves, with no choice of basis. -/
def complex_X (x : Fin n → A) (k : ℕ) :
    (complex x).X k ≅ ModuleCat.of A (⋀[A]^k (Fin n → A)) := Iso.refl _
/-- The empty wedge is sent to one by Mathlib's exterior-power equivalence. -/
def complex_X_zero (x : Fin n → A) : (complex x).X 0 ≅ ModuleCat.of A A :=
  (exteriorPower.zeroEquiv A (Fin n → A)).toModuleIso
/-- A one-vector wedge is sent to its vector by Mathlib's equivalence. -/
def complex_X_one (x : Fin n → A) : (complex x).X 1 ≅ ModuleCat.of A (Fin n → A) :=
  (exteriorPower.oneEquiv A (Fin n → A)).toModuleIso

/-- Alternating deletion determines every Koszul differential, including its sign. -/
theorem complex_d_wedge (x : Fin n → A) (k : ℕ) (v : Fin (k+1) → (Fin n → A)) :
    ((complex x).d (k+1) k).hom (exteriorPower.ιMulti A (k+1) v) =
      ∑ i : Fin (k+1), ((-1 : A)^i.val * ∑ j, x j * v i j) •
        exteriorPower.ιMulti A k (v ∘ i.succAbove) := sorry
/-- API: the first differential is `v ↦ ∑ xᵢ vᵢ`. -/
theorem complex_d_one (x : Fin n → A) :
    (complex_X_one x).inv ≫ (complex x).d 1 0 ≫ (complex_X_zero x).hom =
      ModuleCat.ofHom (∑ i, x i • (LinearMap.proj i : (Fin n → A) →ₗ[A] A)) := sorry
/-- API: a linear map `g : Aⁿ → Aⁿ'` carrying the sequence `x` to `x'` induces a chain map. -/
def map {n' : ℕ} (x : Fin n → A) (x' : Fin n' → A) (g : (Fin n → A) →ₗ[A] (Fin n' → A))
    (hg : ∀ v, ∑ j, x' j * g v j = ∑ i, x i * v i) : complex x ⟶ complex x' := sorry
/-- API: `H₀ K(x) = A/(x)`. -/
def homology_zero (x : Fin n → A) :
    (complex x).homology 0 ≅ ModuleCat.of A (A ⧸ Ideal.span (Set.range x)) := sorry
/-- API: the Koszul complex of a concatenated sequence is the tensor product of the two complexes. -/
def complex_append {n' : ℕ} (x : Fin n → A) (y : Fin n' → A) :
    complex (Fin.append x y) ≅ MonoidalCategoryStruct.tensorObj (complex x) (complex y) := sorry
/-- API: a weakly regular sequence has an acyclic Koszul complex, so `K(x) → A/(x)` is a free
resolution. -/
theorem isZero_homology_of_isWeaklyRegular (x : Fin n → A)
    (hx : RingTheory.Sequence.IsWeaklyRegular A ((List.finRange n).map x)) (k : ℕ) (hk : 0 < k) :
    Limits.IsZero ((complex x).homology k) := sorry
example : CategoryTheory.Limits.IsZero ((complex (fun _ : Fin 1 => (2 : ℤ))).homology 1) := sorry
example : Nonempty ((complex (fun _ : Fin 1 => (0 : ℤ))).homology 1 ≃ₗ[ℤ] ℤ) := sorry
example : Nonempty ((complex (fun _ : Fin 1 => (2 : ZMod 4))).homology 1 ≃+ ZMod 2) := sorry
example : Nonempty ((complex (Fin.elim0 : Fin 0 → A)).X 0 ≃ₗ[A] A) := sorry
example : CategoryTheory.Limits.IsZero ((complex (Fin.elim0 : Fin 0 → A)).X 1) := sorry
example : CategoryTheory.Limits.IsZero ((complex (fun _ : Fin 1 => (1 : A))).homology 0) := sorry

/-- Exterior powers specify the map in every degree, rather than merely its ranks. -/
theorem map_f {n' : ℕ} (x : Fin n → A) (x' : Fin n' → A)
    (g : (Fin n → A) →ₗ[A] (Fin n' → A))
    (hg : ∀ v, ∑ j, x' j * g v j = ∑ i, x i * v i) (k : ℕ) :
    ((map x x' g hg).f k).hom = exteriorPower.map k g := sorry

/-- The quotient comparison sends a degree-zero cycle to its scalar residue class. -/
theorem homology_zero_π (x : Fin n → A) :
    (complex x).homologyπ 0 ≫ (homology_zero x).hom =
      (complex x).iCycles 0 ≫ (complex_X_zero x).hom ≫
        ModuleCat.ofHom (Ideal.Quotient.mkₐ A (Ideal.span (Set.range x))).toLinearMap := sorry

/-- In the inverse concatenation map, left factors precede right factors in the wedge. -/
theorem complex_append_wedge {n' : ℕ} (x : Fin n → A) (y : Fin n' → A)
    (k l : ℕ) (v : Fin k → (Fin n → A)) (w : Fin l → (Fin n' → A)) :
    ((complex_append x y).inv.f (k+l)).hom
      ((HomologicalComplex.ιTensorObj (complex x) (complex y) k l (k+l) rfl).hom
        (exteriorPower.ιMulti A k v ⊗ₜ[A] exteriorPower.ιMulti A l w)) =
      exteriorPower.ιMulti A (k+l)
        (Fin.append (fun i ↦ Fin.append (v i) 0) (fun j ↦ Fin.append 0 (w j))) := sorry

/-- `koszul_terms_empty_wedge`: exterior coordinates compute scaling, orientation and repetition. -/
example : (complex_X (![2,3] : Fin 2 → ℤ) 2).hom.hom
    (exteriorPower.ιMulti ℤ 2 ![![2,0],![0,3]]) = 6 • exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]] := sorry

/-- `koszul_terms_vector`: exterior coordinates compute scaling, orientation and repetition. -/
example : (complex_X (![2,3] : Fin 2 → ℤ) 2).hom.hom
    (exteriorPower.ιMulti ℤ 2 ![![0,1],![1,0]]) = -exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]] := sorry

/-- `koszul_terms_orientation`: exterior coordinates compute scaling, orientation and repetition. -/
example : (complex_X (![2,3] : Fin 2 → ℤ) 2).hom.hom
    (exteriorPower.ιMulti ℤ 2 ![![1,0],![1,0]]) = 0 := sorry

/-- `koszul_zero_empty`: the empty-sequence degree-zero unit maps to one. -/
example : (complex_X_zero (Fin.elim0 : Fin 0 → ℤ)).hom.hom
    (exteriorPower.ιMulti ℤ 0 Fin.elim0) = 1 := by
  change exteriorPower.zeroEquiv _ _ _ = _
  simp
/-- `koszul_zero_negative`: the degree-zero comparison preserves minus one. -/
example : (complex_X_zero (![2] : Fin 1 → ℤ)).hom.hom
    (-exteriorPower.ιMulti ℤ 0 Fin.elim0) = -1 := by
  change exteriorPower.zeroEquiv _ _ _ = _
  simp
/-- `koszul_zero_characteristic_two`: the empty wedge stays nonzero in characteristic two. -/
example : (complex_X_zero (![0] : Fin 1 → ZMod 2)).hom.hom
    (exteriorPower.ιMulti (ZMod 2) 0 Fin.elim0) = 1 := by
  change exteriorPower.zeroEquiv _ _ _ = _
  simp
/-- `koszul_one_first`: the first basis vector is not interchanged with the second. -/
example : (complex_X_one (![2,3] : Fin 2 → ℤ)).hom.hom
    (exteriorPower.ιMulti ℤ 1 ![![1,0]]) = ![1,0] := sorry
/-- `koszul_one_second`: the second basis vector has positive orientation. -/
example : (complex_X_one (![2,3] : Fin 2 → ℤ)).hom.hom
    (exteriorPower.ιMulti ℤ 1 ![![0,1]]) = ![0,1] := sorry
/-- `koszul_one_zero`: a zero vector has zero image. -/
example : (complex_X_one (![2] : Fin 1 → ℤ)).hom.hom
    (exteriorPower.ιMulti ℤ 1 ![0]) = 0 := sorry
/-- `koszul_two_term_sign`: d(e₀∧e₁)=2e₁−3e₀ for the ordered sequence (2,3). -/
example : (complex_X_one (![2,3] : Fin 2 → ℤ)).hom.hom
    (((complex (![2,3] : Fin 2 → ℤ)).d 2 1).hom
      (exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]])) = ![-3,2] := sorry
/-- `koszul_map_identity`: identity on generators gives the identity chain map. -/
example : map (![2,3] : Fin 2 → ℤ) ![2,3] LinearMap.id (by simp) = 𝟙 _ := sorry
/-- `koszul_map_zero_positive`: the zero linear map kills positive-degree wedges. -/
example : ((map (0 : Fin 2 → ℤ) 0 (0 : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ))
    (by simp)).f 1).hom (exteriorPower.ιMulti ℤ 1 ![![1,0]]) = 0 := sorry
/-- `koszul_map_zero_degree_zero`: the same map preserves the degree-zero unit. -/
example : ((map (0 : Fin 2 → ℤ) 0 (0 : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ))
    (by simp)).f 0).hom (exteriorPower.ιMulti ℤ 0 Fin.elim0) =
      exteriorPower.ιMulti ℤ 0 Fin.elim0 := sorry

/-- `koszul_hzero_two`: the scalar 3 has residue 1 for this one-term sequence. -/
example :
    (((complex (![2] : Fin 1 → ℤ)).iCyclesIso 0 0 (by apply ComplexShape.next_eq_self'; intro k; simp) (by simp)).inv ≫
      (complex (![2] : Fin 1 → ℤ)).homologyπ 0 ≫ (homology_zero (![2] : Fin 1 → ℤ)).hom).hom
        (3 • exteriorPower.ιMulti ℤ 0 Fin.elim0) =
      Ideal.Quotient.mk (Ideal.span (Set.range (![2] : Fin 1 → ℤ))) 1 := sorry
/-- `koszul_hzero_zero`: the scalar 3 has residue 3 for this one-term sequence. -/
example :
    (((complex (![0] : Fin 1 → ℤ)).iCyclesIso 0 0 (by apply ComplexShape.next_eq_self'; intro k; simp) (by simp)).inv ≫
      (complex (![0] : Fin 1 → ℤ)).homologyπ 0 ≫ (homology_zero (![0] : Fin 1 → ℤ)).hom).hom
        (3 • exteriorPower.ιMulti ℤ 0 Fin.elim0) =
      Ideal.Quotient.mk (Ideal.span (Set.range (![0] : Fin 1 → ℤ))) 3 := sorry
/-- `koszul_hzero_unit`: the scalar 3 has residue 0 for this one-term sequence. -/
example :
    (((complex (![1] : Fin 1 → ℤ)).iCyclesIso 0 0 (by apply ComplexShape.next_eq_self'; intro k; simp) (by simp)).inv ≫
      (complex (![1] : Fin 1 → ℤ)).homologyπ 0 ≫ (homology_zero (![1] : Fin 1 → ℤ)).hom).hom
        (3 • exteriorPower.ιMulti ℤ 0 Fin.elim0) =
      Ideal.Quotient.mk (Ideal.span (Set.range (![1] : Fin 1 → ℤ))) 0 := sorry
/-- `koszul_append_left`: concatenation places left coordinates before right coordinates. -/
example : ((complex_append (![2] : Fin 1 → ℤ) ![3]).inv.f 1).hom
    ((HomologicalComplex.ιTensorObj (complex (![2] : Fin 1 → ℤ)) (complex (![3] : Fin 1 → ℤ))
      1 0 1 rfl).hom
      (exteriorPower.ιMulti ℤ 1 ![![1]] ⊗ₜ[ℤ] exteriorPower.ιMulti ℤ 0 Fin.elim0)) =
    exteriorPower.ιMulti ℤ 1 ![![1,0]] := sorry
/-- `koszul_append_right`: concatenation places left coordinates before right coordinates. -/
example : ((complex_append (![2] : Fin 1 → ℤ) ![3]).inv.f 1).hom
    ((HomologicalComplex.ιTensorObj (complex (![2] : Fin 1 → ℤ)) (complex (![3] : Fin 1 → ℤ))
      0 1 1 rfl).hom
      (exteriorPower.ιMulti ℤ 0 Fin.elim0 ⊗ₜ[ℤ] exteriorPower.ιMulti ℤ 1 ![![1]])) =
    exteriorPower.ιMulti ℤ 1 ![![0,1]] := sorry
/-- `koszul_append_ordered_pair`: concatenation places left coordinates before right coordinates. -/
example : ((complex_append (![2] : Fin 1 → ℤ) ![3]).inv.f 2).hom
    ((HomologicalComplex.ιTensorObj (complex (![2] : Fin 1 → ℤ)) (complex (![3] : Fin 1 → ℤ))
      1 1 2 rfl).hom
      (exteriorPower.ιMulti ℤ 1 ![![1]] ⊗ₜ[ℤ] exteriorPower.ιMulti ℤ 1 ![![1]])) =
    exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]] := sorry

end Koszul

namespace BuchsbaumRim
section Contraction
variable {A M : Type u} [CommRing A] [AddCommGroup M] [Module A M]
/-- Contraction by one covector, with the first deleted factor carrying positive sign. -/
def contractOne (ℓ : Module.Dual A M) (n : ℕ) :
    (⋀[A]^(n+1) M) →ₗ[A] (⋀[A]^n M) := sorry

theorem contractOne_wedge (ℓ : Module.Dual A M) (n : ℕ) (v : Fin (n+1) → M) :
    contractOne ℓ n (exteriorPower.ιMulti A (n+1) v) =
      ∑ i : Fin (n+1), ((-1 : A)^i.val * ℓ (v i)) •
        exteriorPower.ιMulti A n (v ∘ i.succAbove) := sorry

/-- Buchsbaum's degree-two contraction; Lemma 1.1, printed p.184. -/
def contractTwo (ℓ μ : Module.Dual A M) (n : ℕ) :
    (⋀[A]^(n+2) M) →ₗ[A] (⋀[A]^n M) :=
  -(contractOne ℓ n ∘ₗ contractOne μ (n+1))

theorem contractTwo_wedge (ℓ μ : Module.Dual A M) (v w : M) :
    contractTwo ℓ μ 0 (exteriorPower.ιMulti A 2 ![v,w]) =
      (ℓ v * μ w - ℓ w * μ v) • exteriorPower.ιMulti A 0 (Fin.elim0) := sorry

example (ℓ : Module.Dual A M) (v : M) :
    contractOne ℓ 0 (exteriorPower.ιMulti A 1 ![v]) =
      ℓ v • exteriorPower.ιMulti A 0 Fin.elim0 := sorry
example (ℓ : Module.Dual A M) (v w : M) :
    contractOne ℓ 1 (exteriorPower.ιMulti A 2 ![v,w]) =
      ℓ v • exteriorPower.ιMulti A 1 ![w] - ℓ w • exteriorPower.ιMulti A 1 ![v] := sorry
example (n : ℕ) : contractOne (0 : Module.Dual A M) n = 0 := sorry
example (ℓ : Module.Dual A M) (n : ℕ) : contractTwo ℓ ℓ n = 0 := sorry
example (ℓ μ : Module.Dual A M) (n : ℕ) : contractTwo ℓ μ n = -contractTwo μ ℓ n := sorry
example : contractTwo (LinearMap.proj (0 : Fin 2) : (Fin 2 → ℤ) →ₗ[ℤ] ℤ)
    (LinearMap.proj (1 : Fin 2)) 0
      (exteriorPower.ιMulti ℤ 2 ![Pi.single 0 1, Pi.single 1 1]) =
        exteriorPower.ιMulti ℤ 0 Fin.elim0 := sorry
example : (contractOne (LinearMap.proj (0 : Fin 2) : (Fin 2 → ℤ) →ₗ[ℤ] ℤ) 0 ∘ₗ
    contractOne (LinearMap.proj (1 : Fin 2)) 1)
      (exteriorPower.ιMulti ℤ 2 ![Pi.single 0 1, Pi.single 1 1]) =
        -exteriorPower.ιMulti ℤ 0 Fin.elim0 := sorry
end Contraction

section ExteriorBar
variable {A : Type u} [CommRing A]

/-- Buchsbaum's contraction `ω(λ)[β]` of exterior forms against exterior vectors, on the whole
exterior algebras. It is `−ω'`, where `ω'` is the algebra map extending `ℓ ↦ −(ℓ ⌋ ·)`
(Mathlib's `CliffordAlgebra.contractLeft`); this is Buchsbaum's Lemma 1.1:
`ω(λ₁ ∧ ⋯ ∧ λ_r) = (−1)^{r+1} ω(λ₁) ∘ ⋯ ∘ ω(λ_r)`. -/
def omega {M : Type u} [AddCommGroup M] [Module A M] :
    ExteriorAlgebra A (Module.Dual A M) →ₗ[A] Module.End A (ExteriorAlgebra A M) :=
  -(ExteriorAlgebra.lift A
    ⟨-(CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm A M))), by sorry⟩).toLinearMap

/-- Buchsbaum's Lemma 1.1 for two factors: `ω(λ ∧ μ) = −ω(λ) ∘ ω(μ)`. -/
theorem omega_mul {M : Type u} [AddCommGroup M] [Module A M]
    (l m : ExteriorAlgebra A (Module.Dual A M)) :
    omega (l * m) = -(omega l * omega m) := sorry

/-- The graded one-form contraction is the restriction of `omega`. -/
theorem contractOne_eq_omega {M : Type u} [AddCommGroup M] [Module A M]
    (ℓ : Module.Dual A M) (n : ℕ) (x : ⋀[A]^(n+1) M) :
    ((contractOne ℓ n x : ⋀[A]^n M) : ExteriorAlgebra A M) =
      omega (ExteriorAlgebra.ι A ℓ) (x : ExteriorAlgebra A M) := sorry

/-- The ordered dual volume `e₀* ∧ ⋯ ∧ e_{m−1}*` of `Aᵐ`. -/
def dualVolume (A : Type u) [CommRing A] (m : ℕ) :
    ExteriorAlgebra A (Module.Dual A (Fin m → A)) :=
  (exteriorPower.ιMulti A m (fun i : Fin m ↦ (LinearMap.proj i : (Fin m → A) →ₗ[A] A)) :
    ⋀[A]^m (Module.Dual A (Fin m → A)))

/-- The ambient module of Buchsbaum's exterior-bar construction for `f : Aⁿ → Aᵐ`:
`k` factors of `∧(Aᵐ)*` followed by one factor `∧Aⁿ`. -/
abbrev barModule (A : Type u) [CommRing A] (m n k : ℕ) : Type u :=
  (⨂[A]^k (ExteriorAlgebra A (Module.Dual A (Fin m → A)))) ⊗[A] ExteriorAlgebra A (Fin n → A)

/-- Buchsbaum's exterior-bar differential of `T(f)` (§1, p.185): contract the last form, through
`∧f*`, into the vector factor, and merge adjacent forms with alternating signs. -/
def barDifferential {m n : ℕ} (f : (Fin n → A) →ₗ[A] (Fin m → A)) (k : ℕ) :
    barModule A m n (k+1) →ₗ[A] barModule A m n k := sorry

/-- The value of the exterior-bar differential on a pure tensor `λ₀ ⊗ ⋯ ⊗ λ_k ⊗ α`. -/
theorem barDifferential_tprod {m n : ℕ} (f : (Fin n → A) →ₗ[A] (Fin m → A)) (k : ℕ)
    (l : Fin (k+1) → ExteriorAlgebra A (Module.Dual A (Fin m → A)))
    (α : ExteriorAlgebra A (Fin n → A)) :
    barDifferential f k (PiTensorProduct.tprod A l ⊗ₜ α) =
      PiTensorProduct.tprod A (fun i : Fin k ↦ l i.castSucc) ⊗ₜ
          omega (ExteriorAlgebra.map f.dualMap (l (Fin.last k))) α +
        (-1 : A) ^ (k + 1) • ∑ i : Fin k, (-1 : A) ^ (i : ℕ) •
          (PiTensorProduct.tprod A (fun j : Fin k ↦
              if (j : ℕ) < i then l j.castSucc
              else if (j : ℕ) = i then l j.castSucc * l j.succ else l j.succ) ⊗ₜ α) := sorry

/-- Buchsbaum's graded piece `T(f; k; p, q)`: the first form has degree at least `q`, the others
degree at least one, and the vector factor has degree `p` plus the total form degree. -/
def barSubmodule (A : Type u) [CommRing A] (m n p q k : ℕ) : Submodule A (barModule A m n k) :=
  Submodule.span A {x | ∃ (deg : Fin k → ℕ)
      (l : Fin k → ExteriorAlgebra A (Module.Dual A (Fin m → A)))
      (α : ExteriorAlgebra A (Fin n → A)),
    (∀ i : Fin k, (i : ℕ) = 0 → q ≤ deg i) ∧ (∀ i : Fin k, (i : ℕ) ≠ 0 → 1 ≤ deg i) ∧
    (∀ i, l i ∈ ⋀[A]^(deg i) (Module.Dual A (Fin m → A))) ∧
    α ∈ ⋀[A]^(p + ∑ i, deg i) (Fin n → A) ∧ x = PiTensorProduct.tprod A l ⊗ₜ α}

/-- The exterior-bar differential preserves the graded pieces `T(f; ·; p, q)`. -/
theorem barDifferential_mem {m n : ℕ} (f : (Fin n → A) →ₗ[A] (Fin m → A)) (p q k : ℕ)
    (x : barModule A m n (k+1)) (hx : x ∈ barSubmodule A m n p q (k+1)) :
    barDifferential f k x ∈ barSubmodule A m n p q k := sorry

/-- `omega` of a top form of `(A²)*` on a wedge of two vectors is their determinant. -/
example (v w : Fin 2 → ℤ) :
    omega (dualVolume ℤ 2) (ExteriorAlgebra.ι ℤ v * ExteriorAlgebra.ι ℤ w) =
      algebraMap ℤ _ (v 0 * w 1 - w 0 * v 1) := sorry
/-- In rank one, the bar differential of one form is the contraction `ω(f*e*)`. -/
example (f : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 1 → ℤ)) (α : ExteriorAlgebra ℤ (Fin 2 → ℤ)) :
    barDifferential f 0 (PiTensorProduct.tprod ℤ (fun _ : Fin 1 ↦ dualVolume ℤ 1) ⊗ₜ α) =
      PiTensorProduct.tprod ℤ (fun i : Fin 0 ↦ i.elim0) ⊗ₜ
        omega (ExteriorAlgebra.map f.dualMap (dualVolume ℤ 1)) α := sorry
/-- Merging two one-forms of `(A¹)*` gives zero, so in rank one only contractions survive. -/
example : dualVolume ℤ 1 * dualVolume ℤ 1 = 0 := sorry
/-- `bar_merge_sign`: on two factors `1 ⊗ e* ⊗ e` (rank one, `f = id`) the differential is
`1 ⊗ ω(e*)[e] + (e*) ⊗ e = 1 ⊗ 1 + e* ⊗ e`: the merge term enters with sign `+`. -/
example :
    let e : Fin 1 → ℤ := fun _ ↦ 1
    let es : Module.Dual ℤ (Fin 1 → ℤ) := LinearMap.proj 0
    barDifferential (LinearMap.id : (Fin 1 → ℤ) →ₗ[ℤ] (Fin 1 → ℤ)) 1
        (PiTensorProduct.tprod ℤ ![1, ExteriorAlgebra.ι ℤ es] ⊗ₜ ExteriorAlgebra.ι ℤ e) =
      PiTensorProduct.tprod ℤ ![(1 : ExteriorAlgebra ℤ (Module.Dual ℤ (Fin 1 → ℤ)))] ⊗ₜ
          (1 : ExteriorAlgebra ℤ (Fin 1 → ℤ)) +
        PiTensorProduct.tprod ℤ ![ExteriorAlgebra.ι ℤ es] ⊗ₜ ExteriorAlgebra.ι ℤ e := sorry
/-- `bar_degree_zero`: `T(f; 0; p, q)` is `∧ᵖ`, carried by the empty tensor. -/
example (v : Fin 2 → ℤ) :
    PiTensorProduct.tprod ℤ (fun i : Fin 0 ↦ i.elim0) ⊗ₜ ExteriorAlgebra.ι ℤ v ∈
      barSubmodule ℤ 1 2 1 1 0 := sorry
/-- `bar_low_form_rejected`: a first form of degree `0 < q` is excluded from `T(f; 1; 1, 1)`. -/
example : PiTensorProduct.tprod ℤ (fun _ : Fin 1 ↦ (1 : ExteriorAlgebra ℤ (Module.Dual ℤ (Fin 1 → ℤ))))
      ⊗ₜ ExteriorAlgebra.ι ℤ (fun _ : Fin 1 ↦ (1 : ℤ)) ∉ barSubmodule ℤ 1 1 1 1 1 := sorry
/-- `bar_degree_two_br`: `vol* ⊗ (e₀∧e₁∧e₂)` lies in the degree-two term `T(f; 1; 1, 2)`. -/
example : PiTensorProduct.tprod ℤ (fun _ : Fin 1 ↦ dualVolume ℤ 2) ⊗ₜ
      ((exteriorPower.ιMulti ℤ 3 (fun i : Fin 3 ↦ (Pi.single i 1 : Fin 3 → ℤ)) :
        ⋀[ℤ]^3 (Fin 3 → ℤ)) : ExteriorAlgebra ℤ (Fin 3 → ℤ)) ∈ barSubmodule ℤ 2 3 1 2 1 := sorry
end ExteriorBar

open CategoryTheory
variable {A : Type u} [CommRing A] {m n : ℕ}
/-- Requires 1 ≤ m ≤ n; the construction retains exterior-bar signs. -/
def moduleComplex (f : (Fin n → A) →ₗ[A] (Fin m → A)) : ChainComplex (ModuleCat.{u} A) ℕ :=
  ChainComplex.of (fun k ↦ match k with
    | 0 => ModuleCat.of A (Fin m → A)
    | 1 => ModuleCat.of A (Fin n → A)
    | 2 => ModuleCat.of A (⋀[A]^(m+1) (Fin n → A))
    | _+3 => by have _ := f; exact sorry)
    (fun k ↦ by cases k with
      | zero => exact ModuleCat.ofHom f
      | succ k => exact sorry) (by sorry)
def moduleComplex_X_zero (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (moduleComplex f).X 0 ≅ ModuleCat.of A (Fin m → A) := Iso.refl _
def moduleComplex_X_one (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (moduleComplex f).X 1 ≅ ModuleCat.of A (Fin n → A) := Iso.refl _
theorem moduleComplex_d_one (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (moduleComplex_X_one f).inv ≫ (moduleComplex f).d 1 0 ≫ (moduleComplex_X_zero f).hom =
      ModuleCat.ofHom f := sorry
/-- Degree two is `∧^{m+1}Aⁿ`; it stands for `∧ᵐ(Aᵐ)* ⊗ ∧^{m+1}Aⁿ` through the ordered dual
volume (`moduleComplex_d_two`). -/
def moduleComplex_X_two (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (moduleComplex f).X 2 ≅ ModuleCat.of A (⋀[A]^(m+1) (Fin n → A)) := Iso.refl _
/-- Standard determinant-line trivialization for a rank-two target, used to test d₂. -/
def moduleComplex_X_two_rank_two (f : (Fin n → A) →ₗ[A] (Fin 2 → A)) :
    (moduleComplex f).X 2 ≅ ModuleCat.of A (⋀[A]^3 (Fin n → A)) := Iso.refl _
/-- Degrees `k + 3` are Buchsbaum's exterior-bar terms `T(f; k+2; 1, m)`
(`BR(f) = K(f; 1, m)`, Buchsbaum §1 p.186). -/
def moduleComplex_X_bar (f : (Fin n → A) →ₗ[A] (Fin m → A)) (k : ℕ) :
    (moduleComplex f).X (k+3) ≅ ModuleCat.of A (barSubmodule A m n 1 m (k+2)) := sorry
/-- `d₂` is the exterior-bar differential on `e₀*∧⋯∧e_{m−1}* ⊗ α`: the signed maximal-minor
contraction `ω(∧ᵐf*(vol*))[α]`. -/
theorem moduleComplex_d_two (f : (Fin n → A) →ₗ[A] (Fin m → A)) (x : (moduleComplex f).X 2) :
    PiTensorProduct.tprod A (fun i : Fin 0 ↦ i.elim0) ⊗ₜ
        ExteriorAlgebra.ι A ((moduleComplex_X_one f).hom.hom (((moduleComplex f).d 2 1).hom x)) =
      barDifferential f 0 (PiTensorProduct.tprod A (fun _ : Fin 1 ↦ dualVolume A m) ⊗ₜ
        ((moduleComplex_X_two f).hom.hom x : ExteriorAlgebra A (Fin n → A))) := sorry
/-- `d₃` is the exterior-bar differential, read in degree two through the dual volume. -/
theorem moduleComplex_d_three (f : (Fin n → A) →ₗ[A] (Fin m → A)) (x : (moduleComplex f).X 3) :
    PiTensorProduct.tprod A (fun _ : Fin 1 ↦ dualVolume A m) ⊗ₜ
        ((moduleComplex_X_two f).hom.hom (((moduleComplex f).d 3 2).hom x) :
          ExteriorAlgebra A (Fin n → A)) =
      barDifferential f 1 ((moduleComplex_X_bar f 0).hom.hom x : barModule A m n 2) := sorry
/-- From degree four on the differentials are the exterior-bar differential. -/
theorem moduleComplex_d_bar (f : (Fin n → A) →ₗ[A] (Fin m → A)) (k : ℕ)
    (x : (moduleComplex f).X (k+4)) :
    ((moduleComplex_X_bar f k).hom.hom (((moduleComplex f).d (k+4) (k+3)).hom x) :
        barModule A m n (k+2)) =
      barDifferential f (k+2) ((moduleComplex_X_bar f (k+1)).hom.hom x : barModule A m n (k+3)) :=
  sorry
/-- For `m = 1` the Buchsbaum–Rim complex is the Koszul complex of the row entries. -/
def moduleComplex_rank_one (f : (Fin n → A) →ₗ[A] (Fin 1 → A)) :
    moduleComplex f ≅ Koszul.complex (fun i ↦ f (Pi.single i 1) 0) := sorry

def determinantalComplex (f : (Fin n → A) →ₗ[A] (Fin m → A)) : ChainComplex (ModuleCat.{u} A) ℕ :=
  ChainComplex.of (fun k ↦ match k with
    | 0 => ModuleCat.of A (⋀[A]^m (Fin m → A))
    | 1 => ModuleCat.of A (⋀[A]^m (Fin n → A))
    | _+2 => by have _ := f; exact sorry)
    (fun k ↦ by cases k with
      | zero => exact ModuleCat.ofHom (exteriorPower.map m f)
      | succ k => exact sorry) (by sorry)
def determinantalComplex_X_zero (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (determinantalComplex f).X 0 ≅ ModuleCat.of A (⋀[A]^m (Fin m → A)) := Iso.refl _
def determinantalComplex_X_one (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (determinantalComplex f).X 1 ≅ ModuleCat.of A (⋀[A]^m (Fin n → A)) := Iso.refl _
theorem determinantalComplex_d_one (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (determinantalComplex_X_one f).inv ≫ (determinantalComplex f).d 1 0 ≫
      (determinantalComplex_X_zero f).hom = ModuleCat.ofHom (exteriorPower.map m f) := sorry
/-- Degrees `k + 2` are Buchsbaum's exterior-bar terms `T(f; k+1; m, 1)`
(`DetBR(f) = K(f; m, 1)`, Buchsbaum §1 p.186). -/
def determinantalComplex_X_bar (f : (Fin n → A) →ₗ[A] (Fin m → A)) (k : ℕ) :
    (determinantalComplex f).X (k+2) ≅ ModuleCat.of A (barSubmodule A m n m 1 (k+1)) := sorry
/-- `d₂ : ⊕_{s≥1} ∧ˢ(Aᵐ)* ⊗ ∧^{m+s}Aⁿ → ∧ᵐAⁿ` is the contraction `λ ⊗ α ↦ ω(∧f*(λ))[α]`. -/
theorem determinantalComplex_d_two (f : (Fin n → A) →ₗ[A] (Fin m → A))
    (x : (determinantalComplex f).X 2) :
    PiTensorProduct.tprod A (fun i : Fin 0 ↦ i.elim0) ⊗ₜ
        ((determinantalComplex_X_one f).hom.hom (((determinantalComplex f).d 2 1).hom x) :
          ExteriorAlgebra A (Fin n → A)) =
      barDifferential f 0 ((determinantalComplex_X_bar f 0).hom.hom x : barModule A m n 1) := sorry
/-- From degree three on the differentials are the exterior-bar differential. -/
theorem determinantalComplex_d_bar (f : (Fin n → A) →ₗ[A] (Fin m → A)) (k : ℕ)
    (x : (determinantalComplex f).X (k+3)) :
    ((determinantalComplex_X_bar f k).hom.hom (((determinantalComplex f).d (k+3) (k+2)).hom x) :
        barModule A m n (k+1)) =
      barDifferential f (k+1)
        ((determinantalComplex_X_bar f (k+1)).hom.hom x : barModule A m n (k+2)) := sorry
def determinantalComplex_map {n' : ℕ}
    (f : (Fin n → A) →ₗ[A] (Fin m → A)) (f' : (Fin n' → A) →ₗ[A] (Fin m → A))
    (g : (Fin n → A) →ₗ[A] (Fin n' → A)) (hg : f'.comp g=f) :
    determinantalComplex f ⟶ determinantalComplex f' := sorry
/-- In bar degrees the comparison map is `∧g` on the vector factor. -/
theorem determinantalComplex_map_bar {n' : ℕ}
    (f : (Fin n → A) →ₗ[A] (Fin m → A)) (f' : (Fin n' → A) →ₗ[A] (Fin m → A))
    (g : (Fin n → A) →ₗ[A] (Fin n' → A)) (hg : f'.comp g=f) (k : ℕ)
    (x : (determinantalComplex f).X (k+2)) :
    ((determinantalComplex_X_bar f' k).hom.hom
        (((determinantalComplex_map f f' g hg).f (k+2)).hom x) : barModule A m n' (k+1)) =
      TensorProduct.map LinearMap.id (ExteriorAlgebra.map g).toLinearMap
        ((determinantalComplex_X_bar f k).hom.hom x : barModule A m n (k+1)) := sorry
/-- Maximal minors use the supplier's basis-independent range ideal. -/
abbrev maximalMinorIdeal (f : (Fin n → A) →ₗ[A] (Fin m → A)) : Ideal A :=
  (LinearMap.range f).minorsIdeal m
/-- Choosing the standard determinant basis identifies the determinant line with A. -/
def determinantalComplex_homology_zero (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (determinantalComplex f).homology 0 ≅ ModuleCat.of A (A ⧸ maximalMinorIdeal f) := sorry
def prefixMap (f : (Fin n → A) →ₗ[A] (Fin m → A)) (k : ℕ) (hk : k ≤ n) :
    (Fin k → A) →ₗ[A] (Fin m → A) := sorry
theorem prefixMap_apply (f : (Fin n → A) →ₗ[A] (Fin m → A)) (k : ℕ) (hk : k ≤ n)
    (v : Fin k → A) : prefixMap f k hk v =
      ∑ i : Fin k, v i • f (Pi.single (Fin.castLE hk i) 1) := sorry
/-- every prefix, not just the full map. -/
def IsRegular (f : (Fin n → A) →ₗ[A] (Fin m → A)) : Prop :=
  ∀ k (_hmk : m ≤ k) (hkn : k ≤ n), Limits.IsZero ((moduleComplex (prefixMap f k hkn)).homology 1)
theorem IsRegular_prefix (f : (Fin n → A) →ₗ[A] (Fin m → A)) (hf : IsRegular f)
    (k : ℕ) (hmk : m ≤ k) (hkn : k ≤ n) : IsRegular (prefixMap f k hkn) := sorry
/-- The ordered row entries are the weak regular sequence; no proper-quotient condition is added. -/
theorem IsRegular_rank_one (f : (Fin n → A) →ₗ[A] (Fin 1 → A)) :
    IsRegular f ↔ RingTheory.Sequence.IsWeaklyRegular A
      ((List.finRange n).map fun i ↦ f (Pi.single i 1) 0) := sorry

/-- The rank-one comparison fixes scalar degree zero and the source generators in degree one. -/
theorem moduleComplex_rank_one_f (f : (Fin n → A) →ₗ[A] (Fin 1 → A)) :
    (∀ v : Fin 1 → A,
      (Koszul.complex_X_zero (fun i ↦ f (Pi.single i 1) 0)).hom.hom
        (((moduleComplex_rank_one f).hom.f 0).hom v) = v 0) ∧
    (∀ v : Fin n → A,
      (Koszul.complex_X_one (fun i ↦ f (Pi.single i 1) 0)).hom.hom
        (((moduleComplex_rank_one f).hom.f 1).hom v) = v) := sorry

/-- In degree two the rank-one comparison is the identity on the ordered exterior square. -/
theorem moduleComplex_rank_one_f_two (f : (Fin n → A) →ₗ[A] (Fin 1 → A))
    (x : ⋀[A]^2 (Fin n → A)) :
    (Koszul.complex_X (fun i ↦ f (Pi.single i 1) 0) 2).hom.hom
      (((moduleComplex_rank_one f).hom.f 2).hom ((moduleComplex_X_two f).inv.hom x)) = x := sorry

/-- In every bar degree the inverse comparison inserts one ordered dual volume per factor. -/
theorem moduleComplex_rank_one_inv_bar (f : (Fin n → A) →ₗ[A] (Fin 1 → A))
    (k : ℕ) (x : ⋀[A]^(k+3) (Fin n → A)) :
    ((moduleComplex_X_bar f k).hom.hom
      (((moduleComplex_rank_one f).inv.f (k+3)).hom
        ((Koszul.complex_X (fun i ↦ f (Pi.single i 1) 0) (k+3)).inv.hom x)) :
          barModule A 1 n (k+2)) =
      PiTensorProduct.tprod A (fun _ : Fin (k+2) ↦ dualVolume A 1) ⊗ₜ
        (x : ExteriorAlgebra A (Fin n → A)) := sorry

/-- The standard dual determinant basis gives the cyclic minor signs in rank two. -/
theorem moduleComplex_d_two_rank_two (f : (Fin n → A) →ₗ[A] (Fin 2 → A))
    (v : Fin 3 → (Fin n → A)) :
    (moduleComplex_X_one f).hom.hom (((moduleComplex f).d 2 1).hom
      ((moduleComplex_X_two_rank_two f).inv.hom (exteriorPower.ιMulti A 3 v))) =
      (f (v 0) 0 * f (v 1) 1 - f (v 1) 0 * f (v 0) 1) • v 2 +
      (f (v 1) 0 * f (v 2) 1 - f (v 2) 0 * f (v 1) 1) • v 0 +
      (f (v 2) 0 * f (v 0) 1 - f (v 0) 0 * f (v 2) 1) • v 1 := sorry

/-- Naturality fixes the determinant-line map and the exterior map of source generators. -/
theorem determinantalComplex_map_f {n' : ℕ}
    (f : (Fin n → A) →ₗ[A] (Fin m → A)) (f' : (Fin n' → A) →ₗ[A] (Fin m → A))
    (g : (Fin n → A) →ₗ[A] (Fin n' → A)) (hg : f'.comp g=f) :
    ((determinantalComplex_map f f' g hg).f 0).hom = LinearMap.id ∧
    ((determinantalComplex_map f f' g hg).f 1).hom = exteriorPower.map m g := sorry

/-- The determinant quotient comparison uses the ordered standard target volume. -/
theorem determinantalComplex_homology_zero_π
    (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (determinantalComplex f).homologyπ 0 ≫ (determinantalComplex_homology_zero f).hom =
      (determinantalComplex f).iCycles 0 ≫ ModuleCat.ofHom
        ((Ideal.Quotient.mkₐ A (maximalMinorIdeal f)).toLinearMap ∘ₗ
          exteriorPower.alternatingMapLinearEquiv
            (Matrix.detRowAlternating : (Fin m → A) [⋀^Fin m]→ₗ[A] A)) := sorry
/-- `br_zero_zero`: the boundary of (2,−3) in the displayed coordinates. -/
example : let f := (0 : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ))
    (moduleComplex_X_zero f).hom.hom (((moduleComplex f).d 1 0).hom
      ((moduleComplex_X_one f).inv.hom ![2,-3])) = ![0,0] := sorry


/-- `detbr_zero_zero`: the determinant boundary is the computed maximal minor. -/
example : let f := (0 : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ))
    (determinantalComplex_X_zero f).hom.hom (((determinantalComplex f).d 1 0).hom
      ((determinantalComplex_X_one f).inv.hom
        (exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]]))) =
      (0 : ℤ) • exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]] := sorry


/-- `br_zero_identity`: the boundary of (2,−3) in the displayed coordinates. -/
example : let f := (LinearMap.id : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ))
    (moduleComplex_X_zero f).hom.hom (((moduleComplex f).d 1 0).hom
      ((moduleComplex_X_one f).inv.hom ![2,-3])) = ![2,-3] := sorry


/-- `detbr_zero_identity`: the determinant boundary is the computed maximal minor. -/
example : let f := (LinearMap.id : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ))
    (determinantalComplex_X_zero f).hom.hom (((determinantalComplex f).d 1 0).hom
      ((determinantalComplex_X_one f).inv.hom
        (exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]]))) =
      (1 : ℤ) • exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]] := sorry


/-- `br_zero_non_diagonal`: the boundary of (2,−3) in the displayed coordinates. -/
example : let f := (Matrix.mulVecLin (!![2,3;4,5] : Matrix (Fin 2) (Fin 2) ℤ))
    (moduleComplex_X_zero f).hom.hom (((moduleComplex f).d 1 0).hom
      ((moduleComplex_X_one f).inv.hom ![2,-3])) = ![-5,-7] := sorry


/-- `detbr_zero_non_diagonal`: the determinant boundary is the computed maximal minor. -/
example : let f := (Matrix.mulVecLin (!![2,3;4,5] : Matrix (Fin 2) (Fin 2) ℤ))
    (determinantalComplex_X_zero f).hom.hom (((determinantalComplex f).d 1 0).hom
      ((determinantalComplex_X_one f).inv.hom
        (exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]]))) =
      (-2 : ℤ) • exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]] := sorry


/-- `br_two_wedge_positive`: the ordered triple detects scaling and reversal. -/
example : (moduleComplex_X_two_rank_two
    (0 : (Fin 3 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ))).hom.hom
      (exteriorPower.ιMulti ℤ 3 ![![2,0,0],![0,3,0],![0,0,1]]) = 6 • exteriorPower.ιMulti ℤ 3 (fun i ↦ Pi.single i 1) := sorry

/-- `br_two_wedge_negative`: the ordered triple detects scaling and reversal. -/
example : (moduleComplex_X_two_rank_two
    (0 : (Fin 3 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ))).hom.hom
      (exteriorPower.ιMulti ℤ 3 ![![0,1,0],![1,0,0],![0,0,1]]) = -exteriorPower.ιMulti ℤ 3 (fun i ↦ Pi.single i 1) := sorry

/-- `br_two_wedge_zero`: a repeated-vector wedge maps to zero. -/
example : (moduleComplex_X_two_rank_two (0 : (Fin 3 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ))).hom.hom
    (exteriorPower.ιMulti ℤ 3 ![![1,0,0],![1,0,0],![0,0,1]]) = 0 := sorry

/-- `br_two_positive`: cyclic minors evaluated on the ordered basis triple. -/
example :
    let f := Matrix.mulVecLin (!![1,0,0;0,1,0] : Matrix (Fin 2) (Fin 3) ℤ)
    (moduleComplex_X_one f).hom.hom (((moduleComplex f).d 2 1).hom
      ((moduleComplex_X_two_rank_two f).inv.hom
        (exteriorPower.ιMulti ℤ 3 ![![1,0,0],![0,1,0],![0,0,1]]))) = ![0,0,1] := sorry
/-- `br_two_negative`: cyclic minors evaluated on the ordered basis triple. -/
example :
    let f := Matrix.mulVecLin (!![0,1,0;1,0,0] : Matrix (Fin 2) (Fin 3) ℤ)
    (moduleComplex_X_one f).hom.hom (((moduleComplex f).d 2 1).hom
      ((moduleComplex_X_two_rank_two f).inv.hom
        (exteriorPower.ιMulti ℤ 3 ![![1,0,0],![0,1,0],![0,0,1]]))) = ![0,0,-1] := sorry
/-- `br_two_zero`: cyclic minors evaluated on the ordered basis triple. -/
example :
    let f := Matrix.mulVecLin (!![0,0,0;0,0,0] : Matrix (Fin 2) (Fin 3) ℤ)
    (moduleComplex_X_one f).hom.hom (((moduleComplex f).d 2 1).hom
      ((moduleComplex_X_two_rank_two f).inv.hom
        (exteriorPower.ιMulti ℤ 3 ![![1,0,0],![0,1,0],![0,0,1]]))) = ![0,0,0] := sorry
/-- `br_rank_one_identity`: the comparison preserves the source generator and its scalar. -/
example : let f := (LinearMap.id : (Fin 1 → ℤ) →ₗ[ℤ] (Fin 1 → ℤ))
    (Koszul.complex_X_one (fun i ↦ f (Pi.single i 1) 0)).hom.hom
      (((moduleComplex_rank_one f).hom.f 1).hom ![3]) = ![3] := sorry
/-- `br_rank_one_zero`: the comparison preserves the source generator and its scalar. -/
example : let f := (0 : (Fin 1 → ℤ) →ₗ[ℤ] (Fin 1 → ℤ))
    (Koszul.complex_X_one (fun i ↦ f (Pi.single i 1) 0)).hom.hom
      (((moduleComplex_rank_one f).hom.f 1).hom ![-2]) = ![-2] := sorry
/-- `br_rank_one_two`: the comparison preserves the source generator and its scalar. -/
example : let f := (Matrix.mulVecLin (!![2] : Matrix (Fin 1) (Fin 1) ℤ))
    (Koszul.complex_X_one (fun i ↦ f (Pi.single i 1) 0)).hom.hom
      (((moduleComplex_rank_one f).hom.f 1).hom ![1]) = ![1] := sorry
/-- `detbr_map_identity`: functoriality distinguishes the fixed target line from source wedges. -/
example : ((determinantalComplex_map (0 : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ)) 0
    (LinearMap.id : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ)) (by simp)).f 1).hom
      (exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]]) = exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]] := sorry
/-- `detbr_map_zero`: functoriality distinguishes the fixed target line from source wedges. -/
example : ((determinantalComplex_map (0 : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ)) 0
    (0 : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ)) (by simp)).f 1).hom
      (exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]]) = 0 := sorry
/-- `detbr_map_zero_unit`: functoriality distinguishes the fixed target line from source wedges. -/
example : ((determinantalComplex_map (0 : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ)) 0
    (0 : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ)) (by simp)).f 0).hom
      (exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]]) = exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]] := sorry
/-- `detbr_hzero_six`: the ordered target volume maps to its scalar residue. -/
example : let f := Matrix.mulVecLin (!![2,0;0,3] : Matrix (Fin 2) (Fin 2) ℤ)
    (((determinantalComplex f).iCyclesIso 0 0 (by apply ComplexShape.next_eq_self'; intro k; simp) (by simp)).inv ≫
      (determinantalComplex f).homologyπ 0 ≫ (determinantalComplex_homology_zero f).hom).hom
        (7 • exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]]) =
      Ideal.Quotient.mk (maximalMinorIdeal f) 1 := sorry
/-- `detbr_hzero_zero`: the ordered target volume maps to its scalar residue. -/
example : let f := Matrix.mulVecLin (!![0,0;0,0] : Matrix (Fin 2) (Fin 2) ℤ)
    (((determinantalComplex f).iCyclesIso 0 0 (by apply ComplexShape.next_eq_self'; intro k; simp) (by simp)).inv ≫
      (determinantalComplex f).homologyπ 0 ≫ (determinantalComplex_homology_zero f).hom).hom
        (3 • exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]]) =
      Ideal.Quotient.mk (maximalMinorIdeal f) 3 := sorry
/-- `detbr_hzero_unit`: the ordered target volume maps to its scalar residue. -/
example : let f := Matrix.mulVecLin (!![1,0;0,1] : Matrix (Fin 2) (Fin 2) ℤ)
    (((determinantalComplex f).iCyclesIso 0 0 (by apply ComplexShape.next_eq_self'; intro k; simp) (by simp)).inv ≫
      (determinantalComplex f).homologyπ 0 ≫ (determinantalComplex_homology_zero f).hom).hom
        (3 • exteriorPower.ιMulti ℤ 2 ![![1,0],![0,1]]) =
      Ideal.Quotient.mk (maximalMinorIdeal f) 0 := sorry

end BuchsbaumRim

/-! ## Layer IHG.6: the two relation complexes -/

namespace IntegralRibet
open CategoryTheory
variable {R : Type u} [CommRing R]
/-- Koszul tensor the twisted local determinant complexes.
The lower-Borel comodule structure and the determinant-character twist are not part of this signature. -/
def upperRelationComplex {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) :
    ChainComplex (ModuleCat.{u} R) ℕ :=
  ChainComplex.of (fun k ↦ match k with
    | 0 => ModuleCat.of R R
    | _+1 => by
        have _ := linearRelations
        have _ := localSize
        have _ := localMaps
        exact sorry)
    (fun _ ↦ by sorry) (by sorry)
def upperRelationComplex_X_zero {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) :
    (upperRelationComplex linearRelations localSize localMaps).X 0 ≅ ModuleCat.of R R := Iso.refl _
theorem upperRelationComplex_image {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) :
    LinearMap.range
      (((upperRelationComplex linearRelations localSize localMaps).d 1 0 ≫
        (upperRelationComplex_X_zero linearRelations localSize localMaps).hom).hom) =
      ((Ideal.span (Set.range linearRelations) ⊔
        ⨆ t, BuchsbaumRim.maximalMinorIdeal (localMaps t)) : Submodule R R) := sorry
/-- Augmentation on degree zero, with positive degrees zero; the target is the single-object complex. -/
def upperRelationComplex_augmentation {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) :
    upperRelationComplex linearRelations localSize localMaps ⟶
      (ChainComplex.single₀ (ModuleCat.{u} R)).obj (ModuleCat.of R
        (R ⧸ (Ideal.span (Set.range linearRelations) ⊔
          ⨆ t, BuchsbaumRim.maximalMinorIdeal (localMaps t)))) := sorry
/-- The full relation ideal from matrix rows and the actual local pairs of columns.
The local matrices are the differences Yσ and the scalars are xσ; distinct pairs contribute
localRelationMatrix Yσ Yτ xσ xτ. -/
def fullRelationIdeal {r v : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localSize : Fin v → ℕ)
    (Y : ∀ t, Fin (localSize t) → Matrix (Fin 2) (Fin 2) R)
    (x : ∀ t, Fin (localSize t) → R) : Ideal R :=
  relationIdeal rows ⊔ Ideal.span {a | ∃ t i j, i ≠ j ∧
    ∃ k l : Fin 2, a = localRelationMatrix (Y t i) (Y t j) (x t i) (x t j) k l}

/-- Tensor product of the multilinear Koszul complexes of the matrix rows and the
local distinct-block determinant complexes. Local columns are (xσ-dσ,cσ) and (bσ,xσ-aσ).
This is the underlying complex of modules; equivariance additionally requires the formal
matrix coaction. Positive-degree exactness is not asserted. -/
def fullRelationComplex {r v : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localSize : Fin v → ℕ)
    (Y : ∀ t, Fin (localSize t) → Matrix (Fin 2) (Fin 2) R)
    (x : ∀ t, Fin (localSize t) → R) : ChainComplex (ModuleCat.{u} R) ℕ :=
  ChainComplex.of (fun k ↦ match k with
    | 0 => ModuleCat.of R R
    | _+1 => by
        have _ := rows
        have _ := localSize
        have _ := x
        exact sorry)
    (fun _ ↦ by sorry) (by sorry)
def fullRelationComplex_X_zero {r v : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localSize : Fin v → ℕ)
    (Y : ∀ t, Fin (localSize t) → Matrix (Fin 2) (Fin 2) R)
    (x : ∀ t, Fin (localSize t) → R) :
    (fullRelationComplex rows localSize Y x).X 0 ≅ ModuleCat.of R R := Iso.refl _
theorem fullRelationComplex_image {r v : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localSize : Fin v → ℕ)
    (Y : ∀ t, Fin (localSize t) → Matrix (Fin 2) (Fin 2) R)
    (x : ∀ t, Fin (localSize t) → R) :
    LinearMap.range (((fullRelationComplex rows localSize Y x).d 1 0 ≫
      (fullRelationComplex_X_zero rows localSize Y x).hom).hom) =
      (fullRelationIdeal rows localSize Y x : Submodule R R) := sorry
/-- Each underlying module is a finite direct sum of adjoint tensor powers. -/
theorem fullRelationComplex_terms {r v : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localSize : Fin v → ℕ)
    (Y : ∀ t, Fin (localSize t) → Matrix (Fin 2) (Fin 2) R)
    (x : ∀ t, Fin (localSize t) → R) (k : ℕ) :
    ∃ count : ℕ, Nonempty ((fullRelationComplex rows localSize Y x).X k ≅
      ModuleCat.of R (Fin count → TensorPower R k (Matrix (Fin 2) (Fin 2) R))) := sorry

/-- The tensor product, in the given order, of a finite family of chain complexes; the empty
family gives the unit complex `R` in degree zero. -/
def tensorFamily : {v : ℕ} → (Fin v → ChainComplex (ModuleCat.{u} R) ℕ) →
    ChainComplex (ModuleCat.{u} R) ℕ
  | 0, _ => MonoidalCategoryStruct.tensorUnit _
  | _+1, C => MonoidalCategoryStruct.tensorObj (C 0) (tensorFamily (fun i ↦ C i.succ))

/-- The upper-entry complex is `K(L) ⊗ ⨂_t DetBR(f_t)`, with the determinant lines of the
local factors trivialized by their ordered bases in degree zero. -/
def upperRelationComplex_tensor {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) :
    upperRelationComplex linearRelations localSize localMaps ≅
      MonoidalCategoryStruct.tensorObj (Koszul.complex linearRelations)
        (tensorFamily fun t ↦ BuchsbaumRim.determinantalComplex (localMaps t)) := sorry

/-- Evaluation of a matrix against the entries of a relation row: `Z ↦ ∑ U_{ij} Z_{ij}`. -/
def rowFunctional (U : Matrix (Fin 2) (Fin 2) R) : Matrix (Fin 2) (Fin 2) R →ₗ[R] R where
  toFun Z := ∑ i, ∑ j, U i j * Z i j
  map_add' Z W := by simp [mul_add, Finset.sum_add_distrib]
  map_smul' c Z := by simp [Fin.sum_univ_two]; ring

/-- The two-term complex `M₂(R) → R` of one relation row, in degrees one and zero. -/
def rowComplex (U : Matrix (Fin 2) (Fin 2) R) : ChainComplex (ModuleCat.{u} R) ℕ :=
  ChainComplex.of (fun k ↦ match k with
    | 0 => ModuleCat.of R R
    | 1 => ModuleCat.of R (Matrix (Fin 2) (Fin 2) R)
    | _+2 => ModuleCat.of R PUnit.{u+1})
    (fun k ↦ by cases k with
      | zero => exact ModuleCat.ofHom (rowFunctional U)
      | succ k => exact 0) (by sorry)

/-- The local map `R^{N·2} → R²` whose columns at `σ` are `(x_σ − d_σ, c_σ)` and
`(b_σ, x_σ − a_σ)`, for `Y_σ = [[a_σ, b_σ], [c_σ, d_σ]]`; index `(σ, ε)` is `finProdFinEquiv`. -/
def localColumns {N : ℕ} (Y : Fin N → Matrix (Fin 2) (Fin 2) R) (x : Fin N → R) :
    (Fin (N * 2) → R) →ₗ[R] (Fin 2 → R) :=
  Matrix.mulVecLin (Matrix.of fun i j ↦
    let p := finProdFinEquiv.symm j
    if p.2 = 0 then ![x p.1 - Y p.1 1 1, Y p.1 1 0] i else ![Y p.1 0 1, x p.1 - Y p.1 0 0] i)

/-- Wedges of standard basis vectors taken from pairwise distinct local indices. -/
def distinctWedges (N : ℕ) : Submodule R (ExteriorAlgebra R (Fin (N * 2) → R)) :=
  Submodule.span R {α | ∃ (j : ℕ) (σ : Fin j → Fin N) (ε : Fin j → Fin 2),
    Function.Injective σ ∧
      α = ((exteriorPower.ιMulti R j
        (fun i ↦ Pi.single (finProdFinEquiv (σ i, ε i)) (1 : R)) : ⋀[R]^j (Fin (N * 2) → R)) :
          ExteriorAlgebra R (Fin (N * 2) → R))}

/-- The distinct-index subcomplex of `DetBR` of the local columns. -/
def localDistinctComplex (N : ℕ) (Y : Fin N → Matrix (Fin 2) (Fin 2) R) (x : Fin N → R) :
    ChainComplex (ModuleCat.{u} R) ℕ := sorry

def localDistinctComplex_ι (N : ℕ) (Y : Fin N → Matrix (Fin 2) (Fin 2) R) (x : Fin N → R) :
    localDistinctComplex N Y x ⟶ BuchsbaumRim.determinantalComplex (localColumns Y x) := sorry

theorem localDistinctComplex_ι_injective (N : ℕ) (Y : Fin N → Matrix (Fin 2) (Fin 2) R)
    (x : Fin N → R) (k : ℕ) : Function.Injective ((localDistinctComplex_ι N Y x).f k).hom := sorry

/-- Degree zero is the whole determinant line. -/
theorem localDistinctComplex_range_zero (N : ℕ) (Y : Fin N → Matrix (Fin 2) (Fin 2) R)
    (x : Fin N → R) : Function.Surjective ((localDistinctComplex_ι N Y x).f 0).hom := sorry

/-- Degree one consists of the distinct-index wedges in `∧²`. -/
theorem localDistinctComplex_range_one (N : ℕ) (Y : Fin N → Matrix (Fin 2) (Fin 2) R)
    (x : Fin N → R) :
    LinearMap.range (((localDistinctComplex_ι N Y x).f 1) ≫
        (BuchsbaumRim.determinantalComplex_X_one (localColumns Y x)).hom).hom =
      (distinctWedges N).comap (⋀[R]^2 (Fin (N * 2) → R)).subtype := sorry

/-- From degree two on, the image is spanned by bar tensors whose vector factor is a
distinct-index wedge. -/
theorem localDistinctComplex_range_bar (N : ℕ) (Y : Fin N → Matrix (Fin 2) (Fin 2) R)
    (x : Fin N → R) (k : ℕ) :
    LinearMap.range (((localDistinctComplex_ι N Y x).f (k+2)) ≫
        (BuchsbaumRim.determinantalComplex_X_bar (localColumns Y x) k).hom).hom =
      (Submodule.span R {z | ∃ (l : Fin (k+1) → ExteriorAlgebra R (Module.Dual R (Fin 2 → R)))
          (α : ExteriorAlgebra R (Fin (N * 2) → R)), α ∈ distinctWedges N ∧
            z = PiTensorProduct.tprod R l ⊗ₜ α}).comap
        (BuchsbaumRim.barSubmodule R 2 (N * 2) 2 1 (k+1)).subtype := sorry

/-- `tensor_family_empty`: the empty tensor complex has a rank-one zeroth homology. -/
example : Nonempty ((tensorFamily (R := ℤ) (Fin.elim0 : Fin 0 → ChainComplex (ModuleCat ℤ) ℕ)).homology 0 ≃ₗ[ℤ] ℤ) := sorry

/-- `tensor_family_single`: one factor is that factor, up to the unit isomorphism. -/
example (C : ChainComplex (ModuleCat.{u} R) ℕ) :
    Nonempty (tensorFamily (fun _ : Fin 1 ↦ C) ≅ C) := sorry
/-- `tensor_family_two_koszul`: `K(2) ⊗ K(3)` over `ℤ` has `H₀ = ℤ/(2,3) = 0`. -/
example : Limits.IsZero ((tensorFamily
    ![Koszul.complex (fun _ : Fin 1 ↦ (2 : ℤ)), Koszul.complex (fun _ : Fin 1 ↦ (3 : ℤ))]).homology 0) :=
  sorry
/-- `row_functional_values`: evaluation against the identity row is the trace, `5` at
`diag(2,3)`; against `E₀₁` it reads the upper entry; the zero row gives `0`. -/
example : rowFunctional (1 : Matrix (Fin 2) (Fin 2) ℤ) !![2,7;11,3] = 5 ∧
    rowFunctional (Matrix.single (0 : Fin 2) 1 (1 : ℤ)) !![2,7;11,3] = 7 ∧
    rowFunctional (0 : Matrix (Fin 2) (Fin 2) ℤ) !![2,7;11,3] = 0 := by
  refine ⟨?_, ?_, ?_⟩ <;>
    simp [rowFunctional, Fin.sum_univ_two, Matrix.one_apply, Matrix.single_apply]
/-- `row_complex_homology`: `H₀` of a row complex is `R` modulo the entries of the row. -/
example (U : Matrix (Fin 2) (Fin 2) R) :
    Nonempty ((rowComplex U).homology 0 ≅
      ModuleCat.of R (R ⧸ Ideal.span {a | ∃ i j, a = U i j})) := sorry
/-- `row_complex_terms`: degrees zero and one are `R` and `M₂(R)`, and degree two is zero. -/
example (U : Matrix (Fin 2) (Fin 2) R) :
    (rowComplex U).X 0 = ModuleCat.of R R ∧ (rowComplex U).X 1 = ModuleCat.of R (Matrix (Fin 2) (Fin 2) R) ∧
      Limits.IsZero ((rowComplex U).X 2) := sorry
/-- `local_columns_orientation`: for `Y = [[1,2],[3,4]]`, `x = 9` the two columns are
`(9−4, 3) = (5,3)` and `(2, 9−1) = (2,8)`, in this order. -/
example : localColumns (fun _ : Fin 1 ↦ (!![1,2;3,4] : Matrix (Fin 2) (Fin 2) ℤ)) (fun _ ↦ 9)
      (Pi.single (finProdFinEquiv ((0 : Fin 1), (0 : Fin 2))) 1) = ![5,3] ∧
    localColumns (fun _ : Fin 1 ↦ (!![1,2;3,4] : Matrix (Fin 2) (Fin 2) ℤ)) (fun _ ↦ 9)
      (Pi.single (finProdFinEquiv ((0 : Fin 1), (1 : Fin 2))) 1) = ![2,8] := by
  constructor <;> ext i <;> fin_cases i <;> decide
/-- `local_columns_maximal_minor`: the minor of the two columns of one index is
`(x−d)(x−a) − bc`, the characteristic polynomial of `Y` at `x`. -/
example (a b c d x : ℤ) :
    BuchsbaumRim.maximalMinorIdeal (localColumns (fun _ : Fin 1 ↦ !![a,b;c,d]) (fun _ ↦ x)) =
      Ideal.span {(x - d) * (x - a) - b * c} := sorry
/-- `distinct_wedges`: `e_{(0,0)} ∧ e_{(1,1)}` and the empty wedge are distinct-index wedges;
`e_{(0,0)} ∧ e_{(0,1)}` (one index twice) is not. -/
example :
    let e : Fin 2 × Fin 2 → (Fin (2 * 2) → ℤ) := fun p ↦ Pi.single (finProdFinEquiv p) 1
    ExteriorAlgebra.ι ℤ (e (0, 0)) * ExteriorAlgebra.ι ℤ (e (1, 1)) ∈ distinctWedges (R := ℤ) 2 ∧
      (1 : ExteriorAlgebra ℤ (Fin (2 * 2) → ℤ)) ∈ distinctWedges (R := ℤ) 2 ∧
      ExteriorAlgebra.ι ℤ (e (0, 0)) * ExteriorAlgebra.ι ℤ (e (0, 1)) ∉ distinctWedges (R := ℤ) 2 :=
  sorry
/-- `local_distinct_single`: one local index has no distinct pair, so only degree zero survives. -/
example (Y : Fin 1 → Matrix (Fin 2) (Fin 2) R) (x : Fin 1 → R) (k : ℕ) :
    Limits.IsZero ((localDistinctComplex 1 Y x).X (k+1)) := sorry
/-- `local_distinct_pair`: two local indices give a free degree-one term of rank four. -/
example (Y : Fin 2 → Matrix (Fin 2) (Fin 2) R) (x : Fin 2 → R) :
    Nonempty ((localDistinctComplex 2 Y x).X 1 ≅ ModuleCat.of R (Fin 4 → R)) := sorry
/-- `local_distinct_degree_zero`: degree zero is the determinant line `R`. -/
example (N : ℕ) (Y : Fin N → Matrix (Fin 2) (Fin 2) R) (x : Fin N → R) :
    Nonempty ((localDistinctComplex N Y x).X 0 ≅ ModuleCat.of R R) := sorry

/-- The full-entry complex is the tensor product of the row complexes and the local
distinct-index subcomplexes, in the given order. -/
def fullRelationComplex_multilinear {r v : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localSize : Fin v → ℕ)
    (Y : ∀ t, Fin (localSize t) → Matrix (Fin 2) (Fin 2) R)
    (x : ∀ t, Fin (localSize t) → R) :
    fullRelationComplex rows localSize Y x ≅
      MonoidalCategoryStruct.tensorObj (tensorFamily fun t ↦ rowComplex (rows t))
        (tensorFamily fun t ↦ localDistinctComplex (localSize t) (Y t) (x t)) := sorry

/-- The upper local columns, in their given order, are `(bσ, xσ − aσ)`. -/
def upperLocalColumns {N : ℕ} (Y : Fin N → Matrix (Fin 2) (Fin 2) R) (x : Fin N → R) :
    (Fin N → R) →ₗ[R] (Fin 2 → R) :=
  Matrix.mulVecLin (Matrix.of fun i j ↦ ![Y j 0 1, x j - Y j 0 0] i)

section EquivariantComparison

variable (c n : ℕ) (triangular : Finset (Fin n)) {r v : ℕ}
  (rows : Fin r → Matrix (Fin 2) (Fin 2) (formalRing c n triangular))
  (localSize : Fin v → ℕ)
  (Y : ∀ t, Fin (localSize t) → Matrix (Fin 2) (Fin 2) (formalRing c n triangular))
  (x : ∀ t, Fin (localSize t) → formalRing c n triangular)

/-- On the Koszul generators use the character `z/x`; on each local factor use
`V = std ⊗ x⁻¹`, its dual on the bar factors, the character `z/x` on every source
column, and the inverse determinant character `x/z`. Transport their tensor coaction
through `upperRelationComplex_tensor`. DKSW §5.4 (63)–(65), §5.6 (67). -/
@[instance_reducible] def upperRelationComplex_borel (k : ℕ) :
    TauCeti.Comodule ℤ lowerBorelRing
      ((upperRelationComplex (fun i ↦ rows i 0 1) localSize
        (fun t ↦ upperLocalColumns (Y t) (x t))).X k) := sorry

/-- On row factors use the dual of inverse conjugation, identified with the adjoint
by the trace pairing. On local distinct-index wedges use `V = std ⊗ x⁻¹`, its dual
on the bar factors, and the twist `x/z`. Transport the tensor coaction through
`fullRelationComplex_multilinear`. DKSW §5.5–5.6, Lemmas 5.6–5.10. -/
@[instance_reducible] def fullRelationComplex_borel (k : ℕ) :
    TauCeti.Comodule ℤ lowerBorelRing ((fullRelationComplex rows localSize Y x).X k) := sorry

/-- The tensor comparison: the Koszul generator in row `i` maps to the upper-entry
vector `E₀₁` in that row factor, and each local source vector maps to `B` at the same
local index. Exterior powers of these insertions and identity maps on the bar factors
give the comparison in every degree, with the determinant twists retained. -/
def relationComplex_comparison :
    upperRelationComplex (fun i ↦ rows i 0 1) localSize
      (fun t ↦ upperLocalColumns (Y t) (x t)) ⟶ fullRelationComplex rows localSize Y x := sorry

/-- Equivariance of the comparison over the formal ring: matrix rows and local matrices
transform by inverse conjugation and local scalars are invariant. The map is induced by
inserting the upper-entry vector in each row and `B` at every local index. The two
coactions restrict in degree zero to the given formal-ring coaction, and commute with
all differentials and all components of the comparison. DKSW Proposition 5.5 and
Lemmas 5.6–5.10. Regularity of the stabilized presentation is needed for exactness,
not for this equivariant comparison. -/
theorem relationComplex_equivariant_comparison
    (hrows : ∀ i, (rows i).map (formalRing_borel c n triangular) =
      lowerBorelConjugate (rows i))
    (hY : ∀ t i, (Y t i).map (formalRing_borel c n triangular) =
      lowerBorelConjugate (Y t i))
    (hx : ∀ t i, formalRing_borel c n triangular (x t i) = 1 ⊗ₜ[ℤ] x t i) :
    let C := upperRelationComplex (fun i ↦ rows i 0 1) localSize
      (fun t ↦ upperLocalColumns (Y t) (x t))
    let D := fullRelationComplex rows localSize Y x
    let ρC := upperRelationComplex_borel c n triangular rows localSize Y x
    let ρD := fullRelationComplex_borel c n triangular rows localSize Y x
    (ρC 0).coact = (formalComodule c n triangular).coact ∧
    (ρD 0).coact = (formalComodule c n triangular).coact ∧
    (∀ i j, (ρC j).coact ∘ₗ ((C.d i j).hom.restrictScalars ℤ) =
      ((C.d i j).hom.restrictScalars ℤ).rTensor lowerBorelRing ∘ₗ (ρC i).coact) ∧
    (∀ i j, (ρD j).coact ∘ₗ ((D.d i j).hom.restrictScalars ℤ) =
      ((D.d i j).hom.restrictScalars ℤ).rTensor lowerBorelRing ∘ₗ (ρD i).coact) ∧
    let F := relationComplex_comparison c n triangular rows localSize Y x
    F.f 0 = 𝟙 (ModuleCat.of (formalRing c n triangular)
      (formalRing c n triangular)) ∧
      ∀ k, (ρD k).coact ∘ₗ ((F.f k).hom.restrictScalars ℤ) =
        ((F.f k).hom.restrictScalars ℤ).rTensor lowerBorelRing ∘ₗ (ρC k).coact := sorry

end EquivariantComparison

/-- The augmentation is the quotient map on the actual degree-zero scalar module. -/
theorem upperRelationComplex_augmentation_f_zero {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) (a : R) :
    ((upperRelationComplex_augmentation linearRelations localSize localMaps).f 0).hom a =
      Ideal.Quotient.mk (Ideal.span (Set.range linearRelations) ⊔
        ⨆ t, BuchsbaumRim.maximalMinorIdeal (localMaps t)) a := sorry

/-- `local_column_orientation`: in the ordered two-place wedge, AA, AB, BA, BB give −C, −D, A, B. -/
example :
    let U : Matrix (Fin 2) (Fin 2) ℤ := !![1,2;3,4]
    let V : Matrix (Fin 2) (Fin 2) ℤ := !![5,6;7,8]
    let L := localRelationMatrix U V 9 10
    (Matrix.det (!![9-U 1 1,10-V 1 1;U 1 0,V 1 0]) = -L 1 0) ∧
    (Matrix.det (!![9-U 1 1,V 0 1;U 1 0,10-V 0 0]) = -L 1 1) ∧
    (Matrix.det (!![U 0 1,10-V 1 1;9-U 0 0,V 1 0]) = L 0 0) ∧
    (Matrix.det (!![U 0 1,V 0 1;9-U 0 0,10-V 0 0]) = L 0 1) := by
  norm_num [localRelationMatrix, Matrix.det_fin_two]
/-- `upper_zero_empty`: the boundary image in scalar coordinates is the relation ideal. -/
example : let L := (Fin.elim0 : Fin 0 → ℤ)
    let sz := (Fin.elim0 : Fin 0 → ℕ)
    let maps : ∀ t : Fin 0, (Fin (sz t) → ℤ) →ₗ[ℤ] (Fin 2 → ℤ) := fun t ↦ t.elim0
    LinearMap.range (((upperRelationComplex L sz maps).d 1 0 ≫
      (upperRelationComplex_X_zero L sz maps).hom).hom) =
        (⊥ : Submodule ℤ ℤ) := sorry

/-- `upper_augmentation_empty`: the scalar 3 has its computed residue. -/
example : ((upperRelationComplex_augmentation (Fin.elim0 : Fin 0 → ℤ) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0)).f 0).hom (3 : ℤ) =
    Ideal.Quotient.mk _ 3 := sorry
/-- `upper_zero_zero`: the boundary image in scalar coordinates is the relation ideal. -/
example : let L := (0 : Fin 1 → ℤ)
    let sz := (Fin.elim0 : Fin 0 → ℕ)
    let maps : ∀ t : Fin 0, (Fin (sz t) → ℤ) →ₗ[ℤ] (Fin 2 → ℤ) := fun t ↦ t.elim0
    LinearMap.range (((upperRelationComplex L sz maps).d 1 0 ≫
      (upperRelationComplex_X_zero L sz maps).hom).hom) =
        (⊥ : Submodule ℤ ℤ) := sorry

/-- `upper_augmentation_zero`: the scalar 3 has its computed residue. -/
example : ((upperRelationComplex_augmentation (0 : Fin 1 → ℤ) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0)).f 0).hom (3 : ℤ) =
    Ideal.Quotient.mk _ 3 := sorry
/-- `upper_zero_two`: the boundary image in scalar coordinates is the relation ideal. -/
example : let L := (![2] : Fin 1 → ℤ)
    let sz := (Fin.elim0 : Fin 0 → ℕ)
    let maps : ∀ t : Fin 0, (Fin (sz t) → ℤ) →ₗ[ℤ] (Fin 2 → ℤ) := fun t ↦ t.elim0
    LinearMap.range (((upperRelationComplex L sz maps).d 1 0 ≫
      (upperRelationComplex_X_zero L sz maps).hom).hom) =
        (Ideal.span {(2 : ℤ)} : Submodule ℤ ℤ) := sorry

/-- `upper_augmentation_two`: the scalar 3 has its computed residue. -/
example : ((upperRelationComplex_augmentation (![2] : Fin 1 → ℤ) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0)).f 0).hom (3 : ℤ) =
    Ideal.Quotient.mk _ 1 := sorry
/-- `full_zero_empty`: the boundary image detects the ideal generated by the row entries. -/
example : let U := (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) ℤ)
    let sz := (Fin.elim0 : Fin 0 → ℕ)
    let Y : ∀ t : Fin 0, Fin (sz t) → Matrix (Fin 2) (Fin 2) ℤ := fun t ↦ t.elim0
    let x : ∀ t : Fin 0, Fin (sz t) → ℤ := fun t ↦ t.elim0
    LinearMap.range (((fullRelationComplex U sz Y x).d 1 0 ≫
      (fullRelationComplex_X_zero U sz Y x).hom).hom) = (⊥ : Submodule ℤ ℤ) := sorry
/-- `full_zero_zero`: the boundary image detects the ideal generated by the row entries. -/
example : let U := (0 : Fin 1 → Matrix (Fin 2) (Fin 2) ℤ)
    let sz := (Fin.elim0 : Fin 0 → ℕ)
    let Y : ∀ t : Fin 0, Fin (sz t) → Matrix (Fin 2) (Fin 2) ℤ := fun t ↦ t.elim0
    let x : ∀ t : Fin 0, Fin (sz t) → ℤ := fun t ↦ t.elim0
    LinearMap.range (((fullRelationComplex U sz Y x).d 1 0 ≫
      (fullRelationComplex_X_zero U sz Y x).hom).hom) = (⊥ : Submodule ℤ ℤ) := sorry
/-- `full_zero_nonzero`: the boundary image detects the ideal generated by the row entries. -/
example : let U := (fun _ : Fin 1 ↦ (!![2,3;4,5] : Matrix (Fin 2) (Fin 2) ℤ))
    let sz := (Fin.elim0 : Fin 0 → ℕ)
    let Y : ∀ t : Fin 0, Fin (sz t) → Matrix (Fin 2) (Fin 2) ℤ := fun t ↦ t.elim0
    let x : ∀ t : Fin 0, Fin (sz t) → ℤ := fun t ↦ t.elim0
    LinearMap.range (((fullRelationComplex U sz Y x).d 1 0 ≫
      (fullRelationComplex_X_zero U sz Y x).hom).hom) = (⊤ : Submodule ℤ ℤ) := sorry

end IntegralRibet

/-! ## Theorem statements, by layer -/

namespace Theorems
open CategoryTheory
open scoped ModuleCat.Algebra
variable {A : Type u} [CommRing A] {R : Type u} [Ring R] [Algebra A R] {d : ℕ}
local instance : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
def Supported (C : DerivedCategory (ModuleCat.{u} A)) (a b : ℤ) : Prop :=
  ∀ i : ℤ, i < a ∨ b < i → Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)
def FiniteCohomology (C : DerivedCategory (ModuleCat.{u} A)) : Prop :=
  ∀ i : ℤ, Module.Finite A ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)
abbrev FaithfulQuotient (D : Determinant A R d) := D.kerTwoSided.ringCon.Quotient
/-- Characteristic-polynomial integrality and the complete coefficient congruence. -/
def RibetCongruence {B G : Type u} [CommRing B] [Algebra A B] [Group G]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (I : Ideal A) : Prop :=
  ∀ g : G, ∃ P : A[X],
    P.map (algebraMap A B)=Matrix.charpoly (ρ (MonoidAlgebra.of A G g)) ∧
    P.map (Ideal.Quotient.mk I)=(X-C (Ideal.Quotient.mk I (χ g)))*(X-C (Ideal.Quotient.mk I (ψ g)))
/-- Scalar extension of the group action to the field group algebra. -/
def ribetFieldRepresentation {B G k : Type u} [CommRing B] [Algebra A B] [Group G] [Field k]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (φ : B →+* k) :
    MonoidAlgebra k G →ₐ[k] Matrix (Fin 2) (Fin 2) k :=
  MonoidAlgebra.lift k _ G
    (φ.mapMatrix.toMonoidHom.comp
      (ρ.toMonoidHom.comp (MonoidAlgebra.of A G)))
abbrev RibetIrreducibleOn {B G k : Type u} [CommRing B] [Algebra A B] [Group G] [Field k]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (φ : B →+* k) : Prop :=
  IsSimpleModule (MonoidAlgebra k G) (matrixModule (ribetFieldRepresentation ρ φ))
theorem ribetIrreducibleOn_iff {B G k : Type u} [CommRing B] [Algebra A B] [Group G] [Field k]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (φ : B →+* k) :
    RibetIrreducibleOn ρ φ ↔ ∀ W : Submodule k (Fin 2 → k),
      (∀ g : G, ∀ x ∈ W, ((ρ (MonoidAlgebra.of A G g)).map φ).mulVec x ∈ W) →
        W = ⊥ ∨ W = ⊤ := sorry
/-- Irreducibility on every field quotient of the coefficient ring `B` (DKSW Theorem 2.1, second
condition: the field factors of the reduced quotient of `K`). -/
def RibetIrreducible {B G : Type u} [CommRing B] [Algebra A B] [Group G]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) : Prop :=
  ∀ (k : Type u) [Field k] (φ : B →+* k), Function.Surjective φ → RibetIrreducibleOn ρ φ
/-- The local triangular input of DKSW Theorem 2.1, conditions (9)–(11): on each `G_v` a basis in
which `ρ` is lower triangular with diagonal characters `η_v, ξ_v` valued in `T̃`, `ξ_v ≡ ψ` on `G_v`
modulo `Ĩ` for `v ∈ Σ`, and `ξ_v ≡ χ` on `I_v` modulo `Ĩ` for `v ∈ P`. -/
structure RibetLocalInput {Tilde B G : Type u} [CommRing Tilde] [CommRing B] [Algebra A Tilde]
    [Algebra Tilde B] [Algebra A B] [IsScalarTower A Tilde B] [Group G]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) (Itilde : Ideal Tilde)
    (L : IntegralRibet.LocalData G) where
  eta : ∀ v, L.subgroup v →* Tildeˣ
  xi : ∀ v, L.subgroup v →* Tildeˣ
  basis : Fin L.count → (Matrix (Fin 2) (Fin 2) B)ˣ
  triangular : ∀ v (g : L.subgroup v),
    (basis v)⁻¹ * ρ (MonoidAlgebra.of A G g) * basis v =
      Matrix.of ![![algebraMap Tilde B (eta v g), 0],
        ![((basis v)⁻¹ * ρ (MonoidAlgebra.of A G g) * basis v : Matrix (Fin 2) (Fin 2) B) 1 0,
          algebraMap Tilde B (xi v g)]]
  sigma_congruence : ∀ v, v ∈ L.sigma → ∀ g : L.subgroup v,
    (↑(xi v g) : Tilde) - algebraMap A Tilde (ψ g) ∈ Itilde
  inertia_congruence : ∀ v, v ∉ L.sigma → ∀ g : G, (hg : g ∈ L.inertia v) →
    (↑(xi v ⟨g, L.inertia_le v hg⟩) : Tilde) - algebraMap A Tilde (χ g) ∈ Itilde
def genericMatrix (S : Type) (d : ℕ) (s : S) :
    Matrix (Fin d) (Fin d) (MvPolynomial (S × Fin d × Fin d) ℤ) :=
  fun i j ↦ MvPolynomial.X (s,i,j)
def matrixWordCoefficients (S : Type) (d : ℕ) :
    Subalgebra ℤ (MvPolynomial (S × Fin d × Fin d) ℤ) :=
  Algebra.adjoin ℤ {a | ∃ w : List S, ∃ k : ℕ,
    a=(Matrix.charpoly ((w.map (genericMatrix S d)).prod)).coeff k}

/-! ## Layer IHG.0 theorems: polynomial laws, determinants and invariant evaluations -/

/-- For all A-modules M,N and d≥0, composition with γ^univ_d is a natural A-linear equivalence Hom_A(Γ^d_A(M),N)≅{homogeneous degree-d A-polynomial laws M→N}. No flatness or projectivity of M is assumed. -/
theorem homogeneous_law_representability {M N : Type u} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] (d : ℕ) :
    ∃ e : (DividedPower.degree A M d →ₗ[A] N) ≃
      {P : M →ₚₗ[A] N // PolynomialLaw.IsHomogeneousOfDegree d P},
      ∀ f : DividedPower.degree A M d →ₗ[A] N,
        ∀ (S : Type u) [CommRing S] [Algebra A S] (x : S ⊗[A] M),
          (e f).val.toFun' S x = f.lTensor S ((DividedPower.universalLaw (A := A) (M := M) d).toFun' S x) := sorry

/-- For any set X, the determinant of the generic d×d matrices induces an isomorphism Γ^d_Z(Z{X})^ab≅E_X(d), where E_X(d) is the subring of Z[x_(a,i,j)] generated by all characteristic-polynomial coefficients of words in the generic matrices. In particular the determinant coordinate ring is torsion-free. -/
theorem vaccarino_universal_matrices (S : Type) (d : ℕ) :
    Nonempty (Determinant.coordinateRing ℤ (FreeAlgebra ℤ S) d ≃ₐ[ℤ] matrixWordCoefficients S d) := sorry

/-- The universal-matrix comparison sends divided-power classes to generic determinants. -/
theorem vaccarino_universal_matrices_eval (S : Type) (d : ℕ) :
    ∃ e : Determinant.coordinateRing ℤ (FreeAlgebra ℤ S) d ≃ₐ[ℤ] matrixWordCoefficients S d,
      ∀ r : FreeAlgebra ℤ S,
        (e (Determinant.coordinateQuotient d (DividedPower.gamma d r))).val =
          (FreeAlgebra.lift ℤ (genericMatrix S d) r).det := sorry


/-! ## Layer IHG.3a theorems: Hecke polynomial conventions -/

/-- For a degree-n determinant and a unit g, write P_g(X)=∑a_iX^{n−i}, a_0=1 and a_n a unit. Then P_{g^{-1}}(X)=a_n^{-1}∑_{i=0}^n a_iX^i. Equivalently it is X^nP_g(X^{-1})/P_g(0). This is the monic polynomial with inverse roots. -/
theorem reciprocal_charpoly {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) d)
    (g : G) (i : ℕ) (hi : i ≤ d) :
    (D.charpoly (MonoidAlgebra.of A G g⁻¹)).coeff i * (D.charpoly (MonoidAlgebra.of A G g)).coeff 0=
      (D.charpoly (MonoidAlgebra.of A G g)).coeff (d-i) := by
  simpa only [Determinant.dual_charpoly_of] using D.dual_charpoly g i hi

/-- The Hecke top coefficient gives the determinant value, including degree zero. -/
theorem gln_determinant_value (D : Determinant A R d) (r : R) (q : A)
    (T : Fin (d+1) → A) (h : D.charpoly r = Spherical.glnPolynomial d q T) :
    D.eval r = q^(d*(d-1)/2)*T (Fin.last d) := sorry

/-- Homogeneity scales the i-th characteristic coefficient by a^i. Applied to
r=g and a=θ(g), this is the character-twist formula after restriction along h↦θ(h)h. -/
theorem charpoly_scalar_coeff (D : Determinant A R d) (r : R) (a : A)
    (i : ℕ) (hi : i ≤ d) :
    (D.charpoly (a • r)).coeff (d-i) = a^i*(D.charpoly r).coeff (d-i) := sorry

/-- Scaled duality at geometric Frobenius, where ε(g)=q⁻¹ and ε(g)⁻³=q³. -/
theorem gsp4_dual_frobenius {G : Type u} [Group G]
    (D : Determinant A (MonoidAlgebra A G) 4) (g : G) (q T₀ : Aˣ) (T₁ T₂ : A)
    (h : D.charpoly (MonoidAlgebra.of A G g) =
      Spherical.gsp4SpinPolynomial (q : A) T₀ T₁ T₂) :
    D.dual.charpoly ((q : A)^3 • MonoidAlgebra.of A G g) =
      Spherical.gsp4DualSpinPolynomial (q : A) T₀ T₁ T₂ := sorry

/-- Inverse-transpose duality uses the inverse Gram matrix. This identity applies
in every characteristic; it does not recover the multiplier from the determinant. -/
theorem similitude_dual_twist {n : ℕ} (r J : (Matrix (Fin n) (Fin n) A)ˣ)
    (μ θ : Aˣ) (h : (r : Matrix (Fin n) (Fin n) A).transpose * J * r =
      (μ : A) • (J : Matrix (Fin n) (Fin n) A)) :
    ((θ : A) • (↑r⁻¹ : Matrix (Fin n) (Fin n) A).transpose).transpose *
        (↑J⁻¹ : Matrix (Fin n) (Fin n) A) *
        ((θ : A) • (↑r⁻¹ : Matrix (Fin n) (Fin n) A).transpose) =
      ((↑μ⁻¹ : A)*(θ : A)^2) • (↑J⁻¹ : Matrix (Fin n) (Fin n) A) := sorry

/-- `l3a_reciprocal_pair`: roots 2,3 become 1/2,1/3; raw reversal is not monic. -/
example : Matrix.charpoly (Matrix.diagonal ![(1/2 : ℚ), 1/3]) =
    X^2-C (5/6)*X+C (1/6) := by
  norm_num [Matrix.charpoly_fin_two, Matrix.trace, Matrix.det_fin_two, Fin.sum_univ_two]
/-- `l3a_reciprocal_linear`: the two-term rank-one polynomial fixes the Artin inversion. -/
example : Matrix.charpoly (Matrix.diagonal ![(2 : ℚ)]) = X-C 2 ∧
    Matrix.charpoly (Matrix.diagonal ![(1/2 : ℚ)]) = X-C (1/2) := by
  simp [Matrix.charpoly_diagonal]
/-- `l3a_twist_pair`: scaling roots 2,3 by 5 scales trace by 5 and determinant by 25. -/
example : Matrix.charpoly ((5 : ℚ) • Matrix.diagonal ![(2 : ℚ),3]) =
    X^2-C 25*X+C 150 := by
  norm_num [Matrix.charpoly_fin_two, Matrix.trace, Matrix.det_fin_two, Fin.sum_univ_two]
/-- `l3a_dual_spin_pair`: paired roots 2,4 with multiplier 8 become 4,2 under 8/r. -/
example : Matrix.charpoly ((8 : ℚ) • (Matrix.diagonal ![(1/2 : ℚ),1/4]).transpose) =
    X^2-C 6*X+C 8 := by
  norm_num [Matrix.charpoly_fin_two, Matrix.trace, Matrix.det_fin_two, Fin.sum_univ_two]
/-- `l3a_multiplier_pair`: on a symplectic plane, diag(2,3) has multiplier 6;
its dual twisted by 5 has multiplier 25/6, not its square. -/
example : let J : Matrix (Fin 2) (Fin 2) ℚ := !![0,1;-1,0]
    let r : Matrix (Fin 2) (Fin 2) ℚ := Matrix.diagonal ![5/2,5/3]
    r.transpose * J * r = (25/6 : ℚ) • J := by
  dsimp
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]
/-- `l3a_multiplier_residue_two`: equal squares do not specify a multiplier over ℤ/4. -/
example : (1 : ZMod 4)^2 = (-1 : ZMod 4)^2 ∧ (1 : ZMod 4) ≠ -1 := by decide

/-! ## Layer IHG.1 theorems: Cayley–Hamilton algebras and reconstruction -/

/-- Let k be algebraically closed, R any k-algebra and d≥1. Every dimension-d determinant D:R→k is det∘ρ for a semisimple representation ρ:R→M_d(k), unique up to conjugacy, with kerρ=kerD. No factorial assumption is required. -/
theorem algebraically_closed_reconstruction {k R : Type u} [Field k] [IsAlgClosed k] [Ring R] [Algebra k R]
    (d : ℕ) (hd : 0 < d) (D : Determinant k R d) :
    ∃ ρ : R →ₐ[k] Matrix (Fin d) (Fin d) k,
      Determinant.ofMatrix ρ=D ∧ IsSemisimpleModule R (matrixModule ρ) ∧
      TwoSidedIdeal.comap ρ.toRingHom ⊥=D.kerTwoSided ∧
      ∀ σ : R →ₐ[k] Matrix (Fin d) (Fin d) k,
        Determinant.ofMatrix σ=D → IsSemisimpleModule R (matrixModule σ) →
        ∃ P : (Matrix (Fin d) (Fin d) k)ˣ, ∀ x, σ x=(P : Matrix (Fin d) (Fin d) k)*ρ x*((P⁻¹ : (Matrix (Fin d) (Fin d) k)ˣ) : Matrix (Fin d) (Fin d) k) := sorry

/-- For positive degree over a field, the faithful quotient is a nonempty finite
product of positive-size matrix algebras over division rings. -/
theorem field_faithful_quotient {k R : Type u} [Field k] [Ring R] [Algebra k R]
    (d : ℕ) (hd : 0 < d) (D : Determinant k R d) :
    ∃ (s : ℕ) (division : Fin s → Type u) (inst : ∀ i, DivisionRing (division i)),
      letI := inst
      ∃ size : Fin s → ℕ, 0 < s ∧ (∀ i, 0 < size i) ∧ Nonempty (FaithfulQuotient D ≃+* ∀ i, Matrix (Fin (size i)) (Fin (size i)) (division i)) := sorry

/-- For a dimension-d Cayley–Hamilton D:R→A over henselian local A, if D̄ is split and absolutely irreducible then R≅M_d(A) and D is the matrix determinant. Applying this to R=A[G]/CH(D) reconstructs an actual G→GL_d(A). Without residual splitness a central-simple obstruction remains. -/
theorem henselian_irreducible [HenselianLocalRing A] (d : ℕ) (hd : 0 < d) (D : Determinant A R d)
    (hCH : D.IsCayleyHamilton) (hSplit : D.residual.IsSplit) (hIrr : D.residual.IsAbsolutelyIrreducible) :
    ∃ φ : R ≃ₐ[A] Matrix (Fin d) (Fin d) A, D=Determinant.ofMatrix φ.toAlgHom := sorry

/-- For a Cayley–Hamilton D over henselian local A with split multiplicity-free D̄, its algebra and trace admit a GMA decomposition with block sizes the residual constituent dimensions. This does not make off-diagonal modules free or yield a d-dimensional free representation over A. -/
theorem henselian_multiplicity_free [HenselianLocalRing A] (D : Determinant A R d)
    (hd : 0 < d) (hCH : D.IsCayleyHamilton) (hSplit : D.residual.IsSplit) (hMF : D.residual.IsMultiplicityFree) :
    ∃ (s : ℕ) (size : Fin s → ℕ) (E : GMA.Data A R s size),
      (∑ i, size i)=d ∧ (GMA.determinant E).toLaw=D.toLaw := sorry

/-- q is the chosen Cayley–Hamilton quotient;
CH(D) ⊆ ker(q) ⊆ ker(D). Both endpoints are the singleton quotient constituents.
The image is exactly the range of restriction of scalars on Ext¹. -/
theorem gma_extension_injection {S : Type u} [Ring S] [Algebra A S]
    [HenselianLocalRing A] (D : Determinant A R d) (hfactorial : IsUnit (d.factorial : A))
    (q : R →ₐ[A] S) (hq : Function.Surjective q)
    (hCH : D.chIdeal ≤ TwoSidedIdeal.comap q.toRingHom ⊥)
    (hker : TwoSidedIdeal.comap q.toRingHom ⊥ ≤ D.kerTwoSided)
    {s t : ℕ} {size : Fin s → ℕ} (E : GMA.Data A S s size)
    (res : GMA.ResidualData E)
    (hD : ((GMA.determinant E).comap q).toLaw = D.toLaw)
    (part : Fin s → Fin t) (hpart : Function.Surjective part)
    (i j : Fin s) (hij : i ≠ j)
    (hi : ∀ k, part k=part i → k=i) (hj : ∀ k, part k=part j → k=j)
    (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A)
    (hIP : GMA.partitionReducibilityIdeal E part ≤ J) :
    let qJ := Algebra.TensorProduct.map (AlgHom.id (A ⧸ J) (A ⧸ J)) q
    let Mi := GMA.quotientConstituent E part i hi J hIP
    let Mj := GMA.quotientConstituent E part j hj J hIP
    let restrict := ModuleCat.restrictScalars qJ.toRingHom
    ∃ f : (GMA.extensionModule E i j →ₗ[A] A ⧸ J) →ₗ[A ⧸ J]
        CategoryTheory.Abelian.Ext (restrict.obj Mj) (restrict.obj Mi) 1,
      Function.Injective f ∧
      LinearMap.range f = LinearMap.range (restrict.mapExtLinearMap (A ⧸ J) Mj Mi 1) := sorry

/-- Bellaïche–Chenevier Theorem 1.5.6, with its factorial hypothesis and
fixed quotient constituents. -/
theorem gma_extension_equiv {S : Type u} [Ring S] [Algebra A S]
    [HenselianLocalRing A] (D : Determinant A R d) (hfactorial : IsUnit (d.factorial : A))
    (q : R →ₐ[A] S) (hq : Function.Surjective q)
    (hCH : D.chIdeal ≤ TwoSidedIdeal.comap q.toRingHom ⊥)
    (hker : TwoSidedIdeal.comap q.toRingHom ⊥ ≤ D.kerTwoSided)
    {s t : ℕ} {size : Fin s → ℕ} (E : GMA.Data A S s size)
    (res : GMA.ResidualData E)
    (hD : ((GMA.determinant E).comap q).toLaw = D.toLaw)
    (part : Fin s → Fin t) (hpart : Function.Surjective part)
    (i j : Fin s) (hij : i ≠ j)
    (hi : ∀ k, part k=part i → k=i) (hj : ∀ k, part k=part j → k=j)
    (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A)
    (hIP : GMA.partitionReducibilityIdeal E part ≤ J) :
    Nonempty ((GMA.extensionModule E i j →ₗ[A] A ⧸ J) ≃ₗ[A ⧸ J]
      CategoryTheory.Abelian.Ext
        (GMA.quotientConstituent E part j hj J hIP)
        (GMA.quotientConstituent E part i hi J hIP) 1) := sorry

/-- Complete DVR and fraction field with their valuation topology,
compact continuous irreducible image, integral characteristic polynomials and distinct
residual characters. The upper entry tests a nonsplit extension of ψ by χ. -/
theorem ribet_lattice {K G : Type u} [IsDomain A] [IsDiscreteValuationRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [NormedField K] [IsUltrametricDist K] [CompleteSpace K] [LocallyCompactSpace K]
    [Algebra A K] [IsFractionRing A K]
    (hvaluation : ∀ x : K, x ∈ Set.range (algebraMap A K) ↔ ‖x‖ ≤ 1)
    [Group G] [TopologicalSpace G] [CompactSpace G] [T2Space G] [IsTopologicalGroup G]
    (ρ : G →* (Matrix (Fin 2) (Fin 2) K)ˣ)
    (hρ : Continuous (fun g ↦ (ρ g : Matrix (Fin 2) (Fin 2) K)))
    (hIrr : ∀ W : Submodule K (Fin 2 → K),
      (∀ g x, x ∈ W → (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec x ∈ W) → W=⊥ ∨ W=⊤)
    (χ ψ : G →* (IsLocalRing.ResidueField A)ˣ) (hdistinct : χ ≠ ψ)
    (hcoeff : ∀ g, ∃ P : A[X],
      P.map (algebraMap A K)=Matrix.charpoly (ρ g : Matrix (Fin 2) (Fin 2) K) ∧
      P.map (IsLocalRing.residue A)=(X-C (χ g : IsLocalRing.ResidueField A)) *
        (X-C (ψ g : IsLocalRing.ResidueField A))) :
    ∃ (L : Submodule A (Fin 2 → K)), Module.Free A L ∧ Module.Finite A L ∧
      (∀ g x, x ∈ L → (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec x ∈ L) ∧
      Submodule.span K (L : Set (Fin 2 → K))=⊤ ∧
      ∃ (b : Module.Basis (Fin 2) A L) (ρA : G →* (Matrix (Fin 2) (Fin 2) A)ˣ),
        (∀ g i, (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec (b i : Fin 2 → K) =
          ∑ j, ((ρA g : Matrix (Fin 2) (Fin 2) A) j i) • (b j : Fin 2 → K)) ∧
        (∀ g, IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 1 0)=0 ∧
          IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 0 0)=(χ g : IsLocalRing.ResidueField A) ∧
          IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 1 1)=(ψ g : IsLocalRing.ResidueField A)) ∧
        ∀ v : IsLocalRing.ResidueField A, ∃ g,
          IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 0 1) ≠
            ((ψ g : IsLocalRing.ResidueField A)-(χ g : IsLocalRing.ResidueField A))*v := sorry

/-- Let A⊂B be complete noetherian local rings with m_B∩A=m_A and common residue field. For a profinite G and continuous ρ:G→GL_d(B), assume residual absolute irreducibility and trρ(G)⊂A. Then ρ is conjugate by 1+M_d(m_B) to a representation into GL_d(A). 

The complete local rings, coefficient inclusion, common residue field, adic topology,
profinite source and residual absolute irreducibility are explicit.  -/
theorem coefficient_descent {B G : Type u} [CommRing B] [Algebra A B] [IsLocalRing A] [IsLocalRing B]
    [IsNoetherianRing A] [IsNoetherianRing B] [Group G]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [TopologicalSpace B] (hBadic : IsAdic (IsLocalRing.maximalIdeal B))
    [TopologicalSpace G] [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    [IsTopologicalGroup G]
    (hinj : Function.Injective (algebraMap A B))
    (residueEquiv : IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B)
    (hres : ∀ a : A, IsLocalRing.residue B (algebraMap A B a)=
      residueEquiv (IsLocalRing.residue A a))
    (ρ : MonoidAlgebra B G →ₐ[B] Matrix (Fin d) (Fin d) B)
    (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of B G g)))
    (hIrr : (Determinant.ofMatrix ρ).residual.IsAbsolutelyIrreducible)
    (htrace : ∀ g : G, ∃ a : A, Matrix.trace (ρ (MonoidAlgebra.of B G g))=algebraMap A B a) :
    ∃ (ρA : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A)
      (P : (Matrix (Fin d) (Fin d) B)ˣ),
      (∀ i j, (P : Matrix (Fin d) (Fin d) B) i j-(1 : Matrix (Fin d) (Fin d) B) i j ∈ IsLocalRing.maximalIdeal B) ∧
      ∀ g : G, (ρA (MonoidAlgebra.of A G g)).map (algebraMap A B)=
        (P : Matrix (Fin d) (Fin d) B)*ρ (MonoidAlgebra.of B G g)*((P⁻¹ : (Matrix (Fin d) (Fin d) B)ˣ) : Matrix (Fin d) (Fin d) B) := sorry

/-- Matrix equations encode the GSp carrier:
the alternating form is invertible, both coefficient rings are complete local with
common odd-characteristic residue, and the full multiplier is prescribed over A. -/
theorem symplectic_coefficient_descent {B G : Type u} [CommRing B] [Algebra A B]
    [IsLocalRing A] [IsLocalRing B] [IsNoetherianRing A] [IsNoetherianRing B]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [TopologicalSpace A] [TopologicalSpace B]
    (hAadic : IsAdic (IsLocalRing.maximalIdeal A)) (hBadic : IsAdic (IsLocalRing.maximalIdeal B))
    [Group G] [TopologicalSpace G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [IsTopologicalGroup G]
    (hinj : Function.Injective (algebraMap A B))
    (residueEquiv : IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B)
    (hres : ∀ a : A, IsLocalRing.residue B (algebraMap A B a)=
      residueEquiv (IsLocalRing.residue A a))
    (p : ℕ) [CharP (IsLocalRing.ResidueField A) p] (hp : 2 < p)
    (ρ : G →* (Matrix (Fin 4) (Fin 4) B)ˣ)
    (hρ : Continuous (fun g ↦ (ρ g : Matrix (Fin 4) (Fin 4) B)))
    (hIrr : (Determinant.ofMatrix (MonoidAlgebra.lift B (Matrix (Fin 4) (Fin 4) B) G
      ((Units.coeHom _).comp ρ))).residual.IsAbsolutelyIrreducible)
    (htrace : ∀ g, ∃ a : A, Matrix.trace (ρ g : Matrix (Fin 4) (Fin 4) B)=algebraMap A B a)
    (ν : G →* Aˣ) (hν : Continuous (fun g ↦ (ν g : A)))
    (form : Matrix (Fin 4) (Fin 4) A) (hnondegenerate : IsUnit form)
    (halternating : ∀ x : Fin 4 → A, dotProduct x (form.mulVec x)=0)
    (hform : ∀ g, (ρ g : Matrix (Fin 4) (Fin 4) B).transpose *
      form.map (algebraMap A B) * (ρ g : Matrix (Fin 4) (Fin 4) B)=
      algebraMap A B (ν g) • form.map (algebraMap A B)) :
    ∃ (ρA : G →* (Matrix (Fin 4) (Fin 4) A)ˣ) (P : (Matrix (Fin 4) (Fin 4) B)ˣ),
      Continuous (fun g ↦ (ρA g : Matrix (Fin 4) (Fin 4) A)) ∧
      (∀ g, (ρA g : Matrix (Fin 4) (Fin 4) A).transpose * form *
        (ρA g : Matrix (Fin 4) (Fin 4) A)=(ν g : A) • form) ∧
      (∀ i j, (P : Matrix (Fin 4) (Fin 4) B) i j-(1 : Matrix (Fin 4) (Fin 4) B) i j ∈
        IsLocalRing.maximalIdeal B) ∧
      (∃ μ : Bˣ, (P : Matrix (Fin 4) (Fin 4) B).transpose * form.map (algebraMap A B) *
        (P : Matrix (Fin 4) (Fin 4) B)=(μ : B) • form.map (algebraMap A B)) ∧
      ∀ g, (ρA g : Matrix (Fin 4) (Fin 4) A).map (algebraMap A B)=
        (P : Matrix (Fin 4) (Fin 4) B)*(ρ g : Matrix (Fin 4) (Fin 4) B)*
          (↑(P⁻¹) : Matrix (Fin 4) (Fin 4) B) := sorry

/-- Let A be henselian local, ρ:G→GL_d(A) have split absolutely irreducible residual representation, and M be an A[G]-module annihilated by CH(detρ). Then M≅A^d⊗_AN as an A[G]-module with G acting through ρ on the first factor.

The compatible A[G]-action, CH annihilation, residual absolute irreducibility and
G-equivariance are explicit.  -/
theorem brauer_nesbitt_module_recognition {G M : Type u} [Group G] [AddCommGroup M] [Module A M]
    [Module (MonoidAlgebra A G) M] [IsScalarTower A (MonoidAlgebra A G) M]
    [HenselianLocalRing A] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A)
    (hIrr : (Determinant.ofMatrix ρ).residual.IsAbsolutelyIrreducible)
    (hCH : ∀ r ∈ (Determinant.ofMatrix ρ).chIdeal, ∀ x : M, r • x=0) :
    ∃ (N : ModuleCat.{u} A) (e : M ≃ₗ[A] ((Fin d → A) ⊗[A] N)),
      ∀ (g : G) (x : M), e (MonoidAlgebra.of A G g • x)=
        TensorProduct.map (Matrix.toLin' (ρ (MonoidAlgebra.of A G g))) LinearMap.id (e x) := sorry

/-- local matrix algebra identifications
are conjugate by an invertible matrix over the same coefficient ring. -/
theorem local_matrix_inner_conjugacy [IsLocalRing A] (d : ℕ) (hd : 0 < d)
    (f : Matrix (Fin d) (Fin d) A ≃ₐ[A] Matrix (Fin d) (Fin d) A) :
    ∃ P : (Matrix (Fin d) (Fin d) A)ˣ, ∀ x,
      f x=(P : Matrix (Fin d) (Fin d) A)*x*(↑(P⁻¹) : Matrix (Fin d) (Fin d) A) := sorry

/-- A local corner representation whose reduction has the global determinant is conjugate
 to a lift of the global representation. Generic-fiber conjugacies transport along the same basis change. -/
theorem compatible_local_reconstruction {B S G : Type u} [CommRing B] [Algebra B A]
    [IsLocalRing B] [HenselianLocalRing A]
    (hπ : Function.Surjective (algebraMap B A))
    [Ring S] [Algebra B S] [Group G]
    (E : GMA.Data B S 2 (fun _ ↦ d))
    (r : G →* Sˣ) (H : Subgroup G)
    (ρ σ : G →* (Matrix (Fin d) (Fin d) A)ˣ)
    (hIrr : (Determinant.ofMatrix (MonoidAlgebra.lift A (Matrix (Fin d) (Fin d) A) G
      ((Units.coeHom _).comp ρ))).residual.IsAbsolutelyIrreducible)
    (hdet : Determinant.ofMatrix (MonoidAlgebra.lift A (Matrix (Fin d) (Fin d) A) G
      ((Units.coeHom _).comp σ)) = Determinant.ofMatrix
        (MonoidAlgebra.lift A (Matrix (Fin d) (Fin d) A) G ((Units.coeHom _).comp ρ)))
    (hglobal : ∀ g, (σ g : Matrix (Fin d) (Fin d) A)=
      (E.diagonal 0 (cornerLift (E.idempotent 0) (E.idem 0)
        (E.idempotent 0*(r g : S)*E.idempotent 0) (⟨_, TauCeti.cornerMap_apply _ _ _ _⟩))).map (algebraMap B A))
    (localRep : H →* (Matrix (Fin d) (Fin d) B)ˣ)
    (hlocal : ∀ h : H, (localRep h : Matrix (Fin d) (Fin d) B)=
      E.diagonal 0 (cornerLift (E.idempotent 0) (E.idem 0)
        (E.idempotent 0*(r h : S)*E.idempotent 0) (⟨_, TauCeti.cornerMap_apply _ _ _ _⟩)))
    {a : ℕ} (K : Fin a → Type u) [∀ i, Field (K i)] [∀ i, Algebra B (K i)]
    (selected : ∀ i, H →* (Matrix (Fin d) (Fin d) (K i))ˣ)
    (cornerBasis : ∀ i, (Matrix (Fin d) (Fin d) (K i))ˣ)
    (hgeneric : ∀ i h, (localRep h : Matrix (Fin d) (Fin d) B).map (algebraMap B (K i))=
      (cornerBasis i : Matrix (Fin d) (Fin d) (K i))*(selected i h : Matrix (Fin d) (Fin d) (K i))*
        (↑((cornerBasis i)⁻¹) : Matrix (Fin d) (Fin d) (K i))) :
    ∃ (lift : H →* (Matrix (Fin d) (Fin d) B)ˣ) (P : (Matrix (Fin d) (Fin d) B)ˣ),
      (∀ h : H, (lift h : Matrix (Fin d) (Fin d) B).map (algebraMap B A)=
        (ρ h : Matrix (Fin d) (Fin d) A)) ∧
      (∀ h, (lift h : Matrix (Fin d) (Fin d) B)=
        (P : Matrix (Fin d) (Fin d) B)*(localRep h : Matrix (Fin d) (Fin d) B)*
          (↑(P⁻¹) : Matrix (Fin d) (Fin d) B)) ∧
      ∀ i, ∃ Pi : (Matrix (Fin d) (Fin d) (K i))ˣ, ∀ h,
        (lift h : Matrix (Fin d) (Fin d) B).map (algebraMap B (K i))=
          (Pi : Matrix (Fin d) (Fin d) (K i))*(selected i h : Matrix (Fin d) (Fin d) (K i))*
            (↑(Pi⁻¹) : Matrix (Fin d) (Fin d) (K i)) := sorry

/-! ## Layer IHG.2 theorems: integral and derived Hecke actions -/

/-- Let A be a commutative noetherian ring and M,N in D(A) have finitely generated cohomology, nonzero in only finitely many degrees. The A-module Hom_D(A)(M,N) is finitely generated. No finite-projective-dimension hypothesis is imposed. -/
theorem derived_hom_finite [IsNoetherianRing A] (M N : DerivedCategory (ModuleCat.{u} A))
    (a b c e : ℤ) (hM : Supported M a b) (hN : Supported N c e)
    (hfinM : FiniteCohomology M) (hfinN : FiniteCohomology N) : Module.Finite A (M ⟶ N) := sorry

/-- For every commutative ring A, any idempotent e:C→C in D(A) splits: there are C_e, i:C_e→C and p:C→C_e with p∘i=1 and i∘p=e. Consequently C≅C_e⊕C_(1−e). -/
theorem derived_idempotent_splitting (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) :
    ∃ (Ce : DerivedCategory (ModuleCat.{u} A)) (i : Ce ⟶ C) (p : C ⟶ Ce), i ≫ p=𝟙 Ce ∧ p ≫ i=e := sorry

/-- For a commutative ring A and C∈D(A) with H^i(C)=0 outside [a,b], a ≤ b, every composite of b−a+1 degree-zero ghosts is zero. Hence G(C)^(b−a+1)=0, and J(C)^(b−a+1)=0 for every Hecke image. -/
theorem ghost_nilpotence (C : DerivedCategory (ModuleCat.{u} A)) (a b : ℤ) (hab : a ≤ b) (hC : Supported C a b) :
    ∀ fs : Fin ((b-a).toNat+1) → End C,
      (∀ i, fs i ∈ HeckeImage.ghostIdeal C) → (List.ofFn fs).prod=0 := sorry

/-- A finite algebra over a complete noetherian local base is a finite product of finite,
complete noetherian local algebras. The zero algebra gives the empty product. -/
theorem finite_hecke_local_factors [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    (T : Type u) [CommRing T] [Algebra A T] [Module.Finite A T] :
    ∃ (s : ℕ) (factor : Fin s → CommAlgCat.{u} A),
      (∀ i, Module.Finite A (factor i) ∧ IsNoetherianRing (factor i) ∧
        ∃ h : IsLocalRing (factor i), letI := h
          IsAdicComplete (IsLocalRing.maximalIdeal (factor i)) (factor i)) ∧
      Nonempty (T ≃ₐ[A] ∀ i, factor i) := sorry

/-- Given a splitting of a finite algebra after extension to a complete local ring O,
completion at the residual ideal of one factor is O. -/
theorem large_prime_hecke_completion (O : Type u) [CommRing O] [Algebra A O]
    [IsLocalRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (T : Type u) [CommRing T] [Algebra A T] [Module.Finite A T]
    (s : ℕ) (split : O ⊗[A] T ≃ₐ[O] (Fin s → O)) (i : Fin s)
    (π : O ⊗[A] T →ₐ[O] O) (hπ : ∀ t, π t=split t i) :
    Nonempty (AdicCompletion (RingHom.ker ((IsLocalRing.residue O).comp π.toRingHom))
      (O ⊗[A] T) ≃ₐ[O] O) := sorry


/-- A chain action descends along the two localization functors with its values fixed. -/
theorem chain_action_descent {H : Type u} [CommRing H] [Algebra A H]
    (C : CochainComplex (ModuleCat.{u} A) ℤ) (α : H →ₐ[A] End C) :
    ∃ (αK : H →ₐ[A] End ((HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).obj C))
      (αD : H →ₐ[A] End (DerivedCategory.Q.obj C)),
      (∀ h, αK h = (HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).map (α h)) ∧
      (∀ h, αD h = DerivedCategory.Q.map (α h)) := sorry

/-- Finiteness of the faithful derived image, with the given action retained. -/
theorem derived_image_finite [IsNoetherianRing A]
    {H : Type u} [CommRing H] [Algebra A H]
    (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C)
    (a b : ℤ) (hC : Supported C a b) (hfin : FiniteCohomology C) :
    Module.Finite A α.range := sorry

/-- The annihilator exponent includes both endpoints of the support interval. -/
theorem action_annihilator_power {H : Type u} [CommRing H] [Algebra A H]
    (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C)
    (a b : ℤ) (hab : a ≤ b) (hC : Supported C a b) (I : Ideal H)
    (hI : I ≤ HeckeImage.actionGhostKernel C α) :
    I ^ ((b-a).toNat+1) ≤ RingHom.ker α.toRingHom := sorry

/-- The selected derived summand vanishes precisely when its projector vanishes on cohomology. -/
theorem localized_support (C : DerivedCategory (ModuleCat.{u} A))
    (e : End C) (he : e*e=e) :
    Limits.IsZero (HeckeImage.localizedComplex C e he) ↔
      ∀ i : ℤ, (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map e = 0 := sorry

/-- Factorial powers converge in the maximal-ideal-adic sense; the residue field is finite. -/
theorem factorial_powers [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [Finite (IsLocalRing.ResidueField A)]
    (T : Type u) [CommRing T] [Algebra A T] [Module.Finite A T] (t : T) :
    ∃ e : T, e*e=e ∧
      (∀ k : ℕ, ∃ N : ℕ, ∀ n ≥ N, t^(Nat.factorial n)-e ∈
        (Ideal.map (algebraMap A T) (IsLocalRing.maximalIdeal A))^k) ∧
      (∀ m : Ideal T, m.IsMaximal →
        (t ∈ m → Ideal.Quotient.mk m e = 0) ∧
        (t ∉ m → Ideal.Quotient.mk m e = 1)) := sorry

/-- Over an artinian base every operator on bounded finite cohomology has a Fitting summand. -/
theorem ordinary_finite [IsArtinianRing A] [IsLocalRing A]
    (C : DerivedCategory (ModuleCat.{u} A)) (t : End C)
    (a b : ℤ) (hC : Supported C a b) (hfin : FiniteCohomology C) :
    ∃ e u : End C, e*e=e ∧ t*e=e*t ∧ u=e*u*e ∧ t*u=e ∧ u*t=e ∧
      (∃ n : ℕ, 0<n ∧ (t*(1-e))^n=0) ∧
      Supported (HeckeImage.operatorLocalization C t) a b ∧
      FiniteCohomology (HeckeImage.operatorLocalization C t) := sorry

/-- Interchanging the two maps of a finite factorization preserves the telescope. -/
theorem ordinary_finite_factor [IsArtinianRing A] [IsLocalRing A]
    (M C : DerivedCategory (ModuleCat.{u} A)) (u : M ⟶ C) (v : C ⟶ M)
    (a b : ℤ) (hC : Supported C a b) (hfin : FiniteCohomology C) :
    ∃ ε : HeckeImage.operatorLocalization M (u ≫ v) ≅
        HeckeImage.operatorLocalization C (v ≫ u),
      HeckeImage.operatorLocalization_ι M (u ≫ v) 0 ≫ ε.hom =
        u ≫ HeckeImage.operatorLocalization_ι C (v ≫ u) 0 ∧
      Supported (HeckeImage.operatorLocalization M (u ≫ v)) a b ∧
      FiniteCohomology (HeckeImage.operatorLocalization M (u ≫ v)) := sorry

/-- `ghost_orientation`: the Ext¹ corner goes from degree one to degree zero;
the reverse corner vanishes and the square of the off-diagonal matrix is zero. -/
example :
    let M := ModuleCat.of ℤ (ZMod 2)
    let C₀ := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj M
    let C₁ := (DerivedCategory.singleFunctor (ModuleCat ℤ) 1).obj M
    ∃ δ : C₁ ⟶ C₀, δ ≠ 0 ∧
      let f : End (C₀ ⊞ C₁) := Limits.biprod.snd ≫ δ ≫ Limits.biprod.inl
      Limits.biprod.inr ≫ f ≫ Limits.biprod.fst = δ ∧
      Limits.biprod.inl ≫ f ≫ Limits.biprod.snd = 0 ∧
      f*f=0 ∧ f ∈ HeckeImage.ghostIdeal (C₀ ⊞ C₁) := sorry

/-- `factorial_unit_nonunit`: in F₂×F₂, factorial powers of (1,0) select the first factor. -/
example (n : ℕ) : ((1, 0) : ZMod 2 × ZMod 2)^(Nat.factorial n) = (1, 0) := by
  ext <;> simp [Nat.factorial_ne_zero]

/-- `factorial_infinite_field`: the unit 2 over Q never has a positive power equal to 1. -/
example (n : ℕ) : (2 : ℚ)^(Nat.factorial n) ≠ 1 := by
  exact ne_of_gt (one_lt_pow₀ (by norm_num) (Nat.factorial_ne_zero n))

/-- `ordinary_nonartinian`: multiplication by 2 on Z[0] has nonzero localization. -/
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ ℤ)
    ¬ Limits.IsZero (HeckeImage.operatorLocalization C 2) := sorry

/-- `ghost_amplitude_one`: one-degree support requires one ghost, not the zeroth power. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (a : ℤ) (hC : Supported C a a)
    (f : End C) (hf : f ∈ HeckeImage.ghostIdeal C) : f = 0 := sorry

/-! ## Layer IHG.4 theorems: interpolation over integral coefficient rings -/

/-- Let A be Hausdorff and D_1,D_2 continuous degree-d determinants of G_{F,S}. If all characteristic-polynomial coefficients agree on Frobenius conjugacy classes outside S, they agree on G_{F,S}, hence D_1=D_2. Use Chebotarev on every finite quotient and conjugacy invariance; a set of chosen representatives need not itself be dense before taking conjugates. -/
theorem frobenius_determinant_uniqueness {G V : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace A] [T2Space A]
    (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g=h*Frob v*h⁻¹})
    (D E : Determinant A (MonoidAlgebra A G) d) (hD : D.IsContinuous) (hE : E.IsContinuous)
    (h : ∀ v, D.charpoly (MonoidAlgebra.of A G (Frob v))=E.charpoly (MonoidAlgebra.of A G (Frob v))) : D=E := sorry

/-- Compatible discrete quotient laws have a unique continuous determinant when A has
its separated quotient-limit topology. -/
theorem classical_interpolation {G : Type u} [Group G] [TopologicalSpace G]
    {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : Interpolation.FiniteQuotientData A G d J hJ)
    (complete : A ≃+* Interpolation.quotientLimit J hJ)
    (hc : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a)
    [TopologicalSpace A] [∀ r, TopologicalSpace (A ⧸ J r)]
    [∀ r, DiscreteTopology (A ⧸ J r)]
    (htop : Topology.IsEmbedding (fun a : A ↦ fun r ↦ Ideal.Quotient.mk (J r) a)) :
    ∃! D : Determinant A (MonoidAlgebra A G) d,
      D.IsContinuous ∧ ∀ r, D.mapCoefficients (Ideal.Quotient.mk (J r))=F.determinant r := sorry

/-- Intersection gluing uses the image of the diagonal quotient map, including nilpotents. -/
theorem intersection_determinant_gluing {G : Type u} [Group G]
    [TopologicalSpace G] (I J : Ideal A)
    [TopologicalSpace (A ⧸ (I ⊓ J))] [CompactSpace (A ⧸ (I ⊓ J))]
    [T2Space (A ⧸ (I ⊓ J))] [TopologicalSpace (A ⧸ I)] [T2Space (A ⧸ I)]
    [TopologicalSpace (A ⧸ J)] [T2Space (A ⧸ J)]
    (hI : Continuous (Ideal.Quotient.factor (inf_le_left : I ⊓ J ≤ I)))
    (hJ : Continuous (Ideal.Quotient.factor (inf_le_right : I ⊓ J ≤ J)))
    (DI : Determinant (A ⧸ I) (MonoidAlgebra (A ⧸ I) G) d)
    (DJ : Determinant (A ⧸ J) (MonoidAlgebra (A ⧸ J) G) d)
    (hcI : DI.IsContinuous) (hcJ : DJ.IsContinuous)
    (S : Set G) (hS : Dense S)
    (hcoeff : ∀ g ∈ S, ∀ k, ∃ a : A ⧸ (I ⊓ J),
      Ideal.Quotient.factor inf_le_left a = (DI.charpoly (MonoidAlgebra.of _ G g)).coeff k ∧
      Ideal.Quotient.factor inf_le_right a = (DJ.charpoly (MonoidAlgebra.of _ G g)).coeff k) :
    ∃! D : Determinant (A ⧸ (I ⊓ J)) (MonoidAlgebra (A ⧸ (I ⊓ J)) G) d,
      D.IsContinuous ∧ D.mapCoefficients (Ideal.Quotient.factor inf_le_left) = DI ∧
        D.mapCoefficients (Ideal.Quotient.factor inf_le_right) = DJ := sorry

/-- One integral congruence modulus at each level and exact Frobenius compatibility
produce a continuous limit law. -/
theorem uniform_congruence_interpolation {G V : Type u} [Group G]
    [TopologicalSpace G] (Frob : V → G)
    {J : ℕ → Ideal A} {hJ : Antitone J}
    [TopologicalSpace A] [∀ r, TopologicalSpace (A ⧸ J r)]
    [∀ r, DiscreteTopology (A ⧸ J r)] [∀ r, CompactSpace (A ⧸ J r)]
    (W : ∀ r, Interpolation.CongruenceWitness (A ⧸ J r) G V d Frob)
    (hW : ∀ r s (hrs : r ≤ s) v,
      ((W s).determinant.charpoly (MonoidAlgebra.of _ G (Frob v))).map
        (Ideal.Quotient.factor (hJ hrs)) =
      (W r).determinant.charpoly (MonoidAlgebra.of _ G (Frob v)))
    (complete : A ≃+* Interpolation.quotientLimit J hJ)
    (hc : ∀ a r, (complete a).val r = Ideal.Quotient.mk (J r) a)
    (htop : Topology.IsEmbedding (fun a : A ↦ fun r ↦ Ideal.Quotient.mk (J r) a)) :
    ∃! D : Determinant A (MonoidAlgebra A G) d,
      D.IsContinuous ∧ ∀ r, D.mapCoefficients (Ideal.Quotient.mk (J r)) = (W r).determinant := sorry

/-- Coefficient change commutes with reconstruction when the quotient maps commute. -/
theorem interpolation_coefficient_change {B G : Type u} [CommRing B] [Group G]
    [TopologicalSpace G] {J : ℕ → Ideal A} {K : ℕ → Ideal B}
    {hJ : Antitone J} {hK : Antitone K}
    (F : Interpolation.FiniteQuotientData A G d J hJ)
    (E : Interpolation.FiniteQuotientData B G d K hK)
    (cA : A ≃+* Interpolation.quotientLimit J hJ)
    (cB : B ≃+* Interpolation.quotientLimit K hK)
    (hcA : ∀ a r, (cA a).val r = Ideal.Quotient.mk (J r) a)
    (hcB : ∀ b r, (cB b).val r = Ideal.Quotient.mk (K r) b)
    (φ : A →+* B) (φr : ∀ r, (A ⧸ J r) →+* (B ⧸ K r))
    (hsquare : ∀ r, (φr r).comp (Ideal.Quotient.mk (J r)) = (Ideal.Quotient.mk (K r)).comp φ)
    (hdata : ∀ r, (F.determinant r).mapCoefficients (φr r) = E.determinant r) :
    (Interpolation.inverseLimitDeterminant F cA hcA).mapCoefficients φ =
      Interpolation.inverseLimitDeterminant E cB hcB := sorry

/-- A continuous Hecke level map preserving the Frobenius polynomials preserves the law. -/
theorem hecke_level_change {B G V : Type u} [CommRing B] [Group G]
    [TopologicalSpace G] [TopologicalSpace A] [TopologicalSpace B] [T2Space B]
    (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g = h * Frob v * h⁻¹})
    (φ : A →+* B) (hφ : Continuous φ)
    (D : Determinant A (MonoidAlgebra A G) d) (E : Determinant B (MonoidAlgebra B G) d)
    (hD : D.IsContinuous) (hE : E.IsContinuous)
    (hFrob : ∀ v, (D.charpoly (MonoidAlgebra.of A G (Frob v))).map φ =
      E.charpoly (MonoidAlgebra.of B G (Frob v))) : D.mapCoefficients φ = E := sorry

/-- Reconstruction commutes with pullback along a fixed group quotient. -/
theorem interpolation_group_pullback {G H : Type u} [Group G] [Group H]
    [TopologicalSpace G] [TopologicalSpace H] {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : Interpolation.FiniteQuotientData A G d J hJ)
    (E : Interpolation.FiniteQuotientData A H d J hJ)
    (c : A ≃+* Interpolation.quotientLimit J hJ)
    (hc : ∀ a r, (c a).val r = Ideal.Quotient.mk (J r) a)
    (q : G →* H)
    (hdata : ∀ r, (E.determinant r).comap
      (MonoidAlgebra.mapDomainAlgHom (A ⧸ J r) (A ⧸ J r) q) = F.determinant r) :
    (Interpolation.inverseLimitDeterminant E c hc).comap
      (MonoidAlgebra.mapDomainAlgHom A A q) = Interpolation.inverseLimitDeterminant F c hc := sorry

/-- Field-valued points miss a nonzero dual-number perturbation of a rank-one character. -/
theorem field_points_fail {k : Type u} [Field k] :
    ∃ D E : Determinant (DualNumber k) (MonoidAlgebra (DualNumber k) (Multiplicative ℤ)) 1,
      D ≠ E ∧
      D.eval (MonoidAlgebra.of _ _ (Multiplicative.ofAdd 1)) = 1 ∧
      E.eval (MonoidAlgebra.of _ _ (Multiplicative.ofAdd 1)) = 1 + DualNumber.eps ∧
      ∀ (K : Type u) [Field K] (φ : DualNumber k →+* K), D.mapCoefficients φ = E.mapCoefficients φ := sorry

/-! ## Layer IHG.5 theorems: quantified nilpotent comparison -/

/-- For compact G, descent along the continuous kernel lift from a compact Hausdorff
quotient is determined by characteristic coefficients on a dense subset. No nilpotence of
`ker φ` is needed for the descent itself; the exponent of the error ideal enters only the
bounds of `Nilpotence`. Scholze, proof of Theorem 5.4.1, pp. 1058–1059; the abstract descent
is the one-factor case of `compact_determinant_gluing`. -/
theorem nilpotent_comparison_schema {T B G : Type u} [CommRing T] [CommRing B] [Group G]
    [TopologicalSpace G] [CompactSpace G]
    (φ : T →+* B)
    [TopologicalSpace (T ⧸ RingHom.ker φ)] [CompactSpace (T ⧸ RingHom.ker φ)]
    [T2Space (T ⧸ RingHom.ker φ)] [TopologicalSpace B] [T2Space B]
    (hφ : Continuous (RingHom.kerLift φ))
    (D : Determinant B (MonoidAlgebra B G) d) (hD : D.IsContinuous)
    (S : Set G) (hS : Dense S)
    (hcoeff : ∀ g ∈ S, ∀ k, ∃ a : T ⧸ RingHom.ker φ,
      (D.charpoly (MonoidAlgebra.of B G g)).coeff k=RingHom.kerLift φ a) :
    ∃! E : Determinant (T ⧸ RingHom.ker φ) (MonoidAlgebra (T ⧸ RingHom.ker φ) G) d,
      E.IsContinuous ∧ E.mapCoefficients (RingHom.kerLift φ)=D := sorry

/-- Descent respects a continuous map of quotient rings whose Frobenius polynomials agree. -/
theorem nilpotent_descent_functorial {T T' G V : Type u}
    [CommRing T] [CommRing T'] [Group G] [TopologicalSpace G]
    (J : Ideal T) (J' : Ideal T')
    (q : (T ⧸ J) →+* (T' ⧸ J'))
    [TopologicalSpace (T ⧸ J)] [TopologicalSpace (T' ⧸ J')]
    [T2Space (T' ⧸ J')] (hq : Continuous q)
    (D : Determinant (T ⧸ J) (MonoidAlgebra (T ⧸ J) G) d)
    (E : Determinant (T' ⧸ J') (MonoidAlgebra (T' ⧸ J') G) d)
    (hD : D.IsContinuous) (hE : E.IsContinuous)
    (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g = h * Frob v * h⁻¹})
    (hcoeff : ∀ v, (D.charpoly (MonoidAlgebra.of _ G (Frob v))).map q =
      E.charpoly (MonoidAlgebra.of _ G (Frob v))) : D.mapCoefficients q = E := sorry

/-- Positive-degree residual specialization is unique among semisimple matrix representations.
The inclusion J ≤ m is the exact algebraic input; nilpotence is one way to obtain it. -/
theorem residual_semisimple_specialization {T G k : Type u}
    [CommRing T] [Group G] [Field k] [IsAlgClosed k]
    (J m : Ideal T) [m.IsMaximal] (hJm : J ≤ m) [Algebra (T ⧸ m) k]
    (hd : 0 < d) (D : Determinant (T ⧸ J) (MonoidAlgebra (T ⧸ J) G) d) :
    let E := D.mapCoefficients ((algebraMap (T ⧸ m) k).comp (Ideal.Quotient.factor hJm))
    ∃ ρ : MonoidAlgebra k G →ₐ[k] Matrix (Fin d) (Fin d) k,
      Determinant.ofMatrix ρ = E ∧ IsSemisimpleModule (MonoidAlgebra k G) (matrixModule ρ) ∧
      ∀ σ : MonoidAlgebra k G →ₐ[k] Matrix (Fin d) (Fin d) k,
        Determinant.ofMatrix σ = E → IsSemisimpleModule (MonoidAlgebra k G) (matrixModule σ) →
        ∃ P : (Matrix (Fin d) (Fin d) k)ˣ,
          ∀ x, σ x = (P : Matrix (Fin d) (Fin d) k) * ρ x * ((P⁻¹ : (Matrix (Fin d) (Fin d) k)ˣ) : Matrix (Fin d) (Fin d) k) := sorry

/-- Over a henselian local quotient, a residually split absolutely irreducible determinant
of positive degree identifies its CH quotient with the full matrix algebra. -/
theorem residual_irreducible_quotient_lift {T G : Type u} [CommRing T] [Group G]
    (J : Ideal T) [HenselianLocalRing (T ⧸ J)] (hd : 0 < d)
    (D : Determinant (T ⧸ J) (MonoidAlgebra (T ⧸ J) G) d)
    (hSplit : D.residual.IsSplit) (hIrr : D.residual.IsAbsolutelyIrreducible) :
    ∃ e : CHQuotient D ≃ₐ[T ⧸ J] Matrix (Fin d) (Fin d) (T ⧸ J),
      Determinant.ofMatrix (e.toAlgHom.comp (chQuotientMap D)) = D ∧
      ∀ σ : MonoidAlgebra (T ⧸ J) G →ₐ[T ⧸ J] Matrix (Fin d) (Fin d) (T ⧸ J),
        Determinant.ofMatrix σ = D →
        ∃ P : (Matrix (Fin d) (Fin d) (T ⧸ J))ˣ,
          ∀ x, σ x = (P : Matrix (Fin d) (Fin d) (T ⧸ J)) *
            e (chQuotientMap D x) *
              ((P⁻¹ : (Matrix (Fin d) (Fin d) (T ⧸ J))ˣ) : Matrix (Fin d) (Fin d) (T ⧸ J)) := sorry

/-- For the scalar action α=χ/ψ, a linear lattice map preserves the cocycle equation
and carries a specified local coboundary witness to its image. -/
theorem lattice_cocycle_transport {A G M N : Type u} [CommRing A] [Group G]
    [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]
    (α : G →* Aˣ) (c : G → M)
    (hc : ∀ g h, c (g*h) = c g + (α g : A) • c h)
    (F : M →ₗ[A] N) (H : Subgroup G) (y : M)
    (hy : ∀ h ∈ H, c h = ((α h : A) - 1) • y) :
    (∀ g h, F (c (g*h)) = F (c g) + (α g : A) • F (c h)) ∧
    (∀ h ∈ H, F (c h) = ((α h : A) - 1) • F y) := by
  constructor
  · intro g h
    rw [hc, map_add, map_smul]
  · intro h hh
    rw [hy h hh, map_smul]

/-- The coordinate convention is ρ'=PρP⁻¹ for P=diag(r,s). With c=b/ψ,
both b and c are multiplied by r/s. -/
theorem lattice_diagonal_rescale {A : Type u} [CommRing A]
    (r s χ ψ : Aˣ) (b : A) :
    let P : Matrix (Fin 2) (Fin 2) A := !![↑r,0;0,↑s]
    let Q : Matrix (Fin 2) (Fin 2) A := !![↑(r⁻¹),0;0,↑(s⁻¹)]
    let U : Matrix (Fin 2) (Fin 2) A := !![↑χ,b;0,↑ψ]
    P * U * Q = !![↑χ,(r : A) * b * ↑(s⁻¹);0,↑ψ] ∧
      (P * U * Q) 0 1 * (↑(ψ⁻¹) : A) =
        ((r : A) * ↑(s⁻¹)) * (b * ↑(ψ⁻¹)) := sorry

/-! Finite computations for exponents, specialization and lattice coordinates. -/
/-- `l5_extension_six`: the quotient and kernel exponents multiply. -/
example : (Ideal.span {(8 : ZMod 64)})^2 = ⊥ ∧
    (Ideal.span {(2 : ZMod 64)})^3 = Ideal.span {(8 : ZMod 64)} ∧
    (Ideal.span {(2 : ZMod 64)})^6 = ⊥ ∧
    (Ideal.span {(2 : ZMod 64)})^5 ≠ ⊥ := by
  norm_num [Ideal.span_singleton_pow, Ideal.span_singleton_eq_bot]
  decide

/-- `l5_error_not_square_zero`: a nilpotent error need not have square zero. -/
example : (Ideal.span {(2 : ZMod 8)})^3 = ⊥ ∧
    (Ideal.span {(2 : ZMod 8)})^2 ≠ ⊥ := by
  norm_num [Ideal.span_singleton_pow, Ideal.span_singleton_eq_bot]
  decide

/-- `l5_two_factor_kernel`: the endomorphism on a two-term filtration squares to zero. -/
example : let U : Matrix (Fin 2) (Fin 2) ℤ := !![0,1;0,0]
    U * U = 0 ∧ U ≠ 0 := by
  dsimp
  constructor
  · ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]
  · intro h
    have := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ => M 0 1) h
    norm_num at this

/-- `l5_rescale_ratio`: diag(2,3) acts on the upper entry by 2/3. -/
example : let P : Matrix (Fin 2) (Fin 2) ℚ := !![2,0;0,3]
    let Q : Matrix (Fin 2) (Fin 2) ℚ := !![1/2,0;0,1/3]
    let U : Matrix (Fin 2) (Fin 2) ℚ := !![2,6;0,3]
    P * U * Q = !![2,4;0,3] ∧
      (P * U * Q) 0 1 / 3 = (2/3 : ℚ) * (U 0 1 / 3) := by
  dsimp
  constructor
  · ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]
  · norm_num [Matrix.mul_apply, Fin.sum_univ_two]

/-- `l5_coboundary_direction`: a noninvertible lattice map can kill a nonzero cocycle. -/
example : (¬ ∃ y : ℤ, ∀ n : ℤ, n = ((1 : ℤ) - 1) * y) ∧
    (∀ n : ℤ, (0 : ℤ →ₗ[ℤ] ℤ) n = 0) := by
  constructor
  · rintro ⟨y, hy⟩
    have := hy 1
    norm_num at this
  · intro n
    rfl

/-- `l5_degree_zero`: the empty determinant has characteristic polynomial one. -/
example : (Determinant.ofMatrix
    (AlgHom.id ℤ (Matrix (Fin 0) (Fin 0) ℤ))).charpoly 0 = 1 := sorry

/-- `l5_trivial_rank_one`: specialization of the trivial character has polynomial X-1. -/
example : let ρ := (MonoidAlgebra.lift (ZMod 2) (Matrix (Fin 1) (Fin 1) (ZMod 2))
      Unit (1 : Unit →* Matrix (Fin 1) (Fin 1) (ZMod 2)));
    (Determinant.ofMatrix ρ).charpoly (MonoidAlgebra.of _ Unit ()) =
      Polynomial.X - 1 := sorry

/-- `l5_repeated_residual`: a repeated scalar character is not absolutely irreducible. -/
example : let ρ := (MonoidAlgebra.lift (ZMod 2) (Matrix (Fin 2) (Fin 2) (ZMod 2))
      Unit (1 : Unit →* Matrix (Fin 2) (Fin 2) (ZMod 2)));
    ¬ (Determinant.ofMatrix ρ).IsAbsolutelyIrreducible := sorry

/-- `l5_quotient_square`: reduction from ℤ/(4) to ℤ/(2) sends 3 to 1 and 2 to 0. -/
example (h : (Ideal.span {(4 : ℤ)}) ≤ Ideal.span {(2 : ℤ)}) :
    Ideal.Quotient.factor h (Ideal.Quotient.mk (Ideal.span {(4 : ℤ)}) 3) =
      Ideal.Quotient.mk (Ideal.span {(2 : ℤ)}) 1 ∧
    Ideal.Quotient.factor h (Ideal.Quotient.mk (Ideal.span {(4 : ℤ)}) 2) = 0 := sorry

/-- `l5_zero_exponent`: exponent zero cannot annihilate an ideal in a nonzero ring. -/
example (I : Ideal (ZMod 2)) : I^0 ≠ ⊥ := by simp

/-- `l5_empty_bounds`: the finite-sum and finite-product conventions both give exponent one. -/
example : (1 + ∑ i : Fin 0, (i.val - 1)) = 1 ∧
    (1 + Finset.univ.sup (fun i : Fin 0 => i.val - 1)) = 1 := by simp

/-- `l5_sum_sharp`: the mixed cubic term survives while every quartic term vanishes. -/
example : let I : Ideal (MvPolynomial (Fin 2) ℚ) :=
      Ideal.span {MvPolynomial.X 0 ^ 2, MvPolynomial.X 1 ^ 3}
    let x := Ideal.Quotient.mk I (MvPolynomial.X 0)
    let y := Ideal.Quotient.mk I (MvPolynomial.X 1)
    (x+y)^3 = 3*x*y^2 ∧ (x+y)^3 ≠ 0 ∧ (x+y)^4 = 0 := sorry

/-- `l5_unbounded_limit`: quotient exponents grow, while 2 is not nilpotent in ℤ₂. -/
example : (∀ r : ℕ, (2 : ZMod (2^(r+1)))^(r+1) = 0) ∧
    (∀ n : ℕ, (2 : PadicInt 2)^n ≠ 0) := sorry

/-- `l5_infinite_discrete_character`: discreteness alone does not force finite image. -/
example : Set.Infinite (Set.range (fun n : ℤ => (2 : ℚ)^n)) := sorry

/-- `l5_nonfaithful_kernel`: the zero module does not detect nilpotence of its acting ring. -/
example : RingHom.ker (algebraMap ℤ (Module.End ℤ (Fin 0 → ℤ))) = ⊤ ∧
    (⊤ : Ideal ℤ)^2 ≠ ⊥ := by
  constructor
  · ext x
    simp only [RingHom.mem_ker, Submodule.mem_top, iff_true]
    exact Subsingleton.elim _ _
  · simp [Ideal.top_pow]

/-! ## Layer IHG.6 theorems: integral Ribet modules and Fitting ideals -/

/-- Finite normalization in a finite field extension, including inseparable extensions.
Stacks, Lemmas 10.162.2 and 10.162.8. -/
theorem finite_integralClosure_complete {K E : Type u} [Field K] [Field E]
    [IsDomain A] [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [Algebra A K] [IsFractionRing A K] [Algebra K E] [Algebra A E]
    [IsScalarTower A K E] [Module.Finite K E] :
    Module.Finite A (integralClosure A E) := sorry

/-- Bounded differences over the same reduced complete coefficient ring.
DKSW Theorem 1.1 and §2.1; the inseparable field factors use finite normalization
(Stacks, Lemmas 10.162.2 and 10.162.8), not the matrix trace pairing. -/
theorem global_difference_lattice {B G : Type u} [CommRing B] [Algebra A B] [Group G]
    [IsLocalization (nonZeroDivisors A) B]
    [IsLocalRing A] [IsNoetherianRing A] [IsReduced A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (hIrr : RibetIrreducible ρ)
    (hcoeff : ∀ g, ∃ P : A[X], P.map (algebraMap A B) =
      Matrix.charpoly (ρ (MonoidAlgebra.of A G g))) :
    ∃ Λ : Submodule A (Matrix (Fin 2) (Fin 2) B), Module.Finite A Λ ∧
      IntegralRibet.differenceModule ρ χ ≤ Λ ∧ IntegralRibet.differenceModule ρ ψ ≤ Λ := sorry

/-- Under Theorem 1.1’s hypotheses with χ≢ψ modulo m, choose τ with χ(τ)−ψ(τ) a unit and diagonalize ρ(τ) using its two Henselian roots. Let B be the finite T-module generated by upper-right matrix entries b(g). Then κ(g)=ψ(g)⁻¹b(g) modulo IB is a continuous cocycle, every representative generates B/IB, B is faithful and Fitt₀_T(B/IB)⊆I. -/
theorem distinct_character_ribet {B G : Type u} [CommRing B] [Algebra A B] [Group G]
    [IsLocalization (nonZeroDivisors A) B]
    [IsLocalRing A] [IsNoetherianRing A] [IsReduced A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B] [T2Space B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of A G g)))
    (χ ψ : G →* Aˣ) (hχ : Continuous χ) (hψ : Continuous ψ)
    (hAB : Topology.IsEmbedding (algebraMap A B)) (hIrr : RibetIrreducible ρ)
    (I : Ideal A) (hchar : RibetCongruence ρ χ ψ I) (τ : G) (hτ : IsUnit ((↑(χ τ) : A)-(↑(ψ τ) : A))) :
    ∃ (L : ModuleCat.{u} A) (hfin : Module.Finite A L),
      letI := hfin
      letI : TopologicalSpace (L ⧸ (I • (⊤ : Submodule A L))) :=
        (IsLocalRing.maximalIdeal A).adicModuleTopology _
      Function.Injective (fun a : A ↦ (a • LinearMap.id : L →ₗ[A] L)) ∧
      (∃ κ : G → L ⧸ (I • (⊤ : Submodule A L)), Continuous κ ∧
        (∀ g h, κ (g*h)=κ g+((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)) • κ h) ∧
        (∀ x, Submodule.span A (Set.range (fun g ↦ κ g+((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)-1) • x))=⊤)) ∧
      (TauCeti.fittingIdeal A (L ⧸ (I • (⊤ : Submodule A L))) 0) ≤ I := sorry

/-- Conditional on finiteness of the prescribed local module and Theorem 2.1’s hypotheses, including χ≡ψ modulo m, local triangularizations diag(η_v,ξ_v), ξ_v≡ψ on Σ, ξ_v≡χ on I_v for v∈P, and chosen σ_v∈G_v, the finite local quotient N satisfies (∏_(v∈P)(ξ_v(σ_v)−χ(σ_v)))·Fitt₀_T(N)·T̃⊆Ĩ. The containment is in T̃; local factors need not belong to T. -/
theorem weighted_fitting_containment {Tilde B G : Type u} [CommRing Tilde] [CommRing B] [Algebra A Tilde]
    [Algebra Tilde B] [Algebra A B] [IsScalarTower A Tilde B]
    [IsArtinianRing B] [IsPrincipalIdealRing B] [Group G]
    [IsLocalization (nonZeroDivisors Tilde) B]
    [IsLocalRing A] [IsNoetherianRing A] [IsNoetherianRing Tilde]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) Tilde]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B] [T2Space B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (hAB : Topology.IsEmbedding (algebraMap A B))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of A G g)))
    (χ ψ : G →* Aˣ) (hχ : Continuous χ) (hψ : Continuous ψ) (Itilde : Ideal Tilde)
    (hproper : Itilde≠⊤) (hnonzero : Itilde≠⊥)
    (hinj : Function.Injective (algebraMap A Tilde)) (hIrr : RibetIrreducible ρ)
    (hres : ∀ g, (↑(χ g) : A)-(↑(ψ g) : A) ∈ IsLocalRing.maximalIdeal A)
    (hchar : RibetCongruence ρ χ ψ (Itilde.comap (algebraMap A Tilde)))
    (L : IntegralRibet.LocalData G) (loc : RibetLocalInput ρ χ ψ Itilde L)
    (σ : ∀ v, L.subgroup v)
    [Module.Finite A (IntegralRibet.localModule L ρ χ ψ)] :
    ((Ideal.span {∏ v ∈ Finset.univ.filter (fun v ↦ v ∉ L.sigma),
      ((↑(loc.xi v (σ v)) : Tilde)-algebraMap A Tilde (χ (σ v)))} : Ideal Tilde) *
      ((TauCeti.fittingIdeal A (IntegralRibet.localModule L ρ χ ψ) 0)).map (algebraMap A Tilde)) ≤ Itilde := sorry

/-- For a noetherian inclusion T⊆T̃, T local and both complete for m_T, a proper nonzero Ĩ⊆T̃, I=Ĩ∩T, K=Frac(T̃) a finite product of local rings with principal maximal ideals and reduced quotient a product of fields, a compact G and continuous ρ:G→GL₂(K), assume characteristic polynomials lie in T[X] and reduce modulo I to (X−χ)(X−ψ), χ≡ψ modulo m_T, and every reduced field-factor representation is irreducible. With an explicit finite T-submodule containing both character differences whose induced topology is m_T-adic, and the finite triangular local input of the weighted-containment theorem, there exist finite N, continuous κ and vectors y_v having all its prescribed local values, generating N together, and satisfying its weighted Fitting containment. -/
theorem local_ribet_theorem {Tilde B G : Type u} [CommRing Tilde] [CommRing B] [Algebra A Tilde]
    [Algebra Tilde B] [Algebra A B] [IsScalarTower A Tilde B]
    [IsArtinianRing B] [IsPrincipalIdealRing B] [Group G]
    [IsLocalization (nonZeroDivisors Tilde) B]
    [IsLocalRing A] [IsNoetherianRing A] [IsNoetherianRing Tilde]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) Tilde]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (Itilde : Ideal Tilde)
    (hproper : Itilde≠⊤) (hnonzero : Itilde≠⊥)
    (hinj : Function.Injective (algebraMap A Tilde)) (hIrr : RibetIrreducible ρ)
    (hres : ∀ g, (↑(χ g) : A)-(↑(ψ g) : A) ∈ IsLocalRing.maximalIdeal A)
    (hchar : RibetCongruence ρ χ ψ (Itilde.comap (algebraMap A Tilde)))
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B] [T2Space B] (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (hAB : Topology.IsEmbedding (algebraMap A B))
    (hχ : Continuous χ) (hψ : Continuous ψ)
    (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of A G g)))
    (L : IntegralRibet.LocalData G) (loc : RibetLocalInput ρ χ ψ Itilde L)
    (σ : ∀ v, L.subgroup v)
    (Λ : Submodule A (Matrix (Fin 2) (Fin 2) B)) [Module.Finite A Λ]
    (hχΛ : IntegralRibet.differenceModule ρ χ ≤ Λ)
    (hψΛ : IntegralRibet.differenceModule ρ ψ ≤ Λ)
    (hΛtop : (IsLocalRing.maximalIdeal A).adicModuleTopology Λ =
      TopologicalSpace.induced (fun x : Λ => (x : Matrix (Fin 2) (Fin 2) B)) inferInstance) :
    ∃ hfin : Module.Finite A (IntegralRibet.localModule L ρ χ ψ),
      letI := hfin
      letI : TopologicalSpace (IntegralRibet.localModule L ρ χ ψ) :=
        (IsLocalRing.maximalIdeal A).adicModuleTopology (IntegralRibet.localModule L ρ χ ψ)
      Continuous (IntegralRibet.localCocycle L ρ χ ψ) ∧
        Submodule.span A (Set.range (IntegralRibet.localCocycle L ρ χ ψ) ∪
          Set.range (IntegralRibet.localVector L ρ χ ψ))=⊤ ∧
        ((Ideal.span {∏ v ∈ Finset.univ.filter (fun v ↦ v ∉ L.sigma),
          ((↑(loc.xi v (σ v)) : Tilde)-algebraMap A Tilde (χ (σ v)))} : Ideal Tilde) *
          ((TauCeti.fittingIdeal A (IntegralRibet.localModule L ρ χ ψ) 0)).map (algebraMap A Tilde)) ≤ Itilde := by
  have hfin := (IntegralRibet.modules_finite_of_lattice L ρ χ ψ Λ hχΛ hψΛ).2.2.2
  refine ⟨hfin, ?_⟩
  let := hfin
  refine ⟨(IntegralRibet.cocycles_continuous_of_lattice L hAdic hAB.continuous
    ρ hρ χ ψ hψ Λ hψΛ hΛtop).2, IntegralRibet.localModule_span L ρ χ ψ, ?_⟩
  exact weighted_fitting_containment hAdic hAB ρ hρ χ ψ hχ hψ Itilde
    hproper hnonzero hinj hIrr hres hchar L loc σ

/-- Let T be complete reduced noetherian local, I⊆T any ideal, G compact and ρ:G→GL₂(Frac(T)) continuous. Assume every characteristic polynomial lies in T[X], reduces modulo I to (X−χ(g))(X−ψ(g)) for continuous T-unit characters χ,ψ, and every field-factor representation is irreducible. Then there are a finite T-module M and a continuous class in H¹(G,M(χψ⁻¹)) for which every representative cocycle generates M, and Fitt₀_T(M)⊆I. Residual equality and residue characteristic two are allowed. -/
theorem global_ribet_theorem {B G : Type u} [CommRing B] [Algebra A B] [Group G]
    [IsLocalization (nonZeroDivisors A) B]
    [IsLocalRing A] [IsNoetherianRing A] [IsReduced A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B] [T2Space B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of A G g)))
    (χ ψ : G →* Aˣ) (hχ : Continuous χ) (hψ : Continuous ψ)
    (hAB : Topology.IsEmbedding (algebraMap A B)) (hIrr : RibetIrreducible ρ)
    (I : Ideal A) (hchar : RibetCongruence ρ χ ψ I) :
    ∃ (M : ModuleCat.{u} A) (hfin : Module.Finite A M),
      letI := hfin
      letI : TopologicalSpace M := (IsLocalRing.maximalIdeal A).adicModuleTopology M
      ∃ κ : G → M, Continuous κ ∧
        (∀ g h, κ (g*h)=κ g+((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)) • κ h) ∧
        (∀ x : M, Submodule.span A (Set.range (fun g ↦ κ g+((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)-1) • x))=⊤) ∧
        (TauCeti.fittingIdeal A M 0) ≤ I := sorry

/-- If f is regular, then H_i(BR(f))=0 and H_i(DetBR(f))=0 for every i>0. Consequently, after a determinant-line trivialization, DetBR(f) is a finite free resolution of R/I_m(f). -/
theorem buchsbaum_rim_exactness {m n : ℕ} (hm : 0 < m) (hmn : m ≤ n)
    (f : (Fin n → A) →ₗ[A] (Fin m → A)) (hf : BuchsbaumRim.IsRegular f) :
    ∀ i : ℕ, 0 < i → Limits.IsZero ((BuchsbaumRim.moduleComplex f).homology i) ∧
      Limits.IsZero ((BuchsbaumRim.determinantalComplex f).homology i) := sorry

/-- For every commutative R₀ and n≥2, the generic map R₀[b_i,b′_i]ⁿ→R₀[b_i,b′_i]² with columns (b_i,b′_i) is regular. -/
theorem generic_two_column_regularity (n : ℕ) (hn : 2 ≤ n) :
    let S := MvPolynomial (Fin 2 × Fin n) A
    let f : (Fin n → S) →ₗ[S] (Fin 2 → S) :=
      Matrix.mulVecLin (Matrix.of fun i j ↦ (MvPolynomial.X (i,j) : S))
    BuchsbaumRim.IsRegular f := sorry

/-- For arbitrary commutative R₀, generic m×n coefficients A_ij with m ≤ n, and c_i∈R₀[A_ij], the sequence ∑A_ijX_j−c_i is weakly regular in R₀[A_ij,X_j]. If the final quotient is nonzero it is regular in Mathlib’s stronger convention. -/
theorem generic_linear_regularity (m n : ℕ) (hmn : m ≤ n)
    (c : Fin m → MvPolynomial (Fin m × Fin n) A) :
    let S := MvPolynomial ((Fin m × Fin n) ⊕ Fin n) A
    RingTheory.Sequence.IsWeaklyRegular S ((List.finRange m).map fun i ↦
      (∑ j, MvPolynomial.X (Sum.inl (i,j))*MvPolynomial.X (Sum.inr j))-
        MvPolynomial.rename Sum.inl (c i)) := sorry

/-- `local_input_empty`: with no places the local hypotheses impose no condition on ρ. -/
example {B G : Type u} [CommRing B] [Algebra A B] [Group G]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (I : Ideal A) :
    let L : IntegralRibet.LocalData G :=
      { count := 0, sigma := ∅, subgroup := Fin.elim0, inertia := Fin.elim0
        inertia_le := by intro v; exact v.elim0
        distinguished := none
        distinguished_mem := by intro v; exact v.elim0
        distinguished_exists := by simp }
    Nonempty (RibetLocalInput ρ χ ψ I L) := sorry

/-- `local_input_scalar`: scalar units admit the ordered equal local characters in the identity basis. -/
example :
    let ρ : MonoidAlgebra ℤ ℤˣ →ₐ[ℤ] Matrix (Fin 2) (Fin 2) ℤ :=
      MonoidAlgebra.lift ℤ _ _ ((algebraMap ℤ (Matrix (Fin 2) (Fin 2) ℤ)).toMonoidHom.comp
        (Units.coeHom ℤ))
    let L : IntegralRibet.LocalData ℤˣ :=
      { count := 1, sigma := Finset.univ, subgroup := fun _ ↦ ⊤, inertia := fun _ ↦ ⊥
        inertia_le := by intro v; exact bot_le
        distinguished := some 0
        distinguished_mem := by simp
        distinguished_exists := by intro _; exact ⟨0,rfl⟩ }
    ∃ loc : RibetLocalInput ρ (MonoidHom.id ℤˣ) (MonoidHom.id ℤˣ) (⊥ : Ideal ℤ) L,
      loc.basis 0 = 1 ∧ ∀ g, loc.xi 0 g = g.val := sorry

/-- `local_input_wrong_character`: integral scalar −1 cannot have local second character 1 modulo zero. -/
example :
    let ρ : MonoidAlgebra ℤ ℤˣ →ₐ[ℤ] Matrix (Fin 2) (Fin 2) ℤ :=
      MonoidAlgebra.lift ℤ _ _ ((algebraMap ℤ (Matrix (Fin 2) (Fin 2) ℤ)).toMonoidHom.comp
        (Units.coeHom ℤ))
    let L : IntegralRibet.LocalData ℤˣ :=
      { count := 1, sigma := Finset.univ, subgroup := fun _ ↦ ⊤, inertia := fun _ ↦ ⊥
        inertia_le := by intro v; exact bot_le
        distinguished := some 0
        distinguished_mem := by simp
        distinguished_exists := by intro _; exact ⟨0,rfl⟩ }
    ¬ Nonempty (RibetLocalInput ρ 1 1 (⊥ : Ideal ℤ) L) := sorry

end Theorems

namespace ReductivePseudocharacter
variable {A G : Type u} [CommRing A] [Group G]
/-- The coefficient of X^i in the characteristic polynomial of the generic GL_d matrix. -/
def glCoefficient (d i : ℕ) :
    InvariantCoordinateInput.ring (TauCeti.GeneralLinear.coordinateHopfAlgebra A d) 1 :=
  ⟨Algebra.TensorProduct.includeRight
      ((TauCeti.GeneralLinear.genericMatrix A d).charpoly.coeff i), by sorry⟩

/-- Emerson–Morel Theorem 4.1, with the actual GL_d Hopf-coordinate invariants. -/
def glEquiv (d : ℕ) (hd : 0 < d) :
    ReductivePseudocharacter G (TauCeti.GeneralLinear.coordinateHopfAlgebra A d) A ≃
      Determinant A (MonoidAlgebra A G) d := sorry

theorem glEquiv_coeff (d : ℕ) (hd : 0 < d)
    (Θ : ReductivePseudocharacter G (TauCeti.GeneralLinear.coordinateHopfAlgebra A d) A)
    (g : G) (i : ℕ) :
    ((glEquiv d hd Θ).charpoly (MonoidAlgebra.of A G g)).coeff i =
      Θ.theta 1 (glCoefficient d i) (fun _ => g) := sorry

/-- Field reconstruction for GL_d, inherited through the coefficient-compatible comparison. -/
theorem gl_reconstruction {k : Type u} [Field k] [IsAlgClosed k] (d : ℕ) (hd : 0 < d)
    (Θ : ReductivePseudocharacter G (TauCeti.GeneralLinear.coordinateHopfAlgebra k d) k) :
    ∃ ρ : MonoidAlgebra k G →ₐ[k] Matrix (Fin d) (Fin d) k,
      Determinant.ofMatrix ρ = glEquiv d hd Θ ∧ IsSemisimpleModule (MonoidAlgebra k G) (matrixModule ρ) := sorry

example : glCoefficient (A := A) 1 1 = 1 := sorry
example : glCoefficient (A := A) 2 2 = 1 := sorry
example : glCoefficient (A := A) 2 3 = 0 := sorry
example (Θ : ReductivePseudocharacter G (TauCeti.GeneralLinear.coordinateHopfAlgebra A 1) A)
    (g : G) : (glEquiv 1 (by omega) Θ).eval (MonoidAlgebra.of A G g) =
      -Θ.theta 1 (glCoefficient 1 0) (fun _ => g) := sorry
example (Θ : ReductivePseudocharacter G (TauCeti.GeneralLinear.coordinateHopfAlgebra A 2) A)
    (g : G) : (glEquiv 2 (by omega) Θ).trace (MonoidAlgebra.of A G g) =
      -Θ.theta 1 (glCoefficient 2 1) (fun _ => g) := sorry
example (Θ : ReductivePseudocharacter G (TauCeti.GeneralLinear.coordinateHopfAlgebra A 2) A)
    (g : G) : (glEquiv 2 (by omega) Θ).eval (MonoidAlgebra.of A G g) =
      Θ.theta 1 (glCoefficient 2 0) (fun _ => g) := sorry
end ReductivePseudocharacter

/-! ## Rational cohomology: the Hochschild complex (Jantzen I.4.14–4.16) -/

namespace RationalCohomology
open CategoryTheory
variable (A H M : Type u) [CommRing A] [CommRing H] [HopfAlgebra A H]
    [AddCommGroup M] [Module A M] [TauCeti.Comodule A H M]

/-- Left-associated tensor terms, starting with the coefficient module. -/
def term : ℕ → ModuleCat.{u} A
  | 0 => ModuleCat.of A M
  | n+1 => ModuleCat.of A (term n ⊗[A] H)

/-- The coaction, internal coproducts, and final insertion of the unit. -/
def coface (n : ℕ) (i : Fin (n+2)) : term A H M n →ₗ[A] term A H M (n+1) := by
  let _ := (inferInstance : TauCeti.Comodule A H M)
  exact sorry

theorem coface_zero : coface A H M 0 0 = TauCeti.Comodule.coact (R := A) (C := H) (M := M) := sorry
theorem coface_last (n : ℕ) :
    coface A H M n (Fin.last (n+1)) = (TensorProduct.mk A (term A H M n) H).flip 1 := sorry
theorem coface_tensor (n : ℕ) (i : Fin (n+1)) :
    coface A H M (n+1) ⟨i, by omega⟩ =
      (coface A H M n ⟨i, by omega⟩).rTensor H := sorry
theorem coface_coproduct (n : ℕ) :
    coface A H M (n+1) ⟨n+1, by omega⟩ =
      (TensorProduct.assoc A (term A H M n) H H).symm.toLinearMap ∘ₗ
        (Coalgebra.comul (R := A) (A := H)).lTensor (term A H M n) := sorry

/-- Alternating Hochschild differential; in degree zero it is ρ(m) − m⊗1. -/
def differential (n : ℕ) : term A H M n →ₗ[A] term A H M (n+1) :=
  ∑ i : Fin (n+2), (-1 : A)^i.val • coface A H M n i

theorem differential_sq (n : ℕ) :
    differential A H M (n+1) ∘ₗ differential A H M n = 0 := sorry

def complex : CochainComplex (ModuleCat.{u} A) ℕ :=
  CochainComplex.of (term A H M)
    (fun n => ModuleCat.ofHom (differential A H M n)) (by sorry)

/-- Flatness is the standing hypothesis identifying Hochschild cohomology with
right derived scheme invariants, Jantzen I.4.2 and I.4.16. -/
def cohomology [Module.Flat A H] (n : ℕ) : ModuleCat.{u} A :=
  (complex A H M).homology n

theorem cohomology_zero [Module.Flat A H] :
    Nonempty (cohomology A H M 0 ≃ₗ[A]
      LinearMap.ker (TauCeti.Comodule.coact (R := A) (C := H) (M := M) -
        (TensorProduct.mk A M H).flip 1)) := sorry

theorem regular_acyclic [Module.Flat A H] (n : ℕ) (hn : 0 < n) :
    Limits.IsZero (cohomology A H H n) := sorry

/-- Jantzen I.4.15: the counit contracts the regular Hochschild complex. -/
theorem regular_cohomology_zero [Module.Flat A H] :
    Nonempty (cohomology A H H 0 ≃ₗ[A] A) := sorry

example : term A H M 0 = ModuleCat.of A M := rfl
example : term A H M 1 = ModuleCat.of A (M ⊗[A] H) := rfl
example : term A H M 2 = ModuleCat.of A ((M ⊗[A] H) ⊗[A] H) := rfl
example (m : M) : coface A H M 0 0 m = TauCeti.Comodule.coact (R := A) (C := H) (M := M) m := sorry
example (m : M) : coface A H M 0 1 m = m ⊗ₜ[A] (1 : H) := sorry
example (m : M) (h : H) : coface A H M 1 1 (m ⊗ₜ[A] h) =
    (TensorProduct.assoc A M H H).symm (m ⊗ₜ[A] Coalgebra.comul h) := sorry
example (m : M) : differential A H M 0 m =
    TauCeti.Comodule.coact m - m ⊗ₜ[A] (1 : H) := sorry
example (m : M) (h : H) : differential A H M 1 (m ⊗ₜ[A] h) =
    TauCeti.Comodule.coact m ⊗ₜ[A] h -
      (TensorProduct.assoc A M H H).symm (m ⊗ₜ[A] Coalgebra.comul h) +
        (m ⊗ₜ[A] h) ⊗ₜ[A] (1 : H) := sorry
example (m : M) : differential A H M 1 (differential A H M 0 m) = 0 := sorry
example : (complex A H M).X 0 = ModuleCat.of A M := rfl
example : ((complex A H M).d 0 1).hom = differential A H M 0 := sorry
example : ((complex A H M).d 1 2).hom = differential A H M 1 := sorry
example [Module.Flat A H] : Nonempty (cohomology A H H 0 ≃ₗ[A] A) := sorry
example [Module.Flat A H] : Limits.IsZero (cohomology A H H 1) := sorry
example [Module.Flat A H] : Limits.IsZero (cohomology A H H 2) := sorry
/-- `rational_term_zero_rank`: the coefficient module retains both independent coordinates. -/
example : Module.finrank ℚ (term ℚ ℚ (Fin 2 → ℚ) 0) = 2 := sorry
/-- `rational_term_one_rank`: tensoring with the trivial Hopf algebra preserves rank two. -/
example : Module.finrank ℚ (term ℚ ℚ (Fin 2 → ℚ) 1) = 2 := sorry
/-- `rational_term_two_rank`: two Hopf factors still give rank two, not four. -/
example : Module.finrank ℚ (term ℚ ℚ (Fin 2 → ℚ) 2) = 2 := sorry
/-- `rational_complex_zero`: the trivial coaction makes the first boundary zero. -/
example : ((complex ℤ ℤ ℤ).d 0 1).hom (3 : ℤ) = 0 := sorry
/-- `rational_complex_one`: the next alternating sum has value three. -/
example : ((complex ℤ ℤ ℤ).d 1 2).hom ((3 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)) =
    ((3 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)) ⊗ₜ[ℤ] (1 : ℤ) := sorry
/-- `rational_complex_two`: the following alternating sum is zero again. -/
example : ((complex ℤ ℤ ℤ).d 2 3).hom
    (((3 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)) ⊗ₜ[ℤ] (1 : ℤ)) = 0 := sorry

section Functoriality
variable {A H M} {N P : Type u} [AddCommGroup N] [Module A N]
  [TauCeti.Comodule A H N] [AddCommGroup P] [Module A P] [TauCeti.Comodule A H P]
  [Module.Flat A H]

/-- A coefficient morphism on the first factor, with identity on every Hopf factor. -/
def termMap (f : TauCeti.Comodule.Hom A H M N) :
    (i : ℕ) → term A H M i →ₗ[A] term A H N i
  | 0 => f.toLinearMap
  | i+1 => (termMap f i).rTensor H

/-- The map induced on the Hochschild complex by a coefficient comodule morphism. -/
def complexMap (f : TauCeti.Comodule.Hom A H M N) : complex A H M ⟶ complex A H N := sorry

theorem complexMap_zero (f : TauCeti.Comodule.Hom A H M N) :
    (complexMap f).f 0 = ModuleCat.ofHom f.toLinearMap := sorry

theorem complexMap_f (f : TauCeti.Comodule.Hom A H M N) (i : ℕ) :
    (complexMap f).f i = ModuleCat.ofHom (termMap f i) := sorry

example (f : TauCeti.Comodule.Hom A H M N) (m : M) : termMap f 0 m = f m := rfl
example (f : TauCeti.Comodule.Hom A H M N) (m : M) (h : H) :
    termMap f 1 (m ⊗ₜ[A] h) = f m ⊗ₜ[A] h := sorry
example (f : TauCeti.Comodule.Hom A H M N) (m : M) (h k : H) :
    termMap f 2 ((m ⊗ₜ[A] h) ⊗ₜ[A] k) = (f m ⊗ₜ[A] h) ⊗ₜ[A] k := sorry

/-- Rational cohomology uses the homology map of the coefficient complex map. -/
def map (f : TauCeti.Comodule.Hom A H M N) (i : ℕ) :
    cohomology A H M i →ₗ[A] cohomology A H N i :=
  (HomologicalComplex.homologyMap (complexMap f) i).hom

theorem map_id (i : ℕ) : map (TauCeti.Comodule.Hom.id A H M) i = LinearMap.id := sorry
theorem map_comp (f : TauCeti.Comodule.Hom A H M N)
    (g : TauCeti.Comodule.Hom A H N P) (i : ℕ) :
    map (g.comp f) i = (map g i).comp (map f i) := sorry

/-- The connecting map for a short exact sequence, with the Hochschild differential sign. -/
def connecting (f : TauCeti.Comodule.Hom A H M N) (g : TauCeti.Comodule.Hom A H N P)
    (hf : Function.Injective f) (hfg : Function.Exact f g) (hg : Function.Surjective g)
    (i : ℕ) : cohomology A H P i →ₗ[A] cohomology A H M (i+1) := sorry

/-- Jantzen I.4.2 and I.4.16: the two exactness positions used in dimension shifting. -/
theorem connecting_exact (f : TauCeti.Comodule.Hom A H M N)
    (g : TauCeti.Comodule.Hom A H N P)
    (hf : Function.Injective f) (hfg : Function.Exact f g) (hg : Function.Surjective g)
    (i : ℕ) : Function.Exact (map g i) (connecting f g hf hfg hg i) ∧
      Function.Exact (connecting f g hf hfg hg i) (map f (i+1)) := sorry

/-- Multiplication on the right by an invariant cohomology class, on the tensor comodule. -/
def invariantProduct (i : ℕ) :
    cohomology A H M i →ₗ[A] cohomology A H N 0 →ₗ[A]
      (letI := TauCeti.Comodule.tensor (R := A) (C := H) (M := M) (N := N)
       cohomology A H (M ⊗[A] N) i) := sorry

/-- DKSW Lemma 4.12 and Corollary 4.13, pp.24–25: a right invariant factor
commutes with the connecting map without a sign. Flatness preserves the tensor sequence. -/
theorem connecting_invariantProduct
    {Q : Type u} [AddCommGroup Q] [Module A Q] [TauCeti.Comodule A H Q] [Module.Flat A Q]
    (f : TauCeti.Comodule.Hom A H M N) (g : TauCeti.Comodule.Hom A H N P)
    (hf : Function.Injective f) (hfg : Function.Exact f g) (hg : Function.Surjective g)
    (i : ℕ) (a : cohomology A H P i) (b : cohomology A H Q 0) :
    letI := TauCeti.Comodule.tensor (R := A) (C := H) (M := M) (N := Q)
    letI := TauCeti.Comodule.tensor (R := A) (C := H) (M := N) (N := Q)
    letI := TauCeti.Comodule.tensor (R := A) (C := H) (M := P) (N := Q)
    let fQ := f.tensorMap (TauCeti.Comodule.Hom.id A H Q)
    let gQ := g.tensorMap (TauCeti.Comodule.Hom.id A H Q)
    connecting fQ gQ (by sorry) (by sorry) (by sorry) i (invariantProduct i a b) =
      invariantProduct (i+1) (connecting f g hf hfg hg i a) b := sorry
end Functoriality
end RationalCohomology

/-! ## Algebraic induction as a cotensor equalizer (Jantzen I.3.3–I.3.7) -/
namespace AlgebraicInduction
open CategoryTheory
variable {A H K M : Type u} [CommRing A] [CommRing H] [CommRing K]
    [HopfAlgebra A H] [HopfAlgebra A K] [Module.Flat A H] [Module.Flat A K]
    [AddCommGroup M] [Module A M] [TauCeti.Comodule A K M]

/-- Functions F with F(hg)=hF(g). Inversion converts this to the usual
f(g h)=h⁻¹ f(g) convention, retaining left translation on induced functions. -/
def module (f : H →ₐc[A] K) : Submodule A (M ⊗[A] H) :=
  LinearMap.ker (
    (TauCeti.Comodule.coact (R := A) (C := K) (M := M)).rTensor H -
      (TensorProduct.assoc A M K H).symm.toLinearMap ∘ₗ
        ((TensorProduct.map f.toLinearMap LinearMap.id ∘ₗ
          (Coalgebra.comul (R := A) (A := H))).lTensor M))

/-- Restriction of id_M⊗Δ_H to the cotensor equalizer. -/
instance moduleComodule (f : H →ₐc[A] K) : TauCeti.Comodule A H (module (M := M) f) := sorry

theorem coact_inclusion (f : H →ₐc[A] K) (x : module (M := M) f) :
    TensorProduct.map (module f).subtype LinearMap.id (TauCeti.Comodule.coact x) =
      (TensorProduct.assoc A M H H).symm
        ((Coalgebra.comul (R := A) (A := H)).lTensor M x.val) := sorry

/-- Frobenius reciprocity with restriction along the given Hopf map. -/
def reciprocity (f : H →ₐc[A] K) {N : Type u} [AddCommGroup N] [Module A N]
    [TauCeti.Comodule A H N] :
    TauCeti.Comodule.Hom A H N (module (M := M) f) ≃
      (letI := TauCeti.Comodule.Corestrict (M := N) f.toCoalgHom
       TauCeti.Comodule.Hom A K N M) := sorry

theorem reciprocity_apply (f : H →ₐc[A] K) {N : Type u} [AddCommGroup N] [Module A N]
    [TauCeti.Comodule A H N] (q : TauCeti.Comodule.Hom A H N (module (M := M) f))
    (x : N) :
    (reciprocity f q) x = (TensorProduct.rid A M)
      ((Coalgebra.counit (R := A) (A := H)).lTensor M (q x).val) := sorry

example : Nonempty (module (M := M) (BialgHom.id A K) ≃ₗ[A] M) := sorry
example (f : H →ₐc[A] K) (x : M ⊗[A] H) :
    x ∈ module (M := M) f ↔
      (TauCeti.Comodule.coact (R := A) (C := K) (M := M)).rTensor H x =
        (TensorProduct.assoc A M K H).symm
          ((TensorProduct.map f.toLinearMap LinearMap.id ∘ₗ
            (Coalgebra.comul (R := A) (A := H))).lTensor M x) := sorry
example (f : H →ₐc[A] K) : (0 : M ⊗[A] H) ∈ module (M := M) f := by simp

example (f : H →ₐc[A] K) : Function.Bijective
    (reciprocity (M := M) (N := module (M := M) f) f) := sorry
example (f : H →ₐc[A] K) {N : Type u} [AddCommGroup N] [Module A N]
    [TauCeti.Comodule A H N] : reciprocity (M := M) (N := N) f 0 = 0 := sorry
example (f : H →ₐc[A] K) {N : Type u} [AddCommGroup N] [Module A N]
    [TauCeti.Comodule A H N] (q : TauCeti.Comodule.Hom A H N (module (M := M) f))
    (x : N) : (reciprocity f q) x = (TensorProduct.rid A M)
      ((Coalgebra.counit (R := A) (A := H)).lTensor M (q x).val) := sorry

end AlgebraicInduction

/-! ## Integral GL₂ induced modules and good filtrations -/
namespace GoodFiltration
open CategoryTheory IntegralRibet
attribute [local instance] TensorProduct.instModule LinearMap.module
local instance : Module ℤ lowerBorelRing := lowerBorelHopf.toAlgebra.toModule
local notation "H₂" => TauCeti.GeneralLinear.coordinateHopfAlgebra ℤ 2
local instance : Module ℤ H₂ := (inferInstance : HopfAlgebra ℤ H₂).toAlgebra.toModule

instance gl2Flat : Module.Flat ℤ H₂ := sorry

/-- The Borel character x^a z^b, including negative integral weights. -/
def character (a b : ℤ) : lowerBorelRingˣ :=
  (⟨borelCoordinate 0, borelCoordinate 3, by sorry, by sorry⟩ : lowerBorelRingˣ)^a *
    (⟨borelCoordinate 1, borelCoordinate 4, by sorry, by sorry⟩ : lowerBorelRingˣ)^b

/-- The rank-one rational Borel module of weight (a,b). -/
@[instance_reducible]
def characterComodule (a b : ℤ) : TauCeti.Comodule ℤ lowerBorelRing ℤ := sorry

theorem character_coact (a b : ℤ) (m : ℤ) :
    (characterComodule a b).coact m =
      m ⊗ₜ[ℤ] (character a b : lowerBorelRing) := sorry

/-- The induced module H⁰(a,b); inversion identifies the cotensor convention
with functions f(gb)=x(b)⁻ᵃ z(b)⁻ᵇ f(g). -/
def induced (a b : ℤ) : TauCeti.ComoduleCat ℤ H₂ :=
  letI := characterComodule a b
  TauCeti.ComoduleCat.of ℤ H₂ (AlgebraicInduction.module (M := ℤ) borelRestriction)

/-- An exhaustive chain of actual subrepresentations, with dominant induced
successive quotients. Zero factors allow a finite chain to stabilize. -/
structure Data (M : Type u) [AddCommMonoid M] [Module ℤ M] [TauCeti.Comodule ℤ H₂ M] where
  stage : ℕ → TauCeti.ComoduleCat.{0, 0, u} ℤ H₂
  embedding : ∀ n, TauCeti.Comodule.Hom ℤ H₂ (stage n) M
  injective : ∀ n, Function.Injective (embedding n)
  zero : LinearMap.range (embedding 0).toLinearMap = ⊥
  increasing : ∀ n, LinearMap.range (embedding n).toLinearMap ≤
    LinearMap.range (embedding (n+1)).toLinearMap
  exhaustive : ∀ m : M, ∃ n x, embedding n x = m
  factors : ∀ n, LinearMap.range (embedding n).toLinearMap =
      LinearMap.range (embedding (n+1)).toLinearMap ∨
    ∃ a b : ℤ, b ≤ a ∧
      ∃ q : TauCeti.Comodule.Hom ℤ H₂ (stage (n+1)) (induced a b),
        Function.Surjective q ∧ ∀ x, q x = 0 ↔
          embedding (n+1) x ∈ LinearMap.range (embedding n).toLinearMap

/-- Countable exhaustive good filtrations over ℤ, without a homogeneity restriction. -/
def Has (M : Type u) [AddCommMonoid M] [Module ℤ M] [TauCeti.Comodule ℤ H₂ M] : Prop :=
  Nonempty (Data M)

/-- DKSW Theorem 4.7 and Jantzen I.4.17 for the exhaustive union. -/
theorem acyclic (M : Type) [AddCommGroup M] [Module ℤ M] [TauCeti.Comodule ℤ H₂ M]
    (hM : Has M) (i : ℕ) (hi : 0 < i) :
    Limits.IsZero (RationalCohomology.cohomology ℤ H₂ M i) := sorry

/-- DKSW Theorem 4.8; double filtrations are enumerated by diagonals. -/
theorem tensor (M N : Type) [AddCommGroup M] [Module ℤ M] [TauCeti.Comodule ℤ H₂ M]
    [AddCommGroup N] [Module ℤ N] [TauCeti.Comodule ℤ H₂ N] (hM : Has M) (hN : Has N) :
    letI : Module ℤ (M ⊗[ℤ] N) := TensorProduct.instModule
    letI : TauCeti.Comodule ℤ H₂ (M ⊗[ℤ] N) :=
      TauCeti.Comodule.tensor (R := ℤ) (C := H₂) (M := M) (N := N)
    Has (M ⊗[ℤ] N) := sorry

example : (character 1 0 : lowerBorelRing) = borelCoordinate 0 := sorry
example : (character 0 (-1) : lowerBorelRing) = borelCoordinate 4 := sorry
example : (character 0 0 : lowerBorelRing) = 1 := sorry
example : (characterComodule 1 0).coact (1 : ℤ) =
      (1 : ℤ) ⊗ₜ[ℤ] borelCoordinate 0 := sorry
example : (characterComodule 0 (-1)).coact (1 : ℤ) =
      (1 : ℤ) ⊗ₜ[ℤ] borelCoordinate 4 := sorry
example : (characterComodule 0 0).coact (1 : ℤ) =
      (1 : ℤ) ⊗ₜ[ℤ] (1 : lowerBorelRing) := sorry
example : Nonempty (induced 0 0 ≃ₗ[ℤ] ℤ) := sorry
example : Subsingleton (induced 0 1) := sorry
example : Nonempty (induced 0 (-1) ≃ₗ[ℤ] (Fin 2 → ℤ)) := sorry
example : Has (induced 0 0) := sorry
example : Has (induced 1 0) := sorry
example : Has (induced 0 (-1)) := sorry
example (M : Type) [AddCommGroup M] [Module ℤ M] [TauCeti.Comodule ℤ H₂ M]
    (h : ¬ Limits.IsZero (RationalCohomology.cohomology ℤ H₂ M 1)) : ¬ Has M := sorry

/-- Twist j multiplies the right coaction by (z/x)^j, for B the lower Borel.
DKSW Example 4.2, equation (48), p.22. -/
@[instance_reducible]
def twistComodule (M : Type) [AddCommGroup M] [Module ℤ M]
    [TauCeti.Comodule ℤ lowerBorelRing M] (j : ℤ) :
    TauCeti.Comodule ℤ lowerBorelRing M where
  coact := (LinearMap.mulRight ℤ (character (-j) j : lowerBorelRing)).lTensor M ∘ₗ
    (inferInstance : TauCeti.Comodule ℤ lowerBorelRing M).coact
  coassoc := sorry
  lTensor_counit_comp_coact := sorry

abbrev twistedCohomology (M : Type) [AddCommGroup M] [Module ℤ M]
    [TauCeti.Comodule ℤ lowerBorelRing M] (j : ℤ) (i : ℕ) : ModuleCat ℤ :=
  letI := twistComodule M j
  RationalCohomology.cohomology ℤ lowerBorelRing M i

/-- Restrict a GL₂ comodule to B before twisting; no second cohomology carrier is used. -/
abbrev borelCohomology (M : Type) [AddCommGroup M] [Module ℤ M]
    [TauCeti.Comodule ℤ H₂ M] (j : ℤ) (i : ℕ) : ModuleCat ℤ :=
  letI := TauCeti.Comodule.Corestrict (M := M) borelRestriction.toCoalgHom
  twistedCohomology M j i

/-- DKSW Theorem 4.4, p.23: restriction identifies untwisted GL₂ and B cohomology. -/
def restriction_equiv (M : Type) [AddCommGroup M] [Module ℤ M]
    [TauCeti.Comodule ℤ H₂ M] (i : ℕ) :
    RationalCohomology.cohomology ℤ H₂ M i ≃ₗ[ℤ] borelCohomology M 0 i := sorry

/-- DKSW Lemma 4.11, p.24; filtered colimits give the exhaustive-filtration form. -/
theorem twisted_vanishing (M : Type) [AddCommGroup M] [Module ℤ M]
    [TauCeti.Comodule ℤ H₂ M] (hM : Has M) (j i : ℕ) (hi : j < i) :
    Limits.IsZero (borelCohomology M j i) := sorry

/-- DKSW Lemma 4.12(1), p.24, natural in the good GL₂ module. -/
def twist_one_equiv (M : Type) [AddCommGroup M] [Module ℤ M]
    [TauCeti.Comodule ℤ H₂ M] (hM : Has M) :
    borelCohomology M 1 1 ≃ₗ[ℤ] RationalCohomology.cohomology ℤ H₂ M 0 := sorry

local instance : TauCeti.Comodule ℤ H₂ ℤ := TauCeti.Comodule.trivial

/-- The twist-one nonvanishing control; DKSW Lemma 4.12(1), p.24. -/
theorem twist_one_integer : Nonempty (borelCohomology ℤ 1 1 ≃ₗ[ℤ] ℤ) := sorry

/-- DKSW Lemma 4.12(2), pp.24–25: the diagonal group has zero reduction at odd primes. -/
theorem diagonal_twist_odd (M : Type) [AddCommGroup M] [Module ℤ M]
    [TauCeti.Comodule ℤ H₂ M] (hM : Has M) (i p : ℕ) (hi : 1 < i)
    (hp : p.Prime) (hp2 : 2 < p) :
    Subsingleton (borelCohomology M i i ⊗[ℤ] ZMod p) := sorry

/-- DKSW Lemma 4.12(3), pp.24–25, retains the characteristic-two contribution. -/
def diagonal_twist_two (M : Type) [AddCommGroup M] [Module ℤ M]
    [TauCeti.Comodule ℤ H₂ M] (hM : Has M) (i : ℕ) (hi : 1 < i) :
    letI : Module ℤ (borelCohomology M i i ⊗[ℤ] ZMod 2) := TensorProduct.instModule
    letI : Module ℤ (RationalCohomology.cohomology ℤ H₂ M 0 ⊗[ℤ] ZMod 2) := TensorProduct.instModule
    (borelCohomology M i i ⊗[ℤ] ZMod 2) ≃ₗ[ℤ]
      (RationalCohomology.cohomology ℤ H₂ M 0 ⊗[ℤ] ZMod 2) := sorry

section Products
variable (S T : Type) [CommRing S] [CommRing T]
  [TauCeti.Comodule ℤ H₂ S] [TauCeti.Comodule ℤ H₂ T]
  (δS : S →ₐ[ℤ] S ⊗[ℤ] H₂) (δT : T →ₐ[ℤ] T ⊗[ℤ] H₂)
  (hS : δS.toLinearMap = TauCeti.Comodule.coact (R := ℤ) (C := H₂) (M := S))
  (hT : δT.toLinearMap = TauCeti.Comodule.coact (R := ℤ) (C := H₂) (M := T))
  (f : S →ₐ[ℤ] T)
  (hf : δT.toLinearMap ∘ₗ f.toLinearMap =
    f.toLinearMap.rTensor H₂ ∘ₗ δS.toLinearMap)

/-- The product sends a twisted class through f and multiplies by a B-invariant in T.
It is induced on Hochschild cochains by a⊗b ↦ f(a)b. -/
def twistedInvariantProduct (i : ℕ) :
    letI : Module ℤ (borelCohomology S i i ⊗[ℤ] borelCohomology T 0 0) := TensorProduct.instModule
    (borelCohomology S i i ⊗[ℤ] borelCohomology T 0 0) →ₗ[ℤ]
      borelCohomology T i i := by
  let _ := hS
  let _ := hT
  let _ := hf
  exact sorry

/-- DKSW Corollary 4.13, p.25, in the equivalent finite-sum-of-products form.
The ring coactions and the inclusion are required to be equivariant. -/
theorem twistedInvariantProduct_surjective
    (hinj : Function.Injective f) (hgoodS : Has S) (hgoodT : Has T) (i : ℕ) :
    Function.Surjective (twistedInvariantProduct S T δS δT hS hT f hf i) := sorry
/-- Lemma 4.12(1) is compatible with the invariant product used in Corollary 4.13.
Both sides are compared in untwisted B-cohomology via Theorem 4.4. -/
theorem twist_one_product (hgoodS : Has S) (hgoodT : Has T)
    (a : borelCohomology S 1 1) (b : borelCohomology T 0 0) :
    restriction_equiv T 0 (twist_one_equiv T hgoodT
      (twistedInvariantProduct S T δS δT hS hT f hf 1 (a ⊗ₜ[ℤ] b))) =
    twistedInvariantProduct S T δS δT hS hT f hf 0
      ((restriction_equiv S 0 (twist_one_equiv S hgoodS a)) ⊗ₜ[ℤ] b) := sorry

/-- The characteristic-two diagonal calculation intertwines invariant multiplication.
DKSW proof of Corollary 4.13, p.25, via connecting_invariantProduct. -/
theorem diagonal_twist_two_product (hgoodS : Has S) (hgoodT : Has T)
    (i : ℕ) (hi : 1 < i) (b : borelCohomology T 0 0) :
    letI : Module ℤ (borelCohomology S i i ⊗[ℤ] ZMod 2) := TensorProduct.instModule
    letI : Module ℤ (borelCohomology T i i ⊗[ℤ] ZMod 2) := TensorProduct.instModule
    letI : Module ℤ (borelCohomology S 0 0 ⊗[ℤ] ZMod 2) := TensorProduct.instModule
    letI : Module ℤ (borelCohomology T 0 0 ⊗[ℤ] ZMod 2) := TensorProduct.instModule
    let μi : borelCohomology S i i →ₗ[ℤ] borelCohomology T i i :=
      { toFun := fun a ↦ twistedInvariantProduct S T δS δT hS hT f hf i (a ⊗ₜ[ℤ] b)
        map_add' := by sorry
        map_smul' := by sorry }
    let μ0 : borelCohomology S 0 0 →ₗ[ℤ] borelCohomology T 0 0 :=
      { toFun := fun a ↦ twistedInvariantProduct S T δS δT hS hT f hf 0 (a ⊗ₜ[ℤ] b)
        map_add' := by sorry
        map_smul' := by sorry }
    let eS := (diagonal_twist_two S hgoodS i hi).trans
      ((restriction_equiv S 0).rTensor (ZMod 2))
    let eT := (diagonal_twist_two T hgoodT i hi).trans
      ((restriction_equiv T 0).rTensor (ZMod 2))
    eT.toLinearMap ∘ₗ μi.rTensor (ZMod 2) =
      μ0.rTensor (ZMod 2) ∘ₗ eS.toLinearMap := sorry
end Products

/-- DKSW Lemma 4.14, pp.25–26. A finite augmented resolution with kth term
isomorphic as a B-comodule to V_k(k), with V_k good, has acyclic augmentation. -/
theorem finite_twisted_resolution (M : ModuleCat ℤ)
    [TauCeti.Comodule ℤ lowerBorelRing M]
    (C : ChainComplex (ModuleCat ℤ) ℕ)
    [∀ k, TauCeti.Comodule ℤ lowerBorelRing (C.X k)]
    (hC : ∀ k, (inferInstance : TauCeti.Comodule ℤ lowerBorelRing (C.X k)).coact ∘ₗ (C.d (k+1) k).hom =
      (C.d (k+1) k).hom.rTensor lowerBorelRing ∘ₗ
        (inferInstance : TauCeti.Comodule ℤ lowerBorelRing (C.X (k+1))).coact)
    (ε : TauCeti.Comodule.Hom ℤ lowerBorelRing (C.X 0) M)
    (hε : Function.Surjective ε)
    (hexact0 : Function.Exact (C.d 1 0).hom ε)
    (hexact : ∀ k, Function.Exact (C.d (k+2) (k+1)).hom (C.d (k+1) k).hom)
    (hfinite : ∃ N, ∀ k, N < k → Limits.IsZero (C.X k))
    (hterms : ∀ k, ∃ (V : ModuleCat ℤ) (ρ : TauCeti.Comodule ℤ H₂ V),
      letI := ρ
      Has V ∧
        (letI := TauCeti.Comodule.Corestrict (M := V) borelRestriction.toCoalgHom
         ∃ e : C.X k ≃ₗ[ℤ] V,
           (twistComodule V k).coact ∘ₗ e.toLinearMap =
             e.toLinearMap.rTensor lowerBorelRing ∘ₗ
               (inferInstance : TauCeti.Comodule ℤ lowerBorelRing (C.X k)).coact))
    (i : ℕ) (hi : 0 < i) :
    Limits.IsZero (RationalCohomology.cohomology ℤ lowerBorelRing M i) := sorry

/-- The adjoint coordinate representation, DKSW Example 4.2, p.22. -/
@[instance_reducible]
def adjointComodule : TauCeti.Comodule ℤ H₂ (Matrix (Fin 2) (Fin 2) ℤ) := sorry

theorem adjoint_coact (i j : Fin 2) :
    adjointComodule.coact (Matrix.single i j (1 : ℤ)) =
      ∑ k : Fin 2, ∑ l : Fin 2,
        Matrix.single k l (1 : ℤ) ⊗ₜ[ℤ]
          ((TauCeti.GeneralLinear.genericMatrix ℤ 2)⁻¹ i k *
            TauCeti.GeneralLinear.genericMatrix ℤ 2 l j) := sorry

/-- Left-associated adjoint powers, with the tensor-unit coaction in degree zero. -/
def adjointPower : ℕ → ModuleCat ℤ
  | 0 => ModuleCat.of ℤ ℤ
  | k+1 =>
      letI : Module ℤ (adjointPower k ⊗[ℤ] Matrix (Fin 2) (Fin 2) ℤ) := TensorProduct.instModule
      ModuleCat.of ℤ (adjointPower k ⊗[ℤ] Matrix (Fin 2) (Fin 2) ℤ)

instance adjointPowerComodule (k : ℕ) : TauCeti.Comodule ℤ H₂ (adjointPower k) := sorry

theorem adjointPower_coact_zero (m : ℤ) :
    (adjointPowerComodule 0).coact m = m ⊗ₜ[ℤ] (1 : H₂) := sorry

theorem adjointPower_coact_succ (k : ℕ) :
    letI : Module ℤ (adjointPower k ⊗[ℤ] Matrix (Fin 2) (Fin 2) ℤ) := TensorProduct.instModule
    letI := adjointComodule
    (adjointPowerComodule (k+1)).coact =
      (TauCeti.Comodule.tensor (R := ℤ) (C := H₂)
        (M := adjointPower k) (N := Matrix (Fin 2) (Fin 2) ℤ)).coact := sorry

/-- DKSW Corollary 4.9, p.24, including the empty tensor power. -/
theorem adjointPower_good (k : ℕ) : Has (adjointPower k) := sorry
instance adjointPowerFlat (k : ℕ) : Module.Flat ℤ (adjointPower k) := sorry

/-- DKSW Theorem 4.15, p.26. Polynomial coefficient variables are B-fixed;
any selected subset of upper-right coordinates can be killed. -/
theorem triangular_coordinate_acyclic (M : Type) [AddCommGroup M] [Module ℤ M]
    [TauCeti.Comodule ℤ H₂ M] [Module.Flat ℤ M] (hM : Has M)
    (c n : ℕ) (triangular : Finset (Fin n)) (i : ℕ) (hi : 0 < i) :
    letI := TauCeti.Comodule.Corestrict (M := M) borelRestriction.toCoalgHom
    letI : Module ℤ (M ⊗[ℤ] formalRing c n triangular) := TensorProduct.instModule
    letI := TauCeti.Comodule.tensor (R := ℤ) (C := lowerBorelRing)
      (M := M) (N := formalRing c n triangular)
    Limits.IsZero (RationalCohomology.cohomology ℤ lowerBorelRing
      (M ⊗[ℤ] formalRing c n triangular) i) := sorry

/-- The adjoint powers occurring in D satisfy Theorem 4.15, including power zero. -/
theorem triangular_adjoint_acyclic (c n k : ℕ) (triangular : Finset (Fin n))
    (i : ℕ) (hi : 0 < i) :
    letI := TauCeti.Comodule.Corestrict (M := adjointPower k) borelRestriction.toCoalgHom
    letI : Module ℤ (adjointPower k ⊗[ℤ] formalRing c n triangular) := TensorProduct.instModule
    letI := TauCeti.Comodule.tensor (R := ℤ) (C := lowerBorelRing)
      (M := adjointPower k) (N := formalRing c n triangular)
    Limits.IsZero (RationalCohomology.cohomology ℤ lowerBorelRing
      (adjointPower k ⊗[ℤ] formalRing c n triangular) i) := sorry

/-- `twist_character_values`: the lower-Borel character has the fixed sign z/x. -/
example :
    letI := TauCeti.Comodule.trivial (R := ℤ) (C := lowerBorelRing) (M := ℤ)
    (twistComodule ℤ 1).coact (1 : ℤ) =
      (1 : ℤ) ⊗ₜ[ℤ] (borelCoordinate 3 * borelCoordinate 1) := sorry
example :
    letI := TauCeti.Comodule.trivial (R := ℤ) (C := lowerBorelRing) (M := ℤ)
    (twistComodule ℤ 0).coact (3 : ℤ) = (3 : ℤ) ⊗ₜ[ℤ] (1 : lowerBorelRing) := sorry
example :
    letI := TauCeti.Comodule.trivial (R := ℤ) (C := lowerBorelRing) (M := ℤ)
    (twistComodule ℤ (-1)).coact (1 : ℤ) =
      (1 : ℤ) ⊗ₜ[ℤ] (borelCoordinate 0 * borelCoordinate 4) := sorry

/-- `twist_one_nonzero`: a good untwisted module need not remain acyclic after twisting. -/
example : ¬ Limits.IsZero (borelCohomology ℤ 1 1) := sorry
/-- `twist_zero_positive`: the strict vanishing range includes untwisted positive degrees. -/
example : Limits.IsZero (borelCohomology ℤ 0 1) := sorry
/-- `twist_one_above_diagonal`: vanishing begins strictly above the twist. -/
example : Limits.IsZero (borelCohomology ℤ 1 2) := sorry
example : (character (-1) 1 : lowerBorelRing) = borelCoordinate 3 * borelCoordinate 1 := sorry
example : adjointPower 0 = ModuleCat.of ℤ ℤ := rfl
example : Module.finrank ℚ (ℚ ⊗[ℤ] adjointPower 1) = 4 := sorry
example : Module.finrank ℚ (ℚ ⊗[ℤ] adjointPower 2) = 16 := sorry

section RelationComparison
variable (c n : ℕ) (triangular : Finset (Fin n)) {r v : ℕ}
  (rows : Fin r → Matrix (Fin 2) (Fin 2) (formalRing c n triangular))
  (localSize : Fin v → ℕ)
  (Y : ∀ t, Fin (localSize t) → Matrix (Fin 2) (Fin 2) (formalRing c n triangular))
  (x : ∀ t, Fin (localSize t) → formalRing c n triangular)
  (hrows : ∀ i, (rows i).map (formalRing_borel c n triangular) = lowerBorelConjugate (rows i))
  (hY : ∀ t i, (Y t i).map (formalRing_borel c n triangular) = lowerBorelConjugate (Y t i))
  (hx : ∀ t i, formalRing_borel c n triangular (x t i) = 1 ⊗ₜ[ℤ] x t i)

/-- Theorem 4.15 applied termwise to D; DKSW Proposition 5.5(2), pp.39–40. -/
theorem fullRelationComplex_acyclic (k i : ℕ) (hi : 0 < i) :
    letI := fullRelationComplex_borel c n triangular rows localSize Y x k
    Limits.IsZero (RationalCohomology.cohomology ℤ lowerBorelRing
      ((fullRelationComplex rows localSize Y x).X k) i) := sorry

/-- The ideal generated by the local minors with index strictly less than t. -/
def relationPrefixIdeal (t : ℕ) : Ideal (formalRing c n triangular) :=
  ⨆ q : {q : Fin v // q.val < t}, BuchsbaumRim.maximalMinorIdeal (upperLocalColumns (Y q) (x q))

/-- `relation_prefix_zero`: no local minors precede the first block. -/
example : relationPrefixIdeal c n triangular localSize Y x 0 = ⊥ := sorry
/-- `relation_prefix_all`: the full prefix contains exactly the local minor ideals. -/
example : relationPrefixIdeal c n triangular localSize Y x v =
    ⨆ t : Fin v, BuchsbaumRim.maximalMinorIdeal (upperLocalColumns (Y t) (x t)) := sorry
/-- `relation_prefix_beyond`: extending a prefix past the last block adds nothing. -/
example : relationPrefixIdeal c n triangular localSize Y x (v+1) =
    relationPrefixIdeal c n triangular localSize Y x v := sorry

variable
  (hlinear :
    let I := relationPrefixIdeal c n triangular localSize Y x v
    RingTheory.Sequence.IsWeaklyRegular (formalRing c n triangular ⧸ I)
      ((List.finRange r).map fun i ↦ Ideal.Quotient.mk I (rows i 0 1)))
  (hlocal : ∀ t : Fin v,
    let π := Ideal.Quotient.mk (relationPrefixIdeal c n triangular localSize Y x t)
    BuchsbaumRim.IsRegular (upperLocalColumns (fun i ↦ (Y t i).map π) (fun i ↦ π (x t i))))

include hrows hY hx hlinear hlocal in
/-- DKSW Theorem 4.23, p.33, in the ring-augmented form of Proposition 5.5, p.39.
The upper complex is exact in positive degrees by regular local maps modulo earlier
local ideals and weak regularity of the linear rows modulo all local minors. The comparison is identity in degree zero;
all terms of D are B-acyclic. No regularity after arbitrary specialization is asserted. -/
theorem relationComplex_resolution_comparison :
    let C := upperRelationComplex (fun i ↦ rows i 0 1) localSize
      (fun t ↦ upperLocalColumns (Y t) (x t))
    let D := fullRelationComplex rows localSize Y x
    let F := relationComplex_comparison c n triangular rows localSize Y x
    (∀ k, 0 < k → Limits.IsZero (C.homology k)) ∧
    (∃ N, ∀ k, N < k → Limits.IsZero (C.X k) ∧ Limits.IsZero (D.X k)) ∧
    F.f 0 = 𝟙 (ModuleCat.of (formalRing c n triangular) (formalRing c n triangular)) ∧
    (∀ k, (fullRelationComplex_borel c n triangular rows localSize Y x k).coact ∘ₗ
        (F.f k).hom.restrictScalars ℤ =
      ((F.f k).hom.restrictScalars ℤ).rTensor lowerBorelRing ∘ₗ
        (upperRelationComplex_borel c n triangular rows localSize Y x k).coact) ∧
    (∀ k i, 0 < i →
      letI := fullRelationComplex_borel c n triangular rows localSize Y x k
      Limits.IsZero (RationalCohomology.cohomology ℤ lowerBorelRing (D.X k) i)) := sorry
end RelationComparison
end GoodFiltration

namespace RationalCohomology
open CategoryTheory IntegralRibet
attribute [local instance] TensorProduct.instModule LinearMap.module
local instance : Module ℤ lowerBorelRing := lowerBorelHopf.toAlgebra.toModule

/-- Dimension shifting along a finite exact upper complex and an acyclic lower one.
DKSW Theorem 4.22, pp.33–34. The target complex need not be exact. -/
theorem finite_comparison_zero
    (C D : ChainComplex (ModuleCat ℤ) ℕ)
    [∀ k, TauCeti.Comodule ℤ lowerBorelRing (C.X k)]
    [∀ k, TauCeti.Comodule ℤ lowerBorelRing (D.X k)]
    (hC : ∀ k, (inferInstance : TauCeti.Comodule ℤ lowerBorelRing (C.X k)).coact ∘ₗ (C.d (k+1) k).hom =
      (C.d (k+1) k).hom.rTensor lowerBorelRing ∘ₗ
        (inferInstance : TauCeti.Comodule ℤ lowerBorelRing (C.X (k+1))).coact)
    (hD : ∀ k, (inferInstance : TauCeti.Comodule ℤ lowerBorelRing (D.X k)).coact ∘ₗ (D.d (k+1) k).hom =
      (D.d (k+1) k).hom.rTensor lowerBorelRing ∘ₗ
        (inferInstance : TauCeti.Comodule ℤ lowerBorelRing (D.X (k+1))).coact)
    (F : C ⟶ D)
    (hF : ∀ k, (inferInstance : TauCeti.Comodule ℤ lowerBorelRing (D.X k)).coact ∘ₗ (F.f k).hom =
      (F.f k).hom.rTensor lowerBorelRing ∘ₗ
        (inferInstance : TauCeti.Comodule ℤ lowerBorelRing (C.X k)).coact)
    (hexact0 : Function.Surjective (C.d 1 0).hom)
    (hexact : ∀ k, Function.Exact (C.d (k+2) (k+1)).hom (C.d (k+1) k).hom)
    (hfinite : ∃ N, ∀ k, N < k → Limits.IsZero (C.X k))
    (hacyclic : ∀ k i, 0 < k → 0 < i →
      Limits.IsZero (cohomology ℤ lowerBorelRing (D.X k) i))
    (j : ℕ) (hj : 0 < j) :
    map (⟨(F.f 0).hom, by sorry⟩ : TauCeti.Comodule.Hom ℤ lowerBorelRing (C.X 0) (D.X 0)) j = 0 := sorry

/-- Naturality of the connecting map lifts invariants across a comparison of quotients.
Apply with kernels J′⊆J and identical middle term R. DKSW equation (52), p.29. -/
theorem invariant_lifting
    (J' J R Q' Q : ModuleCat ℤ)
    [TauCeti.Comodule ℤ lowerBorelRing J'] [TauCeti.Comodule ℤ lowerBorelRing J]
    [TauCeti.Comodule ℤ lowerBorelRing R] [TauCeti.Comodule ℤ lowerBorelRing Q']
    [TauCeti.Comodule ℤ lowerBorelRing Q]
    (f' : TauCeti.Comodule.Hom ℤ lowerBorelRing J' R)
    (g' : TauCeti.Comodule.Hom ℤ lowerBorelRing R Q')
    (f : TauCeti.Comodule.Hom ℤ lowerBorelRing J R)
    (g : TauCeti.Comodule.Hom ℤ lowerBorelRing R Q)
    (ι : TauCeti.Comodule.Hom ℤ lowerBorelRing J' J)
    (q : TauCeti.Comodule.Hom ℤ lowerBorelRing Q' Q)
    (hf' : Function.Injective f') (he' : Function.Exact f' g') (hg' : Function.Surjective g')
    (hf : Function.Injective f) (he : Function.Exact f g) (hg : Function.Surjective g)
    (hsq₁ : f.comp ι = f') (hsq₂ : q.comp g' = g) (hzero : map ι 1 = 0) :
    LinearMap.range (map q 0) ≤ LinearMap.range (map g 0) := sorry
end RationalCohomology

/-! ## Quantified ideal bounds -/
namespace Nilpotence
variable {A : Type u} [CommRing A]
/-- The quotient exponent multiplies the kernel exponent. -/
theorem extension (J K : Ideal A) (a b : ℕ) (hK : K^a = ⊥)
    (hJK : J^b ≤ K) : J^(a*b) = ⊥ := sorry
/-- The sharp commutative two-ideal bound, including the zero ideal cases. -/
theorem sup (I J : Ideal A) (a b : ℕ) (ha : 0 < a) (hb : 0 < b)
    (hI : I^a = ⊥) (hJ : J^b = ⊥) : (I ⊔ J)^(a+b-1) = ⊥ := sorry

theorem finite_sup {ι : Type u} [Fintype ι] (I : ι → Ideal A) (a : ι → ℕ)
    (ha : ∀ i, 0 < a i) (hI : ∀ i, (I i)^(a i) = ⊥) :
    (⨆ i, I i)^(1 + ∑ i, (a i - 1)) = ⊥ := sorry

/-- A jointly injective family detects a uniform ideal exponent. -/
theorem detected {ι : Type u} {B : ι → Type u} [∀ i, CommRing (B i)]
    (f : ∀ i, A →+* B i) (hinj : Function.Injective (fun a i => f i a))
    (J : Ideal A) (n : ℕ) (hJ : ∀ i, (J.map (f i))^n = ⊥) : J^n = ⊥ := sorry

/-- The finite product exponent is the maximum, with exponent one for empty input. -/
theorem product {ι : Type u} [Fintype ι] {B : ι → Type u} [∀ i, CommRing (B i)]
    (f : ∀ i, A →+* B i) (a : ι → ℕ)
    (hinj : Function.Injective (fun x i => f i x))
    (I : Ideal A) (ha : ∀ i, 0 < a i) (hI : ∀ i, (I.map (f i))^(a i) = ⊥) :
    I^(1 + Finset.univ.sup (fun i => a i - 1)) = ⊥ := sorry

/-- The module-filtration exponent adds, rather than multiplying. -/
theorem submodule_extension {M : Type u} [AddCommGroup M] [Module A M]
    (J : Ideal A) (N : Submodule A M) (a b : ℕ)
    (hsub : ∀ r ∈ J^a, ∀ x ∈ N, r • x = (0 : M))
    (hquot : ∀ r ∈ J^b, ∀ x : M, r • x ∈ N) :
    ∀ r ∈ J^(a+b), ∀ x : M, r • x = 0 := sorry

/-- The two coefficient errors are measured after the supplied comparison. -/
theorem comparison {B C : Type u} [CommRing B] [CommRing C]
    (f : A →+* B) (g : A →+* C) (I : Ideal B) (J : Ideal C)
    (a b c : ℕ) (hb : 0 < b) (hc : 0 < c)
    (hker : (RingHom.ker f ⊓ RingHom.ker g)^a = ⊥)
    (hI : I^b = ⊥) (hJ : J^c = ⊥) :
    (I.comap f ⊓ J.comap g)^(a * max b c) = ⊥ := sorry

/-- Separatedness detects a uniform bound in all coefficient quotients. -/
theorem inverse_limit (K : ℕ → Ideal A) (hsep : ⨅ r, K r = ⊥)
    (J : Ideal A) (n : ℕ)
    (hn : ∀ r, (J.map (Ideal.Quotient.mk (K r)))^n = ⊥) : J^n = ⊥ := sorry

example (I J : Ideal A) (hI : I^2 = ⊥) (hJ : J^3 = ⊥) : (I ⊔ J)^4 = ⊥ := sorry
example (J K : Ideal A) (hK : K^2 = ⊥) (hJ : J^3 ≤ K) : J^6 = ⊥ := sorry
example : (Ideal.span {(2 : ZMod 8)})^3 = ⊥ ∧
    (Ideal.span {(2 : ZMod 8)})^2 ≠ ⊥ := sorry
end Nilpotence

namespace Theorems
variable {A : Type u} [CommRing A]
/-- PadicMeasuresIwasawaAlgebras §4.5 supplies `TauCeti.fittingIdeal_le_annihilator`
in TauCeti/RingTheory/FittingIdeal, for finite modules over arbitrary commutative rings.
`fittingIdeal_le_annihilator_cyclic`: the cyclic annihilator is its defining ideal. -/
example : Module.annihilator ℤ (ZMod 6) = Ideal.span {(6 : ℤ)} := sorry
/-- `fittingIdeal_le_annihilator_strict`: the inclusion can be strict. -/
example : TauCeti.fittingIdeal ℤ (ZMod 2 × ZMod 2) 0 = Ideal.span {(4 : ℤ)} ∧
    Module.annihilator ℤ (ZMod 2 × ZMod 2) = Ideal.span {(2 : ℤ)} := sorry
/-- `fittingIdeal_le_annihilator_zero`: both ideals are the unit ideal. -/
example : TauCeti.fittingIdeal A (Fin 0 → A) 0 = ⊤ ∧
    Module.annihilator A (Fin 0 → A) = ⊤ := sorry
end Theorems


namespace Determinant
variable {A R : Type u} [CommRing A] [Ring R] [Algebra A R]
/-- SchemeAndStackFoundations §2.22 supplies `IsAzumaya.exists_etale_matrix_splitting`,
including the finite affine cover adapter, in the neutral ring-theory API.
These are its determinant-consumer checks (Brauer I, Theorem 5.1, p.210).
`exists_etale_matrix_splitting_matrix`: split matrices admit the required cover. -/
example (d : ℕ) (hd : 0 < d) :
    ∃ B : CommAlgCat.{u} A, Algebra.Etale A B ∧ Module.FaithfullyFlat A B ∧
      Nonempty ((B ⊗[A] Matrix (Fin d) (Fin d) A) ≃ₐ[B] Matrix (Fin d) (Fin d) B) := sorry
/-- `exists_etale_matrix_splitting_quaternion_complex`: extension splits Hamilton quaternions. -/
example : Nonempty ((ℂ ⊗[ℝ] Quaternion ℝ) ≃ₐ[ℂ] Matrix (Fin 2) (Fin 2) ℂ) := sorry
/-- `exists_etale_matrix_splitting_quaternion_real`: splitting need not exist over the base. -/
example : ¬ Nonempty (Quaternion ℝ ≃ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℝ) := sorry
end Determinant

/-! ## Unit tests: fixtures -/

namespace Fixtures
open CategoryTheory
variable (A : Type u) [CommRing A]
local instance : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
def degreeZero : DerivedCategory (ModuleCat.{u} A) :=
  (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)
def degreeZeroChain : CochainComplex (ModuleCat.{u} A) ℤ :=
  (HomologicalComplex.single (ModuleCat.{u} A) (.up ℤ) 0).obj (ModuleCat.of A A)
def degreeZeroHomotopy : HomotopyCategory (ModuleCat.{u} A) (.up ℤ) :=
  (HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).obj (degreeZeroChain A)
/-- The two-term complex A --1→ A, placed in degrees zero and one. -/
def contractible : CochainComplex (ModuleCat.{u} A) ℤ := sorry
/-- Both nonzero objects are A and the differential between them is the identity. -/
theorem contractible_spec :
  Nonempty ((contractible A).X 0 ≅ ModuleCat.of A A) ∧
  Nonempty ((contractible A).X 1 ≅ ModuleCat.of A A) ∧
  ∃ (e₀ : (contractible A).X 0 ≅ ModuleCat.of A A)
    (e₁ : (contractible A).X 1 ≅ ModuleCat.of A A),
    e₀.inv ≫ (contractible A).d 0 1 ≫ e₁.hom=𝟙 _ ∧
      ∀ i : ℤ, i≠0 → i≠1 → Limits.IsZero ((contractible A).X i) := sorry
variable {A}
def scalarRepresentation {G : Type u} [Group G] (χ : G →* Aˣ) :
    MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A :=
  (Algebra.ofId A (Matrix (Fin 2) (Fin 2) A)).comp ((MonoidAlgebra.lift A A _ ((Units.coeHom A).comp χ)))
/-- Integral upper-unipotent representation of the additive integers. -/
def upperUnipotent : MonoidAlgebra ℤ (Multiplicative ℤ) →ₐ[ℤ] Matrix (Fin 2) (Fin 2) ℤ := sorry
theorem upperUnipotent_apply (n : ℤ) :
  upperUnipotent (MonoidAlgebra.of ℤ (Multiplicative ℤ) (Multiplicative.ofAdd n))=!![1,n;0,1] := sorry
/-- The specified basis of the initial upper-unipotent quotient. -/
def upperUnipotentInitial : IntegralRibet.initialModule upperUnipotent 1 1 ≃ₗ[ℤ] ℤ := sorry

/-- The basis is normalized by the class of `ρ(1) − 1 = E₀₁`, which goes to `1` (not `−1`). -/
theorem upperUnipotentInitial_symm_one :
    upperUnipotentInitial.symm 1 =
      IntegralRibet.differenceClass upperUnipotent 1 1 (Multiplicative.ofAdd 1) := sorry
def emptyLocal (G : Type u) [Group G] : IntegralRibet.LocalData G where
  count := 0
  sigma := ∅
  subgroup := Fin.elim0
  inertia := Fin.elim0
  inertia_le := by intro v; exact v.elim0
  distinguished := none
  distinguished_mem := by intro v; exact v.elim0
  distinguished_exists := sorry
def fullLocal (G : Type u) [Group G] : IntegralRibet.LocalData G where
  count := 1
  sigma := {0}
  subgroup := fun _ ↦ ⊤
  inertia := fun _ ↦ ⊥
  inertia_le := sorry
  distinguished := some 0
  distinguished_mem := sorry
  distinguished_exists := sorry
def extraLocal (G : Type u) [Group G] : IntegralRibet.LocalData G where
  count := 2
  sigma := Finset.univ
  subgroup := fun _ ↦ ⊥
  inertia := fun _ ↦ ⊥
  inertia_le := sorry
  distinguished := some 0
  distinguished_mem := sorry
  distinguished_exists := sorry
end Fixtures

namespace Fixtures
open CategoryTheory
variable (A : Type u) [CommRing A]
local instance : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
def scalarDerived : A →ₐ[A] End (degreeZero A) := Algebra.ofId A _
def scalarChain : A →ₐ[A] End (degreeZeroChain A) := Algebra.ofId A _
def scalarHomotopy : A →ₐ[A] End (degreeZeroHomotopy A) := Algebra.ofId A _
end Fixtures

namespace Fixtures
variable {A : Type u} [CommRing A]
/-- Constant rank-one character representation. -/
def rankOne {G : Type u} [Group G] (χ : G →* Aˣ) :
    MonoidAlgebra A G →ₐ[A] Matrix (Fin 1) (Fin 1) A :=
  (Algebra.ofId A _).comp ((MonoidAlgebra.lift A A _ ((Units.coeHom A).comp χ)))
end Fixtures

namespace Determinant
variable {A G : Type u} [CommRing A] [Group G] {d : ℕ}
def twist (D : Determinant A (MonoidAlgebra A G) d) (θ : G →* Aˣ) :
    Determinant A (MonoidAlgebra A G) d :=
  D.comap (MonoidAlgebra.lift A (MonoidAlgebra A G) G
    { toFun := fun g ↦ (↑(θ g) : A) • MonoidAlgebra.of A G g
      map_one' := sorry
      map_mul' := sorry })
end Determinant
namespace Fixtures
open CategoryTheory
variable (A : Type u) [CommRing A]
def matrixGMA (s : ℕ) : GMA.Data A (Matrix (Fin s) (Fin s) A) s (fun _ ↦ 1) where
  size_pos := by intro i; decide
  idempotent := fun i ↦ Matrix.single i i 1
  idem := sorry
  orthogonal := sorry
  sum_one := sorry
  diagonal := fun i ↦
    { toFun := fun x ↦ Matrix.of fun _ _ ↦ x.1 i i
      invFun := fun y ↦ ⟨y 0 0 • Matrix.single i i 1, by sorry⟩
      left_inv := sorry
      right_inv := sorry
      map_mul' := sorry
      map_add' := sorry
      commutes' := sorry }
  trace := Matrix.traceLinearMap (Fin s) A A
  trace_cyclic := sorry
  trace_diagonal := sorry
/-- Matrix units are elements of the corresponding rank-one entry modules. -/
theorem matrix_entry_mem (s : ℕ) (i j : Fin s) (a : A) :
    Matrix.single i j a ∈ GMA.entryModule (matrixGMA A s) i j := sorry

def oneBlockGMA (d : ℕ) (hd : 0 < d) : GMA.Data A (Matrix (Fin d) (Fin d) A) 1 (fun _ ↦ d) where
  size_pos := fun _ ↦ hd
  idempotent := fun _ ↦ 1
  idem := sorry
  orthogonal := sorry
  sum_one := sorry
  diagonal := fun _ ↦
    { toFun := fun x ↦ x.1
      invFun := fun y ↦ ⟨y, by sorry⟩
      left_inv := sorry
      right_inv := sorry
      map_mul' := sorry
      map_add' := sorry
      commutes' := sorry }
  trace := Matrix.traceLinearMap (Fin d) A A
  trace_cyclic := sorry
  trace_diagonal := sorry
/-- The matrix order with the indicated off-diagonal entry in J. -/
def matrixOrder (J : Ideal A) (upper : Bool) : Subalgebra A (Matrix (Fin 2) (Fin 2) A) where
  carrier := {M | (if upper then M 0 1 else M 1 0) ∈ J}
  algebraMap_mem' := sorry
  zero_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  mul_mem' := sorry
def orderGMA (J : Ideal A) (upper : Bool) : GMA.Data A (matrixOrder A J upper) 2 (fun _ ↦ 1) where
  size_pos := by intro i; decide
  idempotent := fun i ↦ ⟨Matrix.single i i 1, sorry⟩
  idem := sorry
  orthogonal := sorry
  sum_one := sorry
  diagonal := fun i ↦
    { toFun := fun x ↦ Matrix.of fun _ _ ↦ (x.1 : Matrix (Fin 2) (Fin 2) A) i i
      invFun := fun y ↦ ⟨⟨y 0 0 • Matrix.single i i 1, by sorry⟩, by sorry⟩
      left_inv := sorry
      right_inv := sorry
      map_mul' := sorry
      map_add' := sorry
      commutes' := sorry }
  trace := (Matrix.traceLinearMap (Fin 2) A A).comp (matrixOrder A J upper).val.toLinearMap
  trace_cyclic := sorry
  trace_diagonal := sorry
/-- The two ordered diagonal residual constituents of the triangular algebra. -/
def triangularResidualData (k : Type u) [Field k] :
    GMA.ResidualData (orderGMA k ⊥ false) := sorry
/-- Upper triangular blocks have zero return-product ideal for the discrete partition. -/
theorem triangular_partition (A : Type u) [CommRing A] :
    GMA.partitionReducibilityIdeal (orderGMA A ⊥ false) id ≤ ⊥ := sorry

/-- Every upper triangular matrix belongs to the upper triangular order. -/
theorem upper_mem (J : Ideal A) (a b c : A) :
    (!![a,b;0,c] : Matrix (Fin 2) (Fin 2) A) ∈ matrixOrder A J false := by
  change (0 : A) ∈ J
  exact J.zero_mem

/-- The actual rank-one quotient matrix module, with i selecting its diagonal entry. -/
def upperConstituent (k : Type u) [Field k] (i : Fin 2) :
    ModuleCat.{u} ((k ⧸ (⊥ : Ideal k)) ⊗[k] matrixOrder k ⊥ false) :=
  GMA.quotientConstituent (orderGMA k ⊥ false) id i (by simp) ⊥ (triangular_partition k)
/-- Iwahori units act on the standard integral lattice A². -/
def iwahoriDiagonal [IsLocalRing A] (i : Fin 2) :
    (matrixOrder A (IsLocalRing.maximalIdeal A) false)ˣ →*
      (IsLocalRing.ResidueField A)ˣ where
  toFun g := Units.mk0 (IsLocalRing.residue A (g.val.val i i)) (by sorry)
  map_one' := sorry
  map_mul' := sorry
def iwahoriUpperUnipotent (J : Ideal A) : (matrixOrder A J false)ˣ where
  val := ⟨!![1,1;0,1], by sorry⟩
  inv := ⟨!![1,-1;0,1], by sorry⟩
  val_inv := by sorry
  inv_val := by sorry

/-- Actual split diagonal determinant on A×A. -/
def productDeterminant : Determinant A (A × A) 2 :=
  ((Determinant.dimOneEquiv).symm (AlgHom.fst A A A)).mul
    ((Determinant.dimOneEquiv).symm (AlgHom.snd A A A))
/-- The identity determinant and the matrix determinant are Cayley–Hamilton. -/
theorem identity_ch : ((Determinant.dimOneEquiv).symm (AlgHom.id A A)).IsCayleyHamilton := sorry

theorem matrix_ch (d : ℕ) :
    (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).IsCayleyHamilton := sorry

/-- The product law on the split diagonal algebra is Cayley–Hamilton. -/
theorem product_ch : (productDeterminant A).IsCayleyHamilton := sorry

/-- The two standard coordinate projections are idempotent matrices. -/
theorem diagonal_three_idem :
    (Matrix.diagonal ![1,1,0] : Matrix (Fin 3) (Fin 3) A) * Matrix.diagonal ![1,1,0] =
      Matrix.diagonal ![1,1,0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_three]

theorem diagonal_two_idem :
    (Matrix.diagonal ![1,0] : Matrix (Fin 2) (Fin 2) A) * Matrix.diagonal ![1,0] =
      Matrix.diagonal ![1,0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- The first matrix unit lies in the first coordinate corner. -/
theorem diagonal_corner_mem (a : A) :
    Matrix.single 0 0 a ∈ TauCeti.cornerSubmodule A
      (Matrix.diagonal ![1,0] : Matrix (Fin 2) (Fin 2) A) (Matrix.diagonal ![1,0]) := sorry

local instance : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)

/-- The first biproduct projection is idempotent in the endomorphism ring. -/
theorem biprod_idem (C : DerivedCategory (ModuleCat.{u} A)) :
    let e : End (C ⊞ C) := Limits.biprod.fst ≫ Limits.biprod.inl
    e * e = e := by
  dsimp
  simp [Category.assoc]

/-- Diagonal sign change in the Iwahori order. -/
def iwahoriSign : (matrixOrder ℚ (IsLocalRing.maximalIdeal ℚ) false)ˣ where
  val := ⟨!![-1,0;0,1], upper_mem ℚ _ _ _ _⟩
  inv := ⟨!![-1,0;0,1], upper_mem ℚ _ _ _ _⟩
  val_inv := sorry
  inv_val := sorry

/-- The split rank-one matrix group, using its pinned coordinate Hopf algebra. -/
def torusCoordinates : InvariantCoordinateInput A :=
  TauCeti.GeneralLinear.coordinateHopfAlgebra A 1
/-- GL₀ is the trivial affine group scheme, including over the zero ring. -/
def trivialCoordinates : InvariantCoordinateInput A :=
  TauCeti.GeneralLinear.coordinateHopfAlgebra A 0
variable {A}
/-- `GL₁`-pseudocharacters are characters: the character is the value of the arity-one
evaluation on the coordinate `x` of `GL₁` (Emerson–Morel Theorem 4.1 for `d = 1`). -/
def torusEquiv {G : Type u} [Group G] :
    ReductivePseudocharacter G (torusCoordinates A) A ≃ (G →* Aˣ) := sorry

/-- The coordinate of GL₁ is invariant under conjugation. -/
theorem torus_coordinate_mem :
    Algebra.TensorProduct.includeRight
      (TauCeti.GeneralLinear.genericMatrix A 1 0 0 :
        TauCeti.GeneralLinear.coordinateHopfAlgebra A 1) ∈
      InvariantCoordinateInput.ring (torusCoordinates A) 1 := sorry

/-- The torus equivalence evaluates the coordinate function, not its inverse. -/
theorem torusEquiv_apply {G : Type u} [Group G]
    (Θ : ReductivePseudocharacter G (torusCoordinates A) A) (g : G) :
    ((torusEquiv Θ g : Aˣ) : A) =
      Θ.theta 1 ⟨Algebra.TensorProduct.includeRight
        (TauCeti.GeneralLinear.genericMatrix A 1 0 0 :
          TauCeti.GeneralLinear.coordinateHopfAlgebra A 1), torus_coordinate_mem⟩ ![g] := sorry
/-- Invertible upper-unipotent matrices, retaining their specified coefficients. -/
def unipotentUnits (K : Type) [Field K] : Multiplicative ℤ →* (Matrix (Fin 2) (Fin 2) K)ˣ where
  toFun := fun g ↦
    { val := !![1,(g.toAdd : K);0,1]
      inv := !![1,-(g.toAdd : K);0,1]
      val_inv := sorry
      inv_val := sorry }
  map_one' := sorry
  map_mul' := sorry
end Fixtures

/-! ## Unit tests -/

namespace Tests
open CategoryTheory
local instance {A : Type u} [CommRing A] : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
local instance {T : Type u} [CommRing T] (m : Ideal T) [m.IsMaximal] : Field (T ⧸ m) :=
  Ideal.Quotient.field m
variable {A : Type u} [CommRing A] {R : Type u} [Ring R] [Algebra A R] {d : ℕ}

/-- `homogeneous_id`: The identity law is homogeneous of degree 1. -/
example : PolynomialLaw.IsHomogeneousOfDegree 1 (PolynomialLaw.id : A →ₚₗ[A] A) := sorry

/-- `homogeneous_zero`: The zero law is homogeneous of degree n for all n. -/
example (n : ℕ) : PolynomialLaw.IsHomogeneousOfDegree n (0 : A →ₚₗ[A] A) := sorry

/-- `multiplicative_id`: The identity law is multiplicative. -/
example : PolynomialLaw.IsMultiplicative (PolynomialLaw.id : A →ₚₗ[A] A) := sorry

/-- `multiplicative_det`: The matrix determinant law M_d(A) → A is multiplicative. -/
example (d : ℕ) : PolynomialLaw.IsMultiplicative (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).toLaw := sorry

/-- `multiplicative_two_smul`: 2 • id is not multiplicative over a ring of characteristic zero. -/
example [Nontrivial A] [NoZeroDivisors A] [CharZero A] : ¬ PolynomialLaw.IsMultiplicative ((2 : A) • (PolynomialLaw.id : A →ₚₗ[A] A)) := sorry

/-- The zero law preserves products but is not unital on a nonzero ring. -/
example [Nontrivial A] :
    (∀ x y : A, (0 : A →ₚₗ[A] A).ground (x*y) =
      (0 : A →ₚₗ[A] A).ground x * (0 : A →ₚₗ[A] A).ground y) ∧
      ¬ PolynomialLaw.IsMultiplicative (0 : A →ₚₗ[A] A) := sorry

/-- `det_matrix`: eval (ofMatrix id) M = det M. -/
example (d : ℕ) (M : Matrix (Fin d) (Fin d) A) : (Determinant.ofMatrix (AlgHom.id A _)).eval M=M.det := sorry

/-- `det_dim_zero`: A determinant of dimension 0 is constant 1. -/
example (D : Determinant A R 0) (x : R) : D.eval x=1 := sorry

/-- `det_trace_not_injective`: Over (ℤ/p)[X] two different p-dimensional determinants have the same trace. -/
example (p : ℕ) [Fact p.Prime] : ∃ D E : Determinant (Polynomial (ZMod p)) (Polynomial (Polynomial (ZMod p))) p, D.traceLinear=E.traceLinear ∧ D≠E := sorry

/-- `charpoly_one`: χ(1, t) = (t − 1)^d. -/
example (D : Determinant A R d) : D.charpoly 1=(X-1)^d := sorry

/-- `charpoly_ofMatrix`: For det ∘ ρ it is Matrix.charpoly (ρ x). -/
example (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) : (Determinant.ofMatrix ρ).charpoly x=Matrix.charpoly (ρ x) := sorry

/-- `trace_ofMatrix`: For det ∘ ρ, Tr = matrix trace. -/
example (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) : (Determinant.ofMatrix ρ).trace x=Matrix.trace (ρ x) := sorry

/-- `ofMatrix_id`: ofMatrix id on M_d(A) evaluates to det. -/
example (d : ℕ) (M : Matrix (Fin d) (Fin d) A) : (Determinant.ofMatrix (AlgHom.id A _)).eval M=M.det := sorry

/-- `ofMatrix_trace`: Its trace is the matrix trace. -/
example (d : ℕ) (M : Matrix (Fin d) (Fin d) A) : (Determinant.ofMatrix (AlgHom.id A _)).trace M=Matrix.trace M := sorry

/-- `ofMatrix_block`: A block-diagonal representation gives the product determinant. -/
example (a b : A) : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 2) (Fin 2) A))).eval !![a,0;0,b]=a*b := sorry

/-- `mul_block`: ofMatrix of a block sum is the product. -/
example (D E : Determinant A R 1) (x : R) : (D.mul E).charpoly x=D.charpoly x*E.charpoly x := sorry

/-- `mul_trace`: Traces add. -/
example {e : ℕ} (D : Determinant A R d) (E : Determinant A R e) (x : R) : (D.mul E).trace x=D.trace x+E.trace x := sorry

/-- `mul_dim_zero`: Multiplying by the dimension-0 determinant changes nothing. -/
example (D : Determinant A R d) (E : Determinant A R 0) (x : R) : (D.mul E).eval x=D.eval x := sorry

/-- `comap_id`: Restriction along the identity. -/
example (D : Determinant A R d) : D.comap (AlgHom.id A R)=D := sorry

/-- `comap_ofMatrix`: Restriction of det ∘ ρ is det ∘ (ρ ∘ φ). -/
example (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (φ : A →ₐ[A] R) : (Determinant.ofMatrix ρ).comap φ=Determinant.ofMatrix (ρ.comp φ) := sorry

/-- `comap_subgroup`: Restriction to a subgroup H ≤ G. -/
example {G : Type u} [Group G] (H : Subgroup G) (D : Determinant A (MonoidAlgebra A G) d) (φ : MonoidAlgebra A H →ₐ[A] MonoidAlgebra A G) (hφ : ∀ h : H, φ (MonoidAlgebra.of A H h)=MonoidAlgebra.of A G h) (h : H) : (D.comap φ).eval (MonoidAlgebra.of A H h)=D.eval (MonoidAlgebra.of A G h) := sorry

/-- `baseChange_self`: Base change to A is D. -/
example (D : Determinant A R d) (x : R) : (D.baseChange A).eval (1 ⊗ₜ[A] x)=D.eval x := sorry

/-- `baseChange_ofMatrix`: Base change of det ∘ ρ. -/
example {B : Type u} [CommRing B] [Algebra A B] (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) : ((Determinant.ofMatrix ρ).baseChange B).eval (1 ⊗ₜ[A] x)=algebraMap A B (Matrix.det (ρ x)) := sorry

/-- `baseChange_trans`: Transitivity. -/
example {B C : Type u} [CommRing B] [CommRing C] [Algebra A B] [Algebra B C] [Algebra A C] [IsScalarTower A B C] (D : Determinant A R d) (x : R) : ((D.baseChange B).baseChange C).eval (1 ⊗ₜ[B] (1 ⊗ₜ[A] x))=algebraMap A C (D.eval x) := sorry

/-- `pseudo_matrix_trace`: tr on M_d(A) is a d-dimensional pseudocharacter. -/
example (d : ℕ) : IsPseudocharacter d (Matrix.traceLinearMap (Fin d) A A) := sorry

/-- `pseudo_wrong_dim`: tr on M_2(ℚ) is not 1-dimensional. -/
example : ¬ IsPseudocharacter 1 (Matrix.traceLinearMap (Fin 2) ℚ ℚ) := sorry

/-- `pseudo_id`: id : ℚ → ℚ is a 1-dimensional pseudocharacter. -/
example : IsPseudocharacter 1 (LinearMap.id : ℚ →ₗ[ℚ] ℚ) := sorry

/-- `ofLinearMap_id`: ofLinearMap id is PolynomialLaw.id. -/
example : PolynomialLaw.ofLinearMap (LinearMap.id : A →ₗ[A] A)=(PolynomialLaw.id : A →ₚₗ[A] A) := sorry

/-- `ofLinearMap_ground`: Its value map is ℓ. -/
example (f : R →ₗ[A] A) : (PolynomialLaw.ofLinearMap f).ground=f := sorry

/-- `ofLinearMap_zero`: ofLinearMap 0 is the zero law. -/
example : PolynomialLaw.ofLinearMap (0 : R →ₗ[A] A)=(0 : R →ₚₗ[A] A) := sorry

/-- `ker_id`: The identity law is faithful. -/
example : PolynomialLaw.IsFaithful (PolynomialLaw.id : A →ₚₗ[A] A) := sorry

/-- `ker_zero`: The zero law has kernel everything. -/
example : PolynomialLaw.ker (0 : A →ₚₗ[A] A)=⊤ := sorry

/-- `ker_upper_triangular`: On upper-triangular 2 × 2 matrices the determinant is not faithful. -/
example [Nontrivial A] : ∃ S : Subalgebra A (Matrix (Fin 2) (Fin 2) A),
    (∀ M ∈ S, M 1 0=0) ∧
    ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).IsCayleyHamilton ∧
    ¬ PolynomialLaw.IsFaithful ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).toLaw := sorry

/-- `ker_det_matrix`: For d>0, det on M_d(A) is faithful; the d=0 matrix algebra is the zero ring. -/
example (d : ℕ) (hd : 0 < d) : PolynomialLaw.IsFaithful (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).toLaw := sorry

/-- `ker_dim_zero`: In dimension 0 the kernel is everything. -/
example (D : Determinant A R 0) : D.kerTwoSided=⊤ := sorry

/-- `ker_upper_triangular_ideal`: On upper-triangular matrices it is the strictly upper-triangular ideal. -/
example [Nontrivial A] : ∃ S : Subalgebra A (Matrix (Fin 2) (Fin 2) A),
    (∀ M : Matrix (Fin 2) (Fin 2) A, M ∈ S ↔ M 1 0=0) ∧
    ∀ x : S, x ∈ ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).kerTwoSided ↔ x.val 0 0=0 ∧ x.val 1 1=0 := sorry

/-- `chi_matrix`: For det on M_d(A), χ is the zero law (Cayley–Hamilton). -/
example (d : ℕ) : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).charpolyLaw=0 := sorry

/-- `chi_dim_one`: In dimension one χ(r) = r − D(r). -/
example (D : Determinant A R 1) (x : R) : D.charpolyLaw.ground x=x-algebraMap A R (D.eval x) := sorry

/-- `chi_one`: χ(1) = (1 − 1)^d = 0 for d ≥ 1. -/
example (D : Determinant A R d) (hd : 0 < d) : D.charpolyLaw.ground 1=0 := sorry

/-- `continuous_discrete`: On a discrete group every determinant is continuous. -/
example {G : Type u} [Group G] [TopologicalSpace G] [DiscreteTopology G] [TopologicalSpace A] (D : Determinant A (MonoidAlgebra A G) d) : D.IsContinuous := sorry

/-- `continuous_ofMatrix`: det ∘ ρ is continuous for continuous ρ. -/
example {G : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace A] [IsTopologicalRing A] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A) (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of A G g))) : (Determinant.ofMatrix ρ).IsContinuous := sorry

/-- `continuous_not`: over a topological ring, a one-dimensional determinant whose character is
discontinuous is not continuous (its constant coefficient is minus the character). -/
example {G : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace A] [IsTopologicalRing A] (D : Determinant A (MonoidAlgebra A G) 1) (h : ¬ Continuous (fun g : G ↦ D.eval (MonoidAlgebra.of A G g))) : ¬ D.IsContinuous := sorry

/-- `continuous_not_without_ring_topology`: without continuity of negation the previous check
fails. On `ℤ` with the upper-set topology (negation discontinuous) and `ZMod 2` with only the
nonidentity point open, the sign character is discontinuous while its negative, the only
nonconstant coefficient of the determinant, is continuous. -/
example :
    let τA : TopologicalSpace ℤ := TopologicalSpace.generateFrom {U | ∃ k : ℤ, U = Set.Ici k}
    let τG : TopologicalSpace (Multiplicative (ZMod 2)) :=
      TopologicalSpace.generateFrom {{Multiplicative.ofAdd 1}}
    let χ : Multiplicative (ZMod 2) →* ℤˣ :=
      { toFun := fun g ↦ if g = 1 then 1 else -1, map_one' := by simp, map_mul' := by decide }
    let D := Determinant.dimOneEquiv.symm
      (MonoidAlgebra.lift ℤ ℤ (Multiplicative (ZMod 2)) ((Units.coeHom ℤ).comp χ))
    ¬ @Continuous _ _ τG τA (fun g ↦ D.eval (MonoidAlgebra.of ℤ _ g)) ∧
      @Determinant.IsContinuous ℤ _ _ _ τG τA 1 D := sorry

/-- `ch_matrix`: CH(det) = 0 on M_d(A). -/
example (d : ℕ) : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).chIdeal=⊥ := sorry

/-- `ch_upper_triangular`: CH = 0 on every subalgebra of two-by-two matrices. -/
example (S : Subalgebra A (Matrix (Fin 2) (Fin 2) A)) : ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).chIdeal=⊥ := sorry

/-- `ch_dim_one`: In dimension one CH(D) is generated by the r − D(r). -/
example (D : Determinant A R 1) : D.chIdeal=TwoSidedIdeal.span {z | ∃ x : R, z=x-algebraMap A R (D.eval x)} := sorry

/-- `ch_matrix_det`: (M_d(A), det) is Cayley–Hamilton. -/
example (d : ℕ) : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).IsCayleyHamilton := sorry

/-- `ch_faithful`: A faithful determinant is Cayley–Hamilton. -/
example (D : Determinant A R d) (hD : PolynomialLaw.IsFaithful D.toLaw) : D.IsCayleyHamilton := sorry

/-- `derived_image_zero_object`: For C=0, the image is the zero ring. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (hC : Limits.IsZero C) : Subsingleton (((Algebra.ofId A (End C))).range) := sorry

/-- `derived_image_scalar`: For C=A in degree zero and its scalar action, T_der(C)≅A. -/
example : Nonempty (((Fixtures.scalarDerived A)).range ≃ₐ[A] A) := sorry

/-- `derived_image_kernel`: For H→A acting on A in degree zero, T_der(C)≅H/ker(H→A). -/
example {H : Type u} [CommRing H] [Algebra A H] (φ : H →ₐ[A] A) : Nonempty ((((Fixtures.scalarDerived A).comp φ)).range ≃ₐ[A] H ⧸ RingHom.ker φ.toRingHom) := sorry

/-- `ghost_single_degree`: If C has cohomology in one degree, G(C)=0. -/
example {M : Type u} [AddCommGroup M] [Module A M] (n : ℤ) : HeckeImage.ghostIdeal ((DerivedCategory.singleFunctor (ModuleCat.{u} A) n).obj (ModuleCat.of A M))=⊥ := sorry

/-- `ghost_ext_example`: For C=(Z/p)⊕(Z/p)[−1], an off-diagonal nonzero class in Ext¹_Z(Z/p,Z/p) defines a nonzero ghost f with f²=0. -/
example (p : ℕ) [Fact p.Prime] :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ (ZMod p)) ⊞
      (DerivedCategory.singleFunctor (ModuleCat ℤ) 1).obj (ModuleCat.of ℤ (ZMod p))
    ∃ f : End C, f≠0 ∧ f∈HeckeImage.ghostIdeal C ∧ f*f=0 := sorry

/-- `ghost_kernel_image`: For a scalar action on A in degree zero, J(C)=0 and T_coh(C)=T_der(C). -/
example : HeckeImage.imageGhostIdeal (Fixtures.degreeZero A) (Fixtures.scalarDerived A)=⊥ := sorry

/-- `localized_zero`: If H^*(C)_m=0 then C_m=0. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) (h : ∀ i : ℤ, (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map e=0) : Limits.IsZero (HeckeImage.localizedComplex C e he) := sorry

/-- `localized_product`: For T=A×A acting diagonally on C=A⊕A in degree zero, the two summands are the two copies of A. -/
example : let C := Fixtures.degreeZero A ⊞ Fixtures.degreeZero A
    let e : End C := Limits.biprod.fst ≫ Limits.biprod.inl
    Nonempty (HeckeImage.localizedComplex C e (Fixtures.biprod_idem A (Fixtures.degreeZero A)) ≅ Fixtures.degreeZero A) := sorry

/-- `localized_homology`: For C=M in degree zero, C_m is the usual module localization M_m in degree zero. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) : Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) 0).obj (HeckeImage.localizedComplex C e he) ≅ ModuleCat.of A (LinearMap.range ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) 0).map e).hom)) := sorry

/-- `gln_one`: For n=1 the polynomial is X−T_1. -/
example (q t : A) : Spherical.glnPolynomial 1 q ![1,t]=X-C t := sorry

/-- `gln_two`: For n=2 it is X²−T_1X+qT_2. -/
example (q s t : A) : Spherical.glnPolynomial 2 q ![1,s,t]=X^2-C s*X+C (q*t) := sorry

/-- `gln_coefficients`: A homomorphism A→B transports P coefficient by coefficient, without choosing √q. -/
example {B : Type u} [CommRing B] (φ : A →+* B) (n : ℕ) (q : A) (T : Fin (n+1) → A) : (Spherical.glnPolynomial n q T).map φ=Spherical.glnPolynomial n (φ q) (φ ∘ T) := sorry

/-- `spin_one_parameters`: For q=T_0=1,T_1=4,T_2=4, Q=(X−1)⁴. -/
example : Spherical.gsp4SpinPolynomial (1 : A) 1 4 4=(X-1)^4 := sorry

/-- `spin_constant`: The constant term is the square of q³T_0. -/
example (q t₀ t₁ t₂ : A) : (Spherical.gsp4SpinPolynomial q t₀ t₁ t₂).coeff 0=(q^3*t₀)^2 := sorry

/-- `spin_not_gln`: Its X² coefficient contains (q³+q)T_0, so it is not the GL4 polynomial with the same three symbols. -/
example : (Spherical.gsp4SpinPolynomial (2 : ℤ) 1 0 0).coeff 2=10 := sorry

/-- `dual_spin_q_one`: For q=T_0=1, P=Q. -/
example (t₁ t₂ : A) : Spherical.gsp4DualSpinPolynomial (1 : A) 1 t₁ t₂=Spherical.gsp4SpinPolynomial 1 1 t₁ t₂ := sorry

/-- `dual_spin_roots`: For roots β_j of Q, P has roots q³β_j^{-1}. -/
example {K : Type u} [Field K] (q t₀ : Kˣ) (t₁ t₂ β : K) (hβ : β≠0) (h : (Spherical.gsp4SpinPolynomial (q : K) t₀ t₁ t₂).eval β=0) : (Spherical.gsp4DualSpinPolynomial (q : K) t₀ t₁ t₂).eval ((q : K)^3/β)=0 := sorry

/-- `dual_spin_central`: If T_0 is not fixed to 1, P and Q have different X³ coefficients, −T_1/T_0 and −T_1. -/
example (q t₁ t₂ : A) (t₀ : Aˣ) : (Spherical.gsp4DualSpinPolynomial q t₀ t₁ t₂).coeff 3= -(↑t₀⁻¹ : A)*t₁ := sorry

/-- `galois_type_rank_one`: A rank-one unramified reciprocity character with T_1 values supplies a Galois-type system. -/
example {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G] (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (χ : G →* (T ⧸ m)ˣ) (hχ : Continuous χ) (Frob : V → G) : Spherical.IsGaloisType m 1 Frob (fun v ↦ X-C ((χ (Frob v) : (T ⧸ m)ˣ) : T ⧸ m)) := sorry

/-- `galois_type_reducible`: A sum of two characters gives Galois type but fails non-Eisenstein. -/
example {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G] (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (χ ψ : G →* (T ⧸ m)ˣ) (hχ : Continuous χ) (hψ : Continuous ψ) : Spherical.IsGaloisType m 2 (id : G → G) (fun g ↦ (X-C ((χ g : (T ⧸ m)ˣ) : T ⧸ m))*(X-C ((ψ g : (T ⧸ m)ˣ) : T ⧸ m))) ∧ ¬ Spherical.IsNonEisenstein m 2 (id : G → G) (fun g ↦ (X-C ((χ g : (T ⧸ m)ˣ) : T ⧸ m))*(X-C ((ψ g : (T ⧸ m)ˣ) : T ⧸ m))) := sorry

/-- `galois_type_twist`: A character twist preserves absolute irreducibility and scales the i-th coefficient by θ(F_v)^i. -/
example {K G : Type u} [Field K] [Group G]
    (D : Determinant K (MonoidAlgebra K G) d) (hD : D.IsAbsolutelyIrreducible)
    (θ : G →* Kˣ) (g : G) (i : ℕ) (hi : i ≤ d) :
    (D.twist θ).IsAbsolutelyIrreducible ∧
      ((D.twist θ).charpoly (MonoidAlgebra.of K G g)).coeff (d-i)=
        (↑(θ g) : K)^i*(D.charpoly (MonoidAlgebra.of K G g)).coeff (d-i) := sorry

/-- `operator_nilpotent`: If t^r=0 on C, its localization is zero. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (t : End C) (r : ℕ) (ht : t^r=0) : Limits.IsZero (HeckeImage.operatorLocalization C t) := sorry

/-- `operator_unit`: If t is an automorphism, its localization is C. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (t : (End C)ˣ) : Nonempty (HeckeImage.operatorLocalization C (t : End C) ≅ C) := sorry

/-- `operator_factors`: For T=A×A and t=(1,0), localization selects the first summand. -/
example : let C := Fixtures.degreeZero A ⊞ Fixtures.degreeZero A
    let e : End C := Limits.biprod.fst ≫ Limits.biprod.inl
    Nonempty (HeckeImage.operatorLocalization C e ≅ Fixtures.degreeZero A) := sorry

/-- `quotient_constant_family`: If A is finite and J_r=0, a fixed continuous determinant gives a constant compatible family. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (D : Determinant A (MonoidAlgebra A G) d) (hD : ∀ r i, @Continuous G (A ⧸ J r) _ ⊥ (fun g ↦ ((D.mapCoefficients (Ideal.Quotient.mk (J r))).charpoly (MonoidAlgebra.of (A ⧸ J r) G g)).coeff i)) : ∃ F : Interpolation.FiniteQuotientData A G d J hJ, ∀ r, F.determinant r=D.mapCoefficients (Ideal.Quotient.mk (J r)) := sorry

/-- `quotient_matrix_family`: A continuous matrix representation over A gives its determinants modulo every J_r. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A) (r s : ℕ) (hrs : r ≤ s) : ((Determinant.ofMatrix ρ).mapCoefficients (Ideal.Quotient.mk (J s))).mapCoefficients (Ideal.Quotient.factor (hJ hrs))=(Determinant.ofMatrix ρ).mapCoefficients (Ideal.Quotient.mk (J r)) := sorry

/-- `quotient_incompatible`: Two rank-one characters differing after reduction at one level cannot form compatible data. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (F : Interpolation.FiniteQuotientData A G 1 J hJ) (r s : ℕ) (hrs : r ≤ s) (D : Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) G) 1) (hD : (F.determinant s).mapCoefficients (Ideal.Quotient.factor (hJ hrs))≠D) : F.determinant r≠D := sorry

/-- `limit_rank_one`: Compatible characters G→(Z/p^r)× produce the character G→Z_p×. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (F : Interpolation.FiniteQuotientData A G 1 J hJ) (complete : A ≃+* Interpolation.quotientLimit J hJ) (hc : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a) (g : G) (r : ℕ) : Ideal.Quotient.mk (J r) ((Interpolation.inverseLimitDeterminant F complete hc).eval (MonoidAlgebra.of A G g))=(F.determinant r).eval (MonoidAlgebra.of (A ⧸ J r) G g) := sorry

/-- `limit_nonreduced`: The construction retains nilpotent coefficients in a complete nonreduced A. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : Interpolation.FiniteQuotientData A G d J hJ)
    (complete : A ≃+* Interpolation.quotientLimit J hJ)
    (hc : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a)
    (a : A) (ha : a^2=0) (hne : a≠0) (g : G) (i : ℕ)
    (hcoeff : ∀ r, ((F.determinant r).charpoly (MonoidAlgebra.of (A ⧸ J r) G g)).coeff i=Ideal.Quotient.mk (J r) a) :
    ((Interpolation.inverseLimitDeterminant F complete hc).charpoly (MonoidAlgebra.of A G g)).coeff i=a ∧
      ∃ r, Ideal.Quotient.mk (J r) a≠0 := sorry

/-- `limit_constant`: For a constant finite quotient system, the inverse-limit determinant is the original law. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (F : Interpolation.FiniteQuotientData A G d J hJ) (complete : A ≃+* Interpolation.quotientLimit J hJ) (hc : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a) (D : Determinant A (MonoidAlgebra A G) d) (hD : ∀ r, D.mapCoefficients (Ideal.Quotient.mk (J r))=F.determinant r) : Interpolation.inverseLimitDeterminant F complete hc=D := sorry

/-- `congruence_single`: One classical determinant already over A/J_r gives the identity embedding witness. -/
example {G V : Type u} [Group G] [TopologicalSpace G] [CompactSpace G]
    [TopologicalSpace A] [CompactSpace A] [T2Space A]
    (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g=h*Frob v*h⁻¹})
    (D : Determinant A (MonoidAlgebra A G) d) (hD : D.IsContinuous) :
    let W : Interpolation.CongruenceWitness A G V d Frob :=
      { count := 1
        coefficient := fun _ ↦ CommAlgCat.of A A
        coefficientTopology := fun _ ↦ inferInstance
        coefficientT2 := fun _ ↦ inferInstance
        coefficient_continuous := sorry
        classical := fun _ ↦ D
        classical_continuous := sorry
        frobenius_dense := hdense
        injective := sorry
        frobenius_mem := sorry }
    W.count=1 ∧ W.classical 0=D ∧ Interpolation.CongruenceWitness.determinant W=D := sorry

/-- `congruence_intersection`: Compatible systems over A/I and A/J give the intersection-quotient witness. -/
example (I J : Ideal A) :
    Function.Injective (fun a : A ⧸ (I ⊓ J) ↦
      (Ideal.Quotient.factor (inf_le_left : I ⊓ J ≤ I) a,
       Ideal.Quotient.factor (inf_le_right : I ⊓ J ≤ J) a)) := sorry

/-- `congruence_nilpotent_invisible`: All field points of k[ε]/ε² see ε as zero; they cannot certify a coefficient ε or a nilpotent perturbation integrally. -/
example {k K : Type u} [Field k] [Field K] :
    (DualNumber.eps : DualNumber k)≠0 ∧ (DualNumber.eps : DualNumber k)^2=0 ∧
      ∀ φ : DualNumber k →+* K, φ DualNumber.eps=0 := sorry

/-- `fitting_cyclic_integer`: Fitt₀_Z(Z/6Z)=(6). -/
example : (TauCeti.fittingIdeal ℤ (ZMod 6) 0)=Ideal.span {(6 : ℤ)} := sorry

/-- `fitting_zero_module`: Fitt₀_A(0)=A, whereas Fitt₀_A(A)=0 for A≠0. -/
example : (TauCeti.fittingIdeal A (Fin 0 → A) 0)=⊤ ∧ (TauCeti.fittingIdeal A A 0)=⊥ := sorry

/-- `difference_scalar_zero`: If ρ(g)=ψ(g)I₂ and χ=ψ, then Δψ=0. -/
example {G : Type u} [Group G] (ψ : G →* Aˣ) : IntegralRibet.differenceModule (Fixtures.scalarRepresentation ψ) ψ=⊥ := sorry

/-- `difference_trivial_group`: For the trivial group and the trivial scalar representation, Δψ=0. -/
example : IntegralRibet.differenceModule (Fixtures.scalarRepresentation (1 : PUnit.{u+1} →* Aˣ)) 1=⊥ := sorry

/-- `difference_upper_unipotent`: For G=Z, A=B=Z and ρ(n)=[[1,n],[0,1]], χ=ψ=1, Δψ=Z E₁₂, ΔχΔψ=0. -/
example : IntegralRibet.differenceModule Fixtures.upperUnipotent 1=Submodule.span ℤ {Matrix.single (0 : Fin 2) 1 (1 : ℤ)} ∧ IntegralRibet.differenceProduct Fixtures.upperUnipotent 1 1=⊥ := sorry

/-- `ribet_cocycle_identity`: κ₀(1)=0. -/
example {B G : Type u} [CommRing B] [Algebra A B] [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) : IntegralRibet.canonicalCocycle ρ χ ψ 1=0 := sorry

/-- `ribet_cocycle_unipotent`: For the integral upper-unipotent representation of Z with χ=ψ=1, κ₀(n)=n in M₀≅Z. -/
example (n : ℤ) : Fixtures.upperUnipotentInitial (IntegralRibet.canonicalCocycle Fixtures.upperUnipotent 1 1 (Multiplicative.ofAdd n))=n := sorry

/-- `ribet_cocycle_twisted_product`: The underlying function satisfies the continuous cochain API’s twisted cocycle equation, with α(g), rather than α(h), multiplying κ₀(h). -/
example {B G : Type u} [CommRing B] [Algebra A B] [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) (g h : G) : IntegralRibet.canonicalCocycle ρ χ ψ (g*h)=IntegralRibet.canonicalCocycle ρ χ ψ g+((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)) • IntegralRibet.canonicalCocycle ρ χ ψ h := sorry

/-- `local_module_empty_conditions`: For S=∅, N=M₀ and κ=κ₀. -/
example {B G : Type u} [CommRing B] [Algebra A B] [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) : Nonempty (IntegralRibet.localModule (Fixtures.emptyLocal G) ρ χ ψ ≃ₗ[A] IntegralRibet.initialModule ρ χ ψ) := sorry

/-- `local_module_whole_group_zero`: For Σ={v₀}, G_v₀=G and P=∅, N=0. -/
example {B G : Type u} [CommRing B] [Algebra A B] [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) : Limits.IsZero (IntegralRibet.localModule (Fixtures.fullLocal G) ρ χ ψ) := sorry
/-- `ribet_scalar_not_irreducible`: the scalar representation `ψ·I₂` is reducible on every field
quotient (the first coordinate line is stable), so it is excluded from every Ribet theorem. -/
example {G : Type u} [Group G] [Nontrivial A] (ψ : G →* Aˣ) :
    ¬ Theorems.RibetIrreducible (Fixtures.scalarRepresentation ψ) := sorry
/-- `ribet_scalar_congruence_holds`: the scalar representation satisfies the characteristic
polynomial congruence for `χ = ψ` and every ideal, so the congruence alone is not enough. -/
example {G : Type u} [Group G] (ψ : G →* Aˣ) (I : Ideal A) :
    Theorems.RibetCongruence (Fixtures.scalarRepresentation ψ) ψ ψ I := sorry
/-- `ribet_scalar_refutes_containment`: without irreducibility the weighted Fitting containment
fails: for `χ = ψ`, the scalar representation, `Σ = P = ∅` (empty product `1`) the local module is
`M₀ = 0`, whose zeroth Fitting ideal is the unit ideal, not contained in a proper `Ĩ`. -/
example {G : Type u} [Group G] (ψ : G →* Aˣ) (I : Ideal A) (hI : I ≠ ⊤)
    [Module.Finite A (IntegralRibet.localModule (Fixtures.emptyLocal G)
      (Fixtures.scalarRepresentation ψ) ψ ψ)] :
    ¬ ((Ideal.span {∏ v ∈ (Finset.univ.filter (fun v ↦ v ∉ (Fixtures.emptyLocal G).sigma)),
      (1 : A)} : Ideal A) *
      ((TauCeti.fittingIdeal A (IntegralRibet.localModule (Fixtures.emptyLocal G)
        (Fixtures.scalarRepresentation ψ) ψ ψ) 0)).map (RingHom.id A)) ≤ I := sorry
/-- `ribet_trivial_group_refutes_global`: for the trivial group, the scalar representation and a
proper ideal `I`, no finite module `M` with `Fitt₀(M) ⊆ I` carries a cocycle whose translates all
span `M` (the only cocycle is `0`, and `Fitt₀(0) = A`), so the global theorem needs irreducibility. -/
example [Nontrivial A] (I : Ideal A) (hI : I ≠ ⊤) :
    ¬ ∃ (M : ModuleCat.{u} A) (_ : Module.Finite A M), ∃ κ : PUnit.{u+1} → M,
      (∀ g h, κ (g*h)=κ g+(1 : A) • κ h) ∧
      (∀ x : M, Submodule.span A (Set.range (fun g ↦ κ g+((1 : A)-1) • x))=⊤) ∧
      (TauCeti.fittingIdeal A M 0) ≤ I := sorry

/-- `local_module_extra_generator`: For scalar ρ=ψI₂, χ=ψ, Σ={v₀,v₁} and both subgroups trivial, M₀=0 but N≅A y_v₁; the cocycle alone does not generate N. -/
example {G : Type u} [Group G] (ψ : G →* Aˣ) : Nonempty (IntegralRibet.localModule (Fixtures.extraLocal G) (Fixtures.scalarRepresentation ψ) ψ ψ ≃ₗ[A] A) := sorry

/-- `divided_power_degree_zero`: Γ^0_A(M)≅A, with γ₀(m)=1. -/
example {M : Type u} [AddCommGroup M] [Module A M] :
    Nonempty (DividedPower.degree A M 0 ≃ₗ[A] A) := sorry

/-- `divided_power_degree_one`: Γ^1_A(M)≅M, and γ₁ corresponds to the identity. -/
example {M : Type u} [AddCommGroup M] [Module A M] :
    ∃ e : DividedPower.degree A M 1 ≃ₗ[A] M, ∀ x, e (DividedPower.gamma 1 x)=x := sorry

/-- `divided_power_degree_two_integer`: In the full Γ_Z(Z), γ₁(1)²=2γ₂(1); γ₂(1) is a basis of Γ²_Z(Z), so the divided-power grading cannot be replaced by an ordinary polynomial grading. -/
example : DividedPowerAlgebra.dp ℤ 1 (1 : ℤ)^2=2*DividedPowerAlgebra.dp ℤ 2 (1 : ℤ) := sorry

/-- `universal_law_degree_zero`: The degree-zero law is constant 1 in Γ⁰≅A. -/
example {M : Type u} [AddCommGroup M] [Module A M] (x : M) : ((DividedPower.universalLaw (A := A) 0).ground x : DividedPowerAlgebra A M)=1 := sorry

/-- `universal_law_degree_one`: Under Γ¹≅M it is Mathlib’s identity polynomial law. -/
example {M : Type u} [AddCommGroup M] [Module A M] (e : DividedPower.degree A M 1 ≃ₗ[A] M) (he : ∀ x, e (DividedPower.gamma 1 x)=x) (x : M) : e ((DividedPower.universalLaw 1).ground x)=x := sorry

/-- `universal_law_mixed_degree_two`: The coefficient of UV in γ²(Ux+Vy) is γ₁(x)γ₁(y), with no factor 2 inserted. -/
example {M : Type u} [AddCommGroup M] [Module A M] (x y : M) : ((DividedPower.universalLaw (A := A) 2).ground (x+y) : DividedPowerAlgebra A M)=DividedPowerAlgebra.dp A 2 x+DividedPowerAlgebra.dp A 1 x*DividedPowerAlgebra.dp A 1 y+DividedPowerAlgebra.dp A 2 y := sorry

/-- `dp_tensor_degree_one`: For d=1 the map is the identity on M⊗N under Γ¹≅identity. -/
example {M N : Type u} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] (x : M) (y : N) : DividedPower.tensorMap 1 (DividedPower.gamma 1 x ⊗ₜ[A] DividedPower.gamma 1 y)=DividedPower.gamma 1 (x ⊗ₜ[A] y) := sorry

/-- `dp_tensor_degree_zero`: For d=0 it is A⊗_A A≅A. -/
example {M N : Type u} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] (x : M) (y : N) : DividedPower.tensorMap 0 (DividedPower.gamma 0 x ⊗ₜ[A] DividedPower.gamma 0 y)=DividedPower.gamma 0 (x ⊗ₜ[A] y) := sorry

/-- `dp_tensor_integer_generator`: For d=2, M=N=Z, the basis γ₂(1)⊗γ₂(1) maps to γ₂(1⊗1), with coefficient 1. -/
example : DividedPower.tensorMap 2 (DividedPower.gamma (A := ℤ) 2 (1 : ℤ) ⊗ₜ[ℤ] DividedPower.gamma (A := ℤ) 2 (1 : ℤ))=DividedPower.gamma 2 ((1 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)) := sorry

/-- `internal_degree_one`: Γ¹_A(R) with its internal multiplication is R as an A-algebra. -/
example : Nonempty (DividedPower.degree A R 1 ≃ₐ[A] R) := sorry

/-- `internal_integer_degree_two`: For R=Z,d=2, γ₂(1)⋆γ₂(1)=γ₂(1); the full graded product γ₂(1)γ₂(1)=6γ₄(1) is a different operation. -/
example : DividedPower.gamma (A := ℤ) 2 (1 : ℤ)*DividedPower.gamma (A := ℤ) 2 (1 : ℤ)=DividedPower.gamma 2 (1 : ℤ) := sorry

/-- `internal_scalar_power`: For R=A the universal multiplicative law is a↦a^d and its representing algebra is A. -/
example (d : ℕ) (a b : A) : DividedPower.gamma (A := A) d a * DividedPower.gamma d b=DividedPower.gamma d (a*b) := sorry

/-- `coordinate_ring_degree_one`: Z_A(R,1)=R^ab. -/
example : Nonempty (Determinant.coordinateRing A A 1 ≃ₐ[A] A) := sorry

/-- `coordinate_ring_base_algebra`: Z_A(A,d)≅A with universal law a↦a^d. -/
example (d : ℕ) : Nonempty (Determinant.coordinateRing A A d ≃ₐ[A] A) := sorry

/-- `coordinate_ring_one_variable`: Z_A(A[t],d)≅A[e₁,…,e_d], and the universal characteristic polynomial of t is X^d−e₁X^(d−1)+…+(−1)^d e_d. -/
example (d : ℕ) : Nonempty (Determinant.coordinateRing A A[X] d ≃ₐ[A] MvPolynomial (Fin d) A) := sorry

/-- `det_dual_rank_one`: The dual of a unit character χ is χ⁻¹. -/
example {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) 1) (g : G) : D.dual.eval (MonoidAlgebra.of A G g)*D.eval (MonoidAlgebra.of A G g)=1 := sorry

/-- `det_dual_trivial`: The trivial d-dimensional representation is fixed by duality. -/
example {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) d) (hD : ∀ g, D.charpoly (MonoidAlgebra.of A G g)=(X-1)^d) : D.dual=D := sorry

/-- `det_dual_rank_two`: For a diagonal unit pair (a,b), dual characteristic polynomial is X²−(a⁻¹+b⁻¹)X+(ab)⁻¹. -/
example (a b : Aˣ) : Matrix.charpoly (!![(↑a⁻¹ : A),0;0,(↑b⁻¹ : A)] : Matrix (Fin 2) (Fin 2) A)=X^2-C ((↑a⁻¹ : A)+(↑b⁻¹ : A))*X+C ((↑a⁻¹ : A)*(↑b⁻¹ : A)) := sorry

/-- `projective_determinant_line`: On an invertible rank-one module, scalar a has determinant a. -/
example {V : Type u} [AddCommGroup V] [Module A V] [Module.Finite A V] [Module.Projective A V] (hRank : Module.rankAtStalk (R := A) V = 1) (a : A) : (Determinant.ofFiniteProjective 1 hRank (Algebra.ofId A (Module.End A V))).eval a=a := sorry

/-- `projective_determinant_identity`: The identity endomorphism has determinant 1. -/
example {V : Type u} [AddCommGroup V] [Module A V] [Module.Finite A V] [Module.Projective A V] (hRank : Module.rankAtStalk (R := A) V = d) (ρ : R →ₐ[A] Module.End A V) : (Determinant.ofFiniteProjective d hRank ρ).eval 1=1 := sorry

/-- `projective_determinant_free`: For V=A² and a specified basis, the determinant equals Mathlib’s Matrix.det, including the off-diagonal sign. -/
example (b : Module.Basis (Fin 2) A (Fin 2 → A)) (hRank : Module.rankAtStalk (R := A) (Fin 2 → A) = 2) (ρ : R →ₐ[A] Module.End A (Fin 2 → A)) (x : R) : (Determinant.ofFiniteProjective 2 hRank ρ).eval x=Matrix.det (LinearMap.toMatrix b b (ρ x)) := sorry

/-- `azumaya_matrix_norm`: For R=M₂(A), the norm is ad−bc. -/
example [IsAzumaya A (Matrix (Fin 2) (Fin 2) A)] (hRank : Module.rankAtStalk (R := A) (Matrix (Fin 2) (Fin 2) A) = 4) (a b c e : A) : (Determinant.ofAzumaya 2 (by decide) hRank).eval !![a,b;c,e]=a*e-b*c := sorry

/-- `azumaya_rank_one`: For R=A,d=1, the norm is the identity. -/
example [IsAzumaya A A] (hRank : Module.rankAtStalk (R := A) A = 1) (a : A) : (Determinant.ofAzumaya 1 (by decide) hRank).eval a=a := sorry

/-- `azumaya_quaternion_norm`: For the Hamilton quaternion algebra over R, Nrd(a+bi+cj+dk)=a²+b²+c²+d². -/
example [IsAzumaya ℝ (Quaternion ℝ)] (hRank : Module.rankAtStalk (R := ℝ) (Quaternion ℝ) = 4) (x : Quaternion ℝ) : (Determinant.ofAzumaya 2 (by decide) hRank).eval x=x.re^2+x.imI^2+x.imJ^2+x.imK^2 := sorry

/-- `invariant_eval_reindex_swap`: swapping two coordinates commutes with evaluation. -/
example {O H A : Type u} [CommRing O] [Group H] [CommRing A] [Algebra O A]
    (C : InvariantCoordinateInput O) (E : InvariantEvaluation C H A)
    (f : C.ring 2) (g : Fin 2 → H) :
    E.evaluate 2 (C.reindex (Equiv.swap (0 : Fin 2) 1) f) g =
      E.evaluate 2 f (g ∘ Equiv.swap (0 : Fin 2) 1) := sorry
/-- `invariant_eval_multiply_pair`: the product pullback evaluates at the product tuple. -/
example {O H A : Type u} [CommRing O] [Group H] [CommRing A] [Algebra O A]
    (C : InvariantCoordinateInput O) (E : InvariantEvaluation C H A)
    (f : C.ring 1) (g : Fin 2 → H) :
    E.evaluate 2 (C.multiply 0 f) g = E.evaluate 1 f (fun _ ↦ g 0*g 1) := sorry
/-- `invariant_eval_incompatible`: a violated reindex equation excludes compatible evaluation. -/
example {O H A : Type u} [CommRing O] [Group H] [CommRing A] [Algebra O A]
    (C : InvariantCoordinateInput O)
    (raw : ∀ n, C.ring n →ₐ[O] ((Fin n → H) → A))
    {n m : ℕ} (σ : Fin n → Fin m) (f : C.ring n) (g : Fin m → H)
    (h : raw m (C.reindex σ f) g ≠ raw n f (g ∘ σ)) :
    ¬ ∃ E : InvariantEvaluation C H A, E.evaluate = raw := sorry

/-- `h_pseudocharacter_torus`: For H=G_m, it is a unit character Γ→Aˣ. -/
example {G : Type u} [Group G] : Nonempty (ReductivePseudocharacter G (Fixtures.torusCoordinates A) A ≃ (G →* Aˣ)) := sorry

/-- `h_pseudocharacter_trivial_rep`: The trivial representation evaluates every invariant at the identity tuple. -/
example {G : Type u} [Group G] (C : InvariantCoordinateInput A) (eval : InvariantEvaluation C Aˣ A) (n : ℕ) (f : C.ring n) (g : Fin n → G) : (ReductivePseudocharacter.ofRepresentation C (1 : G →* Aˣ) eval).theta n f g=eval.evaluate n f (fun _ ↦ 1) := sorry

/-- Regular polynomial evaluation and simultaneous conjugation invariance are explicit.
`h_pseudocharacter_unipotent`: Over an algebraically closed field, the nontrivial upper-unipotent representation Z→GL₂ has the same pseudocharacter as the trivial rank-two representation; the pseudocharacter does not retain the nonsplit extension. -/
example {K : Type} [Field K] [IsAlgClosed K] (C : InvariantCoordinateInput K) (eval : InvariantEvaluation C (Matrix (Fin 2) (Fin 2) K)ˣ K) (hregular : eval.IsRegularMatrixInvariant) : ReductivePseudocharacter.ofRepresentation C (Fixtures.unipotentUnits K) eval=ReductivePseudocharacter.ofRepresentation C (1 : Multiplicative ℤ →* (Matrix (Fin 2) (Fin 2) K)ˣ) eval := sorry

/-- `h_continuous_discrete_group`: Every pseudocharacter on a discrete Γ is continuous. -/
example {G : Type u} [Group G] [TopologicalSpace G] [DiscreteTopology G] [TopologicalSpace A] (C : InvariantCoordinateInput A) (Θ : ReductivePseudocharacter G C A) : Θ.IsContinuous := sorry

/-- `h_continuous_rank_one`: For H=G_m the condition is continuity of the associated unit character. -/
example {G : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace A] [IsTopologicalRing A] (Θ : ReductivePseudocharacter G (Fixtures.torusCoordinates A) A) : Θ.IsContinuous ↔ Continuous (Fixtures.torusEquiv Θ) := sorry

/-- `h_continuous_finite_quotient`: A finite-quotient representation into a discrete finite coefficient ring gives a continuous pseudocharacter on a profinite group. -/
example {G Q : Type u} [Group G] [Group Q] [TopologicalSpace G] [TopologicalSpace Q] [Finite Q] [DiscreteTopology Q] [TopologicalSpace A] (C : InvariantCoordinateInput A) (Θ : ReductivePseudocharacter Q C A) (π : G →* Q) (hπ : Continuous π) : (ReductivePseudocharacter.restrict C Θ π).IsContinuous := sorry

/-- `h_kernel_trivial_rep`: The trivial representation has ker Θ=Γ. -/
example {G : Type u} [Group G] (C : InvariantCoordinateInput A) (eval : InvariantEvaluation C Aˣ A) : ReductivePseudocharacter.kernel C (ReductivePseudocharacter.ofRepresentation C (1 : G →* Aˣ) eval)=⊤ := sorry

/-- `h_kernel_rank_one`: For H=G_m it is the kernel of the unit character. -/
example {G : Type u} [Group G] (Θ : ReductivePseudocharacter G (Fixtures.torusCoordinates A) A) : ReductivePseudocharacter.kernel (Fixtures.torusCoordinates A) Θ=(Fixtures.torusEquiv Θ).ker := sorry

/-- Regular invariant evaluation is explicit; characteristic zero makes ρ faithful.
`h_kernel_unipotent_strict`: For the upper-unipotent representation of Z in GL₂ over C, ker ρ={0} but ker Θ_ρ=Z. -/
example {K : Type} [Field K] [IsAlgClosed K] [CharZero K] (C : InvariantCoordinateInput K) (eval : InvariantEvaluation C (Matrix (Fin 2) (Fin 2) K)ˣ K) (hregular : eval.IsRegularMatrixInvariant) : (Fixtures.unipotentUnits K).ker=⊥ ∧ ReductivePseudocharacter.kernel C (ReductivePseudocharacter.ofRepresentation C (Fixtures.unipotentUnits K) eval)=⊤ := sorry

/-- `corner_matrix`: For the usual determinant on M₃(A) and e=diag(1,1,0), D_e is the 2×2 determinant. -/
example [Nontrivial A] (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) : let D := Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 3) (Fin 3) A))
    let e : Matrix (Fin 3) (Fin 3) A := Matrix.diagonal ![1,1,0]
    (D.corner hconnected e (Fixtures.diagonal_three_idem _)).1=2 ∧ ∃ φ : Corner A (Matrix (Fin 3) (Fin 3) A) e (Fixtures.diagonal_three_idem _) ≃ₐ[A] Matrix (Fin 2) (Fin 2) A,
      ∀ x, (D.corner hconnected e (Fixtures.diagonal_three_idem _)).2.eval x=(φ x).det := sorry

/-- `corner_zero`: For e=0 the corner determinant has degree zero and constant value one. -/
example [Nontrivial A] (D : Determinant A R d)
    (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) :
    (D.corner hconnected 0 (by simp)).1=0 ∧ ∀ x, (D.corner hconnected 0 (by simp)).2.eval x=1 := sorry

/-- `corner_rank_not_trace`: Over F₂, a rank-two projection has trace zero but corner degree two. -/
example : let D := Determinant.ofMatrix (AlgHom.id (ZMod 2) (Matrix (Fin 3) (Fin 3) (ZMod 2)))
    let e : Matrix (Fin 3) (Fin 3) (ZMod 2) := Matrix.diagonal ![1,1,0]
    D.trace e=0 ∧ (D.corner (fun _ ha ↦ IsIdempotentElem.iff_eq_zero_or_one.mp ha) e (Fixtures.diagonal_three_idem _)).1=2 := sorry

/-- `residual_scalar`: A one-dimensional character determinant is split and absolutely irreducible. -/
example {K G : Type u} [Field K] [Group G] (χ : G →* Kˣ) : (Determinant.ofMatrix (Fixtures.rankOne χ)).IsSplit ∧ (Determinant.ofMatrix (Fixtures.rankOne χ)).IsAbsolutelyIrreducible := sorry

/-- `residual_repeated`: χ² is split but not multiplicity-free, including in characteristic two. -/
example {K G : Type u} [Field K] [Group G] (χ : G →* Kˣ) :
    ((Determinant.ofMatrix (Fixtures.rankOne χ)).mul
      (Determinant.ofMatrix (Fixtures.rankOne χ))).IsSplit ∧
    ¬ ((Determinant.ofMatrix (Fixtures.rankOne χ)).mul
      (Determinant.ofMatrix (Fixtures.rankOne χ))).IsMultiplicityFree := sorry

/-- `residual_distinct`: χψ for two distinct k-valued characters is split multiplicity-free and reducible. -/
example {K G : Type u} [Field K] [Group G] (χ ψ : G →* Kˣ) (h : χ≠ψ) :
    ((Determinant.ofMatrix (Fixtures.rankOne χ)).mul
      (Determinant.ofMatrix (Fixtures.rankOne ψ))).IsSplit ∧
    ((Determinant.ofMatrix (Fixtures.rankOne χ)).mul
      (Determinant.ofMatrix (Fixtures.rankOne ψ))).IsMultiplicityFree ∧
    ¬ ((Determinant.ofMatrix (Fixtures.rankOne χ)).mul
      (Determinant.ofMatrix (Fixtures.rankOne ψ))).IsAbsolutelyIrreducible := sorry

/-- `residual_nonsplit_quaternion`: The Hamilton reduced norm is absolutely irreducible
over an algebraic closure but does not split over its base field R. -/
example [IsAzumaya ℝ (Quaternion ℝ)]
    (hRank : Module.rankAtStalk (R := ℝ) (Quaternion ℝ) = 4) :
    let D := Determinant.ofAzumaya 2 (by decide) hRank
    D.IsAbsolutelyIrreducible ∧ ¬ D.IsSplit := sorry

/-- Real regular multiplication by a complex number, for the splitness regression. -/
def Fixtures.complexRegular : ℂ →ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℝ where
  toFun z := !![z.re, -z.im; z.im, z.re]
  map_zero' := sorry
  map_one' := sorry
  map_add' := sorry
  map_mul' := sorry
  commutes' := sorry

/-- `residual_real_norm_not_split`: Real realizability does not split the faithful
quotient. Over ℂ the two norm constituents are distinct. -/
example : let D := Determinant.ofMatrix Fixtures.complexRegular
    (∀ z : ℂ, D.eval z = z.re^2 + z.im^2) ∧
    D.IsMultiplicityFree ∧ ¬ D.IsSplit ∧
    (∃ ρ : ℂ →ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℝ, Determinant.ofMatrix ρ = D) := sorry

/-- `gma_full_matrix`: For R=M_d(A) partitioned into blocks, every A_ij=A. -/
example (s : ℕ) (i j : Fin s) : Nonempty (GMA.entryModule (Fixtures.matrixGMA A s) i j ≃ₗ[A] A) := sorry

/-- `gma_triangular`: For upper triangular 2×2 matrices, A_12=A and A_21=0. -/
example : Nonempty (GMA.entryModule (Fixtures.orderGMA A ⊥ false) 0 1 ≃ₗ[A] A) ∧ Subsingleton (GMA.entryModule (Fixtures.orderGMA A ⊥ false) 1 0) := sorry

/-- `gma_not_free_offdiagonal`: For R=[[A,J],[A,A]] with a nonprincipal ideal J, A_12=J need not be free. -/
example (J : Ideal A) (hJ : ¬ Module.Free A J) : ¬ Module.Free A (GMA.entryModule (Fixtures.orderGMA A J true) 0 1) := sorry

/-- `adapted_one_block`: For one block M_d(A), B_ad=A. -/
example (d : ℕ) (hd : 0 < d) : Nonempty (GMA.adaptedRing (Fixtures.oneBlockGMA A d hd) ≃ₐ[A] A) := sorry

/-- `adapted_two_scalar`: For the full 2×2 matrix algebra, B_ad=A[b,c]/(bc−1), with off-diagonal entries b,c. -/
example : Nonempty (GMA.adaptedRing (Fixtures.matrixGMA A 2) ≃ₐ[A] (MvPolynomial (Fin 2) A ⧸ Ideal.span {((MvPolynomial.X 0*MvPolynomial.X 1-1) : MvPolynomial (Fin 2) A)})) := sorry

/-- `adapted_triangular`: For upper triangular 2×2 matrices, B_ad=A[b] and the universal upper entry is b. -/
example : Nonempty (GMA.adaptedRing (Fixtures.orderGMA A ⊥ false) ≃ₐ[A] A[X]) := sorry

/-- `gma_det_two`: For [[a,b],[c,d]] with scalar blocks, D_E=ad−φ(b,c). -/
example (a b c e : A) : (GMA.determinant (Fixtures.matrixGMA A 2)).eval !![a,b;c,e]=a*e-b*c := sorry

/-- `gma_det_triangular`: For triangular matrices it is the product of diagonal determinants. -/
example (x : Fixtures.matrixOrder A ⊥ false) : (GMA.determinant (Fixtures.orderGMA A ⊥ false)).eval x=x.val 0 0*x.val 1 1 := sorry

/-- `gma_det_characteristic_two`: Over F₂ the determinant still detects a repeated scalar character although its trace is zero. -/
example (a : ZMod 2) : (GMA.determinant (Fixtures.matrixGMA (ZMod 2) 2)).eval (a • 1)=a^2 ∧ (GMA.determinant (Fixtures.matrixGMA (ZMod 2) 2)).trace (a • 1)=0 := sorry

/-- `reducibility_triangular`: For an upper triangular algebra the ideal is zero. -/
example : GMA.reducibilityIdeal (Fixtures.orderGMA A ⊥ false) 0 1=⊥ := sorry

/-- `reducibility_congruence`: For [[A,A],[π^rA,A]] over a DVR, I_red=(π^r). -/
example (π : A) (r : ℕ) : GMA.reducibilityIdeal (Fixtures.orderGMA A (Ideal.span {π^r}) false) 0 1=Ideal.span {π^r} := sorry

/-- `reducibility_full_matrix`: For M₂(A) the opposite pairing is the unit ideal; there is no two-block determinant factorization with two distinct residual characters. -/
example : GMA.reducibilityIdeal (Fixtures.matrixGMA A 2) 0 1=⊤ := sorry

/-- `extension_two_blocks`: With two blocks the intermediate sum is zero. -/
example {size : Fin 2 → ℕ} (E : GMA.Data A R 2 size) : GMA.intermediateProducts E 0 1=⊥ := sorry

/-- `extension_three_full`: For three scalar blocks of M₃(A), A_13/A_12A_23=0. -/
example : Limits.IsZero (GMA.extensionModule (Fixtures.matrixGMA A 3) 0 2) := sorry

/-- `extension_triangular`: For [[A,B],[0,A]], the upper extension module is B. -/
example : Nonempty (GMA.extensionModule (Fixtures.orderGMA A ⊥ false) 0 1 ≃ₗ[A] A) := sorry

/-- `universal_rank_one`: For d=1 the universal Cayley–Hamilton algebra equals the universal character ring. -/
example {G : Type} [Group G] : Nonempty (CayleyHamilton.universalAlgebra G 1 ≃+* Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) 1) := sorry

/-- `universal_trivial_group`: For G={1}, R(G,d)=Z for d≥1. -/
example (d : ℕ) (hd : 0 < d) : Nonempty (CayleyHamilton.universalAlgebra Unit d ≃+* ℤ) := sorry

/-- `universal_matrix_specialization`: the specialized universal law at φ has split,
absolutely irreducible residue, so its CH quotient is M_d(A). -/
example {G : Type} [Group G] [HenselianLocalRing A] (d : ℕ) (hd : 0 < d)
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] A)
    (hSplit : (CayleyHamilton.universalSpecialization d φ).residual.IsSplit)
    (hIrr : (CayleyHamilton.universalSpecialization d φ).residual.IsAbsolutelyIrreducible) :
    Nonempty (CayleyHamilton.universalAlgebra_baseChange d φ ≃ₐ[A]
      Matrix (Fin d) (Fin d) A) := sorry

/-- `reductive_universal_trivial`: For the trivial target group H, B_H^Γ=O. -/
example {G : Type u} [Group G] : Nonempty (ReductivePseudocharacter.universalRing G (Fixtures.trivialCoordinates A) ≃ₐ[A] A) := sorry

/-- `reductive_universal_rank_one`: For H=GL₁ and Γ=Z, B_H^Γ=O[t,t⁻¹]. -/
example : Nonempty (ReductivePseudocharacter.universalRing (Multiplicative ℤ) (Fixtures.torusCoordinates ℤ) ≃ₐ[ℤ] LaurentPolynomial ℤ) := sorry

/-- The trivial invariant-coordinate system does not represent rank-one determinants of ℤ. -/
example : ¬ Nonempty (ReductivePseudocharacter.universalRing (Multiplicative ℤ)
    (Fixtures.trivialCoordinates ℤ) ≃ₐ[ℤ] LaurentPolynomial ℤ) := sorry

/-- `formal_ring_no_generators`: With no matrices or relation variables, R=Z. -/
example : Nonempty (IntegralRibet.formalRing 0 0 ∅ ≃ₐ[ℤ] ℤ) := sorry

/-- `formal_ring_one_free`: With one matrix and no v₀ constraint, R=Z[a,b,c,d] apart from R₀ variables. -/
example : Nonempty (IntegralRibet.formalRing 0 1 ∅ ≃ₐ[ℤ] MvPolynomial (Fin 4) ℤ) := sorry

/-- `formal_ring_triangular`: Imposing b=0 gives Z[a,c,d], whose lower-Borel torus fixes a,d and weights c. -/
example : Nonempty (IntegralRibet.formalRing 0 1 {0} ≃ₐ[ℤ] MvPolynomial (Fin 3) ℤ) := sorry

/-- `relation_empty`: With no selected relation rows or local pairs, J=J′=0. -/
example : IntegralRibet.relationIdeal (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A)=⊥ ∧ IntegralRibet.upperRelationIdeal (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A)=⊥ := sorry

/-- `relation_linear_row`: For ε₁X₁+ε₂X₂, J has four scalar coefficients and J′ is (ε₁b₁+ε₂b₂). -/
example (ε₁ ε₂ : A) (X Y : Matrix (Fin 2) (Fin 2) A) : IntegralRibet.upperRelationIdeal (fun _ : Fin 1 ↦ ε₁ • X+ε₂ • Y)=Ideal.span {ε₁*X 0 1+ε₂*Y 0 1} := sorry

/-- `relation_pair_sign`: B_στ=−B_τσ and D_στ=A_τσ; in characteristic two the alternating relation still has B_σσ=0. -/
example (X Y : Matrix (Fin 2) (Fin 2) A) (x y : A) : IntegralRibet.localRelationMatrix X Y x y 0 1= -IntegralRibet.localRelationMatrix Y X y x 0 1 ∧ IntegralRibet.localRelationMatrix X Y x y 1 1=IntegralRibet.localRelationMatrix Y X y x 0 0 ∧ IntegralRibet.localRelationMatrix X X x x 0 1=0 := sorry

/-- `invariant_one_matrix`: Before triangular constraints, invariants of one 2×2 matrix are generated by a+d and ad−bc. -/
example (X : Matrix (Fin 2) (Fin 2) A) : IntegralRibet.invariantSubring (Fin.elim0 : Fin 0 → A) (fun _ : Fin 1 ↦ X) ∅=Algebra.adjoin ℤ {Matrix.trace X,X.det} := sorry

/-- `invariant_triangular_matrix`: With b=0 the Borel invariants are Z[a,d]. -/
example (a c e : A) : IntegralRibet.invariantSubring (Fin.elim0 : Fin 0 → A) (fun _ : Fin 1 ↦ !![a,0;c,e]) {0}=Algebra.adjoin ℤ {a,e} := sorry

/-- `invariant_trace_insufficient`: Over F₂, scalar matrices have trace zero but determinant a²; the determinant generator cannot be omitted. -/
example (a : ZMod 2) : Matrix.trace (a • (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)))=0 ∧ (a • (1 : Matrix (Fin 2) (Fin 2) (ZMod 2))).det=a^2 := sorry

/-- `br_identity`: For f=id:R²→R², the complex is the exact two-term identity complex. -/
example : ∀ i : ℕ, Limits.IsZero ((BuchsbaumRim.moduleComplex (LinearMap.id : (Fin 2 → A) →ₗ[A] (Fin 2 → A))).homology i) := sorry

/-- `br_zero_map`: For f=0:R³→R², H₁(BR(f))=R³, so it is not exact unless R is zero. -/
example : Nonempty ((BuchsbaumRim.moduleComplex (0 : (Fin 3 → A) →ₗ[A] (Fin 2 → A))).homology 1 ≅ ModuleCat.of A (Fin 3 → A)) := sorry

/-- `br_two_column_syzygy`: For columns (b_i,b′_i), d₂ on e₁∧e₂∧e₃ is r₁₂e₃+r₂₃e₁+r₃₁e₂, and f(d₂)=0. -/
example (b c : Fin 3 → A) :
    let f : (Fin 3 → A) →ₗ[A] (Fin 2 → A) :=
      { toFun := fun x i ↦ ∑ j, (if i=0 then b j else c j)*x j
        map_add' := sorry
        map_smul' := sorry }
    let z : Fin 3 → A := ![b 1*c 2-b 2*c 1,b 2*c 0-b 0*c 2,b 0*c 1-b 1*c 0]
    (BuchsbaumRim.moduleComplex_X_one f).hom.hom
      ((BuchsbaumRim.moduleComplex f).d 2 1 |>.hom
        ((BuchsbaumRim.moduleComplex_X_two_rank_two f).inv.hom
          (exteriorPower.ιMulti A 3 (fun i ↦ Pi.single i 1))))=z ∧ f z=0 := sorry

/-- `detbr_rank_one`: For m=1 it equals the usual Koszul complex, including its integral signs. -/
example (n : ℕ) (f : (Fin n → A) →ₗ[A] (Fin 1 → A)) : Nonempty (BuchsbaumRim.determinantalComplex f ≅ BuchsbaumRim.moduleComplex f) := sorry

/-- `detbr_square`: For f:R²→R², the complex is R --det(f)→ R in degrees 1,0. -/
example (f : (Fin 2 → A) →ₗ[A] (Fin 2 → A)) :
    ∃ (e₀ : (BuchsbaumRim.determinantalComplex f).X 0 ≅ ModuleCat.of A A)
      (e₁ : (BuchsbaumRim.determinantalComplex f).X 1 ≅ ModuleCat.of A A),
      e₁.inv ≫ (BuchsbaumRim.determinantalComplex f).d 1 0 ≫ e₀.hom=
        ModuleCat.ofHom (Matrix.det (fun i j ↦ f (Pi.single j 1) i) • (LinearMap.id : A →ₗ[A] A)) ∧
      ∀ k : ℕ, 2 ≤ k → Limits.IsZero ((BuchsbaumRim.determinantalComplex f).X k) := sorry

/-- `detbr_generic_two_three`: For a generic 2×3 matrix, d₁ has generators r₁₂,r₁₃,r₂₃ and d₂ has the two column syzygies; no division by 2 occurs. -/
example (f : (Fin 3 → A) →ₗ[A] (Fin 2 → A)) :
    let r : Fin 3 → A :=
      ![f (Pi.single 0 1) 0*f (Pi.single 1 1) 1-f (Pi.single 1 1) 0*f (Pi.single 0 1) 1,
        f (Pi.single 0 1) 0*f (Pi.single 2 1) 1-f (Pi.single 2 1) 0*f (Pi.single 0 1) 1,
        f (Pi.single 1 1) 0*f (Pi.single 2 1) 1-f (Pi.single 2 1) 0*f (Pi.single 1 1) 1]
    let d₁ : (Fin 3 → A) →ₗ[A] A :=
      { toFun := fun x ↦ ∑ i, r i*x i
        map_add' := sorry
        map_smul' := sorry }
    let d₂ : (Fin 2 → A) →ₗ[A] (Fin 3 → A) :=
      { toFun := fun x ↦ ∑ i, x i • ![f (Pi.single 2 1) i,-f (Pi.single 1 1) i,f (Pi.single 0 1) i]
        map_add' := sorry
        map_smul' := sorry }
    ∃ (e₀ : (BuchsbaumRim.determinantalComplex f).X 0 ≅ ModuleCat.of A A)
      (e₁ : (BuchsbaumRim.determinantalComplex f).X 1 ≅ ModuleCat.of A (Fin 3 → A))
      (e₂ : (BuchsbaumRim.determinantalComplex f).X 2 ≅ ModuleCat.of A (Fin 2 → A)),
      e₁.inv ≫ (BuchsbaumRim.determinantalComplex f).d 1 0 ≫ e₀.hom=ModuleCat.ofHom d₁ ∧
      e₂.inv ≫ (BuchsbaumRim.determinantalComplex f).d 2 1 ≫ e₁.hom=ModuleCat.ofHom d₂ ∧
      ∀ k : ℕ, 3 ≤ k → Limits.IsZero ((BuchsbaumRim.determinantalComplex f).X k) := sorry

/-- `br_regular_identity`: Every ordered identity square matrix is regular even when its cokernel is zero. -/
example (m : ℕ) : BuchsbaumRim.IsRegular (LinearMap.id : (Fin m → A) →ₗ[A] (Fin m → A)) := sorry

/-- `br_regular_square`: A square matrix is regular iff its underlying R-linear map is injective; no domain assumption is made. -/
example (m : ℕ) (f : (Fin m → A) →ₗ[A] (Fin m → A)) : BuchsbaumRim.IsRegular f ↔ Function.Injective f := sorry

/-- `br_regular_rank_one`: Multiplication by 2 on Z is regular; multiplication by 2 on Z/4 is not. -/
example : BuchsbaumRim.IsRegular (2 • (LinearMap.id : (Fin 1 → ℤ) →ₗ[ℤ] (Fin 1 → ℤ))) ∧ ¬ BuchsbaumRim.IsRegular (2 • (LinearMap.id : (Fin 1 → ZMod 4) →ₗ[ZMod 4] (Fin 1 → ZMod 4))) := sorry

/-- `upper_complex_empty`: With no selected relation generators or local pairs C=R in degree zero. -/
example : ∀ k : ℕ, 0 < k → Limits.IsZero ((IntegralRibet.upperRelationComplex (Fin.elim0 : Fin 0 → A) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0)).X k) := sorry

/-- `upper_complex_linear`: With only one linear relation L it is the two-term Koszul complex R --L→ R. -/
example (a : A) : Nonempty ((IntegralRibet.upperRelationComplex (fun _ : Fin 1 ↦ a) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0)).homology 0 ≅ ModuleCat.of A (A ⧸ Ideal.span {a})) := sorry

/-- `upper_complex_two_local_rows`: With two local rows and no linear relations it is R --(b₁b′₂−b₂b′₁)→ R after the determinant-line twist. -/
example (f : (Fin 2 → A) →ₗ[A] (Fin 2 → A)) : Nonempty ((IntegralRibet.upperRelationComplex (Fin.elim0 : Fin 0 → A) (fun _ : Fin 1 ↦ 2) (fun _ ↦ f)).homology 0 ≅ ModuleCat.of A (A ⧸ BuchsbaumRim.maximalMinorIdeal f)) := sorry

/-- With no rows or local blocks the full ideal is zero. -/
example : IntegralRibet.fullRelationIdeal (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A)
    (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0) (by intro t; exact t.elim0) = ⊥ := sorry
/-- With one matrix row and no local blocks the ideal consists of its four entries. -/
example (U : Matrix (Fin 2) (Fin 2) A) :
    IntegralRibet.fullRelationIdeal (fun _ : Fin 1 ↦ U) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0) (by intro t; exact t.elim0) =
      Ideal.span {a | ∃ i j, a = U i j} := sorry
/-- One local block alone contributes no distinct-pair relation. -/
example (U : Matrix (Fin 2) (Fin 2) A) (a : A) :
    IntegralRibet.fullRelationIdeal (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A)
      (fun _ : Fin 1 ↦ 1) (fun _ _ ↦ U) (fun _ _ ↦ a) = ⊥ := sorry

/-- `full_complex_empty`: Without relation blocks, D=R in degree zero and J=0. -/
example : ∀ k : ℕ, 0 < k → Limits.IsZero ((IntegralRibet.fullRelationComplex (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0) (by intro t; exact t.elim0)).X k) := sorry

/-- `full_complex_one_linear`: A single matrix relation has D₁=A⊗R→R with its four entries, and no repeated-block exterior terms. -/
example (X : Matrix (Fin 2) (Fin 2) A) :
    let C := IntegralRibet.fullRelationComplex (fun _ : Fin 1 ↦ X) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0) (by intro t; exact t.elim0)
    let d₁ : Matrix (Fin 2) (Fin 2) A →ₗ[A] A :=
      { toFun := fun Z ↦ ∑ i, ∑ j, X i j*Z i j
        map_add' := sorry
        map_smul' := sorry }
    ∃ e₁ : C.X 1 ≅ ModuleCat.of A (Matrix (Fin 2) (Fin 2) A),
      e₁.inv ≫ C.d 1 0 ≫ (IntegralRibet.fullRelationComplex_X_zero
        (fun _ : Fin 1 ↦ X) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0) (by intro t; exact t.elim0)).hom=ModuleCat.ofHom d₁ ∧
      ∀ k : ℕ, 2 ≤ k → Limits.IsZero (C.X k) := sorry

/-- `full_complex_local_pair`: For two distinct local blocks the four basis wedges give all four local relation entries; wedges from one block alone are excluded. -/
example (U V : Matrix (Fin 2) (Fin 2) A) (x y : A) :
    let X := IntegralRibet.localRelationMatrix U V x y
    let C := IntegralRibet.fullRelationComplex (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A) (fun _ : Fin 1 ↦ 2) (fun _ ↦ ![U,V]) (fun _ ↦ ![x,y])
    let d₁ : Matrix (Fin 2) (Fin 2) A →ₗ[A] A :=
      { toFun := fun Z ↦ ∑ i, ∑ j, X i j*Z i j
        map_add' := sorry
        map_smul' := sorry }
    ∃ e₁ : C.X 1 ≅ ModuleCat.of A (Matrix (Fin 2) (Fin 2) A),
      e₁.inv ≫ C.d 1 0 ≫ (IntegralRibet.fullRelationComplex_X_zero
        (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A) (fun _ : Fin 1 ↦ 2) (fun _ ↦ ![U,V]) (fun _ ↦ ![x,y])).hom=ModuleCat.ofHom d₁ ∧
      ∀ k : ℕ, 2 ≤ k → Limits.IsZero (C.X k) := sorry

/-- `initial_scalar_zero`: For ρ=ψI₂ and χ=ψ, M₀=0. -/
example {G : Type u} [Group G] (ψ : G →* Aˣ) : Limits.IsZero (IntegralRibet.initialModule (Fixtures.scalarRepresentation ψ) ψ ψ) := sorry

/-- `initial_upper_unipotent`: For the integral upper-unipotent representation of Z and χ=ψ=1, M₀≅Z. -/
example : Nonempty (IntegralRibet.initialModule Fixtures.upperUnipotent 1 1 ≃ₗ[ℤ] ℤ) := sorry

/-- `initial_universal_quotient`: An A-linear map Δψ→L factors uniquely through M₀ iff it annihilates every product (ρ(t)−χ(t))(ρ(u)−ψ(u)). -/
example {B G L : Type u} [CommRing B] [Algebra A B] [Group G] [AddCommGroup L] [Module A L] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) (f : IntegralRibet.differenceModule ρ ψ →ₗ[A] L) : (∃! f₀ : IntegralRibet.initialModule ρ χ ψ →ₗ[A] L, f₀.comp (IntegralRibet.initialModule_mk ρ χ ψ)=f) ↔ IntegralRibet.productInside ρ χ ψ ≤ f.ker := sorry

/-- `chain_image_zero`: For the zero complex the chain image is the zero ring. -/
example (C : CochainComplex (ModuleCat.{u} A) ℤ) (hC : Limits.IsZero C) : Subsingleton (((Algebra.ofId A (End C))).range) := sorry

/-- `chain_image_scalar`: The scalar action on A in degree zero has image A. -/
example : Nonempty (((Fixtures.scalarChain A)).range ≃ₐ[A] A) := sorry

/-- `chain_image_contractible`: For C=(A --1→ A), the identity chain map is nonzero if A≠0 although its homotopy and cohomology images are zero. -/
example [Nontrivial A] :
    (1 : End (Fixtures.contractible A))≠0 ∧
    Limits.IsZero ((HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).obj (Fixtures.contractible A)) := sorry

/-- `homotopy_image_contractible`: For a contractible complex the homotopy image is the zero ring. -/
example : Subsingleton ((Algebra.ofId A (End ((HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).obj (Fixtures.contractible A)))).range) := sorry

/-- `homotopy_image_scalar`: For A in degree zero, the scalar image is A. -/
example : Nonempty (((Fixtures.scalarHomotopy A)).range ≃ₐ[A] A) := sorry

/-- `homotopy_image_homotopy`: Chain-homotopic actions of each h give the same homotopy-image action; equal cohomology alone does not imply this. -/
example {H : Type u} [CommRing H] [Algebra A H]
    (C : CochainComplex (ModuleCat.{u} A) ℤ) (α β : H →ₐ[A] End C)
    (h : ∀ x : H, Nonempty (Homotopy (α x) (β x))) :
    ∀ x, (HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).map (α x)=
      (HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).map (β x) := sorry

/-- `cohomology_image_acyclic`: Every acyclic complex has zero cohomology image. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (hC : ∀ i : ℤ, Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)) : Subsingleton (((HeckeImage.cohomologyAction C).comp (Algebra.ofId A (End C))).range) := sorry

/-- `cohomology_image_scalar`: For A in degree zero the scalar image is A. -/
example : Nonempty (((HeckeImage.cohomologyAction (Fixtures.degreeZero A)).comp (Fixtures.scalarDerived A)).range ≃ₐ[A] A) := sorry

/-- `cohomology_image_ghost`: The nonzero off-diagonal Ext¹ ghost in the two-degree example maps to zero in the cohomology action. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (f : End C) (hf : f∈HeckeImage.ghostIdeal C) : HeckeImage.cohomologyAction C f=0 := sorry

/-- `gsp4_reverse_constant`: The coefficient of X⁰ is 1 and of X⁴ is q⁶T₀². -/
example (q t₀ t₁ t₂ : A) : ((SmoothRepresentationsOfLocalGroups.SpinPolynomial q t₀ t₂ t₁)).coeff 0=1 ∧ ((SmoothRepresentationsOfLocalGroups.SpinPolynomial q t₀ t₂ t₁)).coeff 4=q^6*t₀^2 := sorry

/-- `gsp4_reverse_indices`: Pilloni’s T_(ℓ,2) is the coefficient paired with X¹, matching CG20’s T₁. -/
example (q t₀ t₁ t₂ : A) : ((SmoothRepresentationsOfLocalGroups.SpinPolynomial q t₀ t₂ t₁)).coeff 1= -t₁ := sorry

/-- `gsp4_reverse_not_monic_inverse`: For q=2,T₀=1, the leading coefficient is 64; Q_rev is not the monic characteristic polynomial of r⁻¹. -/
example : ((SmoothRepresentationsOfLocalGroups.SpinPolynomial (2 : ℤ) 1 0 0)).coeff 4=64 ∧ ¬ ((SmoothRepresentationsOfLocalGroups.SpinPolynomial (2 : ℤ) 1 0 0)).Monic := sorry

/-- `generic_representation_degree_one`: For E=A,d=1,D=id, A_gen≅A. -/
example : Nonempty (CayleyHamilton.genericRepresentationRing ((Determinant.dimOneEquiv).symm (AlgHom.id A A)) (Fixtures.identity_ch A) ≃ₐ[A] A) := sorry

/-- `generic_representation_matrix`: For E=M_d(A),D=det, the identity representation gives a specialization A_gen→A. -/
example (d : ℕ) : Nonempty (CayleyHamilton.genericRepresentationRing (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))) (Fixtures.matrix_ch A d) →ₐ[A] A) := sorry

/-- `generic_representation_not_finite_module`: For d=2 and E=A×A with D(a,b)=ab, complementary rank-one idempotent matrices vary; over a field their coordinate ring has positive dimension and is not finite as a vector space. -/
example : ¬ Module.Finite ℚ (CayleyHamilton.genericRepresentationRing (Fixtures.productDeterminant ℚ) (Fixtures.product_ch ℚ)) := sorry

end Tests

/-! ## Unit tests: residual data, quotient constituents and Ribet lattices -/

section
open CategoryTheory
open scoped ModuleCat.Algebra
variable {A R : Type u} [CommRing A] [Ring R] [Algebra A R]

/-- `residual_ordered_projectors`: ordered residual constituents distinguish their
own diagonal idempotent from every other block. -/
example [IsLocalRing A] {s : ℕ} {size : Fin s → ℕ} (E : GMA.Data A R s size)
    (res : GMA.ResidualData E) (i j : Fin s) (hij : i ≠ j) :
    Matrix.charpoly (res.representation i (1 ⊗ₜ[A] E.idempotent i)) = (X-1)^(size i) ∧
    Matrix.charpoly (res.representation i (1 ⊗ₜ[A] E.idempotent j)) = X^(size i) := sorry

/-- `residual_triangular_product`: full determinant and prescribed diagonal factors
agree on triangular matrices, including the nonzero upper off-diagonal entry. -/
example {k : Type u} [Field k] (a b c : k) :
    let E := Fixtures.orderGMA k ⊥ false
    let res := Fixtures.triangularResidualData k
    let x : Fixtures.matrixOrder k ⊥ false := ⟨!![a,b;0,c], Fixtures.upper_mem k ⊥ a b c⟩
    res.representation 0 (1 ⊗ₜ[k] x) 0 0=IsLocalRing.residue k a ∧
    res.representation 1 (1 ⊗ₜ[k] x) 0 0=IsLocalRing.residue k c ∧
    (GMA.determinant E).residual.eval (1 ⊗ₜ[k] x)=IsLocalRing.residue k (a*c) := sorry

/-- `residual_repeated_rejected`: two isomorphic labelled constituents cannot be
ResidualData, even if their product has the requested total degree. -/
example [IsLocalRing A] {s : ℕ} {size : Fin s → ℕ} (E : GMA.Data A R s size)
    (res : GMA.ResidualData E) (i j : Fin s) (hij : i ≠ j)
    (T : (Fin (size j) → IsLocalRing.ResidueField A) ≃ₗ[IsLocalRing.ResidueField A]
      (Fin (size i) → IsLocalRing.ResidueField A))
    (hT : ∀ r x, T ((res.representation j r).mulVec x)=
      (res.representation i r).mulVec (T x)) : False := sorry

/-- `quotient_constituent_diagonal`: the two actual triangular constituents act by
their indicated diagonal entries, after the same coefficient quotient. -/
example (i : Fin 2) (r : Fixtures.matrixOrder A ⊥ false) :
    GMA.quotientRepresentation (Fixtures.orderGMA A ⊥ false) id i
      (by simp) ⊥ (Fixtures.triangular_partition A) (1 ⊗ₜ[A] r) 0 0 =
        Ideal.Quotient.mk (⊥ : Ideal A) (r.val i i) := sorry

/-- `quotient_constituent_nonzero`: the prescribed one-dimensional constituents
cannot be replaced by zero modules. -/
example {k : Type u} [Field k] (i : Fin 2) :
    ¬ Limits.IsZero (Fixtures.upperConstituent k i) := sorry

/-- `quotient_triangular_ext_orientation`: for the upper triangular algebra the
extension of the second diagonal character by the first is one-dimensional. -/
example {k : Type u} [Field k] :
    Nonempty (Abelian.Ext (Fixtures.upperConstituent k 1)
      (Fixtures.upperConstituent k 0) 1 ≃ₗ[k] k) := sorry

/-- `reducibility_prescribed_order`: the two factors of the triangular determinant
are uniquely fixed by the ordered residual reductions, even in characteristic two. -/
example {k : Type u} [Field k] :
    let E := Fixtures.orderGMA k ⊥ false
    ∃! F : Determinant (k ⧸ (⊥ : Ideal k)) ((k ⧸ (⊥ : Ideal k)) ⊗[k]
        Fixtures.matrixOrder k ⊥ false) 1 ×
      Determinant (k ⧸ (⊥ : Ideal k)) ((k ⧸ (⊥ : Ideal k)) ⊗[k]
        Fixtures.matrixOrder k ⊥ false) 1,
      ((GMA.determinant E).baseChange (k ⧸ (⊥ : Ideal k))).toLaw=(F.1.mul F.2).toLaw ∧
      GMA.residualFactor ⊥ bot_le F.1=
        Determinant.ofMatrix ((Fixtures.triangularResidualData k).representation 0) ∧
      GMA.residualFactor ⊥ bot_le F.2=
        Determinant.ofMatrix ((Fixtures.triangularResidualData k).representation 1) := sorry

/-- `ribet_lattice_oriented_iwahori`: on the standard lattice the upper-unipotent
unit witnesses the nonsplit extension of ψ (second diagonal) by χ (first). -/
example [IsDomain A] [IsDiscreteValuationRing A]
    (hdistinct : ∃ u : Aˣ, IsLocalRing.residue A (u : A) ≠ 1) :
    let χ := Fixtures.iwahoriDiagonal A 0
    let ψ := Fixtures.iwahoriDiagonal A 1
    χ ≠ ψ ∧
    (∀ g : (Fixtures.matrixOrder A (IsLocalRing.maximalIdeal A) false)ˣ,
      IsLocalRing.residue A (g.val.val 1 0)=0) ∧
    ∀ v : IsLocalRing.ResidueField A, ∃ g :
        (Fixtures.matrixOrder A (IsLocalRing.maximalIdeal A) false)ˣ,
      IsLocalRing.residue A (g.val.val 0 1) ≠ ((ψ g : IsLocalRing.ResidueField A)-
        (χ g : IsLocalRing.ResidueField A))*v := sorry

/-- `ribet_lattice_unipotent_witness`: the witness has both diagonal characters 1
and upper entry 1, so no change of splitting can kill that upper entry. -/
example [IsLocalRing A] :
    let g := Fixtures.iwahoriUpperUnipotent A (IsLocalRing.maximalIdeal A)
    Fixtures.iwahoriDiagonal A 0 g=1 ∧
    Fixtures.iwahoriDiagonal A 1 g=1 ∧
    IsLocalRing.residue A (g.val.val 0 1)=1 := sorry

/-- `symplectic_zero_form_rejected`: the zero-form equation satisfies every
matrix representation, but zero cannot be a nondegenerate alternating form. -/
example [Nontrivial A] : ¬ IsUnit (0 : Matrix (Fin 4) (Fin 4) A) := sorry

/-- `symplectic_standard_form`: the usual J is alternating and invertible over
any coefficient ring, including characteristic two. -/
example :
    let J : Matrix (Fin 4) (Fin 4) A := !![0,0,1,0;0,0,0,1;-1,0,0,0;0,-1,0,0]
    IsUnit J ∧ ∀ x : Fin 4 → A, dotProduct x (J.mulVec x)=0 := sorry

/-- `local_quotient_identity_compatibility`: in rank one and with Ã=A, a compatible
local corner already reduces to the given global character, and identity conjugation
preserves every selected generic fiber. -/
example {G : Type u} [Group G] (H : Subgroup G)
    (ρ : G →* (Matrix (Fin 1) (Fin 1) A)ˣ) :
    ∃ localRep : H →* (Matrix (Fin 1) (Fin 1) A)ˣ,
      ∀ h : H, (localRep h : Matrix (Fin 1) (Fin 1) A).map (RingHom.id A)=
        (ρ h : Matrix (Fin 1) (Fin 1) A) := sorry

/-- `local_quotient_incompatible_character`: an arbitrary local matrix with entry 2
cannot lift the global trivial character through the identity quotient Q→Q. -/
example : (!![(2 : ℚ)].map (RingHom.id ℚ) : Matrix (Fin 1) (Fin 1) ℚ) ≠ 1 := sorry
end

end

/-- The zero coefficient ring cannot be the total fraction ring of ℤ. This excludes
vacuous field-factor irreducibility as input to the Ribet theorems. -/
example : ¬ IsLocalization (nonZeroDivisors ℤ) (ZMod 1) := sorry

/-- Multiplication by two on ℤ has no ℤ-linear retraction; ℤ is not an injective ℤ-module. -/
example : ¬ ∃ f : ℤ →ₗ[ℤ] ℤ, f 2 = 1 := by
  intro ⟨f, hf⟩
  have h : f 2 = 2 * f 1 := by
    simpa using f.map_smul (2 : ℤ) (1 : ℤ)
  omega

/-- A unit diagonal matrix over ℤ/4 is injective despite zero-divisors in the base ring. -/
example : Function.Injective (Matrix.mulVec (1 : Matrix (Fin 2) (Fin 2) (ZMod 4))) := by
  intro x y h
  simpa only [Matrix.one_mulVec] using h

/-- Buchsbaum's two-form contraction on e₁∧e₂ is 1; the composite of the
one-form contractions in the same order is -1. -/
example : Matrix.det (!![(1 : ℤ),0;0,1]) = 1 ∧
    (0 : ℤ)*0 - 1*1 = -1 := by norm_num [Matrix.det_fin_two]

/-- A discrete noncompact source can have a continuous character of infinite image. -/
example : ¬ CompactSpace ℤ ∧ ∀ n : ℕ, 0 < n → (2 : ℚ)^n ≠ 1 := sorry

/-- In rank zero the GL polynomial is T₀; monicity requires T₀=1. -/
example : Spherical.glnPolynomial 0 (1 : ℤ) (fun _ ↦ 0) = 0 ∧
    ¬ (Spherical.glnPolynomial 0 (1 : ℤ) (fun _ ↦ 0)).Monic := sorry

/-- The degree-one identity character has zero Cayley–Hamilton ideal; dropping its
constant term leaves the identity function, whose values generate the unit ideal. -/
example : ((Determinant.dimOneEquiv (A := ℤ) (R := ℤ)).symm (AlgHom.id ℤ ℤ)).chIdeal = ⊥ ∧
    Ideal.span (Set.range (fun x : ℤ ↦ x)) = ⊤ := sorry

/-- For upper triangular matrices κ=b/ψ uses the lower diagonal character;
division by the upper diagonal gives the different value 1. -/
example :
    let g : Matrix (Fin 2) (Fin 2) ℚ := !![2,0;0,3]
    let h : Matrix (Fin 2) (Fin 2) ℚ := !![1,1;0,1]
    (g*h) 0 1 / (g*h) 1 1 = (2/3 : ℚ) ∧
    (g*h) 0 1 / (g*h) 0 0 = 1 ∧ (2/3 : ℚ) ≠ 1 := by
  norm_num [Matrix.mul_apply, Fin.sum_univ_two]

/-! ## Boundary computations for the coefficient and cycle interfaces -/
namespace BoundaryChecks
open CategoryTheory
variable {A R : Type u} [CommRing A] [Ring R] [Algebra A R]
example : ¬ PolynomialLaw.IsHomogeneousOfDegree 2 (PolynomialLaw.id : ℤ →ₚₗ[ℤ] ℤ) := sorry
example (a : A) :
    ((Determinant.dimOneEquiv (A := A) (R := A)).symm (AlgHom.id A A)).traceLinear a = a := sorry
example : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 2) (Fin 2) A))).traceLinear
    !![(2 : A),3;4,5] = 7 := sorry
example (D : Determinant A R 0) : D.traceLinear = 0 := sorry

example (f : R →ₐ[A] A) (r : R) : (Determinant.dimOneEquiv.symm f).eval r = f r := sorry
example : ((Determinant.dimOneEquiv (A := ℤ) (R := ℤ)).symm (AlgHom.id ℤ ℤ)).eval 2 = 2 := sorry
example : ((Determinant.dimOneEquiv (A := ZMod 2) (R := ZMod 2)).symm
    (AlgHom.id (ZMod 2) (ZMod 2))).charpoly 1 = X - 1 := sorry

example (x : Fin 2 → R) : cycleProduct (1 : Equiv.Perm (Fin 2)) x 0 = x 0 := sorry
example (x : Fin 2 → R) : cycleProduct (Equiv.swap (0 : Fin 2) 1) x 0 = x 0 * x 1 := sorry
example (x : Fin 2 → R) : cycleProduct (Equiv.swap (0 : Fin 2) 1) x 1 = x 1 * x 0 := sorry
example (T : R → A) : cycleTerm T (1 : Equiv.Perm (Fin 0)) Fin.elim0 = 1 := sorry
example (T : R → A) (x : Fin 2 → R) : cycleTerm T 1 x = T (x 0) * T (x 1) := sorry
example (T : R → A) (x : Fin 2 → R) :
    cycleTerm T (Equiv.swap (0 : Fin 2) 1) x = T (x 0 * x 1) := sorry

example {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) 2) :
    ((dimTwoEquiv G D).val.1 1 : A) = 1 := sorry
example {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) 2) :
    (dimTwoEquiv G D).val.2 1 = 2 := sorry
example {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) 2) (g : G) :
    (dimTwoEquiv G D).val.2 g = D.trace (MonoidAlgebra.of A G g) := sorry

example (d : ℕ) : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).kerTwoSided = ⊥ := sorry
example {n : ℕ} (r : Fin n → Matrix (Fin 2) (Fin 2) A) (α : Fin n →₀ ℕ) :
    (Determinant.ofMatrix (AlgHom.id A _)).chiCoeff r α = 0 := sorry
example : ((Determinant.dimOneEquiv (A := ℤ) (R := ℤ[X])).symm (Polynomial.aeval 0)).chiCoeff
    (fun _ : Fin 1 => X) (Finsupp.single 0 1) = X := sorry
example : ((Determinant.dimOneEquiv (A := ℤ) (R := ℤ[X])).symm (Polynomial.aeval 0)).chiCoeff
    (fun _ : Fin 1 => X) (Finsupp.single 0 2) = 0 := sorry

example {G : Type u} [Group G] {d : ℕ} (D : Determinant ℤ (MonoidAlgebra ℤ G) d) :
    D.coefficientSubring = ⊤ := sorry
example {G : Type u} [Group G] {d : ℕ} (D : Determinant A (MonoidAlgebra A G) d) (g : G) (i : ℕ) :
    (D.charpoly (MonoidAlgebra.of A G g)).coeff i ∈ D.coefficientSubring := sorry
example {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) 0) :
    D.coefficientSubring = ⊥ := sorry

example {M : Type u} [AddCommGroup M] [Module A M] (d : ℕ) :
    DividedPower.degree_map d (LinearMap.id : M →ₗ[A] M) = LinearMap.id := sorry
example {M : Type u} [AddCommGroup M] [Module A M] (m : M) :
    DividedPower.degree_map 0 (0 : M →ₗ[A] M) (DividedPower.gamma 0 m) = DividedPower.gamma 0 m := sorry
example {M : Type u} [AddCommGroup M] [Module A M] (m : M) :
    DividedPower.degree_map 1 (0 : M →ₗ[A] M) (DividedPower.gamma 1 m) = 0 := sorry

/-! Corners and invariant subspaces. -/
example : TauCeti.cornerSubmodule A (0 : R) 0 = ⊥ := sorry
example : TauCeti.cornerSubmodule A (1 : R) 1 = ⊤ := sorry
example : TauCeti.cornerSubmodule ℤ (Matrix.diagonal ![1,0] : Matrix (Fin 2) (Fin 2) ℤ) (Matrix.diagonal ![1,0]) =
    Submodule.span ℤ {Matrix.single (0 : Fin 2) 0 (1 : ℤ)} := sorry
example : Subsingleton (Corner A R 0 (by simp)) := sorry
example : Nonempty (Corner A R 1 (by simp) ≃ₐ[A] R) := sorry
example : (1 : Corner ℤ (Matrix (Fin 2) (Fin 2) ℤ) (Matrix.diagonal ![1,0]) (Fixtures.diagonal_two_idem ℤ)).val =
    Matrix.diagonal ![1,0] := sorry
example (x : R) : (cornerLift (A := A) 1 (by simp) x (by exact ⟨x, by simp [TauCeti.cornerMap_apply]⟩) : R) = x := sorry
example : (cornerLift (A := A) (0 : R) (by simp) 0 (by exact Submodule.zero_mem _) : R) = 0 := sorry
example : (cornerLift (A := ℤ) (Matrix.diagonal ![1,0] : Matrix (Fin 2) (Fin 2) ℤ)
    (Fixtures.diagonal_two_idem ℤ) (Matrix.single 0 0 3) (Fixtures.diagonal_corner_mem ℤ 3) : Matrix (Fin 2) (Fin 2) ℤ) = !![3,0;0,0] := sorry

example {d : ℕ} (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) : ∀ r x, x ∈ (⊥ : Submodule A (Fin d → A)) → (ρ r).mulVec x ∈ (⊥ : Submodule A (Fin d → A)) := sorry
example {d : ℕ} (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) : ∀ r x, x ∈ (⊤ : Submodule A (Fin d → A)) → (ρ r).mulVec x ∈ (⊤ : Submodule A (Fin d → A)) := sorry
example : ¬ (∀ (r : Matrix (Fin 2) (Fin 2) ℚ) x, x ∈ Submodule.span ℚ {![1,0]} →
    r.mulVec x ∈ Submodule.span ℚ {![1,0]}) := sorry
example {k : Type u} [Field k] (d : ℕ) (hd : 0 < d) :
    IsSimpleModule (Matrix (Fin d) (Fin d) k) (matrixModule (AlgHom.id k (Matrix (Fin d) (Fin d) k))) := sorry
example : ¬ IsSimpleModule (MonoidAlgebra ℤ (Multiplicative ℤ)) (matrixModule Fixtures.upperUnipotent) := sorry
example : ¬ IsSimpleModule (MonoidAlgebra ℚ PUnit) (matrixModule (Fixtures.scalarRepresentation (1 : PUnit →* ℚˣ))) := sorry
example {k : Type u} [Field k] (d : ℕ) :
    IsSemisimpleModule (Matrix (Fin d) (Fin d) k) (matrixModule (AlgHom.id k (Matrix (Fin d) (Fin d) k))) := sorry
example : IsSemisimpleModule (MonoidAlgebra ℚ PUnit) (matrixModule (Fixtures.scalarRepresentation (1 : PUnit →* ℚˣ))) := sorry
example : ¬ IsSemisimpleModule (MonoidAlgebra ℤ (Multiplicative ℤ)) (matrixModule Fixtures.upperUnipotent) := sorry

/-! Matrix blocks distinguish a block from a primitive entry. -/
example (d : ℕ) (hd : 0 < d) :
    GMA.blockModule (Fixtures.oneBlockGMA A d hd) 0 0 = ⊤ := sorry
example (s : ℕ) (i j : Fin s) :
    GMA.blockModule (Fixtures.matrixGMA A s) i j =
      Submodule.span A {Matrix.single i j (1 : A)} := sorry
example : GMA.blockModule (Fixtures.orderGMA A ⊥ false) 1 0 = ⊥ := sorry
example (s : ℕ) (i : Fin s) :
    GMA.primitive (Fixtures.matrixGMA A s) i = Matrix.single i i 1 := sorry
example : GMA.primitive (Fixtures.oneBlockGMA A 2 (by decide)) 0 =
    Matrix.single (0 : Fin 2) 0 1 := sorry
example : GMA.primitive (Fixtures.oneBlockGMA A 1 (by decide)) 0 = 1 := sorry
example (a b c d : A) :
    (GMA.peirce (Fixtures.matrixGMA A 2) !![a,b;c,d] 0 1 : Matrix (Fin 2) (Fin 2) A) = !![0,b;0,0] := sorry
example : GMA.peirce (Fixtures.matrixGMA A 2) 0 = 0 := sorry
example : (GMA.peirce (Fixtures.oneBlockGMA A 2 (by decide)) 1 0 0 :
    Matrix (Fin 2) (Fin 2) A) = 1 := sorry
example (a b : A) :
    (GMA.pairing (Fixtures.matrixGMA A 2)
      (⟨Matrix.single 0 1 a, Fixtures.matrix_entry_mem A 2 0 1 a⟩ : GMA.entryModule (Fixtures.matrixGMA A 2) 0 1)
      (⟨Matrix.single 1 0 b, Fixtures.matrix_entry_mem A 2 1 0 b⟩ : GMA.entryModule (Fixtures.matrixGMA A 2) 1 0) :
      Matrix (Fin 2) (Fin 2) A) = Matrix.single 0 0 (a*b) := sorry
example (x : GMA.entryModule (Fixtures.orderGMA A ⊥ false) 0 1)
    (y : GMA.entryModule (Fixtures.orderGMA A ⊥ false) 1 0) :
    GMA.pairing (Fixtures.orderGMA A ⊥ false) x y = 0 := sorry
example : (GMA.pairing (Fixtures.matrixGMA ℤ 3)
    (⟨Matrix.single 0 1 2, Fixtures.matrix_entry_mem ℤ 3 0 1 2⟩ : GMA.entryModule (Fixtures.matrixGMA ℤ 3) 0 1)
    (⟨Matrix.single 1 2 3, Fixtures.matrix_entry_mem ℤ 3 1 2 3⟩ : GMA.entryModule (Fixtures.matrixGMA ℤ 3) 1 2) :
    Matrix (Fin 3) (Fin 3) ℤ) = Matrix.single 0 2 6 := sorry
example : GMA.partitionReducibilityIdeal (Fixtures.matrixGMA A 2) (fun _ => (0 : Fin 1)) = ⊥ := sorry
example : GMA.partitionReducibilityIdeal (Fixtures.matrixGMA A 2) (id : Fin 2 → Fin 2) = ⊤ := sorry
example : GMA.partitionReducibilityIdeal (Fixtures.orderGMA A ⊥ false) (id : Fin 2 → Fin 2) = ⊥ := sorry
example : GMA.intermediateProducts (Fixtures.matrixGMA A 2) 0 1 = ⊥ := sorry
example : GMA.intermediateProducts (Fixtures.matrixGMA A 3) 0 2 = ⊤ := sorry
example : GMA.intermediateProducts (Fixtures.orderGMA A ⊥ false) 0 1 = ⊥ := sorry
example : Nonempty (GMA.extensionModule (Fixtures.matrixGMA A 2) 0 1 ≃ₗ[A] A) := sorry
example : Subsingleton (GMA.extensionModule (Fixtures.matrixGMA A 3) 0 2) := sorry
example : Subsingleton (GMA.extensionModule (Fixtures.orderGMA A ⊥ false) 1 0) := sorry

/-! Difference maps and the quotient by products. -/
example {G : Type u} [Group G] (ψ : G →* Aˣ) :
    IntegralRibet.differenceMap (Fixtures.scalarRepresentation ψ) ψ = 0 := sorry
example (n : ℤ) : IntegralRibet.differenceMap Fixtures.upperUnipotent 1
    (MonoidAlgebra.of ℤ (Multiplicative ℤ) (Multiplicative.ofAdd n)) = !![0,n;0,0] := sorry
example {G : Type u} [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A)
    (ψ : G →* Aˣ) : IntegralRibet.differenceMap ρ ψ 1 = 0 := sorry
example {G : Type u} [Group G] (ψ : G →* Aˣ) :
    IntegralRibet.differenceProduct (Fixtures.scalarRepresentation ψ) ψ ψ = ⊥ := sorry
example : IntegralRibet.differenceProduct Fixtures.upperUnipotent 1 1 = ⊥ := sorry
example {G : Type u} [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A)
    (χ ψ : G →* Aˣ) : IntegralRibet.differenceProduct ρ χ ψ ≤ IntegralRibet.differenceModule ρ ψ := sorry
example {G : Type u} [Group G] (ψ : G →* Aˣ) :
    IntegralRibet.productInside (Fixtures.scalarRepresentation ψ) ψ ψ = ⊥ := sorry
example : IntegralRibet.productInside Fixtures.upperUnipotent 1 1 = ⊥ := sorry
example {G : Type u} [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A)
    (χ ψ : G →* Aˣ) (x : IntegralRibet.differenceModule ρ ψ) :
    x ∈ IntegralRibet.productInside ρ χ ψ ↔
      (x : Matrix (Fin 2) (Fin 2) A) ∈ IntegralRibet.differenceProduct ρ χ ψ := Iff.rfl
example {G : Type u} [Group G] (ψ : G →* Aˣ) :
    IntegralRibet.initialModule_mk (Fixtures.scalarRepresentation ψ) ψ ψ = 0 := sorry
example : Function.Injective (IntegralRibet.initialModule_mk Fixtures.upperUnipotent 1 1) := sorry
example {G : Type u} [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A)
    (χ ψ : G →* Aˣ) : LinearMap.ker (IntegralRibet.initialModule_mk ρ χ ψ) =
      IntegralRibet.productInside ρ χ ψ := sorry
example {G : Type u} [Group G] (ψ : G →* Aˣ) (g : G) :
    IntegralRibet.differenceClass (Fixtures.scalarRepresentation ψ) ψ ψ g = 0 := sorry
example (n : ℤ) : Fixtures.upperUnipotentInitial
    (IntegralRibet.differenceClass Fixtures.upperUnipotent 1 1 (Multiplicative.ofAdd n)) = n := sorry
example {G : Type u} [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A)
    (χ ψ : G →* Aˣ) : IntegralRibet.differenceClass ρ χ ψ 1 = 0 := sorry

/-- `extra_places_middle`: removing the middle distinguished place retains both endpoints. -/
example {G : Type u} [Group G] (L : IntegralRibet.LocalData G) (hc : L.count = 3)
    (hσ : L.sigma = Finset.univ) (hδ : L.distinguished = some ⟨1, by omega⟩) :
    IntegralRibet.extraPlaces L = {⟨0, by omega⟩, ⟨2, by omega⟩} := sorry
example {G : Type u} [Group G] : IntegralRibet.extraPlaces (Fixtures.emptyLocal G) = ∅ := rfl
example {G : Type u} [Group G] : IntegralRibet.extraPlaces (Fixtures.fullLocal G) = ∅ := sorry
example {G : Type u} [Group G] : IntegralRibet.extraPlaces (Fixtures.extraLocal G) = {⟨1, by change 1 < 2; decide⟩} := sorry
example {G : Type u} [Group G] (ψ : G →* Aˣ) :
    IntegralRibet.localRelations (Fixtures.emptyLocal G) (Fixtures.scalarRepresentation ψ) ψ ψ = ⊥ := sorry
example : IntegralRibet.localRelations (Fixtures.fullLocal (Multiplicative ℤ))
    Fixtures.upperUnipotent 1 1 = ⊤ := sorry
example {G : Type u} [Group G] (ψ : G →* Aˣ) :
    IntegralRibet.localRelations (Fixtures.extraLocal G) (Fixtures.scalarRepresentation ψ) ψ ψ = ⊥ := sorry
example {G : Type u} [Group G] (ψ : G →* Aˣ) (g : G) :
    IntegralRibet.localCocycle (Fixtures.emptyLocal G) (Fixtures.scalarRepresentation ψ) ψ ψ g = 0 := sorry
example (n : ℤ) : IntegralRibet.localCocycle (Fixtures.fullLocal (Multiplicative ℤ))
    Fixtures.upperUnipotent 1 1 (Multiplicative.ofAdd n) = 0 := sorry
example {G : Type u} [Group G] (ψ : G →* Aˣ) (g : G) :
    IntegralRibet.localCocycle (Fixtures.extraLocal G) (Fixtures.scalarRepresentation ψ) ψ ψ g = 0 := sorry

example : Tests.Fixtures.complexRegular (1 : ℂ) = 1 := sorry
example : Tests.Fixtures.complexRegular Complex.I = !![(0 : ℝ),-1;1,0] := sorry
example (a : ℝ) : Tests.Fixtures.complexRegular (a : ℂ) = Matrix.scalar (Fin 2) a := sorry

/-! Formal coordinates, relation ideals and conjugation. -/
example : IntegralRibet.formalMatrix 0 1 {0} 0 0 1 = 0 := sorry
example : IntegralRibet.formalMatrix 0 1 ∅ 0 0 1 ≠ 0 := sorry
example : IntegralRibet.formalMatrix 0 1 {0} 0 1 0 ≠ 0 := sorry
example : IntegralRibet.formalCoefficient 1 0 ∅ 0 ≠ 0 := sorry
example : IntegralRibet.formalCoefficient 2 0 ∅ 0 ≠ IntegralRibet.formalCoefficient 2 0 ∅ 1 := sorry
example : IntegralRibet.formalRing_eval 1 0 ∅ ℤ (fun _ => 7) Fin.elim0 (by simp)
    (IntegralRibet.formalCoefficient 1 0 ∅ 0) = 7 := sorry
example : IntegralRibet.formalRing_eval 0 1 ∅ ℤ Fin.elim0 (fun _ => !![1,2;3,4]) (by simp)
    (IntegralRibet.formalMatrix 0 1 ∅ 0 0 1) = 2 := sorry
example : IntegralRibet.formalRing_eval 0 1 {0} ℤ Fin.elim0 (fun _ => !![1,0;3,4]) (by intro i hi; rfl)
    (IntegralRibet.formalMatrix 0 1 {0} 0 0 1) = 0 := sorry
example : IntegralRibet.formalRing_eval 1 0 ∅ ℤ (fun _ => 7) Fin.elim0 (by simp)
    (IntegralRibet.formalCoefficient 1 0 ∅ 0 + 1) = 8 := sorry
example : IntegralRibet.relationIdeal (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) ℤ) = ⊥ := sorry
example : IntegralRibet.relationIdeal (fun _ : Fin 1 => (!![2,0;0,4] : Matrix (Fin 2) (Fin 2) ℤ)) =
    Ideal.span {(2 : ℤ)} := sorry
example : IntegralRibet.relationIdeal (fun _ : Fin 1 => (1 : Matrix (Fin 2) (Fin 2) ℤ)) = ⊤ := sorry
example : IntegralRibet.upperRelationIdeal (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) ℤ) = ⊥ := sorry
example : IntegralRibet.upperRelationIdeal (fun _ : Fin 1 => (!![2,3;4,5] : Matrix (Fin 2) (Fin 2) ℤ)) =
    Ideal.span {(3 : ℤ)} := sorry
example : IntegralRibet.upperRelationIdeal (fun _ : Fin 1 => (1 : Matrix (Fin 2) (Fin 2) ℤ)) = ⊥ := sorry
example : IntegralRibet.localRelationMatrix (0 : Matrix (Fin 2) (Fin 2) ℤ) 0 2 3 = -6 • (1 : Matrix (Fin 2) (Fin 2) ℤ) := sorry
example : IntegralRibet.localRelationMatrix (0 : Matrix (Fin 2) (Fin 2) ℤ) 0 0 0 = 0 := sorry
example : IntegralRibet.localRelationMatrix (!![1,2;3,4] : Matrix (Fin 2) (Fin 2) ℤ) !![5,6;7,8] 9 10 =
    !![-2,-38; -29,-7] := sorry
example : IntegralRibet.lowerBorelConjugate (0 : Matrix (Fin 2) (Fin 2) ℤ) = 0 := sorry
example : IntegralRibet.lowerBorelConjugate (1 : Matrix (Fin 2) (Fin 2) ℤ) = 1 := sorry
example : IntegralRibet.lowerBorelConjugate (Matrix.single (0 : Fin 2) 1 (1 : ℤ)) 0 1 =
    (IntegralRibet.borelCoordinate 1 * IntegralRibet.borelCoordinate 3) ⊗ₜ[ℤ] (1 : ℤ) := sorry
example : IntegralRibet.wordEvaluation (fun _ : Fin 1 => (3 : ℤ)) (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) ℤ)
    (FreeAlgebra.ι ℤ (Sum.inl 0)) = Matrix.scalar (Fin 2) 3 := sorry
example : IntegralRibet.wordEvaluation (Fin.elim0 : Fin 0 → ℤ) (fun _ : Fin 1 => !![1,2;3,4])
    (FreeAlgebra.ι ℤ (Sum.inr 0)) = !![1,2;3,4] := sorry
example : IntegralRibet.wordEvaluation (Fin.elim0 : Fin 0 → ℤ) (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) ℤ) 1 = 1 := sorry
example : IntegralRibet.invariantSubring (Fin.elim0 : Fin 0 → ℤ)
    (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) ℤ) ∅ = ⊤ := sorry
example : IntegralRibet.formalCoefficient 1 0 ∅ 0 ∈
    IntegralRibet.invariantSubring (IntegralRibet.formalCoefficient 1 0 ∅)
      (IntegralRibet.formalMatrix 1 0 ∅) ∅ := sorry
example : IntegralRibet.formalMatrix 0 1 {0} 0 1 1 ∈
    IntegralRibet.invariantSubring (IntegralRibet.formalCoefficient 0 1 {0})
      (IntegralRibet.formalMatrix 0 1 {0}) {0} := sorry
example : IntegralRibet.borelInvariants (IntegralRibet.formalRing_borel 0 0 ∅) = ⊤ := sorry
example : Matrix.trace (IntegralRibet.formalMatrix 0 1 ∅ 0) ∈
    IntegralRibet.borelInvariants (IntegralRibet.formalRing_borel 0 1 ∅) := sorry
example : IntegralRibet.formalMatrix 0 1 ∅ 0 0 1 ∉
    IntegralRibet.borelInvariants (IntegralRibet.formalRing_borel 0 1 ∅) := sorry

/-! Auxiliary representations and nilpotent-free quotients. -/
example : (Fixtures.productDeterminant (A := ℤ)).eval (2,3) = 6 := sorry
example : (Fixtures.productDeterminant (A := ℤ)).eval (0,3) = 0 := sorry
example : (Fixtures.productDeterminant (A := ℤ)).charpoly (2,3) = X^2-C 5*X+C 6 := sorry
example : (Fixtures.unipotentUnits ℚ (Multiplicative.ofAdd 0) : Matrix (Fin 2) (Fin 2) ℚ) = 1 := sorry
example : (Fixtures.unipotentUnits ℚ (Multiplicative.ofAdd 2) : Matrix (Fin 2) (Fin 2) ℚ) = !![1,2;0,1] := sorry
example : (Fixtures.unipotentUnits (ZMod 2)).ker ≠ ⊥ := sorry
example : (Fixtures.oneBlockGMA A 2 (by decide)).idempotent 0 = 1 := rfl
example : (Fixtures.oneBlockGMA A 1 (by decide)).trace (Matrix.scalar (Fin 1) (3 : A)) = 3 := sorry
example : (Fixtures.oneBlockGMA (ZMod 2) 2 (by decide)).trace 1 = 0 := sorry
example : Subsingleton (CHQuotient (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 0) (Fin 0) A)))) := sorry
example : Nonempty (CHQuotient (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 2) (Fin 2) A))) ≃ₐ[A]
    Matrix (Fin 2) (Fin 2) A) := sorry
example : Nonempty (CHQuotient ((Determinant.dimOneEquiv (A := ℤ) (R := ℤ[X])).symm (Polynomial.aeval 0)) ≃ₐ[ℤ] ℤ) := sorry
example : (chQuotientMap ((Determinant.dimOneEquiv (A := ℤ) (R := ℤ[X])).symm (Polynomial.aeval 0))) X = 0 := sorry
example : Function.Injective (chQuotientMap (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 2) (Fin 2) A)))) := sorry
example : Function.Surjective (chQuotientMap (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 2) (Fin 2) A)))) := sorry
example : Nonempty (Theorems.FaithfulQuotient (Fixtures.productDeterminant (A := ℤ)) ≃+* ℤ × ℤ) := sorry
example : Nonempty (Theorems.FaithfulQuotient (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 2) (Fin 2) A))) ≃+*
    Matrix (Fin 2) (Fin 2) A) := sorry
example : Nonempty (Theorems.FaithfulQuotient ((Determinant.dimOneEquiv (A := ℤ) (R := ℤ[X])).symm (Polynomial.aeval 0)) ≃+* ℤ) := sorry

/-! Local-data boundaries and scalar actions. -/
example {G : Type u} [Group G] : (Fixtures.emptyLocal G).count = 0 := rfl
example {G : Type u} [Group G] : (Fixtures.emptyLocal G).sigma = ∅ := rfl
example {G : Type u} [Group G] : (Fixtures.emptyLocal G).distinguished = none := rfl
example {G : Type u} [Group G] : (Fixtures.fullLocal G).count = 1 := rfl
example {G : Type u} [Group G] : (Fixtures.fullLocal G).subgroup ⟨0, by change 0 < 1; decide⟩ = ⊤ := rfl
example {G : Type u} [Group G] : (Fixtures.fullLocal G).distinguished = some ⟨0, by change 0 < 1; decide⟩ := rfl
example {G : Type u} [Group G] : (Fixtures.extraLocal G).count = 2 := rfl
example {G : Type u} [Group G] : (Fixtures.extraLocal G).subgroup ⟨1, by change 1 < 2; decide⟩ = ⊥ := rfl
example {G : Type u} [Group G] : (Fixtures.extraLocal G).sigma = Finset.univ := rfl
example {G : Type u} [Group G] (L : IntegralRibet.LocalData G) (h : L.count = 0) : L.distinguished = none := sorry
example {G : Type u} [Group G] (L : IntegralRibet.LocalData G) (h : L.sigma = ∅) : L.distinguished = none := sorry
example {G : Type u} [Group G] (L : IntegralRibet.LocalData G) (h : L.sigma.Nonempty) : L.distinguished ≠ none := sorry
example {G : Type u} [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A)
    (χ ψ : G →* Aˣ) : Nonempty (IntegralRibet.enlargedModule (Fixtures.emptyLocal G) ρ χ ψ ≃ₗ[A]
      IntegralRibet.initialModule ρ χ ψ) := sorry
example {G : Type u} [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A)
    (χ ψ : G →* Aˣ) : Nonempty (IntegralRibet.enlargedModule (Fixtures.fullLocal G) ρ χ ψ ≃ₗ[A]
      IntegralRibet.initialModule ρ χ ψ) := sorry
example {G : Type u} [Group G] (ψ : G →* Aˣ) : Nonempty
    (IntegralRibet.enlargedModule (Fixtures.extraLocal G) (Fixtures.scalarRepresentation ψ) ψ ψ ≃ₗ[A] A) := sorry
example {G : Type u} [Group G] : IsEmpty {v // v ∈ IntegralRibet.extraPlaces (Fixtures.emptyLocal G)} := sorry
example {G : Type u} [Group G] : IsEmpty {v // v ∈ IntegralRibet.extraPlaces (Fixtures.fullLocal G)} := sorry
example {G : Type u} [Group G] [Nontrivial A] (ψ : G →* Aˣ) :
    IntegralRibet.localVector (Fixtures.extraLocal G) (Fixtures.scalarRepresentation ψ) ψ ψ ⟨⟨1, by change 1 < 2; decide⟩, by
      change (1 : Fin 2) ∈ (Finset.univ.filter fun v : Fin 2 ↦
        (some (0 : Fin 2) : Option (Fin 2)) ≠ some v)
      decide⟩ ≠ 0 := sorry
example : Fixtures.upperUnipotentInitial (0 : IntegralRibet.initialModule Fixtures.upperUnipotent 1 1) = 0 := sorry
example : Fixtures.upperUnipotentInitial
    (IntegralRibet.differenceClass Fixtures.upperUnipotent 1 1 (Multiplicative.ofAdd 1)) = 1 := sorry
example : Fixtures.upperUnipotentInitial
    (IntegralRibet.differenceClass Fixtures.upperUnipotent 1 1 (Multiplicative.ofAdd (-2))) = -2 := sorry
example : Nonempty ((Fixtures.degreeZeroChain A).X 0 ≅ ModuleCat.of A A) := sorry
example : Limits.IsZero ((Fixtures.degreeZeroChain A).X 1) := sorry
example : (Fixtures.degreeZeroChain A).d 0 1 = 0 := sorry
example : Nonempty ((Fixtures.contractible A).X 0 ≅ ModuleCat.of A A) := sorry
example : Nonempty ((Fixtures.contractible A).X 1 ≅ ModuleCat.of A A) := sorry
example (i : ℤ) : Limits.IsZero ((Fixtures.contractible A).homology i) := sorry
example : Fixtures.scalarChain A 0 = 0 := sorry
example : Fixtures.scalarChain A 1 = 𝟙 _ := sorry
example : Fixtures.scalarChain A 2 = 𝟙 _ + 𝟙 _ := sorry
example : Fixtures.scalarHomotopy A 0 = 0 := sorry
example : Fixtures.scalarHomotopy A 1 = 𝟙 _ := sorry
example : Fixtures.scalarHomotopy A 2 = 𝟙 _ + 𝟙 _ := sorry
example [IsLocalRing A] {d : ℕ} (D : Determinant A R d) :
    D.residual = D.baseChange (IsLocalRing.ResidueField A) := sorry
example [IsLocalRing A] {d : ℕ} (D : Determinant A R d) (r : R) :
    D.residual.eval (1 ⊗ₜ[A] r) = IsLocalRing.residue A (D.eval r) := sorry
example : (Fixtures.productDeterminant (A := ZMod 2)).residual.trace
    (1 ⊗ₜ[ZMod 2] ((1,1) : ZMod 2 × ZMod 2)) = 0 := sorry
example (f : DividedPower.degree A A 0 →ₐ[A] A) (a : A) :
    ((DividedPower.multiplicativeLawEquiv 0 A) f).val.ground a = 1 := sorry
example (f : DividedPower.degree A A 1 →ₐ[A] A) (a : A) :
    ((DividedPower.multiplicativeLawEquiv 1 A) f).val.ground a = a := sorry
example (f : DividedPower.degree A A 2 →ₐ[A] A) (a : A) :
    ((DividedPower.multiplicativeLawEquiv 2 A) f).val.ground a = a^2 := sorry
end BoundaryChecks

noncomputable section MoreBoundaryChecks
open CategoryTheory
open scoped ZeroObject
variable {A : Type u} [CommRing A]

example {G : Type u} [Group G] {d : ℕ} (D : Determinant A (MonoidAlgebra A G) d) :
    D.dual.charpoly (MonoidAlgebra.of A G 1) = (X-1)^d := sorry
example {G : Type u} [Group G] {d : ℕ} (D : Determinant A (MonoidAlgebra A G) d) :
    D.twist 1 = D := sorry
example {G : Type u} [Group G] {d : ℕ} (D : Determinant A (MonoidAlgebra A G) d)
    (θ : G →* Aˣ) (g : G) :
    (D.twist θ).eval (MonoidAlgebra.of A G g) = (θ g : A)^d * D.eval (MonoidAlgebra.of A G g) := sorry
example {G : Type u} [Group G] (χ θ : G →* Aˣ) :
    (Determinant.ofMatrix (Fixtures.rankOne χ)).twist θ =
      Determinant.ofMatrix (Fixtures.rankOne (θ*χ)) := sorry

example {G : Type u} [Group G] (C : InvariantCoordinateInput A)
    (Θ : ReductivePseudocharacter G C A) : ReductivePseudocharacter.restrict C Θ (MonoidHom.id G) = Θ := sorry
example {G H : Type u} [Group G] [Group H] (C : InvariantCoordinateInput A)
    (Θ : ReductivePseudocharacter G C A) (f : C.ring 1) (h : Fin 1 → H) :
    (ReductivePseudocharacter.restrict C Θ (1 : H →* G)).theta 1 f h = Θ.theta 1 f (fun _ => 1) := sorry
example {G H K : Type u} [Group G] [Group H] [Group K] (C : InvariantCoordinateInput A)
    (Θ : ReductivePseudocharacter G C A) (φ : H →* G) (ψ : K →* H) :
    ReductivePseudocharacter.restrict C (ReductivePseudocharacter.restrict C Θ φ) ψ =
      ReductivePseudocharacter.restrict C Θ (φ.comp ψ) := sorry

example : Nonempty (HeckeImage.moduleTelescope (ModuleCat.of ℤ ℤ) LinearMap.id ≃ₗ[ℤ] ℤ) := sorry
example : Subsingleton (HeckeImage.moduleTelescope (ModuleCat.of ℤ ℤ) 0) := sorry
example : Nonempty (HeckeImage.moduleTelescope (ModuleCat.of ℤ (ℤ × ℤ))
    ((LinearMap.inl ℤ ℤ ℤ).comp (LinearMap.fst ℤ ℤ ℤ)) ≃ₗ[ℤ] ℤ) := sorry

example {m n : ℕ} (f : (Fin n → A) →ₗ[A] (Fin m → A)) : BuchsbaumRim.prefixMap f 0 (Nat.zero_le n) = 0 := sorry
example {m n : ℕ} (f : (Fin n → A) →ₗ[A] (Fin m → A)) : BuchsbaumRim.prefixMap f n (le_refl n) = f := sorry
example : BuchsbaumRim.prefixMap (Matrix.toLin' (!![(2 : ℤ),3;4,5])) 1 (by decide) ![7] = ![14,28] := sorry
example : BuchsbaumRim.maximalMinorIdeal (LinearMap.id : (Fin 2 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ)) = ⊤ := sorry
example : BuchsbaumRim.maximalMinorIdeal (0 : (Fin 3 → ℤ) →ₗ[ℤ] (Fin 2 → ℤ)) = ⊥ := sorry
example : BuchsbaumRim.maximalMinorIdeal (Matrix.toLin' (!![(2 : ℤ),0;0,3])) = Ideal.span {(6 : ℤ)} := sorry

example : Theorems.genericMatrix (Fin 1) 1 0 0 0 = MvPolynomial.X (0,0,0) := sorry
example : Theorems.genericMatrix (Fin 1) 2 0 0 1 ≠ Theorems.genericMatrix (Fin 1) 2 0 1 0 := sorry
example : Theorems.genericMatrix (Fin 1) 0 0 = 0 := sorry
example : Theorems.matrixWordCoefficients (Fin 0) 2 = ⊥ := sorry
example : Theorems.matrixWordCoefficients (Fin 1) 1 = ⊤ := sorry
example : (Theorems.genericMatrix (Fin 1) 2 0).det ∈ Theorems.matrixWordCoefficients (Fin 1) 2 := sorry

example {G : Type u} [Group G] (χ : G →* Aˣ) :
    Theorems.RibetCongruence (Fixtures.scalarRepresentation χ) χ χ ⊥ := sorry
example : Theorems.RibetCongruence Fixtures.upperUnipotent 1 1 ⊥ := sorry
example {G : Type u} [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A)
    (χ ψ : G →* Aˣ) : Theorems.RibetCongruence ρ χ ψ ⊤ := sorry
example {G : Type} [Group G] (χ : G →* ℚˣ) :
    ¬ Theorems.RibetIrreducibleOn (Fixtures.scalarRepresentation χ) (RingHom.id ℚ) := sorry
example : ¬ Theorems.RibetIrreducibleOn Fixtures.upperUnipotent (Int.castRingHom ℚ) := sorry
example {G : Type} [Group G] (χ : G →* ℚˣ) :
    ¬ Theorems.RibetIrreducible (Fixtures.scalarRepresentation χ) := sorry
example {G : Type} [Group G] (χ : G →* (ZMod 1)ˣ) :
    Theorems.RibetIrreducible (Fixtures.scalarRepresentation χ) := sorry
example : ¬ Theorems.RibetIrreducible Fixtures.upperUnipotent := sorry

example (J : Ideal A) : ((Fixtures.iwahoriUpperUnipotent (A := A) J).val.val : Matrix (Fin 2) (Fin 2) A) = !![1,1;0,1] := sorry
example (J : Ideal A) : ((Fixtures.iwahoriUpperUnipotent (A := A) J)⁻¹).val.val = !![1,-1;0,1] := sorry
example (J : Ideal A) : ((Fixtures.iwahoriUpperUnipotent (A := A) J)^2).val.val = !![1,2;0,1] := sorry
example [IsLocalRing A] : Fixtures.iwahoriDiagonal (A := A) 0 (Fixtures.iwahoriUpperUnipotent (A := A) (IsLocalRing.maximalIdeal A)) = 1 := sorry
example [IsLocalRing A] : Fixtures.iwahoriDiagonal (A := A) 1 (Fixtures.iwahoriUpperUnipotent (A := A) (IsLocalRing.maximalIdeal A)) = 1 := sorry
example [IsLocalRing A] (i : Fin 2) : Fixtures.iwahoriDiagonal (A := A) i 1 = 1 := sorry

example : Theorems.RibetIrreducibleOn
    (MonoidAlgebra.lift ℚ (Matrix (Fin 2) (Fin 2) ℚ)
      (Matrix (Fin 2) (Fin 2) ℚ)ˣ (Units.coeHom _)) (RingHom.id ℚ) := sorry
/-- `iwahori_sign_square`: the nontrivial sign unit has order two. -/
example : Fixtures.iwahoriSign ^ 2 = 1 := sorry
/-- `iwahori_sign_upper`: conjugation negates the upper unipotent entry. -/
example : ((Fixtures.iwahoriSign * Fixtures.iwahoriUpperUnipotent ℚ
    (IsLocalRing.maximalIdeal ℚ) * Fixtures.iwahoriSign⁻¹).val.val) = !![1,-1;0,1] := sorry
/-- `iwahori_sign_diagonal`: the two residual characters distinguish the sign unit. -/
example : let g := Fixtures.iwahoriSign
    Fixtures.iwahoriDiagonal (A := ℚ) 0 g = -1 ∧
      Fixtures.iwahoriDiagonal (A := ℚ) 1 g = 1 := sorry

section Derived
local instance : HasDerivedCategory.{u+1} (ModuleCat.{u} A) := HasDerivedCategory.standard (ModuleCat.{u} A)
example : Theorems.Supported (Fixtures.degreeZero A) 0 0 := sorry
example [Nontrivial A] : ¬ Theorems.Supported (Fixtures.degreeZero A) 1 2 := sorry
example (a b : ℤ) : Theorems.Supported (0 : DerivedCategory (ModuleCat.{u} A)) a b := sorry
example : Theorems.FiniteCohomology (Fixtures.degreeZero A) := sorry
example : Theorems.FiniteCohomology (0 : DerivedCategory (ModuleCat.{u} A)) := sorry
example [Nontrivial A] : ¬ Theorems.FiniteCohomology
    ((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A (ℕ →₀ A))) := sorry
example : HeckeImage.actionGhostKernel (Fixtures.degreeZero A) (Fixtures.scalarDerived A) = ⊥ := sorry
example : HeckeImage.imageGhostIdeal (Fixtures.degreeZero A) (Fixtures.scalarDerived A) = ⊥ := sorry
end Derived
end MoreBoundaryChecks


namespace AcceptanceChecks
open IntegralRibet

/-- `modules_finite_of_lattice_zero`: scalar differences and the empty local quotient vanish. -/
example {A G : Type u} [CommRing A] [IsNoetherianRing A] [Group G] (ψ : G →* Aˣ) :
    Module.Finite A (localModule (Fixtures.emptyLocal G) (Fixtures.scalarRepresentation ψ) ψ ψ) ∧
    Subsingleton (localModule (Fixtures.emptyLocal G) (Fixtures.scalarRepresentation ψ) ψ ψ) := sorry

/-- `modules_finite_of_lattice_unipotent`: a finite lattice permits a nonzero free quotient. -/
example : Module.Finite ℤ (initialModule Fixtures.upperUnipotent 1 1) ∧
    Nonempty (initialModule Fixtures.upperUnipotent 1 1 ≃ₗ[ℤ] ℤ) := sorry

/-- `modules_finite_of_lattice_finite_extension`: finite coefficient extensions supply containment. -/
example {A B G : Type u} [CommRing A] [IsNoetherianRing A] [CommRing B] [Algebra A B]
    [Module.Finite A B] [Group G] (L : LocalData G)
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    Module.Finite A (localModule L ρ χ ψ) := by
  let : Module.Finite A (Matrix (Fin 2) (Fin 2) B) := by
    change Module.Finite A (Fin 2 → Fin 2 → B)
    infer_instance
  exact (modules_finite_of_lattice L ρ χ ψ ⊤ le_top le_top).2.2.2

/-- `modules_finite_of_lattice_infinite_residue`: coefficient functionals detecting infinitely
many quotient classes exclude finite generation, as in the exponent-one extension example. -/
example {A B G : Type u} [CommRing A] [IsLocalRing A] [CommRing B] [Algebra A B] [Group G]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (ψ : G →* Aˣ)
    (δ : ℕ → differenceModule ρ ψ)
    (ℓ : ℕ → differenceModule ρ ψ →ₗ[A] A ⧸ IsLocalRing.maximalIdeal A)
    (hprod : ∀ i x, x ∈ productInside ρ ψ ψ → ℓ i x = 0)
    (hδ : ∀ i j, ℓ i (δ j) = if i = j then 1 else 0) :
    ¬ Module.Finite A (localModule (Fixtures.emptyLocal G) ρ ψ ψ) := sorry

/-- `cocycles_continuous_of_lattice_discrete_obstruction`: an m-annihilated quotient is discrete;
nonzero cocycle values along a sequence tending to the identity prevent continuity. -/
example {A B G : Type u} [CommRing A] [IsLocalRing A] [CommRing B] [Algebra A B] [Group G]
    [TopologicalSpace G] (L : LocalData G)
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (hm : IsLocalRing.maximalIdeal A • (⊤ : Submodule A (localModule L ρ χ ψ)) = ⊥)
    (e : ℕ → G) (he : Filter.Tendsto e Filter.atTop (nhds 1))
    (hne : ∀ i, localCocycle L ρ χ ψ (e i) ≠ 0) :
    letI : TopologicalSpace (localModule L ρ χ ψ) :=
      (IsLocalRing.maximalIdeal A).adicModuleTopology _
    ¬ Continuous (localCocycle L ρ χ ψ) := sorry

/-- `global_difference_lattice_inseparable_trace`: in characteristic two the quadratic image
algebra has zero trace pairing, even when t has no square root in the fraction field. -/
example {k : Type u} [Field k] [CharP k 2] (t a b c d : k) :
    let J : Matrix (Fin 2) (Fin 2) k := !![0,t;1,0]
    J * J = t • (1 : Matrix (Fin 2) (Fin 2) k) ∧
      Matrix.trace ((a • (1 : Matrix (Fin 2) (Fin 2) k) + b • J) *
        (c • (1 : Matrix (Fin 2) (Fin 2) k) + d • J)) = 0 := sorry

/-- `global_difference_lattice_nonsquare`: a nonsquare companion matrix has no invariant line,
including in characteristic two; ordinary irreducibility does not force a nonzero trace pairing. -/
example {k : Type u} [Field k] [CharP k 2] (t : k) (ht : ∀ x : k, x^2 ≠ t)
    (v : Fin 2 → k) (hv : v ≠ 0) (a : k) :
    (!![0,t;1,0] : Matrix (Fin 2) (Fin 2) k).mulVec v ≠ a • v := sorry

/-- `global_difference_lattice_specialization`: the original global hypotheses supply both
new local inputs, with no finite-extension or separability assumption. -/
example {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B] [Group G]
    [IsLocalization (nonZeroDivisors A) B] [IsLocalRing A] [IsNoetherianRing A]
    [IsReduced A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (hAB : Topology.IsEmbedding (algebraMap A B))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (hIrr : Theorems.RibetIrreducible ρ)
    (hcoeff : ∀ g, ∃ P : A[X], P.map (algebraMap A B) =
      Matrix.charpoly (ρ (MonoidAlgebra.of A G g))) :
    ∃ Λ : Submodule A (Matrix (Fin 2) (Fin 2) B), Module.Finite A Λ ∧
      differenceModule ρ χ ≤ Λ ∧ differenceModule ρ ψ ≤ Λ ∧
      (IsLocalRing.maximalIdeal A).adicModuleTopology Λ =
        TopologicalSpace.induced (fun x : Λ => (x : Matrix (Fin 2) (Fin 2) B)) inferInstance := by
  obtain ⟨Λ, hfin, hχ, hψ⟩ := Theorems.global_difference_lattice ρ χ ψ hIrr hcoeff
  let := hfin
  exact ⟨Λ, hfin, hχ, hψ, fraction_lattice_topology hAdic hAB Λ⟩

/-- `adic_quotient_topology_two`: the quotient of 2-adic integers by four has its quotient topology. -/
example :
    (Ideal.span {(2 : ℤ)}).adicModuleTopology (ℤ ⧸ Ideal.span {(4 : ℤ)}) =
      TopologicalSpace.coinduced (Ideal.span {(4 : ℤ)}).mkQ
        ((Ideal.span {(2 : ℤ)}).adicModuleTopology ℤ) :=
  adic_quotient_topology (Ideal.span {(2 : ℤ)}) (Ideal.span {(4 : ℤ)})

/-- `compact_determinant_gluing_noncompact`: the actual supplier applies to discrete infinite ℤ. -/
example (D : Determinant (ZMod 2) (MonoidAlgebra (ZMod 2) (Multiplicative ℤ)) 1)
    (hD : D.IsContinuous) :
    ¬ CompactSpace (Multiplicative ℤ) ∧
    ∃! E : Determinant (ZMod 2) (MonoidAlgebra (ZMod 2) (Multiplicative ℤ)) 1,
      E.IsContinuous ∧ ∀ _i : Unit, E.mapCoefficients (RingHom.id (ZMod 2)) = D := by
  refine ⟨?_, ?_⟩
  · sorry
  · exact Theorems.compact_determinant_gluing Unit (fun _ => ZMod 2)
      (fun _ => RingHom.id _) (by intro a b h; exact congrFun h ())
      (fun _ => continuous_id) (fun _ => D) (fun _ => hD)
      Set.univ dense_univ (by intro g _ k; exact ⟨_, fun _ => rfl⟩)

/-- `determinant_noncompact_witness`: witness reconstruction uses the same general supplier. -/
example (W : Interpolation.CongruenceWitness (ZMod 2) (Multiplicative ℤ)
    (Multiplicative ℤ) 1 id) :
    ¬ CompactSpace (Multiplicative ℤ) ∧ W.determinant.IsContinuous ∧
      ∀ i, W.determinant.mapCoefficients (algebraMap (ZMod 2) (W.coefficient i)) =
        W.classical i := by
  refine ⟨?_, W.determinant_continuous, W.determinant_classical⟩
  sorry

end AcceptanceChecks

end TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants
