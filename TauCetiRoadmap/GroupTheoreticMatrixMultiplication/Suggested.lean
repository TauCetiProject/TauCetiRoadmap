import Mathlib

/-!
# Group-theoretic matrix multiplication: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's Checks and remarks are not restated.

Subsets `S`, `T`, `U` of a group satisfy the triple product property when
`s' s⁻¹ · t' t⁻¹ · u' u⁻¹ = 1` forces `s' = s`, `t' = t` and `u' = u`; a group realizes `⟨n, m, p⟩`
when it has such subsets of sizes `n`, `m`, `p`. Tensors are the coordinate tensors of
AsymptoticSpectra, whose definitions `CoordTensor`, its four instances, `restrictLE`,
`tensorRank`, `mmTensor` and `matMulExponent` are copied verbatim from its 3.1 and 3.3, because a
roadmap cannot import another; by its `matMulExponent_spec`, `2 ≤ ω ≤ log₂ 7` over every field,
so the infimum defining `ω` is not a junk value. The group algebra enters through a Wedderburn presentation
`MonoidAlgebra F G ≃ₐ[F] Π i, Matrix (Fin (d i)) (Fin (d i)) F`, taken as a hypothesis; Tau Ceti's
`TauCeti.exists_algEquiv_pi_matrix` provides one over an algebraically closed field whose
characteristic does not divide the order of the group.
-/

noncomputable section

namespace TauCetiRoadmap.GroupTheoreticMatrixMultiplication

/-! ## Layer 1: the triple product property -/

section TripleProduct

/-- 1.1 The triple product property of three subsets of a group: whenever `s, s' ∈ S`,
`t, t' ∈ T` and `u, u' ∈ U` satisfy `s' s⁻¹ · t' t⁻¹ · u' u⁻¹ = 1`, all three right quotients are
trivial, that is `s' = s`, `t' = t` and `u' = u`. -/
def IsTPP {G : Type*} [Group G] (S T U : Set G) : Prop :=
  ∀ s ∈ S, ∀ s' ∈ S, ∀ t ∈ T, ∀ t' ∈ T, ∀ u ∈ U, ∀ u' ∈ U,
    s' * s⁻¹ * (t' * t⁻¹) * (u' * u⁻¹) = 1 → s' = s ∧ t' = t ∧ u' = u

/-- 1.1 A group `G` realizes `⟨n, m, p⟩` when it has finite subsets of sizes `n`, `m` and `p` with
the triple product property. -/
def Realizes (G : Type*) [Group G] (n m p : ℕ) : Prop :=
  ∃ S T U : Finset G, S.card = n ∧ T.card = m ∧ U.card = p ∧ IsTPP (S : Set G) T U

/-- 1.1 Realizations are invariant under permuting `n, m, p` (a rotation and a transposition
generate all permutations), multiply under direct products, satisfy `(nmp)² < |G|³` when
`nmp > 1`, and satisfy `nmp ≤ |G|` when `G` is abelian. -/
theorem realizes_spec {G H : Type*} [Group G] [Group H] [Fintype G] {n m p n' m' p' : ℕ}
    (h : Realizes G n m p) (h' : Realizes H n' m' p') :
    Realizes G m p n ∧ Realizes G p m n ∧ Realizes (G × H) (n * n') (m * m') (p * p') ∧
      (1 < n * m * p → (n * m * p) ^ 2 < Fintype.card G ^ 3) ∧
      ((∀ a b : G, a * b = b * a) → n * m * p ≤ Fintype.card G) := by
  sorry

/-- 1.1 Cohn and Umans' extension lemma: if a normal subgroup `N` of `G` realizes `⟨n, m, p⟩` and
the quotient `G ⧸ N` realizes `⟨n', m', p'⟩`, then `G` realizes `⟨n n', m m', p p'⟩`. -/
theorem realizes_of_normal {G : Type*} [Group G] (N : Subgroup G) [N.Normal]
    {n m p n' m' p' : ℕ} (h : Realizes N n m p) (h' : Realizes (G ⧸ N) n' m' p') :
    Realizes G (n * n') (m * m') (p * p') := by
  sorry

/-- 1.2 The triangular array of side `n`: the triples `(a, b, c)` of natural numbers with
`a + b + c = n - 1`, written `a + b + c + 1 = n` (empty for `n = 0`). -/
abbrev triangularArray (n : ℕ) : Type := {x : Fin 3 → ℕ // x 0 + x 1 + x 2 + 1 = n}

/-- 1.2 The subgroup of the permutations of the triangular array that preserve the `i`-th
coordinate of every point. -/
def fixCoord (n : ℕ) (i : Fin 3) : Subgroup (Equiv.Perm (triangularArray n)) where
  carrier := {π | ∀ x, (π x).1 i = x.1 i}
  mul_mem' := by intro a b ha hb x; simp_all [Equiv.Perm.mul_apply]
  one_mem' := by intro x; rfl
  inv_mem' := by
    intro a ha x
    have h := ha (a⁻¹ x)
    rw [show a (a⁻¹ x) = x from a.apply_symm_apply x] at h
    exact h.symm

/-- 1.2 Cohn and Umans' triangle construction: the three coordinate-preserving subgroups of the
permutations of the triangular array of side `n` have the triple product property, and each has
order `1! 2! ⋯ n!`. -/
theorem fixCoord_isTPP (n : ℕ) :
    IsTPP (fixCoord n 0 : Set (Equiv.Perm (triangularArray n))) (fixCoord n 1) (fixCoord n 2) ∧
      ∀ i, Nat.card (fixCoord n i) = ∏ j ∈ Finset.range n, (j + 1).factorial := by
  sorry

/-- 1.3 The action of `ℤˣ = {1, -1}` on `A × A` in which `-1` swaps the two factors. -/
def swapAction (A : Type*) [Group A] : ℤˣ →* MulAut (A × A) where
  toFun u := if u = 1 then 1 else MulEquiv.prodComm
  map_one' := by simp
  map_mul' u v := by
    rcases Int.units_eq_one_or u with rfl | rfl <;>
      rcases Int.units_eq_one_or v with rfl | rfl <;> simp
    ext x <;> rfl

/-- 1.3 The group `(H × H) ⋊ C₂` of Cohn, Kleinberg, Szegedy and Umans, with
`H = (ℤ/n)³` written multiplicatively and `C₂ = ℤˣ` swapping the two factors. -/
abbrev cksuGroup (n : ℕ) : Type :=
  (Multiplicative (Fin 3 → ZMod n) × Multiplicative (Fin 3 → ZMod n)) ⋊[swapAction _] ℤˣ

/-- 1.3 The set `Sᵢ = {(a, b) zʲ : a ∈ Hᵢ ∖ {0}, b ∈ Hᵢ₊₁}`, where `Hᵢ` is the `i`-th coordinate
copy of `ℤ/n` in `H = (ℤ/n)³` (indices modulo `3`) and `z` is the swap. -/
def cksuSet (n : ℕ) (i : Fin 3) : Set (cksuGroup n) :=
  {g | (∀ j, j ≠ i → Multiplicative.toAdd g.left.1 j = 0) ∧ g.left.1 ≠ 1 ∧
    ∀ j, j ≠ i + 1 → Multiplicative.toAdd g.left.2 j = 0}

/-- 1.3 The construction of Cohn, Kleinberg, Szegedy and Umans: the three sets `Sᵢ` have the
triple product property, each has `2n(n - 1)` elements, and the group has order `2n⁶`. -/
theorem cksuSet_isTPP (n : ℕ) :
    IsTPP (cksuSet n 0) (cksuSet n 1) (cksuSet n 2) ∧
      (∀ i, (cksuSet n i).ncard = 2 * n * (n - 1)) ∧ Nat.card (cksuGroup n) = 2 * n ^ 6 := by
  sorry

end TripleProduct

/-! ## Layer 2: matrix multiplication in the group algebra -/

/-- 2.1 (copied verbatim from AsymptoticSpectra 3.1) A coordinate tensor over `F` with parties
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

/-- 2.1 (copied verbatim from AsymptoticSpectra 3.1) Zero: dimension `0` at every party. -/
instance : Zero (CoordTensor F ι) := ⟨⟨fun _ => 0, fun _ => 0⟩⟩

/-- 2.1 (copied verbatim from AsymptoticSpectra 3.1) One: the unit tensor `⟨1⟩`, of dimension
`1` at every party, with coordinate `1`. -/
instance : One (CoordTensor F ι) := ⟨⟨fun _ => 1, fun _ => 1⟩⟩

/-- 2.1 (copied verbatim from AsymptoticSpectra 3.1) The direct sum: dimensions add, and an
index `i < s.dim p` of `Fin (s.dim p + t.dim p)` stands for `i` in `s`, an index `s.dim p + j` for
`j` in `t`. The coordinates are those of `s` where every index lies in `s`, those of `t` where
every index lies in `t`, and `0` elsewhere; with no party, the two scalars are added. -/
instance : Add (CoordTensor F ι) := ⟨fun s t => ⟨fun p => s.dim p + t.dim p, fun x =>
  (if h : ∀ p, (x p : ℕ) < s.dim p then s.coeff (fun p => ⟨x p, h p⟩) else 0) +
    (if h : ∀ p, s.dim p ≤ (x p : ℕ) then
      t.coeff (fun p => ⟨x p - s.dim p, Nat.sub_lt_left_of_lt_add (h p) (x p).isLt⟩) else 0)⟩⟩

/-- 2.1 (copied verbatim from AsymptoticSpectra 3.1) The Kronecker product: dimensions multiply,
and an index of `Fin (s.dim p * t.dim p)` is read as a pair by `Fin.divNat` and `Fin.modNat`, the
inverse of Mathlib's `finProdFinEquiv`, in the order of `Matrix.kronecker`. -/
instance : Mul (CoordTensor F ι) := ⟨fun s t => ⟨fun p => s.dim p * t.dim p, fun x =>
  s.coeff (fun p => (x p).divNat) * t.coeff (fun p => (x p).modNat)⟩⟩

end CoordTensor

section Tensors

variable {F : Type*} [Field F] {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 2.1 (copied verbatim from AsymptoticSpectra 3.1) Restriction: `s ≤ t` when, for some
matrices `A p` from the dimensions of `t` to those of `s`, the coordinates of `s` are the image of
those of `t` under the Kronecker product of the family `A`, the matrix with entries
`∏ p, A p (x p) (y p)`. -/
def restrictLE (s t : CoordTensor F ι) : Prop :=
  ∃ A : ∀ p, Matrix (Fin (s.dim p)) (Fin (t.dim p)) F,
    s.coeff = (Matrix.of fun x y => ∏ p, A p (x p) (y p)).mulVec t.coeff

/-- 2.1 (copied verbatim from AsymptoticSpectra 3.1) Tensor rank (CP rank): the least `r` for
which there are factor matrices `A p` with `r` columns, one for each party, with
`t x = ∑ i, ∏ p, A p (x p) i` for every index `x`; that is, `t` is the sum of the `r` products of
the `i`-th columns of the `A p`. -/
def tensorRank (t : CoordTensor F ι) : ℕ :=
  sInf {r : ℕ | ∃ A : ∀ p, Matrix (Fin (t.dim p)) (Fin r) F,
    t.coeff = fun x => ∑ i, ∏ p, A p (x p) i}

end Tensors

section MatrixMultiplication

variable (F : Type*) [Field F]

/-- 2.1 (copied verbatim from AsymptoticSpectra 3.3) The matrix multiplication tensor
`⟨n, n, n⟩` on three parties of dimension `n * n`, an index being read as a pair `(i, j)` by
`Fin.divNat` and `Fin.modNat`: the coordinate at `((i, j), (j', k), (k', i'))` is `1` when
`j = j'`, `k = k'` and `i = i'`, and `0` otherwise. -/
def mmTensor (n : ℕ) : CoordTensor F (Fin 3) :=
  ⟨fun _ => n * n, fun x =>
    if (x 0).modNat = (x 1).divNat ∧ (x 1).modNat = (x 2).divNat ∧ (x 2).modNat = (x 0).divNat
    then 1 else 0⟩

/-- 2.1 (copied verbatim from AsymptoticSpectra 3.3) The exponent of matrix multiplication: the
infimum of the `τ` with `R(⟨n, n, n⟩) ≤ C nᵗ` for some `C` and every `n ≥ 1`. -/
def matMulExponent : ℝ :=
  sInf {τ : ℝ | ∃ C : ℝ, ∀ n : ℕ, 1 ≤ n → (tensorRank (mmTensor F n) : ℝ) ≤ C * (n : ℝ) ^ τ}

end MatrixMultiplication

section GroupAlgebra

/-- 2.1 The group tensor of a finite group `G`: three parties of dimension `|G|`, an index being
read as a group element through `Fintype.equivFin G`, with coordinate `1` at `(a, b, c)` when
`a b c = 1` and `0` otherwise. It is the structure tensor of `MonoidAlgebra F G` in the basis of
group elements, `[a b = c]`, with the third party relabelled by inversion. -/
def groupTensor (F : Type*) [Field F] (G : Type*) [Group G] [Fintype G] [DecidableEq G] :
    CoordTensor F (Fin 3) :=
  ⟨fun _ => Fintype.card G, fun x =>
    if (Fintype.equivFin G).symm (x 0) * (Fintype.equivFin G).symm (x 1) *
      (Fintype.equivFin G).symm (x 2) = 1 then 1 else 0⟩

/-- 2.2 Cohn and Umans' embedding, square form, over every field: if `G` realizes `⟨n, n, n⟩`,
the matrix multiplication tensor `⟨n, n, n⟩` is a restriction of the group tensor of `G`. -/
theorem restrictLE_mmTensor_groupTensor (F : Type*) [Field F] {G : Type*} [Group G] [Fintype G]
    [DecidableEq G] {n : ℕ} (h : Realizes G n n n) :
    restrictLE (mmTensor F n) (groupTensor F G) := by
  sorry

/-- 2.3 A Wedderburn presentation `F[G] ≃ₐ[F] Π i, Mat_{d i}(F)` makes the group tensor of `G`
equivalent, under restriction both ways, to the direct sum of the matrix multiplication tensors
`⟨d i, d i, d i⟩`, over every field. -/
theorem groupTensor_equiv_sum (F : Type*) [Field F] {G : Type*} [Group G] [Fintype G]
    [DecidableEq G] {q : ℕ} (d : Fin q → ℕ)
    (e : MonoidAlgebra F G ≃ₐ[F] Π i, Matrix (Fin (d i)) (Fin (d i)) F) :
    restrictLE (groupTensor F G) (List.ofFn fun i => mmTensor F (d i)).sum ∧
      restrictLE (List.ofFn fun i => mmTensor F (d i)).sum (groupTensor F G) := by
  sorry

/-- 2.4 The Cohn–Umans bound, over every field with a Wedderburn presentation of `F[G]`: if `G`
realizes `⟨n, m, p⟩`, then `(n m p)^(ω/3) ≤ ∑ i, (d i)^ω`, where `ω` is the exponent of matrix
multiplication over `F`. -/
theorem rpow_le_sum_rpow (F : Type*) [Field F] {G : Type*} [Group G] {q : ℕ} (d : Fin q → ℕ)
    (e : MonoidAlgebra F G ≃ₐ[F] Π i, Matrix (Fin (d i)) (Fin (d i)) F) {n m p : ℕ}
    (h : Realizes G n m p) :
    ((n * m * p : ℕ) : ℝ) ^ (matMulExponent F / 3) ≤ ∑ i, (d i : ℝ) ^ matMulExponent F := by
  sorry

end GroupAlgebra

/-! ## Layer 3: block sizes -/

/-- 3.1 Over an algebraically closed field, every block of a Wedderburn presentation of `F[G]`
has size at most the index of any abelian subgroup of `G`. -/
theorem le_index_of_isMulCommutative (F : Type*) [Field F] [IsAlgClosed F] {G : Type*} [Group G]
    (A : Subgroup G) [IsMulCommutative A] {q : ℕ} (d : Fin q → ℕ)
    (e : MonoidAlgebra F G ≃ₐ[F] Π i, Matrix (Fin (d i)) (Fin (d i)) F) (i : Fin q) :
    d i ≤ A.index := by
  sorry

/-- 3.2 Beating the sum of the cubes (Cohn, Kleinberg, Szegedy and Umans): over an algebraically
closed field, every block of a Wedderburn presentation of the group algebra of `cksuGroup n` has
size at most `2`, the cubes of the block sizes sum to at most `4 n⁶`, and for `n ≥ 5` this sum is
less than `(2n(n - 1))³`, the product of the sizes of the three sets of 1.3. -/
theorem sum_cube_lt (F : Type*) [Field F] [IsAlgClosed F] (n : ℕ) {q : ℕ} (d : Fin q → ℕ)
    (e : MonoidAlgebra F (cksuGroup n) ≃ₐ[F] Π i, Matrix (Fin (d i)) (Fin (d i)) F) :
    (∀ i, d i ≤ 2) ∧ ∑ i, d i ^ 3 ≤ 4 * n ^ 6 ∧
      (5 ≤ n → ∑ i, d i ^ 3 < (2 * n * (n - 1)) ^ 3) := by
  sorry

end TauCetiRoadmap.GroupTheoreticMatrixMultiplication
