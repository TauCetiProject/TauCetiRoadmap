/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.LinearAlgebra.Basis.Filtration
import TauCeti.Algebra.Lie.LowerCentralSeries
import TauCeti.Algebra.Lie.Heisenberg

/-!
# Heights, filtrations and adapted bases of nilpotent Lie algebras: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's key definitions and headline theorems, so that
contributors and reviewers converge on names and signatures; discharging all of them finishes
neither a layer nor the roadmap. Each is statable against the pinned Mathlib and Tau Ceti, with
`sorry`, and every definition has its real body.

The headline statements are:

* Layer 0: grids and the conversion from integral forms to heights;
* Layer 1: Cramer bases of kernels, flag-adapted bases drawn from spanning sets, and lattices cut
  out by integer matrices;
* Layer 2: structure constants under a change of basis;
* Layer 3: filtrations indexed by an ordering, adapted bases with the nesting property, and their
  height-bounded form;
* Layer 4: degree–rank filtrations and the minimality of the canonical one;
* Layer 5: Witt's dimension formula for free nilpotent Lie algebras;
* Layer 7: denominators and `ℓ¹` bounds of the universal BCH word coefficients, product
  polynomials in coordinates, grid closure and BCH-stable lattices;
* Layer 8: coordinates of the second kind for a nesting basis.

The BCH group itself belongs to the roadmap ScatteringDiagrams (§0.4), which neither pin
implements. Here the `k`-fold product is prototyped by its Dynkin expansion `dynkinProduct`, a
finite sum that README 7.2 identifies with the product of `BCHGroup` in class at most `s`.

Conventions: heights are `Height.mulHeight₁` (`max(|num|, den)` on `ℚ`); integral forms are spelled
`∃ z : ℤ, (D : ℚ) * q = z ∧ |z| ≤ N`; filtrations are 1-based (`F 1 = L` for the lower central
filtration), while Mathlib's `lowerCentralSeries` is 0-based.
-/

open Module

namespace TauCetiRoadmap.NilpotentLieHeightsAndFiltrations

/-! ### Layer 0: heights, integral forms and grids -/

section Layer0

variable {K V ι : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The grid of vectors whose `e`-coordinates lie in `q⁻¹ℤ`: the `ℤ`-span of the `q⁻¹ eᵢ`. -/
noncomputable def denomGrid (e : Basis ι K V) (q : ℕ) : Submodule ℤ V :=
  Submodule.span ℤ (Set.range fun i => (q : K)⁻¹ • e i)

/-- The lattice `B · ⊕ᵢ ℤ eᵢ`, written `Λ_B(e)` in the README. -/
noncomputable def scaledLattice (e : Basis ι K V) (B : ℕ) : Submodule ℤ V :=
  Submodule.span ℤ (Set.range fun i => (B : K) • e i)

/-- Membership in a grid is a condition on coordinates (README 0.3). -/
theorem mem_denomGrid_iff [CharZero K] [Finite ι] (e : Basis ι K V) {q : ℕ} (hq : 0 < q)
    (x : V) : x ∈ denomGrid e q ↔ ∀ i, ∃ z : ℤ, (q : K) * e.repr x i = z := by
  sorry

/-- Integral form to height (README 0.1): if `D q` is an integer of absolute value at most `M`,
then `q` has height at most `max D M`. -/
theorem mulHeight₁_le_of_mul_eq_int (q : ℚ) {D M : ℕ} (hD : 1 ≤ D) {z : ℤ}
    (hz : (D : ℚ) * q = z) (hzM : |z| ≤ M) :
    Height.mulHeight₁ q ≤ ((max D M : ℕ) : ℝ) := by
  sorry

end Layer0

/-! ### Layer 1: effective linear algebra over `ℚ` -/

section Layer1

/-- The rank over `ℚ` of an integer matrix. -/
noncomputable abbrev ratRank {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℤ) : ℕ :=
  (A.map (Int.cast : ℤ → ℚ)).rank

/-- **Cramer bases of kernels** (README 1.2): the kernel of an integer matrix of rank `r` with
entries at most `M` has a basis of integer vectors with entries at most `r! Mʳ`. -/
theorem exists_int_basis_ker {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℤ) (M : ℕ)
    (hA : ∀ i j, |A i j| ≤ M) :
    ∃ v : Fin (n - ratRank A) → Fin n → ℤ,
      LinearIndependent ℚ (fun a j => (v a j : ℚ)) ∧
      Submodule.span ℚ (Set.range fun a j => (v a j : ℚ)) =
        LinearMap.ker (A.map (Int.cast : ℤ → ℚ)).mulVecLin ∧
      ∀ a j, |v a j| ≤ (((ratRank A).factorial * M ^ ratRank A : ℕ) : ℤ) := by
  sorry

/-- **Lattices cut out by integer matrices** (README 1.6): if `B y` is integral and `δ` is a
nonzero maximal minor of `B`, then `δ y` is integral. -/
theorem det_mul_mem_int_of_mulVec_mem_int {n k : ℕ} (B : Matrix (Fin n) (Fin k) ℤ)
    (P : Fin k → Fin n) (hP : (B.submatrix P id).det ≠ 0) (y : Fin k → ℚ)
    (hy : ∀ i, ∃ z : ℤ, (B.map (Int.cast : ℤ → ℚ)).mulVec y i = z) :
    ∀ j, ∃ z : ℤ, ((B.submatrix P id).det : ℚ) * y j = z := by
  sorry

/-- **Flag-adapted bases from spanning sets** (README 1.4): if every member of a flag is spanned
by the elements of `S` it contains, then `S` contains a basis adapted to every member. -/
theorem exists_basis_subset_adapted_flag {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] {m : ℕ} (P : Fin (m + 1) → Submodule K V) (hP : Antitone P)
    (S : Set V) (hS : ∀ i, Submodule.span K (S ∩ P i) = P i) (htop : P 0 = ⊤) :
    ∃ (ι : Type) (_ : Fintype ι) (b : Basis ι K V), Set.range b ⊆ S ∧
      ∀ i, P i = Submodule.span K (b '' {a | b a ∈ P i}) := by
  sorry

end Layer1

/-! ### Layer 2: structure constants -/

section Layer2

variable {K L ι : Type*} [Field K] [LieRing L] [LieAlgebra K L]

/-- The structure constants `e.repr ⁅e i, e j⁆ l` of a basis of a Lie algebra. -/
noncomputable def lieStructureConst (e : Basis ι K L) (i j l : ι) : K :=
  e.repr ⁅e i, e j⁆ l

/-- **Change of basis** (README 2.2): if `b` has integer coordinates at most `M_P` in `e`, and the
structure constants of `e` lie in `D⁻¹ℤ` with absolute value at most `M`, then those of `b` lie in
`(D det P)⁻¹ℤ` with absolute value at most `d³ (d−1)! M_P^{d+1} M`. -/
theorem lieStructureConst_changeBasis [CharZero K] [Fintype ι] [DecidableEq ι]
    (e b : Basis ι K L) (P : Matrix ι ι ℤ) (hP : ∀ i a, e.repr (b i) a = P i a) (MP D M : ℕ)
    (hPM : ∀ i a, |P i a| ≤ MP) (c : ι → ι → ι → ℚ)
    (hc : ∀ i j l, lieStructureConst e i j l = c i j l)
    (hcD : ∀ i j l, ∃ z : ℤ, (D : ℚ) * c i j l = z) (hcM : ∀ i j l, |c i j l| ≤ M) :
    ∀ i j l, ∃ z : ℤ, ((D : K) * (P.det : K)) * lieStructureConst b i j l = z ∧
      |z| ≤ D * |P.det| * (Fintype.card ι) ^ 3 * (Fintype.card ι - 1).factorial *
        MP ^ (Fintype.card ι + 1) * M := by
  sorry

end Layer2

/-! ### Layer 3: filtrations, adapted bases and the nesting property -/

section Layer3

/-- An `I`-filtration of a Lie algebra, for an ordering `I` (README Convention 7; GTZ,
Definition 6.8, for groups). No condition is imposed on the layer at `0`. -/
structure LieFiltration (I R L : Type*) [AddCommMonoid I] [PartialOrder I] [CommRing R]
    [LieRing L] [LieAlgebra R L] where
  /-- The layer `F_i`. -/
  layer : I → Submodule R L
  antitone : Antitone layer
  lie_mem : ∀ {i j : I} {x y : L}, x ∈ layer i → y ∈ layer j → ⁅x, y⁆ ∈ layer (i + j)

variable {R L : Type*} [CommRing R] [LieRing L] [LieAlgebra R L]

/-- The lower central filtration, 1-based: `F n = lowerCentralSeries R L L (n - 1)`, so that
`F 0 = F 1 = L` (README 3.1). -/
def lowerCentralFiltration (R L : Type*) [CommRing R] [LieRing L] [LieAlgebra R L] :
    LieFiltration ℕ R L where
  layer n := (LieModule.lowerCentralSeries R L L (n - 1)).toSubmodule
  antitone := sorry
  lie_mem := sorry

/-- The lower central filtration is the smallest filtration with `F 1 = L` (README 3.1). -/
theorem lowerCentralFiltration_le (F : LieFiltration ℕ R L) (h1 : F.layer 1 = ⊤) (n : ℕ) :
    (lowerCentralFiltration R L).layer n ≤ F.layer n := by
  sorry

variable {K : Type*} [Field K] [LieAlgebra K L]

/-- `(e, ω)` is adapted to `F`: `F j` is spanned by the basis vectors of weight at least `j`. -/
def IsAdapted {ι : Type*} (F : LieFiltration ℕ K L) (e : Basis ι K L) (ω : ι → ℕ) : Prop :=
  (∀ i, 1 ≤ ω i) ∧ ∀ j, 1 ≤ j → F.layer j = Submodule.span K (e '' {i | j ≤ ω i})

/-- The nesting property `⁅L, e j⁆ ⊆ span {e l | j < l}` (GT, condition (A.1)). -/
def IsNesting {d : ℕ} (e : Basis (Fin d) K L) : Prop :=
  ∀ i j l : Fin d, l ≤ j → e.repr ⁅e i, e j⁆ l = 0

/-- **Adapted nesting bases** (README 3.2): a filtration with `F 1 = L` and `F (s+1) = 0` of a
finite-dimensional Lie algebra has an adapted basis with monotone weights in `[1, s]`, and such a
basis has the nesting property. -/
theorem exists_isAdapted_isNesting [FiniteDimensional K L] (F : LieFiltration ℕ K L) (s : ℕ)
    (h1 : F.layer 1 = ⊤) (hs : F.layer (s + 1) = ⊥) :
    ∃ (e : Basis (Fin (finrank K L)) K L) (ω : Fin (finrank K L) → ℕ),
      Monotone ω ∧ (∀ i, ω i ≤ s) ∧ IsAdapted F e ω ∧ IsNesting e := by
  sorry

/-- **Height-bounded adapted bases** (README 3.2): if every layer is spanned by integer vectors
of a reference basis with entries at most `MF`, there is an adapted nesting basis of such
vectors. -/
theorem exists_isAdapted_isNesting_bounded {ι : Type*} [Fintype ι] [LieAlgebra ℚ L]
    [FiniteDimensional ℚ L] (e₀ : Basis ι ℚ L) (F : LieFiltration ℕ ℚ L) (s MF : ℕ)
    (h1 : F.layer 1 = ⊤) (hs : F.layer (s + 1) = ⊥) (S : ℕ → Set L)
    (hS : ∀ j, 1 ≤ j → F.layer j = Submodule.span ℚ (S j))
    (hSM : ∀ j, ∀ v ∈ S j, ∀ i, ∃ z : ℤ, e₀.repr v i = z ∧ |z| ≤ MF) :
    ∃ (e : Basis (Fin (finrank ℚ L)) ℚ L) (ω : Fin (finrank ℚ L) → ℕ),
      Monotone ω ∧ IsAdapted F e ω ∧ IsNesting e ∧
        ∀ a i, ∃ z : ℤ, e₀.repr (e a) i = z ∧ |z| ≤ MF := by
  sorry

end Layer3

/-! ### Layer 4: Lie trees and degree–rank filtrations -/

section Layer4

variable {R L : Type*} [CommRing R] [LieRing L] [LieAlgebra R L]

/-- Evaluation of a Lie tree: leaves by `v`, products by brackets. -/
def lieTreeEval {X : Type*} (v : X → L) : FreeMagma X → L
  | .of x => v x
  | .mul a b => ⁅lieTreeEval v a, lieTreeEval v b⁆

/-- The weight of a Lie tree: the sum of the weights of its leaves. -/
def treeWeight {X : Type*} (w : X → ℕ) : FreeMagma X → ℕ
  | .of x => w x
  | .mul a b => treeWeight w a + treeWeight w b

/-- The degree–rank sector `{(d, r) | r ≤ d}` of `ℕ ×ₗ ℕ` (GTZ, Definition 6.7 (iii)). -/
def degreeRankSubmonoid : AddSubmonoid (Lex (ℕ × ℕ)) where
  carrier := {p | (ofLex p).2 ≤ (ofLex p).1}
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_ofPred_eq, ofLex_add, Prod.fst_add, Prod.snd_add] at *
    omega
  zero_mem' := by simp

/-- The degree–rank `(d, r)`, for `r ≤ d`. -/
def drIdx (d r : ℕ) (h : r ≤ d) : degreeRankSubmonoid := ⟨toLex (d, r), h⟩

/-- A degree–rank filtration (GTZ, Definition 6.9): a `DR`-filtration with `G (0,0) = L` and
`G (d,0) = G (d,1)` for `d ≥ 1`. -/
structure DegreeRankLieFiltration (R L : Type*) [CommRing R] [LieRing L] [LieAlgebra R L]
    extends LieFiltration degreeRankSubmonoid R L where
  layer_zero : layer 0 = ⊤
  layer_rank_zero : ∀ d (hd : 1 ≤ d), layer (drIdx d 0 (Nat.zero_le d)) = layer (drIdx d 1 hd)

/-- The canonical degree–rank layer `F (d+1) + span T(d, max r 1)`: trees with at least
`max r 1` leaves, each in a layer of positive degree, of total degree `d` (README 4.2). -/
def canonicalLayer (F : LieFiltration ℕ R L) (d r : ℕ) : Submodule R L :=
  F.layer (d + 1) ⊔ Submodule.span R
    {x | ∃ t : FreeMagma (Σ k : ℕ, F.layer (k + 1)),
      treeWeight (fun p => p.1 + 1) t = d ∧ max r 1 ≤ t.length ∧
        lieTreeEval (fun p => (p.2 : L)) t = x}

/-- The canonical layers form a degree–rank filtration (README 4.2). -/
theorem exists_canonicalDegreeRank (F : LieFiltration ℕ R L) (h1 : F.layer 1 = ⊤) :
    ∃ G : DegreeRankLieFiltration R L,
      ∀ d r (h : r ≤ d), G.layer (drIdx d r h) = canonicalLayer F d r := by
  sorry

/-- **Minimality of the canonical degree–rank filtration** (README 4.2). -/
theorem canonicalLayer_map_le {L' : Type*} [LieRing L'] [LieAlgebra R L']
    (F : LieFiltration ℕ R L) (G : DegreeRankLieFiltration R L') (φ : L →ₗ⁅R⁆ L')
    (hφ : ∀ d, (F.layer d).map (φ : L →ₗ[R] L') ≤ G.layer (drIdx d 0 (Nat.zero_le d)))
    (d r : ℕ) (h : r ≤ d) :
    (canonicalLayer F d r).map (φ : L →ₗ[R] L') ≤ G.layer (drIdx d r h) := by
  sorry

end Layer4

/-! ### Layer 5: free nilpotent models -/

section Layer5

/-- Witt's number `(1/n) Σ_{m ∣ n} μ(m) q^{n/m}` of Lyndon words of length `n` on `q` letters. -/
def wittNumber (q n : ℕ) : ℕ :=
  ((∑ m ∈ n.divisors, ArithmeticFunction.moebius m * (q : ℤ) ^ (n / m)) / n).toNat

/-- **Witt's formula** for the free nilpotent Lie algebra of class `s` (README 5.1, 5.3). -/
theorem finrank_freeNilpotent (X : Type*) [Fintype X] (s : ℕ) :
    finrank ℚ (FreeLieAlgebra ℚ X ⧸
        LieModule.lowerCentralSeries ℚ (FreeLieAlgebra ℚ X) (FreeLieAlgebra ℚ X) s) =
      ∑ n ∈ Finset.Icc 1 s, wittNumber (Fintype.card X) n := by
  sorry

end Layer5

/-! ### Layer 7: arithmetic of the BCH product -/

section Layer7

/-- The exponential series truncated at degree `s`. -/
noncomputable def truncExp {A : Type*} [Ring A] [Algebra ℚ A] (s : ℕ) (x : A) : A :=
  ∑ m ∈ Finset.range (s + 1), ((m.factorial : ℚ)⁻¹) • x ^ m

/-- The series `log (1 + u)` truncated at degree `s`. -/
noncomputable def truncLog {A : Type*} [Ring A] [Algebra ℚ A] (s : ℕ) (u : A) : A :=
  ∑ j ∈ Finset.Icc 1 s, ((-1 : ℚ) ^ (j + 1) / j) • u ^ j

/-- The coefficient `β_k(w)` of the word `w` in `log (exp X₀ ⋯ exp X_{k−1})`, computed with
series truncated at `s ≥ |w|` (README 7.1). -/
noncomputable def bchWordCoeff (k s : ℕ) (w : List (Fin k)) : ℚ :=
  (FreeAlgebra.equivMonoidAlgebraFreeMonoid
    (truncLog s (((List.finRange k).map fun a => truncExp s (FreeAlgebra.ι ℚ a)).prod - 1))).coeff
    (FreeMonoid.ofList w)

/-- **Universal denominators** (README 7.1): `n! · lcm(1, …, n) · β_k(w) ∈ ℤ` for `|w| = n ≥ 1`. -/
theorem bchWordCoeff_den (k s : ℕ) (w : List (Fin k)) (h1 : 1 ≤ w.length) (hs : w.length ≤ s) :
    ∃ z : ℤ, (((w.length).factorial * (Finset.Icc 1 w.length).lcm id : ℕ) : ℚ) *
      bchWordCoeff k s w = z := by
  sorry

/-- **`ℓ¹` bound** (README 7.1): the coefficients of the words of length `n` have absolute values
summing to at most `20 (3k/2)ⁿ`. -/
theorem sum_abs_bchWordCoeff_le (k s n : ℕ) (hn : n ≤ s) :
    ∑ w : Fin n → Fin k, |bchWordCoeff k s (List.ofFn w)| ≤ 20 * (3 * k / 2 : ℚ) ^ n := by
  sorry

variable {K L : Type*} [Field K] [CharZero K] [LieRing L] [LieAlgebra K L]

/-- The right-normed bracket `[a₁, [a₂, …, [a_{n−1}, a_n]…]]`, with `[a] = a` and `[] = 0`. -/
def rightNormed : List L → L
  | [] => 0
  | [a] => a
  | a :: l => ⁅a, rightNormed l⁆

/-- The `k`-fold Dynkin expansion `Σ_{n ≤ s} Σ_{|w| = n} (β_k(w)/n) [x ∘ w]`. README 7.2 proves
that it is the product `x₀ ⋆ ⋯ ⋆ x_{k−1}` in `BCHGroup L` when `L` has class at most `s`. -/
noncomputable def dynkinProduct (K : Type*) [Field K] [CharZero K] [LieAlgebra K L] (s : ℕ)
    {k : ℕ} (x : Fin k → L) : L :=
  ∑ n ∈ Finset.Icc 1 s, ∑ w : Fin n → Fin k,
    ((bchWordCoeff k s (List.ofFn w) / n : ℚ) : K) • rightNormed (List.ofFn (x ∘ w))

/-- Check (README 7.2): in the Heisenberg algebra, `X ⋆ Y = X + Y + Z/2`. -/
theorem dynkinProduct_heisenberg :
    dynkinProduct ℚ 2 ![TauCeti.heisenbergX ℚ, TauCeti.heisenbergY ℚ] =
      TauCeti.heisenbergX ℚ + TauCeti.heisenbergY ℚ + (1 / 2 : ℚ) • TauCeti.heisenbergZ ℚ := by
  sorry

/-- **Product polynomials in coordinates of the first kind** (README 7.3). -/
theorem exists_dynkinProduct_coord_polynomial {d : ℕ} (e : Basis (Fin d) K L)
    (c : Fin d → Fin d → Fin d → ℚ) (hc : ∀ i j l, lieStructureConst e i j l = c i j l)
    (D M : ℕ) (hD : 1 ≤ D) (hcD : ∀ i j l, ∃ z : ℤ, (D : ℚ) * c i j l = z)
    (hcM : ∀ i j l, |c i j l| ≤ M) (s k : ℕ) (hs : 1 ≤ s) :
    ∃ P : Fin d → MvPolynomial (Fin k × Fin d) ℚ,
      (∀ l, (P l).totalDegree ≤ s) ∧
      (∀ l m, ∃ z : ℤ,
        ((s.factorial * ((Finset.Icc 1 s).lcm id) ^ 2 * D ^ (s - 1) : ℕ) : ℚ) *
          (P l).coeff m = z) ∧
      (∀ l, ∑ m ∈ (P l).support, |(P l).coeff m| ≤
        20 * ∑ n ∈ Finset.Icc 1 s, (3 * k * d / 2 : ℚ) ^ n * ((d : ℚ) * M) ^ (n - 1)) ∧
      ∀ (x : Fin k → L) (l : Fin d), e.repr (dynkinProduct K s x) l =
        MvPolynomial.aeval (fun p : Fin k × Fin d => e.repr (x p.1) p.2) (P l) := by
  sorry

/-- **Grid closure** (README 7.4): products of any number of elements of `denomGrid e q` lie in
`denomGrid e (s! · lcm(1, …, s)² · D^{s−1} · qˢ)`. -/
theorem dynkinProduct_mem_denomGrid {d : ℕ} (e : Basis (Fin d) K L)
    (c : Fin d → Fin d → Fin d → ℚ) (hc : ∀ i j l, lieStructureConst e i j l = c i j l)
    (D : ℕ) (hD : 1 ≤ D) (hcD : ∀ i j l, ∃ z : ℤ, (D : ℚ) * c i j l = z) (s : ℕ) (hs : 1 ≤ s)
    {k : ℕ} (q : ℕ) (hq : 1 ≤ q) (x : Fin k → L) (hx : ∀ a, x a ∈ denomGrid e q) :
    dynkinProduct K s x ∈
      denomGrid e (s.factorial * ((Finset.Icc 1 s).lcm id) ^ 2 * D ^ (s - 1) * q ^ s) := by
  sorry

/-- **BCH-stable lattices** (README 7.4): if `D · s! · lcm(1, …, s)²` divides `B`, then
`Λ_B(e)` is closed under the product. -/
theorem dynkinProduct_mem_scaledLattice {d : ℕ} (e : Basis (Fin d) K L)
    (c : Fin d → Fin d → Fin d → ℚ) (hc : ∀ i j l, lieStructureConst e i j l = c i j l)
    (D : ℕ) (hD : 1 ≤ D) (hcD : ∀ i j l, ∃ z : ℤ, (D : ℚ) * c i j l = z) (s B : ℕ)
    (hB : D * (s.factorial * ((Finset.Icc 1 s).lcm id) ^ 2) ∣ B) {x y : L}
    (hx : x ∈ scaledLattice e B) (hy : y ∈ scaledLattice e B) :
    dynkinProduct K s ![x, y] ∈ scaledLattice e B := by
  sorry

end Layer7

/-! ### Layer 8: coordinates of the second kind -/

section Layer8

variable {K L : Type*} [Field K] [CharZero K] [LieRing L] [LieAlgebra K L]

/-- **Coordinates of the second kind** (README 8.1; GT, Lemma A.2): for a nesting basis of a Lie
algebra of class at most `s`, `t ↦ exp(t₀ e₀) ⋆ ⋯ ⋆ exp(t_{d−1} e_{d−1})` is a bijection. -/
theorem bijective_secondKind {d : ℕ} (e : Basis (Fin d) K L) (he : IsNesting e) (s : ℕ)
    (hs : LieModule.lowerCentralSeries K L L s = ⊥) :
    Function.Bijective fun t : Fin d → K => dynkinProduct K s fun a => t a • e a := by
  sorry

end Layer8

end TauCetiRoadmap.NilpotentLieHeightsAndFiltrations
