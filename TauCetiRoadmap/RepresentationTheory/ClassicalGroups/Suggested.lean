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
every irreducible is cut from a tensor power of this. -/
def stdRep (n : ℕ) : Representation ℂ (GL (Fin n) ℂ) (Fin n → ℂ) := sorry

/-- **Rational representations** of `GLₙ`: matrix entries are rational functions of the `gᵢⱼ` and `det⁻¹`.
The polynomial ones (no `det⁻¹`) are the sub-notion indexing partitions; `stdRep` and its tensor powers are
polynomial, and `det^m` are the one-dimensional rationals. (The comodule framework is `../ReductiveGroups`;
here it is a property of an honest `Representation` of the matrix group.) -/
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
the irreducibles; `λ n ≥ 0` picks out the polynomial ones (partitions with ≤ `n` rows). -/
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
to isomorphism classes of irreducible rational `GLₙ`-representations (theorem of the highest weight, cited
from `../LieHighestWeight` and transported from `𝔤𝔩ₙ`). -/
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

/-- **The Schur polynomial** `s_λ`, absent from Mathlib: the bialternant
`det(x_i^{λ_j + n - j}) / det(x_i^{n - j})`, equal to the Jacobi-Trudi determinant and to
`∑_T x^{wt T}` over semistandard tableaux. -/
def schurPoly (n : ℕ) (μ : YoungDiagram) : MvPolynomial (Fin n) ℤ := sorry

/-- The Schur polynomials are symmetric. -/
theorem schurPoly_isSymmetric (n : ℕ) (μ : YoungDiagram) : (schurPoly n μ).IsSymmetric := sorry

/-- **The summit of the character theory** (the Weyl character formula specialized to `GLₙ`): the character
of the irreducible `V_μ`, restricted to the torus, is the Schur polynomial `s_μ`. -/
theorem character_irreducible_eq_schurPoly (n : ℕ) (μ : YoungDiagram) (t : Fin n → ℂˣ) :
    (irreducible n (weightOfShape n μ)).character (diagGL t)
      = MvPolynomial.eval (fun i => (t i : ℂ))
          (MvPolynomial.map (Int.castRingHom ℂ) (schurPoly n μ)) := sorry

/-! ## Layer 5: the Weyl dimension formula -/

/-- **The Weyl dimension** `dim V_λ = ∏_{i < j} (λ_i - λ_j + j - i)/(j - i)` (for partitions, the
hook-content formula). -/
def weylDimension (n : ℕ) (l : DominantWeight n) : ℕ := sorry

/-- **Dimensions**: the value of the character at `1` is `weylDimension` (`char_one`). Obtained from
Layer 4 by evaluating `s_λ` at `x = (1,…,1)`. -/
theorem character_irreducible_one_eq_weylDimension (n : ℕ) (l : DominantWeight n) :
    (irreducible n l).character 1 = (weylDimension n l : ℂ) := sorry

/-! ## Layer 6: branching rules -/

/-- The partitions `ν` **interlacing** `μ` (`λ_i ≥ ν_i ≥ λ_{i+1}`), which index `GLₙ ↓ GLₙ₋₁` branching. -/
def interlacingShapes (n : ℕ) (μ : YoungDiagram) : Finset YoungDiagram := sorry

/-- **The `GLₙ ↓ GLₙ₋₁` branching rule**, multiplicity-free, in Schur-polynomial form:
`s_μ(x₁,…,x_{n-1}, 1) = ∑_{ν ≺ μ} s_ν(x₁,…,x_{n-1})`. -/
theorem schurPoly_branching (n : ℕ) (μ : YoungDiagram) (x : Fin (n + 1) → ℂ) (hx : x (Fin.last n) = 1) :
    MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom ℂ) (schurPoly (n + 1) μ))
      = ∑ ν ∈ interlacingShapes n μ,
          MvPolynomial.eval (fun i : Fin n => x i.castSucc)
            (MvPolynomial.map (Int.castRingHom ℂ) (schurPoly n ν)) := sorry

/-- **A Gelfand-Tsetlin pattern** for `GLₙ`: a triangular array `(λ_{i,j})_{1 ≤ i ≤ j ≤ n}` of integers (row
`j` has `j` entries) satisfying the **interlacing/betweenness** inequalities
`λ_{i,j+1} ≥ λ_{i,j} ≥ λ_{i+1,j+1}`. Nothing named `GelfandTsetlin` exists in Mathlib (the C\*-algebra
`Gelfand*` files are unrelated), so this combinatorial object is built from scratch. Here `entry i j` carries
the `i`-th entry of row `j`; data lives on the triangle `i < j ≤ n` and is `0` elsewhere. -/
structure GTPattern (n : ℕ) where
  /-- The `i`-th entry of row `j`, indexed so that the informative cells are `i < j ≤ n`. -/
  entry : ℕ → ℕ → ℤ
  /-- Cells outside the triangle `i < j ≤ n` carry no data. -/
  zeros' : ∀ {i j : ℕ}, n < j ∨ j ≤ i → entry i j = 0
  /-- The interlacing inequalities `λ_{i,j+1} ≥ λ_{i,j} ≥ λ_{i+1,j+1}`. -/
  interlacing' : ∀ {i j : ℕ}, i ≤ j → j < n →
    entry i (j + 1) ≥ entry i j ∧ entry i j ≥ entry (i + 1) (j + 1)

/-- **The top row** `(λ_{1,n}, …, λ_{n,n})` of a Gelfand-Tsetlin pattern: the highest weight it refines. -/
def GTPattern.topRow {n : ℕ} (P : GTPattern n) : Fin n → ℤ := fun i => P.entry i n

/-- **The Gelfand-Tsetlin pattern ↔ semistandard tableau bijection**: patterns with top row the shape `μ`
(read as a weakly decreasing sequence) correspond to semistandard Young tableaux of shape `μ` with entries in
`{1,…,n}`, the `j`-th row of the pattern recording the sub-shape on entries `≤ j` (shared with `../SchurWeyl`). -/
def gtPatternEquivSSYT (n : ℕ) (μ : YoungDiagram) :
    {P : GTPattern n // ∀ i, P.topRow i = (μ.rowLen i : ℤ)} ≃ SemistandardYoungTableau μ := sorry

/-- **The Gelfand-Tsetlin basis** of `V_λ`: iterating the multiplicity-free `GLₙ ↓ GLₙ₋₁` branching down the
chain `GL₁ ⊂ ⋯ ⊂ GLₙ` refines `V_λ` into lines, one per Gelfand-Tsetlin pattern with top row `λ`. -/
def gtBasis (n : ℕ) (l : DominantWeight n) :
    Module.Basis {P : GTPattern n // P.topRow = l.1} ℂ (irreducible n l) := sorry

/-- **The Gelfand-Tsetlin dimension count**: `dim V_λ` is the number of GT patterns with top row `λ` (the
branching-theoretic reading of the Weyl dimension formula, and — via `gtPatternEquivSSYT` — of the tableau
count `s_λ(1,…,1)`). -/
theorem finrank_irreducible_eq_card_gtPatterns (n : ℕ) (l : DominantWeight n) :
    Module.finrank ℂ (irreducible n l) = Nat.card {P : GTPattern n // P.topRow = l.1} := sorry

/-- The GT-pattern count agrees with the Weyl dimension formula of Layer 5. -/
theorem card_gtPatterns_eq_weylDimension (n : ℕ) (l : DominantWeight n) :
    Nat.card {P : GTPattern n // P.topRow = l.1} = weylDimension n l := sorry

/-- **The Gelfand-Tsetlin generators**: the image on `V_λ` of the centre of `𝔤𝔩_k` (`k = ` the given index),
one operator per level of the chain `GL₁ ⊂ ⋯ ⊂ GLₙ`. Together they form the Gelfand-Tsetlin subalgebra, a
maximal commutative family. -/
def gtGenerator (n : ℕ) (l : DominantWeight n) (k : Fin n) : Module.End ℂ (irreducible n l) := sorry

/-- **The Gelfand-Tsetlin generators are diagonalized in the GT basis**: each basis vector is a joint
eigenvector of every `gtGenerator`, with eigenvalue an explicit function of the pattern entries. -/
theorem gtGenerator_apply_gtBasis (n : ℕ) (l : DominantWeight n) (k : Fin n)
    (P : {P : GTPattern n // P.topRow = l.1}) :
    ∃ c : ℂ, gtGenerator n l k (gtBasis n l P) = c • gtBasis n l P := sorry

end TauCetiRoadmap.RepresentationTheory.ClassicalGroups
