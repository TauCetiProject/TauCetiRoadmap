import Mathlib

/-!
# Lefschetz structures and algebraic operators on cohomology: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib API, each with `sorry`,
together with the definitions their statements need. The API of each definition and the Checks
stay in the README.

No Lefschetz structure, Lefschetz inverse or primitive decomposition exists in Mathlib or Tau Ceti
at the pins, so `LefschetzStructure` and the predicates of Layers 0 and 1 are defined here, on
Mathlib's `DirectSum.IsInternal`, `Module.End` with its Lie bracket, `LinearMap.BilinForm`,
`LinearMap.charpoly`, `Subring` and `Subfield`. `grade_eq_iSup_primitive` is stated on this carrier;
README 0.2 makes it an adapter to DeligneWeightsAndPurity §9.7.

Headline theorems stated here:

* README 0.2, `grade_eq_iSup_primitive`: the primitive decomposition of each `H^i`.
* README 0.3, `existsUnique_isLefschetzInverse`: the Lefschetz inverse `Λ` exists and is unique.
* README 0.4, `exists_sl2`: the `𝔰𝔩₂` triple `(L, h, f)` with `h` the weight operator.
* README 1.2, `projectorsAlgebraic_of_inverses`, `lambdaAlgebraic_of_inverses` and
  `projectorsAlgebraic_of_lambdaAlgebraic`: algebraic homogeneous inverses of the `L^{n−i}` make
  every grade projector and `Λ` algebraic, and an algebraic `Λ` gives such inverses.
* README 1.3, `inv_mem_of_charpoly`, `exists_inverse_L_pow_of_charpoly` and
  `lambdaAlgebraic_of_charpoly`: the Cayley–Hamilton criterion for an algebraic inverse of
  `L^{n−i}`, and `Λ ∈ 𝒜` when the grade projectors are algebraic.
* README 1.4, `pairingNondegenerate_of_lambdaAlgebraic_of_positive`: an algebraic `Λ` and
  positivity on algebraic primitive classes give nondegeneracy on algebraic classes.

`lambda_pow_L_pow` and `L_pow_lambda_pow` (README 0.3) are not headlines: they are stated because
1.2 takes `w i = Λ ^ (n − i)` through them.

Not stated here: Layer 2. Its carriers are a Weil cohomology theory and the correspondences acting
on it (MotivesAndAlgebraicCycles §§0.1–0.2 and 2.2–2.3), and neither a Weil cohomology theory nor
a correspondence category exists in Mathlib or Tau Ceti at the pins. So neither the Lefschetz
structure of `H(X)` (README 2.3) nor the comparison of Layer 1's properties with
MotivesAndAlgebraicCycles §7.3's predicates (README 2.4) can be stated; 2.1 and 2.2 extend the
same missing carriers.

Conventions (README §Conventions): `H = ⊕_{i ≤ 2n} H^i` graded by `ℕ`, `L` of degree `2` with
hard Lefschetz; `P^i = H^i ∩ ker L^{n−i+1}` for `i ≤ n` and `0` above; `Λ` in Kleiman's
normalization; positivity rational-valued, with no order on `K`.
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

/-- `g` lowers degrees by `d`: it maps `H^a` to `H^{a−d}` for `d ≤ a`, and `H^a` to `0` for
`a < d`. -/
def LowersDegreeBy (d : ℕ) (g : Module.End K H) : Prop :=
  ∀ a x, x ∈ S.grade a → g x ∈ (if d ≤ a then S.grade (a - d) else ⊥)

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

/-- A pairing compatible with the Lefschetz structure: `⟨H^i, H^j⟩ = 0` unless `i + j = 2n`, and
`⟨L x, y⟩ = ⟨x, L y⟩`. A Poincaré pairing (README §0.5) is moreover nondegenerate and
`(−1)^i`-symmetric; Layer 1 uses only these two conditions. -/
def IsCompatiblePairing (pair : LinearMap.BilinForm K H) : Prop :=
  (∀ i j x y, x ∈ S.grade i → y ∈ S.grade j → i + j ≠ 2 * n → pair x y = 0) ∧
    ∀ x y, pair (S.L x) y = pair x (S.L y)

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

/-- **Layer 0.3.** `Λ^{n−i}` is a left inverse of `L^{n−i}` on `H^i`; with
`L_pow_lambda_pow` it gives the inverses `w i = Λ ^ (n − i)` of Layer 1.2. -/
theorem lambda_pow_L_pow [CharZero K] [FiniteDimensional K H] {Λ : Module.End K H}
    (hΛ : S.IsLefschetzInverse Λ) {i : ℕ} (hi : i ≤ n) {x : H} (hx : x ∈ S.grade i) :
    (Λ ^ (n - i)) ((S.L ^ (n - i)) x) = x := by
  sorry

/-- **Layer 0.3.** `Λ^{n−i}` is a right inverse of `L^{n−i}` on `H^{2n−i}`. -/
theorem L_pow_lambda_pow [CharZero K] [FiniteDimensional K H] {Λ : Module.End K H}
    (hΛ : S.IsLefschetzInverse Λ) {i : ℕ} (hi : i ≤ n) {y : H} (hy : y ∈ S.grade (2 * n - i)) :
    (S.L ^ (n - i)) ((Λ ^ (n - i)) y) = y := by
  sorry

/-- **Layer 0.4.** The `𝔰𝔩₂` triple `(L, h, f)` with `h` the weight operator, built from the
Lefschetz data; its representation theory is LieHighestWeight's. -/
theorem exists_sl2 [CharZero K] [FiniteDimensional K H] :
    ∃ f : Module.End K H, S.IsWeightOperator ⁅S.L, f⁆ ∧ ⁅⁅S.L, f⁆, S.L⁆ = 2 • S.L ∧
      ⁅⁅S.L, f⁆, f⁆ = -(2 • f) := by
  sorry

end LefschetzStructure

/-! ## Layer 1: algebraic structures and the conditional theorems -/

namespace LefschetzStructure

variable {K H} {n : ℕ} (S : LefschetzStructure K H n)

/-- An algebraic structure on `S`: a subfield `F` (`ℚ` in the geometric case), a subring `𝒜` of
« algebraic » endomorphisms containing `L` and stable under `F`-scalars, and additive subgroups
`A i ⊆ H^{2i}` of « algebraic » classes, stable under `F`-scalars and `L`, whose sum is stable
under `𝒜`. -/
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
  A_stable : ∀ g ∈ 𝒜, ∀ i, ∀ x ∈ A i, g x ∈ ⨆ j, A j

variable {S} (𝔄 : S.AlgebraicStructure) (pair : LinearMap.BilinForm K H)

/-- The Lefschetz inverse is algebraic. -/
def LambdaAlgebraic : Prop := ∃ Λ ∈ 𝔄.𝒜, S.IsLefschetzInverse Λ

/-- Every grade projector is algebraic. -/
def ProjectorsAlgebraic : Prop := ∀ i, ∃ π ∈ 𝔄.𝒜, S.IsGradeProjector i π

/-- Positivity on algebraic primitive classes: for `2i ≤ n`, `(−1)^i ⟨L^{n−2i} x, x⟩` is a
positive rational number for every nonzero algebraic primitive class `x ∈ H^{2i}`. No order on
`K` is used. -/
def PositiveOnAlgebraicPrimitive : Prop :=
  ∀ i, 2 * i ≤ n → ∀ x ∈ 𝔄.A i, x ∈ S.primitive (2 * i) → x ≠ 0 →
    ∃ q : ℚ, 0 < q ∧ (-1 : K) ^ i * pair ((S.L ^ (n - 2 * i)) x) x = (q : K)

/-- Nondegeneracy on algebraic classes: a nonzero algebraic class of `H^{2i}` pairs nontrivially
with some algebraic class of the complementary degree `H^{2n−2i}`. -/
def PairingNondegenerateOnAlgebraic : Prop :=
  ∀ i ≤ n, ∀ x ∈ 𝔄.A i, (∀ y ∈ 𝔄.A (n - i), pair x y = 0) → x = 0

/-- **Layer 1.2.** Algebraic two-sided inverses of the `L^{n−i}`, lowering degrees by
`2(n − i)`, make every grade projector algebraic. -/
theorem projectorsAlgebraic_of_inverses (w : ℕ → Module.End K H)
    (hw𝒜 : ∀ i ≤ n, w i ∈ 𝔄.𝒜) (hw : ∀ i ≤ n, S.LowersDegreeBy (2 * (n - i)) (w i))
    (h₁ : ∀ i ≤ n, ∀ x ∈ S.grade i, w i ((S.L ^ (n - i)) x) = x)
    (h₂ : ∀ i ≤ n, ∀ y ∈ S.grade (2 * n - i), (S.L ^ (n - i)) (w i y) = y) :
    ProjectorsAlgebraic 𝔄 := by
  sorry

/-- **Layer 1.2.** Under the same hypotheses the Lefschetz inverse is algebraic. -/
theorem lambdaAlgebraic_of_inverses [FiniteDimensional K H] (w : ℕ → Module.End K H)
    (hw𝒜 : ∀ i ≤ n, w i ∈ 𝔄.𝒜) (hw : ∀ i ≤ n, S.LowersDegreeBy (2 * (n - i)) (w i))
    (h₁ : ∀ i ≤ n, ∀ x ∈ S.grade i, w i ((S.L ^ (n - i)) x) = x)
    (h₂ : ∀ i ≤ n, ∀ y ∈ S.grade (2 * n - i), (S.L ^ (n - i)) (w i y) = y) :
    LambdaAlgebraic 𝔄 := by
  sorry

/-- **Layer 1.2.** An algebraic Lefschetz inverse makes every grade projector algebraic (take
`w i = Λ ^ (n − i)`). -/
theorem projectorsAlgebraic_of_lambdaAlgebraic [CharZero K] [FiniteDimensional K H]
    (hΛ : LambdaAlgebraic 𝔄) : ProjectorsAlgebraic 𝔄 := by
  sorry

/-- **Layer 1.3.** The Cayley–Hamilton step: if characteristic polynomials of algebraic
endomorphisms have coefficients in `F`, inverses of invertible algebraic endomorphisms are
algebraic. -/
theorem inv_mem_of_charpoly [FiniteDimensional K H]
    (hD : ∀ g ∈ 𝔄.𝒜, ∀ j, g.charpoly.coeff j ∈ 𝔄.F) {w : Module.End K H} (hw : w ∈ 𝔄.𝒜)
    (hunit : IsUnit w) : ∃ g ∈ 𝔄.𝒜, g * w = 1 ∧ w * g = 1 := by
  sorry

/-- **Layer 1.3.** The Cayley–Hamilton criterion on graded pieces: if the algebraic
endomorphisms preserving `H^i` have characteristic polynomials on `H^i` with coefficients in
`F`, an algebraic bijection `u : H^{2n−i} → H^i` gives an algebraic inverse of
`L^{n−i} : H^i → H^{2n−i}`. -/
theorem exists_inverse_L_pow_of_charpoly [FiniteDimensional K H] {i : ℕ} (hi : i ≤ n)
    (hD : ∀ g ∈ 𝔄.𝒜, ∀ hg : (∀ x ∈ S.grade i, g x ∈ S.grade i), ∀ j,
      (LinearMap.restrict g hg).charpoly.coeff j ∈ 𝔄.F)
    {u : Module.End K H} (hu : u ∈ 𝔄.𝒜) (hu_bij : Set.BijOn u (S.grade (2 * n - i)) (S.grade i)) :
    ∃ w ∈ 𝔄.𝒜, Set.MapsTo w (S.grade (2 * n - i)) (S.grade i) ∧
      (∀ x ∈ S.grade i, w ((S.L ^ (n - i)) x) = x) ∧
      ∀ y ∈ S.grade (2 * n - i), (S.L ^ (n - i)) (w y) = y := by
  sorry

/-- **Layer 1.3.** With algebraic grade projectors, the criterion makes `Λ` algebraic. -/
theorem lambdaAlgebraic_of_charpoly [FiniteDimensional K H] (hπ : ProjectorsAlgebraic 𝔄)
    (hD : ∀ i, ∀ g ∈ 𝔄.𝒜, ∀ hg : (∀ x ∈ S.grade i, g x ∈ S.grade i), ∀ j,
      (LinearMap.restrict g hg).charpoly.coeff j ∈ 𝔄.F)
    (u : ℕ → Module.End K H) (hu : ∀ i ≤ n, u i ∈ 𝔄.𝒜)
    (hu_bij : ∀ i ≤ n, Set.BijOn (u i) (S.grade (2 * n - i)) (S.grade i)) :
    LambdaAlgebraic 𝔄 := by
  sorry

/-- **Layer 1.4.** An algebraic Lefschetz inverse and positivity give nondegeneracy on algebraic
classes, for a pairing compatible with the grading and with `L`. -/
theorem pairingNondegenerate_of_lambdaAlgebraic_of_positive [CharZero K] [FiniteDimensional K H]
    (hpair : S.IsCompatiblePairing pair) (hΛ : LambdaAlgebraic 𝔄)
    (hpos : PositiveOnAlgebraicPrimitive 𝔄 pair) : PairingNondegenerateOnAlgebraic 𝔄 pair := by
  sorry

end LefschetzStructure

end TauCetiRoadmap.LefschetzStructures
