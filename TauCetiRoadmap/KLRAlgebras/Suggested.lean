/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The Tau Ceti contributors
-/
import Mathlib
import TauCeti.GroupTheory.Perm.Coxeter
import TauCeti.Algebra.Category.GradedModuleCat.CartanMap.Basic

/-!
# KLR algebras and the categorification of quantum groups: target signatures

This file is not the roadmap: the roadmap is `README.md`, which is definitive. This file is read
as suggested forms, never as an exhaustive checklist. It states some of the roadmap's targets
against the pinned Mathlib and Tau Ceti, each with `sorry`, on carriers the README builds.

Only the symmetrized generalized Cartan matrix enters, so the parameters are stated over a
`SymmetrizedCartanMatrix` (row convention `aᵢⱼ = ⟨αⱼ, hᵢ⟩`). Tau Ceti's `TauCeti.CartanDatum`,
which postdates the current pin, restricts to one by `cartan` and `symmetrizer`; the README's
Cartan datum is that one. The type-A Coxeter system on `Equiv.Perm (Fin n)` is
`TauCeti.permCoxeterSystem`.

Stated here:

* the Demazure operators, their nil-Coxeter relations, and freeness of `k[x₁, …, xₙ]` of rank `n!`
  over the symmetric polynomials (README §§0.1–0.2);
* the KLR parameters `tᵢⱼ`, `sᵢⱼ^(pq)`, the polynomials `Qᵢⱼ`, and the presentation of `R(ν)` as a
  `RingQuot` (README §1.1), over an arbitrary commutative ring;
* the basis theorem for every choice of reduced words (README Layer 2);
* the grading of `R(ν)` for homogeneous parameters, as spans of products of coloured generators
  (README §1.2), and the filtration-compatible class of parameters (README Conventions);
* the graded split Grothendieck group `K₀(R(ν))`, Tau Ceti's `TauCeti.LaurentK0` of
  `TauCeti.gradedFiniteProjectiveModulesExactStructure`, is free of finite rank over `ℤ[q, q⁻¹]`
  over a field (README §§4.2, 5.2);
* finiteness and freeness of the cyclotomic quotients over an arbitrary commutative ring
  (README §6.2).

Not statable at the pins, and so not stated:

* the categorification `_𝒜f ≅ K₀(R)` itself, and the rank `dim f_ν` of `K₀(R(ν))` (README Layer 5),
  and `K₀(R^Λ) ≅ V_𝒜(Λ)` (README §6.2): the pin has no algebra `f` (QuantumEnvelopingAlgebras §1.0
  postdates it), no integral form `_𝒜f` (built by this roadmap, §4.1), and no algebra structure on
  `K₀(R)` from induction (built by this roadmap, Layer 3);
* characters and the operators `εᵢ` (README §4.3), which need induction and restriction.
-/

noncomputable section

open scoped BigOperators

namespace TauCetiRoadmap.KLRAlgebras

open TauCeti MvPolynomial

/-! ## Layer 0: Demazure operators and the nilHecke algebra -/

section Layer0

variable (k : Type*) [CommRing k] (n : ℕ)

/-- The transposition of the variables `x_r` and `x_(r+1)` in `k[x₀, …, xₙ]`. -/
def swapVars (r : Fin n) : MvPolynomial (Fin (n + 1)) k ≃ₐ[k] MvPolynomial (Fin (n + 1)) k :=
  renameEquiv k (Equiv.swap r.castSucc r.succ)

/-- The Demazure operator `∂_r f = (f − s_r f)/(x_r − x_(r+1))`, the quotient being exact
(README §0.1). -/
def demazure (r : Fin n) :
    MvPolynomial (Fin (n + 1)) k →ₗ[k] MvPolynomial (Fin (n + 1)) k :=
  sorry

theorem demazure_spec (r : Fin n) (f : MvPolynomial (Fin (n + 1)) k) :
    (X r.castSucc - X r.succ) * demazure k n r f = f - swapVars k n r f :=
  sorry

theorem demazure_comp_self (r : Fin n) : demazure k n r ∘ₗ demazure k n r = 0 :=
  sorry

theorem demazure_braid (r : Fin n) (s : Fin n) (hs : (s : ℕ) = r + 1) :
    demazure k n r ∘ₗ demazure k n s ∘ₗ demazure k n r =
      demazure k n s ∘ₗ demazure k n r ∘ₗ demazure k n s :=
  sorry

/-- The dot–Demazure relation `x_r ∂_r − ∂_r x_(r+1) = 1` (README §0.1). -/
theorem X_mul_demazure_sub_demazure_X (r : Fin n) (f : MvPolynomial (Fin (n + 1)) k) :
    X r.castSucc * demazure k n r f - demazure k n r (X r.succ * f) = f :=
  sorry

/-- `k[x₀, …, xₙ]` is free of rank `(n+1)!` over the symmetric polynomials (README §0.2). -/
theorem free_and_finrank_symmetricSubalgebra [Nontrivial k] :
    Module.Free (symmetricSubalgebra (Fin (n + 1)) k) (MvPolynomial (Fin (n + 1)) k) ∧
      Module.finrank (symmetricSubalgebra (Fin (n + 1)) k) (MvPolynomial (Fin (n + 1)) k) =
        (n + 1).factorial :=
  sorry

end Layer0

/-! ## Layer 1: parameters and the presentation -/

/-- A symmetrizable generalized Cartan matrix with a chosen positive symmetrizer. -/
structure SymmetrizedCartanMatrix (ι : Type*) where
  cartan : Matrix ι ι ℤ
  symmetrizer : ι → ℕ
  cartan_self (i : ι) : cartan i i = 2
  cartan_nonpos {i j : ι} : i ≠ j → cartan i j ≤ 0
  symmetrizer_pos (i : ι) : 0 < symmetrizer i
  symmetrizer_mul_cartan (i j : ι) :
    (symmetrizer i : ℤ) * cartan i j = symmetrizer j * cartan j i

section Layer1

variable {ι : Type*} [DecidableEq ι]

/-- Rouquier–Brundan parameters over `k` for a Cartan datum `D` (README summary and
Conventions): units `tᵢⱼ` with `tᵢⱼ = tⱼᵢ` when `aᵢⱼ = 0`, and scalars `sᵢⱼ^(pq)` with
`sᵢⱼ^(pq) = sⱼᵢ^(qp)`. Only `sᵢⱼ^(pq)` with `p < −aᵢⱼ`, `q < −aⱼᵢ` enter `Q`. -/
structure KLRParameters (D : SymmetrizedCartanMatrix ι) (k : Type*) [CommRing k] where
  t : ι → ι → kˣ
  s : ι → ι → ℕ → ℕ → k
  t_symm_of_cartan_eq_zero {i j : ι} : D.cartan i j = 0 → t i j = t j i
  s_symm (i j : ι) (p q : ℕ) : s i j p q = s j i q p

variable {D : SymmetrizedCartanMatrix ι} {k : Type*} [CommRing k]

/-- Homogeneous parameters: `sᵢⱼ^(pq) = 0` unless `p dᵢ + q dⱼ = −dᵢ aᵢⱼ`. The grading, and every
statement of README Layers 3–6 that uses it, assumes this. -/
def KLRParameters.IsHomogeneous (P : KLRParameters D k) : Prop :=
  ∀ i j p q, P.s i j p q ≠ 0 →
    (p * D.symmetrizer i + q * D.symmetrizer j : ℤ) = -(D.symmetrizer i * D.cartan i j)

/-- Parameters whose Newton polygons lie in the triangle: `sᵢⱼ^(pq) = 0` unless
`p dᵢ + q dⱼ ≤ −dᵢ aᵢⱼ`. Then the extra terms have at most the top degree, `R(ν)` is filtered by
the degree of the homogeneous case, and its associated graded has the homogeneous parameters
`tᵢⱼ`, `sᵢⱼ^(pq)` with `p dᵢ + q dⱼ = −dᵢ aᵢⱼ` (README Conventions). Every parameter is of this
kind in finite type. -/
def KLRParameters.IsFiltered (P : KLRParameters D k) : Prop :=
  ∀ i j p q, P.s i j p q ≠ 0 →
    (p * D.symmetrizer i + q * D.symmetrizer j : ℤ) ≤ -(D.symmetrizer i * D.cartan i j)

theorem KLRParameters.IsHomogeneous.isFiltered {P : KLRParameters D k} (hP : P.IsHomogeneous) :
    P.IsFiltered :=
  fun i j p q h => (hP i j p q h).le

/-- The polynomial `Qᵢⱼ(u, v)`, with `u = X 0` and `v = X 1`. -/
def KLRParameters.Q (P : KLRParameters D k) (i j : ι) : MvPolynomial (Fin 2) k :=
  if i = j then 0
  else if D.cartan i j = 0 then C (P.t i j : k)
  else C (P.t i j : k) * X 0 ^ (-D.cartan i j).toNat +
    (∑ p ∈ Finset.range (-D.cartan i j).toNat, ∑ q ∈ Finset.range (-D.cartan j i).toNat,
      C (P.s i j p q) * X 0 ^ p * X 1 ^ q) +
    C (P.t j i : k) * X 1 ^ (-D.cartan j i).toNat

/-- `Qᵢⱼ(u, v) = Qⱼᵢ(v, u)`. -/
theorem KLRParameters.Q_symm (P : KLRParameters D k) (i j : ι) :
    P.Q i j = rename (Equiv.swap (0 : Fin 2) 1) (P.Q j i) :=
  sorry

/-- The polynomial `(Q(x₂, x₁) − Q(x₀, x₁))/(x₂ − x₀)`, defined monomial by monomial so that no
division occurs. -/
def braidDefect (Q : MvPolynomial (Fin 2) k) : MvPolynomial (Fin 3) k :=
  ∑ m ∈ Q.support, C (Q.coeff m) *
    (∑ a ∈ Finset.range (m 0), X 2 ^ a * X 0 ^ (m 0 - 1 - a)) * X 1 ^ (m 1)

/-- Evaluating a polynomial at elements `a₀, …, a_(n−1)` of a possibly noncommutative algebra,
monomials read left to right; used only at pairwise commuting arguments. -/
def evalComm {n : ℕ} {A : Type*} [Semiring A] [Algebra k A] (P : MvPolynomial (Fin n) k)
    (a : Fin n → A) : A :=
  ∑ m ∈ P.support, algebraMap k A (P.coeff m) * ((List.finRange n).map fun x => a x ^ m x).prod

/-- The height of `ν ∈ Q⁺`. -/
def height (ν : ι →₀ ℕ) : ℕ := ν.sum fun _ m => m

/-- `Seq(ν)`: sequences of colours with content `ν`, valued in the support of `ν` so that the
type is finite even when `ι` is not. -/
def Seq (ν : ι →₀ ℕ) : Type _ :=
  {ii : Fin (height ν) → ν.support // ∀ j : ν.support, (Finset.univ.filter (ii · = j)).card = ν j}

instance (ν : ι →₀ ℕ) : Fintype (Seq ν) := by unfold Seq; infer_instance
instance (ν : ι →₀ ℕ) : DecidableEq (Seq ν) := by unfold Seq; infer_instance

/-- Generators of `R(ν)`: idempotents `e(ii)`, dots `y_r`, crossings `ψ_r` (`r + 1 < height ν`). -/
inductive Gen (ν : ι →₀ ℕ)
  | idem (ii : Seq ν)
  | dot (r : Fin (height ν))
  | cross (r : ℕ) (hr : r + 1 < height ν)

variable (P : KLRParameters D k) (ν : ι →₀ ℕ)

/-- The colour of strand `a` of `ii`. -/
def Seq.colour {ν : ι →₀ ℕ} (ii : Seq ν) (a : Fin (height ν)) : ι := (ii.1 a : ι)

/-- `s_r ii`, exchanging the colours of strands `r` and `r + 1`. -/
def Seq.swap {ν : ι →₀ ℕ} (r : ℕ) (hr : r + 1 < height ν) (ii : Seq ν) : Seq ν :=
  ⟨ii.1 ∘ Equiv.swap ⟨r, by omega⟩ ⟨r + 1, hr⟩, sorry⟩

section Relations

variable (k) in
/-- `e(ii)` in the free algebra. -/
def e (ii : Seq ν) : FreeAlgebra k (Gen ν) := FreeAlgebra.ι k (Gen.idem ii)
variable (k) in
/-- `y_a` in the free algebra. -/
def y (a : Fin (height ν)) : FreeAlgebra k (Gen ν) := FreeAlgebra.ι k (Gen.dot a)
variable (k) in
/-- `ψ_r` in the free algebra. -/
def ψ (r : ℕ) (hr : r + 1 < height ν) : FreeAlgebra k (Gen ν) := FreeAlgebra.ι k (Gen.cross r hr)

/-- The defining relations of README §1.1 (Rouquier, *Quiver Hecke algebras and 2-Lie algebras*,
§3.2.2), in the parametrization of the summary. -/
inductive Rel : FreeAlgebra k (Gen ν) → FreeAlgebra k (Gen ν) → Prop
  | idem_mul (ii jj : Seq ν) : Rel (e k ν ii * e k ν jj) (if ii = jj then e k ν ii else 0)
  | sum_idem : Rel (∑ ii, e k ν ii) 1
  | dot_idem (a : Fin (height ν)) (ii : Seq ν) : Rel (y k ν a * e k ν ii) (e k ν ii * y k ν a)
  | cross_idem (r : ℕ) (hr : r + 1 < height ν) (ii : Seq ν) :
      Rel (ψ k ν r hr * e k ν ii) (e k ν (ii.swap r hr) * ψ k ν r hr)
  | dot_dot (a b : Fin (height ν)) : Rel (y k ν a * y k ν b) (y k ν b * y k ν a)
  | cross_dot (r : ℕ) (hr : r + 1 < height ν) (a : Fin (height ν)) (ha : a.1 ≠ r ∧ a.1 ≠ r + 1) :
      Rel (ψ k ν r hr * y k ν a) (y k ν a * ψ k ν r hr)
  | cross_cross (r s : ℕ) (hr : r + 1 < height ν) (hs : s + 1 < height ν) (h : r + 1 < s) :
      Rel (ψ k ν r hr * ψ k ν s hs) (ψ k ν s hs * ψ k ν r hr)
  | cross_dot_succ (r : ℕ) (hr : r + 1 < height ν) (ii : Seq ν) :
      Rel (ψ k ν r hr * y k ν ⟨r + 1, hr⟩ * e k ν ii)
        ((y k ν ⟨r, by omega⟩ * ψ k ν r hr +
          if ii.colour ⟨r, by omega⟩ = ii.colour ⟨r + 1, hr⟩ then 1 else 0) * e k ν ii)
  | dot_succ_cross (r : ℕ) (hr : r + 1 < height ν) (ii : Seq ν) :
      Rel (y k ν ⟨r + 1, hr⟩ * ψ k ν r hr * e k ν ii)
        ((ψ k ν r hr * y k ν ⟨r, by omega⟩ +
          if ii.colour ⟨r, by omega⟩ = ii.colour ⟨r + 1, hr⟩ then 1 else 0) * e k ν ii)
  | cross_sq (r : ℕ) (hr : r + 1 < height ν) (ii : Seq ν) :
      Rel (ψ k ν r hr * ψ k ν r hr * e k ν ii)
        (evalComm (P.Q (ii.colour ⟨r, by omega⟩) (ii.colour ⟨r + 1, hr⟩))
          ![y k ν ⟨r, by omega⟩, y k ν ⟨r + 1, hr⟩] * e k ν ii)
  | braid (r : ℕ) (hr : r + 2 < height ν) (ii : Seq ν) :
      Rel ((ψ k ν (r + 1) (by omega) * ψ k ν r (by omega) * ψ k ν (r + 1) (by omega) -
            ψ k ν r (by omega) * ψ k ν (r + 1) (by omega) * ψ k ν r (by omega)) * e k ν ii)
        ((if ii.colour ⟨r, by omega⟩ = ii.colour ⟨r + 2, hr⟩ then
            evalComm (braidDefect (P.Q (ii.colour ⟨r, by omega⟩) (ii.colour ⟨r + 1, by omega⟩)))
              ![y k ν ⟨r, by omega⟩, y k ν ⟨r + 1, by omega⟩, y k ν ⟨r + 2, hr⟩]
          else 0) * e k ν ii)

end Relations

/-- The KLR algebra `R(ν)` over `k` (README §1.1). -/
abbrev KLRAlgebra : Type _ := RingQuot (Rel P ν)

end Layer1

/-! ## Layer 2: the basis theorem -/

section Layer2

variable {ι : Type*} [DecidableEq ι]
variable {D : SymmetrizedCartanMatrix ι} {k : Type*} [CommRing k] (P : KLRParameters D k) (ν : ι →₀ ℕ)

/-- The image of a generator in `R(ν)`. -/
def gen (g : Gen ν) : KLRAlgebra P ν := RingQuot.mkAlgHom k (Rel P ν) (FreeAlgebra.ι k g)

/-- `ψ_ŵ` for a word in the simple transpositions of `Equiv.Perm (Fin (height ν))`. -/
def psiWord (ω : List (Fin (height ν - 1))) : KLRAlgebra P ν :=
  (ω.map fun r => gen P ν (Gen.cross r.1 (by have := r.2; omega))).prod

/-- `y^a = y₀^(a₀) ⋯ y_(n−1)^(a_(n−1))`. -/
def dotMonomial (a : Fin (height ν) →₀ ℕ) : KLRAlgebra P ν :=
  ((List.finRange (height ν)).map fun r => gen P ν (Gen.dot r) ^ a r).prod

/-- The basis theorem (Khovanov–Lauda; Rouquier, *Quiver Hecke algebras and 2-Lie algebras*,
Prop. 3.7), for an arbitrary commutative ring, arbitrary parameters, and every choice of a
reduced word for each permutation (README Layer 2). -/
theorem basis_theorem (ŵ : Equiv.Perm (Fin (height ν)) → List (Fin (height ν - 1)))
    (hŵ : ∀ w, (permCoxeterSystem (height ν)).IsReduced (ŵ w) ∧
      (permCoxeterSystem (height ν)).wordProd (ŵ w) = w) :
    LinearIndependent k
        (fun x : Equiv.Perm (Fin (height ν)) × (Fin (height ν) →₀ ℕ) × Seq ν =>
          psiWord P ν (ŵ x.1) * dotMonomial P ν x.2.1 * gen P ν (Gen.idem x.2.2)) ∧
      Submodule.span k (Set.range
        (fun x : Equiv.Perm (Fin (height ν)) × (Fin (height ν) →₀ ℕ) × Seq ν =>
          psiWord P ν (ŵ x.1) * dotMonomial P ν x.2.1 * gen P ν (Gen.idem x.2.2))) = ⊤ :=
  sorry

/-- The degree of a generator `g` placed on the idempotent `e(ii)` (README summary):
`deg e(ii) = 0`, `deg y_r e(ii) = 2 d_(i_r)`, `deg ψ_r e(ii) = −d_(i_r) a_(i_r i_(r+1))`. -/
def genDegree : Gen ν → Seq ν → ℤ
  | .idem _, _ => 0
  | .dot r, ii => 2 * D.symmetrizer (ii.colour r)
  | .cross r hr, ii => -(D.symmetrizer (ii.colour ⟨r, by omega⟩) *
      D.cartan (ii.colour ⟨r, by omega⟩) (ii.colour ⟨r + 1, hr⟩))

/-- The degree-`d` part of `R(ν)`: the span of products of coloured generators `g e(ii)` whose
degrees sum to `d`. For homogeneous parameters this is a grading (README §1.2). -/
def klrGrading (d : ℤ) : Submodule k (KLRAlgebra P ν) :=
  Submodule.span k {x | ∃ l : List (Gen ν × Seq ν),
    (l.map fun g => genDegree (D := D) ν g.1 g.2).sum = d ∧
      x = (l.map fun g => gen P ν g.1 * gen P ν (Gen.idem g.2)).prod}

theorem directSumDecomposition_klrGrading (hP : P.IsHomogeneous) :
    Nonempty (DirectSum.Decomposition (klrGrading P ν)) :=
  sorry

end Layer2

section Layer5

universe u v

/-- Over a field and for homogeneous parameters, the graded split Grothendieck group of finitely
generated graded projective `R(ν)`-modules is free of finite rank over `ℤ[q, q⁻¹]` (README §4.2;
its rank is `dim f_ν` by README §5.2). -/
theorem free_finite_laurentK0 {ι : Type u} [DecidableEq ι] {D : SymmetrizedCartanMatrix ι}
    {K : Type v} [Field K] (P : KLRParameters D K) (hP : P.IsHomogeneous) (ν : ι →₀ ℕ) :
    Module.Free (LaurentPolynomial ℤ)
        (LaurentK0.{max u v} (gradedFiniteProjectiveModulesExactStructure (klrGrading P ν))) ∧
      Module.Finite (LaurentPolynomial ℤ)
        (LaurentK0.{max u v} (gradedFiniteProjectiveModulesExactStructure (klrGrading P ν))) :=
  sorry

end Layer5

/-! ## Layer 6: cyclotomic quotients -/

section Layer6

variable {ι : Type*} [DecidableEq ι]
variable {D : SymmetrizedCartanMatrix ι} {k : Type*} [CommRing k] (P : KLRParameters D k) (ν : ι →₀ ℕ)

/-- The cyclotomic relation `y₁^(⟨hᵢ₁, Λ⟩) e(ii) = 0`, for `Λ` given by its values `⟨hᵢ, Λ⟩`. -/
inductive CycRel (Λ : ι → ℕ) : KLRAlgebra P ν → KLRAlgebra P ν → Prop
  | cyc (h : 0 < height ν) (ii : Seq ν) :
      CycRel Λ (gen P ν (Gen.dot ⟨0, h⟩) ^ Λ (ii.colour ⟨0, h⟩) * gen P ν (Gen.idem ii)) 0

/-- The cyclotomic quotient `R^Λ(ν)` (README §6.2). -/
abbrev CyclotomicKLRAlgebra (Λ : ι → ℕ) : Type _ := RingQuot (CycRel P ν Λ)

/-- `R^Λ(ν)` is free of finite rank over every commutative ring, for parameters whose Newton
polygons lie in the triangle (README §6.2; Webster, *Knot invariants and higher representation
theory*, in the homogeneous case). -/
theorem free_finite_cyclotomic (hP : P.IsFiltered) (Λ : ι → ℕ) :
    Module.Free k (CyclotomicKLRAlgebra P ν Λ) ∧ Module.Finite k (CyclotomicKLRAlgebra P ν Λ) :=
  sorry

end Layer6

end TauCetiRoadmap.KLRAlgebras
