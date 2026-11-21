# Roadmap: tensor induction and finite-group inputs

**Summary.** This roadmap states results on finite groups and on representations of finite and general linear groups that the family [RiemannHypothesisForDirichletLFunctions](../README.md) uses and that the roadmaps it extends do not state. In Layer 6, `Ĝ` is a finite group, `H` a normal subgroup of prime index `l`, `x` an element of `Ĝ` outside `H` and `F(h) = xhx⁻¹`; characters are complex.

The headline theorems are these. (1) *Tensor induction in prime index* (6.1). The tensor induction to `Ĝ` of a finite-dimensional complex representation of `H` with character `ψ` has the character `ψ̂` with `ψ̂(h) = ∏_{i<l} ψ(F^i(h))` for `h ∈ H` and `ψ̂(g) = ψ(g^l)` for `g ∉ H`; and for every virtual character `ψ` of `H`, the class function `ψ̂` given by the same two formulas is a virtual character of `Ĝ`, with an explicit expression through the linear character `s` of `Ĝ/H` with `s(x) = (−1)^{l−1}` and characters induced from `H`. (2) *Virtual characters of norm one on a coset* (6.2). Let `ζ = e^{2πi/l}` and `⟨φ, φ′⟩_{Hx} = |H|⁻¹ Σ_{h∈H} φ(hx)·conj(φ′(hx))`. If `X` is a virtual character of `Ĝ` with `⟨X, X⟩_{Hx} = 1`, there are an irreducible character `τ₀` of `H` with `τ₀∘F = τ₀`, an extension `τ̃₀` of it to `Ĝ` and a root of unity `b ∈ ℚ(ζ)` with `X = b·τ̃₀` on `Hx`; and `τ₀` is a constituent of every character `Y` of `H` with `Y∘F = Y` for which `l` does not divide `⟨X|_H, Y⟩_H`.

The roadmap extends three roadmaps on main: [InductionRestriction](../../RepresentationTheory/InductionRestriction/README.md), whose induced characters, Mackey criterion, Clifford theory and virtual-character ring carry Layer 6, together with Tau Ceti's tensor induction; [SchurWeyl](../../RepresentationTheory/SchurWeyl/README.md), whose Schur–Weyl duality on tensor powers gives the duality of Layer 7; and [ClassicalGroups](../../RepresentationTheory/ClassicalGroups/README.md), whose Schur functors and highest weights enter Layer 7 and whose Capelli generators are the subject of Layer 9. The character formula of 6.1 is the case of prime index of the trace formula for tensor induction of [ArithmeticGaloisRepresentations](../../ArithmeticGaloisRepresentations/README.md). In the family, [FiniteReductiveGroups](../FiniteReductiveGroups/README.md) uses Layer 6 in Shintani descent for `GL_n` in prime degree, [ThetaKernelsForUnitaryDualPairs](../ThetaKernelsForUnitaryDualPairs/README.md) uses 7.1 for the compact dual pairs `(U(n), U(m))`, and [BesselPoincareSeriesAndGramBounds](../BesselPoincareSeriesAndGramBounds/README.md) uses 9.1.

Layer 6 treats tensor induction in prime index (6.1) and the characters of `Ĝ` on the coset `Hx`, beginning with the extensions of the `F`-stable irreducible characters of `H` (6.2). Layer 7 decomposes the polynomial functions on complex `n × m` matrices under `GL_n(ℂ) × GL_m(ℂ)` and under `U(n) × U(m)`, with the highest weight vectors (7.1). Layer 9 proves identities of the quantum minors of `u + E` for elements `E_{ab}` of any associative algebra that satisfy the commutation relations of `𝔤𝔩_n`: Laplace expansions, the centrality of the quantum determinant, the comatrix and Jacobi identities with their bordered forms, and the quantum determinant of a `2 × 2` matrix that satisfies the exchange relation (9.1). The three layers use no statement of one another.

## Conventions

Notation and conventions not restated here are those of the roadmaps this one extends: the Standing conventions of InductionRestriction for Layer 6, the Conventions of SchurWeyl for Layer 7 and those of ClassicalGroups for Layer 9.

In Layer 6, `Ĝ` is a finite group, `H ⊲ Ĝ` a normal subgroup of prime index `l`, and `x ∈ Ĝ ∖ H`, so that `1, x, …, x^{l−1}` is a transversal of `H`; `F(h) = xhx⁻¹` is the automorphism of `H` that `x` induces. A character is the character of a finite-dimensional complex representation; a virtual character is a difference of two characters, an element of the virtual-character lattice of InductionRestriction Layer 6 (Tau Ceti's `TauCeti.virtualCharacters`). `Ind_H^Ĝ` is induction (InductionRestriction Layer 2), `φ|_H` restriction, and `⟨φ, φ′⟩_H = |H|⁻¹ Σ_{h∈H} φ(h)·conj(φ′(h))` the inner product of class functions on `H`; 6.2 defines the inner product `⟨ , ⟩_{Hx}` on the coset `Hx`.

In Layer 7, `ℂ[M_{n×m}]` is the ring of polynomial functions on complex `n × m` matrices and `ℂ[M_{n×m}]_d` its homogeneous part of degree `d`; `λ ⊢ d` is a partition of `d`, `ℓ(λ)` its number of nonzero parts, and `S^λ` the Schur functor.

Layer 9 fixes its notation at the start of 9.1.

## Layer 6: Tensor induction and coset characters in prime index

Both targets add to the virtual-character ring of InductionRestriction Layer 6 for a finite group with a normal subgroup of prime index.

*The form of the formal proof.* [FormalProof] states 6.1 and 6.2 for a semidirect product `Ĝ = H ⋊ ⟨x⟩` with a cyclic
complement, `x^l = 1`, and 6.1 as the existence of a character: for a character `ψ` of `H` there is a character of `Ĝ` with
the values `∏_{i<l} ψ(F^i(h))` at `h ∈ H` and `ψ((hx)^l) = ψ(h·F(h)⋯F^{l−1}(h))` at the elements `hx` of the one coset `Hx`,
and for a virtual character `ψ` of `H` there is a virtual character of `Ĝ` with the same values on `H` and on `Hx`. Its
statements give 6.2 (a) apart from the number of extensions and the induced form of the other irreducible characters,
6.2 (b) with a complex number `b`, and 6.2 (c) in the form `Σ_{h∈H} conj(X(hx))·ρ(h) = 0` for every representation `ρ` of
`H` with no constituent in common with `Y`, which is (c) by (a) and (b). The family applies both targets to such a
semidirect product only (Shintani descent in FiniteReductiveGroups, with `H = GL_m(𝔽_{q^l})` and `x` the Frobenius), and
6.1 only on `H` and on the coset `Hx`. The rest of Layer 6 is this roadmap's, proved by the Routes below: the statements
for an extension that does not split, the values of 6.1 on the other cosets, the identification in 6.1 (a) with the
character of Tau Ceti's tensor-induced representation (through ArithmeticGaloisRepresentations §7.1), the explicit
expression in 6.1 (b), the number of extensions and the induced characters in 6.2 (a), and 6.2 (b′).

### 6.1 Tensor induction in prime index (character formula; virtual characters)

Let `Ĝ` be a finite group, `H ⊲ Ĝ` a normal subgroup of prime index `l`, and
`x ∈ Ĝ ∖ H`, so that `1, x, …, x^{l−1}` is a transversal; write `F(h) = xhx⁻¹` for the automorphism of `H` it induces.

(a) For a finite-dimensional complex representation `(V, ρ)` of `H` with character `ψ`, the tensor-induced representation of
`Ĝ` on `V^{⊗l}` (Tau Ceti's `Subgroup.tensorInducedRepresentation` for this transversal) has character `ψ̂` with
`ψ̂(h) = ∏_{i<l} ψ(F^i(h))` for `h ∈ H` and `ψ̂(g) = ψ(g^l)` for `g ∉ H`.

(b) For a virtual character `ψ` of `H`, the class function `ψ̂` on `Ĝ` given by the same two formulas is a virtual
character of `Ĝ`. Explicitly, for `ψ = ψ₁ − ψ₂` with `ψ₁, ψ₂` characters,
`ψ̂ = ψ̂₁ + (−1)^l s·ψ̂₂ + Σ_{[w]} (−1)^{#₂(w)} Ind_H^Ĝ(⊗_{i<l} ψ_{w_i}∘F^i)`,
where `s` is the linear character of `Ĝ/H` with `s(x) = (−1)^{l−1}`, the sum runs over the orbits `[w]` of the cyclic shift on
the non-constant words `w ∈ {1, 2}^l` (one representative each; every such orbit has `l` elements), `#₂(w)` is the number of
letters `2` in `w`, and `⊗_{i<l} ψ_{w_i}∘F^i` is the character `h ↦ ∏_i ψ_{w_i}(F^i(h))` of `H`.

In `Suggested.lean`, (a) is `trace_tensorInducedRepresentation_of_index_prime` and the first sentence of (b) is
`tensorInducedClassFunction_mem_virtualCharacters`.

*Route.* (a) This is the case of a normal subgroup of prime index of the trace formula for tensor induction of
ArithmeticGaloisRepresentations §7.1 (the trace at `g` is the product, over the cycles of `g` on `Ĝ/H`, of `tr ρ(t⁻¹g^kt)`,
`t` the representative of a coset of the cycle and `k` its length), applied to the finite group `Ĝ` with the discrete
topology and the transversal `x^i`. An element `h ∈ H` fixes every coset `x^iH` (`H` is normal), so its trace is
`∏_{i<l} ψ(x^{−i}hx^i) = ∏_{i<l} ψ(F^{−i}(h))`, which is `∏_{i<l} ψ(F^i(h))` because `F^l` is conjugation by `x^l ∈ H` and
`ψ` is a class function on `H`. An element `g ∉ H` permutes the `l` cosets in a single cycle (`l` prime), so its trace is
`ψ(x^{−i}g^lx^i)` for one `i`; writing `x^i = g^jh′` with `h′ ∈ H` (`gH` generates `Ĝ/H`) gives `x^{−i}g^lx^i = h′⁻¹g^lh′`,
and the trace is `ψ(g^l)`. (b) Expand `∏_i(ψ₁ − ψ₂)(F^i(h)) = Σ_w (−1)^{#₂(w)} ∏_i ψ_{w_i}(F^i(h))`. The two
constant words give `ψ̂₁(h)` and `(−1)^lψ̂₂(h)` (by (a); `s` is trivial on `H`). The non-constant words form free orbits of size
`l` under the cyclic shift (`l` prime), `#₂` is constant on an orbit, and the sum over an orbit is the value at `h` of
`Ind_H^Ĝ(⊗_i ψ_{w_i}∘F^i)` (InductionRestriction Layer 2's induced-character formula, the conjugates by the `x^j` being the shifts). Off `H` the
induced characters vanish (`H` is normal), `ψ̂_i(g) = ψ_i(g^l)` by (a), and `(−1)^l s(g) = −1` (for `l = 2`, `s(g) = −1`; for `l`
odd, `s = 1`), so the right side is `ψ₁(g^l) − ψ₂(g^l)`. Each term is a character or the negative of one.

**Checks.**
- Rank one: for a linear character `ψ` and `g ∉ H`, `ψ̂(g) = ψ(g^l)`, the transfer (Mathlib's `MonoidHom.transfer`) in prime index.
- The sign `s` cannot be dropped: for `Ĝ = ℤ/2`, `H = 1` and `ψ = −1` (`ψ₁ = 0`, `ψ₂ = 1`), the required class function has
  `ψ̂(1) = ψ(1)² = 1` and `ψ̂(x) = ψ(x²) = −1`, which is `s`; without `s` the formula gives the trivial character.
- `ψ̂` depends only on `ψ`, not on the decomposition `ψ₁ − ψ₂`: the two defining formulas involve `ψ` only.
- Tested on permutation modules: `H = GL₂(𝔽_{2^l})` with `x` acting as the Frobenius `a ↦ a²` (`l = 2, 3`) on `ℂ[ℙ¹]` and on
  `ℂ[𝔽_{2^l}² ∖ 0]`: the trace of `hx` on the tensor-induced module is the character at `h·F(h)⋯F^{l−1}(h) = (hx)^l`, and the
  formula of (b) has the stated values.

*Needs:* Tau Ceti `Subgroup.tensorInducedRepresentation`; ArithmeticGaloisRepresentations §7.1 (the trace formula for
tensor induction); InductionRestriction Layer 2 (induced characters); the virtual-character lattice of InductionRestriction
Layer 6.

### 6.2 Virtual characters of norm one on a coset of a normal subgroup of prime index

Let `Ĝ`, `H`, `x`, `F` and `l` be as in 6.1, `ζ = e^{2πi/l}`, and
`⟨φ, φ′⟩_{Hx} = |H|⁻¹ Σ_{h∈H} φ(hx)·conj(φ′(hx))` for class functions on `Ĝ`. Call an irreducible character `χ′` of `H`
`x`-stable if `χ′∘F = χ′`.

(a) An `x`-stable irreducible character of `H` has exactly `l` extensions to `Ĝ`, `χ̃ε^j` (`ε` a generator of the characters of
`Ĝ/H`); every other irreducible character of `Ĝ` is induced from an irreducible character of `H` that is not `x`-stable, and
vanishes off `H`. If `χ̃`, `χ̃′` extend `x`-stable irreducible characters `χ′ ≠ χ″`, then `⟨χ̃, χ̃′⟩_{Hx} = 0`, and `⟨χ̃, χ̃⟩_{Hx} = 1`.

(b) If `X` is a virtual character of `Ĝ` with `⟨X, X⟩_{Hx} = 1`, there are an `x`-stable irreducible character `τ₀` of `H`, an
extension `τ̃₀` of it and a complex number `b` with `X = b·τ̃₀` on `Hx`; by (a), `|b| = 1`.

(b′) The number `b` of (b) is a root of unity of `ℚ(ζ)`: `±1` for `l = 2`, `±ζ^j` for odd `l`. This clause is this roadmap's
addition, proved by the route below.

(c) If moreover `Y` is an `x`-stable character of `H` with `l ∤ ⟨X|_H, Y⟩_H`, then `τ₀` is a constituent of `Y`.

In `Suggested.lean`, (b) and (c) are `exists_rootOfUnity_mul_extension_eq_on_coset`; (b′) is part of that declaration.

*Route.* (a) Clifford theory (InductionRestriction Layer 5) with `H` normal and `Ĝ/H` cyclic of prime order: the inertia group of an irreducible
`χ′` is `H` or `Ĝ`; in the first case `Ind_H^Ĝ χ′` is irreducible (InductionRestriction Layer 4's criterion) and vanishes off `H`. In the second, let
`(V, ρ)` afford `χ′`; as `ρ∘F ≅ ρ` there is `A ∈ GL(V)` with `Aρ(h)A⁻¹ = ρ(F(h))` for all `h ∈ H`. Then `ρ(x^l)⁻¹A^l` commutes with
`ρ(H)` (both `A^l` and `ρ(x^l)` implement `h ↦ x^lhx^{−l}`), so it is a scalar `c` (Schur's lemma); replacing `A` by `c^{−1/l}A`
(any `l`-th root) gives `A^l = ρ(x^l)`, and `ρ̃(hx^j) = ρ(h)A^j` (`0 ≤ j < l`) is a representation of `Ĝ` extending `ρ` (the products
`hx^i·h′x^j` with `i + j ≥ l` use `x^{i+j} = x^l·x^{i+j−l}`), whether or not `Ĝ → Ĝ/H` splits. Any other extension `ρ̃′` has
`ρ̃′(x)ρ̃(x)⁻¹` commuting with `ρ(H)`, a scalar whose `l`-th power is `1`, so the extensions are the `χ̃ε^j`; by Frobenius
reciprocity `Ind_H^Ĝ χ′ = Σ_j χ̃ε^j` (InductionRestriction Layer 2), so these are all the characters of `Ĝ` lying over `χ′`, each with multiplicity one.
Orthogonality on the coset: with `c_i = ⟨χ̃, χ̃′⟩_{Hx^i}`, the
orthogonality relations of `Ĝ` give `l⁻¹ Σ_{i<l} ζ^{ij}c_i = ⟨χ̃ε^j, χ̃′⟩_Ĝ`, which is `0` for all `j` if `χ′ ≠ χ″`, and `δ_{j0}` if
`χ̃′ = χ̃`; inverting the finite Fourier transform, `c_i = 0` for all `i`, respectively `c_i = 1` for all `i`. (b) On `Hx`,
`X = Σ_{χ′} b_{χ′}χ̃` over the `x`-stable `χ′` (one extension `χ̃` chosen for each), with `b_{χ′} = Σ_j a_{χ′,j}ε^j(x) ∈ ℤ[ζ]` for
`X = Σ a_ψψ`; by (a), `Σ_{χ′}|b_{χ′}|² = 1`. The automorphisms of `ℚ(ζ)` commute with complex conjugation, so the same holds
after applying any of them; hence each nonzero `|b_{χ′}|²` is a totally positive algebraic integer all of whose conjugates
are at most `1`; its norm is a positive integer at most `1`, so all conjugates equal `1` and only one `b_{χ′}` is nonzero;
this is (b). (b′) An algebraic integer all of whose conjugates have absolute value `1` is a root of unity (Kronecker;
Mathlib `NumberField.Embeddings.pow_eq_one_of_norm_eq_one`). (c)
`⟨X|_H, Y⟩ = Σ_{χ′ x-stable} (Σ_j a_{χ′,j})·m_Y(χ′) + l·(…)`, the second term from the induced constituents, since `m_Y` is constant on
`F`-orbits. Modulo `(1 − ζ)` in `ℤ[ζ]`, `Σ_j a_{χ′,j} ≡ b_{χ′}` and `l ≡ 0`; so `⟨X|_H, Y⟩ ≡ b_{τ₀}·m_Y(τ₀)`. If `m_Y(τ₀) = 0`, then
`⟨X|_H, Y⟩ ∈ (1 − ζ) ∩ ℤ = lℤ`.

**Checks.**
- `Ĝ = S₃`, `H = A₃`, `l = 2`: `X = 1 + ρ` (`ρ` the character of degree `2`, induced from a nontrivial character `ω` of `A₃`) has
  `X = 1` on the transpositions, norm one on the coset, with `τ₀ = 1_H`. For `Y = ω + ω²` (`x`-stable), `⟨X|_H, Y⟩ = 2` is
  divisible by `l` and `1_H` is not a constituent of `Y`: the divisibility condition of (c) cannot be dropped.
- Integrality is needed in (b): for `Ĝ = H × ⟨x⟩` with `H = ℤ/2`, `x` of order `2`, and `η` the nontrivial character of `H`
  extended by `η̃(x) = 1`, the class function `(1 + η̃)/√2` has norm one on `Hx` and two nonzero coefficients; it is not a
  virtual character.
- For `l = 2` the roots of unity of `ℚ(ζ) = ℚ` are `±1`; for odd `l` they are the `±ζ^j`.
- (a) without a splitting: `Ĝ = ℤ/4`, `H = 2ℤ/4`, `x = 1`, `χ′` the nontrivial character of `H`. With `A = 1`,
  `ρ(x²)⁻¹A² = −1 = c`, and `A = c^{−1/2}·1 = ±i` gives the two extensions `x ↦ ±i`, although `Ĝ → Ĝ/H` does not split.

*Needs:* InductionRestriction Layers 0, 2, 4, 5 (the projection formula; Frobenius reciprocity; the Mackey irreducibility criterion; Clifford
theory over a normal subgroup); the virtual-character lattice of InductionRestriction Layer 6; the orthogonality relations of the irreducible
characters (Mathlib's `FDRep.char_orthonormal`); Mathlib's Schur lemma, `IsPrimitiveRoot`, cyclotomic integers and Kronecker's theorem.

### Examples

- The sign `s` in 6.1 (b): for `Ĝ = ℤ/2`, `H = 1` and the virtual character `ψ = −1`, the class function of 6.1 (b) is the sign character `s`; for a linear character `ψ` and `g ∉ H`, `ψ̂(g) = ψ(g^l)` is the transfer in prime index (6.1, Checks).
- For `Ĝ = S₃`, `H = A₃`, the virtual character `X = 1 + ρ` has norm one on the coset of the transpositions, with `τ₀ = 1_H`, and `Y = ω + ω²` shows that the divisibility condition of 6.2 (c) cannot be dropped; for `Ĝ = ℤ/4` and `H = 2ℤ/4`, the nontrivial character of `H` has the two extensions `x ↦ ±i` although `Ĝ → Ĝ/H` does not split (6.2, Checks).

### Dependencies

InductionRestriction Layers 0, 2, 4, 5 and 6 (the projection formula; induced characters and Frobenius reciprocity; the Mackey irreducibility criterion; Clifford theory over a normal subgroup; the virtual-character lattice); ArithmeticGaloisRepresentations §7.1 (the trace formula for tensor induction); Tau Ceti's `Subgroup.tensorInducedRepresentation`; Mathlib's orthogonality relations `FDRep.char_orthonormal`, Schur lemma, `IsPrimitiveRoot`, cyclotomic integers and Kronecker's theorem.

## Layer 7: Polynomial duality for pairs of general linear groups

SchurWeyl Layer 8 proves Schur–Weyl duality on tensor powers. This layer derives from it the `(GL_n, GL_m)`-duality on polynomial functions on complex `n × m` matrices, for all `n, m ≥ 1`, for `GL_n(ℂ) × GL_m(ℂ)` and for `U(n) × U(m)`.

### 7.1 `(GL_n, GL_m)`-duality on polynomials in `n × m` matrices

Let `n, m ≥ 1`, and let
`GL_n(ℂ) × GL_m(ℂ)` act on the polynomial functions `ℂ[M_{n×m}]` by `((g, h) · P)(X) = P(ᵗg X h)`. Then for
every `d ≥ 0` the homogeneous part of degree `d` decomposes as
`ℂ[M_{n×m}]_d ≅ ⊕_{λ ⊢ d, ℓ(λ) ≤ min(n, m)} S^λ(ℂⁿ) ⊗ S^λ(ℂ^m)`,
with `S^λ` the Schur functor (SchurWeyl §8.2, ClassicalGroups Layer 2): each summand is irreducible for
`GL_n(ℂ) × GL_m(ℂ)`, the summands are pairwise non-isomorphic, more precisely, the representations `S^λ(ℂⁿ)`,
`ℓ(λ) ≤ min(n, m)`, of `GL_n(ℂ)` are irreducible and pairwise non-isomorphic, and so are the `S^λ(ℂ^m)` for `GL_m(ℂ)`,
so that `λ` sets up a bijection between the representations of the two groups that occur; and the decomposition, the
irreducibility and the non-isomorphism hold also for the restriction to `U(n) × U(m)`, factor by factor. The joint
highest weight line of the summand of `λ` (for the upper Borel subgroups) is spanned by
`Δ_λ = ∏_{i=1}^{min(n,m)} Δ_i^{λ_i − λ_{i+1}}`, `Δ_i` the `i × i` leading principal minor. With the action
`P(g⁻¹ X h)` the `GL_n(ℂ)`-factor is replaced by its contragredient.

*Route.* `ℂ[M_{n×m}]_d = Sym^d(ℂⁿ ⊗ ℂ^m)` (up to the duality fixed by the action) is the
`S_d`-invariant part of `(ℂⁿ)^{⊗d} ⊗ (ℂ^m)^{⊗d}`; Schur–Weyl duality (SchurWeyl §8.1) for each factor and the
orthogonality of the irreducible characters of `S_d` (SchurWeyl Layer 6) give the decomposition, with
`S^λ(ℂⁿ) = 0` when `ℓ(λ) > n`. The highest weight vectors are computed on the minors, whose torus
weights are the fundamental weights. For `U(n) × U(m)` (Weyl's unitarian trick): the action on `ℂ[M_{n×m}]_d` is
polynomial in the entries of `g` and `h`, and a polynomial function of `(g, h)` that vanishes on `U(n) × U(m)` vanishes on
`GL_n(ℂ) × GL_m(ℂ)`, by the Zariski density of the unitary group applied in `g` for each unitary `h` and then in `h` for each
`g`. Hence `U(n) × U(m)` and `GL_n(ℂ) × GL_m(ℂ)` have the same invariant subspaces and the same intertwining maps on
`ℂ[M_{n×m}]_d` (for an invariant subspace `W`, `w ∈ W` and a functional `f` vanishing on `W`, apply this to
`(g, h) ↦ f((g, h)·w)`), which gives the decomposition, the irreducibility and the non-isomorphism for `U(n) × U(m)`.

(R. Howe, *Remarks on classical invariant theory*, Trans. Amer. Math. Soc. 313 (1989), and
*Perspectives on invariant theory*, Israel Math. Conf. Proc. 8 (1995), §2.1.) *Needs:* SchurWeyl §§8.1–8.3,
Layer 6; ClassicalGroups Layers 2–3; Tau Ceti `TauCeti.Matrix.GeneralLinearGroup.eq_of_mem_rationalFunctions_of_forall_unitary`
(the Zariski density of the unitary group).

**Checks.**

- `n = 1`, `m = 2`, `d = 2`: `ℂ[x, y]_2` has dimension `3`; only `λ = (2)` occurs (`ℓ(λ) ≤ 1`), and
  `S^{(2)}(ℂ) ⊗ S^{(2)}(ℂ²)` has dimension `1 · 3`.
- `n = m = 2`, `d = 2`: `10 = 3·3 + 1·1` from `λ = (2)` and `(1,1)`.
- `n = 2`, `m = 3`, `d = 2`: `dim Sym²(ℂ⁶) = 21 = 3·6 + 1·3`.

### Examples

`n = m = 2`, `d = 2`: `dim ℂ[M_{2×2}]_2 = 10 = 3·3 + 1·1`, from `λ = (2)` and `(1,1)`; `n = 2`, `m = 3`, `d = 2`: `dim Sym²(ℂ⁶) = 21 = 3·6 + 1·3` (7.1, Checks).

### Dependencies

SchurWeyl §§8.1–8.3 and Layer 6; ClassicalGroups Layers 2–3; Tau Ceti's Zariski density of the unitary group, `TauCeti.Matrix.GeneralLinearGroup.eq_of_mem_rationalFunctions_of_forall_unitary`.

## Layer 9: Quantum minors and the Capelli generators

This layer states identities for the quantum minors of `u + E`, where the entries of `E = (E_{ab})` satisfy the commutation relations of `𝔤𝔩_n` in an arbitrary associative algebra; the quantum determinant is the column-ordered determinant of ClassicalGroups §6.6, whose coefficients are the Capelli generators.

### 9.1 Quantum minors of `u + E` for `𝔤𝔩_n`

In this target, `A` is an associative unital `ℂ`-algebra and `E_{ab} ∈ A` (`1 ≤ a, b ≤ n`) are elements with
`[E_{ab}, E_{cd}] = δ_{bc}E_{ad} − δ_{da}E_{cb}`; the case `A = U(𝔤𝔩_n)` with the matrix units is the universal one, and algebras of
endomorphisms of a representation or of differential operators are the others in use. `T(u)_{ab} = δ_{ab}·u + E_{ab}` for
`u ∈ ℂ`. For sequences `a = (a_1, …, a_t)` and `b = (b_1, …, b_t)` of indices in `{1, …, n}`, repetitions allowed, the *quantum
minor* is `M^a_b(u) = Σ_{σ∈S_t} sgn(σ)·T(u)_{a_{σ(1)}b_1}·T(u−1)_{a_{σ(2)}b_2}⋯T(u−t+1)_{a_{σ(t)}b_t}` (equal to `1` for `t = 0`), and
`qdet(u) = M^{(1,…,n)}_{(1,…,n)}(u)`, which is the column-ordered determinant `A_n(u)` of ClassicalGroups §6.6. `a∖l` is the
sequence `a` without its `l`-th term; `M_{î,ĵ}(u)` is the minor on the rows other than `i` and the columns other than `j`, in
increasing order, and `M_{îq̂,ĵp̂}(u)` the minor with two rows and two columns removed. `ε(i, q) = 1` if `i < q` and `−1` if
`i > q`. A *vector operator* is `y ∈ A^n` with `[E_{ab}, y_c] = −δ_{ac}y_b`; a *covector operator* is `η ∈ A^n` with
`[E_{ab}, η_c] = δ_{bc}η_a`.

Prove, for every `A` and `E` as above and all `u, w ∈ ℂ`:

(a) *(antisymmetry and row form)* `M^{a∘τ}_b(u) = sgn(τ)·M^a_b(u) = M^a_{b∘τ}(u)` for `τ ∈ S_t`, and
`M^a_b(u) = Σ_{σ∈S_t} sgn(σ)·T(u−t+1)_{a_1b_{σ(1)}}·T(u−t+2)_{a_2b_{σ(2)}}⋯T(u)_{a_tb_{σ(t)}}`;

(b) *(Laplace expansions)* for `a, b` of length `t ≥ 1`:
`M^a_b(u) = Σ_{l=1}^{t}(−1)^{l−1}·T(u)_{a_lb_1}·M^{a∖l}_{b∖1}(u−1) = Σ_{l=1}^{t}(−1)^{t−l}·M^{a∖l}_{b∖t}(u)·T(u−t+1)_{a_lb_t}`
`= Σ_{l=1}^{t}(−1)^{l−1}·T(u−t+1)_{a_1b_l}·M^{a∖1}_{b∖l}(u) = Σ_{l=1}^{t}(−1)^{t−l}·M^{a∖t}_{b∖l}(u−1)·T(u)_{a_tb_l}`;

(c) *(centre)* `qdet(u)` commutes with every `E_{cd}`; on a vector `v` of an `A`-module with `E_{aa}v = ν_av` and `E_{ab}v = 0` for
`a < b`, `qdet(u)v = ∏_{k=1}^{n}(u − k + 1 + ν_k)·v`;

(d) *(comatrix)* `Σ_{j=1}^{n}(−1)^{i+j}·M_{ĵ,î}(u)·T(u−n+1)_{jl} = δ_{il}·qdet(u)`;

(e) *(Jacobi identity)* for `i ≠ q` and `j ≠ p`:
`M_{î,ĵ}(u+1)·M_{q̂,p̂}(u) − M_{q̂,ĵ}(u+1)·M_{î,p̂}(u) = ε(i, q)·ε(j, p)·qdet(u+1)·M_{îq̂,ĵp̂}(u)`, and the left side is `0` when `i = q` or
`j = p`;

(f) *(vector and covector operators)* for a vector operator `y` and a covector operator `η`:
`qdet(w)·y_j = y_j·qdet(w) − Σ_{l=1}^{n}(−1)^{j+l}·y_l·M_{ĵ,l̂}(w)`;
`[M_{q̂,p̂}(u), η_i] = Σ_{a≠q}ε(a, q)·ε(i, p)·(−1)^{a+i}·M_{âq̂,îp̂}(u)·η_a` for `i ≠ p`, and `[M_{q̂,p̂}(u), η_p] = 0`;
if the components of `y` commute, `a` has length `t` and `b` length `t + 1`:
`Σ_{j}(−1)^{j−1}·y_{b_j}·M^a_{b∖j}(w) = Σ_{j}(−1)^{j−1}·M^a_{b∖j}(w−1)·y_{b_j}`;
if the components of `η` commute, `a` has length `t + 1` and `b` length `t`:
`Σ_{i}(−1)^{i−1}·η_{a_i}·M^{a∖i}_b(w−1) = Σ_{i}(−1)^{i−1}·M^{a∖i}_b(w)·η_{a_i}`;

(g) *(bordered Jacobi identity)* let `y` be a vector operator and `η` a covector operator whose `2n` components commute
with one another, `x, ξ ∈ ℂ^n`, and
`C(u) = Σ_{i,j}(−1)^{i+j}ξ_ix_j·M_{î,ĵ}(u)`, `C_Y(u) = Σ_{i,j}(−1)^{i+j}ξ_i·y_j·M_{î,ĵ}(u)`, `C_X(u) = Σ_{i,j}(−1)^{i+j}x_j·η_i·M_{î,ĵ}(u)`,
`C_{YY}(u) = Σ_{i,j}(−1)^{i+j}·η_iy_j·M_{î,ĵ}(u)`,
`C₂(u) = Σ_{i<i′, j<j′}(−1)^{i+i′+j+j′}·(ξ_{i′}η_i − ξ_iη_{i′})·(x_{j′}y_j − x_jy_{j′})·M_{îî′,ĵĵ′}(u)`. Then
`qdet(u+1)·C₂(u−1) + C_Y(u+1)·C_X(u−1) = C_{YY}(u)·C(u)`;

(h) *(border expansions)* for distinct indices `v = (v_1, …, v_m)` and two further indices `e ≠ e′`:
`M^{(e,v)}_{(e,v)}(u) = T(u)_{ee}·M^v_v(u−1) − Σ_{w,x}(−1)^{w+x}·E_{v_we}·M^{v∖w}_{v∖x}(u−2)·E_{ev_x}`,
`M^{(v,e′)}_{(v,e′)}(u) = M^v_v(u)·T(u−m)_{e′e′} − Σ_{w,x}(−1)^{w+x}·E_{e′v_x}·M^{v∖w}_{v∖x}(u)·E_{v_we′}`, and
`M^{(e,v,e′)}_{(e,v,e′)}(u) = T(u)_{ee}·M^v_v(u−1)·T(u−m−1)_{e′e′} − Σ_{w,x}(−1)^{w+x}·E_{e′v_x}·T(u)_{ee}·M^{v∖w}_{v∖x}(u−1)·E_{v_we′}`
`− Σ_{w,x}(−1)^{w+x}·E_{v_we}·M^{v∖w}_{v∖x}(u−2)·T(u−m−1)_{e′e′}·E_{ev_x}`
`− Σ_{w≠w′, x≠x′}s(w, w′)·s(x, x′)·E_{v_we}·E_{e′v_x}·M^{v∖{w,w′}}_{v∖{x,x′}}(u−2)·E_{ev_{x′}}·E_{v_{w′}e′}`
`+ (−1)^{m+1}·E_{e′e}·M^{(e,v)}_{(v,e′)}(u−1) + Σ_{w=1}^{m}(−1)^{w+m}·E_{v_we}·M^{(v∖w,e′)}_{v}(u−1)·E_{ee′}`,
with `s(w, w′) = (−1)^{w+w′}` for `w′ < w` and `(−1)^{w+w′+1}` for `w′ > w`;

(i) *(adjoints and change of basis)* if `A` is a `∗`-algebra and `(E_{ab})^* = ε_aε_b·E_{ba}` for signs `ε_a = ±1`, then
`(M^a_b(w))^* = (∏_kε_{a_k})·(∏_kε_{b_k})·M^b_a(w̄)`; for `P, Q ∈ M_n(ℂ)` inverse to each other, the elements
`E′_{ab} = Σ_{c,d}P_{ca}Q_{bd}E_{cd}` satisfy the same relations, have the same `qdet(u)`, and `C(u)` of (g) is unchanged when `E, x, ξ`
are replaced by `E′, Qx, ξP`;

(j) *(quantum determinant of a `2 × 2` matrix)* for any `ℂ`-algebra `B` and matrices `t(Y) ∈ M₂(B)`, `Y ∈ ℂ`, with
`(u − v)·[t_{ab}(u), t_{cd}(v)] = t_{cb}(u)·t_{ad}(v) − t_{cb}(v)·t_{ad}(u)` for all indices, there is for every `Y` an element `q(Y) ∈ B`
commuting with every `t_{ab}(Y′)` such that `t(Y+1)^T·𝐉·t(Y) = q(Y)·𝐉 = t(Y)·𝐉·t(Y+1)^T`, `𝐉 = [[0, 1], [−1, 0]]`. For
`t(u) = [[qdet(u), −C_X(u−1)], [−C_Y(u), −C₂(u−1)]]`, whenever it satisfies this relation, `q(u) = −C_{YY}(u)·C(u)` by (g).

*Route.* (a) Rows: reindexing the sum. Columns and the row form: the relation
`(u − v)·[T(u)_{ab}, T(v)_{cd}] = T(u)_{cb}T(v)_{ad} − T(v)_{cb}T(u)_{ad}`, applied to adjacent factors. (b) The first two from the
definition, the last two from the row form. (c) The `E_{ab}` satisfy the defining relations of `U(𝔤𝔩_n)`, so `E_{ab} ↦ E_{ab}`
extends to an algebra homomorphism `U(𝔤𝔩_n)[u] → A[u]`, which carries the column-ordered determinant `A_n(u)` of
ClassicalGroups §6.6 to `qdet(u)`; the centrality of `A_n(u)` (ClassicalGroups §6.6; for the Yangian and its evaluation
homomorphism to `U(𝔤𝔩_n)`, MNO Theorem 2.10 and Remark 2.11) gives the first clause. The eigenvalue because only the identity permutation
contributes on `v`. (d) The second expansion of (b) for `i = l`, and the vanishing of a minor
with a repeated column for `i ≠ l`. (e) Adjoin a central indeterminate, replacing `E` by `E + X·1` over `A[X]`; then a row
`Z` with `Σ_pZ_p·T(v)_{cp} = 0` for all `c` vanishes; multiply the difference of the two sides on the right by `T`, evaluate
by (d) for the sizes `n − 1` and `n − 2` and by (c), and cancel. (f) The commutator of an arbitrary minor with a
component of `y` or `η`, by expanding along a row or a column. (g) From (e) and (f), first for basis vectors `x, ξ`.
(h) From (b) and (a). (i) Termwise. (j) With `P` the flip of `ℂ² ⊗ ℂ²`, `R(z) = z − P`, and `t₁(u)`, `t₂(v)` the matrices `t(u)`, `t(v)` acting on the first and the
second factor, the relation reads `R(u − v)·t₁(u)t₂(v) = t₂(v)t₁(u)·R(u − v)` on `ℂ² ⊗ ℂ²` with coefficients in `B`. At `(u, v) = (Y + 1, Y)`, `R(1)` is twice the
projection `Π₁₂` onto the line `Λ²ℂ²`, so `Π₁₂t₁(Y + 1)t₂(Y) = t₂(Y)t₁(Y + 1)Π₁₂`, and both sides equal `q(Y)Π₁₂` with
`q(Y) = t_{11}(Y + 1)t_{22}(Y) − t_{21}(Y + 1)t_{12}(Y)`; in coordinates these are the two identities (MNO Propositions 2.4, 2.5
and formula (2.7.3), for the Yangian of `𝔤𝔩₂`). For the commutation, the relations at `(Y + 1, Y′)` and `(Y, Y′)` and the
Yang–Baxter equation give `f(Y + 1 − Y′)·[q(Y), t_{ab}(Y′)] = 0`, where `f(z) = z(z − 2)` is the scalar by which
`Π₁₂R₁₃(z)R₂₃(z − 1)Π₁₂` acts on `Λ²ℂ² ⊗ ℂ²` (the argument of MNO Theorem 2.10, Steps 1–5, for this normalisation of `R`);
this settles `Y′ ∉ {Y − 1, Y + 1}`. The family `Y ↦ t(−Y)`, with values in the opposite algebra of `B`, satisfies the same
relation (for it the relation at `(u, v)` follows from those of `t` at `(−u, −v)` and `(−v, −u)`), and its `q` at `−Y − 1` is
`q(Y)`; the same argument applied to it settles `Y′ ∉ {Y, Y + 2}`. The two exceptional sets are disjoint. A second route for
the commutation, the route of the formal proof: directly, without fusion, for fixed `Y` and `Y′`, each commutator
`[q(Y), t_{ab}(Y′)]` is a linear combination of instances of the exchange relation at the four pairs `(Y + 1, Y)`,
`(Y, Y + 1)`, `(Y + 1, Y′)` and `(Y′, Y)`, multiplied on one side by entries of the three matrices `t(Y)`, `t(Y + 1)`,
`t(Y′)`, with coefficients polynomial in `Y′ − Y`; the combination is the same for every `Y′`, so no value of `Y′` is
exceptional. The last Check confirms the row form in (a), the four
expansions in (b), the centrality in (c) and (d)–(h) by an exact computation for `n ≤ 3`; that computation does not
cover the antisymmetry in (a), the eigenvalue on a highest weight vector in (c), the adjoints and the change of basis
in (i), or (j).

*Needs:* ClassicalGroups §6.6 (the column-ordered determinant `A_n(u)` and its centrality).

**Checks.**

- `n = 2`: `qdet(u) = (u + E_{11})(u − 1 + E_{22}) − E_{21}E_{12}`. Centrality against `E_{12}`: both `[(u + E_{11})(u − 1 + E_{22}), E_{12}]` and
  `[E_{21}E_{12}, E_{12}]` equal `E_{12}E_{22} − E_{12}E_{11} − 2E_{12}`. On a highest weight vector, `qdet(u)v = (u + ν₁)(u − 1 + ν₂)v`.
- `n = 2`, (d) with `i = l = 1`: `(u + E_{22})(u − 1 + E_{11}) − E_{12}E_{21} = qdet(u)`, the difference being
  `(E_{11} − E_{22}) − [E_{12}, E_{21}] = 0`; with `i = 1`, `l = 2`: `(u + E_{22})E_{12} − E_{12}(u − 1 + E_{22}) = [E_{22}, E_{12}] + E_{12} = 0`.
- `n = 2`, (e) with `(i, q, j, p) = (1, 2, 1, 2)`: `(u + 1 + E_{22})(u + E_{11}) − E_{12}E_{21} = qdet(u + 1)`, by the same computation.
- `n = 1`: `qdet(u) = u + E_{11}`; (f) is `(w + E_{11})y_1 = y_1(w + E_{11}) − y_1`, the relation `[E_{11}, y_1] = −y_1`; (g) is
  `ξ_1y_1·x_1η_1 = η_1y_1·ξ_1x_1`.
- In the algebra of differential operators in `x_1, …, x_n, z_1, …, z_n` with `E_{ab} = x_a∂_{x_b} + z_a∂_{z_b}`, `y_c = ∂_{x_c}`, `η_c = z_c`,
  the row form of (a), the four expansions of (b), the centrality of (c), and (d)–(h) hold on polynomials for `n ≤ 3`,
  and the row form, the first expansion of (b), the last two identities of (f) and (h) also for `n = 4`: an exact
  computation of the signs and shifts as written here.

### Examples

For `n = 2`, `qdet(u) = (u + E_{11})(u − 1 + E_{22}) − E_{21}E_{12}` commutes with `E_{12}`, acts on a highest weight vector by `(u + ν₁)(u − 1 + ν₂)`, and the comatrix identity (d) with `i = l = 1` reduces to `[E_{12}, E_{21}] = E_{11} − E_{22}`; for `n = 1`, `qdet(u) = u + E_{11}` and (f) is the relation `[E_{11}, y_1] = −y_1` (9.1, Checks).

### Dependencies

ClassicalGroups §6.6 (the column-ordered determinant `A_n(u)` and its centrality).

## Downstream consumers

FiniteReductiveGroups §5.11 (d), (e), Shintani descent for `GL_n` in prime degree, uses 6.1 for the eigenvalue sums of `GL_m(𝔽_{q^l})` tensor-induced to `GL_m(𝔽_{q^l}) ⋊ Gal(𝔽_{q^l}/𝔽_q)`, and 6.2. ThetaKernelsForUnitaryDualPairs §3.46 (iii) and §3.47b use 7.1 for the theta correspondence of the compact dual pairs `(U(n), U(m))`; ThetaLiftsForDefiniteUnitaryGroups §2.1 uses it for the weights and the extremal vectors of a lift between compact unitary groups; ThetaChainsOnDefiniteUnitaryGroups §3.2 uses it, in the contragredient form, for the Fock summand of a step of the chain. BesselPoincareSeriesAndGramBounds §5.13d uses 9.1 (b), (d) and (f); BesselPoincareSeriesAndGramBounds §5.18a uses 9.1 (b), (c) and (e)–(j); BesselPoincareSeriesAndGramBounds §5.18e uses 9.1 (f).

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: the character of a representation tensor-induced from a normal subgroup of prime index and the tensor induction of virtual characters, with its explicit expression (6.1); the extensions of the stable irreducible characters across a normal subgroup of prime index, their orthonormality on a nontrivial coset, and the virtual characters of norm one on that coset (6.2); the `(GL_n, GL_m)`-duality on polynomial functions on complex `n × m` matrices, for `GL_n(ℂ) × GL_m(ℂ)` and for `U(n) × U(m)` with `n, m ≥ 1`, with its highest weight vectors (7.1); and the identities of the quantum minors of `u + E` for elements satisfying the commutation relations of `𝔤𝔩_n` in any associative algebra, with the quantum determinant of a `2 × 2` matrix that satisfies the exchange relation (9.1).

Not owned here. Induction and restriction, the induced-character formula, Frobenius reciprocity, the Mackey irreducibility criterion, Clifford theory and the virtual-character ring are [InductionRestriction](../../RepresentationTheory/InductionRestriction/README.md) Layers 2, 4, 5 and 6; tensor induction along a transversal is in the Tau Ceti library, and its trace formula, for an open subgroup of finite index of a profinite group and any commutative coefficient ring, is [ArithmeticGaloisRepresentations](../../ArithmeticGaloisRepresentations/README.md) §7.1, of which 6.1 (a) is the case of a normal subgroup of prime index. Specht modules, the characters of the symmetric groups, Schur–Weyl duality on tensor powers and the balanced presentation of the Schur functor are [SchurWeyl](../../RepresentationTheory/SchurWeyl/README.md) Layers 6 and 8; the Schur functors, weights and highest weights of the general linear groups are [ClassicalGroups](../../RepresentationTheory/ClassicalGroups/README.md) Layers 2–3, and ClassicalGroups §6.6 owns the column-ordered determinant and the Capelli generators. AutomorphicLFunctionsAndLocalFactorsPartII §4.4 proves the square case `n = m` of 7.1, with highest minor vectors, for its own use. Jordan's theorem that a primitive permutation group of degree `n` containing a cycle of prime length `p ≤ n − 3` contains the alternating group, which the family uses, is in the Tau Ceti library as `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` (its cases of a transposition and a 3-cycle are in Mathlib), and is not stated here.

## Exact supplier contracts

### From TauCetiRoadmap.InductionRestriction

Layer 0: the projection formula (6.2 (a)). Layer 2: induction from a subgroup of finite index, the induced-character formula as a sum over coset representatives, and Frobenius reciprocity for characters (6.1 (b), 6.2 (a)). Layer 4: the Mackey irreducibility criterion, by which `Ind_H^Ĝ χ′` is irreducible when the conjugates of `χ′` are distinct from `χ′` (6.2 (a)). Layer 5: Clifford theory over a normal subgroup, with the inertia group of an irreducible representation of `H` (6.2 (a)). Layer 6: the virtual-character lattice, an additive subgroup of the class functions (6.1 (b), 6.2).

### From TauCetiRoadmap.SchurWeyl

§§8.1–8.3: Schur–Weyl duality on tensor powers (the simultaneous decomposition of a tensor power under the symmetric group and the general linear group), the balanced tensor presentation of the Schur functor, and the Schur-functor comparisons. Layer 6: the irreducible characters of the symmetric groups and their orthogonality (7.1).

### From TauCetiRoadmap.ClassicalGroups

Layer 2: the Schur functor `S^λ V`, the image of the Young symmetrizer of shape `λ` on `V^{⊗d}`, and the decomposition of `V^{⊗d}`. Layer 3: the maximal torus, weights and the highest-weight classification (7.1). §6.6: the column-ordered determinant `A_k(u)` in `U(𝔤𝔩_k)[u]` and the Capelli generators, its coefficients, with their centrality in `U(𝔤𝔩_k)`; `qdet(u)` of 9.1 is the image of `A_n(u)` (9.1 (c)).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§7.1: the trace formula for tensor induction. For an open subgroup `H` of finite index of a profinite group `Γ`, a transversal `t` and a representation `ρ` of `H` on a free module of finite rank, the trace of the tensor-induced representation (Tau Ceti's `Subgroup.tensorInducedRepresentation`) at `g` is the product, over the cycles of `g` on `Γ/H`, of `tr ρ(t_i⁻¹g^kt_i)`, `t_i` the representative of a coset of the cycle and `k` its length. It is used for a finite group with the discrete topology and complex coefficients (6.1 (a)).

### From Mathlib

`Representation` and `FDRep.character`; `MonoidHom.transfer` (a Check of 6.1); the orthogonality relations of the irreducible characters `FDRep.char_orthonormal`, Schur's lemma, `IsPrimitiveRoot`, cyclotomic integers, and Kronecker's theorem in the form `NumberField.Embeddings.pow_eq_one_of_norm_eq_one` (6.2).

### From Tau Ceti

`Subgroup.tensorInducedRepresentation`, tensor induction along a chosen transversal (6.1); `TauCeti.virtualCharacters` and `TauCeti.irreducibleCharacters`, the virtual-character lattice and the irreducible characters, in which `Suggested.lean` states 6.1 (b) and 6.2; `TauCeti.Matrix.GeneralLinearGroup.eq_of_mem_rationalFunctions_of_forall_unitary`, the Zariski density of the unitary group in `GL_n(ℂ)`, for the restriction to `U(n) × U(m)` (7.1).

## References

- Roger Howe, *Remarks on classical invariant theory*, Trans. Amer. Math. Soc. 313 (1989): the `(GL_n, GL_m)`-duality (7.1).
- Roger Howe, *Perspectives on invariant theory*, Israel Math. Conf. Proc. 8 (1995), §2.1: the `(GL_n, GL_m)`-duality (7.1).
- A. Molev, M. Nazarov, G. Olshanski, *Yangians and classical Lie algebras*, Russian Math. Surveys 51 (1996), arXiv:hep-th/9409025 (numbering of v2), cited as MNO: Propositions 2.4, 2.5 and 2.7 and Theorem 2.10 (the quantum determinant of the Yangian and its centrality), Remark 2.11 (its evaluation in `U(𝔤𝔩_N)`) (9.1 (c), (j)).
- **[FormalProof]** Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It is the source of the identities of the quantum minors of 9.1, of Jordan's theorem on primitive groups containing a cycle of prime length named in Scope and ownership, and of 6.1 and 6.2 in the split case, in the form given in Layer 6 (*The form of the formal proof*).
- **[Announcement]** Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
