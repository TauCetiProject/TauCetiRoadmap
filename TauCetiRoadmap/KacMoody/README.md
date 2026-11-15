# Roadmap: Kac–Moody algebras, integrable modules and path crystals

**Summary.** Build the representation theory of finite-rank symmetrizable Kac–Moody algebras over a
characteristic-zero field, from the generalized Cartan matrix and its realization to the Weyl–Kac
character formula, complete reducibility of integrable modules in category `O`, the Littelmann path
model of the crystal of every integrable highest-weight module, and two geometric applications: the
Chevalley–Pieri divisor formula on the finite Schubert varieties of the minimal Kac–Moody group, and
the comparison of the untwisted affine minimal derived group with the polynomial loop group. Finite,
affine and indefinite types are treated uniformly. The Cartan matrix may be singular; the full
realization, the weight lattice, the central and degree directions are data throughout. No
positive-definite Killing form, finite Weyl group, longest element or finite-dimensional module is a
standing hypothesis. The end theorems are the Weyl–Kac formula (Layer 4), complete reducibility of
the integrable category `O` (Layer 3), Littelmann's endpoint theorem and character identity
(Layer 6), the Chevalley–Pieri formula (Layer 7) and the loop-group kernel theorem (Layer 8).

`Suggested.lean` states the two headline theorems that are statable at the pinned libraries, the
Weyl–Kac character formula and complete reducibility, on the presented Lie algebra and its Verma
modules; this README is the roadmap.

## Scope and ownership

This roadmap owns:

- Layer 0: symmetrizable Cartan data, rational realizations (minimal and with specified central
  enlargements), integral weight and coweight lattices, the root lattice and its cones.
- Layer 1: the Kac–Moody algebra on the full realization by generators and relations, its triangular
  decomposition and root spaces, the central splitting of a non-minimal realization, the invariant
  form, the ordered PBW comparison, Chevalley (anti-)involutions, and the identification of the
  untwisted affine algebra with the polynomial central extension of AffineLieAlgebras plus a degree
  derivation.
- Layer 2: the Weyl group of the realization as a Coxeter group, real and imaginary roots, the Tits
  cone, parabolic quotients and their Bruhat order.
- Layer 3: Verma modules, simple highest-weight modules, integrable modules, category `O`, its
  integrable subcategory and complete reducibility, restricted and contravariant duals.
- Layer 4: cone-supported completed character rings, characters of modules, the Verma character, the
  Weyl–Kac formula and the denominator identity, the affine homogeneous grading.
- Layer 5: continuous piecewise-linear paths and their reparametrization classes, Littelmann's root
  operators in record form and in the monotone two-cut form, LS paths and their chain description,
  the interval bond and gcd comparison for symmetrizable Kac–Moody orbits.
- Layer 6: Littelmann's endpoint theorem, the identification of path endpoint multiplicities with
  weight multiplicities of `L(λ)`, the Littlewood–Richardson and Levi branching rules, the exact
  finite-type specialization to SchubertGeometry S4 and the type-A examples on paths.
- Layer 7: the minimal split Kac–Moody group of the realization, its finite Schubert schemes, and the
  Chevalley–Pieri divisor formula on them.
- Layer 8: the homomorphism from the untwisted affine minimal derived group to the polynomial loop
  group, its image and central kernel, and the Iwahori, parabolic, rotation and global-form
  dictionary on the complex points of the pinned group of ReductiveGroups.
- Layer 9: the worked comparisons every layer is tested against.

What this roadmap leaves to named roadmaps:

- The quantum theory is **KacMoody, Part II**: the type-1 integrable modules of the generic
  Drinfeld–Jimbo algebra of QuantumEnvelopingAlgebras on Layer 0's lattice, the quantum Casimir and
  complete reducibility of quantum `O_int`, Kashiwara operators and crystal bases, the signed
  finite-type modules and their Casimir, the strict isomorphism between Layer 6's path crystal and the
  quantum crystal `B_q(λ)`, and the finite-type integral comparison with Lusztig's divided-power form.
  Part II is placed after QuantumEnvelopingAlgebras, which itself consumes Layer 0's realization and
  lattices; its introduction says that this roadmap stops at the classical path crystal, whose
  endpoint multiplicities are already the weight multiplicities of `L(λ)` (Layer 6), and that no
  classical theorem here waits for a quantum one.
- RootSystems Layer 3 owns the abstract Coxeter combinatorics (strong exchange, Matsumoto, subword
  criterion, minimal coset representatives); Layer 2 identifies the Weyl group of the realization with
  a Coxeter system and then consumes those theorems. RootSystems also owns the finite crystallographic
  realization and classification; Layer 0 compares with Mathlib's finite-type `CartanMatrix.Realisation`
  and never asserts a finite classification for an infinite Weyl group.
- LieHighestWeight owns finite-dimensional Killing and reductive representation theory, including its
  Verma modules and simple modules for `IsKilling` algebras; Layer 3 constructs the general counterparts
  and compares them in finite type.
- AffineLieAlgebras A1–A2 owns the polynomial and formal current algebras, the central extension
  `ĝ_κ` with its residue cocycle and sign, its classification and level transport; Layer 1 adds only the
  degree derivation and the Chevalley–Serre identification.
- SchubertGeometry S4 owns the finite-root-datum path crystal, typed central translation, convexity and
  the finite parabolic bond-gcd comparison; S7 owns the finite Chevalley divisor formula.
  TensorProductCombinatorics Layer 8 owns the concrete type-A tableau, reading-word and signature
  model; it is later in the merge order, so the identification of Layer 6's type-A path crystal with
  that tableau crystal is stated on its side, and Layer 6 states its type-A examples on paths alone.
  Layers 5–6 construct the symmetrizable extension and prove the finite specialization to
  SchubertGeometry S4 exactly; they build no second finite tableau theory.
- FormalConnectionsOpers Layer 3A owns the functorial polynomial and formal loop theory over arbitrary
  coefficient rings: loop functors, torsor patching, Iwahori and positive subgroup functors, the
  full-cocharacter normalizer, loop Grassmannians and positive orbits. It is later in the merge order,
  so Layer 8 uses none of it: Layer 8 works on the complex points `G_sc(ℂ[t,t^(−1)])` of the pinned
  group of ReductiveGroups Layer 9 and proves there, by Garland's route, only the generation and
  Iwahori-decomposition statements the kernel theorem needs; the identification of
  FormalConnectionsOpers' functors at `R = ℂ` with these complex-point groups is a comparison stated
  on its side.
- SchemeAndStackFoundations §§5.1–5.3 owns cycles, Chow groups, the Cartier–Weil comparison, proper
  pushforward and the first Chern operator with its projection formula; Layer 7 constructs the finite
  Schubert schemes on which they are applied.
- ReductiveGroups 9A owns the finite-type classical all-root integral enveloping form; Layer 9 compares
  the finite-type specialization of Layer 1 with it.
- Valued-field masures, analytic loop groups and their buildings, and quantum groups at roots of unity
  are not treated here.

## Conventions

- `I` is a finite index set, `A = (a_ij)` an integral generalized Cartan matrix, and `a_ij = α_j(h_i)`:
  rows are indexed by coroots, columns by roots. The symmetrizer is a family of positive integers
  `d_i` with `d_i a_ij = d_j a_ji`; in Kac's notation `ε_i = 1/d_i`.
- A rational realization is `(H_Q, (h_i)_i, (α_i)_i)` with `H_Q` a finite-dimensional ℚ-vector space,
  the `h_i ∈ H_Q` linearly independent, the `α_i ∈ H_Q*` linearly independent, and
  `α_j(h_i) = a_ij`. It is minimal when `dim H_Q = 2|I| − rank A`. `H_Q'` is the span of the `h_i`.
- The coefficient field `k` of the algebraic layers is any field of characteristic zero;
  `H_k = k ⊗_ℚ H_Q`, `Γ_k = H_k*`. Paths live in `P_ℝ = ℝ ⊗ P`. `Suggested.lean` works over ℚ with
  `H_Q = ℚ^m`.
- `P ⊂ H_Q*` and `Y ⊂ H_Q` are the chosen free integral weight and coweight lattices with their
  perfect pairing, `α_i ∈ P`, `h_i ∈ Y`; `P^+ = {λ ∈ P : λ(h_i) ≥ 0 for all i}`.
- `Q = ⊕_I ℤα_i`, `Q_+ = ⊕_I ℕα_i`, height `ht(Σ n_i α_i) = Σ n_i`, and `μ ≤ λ` means `λ − μ ∈ Q_+`.
- The invariant form is normalized by `(h_i, h) = α_i(h)/d_i`, hence `(e_i, f_i) = 1/d_i`,
  `(α_i, α_j) = d_i a_ij` on `H*` and `(α_i, λ) = d_i λ(h_i)`.
- `s_i(λ) = λ − λ(h_i) α_i` on `H*` and `s_i(h) = h − α_i(h) h_i` on `H`. The Weyl group `W` is the
  subgroup of `GL(H*)` generated by the `s_i`; `ℓ` is its length in these generators; `ρ ∈ H*` is any
  functional with `ρ(h_i) = 1`, and `w ∘ λ = w(λ + ρ) − ρ`.
- Category `O` is Kac's: weight modules with finite-dimensional weight spaces whose weights lie in
  finitely many sets `λ_j − Q_+`. "Integrable" means every `e_i` and `f_i` acts locally nilpotently
  on a weight module.
- Kac is *Infinite-dimensional Lie algebras*, third edition; its theorem and section numbers are those
  of that edition. Lenart–Postnikov is arXiv math/0502147v4, Chirivì–Fang–Littelmann is arXiv
  2203.12992v1, Kanakubo is arXiv 2407.19622v1, Garland is Publ. Math. IHÉS 52 (1980).
- Paths are continuous piecewise-linear maps `π : [0,1] → P_ℝ` with `π(0) = 0`; the zero symbol `0`
  of a root operator is distinct from the constant path.

## Exact supplier contracts

### From Mathlib

`FreeLieAlgebra`, `LieIdeal`, `LieSubmodule.Quotient`, `UniversalEnvelopingAlgebra` with its
`ι` and `lift`, `LieModule.weightSpace` (`Algebra/Lie/Weights/Basic.lean`), `Module.reflection`
(`LinearAlgebra/Reflection.lean`, `y ↦ y − f(y) • x` for `f(x) = 2`), `Module.End.eigenspace`,
`Submodule.Quotient.module'`, `IsSemisimpleModule`, `IsSimpleModule`, `Module.finrank`, `finsum`,
`Subgroup.closure`, `CoxeterSystem` and `CoxeterMatrix`, `Convex.sum_mem`, `subset_convexHull`,
`convex_convexHull`. `Matrix.ToLieAlgebra` (`Algebra/Lie/SerreConstruction.lean`) is the Serre
quotient on `H_i, E_i, F_i` alone: it is the derived algebra's presentation, not the full realization.
`CartanMatrix.Realisation` (`LinearAlgebra/Matrix/Cartan/Realisation.lean`) requires
`Matrix.IsFiniteCartan`, so it, `reflection`, `coreflection`, `weylGroup` and `toRootPairing` exist for
finite type only. `LieAlgebra.loopAlgebra`, `LieAlgebra.LoopAlgebra.residuePairing` (the value
`∑_a a • Φ(f_(−a), g_a)`, so `+Res(f dg)`) and `LieAlgebra.LoopAlgebra.twoCocycleOfBilinear`
(`Algebra/Lie/Loop.lean`), `LieAlgebra.ofTwoCocycle` and `LieAlgebra.Extension.ofTwoCocycle`
(`Algebra/Lie/Extension.lean`) are the loop carriers of Layer 1.

### From Tau Ceti

`Module.Basis.pbwBasis : Basis (ι →₀ ℕ) R U` for an ordered basis of a Lie algebra
(`Algebra/Lie/UniversalEnveloping/PBW/Basis.lean`), with no finiteness assumption, and
`UniversalEnvelopingAlgebra.ι_injective`. `CoxeterSystem.strongExchange`
(`GroupTheory/Coxeter/StrongExchange.lean`), `CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq`
(`GroupTheory/Coxeter/Bruhat.lean`), `TauCeti.matsumoto` (`GroupTheory/Coxeter/Matsumoto.lean`) and
`CoxeterSystem.existsUnique_isMinimalCosetRep_mul` (`GroupTheory/Coxeter/Parabolic.lean`) are consumed
in Layer 2 after the Coxeter identification. Tau Ceti's `VermaModule` in
`Algebra/Lie/HighestWeight/Verma.lean` is built for `IsKilling` finite-dimensional algebras and is a
finite-type comparison object only.

### From TauCetiRoadmap.RootSystems

Layer 3 (strong exchange, deletion, Matsumoto in relational and lift form, the Bruhat order) for a
general `CoxeterSystem`. Consumed by Layer 2 after the faithful comparison of the Weyl group with the
Coxeter system of the matrix `m_ij`.

### From TauCetiRoadmap.LieHighestWeight

Layer 3 (enveloping algebra, Verma modules and `L(λ)` for finite-dimensional semisimple algebras),
Layer 5 (Weyl's complete reducibility) and Layer 6 (the Weyl character formula). Consumed only in the
finite-type comparisons of Layers 3–4 and 9.

### From TauCetiRoadmap.AffineLieAlgebras

A2: the polynomial central extension `ĝ_κ` with bracket
`[x⊗t^m, y⊗t^n] = [x,y]⊗t^(m+n) + m κ(x,y) δ_(m+n,0) K`, its cocycle sign `Φ = −κ` against Mathlib's
residue pairing, the normalized form `κ_0` with long roots of squared length `2`, and level transport
along `κ = kκ_0`. Consumed by Layer 1.

### From TauCetiRoadmap.SchubertGeometry

S4 (the finite-root-datum path crystal: record operators, LS chains with the bond
`b_λ(x,y) = −⟨xλ, β∨⟩` on a decreasing cover, the interval gcd `d_λ(u,v)` with `d_λ(u,u) = 0`,
convexity through `Convex.sum_mem`, typed central translation) and S7 (the finite Chevalley divisor
coefficient `⟨λ, β∨⟩` along `X(v)`, `v = w s_β`, `ℓ(v) = ℓ(w) − 1`). Consumed by Layers 5–7 as the
finite comparison case.

### From TauCetiRoadmap.SchemeAndStackFoundations

§5.1 (cycles `cyclesOfDimension`, rational equivalence, Chow groups and the Cartier–Weil divisor
comparison), §5.2 (proper pushforward of cycles with generic residue-field degrees, flat pullback,
localization) and §5.3 (the first Chern operator `Chow.c1` and its projection formula). Consumed by
Layer 7.

### From TauCetiRoadmap.ReductiveGroups

Layer 0 (the functor of points `G(R)` of an affine group scheme on commutative algebras `R`, as a
group), Layer 9 (the pinned split simply connected Chevalley–Demazure group scheme `G_sc` over `ℤ`
with its split torus, Borel, root subgroups `x_α` and Chevalley relations, and the finite reduced root
datum `(X, Φ, Y, Φ^∨)` with its coroot lattice `Q^∨`; 9B pinnings) and 9A (the full reductive integral
enveloping form on the actual lattices `X, Y`). Consumed by Layer 8 for the complex-point groups
`G_sc(ℂ[t,t^(−1)])`, `G_sc(ℂ[t])` and `G_sc(ℂ)`, and by Layer 9 for the finite-type integral
comparison.

## How to read the build

Layer 0 fixes the datum and its realization. Layer 1 presents the algebra on the whole realization,
proves the triangular decomposition, root spaces, the invariant form and PBW, and identifies the
untwisted affine case with loops. Layer 2 builds the Weyl group as a Coxeter group, real and imaginary
roots, the Tits cone and parabolic quotients; Layer 3 builds Verma and simple modules, integrable
modules and category `O`, and proves complete reducibility of its integrable part; Layer 4 builds the
completed character rings and proves the Weyl–Kac formula. Layer 5 constructs paths, root operators and
LS paths from Layers 0 and 2 alone; Layer 6 proves the endpoint theorem, identifies path endpoint
multiplicities with weight multiplicities of `L(λ)` through Layer 4, derives the decomposition rules,
and specializes to finite type. Layer 7 constructs the minimal group and its finite Schubert
schemes from Layers 2–3 and proves the Chevalley–Pieri formula; Layer 8 compares the affine derived
group with polynomial loops; Layer 9 collects the worked comparisons. No flag, divisor or loop-group
theorem is an input to Layers 0–6, and nothing in Layers 0–9 consumes a quantum algebra.

## Layer 0: symmetrizable Cartan data and realizations (KM0)

### 0.1 Generalized Cartan matrices and symmetrizers

Define `SymmetrizableDatum I`: an integral matrix `A` indexed by `I × I` with `a_ii = 2`, `a_ij ≤ 0`
for `i ≠ j`, `a_ij = 0 ↔ a_ji = 0`, together with positive integers `d_i` satisfying
`d_i a_ij = d_j a_ji` (Kac, §1.1 and §2.1). Construct reindexing along a bijection `I ≃ I'`, the
direct sum of two data, the restriction to a subset `J ⊆ I` (the Levi datum), and the symmetrized
matrix `B = (d_i a_ij)`, which is symmetric. Borcherds matrices with nonpositive diagonal entries are
different data and are not obtained by allowing `d_i = 0`. *Needs:* Mathlib `Matrix`.

- The symmetrized matrix `(d_i a_ij)` is symmetric and `A = D^(−1) B` with `D = diag(d_i)`.
- Reindexing, direct sums and Levi restriction preserve the axioms and commute with symmetrization.
- Every symmetrizer of an indecomposable `A` is a positive rational multiple of any other.

**Checks.**

- Type `A_1`: `A = (2)`, `d = (1)`; the symmetrized matrix is `(2)`.
- Affine `A_1^(1)`: `A = [[2,−2],[−2,2]]`, `d = (1,1)`, `det A = 0`; the symmetrized matrix equals `A`.
- Type `B_2` with `A = [[2,−2],[−1,2]]`: `d = (1,2)` works and `d = (1,1)` does not, since
  `1·(−2) ≠ 1·(−1)`; a definition that accepted `d = (1,1)` is wrong.
- The empty index set is a datum with the empty matrix; the matrix `[[2,−1],[0,2]]` is rejected by the
  zero-symmetry axiom.

### 0.2 Rational realizations, minimal and enlarged

Define `RationalRealization A m`: `H_Q = ℚ^m` with linearly independent coroots `h_i ∈ H_Q`, linearly
independent roots `α_i ∈ H_Q*` and `α_j(h_i) = a_ij`. Prove `m ≥ 2|I| − rank A` for every realization
and construct a minimal realization with `m = 2|I| − rank A` (Kac, Proposition 1.1). Prove that any two
minimal realizations of the same datum are isomorphic by a linear isomorphism carrying `h_i` to `h_i`
and `α_i` to `α_i`, without asserting uniqueness of that isomorphism. A realization that is not minimal
is a specified central enlargement: prove that every realization `H_Q` contains a minimal
sub-realization `H'_min` (the span of the `h_i` and of lifts of a basis of `H_Q/(H_Q' + ⋂_i ker α_i)`
chosen so that the `α_i` stay independent on it) and that `H_Q = H'_min ⊕ Z` with
`Z ⊆ ⋂_i ker α_i`, so the extra directions are central for the Lie algebra of Layer 1. Define the
Cartan center `𝔠 = ⋂_i ker α_i ⊆ H_Q` and prove
`𝔠 ∩ H_Q' = {Σ c_i h_i : Σ_i c_i a_ij = 0 for all j}`, the kernel of the pairing on the coroot span;
the two coincide for a minimal realization and differ by the added central directions otherwise
(Kac, Proposition 1.6, for the minimal case). Extend scalars to any characteristic-zero field and
to `ℝ`. *Needs:* Mathlib `LinearIndependent`, `Module.Dual`, `Matrix.rank`.

- Existence of minimal realizations; the dimension bound; isomorphism of minimal realizations.
- Finite type: when `A` is a finite Cartan matrix the minimal realization is `H_Q'` itself, and it
  agrees with Mathlib's `CartanMatrix.Realisation` under `Matrix.IsFiniteCartan`.
- The central splitting `H_Q = H'_min ⊕ Z` and the characterization of `𝔠`.

**Checks.**

- Affine `A_1^(1)` with `A = [[2,−2],[−2,2]]`: `rank A = 1`, so the minimal realization has
  dimension `3`; the coroot span has dimension `2`; `c = h_0 + h_1` has `α_0(c) = 2 − 2 = 0`,
  `α_1(c) = −2 + 2 = 0`, so `c` spans `𝔠 ∩ H_Q'`; a degree element `d` with `α_0(d) = 1`,
  `α_1(d) = 0` completes the minimal realization.
- Type `A_1`: `ℚ^1` with `h = 1`, `α = 2x` is the minimal realization; `ℚ^2` with `h = (1,0)`,
  `α = 2x_1` is an enlargement with `Z = span((0,1))`; a definition of `𝔠` returning only
  `𝔠 ∩ H_Q'` would miss `(0,1)`.
- Type `A_1` on `ℚ^3` with `h = (1,0,0)` and `α = 2x_1 + 5x_2 + 7x_3`: the minimal sub-realization
  is `span(h)`, `Z = {x : 2x_1 + 5x_2 + 7x_3 = 0}` is two-dimensional, and `(0,1,0) − (5/2)h` lies
  in it.
- The empty index set: `ℚ^m` for any `m` is a realization, minimal iff `m = 0`.

### 0.3 Weight and coweight lattices, root lattice and cones

Construct free lattices `P ⊂ H_Q*` and `Y ⊂ H_Q` of full rank with a perfect pairing, `α_i ∈ P`,
`h_i ∈ Y`, and their inclusions into the realization. State which lattice choices admit fundamental
weights in `P` (those for which the map `P → ℤ^I`, `λ ↦ (λ(h_i))_i`, is surjective); in an arbitrary
isogenous lattice only their rational versions exist. Never infer an integral splitting of `P` into
central and derived parts from the rational splitting of 0.2. Define `Q`, `Q_+`, the height, the
dominance predicate `λ(h_i) ≥ 0`, the preorder `μ ≤ λ`, and prove that for fixed `λ` and `n` the set
`{μ ≤ λ : ht(λ − μ) ≤ n}` is finite, using independence of the `α_i` in the full realization even when
`A` is singular. *Needs:* 0.2; Mathlib `AddSubmonoid.closure`, `Finsupp`.

- `Q_+ ∩ (−Q_+) = {0}` and `Q_+` is the `ℕ`-span of a linearly independent family.
- Finite-height intervals; dominance is decidable on `P`.
- The empty index set gives `Q = 0`, every weight dominant, and `μ ≤ λ` iff `μ = λ`.

**Checks.**

- Affine `A_1^(1)`: `δ = α_0 + α_1` satisfies `δ(h_0) = δ(h_1) = 0`, so `δ ∈ Q_+` is dominant and
  `0 ≤ δ`; the interval `{μ ≤ 2δ : ht(2δ − μ) ≤ 2}` has the six elements `2δ − aα_0 − bα_1`,
  `a + b ≤ 2`.
- Type `A_1` with `P = ℤω`, `ω(h) = 1`: fundamental weights exist; with `P = ℤα = 2ℤω` they do not.
- A lattice `P` not containing some `α_i` is rejected.

### Examples

The three data `A_1`, `A_1^(1)` and the indefinite `[[2,−3],[−3,2]]` with their minimal realizations of
dimensions `1`, `3` and `2`, and the enlargement `A_1` on `ℚ^2`.

### Dependencies

Mathlib only.

## Layer 1: the Kac–Moody algebra, invariant form and PBW (KM1)

### 1.1 The presented Lie algebra on the full realization

Define `FreePresentation I m` as the free Lie algebra over ℚ on `H_Q ⊕ I ⊕ I`, with generators
`hGenerator x`, `eGenerator i`, `fGenerator i`. Define `relators R` as the set of Cartan-linearity
relators, `[H,H] = 0`, `[h, e_i] − α_i(h) e_i`, `[h, f_i] + α_i(h) f_i`, `[e_i, f_j] − δ_ij h_i`, and
the Serre relators `(ad e_i)^(1−a_ij) e_j`, `(ad f_i)^(1−a_ij) f_j` for `i ≠ j`; `presentationIdeal R`
is the Lie ideal they span and `PresentedLieAlgebra R` the quotient, with `cartanElement R x`,
`positiveGenerator R i` and `negativeGenerator R i` the images of the generators. Prove the
universal property (a Lie homomorphism out of the quotient is a family of images of the generators
satisfying the relations) and Cartan injectivity, `cartanElement R` is injective (Kac, Theorem 1.2 for
the auxiliary algebra and Theorem 9.11 for the Serre quotient). Prove the central splitting: for an
enlargement `H_Q = H'_min ⊕ Z` of 0.2 the algebra is the direct sum of the algebra of the minimal
sub-realization and the abelian ideal `Z`. Compare with Mathlib's `Matrix.ToLieAlgebra A`: it is the
derived subalgebra `[𝔤, 𝔤]`, generated by `h_i, e_i, f_i`, and `𝔤 = [𝔤,𝔤] + H`, with
`[𝔤,𝔤] ∩ H = H_Q'` (Kac, §1.3). *Needs:* 0.2; Mathlib `FreeLieAlgebra`, `LieSubmodule.lieSpan`,
`LieSubmodule.Quotient`, `Matrix.ToLieAlgebra`.

- Universal property, with the zero map and the identity as instances.
- Cartan injectivity; `H` is abelian; `[e_i, f_j] = δ_ij h_i` holds in the quotient.
- Morphisms for reindexing, Levi embeddings, realization isomorphisms, central enlargement and central
  quotient when the map respects `P` and `Y`; all universal diagrams commute by the universal property,
  never by identifying carriers by notation.

**Checks.**

- Type `A_1`, minimal realization: the quotient is `sl_2` with `h, e, f`; the Serre relators are
  absent since `I` has one element.
- Type `A_1` on `ℚ^2`: the algebra is `sl_2 ⊕ ℚz` with `z = cartanElement (0,1)` central; the
  presentation with `[h,e] = α(h)e` forces `[z,e] = 0`.
- The empty index set on `ℚ^m`: the abelian Lie algebra `ℚ^m`; `Matrix.ToLieAlgebra` of the empty
  matrix is zero, which is not the full realization.
- Affine `A_1^(1)`: `(ad e_0)^3 e_1 = 0` is a relator while `(ad e_0)^2 e_1 ≠ 0` in the quotient:
  its image under the loop isomorphism of 1.5 is `[f⊗t, [f⊗t, e⊗1]] = [f⊗t, −h⊗t] = −2f⊗t^2`.

### 1.2 Triangular decomposition, root spaces and real versus imaginary roots

Prove `𝔤 = n^- ⊕ H ⊕ n^+` with `n^±` the subalgebras generated by the `e_i`, respectively `f_i`, the
inclusion and projection maps, and the `Q`-grading `𝔤 = ⊕_α 𝔤_α` with `𝔤_0 = H`, `𝔤_α ≠ 0` only for
`α ∈ Q_+ ∪ (−Q_+)`, `dim 𝔤_α < ∞`, and `[𝔤_α, 𝔤_β] ⊆ 𝔤_(α+β)` (Kac, Theorem 1.2 and §1.3).
Construct the enumeration of roots of height at most `n` as a finite set and the bracket degree laws.
Define real roots as the `W`-orbits of simple roots and imaginary roots as the others, with their
multiplicities; prove `dim 𝔤_α = 1` for real `α` and that `kα` is a root only for `k = ±1` when `α` is
real (Kac, Proposition 5.1); the set of imaginary roots is `W`-stable (Kac, Proposition 5.2). Prove
`e_i` and `f_i` act locally nilpotently on `𝔤` (Kac, §§3.5–3.6). *Needs:* 1.1; 2.1 for the
`W`-orbits.

- Root spaces are finite-dimensional; the Chevalley generators have roots `±α_i`.
- `𝔤_α` for `α ∈ Q_+` is spanned by brackets of the `e_i`; for the enlargement, `Z ⊆ 𝔤_0`.
- Multiplicities of imaginary roots are retained as data of the grading, never set to `1`.

**Checks.**

- Affine `A_1^(1)`: `δ = α_0 + α_1` is imaginary with `dim 𝔤_δ = 1` (it is `h⊗t` under 1.5); `2δ` is
  a root; `α_1 + δ` is real with `dim 𝔤_(α_1+δ) = 1`.
- Type `A_1`: the roots are `±α`, both real; `2α` is not a root.
- Indefinite `[[2,−3],[−3,2]]`: `α_0 + α_1` has `(α_0+α_1, α_0+α_1) = 2 − 6 + 2 = −2 < 0`, so it is an
  imaginary root of multiplicity `1`; a definition calling it real is wrong.

### 1.3 The invariant form

For a minimal realization choose a complement `H''` of `H_Q'` in `H_Q` and define the symmetric form
on `H_Q` by `(h_i, h) = α_i(h)/d_i` for all `h ∈ H_Q` and `(h', h'') = 0` for `h', h'' ∈ H''`. Prove it
is symmetric on `H_Q'` because `a_ji/d_i = a_ij/d_j`, and nondegenerate on `H_Q` (Kac, §2.1 and
Lemma 2.1), although `(d_i a_ij)` alone is degenerate on `H_Q'` when `A` is singular. Prove the
change-of-complement comparison: for two complements the two forms are isometric through a linear map
fixing every `h_i` and `α_i` (the map sends `h'' ↦ h'' + c(h'')` with `c` valued in `𝔠 ∩ H_Q'`,
determined by `−1/2` of the second form restricted to the first complement, using the perfect pairing
between `𝔠 ∩ H_Q'` and `H_Q/H_Q'`). For a specified central enlargement `H_Q = H'_min ⊕ Z` the
recipe is not available: take as data a symmetric form on `H_Q` with `(h_i, h) = α_i(h)/d_i` and
nondegenerate; prove such forms exist (extend a minimal form by any nondegenerate form on `Z`, since
`(h_i, Z) = 0` is forced) and that they are not unique up to isometries fixing `h_i` and `α_i`. Prove
that any nondegenerate symmetric form on `H_Q` with `(h_i, h) = α_i(h)/d_i` extends uniquely to an
invariant symmetric bilinear form on `𝔤` with `(e_i, f_j) = δ_ij/d_i`, `(𝔤_α, 𝔤_β) = 0` unless
`α + β = 0`, nondegenerate pairings `𝔤_α × 𝔤_(−α) → k`, and `[x, y] = (x, y) ν^(−1)(α)` for
`x ∈ 𝔤_α`, `y ∈ 𝔤_(−α)` (Kac, Theorem 2.2 and its proof, for the minimal sub-realization, transported
to the Serre presentation through Theorem 9.11; for an enlargement through the central splitting of
1.1, with `Z ⊥ 𝔤_α` for `α ≠ 0` forced by invariance). Construct `ν : H_Q → H_Q*`,
`ν(h_i) = α_i/d_i`, and the transported form on `H_Q*` with `(α_i, α_j) = d_i a_ij`,
`(α_i, λ) = d_i λ(h_i)`. The reflection formula `s_α(λ) = λ − 2(λ,α)/(α,α) α` is attached to real roots
only. *Needs:* 1.1, 1.2; 0.2.

- Existence and uniqueness of the extension; the Gram identities above; `ν` is an isomorphism.
- `W`-invariance of the form on `H_Q*` (Kac, §3.9).
- On an indefinite or singular realization the form is not positive definite and not a Killing form.

**Checks.**

- Type `A_1` with `d = 1`: the form is the trace form of `sl_2`, `(h,h) = 2`, `(e,f) = 1`.
- Affine `A_1^(1)`, `d = (1,1)`, `d` the degree element with `α_0(d) = 1`, `α_1(d) = 0`, `(d,d) = 0`:
  Gram matrix of `h_0, h_1, d` is `[[2,−2,1],[−2,2,0],[1,0,0]]` with determinant `−2`; `c = h_0 + h_1`
  has `(c, h_i) = 0` and `(c, d) = 1`; the plausible wrong form `(d_i a_ij)` extended by zero on `d`
  has `c` in its radical and fails `(c,d) = 1`.
- Affine `A_1^(1)`, change of complement `d' = d + a h_0 + b h_1`: the form with `(d',d') = 0` is
  carried to the form with `(d,d) = 0` by `d' ↦ d' − (a + (a−b)^2) c`, which fixes `h_0, h_1, α_0, α_1`;
  for `a = 1`, `b = 0` the image `d − h_0 − 2h_1` has squared length `0 + 2 + 8 − 2 − 0 − 8 = 0`.
- Negative control, type `A_1` on the enlargement `ℚ^2` with `h = (1,0)`, `α = 2x_1`, `z = (0,1)`:
  the complement recipe with `H'' = span(z)` gives the Gram matrix `[[2,0],[0,0]]` of `(h,z)`, which
  is degenerate, while `H'' = span(z + h)` gives `[[2,2],[2,0]]` with determinant `−4`; the two are
  not isometric by a map fixing `h` and `α`. On `ℚ^3` with the same datum every complement has a
  nonzero vector in `ker α`, which lies in the radical of the recipe's form. This is why the
  enlargement case takes the form as data.

### 1.4 PBW, Chevalley involutions and the enveloping algebra

Define `Enveloping R` as the universal enveloping algebra of `PresentedLieAlgebra R`. Choose an ordered
homogeneous basis compatible with the triangular decomposition and consume Tau Ceti's ordered PBW basis
(no finite-basis assumption) to prove `U(𝔤) ≅ U(n^-) ⊗ U(H) ⊗ U(n^+)` as vector spaces, with the
root-partition description of a homogeneous basis of `U(n^-)`: finitely supported functions on
positive roots with a basis index for each multiplicity. Prove finite-height local finiteness (each
weight piece of `U(n^-)` is finite-dimensional) before constructing partition coefficients or
infinite products. Construct the Chevalley involution `ω`, `e_i ↦ −f_i`, `f_i ↦ −e_i`, `h ↦ −h`, and
the order-reversing Chevalley anti-involution of `U(𝔤)`, `e_i ↦ f_i`, `f_i ↦ e_i`, `h ↦ h`, with their
signs on root spaces. Identify the finite-type PBW specialization with LieHighestWeight Layer 3. No
finite longest-word enumeration substitutes for imaginary root spaces. *Needs:* 1.1, 1.2; Tau Ceti
`Module.Basis.pbwBasis`, `UniversalEnvelopingAlgebra.ι_injective`; LieHighestWeight Layer 3.

- The triangular multiplication map is a linear isomorphism; `ι` is injective.
- `ω` is an involutive Lie automorphism exchanging `𝔤_α` and `𝔤_(−α)`; the anti-involution fixes `H`
  pointwise and is an algebra anti-automorphism of `U(𝔤)`.
- Changes of ordered homogeneous bases induce unitriangular changes of PBW bases.

**Checks.**

- Type `A_1`: the weight `−2α` piece of `U(n^-)` is spanned by `f^2`; `ω(e) = −f`, and the
  anti-involution sends `ef` to `ef` and `e^2 f` to `f e^2`.
- Affine `A_1^(1)`: the weight `−2δ` piece of `U(n^-)` has dimension `6`, the number of multisets of
  positive roots summing to `2δ`: `{2δ}`, `{δ,δ}`, `{δ,α_0,α_1}`, `{α_0,α_0,α_1,α_1}`,
  `{α_0+δ, α_1}`, `{α_1+δ, α_0}`; an enumeration using real roots only finds `3`.
- The empty index set: `U(𝔤)` is the symmetric algebra on `ℚ^m`.

### 1.5 The untwisted affine algebra as loops plus a degree derivation

For a finite-dimensional simple `g` with a pinning let `κ_0` be the invariant form with long roots of
squared length `2`. Consume `LieAlgebra.loopAlgebra`, `LieAlgebra.LoopAlgebra.residuePairing` and
`twoCocycleOfBilinear`, and the extension carrier `LieAlgebra.ofTwoCocycle` with
`LieAlgebra.Extension.ofTwoCocycle`; AffineLieAlgebras A2's polynomial extension `ĝ_κ` has bracket
`[x⊗t^m, y⊗t^n] = [x,y]⊗t^(m+n) + mκ(x,y)δ_(m+n,0) K`. Mathlib's residue pairing is `+Res(f dg)`
(on `x⊗t^m, y⊗t^n` it is `nΦ(x,y)δ_(m+n,0)`), so this bracket is the cocycle at `Φ = −κ`. Construct
the degree derivation `d = t d/dt`, `[d, x⊗t^n] = n x⊗t^n`, `[d, K] = 0`, the semidirect product
`ĝ_κ ⋊ kd`, and its invariant form `(x⊗t^m, y⊗t^n) = δ_(m+n,0) κ_0(x,y)`, `(K,d) = 1`,
`(K,K) = (d,d) = 0`, `K, d ⊥ g⊗k[t,t^(−1)]`. Construct the Lie isomorphism from the Kac–Moody algebra
of the untwisted affine matrix with the minimal realization `H = span(h_0,…,h_ℓ) ⊕ kd` to
`ĝ_(κ_0) ⋊ kd`: `e_i ↦ e_i⊗1`, `f_i ↦ f_i⊗1`, `h_i ↦ h_i⊗1` for finite `i`, `e_0 ↦ f_θ⊗t`,
`f_0 ↦ e_θ⊗t^(−1)`, `h_0 ↦ K − θ^∨⊗1`, `d ↦ d`, with `e_θ, f_θ` highest-root vectors,
`[e_θ, f_θ] = θ^∨`, `κ_0(e_θ, f_θ) = 1`. Prove it respects every relation and is bijective (Kac,
Theorem 7.4). Consequences: the central coroot `c = Σ_i a_i^∨ h_i` maps to `K` because
`θ^∨ = Σ_(i≠0) a_i^∨ h_i` (Kac, §6.2); a module on which `K` acts by `k` has level `k`, so a highest
weight `λ` has level `λ(c)`; `α_0(d) = 1`, `α_i(d) = 0` for finite `i`, the homogeneous grading of 4.5;
the transported form of 1.3 is the one above since `d_0 = 1` gives `(h_0,h_0) = 2 = κ_0(θ^∨, θ^∨)` and
`(h_0, d) = α_0(d) = 1 = (K,d)`. Transport the level along A2's rescaling `κ = kκ_0`. *Needs:* 1.1,
1.3; Mathlib `LieAlgebra.loopAlgebra`, `LieAlgebra.LoopAlgebra.residuePairing`,
`LieAlgebra.LoopAlgebra.twoCocycleOfBilinear`, `LieAlgebra.ofTwoCocycle`; AffineLieAlgebras A2.

- The isomorphism and its inverse; the dictionary `c ↦ K`, level, degree.
- The cocycle extension alone carries no degree derivation and no highest-weight representation.

**Checks.**

- `[e_0, f_0] = [f_θ, e_θ]⊗1 + 1·κ_0(f_θ, e_θ) K = −θ^∨ + K`, which is the image of `h_0`; with the
  opposite sign `+κ Res(f dg)` the same computation gives `−θ^∨ − K`, which fails the Chevalley
  relation.
- Affine `A_1^(1)` with `g = sl_2`: `c = h_0 + h_1 ↦ K`, and `(ad e_0)^3 e_1 = 0` becomes
  `(ad f⊗t)^3 (e⊗1) = 0` in `sl_2[t,t^(−1)]`.
- The degree element pairs as `(d, h_0) = 1`, `(d, h_1) = 0`, `(d,d) = 0`, matching the Gram matrix of
  1.3.

### Examples

`sl_2`, `sl_2 ⊕ ℚz`, the affine `A_1^(1)` algebra as `sl_2[t,t^(−1)] ⊕ kK ⊕ kd`, and the indefinite
rank-two algebra with its imaginary root `α_0 + α_1` of multiplicity `1`.

### Dependencies

Layer 0; Mathlib free Lie algebras, enveloping algebras, loop algebras and extensions; Tau Ceti PBW;
AffineLieAlgebras A2; LieHighestWeight Layer 3 for the finite-type comparison.

## Layer 2: Weyl group, real roots and parabolic order (KM2)

### 2.1 Simple reflections and the Weyl group as a Coxeter group

Define `simpleReflection R i` on `H_Q*` by `λ ↦ λ − λ(h_i) α_i` (Mathlib's `Module.reflection` at
`α_i(h_i) = 2`) and the dual reflection `h ↦ h − α_i(h) h_i` on `H_Q`; prove involutivity, preservation
of the pairing and stability of `P`, `Y` and `Q`. Define `weylGroup R` as the subgroup of `GL(H_Q*)`
generated by the `simpleReflection R i`, and `length R w` as the least length of a word in the
generators. Define the Coxeter matrix by `m_ij = 2, 3, 4, 6` for `a_ij a_ji = 0, 1, 2, 3` and
`m_ij = ∞` for `a_ij a_ji ≥ 4`, with `m_ii = 1`. Construct the homomorphism from the Coxeter group of
`(m_ij)` to `weylGroup R`, prove it is an isomorphism (Kac, Proposition 3.13), and prove the geometric
representation is faithful on the root lattice `Q` (if `w` fixes every `α_i` then `w` has no descent,
so `w = 1`, by Kac, Lemma 3.11: `ℓ(w s_i) < ℓ(w)` iff `w(α_i) < 0`). After this identification consume
RootSystems Layer 3 and the four Tau Ceti Coxeter theorems of the supplier contract. Matsumoto
evaluation alone need not be a group homomorphism without the square relations. *Needs:* 0.2, 0.3;
Mathlib `Module.reflection`, `CoxeterSystem`; Tau Ceti `CoxeterSystem.strongExchange`,
`CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq`, `TauCeti.matsumoto`,
`CoxeterSystem.existsUnique_isMinimalCosetRep_mul`; RootSystems Layer 3.

- `s_i^2 = 1`; `(s_i s_j)^(m_ij) = 1`; the Weyl group of an enlargement equals that of the minimal
  sub-realization through restriction to `Q`.
- Real roots and coroots transport along `W` independently of the word: `w(α_i)` depends only on `w`,
  and `(wα)^∨ = w(α^∨)`.
- Imaginary roots are not transported as if real: `s_α` is defined for real `α` only.

**Checks.**

- Type `A_1`: `W = {1, s}` of order `2`; `s(ω) = −ω`.
- Affine `A_1^(1)`: `a_01 a_10 = 4`, so `m_01 = ∞` and `W` is the infinite dihedral group;
  `s_0 s_1` has infinite order and `(s_0 s_1)(α_1) = s_0(−α_1) = −α_1 − 2α_0 = α_1 − 2δ`.
- Type `B_2`: `a_12 a_21 = 2`, `m_12 = 4`, `|W| = 8`; a convention giving `m_12 = 3` is wrong.
- The empty index set: `W` is trivial and `ℓ(1) = 0`.

### 2.2 Tits cone, dominant chamber and inversion sets

Construct the dominant chamber `C = {λ ∈ H_ℝ* : λ(h_i) ≥ 0}`, the Tits cone `X = ⋃_w w(C)`, and prove
`C` is a fundamental domain for `W` on `X`, `X` is a convex cone, and for `λ ∈ X` the set
`{α > 0 real : λ(α^∨) < 0}` is finite (Kac, Proposition 3.12). Construct the positive and negative
real-root inversion sets of `w`, prove `|{α > 0 real : w(α) < 0}| = ℓ(w)`, and the finiteness of
Bruhat intervals `[u, w]`. *Needs:* 2.1; RootSystems Layer 3.

- `X` contains `P^+`; `X = H_ℝ*` iff `A` is of finite type.
- Inversion sets of a reduced word are the sets `{s_(i_1) ⋯ s_(i_(k−1)) α_(i_k)}`.
- Finite rank does not imply `W` finite, a longest element, or a finite orbit of `λ`.

**Checks.**

- Affine `A_1^(1)`: the Tits cone is `{λ : λ(c) > 0} ∪ ℝδ` (Kac, Proposition 5.8); `Λ_0` with
  `Λ_0(h_0) = 1`, `Λ_0(h_1) = 0` has the infinite orbit `{Λ_0 + nα_1 − n^2 δ : n ∈ ℤ}`, with
  `s_0 Λ_0 = Λ_0 − α_0 = Λ_0 + α_1 − δ` the case `n = 1`.
- Type `A_1`: `X = ℝω` is the whole line; `[1, s]` is the interval `{1, s}`.
- Indefinite `[[2,−3],[−3,2]]`: `ℓ(s_0 s_1 s_0) = 3` and the interval `[1, s_0 s_1 s_0]` has `6`
  elements.

### 2.3 Parabolic quotients and minimal coset representatives

For dominant `λ` prove `W_λ = W_J` with `J = {i : λ(h_i) = 0}` (Kac, Proposition 3.12), construct the
minimal coset representatives `W^J` through `existsUnique_isMinimalCosetRep_mul`, their Bruhat order,
and the quotient lifting and exchange facts used by Layer 5: for a positive real root `β` and
`u ∈ W^J`, `(uλ)(β^∨) < 0` gives `s_β u < u` in `W/W_J`, `> 0` gives `s_β u > u`, and `= 0` gives
the same coset. Construct finite Bruhat intervals in `W/W_J` even when `W_J` is infinite. *Needs:*
2.1, 2.2; Tau Ceti `CoxeterSystem.existsUnique_isMinimalCosetRep_mul`; RootSystems Layer 3.

- The orbit map `W/W_J → Wλ` is a bijection; the Bruhat order on `W/W_J` is induced from `W`.
- Each cover in `W/W_J` is a reflection cover by a positive real root.

**Checks.**

- Affine `A_1^(1)`, `λ = Λ_0`: `J = {1}`, `W^J = {1, s_0, s_1 s_0, s_0 s_1 s_0, …}`, a chain.
- Type `A_2`, `λ = ω_1`: `W/W_J` has three cosets with a linear Bruhat order.
- `λ = 0`: `J = I`, the quotient is a point.

### Examples

The infinite dihedral group of `A_1^(1)` with its real roots `±α_1 + nδ` and imaginary roots `nδ`; the
indefinite rank-two group.

### Dependencies

Layers 0–1; Mathlib `Module.reflection`, `CoxeterSystem`; Tau Ceti Coxeter theorems; RootSystems
Layer 3.

## Layer 3: highest-weight modules and the integrable category O (KM3)

### 3.1 Verma modules and simple highest-weight modules

For `λ ∈ H_Q*` define `vermaRelations R λ` as the elements `ι(cartanElement R x) − λ(x)` and
`ι(positiveGenerator R i)` of `Enveloping R`, `vermaLeftIdeal R λ` as the left ideal they generate and
`VermaModule R λ` as the quotient. Prove the generator `v_λ` is nonzero (the left ideal is proper), the
universal property (a vector `v` of weight `λ` killed by every `e_i` in any module receives a unique
map `v_λ ↦ v`, the zero vector included), the `U(n^-)`-module isomorphism `U(n^-) ≅ M(λ)`, support in
`λ − Q_+` and finite weight multiplicities `dim M(λ)_μ = ` the number of root partitions of `λ − μ`
(Kac, §9.2). Define `cartanAction R M x` as the ℚ-linear action of `ι(cartanElement R x)` on an
`Enveloping R`-module `M` and `weightSpace R M μ` as the intersection of the eigenspaces of
`cartanAction R M x` with eigenvalue `μ(x)`. Define `maximalSubmodule R λ` as the sum of all proper
submodules of `M(λ)`, prove it is proper (every proper submodule lies in `⊕_(μ≠λ) M(λ)_μ`, since
submodules of weight modules are weight-graded), and define `IrreducibleModule R λ` as the quotient
`L(λ)`; prove it is simple, every simple highest-weight module of highest weight `λ` is isomorphic to
it, and `L(λ) ≅ L(μ)` iff `λ = μ` (Kac, §9.2). Prove the finite-type comparison with LieHighestWeight
Layer 3 and Tau Ceti's `VermaModule`. *Needs:* 1.1, 1.4; Mathlib `Submodule.span`,
`Submodule.Quotient.module'`, `Module.End.eigenspace`; LieHighestWeight Layer 3.

- `weightSpace R M μ` is a ℚ-subspace; `e_i` maps `M_μ` to `M_(μ+α_i)` and `f_i` to `M_(μ−α_i)`.
- `M(λ) = ⊕_μ M(λ)_μ` with `M(λ)_λ = ℚ v_λ`.
- Submodules of a weight module are sums of their weight spaces (diagonalizability of the commuting
  Cartan actions over ℚ).

**Checks.**

- Type `A_1`, `λ(h) = n ∈ ℕ`: `M(λ)` has basis `f^k v_λ`, `k ≥ 0`, each weight space one-dimensional;
  `f^(n+1) v_λ` is a highest vector of weight `λ − (n+1)α`, so `maximalSubmodule` is
  `span{f^k v_λ : k > n}` and `dim L(λ) = n + 1`.
- Type `A_1`, `λ(h) = −1`: `M(λ)` is simple, `maximalSubmodule = 0`, `L(λ) = M(λ)` is
  infinite-dimensional.
- The empty index set on `ℚ^m`: `M(λ) = L(λ)` is one-dimensional with `H` acting by `λ`; the sum of
  proper submodules is `0`.
- Affine `A_1^(1)`: `M(λ)_(λ−δ)` has dimension `2` (partitions `δ` and `α_0 + α_1`), the first
  weight where a Verma module of an affine algebra has a weight space of dimension greater than `1`.

### 3.2 Integrable modules and the Weyl intertwiners

Define integrable modules: weight modules on which every `e_i` and `f_i` is locally nilpotent.
Construct their finite `sl_2`-strings and prove `L(λ)` is integrable iff `λ(h_i) ∈ ℕ` for all `i`
(Kac, §§3.5–3.6); for such `λ`, prove `L(λ)` is the quotient of `M(λ)` by the submodule generated by
the vectors `f_i^(λ(h_i)+1) v_λ`, and that this quotient is integrable by the Serre relations and the
rank-one commutation formulas (Kac, §§3.5–3.6 and §10.1). On an integrable module construct the
simple Weyl intertwiners `exp(e_i) exp(−f_i) exp(e_i)` from the locally finite exponentials, with
their normalization and braid relations (Kac, §3.8); their action on weights is the `W`-action,
while the chosen lifts on vectors retain sign and toral factors. Prove local nilpotence of every real
root vector through these intertwiners, and do not claim it for imaginary root vectors. In finite type
compare with the normalizer action of LieHighestWeight; no canonical lift of every Weyl element is
asserted. Positive-level affine highest-weight modules are included and are infinite-dimensional: a
finite-dimensional module of nonzero level is excluded because the trace of a central commutator
vanishes. *Needs:* 3.1; 2.1; Layer 1 Serre relations.

- The weights of an integrable module form a `W`-stable set with `dim M_(wμ) = dim M_μ`
  (Kac, §3.7 and §10.1).
- The intertwiner of `s_i` maps `M_μ` onto `M_(s_i μ)`.

**Checks.**

- Type `A_1`, `λ(h) = 2`: `L(λ)` is three-dimensional; the intertwiner sends `v_λ` to a nonzero
  multiple of `f^2 v_λ`, of weight `−λ`, so the weight action is `s`; its square acts on a vector of
  weight `μ` by `(−1)^(μ(h))`, which is `+1` on all of `L(2ω)` and `−1` on all of `L(ω)`: the lift
  of `s` is not an involution in general.
- Affine `A_1^(1)`, `λ = Λ_0`: `L(Λ_0)` has level `1`, `dim L(Λ_0)_(Λ_0 − nδ) = p(n)` (the partition
  numbers) and is infinite-dimensional; the vector `f_1 v_(Λ_0)` is zero since `Λ_0(h_1) = 0`.
- `λ(h_i) = −1` for some `i`: `L(λ)` is not integrable, since `f_i^k v_λ ≠ 0` for all `k`.

### 3.3 Category O, its integrable part and complete reducibility

Define category `O`: weight modules with finite-dimensional weight spaces whose weights lie in a finite
union of sets `λ_j − Q_+` (Kac, §9.1); `IsIntegrableO R M` is this together with local nilpotence of
all `e_i`, `f_i`. Construct kernels, cokernels, finite direct sums, finite tensor products,
highest-weight morphisms and the change of coefficient field under split-weight hypotheses in `O`; an
extension of modules in `O` lies in `O` only when its middle term is again a weight module, and a
Jordan-block extension is excluded. Construct the generalized Casimir operator `Ω` of a minimal
realization from the form of 1.3 (Kac, §2.5), prove it commutes with `𝔤` on every module in `O` and
acts on a highest-weight module of highest weight `λ` by `(λ + 2ρ, λ)` (Kac, Theorem 2.6); for an
enlargement use the central splitting of 1.1 and the Casimir of the minimal sub-realization. Prove
complete reducibility: every `M` with `IsIntegrableO R M` is semisimple as an `Enveloping R`-module
and every simple submodule is isomorphic to `L(λ)` for some `λ` with all `λ(h_i) ∈ ℕ` (Kac,
Theorem 10.7). The route: a simple submodule of an integrable object of `O` has a maximal weight, is
highest-weight and integrable, hence `L(λ)` with `λ` dominant integral; for comparable dominant
integral `λ > μ` the scalars `(λ+2ρ,λ) ≠ (μ+2ρ,μ)` separate, since
`(λ+ρ,λ+ρ) − (μ+ρ,μ+ρ) = Σ_i n_i d_i (λ(h_i) + μ(h_i) + 2) > 0` for `λ − μ = Σ n_i α_i ≠ 0`; extensions
between incomparable or equal highest weights split by lifting the highest vector; the general object
is treated through finite local composition series of weight truncations. The finite Killing
complete-reducibility theorem is never applied to an infinite-dimensional algebra, and semisimplicity
is not asserted for integrable modules outside `O`. *Needs:* 3.1, 3.2, 1.3; Mathlib
`IsSemisimpleModule`, `IsSimpleModule`.

- `O` is abelian and closed under finite tensor products; `M(λ)` and `L(λ)` lie in `O`.
- `Ω` is natural for all morphisms in `O` and preserves weight spaces.
- The integrable objects of `O` are exactly the direct sums `⊕ L(λ_j)^(m_j)` with `λ_j` dominant
  integral and the multiplicity function finitely supported on each weight.

**Checks.**

- Type `A_1`, `(ω,ω) = 1/2`, `ρ = ω`: `L(2ω) ⊗ L(ω) ≅ L(3ω) ⊕ L(ω)` with dimensions `6 = 4 + 2`;
  `Ω` acts by `(3ω + 2ρ, 3ω) = 15/2` and `(ω + 2ρ, ω) = 3/2`, two distinct scalars.
- Affine `A_1^(1)`: `L(Λ_0) ⊗ L(Λ_0)` lies in integrable `O` with weights bounded by `2Λ_0`, is
  infinite-dimensional, and is a direct sum of simple modules of level `2`, `L(2Λ_0)` appearing once
  because the weight space of `2Λ_0` is one-dimensional; no finite-dimensionality argument is used.
- Negative control: the extension `0 → M(−2ω) → M(0) → L(0) → 0` in type `A_1` lies in `O` and does
  not split, since `M(0)` is cyclic and indecomposable; the theorem does not apply to it, since
  `M(0)` is not integrable.
- The empty index set on `ℚ^1`: `O` is the category of `ℚ`-graded vector spaces with
  finite-dimensional pieces supported in finitely many points; every object is integrable and
  semisimple.

### 3.4 Restricted and contravariant duals

Construct the restricted dual `M^∨ = ⊕_μ (M_μ)*` with the action twisted by the Chevalley involution
so that weights are negated and support lies in a lower cone; the full algebraic dual is a product and a
different carrier. Construct the contravariant dual through the Chevalley anti-involution, preserving
highest weights, the normalized contravariant form on `M(λ)` whose radical is `maximalSubmodule R λ`
(Kac, §9.4), and its simple-quotient comparison. Give evaluation and finite-weight pairings; an
infinite-dimensional module is not rigid with a finite coevaluation. Compare with LieHighestWeight's
finite-type duals including universes and chosen generators. *Needs:* 3.1, 1.4; LieHighestWeight
Layer 3.

- `(M^∨)_μ ≅ (M_(−μ))*`; `L(λ)^∨ ≅ L(−w_0 λ)` in finite type only, where `w_0` exists.
- The contravariant form on `M(λ)` is symmetric, `U(𝔤)`-contravariant, and nondegenerate on `L(λ)`.

**Checks.**

- Type `A_1`, `λ(h) = 1`, `(v_λ, v_λ) = 1`: `(f v_λ, f v_λ) = (v_λ, e f v_λ) = λ(h) = 1` and
  `(f^2 v_λ, f^2 v_λ) = (v_λ, e^2 f^2 v_λ) = 0` because `e f^2 v_λ = (f h + h f) v_λ = (1 − 1) f v_λ = 0`,
  so the radical starts at `f^2 v_λ`.
- Affine `A_1^(1)`: `L(Λ_0)^∨` is the lowest-weight module of lowest weight `−Λ_0`, not a
  highest-weight module.
- The empty index set: both duals are the ordinary dual of a one-dimensional space with weight
  negated, respectively preserved.

### Examples

`sl_2` Verma modules at integral and non-integral weights; the basic representation `L(Λ_0)` of
`A_1^(1)` with its partition-number multiplicities; the non-split extension `M(0)` of `L(0)` by
`M(−2ω)`.

### Dependencies

Layers 0–2; Mathlib module quotients, eigenspaces, semisimple modules; LieHighestWeight Layers 3 and 5
for comparisons.

## Layer 4: completed characters and the Weyl–Kac formula (KM4)

### 4.1 The cone-supported character ring

For a characteristic-zero field `k` put `H_k = k ⊗_ℚ H_Q`, `Γ_k = H_k*`, and use the injective map
`j_k : P → Γ_k`; the simple roots and `Q_+` are their images and remain `ℤ`-independent. Define
`positiveRootCone R` as the additive submonoid of `H_Q*` generated by the `α_i`. Construct the ambient
upper-cone ring of functions `Γ_k → ℤ` supported in a finite union of sets `λ − Q_+` with arbitrary
`λ ∈ Γ_k`: addition is coefficientwise; for multiplication prove that for upper bounds `λ, λ'` and a
target `ξ` the supported pairs `(μ, ν)` with `μ + ν = ξ` are finite, because independence of the
simple roots makes `λ + λ' − ξ` have at most one expression in `ℕ^I`, and sum their coefficient
products. Build unit, associativity, distributivity, monomials `e^λ`, shifts, finite truncations, and
the topology and completion relative to the cones and finite-height truncations. Construct the
`P`-indexed upper-cone ring and its injective unital ring map to the ambient ring by extension by zero
along `j_k`; identify its image as the series supported on `j_k(P)`, and never restrict an ambient
series to `P` and call it the original. Each ambient series is supported in finitely many cosets of
`j_k(P)`; construct the coset components and their convolution. Finite `Finsupp` carriers are the
finite-support subrings only. *Needs:* 0.3; Mathlib `Finsupp`, `AddSubmonoid.closure`.

- The ring is commutative with unit `e^0`; `e^λ e^μ = e^(λ+μ)`; the `P`-indexed ring embeds.
- `∏_(α>0)(1 − e^(−α))^(mult α)` and its inverse are elements of the ambient upper completion.

**Checks.**

- Type `A_1`: `(1 − e^(−α))^(−1) = Σ_(n≥0) e^(−nα)` lies in the completion with upper bound `0`; its
  product with `1 − e^(−α)` is `e^0`.
- The supported pairs for `ξ = −2α` between two series bounded by `0` are `(0,−2α), (−α,−α), (−2α,0)`:
  three pairs, not infinitely many.
- The empty index set: `Q_+ = 0`, and the ring is the group ring of `Γ_k` with finite support.

### 4.2 Characters of modules

Define `ch M = Σ_μ dim(M_μ) e^μ` in the ambient ring for `M` in category `O`, using
`Module.finrank ℚ (weightSpace R M μ)`. Prove additivity on short exact sequences in `O`, the tensor
formula `ch(M ⊗ N) = ch M · ch N`, the scalar-change formula along an embedding of characteristic-zero
fields under the split-weight hypotheses of 3.3, and that a highest-weight module of highest weight `λ`
has character supported in `λ − Q_+`. The negative-weight involution sends the upper completion to the
lower one and gives `ch M^∨ = Σ dim(M_μ) e^(−μ)`; the contravariant dual preserves `ch`. A Weyl element
transports weights and cones, and an upper-bounded series need not stay in the same upper completion.
*Needs:* 4.1, 3.1, 3.3, 3.4.

- `ch` is determined on weight modules by the finite dimensions and is injective on isomorphism
  classes of integrable objects of `O` (by 3.3).
- For `M` with weights in `j_k(P)` the `P`-indexed character extends by zero to the ambient one.

**Checks.**

- Type `A_1`: `ch L(nω) = e^(nω) + e^((n−2)ω) + ⋯ + e^(−nω)`; `ch M(λ) = e^λ (1 − e^(−α))^(−1)`.
- Type `A_1`, `P = ℤω`, `λ = ω/2`: `M(ω/2)` has nonzero coefficients at `(1/2 − 2n)ω`, `n ≥ 0`, in the
  ambient coset completion, and its restriction to `P` is zero and is not its character.
- A formal evaluation `e^μ ↦ 1` is not a ring map on the completion: it diverges on
  `(1 − e^(−α))^(−1)`.

### 4.3 The Verma character and the Euler product

Construct the root-multiplicity Euler product `∏_(α>0)(1 − e^(−α))^(mult α)` in the `P`-indexed ring and
its ambient image, prove it is invertible in the upper completion, and prove
`ch M(λ) = e^λ ∏_(α>0)(1 − e^(−α))^(−mult α)` for every `λ ∈ Γ_k` coefficientwise (Kac, §9.2, from
`M(λ) ≅ U(n^-)` and the root-partition basis of 1.4). *Needs:* 4.1, 4.2, 1.4, 3.1.

- `ch M(λ) = e^λ ch M(0)`; multiplication by `e^λ` is the shift.

**Checks.**

- Type `A_1`: `ch M(λ) = Σ_(n≥0) e^(λ − nα)`.
- Affine `A_1^(1)`: the coefficient of `e^(λ−2δ)` in `ch M(λ)` is `6`, matching the partition count of
  1.4.
- A product over real roots only gives coefficient `3` at `e^(λ−2δ)`, which is wrong.

### 4.4 The Weyl–Kac character formula and the denominator identity

For `λ ∈ H_Q*` with every `λ(h_i) ∈ ℕ`, `ρ` with `ρ(h_i) = 1`, and any `μ`, prove
`weylKac_character_formula`: the family `w ↦ dim M(w ∘ λ)_μ` on `weylGroup R` has finite support, and

    dim L(λ)_μ = Σ_(w ∈ W) (−1)^ℓ(w) dim M(w(λ+ρ) − ρ)_μ,

which in the `P`-indexed ring is
`ch L(λ) · ∏_(α>0)(1 − e^(−α))^(mult α) = Σ_(w ∈ W)(−1)^ℓ(w) e^(w(λ+ρ)−ρ)` (Kac, Theorem 10.4).
Prove `w(λ+ρ) − ρ ∈ j_k(P)` using `wρ − ρ ∈ Q`, local finiteness of the alternating sum (only the
finitely many `w` with `w(λ+ρ) ≥ μ + ρ` contribute, since `λ + ρ` is regular dominant and
`{ν ∈ Q_+ : ν ≤ λ − μ}` is finite), independence of the allowed central choices of `ρ`, and equality
in the `P`-completion and its ambient image. The route is Kac's: the Casimir of 3.3 forces
`ch L(λ) ∏(1−e^(−α))^(mult α)` to be a combination of `e^(ν)` over the finite set of `ν ≤ λ` with
`(ν+ρ,ν+ρ) = (λ+ρ,λ+ρ)`, and `W`-antisymmetry from 3.2 fixes the coefficients. Derive the denominator
identity as the case `λ = 0`, `∏_(α>0)(1 − e^(−α))^(mult α) = Σ_w (−1)^ℓ(w) e^(wρ−ρ)`, and compare the
finite-type Weyl character formula with LieHighestWeight Layer 6. For an enlargement the formula holds
verbatim through the central splitting of 1.1, the extra central directions acting by the scalar
`λ(z)` on every weight space. *Needs:* 4.3, 3.1–3.3, 2.1, 1.3; LieHighestWeight Layer 6.

- The alternating sum is `W`-antisymmetric under the dot action and supported on `j_k(P)`.
- `dim L(λ)_(wμ) = dim L(λ)_μ`.

**Checks.**

- Type `A_1`, `λ = nω`: `W = {1, s}`, `s ∘ λ = −(n+2)ω`, and
  `dim L(nω)_μ = dim M(nω)_μ − dim M(−(n+2)ω)_μ` gives `1` for `μ ∈ {nω, (n−2)ω, …, −nω}` and `0`
  below, since `M(−(n+2)ω)_μ` is nonzero exactly for `μ ≤ −(n+2)ω`; a sign error gives `2` at
  `μ = −(n+2)ω`.
- Affine `A_1^(1)`, `λ = Λ_0`, `μ = Λ_0 − δ`: `dim M(Λ_0)_(Λ_0−δ) = 2`; `s_0 ∘ Λ_0 = Λ_0 − 2α_0` and
  `(Λ_0 − 2α_0) − μ = α_1 − α_0 ∉ Q_+`, so `s_0` contributes `0`; `s_1 ∘ Λ_0 = Λ_0 − α_1` contributes
  `−dim M(Λ_0−α_1)_(Λ_0−δ) = −1`; longer words contribute `0`; the sum is `2 − 0 − 1 = 1 = p(1)`.
- Denominator identity in type `A_1`: `1 − e^(−α) = e^0 − e^(sρ − ρ)` with `sρ − ρ = −α`.
- The empty index set: `W = 1`, `L(λ) = M(λ)`, and the formula reads `1 = 1` at `μ = λ`.

### 4.5 The affine homogeneous grading

In affine type construct the level `λ(c)` and the homogeneous degree grading of 1.5 with the finite
simple roots of degree `0` and `α_0` of degree `1`. For integral dominant `λ` prove every
homogeneous-degree piece of `L(λ)` is finite-dimensional (Kac, Chapter 12: the degree-`n` piece is a
finite sum of weight spaces, since the finite-Levi module generated by a weight space of degree `n` is
finite-dimensional by integrability). Do not assert this for Verma modules or all of `O`: in
`A_1^(1)` the vectors `f_1^n v_λ`, `n ≥ 0`, are independent in the top degree of `M(λ)`. Analytic
convergence of characters is a separate specialization condition. *Needs:* 4.2, 3.2, 1.5.

**Checks.**

- `L(Λ_0)`: the weight `Λ_0 − aα_0 − bα_1 = Λ_0 + (a−b)α_1 − aδ` has degree `a`, and
  `dim L(Λ_0)_(Λ_0 + mα_1 − (m^2+k)δ) = p(k)`, so the degree-`a` piece has dimension
  `Σ_m p(a − m^2)`: `1` in degree `0` and `3` in degree `1`.
- `M(Λ_0)`: the degree-`0` piece is infinite-dimensional.

### Examples

`ch L(nω)` for `sl_2`, the basic representation of `A_1^(1)` with `Σ p(n) q^n`, and the denominator
identity of `A_1^(1)` as the Jacobi triple product.

### Dependencies

Layers 0–3; Mathlib `Finsupp`, `finsum`; LieHighestWeight Layer 6 for the finite comparison.

## Layer 5: path representatives, root operators and LS paths (KM6)

### 5.1 Paths and reparametrization classes

Construct finite continuous piecewise-linear paths `π : [0,1] → P_ℝ` with `π(0) = 0` and `π(1) ∈ P`,
with specified finite subdivisions, including rational polygonal representatives and the real
piecewise-linear carrier. Define reparametrization equivalence `π ∼ π ∘ r` for continuous nondecreasing
surjective piecewise-linear `r : [0,1] → [0,1]`, with common refinement, insertion and removal of
constant pauses, and the quotient. Prove that endpoints, height minima and endpoint-height differences
descend, that full height functions and prefix and suffix records are representative-level with the
covariance `H_(π∘r) = H_π ∘ r`, and that root-operator outputs descend through this covariance.
Define concatenation `π * η`, first `π` then `π(1) + η`, with its time rescaling and associator.
*Needs:* 0.3; Mathlib continuous maps, `Convex`.

- `∼` is an equivalence relation; concatenation is associative on classes with the constant path as
  unit.
- Rational polygonal representatives are dense in the classes used by 5.3.

**Checks.**

- The constant path and the path `t ↦ 0` with a pause are equivalent; the constant path is not the zero
  symbol.
- In rank one `P_ℝ = ℝω`, the path with heights `0, 6/5, 1/5, 1` at times `0, 1/3, 2/3, 1` has
  `min H = 0` and `H(1) = 1`.
- Concatenating `t ↦ tω` with itself gives `t ↦ 2tω` up to reparametrization.

### 5.2 Root operators in record form and the two-cut form

For a simple coroot `h_i` put `H(t) = ⟨π(t), h_i⟩`, `m = min H`, suffix record
`S(t) = min_(t≤u≤1) H(u)` and prefix record `P(t) = min_(0≤u≤t) H(u)`. If `H(1) − m ≥ 1` set
`L(t) = min(1, S(t) − m)` and `f_i π(t) = π(t) − L(t) α_i`, else `f_i π = 0`; if `m ≤ −1` set
`R(t) = 1 − min(1, P(t) − m)` and `e_i π(t) = π(t) + R(t) α_i`, else `e_i π = 0` (Littelmann's
operators; Lenart–Postnikov §9, Remark 9.2 and §10). Construct the records on finite subdivisions with
nonmonotone segments, plateaus and equal extrema; prove the output reflects exactly the increasing
suffix-record pieces for `f_i` and the decreasing prefix-record pieces for `e_i`, leaving hills and
valleys outside the records untouched; prove piecewise linearity, subdivision independence, endpoint
shifts by `∓α_i`, partial inverses `e_i f_i π = π` when `f_i π ≠ 0`, and reparametrization invariance.
Prove the two-cut formula under its monotonicity hypothesis (Lenart–Postnikov §9, lines 915–924 and
933–937): for `f_i` take the last minimum `t_0` and the first `t_1` after which `H ≥ m + 1`, require
`H` weakly increasing on `[t_0, t_1]`, reflect that interval's displacement by `s_i` and translate the
tail by `−α_i`; for `e_i` the first minimum and the last time before which `H ≥ m + 1`, with `H`
weakly decreasing. Prove the monotonicity for LS paths. *Needs:* 5.1; 2.1.

- `ε_i(π) = −min H_i`, `φ_i(π) = H_i(1) − min H_i` when the minimum is integral; `wt(f_i π) = wt π − α_i`.
- `f_i^k π ≠ 0` iff `k ≤ φ_i(π)`, `e_i^k π ≠ 0` iff `k ≤ ε_i(π)` on paths with integral minima.

**Checks.**

- Rank one, the dominant path with heights `0, 6/5, 1/5, 1`: the two-cut recipe, reflecting from the
  last minimum to the first hit of `1` and translating the whole tail, produces a minimum below `−1`
  and fails `e f π = π`; the record formula keeps the hill and gives minimum `−1`.
- The straight path `t ↦ tω` in rank one: `f π = (t ↦ −tω)`, the reflection of the whole path, and
  `e π = 0`.
- An integral global minimum alone is insufficient for the two-cut form: a path with heights
  `0, 1, 0, 1, 2` has `m = 0` but is not monotone between the cuts.

### 5.3 LS paths and their chain description

For `λ ∈ P^+` define the straight path `t ↦ tλ` and `B_path(λ)` as the set of paths obtained from it
by the lowering operators `f_i`. Construct rational LS representatives: slopes in `Wλ`, positive
rational durations summing to `1`, strictly decreasing distinct minimal cosets of 2.3, merged repeated
adjacent slopes, and for each breakpoint `a` an `a`-chain in the parabolic Bruhat interval (a saturated
chain `ξ_0 > ξ_1 > ⋯` of orbit weights with `ξ_h = s_(β_h) ξ_(h−1)`, `β_h` positive real,
`⟨ξ_(h−1), β_h^∨⟩ < 0` and `a⟨ξ_(h−1), β_h^∨⟩ ∈ ℤ`; Kanakubo §3.1 and Lenart–Postnikov §9). Prove
uniqueness of the distinguished representative after merging, using orbit uniqueness in the dominant
chamber rather than a positive-definite norm, and prove the LS paths are exactly the elements of
`B_path(λ)` (Littelmann 1994, the LS-chain characterization; Lenart–Postnikov §9, lines 931–941).
Intervals are finite although the orbit can be infinite. *Needs:* 5.2; 2.3, 2.2.

- Every LS path has integral local minima of all `H_i`, so the two-cut form applies.
- `B_path(λ)` has the unique highest element `t ↦ tλ` and is generated from it by lowering.

**Checks.**

- Rank one, `λ = nω`: the LS paths are the `n + 1` paths with a single break at `j/n`, `0 ≤ j ≤ n`,
  slopes `nω` then `−nω`; `n = 0` gives the constant path alone.
- Affine `A_1^(1)`, `λ = Λ_0`: the decreasing cover `s_0 > 1` of `W/W_J` has
  `⟨s_0Λ_0, h_0⟩ = 1 − 2 = −1`, so an `a`-chain across it needs `a ∈ ℤ` and no LS path of `Λ_0` has a
  break between the slopes `s_0Λ_0` and `Λ_0`; `B_path(Λ_0)` is infinite, with weight fibres of size
  `p(k)` over `Λ_0 + mα_1 − (m^2+k)δ` by 6.2.
- Type `A_2`, `λ = ω_1 + ω_2`: `|B_path(λ)| = 8` with two paths of endpoint `0`.

### 5.4 Bonds, interval gcds and convexity

Construct the bond on a decreasing cover `u > v = s_β u` of `W/W_J`, `b_λ(u,v) = −⟨uλ, β^∨⟩`, positive
for distinct orbit weights, the chain-independent interval gcd `d_λ(u,v)` with `d_λ(u,u) = 0`, and the
comparison: for `a = p/q` in lowest terms an `a`-chain from `u` to `v` exists iff `q` divides
`d_λ(u,v)`, in which case every saturated chain is an `a`-chain (Chirivì–Fang–Littelmann, Definition
2.1 and §7.1, attributing the condition to Dehy). Reduce chain independence to quotient-chain
connectivity by rank-two replacements and rank-two root and coroot calculations; wall cosets and
non-simply-laced data are included; the finite theorem of SchubertGeometry S4 is the comparison case.
Prove convexity: for a normalized LS representative `π(t) ∈ t·Conv(Wλ)` by the elapsed slope durations,
`π(0) = 0`, and when `0 ∈ Conv(Wλ)` the unscaled inclusion for `0 ≤ t ≤ 1`; a nonzero `W`-fixed
`λ` has orbit `{λ}` and path `tλ`. Prove the strict-sign wall and Bruhat lifting statements of 2.3 used
when a root operator changes adjacent directions. Construct typed central translation on normalized
representatives as in SchubertGeometry S4. *Needs:* 5.3, 2.3; Mathlib `Convex.sum_mem`,
`subset_convexHull`; SchubertGeometry S4; Chirivì–Fang–Littelmann Definition 2.1.

**Checks.**

- Affine `A_1^(1)`, `λ = Λ_0`, cover `s_0 > 1` with `β = α_0`: `b = −⟨s_0Λ_0, h_0⟩ = 1`, so
  `d_λ(s_0, 1) = 1` and only integral breaks occur, matching 5.3.
- Type `A_1`, `λ = nω`, cover `s > 1`: `b = −⟨sλ, α^∨⟩ = n`, `d_λ(s,1) = n`, and the breaks `j/n` are
  exactly the allowed ones.
- Convexity: for `λ = Λ_0`, `0 ∉ Conv(WΛ_0)` since every element pairs to `1` with `c`, so only the
  scaled inclusion holds.

### Examples

The rank-one strings, the `A_2` adjoint crystal with eight paths, the infinite `B_path(Λ_0)` of
`A_1^(1)`.

### Dependencies

Layers 0 and 2 only (no module, character, flag or divisor theorem is an input); Mathlib convexity;
SchubertGeometry S4 and Chirivì–Fang–Littelmann for the comparison case.

## Layer 6: the endpoint theorem, character identity and decomposition rules (KM7)

### 6.1 The endpoint theorem

For every path `π` in the carrier of 5.1 whose image lies in the dominant chamber and whose endpoint is
`λ ∈ P^+`, construct the strict crystal isomorphism (preserving weights, both partial operators and the
string functions `ε_i, φ_i`) from the component generated by `π` to `B_path(λ)`, sending `π` to the
straight path (Littelmann 1995, independence of the initial dominant path; Lenart–Postnikov §9, lines
938–941). Prove independence of the lowering-word choices and the linking, stretching, subdivision,
gluing and rank-two compatibilities used, on the real piecewise-linear carrier with the record
operators; a rational approximation is not an equality of paths nor a proof that operators commute
with limits. *Needs:* 5.2, 5.3; 2.1.

**Checks.**

- Rank one: the dominant path with heights `0, 6/5, 1/5, 1` generates a component isomorphic to the
  two-element string `B_path(ω)`.
- The straight path to `0` generates the one-element crystal.
- Rank one, the path with heights `0, −1, 1` at times `0, 1/2, 1`: its endpoint is `ω` but `e π` has
  heights `0, 1, 3`, so its component is `B_path(3ω)`, not `B_path(ω)`; the dominance hypothesis is
  necessary.

### 6.2 Path multiplicities are weight multiplicities

Prove that the number of paths in `B_path(λ)` with endpoint `μ` is finite and equals
`dim L(λ)_μ` of 3.1, so `Σ_(π ∈ B_path(λ)) e^(π(1)) = ch L(λ)` in the ring of 4.1 (Littelmann 1995,
the character formula; Lenart–Postnikov equation (9.2)). The route is combinatorial: `B_path(λ)` is a
semiperfect crystal with a coherent timing pattern, hence an admissible system in Stembridge's sense,
and the generating function of an admissible system is the Weyl–Kac character of 4.4
(Lenart–Postnikov Proposition 3.2 and Theorem 3.3, stated there for symmetrizable Kac–Moody algebras).
Prove the unique highest element and lowering generation. The entire path set may be infinite.
*Needs:* 6.1, 5.3, 4.4.

**Checks.**

- Rank one, `λ = nω`: `n + 1` paths with endpoints `nω, (n−2)ω, …, −nω`, each once.
- Type `A_2`, `λ = ω_1 + ω_2`: two paths end at `0`, matching `dim L(ω_1+ω_2)_0 = 2`.
- Affine `A_1^(1)`, `λ = Λ_0`, `μ = Λ_0 − δ`: exactly one path, matching `p(1) = 1` from 4.4.

### 6.3 Littlewood–Richardson and Levi branching rules

For dominant `λ, μ` prove the decomposition of the concatenation `B_path(λ) * B_path(μ)` into
components indexed by the paths `η ∈ B_path(μ)` with `λ + η(t)` dominant for every `t`, with
endpoints `λ + η(1)`, hence `ch L(λ) · ch L(μ) = Σ_η ch L(λ + η(1))` and, by 3.3,
`L(λ) ⊗ L(μ) ≅ ⊕_η L(λ + η(1))` with each `L(ν)` of finite multiplicity (Littelmann 1994, the
Littlewood–Richardson rule for symmetrizable Kac–Moody algebras; the character identity is the first
equation of Lenart–Postnikov Theorem 3.3). Route: each component of the concatenation contains a
highest path, which is `λ * η` with `λ + η(t)` dominant, and is isomorphic to `B_path(λ + η(1))` by 6.1.
For each `J ⊆ I` prove the Levi restriction rule through the `J`-dominant chamber with the full
restricted Cartan weights (Lenart–Postnikov Corollary 3.4). The sum may be infinite while each weight
multiplicity is finite. *Needs:* 6.2, 6.1, 5.1, 3.3.

**Checks.**

- Rank one: `B_path(ω) * B_path(ω)` has components with endpoints `2ω` and `0`, from the paths `η`
  whose heights stay `≥ −1`: `L(ω) ⊗ L(ω) ≅ L(2ω) ⊕ L(0)`.
- Affine `A_1^(1)`: `L(Λ_0) ⊗ L(Λ_0)` decomposes with infinitely many components, the straight
  `η` giving `L(2Λ_0)` once, consistent with 3.3.
- Levi restriction of `L(ω_1)` of `A_2` to `J = {1}`: `L(ω) ⊕ L(0)` with the central coordinate
  retained.

### 6.4 Finite-type specializations

Specialize finite root data to SchubertGeometry S4 with its exact quotient and central offsets: the
record operators, LS chains, bonds and gcds of Layer 5 restrict to S4's finite-type objects, and the
component, character and tensor theorems of 6.1–6.3 restrict to S4 item 4. State the type-A examples
on paths: in rank one `λ = nω` has exactly `n + 1` vertices with breaks `j/n`, and for `SL_3` and
`λ = ω_1 + ω_2` the eight paths of 5.3 are listed with their LS chains, including the two distinct
zero-weight paths and all eight lowering edges. Give the factor-reversal comparison between the
convention of 6.3 (`e_i` on the first factor iff `φ_i(first) ≥ ε_i(second)`, `f_i` iff `>`) and
the opposite convention (`e` first iff `ε(first) > φ(second)`, `f` first iff `≥`): a reversal of
tensor factors, not an equality of literal words. The identification of these type-A path crystals
with a tableau model is not stated here. None of these finite examples substitutes for the affine or
indefinite construction. *Needs:* 6.1–6.3; SchubertGeometry S4.

**Checks.**

- `SL_3`, `λ = ω_1 + ω_2`: the two zero-weight paths are `f_1 f_2 π_λ` and `f_2 f_1 π_λ`, distinct;
  the lowering edges are four of colour `1` and four of colour `2`, the two `1`-strings of length
  `3` and `1` through the zero-weight paths matching the two `2`-strings of length `1` and `3`.
- Rank one `n = 2`: three vertices and two lowering edges.
- Rank one, `B_path(ω) * B_path(ω)`: the highest element of the trivial component is
  `π_ω * π_(−ω)` in the convention of 6.3 and `π_(−ω) * π_ω` in the opposite convention, since
  `φ(π_ω) = 1 ≥ ε(π_(−ω)) = 1` sends `e` to the first factor in the former and
  `ε(π_(−ω)) = 1 > φ(π_ω) = 1` fails in the latter.

### Examples

The `A_2` adjoint crystal, the rank-one strings, and the basic representation of `A_1^(1)` through
its path model.

### Dependencies

Layers 2–5; SchubertGeometry S4; Littelmann 1994 and 1995 as restated in Lenart–Postnikov §§3 and 9
and Kanakubo §3.

## Layer 7: the minimal group, finite Schubert schemes and the Chevalley–Pieri formula (KM8)

### 7.1 The minimal split Kac–Moody group

Over an algebraically closed field of characteristic zero construct the minimal split Kac–Moody group
of the lattice realization `(P, Y)`: the torus `T = Y ⊗ 𝔾_m`, real-root one-parameter subgroups
`x_α(u)` for real roots `α`, the Tits relations (torus action `t x_α(u) t^(−1) = x_α(α(t)u)`,
prenilpotent-pair commutators, `s_α(u) = x_α(u) x_(−α)(−u^(−1)) x_α(u)` and its conjugation of root
groups), built from the integrable-module actions of 3.2 and proved independent of lifts, with the
specified central kernel comparisons; standard Borel `B^+` and parabolics `P_J`; root-group
injectivity, torus and root-group intersection, and the Bruhat and Birkhoff decompositions (Kac,
§3.8 for the exponentials; Garland §§7–8 for the representation-theoretic construction in the affine
case). No valued-field masure or analytic Lie-group assertion is inferred. *Needs:* 3.2, 2.1, 1.2;
Mathlib `AlgebraicGeometry.Scheme`.

**Checks.**

- Type `A_1`: the group is `SL_2`; `s_α(1) = [[0,1],[−1,0]]`.
- Affine `A_1^(1)`: the derived group of Layer 8 maps onto `SL_2(ℂ[t,t^(−1)])`.
- The empty index set: the group is the torus `T`.

### 7.2 Finite Schubert schemes and Bott–Samelson resolutions

Construct the flag ind-space from the finite Bruhat pieces `X_w`, the closures of `B^+ w B^+/B^+`,
the reduced-word Bott–Samelson maps `Z_(w) → X_w`, scheme structures, projectivity and boundary
comparisons. For dominant `λ` use the stabilizer parabolic of the highest line of `L(λ)` and the
orbit map of each finite piece into the projectivization of the finite-dimensional Demazure span
`U(b^+)·v_(wλ)`, so projective coordinates and Cartier divisors live on finite-dimensional schemes.
Pin the sign convention: with `B^+` killing the highest vector, the tautological line has fibre weight
`λ` and `O(1)` has weight `−λ`; an extremal coordinate `p_τ` is a restricted-dual covector pairing to
`1` with the chosen extremal vector `v_(τλ)`. Compare `B^+` with SchubertGeometry's opposite-Borel
convention by Chevalley opposition without a longest element. Compare every finite-type piece with the
existing finite flag owners. *Needs:* 7.1, 3.1, 3.4; SchemeAndStackFoundations §5.1.

**Checks.**

- Type `A_1`: `X_s = ℙ^1`, `O(1)` of weight `−ω` is `O_(ℙ^1)(1)`.
- Affine `A_1^(1)`, `w = s_0`: `X_(s_0) ≅ ℙ^1` inside the ind-space of `L(Λ_0)`.
- Demazure spans are finite-dimensional even though `L(Λ_0)` is not: `U(b^+) v_(s_0 Λ_0)` is
  two-dimensional.

### 7.3 The Chevalley–Pieri formula

For the Schubert variety `X_w` and a dominant `λ`, prove that the divisor of the extremal section
`p_(wλ)` of the line bundle `L_λ` restricted to `X_w` equals `Σ_β |⟨wλ, β^∨⟩| [X_(s_β w)]`, the sum
over positive real roots `β` with `s_β w < w` and `ℓ(s_β w) = ℓ(w) − 1`; the Weyl element in the
coefficient is `w`, the Schubert variety's own, and writing `s_β w = w s_γ` with `γ = −w^(−1)β > 0` the
coefficient is `⟨λ, γ^∨⟩`, SchubertGeometry S7's form. Hence
`c_1(L_λ) ∩ [X_w] = Σ_β ⟨λ, γ_β^∨⟩ [X_(s_β w)]` in the Chow group of `X_w` (Kumar, *Kac–Moody
groups, their flag varieties and representation theory*, Chapter 11, the Chevalley formula;
Kostant–Kumar, *The nil Hecke ring and cohomology of G/P for a Kac–Moody group G*, 1986). Route: pull
the section back to a reduced-word Bott–Samelson resolution; for each prime word-boundary divisor
construct its rank-one transverse chart at the generic point, identify the local parameter and the
order of the section as a unit times a power of the parameter; compare the orders with the root and
coroot pairings in the declared Borel convention; push the divisor cycle down along the proper
resolution with the generic residue-field degrees and the vanishing of contracted divisors
(SchemeAndStackFoundations §5.2); conclude with the Cartier–Weil comparison and the first-Chern
projection formula (§§5.1, 5.3). Boundary components are not assumed Cartier; no Schubert-normality
theorem is assumed; properness is retained for every pushforward. *Needs:* 7.2, 2.2, 2.3;
SchemeAndStackFoundations §§5.1–5.3; SchubertGeometry S7.

**Checks.**

- Type `A_1`, `w = s`, `λ = nω`: `s_α s = 1`, coefficient `|⟨sλ, α^∨⟩| = n`, so the divisor of
  `p_(−nω)` on `ℙ^1` is `n` times the point `X_1`: the degree of `O(n)`.
- Type `A_2`, `w = s_1 s_2`, `λ = ω_1`, `wλ = −ω_2`: the boundary components are `X_(s_1)`, with
  `β = θ` and coefficient `|⟨−ω_2, θ^∨⟩| = 1`, and `X_(s_2)`, with `β = α_1` and coefficient
  `|⟨−ω_2, α_1^∨⟩| = 0`; the zero coefficient must be kept, and `X_(s_2)` is contracted to a point by
  the orbit map into `ℙ(L(ω_1)) = ℙ^2`.
- Affine `A_1^(1)`, `w = s_1 s_0`, `λ = Λ_0`, `wΛ_0 = Λ_0 − α_0 − 2α_1`: the boundary components are
  `X_(s_1)`, with `β = α_0 + 2α_1`, `β^∨ = h_0 + 2h_1` and coefficient `|1 + 2 − 4| = 1`, and
  `X_(s_0)`, with `β = α_1` and coefficient `|0 + 2 − 4| = 2`; the `γ` form gives the same values
  `⟨Λ_0, h_0⟩ = 1` and `⟨Λ_0, h_1 + 2h_0⟩ = 2`.

### Examples

`ℙ^1`, the flag variety of `SL_3`, and the first affine Schubert varieties of `A_1^(1)`.

### Dependencies

Layers 1–3; SchemeAndStackFoundations §§5.1–5.3; SchubertGeometry S7; Mathlib schemes.

## Layer 8: the untwisted derived group and polynomial loops (KM8A)

### 8.1 Polynomial loop groups on complex points

Let `G_sc` be the pinned simply connected split group scheme of ReductiveGroups Layer 9, simple with
Lie algebra `g`, finite root datum `(X, Φ, Y, Φ^∨)`, Borel `B^+` and root subgroups `x_α`. Define the
polynomial loop group `G_sc(ℂ[t,t^(−1)])` and the positive loop group `G_sc(ℂ[t])` as the points of
`G_sc` over these ℂ-algebras (ReductiveGroups Layer 0), the root elements `x_α(u t^n)` for `u ∈ ℂ`,
`n ∈ ℤ`, the torus `T(ℂ)`, the evaluation `ev_0 : G_sc(ℂ[t]) → G_sc(ℂ)` at `t = 0` and the Iwahori
subgroup `I = ev_0^(−1)(B^+(ℂ))`. Prove that `G_sc(ℂ[t,t^(−1)])` is generated by the `x_α(u t^n)`, and
satisfies the relations of Garland's presentation of the Chevalley group over `𝒮 = k[t,t^(−1)]`
(Garland §10, lines 1800–1814: the relations (A), (B), (C) and the identification with the
`𝒮`-points), prove the affine Bruhat decomposition `G_sc(ℂ[t,t^(−1)]) = ⊔_(w ∈ W_aff) I ẇ I` over the
affine Weyl group with the real-root conjugation formulas `t^μ x_α(u t^n) t^(−μ) = x_α(u t^(n+α(μ)))`
for `μ ∈ Y` (Garland §§11 and 13–14, Theorem 14.10, through the image of the Tits system of the
central extension), and deduce that `G_sc(ℂ[t])` is generated by `I` and the finite negative simple
root subgroups, since `G_sc(ℂ[t]) = ev_0^(−1)(G_sc(ℂ))` and `G_sc(ℂ) = ⊔_(w ∈ W) B^+ ẇ B^+`. Only
complex points are treated; no functorial statement over other coefficient rings is made. *Needs:*
1.5, 2.1; ReductiveGroups Layers 0 and 9.

- The affine positive-root bounds: `x_α(u t^n) ∈ I` iff `n ≥ 0` for `α > 0` and `n ≥ 1` for `α < 0`.
- `I ∩ G_sc(ℂ) = B^+(ℂ)` and `I` contains the kernel of `ev_0`.

**Checks.**

- `SL_2`: `x_α(u t^n) = [[1, u t^n],[0,1]]`, `x_(−α)(u t^n) = [[1,0],[u t^n,1]]`; the matrix
  `[[t,0],[0,t^(−1)]] = x_α(t) x_(−α)(−t^(−1)) x_α(t) · x_α(−1) x_(−α)(1) x_α(−1)` is a product of root
  elements, so the torus of `ℂ[t,t^(−1)]`-points is in the generated subgroup.
- `SL_2`: the Iwahori `I` is the set of matrices `[[a,b],[c,d]]` in `SL_2(ℂ[t])` with `c(0) = 0`;
  `[[0,1],[−1,0]] ∉ I` and `[[1,0],[t,1]] ∈ I`.
- A torus `𝔾_m`: `𝔾_m(ℂ[t,t^(−1)]) = ℂ^× × t^ℤ`, not generated by any root element, which is why
  generation is asserted for the simply connected simple `G_sc` only.

### 8.2 The homomorphism from the minimal derived group

Over ℂ take the untwisted affine derived datum of `G_sc`: the affine simple coroots are independent,
the central coroot `c = Σ a_i^∨ h_i` is primitive, and no degree or rotation torus is in the derived
group. Construct the homomorphism from Layer 7's minimal derived affine group to `G_sc(ℂ[t,t^(−1)])` on
generators: `x_(α+nδ)(u) ↦ x_α(u t^n)` for finite roots `α` and `n ∈ ℤ`, finite simple coroots to the
constant coroots, `h_0 ↦ −θ^∨` on cocharacters with `θ` the highest finite root. Pin the highest-root
root-group signs by the rank-one Chevalley relations; prove the real-root, torus, prenilpotent
commutator and Weyl-lift relations and independence of words (Garland §§7–8 and Lemma 10.1; Kac,
Theorem 7.4 at the Lie algebra level). The root-group formulas alone do not construct a homomorphism.
*Needs:* 8.1, 7.1, 1.5.

**Checks.**

- `x_(−θ+δ)(u) = x_(−θ)(ut)` and `x_(θ−δ)(v) = x_θ(v t^(−1))`: differentiating their commutator
  relation reproduces `h_0 ↦ K − θ^∨` of 1.5.
- `SL_2`: `x_(α_1+nδ)(u) = [[1, u t^n],[0,1]]`, `x_(−α_1+nδ)(u) = [[1,0],[u t^n, 1]]`.
- The degree torus `t ↦ at` is not in the image: it acts on `ℂ[t,t^(−1)]` and belongs to the rotation
  extension.

### 8.3 Image and central kernel

Prove the image is the whole polynomial loop group `G_sc(ℂ[t,t^(−1)])`, by the generation statement of
8.1, and the kernel is exactly the central `ℂ^×` supplied by `c`, with the inclusion, injectivity and
exactness equations, using the real-root presentation of 7.1 and the affine Bruhat decomposition of
8.1, not a splitting of the finite Weyl normalizer (Garland (11.3)–(11.5): the kernel lies in the
torus; §12, Lemma 12.19 and Theorems 12.24 and 12.26: the kernel is generated by the symbols
`b_α(σ,τ)`, identified with the tame symbol; Kumar, Chapter 13, for the minimal-group form). For a
product of simple components construct one kernel per component. The degree torus belongs to the
semidirect extension by loop rotations and is not mapped into `G_sc(ℂ[t,t^(−1)])`. Give the
change-of-parameter and inverse-coordinate transports with their signs. *Needs:* 8.2, 8.1.

**Checks.**

- `SL_2`: the element `h_0(a) h_1(a)`, `a ∈ ℂ^×`, of the derived torus maps to
  `(−θ^∨)(a) · θ^∨(a) = 1`, so the cocharacter `c = h_0 + h_1` spans the kernel, a central `ℂ^×`.
- A product `SL_2 × SL_2`: the kernel is `ℂ^× × ℂ^×`, one factor per component.
- The map is not injective on the torus: `T_der` has rank `ℓ + 1` while the image torus has rank `ℓ`.

### 8.4 Iwahori, parabolic and global-form dictionary

Identify the affine Borel of the derived group with the inverse image of the Iwahori `I` of 8.1 under
the map of 8.2, and the standard parabolic omitting the extending node with the inverse image of
`G_sc(ℂ[t])`; on a product omit every component's extending node. Prove the maps and kernels on these
subgroups and on the resulting coset spaces `G_sc(ℂ[t,t^(−1)])/I` and `G_sc(ℂ[t,t^(−1)])/G_sc(ℂ[t])`,
before comparing finite Bruhat pieces with Layer 7. Maximality is asserted only for an irreducible
affine component. For a connected reductive target `G` construct the induced maps through its derived
central isogeny and central torus and identify image, kernel and component maps on the lattice data of
its root datum: `Y`, `Q^∨` and `Y/Q^∨`; a simply connected derived loop group need not cover all
components of an adjoint or reductive loop group, `SL_2 → PGL_2` missing the parity component. Do not
replace `Y` by `Q^∨`, assert an integral central or derived splitting, or infer a universal `ℂ^×`
kernel for a different global form. The degree torus acts by `t ↦ at` and belongs to the semidirect
extension by loop rotations. *Needs:* 8.3, 8.1, 7.2; ReductiveGroups Layer 9.

**Checks.**

- `SL_2`: the inverse image of `I` is the affine Borel generated by `T` and the root groups of
  `α_1`, `−α_1 + nδ` (`n ≥ 1`) and `α_1 + nδ` (`n ≥ 0`).
- `PGL_2(ℂ[t,t^(−1)])` has two components indexed by `Y/Q^∨ = ℤ/2`; the image of the derived
  `SL_2`-loop group is the identity component.
- A torus target `G = 𝔾_m`: no extending node, the loop group is `ℂ[t,t^(−1)]^×`, treated through
  the torus functor directly.

### Examples

`SL_2(ℂ[t,t^(−1)])` and its central extension; the parity component of `PGL_2`.

### Dependencies

Layers 1 and 7; ReductiveGroups Layers 0 and 9; Garland §§7–14.

## Layer 9: worked comparisons (KM9)

### 9.1 The reference computations

Give the empty index set with an independent central enlargement; finite `A_1` and `A_2` comparisons
including the two adjoint zero weights; the singular affine `A_1^(1)` realization with a positive-level
highest-weight module of infinite dimension and finite weight pieces; and an indefinite rank-two
matrix with `a_ij a_ji > 4`, infinite Weyl group and finite Bruhat intervals. Compute finite initial
root and weight truncations, path strings and character coefficients with their truncation bounds. In
non-simply-laced rank two test the orientation `a_ij = α_j(h_i)` and the symmetrizer against the
transported form of 1.3. Compare the finite-type specialization of Layer 1's Chevalley generators and
Kostant's integral form with ReductiveGroups 9A's full reductive integral enveloping form on the actual
lattices `X, Y`; this comparison keeps its finite-type hypotheses and asserts no symmetrizable
imaginary-root integral PBW theorem. *Needs:* Layers 0–8; ReductiveGroups 9A.

**Checks.**

- `B_2` with `A = [[2,−2],[−1,2]]`, `d = (1,2)`: `(α_1,α_1) = 2`, `(α_2,α_2) = 4`,
  `(α_1,α_2) = d_1 a_12 = −2 = d_2 a_21`, and `s_1(α_2) = α_2 − a_12 α_1 = α_2 + 2α_1`; the opposite
  orientation gives `α_2 + α_1`, which has the wrong length.
- Indefinite `[[2,−3],[−3,2]]`: the Weyl group is infinite dihedral, `[1, s_0 s_1]` has four elements,
  and the imaginary cone contains `α_0 + α_1`.
- `A_2`: the two adjoint zero weights of `L(ω_1 + ω_2)` appear as two paths (6.2), two weight vectors
  `[e_1,f_1]` and `[e_2,f_2]` (3.1), and the two-dimensional weight space of the Weyl–Kac formula
  (4.4) consistently.

### Examples

The whole list above.

### Dependencies

Every earlier layer; ReductiveGroups 9A.

## Downstream consumers

- QuantumEnvelopingAlgebras consumes Layer 0's realization and lattices `P`, `Y` for its generic
  Drinfeld–Jimbo algebra.
- KacMoody, Part II consumes Layers 0–6 for quantum integrable modules, crystal bases, the strict
  comparison `B_path(λ) ≃ B_q(λ)` and the finite-type integral comparison with Lusztig's divided-power
  form.
- FormalConnectionsOpers Layer 3A names Layer 8 as the owner of the minimal-group comparison and
  consumes nothing here; it is later in the merge order, and the identification of its loop functors at
  `R = ℂ` with Layer 8's complex-point groups is stated on its side.
- TensorProductCombinatorics Layer 8 is later in the merge order; the identification of Layer 6's
  type-A path crystal with its tableau crystal is stated on its side.
- SchubertGeometry S4 and S7 are the finite comparison cases of Layers 5–7; nothing there consumes this
  roadmap.

## References

- V. G. Kac, *Infinite-dimensional Lie algebras*, third edition, Cambridge University Press, 1990:
  Proposition 1.1, Theorem 1.2, Proposition 1.6, §1.3, Lemma 2.1, Theorem 2.2, §2.5, Theorem 2.6,
  §§3.5–3.9, Lemma 3.11, Propositions 3.12, 3.13, Propositions 5.1, 5.2, 5.8, §6.2, Theorem 7.4,
  §§9.1, 9.2, 9.4, Theorem 9.11, §10.1, Theorems 10.4, 10.7, Chapter 12.
- C. Lenart and A. Postnikov, *A combinatorial model for crystals of Kac–Moody algebras*, arXiv
  math/0502147v4: §3 (Proposition 3.2, Theorem 3.3 and Corollary 3.4, Stembridge's admissible
  systems), §9 (Littelmann's root operators, the monotone two-cut form, independence of the initial
  dominant path, the character identity (9.2), the Kashiwara–Lakshmibai–Joseph theorem), §10.
- R. Chirivì, X. Fang and P. Littelmann, arXiv 2203.12992v1: Definition 2.1 and §7.1 (the bond, the
  gcd condition and its attribution to Dehy).
- Y. Kanakubo, arXiv 2407.19622v1: §§2–3 (crystal axioms, strict morphisms, LS paths and `a`-chains).
- D. Sagaki, lecture abstract (xmath.ous.ac.jp workshop page): the distinction between dominant LS
  paths and quantum or semi-infinite LS paths.
- H. Garland, *The arithmetic theory of loop groups*, Publ. Math. IHÉS 52 (1980), 5–136 (Numdam):
  §§7–8 (the Chevalley group `G^λ` and its Iwahori subgroup), §10 (the presentation of the Chevalley
  group over `k[t,t^(−1)]`, Lemma 10.1), §11 ((11.3)–(11.5)), §12 (Lemma 12.19, Theorems 12.24 and
  12.26: the central extension of the loop group and the tame symbol), §§13–14 (the Tits system,
  Theorem 14.10).
- P. Littelmann, *A Littlewood–Richardson rule for symmetrizable Kac–Moody algebras*, Invent. Math.
  116 (1994), 329–346; *Paths and root operators in representation theory*, Ann. of Math. 142 (1995),
  499–525. Cited by locator; the statements used are those restated in Lenart–Postnikov §§3 and 9.
- J. R. Stembridge, *Combinatorial models for Weyl characters*, Adv. Math. 168 (2002), 96–131, as
  restated in Lenart–Postnikov §3.
- S. Kumar, *Kac–Moody groups, their flag varieties and representation theory*, Progress in
  Mathematics 204, Birkhäuser, 2002: Chapter 11 (the Chevalley formula), Chapter 13 (affine Kac–Moody
  groups and loop groups). Cited by locator.
- B. Kostant and S. Kumar, *The nil Hecke ring and cohomology of G/P for a Kac–Moody group G*, Adv.
  Math. 62 (1986), 187–237. Cited by locator.
