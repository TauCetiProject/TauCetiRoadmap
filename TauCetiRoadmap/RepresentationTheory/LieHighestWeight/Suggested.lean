import Mathlib
import TauCeti.Algebra.Lie.Presentation.Serre.Killing
import TauCeti.Algebra.Octonion.Serre
import TauCeti.Algebra.AlbertAlgebra.Basic
import TauCeti.Algebra.CayleyDickson.Quaternion
import TauCeti.Algebra.Lie.Derivation.Basic
import TauCeti.Algebra.Lie.GeneralLinear.Carrier
import TauCeti.Combinatorics.Young.LittlewoodRichardson.Basic
import TauCeti.LinearAlgebra.RootSystem.Weyl.ExtendedAffine.Alcove
import TauCeti.LinearAlgebra.RootSystem.Weyl.ExtendedAffine.Wall

/-!
# Lie highest weights: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that the pins do not already prove, each with
`sorry`. It declares no definitions: every carrier its statements need exists at the pins.

The following headlines of the README are proved at the pinned Tau Ceti and are consumed there
by name, not restated here: the classification of the finite-dimensional `sl₂`-irreducibles,
`sl₂` complete reducibility and the Clebsch–Gordan rule (Layer 0); the integral weight lattice
(Layer 1); the diagonalizability of the Cartan action and the integrality of weights (Layer 2);
the PBW basis, the finiteness of `U(L)` over central scalars, the PBW Rees algebra and its
fibres, Verma modules and the irreducible quotients `L(λ)` (Layer 3); the dominant-integral
classification (Layer 4); complete reducibility and the Casimir eigenvalue (Layer 5); the Weyl
character, dimension and Kostant formulas, the orbit-sum expansion, the isotypic toolkit and the
minuscule Pieri rule (Layer 6); the Harish-Chandra isomorphisms, the central-character orbit
theorem, Chevalley restriction, Cartan conjugacy, the PBW centre symbols and Freudenthal's
formula (Layer 7); the dimension and simplicity of the octonion derivations, the surjection from
split `G₂`, the dimension of the Albert derivations and the Albert determinant and cubic identity
(Layer 8); the reductive structure theory, the `gl_n` classification on the carrier
`TauCeti.glIrreducible`, the `sl ↔ gl` transfer, the dual-standard Pieri rule, the single-weight
isotypic criterion, the trace-form Casimir and the differentiation of rational
`GL_n`-representations (Layer 9); and the surjection from the alcove stabilizer `Ω` onto
`P∨/Q∨` and its action on the affine walls (Layer 10).

The following headlines are not statable at the pins, and nothing is stated in their place:

* compact `F₄` (Layer 8): Tau Ceti has the real division octonions
  `TauCeti.DivisionOctonionReal` but not the formally real Albert algebra of Hermitian `3 × 3`
  matrices over them;
* the identification of the Vinberg model `𝔰𝔩₉ ⊕ ⋀³K⁹ ⊕ (⋀³K⁹)*` with `LieAlgebra.e₈` and of
  the Freudenthal models with `LieAlgebra.e₆`, `LieAlgebra.e₇`: Tau Ceti has the
  `248`-dimensional underlying module but not the graded bracket, and neither Freudenthal model;
* the first-order Poisson bracket on the zero fibre of the PBW Rees algebra
  (`TauCeti.UniversalEnvelopingAlgebra.reesAlgebra`) and its comparison with symmetrization:
  the pins have no Poisson-algebra structure on `SymmetricAlgebra`.

The symmetrization form of the PBW theorem, `Sym(L) ≃ U(L)` over a commutative `ℚ`-algebra, is
statable, but ScatteringDiagrams §0.4 owns it (`exists_pbwSymmetrizationEquiv`); it is not
restated here. The fixed-point form of the Weyl character formula (Layer 6) is a restatement of
the native formula `formalCharacter_mul_weylDenominator_eq_weylNumerator` in the fraction field
of the weight group algebra, and is not a headline.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeight

attribute [local instance 100] LieRing.ofAssociativeRing

open Module
open scoped TensorProduct

universe u v w

/-! ## Layer 7: the Serre presentation -/

open scoped Classical in
/-- **Serre's theorem, split form.** Let `L` be a finite-dimensional simple Lie algebra with
non-degenerate Killing form over a field `K` of characteristic zero, `H` a split Cartan
subalgebra and `base` a base of its root system. For raising and lowering families `e`, `f`
which, with the simple coroots, satisfy the Serre relations for the transposed Cartan matrix and
generate `L`, the induced map from Mathlib's Serre-presented algebra to `L` is injective
(Etingof, *Lie groups and Lie algebras*, Theorem 24.2, p. 122, over `ℂ`; Humphreys,
*Introduction to Lie Algebras*, §18.3). -/
theorem serreLift_injective_of_base {K : Type u} [Field K] [CharZero K]
    {L : Type v} [LieRing L] [LieAlgebra K L] [FiniteDimensional K L] [LieAlgebra.IsKilling K L]
    [LieAlgebra.IsSimple K L] {H : LieSubalgebra K L} [H.IsCartanSubalgebra]
    [LieModule.IsTriangularizable K H L]
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {e f : ↥base.support → L}
    (hS : TauCeti.IsSerreSystem K base.cartanMatrix.transpose
      (fun i ↦ (((LieAlgebra.IsKilling.rootSystem H).coroot i : H) : L)) e f)
    (hspan : LieSubalgebra.lieSpan K L (Set.range e ∪ Set.range f) = ⊤) :
    Function.Injective (TauCeti.serreLift hS) := sorry

/-! ## Layer 8: the exceptional Lie algebras -/

/-- **`G₂` is the derivation algebra of the split octonions.** Over a field of characteristic
zero, the map from Mathlib's split `G₂` to the derivations of the split octonions
`TauCeti.Octonion K`, defined by the Chevalley generators, is injective; with the native
surjectivity it is an isomorphism (Schafer, *An Introduction to Nonassociative Algebras*, 1961
notes, Ch. III, p. 28: the derivation algebra of a Cayley algebra is central simple of dimension
`14`, of type `G₂`). -/
theorem g₂ToDerivationLieAlgebra_injective (K : Type u) [Field K] [CharZero K] :
    Function.Injective (TauCeti.Octonion.g₂ToDerivationLieAlgebra (R := K)) := sorry

/-- **`F₄` is the derivation algebra of the split Albert algebra.** Over a field of
characteristic zero, the derivation Lie algebra of the split Albert algebra
`TauCeti.AlbertAlgebra K` is isomorphic to Mathlib's split `F₄` (Schafer, *An Introduction to
Nonassociative Algebras*, 1961 notes, Ch. IV, p. 41: the derivation algebra of an exceptional
central simple Jordan algebra is central simple of dimension `52`, of type `F₄`). -/
theorem nonempty_derivationAlbert_lieEquiv_f₄ (K : Type u) [Field K] [CharZero K]
    [Invertible (2 : K)] :
    Nonempty (TauCeti.derivationLieAlgebra K (TauCeti.AlbertAlgebra K) ≃ₗ⁅K⁆ LieAlgebra.f₄ K) :=
  sorry

/-- **Compact `G₂`, dimension.** The derivation Lie algebra of the real division octonions
`TauCeti.DivisionOctonionReal` (the Cayley–Dickson double of `ℍ[ℝ]`) has dimension `14`
(Baez, *The Octonions*, arXiv v4, §4.1, p. 36, computes `14` for the automorphism group of the
octonions). -/
theorem finrank_derivationLieAlgebra_divisionOctonionReal :
    Module.finrank ℝ (TauCeti.derivationLieAlgebra ℝ TauCeti.DivisionOctonionReal) = 14 := sorry

/-- **Compact `G₂`, definiteness.** The Killing form of the derivation Lie algebra of the real
division octonions is negative definite: it is the compact real form of `G₂`, not the split one,
whose Killing form is indefinite. -/
theorem killingForm_derivationLieAlgebra_divisionOctonionReal_lt_zero
    (D : TauCeti.derivationLieAlgebra ℝ TauCeti.DivisionOctonionReal) (hD : D ≠ 0) :
    killingForm ℝ (TauCeti.derivationLieAlgebra ℝ TauCeti.DivisionOctonionReal) D D < 0 := sorry

/-- **The dimension of `E₆`.** Over a field of characteristic zero, Mathlib's Serre-presented
split `E₆` has dimension `78 = 6 + 72`. -/
theorem finrank_e₆ (K : Type u) [Field K] [CharZero K] :
    Module.finrank K (LieAlgebra.e₆ K) = 78 := sorry

/-- **The dimension of `E₇`.** Over a field of characteristic zero, Mathlib's Serre-presented
split `E₇` has dimension `133 = 7 + 126`. -/
theorem finrank_e₇ (K : Type u) [Field K] [CharZero K] :
    Module.finrank K (LieAlgebra.e₇ K) = 133 := sorry

/-- **The dimension of `E₈`.** Over a field of characteristic zero, Mathlib's Serre-presented
split `E₈` has dimension `248 = 8 + 240` (Baez, *The Octonions*, arXiv v4, §4.6, p. 49). -/
theorem finrank_e₈ (K : Type u) [Field K] [CharZero K] :
    Module.finrank K (LieAlgebra.e₈ K) = 248 := sorry

/-! ## Layer 9: `gl_n` -/

/-- **The Littlewood–Richardson rule for `gl_N`.** Over a field of characteristic zero, for
partitions `λ`, `μ`, `ν` with at most `N` rows, the multiplicity of the irreducible
`glIrreducible N ν` in `glIrreducible N λ ⊗ glIrreducible N μ`, measured as the dimension of the
space of `gl_N`-module maps, is the number of Littlewood–Richardson tableaux of skew shape `ν/λ`
and content `μ` (Stembridge, *A concise proof of the Littlewood–Richardson rule*, Corollary on
p. 3 at `ν = ∅`, a sum over the `λ`-Yamanouchi tableaux of shape `μ`, which
`TauCeti.lrTableauEquivYamanouchi` identifies with these Littlewood–Richardson tableaux). -/
theorem finrank_lieModuleHom_glIrreducible_tmul_eq_card_lrTableau (K : Type u) [Field K]
    [CharZero K] (N : ℕ) (lam mu nu : YoungDiagram)
    (hlam : lam.colLen 0 ≤ N) (hmu : mu.colLen 0 ≤ N) (hnu : nu.colLen 0 ≤ N) :
    Module.finrank K
        (TauCeti.glIrreducible N (fun i : Fin N ↦ (nu.rowLen i : K)) →ₗ⁅K, Matrix (Fin N) (Fin N) K⁆
          TauCeti.glIrreducible N (fun i : Fin N ↦ (lam.rowLen i : K)) ⊗[K]
            TauCeti.glIrreducible N (fun i : Fin N ↦ (mu.rowLen i : K))) =
      Nat.card (TauCeti.LRTableau lam nu mu) := sorry

/-! ## Layer 10: the extended affine Weyl group -/

/-- **`Ω ≃ P∨/Q∨`.** For a finite reduced irreducible crystallographic root pairing over an
Archimedean ordered field, the map from the stabilizer `Ω` of the fundamental alcove in the
extended affine Weyl group to the coweight lattice modulo the coroot lattice, taking an element
to the class of its translation part, is bijective (Garnier, *Fundamental domains for extended
affine Weyl groups*, §2.2, p. 7, and Prop.-Def. 2.2.1, p. 8). -/
theorem fundamentalAlcoveStabilizerToQuotient_bijective {ι R M N : Type*} [Field R]
    [LinearOrder R] [IsStrictOrderedRing R] [Archimedean R] [AddCommGroup M] [Module R M]
    [AddCommGroup N] [Module R N] (P : RootPairing ι R M N) (b : P.Base) [Finite ι] [Nonempty ι]
    [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible] :
    Function.Bijective (P.fundamentalAlcoveStabilizerToQuotient b) := sorry

/-- **`Aut(affine Cartan matrix) = Ω ⋊ Aut(finite Cartan matrix)`.** For a finite reduced
irreducible crystallographic root pairing over an Archimedean ordered field, every permutation
of the affine nodes preserving the affine Cartan matrix is, uniquely, a symmetry of the affine
Cartan matrix fixing the affine node followed by the permutation of the alcove walls induced by an
element of `Ω`: `σ = π(ω) ∘ τ`, the product of `Equiv.Perm` being composition (Garnier,
*Fundamental domains for extended affine Weyl groups*, Cor. 2.2.7, p. 10). -/
theorem existsUnique_fundamentalAlcoveStabilizerToPerm_mul {ι R M N : Type*} [Field R]
    [LinearOrder R] [IsStrictOrderedRing R] [Archimedean R] [AddCommGroup M] [Module R M]
    [AddCommGroup N] [Module R N] {P : RootPairing ι R M N} (b : P.Base) [Finite ι] [Nonempty ι]
    [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible] {σ : Equiv.Perm (Option b.support)}
    (hσ : σ ∈ TauCeti.matrixSymmetryGroup b.affineCartanMatrix) :
    ∃! p : P.fundamentalAlcoveStabilizer b × Equiv.Perm (Option b.support),
      p.2 ∈ TauCeti.matrixSymmetryGroup b.affineCartanMatrix ∧ p.2 none = none ∧
        σ = RootPairing.fundamentalAlcoveStabilizerToPerm b p.1 * p.2 := sorry

end TauCetiRoadmap.RepresentationTheory.LieHighestWeight
