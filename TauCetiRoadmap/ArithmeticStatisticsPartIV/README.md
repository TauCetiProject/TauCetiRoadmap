# Roadmap: arithmetic statistics, Part IV: finite groups, matrix laws and moment tools

**Summary.** Construct finite-group and matrix probability laws, surjection moments `E#Sur(X,A)`, rank statistics and discrete moment separators. Prove uniqueness and convergence only with the stated growth, tightness and uniform-integrability assumptions; no arithmetic law follows from a model identity alone.

## Scope and ownership

This part owns the statistical adapters for number-field classes, partition-indexed finite abelian groups, Cohen–Lenstra measures, finite-field kernel laws, prime-power ranks, the Fouvry–Klüners directed phase, and Wood's discrete moment method. Layer 3 develops these finite-group laws before their arithmetic applications. Its input from an earlier part is ArithmeticStatisticsPartI §0.1, arithmetic family; none of the counts or orbit dictionaries of Parts II–III is needed for the abstract probability results.

### Prerequisites and boundaries

- Mathlib already proves Hermite finiteness (`NumberField.finite_of_discr_bdd`) and the finite abelian-group structure theorem (`AddCommGroup.equiv_directSum_zmod_of_finite`). The new objects here are the isomorphism-class counting function and the partition-indexed probability carrier, with their statistical APIs. The completed EffectiveBounds Layer 2 supplies quantitative Hermite bounds; this part requests no replacement bound.
- `TauCetiRoadmap.PolynomialGaloisGroups` Layers 0 and 2 own the permutation action on roots and its conjugacy invariance; Layer 6 supplies transitive-group labels for degrees `1≤n≤5`. The field-counting predicate specializes that action to embeddings of an extension, using conjugacy to a specified subgroup in every degree.
- Wide class groups and number-field discriminants are Mathlib's `ClassGroup (𝓞 K)` and `NumberField.discr`. Narrow class groups and their finiteness are `NumberField.NarrowClassGroup` and `NumberField.NarrowClassGroup.instFinite` in Tau Ceti. The existing elementary-two quotient and its torsion-cardinality comparison are used as the `k=1` interface; higher power-image ranks are the new statistic.
- Scalar finite-measure moment determinacy under an exponential-moment hypothesis is already `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` in `TauCeti.Probability.Moments.Determinacy`. The group-valued surjection moments and discrete rank-grid moments below have different carriers and growth hypotheses.
- Tau Ceti's symmetric-matrix rank measurability in `TauCeti.MeasureTheory.Measure.SymmetricMatrix.Rank` concerns real self-adjoint matrices. The laws here count matrices over finite fields. The FK good-plane condition uses a directed nonsymmetric pairing, so the generic finite quadratic-module isotropy and orthogonal-quotient constructions are not duplicated.

The arithmetic conclusions of later parts consume these models only after proving their own family-specific moments.

## Conventions

Finite-field cardinalities `q` are prime powers greater than one; `p` and `ℓ` are natural primes. All group representatives are finite abelian groups unless a finitely generated or p-adic source is explicitly named. Partitions have positive parts, with the empty partition representing the trivial group. Conjugate-partition coordinates are indexed from 1 and eventually zero; FK coordinates and the Lean separator coordinates are indexed from 0. Empty products are one and zero-dimensional spaces are retained.

Cardinalities are natural numbers only after finiteness. Probability weights and displayed divisions are in `ℚ, ℝ` or `ℝ≥0∞` as specified, never natural-number division. A negative exponent denotes an integer exponent in a field. Every factor `q^i−1` in a denominator has `i≥1`, so it is nonzero; `|A|` and `|Aut A|` are positive even for the trivial group. Infinite products require convergence and nonvanishing separately. The p-adic absolute value has `|p|_p=p⁻¹`, and additive matrix Haar measure has total mass one.

Number fields are counted up to `ℚ`-isomorphism, with signed discriminant and strict open cutoffs. The Part I family interface also has inclusive cutoffs; its `countLT` gives the strict count here. Wide and narrow class groups are distinguished explicitly. At `p=2` a symmetric matrix may have nonzero diagonal; it is not required to be alternating. Linkage and good planes use the displayed directed FK pairing, including its diagonal values.

The measures below are abstract probability models. Their interpretation as arithmetic class-group distributions is conjectural unless a later part proves it for its specified family. Distribution convergence alone does not imply convergence of unbounded surjection moments.

## Exact supplier contracts

### From Mathlib

Use `NumberField.finite_of_discr_bdd` in `Mathlib.NumberTheory.NumberField.Discriminant.Basic` for intermediate fields of a fixed extension with bounded absolute discriminant, together with `NumberField.discr`, `NumberField.sign_discr`, `ClassGroup` and class-group finiteness. The quotient by `ℚ`-algebra isomorphism and the strict signed interval are the adapters defined here.

Use `Nat.Partition`, `ZMod.card` and `AddCommGroup.equiv_directSum_zmod_of_finite` in `Mathlib.GroupTheory.FiniteAbelian.Basic` for finite group representatives. The latter supplies a decomposition into prime-power cyclic groups; sorting their nonzero exponents and identifying the unique conjugate partition are the statistical adapter targets below. Use `card_linearIndependent` and `Matrix.card_GL_field` in `Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Card` for finite-field cardinalities, with their finite-field and dimension-range hypotheses. Matrix kernels use `Matrix.mulVecLin`, `LinearMap.ker`, `Module.finrank` and rank–nullity; the p-adic finite-cokernel argument uses `Submodule.smithNormalForm` in `Mathlib.LinearAlgebra.FreeModule.PID` over the DVR `ℤ_p`; `PadicInt.compactSpace` is in `Mathlib.NumberTheory.Padics.ProperSpace`.

Use `PMF`, `PMF.tsum_coe`, `ENNReal.tsum_add` and nonnegative infinite sums. Normalized additive Haar measure is `MeasureTheory.Measure.addHaarMeasure` in `Mathlib.MeasureTheory.Measure.Haar.Basic`, normalized on the whole compact group. Use filters, locally uniform analytic convergence and infinite products. Rearrangements of arbitrary nonnegative moments take place in `ℝ≥0∞`; real or complex rearrangements require the stated absolute convergence. The geometric-series bound supplies convergence of `∑ p^(−j)`. It does not by itself prove that a product with a zero factor is nonzero.

### From Tau Ceti

Use `TauCeti.ClassGroup.ElementaryTwoQuotient` and `TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_card_twoTorsion` in `TauCeti.NumberTheory.ClassGroup.ElementaryTwoQuotient`: for a finite class group, the square quotient and the two-torsion have equal cardinality. This gives the class-group specialization of the `p=2,k=1` rank comparison. Use `NumberField.NarrowClassGroup` from `TauCeti.NumberTheory.NumberField.NarrowClassGroup.Basic` and its `instFinite` from `TauCeti.NumberTheory.NumberField.NarrowClassGroup.Finite` when the input is `Cl⁺(K)`. No `narrow/wide` identification is assumed.

### From roadmaps on main

PolynomialGaloisGroups Layers 0 and 2 supply the root action and its conjugacy invariance used in §3.1; Layer 6 supplies the label comparison only for `1≤n≤5`. Completed EffectiveBounds Layer 2 supplies quantitative Hermite–Minkowski bounds; the finiteness used here is Mathlib's `NumberField.finite_of_discr_bdd`.

### From ArithmeticStatisticsPartI §0.1

Consume [ArithmeticStatisticsPartI §0.1, arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family): an isomorphism-class carrier with a Northcott height, weights and both `count` (inclusive) and `countLT` (strict). For number fields take `H(K)=|Disc(K)|`, the unweighted count or the displayed reciprocal-automorphism weight, and use Hermite finiteness. No later arithmetic-statistics part supplies a definition or theorem here.

### Analytic boundary

AnalyticNumberTheoryPartI Layers 0–3 and AnalyticNumberTheoryPartII Layers 4–6 are not inputs to this part: their prime estimates and cubic zeta functions enter arithmetic counting, rather than the finite-group laws. The convergent Euler products in this part are justified directly by the Mathlib geometric-series and infinite-product interfaces above; no unspecialized analytic supplier output is presumed. Later arithmetic applications can use the two analytic parts with their own exact hypotheses.

## How to read the build

The mathematical specification is this README; `Suggested.lean` states headline theorems on the pinned carriers. Its short definitions give partition representatives, Cohen–Lenstra weights, surjection moments, matrix laws and exponent-bounded group classes; the remaining definitions and basic properties below specify the library to build. The sections below state every target with its hypotheses, source locator, API and Checks. Definitions requiring new arithmetic or geometric carriers are README targets. Earlier-part supplier links point to their precise statements. The source counts retain their strict or inclusive cutoffs and their own denominators.

The p-adic signatures use the native quotient module `padicCokernel` and normalized `padicMatrixHaar` directly: `surjectionMoment_cokernelLaw` states the exact Haar moment, `tendsto_cokernelLaw` the rectangular Friedman–Washington limit, and `tendsto_translation_cokernelLaw` its square `1 − F` form. Their target is any finite additive abelian group `A` with `IsPGroup p (Multiplicative A)`, and their measurable structure on `ℤ_p` is Borel. The partition carrier `FinAbPGroupClass` and its native cyclic-product representatives support the Cohen–Lenstra mass, moment and all-prime convergence statements. Wood's bounded moment theorem uses `Distributions.BoundedAbGroupClass`, a subtype of Mathlib's categorical skeleton of integer modules, with the native exterior square in its growth hypothesis.

## Layer 3: Finite groups, matrix laws and moment tools

The finite laws are independent of their arithmetic interpretations. For the all-prime theorem in §3.5, first establish §3.11's bounded moment limit; the odd-prime contraction argument has its own inputs.

### 3.1 Field counts and class-group statistics

<a id="number-field-counting-function"></a>

**Number field counting function.** Fix an algebraic closure `ℚ̄` of `ℚ` (Mathlib's `AlgebraicClosure ℚ`). For an integer `n ≥ 1`, a predicate `P` on number fields that is invariant under `ℚ`-algebra isomorphism, and real numbers `ξ < η`, let `S_n(P; ξ, η)` be the set of intermediate fields `K` of `ℚ̄/ℚ` with `[K : ℚ] = n, ξ < Disc(K) < η` and `P(K)`, where `Disc(K) = NumberField.discr K ∈ ℤ` is the signed absolute discriminant (its sign is `(−1)^{r₂(K)}`). `S_n(P; ξ, η)` is finite by Hermite's theorem. Define `N_n(P; ξ, η)` as the number of classes of `S_n(P; ξ, η)` under the relation `K` ~ `K'` iff `K ≃ₐ[ℚ] K'`; since every number field of degree `n` embeds into `ℚ̄`, `N_n(P; ξ, η)` is the number of `ℚ`-isomorphism classes of degree-n number fields `K` with `ξ < Disc(K) < η` and `P(K)`. Abbreviations: `N_n^+(P; X) := N_n(P; 0, X), N_n^-(P; X) := N_n(P; −X, 0)`, and `N_n(P; X) := N_n^+(P; X) + N_n^-(P; X)` (all fields with `0 < |Disc(K)| < X`). The weighted count `N_n^{Aut}(P; ξ, η) := Σ_{classes [K]} 1/#Aut(K/ℚ)`. The three standard restrictions are pinned as follows. Signature: `P(K)` is nrComplexPlaces `K = r₂`. Galois group: for a transitive subgroup `Γ ≤ S_n`, `P(K)` says that the image of `Gal(ℚ̄/ℚ)`, acting by composition on the `n` embeddings `K → ℚ̄` (MulAction.toPermHom), is conjugate to `Γ` under some bijection between the embeddings and `{1, …, n}`; this is the permutation Galois group of PolynomialGaloisGroups, Layer 0 (the degree-n action of `(minpoly ℚ α).Gal` for `K = ℚ(α)`) for arbitrary `n≥1`. For `1≤n≤5` and `Γ=referenceSubgroup n j`, identify this restriction with Layer 6's `HasGaloisLabel (minpoly ℚ α) j` for a primitive element `α` of `K`. Local specifications: for a collection `Σ = (Σ_v)` of sets of isomorphism classes of étale algebras of degree `n` over `ℚ_v` (with `v` a prime or `∞`), `P(K)` says `K ⊗ ℚ_v ∈ Σ_v` for every `v`.

`n ≥ 1`; for the Galois-group restriction `Γ` is a transitive subgroup of `S_n`, identified up to conjugacy. `P` must be invariant under `ℚ`-algebra isomorphism; otherwise the count depends on the chosen subfield in the class. The discriminant is Mathlib's signed `NumberField.discr`; the interval `(ξ, η)` is open at both ends, matching BST's `N₃(ξ, η)`. Fields are counted up to isomorphism, not as subfields of `ℚ̄` (a non-Galois cubic field has three conjugate subfields and is counted once).

Required definitions and properties:

- `N_n(P; ξ, η) ∈ ℕ`, the number of `ℚ`-isomorphism classes of degree-n number fields `K` with `ξ < Disc(K) < η` and `P(K)`, for an isomorphism-invariant predicate `P`.
- The set `S_n(P; ξ, η)` of intermediate fields of `ℚ̄/ℚ` of degree `n` with `ξ < discr < η` and `P` is finite (from `NumberField.finite_of_discr_bdd`).
- `(N_n(P; ξ, η) : ℚ) = Σ_{K ∈ S_n(P; ξ, η)} (#Aut(K/ℚ) : ℚ)/(n : ℚ)` (each isomorphism class has `n/#Aut(K/ℚ)` conjugate subfields).
- `N_n(P; ξ, η) ≤ N_n(P'; ξ', η')` whenever `P ⇒ P'` and `(ξ, η) ⊆ (ξ', η')`.
- For disjoint isomorphism-invariant predicates `P, P': N_n(P ∨ P'; ξ, η) = N_n(P; ξ, η) + N_n(P'; ξ, η)`; in particular `N_n(P; ξ, η) = Σ_{r₂=0}^{⌊n/2⌋} N_n(P ∧ (r₂(K) = r₂); ξ, η)`.
- For `X≥0, N_n(P; −X, 0) = N_n(P ∧ (r₂(K) odd); −X, X)` `= N_n(P ∧ (r₂(K) odd); X)`, where the last notation is the absolute-discriminant count. A positive signed interval (0,X) would give zero for the `odd-r₂` predicate.
- For `n = 2` every quadratic field is Galois with exactly one subfield of `ℚ̄` in its class, so `N₂(P; ξ, η) = #S₂(P; ξ, η)`.
- If `P` and `P'` agree on all number fields of degree `n` then `N_n(P; ξ, η) = N_n(P'; ξ, η)`.

The set `S_n(P; ξ, η)` is contained in the set of intermediate fields `K` of `ℚ̄/ℚ` with `|discr K| ≤ ⌈max(|ξ|, |η|)⌉`, which is finite by `NumberField.finite_of_discr_bdd`; take `Nat.card` of the quotient by the isomorphism relation. Invariance of `P` and of finrank and discr under `ℚ`-isomorphism makes the quotient well defined; the embedding of every number field of degree `n` into `ℚ̄` (its minimal polynomial splits in `ℚ̄`) shows that every isomorphism class is represented. The subfield formula: the members of `S_n(P; ξ, η)` isomorphic to a fixed `K` are the images of the `n` embeddings `K → ℚ̄`, two embeddings having the same image iff they differ by an automorphism of `K`, so the class of `K` has `n/#Aut(K/ℚ)` members and the sum of the rational weights `#Aut(K/ℚ)/n` is `N_n(P; ξ, η)`. In a non-Galois cubic class each of its three subfields contributes `1/3`; natural-number division would incorrectly give zero. The family of degree-n number fields up to isomorphism, ordered by `|Disc|`, with weight 1 (or `1/#Aut(K/ℚ)` for the weighted count), is an instance of the arithmetic family of [ArithmeticStatisticsPartI §0.1, arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family); its strict counting function `countLT` is `N_n(P; X)`, and its bounded-height finiteness is Hermite's theorem.

*Needs:* [ArithmeticStatisticsPartI §0.1, arithmetic family](../ArithmeticStatisticsPartI/README.md#arithmetic-family), `NumberField.finite_of_discr_bdd` (Mathlib), `NumberField.discr` (Mathlib), `NumberField.sign_discr` (Mathlib), `NumberField.InfinitePlace.nrComplexPlaces` (Mathlib), `AlgebraicClosure` (Mathlib), `IntermediateField` (Mathlib), `MulAction.toPermHom` (Mathlib).

([[5]](#ref-5), Theorem 1, p. 1; [[21]](#ref-21), Section 1.1, Question 1.6 and the paragraph after it, p. 2; [[21]](#ref-21), Section 1, Theorem 1.1 (Hermite), p. 1; [[20]](#ref-20), Theorem 1, p. 2.)

**Checks.**

- For every `X > 1, N₁(⊤; 0, X) = 1`, and `N₁(⊤; ξ, η) = 0` whenever `1 ∉ (ξ, η)`.
- The set `S₃(⊤; −24, 0)` of subfields of `ℚ̄` has exactly 3 elements, so counting subfields instead of isomorphism classes gives `3 ≠ 1 = N₃(⊤; −24, 0)`.
- `N₂(⊤; −5, 0) = 2` (the fields `ℚ(√−3)` and `ℚ(i)`), `N₃(⊤; −24, 0) = 1` (the field of `x³ − x − 1`, discriminant `−23`) and `N₃(⊤; 0, 50) = 1` (the cyclic field `ℚ(ζ₇)⁺`, discriminant 49).
- Sign check: `N_n(P; −X, 0)` counts exactly the fields with `r₂` odd `(NumberField.sign_discr)`.
- In degree six the conjugacy restriction for `Γ=S₆` is defined without a Layer 6 label; the label comparison applies only in degrees one through five.

<a id="torsion-count-of-class-groups"></a>

**Torsion count of class groups.** For a number field `K` and an integer `m ≥ 1, h_m(K) := #{c ∈ Cl(K) : c^m = 1} = Nat.card {c : ClassGroup (𝓞 K) // c ^ m = 1}`, the order of the m-torsion subgroup `Cl(K)[m]` of the ideal class group. For a quadratic field `K₂` of discriminant `D` this is BST's `h*_3(K₂) = #Cl₃(D)` when `m = 3`. For a prime `p, h_p(K) = p^{rk_p Cl(K)}` where `rk_p A = dim_{F_p} A/pA`.

For `m≥1`, the class group is Mathlib's `ClassGroup (𝓞 K)` of the ring of integers (the wide class group); narrow class groups, where used, are named explicitly. `Cl(K)` is finite (`NumberField.classNumber`), so `h_m(K)` is a positive integer dividing the class number.

Required definitions and properties:

- `h_m(K) = Nat.card {c : ClassGroup (𝓞 K) // c ^ m = 1}`.
- `1 ≤ h_m(K)` (the trivial class is m-torsion).
- `h_m(K)` divides `NumberField.classNumber K`.
- For coprime `m`, m': `h_{mm'}(K) = h_m(K) h_{m'}(K)`.
- For `p` prime, `h_p(K) = #(Cl(K)/Cl(K)^p) = p^{rk_p Cl(K)}` with `rk_p A = dim_{F_p} A/pA`.
- `h₁(K) = 1`.
- `h₂(K) = #(Cl(K)/Cl(K)^2)` on Tau Ceti’s elementary-two-quotient carrier.
- A `ℚ`-algebra isomorphism `K ≃ K'` gives `h_m(K) = h_m(K')`.

Define `h_m(K)` as `Nat.card` of the subtype `{c : ClassGroup (𝓞 K) // c ^ m = 1}`; it is the kernel of the m-th power endomorphism of the finite abelian group `Cl(K)`. For a finite abelian group `A, #A[m] = #(A/mA) = #Hom(A, ℤ/mℤ)` (duality of finite abelian groups), and for `m = p` prime `#A[p] = p^{rk_p A}`. For coprime `m`, m': `A[mm'] ≅ A[m] × A[m']`, so `h_{mm'} = h_m h_{m'}`; and `h_m(K)` divides `h(K) = NumberField.classNumber K` by Lagrange.

*Needs:* `ClassGroup` (Mathlib), `NumberField.RingOfIntegers` (Mathlib), `NumberField.classNumber` (Mathlib), `TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_card_twoTorsion` (Tau Ceti).

([[5]](#ref-5), Theorem 2, p. 1; [[5]](#ref-5), Section 8.5, p. 26; [[22]](#ref-22), Section 1, p. 1.)

**Checks.**

- `h₁(K) = 1` for every number field `K`.
- `h₂(K)` equals the order of Tau Ceti's elementary 2-quotient `Cl(K)/Cl(K)^2`.
- For `K = ℚ(√−47)`, whose class number is `5, h₃(K) = 1 ≠ 5: h₃` is not the class number.
- For `K = ℚ(√−23), Cl(K) ≅ ℤ/3Z`, so `h₃(K) = 3` and `h₂(K) = 1`.
- For `K = ℚ(√−5), Cl(K) ≅ ℤ/2Z`, so `h₂(K) = 2 = 2^{t−1}` with `t = 2` ramified primes (genus theory, Tau Ceti).
- The number of index-3 subgroups of `Cl(K)` is `(h₃(K) − 1)/2`, the quantity of BST (59).

### 3.2 Gaussian coefficients

<a id="gaussian-binomial-coefficient"></a>

**Gaussian binomial coefficient.** Define the Gaussian polynomial by recursion in `ℕ[t]`, and define `[n k]_t` by evaluation for `t` in any commutative semiring and `n,k≥0`. For `t` in a field and `0≤k≤n`, the Gaussian binomial coefficient is `[n k]_t := ∏_{i=1}^{k} (1 − t^{n−k+i})/(1 − t^{i})` when `t` is not a root of unity of order `≤ n`, with polynomial values determined by the recursion `[n 0]_t = [n n]_t = 1, [n+1 k+1]_t = [n k]_t + t^{k+1}[n k+1]_t` for `n,k≥0`, and `[n k]_t := 0` for `k > n`. For a finite field `𝔽_q`, evaluate at the integer `q` in `ℕ` or `ℚ`, rather than reducing `q` in `𝔽_q: [n k]_q` equals the number of k-dimensional subspaces of `𝔽_q^n`.

The polynomial definition permits all `n,k≥0`. For the subspace count `q=#𝔽_q` is a prime power; the count is zero for `k>n`.

Required definitions and properties:

- The natural-coefficient Gaussian polynomial with the displayed successor recursion, zero column and empty-size values; its evaluation is the Gaussian coefficient.
- `[n k]_t` as an element of a commutative semiring, via polynomial evaluation of the recursion (0 for `k > n`).
- `[n 0]_t = 1`.
- `[n n]_t = 1`.
- `[n+1 k+1]_t = [n k]_t + t^{k+1}[n k+1]_t`.
- For `k≤n`, when no `t^i (1 ≤ i ≤ n)` equals `1: [n k]_t = ∏_{i=1}^{k}(1 − t^{n−k+i})/(1 − t^i)`.
- `[n k]_t = 0` for `n < k`.
- `[n k]_t = [n n−k]_t` for `k ≤ n`.
- `[n k]_1 = Nat.choose n k`.
- For a finite field `K` with `q` elements, `#{W ≤ K^n : dim W = k} = [n k]_q`.

Define `[n k]_t` by the recursion in `ℕ[t]`, and evaluate at `t` using the natural-number coefficient map. Product formula: induct on `n`, treating the zero column separately; the recursion `[n+1 k+1]_t = [n k]_t + t^{k+1}[n k+1]_t` for `n,k≥0` is checked between the products by clearing the nonzero denominators in a field. Subspace count: the k-dimensional subspaces of `𝔽_q^n` are the orbits of `GL_k(𝔽_q)` acting freely on linearly independent k-tuples; divide `mathlib:card_linearIndependent (#independent k-tuples = ∏_{i<k}(q^n − q^i))` by `mathlib:Matrix.card_GL_field (#GL_k(𝔽_q) = ∏_{i<k}(q^k − q^i))` and compare with the product formula.

*Needs:* `card_linearIndependent` (Mathlib), `Matrix.card_GL_field` (Mathlib), `Polynomial.coeff` (Mathlib).

([[28]](#ref-28), Proof of Proposition 2.6(e), p. 7; [[25]](#ref-25), §2, Case 2.12, p. 9 (arXiv v2).)

**Checks.**

- gaussBinom 2 4 `2 = 35`.
- gaussBinom `t n 0 = 1` and gaussBinom `t 0 k = 0` for `k ≥ 1`.
- gaussBinom 1 5 `2 = 10 = Nat.choose` 5 2.
- gaussBinom 2 3 `1 = 7 ≠ 3 = Nat.choose` 3 1: the q-analogue is not the ordinary binomial.
- At `n=k=0`, the successor recursion gives `[1 1]_t=[0 0]_t+t[0 1]_t=1`; the zero column is `[1 0]_t=1`.
- Over `ℕ`, `[2 1]_2=3`, so the subspace cardinality uses the same semiring evaluation.
- For `k≤n, [n k]_t = [n n−k]_t`. For `k>n, [n k]_t=0` whereas the truncated natural index `n−k=0` gives `[n 0]_t=1`; the range hypothesis cannot be omitted.

<a id="cauchy-q-binomial-theorem"></a>

**Cauchy q binomial theorem.** For an element `t` of a commutative ring and `n ≥ 0`, in the polynomial ring in `z: ∏_{i=0}^{n−1} (1 + t^{i} z) = Σ_{k=0}^{n} t^{k(k−1)/2} [n k]_t z^{k}`.

`n ≥ 0; t` arbitrary

Induct on `n`: multiply the identity for `n` by `(1 + t^{n} z)` and compare coefficients of `z^{k+1}` for `0≤k≤n` using `[n+1 k+1]_t = [n k]_t + t^{k+1}[n k+1]_t` and its equivalent form `[n+1 k+1]_t = [n k+1]_t + t^{n−k}[n k]_t` ([gaussian binomial coefficient](#gaussian-binomial-coefficient), using the successor recursion and symmetry). Coefficient comparison is routine algebra in `ℤ[t][z]` (`Polynomial.coeff` (Mathlib)).

*Needs:* [gaussian binomial coefficient](#gaussian-binomial-coefficient), `Polynomial.coeff` (Mathlib).

([[28]](#ref-28), Proof of Proposition 2.6(e), p. 7.)

**Checks.**

- `n = 0`: the empty product and the constant term are both 1, including at `t=0`.
- `n = 1: 1 + z = 1 + z`.
- `n = 2: (1 + z)(1 + tz)` `= 1 + (1 + t)z` + `t z²`.

### 3.3 Finite abelian groups and Cohen–Lenstra mass

<a id="isomorphism-classes-of-finite-abelian-p-groups"></a>

**Isomorphism classes of finite abelian p groups.** The carrier `L` of isomorphism classes of finite abelian p-groups is the type of pairs `(n, λ)` with `n ∈ ℕ` and `λ` a partition of `n` (Mathlib `Nat.Partition n`). For a prime `p` the class `(n, λ)` is realised by the standard representative `A_λ = ⊕_i ℤ/p^{λ_i}` (parts in decreasing order), a group of order `p^n`. Attached data: the conjugate partition `λ'_i = #{j : λ_j ≥ i}` (so `λ'_1` is the p-rank and `p^{λ'_1} = |A_λ[p]|`), the multiplicity `m_i(λ) = #{j : λ_j = i}`, the automorphism count `|Aut A_λ|`, and the trivial class `(0, ∅)`. Every finite abelian p-group is isomorphic to `A_λ` for exactly one `λ`.

Required definitions and properties:

- `FinAbPGroupClass.toGroup`: The standard representative `⊕_i ℤ/p^{λ_i}` of a class, an additive commutative group.
- For `p` prime, `|toGroup p (n, λ)| = p^n`.
- Every finite abelian group `G` in which every element is killed by a power of `p` is isomorphic to toGroup `p A` for some class `A` (compatibility with Mathlib's structure theorem `AddCommGroup.equiv_directSum_zmod_of_finite`).
- If toGroup `p A ≅` toGroup `p B` then `A = B`.
- The conjugate partition `λ'_i = #{j : λ_j ≥ i}`.
- The multiplicity `m_i(λ)` of the part `i`.
- `|{x ∈ A_λ : p x = 0}| = p^{λ'_1}` (the p-rank).
- `|Aut(A_λ)|`, the number of additive automorphisms of the representative.
- `|Aut A_λ| > 0`.
- The trivial class `(0, ∅)`.
- The representative of the trivial class is the zero group.

Define the carrier as the dependent pair type `Σ n, Nat.Partition n`; sort the parts decreasingly and take the product of ZMod `(p^{λ_i})` as representative, with its AddCommGroup structure from the Pi instance. Order: `|A_λ| = ∏ p^{λ_i} = p^{Σλ_i} = p^n` (ZMod.card and `Fintype.card` of a Pi type). Existence of a class for a finite abelian p-group `G`: apply `AddCommGroup.equiv_directSum_zmod_of_finite` to get `G ≅ ⊕ ℤ/q_i^{e_i}`; since `G` is p-primary every `q_i = p` (or `e_i = 0`), so the exponents form a partition of `log_p|G|`. Uniqueness: the conjugate partition is recovered from the invariants `|p^{i-1}G/p^iG| = p^{λ'_i}`, which are isomorphism invariants, and a partition is determined by its conjugate. The p-torsion count `|A_λ[p]| = p^{λ'_1}`: each cyclic factor `ℤ/p^{λ_j}` with `λ_j ≥ 1` contributes a factor p.

*Needs:* `Nat.Partition` (Mathlib), `AddCommGroup.equiv_directSum_zmod_of_finite` (Mathlib), `ZMod.card` (Mathlib), `Multiset.sort` (Mathlib).

([[37]](#ref-37), Annals 183 (2016), §8.1, p. 771; [[39]](#ref-39), arXiv 1407.3066v1, §2, p. 3–4.)

**Checks.**

- `|Aut(ℤ/p)| = p − 1` for the class (1, (1)).
- The trivial class has exactly one automorphism.
- `Nat.card` of the representative of (2, (1,1)) is `p²`.
- The representatives of (2, (2)) and (2, (1,1)) are not isomorphic although they have the same order, so a carrier indexed by the order alone is wrong.

<a id="automorphism-count-of-finite-abelian-p-groups"></a>

**Automorphism count of finite abelian p groups.** For `p` prime and a partition `λ` with conjugate partition `λ'` and part multiplicities `m_i, |Aut(A_λ)| = p^{Σ_i (λ'_i)²} · ∏_i ∏_{s=1}^{m_i} (1 − p^{−s})`. Equivalently (Hillar–Rhea, Theorem 4.1), for `A = ⊕_{k=1}^{n} ℤ/p^{e_k}` with `1 ≤ e_1 ≤` … `≤ e_n` (and empty products for `n=0`), `d_k = max{l : e_l = e_k}, c_k = min{l : e_l = e_k}: |Aut A| = ∏_k (p^{d_k} − p^{k−1}) ∏_j (p^{e_j})^{n−d_j} ∏_i (p^{e_i−1})^{n−c_i+1}`.

Describe `End(A)` as the ring of `n×n` matrices `(a_{ij})` with `a_{ij} ∈ ℤ/p^{e_i}` and `p^{e_i−e_j} | a_{ij}` when `e_i > e_j` (Hillar–Rhea Theorem 3.3). An endomorphism is an automorphism iff its reduction modulo `p` is invertible on each block of equal exponents (Hillar–Rhea Theorem 3.6): count the block-triangular matrices over `F_p` with invertible diagonal blocks and multiply by the number of lifts of each entry. Collect the powers of `p` into `p^{Σ(λ'_i)²}` using `Σ_{i,j} min(λ_i, λ_j) = Σ_i (λ'_i)²` and the diagonal-block orders `|GL_{m_i}(F_p)| = p^{m_i²} ∏_{s=1}^{m_i}(1 − p^{−s})` (Mathlib `Matrix.card_GL_field`).

*Needs:* [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups), `Matrix.card_GL_field` (Mathlib).

([[40]](#ref-40), Amer. Math. Monthly 114 (2007); arXiv math/0605185v1, Theorem 4.1, PDF/printed p. 6 (matrix description and invertibility criterion pp. 3–5); [[39]](#ref-39), arXiv 1407.3066v1, Lemma 3 and p. 4.)

**Checks.**

- For `k≥1`, `|Aut(ℤ/p^k)| = p^k − p^{k−1}`; also `|Aut((ℤ/p)^m)| = |GL_m(F_p)|`.
- At `k=0`, `ℤ/p^0` is trivial and has one automorphism, including for `p=3`; the `n=0` empty products also give 1.
- `|Aut(ℤ/p² × ℤ/p)| = p³(p − 1)²`; for `p = 3: 108 = |Aut(ℤ/9 × ℤ/3)|`.

<a id="surjection-count"></a>

**Surjection count.** For additive abelian groups `X` and `A`, `Sur(X, A)` is the set of surjective group homomorphisms `X → A` and `|Sur(X, A)|` its cardinality (Nat.card; it is finite when `X` is finitely generated and A finite).

Required definitions and properties:

- `surjCard`: `|Sur(X, A)|` as a natural number.
- Isomorphisms `X ≅ X', A ≅ A'` give `|Sur(X, A)| = |Sur(X', A')|`.
- For every finite additive abelian group `A`, `|Sur(A,A)| = #(A ≃+ A)`.
- `|Sur(A_λ, A_λ)| = |Aut(A_λ)|`.
- `|Sur(X, A)| ≤ |Hom(X, A)|` for finite `X, A`.
- `|Sur(X, 0)| = 1`.
- If `|X| < |A|` (finite) then `|Sur(X, A)| = 0`.

Define `|Sur(X, A)|` as `Nat.card` of the subtype `{f : X →+ A // f surjective}`. Invariance: composing with isomorphisms `X ≅ X', A ≅ A'` is a bijection on surjections. For finite `X, A`: a surjection from a group of smaller order does not exist; surjective endomorphisms of a finite group are automorphisms.

*Needs:* `MonoidHom` (Mathlib), `Function.Surjective` (Mathlib), `Nat.card` (Mathlib).

([[37]](#ref-37), Annals 183 (2016), §8.1, p. 771; [[38]](#ref-38), arXiv 1504.04391v1, §1, p. 3.)

**Checks.**

- `|Sur(ℤ/p², ℤ/p)| = p − 1`.
- `|Sur(ℤ/p × ℤ/p, ℤ/p)| = p² − 1`.
- `|Sur(ℤ/5, 0)| = 1`.
- `|Sur(ℤ/p, ℤ/p²)| = 0` although `|Hom(ℤ/p, ℤ/p²)| = p`: a definition counting homomorphisms fails.

<a id="exact-surjection-count-formula"></a>

**Exact surjection count formula.** Let `p` be prime, `X = A_ξ` and `A = A_α` finite abelian p-groups with conjugate partitions `x_i = ξ'_i` and `a_i = α'_i`. If `x_i < a_i` for some `i` then `|Sur(X, A)| = 0`. Otherwise `|Sur(X, A)| = ∏_{i ≥ 1} p^{x_i a_{i+1}} ∏_{j = a_{i+1}}^{a_i − 1} (p^{x_i} − p^j)`.

Use the coordinate perfect pairings `A_λ × A_λ → ℚ/ℤ`, with each `ℤ/p^e` factor paired by `xy/p^e mod ℤ`. Dualizing a homomorphism gives a bijection `Sur(X,A) ≃ Inj(A,X)`; these pairings explicitly identify each finite group with its character dual. Let `V_i = p^{i−1}X[p^i] ⊆ X[p]`. These form a decreasing flag of `F_p-spaces` of dimensions `x_i`. Write `A` as a direct sum with `m_i=a_i−a_{i+1}` cyclic generators of order `p^i`, and choose their images from the largest `i` downwards. An additive map `A→X` is injective iff it is injective on `A[p]`: every nonzero subgroup of a finite p-group meets `A[p]`. The order-p images already chosen from longer cyclic factors span `a_{i+1}` independent vectors in `V_i`. Choosing the `m_i` new order-p images therefore gives `∏_{j=a_{i+1}}^{a_i−1}(p^{x_i}−p^j)`. If `x_i<a_i` for some `i`, this cannot be done. Each chosen order-p vector in `V_i` lifts to `X[p^i]` under `p^{i−1}` in exactly `|X[p^{i−1}]| = p^{Σ_{k<i}x_k}` ways. For all `m_i` generators the total lift exponent is `Σ_i m_i Σ_{k<i}x_k = Σ_k x_k a_{k+1}`. Multiplying gives the stated formula.

*Needs:* [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups), [surjection count](#surjection-count).

([[37]](#ref-37), Annals 183 (2016), proof of Lemma 8.4, p. 772, supplies the enlargement setting; the displayed exact surjection formula is the supporting flag-count lemma proved here.)

**Checks.**

- `|Sur(ℤ/p², ℤ/p)| = p − 1, |Sur(ℤ/p², ℤ/p²)| = p(p − 1) = |Aut(ℤ/p²)|, |Sur(ℤ/p × ℤ/p², ℤ/p²)| = p²(p − 1)`.
- For `p = 2` and `|X| ≤ 16`, the formula equals the direct finite homomorphism count; for `X=ℤ/4` and `A=ℤ/2` the value is 1, while reversing `X` and `A` gives 0.

<a id="partitions-with-large-parts-by-largest-part"></a>

**Partitions with large parts by largest part.** For `u, m ≥ 0` let `a_m` be the number of partitions of `m` with every part `≥ u + 1` and `b_{i,j}` the number of partitions of `i` with largest part exactly `j`. Then `a_m = Σ_{i + uj = m}` `b_{i,j}`; equivalently, as formal power series, `∏_{j ≥ u+1} (1 − q^j)^{−1} = Σ_{n ≥ 0} f_n(q) q^{nu}` with `f_n(q) = Σ_N b_{N,n} q^N`.

Adding `u` copies of the row of length `j` to the Young diagram of a partition of `i` with largest part `j` gives a partition of `i` + uj whose largest part occurs at least `u + 1` times, and this is a bijection. Conjugation exchanges 'largest part occurs at least `u + 1` times' with 'every part is at least `u` + 1'. The generating function of partitions with all parts `≥ u + 1` is `∏_{j≥u+1}(1 − q^j)^{−1}` (Mathlib `Nat.Partition.hasProd_powerSeriesMk_card_restricted` with the predicate `u + 1 ≤ ·`); regroup the right side by `n`.

*Needs:* `Nat.Partition.hasProd_powerSeriesMk_card_restricted` (Mathlib), `Nat.Partition.restricted` (Mathlib).

([[39]](#ref-39), arXiv 1407.3066v1, Lemmas 1–2, p. 2.)

**Checks.**

- `u = 0: a_m = p(m) = Σ_j b_{m,j}`.
- `m = 2, u = 1: a_2 = 1` (the partition (2)) and `b_{2,0} + b_{1,1} = 0 + 1 = 1`.
- At `u=2,m=2`, `a₂=0` because no part can be at least 3; at `u=1,m=2`, `a₂=1`.

<a id="hall-partition-identity"></a>

**Hall partition identity.** For every `n ≥ 0` and a prime `p`, with `q = p^{−1}: f_n(q) := Σ_{N≥0} b_{N,n} q^N = Σ_{λ ⊢ n} 1/|Aut A_λ|`, where `b_{N,n}` counts partitions of `N` with largest part exactly `n`. Equivalently `f_n(q) = Σ_{μ ⊢ n} q^{Σ μ_i²} ∏_i ψ_{μ_i, μ_{i−1} − μ_i}(q)` with `ψ_{a,b}(q) = ∏_{i=1}^{a+b}(1 − q^i)/(∏_{i=1}^{a}(1 − q^i) ∏_{i=1}^{b}(1 − q^i)), ψ_{a,∞}(q) = 1/∏_{i=1}^{a}(1 − q^i)` and `μ_0 = ∞`.

Given a partition `ν` of `N` with largest part `n`, take the Young diagram `D` of `ν'` (height `n`) and cut out the Durfee-type squares `μ_1 × μ_1, μ_2 × μ_2`, … stacked vertically down the left edge (`μ_1` largest with `(μ_1, μ_1) ∈ D`, `μ_i` largest with `(μ_1+…+μ_i, μ_i) ∈ D`); then `|μ| = n`. The cells to the right of the i-th square form a partition of height `≤ μ_i` and width `≤ μ_{i−1} − μ_i`, counted by `ψ_{μ_i, μ_{i−1}−μ_i}(q)`; the construction is reversible. The rows of the i-th strip are `μ₁+⋯+μ_{i−1} < x ≤ μ₁+⋯+μ_i`; the source incorrectly prints a strict upper inequality. The rectangle generating function `ψ` is the Gaussian binomial, obtained by splitting partitions at the last `row/column` and applying its recursion. Substitute the automorphism count ([automorphism count of finite abelian p groups](#automorphism-count-of-finite-abelian-p-groups)): `1/|Aut A_λ| = q^{Σ(λ'_i)²}∏_i 1/(q)_{λ'_i−λ'_{i+1}}`, and the product `∏_i ψ_{μ_i, μ_{i−1}−μ_i}(q)` telescopes to `∏_i 1/(q)_{μ_i−μ_{i+1}}`; with `μ = λ'` the right side is `Σ_{λ⊢n} 1/|Aut A_λ|`.

*Needs:* [automorphism count of finite abelian p groups](#automorphism-count-of-finite-abelian-p-groups), `Nat.Partition` (Mathlib), [gaussian binomial coefficient](#gaussian-binomial-coefficient).

([[39]](#ref-39), arXiv 1407.3066v1, pp. 5–6 (following Hall 1938).)

**Checks.**

- `n = 1: Σ_N b_{N,1} q^N = q/(1 − q) = 1/(p − 1) = 1/|Aut ℤ/p|`.
- `n = 0`: both sides are 1.
- At `n=2,p=2`, `f₂(1/2)=1/2+1/6=2/3`; the two terms come from `C₄` and `C₂²`.

<a id="weighted-inverse-automorphism-sum"></a>

**Weighted inverse automorphism sum.** For a prime `p` and `u ≥ 0: Σ_{A ∈ L} 1/(|A|^u |Aut A|) = ∏_{j ≥ u+1} (1 − p^{−j})^{−1}`, the sum converging in `ℝ`.

Group the sum by `n = log_p|A|: Σ_A |A|^{−u}|Aut A|^{−1} = Σ_n q^{nu} Σ_{λ⊢n} |Aut A_λ|^{−1}` with `q = 1/p`. By Hall's identity `Σ_{λ⊢n}|Aut A_λ|^{−1} = f_n(q)` ([hall partition identity](#hall-partition-identity)). By [partitions with large parts by largest part](#partitions-with-large-parts-by-largest-part), `Σ_n f_n(q) q^{nu} = ∏_{j≥u+1}(1 − q^j)^{−1}`; the power series converge absolutely at `q = 1/p < 1`, so the formal identity specialises (nonnegative coefficients, monotone convergence). To justify analytic evaluation independently of the formal-series topology, expand finite products as nonnegative series and apply monotone convergence as the allowed part sizes grow. Their values are bounded by the positive convergent inverse Euler product, since `Σ_j q^j < ∞`. Thus the full series is finite; evaluation at `q` is not asserted to be continuous for the formal-series topology.

*Needs:* [hall partition identity](#hall-partition-identity), [partitions with large parts by largest part](#partitions-with-large-parts-by-largest-part), [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups).

([[39]](#ref-39), arXiv 1407.3066v1, Theorem, p. 1; [[38]](#ref-38), arXiv 1504.04391v1, proof of Lemma 3.2, p. 10.)

**Checks.**

- `u = 0: Σ_A 1/|Aut A| = ∏_{j≥1}(1 − p^{−j})^{−1}` (Hall's 'strange formula').
- `p = 2, u = 0`: the truncation to `|A| ≤ 2` gives `1 + 1 = 2 ≤ ∏(1 − 2^{−j})^{−1} ≈ 3.46`.

<a id="cohen-lenstra-mass-formula"></a>

**Cohen lenstra mass formula.** `cohenLenstra_mass`: for a prime `p` and `u ≥ 0, Σ_{A ∈ L} c_{p,u}/(|A|^u |Aut A|) = 1, i.e`. the Cohen–Lenstra weights have total mass one.

Multiply [weighted inverse automorphism sum](#weighted-inverse-automorphism-sum) by `c_{p,u} = ∏_{j≥u+1}(1 − p^{−j})`; the product is multipliable and nonzero, so `c_{p,u}·c_{p,u}^{−1} = 1`. Transport the real series to `ℝ≥0∞` (ENNReal.ofReal of nonnegative terms) to get the HasSum statement used by the PMF.

*Needs:* [weighted inverse automorphism sum](#weighted-inverse-automorphism-sum), [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups).

([[38]](#ref-38), arXiv 1504.04391v1, Lemma 3.2, p. 9; [[37]](#ref-37), Annals 183 (2016), §8.1, p. 771.)

**Checks.**

- For `u = 0, p = 3`: the masses of `0, ℤ/3, ℤ/9, (ℤ/3)²` are `≈ 0.5601`, 0.2801, 0.0934, 0.0117.
- The statement fails for the weights `1/|A|^u` alone (they do not sum to a finite value for `u = 0`).

<a id="cohen-lenstra-measure"></a>

**Cohen lenstra measure.** For a prime `p` and an integer `u ≥ 0` put `c_{p,u} = ∏_{i ≥ u+1} (1 − p^{−i})`. The Cohen–Lenstra measure `μ_{p,u}` is the probability measure on the isomorphism classes `L` of finite abelian p-groups with `μ_{p,u}(A) = c_{p,u} / (|A|^u · |Aut A|)`. For odd `p`, `u=0` gives the conjectural imaginary-quadratic Cohen–Lenstra distribution of EVW §8.1 and §8.5, and `u=1` gives the corresponding real-quadratic model. The abstract probability measures are defined for every prime, including `2`. Total mass one is the mass formula ([cohen lenstra mass formula](#cohen-lenstra-mass-formula)), which the construction takes as input.

Required definitions and properties:

- `cohenLenstraConstant`: `c_{p,u} = ∏_{i≥u+1} (1 − p^{−i})`.
- `cohenLenstraWeight`: The weight `c_{p,u}/(|A|^u |Aut A|) ∈ [0, ∞]`.
- `μ_{p,u}` as a probability mass function on the carrier (built from the mass formula).
- `μ_{p,u}(A) = c_{p,u}/(|A|^u |Aut A|)`.
- `0 < c_{p,u}`.
- `c_{p,u} < 1`.
- `c_{p,u} = (1 − p^{−(u+1)}) c_{p,u+1}`.
- `μ_{p,u}(0) = c_{p,u}`.
- `μ_{p,u}(A) · |A|^u |Aut A| = c_{p,u}`: the measure is proportional to `1/(|A|^u |Aut A|)`.
- The p-rank law: `μ_{p,u}(p-rank = k) = p^{−k(k+u)} ∏_{i=1}^{k}(1 − p^{−i})^{−1} ∏_{i=1}^{k+u}(1 − p^{−i})^{−1} ∏_{i≥1}(1 − p^{−i})` (Wood, Corollary 3.5).

Define `c_{p,u}` as the convergent infinite product `∏_{i≥0} (1 − p^{−(i+u+1)})` (tprod), positive and `< 1` because `Σ p^{−i} < ∞`. Define the weight `w(A) = c_{p,u}/(|A|^u |Aut A|)` in `[0, ∞]` using the carrier's order `p^{A.1}` and the number of additive automorphisms of its representative. By the mass formula the weights sum to 1, so they define a probability mass function (Mathlib PMF).

*Needs:* [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups), [automorphism count of finite abelian p groups](#automorphism-count-of-finite-abelian-p-groups), [cohen lenstra mass formula](#cohen-lenstra-mass-formula).

([[37]](#ref-37), Annals 183 (2016), §8.1, p. 771 and §8.5, p. 774; [[38]](#ref-38), arXiv 1504.04391v1, Theorem 1.3, p. 3; [[45]](#ref-45), arXiv 1511.02212v1, §5.7.1, p. 35.)

**Checks.**

- `μ_{p,0}(0) = c_{p,0}`.
- `μ_{p,0}(ℤ/p) = c_{p,0}/(p − 1)`.
- `μ_{p,1}(ℤ/p) = c_{p,1}/(p(p − 1))` (for odd `p`, the real-quadratic weight carries the extra `1/|A|`).
- `μ_{p,0}(ℤ/p²) = (p² − 1) μ_{p,0}((ℤ/p)²)`: a measure depending only on `|A|` is wrong.
- `0.56 < c_{3,0} < 0.561`.
- At `p=2`, `μ_{2,0}(0)=c_{2,0}>0` is an abstract mass. Genus theory gives wide 2-rank `t−1` for imaginary quadratic discriminants with `t` ramified primes, so the odd-prime quadratic interpretation does not extend to 2.

### 3.4 Surjection moments and extension groupoids

<a id="surjection-moment"></a>

**Surjection moment.** For a nonnegative measure `ν` on `L` (a function `L → [0, ∞]`) and a class `A`, the A-moment of `ν` is `⟨Sur(−, A)⟩_ν = Σ_{X ∈ L} ν(X) |Sur(X, A)| ∈ [0, ∞]`. The trivial-target moment is the total mass; all rearrangements are of nonnegative series.

Required definitions and properties:

- `surjectionMoment`: `⟨Sur(−, A)⟩_ν = Σ_X ν(X)|Sur(X, A)|`.
- The moment at the trivial class is the total mass `Σ_X ν(X)`.
- The moment is additive in `ν`.
- The moment is homogeneous in `ν`.
- `ν ≤ ν'` pointwise implies `⟨Sur(−, A)⟩_ν ≤ ⟨Sur(−, A)⟩_ν'`.
- The moment of the Dirac mass at `X` is `|Sur(X, A)|`.

Define the moment as the `ℝ≥0∞-valued` tsum of `ν(X)·|Sur(X_p, A_p)|` over the carrier. Linearity and monotonicity in `ν` follow from `ENNReal.tsum_add` and monotonicity of tsum. For `A` trivial, `|Sur(X, 0)| = 1`, so the moment is `Σ ν(X)`.

*Needs:* [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups), [surjection count](#surjection-count), `ENNReal.tsum_add` (Mathlib), `PMF.tsum_coe` (Mathlib).

([[37]](#ref-37), Annals 183 (2016), §8.2, p. 771.)

**Checks.**

- The zero measure has all moments 0.
- The Dirac mass at `ℤ/p` has `ℤ/p-moment p − 1`.
- A probability mass function has trivial-target moment 1.
- The moment counts surjections, not homomorphisms: the Dirac mass at `(ℤ/p)²` has `ℤ/p-moment p² − 1`, not `|Hom((ℤ/p)², ℤ/p)| = p²`.

<a id="extension-groupoid-of-finite-abelian-groups"></a>

**Extension groupoid of finite abelian groups.** For finite abelian groups `G` and `K`, consider exact sequences `0 → K →ι B →f G → 0` with `B` abelian, and isomorphisms of such sequences that are the identity on `K` and on `G`. Then `Σ` over isomorphism classes of sequences of `1/|Aut(sequence)| = 1`. Equivalently, `Σ_{[B]} #{f ∈ Sur(B, G) : ker f ≅ K}/|Aut B| = 1/|Aut K|`.

Write `G = ⊕_i ℤ/n_i` (Mathlib `AddCommGroup.equiv_directSum_zmod_of_finite`, after splitting into cyclic factors). An extension is determined up to isomorphism by choosing lifts `b_i ∈ B` of the generators: `n_i b_i` lies in `ι(K)`, and its class in `K/n_iK` does not depend on the lift; conversely every tuple `(k_i) ∈ ∏_i K/n_iK` arises `(B = (K ⊕ ℤ^r)/⟨n_i e_i − k_i⟩)`. So the isomorphism classes are in bijection with `∏_i K/n_iK`. The automorphisms of a sequence are `φ =` id + `ι∘h∘f` with `h ∈ Hom(G, K) ≅ ∏_i K[n_i]`. `|K/n_iK| = |K[n_i]|` (kernel and cokernel of multiplication by `n_i` on the finite group `K` have the same order), so the groupoid cardinality is `∏|K/n_iK| / ∏|K[n_i]| = 1`. For the second form: a fixed `B` contributes `#{(ι, f)}/|Aut B|` by orbit counting, and `#{(ι, f)} = #{f ∈ Sur(B, G) : ker f ≅ K}·|Aut K|`.

*Needs:* [surjection count](#surjection-count), `AddCommGroup.equiv_directSum_zmod_of_finite` (Mathlib).

([[38]](#ref-38), arXiv 1504.04391v1, proof of Lemma 3.2, p. 10.)

**Checks.**

- `G = K = ℤ/p: B = ℤ/p²` contributes `(p − 1)/(p(p − 1)) = 1/p` and `B = (ℤ/p)²` contributes `(p² − 1)/((p² − 1)(p² − p)) = 1/(p(p − 1))`; the sum is `1/(p − 1) = 1/|Aut ℤ/p|`.
- `G = 0`: only `B ≅ K` contributes, with `1/|Aut K|`.
- For `G=C₂,K=C₄`, `B=C₈` and `B=C₄×C₂` each contribute `1/4`. Only two of the latter's three surjections have cyclic kernel; the total is `1/2=1/|Aut C₄|`.

<a id="surjection-weighted-class-count"></a>

**Surjection weighted class count.** For a prime `p`, a finite abelian p-group `G` of order `p^g` and `i ≥ g: Σ_{|B| = p^i} |Sur(B, G)|/|Aut B| = Σ_{|K| = p^{i−g}} 1/|Aut K|`, the sums over isomorphism classes.

The left side is the groupoid cardinality of pairs `(B, f : B ↠ G)` with `|B| = p^i`, isomorphisms of `B` commuting with `f: Σ_B |Sur(B, G)|/|Aut B|`. Sort the surjections by the isomorphism class `K` of the kernel `(|K| = p^{i−g})`: by [extension groupoid of finite abelian groups](#extension-groupoid-of-finite-abelian-groups) the kernel-K part contributes exactly `1/|Aut K|`. Sum over the classes `K` of order `p^{i−g}`.

*Needs:* [extension groupoid of finite abelian groups](#extension-groupoid-of-finite-abelian-groups), [surjection count](#surjection-count), [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups).

([[38]](#ref-38), arXiv 1504.04391v1, proof of Lemma 3.2, p. 10.)

**Checks.**

- `G = 0`: both sides equal `Σ_{|B|=p^i} 1/|Aut B|`.
- `i = g = 1, G = ℤ/p`: left `(p − 1)/(p − 1) = 1`, right `1/|Aut 0| = 1`.

<a id="cohen-lenstra-moments"></a>

**Cohen lenstra moments.** `cohenLenstra_moments`: for a prime `p, u ≥ 0` and every finite abelian p-group `A: ⟨Sur(−, A)⟩_{μ_{p,u}} = Σ_X μ_{p,u}(X)|Sur(X, A)| = |A|^{−u}`. In particular every moment of `μ_{p,0}` equals 1.

Write the moment as `c_{p,u} Σ_i p^{−iu} Σ_{|X|=p^i} |Sur(X, A)|/|Aut X|`. Apply [surjection weighted class count](#surjection-weighted-class-count) to each `i ≥ log_p|A|` (terms with `i < log_p|A|` vanish by the cardinality obstruction to a surjection): the inner sum is `Σ_{|K|=p^{i}/|A|} 1/|Aut K|`. Reindex by `K: Σ_i p^{−iu} Σ_{|K| = p^i/|A|} 1/|Aut K| = |A|^{−u} Σ_K 1/(|K|^u|Aut K|) = |A|^{−u} c_{p,u}^{−1}` ([weighted inverse automorphism sum](#weighted-inverse-automorphism-sum)); multiply by `c_{p,u}`.

*Needs:* [surjection weighted class count](#surjection-weighted-class-count), [weighted inverse automorphism sum](#weighted-inverse-automorphism-sum), [cohen lenstra measure](#cohen-lenstra-measure), [surjection moment](#surjection-moment), [surjection count](#surjection-count).

([[38]](#ref-38), arXiv 1504.04391v1, Lemma 3.2, p. 9; [[37]](#ref-37), Annals 183 (2016), §8.1, p. 771.)

**Checks.**

- `u = 0, A = ℤ/p: Σ_X μ(X)(p^{rk X} − 1) = 1`, so `E[p^{rank}] = 2` under `μ_{p,0}`.
- `A = 0` gives total mass 1 (the mass formula).

### 3.5 Moment uniqueness and convergence

<a id="cohen-lenstra-contraction-constant"></a>

**Cohen lenstra contraction constant.** For an odd prime `ℓ, c_ℓ = ∏_{i≥1}(1 − ℓ^{−i}) > 1/2`; hence `β = c_ℓ^{−1} − 1 < 1`. For `ℓ = 2, c_2 ≈ 0.2888 < 1/2` and `β > 1`.

`c_ℓ` is increasing in `ℓ` (each factor increases), so `c_ℓ ≥ c_3`. Bound `c_3` from below: `∏_{i≥1}(1 − 3^{−i}) ≥ (1 − 1/3)(1 − 1/9)(1 − Σ_{i≥3} 3^{−i}) = (2/3)(8/9)(1 − 1/18) =` 0.5597… `> 1/2` (using `∏(1 − x_i) ≥ 1 − Σ x_i` for the tail, Mathlib geometric series). For `ℓ = 2: (1 − 1/2)(1 − 1/4) = 3/8 < 1/2` already bounds `c_2` above.

*Needs:* [cohen lenstra measure](#cohen-lenstra-measure), `tsum_geometric_of_lt_one` (Mathlib).

([[37]](#ref-37), Annals 183 (2016), proof of Lemma 8.2, p. 771.)

**Checks.**

- `c_3 ≈ 0.5601`, so `β ≈ 0.785` for `ℓ = 3`.
- Non-example `ℓ = 2: β ≈ 2.46`, so the alternating iteration in EVW Lemma 8.2 does not converge.

<a id="moments-determine-the-cohen-lenstra-measure"></a>

**Moments determine the cohen lenstra measure.** Let `ℓ` be an odd prime and `ν` a probability measure on `L` with `⟨Sur(−, A)⟩_ν = 1` for every `A ∈ L`. Then `ν = μ_{ℓ,0}`.

Put `u_A = |Aut A|·ν(A) ≥ 0`. The moment identity reads `u_A + Σ_{B ≠ A} (|Sur(B, A)|/|Aut B|) u_B = 1` (EVW (8.2.1)). By [cohen lenstra moments](#cohen-lenstra-moments) with `u = 0` the same identity holds for `u_B = c_ℓ`, so `β_A := Σ_{B≠A}|Sur(B, A)|/|Aut B| = c_ℓ^{−1} − 1 =: β` for every `A`. If `L ≤ u_B ≤ U` for all `B` then `1 − βU ≤ u_A ≤ 1 − βL`; starting from `0 ≤ u ≤ 1` the bounds are alternating partial sums of `Σ(−β)^k`. Since `β < 1` ([cohen lenstra contraction constant](#cohen-lenstra-contraction-constant)) both bounds converge to `1/(1 + β) = c_ℓ`, so `ν(A) = c_ℓ/|Aut A| = μ_{ℓ,0}(A)`.

*Needs:* [cohen lenstra moments](#cohen-lenstra-moments), [cohen lenstra contraction constant](#cohen-lenstra-contraction-constant), [surjection moment](#surjection-moment), [cohen lenstra measure](#cohen-lenstra-measure), `PMF.ext` (Mathlib).

([[37]](#ref-37), Annals 183 (2016), Lemma 8.2, p. 771.)

**Checks.**

- `ν = μ_{ℓ,0}` satisfies the hypothesis ([cohen lenstra moments](#cohen-lenstra-moments)).
- For `ℓ = 2` the argument fails `(β > 1)`; uniqueness at `ℓ = 2` is [moments determine cohen lenstra limits for all p and u](#moments-determine-cohen-lenstra-limits-for-all-p-and-u).

<a id="enlargement-of-finite-abelian-p-groups"></a>

**Enlargement of finite abelian p groups.** For finite abelian ℓ-groups `A, A'` and `s ≥ 0`, `A'` is an s-enlargement of `A` if some surjection `A' ↠ A` has kernel of order `ℓ^s` (a 1-enlargement is an enlargement). Equivalently `|A'| = ℓ^s|A|` and the Young diagram of `A` is contained in that of `A'` (`a_i ≤ a'_i` for the conjugate partitions). The set `E_s(A)` of isomorphism classes of s-enlargements is finite, with at most `p(s + m)` elements where `ℓ^m = |A|`. The surjection is data separate from the isomorphism class.

Required definitions and properties:

- `A'` is an s-enlargement of `A`: ∃ surjection `A' ↠ A` with kernel of order `ℓ^s`.
- The finite set `E_s(A)` of classes of order `ℓ^{s}|A|` whose diagram contains that of `A`.
- IsEnlargement `ℓ s A' A ↔ |A'| = ℓ^s|A|` and `a_i ≤ a'_i` for all `i`.
- `B ∈ E_s(A) ↔ B` is an s-enlargement of `A`.
- `|E_s(A)| ≤ p(m + s)`, the number of partitions of `m + s`.
- An s-enlargement of a t-enlargement is an `(s + t)-enlargement`.
- The 0-enlargements of `A` are `A` itself.

Define IsEnlargement `ℓ s A' A` by the existence of a surjective homomorphism of the representatives with kernel of cardinality `ℓ^s`. Characterisation: by exact-surjection-count-formula, a surjection `A′↠A` exists precisely when every conjugate-partition coordinate of `A` is bounded by the corresponding coordinate of A′. The order condition then fixes the kernel cardinality and `s`. Hence `E_s(A)` is the image of the partitions of `m + s` containing `α`, a finite set of size `≤ p(m + s)`. Composition: an s-enlargement of a t-enlargement is an `(s+t)-enlargement` (compose the surjections, orders multiply).

*Needs:* [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups), [surjection count](#surjection-count), [exact surjection count formula](#exact-surjection-count-formula).

([[37]](#ref-37), Annals 183 (2016), proof of Lemma 8.4, p. 772; [[37]](#ref-37), Annals 183 (2016), proof of Lemma 8.4, p. 772–773.)

**Checks.**

- `ℤ/ℓ` is a 1-enlargement of the trivial group.
- Both `(ℤ/ℓ)²` (split) and `ℤ/ℓ²` (non-split) are 1-enlargements of `ℤ/ℓ`.
- `ℤ/ℓ³` is not a 1-enlargement of `(ℤ/ℓ)²`: the order is right but `(ℤ/ℓ)²` is not a quotient.
- For `X = A' = ℤ/9 × ℤ/3, A = (ℤ/3)², π(x, y) = (x mod 3, y)`; the surjection `f(x, y) = (y, x mod 3)` has no lift `X → A'` through `π`, so the pointwise lifting claim in EVW's proof of (8.4.1) is false; of the 48 surjections `X → (ℤ/3)², 36` have no lift and 12 have 9 lifts each, while `|Aut(ℤ/9 × ℤ/3)| = 108 ≥ 2·48`.

<a id="aggregate-enlargement-inequality"></a>

**Aggregate enlargement inequality.** Let `ℓ` be prime and `X, A` finite abelian ℓ-groups with `Sur(X, A) ≠ ∅` and `|X| > |A|`. Then there is a 1-enlargement `A'` of `A` with `|Sur(X, A')| ≥ (ℓ − 1)|Sur(X, A)|`. One may take `A'` with conjugate partition `a'_j = a_j + 1` at the least `j` with `x_j > a_j`, and `a'_i = a_i` otherwise.

Since `X ↠ A, x_i ≥ a_i` for all `i` ([exact surjection count formula](#exact-surjection-count-formula)), and `|X| > |A|` gives some `i` with `x_i > a_i`; let `j` be the least. For `j>1`, minimality of `j` gives `a_{j−1}=x_{j−1}≥x_j≥a_j+1`, so increasing `a_j` preserves the partition inequalities. For `j=1` there is no preceding coordinate to check. In both cases a′ contains a and has total size one greater, hence defines a 1-enlargement. Compare the products of the exact formula for `(X, A')` and `(X, A)`: the factor at index `j − 1` changes by `ℓ^{x_{j−1}}/(ℓ^{x_{j−1}} − ℓ^{a_j}) ≥ 1`, and index `j` gains the factor `ℓ^{x_j} − ℓ^{a_j} ≥ ℓ^{a_j}(ℓ − 1) ≥ ℓ − 1`; all other factors agree. When `j=1` omit the `j−1` factor; there is no index-zero factor in the formula. EVW's argument that every `f ∈ Sur(X, A)` lifts through a fixed `A' ↠ A` is false; only the aggregate count is used.

*Needs:* [exact surjection count formula](#exact-surjection-count-formula), [enlargement of finite abelian p groups](#enlargement-of-finite-abelian-p-groups).

([[37]](#ref-37), Annals 183 (2016), proof of Lemma 8.4, (8.4.1), p. 772.)

**Checks.**

- `X = ℤ/ℓ², A = ℤ/ℓ: A' = ℤ/ℓ²`, ratio `ℓ ≥ ℓ − 1`.
- For `ℓ=3`, `X=ℤ/9×ℤ/3`, `A=(ℤ/3)²` and `A'=X`, `|Sur(X,A')|=108≥2·48=(ℓ−1)|Sur(X,A)|` although 36 of the 48 surjections do not lift.

<a id="partition-tail-domination"></a>

**Partition tail domination.** For an integer `ℓ ≥ 3` and fixed `m ≥ 0, p(s + m)(ℓ − 1)^{−s}` `→ 0` as `s → ∞`, where `p(n)` is the number of partitions of `n`.

Choose `r` with `(ℓ − 1)^{−1} < r < 1` (possible since `ℓ − 1 ≥ 2`). Expand finite Euler products with nonnegative coefficients and use monotone convergence to obtain `Σ_n p(n)r^n=∏_{j≥1}(1−r^j)⁻¹<∞`. Positivity and nonvanishing of the product follow from `Σ_j r^j<∞`. The formal partition identity identifies the coefficients, but its formal topology alone does not justify evaluation at nonzero `r`. Hence `p(n)r^n→0`. `p(s + m)(ℓ − 1)^{−s}` `= p(s + m) r^{s+m} · r^{−m} · (r(ℓ − 1))^{−s} → 0`.

*Needs:* `Nat.Partition.hasProd_powerSeriesMk_card_restricted` (Mathlib), `tsum_geometric_of_lt_one` (Mathlib).

([[37]](#ref-37), Annals 183 (2016), proof of Lemma 8.4, printed p. 772 (PDF p. 44).)

**Checks.**

- `ℓ = 3, m = 0: p(s)/2^s → 0 (p(20) = 627 < 2^{20})`.
- `ℓ = 2` is excluded: `p(s)·1^{−s} → ∞`.
- The tail bound also applies at composite `ℓ=4`: this supporting estimate needs `ℓ≥3`, rather than primality.

<a id="finite-enlargement-domination-of-tails"></a>

**Finite enlargement domination of tails.** Let `ℓ` be an odd prime, `ε > 0` and `A ∈ L` with `|A| = ℓ^m`. There are `c(A)` and a finite nonempty `M ⊂ L` such that for every `X ∈ L` with `|X| > c(A): |Sur(X, A)| ≤ ε · (Σ_{A'∈M} |Sur(X, A')|)/|M|`. One may take `M = E_s(A)` and `c(A) = ℓ^s|A|` for any `s` with `p(s + m)(ℓ − 1)^{−s}` `≤ ε`.

Pick `s` by [partition tail domination](#partition-tail-domination); put `M = E_s(A)` (nonempty: `ℤ/ℓ^s ⊕ A`). If `Sur(X, A) = ∅` the inequality is trivial. Otherwise iterate [aggregate enlargement inequality](#aggregate-enlargement-inequality) `s` times (possible while `|X| > ℓ^t|A|`): there is `A' ∈ E_s(A)` (by composition of enlargements) with `|Sur(X, A')| ≥ (ℓ − 1)^s|Sur(X, A)|`. Hence `|Sur(X, A)| ≤ (ℓ − 1)^{−s} Σ_{A'∈M}|Sur(X, A')| = (ℓ − 1)^{−s}|M|` · (average) `≤ p(s + m)(ℓ − 1)^{−s}` · (average) `≤ ε` · (average), using the partition bound `|M| ≤ p(s + m)` on the number of enlargements.

*Needs:* [aggregate enlargement inequality](#aggregate-enlargement-inequality), [partition tail domination](#partition-tail-domination), [enlargement of finite abelian p groups](#enlargement-of-finite-abelian-p-groups).

([[37]](#ref-37), Annals 183 (2016), Lemma 8.4, p. 772.)

**Checks.**

- For `A` trivial and `ε = 1/2, ℓ = 3: s = 3` works since `p(3)/2^3 = 3/8`.
- For `ℓ=2` this enlargement-growth argument gives only the factor `(ℓ−1)^s=1` and proves no tail domination. This is a limitation of the argument, not a disproof of the statement by another method.

<a id="finite-moment-control-of-masses"></a>

**Finite moment control of masses.** Let `ℓ` be an odd prime, `ε_0 > 0` and `L_0 ⊂ L` finite. There exist `δ > 0` and a finite `L' ⊂ L` such that every probability measure `ν` on `L` with `⟨Sur(−, A)⟩_ν ∈ [1 − δ, 1 + δ]` for all `A ∈ L'` satisfies `|ν(A) − μ_{ℓ,0}(A)| ≤ ε_0` for all `A ∈ L_0`.

Suppose not; with `L'_k = {|A| ≤ k}` and `δ = 1/k` obtain `ν_k` with moments within `1/k` on `L'_k` and `|ν_k(A_k) − μ(A_k)| > ε_0` for some `A_k ∈ L_0`; pass to a subsequence with `A_k` constant. The masses `ν_k(B)` lie in `[0, 1]`; by compactness of `[0, 1]^L` (Tychonoff, countable index, sequential compactness: Mathlib `CompactSpace.tendsto_subseq`) pass to a pointwise convergent subsequence `ν_k → ν_∞`. Fatou (`MeasureTheory.lintegral_liminf_le` for counting measure on the discrete class carrier, rewritten with `MeasureTheory.lintegral_count`) gives `⟨Sur(−, A)⟩_{ν_∞} ≤ 1`; every function on this carrier is measurable. For the reverse, split the moment at `|B| ≤ c(A)` (finitely many `B`, limits commute) and bound the tail `Σ_{|B|>c}ν_k(B)|Sur(B, A)| ≤ ε · max_{A'∈M}⟨Sur(−, A')⟩_{ν_k} ≤ ε(1 + 1/k)` by [finite enlargement domination of tails](#finite-enlargement-domination-of-tails); hence `⟨Sur(−, A)⟩_{ν_∞} = 1` for all `A`. `A = 0` shows `ν_∞` is a probability measure; [moments determine the cohen lenstra measure](#moments-determine-the-cohen-lenstra-measure) gives `ν_∞ = μ`, contradicting `|ν_k(A) − μ(A)| > ε_0` in the limit.

*Needs:* [finite enlargement domination of tails](#finite-enlargement-domination-of-tails), [moments determine the cohen lenstra measure](#moments-determine-the-cohen-lenstra-measure), [surjection moment](#surjection-moment), `CompactSpace.tendsto_subseq` (Mathlib), `isCompact_univ_pi` (Mathlib), `MeasureTheory.lintegral_liminf_le` (Mathlib), `MeasureTheory.lintegral_count` (Mathlib).

([[37]](#ref-37), Annals 183 (2016), Proposition 8.3, p. 772; [[37]](#ref-37), Annals 183 (2016), proof of Proposition 8.3, p. 773.)

**Checks.**

- Applied to `ν = μ_{ℓ,0}` itself (all moments 1) the conclusion is trivial.
- Without the tail estimate the limit could lose mass: pointwise limits of probability measures on `L` need not be probability measures (EVW p. 773).
- For the trivial target, `#Sur(B,0)=1` for every `B`; preservation of this moment is precisely total mass one.

<a id="moment-convergence-implies-distribution-convergence"></a>

**Moment convergence implies distribution convergence.** Let `ℓ` be an odd prime and `ν_n` probability measures on `L` with `⟨Sur(−, A)⟩_{ν_n} → 1` for every `A ∈ L`. Then `ν_n(A) → μ_{ℓ,0}(A)` for every `A`. The converse does not hold without uniform integrability ([distribution convergence does not force moment convergence](#distribution-convergence-does-not-force-moment-convergence)).

Given `A` and `ε_0`, apply [finite moment control of masses](#finite-moment-control-of-masses) with `L_0 = {A}`: for `n` large all moments indexed by the finite `L'` lie in `[1 − δ, 1 + δ]`, so `|ν_n(A) − μ(A)| ≤ ε_0`.

*Needs:* [finite moment control of masses](#finite-moment-control-of-masses).

([[37]](#ref-37), Annals 183 (2016), §8.5, p. 774.)

**Checks.**

- EVW (8.5.1) `⇒` Cohen–Lenstra distribution statement for imaginary quadratic fields, `ℓ` odd (apply the uniqueness theorem to the specified imaginary-quadratic family).
- EVW's word 'equivalent' in §8.5 overstates this: the [distribution/moment counterexample](#distribution-convergence-does-not-force-moment-convergence) separates the two implications.

<a id="distribution-convergence-does-not-force-moment-convergence"></a>

**Distribution convergence does not force moment convergence.** For every prime `ℓ` there are probability measures `ν_n` on `L` with `ν_n(A) → μ_{ℓ,0}(A)` for all `A` (indeed in total variation) but `⟨Sur(−, ℤ/ℓ)⟩_{ν_n} → 2`: take `ν_n = (1 − ℓ^{−n})μ_{ℓ,0} + ℓ^{−n}δ_{(ℤ/ℓ)^n}`.

Total variation distance of `ν_n` and `μ` is at most `2ℓ^{−n} → 0`. Every nonzero functional `(ℤ/ℓ)^n → ℤ/ℓ` is onto, so `|Sur((ℤ/ℓ)^n, ℤ/ℓ)| = ℓ^n − 1`; with [cohen lenstra moments](#cohen-lenstra-moments) the `ℤ/ℓ-moment` is `(1 − ℓ^{−n})·1 + ℓ^{−n}(ℓ^n − 1) = 2 − 2ℓ^{−n}`.

*Needs:* [cohen lenstra moments](#cohen-lenstra-moments), [exact surjection count formula](#exact-surjection-count-formula), [surjection moment](#surjection-moment).

The displayed mixture is a direct counterexample to the converse asserted in [[37]](#ref-37), Annals 183 (2016), §8.5, p. 774. That passage is the assertion being tested; it does not supply this counterexample.

**Checks.**

- Replacing `(ℤ/ℓ)^n` by the cyclic `ℤ/ℓ^n` gives moment contribution `ℓ^{−n}(ℓ − 1) → 0` and is not a counterexample.
- This is an abstract counterexample, not a statement about class groups.

<a id="moments-determine-cohen-lenstra-limits-for-all-p-and-u"></a>

**Moments determine cohen lenstra limits for all p and u.** `tendsto_of_cohenLenstra_moments`: let `p` be prime, `u ≥ 0` and `ν_n` probability measures on `L` with `⟨Sur(−, A)⟩_{ν_n} → |A|^{−u}` for every `A ∈ L`. Then `ν_n(A) → μ_{p,u}(A)` for every `A`. (Special case of Wood's moment theorem: moments `M_G ≤ |∧²G|` determine the limit.)

Wood's Theorem 3.1 (from Wood, The distribution of sandpile groups of random graphs, Theorem 8.3): for sequences of random groups whose G-moments converge to `M_G ≤ |∧²G|` for all `G` of exponent dividing a, the limits of `P(X_n ⊗ ℤ/a ≅ H)` exist, have moments `M_G`, and are determined by `(M_G)`. Apply it with `M_G = |G|^{−u} ≤ 1 ≤ |∧²G|` and a `= p^{e+1}`, where the exponent of `A` divides `p^e`, comparing with `μ_{p,u}`, whose moments are `|G|^{−u}` ([cohen lenstra moments](#cohen-lenstra-moments)); `X ⊗ ℤ/p^{e+1} ≅ A` iff `X ≅ A` for exponent reasons.

*Needs:* [cohen lenstra moments](#cohen-lenstra-moments), [surjection moment](#surjection-moment), [cohen lenstra measure](#cohen-lenstra-measure), [Wood bounded moment limit](#refinement-wood-bounded-moment-limit).

([[38]](#ref-38), arXiv 1504.04391v1, Theorem 3.1, p. 9.)

**Checks.**

- For `ℓ` odd and `u = 0` this recovers [moment convergence implies distribution convergence](#moment-convergence-implies-distribution-convergence).
- It covers `p = 2`, where EVW's contraction argument fails.

### 3.6 Random p-adic cokernels

<a id="cokernel-law-of-haar-random-p-adic-matrices"></a>

**Cokernel law of haar random p adic matrices.** For a prime `p` and `n, u ≥ 0`, equip `M_{n×(n+u)}(ℤ_p)` (viewed as maps `ℤ_p^{n+u} → ℤ_p^n`) with its normalised Haar measure (the additive Haar measure of the compact group, total mass 1, Borel `σ-algebra` of `ℤ_p`). The cokernel law is `ν_{n,u}(A) = Haar{M : coker M = ℤ_p^n/Mℤ_p^{n+u} ≅ A}` for classes `A ∈ L`; it is a probability measure on `L`.

Required definitions and properties:

- `padicMatrixHaar`: Normalised Haar measure on `M_{n×m}(ℤ_p)`, total mass 1.
- `padicCokernel`: `coker(M) = ℤ_p^n / M ℤ_p^m`.
- The finite-n law `A ↦ P(coker M ≅ A)` for Haar `M ∈ M_{n×(n+u)}(ℤ_p)`.
- The Haar measure is a probability measure.
- Each mass is at most 1.
- The finite-n law has total mass 1 (finite cokernel almost surely).
- `surjectionMoment_cokernelLaw`: `E|Sur(coker M, A)| = |Sur(ℤ_p^n, A)|·|A|^{−(n+u)}`.
- For square matrices `P(coker M = 0) = |GL_n(F_p)|/p^{n²}` (Mathlib `Matrix.card_GL_field`).
- `tendsto_cokernelLaw`: The finite-n laws converge pointwise to `μ_{p,u}` ([friedman washington cokernel law](#friedman-washington-cokernel-law)).

Give `ℤ_p` the Borel `σ-algebra`; the Pi type of matrices is a compact abelian topological group (PadicInt.compactSpace, Tychonoff), so the additive Haar measure normalised on the whole group exists (Mathlib `MeasureTheory.Measure.addHaarMeasure`). Define `coker M` as the quotient of `ℤ_p^n` by the range of mulVecLin `M` and `ν_{n,u}(A)` as the measure of the set of `M` with `coker M ≅ A_p`. Finiteness almost surely: if `n=0` the cokernel is zero. For `n>0` the determinant of the first `n` columns is a nonzero polynomial in the entries. Its zero set has Haar measure zero by induction on the number of variables, one-variable root finiteness, and Fubini. `A` nonzero determinant has finite p-adic valuation; the adjugate identity shows that its image contains `p^k Z_p^n` for some `k`, so the full cokernel is a finite p-group. Full rank modulo `p` is sufficient but not necessary (the `1×1` matrix `[p]` has finite nonzero cokernel). Measurability of each class event: apply Smith normal form over the DVR `Z_p` to the matrix image (Mathlib Submodule.smithNormalForm). For `A` killed by `p^e, coker(M)≅A` iff `coker(M mod p^{e+1})≅A`, as follows by comparing the finite cyclic factors and any free factor. Thus the event is a finite union of congruence cylinders and is clopen. The disjoint class events cover a set of full measure, proving total mass one.

*Needs:* [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups), `MeasureTheory.Measure.addHaarMeasure` (Mathlib), `PadicInt.compactSpace` (Mathlib), `Matrix.mulVecLin` (Mathlib), `Matrix.card_GL_field` (Mathlib), `Submodule.smithNormalForm` (Mathlib).

([[38]](#ref-38), arXiv 1504.04391v1, §1, p. 1; [[38]](#ref-38), arXiv 1504.04391v1, §1, p. 3; the finite-n construction and cylinder measurability are the supporting arguments above.)

**Checks.**

- For `n = 0` the cokernel is trivial with probability 1.
- For `n = 1, u = 0: P(coker ≅ ℤ/p) = P(v_p(a) = 1) = (1 − 1/p)/p`.
- For `n = 1, u = 0: P(coker = 0) = P(a ∈ ℤ_p^×) = 1 − 1/p`.
- For `n = 1, u = 1` (a `1 × 2` matrix) `P(coker = 0) = 1 − 1/p²`, not `1 − 1/p`: the extra column matters.
- `ν_{n,0}(0) = |GL_n(F_p)|/p^{n²}`.

<a id="haar-matrix-cokernel-surjection-moments"></a>

**Haar matrix cokernel surjection moments.** Let `p` be prime, `n, u ≥ 0` and `M ∈ M_{n×(n+u)}(ℤ_p)` Haar-random, viewed as `ℤ_p^{n+u} → ℤ_p^n`. For every finite abelian p-group `A: E|Sur(coker M, A)| = |Sur(ℤ_p^n, A)| · |A|^{−(n+u)} = |A|^{−u} ∏_{i=0}^{r−1}(1 − p^i/p^n), r` the p-rank of `A`. The quotient is in `ℚ` or R; if `r>n`, the factor at `i=n` is zero, so the whole product is zero. In particular the moments are `≤ |A|^{−u}` and tend to `|A|^{−u}` as `n → ∞`.

A surjection `coker M ↠ A` is a surjection `F : ℤ_p^n ↠ A` with F∘M `= 0`; so `E|Sur(coker M, A)| = Σ_{F ∈ Sur(ℤ_p^n, A)} P(F M = 0)` (finite sum, homomorphisms factor through `(ℤ/p^e)^n` and hence are continuous). For surjective `F` the `n + u` columns `F(M e_j)` are independent and uniform on `A` (image of Haar measure under a surjective continuous homomorphism is Haar), so `P(FM = 0) = |A|^{−(n+u)}`. `|Sur(ℤ_p^n, A)| = |A|^n ∏_{i=0}^{r−1}(1 − p^i/p^n)` (a map is onto iff it is onto modulo `p`; count `F_p-surjections F_p^n → F_p^r` by `Matrix.card_GL_field-type` counting and lift).

*Needs:* [cokernel law of haar random p adic matrices](#cokernel-law-of-haar-random-p-adic-matrices), [surjection count](#surjection-count), [surjection moment](#surjection-moment), [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups), `MeasureTheory.Measure.addHaarMeasure` (Mathlib).

([[38]](#ref-38), arXiv 1504.04391v1, Theorem 2.9, p. 7; [[38]](#ref-38), arXiv 1504.04391v1, §2, p. 5.)

**Checks.**

- `n = 0: coker = 0` and the moment is 1 at `A = 0`, 0 otherwise.
- `u = 0, A = ℤ/p: E(p^{rk coker} − 1) = 1 − p^{−n}`.
- For `n=1,u=1,A=ℤ/p`, the moment is `(p−1)/p²`; the two columns each impose a factor `1/p`.

<a id="friedman-washington-cokernel-law"></a>

**Friedman washington cokernel law.** Let `p` be prime and `u ≥ 0`. For `M ∈ M_{n×(n+u)}(ℤ_p)` Haar-random and every finite abelian p-group `A, lim_{n→∞} P(coker M ≅ A) = μ_{p,u}(A) = ∏_{k≥1}(1 − p^{−k−u})/(|A|^u |Aut A|)`. The finite-n law is a probability measure on `L` (the cokernel is finite almost surely).

The finite-cokernel argument is that of [the finite-n cokernel law](#cokernel-law-of-haar-random-p-adic-matrices): for `n>0`, the first square minor is a nonzero determinant polynomial, whose Haar-zero vanishing set is proved by induction and Fubini. Off that set the adjugate gives a finite-index image. For `n=0` the cokernel is zero. Full rank modulo `p` is not necessary: the `1×1` matrix `[p]` already has finite cokernel. By [haar matrix cokernel surjection moments](#haar-matrix-cokernel-surjection-moments) the A-moments of the finite-n laws converge to `|A|^{−u}`. Apply [moments determine cohen lenstra limits for all p and u](#moments-determine-cohen-lenstra-limits-for-all-p-and-u) (for `p` odd, `u = 0` also [moment convergence implies distribution convergence](#moment-convergence-implies-distribution-convergence)) and identify the limit with `μ_{p,u}` via [cohen lenstra moments](#cohen-lenstra-moments).

*Needs:* [cokernel law of haar random p adic matrices](#cokernel-law-of-haar-random-p-adic-matrices), [haar matrix cokernel surjection moments](#haar-matrix-cokernel-surjection-moments), [moments determine cohen lenstra limits for all p and u](#moments-determine-cohen-lenstra-limits-for-all-p-and-u), [moment convergence implies distribution convergence](#moment-convergence-implies-distribution-convergence), [cohen lenstra measure](#cohen-lenstra-measure), [cohen lenstra moments](#cohen-lenstra-moments).

([[38]](#ref-38), arXiv 1504.04391v1, §1, p. 1; [[38]](#ref-38), arXiv 1504.04391v1, Theorem 1.3, p. 3; [[37]](#ref-37), Annals 183 (2016), §8.1, p. 771.)

**Checks.**

- `n = 1, u = 0: P(coker ≅ ℤ/p) = (1 − 1/p)/p`, and `P(coker = 0) = |GL_n(F_p)|/p^{n²} → c_{p,0}`.
- Wood 2019 Theorem 1.3 proves the same limit for any `ε-balanced` independent entries (universality); the Haar case is Friedman–Washington's.
- At `p=2,u=1,A=ℤ/2`, the limiting mass is `c_{2,1}/2`; both the column excess and the binary prime are retained.

<a id="friedman-washington-translation-form"></a>

**Friedman washington translation form.** `tendsto_translation_cokernelLaw`: let `ℓ` be prime. For `F ∈ End_g(ℤ_ℓ) = M_g(ℤ_ℓ)` Haar-random, `P(coker(1 − F) ≅ A) → μ_{ℓ,0}(A)` as `g → ∞`, for every finite abelian ℓ-group `A`.

The map `F ↦ 1 − F` is a measure-preserving homeomorphism of `M_g(ℤ_ℓ)` (Haar measure is invariant under translation and under negation), so `coker(1 − F)` has the law of `coker(F)`. Apply [friedman washington cokernel law](#friedman-washington-cokernel-law) with `u = 0`.

*Needs:* [friedman washington cokernel law](#friedman-washington-cokernel-law), `MeasureTheory.Measure.addHaarMeasure` (Mathlib).

([[45]](#ref-45), arXiv 1511.02212v1, §5.7.1, p. 35.)

**Checks.**

- `g = 1: P(coker(1 − F) = 0) = P(F ≢ 1 mod ℓ)` `= 1 − 1/ℓ`.
- Lipnowski–Tsimerman use this as the model for `A(F_p)_ℓ = coker(1 − Frob | T_ℓ A)`.
- At `ℓ=2,g=1`, the mass of `ℤ/2` is `P(v₂(1−F)=1)=1/4`; translating the matrix preserves this finite-level mass as well as the limit.

<a id="cohen-lenstra-measure-over-a-finite-set-of-primes"></a>

**Cohen lenstra measure over a finite set of primes.** For a finite set `S` of primes and `u ≥ 0, CL_{S,u}` is the product measure on tuples `(A_ℓ)_{ℓ∈S}` of classes of finite abelian ℓ-groups: `CL_{S,u}((A_ℓ)) = ∏_{ℓ∈S} μ_{ℓ,u}(A_ℓ)`. A finite abelian group `H` supported at `S` is identified with the tuple of its ℓ-primary parts; `CL_S = CL_{S,0}` is Lipnowski–Tsimerman's measure.

Required definitions and properties:

- `CL_{S,u}((A_ℓ)) = ∏_{ℓ∈S} μ_{ℓ,u}(A_ℓ)`.
- `CL_{S,u}` has total mass 1.
- For `S = {ℓ}, CL_{S,u} = μ_{ℓ,u}`.
- For `S = ∅` the measure is the point mass 1.

Define the product of the `μ_{ℓ,u}` over `ℓ ∈ S`. Total mass one: the product of the mass formulas (finite product of HasSum).

*Needs:* [cohen lenstra measure](#cohen-lenstra-measure), [cohen lenstra mass formula](#cohen-lenstra-mass-formula).

([[45]](#ref-45), arXiv 1511.02212v1, §5.7.1, p. 35.)

**Checks.**

- For `S = {3, 5}`: mass of `(ℤ/3, 0) = μ_3(ℤ/3)·μ_5(0)`.
- For `S = ∅` every (empty) tuple has mass 1.
- For `S = {3}` the trivial tuple has mass `c_{3,0}`.
- Independence of the ℓ-parts is built in; it is the content Lipnowski–Tsimerman add.

### 3.7 Finite-field kernel laws

<a id="matrix-kernel-law-over-a-finite-field"></a>

**Matrix kernel law over a finite field.** For a finite field `F` and `m, n, j ≥ 0, P_F(m, n, j)` is the probability that a uniformly random `m × n` matrix over `F` has right kernel (in `F^n`) of dimension `j: P_F(m, n, j) = #{M ∈ M_{m×n}(F) : dim ker M = j}/|F|^{mn}`. Koymans–Pagano's `P(m, n, j)` is `P_{𝔽₂}(m, n, j)`.

Required definitions and properties:

- `matrixKernelLaw`: `P_F(m, n, j)` as a rational number.
- `Σ_{j=0}^{n} P_F(m, n, j) = 1`.
- `P_F(m, n, j) = 0` unless `n − m ≤ j ≤ n`.
- `P_F(n, n, 0) = |GL_n(F)|/|F|^{n²}` (Mathlib `Matrix.card_GL_field`).

Define the ratio of the cardinality of the subtype of matrices with finrank of ker (mulVecLin `M) = j` to `|F|^{mn} (Matrix.card_matrix)`. The events for `j = 0`, …, `n` partition `M_{m×n}(F)` (rank–nullity).

*Needs:* `Matrix.mulVecLin` (Mathlib), `LinearMap.ker` (Mathlib), `Module.finrank` (Mathlib), `Matrix.card_matrix` (Mathlib).

([[41]](#ref-41), arXiv 2201.13424v1, §8, p. 75; [[42]](#ref-42), arXiv 2005.14157v2, §6, p. 30.)

**Checks.**

- `P_{𝔽₂}(1, 1, 0) = P_{𝔽₂}(1, 1, 1) = 1/2`.
- `P_{𝔽₂}(2, 2, ·) = (6/16, 9/16, 1/16)`.
- `P_{𝔽₂}(0, 0, 0) = 1`.

<a id="rank-count-of-matrices-over-a-finite-field"></a>

**Rank count of matrices over a finite field.** `matrix_rank_count`: for a finite field `F` with `q` elements and `r ≤ min(m, n), #{M ∈ M_{m×n}(F) : rank M = r} = ∏_{i=0}^{r−1} (q^m − q^i)(q^n − q^i)/(q^r − q^i) = [m choose r]_q ∏_{i=0}^{r−1}(q^n − q^i)`. Hence, for `n − min(m,n) ≤ j ≤ n, P_F(m, n, j) = q^{−mn} ∏_{i=0}^{n−j−1} (q^m − q^i)(q^n − q^i)/(q^{n−j} − q^i)`. Outside that range `P_F(m,n,j)=0`.

A rank-r matrix is determined by its column space `W ⊆ F^m (dim r)` and a surjective linear map `F^n ↠ W`. The number of r-dimensional subspaces is the Gaussian binomial `[m choose r]_q` ([gaussian binomial coefficient](#gaussian-binomial-coefficient)). Surjections `F^n ↠ F^r` are counted by choosing `r` linearly independent rows: `∏_{i<r}(q^n − q^i)` (as in Mathlib `Matrix.card_GL_field / card_linearIndependent`).

*Needs:* [matrix kernel law over a finite field](#matrix-kernel-law-over-a-finite-field), [gaussian binomial coefficient](#gaussian-binomial-coefficient), `Matrix.card_GL_field` (Mathlib), `Matrix.rank` (Mathlib).

([[42]](#ref-42), arXiv 2005.14157v2, §6, p. 30.)

**Checks.**

- `r = n = m: |GL_n(F_q)|`.
- `q = 2, m = n = 2, r = 1: (4 − 1)(4 − 1)/(2 − 1)` `= 9`.
- At `m=n=r=0` the unique empty matrix has rank zero and the empty product is 1.

<a id="symmetric-matrix-kernel-law"></a>

**Symmetric matrix kernel law.** For a finite field `F` and `r, n ≥ 0, P_Sym,F(r, n)` is the probability that a uniformly random symmetric `r × r` matrix over `F` has kernel of dimension `n: #{M = M^T ∈ M_r(F) : dim ker M = n}/|F|^{r(r+1)/2}`. Koymans–Pagano's `P_Sym(r, n)` is `P_Sym,𝔽₂(r, n)`.

Required definitions and properties:

- `symmetricKernelLaw`: `P_Sym,F(r, n)` as a rational number.
- `Σ_{n=0}^{r} P_Sym,F(r, n) = 1`.
- `P_Sym,F(r, r) = |F|^{−r(r+1)/2}`.
- `P_Sym,F(r, n) = 0` for `n > r`.
- `tendsto_symmetricKernelLaw`: Over `𝔽₂, P_Sym(r, n) → ∏_{j odd}(1 − 2^{−j})/∏_{i=1}^{n}(2^i − 1)`.

Symmetric matrices are determined by their `r(r+1)/2` entries on and above the diagonal, so there are `|F|^{r(r+1)/2}` of them. Define the ratio; the events for `n = 0`, …, `r` partition the symmetric matrices.

*Needs:* `Matrix.IsSymm` (Mathlib), `Matrix.mulVecLin` (Mathlib), `LinearMap.ker` (Mathlib), `Module.finrank` (Mathlib).

([[41]](#ref-41), arXiv 2201.13424v1, §7.3, p. 74.)

**Checks.**

- Over `𝔽₂: P_Sym(2, 0) = 4/8, P_Sym(2, 1) = 3/8, P_Sym(2, 2) = 1/8`.
- `P_Sym(0, 0) = 1`.
- `P_{𝔽₂}(2, 2, 0) = 3/8 < 1/2 = P_Sym(2, 0)`: the law of all matrices is not the symmetric law.
- `P_Sym,𝔽₂(r, r) = 2^{−r(r+1)/2}` (only the zero matrix).

<a id="koymans-pagano-rank-identity"></a>

**Koymans pagano rank identity.** For every `m ≥ 0: 1/(2^{m+1} − 1) = Σ_{n=0}^{m} (1/(2^{n+1} − 1)) · P(m, m, n)/2^m`, with `P(m, m, n) = P_{𝔽₂}(m, m, n)`.

Required definitions and properties:

- `koymansPaganoRankIdentity`: For `m>=0`, sum over `n=0,...,m` of `P_F2(m,m,n)/(2^m (2^(n+1)-1))` equals `1/(2^(m+1)-1)`.

Use the normalized kernel-weight identity below; the independent-(T,U) conditioning identity in the source fails the stated `m=1` check. Let `V=𝔽₂^(m+1), W=𝔽₂^m`, and `U` range uniformly over all linear maps `V -> W` (equivalently pairings `V x W^dual -> 𝔽₂`). Rank-nullity makes `K_U=ker U` nonzero, including `m=0`. For nonzero `x` in `V` put `w_x(U)=1/(#K_U-1)` if `x` is in `K_U`, and zero otherwise. For each `U`, summing `w_x(U)` over all nonzero `x` gives exactly 1. Average this finite identity over `U`. If `g` is an automorphism of `V, U -> U` composed with `g^(-1)` permutes the set of maps and carries `K_U` to `g(K_U)`, preserving its cardinality. Any nonzero x,y can be extended to bases and carried to one another by such a `g`. Therefore `E_U[w_x(U)]` is constant in nonzero `x`; its value is `1/(2^(m+1)-1)`. This is the law obtained by sampling `U` uniformly and then a nonzero vector of its kernel uniformly, not by sampling pairs (U,x) uniformly. For a fixed nonzero `x`, choose a basis beginning with `x`. The event `U(x)=0` has probability `2^(-m)`. Conditional on it, `U` factors through `V/<x>` and the remaining `m` by `m` block is uniformly random. If that block has kernel dimension `n`, then `dim K_U=n+1`; hence `P(x in K_U and dim K_U=n+1)=2^(-m)` `P(m,m,n)`. Partition the weighted sum defining `E_U[w_x(U)]` by `n=0,...,m`. On the corresponding event the weight is `1/(2^(n+1)-1)`. Substituting the preceding event counts proves the displayed identity for every `m>=0`. Check `m=0` separately as a degenerate normalization test: there is one map `𝔽₂ -> 0` and its kernel has one nonzero vector, so both sides are 1.

*Needs:* [matrix kernel law over a finite field](#matrix-kernel-law-over-a-finite-field), [rank count of matrices over a finite field](#rank-count-of-matrices-over-a-finite-field).

([[41]](#ref-41), arXiv 2201.13424v1, §8, p. 76; [[42]](#ref-42), arXiv 2005.14157v2, Appendix A.1, pp. 47–48.)

**Checks.**

- At `m=1`, `(1/2 + 1/6)/2 = 1/3`.
- At `m=2`, `(6/16 + (1/3)(9/16) + (1/7)(1/16))/4 = 1/7`.
- For `0≤m≤11` the rational rank-count products satisfy the identity; at `m=0` the unique matrix is empty.
- `m=0`: both sides equal 1; the kernel weight denominator is `#ker U` - `1=1`, not zero.
- `m=3: P(3,3,n)=(168,294,49,1)/512`, and the weighted sum is `1/15`.
- Counterexample to the source conditioning argument: for `m=1`, independent uniform `T:𝔽₂^2` onto `𝔽₂` and `U:𝔽₂^2 -> 𝔽₂` give `P(x in ker T)=1/3` but `sum_n P(x in ker T | A_(n,x))` `P(A_(n,x))=1/6`, since the union of `A_(n,x)` is only `U(x)=0`.
- The specified probability uses a uniform `U` followed by a uniform nonzero kernel vector; uniform sampling of all pairs (U,x in `ker U` minus `{0}`) is a different measure. At `m=1` the zero map has probability `1/4` in the former law and `1/2` in the latter.

### 3.8 Symmetric border-rank recurrences

<a id="symmetric-image-obstruction"></a>

**Symmetric image obstruction.** For a field `F, n ≥ 0`, a symmetric matrix `S` in `M_n(F)`, and `v` in `F^n, v` belongs to `im S` if and only if `v·z = 0` for every `z` in `ker S`. The pairing is the ordinary bilinear coordinate dot product, without conjugation.

If `v=Sx` and `Sz=0`, symmetry gives `v·z=x·Sz=0`. For the converse use the native dual-annihilator criterion for `W=im S`. Every functional `φ` vanishing on `W` is a dot product `z·(−)`: take `z_i=φ(e_i)` and expand with the coordinate basis and its finite reconstruction theorem. Vanishing on each `S e_i` says `Sᵀz=0`, hence `Sz=0` by symmetry. The assumed annihilation gives `φ(v)=z·v=0`. The dual-annihilator criterion implies `v∈W`. This argument does not identify bilinear forms with quadratic forms and uses no division by two.

*Needs:* `Matrix.IsSymm` (Mathlib), `Matrix.mulVecLin` (Mathlib), `Subspace.forall_mem_dualAnnihilator_apply_eq_zero_iff` (Mathlib), `Pi.basisFun` (Mathlib), `Pi.basisFun_repr` (Mathlib), `Module.Basis.sum_repr` (Mathlib).

([[52]](#ref-52), §4, First Proof (J. MacWilliams), printed p. 355, equations (4.2)–(4.3).)

**Checks.**

- For `S=0`, the criterion gives `v=0`.
- For the alternating plane `S=[[0,1],[1,0]]` over `𝔽₂`, every column lies in the image.
- At `n=0` the image and kernel are the zero space, and the unique vector satisfies the criterion.

<a id="symmetric-border-rank-in-image"></a>

**Symmetric border rank in image.** For a field `F` and symmetric `S` in `M_n(F)`, let `x∈F^n, v=Sx, a∈F`, and `B=[[S,v],[vᵀ,a]]` on `F^n⊕F`. Then `rank B = rank S` if `a=x·Sx`, and `rank B = rank S+1` otherwise, equivalently `rank S` plus the indicator of `a≠x·Sx`.

Put `c=a−x·Sx`. The invertible coordinate change `(y,t)↦(y+tx,t)` identifies `ker B` with `ker S × {t∈F : ct=0}`. Indeed `B(y,t)=0` is equivalent to `S(y+tx)=0` and `ct=0`, since `vᵀy=xᵀSy`. When `c=0` the second factor is `F` and adds one to the kernel dimension; when `c≠0` it is zero-dimensional. Use native finrank invariance, the product-dimension identity and rank-nullity in dimension `n+1`. The scalar `x·Sx` is independent of the chosen preimage of `v`: two preimages differ by an element of `ker S` and `v` annihilates that kernel.

*Needs:* [symmetric image obstruction](#symmetric-image-obstruction), `Matrix.fromBlocks` (Mathlib), `Matrix.rank` (Mathlib), `LinearMap.finrank_range_add_finrank_ker` (Mathlib), `LinearEquiv.finrank_eq` (Mathlib), `Module.finrank_prod` (Mathlib), `Module.finrank_fin_fun` (Mathlib).

([[52]](#ref-52), §4, First Proof (J. MacWilliams), printed p. 355, equations (4.2)–(4.3).)

**Checks.**

- `S=0` and `x=0` give `rank B=0` for `a=0` and `rank B=1` for `a≠0`.
- For an alternating `S` over characteristic two, `x·Sx=0`; the same formula remains valid.
- Over `𝔽₂`, `S=[1],x=1` gives border rank 1 at `a=1` and rank 2 at `a=0`.

<a id="symmetric-border-rank-outside-image"></a>

**Symmetric border rank outside image.** For a field `F`, a symmetric matrix `S` in `M_n(F), v∈F^n` outside `im S`, and every `a∈F`, the symmetric border `B=[[S,v],[vᵀ,a]]` has `rank S+2`.

The top block equation `Sy+tv=0` forces `t=0`, since a nonzero `t` would put `v` in `im S`. Thus `ker B` is linearly isomorphic to `{y∈ker S : v·y=0}` via `y↦(y,0)`. The image-obstruction lemma says `y↦v·y` is a nonzero linear functional on `ker S`. Apply the native codimension-one kernel theorem to this restricted functional. Rank-nullity for `S` and `B` now gives `rank B=(n+1)−(dim ker S−1)=rank S+2`. The nonzero restricted functional also ensures dim `ker S≥1`, so no negative dimension or truncated subtraction is used.

*Needs:* [symmetric image obstruction](#symmetric-image-obstruction), `Matrix.fromBlocks` (Mathlib), `Matrix.rank` (Mathlib), `Module.Dual.finrank_ker_add_one_of_ne_zero` (Mathlib), `LinearMap.finrank_range_add_finrank_ker` (Mathlib), `LinearEquiv.finrank_eq` (Mathlib), `Module.finrank_fin_fun` (Mathlib).

([[52]](#ref-52), §4, First Proof (J. MacWilliams), printed p. 355, equations (4.2)–(4.3).)

**Checks.**

- For `n=1,S=0,v=1`, the border `[[0,1],[1,a]]` has rank two for every a, including in characteristic two.
- An invertible `S` admits no column outside its image.
- At `n=0` no outside-image column exists; the rank-two case has no instances.

<a id="symmetric-border-rank-fibers"></a>

**Symmetric border rank fibers.** Let `F` have `q` elements and `S∈M_n(F)` be symmetric of `rank r`. For every `k≥0`, the number of pairs `(v,a)∈F^n×F` for which `[[S,v],[vᵀ,a]]` has `rank k` is `q^r` if `k=r; (q−1)q^r` if `k=r+1; q^(n+1)−q^(r+1)` if `k=r+2`; and zero otherwise. The diagonal entry a is unrestricted.

The image of `S` has `q^r` elements by the native finite-vector-space cardinality theorem and the definition of `Matrix.rank`. For each column in the image the in-image rank lemma gives exactly one corner preserving rank and `q−1` other corners increasing it by one. Count columns `v`, not preimages `x`; the invariant corner value was proved independent of the preimage. There are `q^n−q^r` columns outside the image, and every one of their `q` corners increases rank by two. The outside-image rank lemma excludes all other ranks. The bound `r≤n` ensures each natural subtraction is exact. Sum the disjoint finite fibers.

*Needs:* [symmetric border rank in image](#symmetric-border-rank-in-image), [symmetric border rank outside image](#symmetric-border-rank-outside-image), `Matrix.rank` (Mathlib), `Module.natCard_eq_pow_finrank` (Mathlib), `Nat.card_congr` (Mathlib), `Nat.card_sigma` (Mathlib), `Matrix.rank_le_width` (Mathlib).

([[52]](#ref-52), §4, First Proof (J. MacWilliams), printed p. 355, equations (4.2)–(4.3).)

**Checks.**

- The three counts sum to `q^(n+1)`.
- For `q=2,n=2,S=0` they are 1,1,6.
- For `q=3,n=2,r=1` they are 3,6,18.
- If `r=n` the rank-two fiber is empty.

<a id="symmetric-rank-count-recurrence"></a>

**Symmetric rank count recurrence.** Let `F` have `q` elements, and let `N_F(n,k)` count symmetric matrices in `M_n(F)` of `rank k`, using the existing native finite subtype. Define the numerical coefficient `c_q(n,r,k)` to be `q^r` when `k=r, (q−1)q^r` when `k=r+1, q^(n+1)−q^(r+1)` when `k=r+2`, and zero otherwise. Then for every `n,k≥0, N_F(n+1,k)=Σ_{r=0}^n N_F(n,r)c_q(n,r,k)`. This notation introduces no new carrier or separately defined library object.

Reindex `Fin(n+1)` by `Fin n` plus a singleton. Reading the principal block, the extra column and the corner is a bijection from symmetric matrices to triples (S,v,a); writing the symmetric block matrix is its inverse. Native reindexing preserves rank. Group the finite count first by the principal block `S` and then by its `rank r`, using the native dependent-sum cardinality theorem. Every rank lies in 0,…,n by the native width bound. Substitute the border-fiber formula. The sum version states the boundary cases without negative rank indices or negative exponents; for `2≤k≤n+1` it becomes `N_F(n+1,k)=q^kN_F(n,k)+(q−1)q^(k−1)N_F(n,k−1)+(q^(n+1)−q^(k−1))N_F(n,k−2)`.

*Needs:* [symmetric border rank fibers](#symmetric-border-rank-fibers), `Matrix.IsSymm` (Mathlib), `Matrix.fromBlocks` (Mathlib), `Nat.card_congr` (Mathlib), `Nat.card_sigma` (Mathlib), `Matrix.rank_reindex` (Mathlib), `Matrix.rank_le_width` (Mathlib).

([[52]](#ref-52), §4, First Proof (J. MacWilliams), printed p. 355, equations (4.2)–(4.3).)

**Checks.**

- `N_F(0,0)=1` and `N_F(0,k)=0` for `k>0`.
- At `q=2` the first rows are (1), (1,1), (1,3,4), (1,7,28,28).
- At `q=3,n=2` the row is (1,8,18).

<a id="symmetric-rank-product-recurrence"></a>

**Symmetric rank product recurrence.** For natural `q≥2` and `s,t≥0`, let `P_q(s,t)=[∏_{i=1}^{⌊t/2⌋} q^(2i)/(q^(2i)−1)]·∏_{i=0}^{t−1}(q^(s−i)−1)`, interpreted in `ℚ`; natural `s−i` is truncated at zero. Thus `P_q(s,0)=1` and `P_q(s,t)=0` for `t>s`. With `c_q(n,r,k)` as in symmetric-rank-count-recurrence, `P_q(n+1,k)=Σ_{r=0}^n P_q(n,r)c_q(n,r,k)` for all `n,k≥0`. `P` is local mathematical notation for the displayed expression, not a new library definition.

All denominators `q^(2i)−1` are nonzero since `i≥1` and `q≥2`. Empty products give the `k=0` case. For `k=1` use `q(q^n−1)+(q−1)=q^(n+1)−1`, with the empty-size boundary included. For `2≤k≤n+1` put `D=P_q(n,k−2), a=q^(k−1), t=q^(n−k+2)`. Cancel the common nonzero `D`. If `k` is even put `C=qa/(qa−1)`. The ratios `P_q(n,k)/D, P_q(n,k−1)/D` and `P_q(n+1,k)/D` are respectively `C(t−1)(t/q−1), t−1` and `C(at−1)(t−1)`. The recurrence reduces to `qa·C(t−1)(t/q−1)+(q−1)a(t−1)+a(t−1)=C(at−1)(t−1)`. If `k` is odd, `k≥3`; put `C=a/(a−1)`. The same three ratios are `C(t−1)(t/q−1), C(t−1)` and `C(at−1)(t−1)`. The reduced identity is `qa·C(t−1)(t/q−1)+(q−1)a·C(t−1)+a(t−1)=C(at−1)(t−1)`. Both identities follow after multiplying by their displayed nonzero denominators and ordinary polynomial algebra. When `k=n+2` the only possibly contributing term is `r=n`, whose coefficient `q^(n+1)−q^(n+1)` is zero. For `k>n+2` there are no contributing terms. The factor with `i=s` makes every `P_q(s,k)` with `k>s` vanish, so these cases agree with the left side. Cast the natural coefficients to `ℚ` using `r≤n` before distributing subtraction.

*Needs:* `Finset.prod` (Mathlib), `Nat.choose` (Mathlib).

([[52]](#ref-52), §4, First Proof (J. MacWilliams), printed p. 355, equations (4.2)–(4.3).)

**Checks.**

- The identity holds for all integer `q≥2`, independently of whether `q` is a prime power.
- The `k=n+1` boundary has `t=q` and the `P_q(n,k)` factor vanishes; no division by `q^0−1` occurs.
- At `n=0, k=0,1` and `k≥2` it yields `1,q−1` and 0.

### 3.9 Symmetric kernel limit

<a id="macwilliams-symmetric-rank-count"></a>

**Macwilliams symmetric rank count.** `macwilliams_symmetric_rank_count`: for a finite field `F` with `q` elements and `0 ≤ k ≤ s`, writing `k = 2h` or `2h + 1`, the number of symmetric `s × s` matrices of `rank k` is `N(s, k) = ∏_{i=1}^{h} q^{2i}/(q^{2i} − 1) · ∏_{i=0}^{k−1} (q^{s−i} − 1)`.

Use the native subtype count `N_F(n,k)`, with `N_F(0,0)=1` and `N_F(0,k)=0` for `k>0`: the empty matrix is unique and its image has dimension zero. For `k>n` the count is zero by the native rank-width bound. The characteristic-free symmetric-rank-count-recurrence gives every next row from the preceding row; its finite sum also covers `k=0,1` and `k>n+1`. The rational product has the same initial row and satisfies symmetric-rank-product-recurrence. Induction on `n`, simultaneously for every `k`, equates the natural count cast to `ℚ` with the product. Specialize to `k≤s` and write `k=2h` or `2h+1` to obtain the stated product. Characteristic two uses precisely the same border kernels; alternating matrices are included with their unrestricted symmetric-matrix companions.

*Needs:* [symmetric rank count recurrence](#symmetric-rank-count-recurrence), [symmetric rank product recurrence](#symmetric-rank-product-recurrence), `Matrix.rank_le_width` (Mathlib), `Matrix.rank_zero` (Mathlib), `Fintype.one_lt_card` (Mathlib).

([[43]](#ref-43), arXiv 2509.10332, §1, p. 3; [[41]](#ref-41), arXiv 2201.13424v1, proof of Theorem 7.13, p. 74; [[52]](#ref-52), §4, First Proof (J. MacWilliams), p. 355, equations (4.2)–(4.3).)

**Checks.**

- `q = 2, s = 2: N = 1`, 3, 4 for `k = 0`, 1, 2.
- The finite subtype counts equal the product over `𝔽₂` through size `5, 𝔽₃` through size 4 and `𝔽₄,𝔽₅,𝔽₇,𝔽₈` through size 3; at size 1 the rank-zero and rank-one counts are 1 and `q−1`.
- The empty-size count is one at rank zero and zero at positive ranks; the characteristic-two alternating plane is included.

<a id="euler-q-binomial-sum"></a>

**Euler q-binomial sum.** For real `0<q<1`, prove convergence of the nonnegative series and infinite product in `Σ_{n≥0} q^{n(n+1)/2}/∏_{i=1}^n(1−q^i) = ∏_{i≥1}(1+q^i)`.

Apply the finite Cauchy identity at `t=z=q`. Extend its summands by zero for `n>N`. For each fixed n the Gaussian product formula shows that `[N n]_q` increases to `1/∏_{i=1}^n(1−q^i)` as `N→∞`. The extended summands are nonnegative and increasing, so monotone convergence for counting measure interchanges their limit and sum. The geometric series `Σ_{i≥1}q^i` converges, giving convergence of the product `∏_{i≥1}(1+q^i)` and hence finiteness of the series. At `q=1/2` this supplies the normalization of the symmetric kernel limit.

*Needs:* [cauchy q binomial theorem](#cauchy-q-binomial-theorem), [gaussian binomial coefficient](#gaussian-binomial-coefficient), `MeasureTheory.lintegral_iSup` (Mathlib), `MeasureTheory.lintegral_count` (Mathlib), `Real.multipliable_one_add_of_summable` (Mathlib), `tsum_geometric_of_lt_one` (Mathlib).

([[28]](#ref-28), Proposition 2.6(e)–(f) and proof, p. 7.)

**Checks.**

- The `n=0` summand is 1, with an empty denominator product; the finite identity at `N=0` has both sides 1.
- At `q=1/2` the first four summands are `1,1,1/3,1/21`, with sum `50/21`.
- The endpoint `q=1` is excluded: already the `n=1` denominator vanishes and the partial products are `2^N`.

<a id="limit-of-the-symmetric-kernel-law"></a>

**Limit of the symmetric kernel law.** `tendsto_symmetricKernelLaw`, `symmetricKernelLaw_error` and `hasSum_symmetricKernelLimit`: over `𝔽₂`, for every `n ≥ 0: lim_{r→∞} P_Sym(r, n) = P_Sym(∞, n) := ∏_{j≥0}(1 − 2^{−(2j+1)}) / ∏_{i=1}^{n}(2^i − 1)`, and `|P_Sym(r, n) − P_Sym(∞, n)| ≤ 2^{n+1−r}` for all `r ≥ 1`. The limits sum to 1.

If `r=n=0`, the finite mass is 1 and the limiting mass lies in `[0,1]`, so the error is at most `1≤2`. If `n>r`, the finite kernel mass is zero and the target limit lies in `[0,1]`, while `2^{n+1−r}≥1`, so the stated bound is immediate. Assume henceforth `n≤r`. By [macwilliams symmetric rank count](#macwilliams-symmetric-rank-count) with `k = r − n = 2h` or `2h + 1: P_Sym(r, n) = 2^{−n(n+1)/2} ∏_{i=1}^{h}(1 − 2^{−2i})^{−1} ∏_{j=n+1}^{r}(1 − 2^{−j})` (the exponent kr − `k(k−1)/2 − r(r+1)/2` simplifies to `−n(n+1)/2`). Letting `r → ∞: P_Sym(∞, n) = 2^{−n(n+1)/2}∏_{i≥1}(1 − 2^{−2i})^{−1}∏_{j≥n+1}(1 − 2^{−j}) = ∏_{j odd}(1 − 2^{−j})/∏_{i=1}^{n}(2^i − 1)`. Rate: `P_Sym(r, n) = P_Sym(∞, n)·R` with R `= ∏_{i>h}(1 − 2^{−2i})/∏_{j>r}(1 − 2^{−j})`; since `2h + 2 ≥ r − n + 1, 1 − (2/3)2^{n−r} ≤` R `≤ 1 + 2^{1−r}`, and `P_Sym(∞, n) ≤ 1`. Explicitly, the omitted even-factor tail is at most `(4/3)2^{−2h−2}≤(2/3)2^{n−r}`; the denominator tail is at least `1−2^{−r}`, and `(1−2^{−r})⁻¹≤1+2^{1−r}` for `r≥1`. `Σ_n P_Sym(∞, n) = ∏_{j odd}(1 − 2^{−j}) Σ_n 2^{−n(n+1)/2}/∏_{i≤n}(1 − 2^{−i}) = ∏_{j odd}(1 − 2^{−j})∏_{i≥1}(1 + 2^{−i}) = 1` by [euler q-binomial sum](#euler-q-binomial-sum) at `q=1/2` and cancellation of the even and odd factors of the convergent nonzero Euler product.

*Needs:* [macwilliams symmetric rank count](#macwilliams-symmetric-rank-count), [symmetric matrix kernel law](#symmetric-matrix-kernel-law), [euler q-binomial sum](#euler-q-binomial-sum), [cauchy q binomial theorem](#cauchy-q-binomial-theorem), [gaussian binomial coefficient](#gaussian-binomial-coefficient), `tsum_geometric_of_lt_one` (Mathlib).

([[41]](#ref-41), arXiv 2201.13424v1, Theorem 7.13, p. 74.)

**Checks.**

- `P_Sym(∞, 0) = α = ∏_{j odd}(1 − 2^{−j}) ≈ 0.41942`, the constant of Stevenhagen's conjecture.
- `r = 2, n = 0: |1/2 − 0.4194| ≈ 0.081 ≤ 1/2`; numerically the ratio of the error to `2^{n+1−r}` stays below 0.17 for `r ≤ 40`.
- Normalization at `q=1/2` uses `∏_{i≥1}(1+q^i)=∏_{i≥1}(1−q^{2i})/∏_{i≥1}(1−q^i)`; splitting the nonzero denominator product into its even and odd factors makes the total mass 1.

### 3.10 Four-rank phases and good subspaces

<a id="prime-power-class-group-rank"></a>

**Prime power class group rank.** For a finite abelian group `A`, a prime `p` and `k≥1, rk_{p^k}(A)=log_p #((A^{p^{k−1}})[p])`; equivalently it is `dim_Fp(A^{p^{k−1}}/A^{p^k})`. The cardinal form avoids choosing an elementary-abelian module instance. `rk₄` means `p=2,k=2`, and for a real quadratic field the primary input is `A=Cl⁺(K)`.

`A` is a finite commutative group; `p` is prime; `k≥1`.

Required definitions and properties:

- The integer `log_p` of the cardinal of p-torsion inside `p^{k−1}`-th powers.
- For `k≥1, rk_{p^k}(A)=log_p # (A^{p^{k−1}}/A^{p^k})`.
- A group isomorphism preserves every prime-power rank.
- Prime-power rank is additive on finite direct products.
- For `k≥1, rk_{p^{k+1}}(A)≤rk_{p^k}(A)`.
- For `p=2,k=1, 2^{rk₂(A)}` equals the cardinal of `A/A²`; for `A=Cl(K)`, use `TauCeti.ClassGroup.ElementaryTwoQuotient`.

Take the image of the power homomorphism, then its p-torsion. Finite abelian group structure identifies the resulting cardinal with a power of p. Relate the cardinal to the adjacent quotient; the p-power factor decomposition gives the rank, and the existing elementary-two quotient supplies the `k=1` comparison.

*Needs:* [torsion count of class groups](#torsion-count-of-class-groups), `NumberField.NarrowClassGroup` (Tau Ceti), `NumberField.NarrowClassGroup.instFinite` (Tau Ceti), `TauCeti.ClassGroup.ElementaryTwoQuotient` (Tau Ceti), `TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_card_twoTorsion` (Tau Ceti).

([[90]](#ref-90), §1, p. 1; §3.2, Lemma 9, p.11.)

**Checks.**

- `rk₄(C₂)=0`; elementary two-torsion alone must not be counted as 4-rank.
- `rk₄(C₄)=1`.
- `rk₈(C₈)=1` and `rk₁₆(C₈)=0`.
- Every prime-power rank of the trivial group is zero.

<a id="fk-linking-phase"></a>

**FK linking phase.** On `E_k=(𝔽₂²)^k` put `Φ_k(u,v)=Σ_j(u_{j,1}+v_{j,1})(u_{j,1}+v_{j,2})`. Two indices are linked exactly when `Φ_k(u,v)+Φ_k(v,u)=1`. Set `P_k(w)=Σ_j w_{j,1}(w_{j,1}+w_{j,2})`; then linkage equals `P_k(u+v)`. These are `𝔽₂`-valued expressions; exponents in a Jacobi-symbol product use their representatives 0,1.

Required definitions and properties:

- `FieldStatistics.FKSpace`: the coordinate carrier `Fin k → 𝔽₂×𝔽₂`; its cardinality is `4^k`, and coordinatewise linear operations are inherited.
- The `𝔽₂`-valued phase `Φ_k` on ordered pairs.
- The quadratic expression `P_k`.
- Linkage means `Φ_k(u,v)+Φ_k(v,u)=1`.
- `Φ_k(u,u)=0`.
- `Φ_k(u,v)+Φ_k(v,u)=P_k(u+v)`.
- Simultaneous translation `u↦u+c, v↦v+c` preserves linkage.

Expand each Jacobi factor of the first moment and raise to the kth power. Pairwise coprime squarefree factors provide the `(𝔽₂²)^k` indexing. Expand `Φ_k(u,v)+Φ_k(v,u)`, keeping the characteristic-two quadratic term as well as its alternating polar form.

*Needs:* `ZMod` (Mathlib), `Finset.sum` (Mathlib).

([[90]](#ref-90), §5.1–5.2, (20)–(27), pp.15–17.)

**Checks.**

- For `k=0` the phase and quadratic expression vanish, and no two indices are linked.
- FKSpace has cardinalities 1,4,16 at `k=0,1,2`; replacing pairs by single coordinates would give the wrong nonzero-dimensional values.
- For `k=1,u=(1,0),v=(0,0), Φ(u,v)=1` and `Φ(v,u)=0`.
- For `k=1,u=(1,1),v=0`, both ordered phases equal 1 but `u` and `v` are unlinked; `P(u)=0`.
- For `k=1,u=(0,1),v=(1,1)`, the indices are linked, although `P(u)=P(v)=0`. Thus linkage depends on `P(u+v)`, not on `P(u)+P(v)`.

<a id="fk-good-subspace-bijection"></a>

**FK good subspace bijection.** Define `FieldStatistics.fkGoodPlanes k` for `k≥0` as the set of k-dimensional subspaces of `E_k=𝔽₂^{2k}` on which the directed pairing `L` vanishes on every ordered pair. Here `L(u,v)=Σ_j u_{j,1}(v_{j,1}+v_{j,2})`. The k-dimensional subspaces `U` with `L|_{U×U}=0` are in bijection with all subspaces of `𝔽₂^k`. In the basis `b_{j,1}=e_{j,1}+e_{j,2}, b_{j,2}=e_{j,2}`, the bijection sends `F≤X=span(b_{j,1})` to `F⊕F^⊥≤X⊕Y`. Consequently their number is `N(k,2)`. If a nonempty `Γ⊆{1,…,k}` prescribes `Σ_{j∈Γ}(u_{j,1}+u_{j,2})=0`, or prescribes `Σ_{j∈Γ}u_{j,1}=0`, the number is `N(k−1,2)`.

The bijection also holds for `k=0`, when both carriers are singletons. The extra `Γ` constraints require `k≥1` and `Γ` nonempty. Good means the full nonsymmetric bilinear form vanishes, not merely its alternating symmetrization.

Required definitions and properties:

- `U` is good iff `dim U=k` and `L(u,v)=0` for every `u,v∈U`.
- The set is finite, as a subset of subspaces of the finite vector space `E_k`.
- `FieldStatistics.fk_good_subspace_bijection`: the displayed equivalence with subspaces of `𝔽₂^k`, including `k=0`.
- Its cardinality is `N(k,2)=∑_{d=0}^k [k d]_2`.
- `FieldStatistics.fkGoodPlanes_linear_constraint`: each of the two constraints for nonempty `Γ` has `N(k−1,2)` solutions for `k≥1`.

Use the displayed change of basis to express `L` as the perfect `X×Y` pairing. Projection of a good k-plane to `X` is `F`, and projection to `Y` lies in `F^⊥`. Dimensions force `U=F⊕F^⊥`. The extra linear constraint means respectively containing one nonzero vector or lying in one hyperplane; quotient or duality yields `N(k−1,2)`.

*Needs:* [fk linking phase](#fk-linking-phase).

([[90]](#ref-90), §5.7, Lemma 26 and its proof, pp.32–34.)

**Checks.**

- At `k=0` the zero subspace is the unique good plane, giving `N(0,2)=1`.
- At `k=1` precisely the lines spanned by (1,1) and (0,1) are good; the line spanned by (1,0) fails because `L((1,0),(1,0))=1`.
- At `k=2` there are five good planes, the number of subspaces of `𝔽₂²`. Vanishing only of `L(u,v)+L(v,u)` instead gives fifteen planes and fails this test.
- At `k=1,Γ={1}`, each extra linear constraint selects one of the two good lines, giving `N(0,2)=1`.

### 3.11 Analytic separation of group profiles

<a id="refinement-wood-grid-separator"></a>

**Wood grid separator.** For a prime `p` and an antitone nonnegative integer vector `b` of length `m+1`, set `S_i(b)=∑_{j≤i}b_j`. Define `H_b(z)=∏_{j≥b₀+1}(1−z₀/p^j) · ∏_{i=1}^m ∏_{j=S_i(b)+1}^{S_{i−1}(b)+b_{i−1}}(1−z_i/p^j)`. Empty finite products are `1`. `H_b` is entire, vanishes at `z_i=p^{S_i(f)}` for every antitone `f` lexicographically greater than `b`, and is nonzero at the grid point of `b`.

Required definitions and properties:

- The displayed product on the complex coordinate space.
- The separator is analytic on the whole coordinate space.
- At `z=0` the value is 1.
- When `m=0` only the one-variable infinite product remains.
- At the grid point of any antitone `f` lexicographically greater than `b`, the value is zero.
- At the grid point of the antitone `b` itself, the value is nonzero.

Use the infinite product only in coordinate zero, and finite polynomials in the other coordinates. At the first larger coordinate of `f`, identify a vanishing factor. Use absolute convergence and nonvanishing of all factors at `b` to separate the diagonal.

*Needs:* `tprod` (Mathlib), `HasProd` (Mathlib).

([[121]](#ref-121), Lemma 8.1 and proof, pp. 28–29.)

**Checks.**

- For `m=0,p=2,b=0,z=0` the value is 1.
- For `m=0,p=2,b=0,z=2` the value is zero.
- For `m=0,p=2,b=0,z=1` the value is nonzero.
- For `m=1,p=2,b=(2,0),z=(4,8)` the finite second-coordinate factor vanishes. At the diagonal point `z=(4,4)` it is nonzero: the first excluded exponent is 3. This detects an incorrect finite interval endpoint.
- For unrestricted natural p the convergence assertion fails: at `m=0,p=1,b=0,z=3` the head partial products are `(−2)^N` and do not converge.

<a id="refinement-wood-coefficient-bound"></a>

**Wood coefficient bound.** Let `p` be prime and `b∈ℕ^(m+1)` antitone. The separator `H_b` is entire and its Taylor coefficients `a_d` satisfy `|a_d|≤E_b p^(−b₀d₀−d₀(d₀+1)/2)` for one `E_b>0`; coefficients vanish unless `Σ_{i=1}^m d_i≤b₀−b_m (hence≤b₀)`. The head expansion gives the infinite-product head coefficient `c_n=(−1)^n p^(−b₀n)/∏_{j=1}^n(p^j−1)`. Absolute values are necessary for exchanging signed sums.

Prove locally uniform convergence of the head product on compact subsets of `ℂ`. Its functional equation `G(pz)=(1−z/p^b₀)G(z)` gives the exact coefficient recurrence. Bound the reciprocal product by `∏_{j≥1}(1−p^(−j))^(−1)` and multiply by the maximum absolute coefficient of the finite polynomial.

*Needs:* [wood grid separator](#refinement-wood-grid-separator).

([[121]](#ref-121), Lemma 8.1 and proof, pp. 28–29, strengthened absolute-value formulation used in Theorem 8.2.)

**Checks.**

- The first head coefficient is `−p^(−b₀)/(p−1)`, so the absolute-value estimate is essential rather than a positivity assertion.
- For a constant profile `b`, all finite intervals are empty: every coefficient with positive degree outside coordinate zero vanishes.
- For `m=1,b=(2,0)`, the finite factor has degree two and top coefficient `p^(−7)`; the support bound `b₀−b_m=2` is attained.

<a id="refinement-wood-subgroup-bound"></a>

**Wood subgroup bound.** There is an absolute `F>0` such that for every prime `p` and finite abelian p-group `G` of partition type `λ, Σ_{G₁≤G}|∧²G₁|≤F^(λ₁) p^(Σ_i λ′_i(λ′_i−1)/2)`, where `λ′` is the conjugate partition and `λ₁` is the exponent length. The trivial group contributes 1. For finitely many primes the bound factors over primary parts.

Use the exact subgroup count by conjugate partition, retaining the Gaussian-binomial denominators. Absorb their reciprocal Euler-product bounds into one absolute `F` per exponent layer. Complete the quadratic exponents and sum the resulting geometric Gaussian tails.

*Needs:* [isomorphism classes of finite abelian p groups](#isomorphism-classes-of-finite-abelian-p-groups), [gaussian binomial coefficient](#gaussian-binomial-coefficient), [exact surjection count formula](#exact-surjection-count-formula).

([[121]](#ref-121), Lemma 7.4 and proof, pp. 27–28.)

**Checks.**

- For `G=ℤ/p` the subgroup sum is 2 and the p-exponent in the bound is zero; the uniform constant must absorb that factor.

<a id="refinement-wood-grid-uniqueness"></a>

**Wood grid uniqueness.** `Distributions.wood_grid_uniqueness`: let `p₁,…,p_s` be distinct primes, `m_j≥1`, and `M` the product of antitone nonnegative integer profiles of lengths `m_j`. Let `x_µ,y_µ≥0` have finite equal exponential moments for every `λ∈M`, given by `C_λ=Σ_µ x_µ∏_j p_j^(Σ_i λ_ji µ_ji)=Σ_µ y_µ∏_j p_j^(Σ_i λ_ji µ_ji)`. Assume `C_λ≤∏_j F^(m_j)p_j^(Σ_i λ_ji(λ_ji−1)/2)` for some `F>0`. Then `x_µ=y_µ` for every `µ`. The finite-moment and summability hypotheses are part of the statement.

For each profile `ν` expand the product of grid separators in its Taylor coefficients. The absolute coefficient bound and moment growth make the interchange of the coefficient and mass sums absolutely convergent. Use well-founded lexicographic induction on the finite concatenation of the nonnegative integer profiles. Lexicographic order on a fixed finite power of `ℕ` is a well-order, and restricting to antitone profiles preserves well-foundedness. The triangular separator vanishes above the chosen profile; the absolutely convergent sum over lower profiles is already determined by induction.

*Needs:* [wood grid separator](#refinement-wood-grid-separator), [wood coefficient bound](#refinement-wood-coefficient-bound).

([[121]](#ref-121), Theorem 8.2 and proof, pp. 29–31.)

**Checks.**

- With no selected primes the profile carrier is a singleton and equality of the zero moment determines its mass.
- At one prime with length one and support in `{0,1}`, the zero and first moments give `x₀+x₁=y₀+y₁` and `x₀+p x₁=y₀+p y₁`; since `p>1` these determine both masses.
- For any selected primes and lengths, the unit mass at the zero profile has every moment equal to one and satisfies the bound with `F=1`.

<a id="refinement-wood-bounded-moment-limit"></a>

**Wood bounded moment limit.** `Distributions.wood_bounded_moment_limit`: let `a≥1` and `A_a` be finite abelian group classes of exponent dividing a. Let `X_n` be random finitely generated abelian groups and suppose `E#Sur(X_n,G)→M_G` for every `G∈A_a`, with `0≤M_G≤|∧²G|`. For every `H∈A_a, ℙ(X_n/aX_n≅H)` has a limit; these limiting masses sum to 1 and have the moments `M_G`. A second sequence with the same moments has the same limiting quotient law. The theorem concerns `X_n/aX_n`, not an unproved full-group limit.

Convert surjection moments to homomorphism moments by the finite sum over image subgroups; use the exterior-square subgroup bound. For each test type `λ` choose the dominating type with conjugate entries `2λ′_i+1`; the sum of homomorphism-count ratios is finite and controls tails. Extract subsequential masses on the countable exponent-bounded carrier, preserve moments by domination and apply grid uniqueness. The trivial-group moment fixes total mass 1; uniqueness upgrades subsequences to the whole sequence. For the all-p,u target, take `a=p^(e+1)` when the desired finite p-group `H` has exponent dividing `p^e`: the quotient is isomorphic to `H` exactly when the original finite p-group is `H`. This isolates its mass without assuming a full-group limit for arbitrary finitely generated groups.

*Needs:* [wood subgroup bound](#refinement-wood-subgroup-bound), [wood grid uniqueness](#refinement-wood-grid-uniqueness), [surjection count](#surjection-count), [surjection moment](#surjection-moment).

([[122]](#ref-122), Theorem 3.1, pp. 9–10; proof inputs Wood Lemma 7.4, Theorems 8.2–8.3, pp. 27–32.)

**Checks.**

- At `a=1` there is one quotient class, with mass 1. At `a=p²` the statement distinguishes `ℤ/p²` from `(ℤ/p)²`; it cannot use cardinality alone.

### Examples

The group-profile moment warning has a concrete witness: put mass `p^-n` on `(ℤ/p)^n` and the remaining mass on a fixed limiting law. The measures converge in total variation, but the extra `#Sur(-,ℤ/p)=p^n-1` contribution tends to one. Thus limiting probability masses cannot be substituted into unbounded surjection averages without a tail argument.

The light rank witnesses give power-image 2-rank zero for `C₂` at `k=2`, one for `C₄` at `k=2`, and one for both at `k=1`; the trivial group has rank zero. The FK coordinate spaces at `k=0,1,2` have cardinalities 1,4,16, and their good-plane counts are 1,2,5. For `k=1`, write `u=(1,0)`, `v=(1,1)`, `w=(0,1)`: `Φ(u,0)=1, Φ(0,u)=0, ℚ(u)=1, ℚ(v)=ℚ(w)=0; Φ(u,v)=Φ(v,u)=0`, so u,v are unlinked, whereas w,v are linked. At `k=0` the phase and quadratic form vanish and there is no link. Wood's one-coordinate separator at `p=2` vanishes above its target: `b=0` at `z=2` and `b=1` at `z=4`; it is nonzero on the two diagonal values `z=1` and `z=2` respectively.

### Dependencies

ArithmeticStatisticsPartI §0.1, arithmetic family, provides the family interface; this layer requires no invariant or counting theorem from Parts II–III. Finite group structure, submodules, Haar probability, infinite products and sums come from Mathlib; the torsion-cardinality comparison is the named Tau Ceti class-group contract. The Mathlib analytic interfaces justify the convergent Euler products and sums; AnalyticNumberTheoryPartI Layers 0–3 and AnalyticNumberTheoryPartII Layers 4–6 are not inputs to this layer; the discrete separators and group-valued moment bounds are the new targets here.

## Downstream consumers

The later arithmetic-statistics parts use the exact targets supplied here. Field and Selmer comparisons identify their family, height, equivalence relation and local weights before applying an arithmetic average. Probability convergence alone supplies no unbounded moment identity. The analytic inputs to arithmetic counting belong to AnalyticNumberTheoryPartI Layers 0–3 and AnalyticNumberTheoryPartII Layers 4–6.

## References

<a id="ref-5"></a>

[5] Manjul Bhargava, Arul Shankar and Jacob Tsimerman. [On the Davenport-Heilbronn theorems and second order terms](https://arxiv.org/abs/1005.0672). arXiv:1005.0672v3 (20 June 2012), 38 pp.; published in Inventiones Mathematicae 193 (2013), 439-499.

<a id="ref-20"></a>

[20] Manjul Bhargava, Arul Shankar and Xiaoheng Wang. [Geometry-of-numbers methods over global fields I: Prehomogeneous vector spaces](https://arxiv.org/abs/1512.03035). arXiv:1512.03035v2 (11 March 2026), 38 pp.

<a id="ref-21"></a>

[21] Melanie Matchett Wood. [Asymptotics for number fields and class groups](https://people.math.harvard.edu/~mmwood/Publications/ArithStats.pdf). In: Directions in Number Theory (Proceedings of the 2014 WIN3 Workshop), Association for Women in Mathematics Series 3, Springer, 2016, 291-339.

<a id="ref-22"></a>

[22] Etienne Fouvry and Juergen Kluners. [On the 4-rank of class groups of quadratic number fields](https://math.uni-paderborn.de/fileadmin-eim/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf). Inventiones Mathematicae 167 (2007), 455-513.

<a id="ref-25"></a>

[25] Alexander Smith. [The distribution of ℓ^∞-Selmer groups in degree ℓ twist families II](https://arxiv.org/pdf/2207.05143v2). arXiv:2207.05143v2 (8 February 2023).

<a id="ref-28"></a>

[28] Bjorn Poonen, Eric Rains. [Random maximal isotropic subspaces and Selmer groups](https://arxiv.org/pdf/1009.0287v2). arXiv:1009.0287v2 (12 April 2011); published J. Amer. Math. Soc. 25 (2012), 245–269.

<a id="ref-37"></a>

[37] Jordan S. Ellenberg, Akshay Venkatesh, Craig Westerland. [Homological stability for Hurwitz spaces and the Cohen-Lenstra conjecture over function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf). Annals of Mathematics 183 (2016), no. 3, 729–786 (published PDF); compared with arXiv 0912.0325v4 (1 Dec 2015).

<a id="ref-38"></a>

[38] Melanie Matchett Wood. [Random integral matrices and the Cohen Lenstra heuristics](https://arxiv.org/pdf/1504.04391). Amer. J. Math. 141 (2019), 383–398.

<a id="ref-39"></a>

[39] Pritam Majumder. [An elementary proof of a power series identity for the weighted sum of all finite abelian p-groups](https://arxiv.org/pdf/1407.3066). arXiv 1407.3066v1 (11 Jul 2014).

<a id="ref-40"></a>

[40] Christopher J. Hillar, Darren L. Rhea. [Automorphisms of finite abelian groups](https://arxiv.org/pdf/math/0605185). Amer. Math. Monthly 114 (2007), 917–923.

<a id="ref-41"></a>

[41] Peter Koymans, Carlo Pagano. [On Stevenhagen's conjecture](https://arxiv.org/pdf/2201.13424v1). arXiv 2201.13424v1 (31 Jan 2022); version used for the preprint page locators.

<a id="ref-42"></a>

[42] Peter Koymans, Carlo Pagano. [Higher Rédei reciprocity and integral points on conics](https://arxiv.org/pdf/2005.14157v2). arXiv 2005.14157v2 (14 May 2024).

<a id="ref-43"></a>

[43] Badriah Safarji, Cian O'Brien, Rachel Quinlan. [The rank distribution of matrices representing graphs with a long induced path over the field of two elements](https://arxiv.org/pdf/2509.10332). arXiv 2509.10332 (2025).

<a id="ref-45"></a>

[45] Michael Lipnowski, Jacob Tsimerman. [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1). Duke Math. J. 167 (2018), 3403–3453.

<a id="ref-52"></a>

[52] Richard P. Stanley. [Spanning Trees and a Conjecture of Kontsevich](https://math.mit.edu/~rstan/pubs/pubfiles/114.pdf). Annals of Combinatorics 2 (1998), 351–363; journal-formatted author-hosted copy.

<a id="ref-90"></a>

[90] Étienne Fouvry and Jürgen Klüners. [On the 4-rank of class groups of quadratic number fields](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf). Author manuscript corresponding to Inventiones Mathematicae 167 (2007), 455–513; manuscript page numbers.

<a id="ref-121"></a>

[121] Melanie Matchett Wood. [The distribution of sandpile groups of random graphs](https://arxiv.org/pdf/1402.5149v2). arXiv:1402.5149v2; printed preprint pages.

<a id="ref-122"></a>

[122] Melanie Matchett Wood. [Random integral matrices and the Cohen–Lenstra heuristics](https://arxiv.org/pdf/1504.04391). arXiv:1504.04391.
