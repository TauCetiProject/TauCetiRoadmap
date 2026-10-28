import Mathlib

set_option autoImplicit false

/-!
# Lefschetz structures and algebraic operators on cohomology: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap. `sorry` is allowed in this human-owned roadmap library: these are goals, not proofs.

This file covers Layers 0 and 1, which need only Mathlib. Layer 2 (Lefschetz data on a Weil
cohomology theory) consumes the Chow rings of SchemeAndStackFoundations Layer 5, which are not yet implemented in
Tau Ceti; its signatures are specified in `README.md` and will be prototyped against that
implementation. Definitions have real bodies; only theorem statements are `sorry`.

Owners consumed (README §Scope): the primitive decomposition and the pairing theory are
DeligneWeightsAndPurity §9.7's `lefschetzDecomposition`, `lefschetzPairings` and `primitivePiece`
(through the `ℕ → ℤ` grading extension there), with the categorical splitting of
EtaleDualityAndPerverseSheaves §5.7; `𝔰𝔩₂` representation theory is LieHighestWeight Layer 0, on
Mathlib's `IsSl2Triple`. `grade_eq_iSup_primitive` below is the adapter to that core.

Conventions (README §Conventions): weight `2n`; `P^i = H^i ∩ ker L^{n−i+1}` for `i ≤ n` and `P^i = 0`
for `i > n`; the Lefschetz
inverse `Λ` is Kleiman's (`Λ (L^{k+1} x) = L^k x`, `Λ x = 0` on primitives), not the `𝔰𝔩₂`
lowering operator `f`; the `𝔰𝔩₂` triple has `h = ⁅L, f⁆` acting on `H^i` by `i − n`.
-/

namespace TauCetiRoadmap.LefschetzStructures

variable (K : Type*) [Field K] (H : Type*) [AddCommGroup H] [Module K H]

/-! ## Layer 0: Lefschetz structures -/

/-- A Lefschetz structure of weight `2n` on `H`: a grading concentrated in degrees `≤ 2n` and a
degree-`2` operator `L` with hard Lefschetz. -/
structure LefschetzStructure (n : ℕ) where
  /-- The graded pieces `H^i`. -/
  grade : ℕ → Submodule K H
  isInternal : DirectSum.IsInternal grade
  grade_eq_bot : ∀ i, 2 * n < i → grade i = ⊥
  /-- The Lefschetz operator. -/
  L : Module.End K H
  L_mem : ∀ i x, x ∈ grade i → L x ∈ grade (i + 2)
  hardLefschetz : ∀ i ≤ n, Set.BijOn (L ^ (n - i)) (grade i) (grade (2 * n - i))

namespace LefschetzStructure

variable {K H} {n : ℕ} (S : LefschetzStructure K H n)

/-- The primitive part `P^i = H^i ∩ ker L^{n−i+1}` for `i ≤ n`, and `0` above the middle degree
(natural subtraction would otherwise make `P^i = H^i ∩ ker L` for `i > n`). It is
DeligneWeightsAndPurity §9.7's `primitivePiece 𝒱 L n (n − i)` for `i ≤ n`. -/
def primitive (i : ℕ) : Submodule K H :=
  if i ≤ n then S.grade i ⊓ LinearMap.ker (S.L ^ (n - i + 1)) else ⊥

/-- `π` is the projector onto `H^i` along the other graded pieces. -/
def IsGradeProjector (i : ℕ) (π : Module.End K H) : Prop :=
  ∀ j x, x ∈ S.grade j → π x = if j = i then x else 0

/-- `Λ` is the Lefschetz inverse (Kleiman's normalization): `Λ (L^{k+1} x) = L^k x` and `Λ x = 0`
for `x ∈ P^j`, `j ≤ n`, whenever `L^{k+1} x` lies in degree `≤ 2n − j`. Primitive sources above
the middle degree are `0` by the definition of `primitive`. -/
def IsLefschetzInverse (Λ : Module.End K H) : Prop :=
  (∀ j x, x ∈ S.primitive j → Λ x = 0) ∧
    ∀ j k x, x ∈ S.primitive j → j + 2 * (k + 1) ≤ 2 * n - j →
      Λ ((S.L ^ (k + 1)) x) = (S.L ^ k) x

/-- `h` is the weight operator: it acts on `H^i` by `i − n`. -/
def IsWeightOperator (h : Module.End K H) : Prop :=
  ∀ i x, x ∈ S.grade i → h x = ((i : K) - n) • x

/-- **Layer 0.2.** The primitive decomposition of each `H^i`: the adapter to
DeligneWeightsAndPurity §9.7's `lefschetzDecomposition`, not a second proof. -/
theorem grade_eq_iSup_primitive (i : ℕ) :
    S.grade i = ⨆ (k : ℕ) (_ : 2 * k ≤ i) (_ : i - 2 * k ≤ n),
      (S.primitive (i - 2 * k)).map (S.L ^ k) := by
  sorry

/-- **Layer 0.3.** Existence and uniqueness of the Lefschetz inverse. -/
theorem existsUnique_isLefschetzInverse [CharZero K] [FiniteDimensional K H] :
    ∃! Λ : Module.End K H, S.IsLefschetzInverse Λ := by
  sorry

/-- **Layer 0.3, check.** `Λ^{n−i}` inverts `L^{n−i} : H^i → H^{2n−i}` (not `Λ` itself: on
`ℚ[ξ]/(ξ³)` with `n = 2`, `Λ L² 1 = ξ` while `Λ² L² 1 = 1`). -/
theorem lambda_pow_L_pow [CharZero K] [FiniteDimensional K H] {Λ : Module.End K H}
    (hΛ : S.IsLefschetzInverse Λ) {i : ℕ} (hi : i ≤ n) {x : H} (hx : x ∈ S.grade i) :
    (Λ ^ (n - i)) ((S.L ^ (n - i)) x) = x := by
  sorry

/-- **Layer 0.3.** The `𝔰𝔩₂` triple `(L, h, f)` with `h` the weight operator, built from the
Lefschetz data; its representation theory is LieHighestWeight's. -/
theorem exists_sl2 [CharZero K] [FiniteDimensional K H] :
    ∃ f : Module.End K H, S.IsWeightOperator ⁅S.L, f⁆ ∧ ⁅⁅S.L, f⁆, S.L⁆ = 2 • S.L ∧
      ⁅⁅S.L, f⁆, f⁆ = -(2 • f) := by
  sorry

/-- **Layer 0.3, check.** On a primitive class the `𝔰𝔩₂` operator is not the Lefschetz inverse:
`f (L x) = (n − j) x`. -/
theorem sl2_lower_L_primitive [CharZero K] [FiniteDimensional K H] (f : Module.End K H)
    (hf : S.IsWeightOperator ⁅S.L, f⁆ ∧ ⁅⁅S.L, f⁆, S.L⁆ = 2 • S.L ∧ ⁅⁅S.L, f⁆, f⁆ = -(2 • f))
    {j : ℕ} {x : H} (hx : x ∈ S.primitive j) (hj : j < n) :
    f (S.L x) = ((n : K) - j) • x := by
  sorry

end LefschetzStructure

/-! ## Layer 1: algebraic structures and the conditional theorems -/

namespace LefschetzStructure

variable {K H} {n : ℕ} (S : LefschetzStructure K H n)

/-- An algebraic structure on `S`: a subfield `F` (`ℚ` in the geometric case), a subring `𝒜` of
« algebraic » endomorphisms containing `L` and stable under `F`-scalars, and additive subgroups
`A i ⊆ H^{2i}` of « algebraic » classes, stable under `F`-scalars and under `𝒜`. -/
structure AlgebraicStructure where
  /-- The field of definition of algebraic classes. -/
  F : Subfield K
  /-- The algebraic endomorphisms. -/
  𝒜 : Subring (Module.End K H)
  L_mem : S.L ∈ 𝒜
  smul_mem : ∀ c ∈ F, ∀ g ∈ 𝒜, c • g ∈ 𝒜
  /-- The algebraic classes in `H^{2i}`. -/
  A : ℕ → AddSubgroup H
  A_le : ∀ i x, x ∈ A i → x ∈ S.grade (2 * i)
  A_smul : ∀ i, ∀ c ∈ F, ∀ x ∈ A i, c • x ∈ A i
  A_L : ∀ i x, x ∈ A i → S.L x ∈ A (i + 1)

variable {S} (𝔄 : S.AlgebraicStructure) (pair : LinearMap.BilinForm K H)

/-- The Lefschetz inverse is algebraic (the abstract form of condition `B`). -/
def LambdaAlgebraic : Prop := ∃ Λ ∈ 𝔄.𝒜, S.IsLefschetzInverse Λ

/-- Every grade projector is algebraic (the abstract form of condition `C`). -/
def ProjectorsAlgebraic : Prop := ∀ i, ∃ π ∈ 𝔄.𝒜, S.IsGradeProjector i π

/-- Positivity on algebraic primitive classes (the abstract form of `Hdg`): for `2i ≤ n`, the form `(−1)^i ⟨L^{n−2i} x, x⟩` takes positive rational
values on nonzero primitive algebraic classes of `H^{2i}`. -/
def PositiveOnAlgebraicPrimitive : Prop :=
  ∀ i, 2 * i ≤ n → ∀ x ∈ 𝔄.A i, x ∈ S.primitive (2 * i) → x ≠ 0 →
    ∃ q : ℚ, 0 < q ∧ (-1 : K) ^ i * pair ((S.L ^ (n - 2 * i)) x) x = (q : K)

/-- Nondegeneracy on algebraic classes (the abstract form of `D`): the pairing between algebraic classes of complementary degrees is
nondegenerate. -/
def PairingNondegenerateOnAlgebraic : Prop :=
  ∀ i ≤ n, ∀ x ∈ 𝔄.A i, (∀ y ∈ 𝔄.A (n - i), pair x y = 0) → x = 0

/-- **Layer 1.2.** An algebraic Lefschetz inverse makes every grade projector algebraic. -/
theorem projectorsAlgebraic_of_lambdaAlgebraic [CharZero K] [FiniteDimensional K H] (hB : LambdaAlgebraic 𝔄) : ProjectorsAlgebraic 𝔄 := by
  sorry

/-- **Layer 1.3.** The Cayley–Hamilton step: if characteristic polynomials of algebraic
endomorphisms have coefficients in `F`, inverses of invertible algebraic endomorphisms are
algebraic. -/
theorem inv_mem_of_charpoly [FiniteDimensional K H]
    (hD : ∀ g ∈ 𝔄.𝒜, ∀ j, g.charpoly.coeff j ∈ 𝔄.F) {w : Module.End K H} (hw : w ∈ 𝔄.𝒜)
    (hunit : IsUnit w) : ∃ g ∈ 𝔄.𝒜, g * w = 1 ∧ w * g = 1 := by
  sorry

/-- **Layer 1.4.** An algebraic Lefschetz inverse and positivity give nondegeneracy on algebraic classes, for a pairing compatible with `L` and the grading. The
hypothesis `hA` says that an algebraic endomorphism followed by an algebraic grade projector
sends algebraic classes to algebraic classes (in the geometric case: correspondences act on
cycle classes). -/
theorem pairingNondegenerate_of_lambdaAlgebraic_of_positive [CharZero K] [FiniteDimensional K H]
    (hpair_L : ∀ x y, pair (S.L x) y = pair x (S.L y))
    (hpair_grade : ∀ i j x y, x ∈ S.grade i → y ∈ S.grade j → i + j ≠ 2 * n → pair x y = 0)
    (hA : ∀ i, ∀ g ∈ 𝔄.𝒜, ∀ x ∈ 𝔄.A i, ∀ j, ∀ π ∈ 𝔄.𝒜, S.IsGradeProjector (2 * j) π →
      π (g x) ∈ 𝔄.A j)
    (hB : LambdaAlgebraic 𝔄) (hHdg : PositiveOnAlgebraicPrimitive 𝔄 pair) : PairingNondegenerateOnAlgebraic 𝔄 pair := by
  sorry

end LefschetzStructure

end TauCetiRoadmap.LefschetzStructures
