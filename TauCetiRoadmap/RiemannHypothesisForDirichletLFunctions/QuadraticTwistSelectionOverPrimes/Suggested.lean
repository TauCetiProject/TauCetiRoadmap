import Mathlib

/-!
# Quadratic twists selected over primes: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. All five are
statable at the pins, and all five are stated below:

* the exception-free orthogonality of Jacobi symbols over the primes of a residue class (2.7a (iv)),
  `abs_sum_jacobiSym_primes_le`, this roadmap's own corollary;
* twist selection (2.7c), `twistSelection`, and its form with box width `1/400` that the formal
  proof proves (2.7c (a′)–(c′)), `twistSelection_fixedWidth`;
* twist selection in two steps, with conductor bounds (2.7d (ii), which contains 2.7d (i) as the
  case `F₁ = N₀`, `F₂(q) = N₀ q`), `twistSelection_two_of_conductorBound`, and its form with box
  width `1/400` (2.7d (ii′)), `twistSelection_two_of_conductorBound_fixedWidth`.

`twistSelection` and `twistSelection_two_of_conductorBound` are this roadmap's generalisations; the
two theorems with box width `1/400` are the forms that the formal proof proves and that the rest of
the family uses.

The carriers are Mathlib's: `jacobiSym`, `Nat.Prime`, `Nat.ModEq`, `Nat.totient`,
`ArithmeticFunction.vonMangoldt`, `DirichletCharacter`, `DirichletCharacter.IsPrimitive` and
`DirichletCharacter.LFunction`. Five definitions with real bodies make the statements readable:
the set `P(m₀, a₀; U)` (`primesInClass`), the expression `G_χ(y)` (`rieszRemainder`), the
hypotheses of the general statement of 2.7c on `(m₀, a₀, U, F)` at the scale `Y`
(`SelectionHypotheses`), the selection hypotheses with exponent `ε₀` of the form with box width
`1/400` (`FixedWidthSelectionHypotheses`) and the conclusions (a)–(c) of 2.7c for one character
with box height `H` (`TwistBounds`).

The primitive character inducing `ξ·(·/q)` (and, in 2.7d, `ξ·(·/q)^i·(·/d)^j`) is not constructed:
a primitive Dirichlet character is determined by its values at the integers prime to any multiple
of its conductor, so each statement quantifies over every primitive `χ` that agrees with
`n ↦ ξ(n)·(n/q)` at the integers `n` prime to `cond(ξ)·q` (respectively `cond(ξ)·q·d`), and that
`χ` is the character of the README. The finite set `Ξ` of characters is a family indexed by a
finite type of cardinality at most `R`.

The other targets of the roadmap (reciprocity on a residue class and the nontriviality on the class
of `1` in 2.7a (i)–(ii), the form of 2.7a (iii) with an exceptional modulus, and the mean-square,
window and maximal statements of 2.7b, with their forms 2.7a (i′), (iii′) and 2.7b (ii′), (iv′))
are steps of the route to these headlines and are not stated here.
-/

open ArithmeticFunction

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.QuadraticTwistSelectionOverPrimes

/-- The set `P(m₀, a₀; U)` of the primes `q ≡ a₀ (mod m₀)` with `√U < q ≤ U`. -/
noncomputable def primesInClass (m₀ a₀ : ℕ) (U : ℝ) : Finset ℕ := by
  classical
  exact (Finset.Iic ⌊U⌋₊).filter fun q => q.Prime ∧ q ≡ a₀ [MOD m₀] ∧ √U < q

/-- The expression `G_χ(y) = Σ_{n ≤ y} Λ(n) χ(n) (y/n − 1) + y (L′/L)(1, χ)` of a Dirichlet
character `χ`, with `(L′/L)(1, χ)` the quotient of the derivative of `DirichletCharacter.LFunction χ`
at `1` by its value there (nonzero for nonprincipal `χ`). For primitive `χ` this is the Riesz
remainder of RiemannHypothesisStatementsAndConsequences §8.4a (b), restated on Mathlib's carriers. -/
noncomputable def rieszRemainder {M : ℕ} [NeZero M] (χ : DirichletCharacter ℂ M) (y : ℝ) : ℂ :=
  (∑ n ∈ Finset.Icc 1 ⌊y⌋₊, (Λ n : ℂ) * χ (n : ZMod M) * ((y / n - 1 : ℝ) : ℂ)) +
    (y : ℂ) * (deriv (DirichletCharacter.LFunction χ) 1 / DirichletCharacter.LFunction χ 1)

/-- The hypotheses of 2.7c on `(m₀, a₀, U, F)` at the scale `Y`, with constant `C₁`, window
exponent `K`, box width `δ₀` and exponents `a, b`: `m₀ ≥ 1`, `a₀` prime to `m₀`, `U ≥ 4`,
`C₁ log Y · (log m₀ + log Y) ≤ log U`, `1 ≤ F ≤ U^(1/2)`, `log(FU) ≤ Y^b`, and at most `Y^a` primes
`p ≤ Y^(K/δ₀)` divide `m₀`. These are this roadmap's generalisation, not hypotheses of the formal
proof, whose form is `FixedWidthSelectionHypotheses`. -/
def SelectionHypotheses (C₁ Y K δ₀ a b : ℝ) (m₀ a₀ : ℕ) (U F : ℝ) : Prop := by
  classical
  exact 0 < m₀ ∧ a₀.Coprime m₀ ∧ 4 ≤ U ∧
    C₁ * Real.log Y * (Real.log m₀ + Real.log Y) ≤ Real.log U ∧ 1 ≤ F ∧ F ≤ √U ∧
    Real.log (F * U) ≤ Y ^ b ∧
    ((m₀.primeFactors.filter fun p : ℕ => (p : ℝ) ≤ Y ^ (K / δ₀)).card : ℝ) ≤ Y ^ a

/-- The selection hypotheses with exponent `ε₀` on `(m₀, a₀, U, F)` at the scale `Y`, with window
exponent `K` (the hypotheses of 2.7c (a′)–(c′)): `m₀ ≥ 1`, `8 ∣ m₀`, `a₀` prime to `m₀`,
`(1/4) (log Y)² log m₀ ≤ log U`, `Y^(ε₀/6) ≤ log U ≤ Y^(ε₀/5) (log Y)²`, `1 ≤ F ≤ U^(1/2)`, and
every prime `p ∣ m₀` satisfies `p ≤ Y^(ε₀/5)` or `p > Y^(400K)`. These are the hypotheses of the
form with box width `1/400` that the formal proof proves. -/
def FixedWidthSelectionHypotheses (ε₀ Y K : ℝ) (m₀ a₀ : ℕ) (U F : ℝ) : Prop :=
  0 < m₀ ∧ 8 ∣ m₀ ∧ a₀.Coprime m₀ ∧
    1 / 4 * Real.log Y ^ 2 * Real.log m₀ ≤ Real.log U ∧
    Y ^ (ε₀ / 6) ≤ Real.log U ∧ Real.log U ≤ Y ^ (ε₀ / 5) * Real.log Y ^ 2 ∧
    1 ≤ F ∧ F ≤ √U ∧
    ∀ p : ℕ, p.Prime → p ∣ m₀ → (p : ℝ) ≤ Y ^ (ε₀ / 5) ∨ (Y ^ K) ^ 400 < (p : ℝ)

/-- The conclusions (a)–(c) of 2.7c for a Dirichlet character `χ` with box height `H`:
(a) `L(s, χ) ≠ 0` for `Re s > 1 − δ₀` and `|Im s| ≤ H`;
(b) `|(L′/L)(1, χ)| ≤ ((2 + ε)/δ₀) log log H + C₂`;
(c) `|G_χ(y)| ≤ y^(1/2 + τ)` for every `y ∈ [Y, Y^K]`. -/
def TwistBounds {M : ℕ} [NeZero M] (χ : DirichletCharacter ℂ M) (δ₀ ε C₂ H Y K τ : ℝ) : Prop :=
  (∀ s : ℂ, 1 - δ₀ < s.re → |s.im| ≤ H → DirichletCharacter.LFunction χ s ≠ 0) ∧
    ‖deriv (DirichletCharacter.LFunction χ) 1 / DirichletCharacter.LFunction χ 1‖ ≤
      (2 + ε) / δ₀ * Real.log (Real.log H) + C₂ ∧
    ∀ y ∈ Set.Icc Y (Y ^ K), ‖rieszRemainder χ y‖ ≤ y ^ (1 / 2 + τ)

/-! ## Layer 2: Quadratic twists over primes in a progression and twist selection -/

/-- **Jacobi symbols over the primes of a residue class, exception-free form** (2.7a (iv)).
There are absolute `L, c, C` with `L, c > 0` such that for `8 ∣ m₀`, `a₀` prime to `m₀`, `U ≥ 4`
and every odd squarefree `s > 1` prime to `m₀` with `m₀ s ≤ U^(1/L)`, the set
`P = P(m₀, a₀; U)` satisfies
`|Σ_{q ∈ P} (q/s)| ≤ C |P| (e^(−c log U / log(m₀ s)) + e^(−c √(log U)))` and
`|P| ≥ U / (3 φ(m₀) log U)`. This is this roadmap's own corollary, through the exclusion of
Landau–Siegel zeros, and not a statement of the formal proof. -/
theorem abs_sum_jacobiSym_primes_le :
    ∃ L c C : ℝ, 0 < L ∧ 0 < c ∧
      ∀ (m₀ a₀ s : ℕ) (U : ℝ), 8 ∣ m₀ → a₀.Coprime m₀ → 4 ≤ U →
        Odd s → Squarefree s → 1 < s → s.Coprime m₀ →
        ((m₀ * s : ℕ) : ℝ) ≤ U ^ (1 / L) →
        |((∑ q ∈ primesInClass m₀ a₀ U, jacobiSym q s : ℤ) : ℝ)| ≤
            C * (primesInClass m₀ a₀ U).card *
              (Real.exp (-c * Real.log U / Real.log (m₀ * s)) +
                Real.exp (-c * √(Real.log U))) ∧
          U / (3 * m₀.totient * Real.log U) ≤ (primesInClass m₀ a₀ U).card := by
  sorry

/-- **Twist selection** (2.7c). Fix a box width `δ₀ ∈ (0, 1/12)`. There is `C₂`, a function of
`ε` alone (so depending only on `(δ₀, ε)`), such that for `K ≥ 1`, `τ > 0`, `η > 0`, `R ∈ ℕ`,
`0 < b < 1/4` and `0 ≤ a < 1/2` there are `C₁` and `Y₀` (depending only on
`(δ₀, K, τ, η, R, a, b)`) with the following property. For every `ε > 0`, every `Y ≥ Y₀`, every
`(m₀, a₀, U, F)` satisfying the hypotheses of 2.7c (`SelectionHypotheses`) and every family `ξ` of
at most `R` primitive Dirichlet characters of conductor `≤ F`, the set `P = P(m₀, a₀; U)` is
nonempty and all but at most `η |P|` primes `q ∈ P` satisfy, for every `ξ` of the family and the
primitive character `χ` inducing `ξ·(·/q)`, the conclusions (a)–(c) of 2.7c with box height `FU`
(`TwistBounds`). This is this roadmap's generalisation, not a statement of the formal proof, whose
form is `twistSelection_fixedWidth`. -/
theorem twistSelection (δ₀ : ℝ) (hδ₀ : 0 < δ₀) (hδ₀' : δ₀ < 1 / 12) :
    ∃ C₂ : ℝ → ℝ, ∀ (K τ η a b : ℝ) (R : ℕ), 1 ≤ K → 0 < τ → 0 < η → 0 < b → b < 1 / 4 →
      0 ≤ a → a < 1 / 2 → ∃ C₁ Y₀ : ℝ, ∀ ε : ℝ, 0 < ε → ∀ Y : ℝ, Y₀ ≤ Y →
      ∀ (m₀ a₀ : ℕ) (U F : ℝ) (ι : Type) [Fintype ι] (N : ι → ℕ) [∀ i, NeZero (N i)]
        (ξ : ∀ i, DirichletCharacter ℂ (N i)),
        SelectionHypotheses C₁ Y K δ₀ a b m₀ a₀ U F → Fintype.card ι ≤ R →
        (∀ i, (ξ i).IsPrimitive) → (∀ i, (N i : ℝ) ≤ F) →
        (primesInClass m₀ a₀ U).Nonempty ∧
          ∃ G ⊆ primesInClass m₀ a₀ U,
            ((primesInClass m₀ a₀ U).card : ℝ) - G.card ≤ η * (primesInClass m₀ a₀ U).card ∧
            ∀ q ∈ G, ∀ i, ∀ (M : ℕ) [NeZero M] (χ : DirichletCharacter ℂ M), χ.IsPrimitive →
              (∀ n : ℕ, n.Coprime (N i * q) → χ n = ξ i n * (jacobiSym n q : ℂ)) →
              TwistBounds χ δ₀ ε (C₂ ε) (F * U) Y K τ := by
  sorry

/-- **Twist selection with box width `1/400`** (2.7c (a′)–(c′)), the form that the formal proof
proves. There is an absolute `C₂` such that for `0 < ε₀ ≤ 1/4`, `K ≥ 1`, `τ > 0`, `η > 0` and
`R ∈ ℕ` there is `Y₀` with the following property. For every `Y ≥ Y₀`, every `(m₀, a₀, U, F)`
satisfying the selection hypotheses with exponent `ε₀` (`FixedWidthSelectionHypotheses`) and every
family `ξ` of at most `R` primitive Dirichlet characters of conductor `≤ F`, the set
`P = P(m₀, a₀; U)` is nonempty and all but at most `η |P|` primes `q ∈ P` satisfy, for every `ξ` of
the family and the primitive character `χ` inducing `ξ·(·/q)`, the conclusions (a′)–(c′) of 2.7c
with box height `FU`: `TwistBounds` at box width `1/400` and `ε = 1/2`, where its bound (b) reads
`1000 log log (FU) + C₂`. The bound `C log Y` of (b′) follows from this one for large `Y`. -/
theorem twistSelection_fixedWidth :
    ∃ C₂ : ℝ, ∀ (ε₀ K τ η : ℝ) (R : ℕ), 0 < ε₀ → ε₀ ≤ 1 / 4 → 1 ≤ K → 0 < τ → 0 < η →
      ∃ Y₀ : ℝ, ∀ Y : ℝ, Y₀ ≤ Y →
      ∀ (m₀ a₀ : ℕ) (U F : ℝ) (ι : Type) [Fintype ι] (N : ι → ℕ) [∀ i, NeZero (N i)]
        (ξ : ∀ i, DirichletCharacter ℂ (N i)),
        FixedWidthSelectionHypotheses ε₀ Y K m₀ a₀ U F → Fintype.card ι ≤ R →
        (∀ i, (ξ i).IsPrimitive) → (∀ i, (N i : ℝ) ≤ F) →
        (primesInClass m₀ a₀ U).Nonempty ∧
          ∃ G ⊆ primesInClass m₀ a₀ U,
            ((primesInClass m₀ a₀ U).card : ℝ) - G.card ≤ η * (primesInClass m₀ a₀ U).card ∧
            ∀ q ∈ G, ∀ i, ∀ (M : ℕ) [NeZero M] (χ : DirichletCharacter ℂ M), χ.IsPrimitive →
              (∀ n : ℕ, n.Coprime (N i * q) → χ n = ξ i n * (jacobiSym n q : ℂ)) →
              TwistBounds χ (1 / 400) (1 / 2) C₂ (F * U) Y K τ := by
  sorry

/-- **Twist selection in two steps, with conductor bounds** (2.7d (ii); its case `F₁ = N₀`,
`F₂(q) = N₀ q` is 2.7d (i)). Fix `δ₀ ∈ (0, 1/12)`. There is `C₂`, a function of `ε` alone (so
depending only on `(δ₀, ε)`, as in 2.7c), such that for `K, τ, η, a, b` as in 2.7c and a bound `R`
on the number of characters there are `C₁` and `Y₀` with the following property for every `ε > 0`
and `Y ≥ Y₀`. Let `N₀ ≥ 1`, let `ξ` be a family of at most `R` primitive
characters of conductor `≤ N₀`, let `F₁ ≥ N₀` and let `(m₁, a₁, U₁, F₁)` satisfy the hypotheses of
2.7c; for each `q ∈ P(m₁, a₁; U₁)` let `F₂(q) ≥ N₀ q` and let `(m₂(q), a₂(q), U₂, F₂(q))` satisfy
them. Then both sets of primes are nonempty, and a proportion at least `1 − η` of the
`q ∈ P(m₁, a₁; U₁)`, and for each such `q` a proportion at least `1 − η` of the
`d ∈ P(m₂(q), a₂(q); U₂)`, have the property: for every `ξ` of the family and
`(i, j) ∈ {0,1}² ∖ {(0,0)}`, the primitive character inducing `ξ·(·/q)^i·(·/d)^j` satisfies (a)–(c)
of 2.7c, with box height `F₁ U₁` if `j = 0` and `F₂(q) U₂` if `j = 1`. This is this roadmap's
generalisation, not a statement of the formal proof, whose form is
`twistSelection_two_of_conductorBound_fixedWidth`. -/
theorem twistSelection_two_of_conductorBound (δ₀ : ℝ) (hδ₀ : 0 < δ₀) (hδ₀' : δ₀ < 1 / 12) :
    ∃ C₂ : ℝ → ℝ, ∀ (K τ η a b : ℝ) (R : ℕ), 1 ≤ K → 0 < τ → 0 < η → 0 < b → b < 1 / 4 →
      0 ≤ a → a < 1 / 2 → ∃ C₁ Y₀ : ℝ, ∀ ε : ℝ, 0 < ε → ∀ Y : ℝ, Y₀ ≤ Y →
      ∀ (N₀ : ℝ) (ι : Type) [Fintype ι] (N : ι → ℕ) [∀ i, NeZero (N i)]
        (ξ : ∀ i, DirichletCharacter ℂ (N i))
        (m₁ a₁ : ℕ) (U₁ F₁ : ℝ) (m₂ a₂ : ℕ → ℕ) (U₂ : ℝ) (F₂ : ℕ → ℝ),
        1 ≤ N₀ → Fintype.card ι ≤ R → (∀ i, (ξ i).IsPrimitive) → (∀ i, (N i : ℝ) ≤ N₀) →
        N₀ ≤ F₁ → SelectionHypotheses C₁ Y K δ₀ a b m₁ a₁ U₁ F₁ →
        (∀ q ∈ primesInClass m₁ a₁ U₁, N₀ * q ≤ F₂ q ∧
          SelectionHypotheses C₁ Y K δ₀ a b (m₂ q) (a₂ q) U₂ (F₂ q)) →
        (primesInClass m₁ a₁ U₁).Nonempty ∧
          (∀ q ∈ primesInClass m₁ a₁ U₁, (primesInClass (m₂ q) (a₂ q) U₂).Nonempty) ∧
          ∃ G₁ ⊆ primesInClass m₁ a₁ U₁,
            (1 - η) * (primesInClass m₁ a₁ U₁).card ≤ G₁.card ∧
            ∀ q ∈ G₁,
              (∀ i, ∀ (M : ℕ) [NeZero M] (χ : DirichletCharacter ℂ M), χ.IsPrimitive →
                (∀ n : ℕ, n.Coprime (N i * q) → χ n = ξ i n * (jacobiSym n q : ℂ)) →
                TwistBounds χ δ₀ ε (C₂ ε) (F₁ * U₁) Y K τ) ∧
              ∃ G₂ ⊆ primesInClass (m₂ q) (a₂ q) U₂,
                (1 - η) * (primesInClass (m₂ q) (a₂ q) U₂).card ≤ G₂.card ∧
                ∀ d ∈ G₂, ∀ i, ∀ k ∈ ({0, 1} : Finset ℕ),
                  ∀ (M : ℕ) [NeZero M] (χ : DirichletCharacter ℂ M), χ.IsPrimitive →
                  (∀ n : ℕ, n.Coprime (N i * q * d) →
                    χ n = ξ i n * (jacobiSym n q : ℂ) ^ k * (jacobiSym n d : ℂ)) →
                  TwistBounds χ δ₀ ε (C₂ ε) (F₂ q * U₂) Y K τ := by
  sorry

/-- **Twist selection in two steps with box width `1/400`** (2.7d (ii′)), the form of the formal
proof. There is an absolute `C₂` such that for `ε₁, ε₂ ∈ (0, 1/4]`, `K ≥ 1`, `τ, η > 0` and a bound
`R` on the number of characters there is `Y₀` with the following property for `Y ≥ Y₀`. Let
`N₀ ≥ 1`, let `ξ` be a family of at most `R` primitive characters of conductor `≤ N₀`, let
`F₁ ≥ N₀` and let `(m₁, a₁, U₁, F₁)` satisfy the selection hypotheses with exponent `ε₁`; for each
`q ∈ P(m₁, a₁; U₁)` let `F₂(q) ≥ N₀ q` and let `(m₂(q), a₂(q), U₂, F₂(q))` satisfy them with
exponent `ε₂`. Then both sets of primes are nonempty, and a proportion at least `1 − η` of the
`q ∈ P(m₁, a₁; U₁)`, and for each such `q` a proportion at least `1 − η` of the
`d ∈ P(m₂(q), a₂(q); U₂)`, have the property: for every `ξ` of the family and
`(i, j) ∈ {0,1}² ∖ {(0,0)}`, the primitive character inducing `ξ·(·/q)^i·(·/d)^j` satisfies
(a′)–(c′) of 2.7c, with box height `F₁ U₁` if `j = 0` and `F₂(q) U₂` if `j = 1`. -/
theorem twistSelection_two_of_conductorBound_fixedWidth :
    ∃ C₂ : ℝ, ∀ (ε₁ ε₂ K τ η : ℝ) (R : ℕ), 0 < ε₁ → ε₁ ≤ 1 / 4 → 0 < ε₂ → ε₂ ≤ 1 / 4 →
      1 ≤ K → 0 < τ → 0 < η → ∃ Y₀ : ℝ, ∀ Y : ℝ, Y₀ ≤ Y →
      ∀ (N₀ : ℝ) (ι : Type) [Fintype ι] (N : ι → ℕ) [∀ i, NeZero (N i)]
        (ξ : ∀ i, DirichletCharacter ℂ (N i))
        (m₁ a₁ : ℕ) (U₁ F₁ : ℝ) (m₂ a₂ : ℕ → ℕ) (U₂ : ℝ) (F₂ : ℕ → ℝ),
        1 ≤ N₀ → Fintype.card ι ≤ R → (∀ i, (ξ i).IsPrimitive) → (∀ i, (N i : ℝ) ≤ N₀) →
        N₀ ≤ F₁ → FixedWidthSelectionHypotheses ε₁ Y K m₁ a₁ U₁ F₁ →
        (∀ q ∈ primesInClass m₁ a₁ U₁, N₀ * q ≤ F₂ q ∧
          FixedWidthSelectionHypotheses ε₂ Y K (m₂ q) (a₂ q) U₂ (F₂ q)) →
        (primesInClass m₁ a₁ U₁).Nonempty ∧
          (∀ q ∈ primesInClass m₁ a₁ U₁, (primesInClass (m₂ q) (a₂ q) U₂).Nonempty) ∧
          ∃ G₁ ⊆ primesInClass m₁ a₁ U₁,
            (1 - η) * (primesInClass m₁ a₁ U₁).card ≤ G₁.card ∧
            ∀ q ∈ G₁,
              (∀ i, ∀ (M : ℕ) [NeZero M] (χ : DirichletCharacter ℂ M), χ.IsPrimitive →
                (∀ n : ℕ, n.Coprime (N i * q) → χ n = ξ i n * (jacobiSym n q : ℂ)) →
                TwistBounds χ (1 / 400) (1 / 2) C₂ (F₁ * U₁) Y K τ) ∧
              ∃ G₂ ⊆ primesInClass (m₂ q) (a₂ q) U₂,
                (1 - η) * (primesInClass (m₂ q) (a₂ q) U₂).card ≤ G₂.card ∧
                ∀ d ∈ G₂, ∀ i, ∀ k ∈ ({0, 1} : Finset ℕ),
                  ∀ (M : ℕ) [NeZero M] (χ : DirichletCharacter ℂ M), χ.IsPrimitive →
                  (∀ n : ℕ, n.Coprime (N i * q * d) →
                    χ n = ξ i n * (jacobiSym n q : ℂ) ^ k * (jacobiSym n d : ℂ)) →
                  TwistBounds χ (1 / 400) (1 / 2) C₂ (F₂ q * U₂) Y K τ := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.QuadraticTwistSelectionOverPrimes
