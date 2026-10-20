import Mathlib
import TauCeti.Geometry.Lie.Exponential.Units.Basic
import TauCeti.Algebra.Lie.GeneralLinear.Radical
import TauCeti.RepresentationTheory.ClassicalGroups.WeylModule.Basic
import TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Tableau
import TauCeti.RepresentationTheory.ClassicalGroups.WeylModule.Rational
import TauCeti.RepresentationTheory.ClassicalGroups.WeylModule.SchurWeyl
import TauCeti.RepresentationTheory.ClassicalGroups.WeylDimension.Basic
import TauCeti.RepresentationTheory.ClassicalGroups.Rational
import TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower
import TauCeti.RepresentationTheory.ClassicalGroups.ExteriorPower
import TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Dimension
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Symmetric

/-!
# Finite-dimensional representations of the classical groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

The imported Tau Ceti modules supply the standard and power representations,
rationality predicates, torus/weight/dominant-weight carriers, rational Weyl
representations, Schur-functor images, finite Schur polynomials and GT patterns.
New targets below consume those same native objects.

The design follows the layers of `README.md`: **0** the groups and the standard representation
(`stdRep`, `IsRationalRep`); **1** functorial powers (`tensorPowerRep`, `symPowerRep`, `extPowerRep`) and
their characters; **2** the Weyl construction (`permTensorAction`, `schurFunctor`, Schur-Weyl, shared with
`../SchurWeyl`); **3** weights and the highest-weight classification (`diagonalTorus`, `DominantWeight`,
`weightSpace`, `highestWeightRep`, using native GLₙ torus/transvection theory;
other connected classical groups use `../RootSystems` and `../LieHighestWeight`); **4** Schur polynomials
as characters (`schurPoly`, the Weyl character formula specialized); **5** the Weyl dimension formula
(`weylDimension`); **6** branching and the Gelfand-Tsetlin basis (`interlacingShapes`, `GTPattern`,
`gtBasis`). `README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.ClassicalGroups

open Matrix CategoryTheory
open scoped TensorProduct

/- Needed for instance resolution in the multilinear signatures below (checked: the file does not
elaborate without it). Roadmap-file only: the built library under `TauCeti/` textually bans
`set_option`, so the implementation must instead thread the transparency through explicit instances. -/
set_option backward.isDefEq.respectTransparency false

universe u

/-! ## Layer 0: the classical groups and the standard representation -/

/-- **The standard (defining) representation** of `GLₙ` on `ℂⁿ`, the tautological action
`g • v = (g : Matrix _ _ ℂ).mulVec v`, built from `Matrix.GeneralLinearGroup.toLin`. The concrete engine:
every **polynomial** irreducible is cut from a tensor power of this, and the general rational irreducibles
are determinant twists `det^m ⊗ (polynomial irreducible)` of those. -/
abbrev stdRep (n : ℕ) : Representation ℂ (GL (Fin n) ℂ) (Fin n → ℂ) := TauCeti.stdRep ℂ n

/-- **Rational representations** of `GLₙ`: on a basis indexed by `Fin (finrank ℂ W)` the matrix
entries are polynomial in the `gᵢⱼ` divided by a power of `det` — the coordinate-entry form, which is
the **pinned meaning** (a finite-dimensional carrier is forced: no such basis exists otherwise).
Basis-independence is a companion lemma, and the equivalence with the comodule formulation over the
coordinate ring `ℂ[GLₙ] = ℂ[gᵢⱼ, det⁻¹]` is a further lemma cited to `../ReductiveGroups`; here the
notion is a property of an honest `Representation` of the matrix group. The polynomial ones (`m = 0`,
no `det⁻¹`) are the sub-notion indexing partitions; `stdRep` and its tensor powers are polynomial, and
`det^m` are the one-dimensional rationals. -/
abbrev IsRationalRep {n : ℕ} {W : Type u} [AddCommGroup W] [Module ℂ W]
    (ρ : Representation ℂ (GL (Fin n) ℂ) W) : Prop := TauCeti.IsRationalRep ρ

/-- **Complete reducibility over `ℂ`**: every finite-dimensional rational representation is semisimple
(Weyl's unitarian trick / characteristic-0 linear reductivity). -/
theorem rationalRep_isSemisimple {n : ℕ} {W : Type u} [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (ρ : Representation ℂ (GL (Fin n) ℂ) W) (h : IsRationalRep ρ) :
    IsSemisimpleModule (MonoidAlgebra ℂ (GL (Fin n) ℂ)) ρ.asModule := sorry

/-! ## Layer 1: functorial constructions and tensor powers -/

/-- **The `d`-fold tensor power** of the standard representation (diagonal `GLₙ`-action). -/
noncomputable abbrev tensorPowerRep (n d : ℕ) : Representation ℂ (GL (Fin n) ℂ) (⨂[ℂ]^d (Fin n → ℂ)) := TauCeti.tensorPowerRep ℂ n d

/-- The native symmetric-power representation; imported finite-dimensional instances are consumed. -/
noncomputable abbrev symPowerRep (n k : ℕ) : Representation ℂ (GL (Fin n) ℂ) (Sym[ℂ]^k (Fin n → ℂ)) :=
  TauCeti.symPowerRep ℂ n k

/-- **The `k`-th exterior power** representation, functorial via `exteriorPower.map`. `⋀ⁿ V ≅ det`, and
`⋀ᵏ V = 0` for `k > n`. -/
noncomputable abbrev extPowerRep (n k : ℕ) : Representation ℂ (GL (Fin n) ℂ) (⋀[ℂ]^k (Fin n → ℂ)) :=
  TauCeti.extPowerRep ℂ n k

/-- A diagonal torus element `diagonal (t₁, …, tₙ)` as an element of `GLₙ`. -/
abbrev diagGL {n : ℕ} (t : Fin n → ℂˣ) : GL (Fin n) ℂ := TauCeti.diagGL t

/-- Character of the tensor power, using the imported native finite-dimensional instance. -/
theorem char_tensorPowerRep (n d : ℕ)
    (g : GL (Fin n) ℂ) :
    (tensorPowerRep n d).character g = ((stdRep n).character g) ^ d := sorry

/-- **Character of the exterior power** on the torus is the elementary symmetric polynomial. -/
theorem char_extPowerRep_diagonal (n k : ℕ) (t : Fin n → ℂˣ) :
    (extPowerRep n k).character (diagGL t)
      = MvPolynomial.eval (fun i => (t i : ℂ)) (MvPolynomial.esymm (Fin n) ℂ k) := sorry

/-- **The first decomposition** `V^{⊗2} ≅ Sym²V ⊕ ⋀²V`, at the level of characters (over `ℂ`, so the
symmetrizer/antisymmetrizer projections `½(1 ± swap)` split it). The structural iso is the smallest Weyl
construction. -/
theorem tensorSquare_char (n : ℕ) (g : GL (Fin n) ℂ) :
    ((stdRep n).character g) ^ 2
      = (symPowerRep n 2).character g + (extPowerRep n 2).character g := sorry

/-! ## Layer 2: the Weyl construction via Young symmetrizers (shared with `../SchurWeyl`) -/

/-- **The symmetric-group action** on `V^{⊗d}` permuting tensor factors. Ownership: in the built
library this is `../SchurWeyl`'s action specialized to `V = ℂⁿ`, re-exported — not a second
definition; the `abbrev` consumes the native action. -/
noncomputable abbrev permTensorAction (n d : ℕ) :
    Representation ℂ (Equiv.Perm (Fin d)) (⨂[ℂ]^d (Fin n → ℂ)) :=
  TauCeti.permTensorAction ℂ n d

/-- **Schur-Weyl commutation**: the `GLₙ`-action and the `Sₐ`-action on `V^{⊗d}` commute (they generate each
other's commutants; full duality is cited from `../SchurWeyl`). -/
theorem schurWeyl_commute (n d : ℕ) (g : GL (Fin n) ℂ) (σ : Equiv.Perm (Fin d)) :
    (permTensorAction n d σ) ∘ₗ (tensorPowerRep n d g)
      = (tensorPowerRep n d g) ∘ₗ (permTensorAction n d σ) :=
  (TauCeti.commute_permTensorAction_tensorPowerRep ℂ n d σ g).eq

/-- **The Schur functor** `Sᵘ V`: the image of the Young symmetrizer `c_λ` (from `../SchurWeyl`) acting on
`V^{⊗|λ|}`, a `GLₙ`-subrepresentation. `S^{(d)}V ≅ Symᵈ V`, `S^{(1ᵈ)}V ≅ ⋀ᵈ V`. Ownership: the Young
symmetrizer belongs to `../SchurWeyl` Layer 2; this layer owns the native
Schur-functor image consumed by its Layer 8 duality. -/
noncomputable abbrev schurFunctor (n : ℕ) (μ : YoungDiagram) :
    FDRep ℂ (GL (Fin n) ℂ) :=
  TauCeti.schurFunctor n μ

/-! ## Layer 3: maximal torus, weights, and the highest-weight classification
The GLₙ route uses native torus/transvection theory; other connected classical groups
consume `../RootSystems` and `../LieHighestWeight`. -/

/-- **The maximal torus** of `GLₙ`: the invertible diagonal matrices. -/
abbrev diagonalTorus (n : ℕ) : Subgroup (GL (Fin n) ℂ) := TauCeti.diagonalTorus ℂ n

/-- **Dominant weights** for `GLₙ`: weakly decreasing integer sequences `λ₁ ≥ ⋯ ≥ λₙ`. The index type for
the irreducibles; `λ n ≥ 0` picks out the polynomial ones (partitions with ≤ `n` rows). The "last
coordinate" `λₙ` (the determinant-twist exponent) is read through a dedicated accessor, so the `n = 0` case
(the empty weight, indexing the trivial representation) needs no special casing at each use site; formulas
involving `Fin.last`, `λₙ`, and `j - i` are designed for the `Fin n` edge cases. An `abbrev` (thin
subtype wrapper), per the def-vs-abbrev guardrail. -/
abbrev DominantWeight (n : ℕ) : Type := TauCeti.DominantWeight n

/-- **The weight space** `Wλ` for `λ : Fin n → ℤ`: vectors on which `diagonal t` acts by `∏ tᵢ^{λᵢ}`. -/
abbrev weightSpace {n : ℕ} {W : Type u} [AddCommGroup W] [Module ℂ W]
    (ρ : Representation ℂ (GL (Fin n) ℂ) W) (l : Fin n → ℤ) : Submodule ℂ W := TauCeti.weightSpace ρ l

/-- **The weight-space decomposition**: a rational representation is the internal direct sum of its weight
spaces (simultaneous diagonalization of the commuting torus over `ℂ`). -/
theorem weightSpace_isInternal {n : ℕ} {W : Type u} [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (ρ : Representation ℂ (GL (Fin n) ℂ) W) (h : IsRationalRep ρ) :
    DirectSum.IsInternal (fun l : Fin n → ℤ => weightSpace ρ l) := sorry

/-- **The irreducible of highest weight `λ`**. `λ ↦ highestWeightRep n λ` is a bijection from `DominantWeight n`
to isomorphism classes of irreducible rational `GLₙ`-representations. `𝔤𝔩ₙ` is reductive, not semisimple, so
the native group-level route uses torus weights and elementary transvections,
with the central character retaining all integer coordinates. Named
`highestWeightRep` rather than `irreducible` to avoid colliding with Lean's `irreducible` attribute
and Mathlib's `Irreducible`. -/
noncomputable abbrev highestWeightRep (n : ℕ) (l : DominantWeight n) :
    FDRep ℂ (GL (Fin n) ℂ) := TauCeti.rationalWeylFDRep ℂ n l

/-- The irreducibles are simple objects of `FDRep ℂ (GL (Fin n) ℂ)`. -/
theorem highestWeightRep_simple (n : ℕ) (l : DominantWeight n) : Simple (highestWeightRep n l) := by infer_instance

/-- The dominant weight of a partition (its shape read as a weakly decreasing sequence). Only
meaningful on its intended domain `μ.colLen 0 ≤ n` (at most `n` rows): the definition reads the
first `n` row lengths, so for taller diagrams it silently truncates, and every consumer below
carries the row bound explicitly. -/
abbrev weightOfShape (n : ℕ) (μ : YoungDiagram) : DominantWeight n := TauCeti.weightOfShape n μ

/-- **The Weyl construction meets the classification**: for a partition `μ` with at most `n` rows,
the Schur functor is the irreducible of the corresponding highest weight. The row bound
`μ.colLen 0 ≤ n` is essential: for taller `μ` the Schur functor vanishes (`Sᵘ V = 0` iff `μ` has
more than `n` rows, README Layer 2) while `highestWeightRep` of the truncated weight is nonzero. -/
theorem schurFunctor_iso_irreducible (n : ℕ) (μ : YoungDiagram) (hμ : μ.colLen 0 ≤ n) :
    Nonempty (schurFunctor n μ ≅ highestWeightRep n (weightOfShape n μ)) := sorry

/-! ## Layer 4: characters and Schur polynomials -/

/-- **The Schur polynomial** `s_μ` in `n` variables. The combinatorial Schur functions and their identities
are owned by `../SchurWeyl`; this is their `GLₙ`-variable specialization, consumed here. Defined by the
tableau sum `∑_T x^{wt T}` (or the Jacobi-Trudi determinant `det(h_{μ_i - i + j})`); the bialternant
`det(x_i^{μ_j + n - j}) / det(x_i^{n - j})` is a later theorem, since that quotient is not itself an
`MvPolynomial` and needs Vandermonde divisibility. Ownership: in the built library this is
native `diagramSchurPoly n ℤ μ` (a definitional alias, not a second
Schur-function foundation); the `abbrev` consumes the native diagram-indexed polynomial. -/
noncomputable abbrev schurPoly (n : ℕ) (μ : YoungDiagram) : MvPolynomial (Fin n) ℤ :=
  TauCeti.diagramSchurPoly n ℤ μ

/-- The Schur polynomials are symmetric. -/
theorem schurPoly_isSymmetric (n : ℕ) (μ : YoungDiagram) : (schurPoly n μ).IsSymmetric := TauCeti.isSymmetric_diagramSchurPoly n ℤ μ

/-- Torus character and dimension on the actual native Schur-functor carrier. -/
theorem char_schurFunctor_diagonal (n : ℕ) (μ : YoungDiagram) (t : Fin n → ℂˣ) :
    (TauCeti.schurFunctor n μ).character (TauCeti.diagGL t) =
      MvPolynomial.eval (fun i => (t i : ℂ)) (TauCeti.diagramSchurPoly n ℂ μ) := by sorry

theorem finrank_schurFunctor (n : ℕ) (μ : YoungDiagram) :
    Module.finrank ℂ (TauCeti.schurFunctor n μ) = Nat.card (TauCeti.BoundedSSYT n μ) := by sorry

/-- **The summit of the character theory** (the Weyl character formula specialized to `GLₙ`): the character
of the irreducible `V_μ`, restricted to the torus, is the Schur polynomial `s_μ`. The row bound is
essential: for `μ` with more than `n` rows, `schurPoly n μ = 0` (no SSYT in `n` letters) while the
irreducible of the truncated weight has nonzero character. -/
theorem character_irreducible_eq_schurPoly (n : ℕ) (μ : YoungDiagram) (hμ : μ.colLen 0 ≤ n)
    (t : Fin n → ℂˣ) :
    (highestWeightRep n (weightOfShape n μ)).character (diagGL t)
      = MvPolynomial.eval (fun i => (t i : ℂ))
          (MvPolynomial.map (Int.castRingHom ℂ) (schurPoly n μ)) := sorry

/-- **The determinant-twist exponent** `m = λₙ` of a dominant weight (the last coordinate), the power of
`det` needed to make `λ` polynomial; `0` when `n = 0`. -/
abbrev DominantWeight.detShift {n : ℕ} (l : DominantWeight n) : ℤ := TauCeti.DominantWeight.detShift l

/-- **The polynomial part** of a dominant weight: the partition `μ` with `μ_i = λ_i - λₙ`, so that
`λ = μ + λₙ · (1,…,1)`. -/
abbrev DominantWeight.detShiftShape {n : ℕ} (l : DominantWeight n) : YoungDiagram := TauCeti.DominantWeight.detShiftShape l

/-- **The character of a general (rational) irreducible** on the torus is a Laurent symmetric polynomial: a
determinant twist of a Schur polynomial. With `m = λₙ` and `μ_i = λ_i - m` (a partition),
`χ_{V_λ}(diagonal t) = (∏ tᵢ)^m · s_μ(t)`. `schurPoly` alone only reaches the polynomial case `m = 0`. -/
theorem character_irreducible_eq_detTwist (n : ℕ) (l : DominantWeight n) (t : Fin n → ℂˣ) :
    (highestWeightRep n l).character (diagGL t)
      = (((∏ i, t i) ^ (DominantWeight.detShift l) : ℂˣ) : ℂ)
        * MvPolynomial.eval (fun i => (t i : ℂ))
            (MvPolynomial.map (Int.castRingHom ℂ) (schurPoly n (DominantWeight.detShiftShape l))) :=
  sorry

/-! ## Layer 5: the Weyl dimension formula -/

/-- **The Weyl dimension** `dim V_λ = ∏_{i < j} (λ_i - λ_j + j - i)/(j - i)` (for partitions, the
hook-content formula). -/
abbrev weylDimension (n : ℕ) (l : DominantWeight n) : ℕ := TauCeti.weylDimension l

/-- **Dimensions**: the value of the character at `1` is `weylDimension` (`char_one`). Obtained from
Layer 4 by evaluating `s_λ` at `x = (1,…,1)`. -/
theorem character_irreducible_one_eq_weylDimension (n : ℕ) (l : DominantWeight n) :
    (highestWeightRep n l).character 1 = (weylDimension n l : ℂ) := sorry

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
object is consumed from native Tau Ceti. Entries may be **negative**, so the rational (determinant-twisted) patterns
are included; only the top row's sign controls whether the pattern is polynomial. -/
abbrev GTPattern (n : ℕ) := TauCeti.GTPattern n
abbrev GTPattern.topRow {n : ℕ} (P : GTPattern n) : Fin n → ℤ := TauCeti.GTPattern.topRow P

/-- The native polynomial tableau/pattern dictionary, with its actual bounded carrier. -/
noncomputable abbrev gtPatternEquivSSYT (n : ℕ) (μ : YoungDiagram) (hμ : μ.colLen 0 ≤ n) :
    {P : GTPattern n // ∀ i, P.topRow i = (μ.rowLen i : ℤ)} ≃ TauCeti.BoundedSSYT n μ :=
  TauCeti.gtPatternEquivSSYT n μ hμ

/-- **The Gelfand-Tsetlin basis** of `V_λ`: iterating the multiplicity-free `GLₙ ↓ GLₙ₋₁` branching down the
chain `GL₁ ⊂ ⋯ ⊂ GLₙ` refines `V_λ` into a direct sum of **lines**, one per Gelfand-Tsetlin pattern with top
row `λ`. The lines are canonical; a `Basis` additionally fixes a vector in each line, so this pins the choice
of normalization: the README's fixed highest vector and ordered Molev2.7 lowering product;
sourceGTLowering below gives its actual carrier equation, separate from the contravariant norm. Valid for every `l : DominantWeight n`, since patterns carry negative entries;
the pattern ↔ tableau reading is the polynomial specialization `λ n ≥ 0`. -/
def gtBasis (n : ℕ) (l : DominantWeight n) :
    Module.Basis {P : GTPattern n // P.topRow = l.1} ℂ (highestWeightRep n l) := sorry

/-- **The Gelfand-Tsetlin dimension count**: `dim V_λ` is the number of GT patterns with top row `λ`, proved
from the branching side by induction on `n` and then compared with the Weyl dimension formula of Layer 5 and,
via `gtPatternEquivSSYT`, with the tableau count `s_λ(1,…,1)`. -/
theorem finrank_irreducible_eq_card_gtPatterns (n : ℕ) (l : DominantWeight n) :
    Module.finrank ℂ (highestWeightRep n l) = Nat.card {P : GTPattern n // P.topRow = l.1} := sorry

/-- The GT-pattern count agrees with the Weyl dimension formula of Layer 5. -/
theorem card_gtPatterns_eq_weylDimension (n : ℕ) (l : DominantWeight n) :
    Nat.card {P : GTPattern n // P.topRow = l.1} = weylDimension n l :=
  TauCeti.GTPattern.card_topRow_eq_weylDimension l

/-- **The Gelfand-Tsetlin generators**: the images on `V_λ` of the **centre of the universal enveloping
algebra** `Z(U(𝔤𝔩_k))` (the Gelfand invariants / Capelli elements), for each level `k` of the chain
`GL₁ ⊂ ⋯ ⊂ GLₙ` and each degree `r ≤ k`. The Lie-algebra centre of `𝔤𝔩_k` is only the scalars; it is the
enveloping-algebra centre that yields the full maximal commutative Gelfand-Tsetlin subalgebra. Indexing
convention: the chain level is written 0-based as `k : Fin n` (matrix size `k + 1`), contributing the
`k + 1` generators `r : Fin (k.val + 1)` of degrees `1, …, k + 1` — this matches the README's 1-based
"level `k` contributes `k` generators" with level `= k + 1`, total `∑ₖ (k+1) = n(n+1)/2`. -/
def gtGenerator (n : ℕ) (l : DominantWeight n) (k : Fin n) (r : Fin (k.val + 1)) :
    Module.End ℂ (highestWeightRep n l) := sorry

/-- **The Gelfand-Tsetlin eigenvalue** of the generator `(k, r)` on the basis vector indexed by pattern `P`,
an explicit polynomial in the entries of the first `k+1` rows of `P`. -/
noncomputable def gtEigenvalue (n : ℕ) (l : DominantWeight n) (k : Fin n) (r : Fin (k.val + 1))
    (P : {P : GTPattern n // P.topRow = l.1}) : ℂ :=
  ∑ s ∈ (Finset.univ : Finset (Fin (k.val+1))).powersetCard (r.val+1),
    ∏ i ∈ s, ((P.1 i.val (k.val+1) : ℂ) - (i.val : ℂ))

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

/-! ## Explicit Capelli coefficients and rational classical-group targets
These are new signature targets, not an implementation or an exhaustive checklist.
The README fixes the finite-module lowering constructions and all comparisons.
-/

/-- Differentiated native rational Weyl action of the matrix unit E_ij.
The required construction uses the actual GL/Lie comparison, not chosen eigenvalues. -/
noncomputable def matrixUnitAction (n : ℕ) (l : DominantWeight n) (i j : Fin n) :
    Module.End ℂ (highestWeightRep n l) := by sorry

/-- Column-ordered Capelli determinant in the actual endomorphism algebra.
List.prod retains the order, since the coefficients need not commute. -/
noncomputable def capelliActionPolynomial (n : ℕ) (l : DominantWeight n) (k : Fin n) :
    Polynomial (Module.End ℂ (highestWeightRep n l)) :=
  ∑ σ : Equiv.Perm (Fin (k.val + 1)),
    (((σ.sign : ℤ) : ℂ) •
      (List.ofFn fun c : Fin (k.val + 1) =>
        Polynomial.C (matrixUnitAction n l
          ⟨(σ c).val, by omega⟩ ⟨c.val, by omega⟩) +
        if σ c = c then (Polynomial.X : Polynomial (Module.End ℂ (highestWeightRep n l))) +
          Polynomial.C ((-(c.val : ℂ)) • (1 : Module.End ℂ (highestWeightRep n l)))
        else 0).prod)

/-- This coefficient is the actual central action, not unrelated generator data. -/
noncomputable def capelliGenerator (n : ℕ) (l : DominantWeight n)
    (k : Fin n) (r : Fin (k.val + 1)) : Module.End ℂ (highestWeightRep n l) :=
  (capelliActionPolynomial n l k).coeff (k.val - r.val)

theorem capelliGenerator_eq_gtGenerator (n : ℕ) (l : DominantWeight n)
    (k : Fin n) (r : Fin (k.val + 1)) :
    capelliGenerator n l k r = gtGenerator n l k r := by sorry

theorem capelliGenerator_commute_matrixUnit (n : ℕ) (l : DominantWeight n)
    (k : Fin n) (r : Fin (k.val + 1)) (i j : Fin (k.val + 1)) :
    Commute (capelliGenerator n l k r)
      (matrixUnitAction n l ⟨i.val, by omega⟩ ⟨j.val, by omega⟩) := by sorry

/-- The chosen source normalization is a concrete vector, including the unit at n=0. -/
noncomputable def normalizedHighestVector (n : ℕ) (l : DominantWeight n) :
    highestWeightRep n l := by sorry

theorem normalizedHighestVector_ne_zero (n : ℕ) (l : DominantWeight n) :
    normalizedHighestVector n l ≠ 0 := by sorry

/-- The actual source-ordered lowering operator on the native carrier, with the
finite-module pole cancellation and matrix-unit laws specified in the README. -/
noncomputable def sourceGTLowering (n : ℕ) (l : DominantWeight n)
    (P : {P : GTPattern n // P.topRow = l.1}) :
    Module.End ℂ (highestWeightRep n l) := by sorry

theorem gtBasis_eq_sourceLowering (n : ℕ) (l : DominantWeight n)
    (P : {P : GTPattern n // P.topRow = l.1}) :
    gtBasis n l P = sourceGTLowering n l P (normalizedHighestVector n l) := by sorry

namespace FormGroups

abbrev Sp (r : ℕ) := Matrix.symplecticGroup (Fin r) ℂ
abbrev SO (n : ℕ) := Matrix.specialOrthogonalGroup (Fin n) ℂ

/-- A real coordinate condition, compared with the generic coordinate-comodule
definition in ReductiveGroups. It does not replace the native GL predicates. -/
def HasRegularMatrixCoefficients {G I W : Type*} [Monoid G] [Fintype I]
    [AddCommGroup W] [Module ℂ W] (entry : G → Matrix I I ℂ)
    (ρ : Representation ℂ G W) : Prop :=
  ∃ (b : Module.Basis (Fin (Module.finrank ℂ W)) ℂ W)
    (q : Fin (Module.finrank ℂ W) → Fin (Module.finrank ℂ W) →
      MvPolynomial (I × I) ℂ),
    ∀ g i j, LinearMap.toMatrix b b (ρ g) i j =
      MvPolynomial.eval (fun p => entry g p.1 p.2) (q i j)

abbrev SpWeight (r : ℕ) :=
  {a : Fin r → ℤ // Antitone a ∧ ∀ i, 0 ≤ a i}

/-- SO_(2r+1) group characters: this excludes the spin half-lattice. -/
abbrev BWeight (r : ℕ) := SpWeight r

/-- SO_(2r+4) group characters, including either sign of the final coordinate. -/
abbrev DWeight (r : ℕ) :=
  {a : Fin (r+2) → ℤ // Antitone a ∧
    |a (Fin.last (r+1))| ≤ a ⟨r, by omega⟩}

noncomputable def spTorus (r : ℕ) : (Fin r → ℂˣ) →* Sp r := by sorry

theorem spTorus_entries (r : ℕ) (t : Fin r → ℂˣ) :
    ((spTorus r t : Sp r) : Matrix (Fin r ⊕ Fin r) (Fin r ⊕ Fin r) ℂ) =
      Matrix.fromBlocks (Matrix.diagonal (fun i => (t i : ℂ))) 0 0
        (Matrix.diagonal (fun i => (((t i)⁻¹ : ℂˣ) : ℂ))) := by sorry

/-- The rational module built as the Cartan component of actual exterior blocks. -/
noncomputable def spHighestWeightRep (r : ℕ) (a : SpWeight r) : FDRep ℂ (Sp r) := by sorry

theorem spHighestWeightRep_regular (r : ℕ) (a : SpWeight r) :
    HasRegularMatrixCoefficients
      (fun g : Sp r => (g : Matrix (Fin r ⊕ Fin r) (Fin r ⊕ Fin r) ℂ))
      (spHighestWeightRep r a).ρ := by sorry

theorem spHighestWeightRep_simple (r : ℕ) (a : SpWeight r) :
    Simple (spHighestWeightRep r a) := by sorry

theorem spHighestWeightRep_exhaustive (r : ℕ) (W : FDRep ℂ (Sp r)) [Simple W]
    (hW : HasRegularMatrixCoefficients
      (fun g : Sp r => (g : Matrix (Fin r ⊕ Fin r) (Fin r ⊕ Fin r) ℂ)) W.ρ) :
    ∃ a : SpWeight r, Nonempty (W ≅ spHighestWeightRep r a) := by sorry

/-- Odd and even SO use their actual integer group lattices; SO0/1 and SO2
have the separate trivial/torus models described in the definitive README. -/
noncomputable def soOddHighestWeightRep (r : ℕ) (a : BWeight (r+1)) :
    FDRep ℂ (SO (2*(r+1)+1)) := by sorry

noncomputable def soEvenHighestWeightRep (r : ℕ) (a : DWeight r) :
    FDRep ℂ (SO (2*(r+2))) := by sorry

noncomputable def soTwoCharacter (m : ℤ) : FDRep ℂ (SO 2) := by sorry

theorem soOddHighestWeightRep_simple (r : ℕ) (a : BWeight (r+1)) :
    Simple (soOddHighestWeightRep r a) := by sorry

theorem soEvenHighestWeightRep_simple (r : ℕ) (a : DWeight r) :
    Simple (soEvenHighestWeightRep r a) := by sorry

/-- The exact torus highest-weight equation is on a nonzero vector. -/
theorem spHighestWeightRep_highest_torus (r : ℕ) (a : SpWeight r) :
    ∃ v : spHighestWeightRep r a, v ≠ 0 ∧
      ∀ t, (spHighestWeightRep r a).ρ (spTorus r t) v =
        (((∏ i, t i ^ a.1 i : ℂˣ) : ℂ)) • v := by sorry

/-- Fix the first e/f plane and act on the last r planes. -/
noncomputable def spLastPlaneInclusion (r : ℕ) : Sp r →* Sp (r+1) := by sorry

/-- Actual multiplicity rows, not a type whose cardinality is merely asserted. -/
def SpIntermediate (r : ℕ) (a : SpWeight (r+1)) (c : SpWeight r) :=
  {b : Fin (r+1) → ℤ //
    (∀ i, 0 ≤ b i ∧ b i ≤ a.1 i) ∧
    (∀ i : Fin r, a.1 i.succ ≤ b i.castSucc ∧
      b i.succ ≤ c.1 i ∧ c.1 i ≤ b i.castSucc)}

noncomputable instance (r : ℕ) (a : SpWeight (r+1)) (c : SpWeight r) :
    Fintype (SpIntermediate r a c) := by sorry

abbrev SpBranchingHom (r : ℕ) (a : SpWeight (r+1)) (c : SpWeight r) :=
  Representation.IntertwiningMap (spHighestWeightRep r c).ρ
    ((spHighestWeightRep (r+1) a).ρ.comp (spLastPlaneInclusion r))

/-- The basis vectors are the actual group maps obtained from Molev's ordered
highest vectors through the earlier rational group/Lie Hom comparison. -/
noncomputable def spMultiplicityBasis (r : ℕ) (a : SpWeight (r+1)) (c : SpWeight r) :
    Module.Basis (SpIntermediate r a c) ℂ (SpBranchingHom r a c) := by sorry

theorem spMultiplicity_finrank (r : ℕ) (a : SpWeight (r+1)) (c : SpWeight r) :
    Module.finrank ℂ (SpBranchingHom r a c) =
      Fintype.card (SpIntermediate r a c) := by sorry

/-- Actual evaluation on an intertwiner tensor a vector. Its image spans the
c-isotypic summand; the direct sum over the finite admitted c is the full module. -/
noncomputable def spMultiplicityEvaluation (r : ℕ) (a : SpWeight (r+1)) (c : SpWeight r) :
    SpBranchingHom r a c ⊗[ℂ] (spHighestWeightRep r c) →ₗ[ℂ]
      (spHighestWeightRep (r+1) a) := by sorry

theorem spMultiplicityEvaluation_tmul (r : ℕ) (a : SpWeight (r+1)) (c : SpWeight r)
    (f : SpBranchingHom r a c) (v : spHighestWeightRep r c) :
    spMultiplicityEvaluation r a c (f ⊗ₜ[ℂ] v) = f v := by sorry

end FormGroups


/-! ## Layer 6A: concrete diagonal overgroups and restriction through them
These are full-math theorem targets. Defined maps use native group, Goursat,
quotient, representation and Lie carriers; no classification certificate is an input. -/
namespace DiagonalOvergroups
open scoped TensorProduct Matrix.Norms.Operator
attribute [local instance] TauCeti.normedAlgebraRatOfReal
attribute [local instance 100] LieRing.ofAssociativeRing

abbrev G (n : ℕ) := Matrix.GeneralLinearGroup (Fin n) ℂ
abbrev P (n : ℕ) := G n × G n
abbrev M (n : ℕ) := Matrix (Fin n) (Fin n) ℂ

def diagonalMap (n : ℕ) : G n →* P n :=
  (MonoidHom.id (G n)).prod (MonoidHom.id (G n))

def diagonal (n : ℕ) : Subgroup (P n) := (diagonalMap n).range

def determinantRatio (n : ℕ) : P n →* ℂˣ where
  toFun p := Matrix.GeneralLinearGroup.det p.1 / Matrix.GeneralLinearGroup.det p.2
  map_one' := by simp
  map_mul' x y := by simp [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm]

def determinantEqual (n : ℕ) : Subgroup (P n) := (determinantRatio n).ker

instance determinantEqual_normal (n : ℕ) : (determinantEqual n).Normal := by
  change (determinantRatio n).ker.Normal
  infer_instance

/-- Actual central scalar multiplication, with an explicit native commuting-law proof term. -/
def scalarDiagonalMap (n : ℕ) : (G n × ℂˣ) →* P n where
  toFun p := (Matrix.GeneralLinearGroup.scalar (Fin n) p.2 * p.1, p.1)
  map_one' := by simp
  map_mul' := by
    intro x y
    apply Prod.ext
    · change Matrix.GeneralLinearGroup.scalar (Fin n) (x.2*y.2) * (x.1*y.1) =
        (Matrix.GeneralLinearGroup.scalar (Fin n) x.2 * x.1) *
          (Matrix.GeneralLinearGroup.scalar (Fin n) y.2 * y.1)
      rw [map_mul]
      calc
        _ = Matrix.GeneralLinearGroup.scalar (Fin n) x.2 *
            ((Matrix.GeneralLinearGroup.scalar (Fin n) y.2 * x.1) * y.1) := by group
        _ = Matrix.GeneralLinearGroup.scalar (Fin n) x.2 *
            ((x.1 * Matrix.GeneralLinearGroup.scalar (Fin n) y.2) * y.1) := by
              rw [Matrix.GeneralLinearGroup.scalar_commute y.2 x.1]
        _ = _ := by group
    · rfl

def scalarDiagonal (n : ℕ) : Subgroup (P n) := (scalarDiagonalMap n).range

theorem mem_diagonal (n : ℕ) (p : P n) : p ∈ diagonal n ↔ p.1 = p.2 := by sorry

theorem mem_determinantEqual (n : ℕ) (p : P n) :
    p ∈ determinantEqual n ↔
      Matrix.GeneralLinearGroup.det p.1 = Matrix.GeneralLinearGroup.det p.2 := by sorry

theorem mem_scalarDiagonal (n : ℕ) (p : P n) :
    p ∈ scalarDiagonal n ↔ ∃ u : ℂˣ,
      p.1 = Matrix.GeneralLinearGroup.scalar (Fin n) u * p.2 := by sorry

theorem diagonal_le_scalarDiagonal (n : ℕ) : diagonal n ≤ scalarDiagonal n := by sorry

theorem diagonal_le_determinantEqual (n : ℕ) : diagonal n ≤ determinantEqual n := by sorry

/-- The actual named kernel is native Goursat's carrier, not a private duplicate. -/
abbrev normalKernel {n : ℕ} (H : Subgroup (P n)) := H.goursatFst

theorem normalKernel_normal {n : ℕ} (H : Subgroup (P n)) (hd : diagonal n ≤ H) :
    (normalKernel H).Normal := by
  exact Subgroup.normal_goursatFst (I := H) (fun g =>
    ⟨⟨(g,g), hd ⟨g,rfl⟩⟩,rfl⟩)

theorem mem_iff_ratio_mem_normalKernel {n : ℕ} (H : Subgroup (P n))
    (hd : diagonal n ≤ H) (p : P n) :
    p ∈ H ↔ p.1 * p.2⁻¹ ∈ normalKernel H := by sorry

/-- These are the explicit inverse maps; no abstract equal-cardinality selection. -/
def ratioEquiv {n : ℕ} (H : Subgroup (P n)) (hd : diagonal n ≤ H) :
    H ≃ (normalKernel H × G n) where
  toFun p := (⟨p.1.1 * p.1.2⁻¹,
    (mem_iff_ratio_mem_normalKernel H hd p.1).mp p.2⟩, p.1.2)
  invFun p := ⟨(p.1.1 * p.2, p.2), by
    apply (mem_iff_ratio_mem_normalKernel H hd _).mpr
    simpa only [mul_inv_cancel_right] using p.1.2⟩
  left_inv := by intro p; apply Subtype.ext; simp
  right_inv := by intro p; apply Prod.ext <;> simp

/-- Same maps as ratioEquiv, with native continuous product/inverse proofs. -/
def ratioHomeomorph {n : ℕ} (H : Subgroup (P n)) (hd : diagonal n ≤ H) :
    H ≃ₜ (normalKernel H × G n) where
  toEquiv := ratioEquiv H hd
  continuous_toFun := by fun_prop
  continuous_invFun := by fun_prop

theorem ratioEquiv_mul {n : ℕ} (H : Subgroup (P n)) (hd : diagonal n ≤ H)
    (p q : H) :
    ((ratioEquiv H hd (p*q)).1 : G n) =
      ((ratioEquiv H hd p).1 : G n) * (ratioEquiv H hd p).2 *
      ((ratioEquiv H hd q).1 : G n) * ((ratioEquiv H hd p).2)⁻¹ := by sorry

theorem connected_iff_normalKernel {n : ℕ} (H : Subgroup (P n))
    (hd : diagonal n ≤ H) :
    IsPreconnected (H : Set (P n)) ↔
      IsPreconnected (normalKernel H : Set (G n)) := by sorry

theorem scalarDiagonalMap_injective (n : ℕ) (hn : 0 < n) :
    Function.Injective (scalarDiagonalMap n) := by sorry

noncomputable def scalarDiagonalEquiv (n : ℕ) (hn : 0 < n) :
    (G n × ℂˣ) ≃* scalarDiagonal n :=
  MulEquiv.ofBijective (scalarDiagonalMap n).rangeRestrict
    ⟨fun _ _ h => scalarDiagonalMap_injective n hn (congrArg Subtype.val h), by
      rintro ⟨x,hx⟩; rcases hx with ⟨y,hy⟩; exact ⟨y,Subtype.ext hy⟩⟩

theorem determinantRatio_surjective (n : ℕ) (hn : 0 < n) :
    Function.Surjective (determinantRatio n) := by sorry

noncomputable def determinantQuotient (n : ℕ) (hn : 0 < n) :
    (P n ⧸ determinantEqual n) ≃* ℂˣ :=
  QuotientGroup.quotientKerEquivOfSurjective (determinantRatio n)
    (determinantRatio_surjective n hn)

theorem scalarDiagonal_iff_projective_equal (n : ℕ) (p : P n) :
    p ∈ scalarDiagonal n ↔
      Matrix.ProjGenLinGroup.mk p.1 = Matrix.ProjGenLinGroup.mk p.2 := by sorry

theorem normalizer_diagonal (n : ℕ) :
    Subgroup.normalizer (diagonal n : Set (P n)) = scalarDiagonal n := by sorry

theorem normalizer_scalarDiagonal (n : ℕ) (hn : 2 ≤ n) :
    Subgroup.normalizer (scalarDiagonal n : Set (P n)) = scalarDiagonal n := by sorry

/-- Concrete tangent-space carriers in the native matrix module. -/
def diagonalLie (n : ℕ) : Submodule ℂ (M n × M n) :=
  LinearMap.range ((LinearMap.id : M n →ₗ[ℂ] M n).prod LinearMap.id)

def scalarLie (n : ℕ) : Submodule ℂ (M n × M n) :=
  diagonalLie n ⊔ Submodule.span ℂ ({(1,0)} : Set (M n × M n))

def determinantLie (n : ℕ) : Submodule ℂ (M n × M n) :=
  LinearMap.ker ((Matrix.traceLinearMap (Fin n) ℂ ℂ).comp
    (LinearMap.fst ℂ (M n) (M n)) -
    (Matrix.traceLinearMap (Fin n) ℂ ℂ).comp (LinearMap.snd ℂ (M n) (M n)))

theorem invariant_matrix_submodule (n : ℕ) (hn : 2 ≤ n)
    (W : Submodule ℂ (M n))
    (hW : ∀ X Y, Y ∈ W → X*Y-Y*X ∈ W) :
    W = ⊥ ∨ W = Submodule.span ℂ ({1} : Set (M n)) ∨
      W = (LieAlgebra.SpecialLinear.sl (Fin n) ℂ).toSubmodule ∨ W = ⊤ := by
  let I : LieIdeal ℂ (M n) := { W with
    lie_mem := by intro X Y hY; exact hW X Y hY }
  have hnative := TauCeti.slIdeal_le_or_le_center I (by norm_num)
  -- Remaining target: transport the native two branches to the one-dimensional
  -- center/trace quotient and the actual SpecialLinear.sl submodule.
  sorry

theorem intermediate_lieSubalgebra (n : ℕ) (hn : 2 ≤ n)
    (L : LieSubalgebra ℂ (M n × M n))
    (hd : diagonalLie n ≤ L.toSubmodule) :
    L.toSubmodule = diagonalLie n ∨ L.toSubmodule = scalarLie n ∨
      L.toSubmodule = determinantLie n ∨ L.toSubmodule = ⊤ := by sorry

noncomputable def pairExp {n : ℕ} (X : M n × M n) : P n :=
  (TauCeti.expUnit X.1, TauCeti.expUnit X.2)

/-- Actual one-parameter membership, not an assumed classifying Lie algebra. -/
def realDirections {n : ℕ} (H : Subgroup (P n)) : Set (M n × M n) :=
  {X | ∀ t : ℝ, pairExp (t • X) ∈ H}

theorem connected_complex_overgroup (n : ℕ) (hn : 2 ≤ n) (H : Subgroup (P n))
    (hd : diagonal n ≤ H) (hc : IsClosed (H : Set (P n)))
    (hconn : IsPreconnected (H : Set (P n)))
    (hcomplex : ∀ X ∈ realDirections H, ∀ z : ℂ, pairExp (z • X) ∈ H) :
    H = diagonal n ∨ H = scalarDiagonal n ∨ H = determinantEqual n ∨ H = ⊤ := by sorry

abbrev ChartIndex (n : ℕ) := (Bool × Fin n × Fin n) ⊕ Bool

def chartCoordinates {n : ℕ} (p : P n) : ChartIndex n → ℂ
  | .inl (b,i,j) => if b then p.2 i j else p.1 i j
  | .inr b => ((Matrix.GeneralLinearGroup.det (if b then p.2 else p.1))⁻¹ : ℂˣ)

/-- The actual polynomial-zero-locus input implies the complex tangent condition. -/
theorem polynomial_locus_complex_directions (n : ℕ) (H : Subgroup (P n))
    (F : Set (MvPolynomial (ChartIndex n) ℂ))
    (hF : ∀ p, p ∈ H ↔ ∀ f ∈ F, MvPolynomial.eval (chartCoordinates p) f = 0) :
    IsClosed (H : Set (P n)) ∧
      ∀ X ∈ realDirections H, ∀ z : ℂ, pairExp (z • X) ∈ H := by sorry

theorem connected_algebraic_overgroup (n : ℕ) (hn : 2 ≤ n)
    (H : Subgroup (P n)) (hd : diagonal n ≤ H)
    (F : Set (MvPolynomial (ChartIndex n) ℂ))
    (hF : ∀ p, p ∈ H ↔ ∀ f ∈ F, MvPolynomial.eval (chartCoordinates p) f = 0)
    (hconn : IsPreconnected (H : Set (P n))) :
    H = diagonal n ∨ H = scalarDiagonal n ∨ H = determinantEqual n ∨ H = ⊤ := by
  exact connected_complex_overgroup n hn H hd
    (polynomial_locus_complex_directions n H F hF).1 hconn
    (polynomial_locus_complex_directions n H F hF).2

theorem four_closed_connected (n : ℕ) :
    ∀ H ∈ ([diagonal n,scalarDiagonal n,determinantEqual n,⊤] : List (Subgroup (P n))),
      IsClosed (H : Set (P n)) ∧ IsPreconnected (H : Set (P n)) := by sorry

theorem scalar_determinant_intersection (n : ℕ) (p : G n × ℂˣ) :
    scalarDiagonalMap n p ∈ determinantEqual n ↔ p.2 ^ n = 1 := by sorry

theorem scalar_determinant_join (n : ℕ) (hn : 0 < n) :
    scalarDiagonal n ⊔ determinantEqual n = ⊤ := by sorry

theorem proper_incomparable (n : ℕ) (hn : 2 ≤ n) :
    diagonal n < scalarDiagonal n ∧ diagonal n < determinantEqual n ∧
      scalarDiagonal n < ⊤ ∧ determinantEqual n < ⊤ ∧
      ¬scalarDiagonal n ≤ determinantEqual n ∧ ¬determinantEqual n ≤ scalarDiagonal n := by sorry

theorem rank_one_equalities :
    determinantEqual 1 = diagonal 1 ∧ scalarDiagonal 1 = ⊤ := by sorry

theorem rank_zero_equalities :
    diagonal 0 = ⊤ ∧ scalarDiagonal 0 = ⊤ ∧ determinantEqual 0 = ⊤ := by sorry

section Restriction
variable {V W : Type*} [AddCommGroup V] [Module ℂ V]
  [AddCommGroup W] [Module ℂ W]

noncomputable def external {n : ℕ} (ρ : Representation ℂ (G n) V)
    (σ : Representation ℂ (G n) W) : Representation ℂ (P n) (V ⊗[ℂ] W) :=
  Representation.tprod (ρ.comp (MonoidHom.fst (G n) (G n)))
    (σ.comp (MonoidHom.snd (G n) (G n)))

theorem external_diagonal {n : ℕ} (ρ : Representation ℂ (G n) V)
    (σ : Representation ℂ (G n) W) :
    (external ρ σ).comp (diagonalMap n) = ρ.tprod σ := by sorry

theorem rational_irreducible_scalar_character {n : ℕ}
    [FiniteDimensional ℂ V] (ρ : Representation ℂ (G n) V)
    (hρ : TauCeti.IsRationalRep ρ) [Representation.IsIrreducible ρ] :
    ∃ a : ℤ, ∀ u : ℂˣ, ρ (Matrix.GeneralLinearGroup.scalar (Fin n) u) =
      ((u^a : ℂˣ) : ℂ) • (1 : Module.End ℂ V) := by sorry

theorem external_scalar_formula {n : ℕ} (ρ : Representation ℂ (G n) V)
    (σ : Representation ℂ (G n) W) (a : ℤ)
    (hρ : ∀ u : ℂˣ, ρ (Matrix.GeneralLinearGroup.scalar (Fin n) u) =
      ((u^a : ℂˣ) : ℂ) • (1 : Module.End ℂ V)) (g : G n) (u : ℂˣ) :
    external ρ σ (scalarDiagonalMap n (g,u)) =
      ((u^a : ℂˣ) : ℂ) • (ρ.tprod σ) g := by sorry

/-- One genuine prospective data family; every determining input is inside the admitted Pi. -/
noncomputable def scalarRestrictionSubrepOrderIso :
    (n : ℕ) → (ρ : Representation ℂ (G n) V) → (σ : Representation ℂ (G n) W) →
    (a : ℤ) → (∀ u : ℂˣ, ρ (Matrix.GeneralLinearGroup.scalar (Fin n) u) =
      ((u^a : ℂˣ) : ℂ) • (1 : Module.End ℂ V)) →
    Subrepresentation ((external ρ σ).comp (scalarDiagonal n).subtype) ≃o
      Subrepresentation (ρ.tprod σ) := by sorry

theorem scalarRestrictionSubrepOrderIso_carrier {n : ℕ}
    (ρ : Representation ℂ (G n) V) (σ : Representation ℂ (G n) W) (a : ℤ)
    (hρ : ∀ u : ℂˣ, ρ (Matrix.GeneralLinearGroup.scalar (Fin n) u) =
      ((u^a : ℂˣ) : ℂ) • (1 : Module.End ℂ V))
    (S : Subrepresentation ((external ρ σ).comp (scalarDiagonal n).subtype)) :
    (scalarRestrictionSubrepOrderIso n ρ σ a hρ S).toSubmodule = S.toSubmodule := by sorry

/-- New irreducibility comparison, NOT native determinant-shift equality alone. -/
theorem restrict_specialLinear_irreducible {n : ℕ} [FiniteDimensional ℂ V]
    (ρ : Representation ℂ (G n) V) (hρ : TauCeti.IsRationalRep ρ)
    [Representation.IsIrreducible ρ] :
    Representation.IsIrreducible (ρ.comp Matrix.SpecialLinearGroup.toGL) := by sorry

theorem external_determinantEqual_irreducible {n : ℕ} [FiniteDimensional ℂ V]
    [FiniteDimensional ℂ W] (ρ : Representation ℂ (G n) V)
    (σ : Representation ℂ (G n) W)
    (hρ : TauCeti.IsRationalRep ρ) (hσ : TauCeti.IsRationalRep σ)
    [Representation.IsIrreducible ρ] [Representation.IsIrreducible σ] :
    Representation.IsIrreducible ((external ρ σ).comp (determinantEqual n).subtype) := by sorry

end Restriction
end DiagonalOvergroups

end TauCetiRoadmap.RepresentationTheory.ClassicalGroups
