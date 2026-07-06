import Mathlib

/-!
# Finite-dimensional representations of the classical groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has the classical **groups** (`Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`,
`Matrix.symplecticGroup`, `Matrix.orthogonalGroup`), the **representation** vocabulary
(`Representation`, `FDRep`, `FDRep.character`, `Representation.tprod`/`dual`/`linHom`), the whole
**multilinear engine** (`TensorPower`, `exteriorPower`, `SymmetricPower`), the **combinatorics**
(`YoungDiagram`, `SemistandardYoungTableau`, `Nat.Partition`), the **symmetric polynomials**
(`MvPolynomial.esymm`/`hsymm`/`psum`/`msymm`), and the abstract **root-system / Lie-weight** skeleton
(`RootSystem`, `LieModule.Weight`, `LieAlgebra.IsKilling.rootSystem`). It has **no standard representation
as a `Representation`, no decomposition of a tensor power, no weight theory for a matrix group, no Schur
polynomials, no Weyl character or dimension formula, and no branching rules** (see `README.md` for the
file-by-file map).

The design follows the layers of `README.md`: **0** the groups and the standard representation
(`stdRep`, `IsRationalRep`); **1** functorial powers (`tensorPowerRep`, `symPowerRep`, `extPowerRep`) and
their characters; **2** the Weyl construction (`permTensorAction`, `schurFunctor`, Schur-Weyl, shared with
`../SchurWeyl`); **3** weights and the highest-weight classification (`diagonalTorus`, `DominantWeight`,
`weightSpace`, `irreducible`, built on `../RootSystems` and `../LieHighestWeight`); **4** Schur polynomials
as characters (`schurPoly`, the Weyl character formula specialized); **5** the Weyl dimension formula
(`weylDimension`); **6** branching and the Gelfand-Tsetlin basis (`interlacingShapes`, `GTPattern`,
`gtBasis`). `README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.ClassicalGroups

open Matrix CategoryTheory
open scoped TensorProduct

set_option backward.isDefEq.respectTransparency false

universe u

/-! ## Layer 0: the classical groups and the standard representation -/

/-- **The standard (defining) representation** of `GLₙ` on `ℂⁿ`, the tautological action
`g • v = (g : Matrix _ _ ℂ).mulVec v`, built from `Matrix.GeneralLinearGroup.toLin`. The concrete engine:
every **polynomial** irreducible is cut from a tensor power of this, and the general rational irreducibles
are determinant twists `det^m ⊗ (polynomial irreducible)` of those. -/
def stdRep (n : ℕ) : Representation ℂ (GL (Fin n) ℂ) (Fin n → ℂ) := sorry

/-- **Rational representations** of `GLₙ`: on a chosen basis the matrix entries are rational functions of
the `gᵢⱼ` and `det⁻¹`. The condition is basis-independent (equivalently: the representation is a comodule
over the coordinate ring `ℂ[GLₙ] = ℂ[gᵢⱼ, det⁻¹]`), and this is the pinned meaning; the coordinate-entry
form is a lemma. The polynomial ones (no `det⁻¹`) are the sub-notion indexing partitions; `stdRep` and its
tensor powers are polynomial, and `det^m` are the one-dimensional rationals. (The comodule framework is
`../ReductiveGroups`, cited; here it is a property of an honest `Representation` of the matrix group.) -/
def IsRationalRep {n : ℕ} {W : Type u} [AddCommGroup W] [Module ℂ W]
    (ρ : Representation ℂ (GL (Fin n) ℂ) W) : Prop := sorry

/-- **Complete reducibility over `ℂ`**: every finite-dimensional rational representation is semisimple
(Weyl's unitarian trick / characteristic-0 linear reductivity). -/
theorem rationalRep_isSemisimple {n : ℕ} {W : Type u} [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (ρ : Representation ℂ (GL (Fin n) ℂ) W) (h : IsRationalRep ρ) :
    IsSemisimpleModule (MonoidAlgebra ℂ (GL (Fin n) ℂ)) ρ.asModule := sorry

/-! ## Layer 1: functorial constructions and tensor powers -/

/-- **The `d`-fold tensor power** of the standard representation (diagonal `GLₙ`-action). -/
def tensorPowerRep (n d : ℕ) : Representation ℂ (GL (Fin n) ℂ) (⨂[ℂ]^d (Fin n → ℂ)) := sorry

/-- **The `k`-th symmetric power** representation. (Mathlib lacks `FiniteDimensional (Sym[ℂ]^k _)`; supplying
that instance is itself a small target, so the character lemma below carries it as a hypothesis.) -/
def symPowerRep (n k : ℕ) : Representation ℂ (GL (Fin n) ℂ) (Sym[ℂ]^k (Fin n → ℂ)) := sorry

/-- **The `k`-th exterior power** representation, functorial via `exteriorPower.map`. `⋀ⁿ V ≅ det`, and
`⋀ᵏ V = 0` for `k > n`. -/
def extPowerRep (n k : ℕ) : Representation ℂ (GL (Fin n) ℂ) (⋀[ℂ]^k (Fin n → ℂ)) := sorry

/-- A diagonal torus element `diagonal (t₁, …, tₙ)` as an element of `GLₙ`. -/
def diagGL {n : ℕ} (t : Fin n → ℂˣ) : GL (Fin n) ℂ := sorry

/-- **Character of the tensor power**: `χ_{V^{⊗d}}(g) = (tr g)ᵈ`, via `char_tensor`. (Mathlib lacks
`FiniteDimensional (⨂[ℂ]^d _)`; providing it is a small target, carried here as a hypothesis.) -/
theorem char_tensorPowerRep (n d : ℕ) [FiniteDimensional ℂ (⨂[ℂ]^d (Fin n → ℂ))]
    (g : GL (Fin n) ℂ) :
    (tensorPowerRep n d).character g = ((stdRep n).character g) ^ d := sorry

/-- **Character of the exterior power** on the torus is the elementary symmetric polynomial. -/
theorem char_extPowerRep_diagonal (n k : ℕ) (t : Fin n → ℂˣ) :
    (extPowerRep n k).character (diagGL t)
      = MvPolynomial.eval (fun i => (t i : ℂ)) (MvPolynomial.esymm (Fin n) ℂ k) := sorry

/-- **The first decomposition** `V^{⊗2} ≅ Sym²V ⊕ ⋀²V`, at the level of characters (over `ℂ`, so the
symmetrizer/antisymmetrizer projections `½(1 ± swap)` split it). The structural iso is the smallest Weyl
construction. -/
theorem tensorSquare_char (n : ℕ) [FiniteDimensional ℂ (Sym[ℂ]^2 (Fin n → ℂ))] (g : GL (Fin n) ℂ) :
    ((stdRep n).character g) ^ 2
      = (symPowerRep n 2).character g + (extPowerRep n 2).character g := sorry

/-! ## Layer 2: the Weyl construction via Young symmetrizers (shared with `../SchurWeyl`) -/

/-- **The symmetric-group action** on `V^{⊗d}` permuting tensor factors. -/
def permTensorAction (n d : ℕ) : Representation ℂ (Equiv.Perm (Fin d)) (⨂[ℂ]^d (Fin n → ℂ)) := sorry

/-- **Schur-Weyl commutation**: the `GLₙ`-action and the `Sₐ`-action on `V^{⊗d}` commute (they generate each
other's commutants; full duality is cited from `../SchurWeyl`). -/
theorem schurWeyl_commute (n d : ℕ) (g : GL (Fin n) ℂ) (σ : Equiv.Perm (Fin d)) :
    (permTensorAction n d σ) ∘ₗ (tensorPowerRep n d g)
      = (tensorPowerRep n d g) ∘ₗ (permTensorAction n d σ) := sorry

/-- **The Schur functor** `Sᵘ V`: the image of the Young symmetrizer `c_λ` (from `../SchurWeyl`) acting on
`V^{⊗|λ|}`, a `GLₙ`-subrepresentation. `S^{(d)}V ≅ Symᵈ V`, `S^{(1ᵈ)}V ≅ ⋀ᵈ V`. -/
def schurFunctor (n : ℕ) (μ : YoungDiagram) : FDRep ℂ (GL (Fin n) ℂ) := sorry

/-! ## Layer 3: maximal torus, weights, and the highest-weight classification
built on `../RootSystems` (root data, Weyl group) and `../LieHighestWeight` (theorem of the highest
weight). -/

/-- **The maximal torus** of `GLₙ`: the invertible diagonal matrices. -/
def diagonalTorus (n : ℕ) : Subgroup (GL (Fin n) ℂ) := sorry

/-- **Dominant weights** for `GLₙ`: weakly decreasing integer sequences `λ₁ ≥ ⋯ ≥ λₙ`. The index type for
the irreducibles; `λ n ≥ 0` picks out the polynomial ones (partitions with ≤ `n` rows). The "last
coordinate" `λₙ` (the determinant-twist exponent) is read through a dedicated accessor, so the `n = 0` case
(the empty weight, indexing the trivial representation) needs no special casing at each use site; formulas
involving `Fin.last`, `λₙ`, and `j - i` are designed for the `Fin n` edge cases. -/
def DominantWeight (n : ℕ) : Type := {l : Fin n → ℤ // Antitone l}

/-- **The weight space** `Wλ` for `λ : Fin n → ℤ`: vectors on which `diagonal t` acts by `∏ tᵢ^{λᵢ}`. -/
def weightSpace {n : ℕ} {W : Type u} [AddCommGroup W] [Module ℂ W]
    (ρ : Representation ℂ (GL (Fin n) ℂ) W) (l : Fin n → ℤ) : Submodule ℂ W := sorry

/-- **The weight-space decomposition**: a rational representation is the internal direct sum of its weight
spaces (simultaneous diagonalization of the commuting torus over `ℂ`). -/
theorem weightSpace_isInternal {n : ℕ} {W : Type u} [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (ρ : Representation ℂ (GL (Fin n) ℂ) W) (h : IsRationalRep ρ) :
    DirectSum.IsInternal (fun l : Fin n → ℤ => weightSpace ρ l) := sorry

/-- **The irreducible of highest weight `λ`**. `λ ↦ irreducible n λ` is a bijection from `DominantWeight n`
to isomorphism classes of irreducible rational `GLₙ`-representations. `𝔤𝔩ₙ` is reductive, not semisimple, so
this is not a direct specialization of the semisimple theorem of the highest weight: it combines the
`𝔰𝔩ₙ` highest weight with the central character of the diagonal torus, whose integrality picks out exactly
the weakly decreasing integer sequences (`../LieHighestWeight` supplies the `𝔰𝔩ₙ` input). -/
def irreducible (n : ℕ) (l : DominantWeight n) : FDRep ℂ (GL (Fin n) ℂ) := sorry

/-- The irreducibles are simple objects of `FDRep ℂ (GL (Fin n) ℂ)`. -/
theorem irreducible_simple (n : ℕ) (l : DominantWeight n) : Simple (irreducible n l) := sorry

/-- The dominant weight of a partition (its shape read as a weakly decreasing sequence). -/
def weightOfShape (n : ℕ) (μ : YoungDiagram) : DominantWeight n := sorry

/-- **The Weyl construction meets the classification**: for a partition `μ`, the Schur functor is the
irreducible of the corresponding highest weight. -/
theorem schurFunctor_iso_irreducible (n : ℕ) (μ : YoungDiagram) :
    Nonempty (schurFunctor n μ ≅ irreducible n (weightOfShape n μ)) := sorry

/-! ## Layer 4: characters and Schur polynomials -/

/-- **The Schur polynomial** `s_μ` in `n` variables. The combinatorial Schur functions and their identities
are owned by `../SchurWeyl`; this is their `GLₙ`-variable specialization, consumed here. Defined by the
tableau sum `∑_T x^{wt T}` (or the Jacobi-Trudi determinant `det(h_{μ_i - i + j})`); the bialternant
`det(x_i^{μ_j + n - j}) / det(x_i^{n - j})` is a later theorem, since that quotient is not itself an
`MvPolynomial` and needs Vandermonde divisibility. -/
def schurPoly (n : ℕ) (μ : YoungDiagram) : MvPolynomial (Fin n) ℤ := sorry

/-- The Schur polynomials are symmetric. -/
theorem schurPoly_isSymmetric (n : ℕ) (μ : YoungDiagram) : (schurPoly n μ).IsSymmetric := sorry

/-- **The summit of the character theory** (the Weyl character formula specialized to `GLₙ`): the character
of the irreducible `V_μ`, restricted to the torus, is the Schur polynomial `s_μ`. -/
theorem character_irreducible_eq_schurPoly (n : ℕ) (μ : YoungDiagram) (t : Fin n → ℂˣ) :
    (irreducible n (weightOfShape n μ)).character (diagGL t)
      = MvPolynomial.eval (fun i => (t i : ℂ))
          (MvPolynomial.map (Int.castRingHom ℂ) (schurPoly n μ)) := sorry

/-- **The determinant-twist exponent** `m = λₙ` of a dominant weight (the last coordinate), the power of
`det` needed to make `λ` polynomial; `0` when `n = 0`. -/
def DominantWeight.detShift {n : ℕ} (l : DominantWeight n) : ℤ := sorry

/-- **The polynomial part** of a dominant weight: the partition `μ` with `μ_i = λ_i - λₙ`, so that
`λ = μ + λₙ · (1,…,1)`. -/
def DominantWeight.detShiftShape {n : ℕ} (l : DominantWeight n) : YoungDiagram := sorry

/-- **The character of a general (rational) irreducible** on the torus is a Laurent symmetric polynomial: a
determinant twist of a Schur polynomial. With `m = λₙ` and `μ_i = λ_i - m` (a partition),
`χ_{V_λ}(diagonal t) = (∏ tᵢ)^m · s_μ(t)`. `schurPoly` alone only reaches the polynomial case `m = 0`. -/
theorem character_irreducible_eq_detTwist (n : ℕ) (l : DominantWeight n) (t : Fin n → ℂˣ) :
    (irreducible n l).character (diagGL t)
      = (((∏ i, t i) ^ (DominantWeight.detShift l) : ℂˣ) : ℂ)
        * MvPolynomial.eval (fun i => (t i : ℂ))
            (MvPolynomial.map (Int.castRingHom ℂ) (schurPoly n (DominantWeight.detShiftShape l))) :=
  sorry

/-! ## Layer 5: the Weyl dimension formula -/

/-- **The Weyl dimension** `dim V_λ = ∏_{i < j} (λ_i - λ_j + j - i)/(j - i)` (for partitions, the
hook-content formula). -/
def weylDimension (n : ℕ) (l : DominantWeight n) : ℕ := sorry

/-- **Dimensions**: the value of the character at `1` is `weylDimension` (`char_one`). Obtained from
Layer 4 by evaluating `s_λ` at `x = (1,…,1)`. -/
theorem character_irreducible_one_eq_weylDimension (n : ℕ) (l : DominantWeight n) :
    (irreducible n l).character 1 = (weylDimension n l : ℂ) := sorry

/-! ## Layer 6: branching rules -/

/-- The partitions `ν` **interlacing** `μ`: for `GL_{n+1} ↓ GL_n`, `μ` has at most `n+1` rows, each `ν` has
at most `n` rows, and (padding row lengths by zeros) `μ_i ≥ ν_i ≥ μ_{i+1}`. These index the multiplicity-free
`GL_{n+1} ↓ GL_n` branching; the row-bound and interlacing constraints are what make the count finite. -/
def interlacingShapes (n : ℕ) (μ : YoungDiagram) : Finset YoungDiagram := sorry

/-- **The `GLₙ ↓ GLₙ₋₁` branching rule**, multiplicity-free, in Schur-polynomial form:
`s_μ(x₁,…,x_{n-1}, 1) = ∑_{ν ≺ μ} s_ν(x₁,…,x_{n-1})`. -/
theorem schurPoly_branching (n : ℕ) (μ : YoungDiagram) (x : Fin (n + 1) → ℂ) (hx : x (Fin.last n) = 1) :
    MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom ℂ) (schurPoly (n + 1) μ))
      = ∑ ν ∈ interlacingShapes n μ,
          MvPolynomial.eval (fun i : Fin n => x i.castSucc)
            (MvPolynomial.map (Int.castRingHom ℂ) (schurPoly n ν)) := sorry

/-- **A Gelfand-Tsetlin pattern** for `GLₙ`: a triangular array of integers whose row `j` has `j` entries
`λ_{0,j} ≥ ⋯ ≥ λ_{j-1,j}` (here `0`-based, so cell `(i, j)` is informative exactly when `i < j ≤ n`),
satisfying the **interlacing/betweenness** inequalities `λ_{i,j+1} ≥ λ_{i,j} ≥ λ_{i+1,j+1}`. Nothing named
`GelfandTsetlin` exists in Mathlib (the C\*-algebra `Gelfand*` files are unrelated), so this combinatorial
object is built from scratch. Entries may be **negative**, so the rational (determinant-twisted) patterns
are included; only the top row's sign controls whether the pattern is polynomial. -/
structure GTPattern (n : ℕ) where
  /-- The `i`-th entry (`0`-based, `i < j`) of row `j`; informative cells are `i < j ≤ n`. -/
  entry : ℕ → ℕ → ℤ
  /-- Cells outside the triangle `i < j ≤ n` carry no data. -/
  zeros' : ∀ {i j : ℕ}, n < j ∨ j ≤ i → entry i j = 0
  /-- The interlacing inequalities `λ_{i,j+1} ≥ λ_{i,j} ≥ λ_{i+1,j+1}`, ranged only over interior cells
  `i < j < n` where all three entries are informative. Weak decrease along each row is a consequence, and
  no nonnegativity is imposed on the row-final entries. -/
  interlacing' : ∀ {i j : ℕ}, i < j → j < n →
    entry i (j + 1) ≥ entry i j ∧ entry i j ≥ entry (i + 1) (j + 1)

/-- **The top row** `(λ_{1,n}, …, λ_{n,n})` of a Gelfand-Tsetlin pattern: the highest weight it refines. -/
def GTPattern.topRow {n : ℕ} (P : GTPattern n) : Fin n → ℤ := fun i => P.entry i n

/-- **The Gelfand-Tsetlin pattern ↔ semistandard tableau bijection** (polynomial case, `μ` a partition):
patterns with top row the shape `μ` (read as a weakly decreasing sequence) correspond to semistandard Young
tableaux of shape `μ` **with entries in `{0,…,n-1}`**, the `j`-th row of the pattern recording the sub-shape
on entries `< j` (shared with `../SchurWeyl`). Mathlib's `SemistandardYoungTableau μ` allows unbounded `ℕ`
entries, an infinite set for a nonempty shape, so the target is the bounded subtype `T i j < n`. -/
def gtPatternEquivSSYT (n : ℕ) (μ : YoungDiagram) :
    {P : GTPattern n // ∀ i, P.topRow i = (μ.rowLen i : ℤ)} ≃
      {T : SemistandardYoungTableau μ // ∀ i j, T i j < n} := sorry

/-- **The Gelfand-Tsetlin basis** of `V_λ`: iterating the multiplicity-free `GLₙ ↓ GLₙ₋₁` branching down the
chain `GL₁ ⊂ ⋯ ⊂ GLₙ` refines `V_λ` into a direct sum of **lines**, one per Gelfand-Tsetlin pattern with top
row `λ`. The lines are canonical; a `Basis` additionally fixes a vector in each line, so this pins the choice
of normalization (the joint eigenbasis of the Gelfand-Tsetlin subalgebra below, up to the standard
contravariant-form scaling). Valid for every `l : DominantWeight n`, since patterns carry negative entries;
the pattern ↔ tableau reading is the polynomial specialization `λ n ≥ 0`. -/
def gtBasis (n : ℕ) (l : DominantWeight n) :
    Module.Basis {P : GTPattern n // P.topRow = l.1} ℂ (irreducible n l) := sorry

/-- **The Gelfand-Tsetlin dimension count**: `dim V_λ` is the number of GT patterns with top row `λ`, proved
from the branching side by induction on `n` and then compared with the Weyl dimension formula of Layer 5 and,
via `gtPatternEquivSSYT`, with the tableau count `s_λ(1,…,1)`. -/
theorem finrank_irreducible_eq_card_gtPatterns (n : ℕ) (l : DominantWeight n) :
    Module.finrank ℂ (irreducible n l) = Nat.card {P : GTPattern n // P.topRow = l.1} := sorry

/-- The GT-pattern count agrees with the Weyl dimension formula of Layer 5. -/
theorem card_gtPatterns_eq_weylDimension (n : ℕ) (l : DominantWeight n) :
    Nat.card {P : GTPattern n // P.topRow = l.1} = weylDimension n l := sorry

/-- **The Gelfand-Tsetlin generators**: the images on `V_λ` of the **centre of the universal enveloping
algebra** `Z(U(𝔤𝔩_k))` (the Gelfand invariants / Capelli elements), for each level `k` of the chain
`GL₁ ⊂ ⋯ ⊂ GLₙ` and each degree `r ≤ k`. The Lie-algebra centre of `𝔤𝔩_k` is only the scalars; it is the
enveloping-algebra centre that yields the full maximal commutative Gelfand-Tsetlin subalgebra, so a level `k`
contributes `k` generators, not one. -/
def gtGenerator (n : ℕ) (l : DominantWeight n) (k : Fin n) (r : Fin (k.val + 1)) :
    Module.End ℂ (irreducible n l) := sorry

/-- **The Gelfand-Tsetlin eigenvalue** of the generator `(k, r)` on the basis vector indexed by pattern `P`,
an explicit polynomial in the entries of the first `k+1` rows of `P`. -/
def gtEigenvalue (n : ℕ) (l : DominantWeight n) (k : Fin n) (r : Fin (k.val + 1))
    (P : {P : GTPattern n // P.topRow = l.1}) : ℂ := sorry

/-- **The Gelfand-Tsetlin generators are diagonalized in the GT basis**: each basis vector is a joint
eigenvector of every generator `(k, r)`, with eigenvalue `gtEigenvalue`. -/
theorem gtGenerator_apply_gtBasis (n : ℕ) (l : DominantWeight n) (k : Fin n) (r : Fin (k.val + 1))
    (P : {P : GTPattern n // P.topRow = l.1}) :
    gtGenerator n l k r (gtBasis n l P) = gtEigenvalue n l k r P • gtBasis n l P := sorry

/-- **The Gelfand-Tsetlin subalgebra is maximal commutative**: the joint eigencharacter separates the basis,
so distinct patterns give distinct systems of eigenvalues. This is what makes the GT basis intrinsic (the
eigenbasis of the subalgebra), not merely a byproduct of one choice of chain. -/
theorem gtEigenvalue_injective (n : ℕ) (l : DominantWeight n) :
    Function.Injective
      (fun (P : {P : GTPattern n // P.topRow = l.1}) =>
        fun (kr : Σ k : Fin n, Fin (k.val + 1)) => gtEigenvalue n l kr.1 kr.2 P) := sorry

end TauCetiRoadmap.RepresentationTheory.ClassicalGroups
