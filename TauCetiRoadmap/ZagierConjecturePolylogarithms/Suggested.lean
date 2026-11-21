import Mathlib

/-!
# Polylogarithms, Part II: the weight-four Zagier theorem: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs: the weight-four Zagier theorem of Goncharov and Rudenko for
every number field, as rational existence of explicit weight-four cycles and as rationality of
the zeta-normalized `L₄` determinant of every family of explicit weight-four cycles. The source
states its Theorem 1.2 for the inductively defined groups; explicit existence is stronger than
that statement and explicit every-family rationality is a consequence of it (README §6.4). For
fields with a complex place the roadmap's proof of existence uses the combinatorial lift
`G₄(F) → L₄(F)` of README §5.7, three steps of which no cited source proves. The every-family
statement does not use that lift.

The explicit cycle condition is written on native carriers by testing the raw cobracket
`[x] ↦ [x]₃ ⊗ u(x)` against every function on the field that satisfies the explicit
weight-three presentation (Polylogarithms §§3.1–3.2 and §4.5); by the quotient universal
property this is membership in the kernel of that map into `B₃(F) ⊗ U(F)`. The analytic
functions are restated by the formulas of PolylogarithmFunctions.

The following headline theorems are not statable at the pins, and nothing is stated in their
place.

* The weight-four extension theorem `0 → B₄(F) → L₄(F) → Λ²B₂(F) → 0`, the cluster chain map
  and the descent of the weight-four cobracket: the pins have no carrier for the
  Goncharov–Rudenko group `L₄(F)`, the quotient of single and double symbols by the heptagon
  relation and its iterated one-parameter specializations, nor for the rational pre-Bloch group.
* The realization of the combinatorial Lie coalgebra by motivic correlators over a number field
  and by Hodge correlator variations over a smooth complex variety, base-point change, depth
  reduction and the period of every explicit cycle in the motivic Lie coalgebra: the pins have no
  mixed Tate motives over a number field, no motivic fundamental groupoid of a punctured line, no
  framed mixed Hodge–Tate structures and no variations of mixed Hodge structures.
* Collision continuity of Hodge correlators: the pins have no Hodge correlator integrals over
  plane trivalent trees.
* The Grassmannian configuration chain map and the generic polylogarithmic Chern cocycle: the pins
  have no configuration complexes of generic vectors, no Grassmannian group `G₄(F)` and no real
  Deligne cohomology of the simplicial classifying varieties.
* The maps `K_{8-i}(F)_ℚ → H^i Γ(F,4)` and the comparison of `L₄ ∘ κ` with the Borel regulator:
  the pins have no higher Quillen K-groups of a field and no Borel regulator.
-/

namespace TauCetiRoadmap.ZagierConjecturePolylogarithms

open scoped Classical TensorProduct BigOperators
open NumberField

universe u

/-! ## Layer 6: the explicit weight-four Zagier theorem -/

/-- The natural-index classical polylogarithm `Liₙ`, with the lower boundary value on the cut:
the formula of PolylogarithmFunctions §1.1 for `n ≥ 1`, restated so that the headline typechecks
at the pins. -/
noncomputable def polylog (n : ℕ) (z : ℂ) : ℂ :=
  if n = 0 then z / (1 - z)
  else if n = 1 then -Complex.log (1 - z)
  else ((n - 2).factorial : ℂ)⁻¹ *
    ∫ t : ℝ in (0 : ℝ)..1,
      ((-Real.log t : ℝ) : ℂ) ^ (n - 2) * (-Complex.log (1 - (t : ℂ) * z)) / (t : ℂ)

/-- Zagier's real single-valued polylogarithm `Lₙ` (PolylogarithmFunctions §4.2): the real part
for odd `n` and the imaginary part for even `n` of `∑_{k<n} 2^k B_k / k! · Li_{n-k}(z) · log^k|z|`,
with `B₁ = -1/2`, `Lₙ(0) = 0`, and `Lₙ(1)` equal to `ζ(n)` for odd `n ≥ 3` and `0` for even `n`
(the branch at `n = 1`, where `L₁(1)` is undefined, is a junk value that no statement uses). -/
noncomputable def singleValued (n : ℕ) (z : ℂ) : ℝ :=
  if z = 0 then 0
  else if z = 1 then (if Odd n then (riemannZeta n).re else 0)
  else
    let w : ℂ := ∑ k ∈ Finset.range n,
      ((2 : ℂ) ^ k * (bernoulli k : ℂ) / (k.factorial : ℂ)) *
        polylog (n - k) z * (Real.log ‖z‖ : ℂ) ^ k
    if Odd n then w.re else w.im

/-- The rationalized unit vector `u(x) ∈ ℚ ⊗ Fˣ`; zero is assigned the zero vector. -/
noncomputable def unitVector {F : Type u} [Field F] (x : F) : ℚ ⊗[ℤ] Additive Fˣ :=
  if h : x = 0 then 0 else (1 : ℚ) ⊗ₜ[ℤ] Additive.ofMul (Units.mk0 x h)

/-- One cyclic block `T(a,c,d)` of Goncharov's coordinate 22-term trilogarithm relation, with
`A = da - a + 1` and `B = cd - d + 1` (Polylogarithms §3.1). -/
def trilogCyclic {F : Type u} [Field F] {V : Type u} [AddCommGroup V]
    (b : F → V) (a c d : F) : V :=
  let A := d * a - a + 1
  let B := c * d - d + 1
  b A + b (A / (d * a)) + b d + b (B / (A * c)) - b (A / d) +
    b (-B * a / A) - b (B / (A * c * d)) - b 1

/-- Functions on the field satisfying exactly the defining relations of the explicit rational
weight-three group `B₃(F)` of Polylogarithms §3.1: the zero endpoint, inversion, the three-term
relation with the endpoint `[1]` retained, and the coordinate 22-term relation at every admissible
triple. -/
def TrilogRelationFunction {F : Type u} [Field F] {V : Type u}
    [AddCommGroup V] [Module ℚ V] (b : F → V) : Prop :=
  b 0 = 0 ∧
  (∀ x : F, x ≠ 0 → b x = b x⁻¹) ∧
  (∀ x : F, x ≠ 0 → b x + b (1 - x) + b (1 - x⁻¹) = b 1) ∧
  ∀ a c d : F, a ≠ 0 → c ≠ 0 → d ≠ 0 →
    d * a - a + 1 ≠ 0 → a * c - c + 1 ≠ 0 → c * d - d + 1 ≠ 0 →
    trilogCyclic b a c d + trilogCyclic b c d a + trilogCyclic b d a c +
      b (-a * c * d) = 0

/-- A finite rational symbol sum `c = ∑ aₓ[x]` is an explicit weight-four cycle when
`∑ aₓ b(x) ⊗ u(x)` vanishes for every function `b` satisfying the explicit weight-three
presentation. By the quotient universal property this is the vanishing of
`∑ aₓ [x]₃ ⊗ u(x)` in `B₃(F) ⊗ U(F)`, the explicit raw weight-four cycles of Polylogarithms §4.5. -/
def IsCycle4 {F : Type u} [Field F] (c : F →₀ ℚ) : Prop :=
  ∀ (V : Type u) [AddCommGroup V] [Module ℚ V] (b : F → V),
    TrilogRelationFunction b →
      c.sum (fun x a => a • (b x ⊗ₜ[ℚ] unitVector x)) = 0

/-- The weight-four period matrix: rows are the complex places of `F`, each through its chosen
embedding into `ℂ`; columns are symbol families; the entry is `∑ₓ c_j(x) L₄(σᵢ(x))`. -/
noncomputable def periodMatrixFour (F : Type u) [Field F] [NumberField F]
    (c : {w : InfinitePlace F // w.IsComplex} → F →₀ ℚ) :
    Matrix {w : InfinitePlace F // w.IsComplex} {w : InfinitePlace F // w.IsComplex} ℝ :=
  fun i j => (c j).sum (fun x a => (a : ℝ) * singleValued 4 ((i : InfinitePlace F).embedding x))

/-- The zeta-normalized weight-four determinant
`Z₄(F; y) = π^(4(r₁+r₂)) · |disc F|^(-1/2) · det(L₄(σᵢ(yⱼ)))`, with the empty determinant equal
to one when `F` is totally real. -/
noncomputable def zagierDeterminantFour (F : Type u) [Field F] [NumberField F]
    (c : {w : InfinitePlace F // w.IsComplex} → F →₀ ℚ) : ℝ :=
  Real.pi ^ (4 * (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F)) /
    Real.sqrt |(NumberField.discr F : ℝ)| * (periodMatrixFour F c).det

/-- Zagier's weight-four conjecture, existence (Goncharov–Rudenko, Theorem 1.2, p. 5, stated there
for the inductively defined groups; here for explicit cycles, which is stronger, README §6.4): for
every number field `F` there are `r₂` explicit weight-four cycles whose zeta-normalized `L₄`
determinant is a nonzero rational multiple of `ζ_F(4)`. For `r₂ > 0` rescaling one family makes
the multiple one; for `r₂ = 0` the determinant is empty and the multiple is fixed (over `ℚ` it is
`90`). For `r₂ > 0` the roadmap's proof uses the combinatorial lift `G₄(F) → L₄(F)` of README
§5.7, which the source reaches only through its motivic image over number fields. -/
theorem zagier_four_exists (F : Type u) [Field F] [NumberField F] :
    ∃ c : {w : InfinitePlace F // w.IsComplex} → F →₀ ℚ,
      (∀ j, IsCycle4 (c j)) ∧ ∃ q : ℚ, q ≠ 0 ∧
        zagierDeterminantFour F c = (q : ℝ) * (NumberField.dedekindZeta F 4).re := by
  sorry

/-- Zagier's weight-four conjecture, every family (Goncharov–Rudenko, Theorem 1.2, p. 5, stated
there for the inductively defined groups, of which this is a consequence; README §6.3 proves it
for explicit cycles without the lift of README §5.7): for every family of `r₂` explicit
weight-four cycles the zeta-normalized `L₄` determinant is a rational, possibly zero, multiple of
`ζ_F(4)`. -/
theorem zagier_four_everyFamily (F : Type u) [Field F] [NumberField F]
    (c : {w : InfinitePlace F // w.IsComplex} → F →₀ ℚ) (hc : ∀ j, IsCycle4 (c j)) :
    ∃ q : ℚ, zagierDeterminantFour F c = (q : ℝ) * (NumberField.dedekindZeta F 4).re := by
  sorry

end TauCetiRoadmap.ZagierConjecturePolylogarithms
