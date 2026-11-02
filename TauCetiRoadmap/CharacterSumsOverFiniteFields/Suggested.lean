import Mathlib

/-!
# Character sums over finite fields: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need (the canonical additive character, the lifts of characters
through norm and trace, the multiple Jacobi and Jacobsthal sums, the `L`-series of a monic
multiplicative function, the Kloosterman sum, the Chinese-remainder factors of a Dirichlet
character). Every definition has a real body on Mathlib's carriers; nothing in the README's API
lists or Checks is restated here. The headline results are the cyclotomic field of definition,
multiple Jacobi and diagonal-solution formulas, Jacobsthal evaluations, the root-power and lifting
identities, uniform Stepanov bounds, character-sum L-polynomials and Weil bounds, Salié and
Kloosterman evaluations and bounds, and the global valuation and p-adic comparisons of Layer 6.

The carrier is a finite field `F` (`[Field F] [Fintype F]`) with Mathlib's multiplicative
characters `MulChar F ℂ` and additive characters `AddChar F ℂ`; the Gauss and Jacobi sums are
Mathlib's `gaussSum` and `jacobiSum`, never redefined. Four conventions are visible in the
signatures. The canonical additive character is `stdAddChar F`, `x ↦ e(Tr_{F/𝔽_p}(x)/p)`, and
`gauss χ` abbreviates `gaussSum χ (stdAddChar F)`; every additive character is a `mulShift` of it
(README §0.2). `χ 0 = 0` for every character including `χ = 1`, so `gauss 1 = -1`
and `jacobiSum 1 1 = q - 2` (Mathlib's convention and the LMFDB's). The Kloosterman sum
`kloostermanSum χ ψ a b` is a sum over the **units** of an arbitrary finite commutative ring, so
the finite-field sums of Layer 5 and the integer-modulus sums `S_χ(m, n; c)` of Layer 7 are one
definition, the latter read on `ZMod c` with `ZMod.stdAddChar` and
`DirichletCharacter.changeLevel`. The Hasse–Davenport relation and the root-power identity carry
their minus signs: `-g' = (-g)^n` and `S_n = -∑ ω_i^n`.

Not statable at the pins, and therefore stated in `README.md` only: the Teichmüller character
`ω_𝔓` of 6.1 (its carrier is a multiplicative character of the residue field of a prime of
`ℚ(ζ_{q−1})` with values in the ring of integers, whose construction is itself the bijection
between roots of unity and the residue field supplied by ClassicalArithmeticCompletion §1.23;
6.1 specializes its power residue symbol at order q − 1), and with it the Stickelberger
corollaries 6.2, the Jacobi digit-sum formula 6.3 and the Gross–Koblitz evaluation 6.4–6.5 (whose
Gamma function and formula are `DirichletPadicLFunctions`' carriers, not at the pins); the sign of
the quadratic Gauss sum over the prime field (1.4), which is `AnalyticNumberTheoryPartI` §2.30's
theorem; the identification of `kloostermanSum 1 ψ a b` with the rank-two hyper-Kloosterman sum
of `CongruenceSpectralGap` §4.2a and of `S(m, n; c)` with `AutomorphicSpectralTheory` §1.16's sum
(7.3), neither of whose carriers is at the pins; and 7.7, which only names characters.
-/

namespace TauCetiRoadmap.CharacterSumsOverFiniteFields

open Complex Finset Polynomial

noncomputable section

universe u

/-! ## Layer 0: characters of a finite field -/

section Layer0

variable (F : Type u) [Field F] [Fintype F]

/-- The character group of a finite field is finite (Mathlib's `MulChar.finite`); the sums over
it below use this `Fintype` structure. -/
instance instFintypeMulChar : Fintype (MulChar F ℂ) := Fintype.ofFinite _

/-- **0.1.** The canonical additive character `ψ_F(x) = e(Tr_{F/𝔽_p}(x)/p)`
(`README.md`, Layer 0, 0.1). For `F = ZMod p` it is Mathlib's `ZMod.stdAddChar`. -/
def stdAddChar : AddChar F ℂ :=
  letI : Algebra (ZMod (ringChar F)) F := ZMod.algebra F (ringChar F)
  haveI : NeZero (ringChar F) := ⟨(CharP.char_is_prime F (ringChar F)).ne_zero⟩
  (ZMod.stdAddChar : AddChar (ZMod (ringChar F)) ℂ).compAddMonoidHom
    (Algebra.trace (ZMod (ringChar F)) F).toAddMonoidHom

variable {F}

/-- **0.4.** The quadratic character with complex values; `1` when `ringChar F = 2`. -/
abbrev quadChar [DecidableEq F] : MulChar F ℂ :=
  (quadraticChar F).ringHomComp (Int.castRingHom ℂ)

variable {E : Type u} [Field E] [Fintype E] [Algebra F E]

/-- **0.6.** The lift of a multiplicative character through the norm, `χ ∘ N_{E/F}`. -/
def _root_.MulChar.liftNorm {F E : Type u} [Field F] [Fintype F] [Field E] [Fintype E]
    [Algebra F E] (χ : MulChar F ℂ) : MulChar E ℂ :=
  MulChar.ofUnitHom (χ.toUnitHom.comp (Units.map (Algebra.norm F : E →* F)))

/-- **0.6.** The lift of an additive character through the trace, `ψ ∘ Tr_{E/F}`. -/
def _root_.AddChar.liftTrace {F E : Type u} [Field F] [Fintype F] [Field E] [Fintype E]
    [Algebra F E] (ψ : AddChar F ℂ) : AddChar E ℂ :=
  ψ.compAddMonoidHom (Algebra.trace F E).toAddMonoidHom

end Layer0

/-! ## Layer 1: Gauss sums -/

section Layer1

variable {F : Type u} [Field F] [Fintype F]

/-- **1.1.** The Gauss sum of record, `g(χ) = ∑_x χ(x) ψ_F(x)`. Mathlib's `gaussSum` against the
canonical additive character; nothing is redefined. -/
abbrev gauss (χ : MulChar F ℂ) : ℂ := gaussSum χ (stdAddChar F)

/-- **1.3.** `g(χ)^m` lies in `ℤ[ζ_m]`, `m = orderOf χ`, for any primitive `m`-th root `ζ`: the
Gauss sum is fixed up to the root of unity `χ(c)⁻¹` by every automorphism `ζ_p ↦ ζ_p^c`. -/
theorem gauss_pow_orderOf_mem (χ : MulChar F ℂ) {ζ : ℂ} (hζ : IsPrimitiveRoot ζ (orderOf χ)) :
    gauss χ ^ orderOf χ ∈ Algebra.adjoin ℤ {ζ} := sorry

end Layer1

/-! ## Layer 2: Jacobi and Jacobsthal sums -/

section Layer2

variable {F : Type u} [Field F] [Fintype F]

/-- **2.4.** The `r`-fold Jacobi sum `J(χ₁, …, χ_r) = ∑_{x₁ + ⋯ + x_r = 1} ∏ χ_i(x_i)`. -/
def multiJacobiSum [DecidableEq F] {r : ℕ} (χ : Fin r → MulChar F ℂ) : ℂ :=
  ∑ x ∈ (univ : Finset (Fin r → F)).filter (fun x : Fin r → F => ∑ i, x i = 1), ∏ i, χ i (x i)

/-- **2.4.** The Gauss-sum formula for a multiple Jacobi sum, for nontrivial `χ_i` with
nontrivial product. -/
theorem multiJacobiSum_eq_prod_gauss_div [DecidableEq F] {r : ℕ} (χ : Fin r → MulChar F ℂ)
    (h : ∀ i, χ i ≠ 1) (hprod : ∏ i, χ i ≠ 1) :
    multiJacobiSum χ = (∏ i, gauss (χ i)) / gauss (∏ i, χ i) := sorry

/-- **2.4.** The number of solutions of a diagonal equation `∑ aᵢ xᵢ^{dᵢ} = b`, `b ≠ 0`, deviates
from `q^{r−1}` by at most `∏ (dᵢ − 1) · q^{(r−1)/2}`. -/
theorem card_diagonal_sub_le [DecidableEq F] {r : ℕ} (hr : 0 < r) (a : Fin r → Fˣ) (d : Fin r → ℕ)
    (hd : ∀ i, d i ∣ Fintype.card F - 1) {b : F} (hb : b ≠ 0) :
    |(((univ : Finset (Fin r → F)).filter
        (fun x : Fin r → F => ∑ i, (a i : F) * x i ^ d i = b)).card : ℝ) - (Fintype.card F : ℝ) ^ (r - 1)| ≤
      (∏ i, ((d i : ℝ) - 1)) * (Fintype.card F : ℝ) ^ (((r : ℝ) - 1) / 2) := sorry

/-- **2.5.** The Jacobsthal sum `φ_n(a) = ∑_x η(x) η(x^n + a)`. -/
def jacobsthalPhi [DecidableEq F] (n : ℕ) (a : F) : ℂ :=
  ∑ x : F, quadChar (F := F) x * quadChar (F := F) (x ^ n + a)

/-- **2.5.** The Jacobsthal sum `ψ_n(a) = ∑_x η(x^n + a)`. -/
def jacobsthalPsi [DecidableEq F] (n : ℕ) (a : F) : ℂ :=
  ∑ x : F, quadChar (F := F) (x ^ n + a)

/-- **2.5.** The Jacobi-sum expansion of `ψ_n(a)`, over the nontrivial characters of order
dividing `n`. -/
theorem jacobsthalPsi_eq_sum_jacobiSum [DecidableEq F] (hF : ringChar F ≠ 2) (n : ℕ) (hn : 0 < n) {a : F}
    (ha : a ≠ 0) :
    jacobsthalPsi n a = quadChar (F := F) a *
      ∑ χ ∈ (univ : Finset (MulChar F ℂ)).filter (fun χ => χ ^ n = 1 ∧ χ ≠ 1),
        χ (-a) * jacobiSum χ (quadChar (F := F)) := sorry

/-- **2.5.** The Jacobi-sum expansion of `φ_n(a)`, over the characters `χ` with `χ^n = η`. -/
theorem jacobsthalPhi_eq_sum_jacobiSum [DecidableEq F] (hF : ringChar F ≠ 2) (n : ℕ) (hn : 0 < n) {a : F}
    (ha : a ≠ 0) :
    jacobsthalPhi n a = quadChar (F := F) a *
      ∑ χ ∈ (univ : Finset (MulChar F ℂ)).filter (fun χ => χ ^ n = quadChar (F := F)),
        χ (-a) * jacobiSum χ (quadChar (F := F)) := sorry

/-- **2.5.** Jacobsthal's theorem: for `p ≡ 1 (mod 4)` and `p = a² + b²` with `a ≡ 1 (mod 4)`,
`φ_2(1) = −2a`. -/
theorem jacobsthalPhi_two_one (p : ℕ) [Fact p.Prime] (hp : p % 4 = 1) {a b : ℤ}
    (hab : a ^ 2 + b ^ 2 = p) (ha : a % 4 = 1) :
    jacobsthalPhi (F := ZMod p) 2 1 = -2 * a := sorry

end Layer2

/-! ## Layer 3: the polynomial `L`-series and Hasse–Davenport -/

section Layer3

variable {F : Type u} [Field F] [Fintype F]

/-- The monic polynomial `X^d + ∑_{i<d} c_i X^i` with the given lower coefficients. -/
def monicOfCoeffs {F : Type u} [Field F] [Fintype F] {d : ℕ} (c : Fin d → F) : F[X] :=
  X ^ d + ∑ i : Fin d, C (c i) * X ^ (i : ℕ)

/-- **3.1.** A complex-valued function on `F[X]` that is multiplicative on monic polynomials. -/
def IsMonicMultiplicative {F : Type u} [Field F] [Fintype F] (lam : F[X] → ℂ) : Prop :=
  lam 1 = 1 ∧ ∀ g h : F[X], g.Monic → h.Monic → lam (g * h) = lam g * lam h

/-- **3.1.** The `L`-series `L(λ, T) = ∑_{g monic} λ(g) T^{deg g}`, coefficientwise the sums
over the `q^d` monic polynomials of degree `d`. -/
def lSeries (lam : F[X] → ℂ) : PowerSeries ℂ :=
  PowerSeries.mk fun d => ∑ c : Fin d → F, lam (monicOfCoeffs c)

variable (E : Type u) [Field E] [Fintype E] [Algebra F E]

/-- **3.2.** The lifted sum `S_n(λ) = ∑_{α ∈ E} λ(minpoly α)^{n / deg α}`, `n = [E : F]`. -/
def extensionSum {F : Type u} [Field F] [Fintype F]
    (E : Type u) [Field E] [Fintype E] [Algebra F E] (lam : F[X] → ℂ) : ℂ :=
  ∑ α : E, lam (minpoly F α) ^ (Module.finrank F E / (minpoly F α).natDegree)

/-- **3.2.** The root-power identity: when `L(λ, T) = ∏ (1 − ωᵢ T)`, the lifted sum of degree `n`
is `−∑ ωᵢ^n`. This is the engine behind 3.3, 4.7, 4.8 and 5.4. -/
theorem extensionSum_eq_neg_sum_pow {lam : F[X] → ℂ} (hlam : IsMonicMultiplicative lam)
    {k : ℕ} (ω : Fin k → ℂ)
    (hL : lSeries lam = ∏ i, (1 - PowerSeries.C (ω i) * PowerSeries.X)) :
    extensionSum E lam = -∑ i, ω i ^ Module.finrank F E := sorry

/-- **3.3.** The Hasse–Davenport lifting relation, with its signs:
`−g(χ ∘ N, ψ ∘ Tr) = (−g(χ, ψ))^{[E:F]}`. It fails for `χ = 1 = ψ` (`g = q − 1`, `g' = q^n − 1`). -/
theorem hasseDavenport_lift (χ : MulChar F ℂ) (ψ : AddChar F ℂ) (h : χ ≠ 1 ∨ ψ ≠ 1) :
    -gaussSum (χ.liftNorm (E := E)) (ψ.liftTrace (E := E)) =
      (-gaussSum χ ψ) ^ Module.finrank F E := sorry

/-- **3.3.** The sign of the quadratic Gauss sum over `𝔽_q`, `q = p^f`:
`g(η) = (−1)^{f−1} (ε_p √p)^f`, from the prime-field sign (`AnalyticNumberTheoryPartI` §2.30,
consumed in 1.4) and the lifting relation. -/
theorem gauss_quadChar_eq [DecidableEq F] (hF : ringChar F ≠ 2) {p f : ℕ} [Fact p.Prime]
    (hq : Fintype.card F = p ^ f) :
    gauss (quadChar (F := F)) =
      (-1) ^ (f - 1) * ((if p % 4 = 1 then (1 : ℂ) else Complex.I) * Real.sqrt p) ^ f := sorry

/-- **3.5.** Jacobi sums lift with the same signs as Gauss sums. -/
theorem jacobiSum_lift {χ ψ : MulChar F ℂ} (hχ : χ ≠ 1) (hψ : ψ ≠ 1) :
    -jacobiSum (χ.liftNorm (E := E)) (ψ.liftNorm (E := E)) =
      (-jacobiSum χ ψ) ^ Module.finrank F E := sorry

end Layer3

/-! ## Layer 4: Stepanov's method and Weil's bounds for polynomial sums -/

section Layer4

open scoped Classical

variable {F : Type u} [Field F] [Fintype F]

/-- **4.2.** For fixed degrees `d,m`, one pair of constants bounds the point counts of
`y^d = f(x)` over every finite base field and all its finite extensions, when `f` has degree
`m` and is not a scalar times an `e`-th power for any divisor `e > 1` of `d`. -/
theorem stepanov_kummer (d m : ℕ) (hd : 2 ≤ d) (hm : 0 < m) :
    ∃ C₀ Q₀ : ℝ, ∀ (F : Type u) [Field F] [Fintype F] (f : F[X]),
      f.natDegree = m →
      (¬ ∃ (c : AlgebraicClosure F) (e : ℕ) (g : (AlgebraicClosure F)[X]),
        1 < e ∧ e ∣ d ∧ f.map (algebraMap F (AlgebraicClosure F)) = C c * g ^ e) →
      ∀ (E : Type u) [Field E] [Fintype E] [Algebra F E],
        Q₀ ≤ Fintype.card E →
        |(((univ : Finset (E × E)).filter
            (fun z : E × E => z.2 ^ d = (f.map (algebraMap F E)).eval z.1)).card : ℝ) -
            Fintype.card E| ≤ C₀ * Real.sqrt (Fintype.card E) := sorry

/-- **4.3 (i).** For fixed `q,n`, one pair of constants bounds `y^q − y = f(x)` over
all fields of cardinality `q`, all degree-`n` polynomials with characteristic not dividing `n`,
and every finite extension. -/
theorem stepanov_artinSchreier (q n : ℕ) (hn : 0 < n) :
    ∃ C₀ Q₀ : ℝ, ∀ (F : Type u) [Field F] [Fintype F],
      Fintype.card F = q → ∀ (f : F[X]), f.natDegree = n →
      (¬ ringChar F ∣ n) →
      ∀ (E : Type u) [Field E] [Fintype E] [Algebra F E],
        Q₀ ≤ Fintype.card E →
        |(((univ : Finset (E × E)).filter
            (fun z : E × E => z.2 ^ q - z.2 = (f.map (algebraMap F E)).eval z.1)).card : ℝ) -
            Fintype.card E| ≤ C₀ * Real.sqrt (Fintype.card E) := sorry

/-- **4.3 (ii).** For fixed `q,d`, one pair of constants bounds the Laurent curve
`y^q − y = a x^d + b x^(−d)` on `x ≠ 0`, uniformly in the fields of cardinality `q`, the
nonzero coefficients and all finite extensions, when the characteristic does not divide `d`. -/
theorem stepanov_kloostermanCurve (q d : ℕ) (hd : 0 < d) :
    ∃ C₀ Q₀ : ℝ, ∀ (F : Type u) [Field F] [Fintype F],
      Fintype.card F = q → (¬ ringChar F ∣ d) → ∀ (a b : Fˣ),
      ∀ (E : Type u) [Field E] [Fintype E] [Algebra F E],
        Q₀ ≤ Fintype.card E →
        |(((univ : Finset (Eˣ × E)).filter
            (fun z : Eˣ × E => z.2 ^ q - z.2 =
              algebraMap F E a * (z.1 : E) ^ d +
                algebraMap F E b * ((z.1⁻¹ : Eˣ) : E) ^ d)).card : ℝ) -
            (Fintype.card E - 1)| ≤ C₀ * Real.sqrt (Fintype.card E) := sorry

/-- **4.5.** The multiplicative function `λ_f(g) = χ(N_{F[X]/(g)}(f))`, the character of the
resultant `∏_{g(α)=0} f(α)` for monic `g`. -/
def mulCharResultant {F : Type u} [Field F] [Fintype F] (χ : MulChar F ℂ) (f : F[X]) (g : F[X]) : ℂ :=
  χ (Algebra.norm F (AdjoinRoot.mk g f))

/-- **4.5.** The `L`-polynomial of a multiplicative character sum has degree at most `m − 1`,
`m` the number of distinct roots of `f`, when `f` is not a constant times a `d`-th power. -/
theorem lSeries_mulCharResultant {χ : MulChar F ℂ} (hχ : χ ≠ 1) (f : F[X]) (hf0 : f ≠ 0)
    (hf : ¬ ∃ (c : F) (h : F[X]), f = C c * h ^ orderOf χ) :
    ∃ P : ℂ[X], P.natDegree + 1 ≤
        (f.map (algebraMap F (AlgebraicClosure F))).roots.toFinset.card ∧
      lSeries (mulCharResultant χ f) = P.toPowerSeries := sorry

/-- **4.6.** The multiplicative function `μ_f(g) = ψ(∑_{g(α)=0} f(α))`. -/
def addCharTrace {F : Type u} [Field F] [Fintype F] (ψ : AddChar F ℂ) (f : F[X]) (g : F[X]) : ℂ :=
  ψ (Algebra.trace F (AdjoinRoot g) (AdjoinRoot.mk g f))

/-- **4.6.** The `L`-polynomial of an additive character sum has degree at most `deg f − 1`. -/
theorem lSeries_addCharTrace {ψ : AddChar F ℂ} (hψ : ψ ≠ 1) (f : F[X]) (hf : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) :
    ∃ P : ℂ[X], P.natDegree + 1 ≤ f.natDegree ∧ lSeries (addCharTrace ψ f) = P.toPowerSeries :=
  sorry

/-- **4.7.** Weil's bound for multiplicative character sums:
`|∑_x χ(f(x))| ≤ (m − 1) √q`, `m` the number of distinct roots of `f` in `F̄`. -/
theorem weil_mulChar_sum_bound {χ : MulChar F ℂ} (hχ : χ ≠ 1) (f : F[X]) (hf0 : f ≠ 0)
    (hf : ¬ ∃ (c : F) (h : F[X]), f = C c * h ^ orderOf χ) :
    ‖∑ x : F, χ (f.eval x)‖ ≤
      (((f.map (algebraMap F (AlgebraicClosure F))).roots.toFinset.card : ℝ) - 1) *
        Real.sqrt (Fintype.card F) := sorry

/-- **4.8.** Weil's bound for additive character sums: `|∑_x ψ(f(x))| ≤ (deg f − 1) √q`
for `p ∤ deg f`. -/
theorem weil_addChar_sum_bound {ψ : AddChar F ℂ} (hψ : ψ ≠ 1) (f : F[X]) (hf : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) :
    ‖∑ x : F, ψ (f.eval x)‖ ≤ ((f.natDegree : ℝ) - 1) * Real.sqrt (Fintype.card F) := sorry

/-- **4.9.** The hyperelliptic point count: `|#{y² = f(x)} − q| ≤ (m − 1) √q` for squarefree `f`
of degree `m` and odd `q`. -/
theorem card_hyperelliptic_sub_le [DecidableEq F] (hF : ringChar F ≠ 2) (f : F[X])
    (hf : Squarefree f) (hf0 : 0 < f.natDegree) :
    |(((univ : Finset (F × F)).filter (fun z : F × F => z.2 ^ 2 = f.eval z.1)).card : ℝ) -
        Fintype.card F| ≤ ((f.natDegree : ℝ) - 1) * Real.sqrt (Fintype.card F) := sorry

end Layer4

/-! ## Layer 5: Kloosterman and Salié sums -/

section Layer5

open scoped Classical

variable {R : Type*} [CommRing R] [Fintype R]

/-- **5.1.** The Kloosterman sum `K(χ, ψ; a, b) = ∑_{x ∈ Rˣ} χ(x) ψ(a x + b x⁻¹)` on a finite
commutative ring. On `ZMod c` with `ZMod.stdAddChar` it is `S_χ(a, b; c)`; on a finite field with
`stdAddChar F` it is the Kloosterman sum of Layer 5. On a field with `χ = 1` and `a, b` units it is
the rank-two hyper-Kloosterman sum of `CongruenceSpectralGap` §4.2a; that identification is a
README target (5.1), since the hyper-Kloosterman carrier is not at the pins. -/
def kloostermanSum (χ : MulChar R ℂ) (ψ : AddChar R ℂ) (a b : R) : ℂ :=
  ∑ x : Rˣ, χ x * ψ (a * x + b * ((x⁻¹ : Rˣ) : R))

variable {F : Type u} [Field F] [Fintype F]

/-- **5.2.** The Gauss-sum expansion
`K(χ; a, b) = (q − 1)⁻¹ ∑_θ θ(b)⁻¹ (χθ)(a)⁻¹ g(θ) g(χθ)` for `a b ≠ 0` (at `b = 0` the right side
is `0` and the left is `χ(a)⁻¹ g(χ)`). -/
theorem kloostermanSum_eq_sum_gauss (χ : MulChar F ℂ) (a b : Fˣ) :
    kloostermanSum χ (stdAddChar F) a b = (Fintype.card F - 1 : ℂ)⁻¹ *
      ∑ θ : MulChar F ℂ, (θ b)⁻¹ * ((χ * θ) a)⁻¹ * gauss θ * gauss (χ * θ) := sorry

/-- **5.3.** Salié's evaluation: `K(η; a, b) = η(b) g(η) ∑_{y² = 4ab} ψ_F(y)`. -/
theorem kloostermanSum_quadChar_eq [DecidableEq F] (hF : ringChar F ≠ 2) (a b : Fˣ) :
    kloostermanSum (quadChar (F := F)) (stdAddChar F) a b =
      quadChar (F := F) b * gauss (quadChar (F := F)) *
        ∑ y ∈ (univ : Finset F).filter (fun y : F => y ^ 2 = 4 * a * b), stdAddChar F y := sorry

/-- **5.4.** The Kloosterman `L`-polynomial `1 + K T + χ(−b/a) q T²` and the lifting relation:
`K_E = −(ω₁^n + ω₂^n)` for every extension of degree `n`, with `|ω₁| = |ω₂| = √q` (5.5). -/
theorem kloostermanSum_lift (χ : MulChar F ℂ) (a b : Fˣ) :
    ∃ ω₁ ω₂ : ℂ, ω₁ + ω₂ = -kloostermanSum χ (stdAddChar F) a b ∧
      ω₁ * ω₂ = χ (-(b : F) * (a⁻¹ : Fˣ)) * Fintype.card F ∧
      ‖ω₁‖ = Real.sqrt (Fintype.card F) ∧ ‖ω₂‖ = Real.sqrt (Fintype.card F) ∧
      ∀ (E : Type u) [Field E] [Fintype E] [Algebra F E],
        kloostermanSum (χ.liftNorm (E := E)) ((stdAddChar F).liftTrace (E := E))
            (algebraMap F E a) (algebraMap F E b) =
          -(ω₁ ^ Module.finrank F E + ω₂ ^ Module.finrank F E) := sorry

/-- **5.5.** Weil's bound `|K(χ; a, b)| ≤ 2√q` for `a b ≠ 0` and every `χ`. At `χ = 1` it is the
congruence spectral gap roadmap's `hyperKloosterman_bound` at rank `2` (`README.md` 5.5). -/
theorem norm_kloostermanSum_le (χ : MulChar F ℂ) (a b : Fˣ) :
    ‖kloostermanSum χ (stdAddChar F) a b‖ ≤ 2 * Real.sqrt (Fintype.card F) := sorry

end Layer5

/-! ## Layer 7: sums modulo an integer -/

section Layer7

/-- **7.1.** The imprimitive formula `τ(χ) = μ(N/f) χ^∗(N/f) τ(χ^∗)`, `f` the conductor. -/
theorem gaussSum_eq_moebius_mul {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    haveI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
    gaussSum χ ZMod.stdAddChar =
      (ArithmeticFunction.moebius (N / χ.conductor) : ℂ) *
        χ.primitiveCharacter (N / χ.conductor : ℕ) *
          gaussSum χ.primitiveCharacter ZMod.stdAddChar := sorry

variable {c₁ c₂ : ℕ} [NeZero c₁] [NeZero c₂] (h : c₁.Coprime c₂)

/-- **0.7.** The first Chinese-remainder factor of a Dirichlet character modulo `c₁ c₂`. -/
def crtFactorLeft {c₁ c₂ : ℕ} [NeZero c₁] [NeZero c₂] (h : c₁.Coprime c₂) (χ : DirichletCharacter ℂ (c₁ * c₂)) : DirichletCharacter ℂ c₁ :=
  MulChar.ofUnitHom (χ.toUnitHom.comp (Units.map
    ((ZMod.chineseRemainder h).symm.toRingHom.toMonoidHom.comp (MonoidHom.inl _ _))))

/-- **0.7.** The second Chinese-remainder factor. -/
def crtFactorRight {c₁ c₂ : ℕ} [NeZero c₁] [NeZero c₂] (h : c₁.Coprime c₂) (χ : DirichletCharacter ℂ (c₁ * c₂)) : DirichletCharacter ℂ c₂ :=
  MulChar.ofUnitHom (χ.toUnitHom.comp (Units.map
    ((ZMod.chineseRemainder h).symm.toRingHom.toMonoidHom.comp (MonoidHom.inr _ _))))

/-- **7.1.** The Chinese-remainder formula `τ(χ) = χ₁(c₂) χ₂(c₁) τ(χ₁) τ(χ₂)`. -/
theorem gaussSum_mul_of_coprime (χ : DirichletCharacter ℂ (c₁ * c₂)) :
    gaussSum χ ZMod.stdAddChar =
      crtFactorLeft h χ (c₂ : ZMod c₁) * crtFactorRight h χ (c₁ : ZMod c₂) *
        gaussSum (crtFactorLeft h χ) ZMod.stdAddChar *
          gaussSum (crtFactorRight h χ) ZMod.stdAddChar := sorry

/-- **7.2.** `J(χ, ψ) = τ(χ) τ(ψ) / τ(χψ)` whenever `χψ` is primitive. -/
theorem jacobiSum_eq_gaussSum_div_of_isPrimitive {N : ℕ} [NeZero N]
    (χ ψ : DirichletCharacter ℂ N) (hχψ : (χ * ψ).IsPrimitive) :
    jacobiSum χ ψ = gaussSum χ ZMod.stdAddChar * gaussSum ψ ZMod.stdAddChar /
      gaussSum (χ * ψ) ZMod.stdAddChar := sorry

/-- **7.4.** Twisted multiplicativity of `S_χ(m, n; c)`. The inverses `c̄₂` and `c̄₁` are read
in `ZMod c₁` and `ZMod c₂`. -/
theorem kloostermanSum_zmod_mul (χ : DirichletCharacter ℂ (c₁ * c₂)) (m n : ℤ) :
    kloostermanSum χ ZMod.stdAddChar m n =
      kloostermanSum (crtFactorLeft h χ) ZMod.stdAddChar
          (m * ((ZMod.unitOfCoprime c₂ h.symm)⁻¹ : (ZMod c₁)ˣ))
          (n * ((ZMod.unitOfCoprime c₂ h.symm)⁻¹ : (ZMod c₁)ˣ)) *
        kloostermanSum (crtFactorRight h χ) ZMod.stdAddChar
          (m * ((ZMod.unitOfCoprime c₁ h)⁻¹ : (ZMod c₂)ˣ))
          (n * ((ZMod.unitOfCoprime c₁ h)⁻¹ : (ZMod c₂)ˣ)) := sorry

/-- **7.5.** Salié's prime-power evaluation of `S(m, n; p^k)`, `p` odd, `k ≥ 2`, `p ∤ mn`,
`mn ≡ ℓ² (mod p^k)`: `2 (ℓ/p)^k p^{k/2} Re(ε_{p^k} e(2ℓ/p^k))`. -/
theorem kloostermanSum_zmod_primePow (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {k : ℕ} (hk : 2 ≤ k)
    (m n ℓ : ℤ) (hmn : ¬ (p : ℤ) ∣ m * n) (hℓ : ((ℓ ^ 2 : ℤ) : ZMod (p ^ k)) = m * n) :
    kloostermanSum (1 : DirichletCharacter ℂ (p ^ k)) ZMod.stdAddChar m n =
      2 * (legendreSym p ℓ : ℂ) ^ k * Real.sqrt ((p : ℝ) ^ k) *
        (((if p ^ k % 4 = 1 then (1 : ℂ) else Complex.I) *
          ZMod.stdAddChar ((2 * ℓ : ℤ) : ZMod (p ^ k))).re : ℝ) := sorry

/-- **7.5.** The non-square branch. -/
theorem kloostermanSum_zmod_primePow_eq_zero (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {k : ℕ}
    (hk : 2 ≤ k) (m n : ℤ) (hmn : ¬ IsSquare ((m * n : ℤ) : ZMod p)) :
    kloostermanSum (1 : DirichletCharacter ℂ (p ^ k)) ZMod.stdAddChar m n = 0 := sorry

/-- **7.5.** The twisted bound at a prime square: `|S_χ(m, n; p²)| ≤ 2 (m, n, p²)^{1/2} p` for
every Dirichlet character `χ` modulo `p²`. -/
theorem norm_kloostermanSum_zmod_primeSq_le (p : ℕ) [Fact p.Prime]
    (χ : DirichletCharacter ℂ (p ^ 2)) (m n : ℤ) :
    ‖kloostermanSum χ ZMod.stdAddChar m n‖ ≤
      2 * Real.sqrt (Nat.gcd (Int.gcd m n) (p ^ 2)) * p := sorry

/-- **7.6.** Weil's bound for a general modulus, trivial character:
`|S(m, n; c)| ≤ τ(c) (m, n, c)^{1/2} c^{1/2}` for every `c`. -/
theorem norm_kloostermanSum_zmod_le {c : ℕ} [NeZero c] (m n : ℤ) :
    ‖kloostermanSum (1 : DirichletCharacter ℂ c) ZMod.stdAddChar m n‖ ≤
      (ArithmeticFunction.sigma 0 c : ℝ) * Real.sqrt (Nat.gcd (Int.gcd m n) c) * Real.sqrt c :=
  sorry

/-- **7.6.** The twisted form with the conductor factor (Knightly–Li, Theorem 9.3):
`|S_χ(m, n; c)| ≤ τ(c) (m, n, c)^{1/2} 𝔠_χ^{1/2} c^{1/2}` for every Dirichlet character `χ` modulo
`c` (a character of a smaller modulus `N ∣ c` enters through `changeLevel`). -/
theorem norm_kloostermanSum_zmod_le_of_char {c : ℕ} [NeZero c] (χ : DirichletCharacter ℂ c)
    (m n : ℤ) :
    ‖kloostermanSum χ ZMod.stdAddChar m n‖ ≤
      (ArithmeticFunction.sigma 0 c : ℝ) * Real.sqrt (Nat.gcd (Int.gcd m n) c) *
        Real.sqrt χ.conductor * Real.sqrt c := sorry

/-- **7.6.** The twisted form without the conductor factor, for cube-free `c`. The hypothesis is
sharp: `|S_χ(1, 15; 17³)| = 289 > τ(17³) · 17^{3/2}` for a primitive `χ` of order `4624`. -/
theorem norm_kloostermanSum_zmod_le_of_cubefree {c : ℕ} [NeZero c]
    (hc : ∀ p : ℕ, p.Prime → ¬ p ^ 3 ∣ c) (χ : DirichletCharacter ℂ c) (m n : ℤ) :
    ‖kloostermanSum χ ZMod.stdAddChar m n‖ ≤
      (ArithmeticFunction.sigma 0 c : ℝ) * Real.sqrt (Nat.gcd (Int.gcd m n) c) * Real.sqrt c :=
  sorry

end Layer7

end

end TauCetiRoadmap.CharacterSumsOverFiniteFields
