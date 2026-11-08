module

import Mathlib
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Counting
import TauCeti.NumberTheory.NumberField.Global.RayClass.Count.Basic
import TauCeti.NumberTheory.LFunctions.Mertens
import TauCeti.NumberTheory.Chebotarev.FrobeniusPrimeSet
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.VonMangoldt
import TauCeti.NumberTheory.ClassFieldTheory.Global.AdmissibleModulus.Basic

/-!
# Explicit number fields: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the headline theorems of
the roadmap against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
five definitions they need: the relative class number `relativeClassNumber` of a CM-field
(README 0.4), the predicate `GRHMod` and the normal-tower predicate `HasNormalTower` (0.5), the
least prime primitive root `leastPrimePrimitiveRoot` (0.6), and Stark's weight `starkAlpha`
(4.7).

Stated here:

* Layer 0, the divisibility `h(K⁺) ∣ h(K)` that makes the relative class number of a CM-field a
  natural number (0.4);
* Layer 2, the explicit ideal counts: Sunley's count in the discriminant (2.2), Debaene's uniform
  counts of all ideals and of the ideals in one class (2.4), and Gun–Ramaré–Sivaraman's count in
  a narrow ray class (2.5);
* Layer 3, Friedman's unconditional lower bound for the residue (3.3);
* Layer 4, Stark's lower bound for the residue of a field with no quadratic subfield (4.7);
* Layer 5, Bordellès' regulator-free class-number bound (5.3) and Louboutin's upper bound for the
  relative class number (5.5);
* Layer 6, the explicit bound for the least prime primitive root under the generalized Riemann
  hypothesis for the characters modulo `p` (6.4);
* Layer 7, Garcia–Lee's three explicit Mertens theorems for number fields (7.1), Ahn–Kwon's
  bound for the least prime ideal with a given Frobenius class (7.4), and Debaene's
  Brun–Titchmarsh inequality for the Chebotarev density theorem (7.5).

Not statable at the pins:

* every statement about the zeros or the values of the Dedekind zeta function `ζ_K` off the
  half-plane of convergence: Rademacher's bound (1.1), the zero-dependent and conditional residue
  bounds (3.1, 3.4, 3.5, 3.6), the zero counts, real-zero lemmas, Stark-like and zero-free regions
  and zero repulsion (4.1–4.6, 4.8–4.10), the consequences of the uniform real-zero gap for
  every `ζ_K` (4.9), the lower bounds for relative class numbers (5.6), and the explicit
  Chebotarev theorems and the least prime ideal under the generalized Riemann hypothesis (7.2–7.3,
  7.4): Mathlib's
  `NumberField.dedekindZeta` is the Dirichlet series itself, a junk value off `Re s > 1`; Tau
  Ceti continues it only to `Re s > 1 − 1/[K : ℚ]`; and neither library has its continuation to
  `ℂ`, its completion, or the L-function of a Hecke character;
* the bounds `g(p) < p^{5/8}`, `h(p) < p^{0.99}` and `h(p) < p^{2/3}` and Grosswald's conjecture
  under the generalized Riemann hypothesis (6.3–6.5): each is conditional on finite verifications
  that either assert the conclusion itself on an initial range (*McGownSorensonTable*,
  *SmallPrimitiveRootsModPSquare*, *GrosswaldFiniteRange*, *GrosswaldPrimeFiniteRange*) or are
  case analyses of the source's sieve with no statement on the pinned carriers
  (*McGownTrudgianOmegaChecks*, *McGownSorensonGapChecks*, *GrosswaldSieveVerification*); they
  lack a statement of that input other than the conclusion.

The other statable targets are variants of these headlines or of a supplier's, and are README
targets: Lee's count (2.3), whose constant differs between the two printings of the source;
Ramaré's counts for imaginary quadratic fields (2.7); Louboutin's refinements (3.2, 5.1, 5.2) of
the residue bound of AnalyticNumberTheoryPartI §2.15; the other forms of Bordellès' bound (5.3);
and Garcia–Lee's bounds for the Mertens constant (7.1). Kadiri–Ng–Wong's bound `N𝔭 ≤ d_L^{16}`
beyond an absolute threshold (7.4), which is not comparable with Ahn–Kwon's, is statable on the
carriers of `leastPrimeIdeal_ahnKwon` but is not stated: its source is cited by locator only, so the
form of its conclusion beyond the exponent (the threshold and the degree of the prime) is not
checked against the text. The results resting on unrefereed preprints (Fehnker 2.6, Amberger 4.2,
Das–Gaba–Lee–Savalia–Wong 4.8 and 4.10, Guo and Banks 4.9 and 5.7, Das–Kadiri–Ng 7.3) and the API
lemmas, Checks and intermediate targets of every layer are README targets, not headlines.
-/

namespace TauCetiRoadmap.ExplicitNumberFields

open NumberField Real
open TauCeti.GlobalNumberFields

/-! ## Layer 0: invariants and predicates -/

/-- **0.4, the relative class number** `h⁻(K) = h(K)/h(K⁺)` of a CM-field `K`, with `K⁺` its
maximal real subfield. It is a natural number because `h(K⁺)` divides `h(K)`
(`classNumber_maximalRealSubfield_dvd`). -/
noncomputable def relativeClassNumber (K : Type*) [Field K] [NumberField K] [IsCMField K] : ℕ :=
  classNumber K / classNumber (maximalRealSubfield K)

/-- **0.4, the class number of the maximal real subfield divides that of a CM-field**
(`washington1997` Theorem 4.10): the norm map from the class group of `K` to that of `K⁺` is
onto, since the Hilbert class field of `K⁺` is totally real and so meets `K` in `K⁺`. -/
theorem classNumber_maximalRealSubfield_dvd (K : Type*) [Field K] [NumberField K] [IsCMField K] :
    classNumber (maximalRealSubfield K) ∣ classNumber K := by
  sorry

/-- **0.5, the generalized Riemann hypothesis for the characters modulo `q`.** Every Dirichlet
character `χ` modulo `q` satisfies: every zero `s` of `L(s, χ)` with `Re s > 0`, other than the
junk value at the pole `s = 1` of the principal character, has `Re s = 1/2`. The strict
inequality leaves out the zeros of the deleted Euler factors on `Re s = 0`. -/
def GRHMod (q : ℕ) [NeZero q] : Prop :=
  ∀ χ : DirichletCharacter ℂ q, ∀ s : ℂ, 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) →
    DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

/-- **0.5, the normal-tower predicate.** A number field `K` has a normal tower over `ℚ` when
there is a chain `ℚ = K₀ ≤ K₁ ≤ ⋯ ≤ K_r = K` of subfields with every step `K_{i+1}/K_i` Galois.
A Galois field has one of length one; `ℚ(2^{1/4})` has `ℚ ≤ ℚ(√2) ≤ ℚ(2^{1/4})`; a non-Galois
cubic field has none (Stark 1974, as used in `garcialee2022mertens` §3). -/
def HasNormalTower (K : Type*) [Field K] [NumberField K] : Prop :=
  ∃ (r : ℕ) (L : Fin (r + 1) → IntermediateField ℚ K), L 0 = ⊥ ∧ L (Fin.last r) = ⊤ ∧
    ∀ i : Fin r, ∃ h : L i.castSucc ≤ L i.succ,
      IsGalois (L i.castSucc) (IntermediateField.extendScalars h)

/-- **0.6, the least prime primitive root** `ĝ(m)`: the least prime `g` whose class modulo `m`
has order `φ(m)`. For `m = p` prime the set is nonempty by Dirichlet's theorem on primes in
progressions; the value `0` is the junk value of `sInf ∅`. -/
noncomputable def leastPrimePrimitiveRoot (m : ℕ) : ℕ :=
  sInf {g : ℕ | g.Prime ∧ orderOf (g : ZMod m) = m.totient}

/-! ## Layer 2: counting ideals -/

/-- **2.2, Sunley's explicit ideal count** (`sunley1973` Theorem 1.1(1)). For a number field `K`
of degree `n ≥ 2` and discriminant `d_K` and every real `x > 0`, the number of nonzero integral
ideals of norm at most `x` differs from `κ_K x` by at most
`e^{28.2n+5} (n+1)^{5(n+1)/2} |d_K|^{1/(n+1)} (log |d_K|)ⁿ x^{(n−1)/(n+1)}`. -/
theorem idealCount_sunley (K : Type*) [Field K] [NumberField K] (n : ℕ)
    (hK : Module.finrank ℚ K = n) (hn : 2 ≤ n) (x : ℝ) (hx : 0 < x) :
    |((TauCeti.idealsLE K x).card : ℝ) - dedekindZeta_residue K * x| ≤
      Real.exp (28.2 * n + 5) * ((n : ℝ) + 1) ^ ((5 : ℝ) * (n + 1) / 2) *
        |(discr K : ℝ)| ^ ((1 : ℝ) / (n + 1)) * Real.log |(discr K : ℝ)| ^ n *
        x ^ (((n : ℝ) - 1) / (n + 1)) := by
  sorry

/-- **2.4, Debaene's uniform count of all ideals** (`debaene2019` Corollary 2, with the positive
part of the logarithm, which its proof gives for every field). For a number field `K` of degree
`n`, regulator `R_K` and class number `h_K` and every real `x ≥ 1`,
`|#{𝔞 : N𝔞 ≤ x} − κ_K x| ≤ n^{10n²} (R_K h_K)^{1/n} (1 + log⁺(R_K h_K))^{(n−1)²/n} x^{1−1/n}`. -/
theorem idealCount_debaene (K : Type*) [Field K] [NumberField K] (n : ℕ)
    (hK : Module.finrank ℚ K = n) (x : ℝ) (hx : 1 ≤ x) :
    |((TauCeti.idealsLE K x).card : ℝ) - dedekindZeta_residue K * x| ≤
      (n : ℝ) ^ (10 * n ^ 2) * (Units.regulator K * classNumber K) ^ ((1 : ℝ) / n) *
        (1 + Real.posLog (Units.regulator K * classNumber K)) ^ (((n : ℝ) - 1) ^ 2 / n) *
        x ^ (1 - (1 : ℝ) / n) := by
  sorry

/-- **2.4, Debaene's uniform count in one ideal class** (`debaene2019` Corollary 2, second part,
with `log⁺`). The class group is Tau Ceti's ray class group of the trivial modulus. For every
ideal class `c` and real `x ≥ 1`, the number of nonzero integral ideals of `c` of norm at most
`x` differs from `(κ_K/h_K) x` by at most `n^{10n²} R_K^{1/n} (1 + log⁺ R_K)^{(n−1)²/n} x^{1−1/n}`. -/
theorem classIdealCount_debaene (K : Type*) [Field K] [NumberField K] (n : ℕ)
    (hK : Module.finrank ℚ K = n) (c : RayClassGroup (Modulus.one K)) (x : ℝ) (hx : 1 ≤ x) :
    |(rayClassIdealCountingFunction (Modulus.one K) c x : ℝ) -
        dedekindZeta_residue K / classNumber K * x| ≤
      (n : ℝ) ^ (10 * n ^ 2) * Units.regulator K ^ ((1 : ℝ) / n) *
        (1 + Real.posLog (Units.regulator K)) ^ (((n : ℝ) - 1) ^ 2 / n) *
        x ^ (1 - (1 : ℝ) / n) := by
  sorry

/-- **2.5, Gun–Ramaré–Sivaraman's count in a narrow ray class** (`gunramaresivaraman2023`
Theorem 1). Let `𝔮` be a nonzero integral ideal, `𝔪 = 𝔮 ∞` the modulus with every real place,
`H_𝔮` its ray class group, `φ(𝔮) = #(𝓞_K/𝔮)ˣ`, `F = 2^{r₁} φ(𝔮) h_K / #H_𝔮` and
`E = 1000 n^{12n²} (R_K/w_K)^{1/n} (log((2n)^{4n} R_K/w_K))ⁿ`. For every class `c` of `H_𝔮` and
real `x ≥ 1`, the number of integral ideals of `c` of norm at most `x` differs from
`κ_K φ(𝔮) x/(#H_𝔮 N𝔮)` by at most `E F^{1/n} (log 3F)ⁿ (x/N𝔮)^{1−1/n} + n^{8n} R_K w_K F`. -/
theorem rayClassIdealCount_gunRamareSivaraman (K : Type*) [Field K] [NumberField K] (n : ℕ)
    (hK : Module.finrank ℚ K = n) (𝔮 : Ideal (𝓞 K)) (h𝔮 : 𝔮 ≠ ⊥)
    (c : RayClassGroup (⟨𝔮, h𝔮, (narrowModulus K).infinitePart⟩ : Modulus K)) (x : ℝ) (hx : 1 ≤ x) :
    let 𝔪 : Modulus K := ⟨𝔮, h𝔮, (narrowModulus K).infinitePart⟩
    let φ𝔮 : ℝ := Nat.card (𝓞 K ⧸ 𝔮)ˣ
    let H : ℝ := Nat.card (RayClassGroup 𝔪)
    let F : ℝ := 2 ^ InfinitePlace.nrRealPlaces K * φ𝔮 * classNumber K / H
    let E : ℝ := 1000 * (n : ℝ) ^ (12 * n ^ 2) *
      (Units.regulator K / Units.torsionOrder K) ^ ((1 : ℝ) / n) *
      Real.log ((2 * n : ℝ) ^ (4 * n) * Units.regulator K / Units.torsionOrder K) ^ n
    |(rayClassIdealCountingFunction 𝔪 c x : ℝ) -
        dedekindZeta_residue K * φ𝔮 / (H * Ideal.absNorm 𝔮) * x| ≤
      E * F ^ ((1 : ℝ) / n) * Real.log (3 * F) ^ n * (x / Ideal.absNorm 𝔮) ^ (1 - (1 : ℝ) / n) +
        (n : ℝ) ^ (8 * n) * Units.regulator K * Units.torsionOrder K * F := by
  sorry

/-! ## Layer 3: the residue -/

/-- **3.3, Friedman's unconditional lower bound** (`garcialee2022mertens` §3, (22), from
Friedman's `R_K/w_K ≥ 0.09058`). For every number field of degree at least `2`,
`κ_K ≥ 0.36232/√|d_K|`. -/
theorem dedekindZeta_residue_ge_friedman (K : Type*) [Field K] [NumberField K]
    (hn : 2 ≤ Module.finrank ℚ K) :
    0.36232 / Real.sqrt |(discr K : ℝ)| ≤ dedekindZeta_residue K := by
  sorry

/-! ## Layer 4: zeros of `ζ_K` -/

open Classical in
/-- **4.7, Stark's weight `α(K)`.** `4` if `K/ℚ` is Galois, `16` if `K` is not Galois but has a
normal tower, and `4 · n!` otherwise, `n = [K : ℚ]` (`garcialee2022mertens` §3, (24)). -/
noncomputable def starkAlpha (K : Type*) [Field K] [NumberField K] : ℝ :=
  if IsGalois ℚ K then 4 else if HasNormalTower K then 16 else 4 * (Module.finrank ℚ K).factorial

/-- **4.7, Stark's lower bound for a field with no quadratic subfield** (`garcialee2022mertens`
§3, line 1254, with Stark's constant `c₄ = 2 exp(21/8 − ψ(1/2)/(4 log 3))`,
`ψ(1/2) = −γ − 2 log 2`, so `c₄ = 43.1621…`). For a number field `K` of degree at least `3`
with no subfield of degree `2` over `ℚ`, `κ_K > 1/(c₄ α(K) log |d_K|)`. -/
theorem dedekindZeta_residue_gt_stark (K : Type*) [Field K] [NumberField K]
    (hn : 3 ≤ Module.finrank ℚ K)
    (hquad : ∀ F : IntermediateField ℚ K, Module.finrank ℚ F ≠ 2) :
    1 / (2 * Real.exp (21 / 8 + (eulerMascheroniConstant + 2 * Real.log 2) / (4 * Real.log 3)) *
        starkAlpha K * Real.log |(discr K : ℝ)|) < dedekindZeta_residue K := by
  sorry

/-! ## Layer 5: class numbers -/

/-- **5.3, Bordellès' regulator-free class-number bound** (`bordelles2002` Theorem 5.3). For a
number field of degree `n` and discriminant `d_K`,
`h_K ≤ (2^{n−1}/(n−1)!) √|d_K| (log |d_K|)^{n−1}`. -/
theorem classNumber_le_bordelles (K : Type*) [Field K] [NumberField K] (n : ℕ)
    (hK : Module.finrank ℚ K = n) :
    (classNumber K : ℝ) ≤ 2 ^ (n - 1) / (n - 1).factorial * Real.sqrt |(discr K : ℝ)| *
      Real.log |(discr K : ℝ)| ^ (n - 1) := by
  sorry

/-- **5.5, Louboutin's upper bound for the relative class number** (`louboutin2000` Corollary 3,
quoted at `louboutin2003` lines 603–605). For a CM-field `K` with `[K⁺ : ℚ] = n`, Hasse unit
index `Q_K`, `w_K` roots of unity and `D = |d_K|/|d_{K⁺}|`,
`h⁻(K) ≤ 2 Q_K w_K √D (e log D/(4πn))ⁿ`. -/
theorem relativeClassNumber_le (K : Type*) [Field K] [NumberField K] [IsCMField K] (n : ℕ)
    (hK : Module.finrank ℚ (maximalRealSubfield K) = n) :
    let D : ℝ := |(discr K : ℝ)| / |(discr (maximalRealSubfield K) : ℝ)|
    (relativeClassNumber K : ℝ) ≤
      2 * IsCMField.indexRealUnits K * Units.torsionOrder K * Real.sqrt D *
        (Real.exp 1 * Real.log D / (4 * π * n)) ^ n := by
  sorry

/-! ## Layer 6: least primitive roots -/

/-- **6.4, the least prime primitive root under the generalized Riemann hypothesis**
(`mcgowntrevinotrudgian2016` Theorem 2). For a prime `p ≥ 10⁹` with `GRHMod p`,
`ĝ(p) ≤ ((8/5)(2^{ω(p−1)} − 1) log p)²`, where `ω(p − 1)` is the number of distinct prime
factors of `p − 1`. -/
theorem leastPrimePrimitiveRoot_le_grh (p : ℕ) [NeZero p] (hp : p.Prime) (hp9 : 10 ^ 9 ≤ p)
    (hGRH : GRHMod p) :
    (leastPrimePrimitiveRoot p : ℝ) ≤
      ((8 / 5) * (2 ^ (p - 1).primeFactors.card - 1) * Real.log p) ^ 2 := by
  sorry

/-! ## Layer 7: prime ideals -/

/-- **7.1, Garcia–Lee's explicit Mertens theorems for a number field** (`garcialee2022mertens`
Theorem 1, (A1)–(A2), (B1)–(B2) and (C1)–(C2)). For `K` of degree `n ≥ 2` and real `x ≥ 2`, with
`Λ_K = e^{28.2n+5}(n+1)^{5(n+1)/2} |d_K|^{1/(n+1)} (log |d_K|)ⁿ`,
`Υ_K = ((n+1)² Λ_K/(2κ_K(n−1)) + 1) + 0.55 Λ_K n(n+1)/κ_K + n + 40.31 Λ_K n/κ_K` and
`Θ_K(x) = n/(x − 1) + 2Υ_K/log x`, the sum of `log N𝔭/N𝔭` over the prime ideals of norm at most
`x` is `log x` up to `Υ_K`, the sum of `1/N𝔭` is `log log x + M_K` up to `2Υ_K/log x`, where
`M_K` is Tau Ceti's Mertens constant of `K`, and the product of `1 − 1/N𝔭` is
`e^{−γ}/(κ_K log x)` times `1 + C` with `|C| ≤ Θ_K(x) e^{Θ_K(x)}`. -/
theorem primeIdeal_mertens_garciaLee (K : Type*) [Field K] [NumberField K] (n : ℕ)
    (hK : Module.finrank ℚ K = n) (hn : 2 ≤ n) (x : ℝ) (hx : 2 ≤ x) :
    let d : ℝ := |(discr K : ℝ)|
    let κ : ℝ := dedekindZeta_residue K
    let Λ : ℝ := Real.exp (28.2 * n + 5) * ((n : ℝ) + 1) ^ ((5 : ℝ) * (n + 1) / 2) *
      d ^ ((1 : ℝ) / (n + 1)) * Real.log d ^ n
    let Υ : ℝ := ((n + 1) ^ 2 * Λ / (2 * κ * (n - 1)) + 1) + 0.55 * Λ * n * (n + 1) / κ + n +
      40.31 * Λ * n / κ
    let Θ : ℝ := n / (x - 1) + 2 * Υ / Real.log x
    |∑ 𝔭 ∈ TauCeti.primesLE K x,
        Real.log (Ideal.absNorm 𝔭.asIdeal) / (Ideal.absNorm 𝔭.asIdeal : ℝ) - Real.log x| ≤ Υ ∧
    |∑ 𝔭 ∈ TauCeti.primesLE K x, (1 : ℝ) / (Ideal.absNorm 𝔭.asIdeal : ℝ) -
        Real.log (Real.log x) - TauCeti.LFunctions.mertensConstant K| ≤ 2 * Υ / Real.log x ∧
    |Real.exp eulerMascheroniConstant * κ * Real.log x *
        ∏ 𝔭 ∈ TauCeti.primesLE K x, (1 - 1 / (Ideal.absNorm 𝔭.asIdeal : ℝ)) - 1| ≤
      Θ * Real.exp Θ := by
  sorry

/-- **7.4, Ahn–Kwon's least prime ideal** (`ahnkwon2019` Theorem 1). For a Galois extension
`L/K` of number fields with `L ≠ ℚ` and a conjugacy class `C` of `Gal(L/K)`, some prime `𝔭` of
`K`, unramified in `L` with Frobenius class `C`, has prime absolute norm `N𝔭 ≤ |d_L|^{12577}`. -/
theorem leastPrimeIdeal_ahnKwon (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (hL : 2 ≤ Module.finrank ℚ L) (C : ConjClasses (L ≃ₐ[K] L)) :
    ∃ 𝔭 ∈ NumberField.Chebotarev.frobeniusPrimeSet K L C,
      (Ideal.absNorm 𝔭.asIdeal).Prime ∧
        (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ |(discr L : ℝ)| ^ 12577 := by
  sorry

/-- **7.5, Debaene's Brun–Titchmarsh inequality for the Chebotarev density theorem**
(`debaene2019` Theorem 1, with `log⁺` in place of the printed `log` and with `x > e`). Let `L/ℚ` be
Galois with group `G`, `C` a conjugacy class, `H ≤ G` an abelian subgroup meeting `C`, `K = L^H` of
degree `n`, `𝔣` the finite part of the conductor of `L/K` and
`c_K = n^{31n³} (R_K h_K)³ (1 + log⁺(R_K h_K))^{3(n−1)²} [L : K]ⁿ N𝔣 / κ_K^{2n}`. For every real
`x > e` with `c_K (log x)^{5n²} ≤ x`, the number of rational primes `p ≤ x` unramified in `L` with
Frobenius class `C` is at most `(|C|/|G|)(2 + 41 n² log log x/log(x/c_K)) x/log(x/c_K)`. -/
theorem frobeniusPrimeCount_le_debaene (L : Type) [Field L] [NumberField L] [IsGalois ℚ L]
    (C : ConjClasses (L ≃ₐ[ℚ] L)) (H : Subgroup (L ≃ₐ[ℚ] L)) [IsMulCommutative H]
    (hHC : ∃ σ ∈ H, ConjClasses.mk σ = C) (x : ℝ) (hx : Real.exp 1 < x) :
    let K := IntermediateField.fixedField H
    let n : ℕ := Module.finrank ℚ K
    let Rh : ℝ := Units.regulator K * classNumber K
    let c : ℝ := (n : ℝ) ^ (31 * n ^ 3) * Rh ^ 3 * (1 + Real.posLog Rh) ^ (3 * (n - 1) ^ 2) *
      (Module.finrank K L : ℝ) ^ n *
      (Ideal.absNorm (TauCeti.ClassFieldTheory.abelianConductor K L).finitePart : ℝ) /
      dedekindZeta_residue K ^ (2 * n)
    c * Real.log x ^ (5 * n ^ 2) ≤ x →
    (NumberField.Chebotarev.frobeniusPrimeCount ℚ L C x : ℝ) ≤
      (C.carrier.ncard : ℝ) / Nat.card (L ≃ₐ[ℚ] L) *
        (2 + 41 * n ^ 2 * Real.log (Real.log x) / Real.log (x / c)) * (x / Real.log (x / c)) := by
  sorry

end TauCetiRoadmap.ExplicitNumberFields
