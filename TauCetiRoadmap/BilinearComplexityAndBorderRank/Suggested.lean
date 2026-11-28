import Mathlib

/-!
# Bilinear complexity and border rank: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

Tensors are AsymptoticSpectra's coordinate tensors `CoordTensor F ι` over a field `F`, ordered by
restriction `restrictLE`, with the tensor rank `tensorRank`, the flattening ranks `flatRank`, the
square matrix multiplication tensor `mmTensor` and the exponent `matMulExponent`; these are copied
verbatim from AsymptoticSpectra 3.1–3.3, because a roadmap cannot import another. Circuits are
AlgebraicCircuitsAndValiantsClasses' `Gate`, `Circuit` and `Circuit.val`, copied verbatim from its
1.1. Everything else is defined here: three-party tensors from arrays, the rectangular matrix
multiplication tensor `mmRect` in the cyclic convention of `mmTensor`, the multiplicative
complexity of a family of polynomials, approximate decompositions with polynomial factor matrices
and the border rank, and the tensor `W`. The README's routes use AsymptoticSpectra's theorems
`isStrassenPreorder_restrictLE`, `abstractRank_restrictLE`, `flatRank_mem_asymptoticSpectrum` and
`matMulExponent_spec`, which are not restated here.
-/

noncomputable section

namespace TauCetiRoadmap.BilinearComplexityAndBorderRank

/-! ## Layer 1: matrix multiplication tensors and multiplicative complexity -/

/-- 1.1 (copied verbatim from AsymptoticSpectra 3.1) A coordinate tensor over `F` with parties
`ι`: a format `dim`, giving the dimension of the space of each party, and the array of
coordinates, indexed as in Mathlib's holors by one `Fin (dim p)` for each party. A dimension may
be `0`; the array is then empty. -/
structure CoordTensor (F : Type*) (ι : Type*) where
  /-- The dimension of the space of each party. -/
  dim : ι → ℕ
  /-- The coordinates. -/
  coeff : (∀ p, Fin (dim p)) → F

namespace CoordTensor

variable {F : Type*} [Field F] {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 1.1 (copied verbatim from AsymptoticSpectra 3.1) Zero: dimension `0` at every party. -/
instance : Zero (CoordTensor F ι) := ⟨⟨fun _ => 0, fun _ => 0⟩⟩

/-- 1.1 (copied verbatim from AsymptoticSpectra 3.1) One: the unit tensor `⟨1⟩`, of dimension `1`
at every party, with coordinate `1`. -/
instance : One (CoordTensor F ι) := ⟨⟨fun _ => 1, fun _ => 1⟩⟩

/-- 1.1 (copied verbatim from AsymptoticSpectra 3.1) The direct sum: dimensions add, and an index
`i < s.dim p` of `Fin (s.dim p + t.dim p)` stands for `i` in `s`, an index `s.dim p + j` for `j`
in `t`. The coordinates are those of `s` where every index lies in `s`, those of `t` where every
index lies in `t`, and `0` elsewhere; with no party, the two scalars are added. -/
instance : Add (CoordTensor F ι) := ⟨fun s t => ⟨fun p => s.dim p + t.dim p, fun x =>
  (if h : ∀ p, (x p : ℕ) < s.dim p then s.coeff (fun p => ⟨x p, h p⟩) else 0) +
    (if h : ∀ p, s.dim p ≤ (x p : ℕ) then
      t.coeff (fun p => ⟨x p - s.dim p, Nat.sub_lt_left_of_lt_add (h p) (x p).isLt⟩) else 0)⟩⟩

/-- 1.1 (copied verbatim from AsymptoticSpectra 3.1) The Kronecker product: dimensions multiply,
and an index of `Fin (s.dim p * t.dim p)` is read as a pair by `Fin.divNat` and `Fin.modNat`, the
inverse of Mathlib's `finProdFinEquiv`, in the order of `Matrix.kronecker`. -/
instance : Mul (CoordTensor F ι) := ⟨fun s t => ⟨fun p => s.dim p * t.dim p, fun x =>
  s.coeff (fun p => (x p).divNat) * t.coeff (fun p => (x p).modNat)⟩⟩

end CoordTensor

section Tensors

variable {F : Type*} [Field F] {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 1.1 (copied verbatim from AsymptoticSpectra 3.1) Restriction: `s ≤ t` when, for some matrices
`A p` from the dimensions of `t` to those of `s`, the coordinates of `s` are the image of those of
`t` under the Kronecker product of the family `A`, the matrix with entries
`∏ p, A p (x p) (y p)`. -/
def restrictLE (s t : CoordTensor F ι) : Prop :=
  ∃ A : ∀ p, Matrix (Fin (s.dim p)) (Fin (t.dim p)) F,
    s.coeff = (Matrix.of fun x y => ∏ p, A p (x p) (y p)).mulVec t.coeff

/-- 1.1 (copied verbatim from AsymptoticSpectra 3.1) Tensor rank (CP rank): the least `r` for
which there are factor matrices `A p` with `r` columns, one for each party, with
`t x = ∑ i, ∏ p, A p (x p) i` for every index `x`; that is, `t` is the sum of the `r` products of
the `i`-th columns of the `A p`. -/
def tensorRank (t : CoordTensor F ι) : ℕ :=
  sInf {r : ℕ | ∃ A : ∀ p, Matrix (Fin (t.dim p)) (Fin r) F,
    t.coeff = fun x => ∑ i, ∏ p, A p (x p) i}

/-- 2.2 (copied verbatim from AsymptoticSpectra 3.2) The flattening rank at `S`: the rank of the
matrix whose rows are indexed by the indices of the parties in `S`, whose columns are indexed by
those of the other parties, and whose entries are the coordinates of `t`, the two halves of an
index glued by `Equiv.piEquivPiSubtypeProd`. -/
def flatRank (S : Finset ι) (t : CoordTensor F ι) : ℕ :=
  (Matrix.of fun (x : ∀ p : {p // p ∈ S}, Fin (t.dim p)) (y : ∀ p : {p // p ∉ S}, Fin (t.dim p)) =>
    t.coeff ((Equiv.piEquivPiSubtypeProd (· ∈ S) (fun p => Fin (t.dim p))).symm (x, y))).rank

end Tensors

section MatrixMultiplication

variable (F : Type*) [Field F]

/-- 1.1 (copied verbatim from AsymptoticSpectra 3.3) The matrix multiplication tensor
`⟨n, n, n⟩` on three parties of dimension `n * n`, an index being read as a pair `(i, j)` by
`Fin.divNat` and `Fin.modNat`: the coordinate at `((i, j), (j', k), (k', i'))` is `1` when
`j = j'`, `k = k'` and `i = i'`, and `0` otherwise. -/
def mmTensor (n : ℕ) : CoordTensor F (Fin 3) :=
  ⟨fun _ => n * n, fun x =>
    if (x 0).modNat = (x 1).divNat ∧ (x 1).modNat = (x 2).divNat ∧ (x 2).modNat = (x 0).divNat
    then 1 else 0⟩

/-- 1.1 (copied verbatim from AsymptoticSpectra 3.3) The exponent of matrix multiplication: the
infimum of the `τ` with `R(⟨n, n, n⟩) ≤ C nᵗ` for some `C` and every `n ≥ 1`. -/
def matMulExponent : ℝ :=
  sInf {τ : ℝ | ∃ C : ℝ, ∀ n : ℕ, 1 ≤ n → (tensorRank (mmTensor F n) : ℝ) ≤ C * (n : ℝ) ^ τ}

end MatrixMultiplication

section Rectangular

variable (F : Type*) [Field F]

/-- 1.1 The three-party tensor of an array `T : Fin a → Fin b → Fin c → F`: dimensions `a`, `b`,
`c` and coordinate `T i j l` at `(i, j, l)`. -/
def ofArray3 (a b c : ℕ) (T : Fin a → Fin b → Fin c → F) : CoordTensor F (Fin 3) :=
  ⟨![a, b, c], fun x => T (x 0) (x 1) (x 2)⟩

/-- 1.1 The rectangular matrix multiplication tensor `⟨a, b, c⟩`, of `a × b` by `b × c` matrices,
in the cyclic convention of `mmTensor`: dimensions `a * b`, `b * c`, `c * a`, each index read as a
pair by `Fin.divNat` and `Fin.modNat`, and coordinate `1` exactly at `((i, j), (j, k), (k, i))`. -/
def mmRect (a b c : ℕ) : CoordTensor F (Fin 3) :=
  ⟨![a * b, b * c, c * a], fun x =>
    if (x 0).modNat = (x 1).divNat ∧ (x 1).modNat = (x 2).divNat ∧ (x 2).modNat = (x 0).divNat
    then 1 else 0⟩

/-- 1.1 The algebra of matrix multiplication tensors: `⟨a, b, c⟩ ⊗ ⟨a', b', c'⟩` and
`⟨a a', b b', c c'⟩` are restrictions of each other; the tensor rank of `⟨a, b, c⟩` is unchanged
by the cyclic permutation `⟨b, c, a⟩` and by the transposition `⟨c, b, a⟩`; and the square tensor
`⟨a, a, a⟩` and AsymptoticSpectra's `mmTensor F a` are restrictions of each other. -/
theorem mmRect_spec (a b c a' b' c' : ℕ) :
    (restrictLE (mmRect F a b c * mmRect F a' b' c') (mmRect F (a * a') (b * b') (c * c')) ∧
      restrictLE (mmRect F (a * a') (b * b') (c * c')) (mmRect F a b c * mmRect F a' b' c')) ∧
    tensorRank (mmRect F b c a) = tensorRank (mmRect F a b c) ∧
    tensorRank (mmRect F c b a) = tensorRank (mmRect F a b c) ∧
    (restrictLE (mmRect F a a a) (mmTensor F a) ∧ restrictLE (mmTensor F a) (mmRect F a a a)) := by
  sorry

end Rectangular

section Circuits

open MvPolynomial Finset

universe u v

/-- 1.2 (copied verbatim from AlgebraicCircuitsAndValiantsClasses 1.1) The gate at position `k`
of a circuit: an input reading a variable or a constant, or an addition or multiplication whose
two arguments are positions `i, j < k` (`i = j` allowed). -/
inductive Gate (V : Type u) (R : Type v) (k : ℕ) where
  /-- reads the variable `v` -/
  | var : V → Gate V R k
  /-- reads the constant `a` -/
  | const : R → Gate V R k
  /-- adds the values at two earlier positions -/
  | add : Fin k → Fin k → Gate V R k
  /-- multiplies the values at two earlier positions -/
  | mul : Fin k → Fin k → Gate V R k

/-- 1.2 (copied verbatim from AlgebraicCircuitsAndValiantsClasses 1.1) A circuit with `s` gates,
inputs included: one gate at each position `k < s`. -/
abbrev Circuit (V : Type u) (R : Type v) (s : ℕ) : Type (max u v) := (k : Fin s) → Gate V R k

variable {V : Type u} {R : Type v} [CommSemiring R]

/-- 1.2 (copied verbatim from AlgebraicCircuitsAndValiantsClasses 1.1) The polynomial at position
`k` of the circuit `c`, by recursion on `k`. -/
def Circuit.val {s : ℕ} (c : Circuit V R s) (k : Fin s) : MvPolynomial V R :=
  match c k with
  | .var v => X v
  | .const a => C a
  | .add i j => c.val (Fin.castLT i (i.2.trans k.2)) + c.val (Fin.castLT j (j.2.trans k.2))
  | .mul i j => c.val (Fin.castLT i (i.2.trans k.2)) * c.val (Fin.castLT j (j.2.trans k.2))
termination_by k.val
decreasing_by all_goals (rw [Fin.val_castLT]; exact Fin.is_lt _)

/-- 1.2 The gate at position `k` is a nonscalar multiplication: it multiplies two values neither
of which is a constant polynomial (both have positive total degree). -/
def IsNonscalarMul {s : ℕ} (c : Circuit V R s) (k : Fin s) : Prop :=
  ∃ i j : Fin k, c k = .mul i j ∧
    (c.val (Fin.castLT i (i.2.trans k.2))).totalDegree ≠ 0 ∧
    (c.val (Fin.castLT j (j.2.trans k.2))).totalDegree ≠ 0

/-- 1.2 The number of nonscalar multiplications of a circuit. -/
def nonscalarCount {s : ℕ} (c : Circuit V R s) : ℕ :=
  Nat.card {k // IsNonscalarMul c k}

/-- 1.2 The multiplicative complexity of a family `f` of polynomials: the least number of
nonscalar multiplications of a circuit having every `f i` among its values. Additions,
constants and multiplications by constants are free; there is no division. -/
def mulComplexity {κ : Type*} (f : κ → MvPolynomial V R) : ℕ :=
  sInf {L : ℕ | ∃ (s : ℕ) (c : Circuit V R s), (∀ i, ∃ k, c.val k = f i) ∧ nonscalarCount c ≤ L}

/-- 1.2 The bilinear forms of an array `T`: for each `l`, the polynomial
`∑ i, ∑ j, T i j l * x_i * y_j` in the variables `x_i = X (inl i)` and `y_j = X (inr j)`. -/
def bilinearForms (a b c : ℕ) (T : Fin a → Fin b → Fin c → R) :
    Fin c → MvPolynomial (Fin a ⊕ Fin b) R :=
  fun l => ∑ i, ∑ j, C (T i j l) * X (Sum.inl i) * X (Sum.inr j)

/-- 1.2 Multiplicative complexity and rank: over every field, the multiplicative complexity `L`
of the bilinear forms of an array and the tensor rank `R` of the array satisfy
`L ≤ R ≤ 2 L`. -/
theorem mulComplexity_le_tensorRank_le_two_mul {F : Type*} [Field F] (a b c : ℕ)
    (T : Fin a → Fin b → Fin c → F) :
    mulComplexity (bilinearForms a b c T) ≤ tensorRank (ofArray3 F a b c T) ∧
      tensorRank (ofArray3 F a b c T) ≤ 2 * mulComplexity (bilinearForms a b c T) := by
  sorry

end Circuits

/-! ## Layer 2: border rank -/

section Border

open Polynomial

variable (F : Type*) [Field F]

/-- 2.1 An approximate decomposition of degree `h` with `r` terms: factor matrices `A p` with
entries in `F[X]` whose sum of column products `∑ i, ∏ p, A p (x p) i` has coefficient `t x` at
`X ^ h` and coefficient `0` at every lower power of `X`, for every index `x`. -/
def IsBorderDecomp {ι : Type*} [Fintype ι] (t : CoordTensor F ι) (h r : ℕ) : Prop :=
  ∃ A : ∀ p, Matrix (Fin (t.dim p)) (Fin r) F[X], ∀ x,
    (∑ i, ∏ p, A p (x p) i).coeff h = t.coeff x ∧ ∀ j < h, (∑ i, ∏ p, A p (x p) i).coeff j = 0

/-- 2.1 The border rank: the least `r` for which `t` has an approximate decomposition of some
degree with `r` terms. -/
def borderRank {ι : Type*} [Fintype ι] (t : CoordTensor F ι) : ℕ :=
  sInf {r : ℕ | ∃ h, IsBorderDecomp F t h r}

/-- 2.1 The algebra of approximate decompositions, with at least one party: the border rank is
at most `r` exactly when an approximate decomposition with `r` terms exists; one of degree `0`
is a decomposition; the degree and the number of terms may be raised; restriction keeps the
degree and the number of terms; for the direct sum the degrees take a maximum and the numbers
of terms add; for the Kronecker product the degrees add and the numbers of terms multiply. -/
theorem isBorderDecomp_spec {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]
    (s t : CoordTensor F ι) (h h' r r' : ℕ) :
    (borderRank F t ≤ r ↔ ∃ e, IsBorderDecomp F t e r) ∧
    (IsBorderDecomp F t 0 r ↔ tensorRank t ≤ r) ∧
    (IsBorderDecomp F t h r → h ≤ h' → r ≤ r' → IsBorderDecomp F t h' r') ∧
    (restrictLE s t → IsBorderDecomp F t h r → IsBorderDecomp F s h r) ∧
    (IsBorderDecomp F s h r → IsBorderDecomp F t h' r' →
      IsBorderDecomp F (s + t) (max h h') (r + r')) ∧
    (IsBorderDecomp F s h r → IsBorderDecomp F t h' r' →
      IsBorderDecomp F (s * t) (h + h') (r * r')) := by
  sorry

/-- 2.2 Interpolation (Bini): over every field, a three-party tensor with an approximate
decomposition of degree `h` with `r` terms has tensor rank at most `C(h + 2, 2) r`. -/
theorem tensorRank_le_choose_mul (t : CoordTensor F (Fin 3)) {h r : ℕ}
    (ht : IsBorderDecomp F t h r) : tensorRank t ≤ (h + 2).choose 2 * r := by
  sorry

/-- 2.2 With at least one party, every flattening rank is at most the border rank. -/
theorem flatRank_le_borderRank {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]
    (S : Finset ι) (t : CoordTensor F ι) : flatRank S t ≤ borderRank F t := by
  sorry

/-- 2.3 The tensor `W` of the multiplication of linear polynomials modulo `X²`: dimensions
`2, 2, 2` and coordinate `1` exactly at `(0, 0, 0)`, `(0, 1, 1)` and `(1, 0, 1)`. -/
def wTensor : CoordTensor F (Fin 3) :=
  ofArray3 F 2 2 2 fun i j l => if (i : ℕ) + j = l then 1 else 0

/-- 2.3 Over every field, `W` has tensor rank `3` and border rank `2`. -/
theorem tensorRank_wTensor : tensorRank (wTensor F) = 3 ∧ borderRank F (wTensor F) = 2 := by
  sorry

/-- 2.4 Bini's theorem: over every field, `(a b c)^(ω/3)` is at most the border rank of
`⟨a, b, c⟩`; with the approximate decomposition of Bini, Capovani, Lotti and Romani,
`12^(ω/3) ≤ 10`. -/
theorem rpow_le_borderRank_mmRect (a b c : ℕ) :
    ((a * b * c : ℕ) : ℝ) ^ (matMulExponent F / 3) ≤ borderRank F (mmRect F a b c) ∧
    (12 : ℝ) ^ (matMulExponent F / 3) ≤ 10 := by
  sorry

/-! ## Layer 3: Schönhage's asymptotic sum inequality -/

/-- 3.1 Disjoint copies: for `f ≥ 1`, if `f` disjoint copies of `⟨k, m, n⟩` have tensor rank
`g`, then `(k m n)^(ω/3) ≤ ⌈g / f⌉`. -/
theorem rpow_le_ceil_div (k m n f : ℕ) (hf : 1 ≤ f) :
    ((k * m * n : ℕ) : ℝ) ^ (matMulExponent F / 3) ≤
      ⌈(tensorRank (List.replicate f (mmRect F k m n)).sum : ℝ) / f⌉₊ := by
  sorry

/-- 3.2 Schönhage's example: over every field, `⟨k, 1, n⟩ ⊕ ⟨1, m, 1⟩` has tensor rank
`k n + m`, and for `m = (k - 1)(n - 1)` its border rank is at most `k n + 1`. -/
theorem tensorRank_add_and_borderRank_le (k n m : ℕ) :
    tensorRank (mmRect F k 1 n + mmRect F 1 m 1) = k * n + m ∧
    borderRank F (mmRect F k 1 n + mmRect F 1 ((k - 1) * (n - 1)) 1) ≤ k * n + 1 := by
  sorry

/-- 3.3 Schönhage's asymptotic sum inequality: over every field, for every finite family of
rectangular matrix multiplication tensors, `∑ i, (k i m i n i)^(ω/3)` is at most the border rank
of their direct sum; with Schönhage's example, `16^(ω/3) + 9^(ω/3) ≤ 17`. -/
theorem sum_rpow_le_borderRank {p : ℕ} (k m n : Fin p → ℕ) :
    ∑ i, ((k i * m i * n i : ℕ) : ℝ) ^ (matMulExponent F / 3) ≤
      borderRank F (List.ofFn fun i => mmRect F (k i) (m i) (n i)).sum ∧
    (16 : ℝ) ^ (matMulExponent F / 3) + 9 ^ (matMulExponent F / 3) ≤ 17 := by
  sorry

end Border

end TauCetiRoadmap.BilinearComplexityAndBorderRank
