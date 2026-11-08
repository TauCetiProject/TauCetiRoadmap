module

import Mathlib
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Counting
import TauCeti.NumberTheory.NumberField.Global.RayClass.Count.Basic
import TauCeti.NumberTheory.LFunctions.Mertens
import TauCeti.NumberTheory.Chebotarev.FrobeniusPrimeSet
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.VonMangoldt
import TauCeti.NumberTheory.ClassFieldTheory.Global.AdmissibleModulus.Basic
import TauCeti.NumberTheory.DirichletCharacter.GeneralizedBernoulli

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
  natural number (0.4), and, for an abelian field `F` with primitive character group `X(F)`, the
  Euler product `ζ_F = ∏ L(s, χ)` on `Re s > 1`, the residue product `κ_F = ∏_{χ ≠ 1} L(1, χ)`,
  the Gauss-sum product `∏ τ(χ) = i^{r₂} √|d_F|` and, for abelian CM `F`, the odd-character
  Bernoulli product for the relative class number (0.4a);
* Layer 1, the explicit remainders of the digamma and trigamma series on `Re z > 0` (1.1a), the
  roadmap's own analytic input for the gamma factors of `Λ_K`;
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
  bound for the least prime ideal with a given Frobenius class and Kadiri–Ng–Wong's bound beyond
  an absolute discriminant threshold (7.4), and Debaene's Brun–Titchmarsh inequality for the
  Chebotarev density theorem (7.5).

Not statable at the pins:

* every statement about the zeros or the values of the Dedekind zeta function `ζ_K` off the
  half-plane of convergence: the Euler product of an abelian field as continued functions (0.4a),
  Rademacher's bound (1.1), the zero-dependent and conditional residue
  bounds (3.1, 3.4, 3.5, 3.6), the zero counts, real-zero lemmas, Stark-like and zero-free regions
  and zero repulsion (4.1–4.6, 4.8–4.10), the consequences of the uniform real-zero gap for
  every `ζ_K` (4.9), the lower bounds for relative class numbers (5.6), and the explicit
  Chebotarev theorems and the least prime ideal under the generalized Riemann hypothesis (7.2–7.3,
  7.4): Mathlib's
  `NumberField.dedekindZeta` is the Dirichlet series itself, a junk value off `Re s > 1`; Tau
  Ceti continues it only to `Re s > 1 − 1/[K : ℚ]`; and neither library has its continuation to
  `ℂ`, its completion, or the L-function of a Hecke character;
* the bounds `g(p) < p^{5/8}`, `h(p) < p^{0.99}` and `h(p) < p^{2/3}` and Grosswald's conjecture
  under the generalized Riemann hypothesis (6.3–6.5): each carries the finite verification
  *PrimorialTableVerified* `26` under which ExplicitMultiplicativeFunctions states Robin's bound
  for `ω`, and the two bounds modulo `p²` also its *PrimorialTotientTableVerified* `24284` and
  ExplicitCharacterSumsAndSieves' *LapkovaSmallModuliVerified*; neither pinned library declares
  these propositions, and restating them here would duplicate their owners'. Besides,
  *McGownTrudgianOmegaChecks*, *McGownSorensonGapChecks* and *GrosswaldSieveVerification* would
  need long ad hoc encodings of the sources' sieve criteria (the Burgess moment constant
  `W(p, h, r)`, the sieve weights `δ_{ω,s}`, Bach's constant `c(p, x)` and Chen's criterion).

Every finite verification, table or certificate a theorem rests on is a named proposition of the
README's *Computational hypotheses*, carried as a hypothesis by the theorems that use it. None of
the theorems stated here uses one, so none of those propositions is declared in this file.

The other statable targets are variants of these headlines or of a supplier's, and are README
targets: Lee's count (2.3), whose constant differs between the two printings of the source;
Ramaré's counts for imaginary quadratic fields (2.7); Louboutin's refinements (3.2, 5.1, 5.2) of
the residue bound of AnalyticNumberTheoryPartI §2.15; the other forms of Bordellès' bound (5.3);
and Garcia–Lee's bounds for the Mertens constant (7.1). The results resting
on unrefereed preprints (Fehnker 2.6, Das–Gaba–Lee–Savalia–Wong 4.8 and 4.10, Guo and Banks 4.9
and 5.7, Das–Kadiri–Ng 7.3) and the API lemmas and intermediate targets of every layer are README
targets, not headlines.
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

open Classical in
/-- **0.4a, the Euler product of an abelian field** (`washington1997` Theorem 4.3). For an
intermediate field `F` of a cyclotomic field `K = ℚ(ζ_m)` and `Re s > 1`, `ζ_F(s)` is the product of
the L-functions of the characters modulo `m` that are trivial on `Gal(K/F)`, each taken at its
primitive character: the product over the primitive character group `X(F)`. -/
theorem dedekindZeta_eq_prod_LFunction (m : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    [IsAbelianGalois ℚ K] (F : IntermediateField ℚ K) (s : ℂ) (hs : 1 < s.re) :
    let X := IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar m K ℂ F
    dedekindZeta F s =
      ∏ χ : DirichletCharacter ℂ m,
        letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
        if χ ∈ X then DirichletCharacter.LFunction χ.primitiveCharacter s else 1 := by
  sorry

open Classical in
/-- **0.4a, the residue of an abelian field as a product of values `L(1, χ)`.** In the setting of
`dedekindZeta_eq_prod_LFunction`, `κ_F` is the product of the values at `1` of the L-functions of
the nontrivial characters of `X(F)`. -/
theorem dedekindZeta_residue_eq_prod_LFunction_one (m : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    [IsAbelianGalois ℚ K] (F : IntermediateField ℚ K) :
    let X := IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar m K ℂ F
    (dedekindZeta_residue F : ℂ) =
      ∏ χ : DirichletCharacter ℂ m,
        letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
        if χ ∈ X ∧ χ ≠ 1 then DirichletCharacter.LFunction χ.primitiveCharacter 1 else 1 := by
  sorry

open Classical in
/-- **0.4a, the Gauss-sum product of an abelian field.** The Gauss sums, with the standard
additive character, of the primitive characters of `X(F)` multiply to `i^{r₂(F)} √|d_F|`, with the
positive square root. -/
theorem abelianCharacter_gauss_product (m : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    [IsAbelianGalois ℚ K] (F : IntermediateField ℚ K) :
    let X := IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar m K ℂ F
    (∏ χ : DirichletCharacter ℂ m,
      letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
      if χ ∈ X then gaussSum χ.primitiveCharacter ZMod.stdAddChar else 1) =
        Complex.I ^ InfinitePlace.nrComplexPlaces F * (Real.sqrt |(discr F : ℝ)| : ℂ) := by
  sorry

open Classical in
/-- **0.4a, the relative class number of an abelian CM-field as a Bernoulli product**
(`washington1997` Theorem 4.17). For a CM intermediate field `F` of a cyclotomic field,
`h⁻(F) = Q_F w_F ∏_{χ ∈ X(F) odd} (−B_{1,χ}/2)`, with `B_{1,χ}` the first generalized Bernoulli
number of the primitive character. By `classNumber_maximalRealSubfield_dvd`, `h⁻(F)` is exactly the
ratio `h(F)/h(F⁺)`. -/
theorem relativeClassNumber_character_product (m : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    [IsAbelianGalois ℚ K] (F : IntermediateField ℚ K) [IsCMField F] :
    let X := IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar m K ℂ F
    (relativeClassNumber F : ℂ) =
      (IsCMField.indexRealUnits F : ℂ) * Units.torsionOrder F *
        ∏ χ : DirichletCharacter ℂ m,
          letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
          if χ ∈ X ∧ χ.Odd then -χ.primitiveCharacter.generalizedBernoulli 1 / 2 else 1 := by
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

/-! ## Layer 1: the digamma and trigamma remainders -/

/-- **1.1a, the digamma remainder.** For `Re z > 0` and `N ≥ 1`, the partial sum
`D_N(z) = −γ + Σ_{n<N} (1/(n+1) − 1/(n+z))` of the series for `ψ = Γ'/Γ` is within
`|z − 1|/(N − 1 + min(1, Re z))` of `ψ(z)`. -/
theorem digamma_series_remainder (z : ℂ) (hz : 0 < z.re) (N : ℕ) (hN : 1 ≤ N) :
    ‖Complex.digamma z - (-(eulerMascheroniConstant : ℂ) +
      ∑ n ∈ Finset.range N, (((n : ℂ) + 1)⁻¹ - ((n : ℂ) + z)⁻¹))‖ ≤
      ‖z - 1‖ / ((N : ℝ) - 1 + min 1 z.re) := by
  sorry

/-- **1.1a, the trigamma remainder.** For `Re z > 0` and `N ≥ 1`, the partial sum
`T_N(z) = Σ_{n<N} (n+z)⁻²` of the series for `ψ'` is within `1/(N − 1 + min(1, Re z))` of
`ψ'(z)`. -/
theorem trigamma_series_remainder (z : ℂ) (hz : 0 < z.re) (N : ℕ) (hN : 1 ≤ N) :
    ‖deriv Complex.digamma z - ∑ n ∈ Finset.range N, ((n : ℂ) + z)⁻¹ ^ 2‖ ≤
      1 / ((N : ℝ) - 1 + min 1 z.re) := by
  sorry

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

/-- **7.4, Kadiri–Ng–Wong's least prime ideal** (`kadiringwong2019` Theorem 1.1). There is an
absolute threshold `D₀` such that for every Galois extension `L/K` of number fields with
`|d_L| ≥ D₀` and every conjugacy class `C` of `Gal(L/K)`, some prime `𝔭` of `K`, unramified in `L`
with Frobenius class `C` and of degree one, has `N𝔭 ≤ |d_L|^{16}`. -/
theorem leastPrimeIdeal_kadiriNgWong :
    ∃ D₀ : ℝ, ∀ (K L : Type) [Field K] [NumberField K] [Field L] [NumberField L]
      [Algebra K L] [IsGalois K L] (C : ConjClasses (L ≃ₐ[K] L)), D₀ ≤ |(discr L : ℝ)| →
      ∃ 𝔭 ∈ NumberField.Chebotarev.frobeniusPrimeSet K L C,
        (Ideal.absNorm 𝔭.asIdeal).Prime ∧
          (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ |(discr L : ℝ)| ^ 16 := by
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
