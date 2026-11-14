module

import Mathlib

/-!
# Kloosterman sheaves and Bessel F-isocrystals for reductive groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib,
the headline theorems of the roadmap that are statable at the pins, each with `sorry`, together
with the few definitions those statements need: raw Kloosterman sums, the even orthogonal
exponential sum `U_n`, the quadratic hypergeometric sum, the trace character of a finite field and
the block truncations of a Dwork series.

The statable headlines are the exponential-sum identities obtained from the comparison of Bessel
F-isocrystals for different groups (README §11.1), the everywhere ordinarity of the odd and even
orthogonal Bessel F-isocrystals read on their trace functions (README §11.3), and the signed
2-adic refinement of Dwork's congruences (README §10.2).

The following headline theorems are not statable at the pins, and nothing is stated in their place:

* the existence of the `H`-valued Bessel F-isocrystal `Be_H†` whose Frobenius traces are those of
  the Heinloth–Ngô–Yun Kloosterman sheaf (README §§1.6, 4.1): the pinned libraries have no category
  of overconvergent F-isocrystals on a curve, no `ℓ`-adic local systems, no holonomic or arithmetic
  `D`-modules and no Hecke eigensheaves on `Bun_G`;
* the geometric Satake equivalence for arithmetic `D`-modules (README §1.3): no arithmetic
  `D`-modules on the affine Grassmannian;
* Zhu's identification of the de Rham Kloosterman connection with the Frenkel–Gross connection and
  the relative de Rham–rigid comparison (README §§2.7, 3.5): no algebraic `D`-modules on stacks, no
  opers and no rigid cohomology of families;
* the Frenkel–Gross differential Galois groups and the Bessel monodromy classification
  (README §§2.8, 6.4, 11.4): no differential Galois group of a `G`-connection and no Tannakian
  monodromy group of an F-isocrystal;
* generic ordinarity of `Be_H†` for every split reductive `H`, and everywhere ordinarity for types
  `A`, `C` and `G₂` stated on Newton points (README §§5.3, 11.3): no Newton point of a Frobenius
  class in `H`-valued F-isocrystals; the type `B` and `D` cases are stated below on trace
  functions, and the type `A` and `C` cases on trace functions are scalar Kloosterman
  ordinarity, which the README takes from KloostermanMomentsAndPotentialAutomorphy;
* the functoriality of Heinloth–Ngô–Yun Kloosterman sheaves and the companion monodromy
  comparison (README §§7.5, 7.6): no `ℓ`-adic local systems on `𝔾_m`;
* the characteristic-two isomorphism `Be_{2n+1}† ≅ Be†_{SO_{2n+1},Std}` (README §10.6): no
  overconvergent F-isocrystals; its trace consequence is `orthogonalSum_sub_card_eq_kloostermanSum`;
* Miyatani's arithmetic hypergeometric construction for two rational parameter sequences with
  nonintegral upper/lower differences, of rank the larger length, on `𝔾_m` in unequal lengths
  and on `𝔾_m \ {1}` in equal positive lengths, with convolution and trace compatibility
  (README §9.1): no arithmetic `D`-module or curve-isocrystal carrier;
* adjoint cohomological rigidity and the simple-wild local parameter at `∞` (README §§6.6, 11.5):
  no rigid cohomology with coefficients and no local Weil parameters valued in `H`.
-/

namespace TauCetiRoadmap.KloostermanSheavesAndBesselIsocrystals

open scoped BigOperators

/-! ## Layer 10: The characteristic-two comparison -/

/-- The block truncation `F_{m,s}(x) = ∑_{m p^s ≤ j < (m+1) p^s} B(j) x^j` of the power series
with coefficient sequence `B` (Xu–Zhu, Appendix A.4). -/
noncomputable def dworkBlock {K : Type*} [Field K] (p : ℕ) (B : ℕ → K) (m s : ℕ) :
    PowerSeries K :=
  PowerSeries.mk fun j => if m * p ^ s ≤ j ∧ j < (m + 1) * p ^ s then B j else 0

/-- **Signed 2-adic Dwork congruences** (Xu–Zhu, Theorem A.5(i′)). Let `R` be a discrete valuation
ring of mixed characteristic `(0, 2)`, complete or not, with fraction field `K`, and let `B⁽ⁱ⁾ : ℕ → Kˣ`,
`i ≥ 0`, satisfy: `B⁽ⁱ⁾(0)` is a unit of `R`; `B⁽ⁱ⁾(a + 2n) / B⁽ⁱ⁺¹⁾(n) ∈ R` for `a ∈ {0, 1}`; and
the signed congruence `B⁽ⁱ⁾(a + 2n + m 2^{s+1}) / B⁽ⁱ⁺¹⁾(n + m 2^s) ≡ u(i,s,m) B⁽ⁱ⁾(a + 2n) / B⁽ⁱ⁺¹⁾(n)`
modulo `2^{s+1} R`, with signs `u(i,s,m) = ±1` independent of `a, n` and equal to `1` for `s ≠ 1`.
Then `F⁽⁰⁾(x) F⁽¹⁾_{m,s}(x²) − F⁽⁰⁾_{m,s+1}(x) F⁽¹⁾(x²)` lies in `2^s B⁽ˢ⁺¹⁾(m) R⟦x⟧`. -/
theorem signed_dwork_congruence {R K : Type*} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R]
    [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    (h2 : ¬ IsUnit (2 : R))
    (B : ℕ → ℕ → K) (hB : ∀ i j, B i j ≠ 0)
    (u : ℕ → ℕ → ℕ → ℤˣ) (hu : ∀ i s m, s ≠ 1 → u i s m = 1)
    (ha : ∀ i, ∃ r : Rˣ, B i 0 = algebraMap R K r)
    (hb : ∀ i a n, a < 2 → ∃ r : R, B i (a + 2 * n) / B (i + 1) n = algebraMap R K r)
    (hc : ∀ i a n m s, a < 2 → ∃ r : R,
      B i (a + 2 * n + m * 2 ^ (s + 1)) / B (i + 1) (n + m * 2 ^ s)
        - ((u i s m : ℤ) : K) * (B i (a + 2 * n) / B (i + 1) n)
        = 2 ^ (s + 1) * algebraMap R K r)
    (m s N : ℕ) :
    ∃ r : R, PowerSeries.coeff N
        (PowerSeries.mk (B 0) * PowerSeries.expand 2 two_ne_zero (dworkBlock 2 (B 1) m s)
          - dworkBlock 2 (B 0) m (s + 1) * PowerSeries.expand 2 two_ne_zero (PowerSeries.mk (B 1)))
      = 2 ^ s * B (s + 1) m * algebraMap R K r := by
  sorry

/-! ## Layer 11: Everywhere ordinarity, the exceptional branch and the identities -/

/-- The raw rank-`k` Kloosterman sum `∑_{x₁ ⋯ x_k = a} ψ(x₁ + ⋯ + x_k)` over unit tuples, with no
normalizing factor. -/
noncomputable def kloostermanSum {F : Type*} [Field F] [Finite F] {K : Type*} [Field K]
    (ψ : AddChar F K) (k : ℕ) (a : Fˣ) : K := by
  classical
  exact ∑ᶠ x : Fin k → Fˣ, if ∏ i, x i = a then ψ (∑ i, (x i : F)) else 0

/-- The even orthogonal exponential sum
`U_n(a) = ∑_{x₁, …, x_{2n} ∈ Fˣ} ψ(x₁ + ⋯ + x_{2n} + a (x₁ + x₂) / (x₁ ⋯ x_{2n}))`,
written with the two distinguished variables `x₁, x₂` first; it is meant for `n ≥ 1`. -/
noncomputable def orthogonalSum {F : Type*} [Field F] [Finite F] {K : Type*} [Field K]
    (ψ : AddChar F K) (n : ℕ) (a : Fˣ) : K := by
  classical
  exact ∑ᶠ x : Fin 2 → Fˣ, ∑ᶠ y : Fin (2 * n - 2) → Fˣ,
    ψ ((x 0 : F) + x 1 + ∑ i, (y i : F)
      + (a : F) * ((x 0 : F) + x 1) * (((x 0 * x 1 * ∏ i, y i)⁻¹ : Fˣ) : F))

/-- Mathlib's integer-valued quadratic character of a finite field, transported to `K`. -/
noncomputable def quadraticCharIn (F : Type*) [Field F] [Finite F] (K : Type*) [Field K] :
    MulChar F K := by
  classical
  letI := Fintype.ofFinite F
  exact (quadraticChar F).ringHomComp (Int.castRingHom K)

/-- The hypergeometric sum with `N` upper parameters and one quadratic lower parameter,
`H_N(b) = ∑_{x₁ ⋯ x_N = b y} ψ(x₁ + ⋯ + x_N − y) ρ(y)`, where `y` is eliminated as
`(x₁ ⋯ x_N) / b` for `b ≠ 0`; the total expression is zero at `b = 0`. -/
noncomputable def quadraticHypergeometricSum {F : Type*} [Field F] [Finite F]
    {K : Type*} [Field K] (ψ : AddChar F K) (N : ℕ) (b : F) : K := by
  classical
  exact ∑ᶠ x : Fin N → Fˣ,
    ψ (∑ i, (x i : F) - ((∏ i, x i : Fˣ) : F) * b⁻¹)
      * quadraticCharIn F K (((∏ i, x i : Fˣ) : F) * b⁻¹)

/-- The additive character `x ↦ ψ₀(Tr_{F/𝔽_p}(x))` of a finite field with a `ZMod p`-algebra
structure, with `p` prime. -/
noncomputable def traceChar (p : ℕ) [Fact p.Prime] (F : Type*) [Field F] [Finite F]
    [Algebra (ZMod p) F]
    {K : Type*} [Field K] (ψ₀ : AddChar (ZMod p) K) : AddChar F K :=
  ψ₀.compAddMonoidHom (Algebra.trace (ZMod p) F).toAddMonoidHom

/-- **The characteristic-two orthogonal identity** (Xu–Zhu, Corollary 5.3.11(ii) and §1.2.9, as
corrected in README §11.1). Over a finite field of characteristic two and for the additive character
`ψ₀ ∘ Tr`, `U_n(a) − |F|` equals the raw Kloosterman sum of rank `2n + 1`; at `n = 1` this is
Carlitz's identity `Kl₂(a)² − |F| = Kl₃(a)`. It is the trace identity of the isomorphism
`Be_{2n+1}† ≅ Be†_{SO_{2n+1},Std}`. -/
theorem orthogonalSum_sub_card_eq_kloostermanSum (F : Type*) [Field F] [Finite F]
    [Algebra (ZMod 2) F] {K : Type*} [Field K] (ψ₀ : AddChar (ZMod 2) K) (hψ₀ : ψ₀ ≠ 1)
    (n : ℕ) (hn : 1 ≤ n) (a : Fˣ) :
    orthogonalSum (traceChar 2 F ψ₀) n a - Nat.card F
      = kloostermanSum (traceChar 2 F ψ₀) (2 * n + 1) a := by
  sorry

/-- **The odd-characteristic orthogonal identity** (Xu–Zhu, Corollary 5.3.11 and §1.2.9, as
corrected in README §11.1). Over a finite field of odd characteristic, for every nontrivial additive
character `ψ`, with `g = ∑_y ρ(y) ψ(−y)` the quadratic Gauss sum,
`g · (U_n(a) − |F|) = H_{2n+1}(4a)`. At `n = 1` this is Katz's identity relating
`Kl₂(a)² − |F|` to a quadratic hypergeometric sum. -/
theorem gaussSum_mul_orthogonalSum_sub_card (F : Type*) [Field F] [Finite F]
    (hF : ringChar F ≠ 2) {K : Type*} [Field K] (ψ : AddChar F K) (hψ : ψ ≠ 1)
    (n : ℕ) (hn : 1 ≤ n) (a : Fˣ) :
    (∑ᶠ y : F, quadraticCharIn F K y * ψ (-y)) * (orthogonalSum ψ n a - Nat.card F)
      = quadraticHypergeometricSum ψ (2 * n + 1) (4 * (a : F)) := by
  sorry

/-- **The orthogonal convolution identity** (Xu–Zhu, Corollary 5.3.11(i) and (1.2.9.2), with the
half twist and sign corrected in README §9.4 and §11.1). Over every finite field and for every
nontrivial additive character, for `N ≥ 2`,
`U_N(a) − |F| = ∑_{uv = a} (Kl₂(u)² − |F|) · Kl_{2N−2}(v)` in raw sums. -/
theorem orthogonalSum_sub_card_eq_convolution (F : Type*) [Field F] [Finite F]
    {K : Type*} [Field K] (ψ : AddChar F K) (hψ : ψ ≠ 1) (N : ℕ) (hN : 2 ≤ N) (a : Fˣ) :
    orthogonalSum ψ N a - Nat.card F
      = ∑ᶠ u : Fˣ, (kloostermanSum ψ 2 u ^ 2 - Nat.card F)
          * kloostermanSum ψ (2 * N - 2) (a * u⁻¹) := by
  sorry

/-- **Everywhere ordinarity of the orthogonal Bessel F-isocrystals, on trace functions**
(Xu–Zhu, Theorem 1.2.4(ii) and Theorem 5.4.2(ii), types `B_n` and `D_{n+1}`). For a finite field
`F` of characteristic `p`, `a ∈ Fˣ` and `n ≥ 1`, there are `β₀, …, β_{2n} ∈ ℂ_p` with
`v(β_i) = i · v(|F|)` such that for every finite extension `L/F`,
`U_n(a) − |L| = ∑ᵢ β_i^{[L:F]}`, the sums over `L` being taken with the character `ψ₀ ∘ Tr_{L/𝔽_p}`.
The `β_i` are `|F|^n` times the Frobenius eigenvalues of `Be†_{SO_{2n+1},Std}` at `a`. -/
theorem orthogonalSum_ordinary (p : ℕ) [Fact p.Prime] (F : Type) [Field F] [Finite F]
    [Algebra (ZMod p) F] (ψ₀ : AddChar (ZMod p) ℂ_[p]) (hψ₀ : ψ₀ ≠ 1)
    (n : ℕ) (hn : 1 ≤ n) (a : Fˣ) :
    ∃ β : Fin (2 * n + 1) → ℂ_[p],
      (∀ i, ‖β i‖ = ‖(Nat.card F : ℂ_[p])‖ ^ (i : ℕ)) ∧
      ∀ (L : Type) [Field L] [Finite L] [Algebra (ZMod p) L] [Algebra F L],
        orthogonalSum (traceChar p L ψ₀) n (Units.map (algebraMap F L : F →* L) a)
            - Nat.card L
          = ∑ i, β i ^ Module.finrank F L := by
  sorry

end TauCetiRoadmap.KloostermanSheavesAndBesselIsocrystals
