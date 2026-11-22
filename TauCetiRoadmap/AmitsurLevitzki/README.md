# Roadmap: the Amitsur–Levitzki theorem

**Summary.** A polynomial identity of an algebra is a noncommutative polynomial that vanishes
whenever its variables are replaced by elements of the algebra; a commutative algebra satisfies
`xy − yx`. The standard polynomial `S_k` is the signed sum of the `k!` products of `k` letters
taken in every order. This roadmap builds standard polynomials, polynomial identities with
coefficients in a commutative ring, the degree of a noncommutative polynomial and multilinear
polynomials, and proves that `S_{2n}` is an identity of `n × n` matrices over every commutative
ring while nothing of smaller degree is. Throughout, the coefficient ring of an identity is the
commutative ring over which the algebra is taken, and `n = 0` is allowed.

The main results are these.

- *Rosset's theorem.* If `n!` is a unit in a commutative ring `C`, then `S_{2n}` vanishes on
  every `2n` matrices of size `n` over `C`. The proof places the matrices in a single matrix over
  an exterior algebra, whose square has entries in a commutative subring; its traces vanish, so
  it is nilpotent by Newton's identities and the Cayley–Hamilton theorem.
- *The Amitsur–Levitzki theorem.* For every commutative ring `R` and every `n`, `S_{2n}` is a
  polynomial identity of the `n × n` matrices over `R`. Equivalently, `S_{2n}` vanishes on the
  `2n` generic `n × n` matrices over the integers.
- *Minimality.* No nonzero polynomial of degree less than `2n` with coefficients in `R` is an
  identity of the `n × n` matrices over `R`, finite fields included. For `R` nontrivial, `S_m` is
  an identity exactly when `m ≥ 2n`. Every nonzero identity yields a nonzero multilinear identity
  of the same degree.
- *Azumaya algebras.* An Azumaya algebra of constant rank `d²` over a commutative ring satisfies
  `S_{2d}` and no nonzero polynomial identity of degree less than `2d`.

Two side results are used on the way: the standard polynomials of positive even degree have
trace zero on square matrices over every commutative ring, in every characteristic, and over a
commutative ring in which `n!` is a unit a matrix whose first `n` powers have trace zero has
characteristic polynomial `Xⁿ`.

The roadmap builds on three roadmaps by other authors. The integral matrix form of Newton's
identities of RepresentationTheory/SchurWeyl gives the trace criterion. The generic matrices of
IntegralHeckeAndGaloisDeterminants carry the generic statement. The étale splitting of Azumaya
algebras of SchemeAndStackFoundations carries the theorem to Azumaya algebras. Mathlib supplies
free algebras, exterior algebras, characteristic polynomials and faithful flatness; Tau Ceti
supplies the graded commutation rule of exterior algebras.

Layer 1 defines the objects and proves three facts about standard polynomials: upward closure,
the bound by the number of spanning elements, and tracelessness in even degree. Layer 2 proves
the trace criterion, the power formula for the Grassmann matrix and Rosset's theorem. Layer 3
passes from the rationals to every commutative ring through generic matrices. Layer 4 proves the
staircase lemma, multilinearization and minimality. Layer 5 treats Azumaya algebras.

## Conventions

- **Rings.** `R` and `C` are commutative rings (`CommRing`), and `A` is an `R`-algebra
  (`[Ring A] [Algebra R A]`), not necessarily commutative. Matrices are Mathlib's
  `Matrix (Fin n) (Fin n) R`, an `R`-algebra; `n = 0` is allowed and gives the zero ring.
- **Noncommutative polynomials.** The polynomials in letters `X` with coefficients in `R` are
  Mathlib's `FreeAlgebra R X`; `FreeAlgebra.ι R a` is the letter `a`, and the evaluation at
  `x : X → A` is the algebra map `FreeAlgebra.lift R x`. Words are elements of `FreeMonoid X`,
  and `FreeAlgebra.basisFreeMonoid R X` is the basis of words; the coefficient of a word `w` in
  `f` is `(FreeAlgebra.basisFreeMonoid R X).repr f w`.
- **Letters and orders.** Indices start at `0`. A product written `x_{σ 0} ⋯ x_{σ (k-1)}` is the
  ordered product `(List.ofFn fun i => x (σ i)).prod`. Signs of permutations are
  `Equiv.Perm.sign`, valued in `ℤˣ`, and act on the free algebra through `ℤ`.
- **Identities.** A polynomial identity of `A` has coefficients in the base ring `R` of `A`, and
  holds when all evaluations in `A` vanish. Over a ring of characteristic `p` the polynomial
  `p·x` is the zero polynomial, not a nonzero identity. In the Azumaya layer `R` is the algebra
  and `A` the commutative base, following the supplier's notation.
- **Exterior algebras.** For the Grassmann matrix, `E = ExteriorAlgebra C (Fin m → C)` with
  generators `εᵢ = ExteriorAlgebra.ι C (Pi.single i 1)`; for a set `s` of indices, `ε_s` is the
  product of the `εᵢ`, `i ∈ s`, in increasing order, that is `ExteriorAlgebra.ιMulti` applied to
  the increasing enumeration `s.orderEmbOfFin` of `s`. The `ε_s` are Mathlib's basis
  `Module.Basis.ExteriorAlgebra` of the standard basis of `Fin m → C`.
- **Names.** "Amitsur's formula" for determinants is a different theorem, stated in
  IntegralHeckeAndGaloisDeterminants §0.5; it is not used or named here.

## Layer 1: standard polynomials and polynomial identities

### 1.1 Standard polynomials, identities, degree and multilinear polynomials

Define:

- `standardPolynomial R k : FreeAlgebra R (Fin k)`, the standard polynomial
  `S_k = ∑_σ sign(σ) x_{σ 0} ⋯ x_{σ (k-1)}`, the sum over all permutations `σ` of `Fin k`;
- `multilinearPolynomial α : FreeAlgebra R (Fin d)` for `α : Equiv.Perm (Fin d) → R`, the
  polynomial `∑_σ α(σ) x_{σ 0} ⋯ x_{σ (d-1)}`; the multilinear polynomials of degree `d` are
  exactly these;
- `IsPolynomialIdentity f A` for `f : FreeAlgebra R X`: `FreeAlgebra.lift R x f = 0` for every
  `x : X → A`;
- `totalDegree f`, the largest length of a word whose coefficient in `f` is nonzero, and `0` for
  `f = 0`; it is a natural number.

API, each fact stated for every commutative `R`:

- Evaluating `S_k` at `x` gives `∑_σ sign(σ) x_{σ 0} ⋯ x_{σ (k-1)}` computed in `A`, the same
  signed sum whatever the coefficient ring, so the value is unchanged when `A` is regarded as a
  `ℤ`-algebra; a ring map `A → B` of `R`-algebras commutes with evaluation (`FreeAlgebra.lift`
  composed with an algebra map, `FreeAlgebra.hom_ext`).
- `S_k` is the multilinear polynomial with `α(σ) = sign(σ)`, read in `R`.
- The evaluation `x ↦ S_k(x)` is `R`-multilinear and vanishes when two arguments are equal: the
  permutations `σ` and `swap(a, b) ∘ σ` give the same product when `x_a = x_b` and opposite signs
  (`Equiv.Perm.sign_swap`, `Finset.sum_involution`). This uses no characteristic hypothesis.
- If `f` is an identity of `A` and `φ : X → FreeAlgebra R Y`, then `FreeAlgebra.lift R φ f` is an
  identity of `A`: its evaluation at `y` is the evaluation of `f` at `FreeAlgebra.lift R y ∘ φ`.
- The two expansion formulas: for `x : Fin (k+1) → A`,
  `S_(k+1)(x) = ∑_i (−1)^i x_i S_k(x ∘ i.succAbove) = ∑_i (−1)^(k−i) S_k(x ∘ i.succAbove) x_i`.
  For the first, a permutation `σ` of `Fin (k+1)` with `σ 0 = i` is `(Fin.cycleRange i)⁻¹`
  composed with a permutation fixing `0`, which restricts to `τ` on `Fin k` with
  `σ (j+1) = i.succAbove (τ j)` (`Fin.cycleRange_symm_zero`, `Fin.cycleRange_symm_succ`), and
  `sign σ = (−1)^i sign τ` (`Fin.sign_cycleRange`). The second is the same argument with the
  last position.

**Checks.**
- `S_0 = 1` (one permutation, sign `1`, empty product), `S_1 = x_0`, `S_2 = x_0 x_1 − x_1 x_0`.
- Summing `sign(σ) x_{σ⁻¹ 0} ⋯ x_{σ⁻¹ (k-1)}` instead gives the same polynomial, since
  `sign σ⁻¹ = sign σ`. Dropping the sign does not: `x_0 x_1 + x_1 x_0` takes the value `2ab ≠ 0`
  at integers `a = b = 1`, while `S_2` is an identity of `ℤ`.
- The coefficient ring matters: `2·x_0`, as a polynomial over `ℤ`, is nonzero of degree `1` and
  vanishes on `2 × 2` matrices over `𝔽₂`; over `𝔽₂` it is the zero polynomial. So identities of
  `M_n(𝔽₂)` are taken with coefficients in `𝔽₂`, and the minimality of 4.3 would fail for
  integer coefficients.
- `x_0² − x_0` is a nonzero identity of `𝔽₂` (as an `𝔽₂`-algebra) of degree `2`.
- `totalDegree (x_0 x_1 + x_2) = 2`; over `𝔽₂`, `2·x_0 x_1 + x_2 = x_2` has degree `1`; a
  nonzero constant and `0` have degree `0`.
- For `d = 0`, `multilinearPolynomial α = α(1) · 1`.

*Needs:* Mathlib `FreeAlgebra`, `FreeAlgebra.ι`, `FreeAlgebra.lift`, `FreeAlgebra.lift_ι_apply`,
`FreeAlgebra.hom_ext`, `FreeAlgebra.basisFreeMonoid`, `Equiv.Perm.sign`, `Equiv.Perm.sign_swap`,
`Finset.sum_involution`, `Fin.cycleRange_symm_zero`, `Fin.cycleRange_symm_succ`,
`Fin.sign_cycleRange`; Tau Ceti `TauCeti.basisFreeMonoid_apply`.

### 1.2 Upward closure

Prove `IsPolynomialIdentity.standardPolynomial_of_le`: if `S_k` is a polynomial identity of an
`R`-algebra `A` and `k ≤ m`, then `S_m` is one. Route: by induction on `m`, the first expansion
formula of 1.1 writes `S_(m+1)(x)` as a signed sum of products `x_i S_m(…)`, each zero. (The
lecture notes of R. Bezrukavnikov, MIT 18.706, Spring 2023, Lecture 22, §22.6, p. 65, state the
implication over `ℂ` with a one-sentence argument by cosets of `S_m` in `S_p`; the statement here
is for every commutative ring. Proved here.)

**Checks.**
- `S_1` is an identity of the zero algebra only, and every `S_m` is then one; `S_2` is an
  identity of `ℤ`, and `S_3(a, b, c)` is a signed sum of `ab − ba` multiples, `0` for integers.
- The converse fails: `S_4` is an identity of `M_2(ℤ)` (3.2) and `S_2` is not
  (`S_2(e₁₁, e₁₂) = e₁₂`).

*Needs:* 1.1 (expansion formula).

### 1.3 The bound by the number of spanning elements

Prove `isPolynomialIdentity_standardPolynomial_of_span`: if the `R`-algebra `A` is spanned as an
`R`-module by `d` elements and `k > d`, then `S_k` is a polynomial identity of `A`. In particular
`M_n(R)` satisfies `S_k` for `k > n²`. Route: write each argument as an `R`-combination of the
spanning family (`Submodule.mem_span_range_iff_exists_fun`) and expand by multilinearity (1.1);
every term evaluates `S_k` on a map `Fin k → Fin d` composed with the family, which is not
injective since `k > d` (`Fintype.exists_ne_map_eq_of_card_lt`), and vanishes by the
alternation of 1.1. (The lecture notes above, Lecture 22, Example 22.8, p. 64, give the
argument for finite-dimensional algebras over a field of characteristic other than `2`; the
statement here is over every commutative ring, with no characteristic hypothesis, because the
evaluation is alternating and not only antisymmetric. Proved here.)

**Checks.**
- `k > d` is needed: `A = R = ℤ` is spanned by `1`, and `S_1 = x_0` is not an identity.
- `𝔽₂` itself (`d = 1`) satisfies `S_2`, with no characteristic hypothesis.
- The quaternions over `ℝ` (`d = 4`) satisfy `S_5`; on the basis, `S_4(1, i, j, k) = 0`, while
  `S_3(i, j, k) = −6` (`ijk = −1`, `ikj = 1`, `jik = 1`, `jki = −1`, `kij = −1`, `kji = 1`).

*Needs:* 1.1; Mathlib `Submodule.mem_span_range_iff_exists_fun`,
`Fintype.exists_ne_map_eq_of_card_lt`.

### 1.4 Even standard polynomials are traceless

Prove `trace_lift_standardPolynomial_eq_zero`: for every commutative `R`, every `n`, every
`k ≥ 1` and every `x : Fin (2k) → Matrix (Fin n) (Fin n) R`, the trace of `S_{2k}(x)` is `0`.
(Lecture notes above, Lecture 23, §23.1, p. 66, over `ℚ`, by the remark that the cyclic shift of
an even number of letters is an odd permutation; C. Procesi, arXiv:1308.2421v1, pp. 2–3, calls it
an easy exercise. That remark alone gives `2·trace = 0`. Proved here, in every characteristic.)

Route. Let `c = finRotate (2k)`, the cyclic shift `i ↦ i + 1`, a `2k`-cycle with
`sign c = −1` (`sign_finRotate`). For a permutation `σ`, the word of `σ ∘ cʲ` is the word of `σ`
rotated `j` places, so `T(σ) = sign(σ) trace(x_{σ 0} ⋯ x_{σ (2k-1)})` satisfies
`T(σ ∘ cʲ) = (−1)ʲ T(σ)` (`Matrix.trace_mul_comm`, `Equiv.Perm.sign_mul`). Every permutation
`τ` is `σ ∘ cʲ` for exactly one `j < 2k` and one `σ` with `σ 0 = 0`, namely
`j = −τ⁻¹(0) mod 2k` and `σ = τ ∘ c⁻ʲ`. Hence the trace of `S_{2k}(x)` is
`∑_{σ 0 = 0} T(σ) ∑_{j < 2k} (−1)ʲ`, and the inner sum is `0` because `2k` is even.

**Checks.**
- `k ≥ 1` is needed: `S_0 = 1` has trace `n` (`3` for `n = 3`).
- Odd degree fails: `trace S_3(e₁₁, e₁₂, e₂₁) = 3` for `2 × 2` integer matrices (the three cyclic
  orders `e₁₁e₁₂e₂₁ = e₁₁`, `e₁₂e₂₁e₁₁ = e₁₁`, `e₂₁e₁₁e₁₂ = e₂₂` contribute `1` each, and the
  other three products vanish).
- The sign of a `2k`-cycle is `−1` for `k = 1, 2, 3`; over `𝔽₂` the statement is not a
  consequence of `2·trace = 0`.

*Needs:* 1.1; Mathlib `finRotate`, `sign_finRotate`, `Matrix.trace_mul_comm`,
`Equiv.Perm.sign_mul`.

### Examples

- On `2 × 2` integer matrices, `S_2(e₁₁, e₁₂) = e₁₂` is traceless and nonzero, and
  `S_3(e₁₁, e₁₂, e₂₂) = e₁₂` (only the order `e₁₁e₁₂e₂₂` is nonzero).
- Every commutative algebra satisfies `S_2`, hence every `S_k` with `k ≥ 2` by 1.2.

### Dependencies

1.1 uses Mathlib and Tau Ceti's word basis. 1.2, 1.3 and 1.4 use 1.1 and Mathlib.

## Layer 2: Grassmann matrices and Rosset's theorem when `n!` is a unit

### 2.1 The trace criterion over a commutative ring

Prove `charpoly_eq_X_pow_and_pow_eq_zero_of_trace_pow`: let `C` be a commutative ring in which
`n!` is a unit and `B` an `n × n` matrix over `C` with `trace(Bᵏ) = 0` for `1 ≤ k ≤ n`. Then the
characteristic polynomial of `B` is `Xⁿ` and `Bⁿ = 0`. (Lecture notes above, Lecture 23,
Corollary 23.2, p. 66, for the second step; the first step is asserted there and in Procesi,
p. 2. Proved here, on RepresentationTheory/SchurWeyl §7.8.)

Route. Write `c_r` for the coefficient of `X^r` in `B.charpolyRev`. By SchurWeyl §7.8,
`matrixTraceNewton B r` gives `r c_r = −∑_(j<r) c_(r−j−1) trace(B^(j+1))` for every `r > 0`. For
`1 ≤ r ≤ n` every trace on the right is `0`, and `r` divides `n!` (`Nat.dvd_factorial`), so it is a
unit (`isUnit_of_dvd_unit`) and `c_r = 0`. By `Matrix.reverse_charpoly` the reverse of the monic
polynomial `B.charpoly` of degree `n` (`Matrix.charpoly_monic`,
`Matrix.charpoly_natDegree_eq_dim`) is `B.charpolyRev`, so its coefficient of `X^(n−r)` is `c_r`
(`Polynomial.coeff_reverse`); hence `B.charpoly = Xⁿ` (over the zero ring every
polynomial is `0` and there is nothing to prove), and Cayley–Hamilton
(`Matrix.aeval_self_charpoly`) gives `Bⁿ = 0`. Only the traces of the first `n` powers are used.

**Checks.**
- The unit hypothesis is needed: over `𝔽₂`, the identity `B = I₂` has `trace B = trace B² = 0` and
  `B² = I₂ ≠ 0`; of the `16` matrices of `M_2(𝔽₂)`, `8` have both traces `0` and `4` of those
  have `B² ≠ 0`. Over `𝔽_p` the identity `I_p` has every `trace(Bᵏ) = p = 0` and is not
  nilpotent, for `p = 2, 3, 5`.
- With `2! = 2` a unit, over `𝔽₃` all `9` matrices of `M_2(𝔽₃)` with `trace B = trace B² = 0` are
  nilpotent.
- The trace of `Bⁿ` is needed: over `ℚ`, `B = diag(1, −1)` has `trace B = 0`, `trace B² = 2` and
  is not nilpotent.
- `n = 0`: the empty matrix has characteristic polynomial `1 = X⁰`, and `B⁰ = 1 = 0` in the zero
  ring.

*Needs:* RepresentationTheory/SchurWeyl §7.8 `matrixTraceNewton`; Mathlib `Matrix.charpolyRev`,
`Matrix.reverse_charpoly`, `Matrix.charpoly_monic`, `Matrix.charpoly_natDegree_eq_dim`,
`Polynomial.coeff_reverse`, `Matrix.aeval_self_charpoly`, `Nat.dvd_factorial`,
`isUnit_of_dvd_unit`.

### 2.2 The Grassmann matrix and its powers

Define `grassmannMatrix x` for `x : Fin m → Matrix (Fin n) (Fin n) C`: the `n × n` matrix
`G = ∑ᵢ xᵢ εᵢ` over the exterior algebra `E` of `C^m`, where `xᵢ` is mapped entrywise by
`algebraMap C E` and `εᵢ` acts as the scalar matrix `Matrix.scalar (Fin n) εᵢ`.

Prove `grassmannMatrix_pow`: for every `k`,
`Gᵏ = ∑_s S_k(x restricted to s) ε_s`, the sum over the `k`-element subsets `s` of `Fin m`, where
`x` restricted to `s` is `x ∘ s.orderEmbOfFin`, the value `S_k(…)` is mapped entrywise into `E`
and `ε_s` acts as a scalar matrix. In particular `Gᵏ = 0` for `k > m`. (Procesi, Proposition 2.1,
p. 2, in the language of antisymmetric multilinear maps, stated without proof; the case `k = m`
is used in the lecture notes above, Lecture 23, p. 66. Proved here.)

Route. The scalar matrices `εᵢ` commute with every matrix whose entries lie in the image of `C`
(`Algebra.commutes`), so expanding the product gives
`Gᵏ = ∑_f (x_{f 0} ⋯ x_{f (k-1)}) ε_{f 0} ⋯ ε_{f (k-1)}` over all `f : Fin k → Fin m`. The product
of generators is `ExteriorAlgebra.ιMulti` of `εᵢ ∘ f`, an alternating map
(`ExteriorAlgebra.ιMulti_apply`): it vanishes when `f` is not injective
(`AlternatingMap.map_eq_zero_of_not_injective`), and an injective `f` is
`s.orderEmbOfFin ∘ ρ` for a unique `k`-subset `s` and permutation `ρ`, with
`ε_{f 0} ⋯ ε_{f (k-1)} = sign(ρ) ε_s` (`AlternatingMap.map_perm`). Collecting the terms of each
`s` gives `S_k(x ∘ s.orderEmbOfFin) ε_s`.

**Checks.**
- `k = 0`: only `s = ∅`, with `S_0 = 1` and `ε_∅ = 1`, so `G⁰ = 1`.
- `n = 1`: `G² = ∑_(i<j) (xᵢxⱼ − xⱼxᵢ) εᵢεⱼ = 0` for scalars, consistent with `S_2` being an
  identity of `C`.
- `n = 2`, `m = 4`, with `x₀ = [[1, 2], [0, −1]]`, `x₁ = [[0, 1], [3, 2]]`,
  `x₂ = [[2, −1], [1, 1]]`, `x₃ = [[1, 0], [2, 3]]` over `ℤ`: `trace G = 2ε₁ + 3ε₂ + 4ε₃`,
  `trace G² = 0`, `trace G³ = 54 ε₀ε₁ε₂ − 36 ε₀ε₂ε₃ − 18 ε₁ε₂ε₃`, `trace G⁴ = 0`, and `G⁴ = 0`.
  The power formula was recomputed term by term for this family for `k = 0, …, 5`.

*Needs:* 1.1; Mathlib `ExteriorAlgebra.ι`, `ExteriorAlgebra.ιMulti`, `ExteriorAlgebra.ιMulti_apply`,
`AlternatingMap.map_perm`, `AlternatingMap.map_eq_zero_of_not_injective`, `Finset.orderEmbOfFin`,
`Matrix.scalar`, `Algebra.commutes`.

### 2.3 Rosset's theorem

Prove `isPolynomialIdentity_standardPolynomial_of_isUnit_factorial`: if `n!` is a unit in the
commutative ring `C`, then `S_{2n}` is a polynomial identity of `Matrix (Fin n) (Fin n) C`. Layer 3
proves the same conclusion for every commutative ring by a reduction that applies this theorem
to a polynomial ring over `ℚ`. (The argument is attributed to S. Rosset (1976) by the lecture
notes above and by Procesi; the notes, Lecture 23, §23.1, p. 66, print the proof over `ℚ`,
writing `S_n` for `S_{2n}` and the range `i ≤ n − 1` for the traces where `i ≤ n` is meant;
Procesi, pp. 2–3, sketches it over `ℚ`. The statement here is for every commutative ring in
which `n!` is a unit.)

Route. Fix `x : Fin (2n) → Matrix (Fin n) (Fin n) C`, take `m = 2n` and `G = grassmannMatrix x`.

1. *The square has central entries.* By 2.2, `B = G²` is `∑_(|s|=2) S_2(…) ε_s`, so its entries
   are `C`-linear combinations of the `ε_s` with `|s| = 2`, which lie in `⋀²`
   (`ExteriorAlgebra.ιMulti_range`). An element `y` of `⋀²` is fixed by the grade involution
   (Tau Ceti `TauCeti.ExteriorAlgebra.involute_of_mem_exteriorPower`, with `(−1)² = 1`), so it
   commutes with every generator (Tau Ceti `ExteriorAlgebra.ι_mul_eq_involute_mul`), hence with
   all of `E`, which the generators and scalars generate: `y ∈ Subalgebra.center C E`
   (`Subalgebra.mem_center_iff`). So `B` is the image of a matrix `B'` over the commutative ring
   `Z = Subalgebra.center C E` under the injective map `Subalgebra.val`.
2. *Traces vanish.* For `1 ≤ j ≤ n`, `Bʲ = G^(2j)`, and by 2.2 its trace is
   `∑_s trace(S_{2j}(x ∘ s.orderEmbOfFin)) ε_s` (the trace of a matrix times a scalar matrix is the
   trace times the scalar), which is `0` by 1.4. Traces and powers commute with `Subalgebra.val`
   (`AddMonoidHom.map_trace`, `Matrix.map_pow`), so `trace(B'ʲ) = 0`.
3. *Nilpotence.* `n!` is a unit in `Z` (image of a unit), so 2.1 gives `B'ⁿ = 0`, hence
   `G^(2n) = Bⁿ = 0`.
4. *Extraction.* By 2.2 with `k = 2n = m` there is one subset, `Finset.univ`, whose increasing
   enumeration is the identity (`Finset.orderEmbOfFin_unique`), so `G^(2n)` is `S_{2n}(x)` mapped
   into `E` times `ε_univ`. Each entry is `S_{2n}(x)_(a,b) • ε_univ = 0`; `ε_univ` is a vector
   of the basis `Module.Basis.ExteriorAlgebra` (`ExteriorAlgebra.basis_apply`), so the
   coefficient is `0` (`Module.Basis.repr_self`).

The hypothesis on `n!` enters only in step 3, through the divisions by `1, …, n` in Newton's
identities.

**Checks.**
- For the family of the Checks of 2.2 (`n = 2`), `G⁴ = 0` and `S_4(x₀, x₁, x₂, x₃) = 0`; for
  `n = 3` and the six integer matrices `[[1,2,0],[0,−1,1],[3,0,2]]`, `[[0,1,1],[3,2,0],[1,0,1]]`,
  `[[2,−1,0],[1,1,1],[0,2,1]]`, `[[1,0,2],[2,3,0],[0,1,1]]`, `[[0,0,1],[1,0,0],[2,1,3]]`,
  `[[1,1,1],[0,2,1],[1,0,0]]`, the Grassmann matrix has `G⁶ = 0` and `G⁵ ≠ 0`, and `S_6` vanishes.
- `S_4` is not an identity of `3 × 3` matrices: on the first four matrices above
  `S_4 = [[4, 4, 29], [−33, −8, 0], [4, −41, 4]]`.
- `n = 0`: `S_0 = 1 = 0` in the zero ring.

*Needs:* 1.4, 2.1, 2.2; Mathlib `Subalgebra.center`, `Subalgebra.mem_center_iff`,
`Subalgebra.val`, `ExteriorAlgebra.ιMulti_range`, `AddMonoidHom.map_trace`, `Matrix.map_pow`,
`Finset.orderEmbOfFin_unique`, `Module.Basis.ExteriorAlgebra`, `ExteriorAlgebra.basis_apply`,
`Module.Basis.repr_self`; Tau Ceti `ExteriorAlgebra.ι_mul_eq_involute_mul`,
`TauCeti.ExteriorAlgebra.involute_of_mem_exteriorPower`.

### Examples

- Over `𝔽₂` and `n = 2`, `2! = 2` is not a unit, so 2.3 does not apply, and 2.1 fails for `I₂`;
  `S_4` is still an identity of `M_2(𝔽₂)` by 3.2.
- Over `ℤ[1/6]` and `n = 3`, 2.3 applies directly.

### Dependencies

2.1 uses RepresentationTheory/SchurWeyl §7.8 and Mathlib. 2.2 uses 1.1. 2.3 uses 1.4, 2.1, 2.2,
Mathlib and Tau Ceti's exterior-algebra commutation rule.

## Layer 3: the Amitsur–Levitzki theorem over every commutative ring

### 3.1 Generic matrices

Copy verbatim, with its citation, the definition `genericMatrices X d` of
IntegralHeckeAndGaloisDeterminants §0.4: the `ℤ`-algebra map from `FreeAlgebra ℤ X` to the
`d × d` matrices over `MvPolynomial (X × Fin d × Fin d) ℤ` sending the letter `a` to the matrix
of variables `(x_(a,i,j))`.

Prove `genericMatrices_standardPolynomial`: `S_{2n}` vanishes on the `2n` generic `n × n`
matrices, `genericMatrices (Fin (2n)) n (standardPolynomial ℤ (2n)) = 0`. (The lecture notes
above, Lecture 23, p. 66, reduce the theorem from `ℤ` to `ℚ` in one sentence; Procesi, p. 1,
likewise. The transfer through generic matrices below is proved here.)

Route. Let `φ` be `MvPolynomial.map (Int.castRingHom ℚ)` from the integer polynomial ring
`P_ℤ = MvPolynomial (Fin (2n) × Fin n × Fin n) ℤ` to the rational one `P_ℚ`; it is injective
(`MvPolynomial.map_injective`, `Int.cast_injective`), hence so is `φ.mapMatrix`
(`RingHom.mapMatrix`). The map `φ.mapMatrix` is a ring map, so it carries the value of `S_{2n}`
at the generic matrices over `P_ℤ` to the value of `S_{2n}` at their images, which are the generic
matrices over `P_ℚ` (1.1). Since `P_ℚ` is a commutative `ℚ`-algebra, `n!` is a unit in it, and
2.3 over `C = P_ℚ` gives `0`. Injectivity gives the claim.

**Checks.**
- `n = 1`: the generic `1 × 1` matrices commute, and `S_2` on them is `x_a x_b − x_b x_a = 0`.
- `n = 0`: the matrices are `0 × 0`, and both sides are the empty matrix.
- The theorem is about integer polynomials: an argument that stopped at `ℚ` would leave open, for
  instance, every ring of characteristic `2`.

*Needs:* 1.1, 2.3, IntegralHeckeAndGaloisDeterminants §0.4 `genericMatrices` (copied); Mathlib
`MvPolynomial.map`, `MvPolynomial.map_injective`, `Int.cast_injective`, `RingHom.mapMatrix`.

### 3.2 The Amitsur–Levitzki theorem

Prove `isPolynomialIdentity_standardPolynomial_two_mul`: for every commutative ring `R` and every
`n`, `S_{2n}` is a polynomial identity of `Matrix (Fin n) (Fin n) R`. With 1.2, so is `S_m` for
every `m ≥ 2n`. (A. S. Amitsur and J. Levitzki, 1950; stated over every commutative ring in the
lecture notes above, Lecture 22, Theorem 22.9, p. 64. Proved here from 3.1.)

Route. Given `x : Fin (2n) → Matrix (Fin n) (Fin n) R`, let
`ψ = MvPolynomial.eval₂Hom (Int.castRingHom R) (fun (a, i, j) => x a i j)`. Then `ψ.mapMatrix`
sends the generic matrix of the letter `a` to `x a`, so `ψ.mapMatrix ∘ genericMatrices` and
`FreeAlgebra.lift ℤ x` agree on letters and are equal (`FreeAlgebra.hom_ext`, with ring maps as
`ℤ`-algebra maps, `RingHom.toIntAlgHom`). Applying both to `standardPolynomial ℤ (2n)` and using
3.1 gives that the signed sum `S_{2n}(x)` is `0`, which is the value of
`standardPolynomial R (2n)` at `x` (1.1).

**Checks.**
- Commutativity of the coefficients is needed: in `M_1(M_2(ℤ))`, that is in `M_2(ℤ)` regarded as
  `1 × 1` matrices over the noncommutative ring `M_2(ℤ)`, `S_2(e₁₁, e₁₂) = e₁₂ ≠ 0`; and in
  `M_2(M_2(ℤ)) ≅ M_4(ℤ)`, `S_4(e₁₁, e₁₂, e₂₂, e₂₃) = e₁₃ ≠ 0`. So the theorem fails for some
  noncommutative coefficient rings.
- `M_2(𝔽₂)`: `S_4` is an identity although `2` is not a unit.
- Over `ℤ` and `n = 3`, the six integer matrices of the Checks of 2.3 give `S_6 = 0`.

*Needs:* 1.1, 3.1; Mathlib `MvPolynomial.eval₂Hom`, `RingHom.mapMatrix`, `RingHom.toIntAlgHom`,
`FreeAlgebra.hom_ext`.

### Examples

- For `n = 2`, every five `2 × 2` matrices `a, b, c, d, e` over any commutative ring satisfy
  `S_5(a, b, c, d, e) = 0`, by 3.2 and 1.2.
- The theorem for `M_n(R)` gives it for every `R`-algebra with an injective `R`-algebra map into
  `M_n(R)`, in particular every subalgebra; 5.1 rests on the same observation.

### Dependencies

3.1 uses 1.1, 2.3 and IntegralHeckeAndGaloisDeterminants §0.4. 3.2 uses 1.1 and 3.1.

## Layer 4: minimality of the degree `2n`

### 4.1 The staircase lemma

Prove `eq_zero_of_isPolynomialIdentity_multilinearPolynomial`: let `R` be a commutative ring and
`d < 2n`. If the multilinear polynomial with coefficients `α : Equiv.Perm (Fin d) → R` is a
polynomial identity of `Matrix (Fin n) (Fin n) R`, then `α = 0`. In particular `S_{2n−1}` is not
an identity of `M_n(R)` for `n ≥ 1` and `R` nontrivial. (Lecture notes above, Lecture 22,
Lemma 22.10, p. 64, with proof; the list of matrix units printed there,
`e₁₁, e₁₂, e₂₁, e₂₂, …`, has product `0` in that order, and the list used below is the one the
argument needs. The statement here asks for all coefficients to vanish, which needs no
nontriviality hypothesis.)

Route. Number the staircase `u₀ = e₁₁, u₁ = e₁₂, u₂ = e₂₂, u₃ = e₂₃, …, u_(2n−2) = e_(nn)`, that is
`u_(2k) = e_(k+1,k+1)` and `u_(2k+1) = e_(k+1,k+2)` (indices from `1` here), using
`Matrix.single`. A product of matrix units is nonzero exactly when each column index equals the
next row index (`Matrix.single_mul_single_same`, `Matrix.single_mul_single_of_ne`). Every
staircase unit `e_(a,b)` has `a ≤ b ≤ a + 1`, so along a nonzero product of distinct staircase
units the row index never decreases, the loop `e_(kk)` comes after `e_(k−1,k)` (for `k ≥ 2`) and
before `e_(k,k+1)`, and the only nonzero order of `u₀, …, u_(d−1)` is the increasing one, whose
product is `e_(1, ⌊d/2⌋+1)` (the identity matrix for `d = 0`). For a permutation `τ`, substitute
`x_j = u_(τ⁻¹ j)`: the value is `∑_σ α(σ) u_(τ⁻¹σ 0) ⋯ u_(τ⁻¹σ (d−1))`, and only `σ = τ` survives,
giving `α(τ) e_(1, ⌊d/2⌋+1)`, whose entry at `(1, ⌊d/2⌋+1)` is `α(τ)`. So `α(τ) = 0`.

**Checks.**
- `S_{2n−1}` at the first `2n − 1` staircase units is `e_(1n)`: `e₁₁` for `n = 1`, `e₁₂` for
  `n = 2`, `e₁₃` for `n = 3`, `e₁₄` for `n = 4`.
- For `n = 2, 3` and every `d < 2n`, exactly one of the `d!` orders of `u₀, …, u_(d−1)` has a
  nonzero product.
- The bound is sharp for `R` nontrivial: `S_{2n}` is multilinear of degree `2n` with nonzero
  coefficients and is an identity (3.2).
- For `n = 2`, the multilinear identities of degree `4` of `M_2(F)` form a line spanned by `S_4`
  for `F = ℚ, 𝔽₂, 𝔽₃` (the `1024 × 24` evaluation matrix on matrix-unit tuples has rank `23`).

*Needs:* 1.1; Mathlib `Matrix.single`, `Matrix.single_mul_single_same`,
`Matrix.single_mul_single_of_ne`, `Matrix.single_apply`.

### 4.2 Multilinearization

Prove `exists_multilinearPolynomial_of_isPolynomialIdentity`: if a nonzero `f : FreeAlgebra R X`
is a polynomial identity of an `R`-algebra `A`, then some multilinear polynomial with nonzero
coefficient family `α : Equiv.Perm (Fin (totalDegree f)) → R` is a polynomial identity of `A`.
(Lecture notes above, Lecture 22, Lemma 22.11(a), p. 64, by a double induction with partial
linearizations. The last step of the printed proof, `P ↦ P − P|_(xᵢ=0)` for a letter `xᵢ` absent
from some monomials, can lower the degree (third Check below), so the printed argument gives a
multilinear identity of degree at most that of `P`, not of the same degree as the lemma states.
The route below is a different, one-step polarization that keeps the degree, valid over every
commutative ring. Proved here.)

Route. Choose a word `w = w₀ ⋯ w_(ℓ−1)` of maximal length `ℓ = totalDegree f` with nonzero
coefficient `f_w` (the support of `f` in the word basis is nonempty since `f ≠ 0`). Substitute
for each letter `a` the sum `∑_(j : w_j = a) y_j` of new letters `y₀, …, y_(ℓ−1)`, and `0` for
letters not in `w`, by `FreeAlgebra.lift`; the result `F` is an identity of `A` (1.1). A word
`v` of `f` becomes the sum of the words `y_(j₀) ⋯ y_(j_(r−1))` with `v_t = w_(j_t)`; since `v` is
recovered from the indices, the coefficient of a word `u` in the letters `y` is `f_(w ∘ u)`, the
coefficient of the word `w_(u₀) ⋯ w_(u_(r−1))`. Next take the inclusion–exclusion sum
`∑_S (−1)^(ℓ−|S|) F|_(y_j = 0, j ∉ S)` over subsets `S` of `Fin ℓ`; each term is an identity, and
the sum keeps exactly the words of `F` that contain every letter `y_j`. Such a word has length at
least `ℓ`, and at most `ℓ` when its coefficient is nonzero, so it is `y_(π 0) ⋯ y_(π (ℓ−1))` for a
permutation `π`. The sum is the multilinear polynomial with `α(π) = f_(w ∘ π)`, and
`α(1) = f_w ≠ 0`.

**Checks.**
- `f = x² − x` over `𝔽₂` (an identity of `𝔽₂`): `w = xx`, `ℓ = 2`, and the result is
  `y₀y₁ + y₁y₀`, which is `2y₀y₁ = 0` on `𝔽₂`; it has degree `2 = totalDegree f`.
- `f = xy − yx` over `ℤ` (an identity of `ℤ`): `w = xy` gives `α(1) = 1`, `α(swap) = −1`, the
  polynomial `S_2`.
- The step `P ↦ P − P|_(x₃=0)` of the printed proof can lower the degree: it turns the polynomial
  `P = x₁x₂ + x₃`, of degree `2` and already of degree at most one in each letter, into `x₃`. The
  polarization above applied to `P` takes `w = x₁x₂` and gives `y₀y₁`, of degree `2`.

*Needs:* 1.1; Mathlib `FreeAlgebra.lift`, `FreeAlgebra.basisFreeMonoid`.

### 4.3 Minimality

Prove `not_isPolynomialIdentity_of_totalDegree_lt`: for every commutative ring `R`, every `n`
and every set of letters `X`, no nonzero `f : FreeAlgebra R X` with `totalDegree f < 2n` is a
polynomial identity of `Matrix (Fin n) (Fin n) R`. Route: 4.2 gives a nonzero multilinear
identity of degree `totalDegree f < 2n`, which 4.1 forbids. (Lecture notes above, Lecture 22,
Theorem 22.9, p. 64, for homogeneous identities and `R ≠ 0`; the statement here covers every
identity, with no infinite-field hypothesis. Over the zero ring the free algebra is `0`, so the
statement needs no nontriviality hypothesis; at `n = 0` it is vacuous.)

**Checks.**
- Finite fields: for `M_2(𝔽₂)`, the `40` words of degree at most `3` in three letters take
  linearly independent values over `𝔽₂` (the evaluation matrix over all `16³` triples has rank
  `40`; with one and two letters, `4` and `15` words, ranks `4` and `15`), so no nonzero
  polynomial of degree at most `3` in at most three letters is an identity.
- The degree is the right measure: `x^p − x` is an identity of `𝔽_p = M_1(𝔽_p)` of degree
  `p ≥ 2 = 2n`.
- A formulation with integer coefficients is false: `2·x₀` vanishes on `M_n(𝔽₂)` (1.1).

*Needs:* 4.1, 4.2.

### 4.4 Which standard polynomials are identities

Prove `isPolynomialIdentity_standardPolynomial_iff`: for a nontrivial commutative ring `R` and
every `n`, `S_m` is a polynomial identity of `Matrix (Fin n) (Fin n) R` if and only if
`m ≥ 2n`. Route: (⇐) 3.2 and 1.2. (⇒) If `m < 2n`, `S_m` is the multilinear polynomial with
coefficients `sign`, so 4.1 would give `sign(1) = 1 = 0` in `R`. (Proved here.)

**Checks.**
- Nontriviality is needed: over the zero ring every `S_m` is an identity of `M_1`, including
  `S_0` and `S_1`.
- `n = 0`: every `S_m` is an identity of the zero ring, and `m ≥ 0` always holds.
- `n = 2`: `S_3` is not an identity (`S_3(e₁₁, e₁₂, e₂₂) = e₁₂`), `S_4` and `S_5` are.

*Needs:* 1.1, 1.2, 3.2, 4.1.

### Examples

- `M_2(𝔽₂)` satisfies `S_4`, no `S_m` with `m ≤ 3`, and no nonzero polynomial of degree at most `3`
  with coefficients in `𝔽₂`.
- `𝔽_p` (`n = 1`) satisfies `S_2` and `x^p − x`, and no nonzero polynomial of degree `≤ 1`: a
  polynomial `a + ∑ bᵢ xᵢ` vanishing at `0` and at the unit vectors is `0`.

### Dependencies

4.1 and 4.2 use 1.1. 4.3 uses 4.1 and 4.2. 4.4 uses 1.2, 3.2 and 4.1.

## Layer 5: Azumaya algebras

In this layer `A` is a commutative ring and `R` an `A`-algebra, both in one universe, with
Mathlib's `IsAzumaya A R` (finite, projective and faithful as an `A`-module, and
`R ⊗_A Rᵐᵒᵖ → End_A(R)` bijective), and constant rank `d²`:
`Module.rankAtStalk (R := A) R = fun _ => d * d`.

### 5.1 Azumaya algebras satisfy `S_{2d}`

Prove `isPolynomialIdentity_standardPolynomial_of_isAzumaya`: an Azumaya algebra of constant
rank `d²` over `A` satisfies `S_{2d}`. (Proved here; no source was consulted.)

Route. If `d = 0`, the rank is `0` at every prime, so `R` is the zero module
(`Module.rankAtStalk_eq_zero_iff_subsingleton`, with `R` flat by `Module.Flat.of_projective` and
finite) and every polynomial is an identity. If `d > 0`, SchemeAndStackFoundations §2.22
`IsAzumaya.exists_etale_matrix_splitting` gives a commutative, faithfully flat (and étale)
`A`-algebra `B` and a `B`-algebra isomorphism `e : B ⊗_A R ≃ M_d(B)`. The map `r ↦ 1 ⊗ r`
(`Algebra.TensorProduct.includeRight`, equal to `TensorProduct.mk A B R 1`) is an injective
`A`-algebra map (`Module.FaithfullyFlat.tensorProduct_mk_injective`). For `x : Fin (2d) → R`, the
map `e ∘ includeRight` is an injective ring map into `M_d(B)` and carries the signed sum
`S_{2d}(x)` to `S_{2d}` evaluated in `M_d(B)` (1.1), which is `0` by 3.2 over `B`.

**Checks.**
- For `d ≥ 1`, `M_d(A)` is Azumaya (`IsAzumaya.matrix`, which needs a nonempty index type), of
  constant rank `d²` when `A` is nontrivial, and 5.1 for it is 3.2.
- The quaternions over `ℝ` are central simple of dimension `4`, hence Azumaya of constant rank
  `2²` (Tau Ceti `IsSimpleRing.isAzumaya`, for finite-dimensional central simple algebras over a
  field), and satisfy `S_4`; on the basis, `S_4(1, i, j, k) = 0`.
- `d = 0` with `A ≠ 0` cannot occur: `R` is then `0`, and a faithful module over a nonzero ring is
  nonzero. With `A = 0` every `d` satisfies the rank condition and both theorems of this layer
  hold trivially.

*Needs:* 1.1, 3.2; SchemeAndStackFoundations §2.22 `IsAzumaya.exists_etale_matrix_splitting`;
Mathlib `IsAzumaya`, `Module.rankAtStalk`, `Module.rankAtStalk_eq_zero_iff_subsingleton`,
`Module.Flat.of_projective`, `Algebra.TensorProduct.includeRight`, `TensorProduct.mk_apply`,
`Module.FaithfullyFlat.tensorProduct_mk_injective`.

### 5.2 No identity of degree less than `2d`

Prove `not_isPolynomialIdentity_of_isAzumaya_of_totalDegree_lt`: an Azumaya algebra of constant
rank `d²` over `A` satisfies no nonzero `f : FreeAlgebra A X` with `totalDegree f < 2d`. (Proved
here; no source was consulted.)

Route. The case `d = 0` is vacuous. For `d > 0` take `B` and `e` as in 5.1. By 4.2, a nonzero
multilinear polynomial with coefficients `α` in `A`, of degree `ℓ = totalDegree f < 2d`, is an
identity of `R`. Its image `α' = algebraMap A B ∘ α` is nonzero, since `A → B` is injective
(`FaithfulSMul.algebraMap_injective`, with the instance `Module.FaithfullyFlat.faithfulSMul`). The
multilinear polynomial with coefficients `α'` is an identity of `B ⊗_A R`: its evaluation is
additive in each argument, and on pure tensors `bᵢ ⊗ rᵢ` it equals
`(b₀ ⋯ b_(ℓ−1)) ⊗ (∑_σ α(σ) r_(σ 0) ⋯ r_(σ (ℓ−1)))`, since `B` is commutative, which is `0`
(`TensorProduct.inductionOn`). Through `e` it is an identity of `M_d(B)`, and 4.1 over `B` gives
`α' = 0`, a contradiction.

**Checks.**
- The quaternions over `ℝ` (`d = 2`) do not satisfy `S_3`: `S_3(i, j, k) = −6` (1.3).
- `M_d(A)` with `d ≥ 1` and `A` nontrivial: 5.2 is 4.3 for `R = A` and `n = d`.

*Needs:* 4.1, 4.2; SchemeAndStackFoundations §2.22 `IsAzumaya.exists_etale_matrix_splitting`;
Mathlib `FaithfulSMul.algebraMap_injective`, `Module.FaithfullyFlat.faithfulSMul`,
`TensorProduct.inductionOn`, `Algebra.TensorProduct.leftAlgebra`.

### Examples

- A central simple algebra of degree `d` over a field `K` (dimension `d²`) satisfies `S_{2d}` and
  nothing of lower degree with coefficients in `K`; the quaternions are the case `d = 2`.

### Dependencies

5.1 uses 1.1, 3.2 and SchemeAndStackFoundations §2.22. 5.2 uses 4.1, 4.2 and
SchemeAndStackFoundations §2.22.

## Scope and ownership

This roadmap owns the standard polynomials, polynomial identities with coefficients in the base
ring, the degree of a noncommutative polynomial, multilinear polynomials, the upward closure and
spanning bound of 1.2–1.3, the tracelessness of even standard polynomials (1.4), the trace
criterion of 2.1, the Grassmann matrix and its power formula, Rosset's theorem, the
Amitsur–Levitzki theorem in its generic and general forms, the staircase lemma,
multilinearization, minimality, and the Azumaya forms of 5.1–5.2, all stated above.

Consumed rather than restated:

- RepresentationTheory/SchurWeyl §7.8 states the integral Newton recurrence for matrices,
  `matrixTraceNewton`; 2.1 rests on it and does not restate it.
- IntegralHeckeAndGaloisDeterminants §0.4 defines `genericMatrices`, copied verbatim here as the
  carrier of 3.1. That roadmap also owns pseudocharacters, the trace of a determinant as a
  pseudocharacter (the fundamental trace identity of matrices), Cayley–Hamilton algebras, the
  integral Newton identities for determinants, Amitsur's formula for determinants and Vaccarino's
  theorem; none of these is stated or used here. Tracelessness of `S_{2k}` (1.4) holds for every
  trace satisfying `trace(ab) = trace(ba)` and is not one of its trace identities.
- SchemeAndStackFoundations §2.22 states the étale splitting of Azumaya algebras; 5.1–5.2 rest on
  it.
- Mathlib has Cayley–Hamilton, free and exterior algebras with their bases, and Azumaya algebras;
  Tau Ceti has the grade-involution commutation rule of exterior algebras.
- Tau Ceti's `LinearMap.isNilpotent_iff_forall_trace_pow_eq_zero` is a different statement from
  2.1: it is for an endomorphism of a finite-dimensional vector space over a field of
  characteristic zero, uses the traces of all positive powers and gives both directions. 2.1 is
  for matrices over a commutative ring in which `n!` is a unit, uses only the traces of the first
  `n` powers, and concludes that the characteristic polynomial is `Xⁿ`; it states no converse.
  Rosset's argument needs 2.1 because the ring of 2.3, a subring of an exterior algebra, is in
  general not a field.
- Tau Ceti's central simple algebras appear only in a Check of 5.1.

Not treated here: trace identities of matrices and the Procesi–Razmyslov theorem; Kaplansky's
theorem on primitive algebras with a polynomial identity, Posner's theorem and central
polynomials; the uniqueness of `S_{2n}` among multilinear identities of degree `2n` (a Check of
4.1 for `n = 2` only); the identities of the Grassmann algebra itself; Swan's graph-theoretic
proof and Kostant's cohomological proof.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Algebra/FreeAlgebra.lean`: `FreeAlgebra`, `FreeAlgebra.ι`, `FreeAlgebra.lift`,
  `FreeAlgebra.lift_ι_apply`, `FreeAlgebra.hom_ext` (`[CommSemiring R] [Semiring A] [Algebra R A]`).
- `Mathlib/LinearAlgebra/FreeAlgebra.lean`: `FreeAlgebra.basisFreeMonoid`
  (`Basis (FreeMonoid X) R (FreeAlgebra R X)`).
- Permutations: `Equiv.Perm.sign`, `Equiv.Perm.sign_mul`, `Equiv.Perm.sign_swap`, `finRotate`,
  `sign_finRotate` (`sign (finRotate n) = (−1)^(n−1)`), `Fin.cycleRange_symm_zero`,
  `Fin.cycleRange_symm_succ`, `Fin.sign_cycleRange`; `Finset.sum_involution`,
  `Fintype.exists_ne_map_eq_of_card_lt`, `Finset.orderEmbOfFin`, `Finset.orderEmbOfFin_unique`.
- Matrices: `Matrix.trace_mul_comm`, `Matrix.scalar`, `Matrix.single`,
  `Matrix.single_mul_single_same`, `Matrix.single_mul_single_of_ne`, `Matrix.single_apply`,
  `Matrix.map_pow`, `AddMonoidHom.map_trace`, `RingHom.mapMatrix`, `Matrix.charpolyRev`,
  `Matrix.reverse_charpoly`, `Matrix.charpoly_monic`, `Matrix.charpoly_natDegree_eq_dim`
  (`[Nontrivial R]`), `Matrix.aeval_self_charpoly`; `Polynomial.coeff_reverse`.
- Exterior algebras (`Mathlib/LinearAlgebra/ExteriorAlgebra/`): `ExteriorAlgebra.ι`,
  `ExteriorAlgebra.ιMulti` (an alternating map), `ExteriorAlgebra.ιMulti_apply`,
  `ExteriorAlgebra.ιMulti_range`, `Module.Basis.ExteriorAlgebra` (`[LinearOrder I]`),
  `ExteriorAlgebra.basis_apply`; `AlternatingMap.map_perm`,
  `AlternatingMap.map_eq_zero_of_not_injective`; `Module.Basis.repr_self`.
- `Subalgebra.center` (a commutative ring), `Subalgebra.mem_center_iff`, `Subalgebra.val`,
  `Algebra.commutes`.
- Polynomials: `MvPolynomial.map`, `MvPolynomial.map_injective`, `MvPolynomial.eval₂Hom`,
  `Int.cast_injective`, `RingHom.toIntAlgHom`; `Nat.dvd_factorial`, `isUnit_of_dvd_unit`;
  `Submodule.mem_span_range_iff_exists_fun`.
- Azumaya algebras and flatness: `IsAzumaya` (`Mathlib/Algebra/Azumaya/Defs.lean`),
  `IsAzumaya.matrix` (`[Nonempty n]`), `Module.rankAtStalk`,
  `Module.rankAtStalk_eq_zero_iff_subsingleton` (`[Module.Flat] [Module.Finite]`),
  `Module.Flat.of_projective`, `Module.FaithfullyFlat.tensorProduct_mk_injective`,
  `Module.FaithfullyFlat.faithfulSMul`, `FaithfulSMul.algebraMap_injective`,
  `Algebra.TensorProduct.includeRight`, `Algebra.TensorProduct.leftAlgebra`,
  `TensorProduct.mk_apply`,
  `TensorProduct.inductionOn`.

### From Tau Ceti

- `TauCeti/LinearAlgebra/FreeAlgebra.lean`: `TauCeti.basisFreeMonoid_apply` (a word basis vector
  is the ordered product of its letters).
- `TauCeti/LinearAlgebra/ExteriorAlgebra/Contraction.lean`: `ExteriorAlgebra.ι_mul_eq_involute_mul`
  (`ι m * x = involute x * ι m`), `TauCeti.ExteriorAlgebra.involute_of_mem_exteriorPower`
  (the grade involution is `(−1)ⁿ` on `⋀ⁿ`); used in step 1 of 2.3.
- `TauCeti/Algebra/CentralSimple/Opposite.lean`: `IsSimpleRing.isAzumaya` (a finite-dimensional
  central simple algebra over a field is Azumaya), in a Check of 5.1.
- `TauCeti/LinearAlgebra/Trace/Nilpotent.lean`: `LinearMap.isNilpotent_iff_forall_trace_pow_eq_zero`
  (`[Field K] [FiniteDimensional K M] [CharZero K]`), named in the scope section, not used.

### From TauCetiRoadmap.RepresentationTheory

- SchurWeyl §7.8, matrix trace specialisation of Newton's identities:
  `TauCetiRoadmap.RepresentationTheory.SchurWeyl.matrixTraceNewton` for `[CommRing R]`,
  `A : Matrix (Fin d) (Fin d) R`, `r > 0`:
  `(r : R) * A.charpolyRev.coeff r = −∑_(j<r) A.charpolyRev.coeff (r − (j+1)) * trace (A^(j+1))`.
  Used in 2.1, every commutative ring, `d = 0` included.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

- §0.4, Vaccarino universal determinant theorem: the definition `genericMatrices`
  (`FreeAlgebra ℤ X →ₐ[ℤ] Matrix (Fin d) (Fin d) (MvPolynomial (X × Fin d × Fin d) ℤ)`, the
  letter `a` to the matrix of variables `X (a, i, j)`), copied verbatim into `Suggested.lean`; no
  theorem of that roadmap is used.

### From TauCetiRoadmap.SchemeAndStackFoundations

- §2.22, Azumaya algebras: `IsAzumaya.exists_etale_matrix_splitting` for `A R : Type u`,
  `[CommRing A] [Ring R] [Algebra A R] [IsAzumaya A R]`, `0 < d` and
  `Module.rankAtStalk (R := A) R = fun _ => d * d`: there is a commutative `A`-algebra `B : Type u`
  with `Algebra.Etale A B`, `Module.FaithfullyFlat A B` and a `B`-algebra isomorphism
  `TensorProduct A B R ≃ₐ[B] Matrix (Fin d) (Fin d) B`. Used in 5.1 and 5.2.

## References

- R. Bezrukavnikov, *18.706 Noncommutative Algebra*, lecture notes, MIT OpenCourseWare, Spring
  2023 (`ocw.mit.edu/courses/18-706-noncommutative-algebra-spring-2023`): Lecture 22, Definition
  22.5 (p. 63), Example 22.8, Theorem 22.9, Lemma 22.10, Lemma 22.11 (p. 64), §22.6 (p. 65);
  Lecture 23, §23.1 with Corollary 23.2 (p. 66). Printed page numbers.
- C. Procesi, *On the theorem of Amitsur–Levitzki*, arXiv:1308.2421v1 (2013): §1 (p. 1),
  Proposition 2.1 (p. 2), proof of the theorem (pp. 2–3).
- S. Rosset, *A new proof of the Amitsur–Levitski identity*, Israel J. Math. 23 (1976), no. 2,
  187–188; attributed, not consulted.
- A. S. Amitsur and J. Levitzki, *Minimal identities for algebras*, Proc. Amer. Math. Soc. 1
  (1950), no. 4, 449–463; attributed, not consulted.
