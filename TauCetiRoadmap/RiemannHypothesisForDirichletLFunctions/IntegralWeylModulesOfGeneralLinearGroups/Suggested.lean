import Mathlib
import TauCeti.Combinatorics.Young.HookLength.Basic
import TauCeti.RepresentationTheory.ClassicalGroups.WeylDimension.Basic

/-!
# Integral Weyl modules of general linear groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, as far as they are
statable at the pins.

The headlines are statements about the two integral structures of the irreducible representation
`V_λ` of `GL_N` of highest weight `λ` in the polynomial model (README, Conventions): for a
commutative ring `R`, the dual Weyl lattice `∇_R(λ)` (`dualWeylLattice`) of the polynomials over
`R` in an `N × N` matrix of variables that are homogeneous of degree `λ⁰_s` in the column `s` and
invariant under adding `T` times an earlier column to a later one, as an identity in `R[x][T]`, and
the Weyl lattice `Δ_R(λ)` (`weylLattice`), the `R`-span of the images of the highest-weight vector
`v_λ` under the words in the divided row operators. Neither library has these lattices, and they
are defined below from `MvPolynomial`. Tau Ceti has the Kostant orbit lattice of the highest vector
of `L(λ)` for split semisimple Lie algebras over `ℚ` (`LieAlgebra.Basis.highestWeightLattice`), but
not for `𝔤𝔩_N` and with no dual lattice; its Weyl modules `TauCeti.weylModuleOfShape` are modules
over `ℚ`-algebras with no integral form.

Stated below: the sandwich exponent (headline (1); 0.3 (b), (c)), local and global; integral
branching (headline (2)): the integral map of 1.1 (a) with the composite of 1.1 (e) in norm form,
the bound `⟨ξ, ξ⟩_λ ≤ dim V_λ` of 1.1 (e), and the clauses of 1.1 (a), (d) about the integer
`c_Br`; from headline (3), the block cut (2.1 (b)), local and global, and the block-first form of
the graded Pieri bound (2.2 (a)); and the Fischer norm of `v_λ` (3.2 (a)), the identity behind
headline (4).

Not statable at the pins:
* Linkage in multiset form and the embedding of simple constituents (2.1 (d), (e)), the last clause
  of headline (3): they lack the action of `∏_τ GL_N(O)` on the reduction modulo `ϖ` of a tensor
  product of models, the algebra it generates with the weight projectors, and the subquotients of
  that algebra.
* The slopes of the Weyl and dual Weyl lattices (3.2 (b)–(d), headline (4)): they lack the
  Hermitian vector bundles over rings of integers of number fields with their slopes and maximal
  slopes (SlopesOfHermitianVectorBundles Layers 1–2).

The rank statement of 0.1 (the number of semistandard tableaux with entries `< N` equals
`dim V_ν`) is in Tau Ceti for the Schur polynomial at `(1, …, 1)`; it is a step of 0.1 and not a
headline, and it is not stated here. The general identity 3.1 (the Fischer norm of a product of
leading minors of an `n × l` matrix of variables is the hook product, also for nested families of
rows and columns) is statable at the pins; it is not a headline, and only its case for `v_λ`, which
headline (4) contains as 3.2 (a), is stated here. Of integral branching, 1.1 (b) (the adjoint
maps `Δ_ℤ(λ)` into `Δ_ℤ(σ)`) is 1.1 (a) read through the duality of `Δ_ℤ` and `∇_ℤ` for the
normalised forms (README, Conventions), and 1.1 (f) is the formula on bideterminants from which the
route deduces 1.1 (a); neither is stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.IntegralWeylModulesOfGeneralLinearGroups

open MvPolynomial Finset
open scoped Pointwise

/-! ## Layer 0: The polynomial model and the sandwich exponent -/

/-- The normalised weight `λ⁰ := λ − λ_{N−1}·(1, …, 1)` of a weight `λ` of `GL_N`, as a vector of
natural numbers (for a dominant `λ`, the partition `λ⁰`; the subtraction is truncated at `0`). For a
dominant `λ` its entries are the row lengths of Tau Ceti's `TauCeti.DominantWeight.detShiftShape`
(`TauCeti.DominantWeight.rowLen_detShiftShape`); it is defined here for every weight vector, as the
lattices below are. Defined in [FormalProof], `Formalism/LocalRingCardinality/DataCoeff.lean`
(`Formalism.BasicNotions.DomWeight.natW`). -/
def normalizedWeight {N : ℕ} (lam : Fin N → ℤ) (s : Fin N) : ℕ :=
  (lam s - lam ⟨N - 1, by have := s.isLt; omega⟩).toNat

/-- The leading principal `k × k` minor `Δ_k` of the `N × N` matrix of variables `x_{a,s}`
(`a` the row, `s` the column) over a commutative ring `R`, for `k ≤ N`. -/
noncomputable def leadingMinor (R : Type*) [CommRing R] (N k : ℕ) (hk : k ≤ N) :
    MvPolynomial (Fin N × Fin N) R :=
  Matrix.det (Matrix.of fun a s : Fin k => X (Fin.castLE hk a, Fin.castLE hk s))

/-- The highest-weight vector `v = ∏_{s<N} Δ_{s+1}^{d_s − d_{s+1}}` (`d_N := 0`) of the polynomial
model with column degrees `d`; for `d = λ⁰` it is `v_λ`. -/
noncomputable def highestWeightVector (R : Type*) [CommRing R] {N : ℕ} (d : Fin N → ℕ) :
    MvPolynomial (Fin N × Fin N) R :=
  ∏ s : Fin N, leadingMinor R N ((s : ℕ) + 1) (by omega) ^
    (d s - if h : (s : ℕ) + 1 < N then d ⟨(s : ℕ) + 1, h⟩ else 0)

/-- The column operation `x ↦ x·(1 + T·e_{st})`: the column `t` is replaced by the column `t` plus
`T` times the column `s`, as an algebra map from `R[x]` to `R[x][T]`. -/
noncomputable def columnOperation (R : Type*) [CommRing R] {N : ℕ} (s t : Fin N) :
    MvPolynomial (Fin N × Fin N) R →ₐ[R] Polynomial (MvPolynomial (Fin N × Fin N) R) :=
  aeval fun p => Polynomial.C (X p) + if p.2 = t then Polynomial.X * Polynomial.C (X (p.1, s)) else 0

/-- The row operation `x_b ↦ x_b + T·x_a`: the row `b` is replaced by the row `b` plus `T` times
the row `a`, as an algebra map from `R[x]` to `R[x][T]`. -/
noncomputable def rowOperation (R : Type*) [CommRing R] {N : ℕ} (a b : Fin N) :
    MvPolynomial (Fin N × Fin N) R →ₐ[R] Polynomial (MvPolynomial (Fin N × Fin N) R) :=
  aeval fun p => Polynomial.C (X p) + if p.1 = b then Polynomial.X * Polynomial.C (X (a, p.2)) else 0

/-- The divided row operator `E_{ab}^{(k)}`: the coefficient of `T^k` of the row operation
`x_b ↦ x_b + T·x_a`. -/
noncomputable def dividedRowOperator (R : Type*) [CommRing R] {N : ℕ} (a b : Fin N) (k : ℕ)
    (f : MvPolynomial (Fin N × Fin N) R) : MvPolynomial (Fin N × Fin N) R :=
  (rowOperation R a b f).coeff k

/-- The dual Weyl lattice `∇_R(λ)` of the polynomial model: the polynomials over `R` in the
`N × N` matrix of variables that are homogeneous of degree `λ⁰_s` in the column `s` and invariant
under every column operation `x ↦ x·(1 + T·e_{st})`, `s < t`, as an identity in `R[x][T]`. -/
noncomputable def dualWeylLattice (R : Type*) [CommRing R] {N : ℕ} (lam : Fin N → ℤ) :
    Submodule R (MvPolynomial (Fin N × Fin N) R) :=
  restrictSupport R {m | ∀ s : Fin N, ∑ a : Fin N, m (a, s) = normalizedWeight lam s} ⊓
    ⨅ (s : Fin N) (t : Fin N) (_ : s < t),
      LinearMap.eqLocus (columnOperation R s t).toLinearMap
        (Polynomial.CAlgHom (R := R) (A := MvPolynomial (Fin N × Fin N) R)).toLinearMap

/-- The Weyl lattice `Δ_R(λ)` of the polynomial model: the `R`-span of the images of the
highest-weight vector `v_λ` under all finite words in the divided row operators `E_{ab}^{(k)}`,
`a ≠ b`, `k ≥ 1`. -/
noncomputable def weylLattice (R : Type*) [CommRing R] {N : ℕ} (lam : Fin N → ℤ) :
    Submodule R (MvPolynomial (Fin N × Fin N) R) :=
  Submodule.span R {f | ∃ word : List (Fin N × Fin N × ℕ),
    (∀ o ∈ word, o.1 ≠ o.2.1 ∧ 1 ≤ o.2.2) ∧
      f = word.foldr (fun o g => dividedRowOperator R o.1 o.2.1 o.2.2 g)
        (highestWeightVector R (normalizedWeight lam))}

/-- The Fischer form `⟨f, f⟩_F = Σ_α f_α²·α!` of a polynomial `f = Σ_α f_α x^α` with integer
coefficients, `α! = ∏_i α_i!`. Defined in [FormalProof], `Formalism/FockGram/StatementFock.lean`
(`Formalism.E.fock`). -/
noncomputable def fischerNormSq {σ : Type*} (f : MvPolynomial σ ℤ) : ℤ :=
  ∑ α ∈ f.support, f.coeff α ^ 2 * α.prod fun _ k => (k.factorial : ℤ)

/-- **The sandwich exponent, local form** (0.3 (b), in the polynomial model of 0.3 (c)). Let `O`
be a discrete valuation ring of characteristic `0` and residue characteristic `p`, and `λ` a
dominant weight of `GL_N`, `N = n + 1`. Then `p^e·∇_O(λ) ⊂ Δ_O(λ)` with
`e = (N(N−1)/2)·⌊log_p(λ_0 − λ_{N−1} + N − 1)⌋`. -/
theorem pow_smul_dualWeylLattice_le_weylLattice (O : Type*) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [CharZero O] (p : ℕ) [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p] (n : ℕ) (lam : Fin (n + 1) → ℤ) (hlam : Antitone lam) :
    ((p : O) ^ ((n + 1) * n / 2 * Nat.log p ((lam 0 - lam (Fin.last n)).toNat + n))) •
        dualWeylLattice O lam ≤ weylLattice O lam := by
  sorry

/-- **The sandwich exponent, global form** (0.3 (c)). For a dominant weight `λ` of `GL_N`,
`N = n + 1`, `lcm(1, …, λ_0 − λ_{N−1} + N − 1)^{N(N−1)/2}·∇_ℤ(λ) ⊂ Δ_ℤ(λ)`. -/
theorem lcm_pow_smul_dualWeylLattice_le_weylLattice (n : ℕ) (lam : Fin (n + 1) → ℤ)
    (hlam : Antitone lam) :
    (((Icc 1 ((lam 0 - lam (Fin.last n)).toNat + n)).lcm id ^ ((n + 1) * n / 2) : ℕ) : ℤ) •
        dualWeylLattice ℤ lam ≤ weylLattice ℤ lam := by
  sorry

/-! ## Layer 1: Integral branching from `GL_N` to `GL_{N−1}` -/

/-- For a weight `λ` of `GL_{m+1}` and a weight `σ` of `GL_m`, and `i < m`, the set
`R_i ∖ {σ_i}` of 1.1, where `D₀ := Σ_{i<m} (σ_i − λ_{i+1})` and
`R_i := [λ_{i+1}, min(λ_i, λ_{i+1} + D₀)] ∩ ℤ`. The interlacing defect `D₁` of 1.1 is the sum of the
cardinalities of these sets. `R_i` is defined in [FormalProof],
`Formalism/BranchSandwichDivisors/StatementR.lean` (`Formalism.BranchingDeterminantCap.rset`). -/
def interlacingDefectSet (m : ℕ) (lam : Fin (m + 1) → ℤ) (sigma : Fin m → ℤ) (i : Fin m) :
    Finset ℤ :=
  (Icc (lam i.succ) (min (lam i.castSucc) (lam i.succ + ∑ j : Fin m, (sigma j - lam j.succ)))).erase
    (sigma i)

/-- The integer `c_Br` of 1.1: the product over `i < m`, over `v ∈ R_i ∖ {σ_i}` and over `j < m`
of `(v − i) − (σ_j − j)`. -/
def branchingInteger (m : ℕ) (lam : Fin (m + 1) → ℤ) (sigma : Fin m → ℤ) : ℤ :=
  ∏ i : Fin m, ∏ v ∈ interlacingDefectSet m lam sigma i,
    ∏ j : Fin m, ((v - (i : ℕ)) - (sigma j - (j : ℕ)))

/-- **The branching integer** (1.1 (a), first clause, and (d), first inequality). Let `N = m + 1`,
`λ` a weight of `GL_N` and `σ` a weight of `GL_{N−1}` interlacing it, `λ_i ≥ σ_i ≥ λ_{i+1}` for
`i ≤ N − 2` (so both are dominant). Then `c_Br ≠ 0` and
`|c_Br| ≤ (λ_0 − λ_{N−1} + N − 2)^{(N−1)·D₁}`, with `D₁ = Σ_i #(R_i ∖ {σ_i})` (an empty product
and `0⁰` are `1`). -/
theorem branchingInteger_ne_zero_and_abs_le (m : ℕ) (lam : Fin (m + 1) → ℤ) (sigma : Fin m → ℤ)
    (hinterlace : ∀ i : Fin m, sigma i ≤ lam i.castSucc ∧ lam i.succ ≤ sigma i) :
    branchingInteger m lam sigma ≠ 0 ∧
      |branchingInteger m lam sigma| ≤
        (lam 0 - lam (Fin.last m) + (m : ℤ) - 1) ^
          (m * ∑ i : Fin m, (interlacingDefectSet m lam sigma i).card) := by
  sorry

/-- The vector `ξ` of 1.1, for a weight `λ` of `GL_{m+1}` and a weight `σ` of `GL_m`: the product
over `i < m` of the leading minor `Δ_{i+1}` to the power `σ_i − λ_{i+1}` and of the minor on the
rows `0, …, i − 1, m` and the columns `0, …, i` to the power `λ_i − σ_i` (the exponents are
truncated at `0`; for `σ` interlacing `λ` both are nonnegative). -/
noncomputable def branchingVector (m : ℕ) (lam : Fin (m + 1) → ℤ) (sigma : Fin m → ℤ) :
    MvPolynomial (Fin (m + 1) × Fin (m + 1)) ℤ :=
  ∏ i : Fin m,
    leadingMinor ℤ (m + 1) ((i : ℕ) + 1) (by omega) ^ (sigma i - lam i.succ).toNat *
      Matrix.det (Matrix.of fun a s : Fin ((i : ℕ) + 1) =>
        (X (if (a : ℕ) < i then (⟨a, by omega⟩ : Fin (m + 1)) else Fin.last m,
          (⟨s, by omega⟩ : Fin (m + 1))) : MvPolynomial (Fin (m + 1) × Fin (m + 1)) ℤ)) ^
        (lam i.castSucc - sigma i).toNat

/-- **Integral branching** (1.1 (a), with the composite of 1.1 (e) in norm form). Let `N = m + 1`,
`λ` a weight of `GL_N` and `σ` a weight of `GL_{N−1}` interlacing it, `λ_i ≥ σ_i ≥ λ_{i+1}` for
`i ≤ N − 2`. There is a `ℤ`-linear map `io` from the polynomials in the `(N−1) × (N−1)` matrix of
variables to those in the `N × N` matrix with `io(v_σ) = c_Br·ξ` that commutes on `∇_ℤ(σ)` with the
divided row operators `E_{ab}^{(k)}`, `a ≠ b ≤ N − 2` (`GL_{N−1}` acting on the first `N − 1` rows);
on `∇_ℤ(σ)` these two properties determine `io` and make it the `GL_{N−1}`-equivariant map of 1.1.
It maps `∇_ℤ(σ)` into `∇_ℤ(λ)`, and `⟨io f, io f⟩_λ = c_Br²·⟨ξ, ξ⟩_λ·⟨f, f⟩_σ` for `f ∈ ∇_ℤ(σ)`,
written with the Fischer forms as `⟨v_σ, v_σ⟩_F·⟨io f, io f⟩_F = c_Br²·⟨ξ, ξ⟩_F·⟨f, f⟩_F`; by
polarisation this is `br∘io = c_Br²·⟨ξ, ξ⟩_λ·id` for the adjoint `br` of `io`. -/
theorem exists_integral_branching (m : ℕ) (lam : Fin (m + 1) → ℤ) (sigma : Fin m → ℤ)
    (hinterlace : ∀ i : Fin m, sigma i ≤ lam i.castSucc ∧ lam i.succ ≤ sigma i) :
    ∃ io : MvPolynomial (Fin m × Fin m) ℤ →ₗ[ℤ] MvPolynomial (Fin (m + 1) × Fin (m + 1)) ℤ,
      io (highestWeightVector ℤ (normalizedWeight sigma)) =
          branchingInteger m lam sigma • branchingVector m lam sigma ∧
        (∀ (a b : Fin m) (k : ℕ), a ≠ b → ∀ f ∈ dualWeylLattice ℤ sigma,
          io (dividedRowOperator ℤ a b k f) =
            dividedRowOperator ℤ a.castSucc b.castSucc k (io f)) ∧
        (∀ f ∈ dualWeylLattice ℤ sigma, io f ∈ dualWeylLattice ℤ lam) ∧
        ∀ f ∈ dualWeylLattice ℤ sigma,
          fischerNormSq (highestWeightVector ℤ (normalizedWeight sigma)) * fischerNormSq (io f) =
            branchingInteger m lam sigma ^ 2 * fischerNormSq (branchingVector m lam sigma) *
              fischerNormSq f := by
  sorry

/-- **The norm of `ξ`** (1.1 (e), last clause). Let `N = m + 1`, `λ` a dominant weight of `GL_N`
and `σ` a weight of `GL_{N−1}` interlacing it (the interlacing already forces `λ` to be dominant;
`hlam` forms `dim V_λ`). Then `⟨ξ, ξ⟩_λ ≤ dim V_λ`, written with the Fischer form as
`⟨ξ, ξ⟩_F ≤ dim V_λ·⟨v_λ, v_λ⟩_F`. -/
theorem fischerNormSq_branchingVector_le (m : ℕ) (lam : Fin (m + 1) → ℤ) (hlam : Antitone lam)
    (sigma : Fin m → ℤ)
    (hinterlace : ∀ i : Fin m, sigma i ≤ lam i.castSucc ∧ lam i.succ ≤ sigma i) :
    fischerNormSq (branchingVector m lam sigma) ≤
      (TauCeti.weylDimension ⟨lam, hlam⟩ : ℤ) *
        fischerNormSq (highestWeightVector ℤ (normalizedWeight lam)) := by
  sorry

/-! ## Layer 2: The exponent of the Weyl lattice and the graded Pieri bound -/

/-- **The block cut, local form** (2.1 (b), over a discrete valuation ring). Let `O` be a discrete
valuation ring of characteristic `0` and residue characteristic `ℓ`, `λ` a dominant weight of
`GL_{a+b}`, cut into `λ′ = (λ_0, …, λ_{a−1})` and `λ″ = (λ_a, …, λ_{a+b−1})`, and `w ≥ 0` such that
all shifted weights `λ_c + a + b − 1 − c` of `λ` lie in an interval of length `w`. If
`ℓ^{e₁}·∇_O(λ′) ⊂ Δ_O(λ′)` and `ℓ^{e₂}·∇_O(λ″) ⊂ Δ_O(λ″)`, then
`ℓ^{e₁ + e₂ + ab·⌊log_ℓ w⌋}·∇_O(λ) ⊂ Δ_O(λ)`. This follows from [FormalProof],
`Formalism/PieriBlockIdeals/StatementE.lean` (`Formalism.CohomologicalDescent.E.ExCut`, for the
exponents over `ℤ_(ℓ)`) and
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/WeylLatticeExactExponentBlockCut.lean`
(`GlobalTheory.LeviCut.exCut`), with the base change to `O` of
`Formalism/PieriBlockIdeals/LocalFaithfullyFlat.lean`
(`Formalism.CohomologicalDescent.RealLocalDeltaNabla.ExZEqO`). -/
theorem pow_smul_dualWeylLattice_le_weylLattice_of_blocks (O : Type*) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [CharZero O] (ℓ : ℕ) [Fact ℓ.Prime]
    [CharP (IsLocalRing.ResidueField O) ℓ] (a b : ℕ) (lam : Fin (a + b) → ℤ) (hlam : Antitone lam)
    (w : ℕ) (hw : ∀ c d : Fin (a + b), lam c - (c : ℕ) - (lam d - (d : ℕ)) ≤ w) (e₁ e₂ : ℕ)
    (h₁ : (ℓ : O) ^ e₁ • dualWeylLattice O (fun c : Fin a => lam (Fin.castAdd b c)) ≤
      weylLattice O (fun c : Fin a => lam (Fin.castAdd b c)))
    (h₂ : (ℓ : O) ^ e₂ • dualWeylLattice O (fun c : Fin b => lam (Fin.natAdd a c)) ≤
      weylLattice O (fun c : Fin b => lam (Fin.natAdd a c))) :
    (ℓ : O) ^ (e₁ + e₂ + a * b * Nat.log ℓ w) • dualWeylLattice O lam ≤ weylLattice O lam := by
  sorry

/-- **The block cut, global form** (2.1 (b)). Let `λ` be a dominant weight of `GL_{a+b}`, cut into
`λ′ = (λ_0, …, λ_{a−1})` and `λ″ = (λ_a, …, λ_{a+b−1})`, and `w ≥ 0` such that all shifted weights
of `λ` lie in an interval of length `w`. If `c₁·∇_ℤ(λ′) ⊂ Δ_ℤ(λ′)` and `c₂·∇_ℤ(λ″) ⊂ Δ_ℤ(λ″)`,
then `c₁c₂·lcm(1, …, w)^{ab}·∇_ℤ(λ) ⊂ Δ_ℤ(λ)`. This follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/WeylLatticeExactExponentBlockCut.lean`
(`GlobalTheory.LeviCut.cut_incl`). -/
theorem lcm_pow_smul_dualWeylLattice_le_weylLattice_of_blocks (a b : ℕ) (lam : Fin (a + b) → ℤ)
    (hlam : Antitone lam) (w : ℕ)
    (hw : ∀ c d : Fin (a + b), lam c - (c : ℕ) - (lam d - (d : ℕ)) ≤ w) (c₁ c₂ : ℤ)
    (h₁ : c₁ • dualWeylLattice ℤ (fun c : Fin a => lam (Fin.castAdd b c)) ≤
      weylLattice ℤ (fun c : Fin a => lam (Fin.castAdd b c)))
    (h₂ : c₂ • dualWeylLattice ℤ (fun c : Fin b => lam (Fin.natAdd a c)) ≤
      weylLattice ℤ (fun c : Fin b => lam (Fin.natAdd a c))) :
    (c₁ * c₂ * (((Icc 1 w).lcm id ^ (a * b) : ℕ) : ℤ)) • dualWeylLattice ℤ lam ≤
      weylLattice ℤ lam := by
  sorry

/-- The weight space `∇_R(λ)_μ`: the elements of `∇_R(λ)` all of whose monomials have weight `μ`,
the weight of a monomial being its vector of row degrees plus `λ_{N−1}·(1, …, 1)`. Defined in
[FormalProof], `Formalism/PieriBlockIdeals/StatementLD.lean`
(`Formalism.CohomologicalDescent.LD.nablaWt`). -/
noncomputable def dualWeylLatticeWeightSpace (R : Type*) [CommRing R] {N : ℕ}
    (lam mu : Fin N → ℤ) : Submodule R (MvPolynomial (Fin N × Fin N) R) :=
  dualWeylLattice R lam ⊓ restrictSupport R {m | ∀ a : Fin N,
    ((∑ s : Fin N, m (a, s) : ℕ) : ℤ) + lam ⟨N - 1, by have := a.isLt; omega⟩ = mu a}

open Classical in
/-- The set `Sh(r, w, i, λ₂)` of 2.2: the partitions `τ ⊇ λ₂` with `q` parts and `|τ/λ₂| = i` such
that every column of the skew shape `τ/λ₂` has at most `r` boxes and no box of `τ/λ₂` has content
`w` (the box in row `b` and column `c` has content `c − b`). -/
noncomputable def pieriShapes (r w i q : ℕ) (lam₂ : Fin q → ℕ) : Finset (Fin q → ℕ) :=
  (Fintype.piFinset fun b => Icc (lam₂ b) (lam₂ b + i)).filter fun τ =>
    Antitone τ ∧ ∑ b, (τ b - lam₂ b) = i ∧
      (∀ c : ℕ, (univ.filter fun b => lam₂ b ≤ c ∧ c < τ b).card ≤ r) ∧
      ∀ b : Fin q, ¬ (lam₂ b ≤ w + (b : ℕ) ∧ w + (b : ℕ) < τ b)

open Classical in
/-- The multiplicity `m(c)` of 2.2: the largest number of boxes of content `c` in `τ/λ₂` over
`τ ∈ Sh(r, w, i, λ₂)` (`0` if that set is empty). -/
noncomputable def pieriContentMultiplicity (r w i q : ℕ) (lam₂ : Fin q → ℕ) (c : ℤ) : ℕ :=
  (pieriShapes r w i q lam₂).sup fun τ =>
    (univ.filter fun b : Fin q => (lam₂ b : ℤ) ≤ c + (b : ℕ) ∧ c + (b : ℕ) < τ b).card

/-- The Pieri denominator: `∏_c (w − c)^{m(c)}` over `c ∈ [−q, w)`. When `λ₂(b) ≤ w` for every
`b`, the hypothesis of 2.2 and of the theorem below, the contents of the boxes of a skew shape in
`Sh(r, w, i, λ₂)` lie in `[−(q − 1), w)`, so this is `D(r, w, i, λ₂)` of 2.2 and every factor is
positive; without that hypothesis it can differ from `D(r, w, i, λ₂)`. -/
noncomputable def pieriDenominator (r w i q : ℕ) (lam₂ : Fin q → ℕ) : ℕ :=
  ∏ c ∈ Ico (-(q : ℤ)) w, ((w : ℤ) - c).toNat ^ pieriContentMultiplicity r w i q lam₂ c

/-- **The graded Pieri bound, block first** (2.2 (a), over a discrete valuation ring). Let `O` be a
discrete valuation ring of characteristic `0` and residue characteristic `ℓ`, `λ₂` a partition with
`q` parts and `λ₂(0) ≤ w`, `λ = (w^r, λ₂)` (a dominant weight of `GL_{r+q}`), `ξ` a non-increasing
grading, `i′ ∈ ℤ` and `e_L ≥ 0` with `ℓ^{e_L}·∇_O(λ₂)_{μ₂} ⊂ Δ_O(λ₂)` for every weight `μ₂` of
`GL_q` with `Σ_b ξ(r + b)(λ₂(b) − μ₂(b)) ≤ i′`. Then for every `i ≥ 0` and every weight `μ` of
`GL_{r+q}` with `Σ_{a<r} μ(a) = r·w − i` and `Σ_a ξ(a)(λ(a) − μ(a)) ≤ i′`,
`ℓ^{e_L + v_ℓ(D(r, w, i, λ₂))}·∇_O(λ)_μ ⊂ Δ_O(λ)`. This follows from [FormalProof],
`Formalism/PieriBlockIdeals/PieriColumnMinors/CorollaryOfParamsLinkage.lean`
(`Formalism.CohomologicalDescent.Down.hG`), stated there over `ℤ_(ℓ)`, by the base change of
README 2.1 (a) applied weight space by weight space. -/
theorem pow_smul_dualWeylLatticeWeightSpace_le_weylLattice_of_block_first (O : Type*)
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CharZero O] (ℓ : ℕ) [Fact ℓ.Prime]
    [CharP (IsLocalRing.ResidueField O) ℓ] (r q w : ℕ) (lam₂ : Fin q → ℕ) (hlam₂ : Antitone lam₂)
    (hw : ∀ b, lam₂ b ≤ w) (ξ : Fin (r + q) → ℤ) (hξ : Antitone ξ) (i' : ℤ) (eL : ℕ)
    (hL : ∀ mu₂ : Fin q → ℤ, ∑ b, ξ (Fin.natAdd r b) * ((lam₂ b : ℤ) - mu₂ b) ≤ i' →
      (ℓ : O) ^ eL • dualWeylLatticeWeightSpace O (fun b => (lam₂ b : ℤ)) mu₂ ≤
        weylLattice O (fun b => (lam₂ b : ℤ)))
    (i : ℕ) (mu : Fin (r + q) → ℤ)
    (hmu : ∑ a : Fin r, mu (Fin.castAdd q a) = (r : ℤ) * w - i)
    (hdepth : ∑ a, ξ a * (Fin.append (fun _ : Fin r => (w : ℤ)) (fun b => (lam₂ b : ℤ)) a - mu a)
      ≤ i') :
    (ℓ : O) ^ (eL + padicValNat ℓ (pieriDenominator r w i q lam₂)) •
        dualWeylLatticeWeightSpace O
          (Fin.append (fun _ : Fin r => (w : ℤ)) (fun b => (lam₂ b : ℤ))) mu ≤
      weylLattice O (Fin.append (fun _ : Fin r => (w : ℤ)) (fun b => (lam₂ b : ℤ))) := by
  sorry

/-! ## Layer 3: Fischer norms and slopes -/

/-- **The Fischer norm of `v_λ`** (3.2 (a); its identity is the case of 3.1 for the leading
principal minors of a square matrix). Let `λ` be a dominant weight of `GL_N`, `N = n + 1`, and
`μ = λ⁰`, a partition with at most `N − 1` nonzero parts, so that `v_λ` is the highest-weight
vector with column degrees `μ_0, …, μ_{N−1}`; every such partition arises, and `v_λ` and `c_λ`
depend on `λ⁰` alone. Then `⟨v_λ, v_λ⟩_F = H(λ⁰)`, the product of the hook lengths of `λ⁰`; and
`c_λ = H(λ⁰)/∏_s λ⁰_s!` satisfies `1 ≤ c_λ ≤ (λ⁰_0 + N − 1)^{N(N−1)/2}`, written here
multiplicatively. The identity follows from [FormalProof],
`Development/AbelianVarietyTheory/BlockTheory/TorsionBlocks/BottomMinor.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.CornerMinors.HookNorm`) and
`Development/AbelianVarietyTheory/Proofs/FoundationProofs/PolarisationOperatorApplyVariable.lean`
(`GlobalTheory.MinorNorm.hookNorm`), and the lower bound from
`Formalism/PeriodIntegrals/HookBound.lean` (`PI.HookBound`), whose upper bound has the larger base
`λ⁰_0 + N`; the upper bound stated here, with the base `λ⁰_0 + N − 1`, follows from the identity
`H(λ⁰)·∏_{i<j}(β_i − β_j) = ∏_i β_i!` for the beta-numbers `β_i = λ⁰_i + N − 1 − i` (README 3.2,
route). -/
theorem fischerNormSq_highestWeightVector (n : ℕ) (μ : YoungDiagram) (hμ : μ.colLen 0 ≤ n) :
    fischerNormSq (highestWeightVector ℤ fun s : Fin (n + 1) => μ.rowLen s) =
        ∏ c ∈ μ.cells, (μ.hookLength c : ℤ) ∧
      ∏ s ∈ range (n + 1), (μ.rowLen s).factorial ≤ ∏ c ∈ μ.cells, μ.hookLength c ∧
      ∏ c ∈ μ.cells, μ.hookLength c ≤
        (μ.rowLen 0 + n) ^ ((n + 1) * n / 2) * ∏ s ∈ range (n + 1), (μ.rowLen s).factorial := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.IntegralWeylModulesOfGeneralLinearGroups
