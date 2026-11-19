# Roadmap: free probability, free products and random matrix models

**Summary.** Free probability is the noncommutative probability theory built on Voiculescu's
free independence. Unital subalgebras `A_i` of a complex algebra `A` with a linear functional `φ`,
`φ(1) = 1`, are free when `φ(a₁ ⋯ aₙ) = 0` for every product of centred elements `aⱼ ∈ A_(iⱼ)`
whose consecutive labels differ. This roadmap develops the theory as a library: distributions
and their laws, noncrossing partitions and free cumulants, free products of Hilbert spaces,
C*-algebras and von Neumann algebras, also amalgamated over a common subalgebra, full Fock space
and the free Gaussian functor, free additive and multiplicative convolution with their R- and
S-transforms, the semicircle, free Poisson and freely infinitely divisible laws, compressions,
circular and R-diagonal elements, and Gaussian and Haar unitary random matrix models. Positivity,
traciality and faithfulness of `φ` are hypotheses of the statements that use them, never part of
a definition; the analytic statements concern compactly supported laws and bounded operators.

Four theorems mark the end of the build. First, Dykema's theorem: if `(A_i, φ_i)` are unital
C*-algebras with faithful states, the vacuum state of their reduced free product is faithful, and
it is a trace when every `φ_i` is. Second, the S-transform: if `a` and `b` are free with respect
to a normalized functional and `φ(a)`, `φ(b)` are nonzero, then `S_(ab) = S_a S_b`, with no trace
needed; for compactly supported laws on `[0, ∞)` this computes the free multiplicative
convolution. Third, the free Lévy–Khintchine theorem: a compactly supported probability measure
on `ℝ` has compactly supported free convolution roots of every order if and only if its free
cumulants are conditionally positive, `∑_(i,j=1)^r c̄ᵢ cⱼ κ_(i+j) ≥ 0` for every `r` and `c ∈ ℂ^r`,
equivalently `R_μ(z) = κ₁ + ∫ z/(1 − tz) dρ(t)` for a finite positive compactly supported `ρ`.
Fourth, asymptotic freeness in expected normalized-trace moments: independent `N × N` GUE matrices
are asymptotically free from any deterministic matrices whose normalized-trace star-moments
converge, and so are the conjugates `U A U*` of one such family by a Haar unitary `U` from another
such family, with no bound on operator norms; behind the second statement, the unitary Weingarten
function satisfies `Wg(N, σ) = N^(#cycles(σ) − 2k)(Möb(σ) + O(N⁻²))`.

The roadmap rests on Tau Ceti's scalar free probability: free independence, joint and star
distributions, laws of selfadjoint elements, convergence in moments, the lattice of noncrossing
partitions with its Kreweras complement and Möbius function, free cumulants and the free central
limit theorem; it adds the operator-algebraic, analytic and matrix layers on top.
[RandomMatrices](../RandomMatrices/README.md) supplies its bounded scalar core (its Layer 6: the
reduced-word free product with positive state, free convolution of compactly supported laws with its
analytic transforms, the free Poisson limit and the Weingarten formula), which the layers here
extend, and the spectral measures of matrices and the Gaussian ensembles used in the last layer.
[CStarAlgebras](../CStarAlgebras/README.md), [VonNeumannAlgebras](../VonNeumannAlgebras/README.md)
and [HilbertModules](../HilbertModules/README.md) supply the operator algebras, representations and
Hilbert C*-modules on which the free products are built. FactorRigidity, Subfactors,
CategoricalOperatorAlgebras and QuantumGroups consume the free products and Fock models.

Layers 1 and 2 complete the algebraic and combinatorial foundation: bounded realizations of
distributions, plane trees, the geodesic characterization of noncrossing partitions, the general
Möbius function and low-order cumulants. Layers 3 and 4 build reduced and full free products with
prescribed states, and with prescribed conditional expectations over a common subalgebra. Layer 5
builds the free cumulants of laws and the formal transforms that compute free convolution. Layers 6
and 7 develop the
semicircle, free Poisson and infinitely divisible laws, compressions and R-diagonal elements.
Layer 8 builds the Gaussian and Haar matrix models. This README is the roadmap; every target and
Check is required. [Suggested.lean](Suggested.lean) is the acceptance test: it states the headline
theorems that are statable at the pins, and its module docstring names the others and what each
lacks.

## How to read the build

Layer `k` is the former section `Fk` of this roadmap, and other roadmaps cite it as "FreeProbability
F`k`"; its numbered sections `k.n` refine it. Layer 1 needs only Tau Ceti's scalar free probability
and the von Neumann algebra suppliers. Layer 2 needs only Tau Ceti's noncrossing partitions and free
cumulants. Layer 3 needs the operator-algebra suppliers and RandomMatrices §6.2, and §2.2 for the
free Gaussian functor; Layer 4 needs Layer 3 and HilbertModules. Layer 5 needs Layers 2 and 3 and
RandomMatrices §6.3, which supplies the free convolutions of measures and their analytic transforms;
the formal series need only Layer 2. Layer 6 needs Layers 2, 3 and 5 and RandomMatrices §6.4; Layer 7
needs Layers 2, 3, 5 and 6. Layer 8 needs Layer 2 for its combinatorics, §3.9 for the comparison with
the free Wick formula, Layer 5 for its measure-level conclusions and RandomMatrices for its ensembles
and the Weingarten formula; its moment statements need no operator algebra. Each section
ends with a `*Needs:*` line listing what its statements and its route use, so that a target proved
by another route is not blocked behind an unrelated layer, and each layer ends with its examples
and its dependencies.

## Conventions

1. **Noncommutative probability spaces.** A noncommutative probability space is a unital complex
   algebra `A` (`[Ring A] [Algebra ℂ A]`) with a linear functional `φ : A →ₗ[ℂ] ℂ`; normalization
   `φ 1 = 1` is a hypothesis of the statements that use it. A star-probability space adds
   `[StarRing A] [StarModule ℂ A]` and positivity `0 ≤ φ (star a * a)` in the order of
   `ComplexOrder`. A C*-probability space is a unital C*-algebra (`[CStarAlgebra A]
   [PartialOrder A] [StarOrderedRing A]`) with a positive linear map `φ : A →ₚ[ℂ] ℂ` and
   `φ 1 = 1`; its continuity and norm `‖φ‖ = φ 1` are Mathlib's. A W*-probability space is a von
   Neumann algebra `M` (Mathlib's `VonNeumannAlgebra H`) with a specified normal state. A state is
   *tracial* when `φ (a * b) = φ (b * a)` and *faithful* when `φ (star a * a) = 0` implies `a = 0`;
   both are separate hypotheses, and an algebraic expectation is never silently positive or
   tracial.
2. **Distributions.** The joint distribution of a family `a : ι → A` is Tau Ceti's
   `TauCeti.jointDistribution φ a = φ ∘ FreeAlgebra.lift ℂ a` on noncommutative polynomials. Its
   star-distribution `TauCeti.starDistribution φ a` evaluates on Tau Ceti's star-polynomials
   `TauCeti.StarPolynomial ℂ ι`, the free algebra on `ι × Bool` (`(i, false)` is `Xᵢ` and
   `(i, true)` is `Xᵢ*`) with the conjugate-linear involution that conjugates coefficients,
   reverses words and exchanges `Xᵢ` with `Xᵢ*`, not Mathlib's star on `FreeAlgebra`, which fixes
   coefficients and generators. Commutative polynomials do not encode noncommutative words.
3. **Freeness.** Free independence of unital subalgebras is `TauCeti.IsFreelyIndependent φ B`, of
   elements `TauCeti.IsFreelyIndependentElements φ a` (the unital subalgebras generated by the
   individual elements are free) and of elements with their adjoints
   `TauCeti.IsStarFreelyIndependentElements φ a`. Labels that are not adjacent in a word may
   coincide.
4. **Words, traces and inner products.** Products in a word follow its displayed order; in Lean a
   word is an ordered list. Inner products are conjugate-linear in the first argument (Mathlib).
   `tr_N = N⁻¹ Tr` is the normalized trace on `N × N` complex matrices.
5. **Noncrossing partitions and cumulants.** `NC(n)` is Tau Ceti's lattice
   `TauCeti.NoncrossingPartition (Finset.univ : Finset (Fin n))` of noncrossing `Finpartition`s
   under refinement; `NC(0)` consists of the empty partition. Its Möbius function is
   `IncidenceAlgebra.mu`. The free cumulants are `κ_n(a₁, …, aₙ) = TauCeti.freeCumulant φ a univ`
   for `n ≥ 1` and `κ_π` is `TauCeti.partitionCumulant`; the value at `n = 0` carries no meaning.
   The Kreweras complement `K(π)` lives on the interlaced positions `1, 1̄, 2, 2̄, …, n, n̄`, the bar
   after `x` labelled by `x` (`TauCeti.NoncrossingPartition.kreweras`). Permutations compose with
   the right factor acting first, `γ = (1 2 … n)` is `finRotate n`, a block of `π` is a cycle of
   its permutation `p_π` in increasing cyclic order, and `p_(K(π)) = p_π⁻¹ γ`, so `K²` is rotation
   by `γ⁻¹`. Cycle counts include fixed points (`TauCeti.orbitCount`).
6. **Series.** The moment series is `M(z) = 1 + ∑_(n≥1) m_n zⁿ` (`TauCeti.momentSeries`), the
   cumulant series `C(z) = 1 + ∑_(n≥1) κ_n zⁿ = 1 + z R(z)` (`TauCeti.freeCumulantSeries`) and the
   scalar R-transform `R(z) = ∑_(n≥1) κ_n z^(n−1)` (`TauCeti.rSeries`). The multivariable
   R-series has no constant term and has the cumulants `κ_n` as its degree-`n` coefficients, so its
   one-variable version is `z R(z)`; each identity says which convention it uses. Formal identities
   are proved coefficientwise and do not assert global invertibility of analytic transforms.
7. **Analytic transforms.** The analytic transforms concern compactly supported probability
   measures on `ℝ`. The Cauchy transform is `G_μ(z) = ∫ (z − t)⁻¹ dμ(t) = −resolventTransform μ z`,
   since Mathlib's `MeasureTheory.resolventTransform` integrates `(t − z)⁻¹`.
8. **Semicircular normalization.** On full Fock space `s(h) = ℓ(h) + ℓ(h)*`, where the creation
   operators satisfy `ℓ(h)* ℓ(k) = ⟪h, k⟫ 1`, has variance `‖h‖²` and support `[−2‖h‖, 2‖h‖]`;
   Voiculescu–Dykema–Nica normalize the Gaussian element by one half, so their element is `s(h)/2`.
   The centred semicircle law of variance `v ≥ 0` is Tau Ceti's
   `TauCeti.Probability.semicircleReal 0 v`, the Dirac mass at `0` when `v = 0`; a semicircular
   element is `TauCeti.IsSemicircular φ a v`.
9. **Library vocabulary.** Mathlib's `Algebra`, `LinearMap`, `Subalgebra`, `StarSubalgebra`,
   `PositiveLinearMap`, `FreeAlgebra`, `IncidenceAlgebra`, `Finpartition`, `Polynomial`,
   `PowerSeries`, `catalan`, probability measures and Bochner integrals are used directly; no
   second partition carrier, inverse incidence function or Catalan sequence is introduced.
10. **Random matrices.** A random matrix is a map `Ω → Matrix (Fin N) (Fin N) ℂ` on a probability
    space, measurable for Mathlib's entrywise structure; Gaussian and Haar models may live on
    different probability spaces for different `N`. A random unitary is Haar distributed when its
    law on `Matrix.unitaryGroup (Fin N) ℂ` is Tau Ceti's `TauCeti.haarProb`.

## Layer 1: distributions, moments and free independence

This layer works with Tau Ceti's joint and star distributions, laws of selfadjoint elements,
convergence in moments and free independence (Conventions 2–3). Its targets are the bounded
realizations of positive distributions and the passage of freeness to weak closures. Sources:
Nica–Speicher, Lectures 1–7.

### 1.1 Bounded realizations of positive distributions

Let `χ : StarPolynomial ℂ ι →ₗ[ℂ] ℂ` be a star-distribution with `χ 1 = 1` that is positive,
`χ (star p * p) ≥ 0` for every star-polynomial `p`; it is a `TauCeti.StarPositiveFunctional`, and
its algebraic GNS realization (the pre-Hilbert space, the representation of the star-polynomials
by unbounded operators on it, and the unit cyclic vector) is Tau Ceti's. Fix bounds `R : ι → ℝ≥0`.

- Prove that if `χ (star p * star Xᵢ * Xᵢ * p) ≤ Rᵢ² χ (star p * p)` and
  `χ (star p * Xᵢ * star Xᵢ * p) ≤ Rᵢ² χ (star p * p)` for every `i` and every star-polynomial `p`,
  then left multiplication by `Xᵢ` and by `Xᵢ*` on the GNS pre-Hilbert space is bounded with norm
  at most `Rᵢ`, the two are adjoint, and they extend to the completion `H_χ`. The extension is a
  unital star homomorphism `π_χ` from the star-polynomials to the bounded operators on `H_χ` with
  `‖π_χ(Xᵢ)‖ ≤ Rᵢ`, and `χ` is the vector state of the cyclic vector on the norm closure of its
  image, a unital C*-algebra (Nica–Speicher, Lectures 1–7).
- Characterize bounded realizations: `χ` is the star-distribution of a family `b` in a unital
  C*-algebra with a state, with `‖bᵢ‖ ≤ Rᵢ` for every `i`, if and only if the inequalities above
  hold for every `i` and `p`.
- Prove that a uniform exponential bound `|χ w| ≤ R ^ length w` on all words `w` in the generators
  and their adjoints, for one `R ≥ 0`, implies the inequalities with `Rᵢ = R`, by iterated
  Cauchy–Schwarz: `χ(p* X* X p) ≤ χ(p* p)^(1 − 2^(−m)) χ(p* (X* X)^(2^m) p)^(2^(−m))` for every `m`,
  and the last factor is at most `(C R^(2^(m+1)))^(2^(−m))` with `C` depending only on `p`.

Positivity alone gives the algebraic realization and no boundedness.
*Needs:* Tau Ceti `TauCeti.StarPolynomial`, `TauCeti.starDistribution`,
`TauCeti.StarPositiveFunctional` with its `GNS`, `representation` and `cyclicVector`; Mathlib
`UniformSpace.Completion`, `ContinuousLinearMap.adjoint`, `StarSubalgebra.topologicalClosure`,
`CStarAlgebra`, `PositiveLinearMap`.

**Checks.**
- The standard Gaussian moments on one selfadjoint generator, `χ(X^(2n)) = (2n − 1)!!` and odd
  moments `0`, form a positive normalized distribution (the moments of `gaussianReal 0 1`), but
  `(2n − 1)!!` outgrows `R^(2n)` for every `R`, so no bounded realization exists: a criterion
  using positivity alone would accept it.
- For a semicircular distribution of variance `v > 0`, the inequality at `p = Xⁿ` reads
  `catalan (n + 1) v^(n+1) ≤ R² catalan n vⁿ`. The ratio `catalan (n + 1) / catalan n =
  2(2n + 1)/(n + 2)` increases to `4`, so the least admissible `R` is `2√v`, the norm of a
  semicircular element of variance `v`; the standard deviation `R = √v` already fails at `n = 1`,
  where the ratio is `2`.

### 1.2 Freeness and weak closures

Let `M ⊆ B(H)` be a von Neumann algebra with a normal state `φ`. Prove that if unital star
subalgebras `A_i ⊆ M` are free with respect to `φ`, then so are the von Neumann algebras they
generate, their weak operator closures (Nica–Speicher, Lectures 1–7); neither faithfulness nor
traciality of `φ` is needed. The norm
closure case is Tau Ceti's `TauCeti.IsFreelyIndependent.topologicalClosure`, which needs jointly
continuous multiplication and so does not cover the weak operator topology. *Route:* Kaplansky
density approximates each letter of a centred alternating word by a bounded net in `A_i`
converging in the strong operator topology; on bounded sets multiplication is jointly strongly
continuous and the normal state `φ` is strongly continuous, and recentring the approximants keeps
them in `A_i` (the same argument for a normal conditional expectation is Houdayer–Raum,
Proposition 2.22).
*Needs:* Tau Ceti `TauCeti.IsFreelyIndependent`, `TauCeti.IsFreelyIndependent.topologicalClosure`,
`VonNeumannAlgebra.adjoin`; VonNeumannAlgebras Layer 1 (operator topologies, Kaplansky density) and
Layer 4 (normal states); Mathlib `VonNeumannAlgebra`.

### Examples

- For free centred `a` and `b`, `φ(abab) = 0` and `φ(a²b²) = φ(a²)φ(b²)` (Tau Ceti
  `TauCeti.IsFreelyIndependent.apply_mul_mul_mul_of_ne`). For two free standard semicircular
  elements `s₁, s₂` this gives `φ(s₁s₂s₁s₂) = 0` and `φ(s₁²s₂²) = 1`, while two independent
  standard Gaussian variables give `1` for both words: freeness is not classical independence.
- Scalars are free from every family, and a family with at most one member is free (Tau Ceti
  `TauCeti.isFreelyIndependent_domRestrict_iff`, `TauCeti.isFreelyIndependent_of_subsingleton`).
- The law of a selfadjoint element `a` with `‖a‖ ≤ r` under a state is a probability measure on
  `[−r, r]` with moments `φ(aⁿ)` (`PositiveLinearMap.law`), and two such elements with the same
  moments have the same law (`PositiveLinearMap.law_eq_law_iff_forall_apply_pow`).

### Dependencies

Tau Ceti's scalar free probability (distributions, star distributions, freeness and star freeness,
laws of selfadjoint elements, convergence in moments, freeness under norm closure) and its
algebraic GNS construction; VonNeumannAlgebras Layers 1 and 4; Mathlib C*-algebras, positive
linear maps and von Neumann algebras.

## Layer 2: noncrossing partitions and free cumulants

This layer works on Tau Ceti's lattice `NC(n)` with its Kreweras complement, Möbius function,
permutation model and free cumulants (Convention 5); its targets complete the combinatorics that
the later layers use. Sources: Nica–Speicher, Lectures 9–11, in particular Theorems 11.12 and
11.16.

### 2.1 Plane trees

A rooted plane tree is a rooted tree in which the children of every vertex are linearly ordered;
encode it as a rose tree (a vertex is the list of its subtrees). Label the non-root vertices of a
plane tree with `n` edges by `1, …, n` in depth-first (preorder) order. Prove that the sets of
children of the vertices that have children are the blocks of a noncrossing partition of `{1, …, n}`,
and that this defines a bijection `T` from plane trees with `n` edges onto `NC(n)`, under which the
number of blocks of `T(t)` is the number of vertices of `t` with at least one child and the
noncrossing pairings correspond to the trees in which every vertex has zero or two children
(Kortchemski–Marzouk, §2.1 and Proposition 4). The
count `|NC(n)| = catalan n` is Tau Ceti's `TauCeti.NoncrossingPartition.card_fin_eq_catalan`.
*Needs:* Tau Ceti `TauCeti.NoncrossingPartition`, `Finpartition.IsNoncrossing`; Mathlib `catalan`.

**Checks.**
- For `n = 3`: the path of length three (root, then one child at each level) gives the partition
  into singletons, three blocks for its three vertices with children; the root with three children
  gives the one-block partition. The five plane trees with three edges match the five elements of
  `NC(3)`.
- The tree whose root has two children, the first of which has one child, has depth-first labels
  `1, 2` (the first child and its child) and `3` (the second child of the root), so it maps to
  `{1, 3}{2}`; the tree whose root has two children, the second of which has one child, maps to
  `{1, 2}{3}`. Breadth-first labelling would send both trees to `{1, 2}{3}`: it is not injective.

### 2.2 The permutation model and the geodesic characterization

The permutation `p_π` of a partition cycles each block in increasing order
(`Finpartition.formPerm`); the identity `p_(K(π)) = p_π⁻¹ γ` (Tau Ceti
`TauCeti.NoncrossingPartition.formPerm_kreweras`), the count
`#cycles(p_π) + #cycles(p_π⁻¹ γ) = n + 1` for `π ∈ NC(n)`, `n ≥ 1`
(`TauCeti.NoncrossingPartition.orbitCount_formPerm_add_orbitCount_inv_mul_finRotate`), the bound
`#cycles(γσ) + #cycles(σ) ≤ n + 1` for every `σ ∈ S_n` (`Equiv.Perm.orbitCount_finRotate_mul_add_orbitCount_le`)
and the noncrossing-pairing criterion for involutions
(`Function.Involutive.orbitCount_finRotate_mul_add_orbitCount_eq_iff`) are Tau Ceti's.

- Prove the geodesic characterization (Biane): for `n ≥ 1` and `σ ∈ S_n`,
  `#cycles(σ) + #cycles(σ⁻¹ γ) = n + 1` if and only if `σ = p_π` for some `π ∈ NC(n)`, and then `π` is
  the partition of `{1, …, n}` into the cycles of `σ`. Equivalently, with `|σ| = n − #cycles(σ)` the
  least number of transpositions whose product is `σ`, `|σ| + |σ⁻¹ γ| = |γ| = n − 1`.
- Prove the cycle-count formulas `#cycles(p_π) = #blocks(π)` and
  `#cycles(p_π⁻¹ γ) = #blocks(K(π))` for `π ∈ NC(n)`, so that the geodesic count is the block count
  `#blocks(π) + #blocks(K(π)) = n + 1` of Tau Ceti's
  `TauCeti.NoncrossingPartition.card_parts_add_card_parts_kreweras`.

The noncrossing-pairing criterion is the case of involutions; Layer 8 uses both.
*Needs:* Tau Ceti `Finpartition.formPerm`, `TauCeti.NoncrossingPartition.formPerm_kreweras`,
`TauCeti.NoncrossingPartition.orbitCount_formPerm_add_orbitCount_inv_mul_finRotate`,
`Equiv.Perm.orbitCount_finRotate_mul_add_orbitCount_le`, `TauCeti.orbitCount`; Mathlib
`Equiv.Perm`, `finRotate`.

**Checks.**
- In `S_4`, `σ = (1 3)` is `p_π` for the noncrossing `π = {1, 3}{2}{4}`: `σ` has `3` cycles and
  `σ⁻¹ γ = (1 2)(3 4)` has `2`, total `5 = n + 1`. The crossing pairing `(1 3)(2 4)` has `2` cycles
  and `σ⁻¹ γ = (1 4 3 2)` has `1`, total `3`, short of `5` by twice the genus `1`.
- `(1 2 3)` is `p_π` for `π = {1, 2, 3}{4}` and gives `2 + 3 = 5`, while `(1 3 2)`, with the same
  cycle set but decreasing order, gives `2 + 1 = 3`: the characterization depends on the
  orientation of the cycles, so cycling blocks in decreasing order would be wrong.

### 2.3 Intervals and the Möbius function

The lower intervals `[0_n, π] ≅ ∏_(B ∈ π) NC(B)` and the values `μ(0, π)` are Tau Ceti's
(`TauCeti.NoncrossingPartition.iicOrderIso`, `TauCeti.NoncrossingPartition.mu_bot_eq_prod`,
`TauCeti.NoncrossingPartition.mu_bot_top_fin`).

- Prove that every interval of `NC(n)` is a product of smaller noncrossing-partition lattices: for
  `σ ≤ π`, `[σ, π] ≅ ∏_(B ∈ π) [σ|_B, 1_B]`, and the Kreweras complement relative to `B` is an order
  anti-isomorphism of `[σ|_B, 1_B]` onto `[0_B, K_B(σ|_B)]`, a lower interval
  (Nica–Speicher, Lectures 9–10).
- Prove the multiplicativity of the Möbius function and its blockwise formula:
  `μ(σ, π) = ∏_(B ∈ π) ∏_(C ∈ K_B(σ|_B)) (−1)^(|C| − 1) catalan(|C| − 1)`, and the two directions of
  Möbius inversion on intervals: if `f(π) = ∑_(σ ≤ π) g(σ)` for all `π` then
  `g(π) = ∑_(σ ≤ π) μ(σ, π) f(σ)`, and conversely. This Möbius function is the one of the lattice
  `NC(n)` (`IncidenceAlgebra.mu`), unrelated to the arithmetic Möbius function.

*Needs:* Tau Ceti `TauCeti.NoncrossingPartition.iicOrderIso`,
`TauCeti.NoncrossingPartition.kreweras`, `TauCeti.NoncrossingPartition.mu_bot_eq_prod`; Mathlib
`IncidenceAlgebra.mu`, `IncidenceAlgebra.moebius_inversion_bot`.

**Checks.**
- `μ({1, 2}{3}{4}, 1_4) = 2` and `μ({1, 3}{2}{4}, 1_4) = 1`: the upper interval of the first is
  isomorphic to `NC(3)` (the complement `{1}{2, 3, 4}`), while `{1, 3}{2, 4}` crosses, so the second
  interval has only four elements (the complement `{1, 2}{3, 4}`). A formula depending only on the
  block sizes of `σ`, as in the lattice of all partitions, would give `2` for both.
- `μ(0_4, 1_4) = −5 = (−1)³ catalan 3`, while in the lattice of all partitions of four points it is
  `−6 = (−1)³ 3!`.

### 2.4 Cumulants of low order

The cumulants of order one and two, `κ₁(a) = φ(a)` and `κ₂(a, b) = φ(ab) − φ(a)φ(b)`, are Tau
Ceti's (`TauCeti.freeCumulant_singleton`, `TauCeti.freeCumulant_pair`). Prove the closed forms of
orders three and four with distinct arguments (Nica–Speicher, Lecture 11):

- `κ₃(a, b, c) = φ(abc) − φ(ab)φ(c) − φ(ac)φ(b) − φ(a)φ(bc) + 2φ(a)φ(b)φ(c)`;
- `κ₄(a₁, a₂, a₃, a₄) = ∑_(π ∈ NC(4)) μ(π, 1₄) φ_π(a₁, …, a₄)`, with coefficient `1` for the
  one-block partition, `−1` for the four partitions with a block of three and for `{1, 2}{3, 4}` and
  `{1, 4}{2, 3}`, `2` for the pairs `{1, 2}`, `{2, 3}`, `{3, 4}`, `{1, 4}` with singletons, `1` for the
  pairs `{1, 3}` and `{2, 4}` with singletons, and `−5` for the partition into singletons;

and their repeated-argument forms with `mₖ = φ(aᵏ)`: `κ₃(a, a, a) = m₃ − 3m₂m₁ + 2m₁³`,
`κ₄(a, a, a, a) = m₄ − 4m₃m₁ − 2m₂² + 10m₂m₁² − 5m₁⁴`, and conversely
`m₃ = κ₃ + 3κ₂κ₁ + κ₁³`, `m₄ = κ₄ + 4κ₃κ₁ + 2κ₂² + 6κ₂κ₁² + κ₁⁴`.
*Needs:* §2.3; Tau Ceti `TauCeti.freeCumulant`, `TauCeti.freeCumulant_eq_sum_mu_mul_partitionMoment`,
`TauCeti.apply_prod_ofFn_eq_sum_prod_freeCumulant`.

**Checks.**
- For a centred variable `κ₄ = m₄ − 2m₂²`, against the classical fourth cumulant `m₄ − 3m₂²`: the
  standard semicircle (`m₂ = 1`, `m₄ = 2`) has free `κ₄ = 0` and classical fourth cumulant `−1`,
  and the standard Gaussian (`m₄ = 3`) has free `κ₄ = 1` and classical fourth cumulant `0`.
- The term `φ(a₁a₃)φ(a₂a₄)` of the crossing partition does not occur in `κ₄`; the sum of the
  coefficients over `NC(4)` is `1 − 6 + 8 + 2 − 5 = 0`, as it must be for `n ≥ 2` (all arguments
  equal to `1`).

### 2.5 Freeness tested on generators

Tau Ceti proves that unital subalgebras are free exactly when their mixed cumulants vanish
(`TauCeti.isFreelyIndependent_iff_freeCumulant_eq_zero`). Prove the generator test (Nica–Speicher,
Lecture 11): for `φ 1 = 1` and a family `a : ι → A`, the family is free
(`TauCeti.IsFreelyIndependentElements φ a`) if and only if `κ_n(a_(i₁), …, a_(iₙ)) = 0` for every
`n ≥ 2` and all labels `i₁, …, iₙ` that are not all equal; and it is star-free
(`TauCeti.IsStarFreelyIndependentElements φ a`) if and only if the same holds for words whose letters
are `a_(iⱼ)` or `a_(iⱼ)*`. More generally, the unital subalgebras generated by sets `G_i` are free if
and only if the mixed cumulants with arguments in `⋃ G_i` vanish. *Route:* multilinearity reduces
letters of the generated algebras to products of generators, and the formula for cumulants with
products as arguments (Tau Ceti `TauCeti.freeCumulant_fiberProd`) expresses a mixed cumulant of
products through cumulants in the generators along partitions `π` with `π ∨ σ = 1_n`, each of which
has a mixed block.
*Needs:* Tau Ceti `TauCeti.isFreelyIndependent_iff_freeCumulant_eq_zero`,
`TauCeti.freeCumulant_fiberProd`, `TauCeti.freeCumulant_update_add`,
`TauCeti.freeCumulant_update_smul`, `TauCeti.freeCumulant_eq_zero_of_apply_eq_one`.

**Checks.**
- A non-scalar `a` is not free from itself: the family `(a, a)` has the mixed cumulant
  `κ₂(a, a) = φ(a²) − φ(a)² ≠ 0`. A test that only looked at cumulants of order at least three
  would miss this.
- For two free standard semicircular elements, `κ₂(s₁ + s₂, s₁ − s₂) = κ₂(s₁, s₁) − κ₂(s₂, s₂) = 0`,
  and all other mixed cumulants of `s₁ ± s₂` vanish because only `κ₂` survives; so `s₁ + s₂` and
  `s₁ − s₂` are free, as for a rotation of a semicircular system (§6.3).

### Examples

- `NC(4)` has `14` elements, all partitions of four points except `{1, 3}{2, 4}`; six of them have
  two blocks (the Narayana number), and two of the three pairings of four points are noncrossing.
- The Kreweras complement of `{1, 2}{3}{4}` is `{1}{2, 3, 4}`: the bar after `1` lies between the
  positions `1` and `2` of one block and is isolated, and the bars after `2`, `3` and `4` can be
  joined.
- `μ(0_n, 1_n)` for `n = 1, …, 6` is `1, −1, 2, −5, 14, −42`.

### Dependencies

Tau Ceti noncrossing partitions (lattice, Catalan and Narayana counts, Kreweras complement,
permutation model, lower intervals, Möbius values, rotation and reversal) and free cumulants
(definition, moment–cumulant formulas, multiplicativity, products as arguments, multilinearity,
freeness criterion, Kreweras product formulas); Mathlib `Finpartition`, `IncidenceAlgebra`,
`catalan`, `Equiv.Perm`.

## Layer 3: Hilbert free products, Fock space and operator algebras

This layer builds free products with prescribed states: algebraic, full and reduced C*-algebraic,
and von Neumann algebraic, together with full Fock space and the free Gaussian functor. On the
reduced-word Hilbert space of RandomMatrices §6.2 it owns the right representations, the commutants
and their modular and trace compatibility. Sources:
Voiculescu–Dykema–Nica, §§1.4–1.6 and Theorem 2.6.2; Nica–Speicher, Lectures 6–7; Dykema,
Theorem 1.1.

### 3.1 The algebraic free product and its reduced words

The unital free product of a family `(A_i)_(i ∈ I)` of complex algebras is Mathlib's
`LinearAlgebra.FreeProduct ℂ A` with its universal property `LinearAlgebra.FreeProduct.lift`; for
star algebras its star structure and the star-homomorphism universal property are Tau Ceti's
(`LinearAlgebra.FreeProduct.instStarRing`, `LinearAlgebra.FreeProduct.liftStar`). For normalized
functionals `φ_i` on the `A_i`, put `A_i° = ker φ_i`, so that `A_i = ℂ1 ⊕ A_i°`. Prove that the
linear map `ℂ ⊕ ⊕_(n ≥ 1, i₁ ≠ i₂ ≠ ⋯ ≠ iₙ) A_(i₁)° ⊗ ⋯ ⊗ A_(iₙ)° → FreeProduct ℂ A`, sending
`a₁ ⊗ ⋯ ⊗ aₙ` to the product `ι(a₁) ⋯ ι(aₙ)`, is a linear isomorphism (consecutive labels distinct,
nonadjacent ones arbitrary), and that the functional reading off the `ℂ` component restricts to
`φ_i` on each `A_i` and makes the images of the `A_i` free; it is the only normalized functional
with these two properties (Tau Ceti `TauCeti.IsFreelyIndependent.eqOn_iSup`). The empty product is
`ℂ` (Voiculescu–Dykema–Nica, §1.4). Positivity of this functional for positive `φ_i` is not
asserted here: it comes from the realization of §3.4.
*Needs:* Mathlib `LinearAlgebra.FreeProduct`, `LinearAlgebra.FreeProduct.lift`, `DirectSum`,
`TensorProduct`; Tau Ceti `LinearAlgebra.FreeProduct.liftStar`, `TauCeti.IsFreelyIndependent`,
`TauCeti.IsFreelyIndependent.eqOn_iSup`.

**Checks.**
- For `A₁ = A₂ = ℂ²` with `φ_i(x) = (x₁ + x₂)/2`, each `A_i°` is spanned by the symmetry
  `u_i = (1, −1)` with `u_i² = 1`; the reduced words are the alternating products of `u₁` and `u₂`,
  two of each length `n ≥ 1`, so the free product is the group algebra of `ℤ/2 ∗ ℤ/2` (the infinite
  dihedral group), and the free product functional is its canonical trace. A decomposition that did
  not centre the letters would count `1` among the letters of every factor and overcount.

### 3.2 The full C*-free product

For a family of nontrivial unital C*-algebras, construct the full unital C*-free product as the
completion of the algebraic free product for the universal C*-seminorm, the supremum of
`‖π(x)‖` over unital star representations. To keep the supremum in one universe, take it over
cyclic representations on Hilbert spaces of density at most `κ = max(ℵ₀, ∑_i |A_i|, |I|)`, realized
on a fixed family of model spaces of cardinality at most `κ^ℵ₀`, and prove that it agrees with the
supremum over representations in every larger universe, is finite on every word, and that the
completion has the universal property for unital star homomorphisms into C*-algebras. Prove that
every factor embeds: a faithful representation of `A_i` (VonNeumannAlgebras Layer 0), on a nonzero
space since `A_i` is nontrivial, with a chosen unit vector, gives through §3.3 a representation of
the free product that is injective on `A_i`; no faithful state on `A_i` is needed. The empty product
is `ℂ`. Supply relabeling, grouping and the universal maps. The reduced product of §3.4 is a
different completion, determined by input states (Voiculescu–Dykema–Nica, §1.4).
*Needs:* §§3.1, 3.3; VonNeumannAlgebras Layer 0 (states, GNS, faithful representations); Mathlib
`CStarAlgebra`, `UniformSpace.Completion`, `Cardinal`.

**Checks.**
- The full product of two copies of `C(𝕋)` is the full group C*-algebra of the free group on two
  generators (§3.6); its trivial character sends both generators to `1`, a character that the
  reduced product does not have.

### 3.3 Free products of pointed Hilbert spaces

For Hilbert spaces `H_i` with unit vectors `ξ_i` put `H_i° = H_i ⊖ ℂξ_i`. The reduced-word Hilbert
space

```
H = ℂΩ ⊕ ⊕_(n ≥ 1, i₁ ≠ i₂ ≠ ⋯ ≠ iₙ) H_(i₁)° ⊗ ⋯ ⊗ H_(iₙ)°
```

an ℓ²-direct sum of completed Hilbert tensor products, with its vacuum `Ω`, its inner product and
the bounded left representations `λ_i` of representations `π_i : A_i → B(H_i)`, is the free-product
construction of RandomMatrices §6.2. Give the inclusions, the word projections, the density of
finite sums of elementary tensors, and the canonical unitaries `V_i : H_i ⊗ H(i) ≅ H`, where `H(i)`
is spanned by `Ω` and the words not starting in `i`, with `λ_i(a) = V_i (π_i(a) ⊗ 1) V_i*`. Construct
the right representations `ρ_i`, defined with the reversed-word convention, prove their adjoint,
norm, unit and multiplication identities, and prove that `λ_i` commutes with `ρ_j` for `i ≠ j`. For
arbitrary unit vectors `ξ_i` prove `ker λ_i = ker π_i` (Voiculescu–Dykema–Nica, §1.5).
*Needs:* RandomMatrices §6.2; Mathlib `lp`, `IsHilbertSum`, `TensorProduct` with its inner product,
`UniformSpace.Completion`, `Submodule.orthogonal`; VonNeumannAlgebras Layer 2 (completed Hilbert
tensor products).

**Checks.**
- If every `H_i = ℂξ_i`, every `H_i°` is zero and `H = ℂΩ`; each `λ_i` is then the character of
  `A_i` given by the vector state of `ξ_i`, whose kernel is `ker π_i`.

### 3.4 The reduced C*-free product

For unital C*-algebras with states `(A_i, φ_i)`, take the GNS representations with their cyclic
vectors as pointed inputs (Mathlib `PositiveLinearMap.gnsStarAlgHom`, Tau Ceti
`PositiveLinearMap.gnsVector`). The vacuum state `x ↦ ⟪Ω, x Ω⟫`, positive, restricting to `φ_i` on
each factor and making the factors free, is RandomMatrices §6.2's. The reduced C*-free product is
the norm-closed algebra generated by the `λ_i(A_i)`; prove that its GNS space for the vacuum state is `H` and that its factor representations have
exactly the kernels of the input GNS representations. Faithfulness of an input state is distinct
from faithfulness of its GNS representation; characterize the kernel of the latter by
`a ∈ ker π_φ ↔ ∀ b, φ(b* a* a b) = 0` (Voiculescu–Dykema–Nica, §1.5).
*Needs:* §3.3; RandomMatrices §6.2; Mathlib `PositiveLinearMap.GNS`,
`PositiveLinearMap.gnsStarAlgHom`; Tau Ceti `PositiveLinearMap.gnsVector`,
`TauCeti.IsFreelyIndependent.inner_gnsStarAlgHom_prod_gnsVector`.

**Checks.**
- On `ℂ²` with the state `φ(z, w) = z`, the kernel criterion gives `φ(b*a*ab) = |b₁|²|a₁|²`, so the
  GNS kernel is `{(0, w)}`; the reduced product of this single factor is `ℂ`, not `ℂ²`.
- The inner products of reduced words in the GNS space vanish for different label sequences (Tau
  Ceti `TauCeti.IsFreelyIndependent.inner_gnsStarAlgHom_prod_gnsVector`), which is the
  orthogonality of the summands of `H`.

### 3.5 Faithfulness, traces and expectations onto factors

Develop expectation-preserving identifications, the regrouping of reduced free products, and the
quotient map from the full onto the reduced product. Prove Dykema's theorem: if every input state
`φ_i` is faithful, the vacuum state of the reduced product is faithful, by separating points of the
reduced C*-algebra through compression to its shortest words (Dykema, Theorem 1.1); factors equal
to `ℂ` are removed before the nontrivial-factor form of the argument is applied. If only the GNS
representations of the `φ_i` are faithful, prove that the factor maps into the reduced product are
injective. Prove that tracial inputs give a tracial vacuum state.

Prove the intrinsic characterization of the reduced product (Dykema, p. 1): if a unital C*-algebra
`A` with a state `φ` whose GNS representation is faithful is the norm closure of the star algebra
generated by unital C*-subalgebras `B_i` that are free for `φ`, then `(A, φ)` is the reduced product
of the `(B_i, φ|B_i)` with its vacuum state. In this form the two theorems above are the headlines

- `eq_zero_of_apply_star_mul_self_eq_zero_of_isFreelyIndependent`: for such `A`, `φ` and `B_i`, if
  `φ` is faithful on every `B_i`, then `φ` is faithful on `A`;
- `apply_mul_comm_of_isFreelyIndependent`: if a unital C*-algebra `A` is the norm closure of the
  star algebra generated by unital star subalgebras `B_i` that are free for a state `φ`, and `φ` is
  tracial on every `B_i`, then `φ` is tracial on `A`; no GNS hypothesis is needed.

Construct, for every set `J` of labels, the map `E_J` of the reduced product onto the reduced
product of the `A_j`, `j ∈ J`, that preserves the vacuum state, and prove it unital, positive,
idempotent onto that subproduct, bimodular over it and of norm one; for `J = {i}` it is the
expectation onto the factor `A_i`.
*Needs:* §3.4; Mathlib `PositiveLinearMap`, `PositiveLinearMap.gnsStarAlgHom`, `CStarAlgebra`,
`StarSubalgebra.topologicalClosure`; Tau Ceti `TauCeti.IsFreelyIndependent`.

**Checks.**
- The vacuum state need not be faithful: for the single factor `M₂(ℂ)` with the pure vector state
  `x ↦ x₁₁`, the element `e₁₂` has `φ(e₁₂* e₁₂) = φ(e₂₂) = 0`, while the GNS representation, on the
  first columns, is the identity representation of `M₂(ℂ)` on `ℂ²` and is faithful; the reduced
  product is `M₂(ℂ)` with a non-faithful vacuum state.
- For two copies of `ℂ²` with the uniform states (§3.1) the reduced product is the reduced group
  C*-algebra of `ℤ/2 ∗ ℤ/2` and the vacuum state is its faithful canonical trace.
- The full product `C*(F₂)` of two copies of `C(𝕋)` (§3.2), with the state pulled back from the
  canonical trace of `C*_r(F₂)`, is generated by two free copies of `C(𝕋)` on which the state is the
  faithful Haar state, yet it vanishes on `x*x` for every nonzero `x` in the kernel of the quotient
  map onto `C*_r(F₂)` (§3.6): without a faithful GNS representation the intrinsic faithfulness
  statement fails.

### 3.6 Full and reduced C*-algebras of the free group

Take two copies of `C(𝕋)` with Haar states. Using `FreeGroup (Fin 2)`, identify their full and
reduced free products with the full and reduced group C*-algebras `C*(F₂)` and `C*_r(F₂)` of
OperatorAlgebraDynamics D1–D2, and prove that the quotient map is not injective: on `ℓ²(F₂)` the
sum of the left translations by the two generators and their inverses has norm `2√3` (Kesten,
Theorem 3: the symmetric random walk on the free group of rank `h` has spectral radius
`√(2h − 1)/h`), while the
trivial character of the full product sends it to `4`, so the trivial character does not factor
through the reduced algebra. Prove the upper bound `2√3` with the end-oriented shift on the Cayley
tree and the lower bound with finitely supported radial vectors, consuming the reduced-word, path
and acyclicity interface of OperatorKTheory §7.3 (K7.FreeGroups) on Mathlib's
`SimpleGraph.mulCayley`, at `n = 2` the four-regular tree; none of the analytic or K-theoretic
results of OperatorKTheory K7 is needed. Compare with OperatorAlgebraDynamics D2.FreeGroups.
*Needs:* §§3.2, 3.4; OperatorAlgebraDynamics D1–D2; OperatorKTheory §7.3; Mathlib `FreeGroup`,
`SimpleGraph.mulCayley`, `lp`.

**Checks.**
- `2√3 ≈ 3.46 < 4`: the norm of the adjacency operator of the four-regular tree is `2√(4 − 1)`
  (Kesten), strictly below the degree `4` that the trivial character gives; for the abelian group
  `ℤ²`, whose Cayley graph is also four-regular, the left-regular norm is `4`, and full and reduced
  algebras coincide.

### 3.7 Von Neumann free products

For von Neumann algebras `M_i` with faithful normal states, construct the weak closure of the left
copies `λ_i(M_i)` on `H`, prove that the factor embeddings are normal, and construct its faithful
normal free-product state. Prove the commutant theorem: the commutant is generated by the right
copies of the factor commutants, using their cyclic vectors. Compute the Tomita conjugation on
reduced words, which reverses their order and applies the factor conjugations, and the modular
operator and modular group from the factor modular data. For tracial inputs prove that `Δ = 1` and
that the free-product vector is cyclic, separating and tracial. Identify free products of group von
Neumann algebras with `L(Monoid.CoprodI G)` and their canonical traces. Prove the compatibility of
the representations and expectations of the C*-reduced product with its weak closure
(Voiculescu–Dykema–Nica, §§1.5–1.6).
*Needs:* §§3.3–3.5; VonNeumannAlgebras Layers 0–4 (bicommutant theorem, normal representations,
spatial tensor products), Layer 6 (tracial L²), Layer 8 (group von Neumann algebras), Layers 10–11
(Tomita–Takesaki theory); Mathlib `VonNeumannAlgebra`, `Monoid.CoprodI`.

**Checks.**
- For `M₁ = M₂ = L(ℤ)` with their traces the free product is `L(F₂)`, by the identification with
  `L(Monoid.CoprodI G)`; `Δ = 1` and the modular group is trivial, as for every trace.

### 3.8 Full Fock space

For a Hilbert space `H` construct the full Fock space `𝓕(H) = ℂΩ ⊕ ⊕_(n ≥ 1) H^(⊗n)` from completed
Hilbert tensor powers and an ℓ²-sum. Define the creation operator `ℓ(h)`, the annihilation
operator `ℓ(h)*` and the gauge operator `Λ(T)` for bounded `T`, with `Λ(T)Ω = 0` and `T` acting on
the first tensor factor. Prove boundedness, `‖ℓ(h)‖ = ‖h‖`, `‖Λ(T)‖ = ‖T‖`, linearity, the
adjoint relations, `ℓ(h)* ℓ(k) = ⟪h, k⟫ 1` and the vacuum formulas. For an orthonormal basis
`(e_i)` give the creation isometries, their orthogonal range projections and the strongly convergent
sum `∑_i ℓ(e_i) ℓ(e_i)* = 1 − P_Ω`. Compare finite-rank Fock representations with the
Toeplitz–Cuntz algebra `E_n`, its compact vacuum ideal and its quotient `O_n` of OperatorKTheory
§7.6; for countably infinite rank prove that the canonical map `O_∞ → C*(ℓ(e_i))` is an isomorphism,
using the faithful finite-stage representations of OperatorKTheory §7.6 and the nonzero vacuum
complement `1 − ∑_(i ≤ n) ℓ(e_i) ℓ(e_i)*`. Keep the vacuum state on creation algebras distinct from
the trace on the Gaussian algebras of §3.9 (Nica–Speicher, Lectures 6–7).
*Needs:* §3.3; OperatorKTheory §7.6; VonNeumannAlgebras Layer 2; Mathlib `lp`, `HilbertBasis`.

**Checks.**
- For `H = ℂ`, `𝓕(H) = ℓ²(ℕ)` and `ℓ(1)` is the unilateral shift `S`: `S*S = 1` and
  `SS* = 1 − P_Ω`, so `C*(S)` is the Toeplitz algebra and its quotient by the compacts is
  `C(𝕋) = O₁`. The vacuum state is not tracial: `⟪Ω, S*S Ω⟫ = 1` and `⟪Ω, SS* Ω⟫ = 0`.

### 3.9 The free Gaussian functor

For a real Hilbert space `H` construct its Hilbert complexification, with the isometric real
inclusion, the complex inner product and completeness, and put `s(h) = ℓ(h) + ℓ(h)*` on the full
Fock space of the complexification. Prove the vacuum Wick formula over noncrossing pairings,
`⟪Ω, s(h₁) ⋯ s(h_m) Ω⟫ = ∑_(π ∈ NC₂(m)) ∏_((a, b) ∈ π) ⟪h_a, h_b⟫`, the variance `‖h‖²`, and
freeness of the `s(h)` for `h` in mutually orthogonal subspaces; §6.1 identifies these moments with
the semicircle law. For `Γ(H) = {s(h) : h ∈ H}''` prove that the vacuum state is faithful, normal
and tracial. Construct second quantization `Γ(T)` for real contractions `T` as normal unital
completely positive trace-preserving maps, with `Γ(1) = 1`, `Γ(ST) = Γ(S)Γ(T)`, isometry-induced
embeddings and projection-induced conditional expectations; prove the reduced-word and tensor
implementation of `Γ(T)` and its agreement with orthogonal direct sums, `Γ(H ⊕ K) = Γ(H) ∗ Γ(K)`
(Voiculescu–Dykema–Nica, Theorem 2.6.2).
*Needs:* §§3.7–3.8, §2.2 for noncrossing pairings; VonNeumannAlgebras Layers 1, 4, 6 and §13.1 (CP
maps); Mathlib `TensorProduct`, `InnerProductSpace`, `CompletelyPositiveMap`.

**Checks.**
- For orthonormal `h₁, h₂`, `⟪Ω, s(h₁)s(h₂)s(h₁)s(h₂) Ω⟫ = 0` and `⟪Ω, s(h₁)²s(h₂)² Ω⟫ = 1`, and
  `⟪Ω, s(h)⁴ Ω⟫ = 2‖h‖⁴`: the crossing pairing contributes nothing. Classical Gaussian (bosonic)
  moments would give `1`, `1` and `3‖h‖⁴`.
- With the normalization of Voiculescu–Dykema–Nica the Gaussian element is `s(h)/2`, of variance
  `‖h‖²/4`; the convention here gives variance `‖h‖²`.

### Examples

- The reduced free product of `n` copies of `(C(𝕋), Haar)` is `C*_r(F_n)` with its canonical trace,
  faithful by §3.5; the full product is `C*(F_n)`.
- `Γ(ℝ)` is generated by one standard semicircular element, and `Γ(ℝ²) = Γ(ℝ) ∗ Γ(ℝ)` (§3.9).

### Dependencies

Layer 2 for noncrossing pairings; RandomMatrices §6.2 (the reduced-word free product with positive
state); Tau Ceti star free products, GNS vectors and the orthogonality of reduced words;
VonNeumannAlgebras Layers 0–4, 6, 8, 10–11 and §13.1;
CStarAlgebras Layers 1–5; OperatorAlgebraDynamics D1–D2; OperatorKTheory §§7.3 and 7.6; Mathlib
free products, Hilbert sums, tensor products and C*-algebras.

## Layer 4: amalgamated freeness and reduced products

This layer replaces the scalar states of Layer 3 by conditional expectations onto a common
subalgebra `B`. It owns C*-conditional expectations, the expectation-GNS module and the reduced
amalgamated free product module. Right Hilbert `B`-modules are HilbertModules' `CStarModule Bᵐᵒᵖ E`.
Sources: Voiculescu–Dykema–Nica, §3.8; Abadie–Dykema, §4; Blanchard–Dykema, Theorems 1.3 and 2.2,
Construction 3.1 and Lemmas 3.3–3.6; Catterall, Theorem 2.2.2.

### 4.1 C*-conditional expectations

For a unital C*-subalgebra `B ⊆ A`, a C*-conditional expectation is a unital positive `B`-bimodule
projection `E : A → B` onto `B` (`E(b₁ x b₂) = b₁ E(x) b₂`, `E(b) = b`). Prove that it is
idempotent, of norm one, and completely positive, as a Mathlib `CompletelyPositiveMap`, from the
positivity of the matrix `[E(a_i* a_j)]`, tested on the `B`-valued quadratic form
`E((∑ a_i b_i)* (∑ a_j b_j))` (Voiculescu–Dykema–Nica, §3.8). Tomiyama's theorem of
VonNeumannAlgebras §13.1 (`tomiyama`), applied after norm one, gives the same complete positivity.
*Needs:* Mathlib `CompletelyPositiveMap`, `PositiveLinearMap`, `CStarMatrix`; VonNeumannAlgebras
§13.1.

**Checks.**
- On `A = M₂(ℂ)` with `B = ℂ1`, the map `x ↦ (x₁₁ + x₁₂) 1` is a unital `B`-bimodule projection
  onto `B` but not positive: on the positive matrix with rows `(1, −2)` and `(−2, 4)` it gives `−1`.
  Positivity is a genuine requirement of the definition.
- The transpose of `M₂(ℂ)` is unital, positive and fixes the diagonal algebra `D`, but it is not
  `D`-bimodular (`(e₁₁e₁₂)ᵀ = e₂₁` while `e₁₁e₁₂ᵀ = 0`) and not completely positive; the diagonal
  part, which is `D`-bimodular, is completely positive.

### 4.2 Algebraic free products over B and freeness with amalgamation

For unital inclusions `B ⊆ A_i` construct the algebraic free product of the `A_i` over `B` and its
universal property, without confusing its universal maps with those of a reduced product. For
conditional expectations `E_i : A_i → B` define `B`-valued freeness of subalgebras containing `B`
by the vanishing of `E` on centred alternating words (`E(aⱼ) = 0`, consecutive labels distinct).
Develop the `B`-balanced moments, regrouping and restrictions, and prove that `E` is determined on
the algebraic product by the factor expectations and freeness. Positivity and complete positivity
of `E` on the algebraic product come through the represented construction of §4.4
(Voiculescu–Dykema–Nica, §3.8).
*Needs:* §4.1; Mathlib `LinearAlgebra.FreeProduct`, `RingCon`.

**Checks.**
- For `B = ℂ` and `E_i = φ_i` the definition is scalar freeness, Tau Ceti's
  `TauCeti.IsFreelyIndependent`; for `B = A_i = A` for all `i` every family is free over `B`, since
  every centred letter is `0`.

### 4.3 The expectation-GNS module

For a conditional expectation `E : A → B` construct `L²(A, E)` from the `B`-valued inner product
`⟨a, b⟩ = E(a* b)`, its null submodule and completion, as a right Hilbert `B`-module. Prove that
left multiplication is bounded and adjointable, with adjoint left multiplication by `a*`, and
identify the orthogonal decomposition `L²(A, E) = B ⊕ L²(A, E)°` given by `E`. Prove that the left
GNS representation is faithful if and only if every nonzero `a ∈ A` has some `b` with
`E(b* a* a b) ≠ 0`; a faithful `E` satisfies this condition, and the converse fails
(Abadie–Dykema, §4).
*Needs:* §4.1; HilbertModules H1–H2 (completion of pre-Hilbert modules, adjointable maps); Mathlib
`CStarModule`.

**Checks.**
- `A = ℂ ⊕ ℂ`, `B = ℂ1`, `E(z, w) = z`: `E(b*(0,1)*(0,1)b) = 0` for every `b`, so the GNS
  representation kills `(0, 1)` and is not faithful.
- `A = M₂(ℂ)`, `B = ℂ1`, `E(x) = x₁₁`: `E` is not faithful (`E(e₂₂) = 0`), but its GNS
  representation is the identity representation on `ℂ²` and is faithful.

### 4.4 The reduced amalgamated free product

Construct the right Hilbert `B`-module

```
𝓔 = B ⊕ ⊕_(n ≥ 1, i₁ ≠ ⋯ ≠ iₙ) L²(A_(i₁), E_(i₁))° ⊗_B ⋯ ⊗_B L²(A_(iₙ), E_(iₙ))°
```

from interior tensor products, with the left `B`-actions. Construct the representations `λ_i` by
prefix and deletion formulas and canonical module unitaries, and prove their boundedness, adjoints
and agreement on `B`. The reduced amalgamated free product is the norm-closed algebra they generate,
with `E(T) = ⟨1_B, T 1_B⟩_B`. Prove that `E` is a unital completely positive conditional expectation,
that its restrictions are the `E_i`, and that the copies of the `A_i` are free over `B`. Prove that
the factor maps are embeddings when each `E_i` has a faithful GNS representation, the density of
reduced words, and the comparison with the module GNS construction. Prove uniqueness up to an
expectation-preserving isomorphism of represented products, and associativity and regrouping with
all intermediate expectations specified (Abadie–Dykema, §4; Voiculescu–Dykema–Nica, §3.8).
*Needs:* §§4.1–4.3; HilbertModules H1–H3 (orthogonal sums, interior tensor products); Mathlib
`CStarModule`, `CompletelyPositiveMap`.

**Checks.**
- For `B = ℂ` the module `𝓔` is the Hilbert space `H` of §3.3 for the GNS inputs, and the
  amalgamated product is the reduced product of §3.4.

### 4.5 Embeddings, free products of UCP maps and faithfulness

- Prove that expectation-preserving embeddings of factors into other systems with the same `B`
  induce an embedding of reduced amalgamated products, assuming that both the source and the target
  expectations have faithful GNS representations (Blanchard–Dykema, Theorem 1.3).
- Prove that the free product of `B`-bimodule unital completely positive maps `θ_i : A_i → C_i` that
  fix `B` and intertwine the expectations exists, assuming that both the source and the target
  expectations have faithful GNS representations, with its word formula, complete positivity,
  composition and restriction properties (Blanchard–Dykema, Theorem 2.2). Consume the unital case of
  the Hilbert-module Kasparov–Stinespring dilation of OperatorKTheory §4.3, whose strictness
  condition is automatic for a unital domain; this section supplies the free-product assembly and its
  word identities. Construct the conditional expectations onto factors and subproducts as cases of
  this construction.
- Prove that the product expectation `E` is faithful when every `E_i` is faithful, separately from
  faithful GNS representations, by the shortest-word compression argument; factors equal to `B` are
  removed before the nontrivial-factor proof (Catterall, Theorem 2.2.2). The zero-factor product is
  `B`; the one-factor product is the image of the factor in its expectation-GNS representation,
  equal to the factor when that representation is faithful.
- For arbitrary inputs put `Ā_i = λ_i(A_i)`; prove that `E_i` descends to a conditional expectation
  `Ē_i : Ā_i → B` with `Ē_i(λ_i(a)) = E_i(a)`, and identify its expectation-GNS module and its
  represented free product with those already constructed. Prove that `E` is faithful if and only if
  every `Ē_i` is faithful: restriction gives necessity, the faithful-input theorem sufficiency. When
  each `λ_i` is injective, in particular when each `E_i` has a faithful GNS representation, this is
  equivalent to faithfulness of every `E_i`.

The reduced product does not have the unrestricted categorical universal property of the full
product.
*Needs:* §§4.1–4.4; OperatorKTheory §4.3; HilbertModules H2–H3.

**Checks.**
- Without source GNS faithfulness the embedding statement fails: `A = ℂ ⊕ ℂ` with `E(z, w) = z`
  embeds diagonally into `M₂(ℂ)` with `ψ(x) = x₁₁`, preserving expectations, but the reduced source
  kills `(0, 1)` while the target GNS representation keeps its nonzero diagonal image `e₂₂`. The pure
  state `ψ` on `M₂(ℂ)` itself has a faithful GNS representation without being faithful.
- The one-factor product of `A = ℂ ⊕ ℂ`, `B = ℂ1`, `E(z, w) = z` is `ℂ` with the faithful identity
  expectation, although `E` is not faithful: faithfulness transfers to the original `A_i` only through
  injective factor maps.

### 4.6 Tracial amalgamated von Neumann free products

Let `(M_i, τ_i)` be finite von Neumann algebras with faithful normal tracial states and `B` a common
unital von Neumann subalgebra on which the traces agree. The faithful normal trace-preserving
conditional expectations `E_i : M_i → B`, unique and given by the `L²` projection onto `L²(B, τ)`,
are those of VonNeumannAlgebras Layer 11 (Takesaki's theorem specialized to traces); they exist for
arbitrary finite algebras and subalgebras, not only II₁ factors. Construct the tracial amalgamated
von Neumann free product on the scalar Hilbert completion of `𝓔` over `L²(B, τ)`. Prove that the
factor embeddings are normal, the vacuum trace is faithful and normal, and the `B`-valued expectation
is faithful, normal and trace-preserving. Prove uniqueness for normal state- and
expectation-preserving maps, regrouping, the commuting left and right representation formulas, the
density of reduced words in `L²`, the orthogonal reduced-word decomposition of `L²(M)` with its
`B`-bimodule actions and tensor associators. Normality is proved from the bounded and `L²`
interfaces, not from algebraic freeness (Blanchard–Dykema, Construction 3.1 and Lemmas 3.3–3.6;
the common trace's faithful normal state on `B` meets their state-based hypothesis).
*Needs:* §§4.4–4.5, §3.7; VonNeumannAlgebras Layers 4, 6 and 11.

**Checks.**
- For `B = ℂ` the construction is the tracial von Neumann free product of §3.7; for `B = M_i = M`
  for all `i` it returns `M`.

### 4.7 Special cases

Prove that `B = ℂ` recovers the scalar products of Layer 3 and that a single factor recovers the
original algebra. For groups `G_i` containing a common subgroup `H`, identify the amalgamated
product of the group von Neumann algebras `L(G_i)` over `L(H)`, with the Fourier-coefficient
expectations `E_H` of VonNeumannAlgebras V8.SubgroupCosets, with `L(Monoid.PushoutI)` of the
amalgamated group, trace-preservingly, using the reduced words and the universal property of
Mathlib's `Monoid.PushoutI` (Houdayer–Raum, Proposition 2.22, for two locally compact factors, of
which discrete groups are a case); supply the reduced group-word and Hilbert tensor
identifications. The
finite-factor and rigidity properties of these algebras belong to FactorRigidity and Subfactors.
*Needs:* §§4.4–4.6; VonNeumannAlgebras Layer 8 (V8.SubgroupCosets); Mathlib `Monoid.PushoutI`,
`Monoid.PushoutI.NormalWord`.

**Checks.**
- For `G₁ = G₂ = ℤ` amalgamated over `H = 2ℤ`, the amalgamated group is `⟨a, b | a² = b²⟩`, and
  the expectation onto `L(2ℤ)` keeps the Fourier coefficients on `2ℤ`; the trace of `u_a u_b⁻¹` is
  `0`, since `ab⁻¹ ≠ 1` in the amalgamated group, although `a²b⁻² = 1`.

### Examples

- `B = ℂ`: Layer 4 specializes to Layer 3, with `E` the vacuum state.
- A single factor `A₁ = M₂(ℂ)` over `B = ℂ1` with `E₁(x) = x₁₁` has faithful GNS representation, so
  its amalgamated product is `M₂(ℂ)` itself, with a conditional expectation that is not faithful.

### Dependencies

Layer 3; HilbertModules H1–H3; VonNeumannAlgebras Layers 4, 6, 8, 11 and §13.1; OperatorKTheory
§4.3; Mathlib `CStarModule`, `CompletelyPositiveMap`, `LinearAlgebra.FreeProduct`, `Monoid.PushoutI`.

## Layer 5: free convolution, formal series and scalar transforms

This layer works with the free additive and multiplicative convolutions of compactly supported laws
and their analytic R- and S-transforms, which are RandomMatrices §6.3's, and builds what goes beyond
them: the free cumulants of a law and their bounds, the formal series of Tau Ceti (moment series,
cumulant series, R-series and their functional equation) and their comparison with the analytic
transforms, word-indexed series in several variables, the boxed convolution and the formal
S-transform. Sources: Nica–Speicher, Lecture 12 (Theorem 12.7), Theorem 14.4 and Lectures 16–18.

### 5.1 Free additive convolution

Free additive convolution of compactly supported probability measures on `ℝ` is RandomMatrices
§6.3's: `μ ⊞ ν` is the law of `a + b` for free bounded selfadjoint `a` and `b` with laws `μ` and `ν`
in a C*-probability space, independent of the realization, associative and commutative, with
`δ₀ ⊞ μ = μ`, `δ_c ⊞ μ` the translate of `μ` by `c`, the dilation law `D_t(μ ⊞ ν) = D_t μ ⊞ D_t ν`,
and `μ ⊞ ν` supported in `[−(r + s), r + s]` when `μ` and `ν` are supported in `[−r, r]` and
`[−s, s]`. Develop the convolution powers `μ^(⊞N)`, the law of the sum of a freely independent
family, and the transport of these laws through C*- and von Neumann realizations. Define the free
cumulants `κ_n(μ)` of a compactly supported law as those of any bounded selfadjoint realization,
which do not depend on it (Tau Ceti
`TauCeti.IsFreelyIndependentElements.jointDistribution_eq_of_forall_pow`), and prove
`κ_n(μ ⊞ ν) = κ_n(μ) + κ_n(ν)` and `κ_n(μ^(⊞N)) = N κ_n(μ)` (Nica–Speicher, Lecture 12).
*Needs:* RandomMatrices §6.3; §3.4; Tau Ceti `PositiveLinearMap.law`,
`PositiveLinearMap.law_eq_law_iff_forall_apply_pow`,
`TauCeti.IsFreelyIndependentElements.jointDistribution_eq_of_forall_pow`,
`TauCeti.IsFreelyIndependentElements.freeCumulant_sum`.

**Checks.**
- `semicircleReal 0 s ⊞ semicircleReal 0 t = semicircleReal 0 (s + t)`, since the only cumulants are
  `κ₂ = s` and `κ₂ = t`.
- For `β = (δ₋₁ + δ₁)/2`, `β ⊞ β` is the arcsine law with density `π⁻¹ (4 − x²)^(−1/2)` on
  `(−2, 2)`: its fourth moment is `κ₄ + 2κ₂² = −2 + 8 = 6`, while the classical convolution
  `¼δ₋₂ + ½δ₀ + ¼δ₂` has fourth moment `8`.

### 5.2 Cumulant bounds and convergence of the R-series

The formal moment series `M`, cumulant series `C` and R-series `R` of a variable, the functional
equation `M(z) = C(z M(z)) = 1 + z M(z) R(z M(z))` proved coefficientwise from the block containing
the first position, the unit linear coefficient of `z M(z)`, the identity
`C = M ∘ (z M)^⟨−1⟩` through Mathlib's `PowerSeries.substInvOfIsUnit`, the uniqueness of `C`, and
the additivity of the R-series over free sums are Tau Ceti's (Convention 6). Prove exponential
cumulant bounds for compactly supported laws: if `μ` is supported in `[−r, r]`, then
`|κ_n(μ)| ≤ (16r)ⁿ`, from `|mₖ| ≤ rᵏ`, `|μ(π, 1_n)| ≤ 4ⁿ` (§2.3) and `|NC(n)| ≤ 4ⁿ`. Hence `R_μ`
converges on the disk `|z| < 1/(16r)` and `M_μ` on `|z| < 1/r`, and the functional equation holds
between the sums on a neighbourhood of `0` (Nica–Speicher, Lecture 12).
*Needs:* §2.3; Tau Ceti `TauCeti.momentSeries`, `TauCeti.freeCumulantSeries`, `TauCeti.rSeries`,
`TauCeti.momentSeries_eq_one_add_X_mul_momentSeries_mul_rSeries_subst`,
`TauCeti.norm_freeCumulant_const_le`, `TauCeti.NoncrossingPartition.card_fin_eq_catalan`; Mathlib
`FormalMultilinearSeries`, `HasFPowerSeriesOnBall`.

**Checks.**
- `β = (δ₋₁ + δ₁)/2` is supported in `[−1, 1]` and has `κ_(2k) = (−1)^(k−1) catalan(k − 1)`, odd
  cumulants zero, so `R_β(w) = (√(1 + 4w²) − 1)/(2w)`, of radius of convergence `1/2`, although
  `M_β(z) = 1/(1 − z²)` converges on the unit disk: the R-series of a law in `[−r, r]` need not
  converge on `|z| < 1/r`, and a bound of the form `|κ_n| ≤ rⁿ` would be false.

### 5.3 Analytic transforms

The Cauchy transform is `G_μ = −resolventTransform μ` (Convention 7). Its analyticity off the
support is Mathlib's `analyticOn_resolventTransform`; the conjugation symmetry, the sign of the
imaginary part, the normalization at infinity and the moment expansion of `resolventTransform μ`,
Stieltjes inversion over intervals with the half-atom endpoint terms, atom recovery and uniqueness
are Tau Ceti's (supplier contracts), and transfer to `G_μ` by the sign change. The analytic
R-transform of a compactly supported law, through the local inverse `K_μ(w) = 1/w + R_μ(w)` of `G_μ`
near infinity, the identification of its power series at `0` with the formal R-series
`∑ κ_(n+1)(μ) wⁿ` of §5.2 (Nica–Speicher, Theorem 12.7) and the additivity `R_(μ ⊞ ν) = R_μ + R_ν`
are RandomMatrices §6.3's, in the same sign convention `G = −resolventTransform`. Prove density
recovery: if `μ` has a density `f` that is continuous at `x`, then
`f(x) = −π⁻¹ lim_(η↓0) Im G_μ(x + iη)`; intervals whose endpoints carry atoms are handled by the
half-atom terms of the inversion formula. The converse direction, a density from a boundary limit
that exists and is continuous on an interval, is RandomMatrices §3.1's.

*Needs:* §5.2; RandomMatrices §6.3; Mathlib `MeasureTheory.resolventTransform`,
`analyticOn_resolventTransform`; Tau Ceti `MeasureTheory.Measure.resolventTransform_conj`,
`MeasureTheory.im_resolventTransform_pos`, `MeasureTheory.hasSum_resolventTransform_of_ae_norm_le`,
`MeasureTheory.tendsto_intervalIntegral_im_resolventTransform`,
`MeasureTheory.tendsto_mul_im_resolventTransform`, `MeasureTheory.Measure.ext_of_resolventTransform`.

**Checks.**
- For `semicircleReal 0 v`, `G(z) = (z − √(z² − 4v))/(2v)`, `R(w) = vw` and `K(w) = 1/w + vw`, and
  `G(K(w)) = w`. With Mathlib's `resolventTransform`, which is `−G`, the same inversion would
  produce `−1/w − vw`: the sign convention is not cosmetic.
- For `δ_c`, `G(z) = 1/(z − c)`, `F(w) = w/(1 − cw)`, `K(w) = 1/w + c` and `R = c`, so translation
  by `c` adds `c` to the R-transform, consistent with `δ_c ⊞ μ` being the translate.

### 5.4 Noncommutative formal series

Construct formal series in noncommuting variables indexed by `FreeMonoid ι`: coefficients are
functions on words, the product sums over decompositions of a word into two subwords in order, and
the constant coefficient (the empty word) is separated explicitly. Prove the unit, associativity,
the degree filtration, coefficient extensionality, substitution of series with zero constant
coefficient for the variables when `ι` is finite, and the comparison with Mathlib's one-variable
`PowerSeries`. The joint R-series of a family `(a_i)` is `∑_(n ≥ 1) ∑ κ_n(a_(i₁), …, a_(iₙ)) z_(i₁) ⋯ z_(iₙ)`,
with no constant term and degree-`n` coefficients `κ_n` (Convention 6). Prove that subfamilies indexed
by a partition of `ι` are free if and only if the joint R-series has no coefficient on a word that
mixes two parts (§2.5). A commutative `MvPowerSeries` cannot replace these series
(Nica–Speicher, Lectures 16–18).
*Needs:* §2.5; Mathlib `FreeMonoid`, `PowerSeries`.

**Checks.**
- On `M₂(ℂ)` with the non-tracial state `φ(x) = x₁₁`, `a = e₁₂` and `b = e₂₁` have
  `κ₂(a, b) = φ(e₁₁) = 1` and `κ₂(b, a) = φ(e₂₂) = 0`: the coefficients of `z_a z_b` and `z_b z_a`
  differ, which a commutative series would merge.

### 5.5 Boxed convolution

For word-indexed series `f, g` with zero constant coefficient define the boxed convolution by
`(f ⊠ g)_(i₁ ⋯ iₙ) = ∑_(π ∈ NC(n)) f_π(i₁, …, iₙ) g_(K(π))(i₁, …, iₙ)`, where `f_π` multiplies the
coefficients of `f` on the subwords read along the blocks of `π`. Prove associativity, that the
series `∑_i z_i` is the unit, that `f` has an inverse when its degree-one coefficients are units, and
that the joint R-series of the products `(a_i b_i)` of two free families is the boxed convolution of
their joint R-series (Tau Ceti
`TauCeti.IsFreelyIndependent.freeCumulant_mul_eq_sum_partitionCumulant_mul_partitionCumulant`). The
one-variable operation is commutative; no commutativity is asserted in several variables. Express the
moment–cumulant formulas as boxed convolutions with the zeta series (all coefficients `1`) and its
inverse, the Möbius series, and the formula for cumulants with products as arguments as a grouped
form (Nica–Speicher, Lectures 16–18).
*Needs:* §§2.3, 5.4; Tau Ceti
`TauCeti.IsFreelyIndependent.freeCumulant_mul_eq_sum_partitionCumulant_mul_partitionCumulant`,
`TauCeti.NoncrossingPartition.kreweras`, `TauCeti.freeCumulant_fiberProd`.

**Checks.**
- In one variable, the zeta series boxed with itself has coefficients `|NC(n)| = catalan n`:
  `1, 2, 5, 14`, the moments of the free Poisson law of rate one; a coefficientwise product would
  give `1, 1, 1, 1`.
- The zeta series boxed with the Möbius series is the unit `z`: in degree two the two terms are
  `1 · μ(0₂, 1₂) = −1` and `1 · 1 = 1`.

### 5.6 The S-transform

For a power series `Ψ` whose linear coefficient is a unit define the S-series
`S(z) = (1 + z) Ψ^⟨−1⟩(z)/z`, written `sSeries`: Mathlib's `PowerSeries.substInvOfIsUnit` is the
compositional inverse, and division by `z` shifts the coefficients of the inverse down, its constant
coefficient being zero. For a variable `a` of nonzero mean, `S_a` is the S-series of
`Ψ_a = M_a − 1`. Prove that `S_a = C₀^⟨−1⟩(z)/z` with `C₀(z) = z R_a(z)`, and that `f ↦ f^⟨−1⟩(z)/z`
is an isomorphism from the one-variable series with zero constant and unit linear coefficient under
boxed convolution onto the series with unit constant coefficient under multiplication. Deduce the
headline theorem `sSeries_momentSeries_mul`: if `φ 1 = 1` and `a`, `b` are free with nonzero means,
then `S_(ab) = S_a S_b`, with no trace and no positivity (Nica–Speicher, Lectures 16–18). Compute
`S_(c1) = 1/c` for `c ≠ 0`; the transforms of the free Poisson and compound laws are in §§6.5–6.6.
*Needs:* §5.5; Tau Ceti `TauCeti.momentSeries`, `TauCeti.rSeries`,
`TauCeti.freeCumulantSeries_eq_subst_substInvOfIsUnit`, `TauCeti.IsFreelyIndependentElements`;
Mathlib `PowerSeries.substInvOfIsUnit`, `PowerSeries.subst`.

**Checks.**
- For the constant `c ≠ 0`, `Ψ(z) = cz/(1 − cz)`, `Ψ^⟨−1⟩(w) = w/(c(1 + w))` and `S = 1/c`; without
  the factor `1 + z` the definition would give `1/(c(1 + z))`.
- For the free Poisson law of rate `λ > 0` and jump `1`, `C₀(z) = λz/(1 − z)` and `S(w) = 1/(λ + w)`;
  the product of two such S-series is the S-series of the law of `ab` for free `a`, `b` with these laws.

### 5.7 Free multiplicative convolution

Free multiplicative convolution of compactly supported probability measures on `[0, ∞)` is
RandomMatrices §6.3's: `μ ⊠ ν` is the law of `a^(1/2) b a^(1/2)` for free positive `a`, `b` with laws
`μ`, `ν`, independent of the realization, associative and commutative, with `δ₁ ⊠ μ = μ` and
`δ₀ ⊠ μ = δ₀`, and the analytic S-transforms of laws of nonzero mean satisfy `S_(μ ⊠ ν) = S_μ S_ν`.
Prove that in a tracial C*-probability space (the reduced free product of §3.4 with tracial inputs,
§3.5) the moments of `μ ⊠ ν` are those of `ab`, and that the power series at `0` of the analytic
S-transform of a law `μ` of nonzero mean is the S-series `sSeries (M_μ − 1)` of §5.6, so that the
algebraic theorem of §5.6 computes `⊠`. A positive compactly supported law of mean zero is `δ₀`; that
case is handled by the absorbing law, not by an inverse transform with zero linear coefficient
(Nica–Speicher, Theorem 14.4 and Lectures 16–18).
*Needs:* §§3.4–3.5, 5.6; RandomMatrices §6.3; Tau Ceti `TauCeti.momentSeries`.

**Checks.**
- The second moment is `m₂(μ ⊠ ν) = m₂(μ) m₁(ν)² + m₁(μ)² m₂(ν) − m₁(μ)² m₁(ν)²`: for two free
  Poisson laws of rate `1` this is `2 + 2 − 1 = 3`, while independent commuting variables give
  `m₂(μ) m₂(ν) = 4`.

### Examples

- `δ_c ⊞ μ` is the translate of `μ` and `S_(δ_c) = 1/c`.
- The free cumulants of `μ^(⊞N)` are `N κ_n(μ)`; for `μ = semicircleReal 0 v` this is
  `semicircleReal 0 (Nv)`.

### Dependencies

Layers 2 and 3; RandomMatrices §6.3 (free convolutions of compactly supported laws and their
analytic transforms); Tau Ceti laws of selfadjoint elements, free cumulants, formal series and the
resolvent transform; Mathlib power series, substitution and analytic functions.

## Layer 6: semicircular laws and free limit theorems

This layer develops the laws that free probability singles out. The semicircle measure, its
moments and transform, and the free central limit theorem are Tau Ceti's (supplier contracts); the
targets are their Fock-space realizations, the free Gaussian algebras, semicircular systems, the free
law of large numbers, the free Poisson and compound free Poisson laws and free infinite
divisibility. Sources: Nica–Speicher, Theorem 8.10, Propositions 12.11 and 12.15, Theorem 13.16;
Voiculescu–Dykema–Nica, Theorem 2.6.2.

### 6.1 The semicircle law and its Fock realization

The centred semicircle law `semicircleReal 0 v` (density `(2πv)⁻¹ √(4v − t²)` on `[−2√v, 2√v]` for
`v > 0`, the Dirac mass at `0` for `v = 0`, even moments `catalan n · vⁿ`, odd moments zero) and the
equivalence of a semicircular law, of `TauCeti.IsSemicircular`, and of the cumulant sequence
`κ₂ = v`, `κ_n = 0` otherwise, are Tau Ceti's (`PositiveLinearMap.law_eq_semicircleReal_iff`,
`TauCeti.isSemicircular_iff_freeCumulant_const`). Prove that for `h` in a real Hilbert space the
Fock-space element `s(h)` of §3.9 has law `semicircleReal 0 ‖h‖²` under the vacuum state, that
`s(h) + c` has law `semicircleReal c ‖h‖²` and `t s(h) = s(th)` has law `semicircleReal 0 (t²‖h‖²)`
(Nica–Speicher, Lectures 1–7).
*Needs:* §3.9; Tau Ceti `TauCeti.Probability.semicircleReal`,
`PositiveLinearMap.law_eq_semicircleReal_iff`, `TauCeti.Probability.map_affine_semicircleReal`.

**Checks.**
- In the normalization of Voiculescu–Dykema–Nica the Gaussian element `s(h)/2` has law
  `semicircleReal 0 (‖h‖²/4)`, supported in `[−‖h‖, ‖h‖]`; the convention here gives
  `[−2‖h‖, 2‖h‖]`.

### 6.2 The free Gaussian algebras

Prove that `Γ(ℝ)` is `L(ℤ)`: the spectral measure of `s(1)` is the atomless semicircle law, its
distribution function `F` transports it to Lebesgue probability on `[0, 1]`, then to Haar probability
on the circle, and VonNeumannAlgebras V8's Fourier model identifies `L∞(𝕋)` with `L(ℤ)`; prove the
measure-algebra and `L∞` maps and the image of the generator. Using the free-product decomposition
`Γ(H ⊕ K) = Γ(H) ∗ Γ(K)` of §3.9, identify `Γ(H)` with the group von Neumann algebra of the free group
on an orthonormal basis of `H`: `ℂ` for `H = 0`, `L(ℤ)` in rank one, and the II₁ factor `L(F_n)` in
rank `n ≥ 2`, including infinite rank (Voiculescu–Dykema–Nica, Theorem 2.6.2).
*Needs:* §§3.7, 3.9, 6.1; VonNeumannAlgebras Layer 8 (`L(ℤ) ≅ L∞(𝕋)`, factoriality of ICC group
algebras) and Layer 2 (Borel calculus); OperatorTheory/SelfAdjointSpectralTheory Part B (spectral
measures of bounded selfadjoint operators); Mathlib `FreeGroup`.

**Checks.**
- For `v = 1`, `F(t) = 1/2 + t√(4 − t²)/(4π) + π⁻¹ arcsin(t/2)` on `[−2, 2]`; `F(0) = 1/2` and
  `F(1) = 1/2 + √3/(4π) + 1/6 ≈ 0.804`.
- `Γ(ℝ²)` is not abelian: for orthonormal `e₁, e₂`, `τ(s₁s₂s₁s₂) = 0` and `τ(s₁²s₂²) = 1`, so
  `s₁s₂ ≠ s₂s₁`, as it must be for `L(F₂)`.

### 6.3 Semicircular systems

A family `(s_i)_(i ∈ ι)` of selfadjoint elements is a semicircular system with real positive
semidefinite covariance matrix `C` when `κ₂(s_i, s_j) = C_ij` and every other joint free cumulant
vanishes. Prove realization for every real positive semidefinite `C`, by `s_i = s(h_i)` on Fock space
with `⟪h_i, h_j⟫ = C_ij`; the change of real coordinates (`(∑_j T_ij s_j)_i` is a semicircular system
with covariance `T C Tᵀ`); and that a semicircular system is free exactly when `C` is diagonal.
Semicircularity of each member does not specify the system (Nica–Speicher, Lectures 1–7).
*Needs:* §§2.5, 3.9, 6.1; Mathlib `Matrix.PosSemidef`.

**Checks.**
- The covariance with all four entries `1` is realized by `h₁ = h₂`, so `s₁ = s₂`: both members are
  standard semicircular, as for the identity covariance, but the pair is not free.
- A rotation `T` of the identity covariance gives `T Tᵀ = 1`, so `(s₁ + s₂)/√2` and `(s₁ − s₂)/√2`
  form a free standard pair.

### 6.4 The free central limit theorem and the free law of large numbers

The free central limit theorem, in moments and in law, for free centred variables with moments
bounded in each degree and convergent average variance, and in its identically distributed form, is
Tau Ceti's (supplier contracts; Nica–Speicher, Theorem 8.10). Prove the free law of large numbers:
for freely independent identically distributed selfadjoint `a_j` in a star-probability space with
positive normalized `φ` and mean `m = φ(a_j)`, the averages `Ā_N = N⁻¹ ∑_(j ≤ N) a_j` satisfy
`φ((Ā_N − m)²) = κ₂(a)/N` exactly, so they converge to `m` in the GNS `L²` seminorm, and
`φ(Ā_Nᵏ) → mᵏ` for every `k`; no trace is needed. These conclusions do not assert operator-norm
convergence.
*Needs:* Tau Ceti `TauCeti.IsFreelyIndependentElements.freeCumulant_sum`,
`TauCeti.freeCumulant_update_smul`, `TauCeti.StarPositiveFunctional`.

**Checks.**
- For standard semicircular `a_j`, `Ā_N` is semicircular of variance `1/N`, so `φ(Ā_N²) = 1/N` and
  `φ(Ā_N⁴) = 2/N²`; classical averages of standard Gaussians have fourth moment `3/N²`.

### 6.5 The free Poisson law

For `λ ≥ 0` and `α ∈ ℝ` the free Poisson law of rate `λ` and jump `α` is the compactly supported
probability measure with free cumulants `κ_n = λαⁿ`. For `α = 1` and `λ > 0`, with
`a = (1 − √λ)²` and `b = (1 + √λ)²`, prove that it is

```
max(1 − λ, 0) δ₀ + 1_[a,b](t) √((b − t)(t − a)) / (2πt) dt,
```

the density being an a.e. density (its value at `t = 0` is immaterial), with an integrable endpoint
singularity at `λ = 1`; it is the dilation by `λ` of Tau Ceti's `marchenkoPastur (1/λ)`. For a general
jump take the pushforward by `t ↦ αt` (a negative jump reverses the interval), and `λ = 0` or `α = 0`
gives `δ₀`. Prove positivity, total mass `1`, the support, the moments
`m_n = ∑_(π ∈ NC(n)) λ^#blocks(π) αⁿ` and the cumulants. For `α = 1` the free Poisson limit
theorem, the convergence for `N ≥ λ` of the `N`-fold free convolution of `(1 − λ/N)δ₀ + (λ/N)δ₁` to
this law in moments and weakly, is RandomMatrices §6.4's, for sums of `N` free projections of trace
`λ/N`. Deduce it for every jump `α`: the pushforward by `t ↦ αt` commutes with `⊞` (§5.1) and with
weak convergence, and sends `(1 − λ/N)δ₀ + (λ/N)δ₁` to `(1 − λ/N)δ₀ + (λ/N)δ_α`. The square of a
semicircular element of variance `σ²` has the free Poisson law of rate `1` and jump `σ²`
(Nica–Speicher, Propositions 12.11 and 12.15).
*Needs:* §§5.1–5.3; Tau Ceti `TauCeti.Probability.marchenkoPastur`,
`TauCeti.Probability.marchenkoPastur_eq_withDensity`,
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`,
`PositiveLinearMap.tendsto_law_of_tendsto_apply_pow`; RandomMatrices §§3.4 and 6.4.

**Checks.**
- For `λ = 1/4` the atom at `0` has mass `3/4`, the density lives on `[1/4, 9/4]` with mass `1/4`,
  and the mean is `∫ t dμ = (b − a)²/16 = λ = 1/4`.
- For `λ = 2`, `α = 1` the moments are `2, 6, 22, 90`; the classical Poisson law of mean `2` has
  `2, 6, 22, 94`, the difference `4 = λ²` coming from the crossing partition `{1, 3}{2, 4}`.
- For `λ = 1` the moments are the Catalan numbers `1, 2, 5, 14`, those of `s²` for a standard
  semicircular `s`.

### 6.6 Compound free Poisson laws

For a compactly supported probability measure `ν` on `ℝ` and `λ ≥ 0`, construct the compound free
Poisson law with free cumulants `κ_n = λ ∫ tⁿ dν(t)`, as the limit of the `N`-fold free convolutions
of `(1 − λ/N)δ₀ + (λ/N)ν` (Speicher, Assignment 8, Exercise 3). Prove its positivity, the
compact-support bound, uniqueness, the semigroup law in `λ`, the pushforwards along `t ↦ αt`, and its
transforms on the series of Layer 5: `R(z) = λ ∫ t/(1 − tz) dν(t)` (Speicher, Assignment 9,
Exercise 3) and, when the mean `λ ∫ t dν` is nonzero, its S-series. `ν = δ₀`, and
degenerate jumps, are included rather than excluded by a nonzero-mean assumption.
*Needs:* §§5.1–5.6, 6.5.

**Checks.**
- `ν = δ₁` gives `R(z) = λ/(1 − z)`, the free Poisson law of rate `λ`; `ν = δ₀` gives `R = 0`, the
  law `δ₀`.

### 6.7 Free infinite divisibility

Within compactly supported laws, call `μ` freely infinitely divisible when for every positive
integer `N` there is a compactly supported law `μ_N` with `μ_N^(⊞N) = μ`. Prove the free
Lévy–Khintchine theorem for compactly supported laws: `μ` is freely infinitely divisible if and only
if its real cumulants are conditionally positive,
`∑_(i,j=1)^r c̄_i c_j κ_(i+j) ≥ 0` for every `r` and `c ∈ ℂ^r`, if and only if
`R_μ(z) = κ₁ + ∫ z/(1 − tz) dρ(t)` for a finite positive compactly supported measure `ρ`. For `μ` the
law of a selfadjoint element `a` of a C*-probability space, and `μ_N^(⊞N)` the law of the sum of `N`
free copies of a bounded selfadjoint realization of `μ_N` (§5.1), the first equivalence is the
headline `forall_exists_isFreelyIndependentElements_law_sum_iff`: for every `N ≥ 1` the law of `a`
is the law of the sum of `N` free identically distributed selfadjoint elements of some
C*-probability space if and only if `∑_(i,j=1)^r c̄_i c_j κ_(i+j)(a) ≥ 0` for every `r` and
`c ∈ ℂ^r`. Prove the uniqueness of `κ₁` and `ρ`, the construction of `ρ` from the moment sequence
`κ_(k+2) = ∫ tᵏ dρ` by a GNS argument, and the bounds that make the realization bounded. Conversely, realize these cumulants
on full Fock space by a scalar plus creation, annihilation and gauge operators, with the word-moment
recursion and positivity. Construct the convolution semigroup `(μ_t)_(t ≥ 0)` with cumulants
`t κ_n`, prove its weak continuity, `μ₀ = δ₀` and `μ_s ⊞ μ_t = μ_(s+t)`, and identify the convolution
roots. Prove the characterization by moment limits of `N`-fold free convolution powers of compactly
supported laws, with the positivity and moment bounds stated in the limit argument
(Nica–Speicher, Theorem 13.16).
*Needs:* §§3.8, 5.1–5.3, 6.6; Tau Ceti `TauCeti.StarPositiveFunctional`,
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`.

**Checks.**
- `semicircleReal 0 σ²` has `ρ = σ²δ₀`, the free Poisson law of rate `λ` has `κ₁ = λ`, `ρ = λδ₁`,
  and `δ_c` has `κ₁ = c`, `ρ = 0`.
- `β = (δ₋₁ + δ₁)/2` is not freely infinitely divisible: `κ₂ = 1`, `κ₃ = 0`, `κ₄ = −1`, and the
  matrix with rows `(κ₂, κ₃)` and `(κ₃, κ₄)` is not positive semidefinite. The semicircle law,
  compactly supported and nondegenerate and hence not classically infinitely divisible, is freely
  infinitely divisible: the two notions are different.

### Examples

- `semicircleReal 0 1 ⊞ semicircleReal 0 1 = semicircleReal 0 2`, and the free Poisson laws of rates
  `λ` and `λ′` with jump `1` convolve to rate `λ + λ′`.
- The square of a standard semicircular element has the free Poisson law of rate `1` and jump `1`,
  and the square of a semicircular element of variance `σ²` the free Poisson law of rate `1` and
  jump `σ²`.

### Dependencies

Layers 2, 3 and 5; Tau Ceti semicircle and Marchenko–Pastur laws, the free central limit theorem, the
method of moments and the laws of selfadjoint elements; VonNeumannAlgebras Layers 2 and 8;
OperatorTheory/SelfAdjointSpectralTheory Part B; RandomMatrices §§3.4 and 6.4.

## Layer 7: compression, circular and R-diagonal elements

This layer computes what happens to free cumulants under compression by free projections and matrix
units, and develops circular elements, Haar unitaries and R-diagonal elements with their polar
decompositions. Sources: Nica–Speicher, Theorems 14.4, 14.10 and 14.18, and Lecture 15, in
particular Theorem 15.10, Proposition 15.13 and Corollary 15.14.

### 7.1 Compression by a free projection

Let `φ 1 = 1`, let `p` be an idempotent with `t = φ(p) ≠ 0`, and let `(a_r)` be a family such that
the unital algebras generated by `p` and by the `a_r` are free. Construct the corner probability
space `(pAp, t⁻¹ φ)` with unit `p`, and prove the headline theorem
`freeCumulant_mul_mul_eq_pow_mul_freeCumulant`:

```
κ_n^(pAp)(p a_(r₁) p, …, p a_(rₙ) p) = t^(n−1) κ_n(a_(r₁), …, a_(rₙ)),
```

the left side being the free cumulant for the functional `x ↦ t⁻¹ φ(x)` evaluated on products of the
compressed letters, which lie in `pAp`. This algebraic identity needs no trace and no positivity
(Nica–Speicher, Theorem 14.10). For a positive state and a projection `p = p* = p²`, `0 ≤ t ≤ 1`, so
that `t ≠ 0` means `0 < t ≤ 1`, and for a faithful state `p ≠ 0` suffices; the corner state is then
positive and normalized. Derive the law-level form
`R_(pap)(z) = R_a(tz)`, its consequences for semicircular laws (variance `tσ²`) and free Poisson laws
(rate `λ/t`, jump `tα`), and that compressions of subfamilies that are free from each other and from
`p` remain free in `pAp`. *Route:* the formula for products of free families (Tau Ceti
`TauCeti.IsFreelyIndependent.apply_prod_mul_eq_sum_partitionCumulant_mul_partitionMoment`) applied to
the word `(p a_(r₁))(p a_(r₂)) ⋯ (p a_(rₙ))(p · 1)`, the interval-partition grouping, and the Kreweras
block count of §2.2.
*Needs:* §§2.2–2.3; Tau Ceti `TauCeti.freeCumulant`,
`TauCeti.IsFreelyIndependent.apply_prod_mul_eq_sum_partitionCumulant_mul_partitionMoment`,
`TauCeti.freeCumulant_fiberProd`, `TauCeti.freeCumulant_update_smul`.

**Checks.**
- For `n = 2`, freeness gives `φ(pap) = tφ(a)` and `φ(papbp) = t²φ(ab) + (t − t²)φ(a)φ(b)`, so
  `t⁻¹φ(papbp) − t⁻²φ(pap)φ(pbp) = t(φ(ab) − φ(a)φ(b))`, the formula. Computing the corner cumulant
  with `φ` instead of `t⁻¹φ` gives `t²φ(ab) + (t − 2t²)φ(a)φ(b)`, not a multiple of `κ₂(a, b)` unless
  `t = 1`.
- A standard semicircular element compressed by a free projection of trace `t` is semicircular of
  variance `t` in the corner; the free Poisson law of rate `1` becomes the free Poisson law of rate
  `1/t` and jump `t`.

### 7.2 Matrix-unit compressions

Let `(e_ij)_(1 ≤ i, j ≤ d)` be matrix units in `A` (`e_ij e_kl = δ_jk e_il`, `∑ e_ii = 1`) with
`φ(e_ij) = δ_ij/d`, such that the algebra they generate is free from a family `(a_r)`. Put `p = e₁₁`
and `a^r_ij = e_(1i) a_r e_(j1) ∈ pAp`. Prove that the compressed joint cumulants
`κ_n^(pAp)(a^(r₁)_(i₁j₁), …, a^(rₙ)_(iₙjₙ))` vanish unless `j_k = i_(k+1)` for every `k`, indices
taken cyclically (`jₙ = i₁`), and equal `d^(1−n) κ_n(a_(r₁), …, a_(rₙ))` when this holds
(Nica–Speicher, Theorem 14.18). Prove the matrix reconstruction `a_r = ∑_(i,j) e_(i1) a^r_ij e_(1j)`
and the comparison of `φ` with the normalized trace of `M_d(pAp)` for the corner state. This is a
cyclic-index formula; it does not assert that all the corner entries are free from each other.
*Needs:* §7.1.

**Checks.**
- For `n = 1`, freeness gives `φ(e_(1i) a e_(j1)) = φ(a) φ(e_(1i) e_(j1)) = δ_ij φ(a)/d`, so the
  compressed mean is `δ_ij φ(a)`, the formula with `d⁰`; the off-diagonal entries are centred.
- For `d = 1`, `p = 1` and the formula is the identity.

### 7.3 Circular elements and Haar unitaries

A circular element is `c = (s₁ + i s₂)/√2` for free standard semicircular `s₁`, `s₂`. Compute its
star-distribution: `κ₂(c, c*) = κ₂(c*, c) = 1`, and every other free cumulant in `c` and `c*` vanishes.
Prove the change of coordinates between `(Re c, Im c)` and `(c, c*)`, the realization of circular
systems, and that `c*c` and `cc*` have the free Poisson law of rate `1` and jump `1`. A Haar unitary
is a unitary `u` with `φ(uᵏ) = 0` for every nonzero integer `k`; prove that in a C*-probability space
the measure on the circle representing `f ↦ φ(f(u))` is the Haar probability measure, and compute its
alternating cumulants `κ_(2n)(u, u*, …, u, u*) = (−1)^(n−1) catalan(n − 1)` (Nica–Speicher, Lecture 15).
*Needs:* §§6.3, 6.5; Tau Ceti `TauCeti.IsSemicircular`, `TauCeti.freeCumulant`; Mathlib `unitary`,
`Circle`, `cfc`.

**Checks.**
- `φ(c*c) = 1`, `φ((c*c)²) = 2` and `φ(c²) = 0`, while a standard semicircular `s` has
  `φ(s²) = 1`: a circular element is not semicircular.
- `κ₂(u, u*) = 1` and `κ₄(u, u*, u, u*) = 1 − 1 − 1 = −1`: the only nonzero block moments are those
  of `1₄`, `{1, 2}{3, 4}` and `{1, 4}{2, 3}`, with Möbius coefficients `1`, `−1`, `−1`.

### 7.4 R-diagonal elements

An element `a` of a star-probability space is R-diagonal when its only nonvanishing free cumulants
with arguments in `{a, a*}` are those of even length with alternating arguments,
`κ_(2n)(a, a*, …, a, a*)` and `κ_(2n)(a*, a, …, a*, a)`. Call `α_n` and `β_n` these two determining
sequences. Prove that they determine all star-moments of `a`; the adjoint exchanges them and `λa` has
`|λ|^(2n) α_n`, `|λ|^(2n) β_n`; `a` and `e^(iθ) a` have the same star-distribution; circular elements
(`α₁ = β₁ = 1`, the rest zero) and Haar unitaries (`α_n = β_n = (−1)^(n−1) catalan(n − 1)`) are
R-diagonal. Prove that `φ` is tracial on the star-algebra generated by `a` if and only if `α = β`.
Prove `κ_n(aa*, …, aa*) = ∑_(π ∈ NC(n)) α_(|V₁|) ∏_(V ∈ π, V ≠ V₁) β_(|V|)`, with `V₁` the block
containing `1`, and the same formula for `a*a` with `α` and `β` exchanged; the distributions of `aa*`
and `a*a` together determine the star-distribution of `a`, and in the tracial case either one does
(Nica–Speicher, Lecture 15).
*Needs:* §§2.5, 7.3; Tau Ceti `TauCeti.freeCumulant_fiberProd`, `TauCeti.freeCumulant_star_comp_rev`.

**Checks.**
- A standard semicircular `s` is not R-diagonal: `κ₂(s, s) = 1` has non-alternating arguments.
- For `n = 2`, `κ₂(aa*, aa*) = α₂ + α₁β₁`; for a Haar unitary this is `−1 + 1 = 0`, as it must be,
  since `uu* = 1` is a constant.

### 7.5 Polar decomposition models

Prove the free Haar multiplication characterization: `a` is R-diagonal if and only if it has the same
star-distribution as `ua` for a Haar unitary `u` star-free from `a` (Nica–Speicher, Theorem 15.10).
Prove that a tracial R-diagonal star-distribution is realized in a C*-probability space as `uh`, with
`u` a Haar unitary star-free from a positive `h` whose law is that of `|a| = (a*a)^(1/2)`; this is a
distribution model, distinct from a polar decomposition inside the original algebra. In a finite von
Neumann algebra with a faithful normal trace, for `a` with `ker a = 0`, prove that `a` is R-diagonal
if and only if in its polar decomposition `a = u|a|` the factor `u` is a Haar unitary star-free from
`|a|`, and that `u` is then unitary (Nica–Speicher, Proposition 15.13 and Corollary 15.14). With
nonzero kernel the polar factor is only a partial isometry, so the Haar-unitary assertion belongs to
the distribution model and is not imposed on that partial isometry.
*Needs:* §§3.5, 3.7, 7.3–7.4; Tau Ceti `ContinuousLinearMap.polarFactor`,
`ContinuousLinearMap.polarFactor_comp_modulus`, `ContinuousLinearMap.modulus`,
`ContinuousLinearMap.IsPartialIsometry`; VonNeumannAlgebras Layer 2 (the polar factor lies in the
algebra); Mathlib `CFC.sqrt`.

**Checks.**
- A circular element `c` in `Γ(ℝ²) = L(F₂)` has `c*c` with the free Poisson law of rate `1`, which has
  no atom at `0`; so `ker c = 0`, and the polar factor of `c` is a Haar unitary star-free from `|c|`,
  with `|c|` quarter-circular.

### Examples

- Compressing two free standard semicircular elements by a projection of trace `1/2` free from both
  gives two free semicircular elements of variance `1/2` in the corner.
- A circular element and a Haar unitary are each R-diagonal with `α = β`; their product `uc`, with
  `u` star-free from `c`, has the star-distribution of `c`.

### Dependencies

Layers 2, 3, 5 and 6; Tau Ceti free cumulants, the Kreweras product formula and the polar
decomposition of bounded operators; VonNeumannAlgebras Layer 2.

## Layer 8: Gaussian and Haar random-matrix asymptotic freeness

This layer builds the matrix models: the algebra of random matrices with all moments, the Gaussian
ensembles and their Wick calculus, the genus expansion, the Weingarten asymptotics on top of the
Weingarten formula of RandomMatrices §6.5, and asymptotic freeness in expected normalized-trace
moments, with deterministic matrices that need not be bounded in norm. Its conclusions concern expected moments and expected
empirical measures. Sources: Nica–Speicher, Lectures 22–23, especially Theorems 22.35, 23.13 and
23.14 and Lemma 23.5; Collins, Theorem 3.1 and Propositions 3.2–3.3; Collins–Śniady, Proposition 2.2,
Corollary 2.4, Proposition 2.6 and Corollary 2.7.

### 8.1 Random matrices with all moments

For each `N ≥ 1` and a probability space `(Ω, P)`, construct the star-algebra of `N × N` random
matrices modulo a.e. equality (`MeasureTheory.AEEqFun`) whose entries lie in `⋂_(1 ≤ p < ∞) L^p`,
with the normalized tracial expectation `φ_N(X) = E[tr_N(X)]`. Prove integrability, closure under
sums, products (by Hölder's inequality) and adjoints, positivity `φ_N(X*X) ≥ 0`, `φ_N(1) = 1` and
traciality. Gaussian entries are unbounded, so this algebra is not `M_N(L∞)`. Joint star-moment
convergence of such families, possibly on different probability spaces for different `N`, is Tau
Ceti's `TauCeti.TendstoInStarMoments`, and its limit is a positive tracial functional on
star-polynomials (`TauCeti.existsUnique_positive_tracial_starDistribution_of_tendsto`); a limiting
distribution need not have a bounded C*-realization, and the algebraic limit remains meaningful.
Prove that coordinatewise a.e. equality of the measurable representatives of RandomMatrices
(Convention 1 there) preserves every integrable star-word and `E tr_N`.
*Needs:* Mathlib `MeasureTheory.AEEqFun`, `MeasureTheory.MemLp`, `MeasureTheory.MemLp.mul`; Tau Ceti
`TauCeti.TendstoInStarMoments`, `TauCeti.existsUnique_positive_tracial_starDistribution_of_tendsto`.

**Checks.**
- For `N = 1` a standard Gaussian random variable lies in every `L^p` and not in `L∞`; its moments
  `(2n − 1)!!` give a positive tracial limit functional with no bounded realization (§1.1).

### 8.2 Gaussian ensembles and the Wick formula

The GUE matrix of size `N` is RandomMatrices §5.1's Gaussian ensemble at `β = 2` with independent
standard Gaussian coordinates `g`: diagonal entries `g(j, j)/√N`, entries `(g(j, k) + i g(k, j))/√(2N)`
above the diagonal and their conjugates below, so that the diagonal entries are `N(0, 1/N)`, the real
and imaginary parts above the diagonal are `N(0, 1/(2N))`, and all these real coordinates are jointly
independent. The statements of this layer write it `gueMatrix N g`. Prove
`E[G_ij G_kl] = N⁻¹ δ_il δ_jk`. The complex Ginibre matrix (RandomMatrices §5.1) has independent
centred entries with `E[Z_ij conj(Z_kl)] = N⁻¹ δ_ik δ_jl` and `E[Z_ij Z_kl] = 0`; prove these. Extend
the real Wick–Isserlis formula of StandardDistributions §5.3, with Tau Ceti's
`TauCeti.Probability.centralMoment_id_two_mul_gaussianReal`, to the finite complex Gaussian Wick
formula for matrix words: the expectation of a product of jointly Gaussian centred complex entries is
the sum over all pairings of the products of the pair covariances. These are classical pairings,
before any noncrossing restriction.
*Needs:* RandomMatrices §5.1; StandardDistributions §5.3; Tau Ceti
`TauCeti.Probability.centralMoment_id_two_mul_gaussianReal`,
`TauCeti.Probability.properComplexGaussianMeasure`; Mathlib `ProbabilityTheory.gaussianReal`,
`ProbabilityTheory.iIndepFun`.

**Checks.**
- `E[G₁₂ G₂₁] = E|G₁₂|² = 1/N` while `E[G₁₂ G₁₂] = 0`; `E tr_N(G²) = 1`, the variance of the limiting
  semicircle law.
- For Ginibre, `E|Z_ij|² = 1/N` and `E[Z_ij²] = 0`; a real Gaussian matrix would have
  `E[Z_ij²] = 1/N`.

### 8.3 The genus expansion and asymptotic freeness of Gaussian families

For the GUE prove the exact expansion, for `m = 2k ≥ 2`,

```
φ_N(G^m) = ∑_(π ∈ P₂(m)) N^(#cycles(γπ) − 1 − k),   γ = (1 2 … m),
```

with `φ_N(G⁰) = 1` and odd moments zero, where `P₂(m)` is the set of pairings of `m` points. Prove
that the exponent is `−2g` with `g ≥ 0`, and `g = 0` exactly for the noncrossing pairings (Tau Ceti
`Equiv.Perm.orbitCount_finRotate_mul_add_orbitCount_le` and
`Function.Involutive.orbitCount_finRotate_mul_add_orbitCount_eq_iff`). Give the colored-pairing
version for independent GUE families, the adjoint-sensitive version for Ginibre families, and the
comparison of the leading terms with the free Wick formula of §3.9. Deduce the joint expected
star-moment convergence of independent Ginibre families to free circular systems; for independent
GUE families the convergence to free semicircular systems is the Gaussian case of RandomMatrices
§6.5. Give finite-`N` correction bounds for each fixed word by
counting the positive-genus terms; these are bounds on moments, not on norms (Nica–Speicher,
Lecture 22).
*Needs:* §§2.2, 3.9, 8.1–8.2; Tau Ceti `TauCeti.orbitCount`,
`Equiv.Perm.orbitCount_finRotate_mul_add_orbitCount_le`,
`Function.Involutive.orbitCount_finRotate_mul_add_orbitCount_eq_iff`.

**Checks.**
- `E tr_N(G⁴) = 2 + N⁻²` (three pairings of four points, one crossing) and
  `E tr_N(G⁶) = 5 + 10N⁻²` (five noncrossing and ten genus-one pairings of six points).
- For Ginibre, `E tr_N((ZZ*)²) = 2` for every `N`, while `E tr_N(Z²(Z*)²) = 1 + N⁻²`; the circular
  limits are `φ(cc*cc*) = 2` and `φ(c²c*²) = 1`.

### 8.4 Gaussian matrices and deterministic matrices

For a fixed finite family of deterministic matrices `D_N` whose joint star-moments under `tr_N`
converge, prove that independent GUE families are asymptotically free from `D_N`, with the free
semicircular limit specified in §8.3; no uniform bound on `‖D_N‖` is assumed (the case of uniformly
bounded `D_N`, also almost surely, is RandomMatrices §6.5's). This is the headline
theorem `tendsto_integral_trace_gueMatrix_word`: for independent standard Gaussian coordinates, if the
normalized-trace star-moments of `D N` converge to those of a family `d` in an algebra with normalized
functional `ψ`, and `s` are selfadjoint standard semicircular elements such that the algebras generated
by the `s_i` and the star-algebra generated by `d` are free, then the expected normalized trace of
every word in the GUE matrices, the `D N` and their adjoints converges to `ψ` of the corresponding word
in `s` and `d` (Nica–Speicher, Theorem 22.35). Construct the permutation-trace functional, the product
over the cycles of a permutation of the normalized traces of the corresponding words: it is
IntegralHeckeAndGaloisDeterminants §0.2's `cycleTerm` for the normalized trace `tr_N` on `M_N(ℂ)`, in
its cyclic traversal order with fixed points included. Prove the exact mixed Wick expansion of
`E tr_N` of a word in GUE and deterministic matrices as a sum over pairings of powers of `N` times
permutation traces of the `D_N`, and show that the subleading terms vanish in the limit because each
fixed deterministic trace word is bounded by its convergence hypothesis. Identify the leading
color-respecting noncrossing sums with the mixed moments of Layer 2, keeping the orientation of the
permutations compatible with the Kreweras complement. Extend the argument to non-selfadjoint Gaussian
families with adjoint colors. Bounded realizations of the limit are specified only when the
deterministic limit distribution has one.
*Needs:* §§2.2, 8.1–8.3; IntegralHeckeAndGaloisDeterminants §0.2 (`cycleProduct`, `cycleTerm`); Tau
Ceti `TauCeti.IsFreelyIndependent`, `TauCeti.IsSemicircular`,
`TauCeti.IsFreelyIndependent.apply_prod_ofFn_mul_eq_sum_partitionCumulant_mul_partitionMoment`.

**Checks.**
- For deterministic `D`, `E tr_N(GDGD) = (tr_N D)²` exactly and `E tr_N(G²D) = tr_N D`; the free
  limits are `φ(sdsd) = φ(d)²` and `φ(s²d) = φ(d)`.
- `D_N = diag(log N, 0, …, 0)` has `‖D_N‖ → ∞` but `tr_N(D_Nᵏ) = (log N)ᵏ/N → 0` for every `k ≥ 1`,
  so its limit distribution is that of `0`: the theorem applies, a version requiring
  `sup_N ‖D_N‖ < ∞` does not.

### 8.5 Haar measure on the unitary group and the Weingarten calculus

The unitary group `U(N)` is Mathlib's `Matrix.unitaryGroup (Fin N) ℂ`, with the subspace topology of
the entrywise topology, compact by Tau Ceti's `TauCeti.Matrix.isCompact_unitaryGroup`, a topological
group, and with the Borel structure of Mathlib's entrywise measurable structure on matrices; its Haar
probability measure is Tau Ceti's `TauCeti.haarProb`. The Haar entry moments and the Weingarten
integration formula are RandomMatrices §6.5's: integrals of unbalanced coefficient products vanish,
and for `N ≥ k`

```
E[∏_(r=1)^k U_(i_r j_r) conj(U_(i′_r j′_r))]
  = ∑_(α, β ∈ S_k) (∏_r δ(i_r, i′_(β(r)))) (∏_r δ(j_r, j′_(α(r)))) Wg(N, βα⁻¹),
```

where the unitary Weingarten function `Wg(N, σ)` is the entry `(1, σ)` of the inverse of the Gram
matrix `G_N(σ, τ) = N^(#cycles(σ⁻¹τ))` of the permutation operators on `(ℂ^N)^(⊗k)`, invertible for
`N ≥ k` (Collins–Śniady, Proposition 2.2 and Corollary 2.4). They are written `permGram N k` and
`weingarten N k σ`; for `N < k` the Gram matrix is singular, Mathlib's inverse and so this value are
zero, and no statement here uses it. Prove the headline theorem `isBigO_pow_mul_weingarten_sub`: for
fixed `σ ∈ S_k`, `Wg(N, σ) = N^(#cycles(σ) − 2k) (Möb(σ) + O(N⁻²))`, where
`Möb(σ) = ∏_(cycles C) (−1)^(|C| − 1) catalan(|C| − 1)`, with an error bound uniform over the finitely
many `σ ∈ S_k`, through the finite Gram expansion and the transposition-length geodesics of §2.2
(Collins–Śniady, Corollary 2.7, refining the order bound of their Proposition 2.6). It identifies
the leading coefficient, which the large-dimension estimates of RandomMatrices §6.5 do not specify;
the large-`N` statement uses no inverse at a singular small dimension.
*Needs:* §2.2; RandomMatrices §6.5; Tau Ceti `TauCeti.Matrix.isCompact_unitaryGroup`,
`TauCeti.haarProb`, `TauCeti.orbitCount`; Mathlib `Matrix.unitaryGroup`, `Matrix.inv`.

**Checks.**
- `k = 1`: `G_N = (N)` and `Wg(N, 1) = 1/N`, so `E[U_ij conj(U_kl)] = δ_ik δ_jl/N`.
- `k = 2`: `G_N` has rows `(N², N)` and `(N, N²)`, so `Wg(N, 1) = 1/(N² − 1)` and
  `Wg(N, (1 2)) = −1/(N(N² − 1))`; hence `E|U₁₁|²|U₂₂|² = 1/(N² − 1)` and
  `E|U₁₁|⁴ = 2(Wg(1) + Wg((1 2))) = 2/(N(N + 1))`. At `N = 1` the Gram matrix has rows `(1, 1)` and
  `(1, 1)` and is singular. The asymptotics read `N² Wg(N, 1) → 1 = Möb(1)` and
  `N³ Wg(N, (1 2)) → −1 = Möb((1 2))`.
- `k = 3`: `Wg(N, 1) = (N² − 2)/(N(N² − 1)(N² − 4))`, `Wg(N, (1 2)) = −1/((N² − 1)(N² − 4))` and
  `Wg(N, (1 2 3)) = 2/(N(N² − 1)(N² − 4))`, so `N⁵ Wg(N, (1 2 3)) → 2 = (−1)² catalan 2`.

### 8.6 Asymptotic freeness of Haar unitary matrices

Prove that independent Haar unitary matrices converge in joint star-moments, in expectation, to free
Haar unitaries, and are asymptotically free from any deterministic finite family whose joint
star-moments under `tr_N` converge; no norm bound is assumed (the case of uniformly bounded
deterministic matrices, also almost surely, is RandomMatrices §6.5's). The proof covers every centred
mixed word, by the Weingarten
expansion, the geodesic fixed-point lemma and the vanishing of centred cycle traces; a proof for a
single unitary or for a single alternating word does not discharge the theorem (Nica–Speicher,
Theorem 23.13 and Lemma 23.5; Collins, Theorem 3.1 and Propositions 3.2–3.3, applied to the
deterministic family together with its adjoints). Prove the conjugation version, the headline theorem
`tendsto_integral_trace_haar_conj_word`: for deterministic families `A_N` and `D_N` whose separate
joint star-distributions under `tr_N` converge, and `U_N` Haar distributed on `U(N)`, the families
`U_N A_N U_N*` and `D_N` have a free joint limiting star-distribution, the limits of the two families
being free in the limit algebra (Nica–Speicher, Theorem 23.14; Speicher, Theorem 7.5). No joint
limit of the combined deterministic family and no uniform norm bound is required. *Route:* the
Weingarten formula writes `E tr_N` of a word in the `U_N A_N U_N*` and the `D_N` as a sum over pairs
of permutations of Weingarten values times products of normalized traces of words in the `A_N` alone
and in the `D_N` alone (Speicher, proof of Theorem 7.5), so separate limits suffice; under a joint
limit the statement is also Collins, Corollary 3.4.
*Needs:* §§8.1, 8.5; RandomMatrices §6.5; Tau Ceti `TauCeti.haarProb`, `TauCeti.IsFreelyIndependent`,
`TauCeti.TendstoInStarMoments`.

**Checks.**
- `E tr_N(U A U* B) = tr_N(A) tr_N(B)` exactly, from `Wg(N, 1) = 1/N`; for free `a`, `b` the limit
  value is `φ(ab) = φ(a)φ(b)`.
- `E tr_N(Uᵏ) = 0` for every `N` and every `k ≠ 0`: the substitution `U ↦ e^(iθ) U` preserves Haar
  measure and multiplies `tr_N(Uᵏ)` by `e^(ikθ)`. The limit is a Haar unitary element (§7.3).

### 8.7 Expected empirical spectral measures

For selfadjoint deterministic `A_N`, `B_N` with limiting laws `μ`, `ν` that are compactly supported,
prove that the expected empirical spectral measures of `A_N + U_N B_N U_N*` converge weakly to
`μ ⊞ ν`, and, for `A_N, B_N ≥ 0`, those of `A_N^(1/2) U_N B_N U_N* A_N^(1/2)` to `μ ⊠ ν` (Speicher,
Theorem 7.5 and the example after it, for the sum). No uniform bound on `‖A_N‖` and `‖B_N‖` is
assumed; the uniformly bounded case is RandomMatrices §6.5's. The empirical
spectral measure of a Hermitian matrix is Tau Ceti's `Matrix.spectralMeasure`, its trace moments are
`Matrix.integral_pow_spectralMeasure`, and its measurability in the matrix comes from the continuous
ordered eigenvalues (`Matrix.measurable_eigenvalues₀`); prove the measurability of the expected
empirical measure with respect to the all-moments quotient of §8.1, the comparison of every normalized
trace moment, and the tightness and higher-moment uniform integrability needed for weak convergence.
Give as concrete computations the semicircle example, sums of independent GUE matrices, and Haar
conjugation of deterministic positive matrices. The conclusions concern expected measures and expected
star-moments only.
*Needs:* §§5.1, 5.7, 8.1, 8.3, 8.6; Tau Ceti `Matrix.spectralMeasure`,
`Matrix.integral_pow_spectralMeasure`, `Matrix.measurable_eigenvalues₀`,
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`.

**Checks.**
- For `N` even and `A_N`, `B_N` orthogonal projections of rank `N/2`, the expected empirical measure of
  `A_N + U_N B_N U_N*` converges to `(½δ₀ + ½δ₁) ⊞ (½δ₀ + ½δ₁)`, the arcsine law on `(0, 2)`;
  its second moment `3/2` is already `E tr_N((A_N + U_N B_N U_N*)²) = ½ + 2 · ¼ + ½` for every such
  `N`.

### Examples

- For independent GUE matrices `G₁, G₂`, `E tr_N(G₁G₂G₁G₂) = N⁻²` and `E tr_N(G₁²G₂²) = 1`, with limits
  `0` and `1`, the values for two free standard semicircular elements.
- `E tr_N(G⁴) = 2 + N⁻²` converges to `2 = catalan 2`, the fourth moment of `semicircleReal 0 1`.

### Dependencies

Layers 2, 3 and 5; RandomMatrices §5.1 (GUE and Ginibre ensembles) and §6.5 (Haar entry moments and
the Weingarten formula); StandardDistributions §5.3; IntegralHeckeAndGaloisDeterminants §0.2; Tau
Ceti random matrix spectral measures and eigenvalues, Haar probability, permutation cycle counts and
convergence in star moments; Mathlib Gaussian measures, independence, unitary groups and `MeasureTheory.AEEqFun`.

## Downstream consumers

- [FactorRigidity](../FactorRigidity/README.md) cites F3–F4: the tracial reduced free products and the
  reduced-word decomposition of their `L²` (§§3.4–3.7), and the amalgamated free products with their
  expectations (§§4.4–4.6), for `N ∗ N` and its deformations.
- [Subfactors](../Subfactors/README.md) cites F3–F4: scalar full Fock spaces and reduced free products
  (§§3.3–3.4, 3.8) and tracial amalgamated free products (§4.6).
- [CategoricalOperatorAlgebras](../CategoricalOperatorAlgebras/README.md) cites F2–F4: noncrossing
  pairings for its Wick traces (§2.2 and Tau Ceti's noncrossing partitions), Fock models (§3.8) and
  reduced and amalgamated products (Layers 3–4).
- [QuantumGroups](../QuantumGroups/README.md) cites F1, F3 and F6: scalar moments, the adjacency norm
  of the free group with the full–reduced counterexample (§3.6) and the standard semicircular law
  (§6.1).
- [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md) and
  [OperatorKTheory](../OperatorKTheory/README.md) record the norm obstruction of §3.6 as a comparison
  with their own free-group results; OperatorKTheory records the end-oriented shift and the
  radial-vector bounds of §3.6 as owned here.
- [CStarAlgebras](../CStarAlgebras/README.md) leaves free products with prescribed states or
  expectations to Layers 3–4.
- [TemperleyLieb](../TemperleyLieb/README.md) cites F2 for noncrossing partitions; the carrier is Tau
  Ceti's `TauCeti.NoncrossingPartition`.

## Scope and ownership

**This roadmap owns** the bounded realizations of positive distributions and the passage of freeness
to weak closures (Layer 1); the plane-tree and geodesic characterizations of noncrossing partitions,
the Möbius function on all intervals of `NC(n)`, the low-order cumulant formulas and the generator
tests for freeness (Layer 2); free products with prescribed states, algebraic, full, reduced and von
Neumann algebraic, on the reduced-word Hilbert space of RandomMatrices §6.2 the right representations,
the commutants and their modular and trace compatibility, the full/reduced obstruction for the free group with its end-oriented shift and
radial-vector norm bounds, full Fock space and the free Gaussian functor (Layer 3); C*-conditional
expectations, the expectation-GNS module, the reduced amalgamated free product module and products,
free products of unital completely positive maps and the tracial amalgamated von Neumann products
(Layer 4); the free cumulants of compactly supported laws and their bounds, density recovery from the
Cauchy transform, noncommutative formal series, boxed convolution, the formal S-transform and its
comparison with the analytic one (Layer 5); the Fock realization of the semicircle law, the free
Gaussian algebras, semicircular systems, the free law of large numbers, free Poisson laws of every
jump, compound free Poisson laws and free infinite divisibility for
compactly supported laws (Layer 6); compression by free projections and matrix units, circular
elements, Haar unitaries, R-diagonal elements and their polar models (Layer 7); and the random-matrix
algebra with all moments, the Gaussian Wick calculus and genus expansion, the leading-order
Weingarten asymptotics, asymptotic freeness in expected moments of Gaussian and Haar unitary matrices with deterministic
matrices without norm bounds, and the expected empirical spectral measures (Layer 8).

**In the Tau Ceti library at the pin.** The scalar free probability on which the layers rest is
proved in Tau Ceti and consumed by name (supplier contracts below); it is not planned again here. The
targets of the former sections F1–F8 that the pin proves resolve as follows (paths under `TauCeti/`).

| Former target | Tau Ceti declaration |
|---|---|
| F1: joint distributions as evaluation on noncommutative polynomials, word extensionality, relabeling, subfamilies, substitution | `TauCeti.jointDistribution`, `TauCeti.jointDistribution_eq_iff`, `TauCeti.jointDistribution_comp`, `TauCeti.jointDistribution_subst` (`Probability/FreeProbability/Distribution/Basic.lean`) |
| F1: the star-polynomial synonym with its conjugate-linear involution and universal property | `TauCeti.StarPolynomial`, `TauCeti.StarPolynomial.lift` (`Algebra/Star/StarPolynomial.lean`) |
| F1: star-distributions and their transport | `TauCeti.starDistribution` and its API (`Probability/FreeProbability/Distribution/Star.lean`) |
| F1: algebraic GNS realization of a positive distribution | `TauCeti.StarPositiveFunctional` with `GNS`, `representation`, `cyclicVector` (`Analysis/StarAlgebra/GNS.lean`) |
| F1: the law `μ_a` of a selfadjoint element, its characterization by the functional calculus, uniqueness, moments, compact support, affine and polynomial pushforwards, comparison with the GNS spectral measure, realization of every compactly supported law | `PositiveLinearMap.law`, `PositiveLinearMap.eq_law_iff`, `PositiveLinearMap.law_eq_law_iff_forall_apply_pow`, `PositiveLinearMap.law_smul_add_algebraMap`, `PositiveLinearMap.law_cfc`, `PositiveLinearMap.law_eq_map_gns_diagMeasure`, `PositiveLinearMap.law_integralPositiveLinearMap_comap_restrict_id` (`Probability/FreeProbability/Law/`) |
| F1: compatibility with moment determinacy | `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_support` (`Probability/Moments/CompactDeterminacy.lean`), `PositiveLinearMap.eq_law_iff_forall_integral_pow` |
| F1: convergence in distribution and in star-distribution; moment-to-weak convergence without a common support bound | `TauCeti.TendstoInMoments`, `TauCeti.TendstoInStarMoments` (`Probability/FreeProbability/Distribution/Convergence.lean`), `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow` (`Probability/Moments/WeakConvergence.lean`), `PositiveLinearMap.tendsto_law_of_tendsto_apply_pow` |
| F1: freeness of subalgebras, elements and star-elements; subfamilies, restriction, images, grouping, uniqueness of the joint distribution, first mixed moments, centred polynomial tests, scalars and empty families, commuting variables, norm closures | `TauCeti.IsFreelyIndependent`, `TauCeti.IsFreelyIndependentElements`, `TauCeti.IsStarFreelyIndependentElements`, `TauCeti.IsFreelyIndependent.eqOn_iSup`, `TauCeti.IsFreelyIndependent.iSup_fiber`, `TauCeti.IsFreelyIndependent.apply_mul_of_ne`, `TauCeti.isFreelyIndependentElements_iff_polynomial`, `TauCeti.isFreelyIndependent_domRestrict_iff`, `TauCeti.IsFreelyIndependent.sub_mul_sub_eq_zero_of_commute`, `TauCeti.IsFreelyIndependent.topologicalClosure` (`Probability/FreeProbability/`) |
| F1: orthogonality of reduced words for positive states | `TauCeti.IsFreelyIndependent.apply_star_prod_mul_prod`, `TauCeti.IsFreelyIndependent.inner_gnsStarAlgHom_prod_gnsVector` (`Probability/FreeProbability/Orthogonality.lean`) |
| F2: noncrossing partitions on `Finpartition`, decidability, restriction, monotone relabeling, singleton insertion and deletion, rotation, reversal, the lattice with its meet and join | `Finpartition.IsNoncrossing`, `TauCeti.NoncrossingPartition` with its lattice, `TauCeti.NoncrossingPartition.comap`, `TauCeti.NoncrossingPartition.singletonPartEquiv`, `TauCeti.NoncrossingPartition.rotate`, `TauCeti.NoncrossingPartition.reverse` (`Combinatorics/NoncrossingPartition/`) |
| F2: `card NC(n) = catalan n`, noncrossing pairings, the recurrence by the first block, Narayana counts | `TauCeti.NoncrossingPartition.card_fin_eq_catalan`, `TauCeti.NoncrossingPartition.card_isPairing_fin_eq_catalan`, `TauCeti.NoncrossingPartition.card_eq_sum_card_mul_card`, `TauCeti.NoncrossingPartition.card_parts_eq_div` |
| F2: the permutation model and the Kreweras complement: existence, maximality, order reversal, bijectivity, its square, block count, `p_(K(π)) = p_π⁻¹ γ` | `Finpartition.formPerm`, `TauCeti.NoncrossingPartition.kreweras`, `TauCeti.NoncrossingPartition.isGreatest_kreweras`, `TauCeti.NoncrossingPartition.krewerasOrderIso`, `TauCeti.NoncrossingPartition.kreweras_kreweras`, `TauCeti.NoncrossingPartition.card_parts_add_card_parts_kreweras`, `TauCeti.NoncrossingPartition.formPerm_kreweras` |
| F2: lower intervals, `μ(0_n, 1_n) = (−1)^(n−1) catalan(n − 1)`, the blockwise formula for `μ(0, π)`, the interval-partition embedding | `TauCeti.NoncrossingPartition.iicOrderIso`, `TauCeti.NoncrossingPartition.mu_bot_top_fin`, `TauCeti.NoncrossingPartition.mu_bot_eq_prod`, `TauCeti.NoncrossingPartition.exists_comap_eq_iff` |
| F2: block moments, free cumulants by Möbius inversion, both moment–cumulant formulas, multiplicativity, multilinearity, scalar and adjoint transport, unit arguments, centring, cyclic invariance for traces, the first two cumulants, products as arguments | `TauCeti.partitionMoment`, `TauCeti.freeCumulant`, `TauCeti.partitionCumulant`, `TauCeti.apply_prod_ofFn_eq_sum_prod_freeCumulant`, `TauCeti.freeCumulant_eq_sum_mu_mul_partitionMoment`, `TauCeti.partitionCumulant_eq_prod_freeCumulant`, `TauCeti.freeCumulantMultilinear`, `TauCeti.freeCumulant_star_comp_rev`, `TauCeti.freeCumulant_eq_zero_of_apply_eq_one`, `TauCeti.freeCumulant_add_algebraMap`, `TauCeti.freeCumulant_comp_finRotate`, `TauCeti.freeCumulant_pair`, `TauCeti.freeCumulant_fiberProd` (`Probability/FreeProbability/Cumulant/`) |
| F2: freeness is the vanishing of mixed cumulants, additivity over free sums, cumulants and moments of products of two free families | `TauCeti.isFreelyIndependent_iff_freeCumulant_eq_zero`, `TauCeti.IsFreelyIndependentElements.freeCumulant_sum`, `TauCeti.IsFreelyIndependent.freeCumulant_mul_eq_sum_partitionCumulant_mul_partitionCumulant`, `TauCeti.IsFreelyIndependent.apply_prod_ofFn_mul_eq_sum_partitionCumulant_mul_partitionMoment` |
| F2: the noncrossing-pairing criterion and the genus bound | `Function.Involutive.orbitCount_finRotate_mul_add_orbitCount_eq_iff`, `Equiv.Perm.orbitCount_finRotate_mul_add_orbitCount_le` (`Combinatorics/ChordDiagram.lean`) |
| F5: moment series, cumulant series, R-series, the functional equation and its inverse form, uniqueness, additivity over free sums | `TauCeti.momentSeries`, `TauCeti.freeCumulantSeries`, `TauCeti.rSeries`, `TauCeti.freeCumulantSeries_subst_X_mul_momentSeries`, `TauCeti.momentSeries_eq_one_add_X_mul_momentSeries_mul_rSeries_subst`, `TauCeti.freeCumulantSeries_eq_subst_substInvOfIsUnit`, `TauCeti.eq_freeCumulantSeries_of_subst_eq`, `TauCeti.IsFreelyIndependentElements.rSeries_sum` (`Probability/FreeProbability/Cumulant/Series.lean`) |
| F5: sign, conjugation, imaginary part, normalization and moment expansion of the resolvent transform; Stieltjes inversion with atoms; uniqueness | `MeasureTheory.Measure.resolventTransform_conj`, `MeasureTheory.im_resolventTransform_pos`, `MeasureTheory.hasSum_resolventTransform_of_ae_norm_le`, `MeasureTheory.tendsto_mul_I_mul_resolventTransform`, `MeasureTheory.tendsto_intervalIntegral_im_resolventTransform`, `MeasureTheory.tendsto_mul_im_resolventTransform`, `MeasureTheory.Measure.ext_of_resolventTransform` (`MeasureTheory/Measure/ResolventTransform/`) |
| F6: the centred semicircle measure of variance `σ²` (density, `δ₀` at `σ = 0`, normalization, symmetry, support, odd moments, `m_(2n) = catalan(n) σ^(2n)`), its only cumulant `κ₂ = σ²`, semicircular elements | `TauCeti.Probability.semicircleReal`, `TauCeti.Probability.semicircleReal_eq_withDensity`, `TauCeti.Probability.integral_pow_two_mul_semicircleReal_zero`, `TauCeti.IsSemicircular`, `TauCeti.isSemicircular_iff_freeCumulant_const`, `PositiveLinearMap.law_eq_semicircleReal_iff` (`Probability/Distributions/Semicircle/`, `Probability/FreeProbability/Semicircular/`) |
| F6: the free central limit theorem in moments and in law, identically distributed and with bounded moments and convergent average variance | `TauCeti.IsFreelyIndependentElements.tendsto_apply_inv_sqrt_smul_sum_pow_semicircleReal`, `TauCeti.IsFreelyIndependentElements.tendsto_apply_inv_sqrt_smul_sum_pow_of_apply_pow_eq`, `TauCeti.IsFreelyIndependentElements.tendsto_law_inv_sqrt_smul_sum_semicircleReal` (`Probability/FreeProbability/CentralLimit.lean`, `Law/CentralLimit.lean`) |
| F8: the limiting positive tracial functional of convergent word moments | `TauCeti.existsUnique_positive_tracial_starDistribution_of_tendsto` (`Probability/FreeProbability/Distribution/Limit.lean`) |
| F8: compactness of `U(N)` and its normalized Haar probability | `TauCeti.Matrix.isCompact_unitaryGroup` (`Topology/Algebra/UnitaryGroup.lean`), `TauCeti.haarProb` (`RepresentationTheory/Compact/Haar.lean`) |
| F8: Schur–Weyl duality for `GL_N` | `TauCeti.centralizer_range_tensorPowerRep_eq_range_permTensorActionAlgHom` (`RepresentationTheory/Symmetric/TensorAction/GeneralLinear.lean`) |
| The bound `‖φ a‖ ≤ ‖a‖` for a state | Mathlib's `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one`, `‖φ‖ = φ 1` |

A proof of the free central limit theorem by noncrossing pairings or by cumulants, and of the
freeness criterion, is a route to a theorem the pin proves, not a separate statement.

**Consumed from RandomMatrices.** [RandomMatrices](../RandomMatrices/README.md) Layer 6 owns the
bounded scalar core of the same theory, and this roadmap cites it there: the free product with
positive state on the reduced-word Hilbert space (its §6.2, used in §§3.3–3.4), free additive and
multiplicative convolution of compactly supported laws with their analytic R- and S-transforms (its
§6.3, used in §§5.1, 5.3 and 5.7), the free Poisson limit of jump `1` (its §6.4, used in §6.5), and
the Haar entry moments, the Weingarten formula and asymptotic freeness of Wigner and Haar-conjugated
families with uniformly bounded deterministic matrices (its §6.5, used in §§8.3–8.7). What is planned
here goes beyond it: the right representations, commutants, full, reduced C*- and von Neumann
completions and faithfulness (Layer 3), the free cumulants of laws, the formal S-transform of an
arbitrary normalized functional and its comparison with the analytic one (Layer 5), free Poisson
laws of every jump (§6.5), the exact Weingarten asymptotics (§8.5), and asymptotic freeness without
norm bounds (§§8.4, 8.6–8.7). RandomMatrices also owns the almost-sure, variance and
higher-centred-moment and orthogonal conclusions, non-Gaussian Wigner matrices, and its matrix
applications. RandomMatrices also supplies the Gaussian and Ginibre ensembles (its §5.1) and
the Marchenko–Pastur moments and support (its §3.4); its finite combinatorial prerequisite is Tau
Ceti's noncrossing-partition library, with the pairing converse that Layer 8 consumes. The free Poisson
law of rate `λ > 0` and jump `1` is the dilation by `λ` of `marchenkoPastur (1/λ)`; the general jump
and compound laws are §§6.5–6.6.

**Owned elsewhere and consumed here.**

- [CStarAlgebras](../CStarAlgebras/README.md) Layers 1–5 (written C1–C5 there): ideals and multipliers,
  representations, operator spaces, CP dilations and C*-tensor products; the continuous functional
  calculus is Mathlib's.
- [VonNeumannAlgebras](../VonNeumannAlgebras/README.md): Layer 0 (states, GNS, faithful
  representations; a unit vector in a faithful representation of a nontrivial algebra is chosen here),
  Layer 1 (operator topologies, bicommutant theorem, Kaplansky density), Layer 2 (Borel calculus,
  completed Hilbert tensor products, membership of the polar factor), Layer 4 (normal states and
  representations), Layer 6 (tracial `L²`), Layer 8 (group von Neumann algebras, `L(ℤ) ≅ L∞(𝕋)`,
  V8.SubgroupCosets), Layers 10–11 (Tomita–Takesaki theory, and Takesaki's conditional-expectation
  theorem specialized to traces, which gives the faithful normal trace-preserving expectations of §4.6
  with their uniqueness and their `L²`-projection description) and §13.1 (CP maps and Tomiyama's
  theorem). NoncommutativeIntegration §4.3 consumes the same expectations and adds the `Lp` inclusions,
  which this roadmap does not use.
- [HilbertModules](../HilbertModules/README.md) H1–H3: completed right Hilbert modules over `Bᵐᵒᵖ`,
  adjointable maps, infinite orthogonal sums (finite sums are Mathlib product instances) and interior
  tensor products.
- [OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
  Part B: bounded Borel calculus and spectral measures. The polar decomposition of bounded operators
  of [OperatorTheory/PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) is Tau Ceti's
  `ContinuousLinearMap.polarFactor`.
- [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md) D1–D2: full and reduced group
  C*-algebras, compared in §3.6 with D2.FreeGroups; D6 owns the finite universal `O_n`.
- [OperatorKTheory](../OperatorKTheory/README.md): §4.3 (Hilbert-module Kasparov–Stinespring
  dilation), §7.3 (K7.FreeGroups: the reduced-word, path and acyclicity interface on
  `SimpleGraph.mulCayley`) and §7.6 (the Toeplitz–Cuntz algebras `E_n` with their faithful creation
  representations, the quotients `O_n` and `O_∞`); their K-theory is not rebuilt here.
- [StandardDistributions](../StandardDistributions/README.md) §5.3: the real Gaussian Wick–Isserlis
  formula; §8.2 extends it to complex entries.
- [IntegralHeckeAndGaloisDeterminants](../IntegralHeckeAndGaloisDeterminants/README.md) §0.2:
  `cycleProduct` and `cycleTerm`, specialized in §8.4 to `tr_N`.
- RepresentationTheory/CompactGroups Layer 0 builds on the Tau Ceti Haar probability that Layer 8
  consumes directly.

**Outside this roadmap.** Factor rigidity, index, planar algebras and classification theorems
(FactorRigidity, Subfactors); free entropy; the isomorphism problem for free group factors; analytic
subordination and Lévy theory for general unbounded laws; non-Gaussian Wigner ensembles, almost-sure
random-matrix convergence and strong convergence of random-matrix operator norms.

**Related formalizations.** The
[Lean random-matrix discussion](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/what's.20the.20status.20of.20random.20matrix.20theory.3F/near/499996486)
records an independent free central limit theorem project, and the
[SemicircleLaw project](https://github.com/FredRaj3/SemicircleLaw) develops classical Wigner moment
counting. Compatible designs for algebraic expectations, Catalan numbers and Gaussians are followed;
any integration of that code requires coordination and licence verification under the repository's
contribution rules. These projects neither transfer ownership nor create a waiting condition.

## Exact supplier contracts

### From Mathlib

- Algebra: `Algebra`, `LinearMap`, `Subalgebra`, `Algebra.adjoin`, `StarSubalgebra`,
  `StarAlgebra.adjoin`, `FreeAlgebra` with `FreeAlgebra.lift`, `FreeMonoid`,
  `LinearAlgebra.FreeProduct` with `LinearAlgebra.FreeProduct.lift` (the unital free product of a
  family of algebras, `[DecidableEq I]`), `Monoid.CoprodI` and `Monoid.PushoutI` with
  `Monoid.PushoutI.NormalWord` (reduced words relative to a transversal; the factor maps are injective
  when the amalgamating maps are), `FreeGroup`, `Equiv.Perm` with `Equiv.Perm.cycleType`, `finRotate`,
  `catalan`.
- Order and combinatorics: `Finpartition`, `IncidenceAlgebra` with `IncidenceAlgebra.mu` and
  `IncidenceAlgebra.moebius_inversion_bot` on locally finite orders.
- Power series: `PowerSeries`, `PowerSeries.subst`, `PowerSeries.HasSubst`,
  `PowerSeries.substInvOfIsUnit` (for `P` with unit linear coefficient; substituting it into `P`
  gives `X` when the constant coefficient of `P` is zero), `MvPowerSeries`.
- Operator algebras: `CStarAlgebra`, `PositiveLinearMap` (`A →ₚ[ℂ] ℂ`, automatically continuous) with
  `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one` (`‖φ‖ = φ 1`), `PositiveLinearMap.GNS`,
  `PositiveLinearMap.gnsStarAlgHom`, `CompletelyPositiveMap`, `CStarMatrix`, `CStarModule`,
  `VonNeumannAlgebra` with `VonNeumannAlgebra.commutant`, `cfc`, `CFC.sqrt`, `unitary`,
  `ContinuousLinearMap.adjoint`.
- Hilbert spaces: `InnerProductSpace` (conjugate-linear in the first argument), `lp` and its inner
  product, `IsHilbertSum`, `HilbertBasis`, `Submodule.orthogonal`, the inner product on
  `TensorProduct` and `UniformSpace.Completion`.
- Analysis and measure theory: `MeasureTheory.resolventTransform` (the integral of `(t − z)⁻¹`) and
  `analyticOn_resolventTransform` (analytic off the support for a finite measure),
  `FormalMultilinearSeries`, `HasFPowerSeriesOnBall`, `MeasureTheory.AEEqFun`, `MeasureTheory.MemLp` with `MeasureTheory.MemLp.mul`,
  `MeasureTheory.Measure.haar`, `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.iIndepFun`,
  `Matrix.unitaryGroup` with its topological-group structure, the entrywise measurable structure on
  `Matrix` and its Borel property, `Circle`, `SimpleGraph.mulCayley`, `Matrix.PosSemidef`, `Cardinal`.

### From Tau Ceti

All the declarations below are proved at the pin; paths are under `TauCeti/`.

- *Distributions and freeness* (`Probability/FreeProbability/`): `TauCeti.jointDistribution` and
  `TauCeti.starDistribution` with their transport lemmas (`Distribution/Basic.lean`,
  `Distribution/Star.lean`); `TauCeti.IsFreelyIndependent` (`Independence.lean`: `φ` vanishes on every
  nonempty centred word with consecutive labels distinct; no normalization, positivity or trace in the
  definition), with `TauCeti.IsFreelyIndependent.eqOn_iSup` (two normalized functionals for which the
  family is free and which agree on each member agree on the generated algebra),
  `TauCeti.IsFreelyIndependent.iSup_fiber`, `TauCeti.IsFreelyIndependent.apply_mul_of_ne`,
  `TauCeti.IsFreelyIndependent.apply_mul_mul_mul_of_ne`,
  `TauCeti.IsFreelyIndependent.sub_mul_sub_eq_zero_of_commute`,
  `TauCeti.isFreelyIndependent_domRestrict_iff`, `TauCeti.isFreelyIndependent_of_subsingleton`;
  `TauCeti.IsFreelyIndependentElements` (`Variables.lean`) with
  `TauCeti.isFreelyIndependentElements_iff_polynomial`; `TauCeti.IsStarFreelyIndependentElements`
  (`StarIndependence.lean`); `TauCeti.IsFreelyIndependentElements.jointDistribution_eq_of_forall_pow`
  (`Distribution/Free.lean`: for normalized functionals, free families with equal one-variable moments
  have equal joint distributions); `TauCeti.IsFreelyIndependent.topologicalClosure` (`Topology.lean`:
  a continuous normalized functional on a topological ring); `TauCeti.TendstoInMoments`,
  `TauCeti.TendstoInStarMoments` (`Distribution/Convergence.lean`: every word, including the empty
  word, converges; the algebras may vary) and
  `TauCeti.existsUnique_positive_tracial_starDistribution_of_tendsto` (`Distribution/Limit.lean`);
  `TauCeti.IsFreelyIndependent.apply_star_prod_mul_prod` and
  `TauCeti.IsFreelyIndependent.inner_gnsStarAlgHom_prod_gnsVector` (`Orthogonality.lean`).
- *Star-polynomials and GNS*: `TauCeti.StarPolynomial` and `TauCeti.StarPolynomial.lift`
  (`Algebra/Star/StarPolynomial.lean`); `TauCeti.StarPositiveFunctional` with `GNS`, `representation`
  and `cyclicVector` (`Analysis/StarAlgebra/GNS.lean`); `PositiveLinearMap.gnsVector`
  (`Analysis/CStarAlgebra/GNS.lean`, a unit vector when `φ 1 = 1`, cyclic for `gnsStarAlgHom`).
- *Laws* (`Probability/FreeProbability/Law/`): `PositiveLinearMap.law` (for a positive `φ` on a
  unital C*-algebra and selfadjoint `a`, the measure on the spectrum with `∫ f d(law φ a) = φ(f(a))`;
  zero for non-selfadjoint `a`), `PositiveLinearMap.eq_law_iff`,
  `PositiveLinearMap.isProbabilityMeasure_law` (when `φ 1 = 1`),
  `PositiveLinearMap.eq_law_iff_forall_integral_pow`, `PositiveLinearMap.law_eq_law_iff_forall_apply_pow`,
  `PositiveLinearMap.law_smul_add_algebraMap`, `PositiveLinearMap.law_cfc`,
  `PositiveLinearMap.law_integralPositiveLinearMap_comap_restrict_id`,
  `PositiveLinearMap.law_eq_map_gns_diagMeasure`, `PositiveLinearMap.tendsto_law_of_tendsto_apply_pow`
  (only the limit needs compact support); `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_support`
  (`Probability/Moments/CompactDeterminacy.lean`);
  `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`
  (`Probability/Moments/WeakConvergence.lean`).
- *Noncrossing partitions* (`Combinatorics/NoncrossingPartition/`): `Finpartition.IsNoncrossing`,
  `TauCeti.NoncrossingPartition` (a bounded, locally finite lattice under refinement, meet the common
  refinement), `TauCeti.NoncrossingPartition.card_fin_eq_catalan`,
  `TauCeti.NoncrossingPartition.card_isPairing_fin_eq_catalan`,
  `TauCeti.NoncrossingPartition.card_parts_eq_div`, `TauCeti.NoncrossingPartition.kreweras` (bars
  labelled by the position before them) with `TauCeti.NoncrossingPartition.isGreatest_kreweras`,
  `TauCeti.NoncrossingPartition.krewerasOrderIso`, `TauCeti.NoncrossingPartition.kreweras_kreweras`,
  `TauCeti.NoncrossingPartition.card_parts_add_card_parts_kreweras`; `Finpartition.formPerm`,
  `TauCeti.NoncrossingPartition.formPerm_kreweras` (`p_(K(π)) = p_π⁻¹ * finRotate n`),
  `TauCeti.NoncrossingPartition.orbitCount_formPerm_add_orbitCount_inv_mul_finRotate` (`n ≠ 0`);
  `TauCeti.NoncrossingPartition.iicOrderIso`, `TauCeti.NoncrossingPartition.mu_bot_eq_prod`,
  `TauCeti.NoncrossingPartition.mu_bot_top_fin`, `TauCeti.NoncrossingPartition.comap`,
  `TauCeti.NoncrossingPartition.rotate`, `TauCeti.NoncrossingPartition.reverse`.
- *Permutations* (`GroupTheory/Perm/OrbitCount/Basic.lean`, `Combinatorics/ChordDiagram.lean`):
  `TauCeti.orbitCount` (cycles counted with fixed points),
  `Equiv.Perm.orbitCount_finRotate_mul_add_orbitCount_le` (`#cycles(γσ) + #cycles(σ) ≤ n + 1` for all
  `σ ∈ S_n`), `Function.Involutive.orbitCount_finRotate_mul_add_orbitCount_eq_iff` (for an involution
  and `n ≠ 0`, equality holds exactly for a noncrossing matching).
- *Free cumulants and series* (`Probability/FreeProbability/Cumulant/`): `TauCeti.partitionMoment`,
  `TauCeti.partitionCumulant`, `TauCeti.freeCumulant` (Möbius inversion of block moments on `NC(s)`;
  `κ_∅ = 1` carries no meaning), `TauCeti.apply_prod_ofFn_eq_sum_prod_freeCumulant`,
  `TauCeti.freeCumulant_eq_sum_mu_mul_partitionMoment`, `TauCeti.partitionCumulant_eq_prod_freeCumulant`,
  `TauCeti.freeCumulant_singleton`, `TauCeti.freeCumulant_pair`, `TauCeti.freeCumulant_fiberProd`,
  `TauCeti.freeCumulant_update_add`, `TauCeti.freeCumulant_update_smul`,
  `TauCeti.freeCumulant_eq_zero_of_apply_eq_one` (`φ 1 = 1`), `TauCeti.freeCumulant_star_comp_rev`,
  `TauCeti.norm_freeCumulant_const_le`, `TauCeti.isFreelyIndependent_iff_freeCumulant_eq_zero`
  (`φ 1 = 1`), `TauCeti.IsFreelyIndependentElements.freeCumulant_sum`,
  `TauCeti.IsFreelyIndependent.apply_prod_mul_eq_sum_partitionCumulant_mul_partitionMoment`,
  `TauCeti.IsFreelyIndependent.apply_prod_ofFn_mul_eq_sum_partitionCumulant_mul_partitionMoment`,
  `TauCeti.IsFreelyIndependent.freeCumulant_mul_eq_sum_partitionCumulant_mul_partitionCumulant` (no
  trace); `TauCeti.momentSeries`, `TauCeti.freeCumulantSeries`, `TauCeti.rSeries`,
  `TauCeti.momentSeries_eq_one_add_X_mul_momentSeries_mul_rSeries_subst`,
  `TauCeti.freeCumulantSeries_eq_subst_substInvOfIsUnit` (`φ 1 = 1`).
- *Semicircular laws and the central limit theorem*: `TauCeti.Probability.semicircleReal a v`
  (centre `a`, variance `v : ℝ≥0`, the Dirac mass at `a` for `v = 0`) with
  `TauCeti.Probability.semicircleReal_eq_withDensity`, `TauCeti.Probability.map_affine_semicircleReal`
  and `TauCeti.Probability.integral_pow_two_mul_semicircleReal_zero`
  (`Probability/Distributions/Semicircle/`); `TauCeti.IsSemicircular`,
  `TauCeti.isSemicircular_iff_freeCumulant_const`, `PositiveLinearMap.law_eq_semicircleReal_iff`
  (`Probability/FreeProbability/Semicircular/`);
  `TauCeti.IsFreelyIndependentElements.tendsto_apply_inv_sqrt_smul_sum_pow_semicircleReal`,
  `TauCeti.IsFreelyIndependentElements.tendsto_apply_inv_sqrt_smul_sum_pow_of_apply_pow_eq`,
  `TauCeti.IsFreelyIndependentElements.tendsto_law_inv_sqrt_smul_sum_semicircleReal`
  (`Probability/FreeProbability/CentralLimit.lean`, `Law/CentralLimit.lean`).
- *Marchenko–Pastur*: `TauCeti.Probability.marchenkoPastur y` (atom `(1 − 1/y)₊` at `0`) with
  `TauCeti.Probability.marchenkoPastur_eq_withDensity`
  (`Probability/Distributions/MarchenkoPastur/Basic.lean`).
- *Resolvent transform* (`MeasureTheory/Measure/ResolventTransform/`, for finite measures on `ℝ`):
  `MeasureTheory.Measure.resolventTransform_conj`, `MeasureTheory.im_resolventTransform_pos`,
  `MeasureTheory.hasSum_resolventTransform_of_ae_norm_le`,
  `MeasureTheory.tendsto_mul_I_mul_resolventTransform`,
  `MeasureTheory.tendsto_intervalIntegral_im_resolventTransform` (with the half-atom endpoint terms),
  `MeasureTheory.tendsto_mul_im_resolventTransform`, `MeasureTheory.Measure.ext_of_resolventTransform`.
- *Free products of star algebras* (`LinearAlgebra/FreeProduct/Star.lean`):
  `LinearAlgebra.FreeProduct.instStarRing` (conjugate-linear, reversing products, extending the factor
  involutions) and `LinearAlgebra.FreeProduct.liftStar`.
- *Operators*: `ContinuousLinearMap.polarFactor`, `ContinuousLinearMap.polarFactor_comp_modulus`,
  `ContinuousLinearMap.modulus`, `ContinuousLinearMap.IsPartialIsometry`
  (`Analysis/InnerProductSpace/Polar/Bounded.lean`, `Modulus.lean`, `PartialIsometry.lean`, for bounded
  operators between complete inner product spaces); `VonNeumannAlgebra.adjoin`
  (`Analysis/VonNeumannAlgebra/Adjoin.lean`).
- *Gaussians and random matrices*: `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal`
  (`Probability/Distributions/Gaussian/Moments.lean`), `TauCeti.Probability.properComplexGaussianMeasure`
  (`Probability/Distributions/Gaussian/ProperComplex/Basic.lean`); `Matrix.spectralMeasure` (for a
  Hermitian matrix with nonempty index type), `Matrix.integral_pow_spectralMeasure`
  (`Analysis/Matrix/SpectralMeasure.lean`), `Matrix.measurable_eigenvalues₀`
  (`Analysis/Matrix/Eigenvalues/Continuous.lean`).
- *Unitary groups and Haar measure*: `TauCeti.Matrix.isCompact_unitaryGroup` and its
  `CompactSpace` instance (`Topology/Algebra/UnitaryGroup.lean`); `TauCeti.haarProb`, a Haar
  probability measure on a compact group with a Borel structure, invariant on both sides and under
  inversion (`RepresentationTheory/Compact/Haar.lean`).

### From TauCetiRoadmap.CStarAlgebras

Layers 1–5: ideals, approximate units and multipliers; irreducible representations and the bidual;
operator spaces and completely bounded maps; Stinespring and multiplicative domains; maximal and
comparison C*-norms of tensor products.

### From TauCetiRoadmap.VonNeumannAlgebras

Layer 0 (`exists_faithful_nondegenerate_representation` and the state API), Layer 1 (operator
topologies, the bicommutant theorem, Kaplansky density), Layer 2 (V2.BorelCalculus, completed Hilbert
tensor products, the polar factor in the algebra), Layer 4 (V4.Core, V4.Normality), Layer 6 (the
tracial standard form `L²(M, τ)`), Layer 8 (`L(ℤ) ≅ L∞(𝕋)`, ICC factoriality, V8.SubgroupCosets),
Layers 10–11 (V10.ModularTheory and Takesaki's conditional-expectation theorem specialized to traces)
and §13.1 (CP maps, `tomiyama`). Each is consumed as stated there.

### From TauCetiRoadmap.HilbertModules

H1 (completions of pre-Hilbert modules and infinite orthogonal sums of right Hilbert modules
`CStarModule Bᵐᵒᵖ E`), H2 (adjointable maps) and H3 (interior tensor products with induced maps,
associativity and unit unitaries).

### From TauCetiRoadmap.OperatorTheory.SelfAdjointSpectralTheory

Part B: the bounded Borel functional calculus and the spectral measure of a bounded selfadjoint
operator (SA-B05, SA-B31, SA-B35).

### From TauCetiRoadmap.OperatorAlgebraDynamics

D1 (the full group C*-algebra `C*(G) = ℂ ⋊ G`), D2 (the reduced group C*-algebra and D2.FreeGroups)
and D6 (the finite universal Cuntz algebras `O_n`).

### From TauCetiRoadmap.OperatorKTheory

§4.3 (the Hilbert-module Kasparov–Stinespring dilation, used in its unital case), §7.3
(K7.FreeGroups: the reduced-word, path and acyclicity interface on `SimpleGraph.mulCayley`, for every
finite rank including `n = 2`) and §7.6 (`E_n` with its faithful creation representation on finite
words, its compact vacuum ideal and quotient `O_n`, and `O_∞` as an inductive limit with injective
finite-stage representations).

### From TauCetiRoadmap.RandomMatrices

§3.4 (support and noncrossing moments of the Marchenko–Pastur laws), §5.1 (the Gaussian ensemble
`gaussianEnsemble β n g`, at `β = 2` the GUE of §8.2, and the complex Ginibre law), and the bounded
scalar core of Layer 6: §6.2 (the free product with positive state on the reduced-word Hilbert space
of pointed Hilbert spaces: vacuum, inner product, bounded left representations, positivity of the
vacuum state and freeness of the factors; assumed for pointed Hilbert spaces with unital
representations, the GNS inputs of §3.4 being a case), §6.3 (free additive and multiplicative
convolution of compactly supported laws, with well-definedness, associativity, commutativity,
identities, scaling and support bounds; the analytic R-transform through the inverse of
`G = −resolventTransform` near infinity, the identification of its germ with the formal R-series and
its additivity; the analytic S-transform of a law of nonzero mean and its multiplicativity under
`⊠`), §6.4 (the free Poisson limit for sums of free projections of trace `λ/n`) and §6.5 (Haar entry
moments and the Weingarten formula with its large-dimension estimates; asymptotic freeness of
Wigner, in particular GUE, and Haar-conjugated families with uniformly bounded deterministic
matrices, in expectation and almost surely).

### From TauCetiRoadmap.StandardDistributions

§5.3: the Wick–Isserlis formula for centred real Gaussian vectors with positive semidefinite
covariance.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§0.2: `cycleProduct` and `cycleTerm`, the product over the cycles of a permutation, fixed points
included, of a linear functional evaluated on the cycle words, read `i, σi, σ²i, …` from the least
element of each cycle; §8.4 uses them for `tr_N` on `M_N(ℂ)`.

## References

- A. Nica, R. Speicher, *Lectures on the Combinatorics of Free Probability*, Cambridge University
  Press, 2006: Lectures 1–7 for distributions, free independence and Fock constructions; Theorem 8.10
  for the central limit theorem; Lectures 9–11 for noncrossing lattices, Möbius inversion and
  cumulants, particularly Theorems 11.12 and 11.16; Theorem 12.7 for the R-transform and
  Propositions 12.11 and 12.15 for free Poisson limits; Theorem 13.16 for infinite divisibility with
  compact support; Theorems 14.4, 14.10 and 14.18 for products and compression; Lecture 15,
  particularly Theorem 15.10, Proposition 15.13 and Corollary 15.14, for R-diagonal distribution
  models and the injective polar theorem; Lectures 16–18 for noncommutative series, boxed convolution
  and the S-transform; Lectures 22–23, especially Theorems 22.35, 23.13 and 23.14 and Lemma 23.5, for
  Gaussian and Haar expected-moment asymptotic freeness.
- D. V. Voiculescu, K. J. Dykema, A. Nica, *Free Random Variables*, CRM Monograph Series 1, American
  Mathematical Society, 1992: §§1.4–1.6 for universal, represented and von Neumann free products and
  the commutant theorem; Theorem 2.6.2 for the Gaussian algebra and the real-contraction functor; §3.8
  for amalgamated expectations. Its half-normalized Gaussian convention is translated in Convention 8.
- F. Abadie, K. Dykema, [*Unique Ergodicity of Free Shifts and Some Other Automorphisms of
  C*-Algebras*](https://jot.theta.ro/jot/archive/2009-061-002/2009-061-002-004.pdf): §4 for the
  expectation-GNS module and the represented amalgamated product.
- K. Dykema, [*Faithfulness of Free Product States*](https://arxiv.org/abs/funct-an/9702014):
  Theorem 1.1 and its compression proof for faithful scalar input states; p. 1 for the
  characterization of the reduced free product by freeness, generation and a faithful GNS
  representation.
- A. Catterall, [*Free Products and Continuous Bundles of C*-Algebras*](https://theses.gla.ac.uk/3865/1/2003CatterallPhD.pdf):
  Chapter 2, Theorem 2.2.2, for the faithfulness of amalgamated expectations; factors equal to `B` are
  removed before its nontrivial-factor form is applied.
- E. Blanchard, K. Dykema, [*Embeddings of Reduced Free Products of Operator
  Algebras*](https://arxiv.org/abs/math/9911012): Theorems 1.3 and 2.2 for compatible embeddings and
  expectation-preserving `B`-bimodule unital completely positive maps; Construction 3.1 and Lemmas
  3.3–3.6 for normal product representations and expectations. §4.6 uses the faithful normal state on
  `B` of the common finite trace, which meets the state-based hypothesis of the construction.
- B. Collins, [*Moments and Cumulants of Polynomial Random Variables on Unitary Groups, the Itzykson
  Zuber Integral and Free Probability*](https://arxiv.org/abs/math-ph/0205010): Theorem 3.1 and
  Propositions 3.2–3.3 for the full centred-word proof of asymptotic freeness of Haar unitaries, with
  deterministic joint moment convergence and no uniform norm bound; applied to the deterministic
  family together with its adjoints it gives the star-moment theorem; Corollary 3.4 for Haar
  conjugates under a joint limit.
- B. Collins, P. Śniady, [*Integration with respect to the Haar measure on unitary, orthogonal and
  symplectic group*](https://arxiv.org/abs/math-ph/0402073): Proposition 2.2, Corollary 2.4,
  Proposition 2.6 and Corollary 2.7 for the invariant projection, the Weingarten inverse on the image
  algebra and its asymptotics.
- P. Biane, *Some properties of crossings and partitions*, Discrete Math. 175 (1997), 41–53, for the
  permutation model of noncrossing partitions.
- R. Speicher, [*Lecture Notes on "Free Probability Theory"*](https://arxiv.org/abs/1908.08125):
  Theorem 7.5 and its proof, p. 81–84, for asymptotic freeness of Haar-conjugated matrices under
  separate limits, and the example after it for the sum `A_N + U_N B_N U_N*`; Assignment 8,
  Exercise 3, and Assignment 9, Exercise 3, for compound free Poisson laws and their R-transform.
- H. Kesten, [*Symmetric Random Walks on Groups*](https://www.ams.org/journals/tran/1959-092-02/S0002-9947-1959-0109367-6/),
  Trans. Amer. Math. Soc. 92 (1959), 336–354: Theorem 3 for the spectral radius on free groups.
- I. Kortchemski, C. Marzouk, [*Simply Generated Non-Crossing Partitions*](https://arxiv.org/abs/1503.09174):
  §2.1 and Proposition 4 for the depth-first bijection between plane trees and noncrossing partitions.
- C. Houdayer, S. Raum, [*Locally Compact Groups Acting on Trees, the Type I Conjecture and
  Non-Amenable von Neumann Algebras*](https://arxiv.org/abs/1610.00884): Proposition 2.22 for the
  group von Neumann algebra of an amalgamated free product.
