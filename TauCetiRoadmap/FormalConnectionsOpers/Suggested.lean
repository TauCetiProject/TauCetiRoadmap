import Mathlib
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic

/-!
# Formal algebraic connections, loop gauge groupoids and opers: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions (with real bodies) that they need.

Stated here:

* F2.2: the universal property of the all-order modules of principal parts, for arbitrary
  commutative base rings and arbitrary modules (`principalParts_universal`).
* F2.4: regular formal connections over `R⟦t⟧` for a `ℚ`-algebra `R` are classified by their
  fibre at `t = 0`: gauge isomorphisms correspond bijectively to their constant terms
  (`regularGauge_constantCoeff_bijective`).
* F3A.2: for a connected reductive complex group `G` and every commutative `ℂ`-algebra `R`,
  every formal loop factors as a polynomial loop times a positive formal loop
  (`formalLoop_eq_polynomial_mul_positive`), the surjectivity half of
  `G(R[t,t⁻¹])/G(R[t]) ≃ G(R((t)))/G(R⟦t⟧)`.

Not statable at the pins, and therefore not stated:

* F2.1/F2.3, equivalence of zero curvature with the bracket identity `∇_[ξ,η] = [∇_ξ, ∇_η]`
  when `Ω¹_{A/k}` is finite projective: the ordinary form connection with its curvature
  `M → M ⊗ Ω²` (CrystallineCohomology CR.1.3) is not a carrier at the pins.
* F4.3, Drinfeld–Sokolov canonical form and the Chevalley–Kostant restriction
  `S(𝔤*)^G ≃ S(𝔥*)^W`: neither the Lie algebra of a pinned split group over `R((t))` with its
  principal grading nor the Weyl-group action on `Sym(𝔥*)` exists at the pins.
* F4–F5, intrinsic opers and the classification of continuous characters of `Fun Op(D×)`:
  opers (connections with a transverse Borel reduction) are not a carrier at the pins.
* F6, the Frenkel–Zhu theorem that every flat `G`-bundle on the punctured formal disc has an
  oper structure, and triviality of `G`-torsors over `ℂ((t))`: flat principal bundles over
  `ℂ((t))`, torsors under group schemes and opers are not carriers at the pins.
* F7–F8, the Drinfeld–Sokolov Poisson structure, the Miura screening-kernel description and the
  isomonodromy Lie algebroid: these need the completed function algebra of opers and its
  continuous cotangent module, which are not carriers at the pins.
-/

namespace TauCetiRoadmap.FormalConnectionsOpers

noncomputable section

open scoped TensorProduct

universe u

/-! ## Layer F2: algebraic differential operators and principal parts -/

section PrincipalParts

variable (k : Type u) (A : Type u) [CommRing k] [CommRing A] [Algebra k A]

/-- Grothendieck's differential operators of order at most `n` (Stacks, Definition
10.133.1, tag 09CI): order `0` means `A`-linear, and `D` has order at most `n + 1` when
every commutator `m ↦ D (a • m) - a • D m` has order at most `n`. No hypothesis on `k`, `A`, the
modules or the characteristic is imposed. -/
def IsDifferentialOperator {M N : Type u} [AddCommGroup M] [Module k M] [Module A M]
    [IsScalarTower k A M] [AddCommGroup N] [Module k N] [Module A N] [IsScalarTower k A N] :
    ℕ → (M →ₗ[k] N) → Prop
  | 0, D => ∀ (a : A) (m : M), D (a • m) = a • D m
  | n + 1, D => ∀ a : A, IsDifferentialOperator n
      (D.comp ((LinearMap.lsmul A M a).restrictScalars k) -
        ((LinearMap.lsmul A N a).restrictScalars k).comp D)

/-- The `A`-submodule `I^(n+1) · (A ⊗[k] M)` of `A ⊗[k] M`, where `I` is the kernel of
multiplication `A ⊗[k] A → A`. It is spanned over the left factor by the iterated differences
`(a₀ ⊗ 1 - 1 ⊗ a₀) ⋯ (aₙ ⊗ 1 - 1 ⊗ aₙ) · (1 ⊗ m)`. -/
def principalPartsRelations (M : Type u) [AddCommGroup M] [Module k M] [Module A M]
    [IsScalarTower k A M] (n : ℕ) : Submodule A (A ⊗[k] M) :=
  Submodule.span A {z | ∃ (a : Fin (n + 1) → A) (m : M),
    z = (List.ofFn a).foldr
      (fun c v => TensorProduct.map ((LinearMap.lsmul A A c).restrictScalars k) LinearMap.id v -
        TensorProduct.map LinearMap.id ((LinearMap.lsmul A M c).restrictScalars k) v)
      ((1 : A) ⊗ₜ[k] m)}

/-- The module of principal parts of order `n`,
`P^n_{A/k}(M) = ((A ⊗[k] A) / I^(n+1)) ⊗_{A,right} M ≃ (A ⊗[k] M) / I^(n+1)(A ⊗[k] M)`,
with its left `A`-module structure. Stacks, Lemma 10.133.9, tag 0H90, identifies it with the
module of principal parts of Lemma 10.133.3. -/
abbrev PrincipalParts (M : Type u) [AddCommGroup M] [Module k M] [Module A M]
    [IsScalarTower k A M] (n : ℕ) :=
  (A ⊗[k] M) ⧸ principalPartsRelations k A M n

/-- The universal jet `m ↦ 1 ⊗ m` of order `n`, a `k`-linear map `M → P^n_{A/k}(M)`. -/
def principalJet (M : Type u) [AddCommGroup M] [Module k M] [Module A M]
    [IsScalarTower k A M] (n : ℕ) : M →ₗ[k] PrincipalParts k A M n :=
  ((principalPartsRelations k A M n).mkQ.restrictScalars k).comp (TensorProduct.mk k A M 1)

/-- **Universal property of principal parts** (Stacks, Lemmas 10.133.3 and 10.133.9, tags 09CK
and 0H90): composition with the universal jet identifies `A`-linear maps `P^n_{A/k}(M) → N`
with the `k`-linear differential operators `M → N` of order at most `n`. This holds for every
commutative ring `k`, every commutative `k`-algebra `A` and all `A`-modules `M`, `N`. -/
theorem principalParts_universal (M N : Type u) [AddCommGroup M] [Module k M] [Module A M]
    [IsScalarTower k A M] [AddCommGroup N] [Module k N] [Module A N] [IsScalarTower k A N]
    (n : ℕ) :
    (∀ f : PrincipalParts k A M n →ₗ[A] N,
        IsDifferentialOperator k A n ((f.restrictScalars k).comp (principalJet k A M n))) ∧
      ∀ D : M →ₗ[k] N, IsDifferentialOperator k A n D →
        ∃! f : PrincipalParts k A M n →ₗ[A] N,
          (f.restrictScalars k).comp (principalJet k A M n) = D := by
  sorry

end PrincipalParts

/-! ## Layer F2: regular formal connections -/

section RegularConnections

open PowerSeries

/-- The left gauge action on connection matrices `d + A dt` over `R⟦t⟧`:
`gauge(g, A) = g A g⁻¹ - (dg/dt) g⁻¹`, so that `gauge(h, gauge(g, A)) = gauge(h g, A)`. -/
def regularGauge (R : Type u) [CommRing R] (n : Type) [Fintype n] [DecidableEq n]
    (g : Matrix.GeneralLinearGroup n R⟦X⟧) (A : Matrix n n R⟦X⟧) : Matrix n n R⟦X⟧ :=
  (g : Matrix n n R⟦X⟧) * A * ((g⁻¹ : Matrix.GeneralLinearGroup n R⟦X⟧) : Matrix n n R⟦X⟧) -
    (g : Matrix n n R⟦X⟧).map (fun f => PowerSeries.derivative (R := R) f) *
      ((g⁻¹ : Matrix.GeneralLinearGroup n R⟦X⟧) : Matrix n n R⟦X⟧)

/-- **Regular formal connections are determined by their fibre at `t = 0`** (README F2.4): over
a `ℚ`-algebra `R`, possibly nonreduced, for any two connection matrices `A`, `B` over `R⟦t⟧`,
taking the constant term is a bijection from gauge transformations carrying `A` to `B` onto
`GL_n(R)`. With `B = 0` this is the existence and uniqueness of a horizontal frame with
prescribed value at `t = 0`. The proof is the coefficient recursion
`(j + 1) g_(j+1) = Σ_(i ≤ j) (g_i A_(j-i) - B_(j-i) g_i)`, which divides by `j + 1`. -/
theorem regularGauge_constantCoeff_bijective (R : Type u) [CommRing R] [Algebra ℚ R]
    (n : Type) [Fintype n] [DecidableEq n] (A B : Matrix n n R⟦X⟧) :
    Function.Bijective
      (fun g : {g : Matrix.GeneralLinearGroup n R⟦X⟧ // regularGauge R n g A = B} =>
        Matrix.GeneralLinearGroup.map (PowerSeries.constantCoeff (R := R)) g.1) := by
  sorry

end RegularConnections

/-! ## Layer F3A: polynomial and formal loops -/

section PolynomialLoops

/-- Laurent series over a `k`-algebra `R` carry the coefficientwise `k`-algebra structure. This
selects it over the structure routed through `R⟦t⟧`, so that the coefficient maps below are
`k`-algebra maps for one fixed structure. -/
local instance (priority := high) laurentSeriesCoefficientAlgebra (k R : Type u) [CommRing k]
    [CommRing R] [Algebra k R] : Algebra k (LaurentSeries R) :=
  HahnSeries.instAlgebra

/-- The formal parameter `t` as a unit of `R((t))`. -/
def formalParameterUnit (R : Type u) [CommRing R] : (LaurentSeries R)ˣ where
  val := HahnSeries.single 1 1
  inv := HahnSeries.single (-1) 1
  val_inv := by simp [HahnSeries.single_mul_single]
  inv_val := by simp [HahnSeries.single_mul_single]

/-- The coefficient inclusion `R[t, t⁻¹] → R((t))`, sending `T 1` to `t`. -/
def laurentPolynomialToLaurentSeries (R : Type u) [CommRing R] :
    LaurentPolynomial R →ₐ[R] LaurentSeries R :=
  { LaurentPolynomial.eval₂ (algebraMap R (LaurentSeries R)) (formalParameterUnit R) with
    commutes' := fun r => LaurentPolynomial.eval₂_C _ _ r }

section CoefficientMaps

variable (k : Type u) [CommRing k] (H : Type u) [CommRing H] [HopfAlgebra k H]
  (R : Type u) [CommRing R] [Algebra k R]

/-- Polynomial loops `G(R[t,t⁻¹]) → G(R((t)))`, by post-composition on native Hopf points. -/
def polynomialLoopToFormal :
    TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (LaurentPolynomial R)) →*
      TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (LaurentSeries R)) :=
  TauCeti.AlgHom.mapValue (H := H) ((laurentPolynomialToLaurentSeries R).restrictScalars k)

/-- Positive formal loops `G(R⟦t⟧) → G(R((t)))`, by post-composition on native Hopf points. -/
def positiveLoopToFormal :
    TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (PowerSeries R)) →*
      TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (LaurentSeries R)) :=
  TauCeti.AlgHom.mapValue (H := H) (HahnSeries.ofPowerSeriesAlg ℤ k)

end CoefficientMaps

/-- **Polynomial factorization of formal loops** (README F3A.2; Česnavičius, *The affine
Grassmannian as a presheaf quotient*, Theorem 19, with the `ℙ¹` input of Česnavičius–Fedorov,
Theorem 4.2): for a connected reductive group `G = Spec H` over `ℂ` and every commutative
`ℂ`-algebra `R`, including nonreduced ones, `G(R((t))) = G(R[t,t⁻¹]) · G(R⟦t⟧)`. Reductivity is
Tau Ceti's `reductiveCommHopfAlgProperty` (smooth, geometrically connected, trivial geometric
unipotent radical); over `ℂ` such a group is split, hence totally isotropic, which is the
hypothesis of the cited theorem. -/
theorem formalLoop_eq_polynomial_mul_positive
    (H : TauCeti.FiniteTypeCommHopfAlgCat ℂ) (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (R : Type) [CommRing R] [Algebra ℂ R]
    (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of ℂ (LaurentSeries R))) :
    ∃ (p : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of ℂ (LaurentPolynomial R)))
      (q : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of ℂ (PowerSeries R))),
      g = polynomialLoopToFormal ℂ H R p * positiveLoopToFormal ℂ H R q := by
  sorry

end PolynomialLoops

end

end TauCetiRoadmap.FormalConnectionsOpers
