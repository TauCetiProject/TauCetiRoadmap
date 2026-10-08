import Mathlib
import TauCeti.InformationTheory.Coding.A2
import TauCeti.InformationTheory.Coding.Binary.Golay.Punctured
import TauCeti.InformationTheory.Coding.Binary.Operations
import TauCeti.InformationTheory.Coding.Binary.TypeII
import TauCeti.InformationTheory.Coding.Binary.WeightEnumerator
import TauCeti.InformationTheory.Coding.CharacterSum
import TauCeti.InformationTheory.Coding.D4
import TauCeti.InformationTheory.Coding.Discriminant
import TauCeti.InformationTheory.Coding.Duality
import TauCeti.InformationTheory.Coding.Elementary.MinimumDistance
import TauCeti.InformationTheory.Coding.Elementary.Operations
import TauCeti.InformationTheory.Coding.GaloisDual.Frobenius
import TauCeti.InformationTheory.Coding.GeneratorParityCheck
import TauCeti.InformationTheory.Coding.Hamming
import TauCeti.InformationTheory.Coding.Hexacode.D4
import TauCeti.InformationTheory.Coding.Hexacode.WeightEnumerator
import TauCeti.InformationTheory.Coding.Krawtchouk
import TauCeti.InformationTheory.Coding.MacWilliams.Elementary
import TauCeti.InformationTheory.Coding.MacWilliams.Normalized
import TauCeti.InformationTheory.Coding.MacWilliams.ZeroWhole
import TauCeti.InformationTheory.Coding.MinimumDistance.Operations
import TauCeti.InformationTheory.Coding.ParityCheck.RedundantRows
import TauCeti.InformationTheory.Coding.Puncture.Coherence
import TauCeti.InformationTheory.Coding.RootDiscriminant
import TauCeti.InformationTheory.Coding.RowOperations
import TauCeti.InformationTheory.Coding.Semilinear.Aut
import TauCeti.InformationTheory.Coding.Semilinear.WeightEnumerator
import TauCeti.InformationTheory.Coding.Systematic.RowReduction
import TauCeti.InformationTheory.Coding.TernaryGolay
import TauCeti.InformationTheory.Coding.Tetracode
import TauCeti.InformationTheory.Coding.TwoCoordinateCode
import TauCeti.InformationTheory.Coding.Weight.DirectSum
import TauCeti.LinearAlgebra.IntegralLattice.ConstructionA.Code.Golay
import TauCeti.LinearAlgebra.IntegralLattice.ConstructionA.Code.OrthogonalQuotient
import TauCeti.LinearAlgebra.IntegralLattice.ConstructionA.Code.Quadratic
import TauCeti.LinearAlgebra.IntegralLattice.ConstructionA.Discriminant
import TauCeti.LinearAlgebra.IntegralLattice.ConstructionA.Even
import TauCeti.LinearAlgebra.IntegralLattice.ConstructionA.Golay
import TauCeti.LinearAlgebra.IntegralLattice.ConstructionA.Monomial
import TauCeti.LinearAlgebra.IntegralLattice.ConstructionA.Naturality
import TauCeti.LinearAlgebra.IntegralLattice.ConstructionA.Real

/-!
# Algebraic codes and code-lattice constructions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed by
the Tau Ceti (or Mathlib) declaration that realizes it, so the correspondence is checked by the
Lean kernel rather than asserted in prose. No statement is left unproved. That is evidence for
completion, not its criterion: completion is judged by a milestone-by-milestone audit against
`README.md`, which a fully proved file of suggested forms cannot replace.

The earlier version of this file proposed local stand-ins and stated the milestones about them.
The statements below are about the Tau Ceti objects instead, which differ from those stand-ins as
follows.

* Minimum distance is `Set.hammingMinDist`, the least distance between distinct words of any set
  of words (zero when there are none). The old `minimumDistance` went through `Set.infsep` on
  Mathlib's `Hamming` synonym; the two agree (`hammingMinDist_eq_infsep_toHammingCode`), which
  is the bridge to mathlib4#38014 that the README asks for.
* The dual of an additive code over `ZMod m` is `(AddSubgroup.toZModSubmodule m C).euclideanDual`
  rather than a separate `zmodDual`. Construction A takes `m : ℕ+` rather than `2 ≤ m`; the README
  allows a nonvanishing parameter, and nothing is defined at `m = 0`.
* The base lattice `L₀ = mℤ^ι` is `ConstructionA.zeroLattice m ι`, the Construction A lattice of
  the zero code, rather than a separate `constructionABase`. The coordinate alphabets are
  `zmodStandard` and the `A₂`, `D₄` alphabets with `coordinatePower`, rather than structure
  literals, and `C⊥/C` is `orthogonalQuotient`.
* The extended Golay codes have coordinates `Fin 24` and `Fin 12`, the binary generator
  `[I₁₂ | B]` assembled with `Fin.append`; the old file used `Fin 12 ⊕ Fin 12` and `Fin 6 ⊕ Fin 6`.
  The hexacode is defined for any root `ω` of `X² + X + 1` in any field, so the statements below
  hold for every four-element field and either root, which is the README's `ω ↔ ω²` invariance.
* A monomial map is `monomialEquiv u e`, which scales coordinate `i` by `u i` before moving it to
  `e i`, rather than a structure scaling at the target coordinate.
* Hermitian duality is `RingEquiv.galoisDual σ` for any field automorphism; the README's
  involutive forms are the `_of_involutive` specializations. The binary MacWilliams invariance
  `W_C(X + Y, X - Y) = 2^(n/2) W_C` needs only self-duality and `W_C(X, iY) = W_C` only double
  evenness, both weaker than the README's Type II hypothesis.
* The `A₂` alphabet is `IntegralLattice.typeAStandardQuadraticModule 2`; the README's `a²/3` is
  the specialization of Tau Ceti's value `k²n/(2(n + 1))` on the reduction of an integer `k`.
* Minimum distance, puncturing, shortening and direct sums are stated for additive codes over any
  abelian alphabet as well as for linear codes, as the README asks.
* Erratum, corrected at archiving (README, Layer 7): the comparison of `L₀.ofIsotropicSubgroup`
  with `P_m(C)` needs `m` even and `q_m|_C = 0`, since `ofIsotropicSubgroup` produces an even
  lattice and `{00, 11}` for `m = 2` gives an odd `P_2(C)`. For any `m` and self-orthogonal `C`
  the general comparison identifies the integral lattice on the inverse-image carrier with
  `P_m(C)`; both forms are stated below.
* The Layer 1 acceptance test is stated for every code, information set and coordinate
  equivalence, with the two-coordinate code `[1 | a]` under exchange of coordinates as a worked
  instance.
* The Construction A bridge lives in the directory `TauCeti/LinearAlgebra/IntegralLattice/
  ConstructionA/` rather than in the single file the README suggested.

The README excludes decoding algorithms, general bounds, cyclic, BCH and Reed–Solomon codes,
designs, rank-24 glue tables, classification of codes or lattices, theta series (including a theta
proof of MacWilliams), categorical constructions, Gleason invariant theory, uniqueness of the named
codes and the identification of Golay automorphism groups with Mathieu groups; none is stated here.
-/

namespace TauCetiRoadmap.AlgebraicCodingTheory

open TauCeti Matrix MvPolynomial
open scoped Pointwise

/-! ## Layer 1: finite codes, matrices, and elementary constructions -/

section Layer1

attribute [local instance] RingHomInvPair.of_ringEquiv RingHomInvPair.of_ringEquiv_symm

variable {F ι κ ρ : Type*} [Field F]

/-- **Carriers.** A linear code is a `Submodule` and an additive code an `AddSubgroup`; the
aliases are reducible, so the lattice operations, maps and comaps are those of the carriers. -/
example : LinearCode F ι = Submodule F (ι → F) := rfl

example (A : Type*) [AddCommGroup A] : AdditiveCode A ι = AddSubgroup (ι → A) := rfl

/-- `#C = (#F)^(dim C)`. -/
theorem natCard_eq_pow_finrank [Finite F] [Finite ι] (C : LinearCode F ι) :
    Nat.card C = Nat.card F ^ Module.finrank F C :=
  Module.natCard_eq_pow_finrank

/-- **Generated and checked codes** are the row space `range G.vecMulLinear` and the kernel
`ker H.mulVecLin`, and the matrix predicates are equality to those submodules. -/
example [Fintype ρ] (G : Matrix ρ ι F) : G.generatedBy = LinearMap.range G.vecMulLinear := rfl

example [Fintype ι] (H : Matrix ρ ι F) : H.checkedBy = LinearMap.ker H.mulVecLin := rfl

example [Fintype ρ] (C : LinearCode F ι) (G : Matrix ρ ι F) :
    C.IsGeneratorMatrix G ↔ G.generatedBy = C := Iff.rfl

example [Fintype ι] (C : LinearCode F ι) (H : Matrix ρ ι F) :
    C.IsParityCheckMatrix H ↔ H.checkedBy = C := Iff.rfl

/-- Existence of full-rank generator and parity-check matrices, from bases. -/
theorem exists_isGeneratorMatrix [Finite ι] (C : LinearCode F ι) :
    ∃ G : Matrix (Fin (Module.finrank F C)) ι F,
      C.IsGeneratorMatrix G ∧ LinearIndependent F G.row :=
  LinearCode.exists_isGeneratorMatrix C

theorem exists_isParityCheckMatrix [Fintype ι] (C : LinearCode F ι) :
    ∃ H : Matrix (Fin (Fintype.card ι - Module.finrank F C)) ι F,
      C.IsParityCheckMatrix H ∧ LinearIndependent F H.row :=
  LinearCode.exists_isParityCheckMatrix C

/-- Row-span and syndrome membership criteria. -/
theorem mem_generatedBy_iff [Fintype ρ] {G : Matrix ρ ι F} {x : ι → F} :
    x ∈ G.generatedBy ↔ ∃ a : ρ → F, a ᵥ* G = x :=
  Matrix.mem_generatedBy_iff

theorem mem_checkedBy_iff [Fintype ι] {H : Matrix ρ ι F} {x : ι → F} :
    x ∈ H.checkedBy ↔ H *ᵥ x = 0 :=
  Matrix.mem_checkedBy_iff

/-- Rank and dimension. -/
theorem finrank_generatedBy [Fintype ρ] [Fintype ι] (G : Matrix ρ ι F) :
    Module.finrank F G.generatedBy = G.rank :=
  Matrix.finrank_generatedBy G

theorem finrank_checkedBy [Fintype ι] (H : Matrix ρ ι F) :
    Module.finrank F H.checkedBy = Fintype.card ι - H.rank :=
  Matrix.finrank_checkedBy H

/-- Dependent rows can be deleted, from generator and from parity-check matrices. -/
theorem exists_linearIndependent_generatedBy_submatrix [Fintype ρ] (G : Matrix ρ ι F) :
    ∃ s : Finset ρ, LinearIndependent F (G.submatrix ((↑) : s → ρ) id).row ∧
      (G.submatrix ((↑) : s → ρ) id).generatedBy = G.generatedBy :=
  Matrix.exists_linearIndependent_generatedBy_submatrix G

theorem IsGeneratorMatrix.deleteRow [Fintype ρ] [DecidableEq ρ] {C : LinearCode F ι}
    {G : Matrix ρ ι F} (hG : C.IsGeneratorMatrix G) (r : ρ)
    (hr : G.row r ∈ (G.deleteRow r).generatedBy) :
    C.IsGeneratorMatrix (G.deleteRow r) :=
  LinearCode.IsGeneratorMatrix.deleteRow hG r hr

theorem IsParityCheckMatrix.exists_submatrix [Fintype ι] [Finite ρ] {C : LinearCode F ι}
    {H : Matrix ρ ι F} (hH : C.IsParityCheckMatrix H) :
    ∃ s : Finset ρ, LinearIndependent F (H.submatrix ((↑) : s → ρ) id).row ∧
      C.IsParityCheckMatrix (H.submatrix ((↑) : s → ρ) id) ∧
      s.card = Fintype.card ι - Module.finrank F C :=
  LinearCode.IsParityCheckMatrix.exists_submatrix hH

/-- Invertible row operations do not change the generated or the checked code. -/
theorem generatedBy_mul_eq_of_isUnit [Fintype ρ] [DecidableEq ρ] (A : Matrix ρ ρ F)
    (G : Matrix ρ ι F) (hA : IsUnit A) : (A * G).generatedBy = G.generatedBy :=
  Matrix.generatedBy_mul_eq_of_isUnit A G hA

theorem checkedBy_mul_of_isUnit [Fintype ι] [Fintype ρ] [DecidableEq ρ] {P : Matrix ρ ρ F}
    (hP : IsUnit P) (H : Matrix ρ ι F) : (P * H).checkedBy = H.checkedBy :=
  Matrix.checkedBy_mul_of_isUnit hP H

/-- Full-rank generator and parity-check matrices have `k` and `n - k` rows. -/
theorem card_eq_finrank_of_isGeneratorMatrix [Fintype ρ] [Finite ι] {C : LinearCode F ι}
    {G : Matrix ρ ι F} (hG : C.IsGeneratorMatrix G) (hli : LinearIndependent F G.row) :
    Fintype.card ρ = Module.finrank F C :=
  LinearCode.card_eq_finrank_of_isGeneratorMatrix_of_linearIndependent hG hli

theorem card_eq_card_sub_finrank_of_isParityCheckMatrix [Fintype ρ] [Fintype ι]
    {C : LinearCode F ι} {H : Matrix ρ ι F} (hH : C.IsParityCheckMatrix H)
    (hli : LinearIndependent F H.row) :
    Fintype.card ρ = Fintype.card ι - Module.finrank F C :=
  LinearCode.card_eq_card_sub_finrank_of_isParityCheckMatrix_of_linearIndependent hH hli

/-- A generator matrix for `C` is a parity-check matrix for `C⊥`. -/
theorem isGeneratorMatrix_iff_isParityCheckMatrix_euclideanDual [Fintype ι] [Fintype ρ]
    {C : LinearCode F ι} {G : Matrix ρ ι F} :
    C.IsGeneratorMatrix G ↔ LinearCode.IsParityCheckMatrix C.euclideanDual G :=
  LinearCode.isGeneratorMatrix_iff_isParityCheckMatrix_euclideanDual

/-- **Systematic form relative to a chosen information set.** An information set is a retained
set of coordinates on which restriction is bijective; one exists, but none is canonical. -/
theorem isInformationSet_iff (C : LinearCode F ι) (s : Set ι) :
    IsInformationSet C s ↔ Function.Bijective (fun x : C ↦ fun i : s ↦ (x : ι → F) i) :=
  isInformationSet_def C s

theorem exists_isInformationSet (C : LinearCode F ι) [FiniteDimensional F C] :
    ∃ s : Set ι, s.Finite ∧ IsInformationSet C s :=
  TauCeti.exists_isInformationSet C

/-- The systematic generator is the identity on the information set and generates `C`. -/
theorem generatorMatrix_systematic {C : LinearCode F ι} {s : Set ι} [Fintype s]
    [DecidableEq s] (h : IsInformationSet C s) :
    h.generatorMatrix.submatrix id (Subtype.val : s → ι) = 1 ∧
      h.generatorMatrix.generatedBy = C :=
  ⟨by convert h.generatorMatrix_submatrix, h.generatedBy_generatorMatrix⟩

open Classical in
/-- The systematic check matrix is `[-Aᵀ | I]` for the generator `[I | A]`, and cuts out `C`. -/
theorem parityCheckMatrix_systematic [Fintype ι] {C : LinearCode F ι} {s : Set ι}
    (h : IsInformationSet C s) :
    h.parityCheckMatrix.submatrix id (Equiv.Set.sumCompl s) =
        fromCols (-(h.generatorMatrix.submatrix id (Subtype.val : ↥(sᶜ) → ι))ᵀ)
          (1 : Matrix ↥(sᶜ) ↥(sᶜ) F) ∧
      h.parityCheckMatrix.checkedBy = C :=
  ⟨h.parityCheckMatrix_submatrix_sumCompl, h.checkedBy_parityCheckMatrix⟩

/-- `[I | A]` generates exactly the code that `[-Aᵀ | I]` checks. -/
theorem generatedBy_one_fromCols_eq_checkedBy_fromCols_neg_transpose_one {τ : Type*}
    [Fintype ρ] [Fintype τ] [DecidableEq ρ] [DecidableEq τ] (A : Matrix ρ τ F) :
    (fromCols (1 : Matrix ρ ρ F) A).generatedBy =
      (fromCols (-Aᵀ) (1 : Matrix τ τ F)).checkedBy :=
  Matrix.generatedBy_one_fromCols_eq_checkedBy_fromCols_neg_transpose_one A

/-- **Puncturing and shortening** retain the coordinates in `s`: puncturing restricts, and
shortening imposes zero outside `s` before restricting. -/
theorem mem_puncture {C : LinearCode F ι} {s : Set ι} {y : s → F} :
    y ∈ puncture C s ↔ ∃ x ∈ C, ∀ j : s, x j = y j :=
  TauCeti.mem_puncture

theorem mem_shorten {C : LinearCode F ι} {s : Set ι} {y : s → F} :
    y ∈ shorten C s ↔ ∃ x ∈ C, (∀ i ∉ s, x i = 0) ∧ ∀ j : s, x j = y j :=
  TauCeti.mem_shorten

/-- The single-coordinate forms delete one coordinate. -/
theorem mem_punctureAt {C : LinearCode F ι} {i : ι} {y : ({i}ᶜ : Set ι) → F} :
    y ∈ punctureAt C i ↔ ∃ x ∈ C, ∀ j : ({i}ᶜ : Set ι), x j = y j :=
  TauCeti.mem_punctureAt

theorem mem_shortenAt {C : LinearCode F ι} {i : ι} {y : ({i}ᶜ : Set ι) → F} :
    y ∈ shortenAt C i ↔ ∃ x ∈ C, x i = 0 ∧ ∀ j : ({i}ᶜ : Set ι), x j = y j :=
  TauCeti.mem_shortenAt

theorem finrank_shorten_add_finrank_puncture_compl (C : LinearCode F ι) [FiniteDimensional F C]
    (s : Set ι) :
    Module.finrank F (shorten C s) + Module.finrank F (puncture C sᶜ) = Module.finrank F C :=
  TauCeti.finrank_shorten_add_finrank_puncture_compl C s

/-- Dimension bounds in terms of the number of deleted coordinates. -/
theorem finrank_le_finrank_puncture_add_ncard_compl [Finite ι] (C : LinearCode F ι)
    (s : Set ι) : Module.finrank F C ≤ Module.finrank F (puncture C s) + sᶜ.ncard :=
  TauCeti.finrank_le_finrank_puncture_add_ncard_compl C s

theorem finrank_le_finrank_shorten_add_ncard_compl [Finite ι] (C : LinearCode F ι)
    (s : Set ι) : Module.finrank F C ≤ Module.finrank F (shorten C s) + sᶜ.ncard :=
  TauCeti.finrank_le_finrank_shorten_add_ncard_compl C s

/-- Repeated puncturing and shortening, along the canonical equivalence of retained types. -/
theorem puncture_puncture (C : LinearCode F ι) (s : Set ι) (t : Set s) :
    reindex (puncture (puncture C s) t)
        (Equiv.subtypeSubtypeEquivSubtypeExists (· ∈ s) (· ∈ t)).symm =
      puncture C {i | ∃ hi : i ∈ s, (⟨i, hi⟩ : s) ∈ t} :=
  TauCeti.puncture_puncture C s t

theorem shorten_shorten (C : LinearCode F ι) (s : Set ι) (t : Set s) :
    reindex (shorten (shorten C s) t)
        (Equiv.subtypeSubtypeEquivSubtypeExists (· ∈ s) (· ∈ t)).symm =
      shorten C {i | ∃ hi : i ∈ s, (⟨i, hi⟩ : s) ∈ t} :=
  TauCeti.shorten_shorten C s t

/-- Naturality under reindexing: the retained set is pulled back along the equivalence. -/
theorem puncture_reindex (C : LinearCode F ι) (e : κ ≃ ι) (s : Set ι) :
    puncture (reindex C e) (e ⁻¹' s) =
      reindex (puncture C s) (e.subtypeEquiv fun _ ↦ Iff.rfl) :=
  TauCeti.puncture_reindex C e s

theorem shorten_reindex (C : LinearCode F ι) (e : κ ≃ ι) (s : Set ι) :
    shorten (reindex C e) (e ⁻¹' s) =
      reindex (shorten C s) (e.subtypeEquiv fun _ ↦ Iff.rfl) :=
  TauCeti.shorten_reindex C e s

/-- **Direct sums** live on the disjoint union of the coordinate types. -/
theorem mem_directSum_iff {C : LinearCode F ι} {D : LinearCode F κ} {x : ι ⊕ κ → F} :
    x ∈ C.directSum D ↔ (fun i ↦ x (.inl i)) ∈ C ∧ (fun j ↦ x (.inr j)) ∈ D :=
  Submodule.mem_directSum_iff

theorem finrank_directSum [Finite ι] [Finite κ] (C : LinearCode F ι) (D : LinearCode F κ) :
    Module.finrank F (C.directSum D) = Module.finrank F C + Module.finrank F D :=
  Submodule.finrank_directSum C D

theorem natCard_directSum (C : LinearCode F ι) (D : LinearCode F κ) :
    Nat.card (C.directSum D) = Nat.card C * Nat.card D :=
  Submodule.natCard_directSum C D

theorem hammingNorm_directSumEquivProd_symm [DecidableEq F] [Fintype ι] [Fintype κ]
    (C : LinearCode F ι) (D : LinearCode F κ) (x : C) (y : D) :
    hammingNorm ((Submodule.directSumEquivProd C D).symm (x, y) : ι ⊕ κ → F) =
      hammingNorm x.1 + hammingNorm y.1 :=
  Submodule.hammingNorm_directSumEquivProd_symm C D x y

/-- Commutativity and associativity through the canonical coordinate equivalences. -/
theorem map_directSum_sumComm (C : LinearCode F ι) (D : LinearCode F κ) :
    (C.directSum D).map (LinearEquiv.funCongrLeft F F (Equiv.sumComm κ ι)).toLinearMap =
      D.directSum C :=
  Submodule.map_directSum_sumComm C D

theorem map_directSum_sumAssoc {ν : Type*} (C : LinearCode F ι) (D : LinearCode F κ)
    (E : LinearCode F ν) :
    ((C.directSum D).directSum E).map
        (LinearEquiv.funCongrLeft F F (Equiv.sumAssoc ι κ ν).symm).toLinearMap =
      C.directSum (D.directSum E) :=
  Submodule.map_directSum_sumAssoc C D E

/-! **The operations for additive codes.** Puncturing, shortening and direct sums are defined for
an additive code over any abelian alphabet, such as `ZMod 4`, with the same retained-set
convention, repeated-operation identities, naturality and direct-sum structure. -/
namespace AdditiveCode

variable {A : Type*} [AddCommGroup A]

theorem mem_puncture {C : TauCeti.AdditiveCode A ι} {s : Set ι} {y : s → A} :
    y ∈ TauCeti.AdditiveCode.puncture C s ↔ ∃ x ∈ C, ∀ j : s, x j = y j :=
  TauCeti.AdditiveCode.mem_puncture

theorem mem_shorten {C : TauCeti.AdditiveCode A ι} {s : Set ι} {y : s → A} :
    y ∈ TauCeti.AdditiveCode.shorten C s ↔ ∃ x ∈ C, (∀ i ∉ s, x i = 0) ∧ ∀ j : s, x j = y j :=
  TauCeti.AdditiveCode.mem_shorten

theorem puncture_puncture (C : TauCeti.AdditiveCode A ι) (s : Set ι) (t : Set s) :
    (TauCeti.AdditiveCode.puncture (TauCeti.AdditiveCode.puncture C s) t).map
        (AddMonoidHom.ofClass
          (AddEquiv.arrowCongr (Equiv.subtypeSubtypeEquivSubtypeExists (· ∈ s) (· ∈ t))
            (AddEquiv.refl A))) =
      TauCeti.AdditiveCode.puncture C {i | ∃ hi : i ∈ s, (⟨i, hi⟩ : s) ∈ t} :=
  TauCeti.AdditiveCode.puncture_puncture C s t

theorem shorten_shorten (C : TauCeti.AdditiveCode A ι) (s : Set ι) (t : Set s) :
    (TauCeti.AdditiveCode.shorten (TauCeti.AdditiveCode.shorten C s) t).map
        (AddMonoidHom.ofClass
          (AddEquiv.arrowCongr (Equiv.subtypeSubtypeEquivSubtypeExists (· ∈ s) (· ∈ t))
            (AddEquiv.refl A))) =
      TauCeti.AdditiveCode.shorten C {i | ∃ hi : i ∈ s, (⟨i, hi⟩ : s) ∈ t} :=
  TauCeti.AdditiveCode.shorten_shorten C s t

theorem puncture_map_arrowCongr (C : TauCeti.AdditiveCode A ι) (e : κ ≃ ι) (s : Set ι) :
    TauCeti.AdditiveCode.puncture
        (C.map (AddMonoidHom.ofClass (AddEquiv.arrowCongr e.symm (AddEquiv.refl A)))) (e ⁻¹' s) =
      (TauCeti.AdditiveCode.puncture C s).map
        (AddMonoidHom.ofClass (AddEquiv.arrowCongr (e.subtypeEquiv fun _ ↦ Iff.rfl).symm
          (AddEquiv.refl A))) :=
  TauCeti.AdditiveCode.puncture_map_arrowCongr C e s

theorem shorten_map_arrowCongr (C : TauCeti.AdditiveCode A ι) (e : κ ≃ ι) (s : Set ι) :
    TauCeti.AdditiveCode.shorten
        (C.map (AddMonoidHom.ofClass (AddEquiv.arrowCongr e.symm (AddEquiv.refl A)))) (e ⁻¹' s) =
      (TauCeti.AdditiveCode.shorten C s).map
        (AddMonoidHom.ofClass (AddEquiv.arrowCongr (e.subtypeEquiv fun _ ↦ Iff.rfl).symm
          (AddEquiv.refl A))) :=
  TauCeti.AdditiveCode.shorten_map_arrowCongr C e s

theorem mem_directSum_iff {C : TauCeti.AdditiveCode A ι} {D : TauCeti.AdditiveCode A κ}
    {x : ι ⊕ κ → A} :
    x ∈ C.directSum D ↔ (fun i ↦ x (.inl i)) ∈ C ∧ (fun j ↦ x (.inr j)) ∈ D :=
  AddSubgroup.mem_directSum_iff

theorem natCard_directSum (C : TauCeti.AdditiveCode A ι) (D : TauCeti.AdditiveCode A κ) :
    Nat.card (C.directSum D) = Nat.card C * Nat.card D :=
  AddSubgroup.natCard_directSum C D

theorem hammingNorm_directSumEquivProd_symm [DecidableEq A] [Fintype ι] [Fintype κ]
    (C : TauCeti.AdditiveCode A ι) (D : TauCeti.AdditiveCode A κ) (x : C) (y : D) :
    hammingNorm ((C.directSumEquivProd D).symm (x, y) : ι ⊕ κ → A) =
      hammingNorm x.1 + hammingNorm y.1 :=
  AddSubgroup.hammingNorm_directSumEquivProd_symm C D x y

theorem isPermutationEquivalent_directSum_comm (C : TauCeti.AdditiveCode A ι)
    (D : TauCeti.AdditiveCode A κ) :
    TauCeti.AdditiveCode.IsPermutationEquivalent (C.directSum D) (D.directSum C) :=
  TauCeti.AdditiveCode.isPermutationEquivalent_directSum_comm C D

theorem isPermutationEquivalent_directSum_assoc {ν : Type*} (C : TauCeti.AdditiveCode A ι)
    (D : TauCeti.AdditiveCode A κ) (E : TauCeti.AdditiveCode A ν) :
    TauCeti.AdditiveCode.IsPermutationEquivalent ((C.directSum D).directSum E)
      (C.directSum (D.directSum E)) :=
  TauCeti.AdditiveCode.isPermutationEquivalent_directSum_assoc C D E

end AdditiveCode

/-- **Monomial and semilinear word equivalences.** The coordinate formula pins the direction:
coordinate `i` is scaled by `u i` and moved to `e i`, after applying `σ` in the semilinear case. -/
theorem monomialEquiv_apply (u : ι → Fˣ) (e : ι ≃ κ) (x : ι → F) (j : κ) :
    monomialEquiv u e x j = u (e.symm j) * x (e.symm j) :=
  TauCeti.monomialEquiv_apply u e x j

theorem semilinearMonomialEquiv_apply (u : ι → Fˣ) (e : ι ≃ κ) (σ : F ≃+* F) (x : ι → F)
    (j : κ) :
    semilinearMonomialEquiv u e σ x j = (u (e.symm j) : F) * σ (x (e.symm j)) :=
  TauCeti.semilinearMonomialEquiv_apply u e σ x j

theorem support_monomialEquiv (u : ι → Fˣ) (e : ι ≃ κ) (x : ι → F) :
    Function.support (monomialEquiv u e x) = e '' Function.support x :=
  TauCeti.support_monomialEquiv u e x

theorem hammingDist_monomialEquiv [Fintype ι] [Fintype κ] [DecidableEq F] (u : ι → Fˣ)
    (e : ι ≃ κ) (x y : ι → F) :
    hammingDist (monomialEquiv u e x) (monomialEquiv u e y) = hammingDist x y :=
  TauCeti.hammingDist_monomialEquiv u e x y

theorem hammingNorm_semilinearMonomialEquiv [Fintype ι] [Fintype κ] [DecidableEq F]
    (u : ι → Fˣ) (e : ι ≃ κ) (σ : F ≃+* F) (x : ι → F) :
    hammingNorm (semilinearMonomialEquiv u e σ x) = hammingNorm x :=
  TauCeti.hammingNorm_semilinearMonomialEquiv u e σ x

/-- The three equivalence relations on codes, with permutation equivalence induced only by a
coordinate equivalence. -/
theorem isPermutationEquivalent_iff {C : LinearCode F ι} {D : LinearCode F κ} :
    IsPermutationEquivalent C D ↔
      ∃ e : ι ≃ κ, C.map (LinearEquiv.funCongrLeft F F e.symm : (ι → F) →ₗ[F] (κ → F)) = D :=
  TauCeti.isPermutationEquivalent_iff

theorem isMonomialEquivalent_iff {C : LinearCode F ι} {D : LinearCode F κ} :
    IsMonomialEquivalent C D ↔
      ∃ (u : ι → Fˣ) (e : ι ≃ κ), C.map (monomialEquiv u e : (ι → F) →ₗ[F] (κ → F)) = D :=
  TauCeti.isMonomialEquivalent_iff

theorem isSemilinearEquivalent_iff {C : LinearCode F ι} {D : LinearCode F κ} :
    IsSemilinearEquivalent C D ↔
      ∃ (σ : F ≃+* F) (u : ι → Fˣ) (e : ι ≃ κ),
        C.map (semilinearMonomialEquiv u e σ).toLinearMap = D :=
  TauCeti.isSemilinearEquivalent_iff

theorem isSemilinearEquivalent_equivalence :
    Equivalence (IsSemilinearEquivalent (R := F) (ι := ι) (κ := ι)) :=
  ⟨IsSemilinearEquivalent.refl, IsSemilinearEquivalent.symm, IsSemilinearEquivalent.trans⟩

theorem isMonomialEquivalent_equivalence :
    Equivalence (IsMonomialEquivalent (R := F) (ι := ι) (κ := ι)) :=
  ⟨IsMonomialEquivalent.refl, IsMonomialEquivalent.symm, IsMonomialEquivalent.trans⟩

/-- Semilinear (hence monomial and permutation) equivalence preserves dimension, minimum
distance and the weight enumerator. -/
theorem IsSemilinearEquivalent.invariants [Fintype ι] [Fintype κ] [DecidableEq F]
    {C : LinearCode F ι} {D : LinearCode F κ} (h : IsSemilinearEquivalent C D) :
    Module.finrank F C = Module.finrank F D ∧
      (C : Set (ι → F)).hammingMinDist = (D : Set (κ → F)).hammingMinDist ∧
      (C : Set (ι → F)).weightEnumerator = (D : Set (κ → F)).weightEnumerator :=
  ⟨h.finrank_eq, h.hammingMinDist_eq, h.weightEnumerator_eq⟩

/-- **Stabilizers.** `Aut(C)` is the monomial stabilizer, with the permutation and semilinear
stabilizers alongside; each acts on the codewords. -/
theorem mem_monomialAut {C : LinearCode F ι} {f : (ι → F) ≃ₗ[F] (ι → F)} :
    f ∈ monomialAut C ↔ f ∈ monomialGroup F ι ∧ C.map (f : (ι → F) →ₗ[F] (ι → F)) = C :=
  TauCeti.mem_monomialAut

theorem mem_permutationAut {C : LinearCode F ι} {f : (ι → F) ≃ₗ[F] (ι → F)} :
    f ∈ permutationAut C ↔
      f ∈ permutationGroup F ι ∧ C.map (f : (ι → F) →ₗ[F] (ι → F)) = C :=
  TauCeti.mem_permutationAut

theorem mem_semilinearAut {C : LinearCode F ι} {f : Equiv.Perm (ι → F)} :
    f ∈ semilinearAut C ↔ f ∈ semilinearMonomialGroup F ι ∧ f • (C : Set (ι → F)) = C :=
  TauCeti.mem_semilinearAut

example (C : LinearCode F ι) : DistribMulAction (monomialAut C) C := inferInstance

example (C : LinearCode F ι) : DistribMulAction (permutationAut C) C := inferInstance

example (C : LinearCode F ι) : DistribMulAction (semilinearAut C) C := inferInstance

theorem coe_smul_monomialAut (C : LinearCode F ι) (f : monomialAut C) (c : C) :
    ((f • c : C) : ι → F) = (f : (ι → F) ≃ₗ[F] (ι → F)) c :=
  TauCeti.coe_smul_monomialAut f c

/-- **Acceptance (Layer 1).** From a generator `G` whose rows are indexed by an information set
`s`, the systematic parity-check matrix is computed by inverting the information block, and its
kernel recovers `C`. -/
theorem parityCheckMatrix_eq_fromCols_inv_mul_and_checkedBy [Fintype ι] {C : LinearCode F ι}
    {s : Set ι} [Fintype s] [DecidableEq s] [DecidableEq ↥sᶜ] [DecidablePred (· ∈ s)]
    (h : IsInformationSet C s) [Fintype ρ] {G : Matrix ρ ι F} (hG : C.IsGeneratorMatrix G)
    (e : s ≃ ρ) :
    h.parityCheckMatrix =
        (fromCols
          (-((G.submatrix e (Subtype.val : s → ι))⁻¹ *
            G.submatrix e (Subtype.val : ↥sᶜ → ι))ᵀ)
          (1 : Matrix ↥sᶜ ↥sᶜ F)).submatrix id (Equiv.Set.sumCompl s).symm ∧
      h.parityCheckMatrix.checkedBy = C :=
  ⟨h.parityCheckMatrix_eq_fromCols_inv_mul hG e, h.checkedBy_parityCheckMatrix⟩

/-- **Acceptance (Layer 1), naturality.** Along any coordinate equivalence `e : κ ≃ ι`, the
systematic generator and check matrices of the reindexed code are the reindexed matrices, and the
reindexed check matrix cuts out the reindexed code. -/
theorem systematic_reindex [Fintype κ] {C : LinearCode F ι} {s : Set ι}
    (h : IsInformationSet C s) (e : κ ≃ ι) :
    (h.reindex e).generatorMatrix =
        h.generatorMatrix.submatrix (e.subtypeEquiv fun _ ↦ Iff.rfl) e ∧
      (h.reindex e).parityCheckMatrix =
        h.parityCheckMatrix.submatrix
          (e.subtypeEquiv (p := (· ∈ (e ⁻¹' s)ᶜ)) (q := (· ∈ sᶜ)) fun _ ↦ Iff.rfl) e ∧
      (h.reindex e).parityCheckMatrix.checkedBy = reindex C e :=
  ⟨h.generatorMatrix_reindex e, h.parityCheckMatrix_reindex e,
    (h.reindex e).checkedBy_parityCheckMatrix⟩

/-- **Acceptance (Layer 1), a worked instance.** The generator `[1 | a]` has check `[-a | 1]`,
whose kernel is the code; after exchanging the two coordinates the exchanged check matrix cuts out
the exchanged code. -/
theorem twoCoordinateCode_roundTrip (a : F) :
    TwoCoordinateCode.generator a = fromCols (1 : Matrix (Fin 1) (Fin 1) F) (of fun _ _ ↦ a) ∧
      TwoCoordinateCode.check a =
        fromCols (-(of fun _ _ ↦ a : Matrix (Fin 1) (Fin 1) F)ᵀ) (1 : Matrix (Fin 1) (Fin 1) F) ∧
      (TwoCoordinateCode.check a).checkedBy = TwoCoordinateCode.code a ∧
      ((TwoCoordinateCode.check a).submatrix id (Equiv.sumComm (Fin 1) (Fin 1))).checkedBy =
        reindex (TwoCoordinateCode.code a) (Equiv.sumComm (Fin 1) (Fin 1)) :=
  ⟨rfl, rfl,
    (Matrix.generatedBy_one_fromCols_eq_checkedBy_fromCols_neg_transpose_one
      (of fun _ _ ↦ a : Matrix (Fin 1) (Fin 1) F)).symm,
    (TwoCoordinateCode.checkedBy_check_submatrix_sumComm a).trans
      (Matrix.generatedBy_submatrix_equiv _ _)⟩

end Layer1

/-! ## Layer 2: Hamming data and dual codes -/

section Layer2

variable {F ι κ ρ : Type*} [Field F]

/-- **Support and Hamming data**, with Mathlib's `hammingNorm` and `hammingDist`. -/
theorem hammingNorm_eq_ncard_support {A : Type*} [Fintype ι] [Zero A] [DecidableEq A]
    (x : ι → A) : hammingNorm x = (Function.support x).ncard :=
  TauCeti.hammingNorm_eq_ncard_support x

theorem hammingNorm_add_add_ncard_inter_add_ncard_sdiff {A : Type*} [Fintype ι] [AddZeroClass A]
    [DecidableEq A] (x y : ι → A) :
    hammingNorm (x + y) + (Function.support x ∩ Function.support y).ncard +
        (Function.support x \ Function.support (x + y)).ncard =
      hammingNorm x + hammingNorm y :=
  TauCeti.hammingNorm_add_add_ncard_inter_add_ncard_sdiff x y

theorem hammingNorm_smul_eq_ncard_inter [Fintype ι] [DecidableEq F] (c : ι → F) (x : ι → F) :
    hammingNorm (c • x) = (Function.support c ∩ Function.support x).ncard :=
  TauCeti.hammingNorm_smul_eq_ncard_inter c x

theorem hammingNorm_smul [Fintype ι] [DecidableEq F] {a : F} (ha : a ≠ 0) (x : ι → F) :
    hammingNorm (a • x) = hammingNorm x :=
  _root_.hammingNorm_smul (fun _ ↦ IsSMulRegular.of_ne_zero ha) x

theorem hammingNorm_le_card [Fintype ι] [DecidableEq F] (x : ι → F) :
    hammingNorm x ≤ Fintype.card ι :=
  hammingNorm_le_card_fintype

/-- The pinned subtraction orientation: `dist(x, y) = wt(y - x)`. -/
theorem hammingDist_eq_hammingNorm_sub [Fintype ι] [DecidableEq F] (x y : ι → F) :
    hammingDist x y = hammingNorm (y - x) :=
  TauCeti.hammingDist_eq_hammingNorm_sub' x y

/-- **Minimum distance** of a set of words is the least distance between distinct words, and zero
for the zero code. A linear code has the minimum distance of its additive group. -/
theorem hammingMinDist_def [Fintype ι] [DecidableEq F] (C : LinearCode F ι) :
    (C : Set (ι → F)).hammingMinDist =
      sInf {d | ∃ x ∈ C, ∃ y ∈ C, x ≠ y ∧ hammingDist x y = d} :=
  Set.hammingMinDist_def _

theorem hammingMinDist_bot [Fintype ι] [DecidableEq F] :
    ((⊥ : LinearCode F ι) : Set (ι → F)).hammingMinDist = 0 := by
  rw [Submodule.bot_coe]
  exact Set.hammingMinDist_singleton 0

example [Fintype ι] [DecidableEq F] (C : LinearCode F ι) :
    (C : Set (ι → F)).hammingMinDist = (C.toAddSubgroup : Set (ι → F)).hammingMinDist := rfl

/-- For an additive (in particular a linear) code, minimum distance is the least nonzero weight,
attained by a nonzero word when the code is nonzero. -/
theorem hammingMinDist_eq_sInf_hammingNorm {A : Type*} [AddCommGroup A] [DecidableEq A]
    [Fintype ι] (E : AdditiveCode A ι) :
    (E : Set (ι → A)).hammingMinDist = sInf {d | ∃ x ∈ E, x ≠ 0 ∧ hammingNorm x = d} :=
  Set.hammingMinDist_eq_sInf_hammingNorm

theorem exists_hammingNorm_eq_hammingMinDist {A : Type*} [AddCommGroup A] [DecidableEq A]
    [Fintype ι] {E : AdditiveCode A ι} (hE : E ≠ ⊥) :
    ∃ x ∈ E, x ≠ 0 ∧ hammingNorm x = (E : Set (ι → A)).hammingMinDist :=
  Set.exists_hammingNorm_eq_hammingMinDist hE

theorem exists_hammingDist_eq_hammingMinDist [Fintype ι] [DecidableEq F] {C : LinearCode F ι}
    (hC : C ≠ ⊥) :
    ∃ x ∈ C, ∃ y ∈ C, x ≠ y ∧ hammingDist x y = (C : Set (ι → F)).hammingMinDist := by
  obtain ⟨x, hx, hx0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hC
  exact Set.exists_hammingDist_eq_hammingMinDist ⟨x, hx, 0, C.zero_mem, hx0⟩

/-- Invariance under Hamming isometries. -/
theorem hammingMinDist_image [Fintype ι] [Fintype κ] [DecidableEq F] {C : LinearCode F ι}
    (f : (ι → F) → (κ → F))
    (hf : ∀ x ∈ C, ∀ y ∈ C, x ≠ y → hammingDist (f x) (f y) = hammingDist x y) :
    (f '' (C : Set (ι → F))).hammingMinDist = (C : Set (ι → F)).hammingMinDist :=
  Set.hammingMinDist_image f hf

/-- **The `Set.infsep` bridge** to Mathlib's `Fin n` / `Hamming` interface of mathlib4#38014. -/
theorem hammingMinDist_eq_infsep_toHammingCode [Fintype ι] [DecidableEq F] (C : LinearCode F ι) :
    ((C : Set (ι → F)).hammingMinDist : ℝ) =
      (toHammingCode C : Set (Hamming (fun _ : ι ↦ F))).infsep :=
  TauCeti.hammingMinDist_eq_infsep_toHammingCode C

/-- The deleted-coordinate bound for puncturing, which the repetition code attains. -/
theorem hammingMinDist_le_hammingMinDist_puncture_add_card_compl [Fintype ι] [DecidableEq F]
    (C : LinearCode F ι) (s : Set ι) [DecidablePred (· ∈ s)] :
    (C : Set (ι → F)).hammingMinDist ≤
      (puncture C s : Set (s → F)).hammingMinDist + Fintype.card ↥sᶜ :=
  TauCeti.hammingMinDist_le_hammingMinDist_puncture_add_card_compl C s

theorem hammingMinDist_puncture_repetitionCode_add_card_compl [Fintype ι] [DecidableEq F]
    (s : Set ι) [DecidablePred (· ∈ s)] :
    (puncture (repetitionCode F ι) s : Set (s → F)).hammingMinDist + Fintype.card ↥sᶜ =
      (repetitionCode F ι : Set (ι → F)).hammingMinDist :=
  TauCeti.hammingMinDist_puncture_repetitionCode_add_card_compl s

/-- Shortening does not decrease minimum distance unless it collapses the code. -/
theorem hammingMinDist_le_hammingMinDist_shorten [Fintype ι] [DecidableEq F]
    (C : LinearCode F ι) (s : Set ι) [DecidablePred (· ∈ s)] (hS : shorten C s ≠ ⊥) :
    (C : Set (ι → F)).hammingMinDist ≤ (shorten C s : Set (s → F)).hammingMinDist :=
  TauCeti.hammingMinDist_le_hammingMinDist_shorten C s hS

/-- `d(C ⊕ D) = min (d C) (d D)` for two nonzero codes, and `d(C ⊕ 0) = d C`. -/
theorem hammingMinDist_directSum [Fintype ι] [Fintype κ] [DecidableEq F] (C : LinearCode F ι)
    (D : LinearCode F κ) (hC : C ≠ ⊥) (hD : D ≠ ⊥) :
    (C.directSum D : Set (ι ⊕ κ → F)).hammingMinDist =
      min (C : Set (ι → F)).hammingMinDist (D : Set (κ → F)).hammingMinDist :=
  TauCeti.hammingMinDist_directSum C D hC hD

theorem hammingMinDist_directSum_bot [Fintype ι] [Fintype κ] [DecidableEq F]
    (C : LinearCode F ι) :
    (C.directSum (⊥ : LinearCode F κ) : Set (ι ⊕ κ → F)).hammingMinDist =
      (C : Set (ι → F)).hammingMinDist :=
  TauCeti.hammingMinDist_directSum_bot C

/-! **The bounds for additive codes**, over any abelian alphabet such as `ZMod 4`: the
deleted-coordinate bound for puncturing, the shortening bound for a nonzero shortened code, and
the direct-sum formulae. -/
namespace AdditiveCode

variable {A : Type*} [AddCommGroup A] [DecidableEq A]

theorem hammingMinDist_le_hammingMinDist_puncture_add_card_compl [Fintype ι]
    (C : TauCeti.AdditiveCode A ι) (s : Set ι) [DecidablePred (· ∈ s)] :
    (C : Set (ι → A)).hammingMinDist ≤
      (TauCeti.AdditiveCode.puncture C s : Set (s → A)).hammingMinDist + Fintype.card ↥sᶜ :=
  TauCeti.AdditiveCode.hammingMinDist_le_hammingMinDist_puncture_add_card_compl C s

theorem hammingMinDist_le_hammingMinDist_shorten [Fintype ι] (C : TauCeti.AdditiveCode A ι)
    (s : Set ι) [DecidablePred (· ∈ s)] (hS : TauCeti.AdditiveCode.shorten C s ≠ ⊥) :
    (C : Set (ι → A)).hammingMinDist ≤
      (TauCeti.AdditiveCode.shorten C s : Set (s → A)).hammingMinDist :=
  TauCeti.AdditiveCode.hammingMinDist_le_hammingMinDist_shorten C s hS

theorem hammingMinDist_directSum [Fintype ι] [Fintype κ] (C : TauCeti.AdditiveCode A ι)
    (D : TauCeti.AdditiveCode A κ) (hC : C ≠ ⊥) (hD : D ≠ ⊥) :
    (C.directSum D : Set (ι ⊕ κ → A)).hammingMinDist =
      min (C : Set (ι → A)).hammingMinDist (D : Set (κ → A)).hammingMinDist :=
  AddSubgroup.hammingMinDist_directSum C D hC hD

theorem hammingMinDist_directSum_bot [Fintype ι] [Fintype κ] (C : TauCeti.AdditiveCode A ι) :
    (C.directSum (⊥ : TauCeti.AdditiveCode A κ) : Set (ι ⊕ κ → A)).hammingMinDist =
      (C : Set (ι → A)).hammingMinDist :=
  AddSubgroup.hammingMinDist_directSum_bot C

end AdditiveCode

/-- **Acceptance (Layer 2).** The binary repetition code `{00, 11}` has minimum distance two.
Retaining only its first coordinate leaves the zero code, of minimum distance zero, so the
shortening bound fails without `shorten C s ≠ ⊥`; and `{00, 11} ⊕ 0` has minimum distance two, not
`min 2 0`. -/
theorem repetitionCode_two_acceptance :
    (repetitionCode (ZMod 2) (Fin 2) : Set (Fin 2 → ZMod 2)) = {0, ![1, 1]} ∧
      (repetitionCode (ZMod 2) (Fin 2) : Set (Fin 2 → ZMod 2)).hammingMinDist = 2 ∧
      shorten (repetitionCode (ZMod 2) (Fin 2)) {0} = ⊥ ∧
      (shorten (repetitionCode (ZMod 2) (Fin 2)) {0} : Set (({0} : Set (Fin 2)) → ZMod 2)
        ).hammingMinDist = 0 ∧
      ((repetitionCode (ZMod 2) (Fin 2)).directSum (⊥ : LinearCode (ZMod 2) (Fin 1)) :
        Set (Fin 2 ⊕ Fin 1 → ZMod 2)).hammingMinDist = 2 ∧
      ((⊥ : LinearCode (ZMod 2) (Fin 1)) : Set (Fin 1 → ZMod 2)).hammingMinDist = 0 := by
  have hbot : shorten (repetitionCode (ZMod 2) (Fin 2)) {0} = ⊥ :=
    shorten_repetitionCode_eq_bot fun h ↦ by
      have h1 : (1 : Fin 2) ∈ ({0} : Set (Fin 2)) := h ▸ Set.mem_univ _
      simp at h1
  refine ⟨?_, by simp, hbot, ?_, ?_, hammingMinDist_bot⟩
  · ext x
    simp only [SetLike.mem_coe, mem_repetitionCode, Set.mem_insert_iff,
      Set.mem_singleton_iff]
    constructor
    · rintro ⟨a, rfl⟩
      fin_cases a <;> decide
    · rintro (rfl | rfl)
      · exact ⟨0, by decide⟩
      · exact ⟨1, by decide⟩
  · rw [hbot]
    exact hammingMinDist_bot
  · rw [TauCeti.hammingMinDist_directSum_bot]
    simp

/-- **The Euclidean dual.** The dot product is symmetric and a perfect pairing, and `C⊥` is its
`BilinForm.orthogonal`. -/
theorem isSymm_dotProductBilin [Fintype ι] :
    LinearMap.BilinForm.IsSymm (dotProductBilin F F : LinearMap.BilinForm F (ι → F)) :=
  TauCeti.isSymm_dotProductBilin

example [Fintype ι] :
    (dotProductBilin F F : (ι → F) →ₗ[F] (ι → F) →ₗ[F] F).IsPerfPair := inferInstance

example [Fintype ι] (C : LinearCode F ι) :
    C.euclideanDual = LinearMap.BilinForm.orthogonal (dotProductBilin F F) C := rfl

theorem mem_euclideanDual [Fintype ι] {C : LinearCode F ι} {y : ι → F} :
    y ∈ C.euclideanDual ↔ ∀ x ∈ C, x ⬝ᵥ y = 0 :=
  Submodule.mem_euclideanDual

theorem euclideanDual_antitone [Fintype ι] :
    Antitone (Submodule.euclideanDual (R := F) (ι := ι)) :=
  Submodule.euclideanDual_antitone

theorem isSelfOrthogonal_iff_le [Fintype ι] {C : LinearCode F ι} :
    C.IsSelfOrthogonal ↔ C ≤ C.euclideanDual :=
  Submodule.isSelfOrthogonal_iff_le

theorem isSelfDual_iff [Fintype ι] {C : LinearCode F ι} :
    C.IsSelfDual ↔ C = C.euclideanDual :=
  Submodule.isSelfDual_iff

theorem euclideanDual_euclideanDual [Fintype ι] (C : LinearCode F ι) :
    C.euclideanDual.euclideanDual = C :=
  Submodule.euclideanDual_euclideanDual C

theorem finrank_add_finrank_euclideanDual [Fintype ι] (C : LinearCode F ι) :
    Module.finrank F C + Module.finrank F C.euclideanDual = Fintype.card ι :=
  Submodule.finrank_add_finrank_euclideanDual C

theorem natCard_mul_natCard_euclideanDual [Fintype ι] (C : LinearCode F ι) :
    Nat.card C * Nat.card C.euclideanDual = Nat.card F ^ Fintype.card ι :=
  Submodule.natCard_mul_natCard_euclideanDual C

/-- Duality exchanges puncturing and shortening at the same retained set, and commutes with
direct sums. -/
theorem euclideanDual_puncture [Fintype ι] (s : Set ι) [Fintype s] (C : LinearCode F ι) :
    (puncture C s).euclideanDual = shorten C.euclideanDual s :=
  TauCeti.euclideanDual_puncture s C

theorem euclideanDual_shorten [Fintype ι] (s : Set ι) [Fintype s] (C : LinearCode F ι) :
    (shorten C s).euclideanDual = puncture C.euclideanDual s :=
  TauCeti.euclideanDual_shorten s C

theorem euclideanDual_directSum [Fintype ι] [Fintype κ] (C : LinearCode F ι)
    (D : LinearCode F κ) :
    (C.directSum D).euclideanDual = C.euclideanDual.directSum D.euclideanDual :=
  Submodule.euclideanDual_directSum C D

/-- The contragredient action: a monomial map with multipliers `u` carries `C⊥` to the dual of
the image with multipliers `u⁻¹`, and `Aut(C) ≃ Aut(C⊥)`. -/
theorem euclideanDual_map_monomialEquiv [Fintype ι] [Fintype κ] (u : ι → Fˣ) (e : ι ≃ κ)
    (C : LinearCode F ι) :
    (C.map (monomialEquiv u e : (ι → F) →ₗ[F] (κ → F))).euclideanDual =
      C.euclideanDual.map (monomialEquiv u⁻¹ e : (ι → F) →ₗ[F] (κ → F)) :=
  TauCeti.euclideanDual_map_monomialEquiv u e C

theorem coe_monomialAutEquivEuclideanDual_apply [Fintype ι] [DecidableEq ι] (C : LinearCode F ι)
    (f : monomialAut C) :
    (monomialAutEquivEuclideanDual C f : (ι → F) ≃ₗ[F] (ι → F)) =
      (f : (ι → F) ≃ₗ[F] (ι → F)).dotProductContragredient :=
  TauCeti.coe_monomialAutEquivEuclideanDual_apply C f

/-- **Hermitian duality** through the sesquilinear-form API, with the pinned orientation
`hσ(x, y) = ∑ xᵢ σ(yᵢ)`. -/
theorem sesquilinearForm_apply [Fintype ι] (σ : F ≃+* F) (x y : ι → F) :
    σ.sesquilinearForm x y = ∑ i, x i * σ (y i) :=
  RingEquiv.sesquilinearForm_apply σ x y

theorem nondegenerate_sesquilinearForm [Fintype ι] (σ : F ≃+* F) :
    (σ.sesquilinearForm (ι := ι)).Nondegenerate :=
  RingEquiv.nondegenerate_sesquilinearForm σ

example [Fintype ι] (σ : F ≃+* F) (C : LinearCode F ι) :
    σ.galoisDual C = C.orthogonalBilin σ.sesquilinearForm :=
  RingEquiv.galoisDual_def σ C

theorem mem_galoisDual [Fintype ι] (σ : F ≃+* F) (C : LinearCode F ι) (y : ι → F) :
    y ∈ σ.galoisDual C ↔ ∀ x ∈ C, ∑ i, x i * σ (y i) = 0 :=
  RingEquiv.mem_galoisDual σ C y

theorem galoisDual_galoisDual [Fintype ι] (σ : F ≃+* F) (hσ : Function.Involutive σ)
    (C : LinearCode F ι) : σ.galoisDual (σ.galoisDual C) = C :=
  RingEquiv.galoisDual_galoisDual σ hσ C

theorem finrank_add_finrank_galoisDual [Fintype ι] (σ : F ≃+* F) (C : LinearCode F ι) :
    Module.finrank F C + Module.finrank F (σ.galoisDual C) = Fintype.card ι :=
  RingEquiv.finrank_add_finrank_galoisDual σ C

/-- `rowspan(G) = C ⇔ ker(σ(G)) = C⊥_H`: the conjugated generator, not `G`, checks the Hermitian
dual. -/
theorem range_vecMulLinear_eq_iff_ker_map_eq_galoisDual [Fintype ι] (σ : F ≃+* F)
    (hσ : Function.Involutive σ) [Fintype ρ] (G : Matrix ρ ι F) (C : LinearCode F ι) :
    LinearMap.range G.vecMulLinear = C ↔ LinearMap.ker (G.map σ).mulVecLin = σ.galoisDual C :=
  RingEquiv.range_vecMulLinear_eq_iff_ker_map_eq_galoisDual_of_involutive σ hσ G C

/-- Frobenius `x ↦ x²` is an involution of a four-element field, and its Hermitian dual of a row
space is the kernel of the entrywise-squared generator. -/
theorem frobeniusEquiv_involutive {K : Type*} [Field K] [Fintype K] [CharP K 2]
    (hK : Fintype.card K = 4) : Function.Involutive (frobeniusEquiv K 2) :=
  have : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
  TauCeti.FiniteField.frobeniusEquiv_involutive (by rw [Nat.card_eq_fintype_card, hK]; norm_num)

theorem galoisDual_range_vecMulLinear_frobeniusEquiv [Fintype ι] {K : Type*} [Field K]
    [Finite K] [CharP K 2] (hK : Nat.card K = 2 ^ 2) [Fintype ρ] (G : Matrix ρ ι K) :
    (frobeniusEquiv K 2).galoisDual (LinearMap.range G.vecMulLinear) =
      LinearMap.ker (G.map (frobenius K 2)).mulVecLin :=
  have : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
  RingEquiv.galoisDual_range_vecMulLinear_frobeniusEquiv hK G

/-- **Finite bilinear alphabets.** The coordinate power sums the coordinate pairings; under
nondegeneracy the orthogonal additive code has the complementary cardinality and is reflexive.
The quadratic coordinate power sums the quadratic values. -/
theorem coordinatePower_pairing (A : FiniteBilinearModule) [Fintype ι] (x y : ι → A) :
    (A.coordinatePower ι).pairing x y = ∑ i, A.pairing (x i) (y i) :=
  FiniteBilinearModule.coordinatePower_pairing A ι x y

theorem mem_orthogonalComplement_coordinatePower_iff (A : FiniteBilinearModule) [Fintype ι]
    (C : AdditiveCode A ι) (x : ι → A) :
    x ∈ (A.coordinatePower ι).orthogonalComplement C ↔
      ∀ y ∈ C, ∑ i, A.pairing (x i) (y i) = 0 :=
  FiniteBilinearModule.mem_orthogonalComplement_coordinatePower_iff A ι C x

theorem natCard_mul_natCard_orthogonalComplement (A : FiniteBilinearModule) [Fintype ι]
    (hA : A.IsNondegenerate) (C : AdditiveCode A ι) :
    Nat.card C * Nat.card ((A.coordinatePower ι).orthogonalComplement C) = Nat.card (ι → A) :=
  FiniteBilinearModule.IsNondegenerate.card_mul_card_orthogonalComplement _
    (hA.coordinatePower ι) C

theorem orthogonalComplement_orthogonalComplement (A : FiniteBilinearModule) [Fintype ι]
    (hA : A.IsNondegenerate) (C : AdditiveCode A ι) :
    (A.coordinatePower ι).orthogonalComplement
        ((A.coordinatePower ι).orthogonalComplement C) = C :=
  FiniteBilinearModule.IsNondegenerate.orthogonalComplement_orthogonalComplement _
    (hA.coordinatePower ι) C

theorem coordinatePower_quadratic (A : FiniteQuadraticModule) [Fintype ι] (x : ι → A) :
    (A.coordinatePower ι).quadratic x = ∑ i, A.quadratic (x i) :=
  FiniteQuadraticModule.coordinatePower_quadratic A ι x

end Layer2

/-! ## Layer 3: weight enumerators and MacWilliams -/

section Layer3

variable {F ι κ : Type*} [Field F] [Fintype ι] [DecidableEq F]

/-- **The weight distribution** `A_w(C)` vanishes above the length, sums to `#C`, has `A₀ = 1`,
and is a monomial invariant. -/
theorem weightDistribution_def (C : LinearCode F ι) (w : ℕ) :
    (C : Set (ι → F)).weightDistribution w =
      Nat.card {x : ι → F // x ∈ C ∧ hammingNorm x = w} :=
  Set.weightDistribution_def _ w

theorem weightDistribution_eq_zero_of_card_lt (C : LinearCode F ι) {w : ℕ}
    (hw : Fintype.card ι < w) : (C : Set (ι → F)).weightDistribution w = 0 :=
  Set.weightDistribution_eq_zero_of_card_lt hw

theorem sum_weightDistribution [Finite F] (C : LinearCode F ι) :
    ∑ w ∈ Finset.range (Fintype.card ι + 1), (C : Set (ι → F)).weightDistribution w =
      Nat.card C :=
  Set.sum_weightDistribution (Set.toFinite _)

theorem weightDistribution_zero (C : LinearCode F ι) :
    (C : Set (ι → F)).weightDistribution 0 = 1 :=
  Set.weightDistribution_zero C.zero_mem

theorem IsMonomialEquivalent.weightDistribution_eq [Fintype κ] {C : LinearCode F ι}
    {D : LinearCode F κ} (h : IsMonomialEquivalent C D) (w : ℕ) :
    (C : Set (ι → F)).weightDistribution w = (D : Set (κ → F)).weightDistribution w :=
  TauCeti.IsMonomialEquivalent.weightDistribution_eq h w

/-- **The homogeneous enumerator** `W_C(X, Y) = ∑_{c ∈ C} X^(n - wt c) Y^(wt c)` in `ℤ[X, Y]`, with
`X = X 0` and `Y = X 1`; its coefficients, homogeneity, value at `(1, 1)`, one-variable
specialization, direct-sum product and recovery of minimum distance. -/
theorem weightEnumerator_eq_sum [Finite F] (C : LinearCode F ι) :
    (C : Set (ι → F)).weightEnumerator =
      ∑ c ∈ (Set.toFinite (C : Set (ι → F))).toFinset,
        X 0 ^ (Fintype.card ι - hammingNorm c) * X 1 ^ hammingNorm c :=
  Set.weightEnumerator_eq_sum _

theorem coeff_weightEnumerator (C : LinearCode F ι) (d : Fin 2 →₀ ℕ) :
    (C : Set (ι → F)).weightEnumerator.coeff d =
      if d 0 + d 1 = Fintype.card ι then ((C : Set (ι → F)).weightDistribution (d 1) : ℤ)
      else 0 :=
  Set.coeff_weightEnumerator _ d

theorem isHomogeneous_weightEnumerator (C : LinearCode F ι) :
    (C : Set (ι → F)).weightEnumerator.IsHomogeneous (Fintype.card ι) :=
  Set.isHomogeneous_weightEnumerator _

theorem eval_one_weightEnumerator [Finite F] (C : LinearCode F ι) :
    eval 1 (C : Set (ι → F)).weightEnumerator = Nat.card C :=
  Set.eval_one_weightEnumerator (Set.toFinite _)

theorem coeff_weightPolynomial (C : LinearCode F ι) (w : ℕ) :
    (C : Set (ι → F)).weightPolynomial.coeff w = (C : Set (ι → F)).weightDistribution w :=
  Set.coeff_weightPolynomial _ w

theorem aeval_weightEnumerator (C : LinearCode F ι) :
    aeval ![1, Polynomial.X] (C : Set (ι → F)).weightEnumerator =
      (C : Set (ι → F)).weightPolynomial :=
  Set.aeval_weightEnumerator _

theorem weightEnumerator_directSum [Finite F] [Fintype κ] (C : LinearCode F ι)
    (D : LinearCode F κ) :
    (C.directSum D : Set (ι ⊕ κ → F)).weightEnumerator =
      (C : Set (ι → F)).weightEnumerator * (D : Set (κ → F)).weightEnumerator :=
  Submodule.weightEnumerator_directSum C D

theorem hammingMinDist_eq_sInf_weightDistribution [Finite F] (C : LinearCode F ι) :
    (C : Set (ι → F)).hammingMinDist =
      sInf {w | 0 < w ∧ (C : Set (ι → F)).weightDistribution w ≠ 0} :=
  Set.hammingMinDist_eq_sInf_weightDistribution (E := C.toAddSubgroup) (Set.toFinite _)

/-- **Character orthogonality** for a code and its Euclidean dual, for any primitive additive
character, and the finite Fourier transform it gives. -/
theorem sum_addChar_dotProduct {R S : Type*} [CommRing R] [CommRing S] [IsDomain S]
    {ψ : AddChar R S} {C : Submodule R (ι → R)} [Fintype C]
    [DecidablePred (· ∈ C.euclideanDual)] (hψ : ψ.IsPrimitive) (y : ι → R) :
    ∑ c : C, ψ ((c : ι → R) ⬝ᵥ y) =
      if y ∈ C.euclideanDual then (Fintype.card C : S) else 0 :=
  Submodule.sum_addChar_dotProduct hψ y

theorem sum_sum_addChar_dotProduct_smul {R S : Type*} [CommRing R] [CommRing S] [IsDomain S]
    {ψ : AddChar R S} {C : Submodule R (ι → R)} [DecidableEq ι] [Fintype R] [Fintype C]
    [Fintype C.euclideanDual] {M : Type*} [AddCommMonoid M] [Module S M] (hψ : ψ.IsPrimitive)
    (f : (ι → R) → M) :
    ∑ c : C, ∑ y, ψ ((c : ι → R) ⬝ᵥ y) • f y =
      Fintype.card C • ∑ y : C.euclideanDual, f (y : ι → R) :=
  Submodule.sum_sum_addChar_dotProduct_smul hψ f

/-- Mathlib's primitive additive character of a finite field is primitive, which is the input
to the character-sum proof of MacWilliams. -/
example [Finite F] :
    (AddChar.FiniteField.primitiveChar F ℚ
      (by simpa [ringChar.eq_zero] using (CharP.ringChar_ne_zero_of_finite F).symm)).char
        |>.IsPrimitive :=
  (AddChar.FiniteField.primitiveChar F ℚ
    (by simpa [ringChar.eq_zero] using (CharP.ringChar_ne_zero_of_finite F).symm)).prim

/-- **The MacWilliams identity**, division-free in `ℤ[X, Y]`, for every finite field:
`#C · W_{C⊥}(X, Y) = W_C(X + (q - 1)Y, X - Y)`. -/
theorem natCard_mul_weightEnumerator_euclideanDual [Finite F] (C : LinearCode F ι) :
    (Nat.card C : MvPolynomial (Fin 2) ℤ) * (C.euclideanDual : Set (ι → F)).weightEnumerator =
      aeval ![X 0 + (Nat.card F - 1 : MvPolynomial (Fin 2) ℤ) * X 1, X 0 - X 1]
        (C : Set (ι → F)).weightEnumerator :=
  Submodule.natCard_mul_weightEnumerator_euclideanDual C

/-- The rational normalized form, evaluated in any commutative `ℚ`-algebra. -/
theorem aeval_weightEnumerator_euclideanDual [Finite F] (C : LinearCode F ι) {A : Type*}
    [CommRing A] [Algebra ℚ A] (x y : A) :
    aeval ![x, y] (C.euclideanDual : Set (ι → F)).weightEnumerator =
      (Nat.card C : ℚ)⁻¹ •
        aeval ![x + (Nat.card F - 1 : A) * y, x - y] (C : Set (ι → F)).weightEnumerator :=
  Submodule.aeval_weightEnumerator_euclideanDual C x y

/-- The Krawtchouk coefficient form. -/
theorem natCard_mul_weightDistribution_euclideanDual [Finite F] (w : ℕ) (C : LinearCode F ι) :
    (Nat.card C : ℤ) * (C.euclideanDual : Set (ι → F)).weightDistribution w =
      ∑ j ∈ Finset.range (Fintype.card ι + 1), (C : Set (ι → F)).weightDistribution j *
        krawtchouk (Nat.card F) (Fintype.card ι) w j :=
  TauCeti.natCard_mul_weightDistribution_euclideanDual w C

/-- A self-dual code's enumerator is invariant under the normalized MacWilliams transform. -/
theorem aeval_weightEnumerator_normalized_of_isSelfDual [Finite F] {C : LinearCode F ι}
    (hC : C.IsSelfDual) {A : Type*} [CommRing A] [Algebra ℝ A] (x y : A) :
    aeval ![(Real.sqrt (Nat.card F))⁻¹ • (x + (Nat.card F - 1 : A) * y),
        (Real.sqrt (Nat.card F))⁻¹ • (x - y)] (C : Set (ι → F)).weightEnumerator =
      aeval ![x, y] (C : Set (ι → F)).weightEnumerator :=
  Submodule.aeval_weightEnumerator_normalized_of_isSelfDual C hC x y

/-- MacWilliams checks on the zero, whole-space, repetition and single-parity-check codes. -/
theorem macWilliams_checks [Finite F] :
    aeval ![X 0 + (Nat.card F - 1 : MvPolynomial (Fin 2) ℤ) * X 1, X 0 - X 1]
        ((⊥ : LinearCode F ι) : Set (ι → F)).weightEnumerator =
      ((⊤ : LinearCode F ι) : Set (ι → F)).weightEnumerator ∧
    aeval ![X 0 + (Nat.card F - 1 : MvPolynomial (Fin 2) ℤ) * X 1, X 0 - X 1]
        ((⊤ : LinearCode F ι) : Set (ι → F)).weightEnumerator =
      (Nat.card F : MvPolynomial (Fin 2) ℤ) ^ Fintype.card ι *
        ((⊥ : LinearCode F ι) : Set (ι → F)).weightEnumerator ∧
    aeval ![X 0 + (Nat.card F - 1 : MvPolynomial (Fin 2) ℤ) * X 1, X 0 - X 1]
        (repetitionCode F ι : Set (ι → F)).weightEnumerator =
      (Nat.card (repetitionCode F ι) : MvPolynomial (Fin 2) ℤ) *
        (singleParityCheckCode F ι : Set (ι → F)).weightEnumerator ∧
    aeval ![X 0 + (Nat.card F - 1 : MvPolynomial (Fin 2) ℤ) * X 1, X 0 - X 1]
        (singleParityCheckCode F ι : Set (ι → F)).weightEnumerator =
      (Nat.card (singleParityCheckCode F ι) : MvPolynomial (Fin 2) ℤ) *
        (repetitionCode F ι : Set (ι → F)).weightEnumerator :=
  ⟨aeval_weightEnumerator_bot, aeval_weightEnumerator_top,
    aeval_weightEnumerator_repetitionCode F ι, aeval_weightEnumerator_singleParityCheckCode F ι⟩

end Layer3

/-! ## Layer 4: binary doubly-even and Type II codes -/

section Layer4

variable {ι κ : Type*} [Fintype ι]

/-- **The binary predicates**, none bundled into a code type. -/
theorem isEven_iff {C : LinearCode (ZMod 2) ι} :
    BinaryCode.IsEven C ↔ ∀ x ∈ C, Even (hammingNorm x) :=
  BinaryCode.isEven_iff

theorem isDoublyEven_iff {C : LinearCode (ZMod 2) ι} :
    BinaryCode.IsDoublyEven C ↔ ∀ x ∈ C, 4 ∣ hammingNorm x :=
  BinaryCode.isDoublyEven_iff

theorem isTypeII_iff {C : LinearCode (ZMod 2) ι} :
    BinaryCode.IsTypeII C ↔ BinaryCode.IsDoublyEven C ∧ C.IsSelfDual :=
  Iff.rfl

/-- Doubly even implies self-orthogonal, by the support-intersection identity
`wt(x + y) + 2 |supp x ∩ supp y| = wt x + wt y`. -/
theorem hammingNorm_add_add_two_mul_card_support_inter (x y : ι → ZMod 2) :
    hammingNorm (x + y) + 2 * (Finset.univ.filter (fun i ↦ x i ≠ 0 ∧ y i ≠ 0)).card =
      hammingNorm x + hammingNorm y :=
  TauCeti.hammingNorm_add_add_two_mul_card_support_inter x y

theorem IsDoublyEven.isSelfOrthogonal {C : LinearCode (ZMod 2) ι}
    (hC : BinaryCode.IsDoublyEven C) : C.IsSelfOrthogonal :=
  BinaryCode.IsDoublyEven.isSelfOrthogonal hC

/-- A binary self-dual code is even, contains the all-ones word, has dimension `n/2` and
`2^(n/2)` words. -/
theorem IsSelfDual.binary {C : LinearCode (ZMod 2) ι} (hC : C.IsSelfDual) :
    BinaryCode.IsEven C ∧ (1 : ι → ZMod 2) ∈ C ∧
      2 * Module.finrank (ZMod 2) C = Fintype.card ι ∧
      Nat.card C = 2 ^ (Fintype.card ι / 2) :=
  ⟨BinaryCode.isEven_of_isSelfOrthogonal hC.isSelfOrthogonal,
    BinaryCode.one_mem_of_isSelfDual hC, hC.two_mul_finrank_eq_card,
    by rw [hC.natCard_eq, Nat.card_zmod]⟩

/-- **Type II lengths are divisible by eight.** -/
theorem IsTypeII.eight_dvd_card {C : LinearCode (ZMod 2) ι} (hC : BinaryCode.IsTypeII C) :
    8 ∣ Fintype.card ι :=
  BinaryCode.IsTypeII.eight_dvd_card hC

/-- Closure under direct sums and permutations, and the behaviour under monomial and semilinear
maps, which over `F₂` collapse to permutations. -/
theorem isDoublyEven_directSum_iff [Fintype κ] {C : LinearCode (ZMod 2) ι}
    {D : LinearCode (ZMod 2) κ} :
    BinaryCode.IsDoublyEven (C.directSum D) ↔
      BinaryCode.IsDoublyEven C ∧ BinaryCode.IsDoublyEven D :=
  BinaryCode.isDoublyEven_directSum_iff

theorem isTypeII_directSum_iff [Fintype κ] {C : LinearCode (ZMod 2) ι}
    {D : LinearCode (ZMod 2) κ} :
    BinaryCode.IsTypeII (C.directSum D) ↔ BinaryCode.IsTypeII C ∧ BinaryCode.IsTypeII D :=
  BinaryCode.isTypeII_directSum_iff

theorem isTypeII_iff_of_isSemilinearEquivalent [Fintype κ] {C : LinearCode (ZMod 2) ι}
    {D : LinearCode (ZMod 2) κ} (h : IsSemilinearEquivalent C D) :
    BinaryCode.IsTypeII C ↔ BinaryCode.IsTypeII D :=
  BinaryCode.isTypeII_iff_of_isSemilinearEquivalent h

theorem isDoublyEven_iff_of_isSemilinearEquivalent [Fintype κ] {C : LinearCode (ZMod 2) ι}
    {D : LinearCode (ZMod 2) κ} (h : IsSemilinearEquivalent C D) :
    BinaryCode.IsDoublyEven C ↔ BinaryCode.IsDoublyEven D :=
  BinaryCode.isDoublyEven_iff_of_isSemilinearEquivalent h

omit [Fintype ι] in
theorem isSemilinearEquivalent_iff_isPermutationEquivalent {C : LinearCode (ZMod 2) ι}
    {D : LinearCode (ZMod 2) κ} : IsSemilinearEquivalent C D ↔ IsPermutationEquivalent C D :=
  isSemilinearEquivalent_iff_isMonomialEquivalent.trans
    isMonomialEquivalent_iff_isPermutationEquivalent

/-- **Specialized MacWilliams**: `W_C(X + Y, X - Y) = 2^(n/2) W_C(X, Y)` in `ℤ[X, Y]`, and
`W_C(X, iY) = W_C(X, Y)` in `ℂ[X, Y]`. -/
theorem aeval_weightEnumerator_add_sub_of_isSelfDual {C : LinearCode (ZMod 2) ι}
    (hC : C.IsSelfDual) :
    aeval ![X 0 + X 1, X 0 - X 1] (C : Set (ι → ZMod 2)).weightEnumerator =
      (2 : MvPolynomial (Fin 2) ℤ) ^ (Fintype.card ι / 2) *
        (C : Set (ι → ZMod 2)).weightEnumerator :=
  BinaryCode.aeval_weightEnumerator_add_sub_of_isSelfDual hC

theorem IsDoublyEven.aeval_weightEnumerator_mul_I {C : LinearCode (ZMod 2) ι}
    (hC : BinaryCode.IsDoublyEven C) :
    aeval ![(X 0 : MvPolynomial (Fin 2) ℂ), MvPolynomial.C Complex.I * X 1]
        (C : Set (ι → ZMod 2)).weightEnumerator =
      aeval ![(X 0 : MvPolynomial (Fin 2) ℂ), X 1] (C : Set (ι → ZMod 2)).weightEnumerator :=
  BinaryCode.IsDoublyEven.aeval_weightEnumerator_mul_I hC

end Layer4

/-! ## Layer 5: tetracode, hexacode, and the extended Golay codes -/

section Tetracode

/-- **The tetracode** is the row space of the displayed matrix over `ZMod 3`. -/
example : tetracodeGenerator = !![1, 0, 1, 1; 0, 1, 1, -1] := rfl

example : tetracode = tetracodeGenerator.generatedBy := rfl

/-- `[4, 2, 3]`, Euclidean self-dual (also through the generator/check interface), nonzero
weights `3`, and `W_T = X⁴ + 8XY³`. -/
theorem tetracode_spec :
    Module.finrank (ZMod 3) tetracode = 2 ∧
      (tetracode : Set (Fin 4 → ZMod 3)).hammingMinDist = 3 ∧
      tetracode.euclideanDual = tetracode ∧
      tetracodeGenerator.checkedBy = tetracode ∧
      (∀ x ∈ tetracode, x ≠ 0 → hammingNorm x = 3) ∧
      (tetracode : Set (Fin 4 → ZMod 3)).weightEnumerator = X 0 ^ 4 + 8 * X 0 * X 1 ^ 3 :=
  ⟨finrank_tetracode, hammingMinDist_tetracode, euclideanDual_tetracode,
    checkedBy_tetracodeGenerator,
    fun _ hx hx0 ↦ hammingNorm_eq_three_of_mem_tetracode_of_ne_zero hx hx0,
    weightEnumerator_tetracode⟩

end Tetracode

section Hexacode

variable {F : Type*} [Field F]

/-- **The hexacode** is the row space of the displayed matrix, for any root `ω` of
`X² + X + 1`; the named code over `GaloisField 2 2` takes a chosen root. -/
example (ω : F) :
    Hexacode.generatorMatrix ω = !![1, 0, 0, 1, ω, ω; 0, 1, 0, ω, 1, ω; 0, 0, 1, ω, ω, 1] :=
  rfl

example (ω : F) : Hexacode.code ω = (Hexacode.generatorMatrix ω).generatedBy := rfl

example : Hexacode.galoisFieldCode = Hexacode.code Hexacode.omega := rfl

theorem omega_sq_add_omega_add_one : Hexacode.omega ^ 2 + Hexacode.omega + 1 = 0 :=
  Hexacode.omega_sq_add_omega_add_one

/-- `[6, 3, 4]`, Hermitian self-dual, weights only `0`, `4`, `6`, and
`W_H = X⁶ + 45X²Y⁴ + 18Y⁶`; the Hermitian dual is also checked by `σ(G)`. -/
theorem hexacode_spec [Fintype F] [DecidableEq F] [CharP F 2] (hF : Fintype.card F = 4)
    {ω : F} (hω : ω ^ 2 + ω + 1 = 0) :
    Module.finrank F (Hexacode.code ω) = 3 ∧
      (Hexacode.code ω : Set (Fin 6 → F)).hammingMinDist = 4 ∧
      (frobeniusEquiv F 2).galoisDual (Hexacode.code ω) = Hexacode.code ω ∧
      ((Hexacode.generatorMatrix ω).map (frobenius F 2)).checkedBy = Hexacode.code ω ∧
      (∀ x ∈ Hexacode.code ω, hammingNorm x = 0 ∨ hammingNorm x = 4 ∨ hammingNorm x = 6) ∧
      (Hexacode.code ω : Set (Fin 6 → F)).weightEnumerator =
        X 0 ^ 6 + 45 * X 0 ^ 2 * X 1 ^ 4 + 18 * X 1 ^ 6 :=
  ⟨Hexacode.finrank_code ω, Hexacode.hammingMinDist_code hF hω,
    Hexacode.galoisDual_code hω (Nat.card_eq_fintype_card.trans hF),
    Hexacode.checkedBy_map_frobenius_generatorMatrix hω,
    fun _ hx ↦ Hexacode.hammingNorm_eq_zero_or_eq_four_or_eq_six_of_mem_code hF hω hx,
    Hexacode.weightEnumerator_code hF hω⟩

/-- The coordinatewise Frobenius conjugate of the hexacode at `ω` is the hexacode at `ω²`. -/
theorem mem_code_sq_iff [CharP F 2] (ω : F) (x : Fin 6 → F) :
    (fun i ↦ x i ^ 2) ∈ Hexacode.code (ω ^ 2) ↔ x ∈ Hexacode.code ω :=
  Hexacode.mem_code_sq_iff ω x

/-- The reordering is the one-line coordinate order `(c₁, c₂, c₄, c₆, c₃, c₅)`. -/
theorem funCongrLeft_conjugatePerm (x : Fin 6 → F) :
    LinearEquiv.funCongrLeft F F Hexacode.conjugatePerm x = ![x 0, x 1, x 3, x 5, x 2, x 4] := by
  funext i
  fin_cases i <;> rfl

/-- The conjugate code is genuinely different, meeting `H` in four words, and the reordering
carries it onto `H` as an actual permutation equivalence. -/
theorem hexacode_conjugate [Fintype F] [CharP F 2] (hF : Fintype.card F = 4) {ω : F}
    (hω : ω ^ 2 + ω + 1 = 0) :
    Hexacode.code ω ≠ Hexacode.code (ω ^ 2) ∧
      Nat.card ↥(Hexacode.code ω ⊓ Hexacode.code (ω ^ 2)) = 4 ∧
      (Hexacode.code (ω ^ 2)).map
          (LinearEquiv.funCongrLeft F F Hexacode.conjugatePerm).toLinearMap =
        Hexacode.code ω ∧
      IsPermutationEquivalent (Hexacode.code (ω ^ 2)) (Hexacode.code ω) :=
  ⟨Hexacode.code_ne_code_sq hω,
    (Hexacode.natCard_code_inf_code_sq hω).trans (Nat.card_eq_fintype_card.trans hF),
    Hexacode.map_code_sq_conjugatePerm hω, Hexacode.isPermutationEquivalent_code_sq hω⟩

/-- The convention check: the displayed generator has zero Hermitian Gram matrix but nonzero
Euclidean Gram matrix. -/
theorem hexacode_gram [CharP F 2] {ω : F} (hω : ω ^ 2 + ω + 1 = 0) :
    Hexacode.generatorMatrix ω * ((Hexacode.generatorMatrix ω).map (frobenius F 2))ᵀ = 0 ∧
      Hexacode.generatorMatrix ω * (Hexacode.generatorMatrix ω)ᵀ ≠ 0 :=
  ⟨Hexacode.generatorMatrix_mul_map_frobenius_transpose_eq_zero hω,
    Hexacode.generatorMatrix_mul_transpose_ne_zero hω⟩

end Hexacode

section BinaryGolay

/-- **The extended binary Golay code** is the row space of `[I₁₂ | B]`, with `B` the displayed
bordered reverse-circulant block of Huffman–Pless §1.9.1. -/
example : BinaryGolay.block =
    !![0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1;
       1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0;
       1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1;
       1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1;
       1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0;
       1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1;
       1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1;
       1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1;
       1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0;
       1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0;
       1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0;
       1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1] :=
  rfl

/-- The border and the quadratic-residue interior of `B`. -/
theorem block_apply (i j : Fin 12) :
    BinaryGolay.block i j = if i = 0 then (if j = 0 then 0 else 1) else if j = 0 then 1 else
      if (i.val + j.val - 2) % 11 ∈ ({0, 1, 3, 4, 5, 9} : Finset ℕ) then 1 else 0 :=
  BinaryGolay.block_apply i j

example : BinaryGolay.generator = fun i ↦
    Fin.append ((1 : Matrix (Fin 12) (Fin 12) (ZMod 2)) i) (BinaryGolay.block i) := rfl

example : BinaryGolay.code = BinaryGolay.generator.generatedBy := rfl

/-- Rank `12`, minimum distance `8`, self-dual (also through the generator/check interface),
doubly even, and the enumerator `X²⁴ + 759X¹⁶Y⁸ + 2576X¹²Y¹² + 759X⁸Y¹⁶ + Y²⁴`. -/
theorem binaryGolay_spec :
    BinaryGolay.generator.rank = 12 ∧
      Module.finrank (ZMod 2) BinaryGolay.code = 12 ∧
      (BinaryGolay.code : Set (Fin 24 → ZMod 2)).hammingMinDist = 8 ∧
      BinaryGolay.code.IsSelfDual ∧
      BinaryGolay.generator.checkedBy = BinaryGolay.code ∧
      BinaryCode.IsDoublyEven BinaryGolay.code ∧
      BinaryCode.IsTypeII BinaryGolay.code ∧
      (BinaryGolay.code : Set (Fin 24 → ZMod 2)).weightEnumerator =
        X 0 ^ 24 + 759 * X 0 ^ 16 * X 1 ^ 8 + 2576 * X 0 ^ 12 * X 1 ^ 12 +
          759 * X 0 ^ 8 * X 1 ^ 16 + X 1 ^ 24 :=
  ⟨BinaryGolay.rank_generator, BinaryGolay.finrank_code, BinaryGolay.hammingMinDist_code,
    BinaryGolay.isSelfDual_code, BinaryGolay.checkedBy_generator, BinaryGolay.isDoublyEven_code,
    BinaryGolay.isTypeII_code, BinaryGolay.weightEnumerator_code⟩

/-- Puncturing any coordinate gives a `[23, 12, 7]` code, whose parity extension is
permutation-equivalent to `G₂₄`. -/
theorem binaryGolay_punctureAt (i : Fin 24) :
    (Fintype.card ({i}ᶜ : Set (Fin 24)),
        Module.finrank (ZMod 2) (punctureAt BinaryGolay.code i),
        (punctureAt BinaryGolay.code i : Set (({i}ᶜ : Set (Fin 24)) → ZMod 2)).hammingMinDist) =
      (23, 12, 7) ∧
      IsPermutationEquivalent (parityExtension (punctureAt BinaryGolay.code i))
        BinaryGolay.code :=
  ⟨BinaryGolay.parameters_punctureAt_code i,
    BinaryGolay.isPermutationEquivalent_parityExtension_punctureAt_code i⟩

end BinaryGolay

section TernaryGolay

/-- **The extended ternary Golay code** is the row space of `[I₆ | A]` over `ZMod 3`. -/
example : TernaryGolay.generator =
    !![1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1;
       0, 1, 0, 0, 0, 0, 1, 0, 1, 2, 2, 1;
       0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 2, 2;
       0, 0, 0, 1, 0, 0, 1, 2, 1, 0, 1, 2;
       0, 0, 0, 0, 1, 0, 1, 2, 2, 1, 0, 1;
       0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 1, 0] :=
  rfl

example : TernaryGolay.code = TernaryGolay.generator.generatedBy := rfl

/-- `[12, 6, 6]`, Euclidean self-dual (also through the generator/check interface), every weight
divisible by `3`, and `W = X¹² + 264X⁶Y⁶ + 440X³Y⁹ + 24Y¹²`. -/
theorem ternaryGolay_spec :
    Module.finrank (ZMod 3) TernaryGolay.code = 6 ∧
      (TernaryGolay.code : Set (Fin 12 → ZMod 3)).hammingMinDist = 6 ∧
      TernaryGolay.code.IsSelfDual ∧
      TernaryGolay.generator.checkedBy = TernaryGolay.code ∧
      (∀ x ∈ TernaryGolay.code, 3 ∣ hammingNorm x) ∧
      (TernaryGolay.code : Set (Fin 12 → ZMod 3)).weightEnumerator =
        X 0 ^ 12 + 264 * X 0 ^ 6 * X 1 ^ 6 + 440 * X 0 ^ 3 * X 1 ^ 9 + 24 * X 1 ^ 12 :=
  ⟨TernaryGolay.finrank_code, TernaryGolay.hammingMinDist_code, TernaryGolay.isSelfDual_code,
    TernaryGolay.checkedBy_generator, fun _ hx ↦ TernaryGolay.three_dvd_hammingNorm hx,
    TernaryGolay.weightEnumerator_code⟩

end TernaryGolay

/-! ## Layer 6: Construction A with exact hypotheses -/

section Layer6

open ConstructionA

variable (m : ℕ+) {ι κ : Type*}

/-- **The Construction A carrier** `P_m(C) = ρ_m⁻¹(C)`, in `ℚ^ι`, is a full `ℤ`-lattice for every
additive code `C`, with form `B_m(x, y) = (x ⬝ᵥ y)/m`. -/
theorem mem_lattice {C : AdditiveCode (ZMod m) ι} {x : ι → ℚ} :
    x ∈ lattice m C ↔ ∃ z : ι → ℤ, (fun i ↦ (z i : ZMod m)) ∈ C ∧ (fun i ↦ (z i : ℚ)) = x :=
  ConstructionA.mem_lattice m

example [Finite ι] (C : AdditiveCode (ZMod m) ι) : (lattice m C).IsLattice ℚ := inferInstance

theorem form_apply [Fintype ι] (x y : ι → ℚ) : form m x y = (x ⬝ᵥ y) / m :=
  ConstructionA.form_apply m x y

/-- `P_m(C)` is integral exactly when `C ≤ C⊥`, and then bundles as an `IntegralLattice` with
that carrier and form. -/
theorem lattice_le_dualSubmodule_iff [Fintype ι] (C : AdditiveCode (ZMod m) ι) :
    lattice m C ≤ (form m).dualSubmodule (lattice m C) ↔
      AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual :=
  ConstructionA.lattice_le_dualSubmodule_iff m C

theorem integralLattice_carrier_form [Fintype ι] (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual) :
    (integralLattice m C hC).carrier = lattice m C ∧ (integralLattice m C hC).form = form m :=
  ⟨integralLattice_carrier m C hC, integralLattice_form m C hC⟩

/-- The literal carrier identity `P_m(C)^∨ = P_m(C⊥)`, for every `C`. -/
theorem dualSubmodule_lattice [Fintype ι] (C : AdditiveCode (ZMod m) ι) :
    (form m).dualSubmodule (lattice m C) =
      lattice m (AddSubgroup.toZModSubmodule m C).euclideanDual.toAddSubgroup :=
  ConstructionA.dualSubmodule_lattice m C

/-- After scalar extension to `ℝ`, `B_m` is the dot product, and `P_m(C)` becomes the usual
`m^(-1/2) P_m(C)`. -/
noncomputable example [Fintype ι] :
    ((form m (ι := ι)).baseChange ℝ).IsometryEquiv (dotProductBilin (m := ι) ℝ ℝ) :=
  realNormalizationIsometry m

theorem image_realNormalizationIsometry_lattice [Fintype ι] (C : AdditiveCode (ZMod m) ι) :
    (fun x ↦ realNormalizationIsometry m (1 ⊗ₜ[ℚ] x)) '' (lattice m C : Set (ι → ℚ)) =
      (realLattice m C : Set (ι → ℝ)) :=
  ConstructionA.image_realNormalizationIsometry_lattice m C

theorem mem_realLattice {C : AdditiveCode (ZMod m) ι} {x : ι → ℝ} :
    x ∈ realLattice m C ↔
      ∃ z : ι → ℤ, (fun i ↦ (z i : ZMod m)) ∈ C ∧
        (fun i ↦ (z i : ℝ) / Real.sqrt (m : ℝ)) = x :=
  ConstructionA.mem_realLattice m

/-- **The discriminant** `disc P_m(C) = m^n / #C²`, with the divisibility, and `p^(n - 2k)` for
a linear `[n, k]` code over `ZMod p`. -/
theorem integralLattice_discriminant [Fintype ι] (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual) :
    (integralLattice m C hC).discriminant * Nat.card C ^ 2 = (m : ℕ) ^ Fintype.card ι ∧
      Nat.card C ^ 2 ∣ (m : ℕ) ^ Fintype.card ι ∧
      (integralLattice m C hC).discriminant = (m : ℕ) ^ Fintype.card ι / Nat.card C ^ 2 :=
  ⟨integralLattice_discriminant_mul_natCard_sq m C hC, natCard_sq_dvd_modulus_pow_card m C hC,
    ConstructionA.integralLattice_discriminant m C hC⟩

theorem integralLattice_discriminant_of_prime [Fintype ι] {p : ℕ} [hp : Fact p.Prime]
    (C : Submodule (ZMod p) (ι → ZMod p)) (hC : C ≤ C.euclideanDual) :
    (integralLattice ⟨p, hp.out.pos⟩ C.toAddSubgroup hC).discriminant =
      p ^ (Fintype.card ι - 2 * Module.finrank (ZMod p) C) :=
  ConstructionA.integralLattice_discriminant_of_prime C hC

/-- An integral `P_m(C)` is unimodular exactly when `C = C⊥`. -/
theorem isUnimodular_integralLattice_iff [Fintype ι] (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual) :
    (integralLattice m C hC).IsUnimodular ↔
      AddSubgroup.toZModSubmodule m C = (AddSubgroup.toZModSubmodule m C).euclideanDual :=
  ConstructionA.isUnimodular_integralLattice_iff m C hC

/-- **The residue quadratic form** `q_m(c) = ∑ lift(cᵢ)²/(2m) mod ℤ` for even `m`: its value on
any integer lift, hence independence of the lift, and its polar form, the coordinate pairing
`∑ lift(xᵢ) lift(yᵢ)/m`. -/
theorem coordinatePower_zmodStandard_quadratic [Fintype ι] (hm : Even (m : ℕ))
    (x : ι → ZMod m) :
    ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).quadratic x =
      (((∑ i, ((x i).val : ℚ) ^ 2) / (2 * (m : ℕ)) : ℚ) : AddCircle (1 : ℚ)) :=
  TauCeti.coordinatePower_zmodStandard_quadratic (m : ℕ) hm x

theorem quadratic_lift_independent [Fintype ι] (hm : Even (m : ℕ)) (z z' : ι → ℤ)
    (h : ∀ i, (z i : ZMod m) = z' i) :
    (((∑ i, (z i : ℚ) ^ 2) / (2 * (m : ℕ)) : ℚ) : AddCircle (1 : ℚ)) =
      (((∑ i, (z' i : ℚ) ^ 2) / (2 * (m : ℕ)) : ℚ) : AddCircle (1 : ℚ)) := by
  rw [← TauCeti.coordinatePower_zmodStandard_quadratic_intCast (m : ℕ) hm z,
    ← TauCeti.coordinatePower_zmodStandard_quadratic_intCast (m : ℕ) hm z']
  exact congrArg _ (funext h)

theorem polar_coordinatePower_zmodStandard [Fintype ι] (hm : Even (m : ℕ)) (a b : ι → ℤ) :
    QuadraticMap.polar ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).quadratic
        (fun i ↦ (a i : ZMod m)) (fun i ↦ (b i : ZMod m)) =
      (((∑ i, (a i : ℚ) * (b i : ℚ)) / (m : ℕ) : ℚ) : AddCircle (1 : ℚ)) := by
  rw [FiniteQuadraticModule.polar_eq_pairing]
  exact TauCeti.coordinatePower_zmodStandard_pairing_intCast (m : ℕ) a b

/-- For even `m`, `P_m(C)` is even exactly when `q_m` vanishes on `C`; for odd `m` and nonempty `ι`
it is never even. -/
theorem isEven_integralLattice_iff [Fintype ι] (hm : Even (m : ℕ)) (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual) :
    (integralLattice m C hC).IsEven ↔
      ∀ x ∈ C, ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).quadratic x =
        0 :=
  isEven_integralLattice_iff_isIsotropic m hm C hC

theorem not_isEven_integralLattice_of_odd [Fintype ι] (hm : Odd (m : ℕ)) [Nonempty ι]
    (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual) :
    ¬ (integralLattice m C hC).IsEven :=
  ConstructionA.not_isEven_integralLattice_of_odd m hm C hC

/-- **At `m = 2`**, `q₂ = wt/4`, so evenness is double evenness, and a self-orthogonal binary code
has an even unimodular lattice exactly when it is Type II; every `P_m(C)` is positive definite. -/
theorem coordinatePower_zmodStandard_two_quadratic [Fintype ι] (x : ι → ZMod 2) :
    ((FiniteQuadraticModule.zmodStandard 2 even_two).coordinatePower ι).quadratic x =
      (((hammingNorm x : ℚ) / 4 : ℚ) : AddCircle (1 : ℚ)) :=
  TauCeti.coordinatePower_zmodStandard_two_quadratic x

theorem isPosDef_integralLattice [Fintype ι] (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual) :
    (integralLattice m C hC).IsPosDef :=
  ConstructionA.isPosDef_integralLattice m C hC

theorem isEven_and_isUnimodular_integralLattice_two_iff_isTypeII [Fintype ι]
    (C : LinearCode (ZMod 2) ι) (hC : C.IsSelfOrthogonal) :
    (integralLattice 2 C.toAddSubgroup
        ((toZModSubmodule_toAddSubgroup_le_euclideanDual_iff 2 C).mpr hC)).IsEven ∧
      (integralLattice 2 C.toAddSubgroup
        ((toZModSubmodule_toAddSubgroup_le_euclideanDual_iff 2 C).mpr hC)).IsUnimodular ↔
      BinaryCode.IsTypeII C :=
  ConstructionA.isEven_and_isUnimodular_integralLattice_two_iff_isTypeII C hC

/-- **Acceptance (Layer 6).** The Construction A lattice of `G₂₄` is positive definite, even and
unimodular. -/
theorem binaryGolay_constructionA :
    BinaryGolay.constructionALattice = integralLattice 2 BinaryGolay.code.toAddSubgroup
        (TwoPowCode.isTypeII_one_iff.mpr BinaryGolay.isTypeII_code).le_euclideanDual ∧
      BinaryGolay.constructionALattice.IsPosDef ∧ BinaryGolay.constructionALattice.IsEven ∧
      BinaryGolay.constructionALattice.IsUnimodular :=
  ⟨BinaryGolay.constructionALattice_eq_integralLattice, BinaryGolay.isPosDef_constructionALattice,
    BinaryGolay.isEven_constructionALattice, BinaryGolay.isUnimodular_constructionALattice⟩

/-- **Type II over `ℤ/2^r` only**: self-dual with Euclidean weights (least absolute
representatives) divisible by `2^(r+1)`, exactly the self-orthogonal codes with an even unimodular
lattice. -/
theorem twoPow_isTypeII_iff [Fintype ι] {r : ℕ} {C : AdditiveCode (ZMod (2 ^ r)) ι} :
    TwoPowCode.IsTypeII r C ↔
      AddSubgroup.toZModSubmodule (2 ^ r) C =
          (AddSubgroup.toZModSubmodule (2 ^ r) C).euclideanDual ∧
        ∀ x ∈ C, 2 ^ (r + 1) ∣ ∑ i, (x i).valMinAbs.natAbs ^ 2 :=
  TwoPowCode.isTypeII_iff

theorem isEven_and_isUnimodular_integralLattice_iff_isTypeII [Fintype ι] {r : ℕ} (hr : r ≠ 0)
    (C : AdditiveCode (ZMod (2 ^ r)) ι)
    (hC : AddSubgroup.toZModSubmodule (2 ^ r) C ≤
      (AddSubgroup.toZModSubmodule (2 ^ r) C).euclideanDual) :
    (integralLattice (2 ^ r) C hC).IsEven ∧ (integralLattice (2 ^ r) C hC).IsUnimodular ↔
      TwoPowCode.IsTypeII r C :=
  ConstructionA.isEven_and_isUnimodular_integralLattice_iff_isTypeII hr C hC

/-- **Naturality.** Relabelling coordinates and signed coordinate changes induce isometries
acting by the coordinate formula; a monomial code map over `ZMod m` lifts to a signed lattice
isometry exactly when its multipliers are `±1`, and a rational monomial map preserves `B_m`
exactly when it is signed. -/
theorem lattice_reindex (C : AdditiveCode (ZMod m) ι) (e : κ ≃ ι) :
    (lattice m C).map
        (((LinearEquiv.funCongrLeft ℚ ℚ e).toLinearMap).restrictScalars ℤ :
          (ι → ℚ) →ₗ[ℤ] (κ → ℚ)) =
      lattice m (AdditiveCode.reindex C e) :=
  ConstructionA.lattice_reindex C e

theorem integralLatticeReindexEquiv_apply [Fintype ι] [Fintype κ] (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual)
    (e : κ ≃ ι) (x : ι → ℚ) : integralLatticeReindexEquiv C hC e x = x ∘ e :=
  ConstructionA.integralLatticeReindexEquiv_apply C hC e x

theorem integralLatticeSignedEquiv_apply [Fintype ι] [Fintype κ] (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual)
    (u : ι → ℤˣ) (e : ι ≃ κ) (x : ι → ℚ) :
    integralLatticeSignedEquiv C hC u e x = signedEquiv u e x :=
  ConstructionA.integralLatticeSignedEquiv_apply C hC u e x

theorem monomialEquiv_preserves_form_iff_exists_signed [Fintype ι] [Fintype κ] (u : ι → ℚˣ)
    (e : ι ≃ κ) :
    (∀ x y : ι → ℚ, form m (monomialEquiv u e x) (monomialEquiv u e y) = form m x y) ↔
      ∃ v : ι → ℤˣ, monomialEquiv u e = signedEquiv v e :=
  ConstructionA.monomialEquiv_preserves_form_iff_exists_signed m u e

theorem exists_signedEquiv_and_integralLatticeIsometry_iff [Fintype ι] [Fintype κ]
    (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual)
    (u : ι → (ZMod m)ˣ) (e : ι ≃ κ) :
    (∃ v : ι → ℤˣ, monomialEquiv u e = signedEquiv v e ∧
      ∃ hD : AddSubgroup.toZModSubmodule m
          (C.map (monomialEquiv u e).toAddEquiv.toAddMonoidHom) ≤
            (AddSubgroup.toZModSubmodule m
              (C.map (monomialEquiv u e).toAddEquiv.toAddMonoidHom)).euclideanDual,
        ∃ f : IntegralLattice.Isometry (integralLattice m C hC)
            (integralLattice m (C.map (monomialEquiv u e).toAddEquiv.toAddMonoidHom) hD),
          ∀ x : ι → ℚ, f x = signedEquiv v e x) ↔
      ∀ i, u i = 1 ∨ u i = -1 :=
  ConstructionA.exists_signedEquiv_and_integralLatticeIsometry_iff C hC u e

end Layer6

/-! ## Layer 7: codes as isotropic discriminant subgroups -/

section Layer7

open ConstructionA IntegralLattice

variable (m : ℕ+) (ι : Type*) [Fintype ι]

/-- **The zero-code lattice** `L₀ = mℤ^ι` with form `B_m`, and its dual `ℤ^ι`. -/
theorem zeroLattice_spec :
    (zeroLattice m ι).carrier = lattice m (⊥ : AddSubgroup (ι → ZMod m)) ∧
      (zeroLattice m ι).form = form m ∧
      (∀ z : ι → ℤ, (fun i ↦ (z i : ℚ)) ∈ (zeroLattice m ι).carrier ↔
        ∀ i, ((m : ℕ) : ℤ) ∣ z i) ∧
      ∀ x : ι → ℚ, x ∈ (zeroLattice m ι).dualCarrier ↔ ∃ z : ι → ℤ, (fun i ↦ (z i : ℚ)) = x :=
  ⟨zeroLattice_carrier m ι, zeroLattice_form m ι, intCast_mem_zeroLattice_carrier_iff m ι,
    fun _ ↦ mem_zeroLattice_dualCarrier_iff m ι⟩

/-- `A_{L₀} ≅ (ZMod m)^ι` sends the class of an integer vector to its reduction, carrying the
discriminant pairing to `∑ lift(xᵢ) lift(yᵢ)/m` and, for even `m`, the half-norm quadratic form to
`q_m`. -/
theorem discriminantEquiv_mk_intCast (z : ι → ℤ) :
    discriminantEquiv m ι (Submodule.Quotient.mk (dualCarrierIntEquiv m ι z)) =
      fun i ↦ ((z i : ZMod (m : ℕ))) :=
  ConstructionA.discriminantEquiv_mk_intCast m ι z

noncomputable example : FiniteBilinearModule.Isometry (zeroLattice m ι).discriminantBilinearModule
    ((FiniteBilinearModule.zmodStandard (m : ℕ)).coordinatePower ι) :=
  discriminantIsometry m ι

theorem discriminantIsometry_apply (x : (zeroLattice m ι).DiscriminantGroup) :
    discriminantIsometry m ι x = discriminantEquiv m ι x :=
  ConstructionA.discriminantIsometry_apply m ι x

theorem zeroLattice_discriminantPairing_mk_intCast (z w : ι → ℤ) :
    (zeroLattice m ι).discriminantPairing
        (Submodule.Quotient.mk (dualCarrierIntEquiv m ι z))
        (Submodule.Quotient.mk (dualCarrierIntEquiv m ι w)) =
      (((∑ i, (z i : ℚ) * (w i : ℚ)) / m : ℚ) : AddCircle (1 : ℚ)) :=
  ConstructionA.zeroLattice_discriminantPairing_mk_intCast m ι z w

noncomputable example (hm : Even (m : ℕ)) : FiniteQuadraticModule.Isometry
    ((zeroLattice m ι).discriminantQuadraticModule (isEven_zeroLattice m ι hm))
    ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι) :=
  discriminantQuadraticIsometry m ι hm

theorem discriminantQuadraticIsometry_apply (hm : Even (m : ℕ))
    (x : (zeroLattice m ι).DiscriminantGroup) :
    discriminantQuadraticIsometry m ι hm x = discriminantEquiv m ι x :=
  ConstructionA.discriminantQuadraticIsometry_apply m ι hm x

theorem zeroLattice_discriminantQuadraticMap_mk_intCast (hm : Even (m : ℕ)) (z : ι → ℤ) :
    (zeroLattice m ι).discriminantQuadraticMap (isEven_zeroLattice m ι hm)
        (Submodule.Quotient.mk (dualCarrierIntEquiv m ι z)) =
      (((∑ i, (z i : ℚ) ^ 2) / (2 * m) : ℚ) : AddCircle (1 : ℚ)) :=
  ConstructionA.zeroLattice_discriminantQuadraticMap_mk_intCast m ι hm z

/-- **Codes in the discriminant group.** The code is the inverse image under the displayed
isometry; its orthogonal complement is the inverse image of `C⊥`; bilinear isotropy is
`C ≤ C⊥` and, for even `m`, quadratic isotropy is `q_m|_C = 0`. -/
example (C : AdditiveCode (ZMod m) ι) :
    codeInZeroLatticeDiscriminantGroup m ι C = C.comap (discriminantEquiv m ι).toAddEquiv :=
  rfl

theorem orthogonalComplement_codeInZeroLatticeDiscriminantBilinearModule
    (C : AdditiveCode (ZMod m) ι) :
    (zeroLattice m ι).discriminantBilinearModule.orthogonalComplement
        (codeInZeroLatticeDiscriminantBilinearModule m ι C) =
      codeInZeroLatticeDiscriminantBilinearModule m ι
        (AddSubgroup.toZModSubmodule m C).euclideanDual.toAddSubgroup :=
  ConstructionA.orthogonalComplement_codeInZeroLatticeDiscriminantBilinearModule m ι C

theorem isIsotropic_codeInZeroLatticeDiscriminantBilinearModule_iff_le_euclideanDual
    (C : AdditiveCode (ZMod m) ι) :
    (zeroLattice m ι).discriminantBilinearModule.IsIsotropic
        (codeInZeroLatticeDiscriminantBilinearModule m ι C) ↔
      AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual :=
  ConstructionA.isIsotropic_codeInZeroLatticeDiscriminantBilinearModule_iff_le_euclideanDual m ι C

theorem isIsotropic_codeInZeroLatticeDiscriminantQuadraticModule_iff (hm : Even (m : ℕ))
    (C : AdditiveCode (ZMod m) ι) :
    ((zeroLattice m ι).discriminantQuadraticModule (isEven_zeroLattice m ι hm)).IsIsotropic
        (codeInZeroLatticeDiscriminantGroup m ι C) ↔
      ∀ x ∈ C, ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).quadratic x =
        0 :=
  ConstructionA.isIsotropic_codeInZeroLatticeDiscriminantQuadraticModule_iff m ι hm C

/-- **The preimage lattice is `P_m(C)`.** For any `m` and any self-orthogonal `C`, the inverse-image
intermediate carrier of `L₀` is integral and its integral lattice is `P_m(C)` itself. This is the
general bilinear comparison; `P_m(C)` need not be even (`{00, 11}` for `m = 2` gives an odd
lattice). -/
theorem toIntegralLattice_codeInZeroLatticeDiscriminantGroup_eq_integralLattice
    (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual) :
    ((zeroLattice m ι).isIntegral_intermediateCarrierOfDiscriminantSubgroup_iff _ |>.mpr
        (isIsotropic_codeInZeroLatticeDiscriminantGroup m ι C hC)).toIntegralLattice =
      integralLattice m C hC :=
  ConstructionA.toIntegralLattice_codeInZeroLatticeDiscriminantGroup_eq_integralLattice m ι C hC

/-- The even-lattice gluing `L₀.ofIsotropicSubgroup` needs `m` even and `q_m|_C = 0`; it is then
`P_m(C)` itself, which is stronger than an isometry. -/
theorem ofIsotropicSubgroup_codeInZeroLatticeDiscriminantGroup_eq_integralLattice
    (hm : Even (m : ℕ)) (C : AdditiveCode (ZMod m) ι)
    (hC : ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).IsIsotropic C) :
    (zeroLattice m ι).ofIsotropicSubgroup (isEven_zeroLattice m ι hm)
        (codeInZeroLatticeDiscriminantGroup m ι C)
        ((ConstructionA.isIsotropic_codeInZeroLatticeDiscriminantQuadraticModule_iff m ι hm C).mpr
          hC) =
      integralLattice m C
        ((isIsotropic_coordinatePower_zmodStandard_iff_le_euclideanDual (m : ℕ) C).mp
          hC.toFiniteBilinearModule) :=
  ConstructionA.ofIsotropicSubgroup_codeInZeroLatticeDiscriminantGroup_eq_integralLattice m ι hm C
    hC

/-- **`A_{P_m(C)} ≅ C⊥/C`** for isotropic `C`, as finite bilinear modules and, for even `m` and
`q_m|_C = 0`, as finite quadratic modules. The quotient is the actual quotient of `C⊥` by `C`. -/
noncomputable example (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual) :
    FiniteBilinearModule.Isometry (integralLattice m C hC).discriminantBilinearModule
      (((FiniteBilinearModule.zmodStandard (m : ℕ)).coordinatePower ι).orthogonalQuotient C) :=
  discriminantBilinearOrthogonalQuotientIsometry m ι C hC

theorem orthogonalQuotientMk_ker (A : FiniteBilinearModule) (H : AddSubgroup A) :
    (A.orthogonalQuotientMk H).ker = H.addSubgroupOf (A.orthogonalComplement H) :=
  FiniteBilinearModule.orthogonalQuotientMk_ker A H

theorem discriminantBilinearOrthogonalQuotientIsometry_mk_intCast (C : AdditiveCode (ZMod m) ι)
    (hC : AddSubgroup.toZModSubmodule m C ≤ (AddSubgroup.toZModSubmodule m C).euclideanDual)
    (z : ι → ℤ) (hz : (fun i ↦ (z i : ℚ)) ∈ (integralLattice m C hC).dualCarrier) :
    discriminantBilinearOrthogonalQuotientIsometry m ι C hC (Submodule.Quotient.mk ⟨_, hz⟩) =
      ((FiniteBilinearModule.zmodStandard (m : ℕ)).coordinatePower ι).orthogonalQuotientMk C
        ⟨fun i ↦ (z i : ZMod m), (intCast_mem_integralLattice_dualCarrier_iff m ι C hC z).mp hz⟩ :=
  ConstructionA.discriminantBilinearOrthogonalQuotientIsometry_mk_intCast m ι C hC z hz

noncomputable example (hm : Even (m : ℕ)) (C : AdditiveCode (ZMod m) ι)
    (hC : ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).IsIsotropic C) :
    FiniteQuadraticModule.Isometry
      ((integralLattice m C
          ((isIsotropic_coordinatePower_zmodStandard_iff_le_euclideanDual (m : ℕ) C).mp
            hC.toFiniteBilinearModule)).discriminantQuadraticModule
        ((isEven_integralLattice_iff_isIsotropic m hm C _).mpr hC))
      (((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).orthogonalQuotient
        C hC) :=
  discriminantOrthogonalQuotientIsometry m ι hm C hC

theorem discriminantOrthogonalQuotientIsometry_mk_intCast (hm : Even (m : ℕ))
    (C : AdditiveCode (ZMod m) ι)
    (hC : ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).IsIsotropic C)
    (z : ι → ℤ)
    (hz : (fun i ↦ (z i : ℚ)) ∈ (integralLattice m C
      ((isIsotropic_coordinatePower_zmodStandard_iff_le_euclideanDual (m : ℕ) C).mp
        hC.toFiniteBilinearModule)).dualCarrier) :
    discriminantOrthogonalQuotientIsometry m ι hm C hC (Submodule.Quotient.mk ⟨_, hz⟩) =
      ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).orthogonalQuotientMk C hC
        ⟨fun i ↦ (z i : ZMod m), (intCast_mem_integralLattice_dualCarrier_iff m ι C _ z).mp hz⟩ :=
  ConstructionA.discriminantOrthogonalQuotientIsometry_mk_intCast m ι hm C hC z hz

/-- Unimodularity of the glued lattice is the Lagrangian condition `C = C⊥`. -/
theorem isUnimodular_ofIsotropicSubgroup_codeInZeroLatticeDiscriminantGroup_iff
    (hm : Even (m : ℕ)) (C : AdditiveCode (ZMod m) ι)
    (hC : ((FiniteQuadraticModule.zmodStandard (m : ℕ) hm).coordinatePower ι).IsIsotropic C) :
    ((zeroLattice m ι).ofIsotropicSubgroup (isEven_zeroLattice m ι hm)
        (codeInZeroLatticeDiscriminantGroup m ι C)
        ((ConstructionA.isIsotropic_codeInZeroLatticeDiscriminantQuadraticModule_iff m ι hm C).mpr
          hC)).IsUnimodular ↔
      AddSubgroup.toZModSubmodule m C = (AddSubgroup.toZModSubmodule m C).euclideanDual :=
  (ConstructionA.isUnimodular_ofIsotropicSubgroup_codeInZeroLatticeDiscriminantGroup_iff
    m ι hm C hC).trans (isLagrangian_coordinatePower_zmodStandard_iff (m : ℕ) C)

end Layer7

section RootAlphabets

open IntegralLattice

variable {ι : Type*} [Fintype ι]

/-- **The `A₂` alphabet**, pinned by `q(a) = a²/3` and `b(a, b) = 2ab/3` modulo `ℤ`, with an
isometry onto the actual discriminant module of `A₂` sending `1` to the fundamental-weight
class. -/
theorem typeA2_quadratic (a : ZMod 3) :
    (typeAStandardQuadraticModule 2).quadratic a =
      ((((a.val : ℚ) ^ 2) / 3 : ℚ) : AddCircle (1 : ℚ)) := by
  have h := typeAStandardQuadraticModule_quadratic_intCast (n := 2) (a.val : ℤ)
  rw [Int.cast_natCast, ZMod.natCast_zmod_val] at h
  rw [h]
  congr 1
  push_cast
  ring

theorem typeA2_pairing (a b : ZMod 3) :
    (typeAStandardQuadraticModule 2).toFiniteBilinearModule.pairing a b =
      (((2 * (a.val : ℚ) * (b.val : ℚ)) / 3 : ℚ) : AddCircle (1 : ℚ)) :=
  typeAStandardQuadraticModule_two_pairing a b

noncomputable example : FiniteQuadraticModule.Isometry (typeAStandardQuadraticModule 2)
    ((typeARootLattice 2).discriminantQuadraticModule (isEven_typeARootLattice 2)) :=
  typeADiscriminantQuadraticIsometry 2

omit [Fintype ι] in
theorem typeA2CoordinateDiscriminantEquiv_one :
    typeA2CoordinateDiscriminantEquiv (fun _ : ι ↦ 1) =
      fun _ ↦ typeAFundamentalWeightClass 2 :=
  TauCeti.typeA2CoordinateDiscriminantEquiv_one

/-- On a coordinate power, the `A₂` quadratic value is `wt/3`. -/
theorem coordinatePower_typeA2_quadratic (x : ι → ZMod 3) :
    ((typeAStandardQuadraticModule 2).coordinatePower ι).quadratic x =
      (((hammingNorm x : ℚ) / 3 : ℚ) : AddCircle (1 : ℚ)) :=
  coordinatePower_typeAStandardQuadraticModule_two_quadratic x

/-- **The tetracode and `G₁₂` are quadratic Lagrangians** for `A₂`, in the alphabet, in the actual
coordinate discriminant modules, and in the discriminant module of the orthogonal power `A₂^ι`. -/
theorem tetracode_isLagrangian_typeA2 :
    ((typeAStandardQuadraticModule 2).coordinatePower (Fin 4)).IsLagrangian
        tetracode.toAddSubgroup ∧
      (((typeARootLattice 2).discriminantQuadraticModule
          (isEven_typeARootLattice 2)).coordinatePower (Fin 4)).IsLagrangian
        (codeInTypeA2Discriminant tetracode.toAddSubgroup) ∧
      (((typeARootLattice 2).coordinatePower (Fin 4)).discriminantQuadraticModule
          ((isEven_typeARootLattice 2).coordinatePower (Fin 4))).IsLagrangian
        (codeInTypeA2CoordinatePowerDiscriminant tetracode.toAddSubgroup) :=
  ⟨Tetracode.isLagrangian_typeA2, Tetracode.isLagrangian_codeInTypeA2Discriminant,
    Tetracode.isLagrangian_codeInTypeA2CoordinatePowerDiscriminant⟩

theorem ternaryGolay_isLagrangian_typeA2 :
    ((typeAStandardQuadraticModule 2).coordinatePower (Fin 12)).IsLagrangian
        TernaryGolay.code.toAddSubgroup ∧
      (((typeARootLattice 2).discriminantQuadraticModule
          (isEven_typeARootLattice 2)).coordinatePower (Fin 12)).IsLagrangian
        (codeInTypeA2Discriminant TernaryGolay.code.toAddSubgroup) ∧
      (((typeARootLattice 2).coordinatePower (Fin 12)).discriminantQuadraticModule
          ((isEven_typeARootLattice 2).coordinatePower (Fin 12))).IsLagrangian
        (codeInTypeA2CoordinatePowerDiscriminant TernaryGolay.code.toAddSubgroup) :=
  ⟨TernaryGolay.isLagrangian_typeA2, TernaryGolay.isLagrangian_codeInTypeA2Discriminant,
    TernaryGolay.isLagrangian_codeInTypeA2CoordinatePowerDiscriminant⟩

variable {F : Type*} [Field F] [Finite F] (hF : Nat.card F = 4)

/-- **The `D₄` alphabet** is `F₄` with `q = wt/2` and `b(x, y) = ½ Tr_{F₄/F₂}(∑ xᵢ yᵢ²)` on a
coordinate power, with an isometry onto the actual discriminant module of `D₄` sending `1` to the
vector class and `ω`, `ω²` to the two spinor classes. -/
theorem coordinatePower_typeD4_quadratic [DecidableEq F] (x : ι → F) :
    ((typeD4QuaternaryQuadraticModule hF).coordinatePower ι).quadratic x =
      (((hammingNorm x : ℚ) / 2 : ℚ) : AddCircle (1 : ℚ)) :=
  coordinatePower_typeD4QuaternaryQuadraticModule_quadratic hF x

theorem coordinatePower_typeD4_pairing [Algebra (ZMod 2) F] (x y : ι → F) :
    ((typeD4QuaternaryQuadraticModule hF).coordinatePower ι).toFiniteBilinearModule.pairing x y =
      ZMod.toRatAddCircle 2 (Algebra.trace (ZMod 2) F (∑ i, x i * y i ^ 2)) :=
  coordinatePower_typeD4QuaternaryQuadraticModule_pairing hF x y

noncomputable example {ω : F} (hω : ω ^ 2 + ω + 1 = 0) :
    FiniteQuadraticModule.Isometry (typeD4QuaternaryQuadraticModule hF)
      ((checkerboardLattice 4).discriminantQuadraticModule (isEven_checkerboardLattice 4)) :=
  typeD4QuaternaryDiscriminantQuadraticIsometry hF hω

theorem typeD4QuaternaryDiscriminantQuadraticIsometry_classes {ω : F}
    (hω : ω ^ 2 + ω + 1 = 0) :
    typeD4QuaternaryDiscriminantQuadraticIsometry hF hω (1 : F) = checkerboardVectorClass 4 ∧
      typeD4QuaternaryDiscriminantQuadraticIsometry hF hω ω = checkerboardSpinorClass 4 ∧
      typeD4QuaternaryDiscriminantQuadraticIsometry hF hω (ω ^ 2 : F) =
        checkerboardCospinorClass 4 :=
  ⟨typeD4QuaternaryDiscriminantQuadraticIsometry_one hF hω,
    typeD4QuaternaryDiscriminantQuadraticIsometry_root hF hω,
    typeD4QuaternaryDiscriminantQuadraticIsometry_root_sq hF hω⟩

/-- **The hexacode is a quadratic Lagrangian** for `D₄`, for either root. -/
theorem hexacode_isLagrangian_typeD4 {ω ω' : F} (hω : ω ^ 2 + ω + 1 = 0)
    (hω' : ω' ^ 2 + ω' + 1 = 0) :
    ((typeD4QuaternaryQuadraticModule hF).coordinatePower (Fin 6)).IsLagrangian
        (Hexacode.code ω).toAddSubgroup ∧
      (((checkerboardLattice 4).discriminantQuadraticModule
          (isEven_checkerboardLattice 4)).coordinatePower (Fin 6)).IsLagrangian
        (codeInTypeD4Discriminant hF hω' (Hexacode.code ω).toAddSubgroup) ∧
      (((checkerboardLattice 4).coordinatePower (Fin 6)).discriminantQuadraticModule
          ((isEven_checkerboardLattice 4).coordinatePower (Fin 6))).IsLagrangian
        (codeInTypeD4CoordinatePowerDiscriminant hF hω' (Hexacode.code ω).toAddSubgroup) :=
  ⟨Hexacode.isLagrangian_typeD4 hF hω, Hexacode.isLagrangian_codeInTypeD4Discriminant hF hω hω',
    Hexacode.isLagrangian_codeInTypeD4CoordinatePowerDiscriminant hF hω hω'⟩

end RootAlphabets

section CoordinatePowerInterface

open IntegralLattice

variable {V : Type*} [AddCommGroup V] [Module ℚ V] {L : IntegralLattice V} [L.IsNondegenerate]

/-- **The reusable interface**: an isometry from a finite quadratic alphabet to the discriminant
module of `L` induces one from its coordinate power to the discriminant module of the orthogonal
power `L^ι`, acting coordinatewise. The codes it transports stay `AddSubgroup`s. -/
noncomputable example {hL : L.IsEven} {A : FiniteQuadraticModule}
    (f : FiniteQuadraticModule.Isometry A (L.discriminantQuadraticModule hL))
    (ι : Type*) [Fintype ι] :
    FiniteQuadraticModule.Isometry (A.coordinatePower ι)
      ((L.coordinatePower ι).discriminantQuadraticModule (hL.coordinatePower ι)) :=
  f.coordinatePowerDiscriminant ι

theorem coordinatePowerDiscriminant_apply {hL : L.IsEven} {ι : Type*} [Fintype ι]
    {A : FiniteQuadraticModule} (f : FiniteQuadraticModule.Isometry A
      (L.discriminantQuadraticModule hL)) (x : ι → A) :
    f.coordinatePowerDiscriminant ι x =
      (L.discriminantQuadraticIsometryCoordinatePower ι hL).symm (f.coordinatePower ι x) :=
  FiniteQuadraticModule.Isometry.coordinatePowerDiscriminant_apply f x

omit [L.IsNondegenerate] in
theorem discriminantGroupCoordinatePowerEquiv_mk (ι : Type*) [Fintype ι]
    (x : (L.coordinatePower ι).dualCarrier) :
    L.discriminantGroupCoordinatePowerEquiv ι (Submodule.Quotient.mk x) =
      fun i ↦ Submodule.Quotient.mk (L.coordinatePowerDualCarrierEquiv ι x i) :=
  IntegralLattice.discriminantGroupCoordinatePowerEquiv_mk L ι x

end CoordinatePowerInterface

/-! ## Acceptance (Layer 7): the binary Golay code through the discriminant bridge -/

section GolayAcceptance

open ConstructionA

/-- The binary Golay code, sent through the coordinate discriminant isometry, glues `2ℤ²⁴` to the
same lattice as Construction A, which is even and unimodular, and `C⊥/C` is trivial, both as a
group and as the discriminant module of the lattice. -/
theorem binaryGolay_gluing :
    (zeroLattice 2 (Fin 24)).ofIsotropicSubgroup (isEven_zeroLattice 2 (Fin 24) even_two)
        (codeInZeroLatticeDiscriminantGroup 2 (Fin 24) BinaryGolay.code.toAddSubgroup)
        BinaryGolay.isIsotropic_codeInZeroLatticeDiscriminantQuadraticModule =
      BinaryGolay.constructionALattice ∧
    ((zeroLattice 2 (Fin 24)).ofIsotropicSubgroup (isEven_zeroLattice 2 (Fin 24) even_two)
        (codeInZeroLatticeDiscriminantGroup 2 (Fin 24) BinaryGolay.code.toAddSubgroup)
        BinaryGolay.isIsotropic_codeInZeroLatticeDiscriminantQuadraticModule).IsEven ∧
    ((zeroLattice 2 (Fin 24)).ofIsotropicSubgroup (isEven_zeroLattice 2 (Fin 24) even_two)
        (codeInZeroLatticeDiscriminantGroup 2 (Fin 24) BinaryGolay.code.toAddSubgroup)
        BinaryGolay.isIsotropic_codeInZeroLatticeDiscriminantQuadraticModule).IsUnimodular ∧
    Nat.card (((FiniteBilinearModule.zmodStandard 2).coordinatePower (Fin 24)).orthogonalQuotient
        BinaryGolay.code.toAddSubgroup) = 1 ∧
    Subsingleton BinaryGolay.constructionALattice.discriminantBilinearModule ∧
    Subsingleton (BinaryGolay.constructionALattice.discriminantQuadraticModule
        BinaryGolay.isEven_constructionALattice) :=
  ⟨BinaryGolay.ofIsotropicSubgroup_codeInZeroLatticeDiscriminantGroup_eq_constructionALattice,
    BinaryGolay.isEven_ofIsotropicSubgroup_codeInZeroLatticeDiscriminantGroup,
    BinaryGolay.isUnimodular_ofIsotropicSubgroup_codeInZeroLatticeDiscriminantGroup,
    BinaryGolay.natCard_orthogonalQuotient_code_eq_one, inferInstance, inferInstance⟩

noncomputable example :
    FiniteBilinearModule.Isometry BinaryGolay.constructionALattice.discriminantBilinearModule
      (((FiniteBilinearModule.zmodStandard 2).coordinatePower (Fin 24)).orthogonalQuotient
        BinaryGolay.code.toAddSubgroup) :=
  BinaryGolay.discriminantBilinearOrthogonalQuotientIsometry

noncomputable example : FiniteQuadraticModule.Isometry
    (BinaryGolay.constructionALattice.discriminantQuadraticModule
      BinaryGolay.isEven_constructionALattice)
    (((FiniteQuadraticModule.zmodStandard 2 even_two).coordinatePower (Fin 24)).orthogonalQuotient
      BinaryGolay.code.toAddSubgroup BinaryGolay.isIsotropic_code) :=
  BinaryGolay.discriminantQuadraticOrthogonalQuotientIsometry

end GolayAcceptance

end TauCetiRoadmap.AlgebraicCodingTheory
