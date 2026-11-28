# Roadmap: nilmanifolds, polynomial sequences and nilsequences

**Summary.** A *nilsequence* is a function `n ↦ F(g(n)Γ)` on `ℤ^σ`, where `G/Γ` is a compact
quotient of a simply connected nilpotent Lie group `G` by a lattice `Γ`, `g : ℤ^σ → G` is a
polynomial sequence and `F : G/Γ → ℂ` is Lipschitz. Nilsequences are the obstructions to
uniformity in the inverse theory of the Gowers norms, and every quantitative statement about them
needs a measure of the complexity of `G/Γ`, of the size of `F` and of the coordinates in which `g`
is written. This roadmap builds that theory with explicit bounds, in the setting of Green and Tao:
nilpotent Lie groups realised on their Lie algebras through the Baker–Campbell–Hausdorff (BCH)
product, filtrations indexed by degree, multidegree or degree–rank, lattices presented by rational
data of bounded height, and the metrics, polynomial sequences, characters and Lipschitz functions
built from them.

The headline theorems are the following.

- **Lazard–Leibman.** For a group `G` with a filtration `(G_i)` indexed by an ordering `I` and an
  abelian group `H` with an `I`-filtration, the maps `g : H → G` whose iterated derivatives
  `∂_{h₁} ⋯ ∂_{h_m} g` take values in `G_{i₁ + ⋯ + i_m}` for `h_j ∈ H_{i_j}` form a group under
  pointwise multiplication and are stable under composition with polynomial maps; for a full
  `ℕ`-filtration of finite degree, the polynomial maps on `ℤ^σ` are exactly the products
  `∏_j g_j^{binom(n, j)}` with `g_j ∈ G_{|j|}`.
- **Logarithmic coordinates.** For the BCH group of a real nilpotent Lie algebra `𝔤` with an
  `ℕ`-filtration `F`, a map `g : ℤ^σ → G` is a polynomial sequence of weights `w` if and only if
  `log g(n) = Σ_a n^a v_a` with `v_a ∈ F_{Σ_σ w_σ a_σ}`; the polynomial sequences form the BCH
  group of the Lie algebra of such polynomials.
- **Rational nilmanifolds.** If `L` is a `ℚ`-form of `𝔤` with basis `X` and a filtration of
  degree `s`, and `Γ` is a subgroup of the rational BCH group with `q · ⊕ℤXᵢ ⊆ Γ ⊆ q⁻¹ · ⊕ℤXᵢ`,
  then `Γ` is a lattice in `G`, `G/Γ` is compact, and `G/Γ` has a Mal'cev basis adapted to the
  filtration whose vectors and structure constants are rationals of height at most `C M^E`, where
  `M` bounds `q` and the heights of the data and `C`, `E` depend only on `dim G` and `s`.
- **Metrics.** Green–Tao's right-invariant metric on `G` and its quotient metric on `G/Γ` are
  metrics inducing the topologies; they are comparable to Mal'cev coordinates on bounded sets, left
  translation by `g` is Lipschitz with a constant polynomial in `M` and the size of `g`, and `G/Γ`
  has diameter at most `C M^E` and is covered by `(C M^E/δ)^{dim G}` balls of radius `δ`.
- **Nilsequences and nilcharacters.** Nilsequences of bounded complexity form an algebra up to a
  polynomial loss; every Lipschitz function on a nilmanifold of degree `s` is uniformly
  approximated by a short sum of functions with a vertical frequency; every vertical frequency is
  the frequency of a vector-valued nilcharacter of polynomially bounded dimension and Lipschitz
  norm; and so every nilsequence of degree `s` is uniformly close to a short sum of products of a
  nilcharacter of degree `s` with nilsequences of degree `s − 1`. On `ℤ/N` these statements hold
  for nilsequences evaluated at the representatives `0, …, N − 1`.

The roadmap sits between these neighbours:

- **NilpotentLieHeightsAndFiltrations** supplies the filtrations of Lie algebras, adapted and
  nesting bases, heights and grids, product polynomials in coordinates and coordinates of the
  second kind; this roadmap adds groups, lattices, quotients, metrics and sequences.
- **ScatteringDiagrams** §0.4 supplies the BCH group of a nilpotent Lie algebra; **RepresentationTheory/LieGroups**
  §5.3 identifies it with the simply connected Lie group of `𝔤`, and **ComplexKahlerGeometry** §8.2
  supplies Mal'cev rationality for an arbitrary lattice, which shows that the rational
  presentations used here cover every nilmanifold.
- **PolynomialOrbitsAndCubeGroups** (qualitative equidistribution, cube nilmanifolds) and
  **NilsequenceEquidistribution** and **GowersInverseTheorem** (quantitative equidistribution,
  factorisation and the inverse theorem of Leng, Sah and Sawhney) consume everything here.

**How to read the build.**

| Layer | Content |
|---|---|
| 0 | Filtered groups, polynomial maps, Host–Kra cube groups, Lazard–Leibman, Taylor expansions and horizontal Taylor coefficients |
| 1 | Nilpotent Lie groups in BCH coordinates: topology, filtrations, polynomial maps in logarithmic coordinates |
| 2 | Rational filtered nilmanifolds: lattices, Mal'cev bases, Mal'cev presentations, constructions |
| 3 | Chain metrics, the Green–Tao metric on `G` and `G/Γ`, Lipschitz functions and partitions of unity |
| 4 | Polynomial orbits: coordinates, basepoint normalisation, rational points, horizontal and vertical characters |
| 5 | Nilsequences: complexity, the nilsequence algebra, vertical Fourier decomposition, nilcharacters |
| 6 | Nilsequences on `ℤ/N` |

Layer 0 is pure group theory and needs no topology. Layers 1–2 combine it with the BCH group and
NilpotentLieHeightsAndFiltrations. Layers 3–6 are stated for a *Mal'cev presentation* (2.4), the
coordinate form of a filtered nilmanifold, so that they apply equally to every rational filtered
nilmanifold with an adapted Mal'cev basis.

## Conventions

1. **Scalars and carriers.** `L` is a finite-dimensional Lie algebra over `ℚ` of dimension `d`,
   and `𝔤 = ℝ ⊗[ℚ] L` its real form (NilpotentLieHeightsAndFiltrations, Convention 5). For a
   nilpotent Lie algebra `𝔞` of class at most `s` over a commutative `ℚ`-algebra, *BCHGroup* `𝔞`
   is the group of ScatteringDiagrams §0.4 on the carrier `𝔞`, with `x⁻¹ = −x`, `xⁿ = n x`, and
   `log` the identity of the carrier. `G = BCHGroup 𝔤` carries the topology of the
   finite-dimensional real vector space `𝔤`, and `G_ℚ = BCHGroup L` maps into `G` by `x ↦ 1 ⊗ x`
   (a group homomorphism by *BCHGroup.map* and restriction of scalars).
2. **Orderings and filtrations.** An *ordering* is GTZ's (Definition 6.7): a commutative monoid
   `I` with a partial order in which `0` is least, addition is monotone and initial segments are
   finite. The three used are `ℕ`, `σ → ℕ` with the product order, and the sector
   `DR = {(d, r) | r ≤ d}` with the lexicographic order, as in NilpotentLieHeightsAndFiltrations,
   Convention 7. An `I`-filtration of a group `G` is a family of subgroups `G_i`, antitone in `i`,
   with `⁅G_i, G_j⁆ ≤ G_{i+j}` (Mathlib's commutator of subgroups; GTZ, Definition 6.8). It has
   *degree at most `d`* if `G_i = ⊥` for `i ⋠ d`. No condition is imposed on `G_0`; an
   `ℕ`-filtration with `G_0 = G_1 = G` is called *full*, and the hypothesis is stated where used.
   The degree–rank axioms are GTZ's: `G_{(0,0)} = G` and `G_{(d,0)} = G_{(d,1)}` for `d ≥ 1`.
3. **Derivatives.** For a map `g : H → G` from an additive commutative group,
   `∂_h g (n) = g(n + h) * (g n)⁻¹` (GT, Definition 1.8; GTZ, Definition 6.18). Iterated
   derivatives are applied right to left: `∂_{h₁} ⋯ ∂_{h_m} g = ∂_{h₁} (∂_{h₂} ⋯ ∂_{h_m} g)`.
4. **Domains.** `ℤ^σ` means `σ → ℤ` for a finite type `σ`. Its *weighted filtration* for weights
   `w : σ → ℕ` with all `w σ ≥ 1` is `(ℤ^σ)_0 = ℤ^σ` and `(ℤ^σ)_i = span_ℤ {e_σ | w σ ≥ i}` for
   `i ≥ 1` (`weightedFiltration w`); for `w = 1` it is GTZ's degree filtration (Definition 6.17).
   The *multidegree filtration* (`multidegreeFiltration σ`) is GTZ's: `(ℤ^σ)_0 = ℤ^σ`, `(ℤ^σ)_{e_σ} = ℤ e_σ`, and `0` elsewhere.
   `binom(n, j) = ∏_σ Ring.choose (n σ) (j σ)` and `|j|_w = Σ_σ w σ · j σ`.
5. **Nilmanifolds.** `G/Γ` is the space of left cosets `xΓ`, Mathlib's `G ⧸ Γ` with the quotient
   topology; `G` acts on the left. Metrics on `G` are right-invariant, so that
   `d(xΓ, yΓ) = inf_{γ ∈ Γ} d(x, yγ)` is well defined.
6. **Heights and complexity.** Heights are `Height.mulHeight₁` on `ℚ` (`max(|num|, den)`, GT,
   Definition 2.3), as in NilpotentLieHeightsAndFiltrations, Convention 2. A complexity parameter
   is a natural number `M ≥ 2`. "A bound `C M^E`" means: there are natural numbers `C`, `E`
   depending only on `d`, `s` (and `|σ|` where a domain `ℤ^σ` appears) such that the statement
   holds for all data of complexity at most `M`; theorems are stated `∃ C E, ∀ …`.
7. **Norms.** `|t| = max_i |t_i|` on `ℝ^d` (Mathlib's sup norm on `Fin d → ℝ`). For
   `F : X → ℂ` on a metric space, `‖F‖_Lip = ‖F‖_∞ + sup_{x ≠ y} |F x − F y| / d(x, y)` (LSS,
   Definition 3.4); for `F : X → ℂ^D` it is the maximum over components. Lipschitz conditions are
   spelled with Mathlib's `LipschitzWith` or as explicit inequalities, never with a new predicate.
8. **Phases.** `e(t) = exp(2πit)`. A character of `ℝ^m/ℤ^m` is `t ↦ e(k · t)` with `k ∈ ℤ^m`, and
   `|k| = max_i |k_i|`.
9. **`ℤ/N`.** A function on `ZMod N` (`N ≥ 1`) is evaluated through the representatives
   `ZMod.val x ∈ {0, …, N − 1}`. A nilsequence on `ZMod N` is `x ↦ ψ(x.val)` for a nilsequence `ψ`
   on `ℤ`; it need not be `N`-periodic as a function on `ℤ`.
10. **Names.** Names in code font are declarations of Mathlib, of the pinned Tau Ceti, of
    [`Suggested.lean`](Suggested.lean) (in the namespace
    `TauCetiRoadmap.NilmanifoldsAndNilsequences`), or of the Suggested files of the cited
    roadmaps, named there. Names in italics are proposed names of targets not prototyped. This
    README is the specification.

## Layer 0: filtered groups and polynomial maps

Everything in this layer is about abstract groups and holds without topology.

### 0.1 Filtrations

Define `GroupFiltration I G` (Convention 2) and `AddGroupFiltration I H` for an additive
commutative group, where the commutator condition is automatic. Prove:

- the *lower central filtration* `G_n = lowerCentralSeries (n − 1)` (with `G_0 = G`; Mathlib's
  `(⊤ : Subgroup G).lowerCentralSeries` is 0-based) is a full `ℕ`-filtration, and every full
  `ℕ`-filtration contains it termwise; a full filtration of degree at most `s` makes `G`
  nilpotent of class at most `s`, and its top layer `G_s` is central;
- products, pullbacks along homomorphisms, pushforwards along surjections, quotients by normal
  subgroups and intersections with a subgroup are filtrations (GTZ, Examples 6.13 and 6.14);
- the *shifted filtration* `G^{+i}_j = G_{i+j}` (GTZ, (B.1)) is an `I`-filtration, and
  `⁅G_j, G^{+i}_k⁆ ≤ G^{+i}_{j+k}`;
- the *rescaled filtration* `G^{(k)}_i = G_{⌈i/k⌉}` of an `ℕ`-filtration is an `ℕ`-filtration of
  degree at most `k s`;
- an `(σ → ℕ)`-filtration `F` gives the total-degree `ℕ`-filtration
  `i ↦ ⨆_{|a| ≥ i} F_a`, and an `ℕ`-filtration gives the multidegree filtration
  `a ↦ G_{|a|}` (GTZ, Example 6.11); a degree–rank filtration gives the `ℕ`-filtration
  `d ↦ G_{(d,0)}`.

**Checks.**

- On the Heisenberg group of unitriangular `3 × 3` real matrices the lower central filtration is
  `G_1 = G`, `G_2 = Z(G)`, `G_3 = 1`.
- `G_0 = G`, `G_i = 1` for `i ≥ 1` is an `ℕ`-filtration of degree `0` of any group, abelian or
  not; it is not full, which is why fullness is a separate hypothesis.

*Needs:* Mathlib `Subgroup.lowerCentralSeries`, `Subgroup.commutator` (`⁅H, K⁆`), `Group.IsNilpotent`.

### 0.2 Polynomial maps

For an `I`-filtered additive commutative group `H` and an `I`-filtered group `G`, `g : H → G` is
*polynomial* (`IsPolynomialMap`) if `∂_{h₁} ⋯ ∂_{h_m} g (n) ∈ G_{i₁ + ⋯ + i_m}` for all `m ≥ 0`,
`i_j ∈ I`, `h_j ∈ H_{i_j}` and `n ∈ H_0` (GTZ, Definition 6.18 and Definition B.1). Prove the
unravelled forms (GTZ, after Definition 6.18):

- for the degree filtration on `ℤ^σ` and an `ℕ`-filtration: `∂_{h₁} ⋯ ∂_{h_m} g ∈ G_m` for all
  `h_j`; for the weighted filtration, derivatives along `e_σ` count `w σ`;
- for the multidegree filtration: `∂_{e_{σ₁}} ⋯ ∂_{e_{σ_m}} g ∈ G_{e_{σ₁} + ⋯ + e_{σ_m}}`;
- for a degree–rank filtration and `ℤ` with GTZ's degree–rank filtration
  (`ℤ_{(0,0)} = ℤ_{(1,0)} = ℤ`, `0` elsewhere), polynomial maps are exactly the polynomial maps
  for the `ℕ`-filtration `d ↦ G_{(d,0)}` (GTZ, (6.8));
- polynomial maps for an `ℕ`-filtration `F` on `ℤ^σ` with the degree filtration are the
  polynomial maps for the multidegree filtration `a ↦ F_{|a|}`, and polynomial maps for a
  multidegree filtration are polynomial for its total-degree filtration.

Prove the elementary examples (GTZ, Examples 2, 3 and 5 after Definition B.1): constants with
values in `G_0`, filtered homomorphisms, and the identification
`poly(H → G × G') = poly(H → G) × poly(H → G')`.

**Checks.**

- For `G = ℝ` (additive) with `G_i = ℝ` for `i ≤ s` and `0` after, the polynomial maps on `ℤ`
  are the restrictions of real polynomials of degree at most `s`; `n ↦ n^{s+1}` is not one.
- With the lower central filtration of the Heisenberg group, `n ↦ exp(nX) exp(nY)` is
  polynomial; for `G = ℝ` with `G_0 = G_1 = ℝ`, `G_2 = 0`, `n ↦ n²` is not.

*Needs:* 0.1.

### 0.3 Host–Kra cube groups and the Lazard–Leibman theorem

Define the *Host–Kra cube group* `HK_{i₁,…,i_m}(G)` as the subgroup of `G^{{0,1}^m}` generated
by the face elements `ι_{ω₀}(g)`, `g ∈ G_{Σ_{j ∈ ω₀} i_j}`, equal to `g` at `ω ⊇ ω₀` and to `1`
elsewhere (GTZ, Definition B.2; GT, Definition 6.3). Prove:

- **cube characterisation** (GTZ, Theorem B.3; GT, Proposition 6.5): `g` is polynomial if and
  only if, for every `m` and `i₁, …, i_m`, applying `g` coordinatewise maps
  `HK_{i₁,…,i_m}(H)` into `HK_{i₁,…,i_m}(G)`; the cube groups are defined for an arbitrary
  filtered group `H`, and an additive `H` is read multiplicatively;
- for the lower central filtration, `HK_{1,…,1}(G)` is generated by the side elements and the
  diagonal (GTZ, example after Definition B.2), and every element of `HK^k(G)` for a full
  `ℕ`-filtration has a unique factorisation along the upper faces in reverse lexicographic order
  (GT, Lemma 6.4);
- **Lazard–Leibman** (GTZ, Corollary B.4; GT, Proposition 6.2): polynomial maps form a group
  `poly(H → G)` (`polyMap`) under pointwise multiplication;
- **filtered Lazard–Leibman** (GTZ, Proposition B.6): `i ↦ poly(H → G^{+i})` is an
  `I`-filtration of `poly(H → G)` by normal subgroups;
- **composition** (GTZ, Corollary B.5): a composite of polynomial maps between filtered groups is
  polynomial; in particular translates `n ↦ g(n + h)`, dilates `n ↦ g(q n)`, and `g ∘ φ` for
  filtered homomorphisms `φ` are polynomial (GT, Corollary 6.8);
- **substitution:** if `P : ℤ^τ → ℤ^σ` is a polynomial map of degree at most `k` (each coordinate
  an integer-valued polynomial of total degree at most `k`) and `g` is polynomial for an
  `ℕ`-filtration `G` with the degree filtration on `ℤ^σ`, then `g ∘ P` is polynomial for the
  rescaled filtration `G^{(k)}`, by composition with `ℤ^σ` filtered by `ℤ^σ` in degrees `≤ k`;
- algebraic words: `(g, h) ↦ w(g, h)` is polynomial `G × G → G` for every word `w` (GTZ, example
  after Corollary B.5).

**Checks.**

- For `G` abelian with `G_i = G` for `i ≤ s`, `poly(ℤ → G)` is the group of maps
  `n ↦ Σ_{j ≤ s} binom(n, j) a_j`, under addition.

*Needs:* 0.2.

### 0.4 Taylor expansions

Prove (GTZ, Lemma B.9; GT, Lemma 6.7 for the coordinate form of 4.1): let `G` be an
`(σ → ℕ)`-filtered group of degree in a finite downset `J`, and complete the order on `J` to a
total order. Every polynomial map `g : ℤ^σ → G` for the multidegree filtration has unique
*Taylor coefficients* `g_j ∈ G_j`, `j ∈ J`, with `g(n) = ∏_{j ∈ J} g_j^{binom(n, j)}`, the
product taken in the chosen order; conversely every such product is polynomial. Deduce the
`ℕ`-filtered form through 0.2: for a full `ℕ`-filtration of degree at most `s` and the weighted
filtration on `ℤ^σ`, `g(n) = ∏_{|j|_w ≤ s} g_j^{binom(n, j)}` with `g_j ∈ G_{|j|_w}`. For
`σ = Unit`, `g_0 = g(0)` and `g_j ≡ ∂_1^j g(0)` modulo `G_{j+1}`.

**Checks.**

- In the Heisenberg group with `X = E₁₂`, `Y = E₂₃`, `Z = E₁₃` and the lower central
  filtration, `g(n) = exp(nX) exp(nY) = exp(nX + nY + n²Z/2)` has Taylor coefficients
  `g_0 = 1`, `g_1 = g(1) = exp(X + Y + Z/2)` and `g_2 = exp(Z)`: indeed
  `g(1)^n = exp(nX + nY + nZ/2)` and `n²/2 − n/2 = binom(n, 2)`.

*Needs:* 0.3; Mathlib `Ring.choose`; Tau Ceti `TauCeti.binomialPolynomialBasis`,
`TauCeti.mem_ringChooseSpan_X_iff_existsUnique` (abelian case).

### 0.5 Horizontal Taylor coefficients

For a full `ℕ`-filtration construct the *canonical degree–rank filtration*: `G_{(d,r)}` is
generated by `G_{d+1}` and the iterated commutators of at least `max(r, 1)` elements
`g_k ∈ G_{i_k}` with `i_k ≥ 1` and `Σ i_k = d`; prove that it is a degree–rank filtration with
`G_{(d,0)} = G_{(d,1)} = G_d` (the group form of NilpotentLieHeightsAndFiltrations 4.2). For
`i ≥ 1` its layer `K_i = G_{(i,2)}` is `G_{i+1} · ∏_{0<j<i} ⁅G_j, G_{i−j}⁆`, a normal subgroup of
`G` contained in `G_i` with `G_i/K_i` abelian. Define the *horizontal space*
`Horiz_i(G) = G_i/K_i` (GTZ, Definition 9.6; for `i = 1` it is `G/G_2`; `K_i` is `horizKernel`).
For `g ∈ poly(ℤ → G)` define `Taylor_i(g) = ∂_1 ⋯ ∂_1 g (n) mod K_i` (`i` derivatives; at `n = 0`
this is `taylorCoeff`). Prove: it is independent of `n`; `g ↦ Taylor_i(g)` is a homomorphism
`poly(ℤ → G) → Horiz_i(G)` (GTZ, remark after Definition 9.6, from Corollary B.7); translates
have the same Taylor coefficients; and for `Γ ≤ G` with the induced filtration, `Taylor_i`
descends to `poly(ℤ → G)/poly(ℤ → Γ) → Horiz_i(G)/Horiz_i(Γ)`. For `H = ℤ^σ`, `Taylor_i(g)` is
the symmetric multilinear map `(h₁, …, h_i) ↦ ∂_{h₁} ⋯ ∂_{h_i} g(n) mod K_i`.

**Checks.**

- On `G = ℝ` with `G_i = ℝ` for `i ≤ s`, `Taylor_s(n ↦ α n^s) = s! α`.
- With the lower central filtration of the Heisenberg group, `Horiz_2 = 0`, so the two
  sequences `exp(nX)` and `exp(nY)`, each with `Taylor_2 = 0`, have product with `Taylor_2 = 0`,
  although the logarithm of the product has the term `n² Z/2`. The plausible wrong definition
  `G_i/G_{i+1}` would give `Taylor_2 = Z ≠ 0` for the product and fail to be a homomorphism.

*Needs:* 0.3, 0.4.

## Layer 1: nilpotent Lie groups in BCH coordinates

Let `𝔤` be a finite-dimensional real nilpotent Lie algebra of class at most `s` and
`G = BCHGroup 𝔤`.

### 1.1 The topological group

Prove: `G` is a topological group (the product is a polynomial map by
NilpotentLieHeightsAndFiltrations 7.3, the inverse is `−x`), Hausdorff, locally compact,
second countable and connected; `t ↦ t x` is a continuous one-parameter subgroup; a Lie
subalgebra is a closed connected subgroup and an ideal a closed normal subgroup; a real Lie
algebra homomorphism induces a continuous homomorphism (*BCHGroup.map*). The identity of the
carrier is an isomorphism of topological groups between `G` and the global BCH group of
RepresentationTheory/LieGroups §5.3, and through it `G` is the simply connected Lie group of `𝔤`.

*Needs:* ScatteringDiagrams §0.4; NilpotentLieHeightsAndFiltrations 7.3; RepresentationTheory/LieGroups
§5.3.

### 1.2 Group filtrations from Lie filtrations

Let `F` be an `I`-filtration of `𝔤` (`LieFiltration I ℝ 𝔤` of NilpotentLieHeightsAndFiltrations)
by Lie subalgebras. Prove that `i ↦ F_i` is an `I`-filtration of `G` (*LieFiltration.toGroup*):
for `x ∈ F_i`, `y ∈ F_j`, the group commutator `x ⋆ y ⋆ (−x) ⋆ (−y)` is `⁅x, y⁆` plus a finite
sum of brackets of `x` and `y` each containing both, hence lies in `F_{i+j}`. The lower central
filtration of `𝔤` gives the lower central filtration of `G`; a full `ℕ`-filtration of degree
at most `s`, a multidegree filtration and a degree–rank filtration (NilpotentLieHeightsAndFiltrations
3.1, 4.2, 4.3) give the corresponding group filtrations, with the same degree.

*Needs:* 1.1, 0.1; NilpotentLieHeightsAndFiltrations 3.1, 4.2, 4.3, 5.2.

### 1.3 Polynomial maps in logarithmic coordinates

Let `F` be a full `ℕ`-filtration of `𝔤` of degree at most `s` and `w : σ → ℕ` weights `≥ 1`.
NilpotentLieHeightsAndFiltrations 3.4 defines the Lie algebra *Rees F* of `w`-adapted polynomials
`P(t) = Σ_a t^a ⊗ v_a ∈ ℝ[t_σ] ⊗ 𝔤` with `v_a ∈ F_{|a|_w}`; it is nilpotent of class at most `s`.
Prove:

- **logarithmic description.** `g : ℤ^σ → G` is polynomial for the weighted filtration if and
  only if `g(n) = P(n)` for a (unique) `w`-adapted polynomial `P`, the coordinates of `g(n)`
  being read in the carrier `𝔤`;
- **the Lazard–Leibman group in coordinates.** Evaluation at the points of `ℤ^σ` is a group
  isomorphism from *BCHGroup* of the adapted polynomials onto `poly(ℤ^σ → G)`;
- **multidegree form.** For an `(σ → ℕ)`-filtration `F` with `F_0 = 𝔤`, polynomial maps for the
  multidegree filtration are the `P(n) = Σ_a n^a v_a` with `v_a ∈ F_a`;
- the shift `P(t) ↦ P(t + h)` and the dilations `t_σ ↦ λ_σ t_σ` (`λ ∈ ℤ^σ`) act on adapted
  polynomials by Lie algebra automorphisms, matching the translates and dilates of 0.3.

*Route:* "if": `∂_h` maps the adapted polynomials whose coefficients of `t^b` lie in
`F_{|b|_w + k}` into those with `k` replaced by `k + w σ` for `h = e_σ`, since `P(t + h) − P(t)`
raises the index and brackets with adapted polynomials preserve the shifted condition; "only if":
the Taylor expansion of 0.4 writes `g` as a product of `exp(binom(n, j) g_j)`, each adapted.

**Checks.**

- Heisenberg algebra with the lower central filtration, `σ = Unit`, `w = 1`:
  `exp(nX) ⋆ exp(nY) = nX + nY + (n²/2) Z`, and `Z/2 ∈ F_2` as required.

*Needs:* 1.2, 0.4; NilpotentLieHeightsAndFiltrations 3.4.

## Layer 2: rational filtered nilmanifolds

### 2.1 Definition and complexity

A *rational filtered nilmanifold* of degree `s` and dimension `d` (*RationalFilteredNilmanifold*)
consists of:

- a Lie algebra `L` over `ℚ` of dimension `d` and a full `ℕ`-filtration `F` of `L`
  (`LieFiltration ℕ ℚ L` with `F_1 = ⊤`) with `F_{s+1} = ⊥`;
- a basis `X : Basis (Fin d) ℚ L`;
- a subgroup `Γ` of `BCHGroup L` and an integer `q ≥ 1` with
  `scaledLattice X q ⊆ Γ ⊆ denomGrid X q` as subsets of `L` (both of NilpotentLieHeightsAndFiltrations).

This is GT's notion of a weak basis (Definition A.7) together with a filtration by rational
subgroups. The associated nilmanifold is `G/Γ_ℝ` with `G = BCHGroup (ℝ ⊗[ℚ] L)`, filtration
`G_i = ℝ ⊗ F_i` (1.2) and `Γ_ℝ` the image of `Γ` (Convention 1). It has *complexity at most `M`*
if `q ≤ M`, every structure constant `lieStructureConst X i j l` has height at most `M`, and every
`F_i` is spanned by vectors whose `X`-coordinates have height at most `M`.

The *multidegree* and *degree–rank* versions carry in addition an `(σ → ℕ)`-filtration with
`F_0 = L` of degree in a finite downset `J`, whose total-degree filtration is `F`, respectively a
`DegreeRankLieFiltration` `F'` of degree–rank at most `(s, r)` with `F'_{(i,0)} = F_i`; complexity
then also bounds the heights of spanning vectors of every layer (compare LSS, Definitions 3.5 and
3.8).

**Checks.**

- The torus: `L = ℚ^d` abelian, `F_1 = L`, `F_2 = 0`, `X` standard, `Γ = ℤ^d`, `q = 1`.
- The circle of degree `s`: `L = ℚ`, `F_i = ℚ` for `i ≤ s`, `Γ = ℤ`, `q = 1`; the polynomial
  phases `n ↦ α₀ + ⋯ + α_s n^s` are polynomial sequences in it (GTZ, Example 6.3).
- The Heisenberg nilmanifold: `L` with basis `X, Y, Z`, `[X, Y] = Z`, `Γ` the group generated
  by `X` and `Y` in `BCHGroup L`. Its elements are `aX + bY + (c + ab/2) Z` with `a, b, c ∈ ℤ`
  (the matrix form of NilpotentLieHeightsAndFiltrations 8.1), so `q = 2` works and `q = 1` does
  not: `X ⋆ Y = X + Y + Z/2 ∉ ℤ³`.

*Needs:* 1.2; NilpotentLieHeightsAndFiltrations 0.3 (`denomGrid`, `scaledLattice`), 2.1
(`lieStructureConst`), 3.1, 4.2.

### 2.2 The lattice

For a rational filtered nilmanifold of complexity at most `M`, prove:

- `Γ → Γ_ℝ` is injective, `Γ_ℝ` is discrete and closed, and `G/Γ_ℝ` is compact, Hausdorff and
  second countable; the projection `G → G/Γ_ℝ` is a covering map;
- **rational subgroups.** For every `i`, `Γ_ℝ ∩ G_i` is cocompact in `G_i` (GT, Definition 1.10),
  and more generally for every Lie subalgebra `L' ⊆ L` spanned by vectors of height at most `M`,
  `(L', F ∩ L', X', Γ ∩ L', q')` is a rational filtered nilmanifold of complexity at most `C M^E`
  for a suitable basis `X'` and `q'` (GT, Proposition A.10);
- **bounded representatives.** Every `x ∈ G` is `x = f ⋆ γ` with `γ ∈ Γ_ℝ` and every
  `X`-coordinate of `f` at most `C M^E` in absolute value.

*Route:* 2.3, and NilpotentLieHeightsAndFiltrations 7.4 for the grid estimates.

*Needs:* 2.1, 2.3; NilpotentLieHeightsAndFiltrations 7.4.

### 2.3 Mal'cev bases

A basis `X' = (X'_1, …, X'_d)` of `𝔤` is a *Mal'cev basis* for `G/Γ_ℝ` adapted to `(G_i)` (GT,
Definition 2.1) if `span(X'_{j+1}, …, X'_d)` is an ideal for every `j`, `G_i` is spanned by the
last `dim G_i` vectors, `t ↦ exp(t_1 X'_1) ⋆ ⋯ ⋆ exp(t_d X'_d)` is a bijection `ψ⁻¹ : ℝ^d → G`
(NilpotentLieHeightsAndFiltrations, `bijective_secondKind`), and `Γ_ℝ = ψ⁻¹(ℤ^d)`. It is
`Q`-rational if its structure constants are rationals of height at most `Q` (GT, Definition 2.4).
Prove:

- **existence with bounds** (GT, Proposition A.9): a rational filtered nilmanifold of complexity
  at most `M` has a Mal'cev basis adapted to `(G_i)` consisting of vectors of `L` whose
  `X`-coordinates have height at most `C M^E`; it is `C M^E`-rational, nesting
  (`IsNesting`) and adapted with monotone weights (`IsAdapted`);
- **converse** (GT, Lemma A.8 (ii)): if `X'` is a `Q`-rational Mal'cev basis adapted to a full
  filtration whose layers are spanned by `Q`-rational combinations of `X'`, then with
  `L = span_ℚ X'`, `Γ` the group of points with integer second-kind coordinates and some
  `q ≤ C Q^E`, one has a rational filtered nilmanifold of complexity at most `C Q^E`;
- the multidegree and degree–rank versions: an adapted Mal'cev basis exists for the total-degree
  filtration, respectively for the degree–rank filtration listed in lexicographic order (LSS,
  Definition 3.5), with the same bounds.

*Route:* the images of `Γ ∩ G_i` in the vector spaces `(F_i/F_{i+1}) ⊗ ℝ` are lattices containing
`q` times and contained in `q⁻¹` times the lattice of a height-bounded basis of the layer; take
triangular `ℤ`-bases of them relative to that basis (Tau Ceti `ZLattice.exists_basis_triangular`),
reduce their off-diagonal coefficients, lift to `Γ ∩ G_i` with bounded coordinates using
`scaledLattice X q ∩ F_{i+1} ⊆ Γ`, and list the logarithms of the lifts by increasing weight;
`span(X'_{j+1}, …, X'_d)` is an ideal because `⁅𝔤, F_i⁆ ⊆ F_{i+1}`.

*Needs:* 2.1; NilpotentLieHeightsAndFiltrations 1.2–1.4, 3.2, Layer 8; Tau Ceti
`ZLattice.exists_basis_triangular`.

### 2.4 Mal'cev presentations

A *Mal'cev presentation* of degree `s` and dimension `d` (`MalcevPresentation G d s`) of a group
`G` with a topology consists of a homeomorphism `ψ : G ≃ₜ ℝ^d`, a full `ℕ`-filtration `(G_i)`,
monotone weights `ω : Fin d → ℕ` with values in `[1, s]`, a subgroup `Γ` and polynomials
`P_l ∈ ℚ[t_{0,·}, t_{1,·}]` such that:

- `G_i = ψ⁻¹ {t | t_l = 0 whenever ω l < i}` for every `i`;
- `Γ = ψ⁻¹(ℤ^d)`;
- `ψ(x y)_l = P_l(ψ x, ψ y)`, with `P_l` of weighted degree at most `ω l` when `t_{0,i}` and
  `t_{1,i}` have weight `ω i` (hence of total degree at most `s`), and
  `P_l = t_{0,l} + t_{1,l} + Q_l` where `Q_l` involves only the variables of index `< l`.

Its *complexity* is the largest height of a coefficient of the `P_l`. Prove:

- a rational filtered nilmanifold of complexity at most `M`, with the Mal'cev basis of 2.3, gives
  a Mal'cev presentation of `BCHGroup (ℝ ⊗ L)` of complexity at most `C M^E` (GT, Lemmas A.2 and
  A.3; NilpotentLieHeightsAndFiltrations 8.1–8.2);
- in a Mal'cev presentation, `G` is a topological group, nilpotent of class at most `s`; the
  inverse is `ψ(x⁻¹)_l = −ψ(x)_l + Q̃_l(ψ(x)_{<l})` with `Q̃_l` of weighted degree at most `ω l`
  and coefficient heights at most `C M^E`; `Γ` is a discrete cocompact subgroup; the top layer
  `G_s = ψ⁻¹ {t | t_l = 0 for ω l < s}` is central and acts on coordinates of weight `s` by
  translation;
- **fundamental domain** (GT, Lemma A.14): every `x ∈ G` is uniquely `x = {x}[x]` with
  `ψ({x}) ∈ [0, 1)^d` and `[x] ∈ Γ`.

*Needs:* 2.3; NilpotentLieHeightsAndFiltrations 8.1–8.2.

### 2.5 Constructions

Prove, each with explicit complexity `C M^E` and the evident dimension and degree:

- **products** of finitely many rational filtered nilmanifolds of the same degree (dimension
  adds, complexity the maximum up to `C M^E`), with the product filtration;
- **raising the degree:** a nilmanifold of degree `s` is one of degree `t ≥ s` with the same data;
- **quotients:** for an ideal `I ⊆ L` with `I ⊆ F_j` for some `j`, spanned by vectors of height at
  most `M` and with `Γ ∩ I` of full rank in `I`, the quotient `(L/I, F/I, ·, Γ/(Γ ∩ I))` is a
  rational filtered nilmanifold; in particular `G/G_s` with the induced data has degree `s − 1`;
- **restriction** to rational subgroups (2.2);
- **morphisms:** a filtered Lie algebra homomorphism `φ : L → L'` with `φ(Γ) ⊆ Γ'` induces a
  continuous map of nilmanifolds intertwining the actions.

*Needs:* 2.1–2.3; NilpotentLieHeightsAndFiltrations 2.3, 1.3.

### 2.6 Every nilmanifold is rational

Let `𝔤` be a finite-dimensional real nilpotent Lie algebra and `Γ ⊆ BCHGroup 𝔤` a discrete
cocompact subgroup. Prove that there are a `ℚ`-form `L ⊆ 𝔤` (namely `span_ℚ Γ`), a basis `X` of
`L` and `q ≥ 1` such that `(L, lower central filtration, X, Γ, q)` is a rational filtered
nilmanifold, and likewise for every full filtration of `𝔤` by ideals that are defined over this
`L`. The rational form and a Γ-adapted Mal'cev basis are ComplexKahlerGeometry §8.2's, transported
along the identification of 1.1; the grid inclusions follow from GT, Lemma A.8 (ii).

*Needs:* 1.1, 2.3; ComplexKahlerGeometry §8.2.

## Layer 3: metrics and Lipschitz functions

### 3.1 Chain metrics

For a group `G` and `ν : G → ℝ≥0`, define `chainDist ν x y` as the infimum, over chains
`x = x_0, …, x_n = y`, of `Σ_i min(ν(x_i x_{i+1}⁻¹), ν(x_{i+1} x_i⁻¹))`. Prove that it is the
largest pseudometric with `d(x, y) ≤ min(ν(x y⁻¹), ν(y x⁻¹))`, that it is right-invariant
(`chainDist_mul_right`), and that if
`ν(c g c⁻¹) ≤ K ν(g)` for all `g` then left translation by `c` is `K`-Lipschitz.

*Needs:* Mathlib `PseudoMetricSpace`.

### 3.2 The Green–Tao metric on `G`

For a Mal'cev presentation, `malcevDist = chainDist (fun g ↦ |ψ g|)` (GT, Definition 2.2; LSS,
Definition 3.4). Prove, for complexity at most `M`:

- it is a metric inducing the topology of `G`;
- **coordinates** (GT, Lemma A.4): for `|ψ x|, |ψ y| ≤ T` (`T ≥ 1`),
  `malcevDist x y ≤ C (M T)^E |ψ x − ψ y|` and `|ψ x − ψ y| ≤ C (M T)^E malcevDist x y`;
- **left translation** (GT, Lemma A.5): `malcevDist (g x) (g y) ≤ C (M (1 + |ψ g|))^E
  malcevDist x y` for all `x, y`;
- **change of presentation:** for two presentations of one group whose coordinate changes are
  polynomial with coefficient heights at most `M` (GT, Lemma A.2 (ii)), the two metrics are
  comparable with constant `C M^E` on all of `G`, by subdividing chains along one-parameter
  subgroups;
- for a rational filtered nilmanifold, the first-kind coordinates in `X` are comparable to `ψ` in
  the same sense, so that every statement here can be read in first-kind coordinates.

*Needs:* 3.1, 2.4.

### 3.3 The metric on `G/Γ`

Define `nilDist (xΓ) (yΓ) = inf_{γ ∈ Γ} malcevDist x (y γ)` (GT, Definition 2.2). Prove:

- it is a metric (GT, Lemma A.15) inducing the quotient topology, and the infimum is attained;
- `G → G/Γ` is `1`-Lipschitz, and an isometry on every ball of radius `(C M^E)⁻¹`;
- **diameter** (GT, Lemma A.16): `nilDist ≤ C M^E`;
- the action of `g` on `G/Γ` is Lipschitz with the constant of 3.2;
- **covering:** for `0 < δ ≤ 1`, `G/Γ` is covered by at most `(C M^E / δ)^d` balls of radius `δ`;
- **subnilmanifolds** (GT, Lemma A.17): for a rational subgroup with its own presentation, the
  two metrics on it are comparable with constant `C M^E`; for products, the metric of the product
  presentation is comparable to the maximum of the factor metrics with constant `C M^E`.

**Checks.**

- On the torus `ℝ^d/ℤ^d` with the standard presentation, `nilDist` is the sup-norm distance to
  `ℤ^d`, and the diameter is `1/2`.

*Needs:* 3.2, 2.4.

### 3.4 Lipschitz functions and partitions of unity

Prove for functions on a metric space (stated on `G/Γ`, used throughout):

- `‖F G‖_Lip ≤ ‖F‖_Lip ‖G‖_Lip`, `‖F̄‖_Lip = ‖F‖_Lip`, and for Lipschitz `Φ : ℂ^k → ℂ` the
  composite `Φ ∘ (F_1, …, F_k)` is Lipschitz with the evident constant (compare GTZ, Lemma E.1);
- a bounded Lipschitz function on a subset extends with the same bounds up to a factor `2`
  (Mathlib's `LipschitzOnWith.extend_real` on real and imaginary parts, then truncation);
- **partitions of unity:** for `0 < ρ ≤ 1` there are `n ≤ (C M^E / ρ)^d` functions
  `φ_i : G/Γ → [0, 1]` with `Σ_i φ_i = 1`, each Lipschitz with constant `C M^E / ρ` and supported
  in a set of diameter at most `ρ`; and likewise with `Σ_i φ_i² = 1`;
- **locally constant approximation:** for `F` with Lipschitz constant `K`, with points `z_i` in
  the supports, `|F − Σ_i F(z_i) φ_i| ≤ K ρ`.

*Needs:* 3.3; Mathlib `LipschitzWith`, `LipschitzOnWith.extend_real`.

## Layer 4: polynomial orbits

Fix a Mal'cev presentation of degree `s`, dimension `d` and complexity at most `M`, with weights
`ω`, and weights `w` on `ℤ^σ`.

### 4.1 Coordinates of polynomial sequences

Prove (GT, Lemma 6.7, for `w = 1`; the weighted form has the same proof): `g ∈ poly(ℤ^σ → G)` if and only if
`ψ(g(n)) = Σ_j binom(n, j) t_j` with `t_j ∈ ℝ^d` and `(t_j)_l = 0` unless `|j|_w ≤ ω l`; in
particular each coordinate `ψ(g(n))_l` is a polynomial of weighted degree at most `ω l`.
Deduce: for `N ≥ 1` and `|n_σ| ≤ N`, `|ψ(g(n))| ≤ C R N^s` where `R` bounds every `|t_j|`; dilates
`n ↦ g(a + b n)` are polynomial (GT, Corollary 6.8); and `g` takes values in `Γ` if and only if
every `t_j ∈ ℤ^d` (integer-valued polynomials have integer coefficients in the binomial basis).

*Needs:* 2.4, 0.4.

### 4.2 Orbits and basepoint normalisation

A *polynomial orbit* is `n ↦ g(n)Γ` with `g` polynomial. Prove (as GT use it in §7):
writing `g(0) = {g(0)}[g(0)]` (2.4), `g̃(n) = {g(0)}⁻¹ g(n) [g(0)]⁻¹` is polynomial with
`g̃(0) = 1`, and `F(g(n)Γ) = F'(g̃(n)Γ)` with `F'(x) = F({g(0)} x)` and
`‖F'‖_Lip ≤ C M^E ‖F‖_Lip`. Similarly, for `γ ∈ Γ`, `n ↦ γ g(n) γ⁻¹` gives the same orbit up to
the left translation by `γ`, whose Lipschitz constant is bounded by 3.2.

*Needs:* 4.1, 3.3.

### 4.3 Rational points and rational sequences

An element `γ ∈ G` is *`Q`-rational* if `γ^r ∈ Γ` for some `1 ≤ r ≤ Q`, and *rational* if this
holds for some `r` (GT, Definitions 1.11 and 1.17). Prove (GT, Lemmas A.11 and A.12): `γ` is
rational if and only if `ψ(γ) ∈ ℚ^d`; rational elements form a dense subgroup containing `Γ`; a
`Q`-rational `γ` has `ψ(γ) ∈ Q'⁻¹ ℤ^d` with `Q' ≤ C (M Q)^E` independent of `γ`, and conversely
`ψ(γ) ∈ Q⁻¹ ℤ^d` implies `C (M Q)^E`-rationality; products and inverses of `Q`-rational elements
are `C (M Q)^E`-rational; and a polynomial sequence whose values are `Q`-rational has `N`-periodic
orbit with `N ≤ C (M Q)^E`, multivariate versions included.

*Needs:* 4.1, 2.4.

### 4.4 Horizontal and vertical characters

- **Horizontal torus** (GT, Definition 1.5): `G/[G, G]Γ`. A *horizontal character* is a
  continuous homomorphism `η : G → ℝ/ℤ` with `η(Γ) = 0`; it vanishes on `[G, G]Γ`, and
  `η(g) = k · ψ(g)` for a unique `k ∈ ℤ^d`; `|η| = |k|` (GT, Definition 2.6).
- **Vertical torus** (GT, Definition 3.3): `G_s/(Γ ∩ G_s)`, identified with `ℝ^{m_s}/ℤ^{m_s}` by
  the coordinates of weight `s`. A *vertical character* (GT, Definition 3.4) is a continuous
  homomorphism `ξ : G_s → ℝ/ℤ` vanishing on `Γ ∩ G_s`; it is `ξ(u) = k · ψ(u)` with
  `k ∈ ℤ^{m_s}`. A function `F : G/Γ → ℂ^D` has *vertical frequency* `ξ` (`HasVerticalFrequency`) if
  `F(u x) = e(ξ(u)) F(x)` for all `u ∈ G_s` (GT, Definition 3.5; GTZ, Definition 6.1). More
  generally, for a connected central subgroup `T` with `Γ ∩ T` cocompact, a `T`-vertical
  frequency is defined in the same way (LSS, Definition 2.15).
- **Horizontal tori of higher degree** (GTZ, Definition 9.6): `Horiz_i(G)/Horiz_i(Γ)` is a torus,
  and the horizontal Taylor coefficients of 0.5 of an orbit lie in it.

Prove the coordinate descriptions above, that characters of the torus `ℝ^m/ℤ^m` are
`t ↦ e(k · t)` (Mathlib's `UnitAddTorus` and `mFourier`), and that functions with distinct
vertical frequencies are orthogonal on every vertical fibre.

*Needs:* 2.4, 0.5; Mathlib `UnitAddTorus`, `UnitAddTorus.mFourier`.

## Layer 5: nilsequences and nilcharacters

### 5.1 Nilsequences

A *nilsequence* of degree `s` (respectively degree–rank `(s, r)`, multidegree in `J`), dimension
`d` and complexity at most `M` on `ℤ^σ` with weights `w` is a function `n ↦ F(g(n)Γ)` where `G/Γ`
is a rational filtered nilmanifold of that kind, dimension `d` and complexity at most `M` with an
adapted Mal'cev basis (by 2.3–2.4 it then has a Mal'cev presentation of complexity at most
`C M^E`, on which `IsNilsequence` prototypes the definition), `g` is polynomial, and `F : G/Γ → ℂ` has `‖F‖_Lip ≤ M` (GTZ, Definition 6.19; LSS,
Theorem 1.2 and Definition 3.5). The data `(G/Γ, g, F)` is a *niltest* (*Niltest*); vector-valued
niltests `F : G/Γ → ℂ^D` are allowed, with Convention 7.

**Checks.**

- `n ↦ e(α₀ + α₁ n + ⋯ + α_s n^s)` is a nilsequence of degree `s`, dimension `1` and complexity at
  most `8`: the circle of degree `s` (2.1), `F = e` with `‖F‖_Lip = 1 + 2π < 8`, since the
  quotient metric is the distance to `ℤ` (GTZ, Example 6.3).
- On the circle, `F(x) = e(x/2)` for `x ∈ [0, 1)` is bounded but not continuous on `ℝ/ℤ`, so
  `n ↦ e({αn}/2)` is not presented as a nilsequence by `F`; the Lipschitz condition is on
  `G/Γ`, not on a fundamental domain.

### 5.2 The nilsequence algebra

Prove, with explicit `C M^E` and the stated dimensions:

- constants, complex conjugates and scalar multiples of nilsequences are nilsequences of the same
  kind;
- sums and products of nilsequences of complexity at most `M_i` and dimensions `d_i` are
  nilsequences on the product nilmanifold (2.5) of dimension `Σ d_i` and complexity at most
  `C max(M_i)^E`; more generally `Φ(ψ_1, …, ψ_k)` for Lipschitz `Φ` (GTZ, Lemma E.1);
- **reparametrisation:** for integer-valued polynomial maps `P : ℤ^τ → ℤ^σ` of degree at most
  `k`, `ψ ∘ P` is a nilsequence of degree `k s` on the rescaled nilmanifold (0.3, 2.1) with the
  same dimension and complexity; translates and dilates `n ↦ ψ(a + b n)` keep degree, dimension
  and complexity; restriction to a coordinate hyperplane keeps all three;
- **raising and lowering:** a nilsequence of degree `s` is one of degree `t ≥ s`; a nilsequence of
  degree `s` whose function `F` is invariant under `G_s` is a nilsequence of degree `s − 1` on
  `G/G_sΓ` of complexity `C M^E`;
- **basepoint:** every nilsequence is a nilsequence with `g(0) = 1` of complexity `C M^E` (4.2).

*Needs:* 5.1, 2.5, 3.4, 4.2.

### 5.3 Vertical Fourier decomposition

Prove (quantitative form of the decomposition used in GT, Lemma 3.7, and GTZ, Lemma E.5): for a
nilmanifold of degree `s`, complexity at most `M`, `F` with `‖F‖_Lip ≤ K` and `0 < ε ≤ 1`, there
are functions `F_k`, indexed by the vertical frequencies `k` with `|k| ≤ (C M K / ε)^E`, such that
each `F_k` has vertical frequency `k`, `‖F_k‖_Lip ≤ (C M K / ε)^E`, and
`|F − Σ_k F_k| ≤ ε` everywhere. *Route:* convolve `F` along the vertical torus with a Fejér
kernel of order `(C M K/ε)^E`; the Fourier coefficients along the fibre are the `F_k`.

*Needs:* 4.4, 3.4.

### 5.4 Nilcharacters

A *nilcharacter* of degree `s` and output dimension `D` is a niltest `(G/Γ, g, F)` of degree `s`
with `F : G/Γ → ℂ^D`, `‖F(x)‖₂ = 1` for every `x`, and a vertical frequency (GTZ, Definitions 6.1
and 6.19; LSS, Definition 2.16); the degree–rank and multidegree versions use the top layer of the
respective filtration. Prove:

- **existence:** for every vertical character `ξ` with `|ξ| ≤ K` there is `F : G/Γ → ℂ^D` with
  `‖F‖₂ = 1`, vertical frequency `ξ`, `D ≤ (C M)^E` and `‖F‖_Lip ≤ (C M (1 + K))^E`
  (the construction at the start of GTZ, §6, used in the proof of Lemma E.5: a partition of unity
  of 3.4 with `Σ φ_i² = 1` on `G/G_sΓ`, local sections of `G/Γ → G/G_sΓ`, and the phase
  `e(ξ(·))` along the fibres);
- products and conjugates of nilcharacters are nilcharacters (tensor product; frequency adds,
  respectively changes sign), and pullbacks along reparametrisations keep the nilcharacter
  property;
- **decomposition:** every scalar nilsequence `ψ` of degree `s ≥ 1`, complexity at most `M` and
  `0 < ε ≤ 1` satisfies `|ψ − Σ_{j ≤ m} Σ_i ψ_{j,i} χ_{j,i}| ≤ ε` with `m ≤ (C M/ε)^E`, nilcharacters `χ_j`
  of degree `s` and vector-valued nilsequences `ψ_j` of degree `s − 1`, all of complexity at most
  `(C M/ε)^E` and output dimension at most `(C M/ε)^E` (quantitative GTZ, Lemma E.5).
  *Route:* 5.3, then `F_k = Σ_i (F_k χ̄_{k,i}) χ_{k,i}` with `χ_k` from existence, where each
  `F_k χ̄_{k,i}` is `G_s`-invariant and descends to `G/G_sΓ` (5.2).

*Needs:* 5.1–5.3, 3.4.

## Layer 6: nilsequences on `ℤ/N`

### 6.1 Definitions

A function `f : ZMod N → ℂ` is a nilsequence of degree `s`, dimension `d` and complexity at most
`M` if `f x = ψ(x.val)` for such a nilsequence `ψ` on `ℤ` (Convention 9; `IsCyclicNilsequence`); likewise on `(ZMod N)^σ`
coordinatewise. A *nilsequence expansion* of `f` with parameters `(s, d, M, K)` is a
representation `f = Σ_{i ≤ K} c_i ψ_i` with `Σ |c_i| ≤ K` and nilsequences `ψ_i` on `ZMod N` of
degree `s`, dimension at most `d` and complexity at most `M`.

**Checks.**

- `x ↦ e(a x / N)` (well defined on `ZMod N`) is a nilsequence of degree `1`: with `g(n) = a n/N`
  on the circle and `F = e`, `e(a · x.val / N) = e(a x/N)`.
- For `P ∈ ℤ[X]` of degree at most `s`, `x ↦ e(P(x)/N)` is a nilsequence of degree `s` and
  complexity at most `8` on `ZMod N`, for every `N`.
- `x ↦ e(x.val²/(2N))` is a nilsequence of degree `2` on `ZMod N` that is not `N`-periodic as a
  function of `x.val ∈ ℤ` when `N` is odd: the representative matters.

### 6.2 Closure

Prove that nilsequences and nilsequence expansions on `ZMod N` are closed under conjugation,
products (parameters multiply in `K`, dimensions add, complexities `C max(M_i)^E`) and sums, with
explicit parameters, by 5.2 applied to the representatives.

*Needs:* 6.1, 5.2.

### 6.3 Approximation

Prove, for a nilsequence `f` on `ZMod N` of degree `s`, dimension `d`, complexity at most `M`, and
`0 < ε ≤ 1`, with all bounds of the form `(C M/ε)^E` and independent of `N`:

- **locally constant pieces:** `f` is within `ε` of `Σ_i c_i φ_i(g(x.val)Γ)` with the partition of
  unity of 3.4 at scale `ρ = ε/M`, `|c_i| ≤ M`, every `φ_i` a nilsequence along the same orbit with
  values in `[0, 1]`;
- **vertical frequencies:** `f` is within `ε` of a sum of at most `(C M/ε)^E` nilsequences along the
  same orbit, each with a vertical frequency (5.3);
- **nilcharacters:** `f` is within `ε` of `Σ_{j ≤ m} Σ_i ψ_{j,i} χ_{j,i}` as in 5.4, evaluated at
  `x.val`.

*Needs:* 6.1, 3.4, 5.3, 5.4.

## Worked examples

- **Polynomial phases.** The circle of degree `s` gives the phases `e(P(n))` (2.1, 5.1, 6.1); their
  horizontal Taylor coefficients are `j!` times the coefficients of `P` (0.5).
- **Heisenberg nilmanifold.** Rational presentation with `q = 2` (2.1), Mal'cev basis `X, Y, Z`
  with `Γ = ψ⁻¹(ℤ³)` (2.3), product polynomials `ψ(x y) = (a + a', b + b', c + c' − a' b)` in the
  convention of NilpotentLieHeightsAndFiltrations 8.2 (2.4), vertical torus `ℝZ/ℤZ` and the
  nilcharacters of frequency `k ≠ 0`, which need output dimension at least `2` because the
  circle bundle is nontrivial (5.4).

## Downstream consumers

NilsequenceEquidistribution takes the Mal'cev presentations, metrics, polynomial sequences in
coordinates, rational points, horizontal and vertical characters, nilcharacters and the
complexity bookkeeping, and proves quantitative equidistribution and factorisation theorems.
GowersInverseTheorem takes nilsequences and nilcharacters on `ℤ`, `ℤ^σ` and `ZMod N` (Layers 5–6)
as the objects of its conclusion. PolynomialOrbitsAndCubeGroups takes Layer 0 (polynomial maps,
Host–Kra cube groups of filtered groups, Lazard–Leibman), the nilmanifolds of Layer 2 and the
metrics of Layer 3, and proves Leibman's qualitative equidistribution theorem.

## Scope and ownership

This roadmap owns:

- `I`-filtrations of groups and their constructions; polynomial maps between filtered groups;
  Host–Kra cube groups of filtered groups as abstract groups, the cube characterisation, the
  Lazard–Leibman theorem and its filtered form, composition and substitution; Taylor expansions;
  horizontal spaces and horizontal Taylor coefficients;
- the topological group structure of BCH groups of real nilpotent Lie algebras, the group
  filtrations induced by Lie filtrations, and polynomial maps in logarithmic coordinates;
- rational filtered nilmanifolds (degree, degree–rank, multidegree) and their complexity, the
  lattice theorems, Mal'cev bases with height bounds, Mal'cev presentations, products, quotients,
  restrictions and morphisms, and the rational presentation of an arbitrary lattice;
- chain metrics, the Green–Tao metric on `G` and `G/Γ` and its comparisons, covering numbers,
  Lipschitz norms, extensions and partitions of unity;
- polynomial sequences in Mal'cev coordinates, basepoint normalisation, rational points and
  rational sequences, horizontal and vertical tori, characters and frequencies;
- nilsequences, niltests and nilcharacters with complexity, the nilsequence algebra, vertical
  Fourier decomposition, existence of nilcharacters and the nilcharacter decomposition; their
  versions on `ZMod N`.

It does not own:

- **NilpotentLieHeightsAndFiltrations:** heights, grids, effective linear algebra, structure
  constants, filtrations of Lie algebras, adapted and nesting bases, Rees and squarefree algebras,
  free nilpotent models, BCH coordinate polynomials and coordinates of the second kind.
- **ScatteringDiagrams §0.4:** *BCHGroup*, *BCHGroup.map*, subgroups from subalgebras, and the
  algebraic BCH series.
- **RepresentationTheory/LieGroups §§3.3 and 5.3:** the analytic BCH series, the Lie group
  structure of the global BCH group and its identification with the simply connected integration.
- **ComplexKahlerGeometry §8.2:** Mal'cev rationality of an arbitrary lattice and Γ-adapted Mal'cev
  bases without height bounds; 2.6 only transports them.
- **PolynomialOrbitsAndCubeGroups:** cube nilmanifolds `G^{[k]}/Γ^{[k]}`, their Haar measures and
  rational structure, Mal'cev characters of subnilmanifolds, Leibman's qualitative equidistribution
  and orbit closures, rational lattice charts and PET induction. Layer 0 here owns only the
  abstract cube groups of a filtered group.
- **NilsequenceEquidistribution and GowersInverseTheorem:** quantitative equidistribution, smooth
  sequences and the factorisation theorem, the
  equivalence and symbols of nilcharacters (GTZ, Definition 6.22 and Lemmas E.7–E.8), correlation
  of nilsequences with Gowers-uniform functions, and every construction whose only use is the
  inverse theorem (square and dilation-pair filtrations, additive-triple restrictions, comparison
  orbits, integer expansions and their budgets).
- **GowersUniformityNorms:** Gowers norms on integer boxes and their Freiman transport. No item of
  this roadmap uses a Gowers norm.
- **ProbabilisticAndMetricNumberTheory §2 and SuccessiveMinima:** equidistribution on tori, Weyl
  sums and discrepancy; successive minima and reduced lattice bases. This roadmap needs only
  Mathlib's torus characters and Tau Ceti's triangular lattice bases.
- **Mathlib:** groups, commutators and lower central series, quotient groups and their topology,
  Lipschitz maps and McShane extension, binomial rings, `MvPolynomial`, tori and their characters.

The following are outside this roadmap: nilmanifolds that are not compact quotients (non-uniform
lattices, solvmanifolds), nilsystems as measure-preserving systems (ClassicalErgodicTheory's
territory), and the Riemannian metric of `G`, which the Green–Tao metric replaces.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b`:

- **Groups.** `Subgroup`, `Subgroup.commutator` (notation `⁅H, K⁆`), `Subgroup.lowerCentralSeries`
  (Mathlib/GroupTheory/Nilpotent/LowerCentralSeries.lean), `Group.IsNilpotent`, `QuotientGroup`
  and `G ⧸ Γ`, `QuotientGroup.instTopologicalSpace` (Mathlib/Topology/Algebra/Group/Quotient.lean),
  `IsTopologicalGroup`, `Homeomorph`.
- **Analysis.** `LipschitzWith`, `LipschitzWith.mul` (Mathlib/Analysis/Normed/Group/Uniform.lean),
  `LipschitzOnWith.extend_real` (Mathlib/Topology/MetricSpace/Lipschitz.lean), `PseudoMetricSpace`,
  `UnitAddTorus`, `UnitAddTorus.mFourier`, `Complex.exp`.
- **Algebra.** `Ring.choose`, `MvPolynomial`, `Height.mulHeight₁`, `ZMod.val`, `Module.Basis`,
  `ZLattice`.

### From Tau Ceti

At Tau Ceti `2fd255d`:

- `ZLattice.exists_basis_triangular` (TauCeti/Algebra/Module/ZLattice/AdaptedBasis.lean), in 2.3.
- `TauCeti.binomialPolynomialBasis`, `TauCeti.mem_ringChooseSpan_X_iff_existsUnique`
  (TauCeti/RingTheory/Polynomial/BinomialBasis.lean), in 0.4.

### From TauCetiRoadmap.NilpotentLieHeightsAndFiltrations

Names of its `Suggested.lean`: `LieFiltration`, `IsAdapted`,
`IsNesting`, `exists_isAdapted_isNesting`, `exists_isAdapted_isNesting_bounded`,
`DegreeRankLieFiltration`, `denomGrid`, `scaledLattice`, `lieStructureConst`,
`dynkinProduct_mem_denomGrid`, `dynkinProduct_mem_scaledLattice`,
`exists_dynkinProduct_coord_polynomial`, `bijective_secondKind`. Sections: Convention 5
(rational structures), 0.3 (grids), 1.2–1.4 (kernels, sections, flag-adapted bases), 2.1–2.3
(structure constants), 3.1–3.4 (filtrations, adapted bases, Rees algebras), 4.2–4.3 (degree–rank
and multidegree filtrations), 5.2 (word expansions, for 1.2), 7.3–7.4 (product polynomials,
grids, stable lattices), Layer 8 (coordinates of the second kind, their group law and changes of
basis).

### From TauCetiRoadmap.ScatteringDiagrams

§0.4: *BCHGroup* of a Lie algebra of class at most `c` over a commutative `ℚ`-algebra, on its
carrier, with `(exp x)⁻¹ = exp(−x)` and `exp(x)ⁿ = exp(n x)`; *BCHGroup.map*; Lie subalgebras and
ideals as subgroups and normal subgroups; restriction of scalars along `ℚ → ℝ`.

### From TauCetiRoadmap.RepresentationTheory/LieGroups

§5.3: the global BCH group of a finite-dimensional real nilpotent Lie algebra on a copy of its
carrier, its Lie group structure, and its identification with the simply connected integration;
used in 1.1 and 2.6 only.

### From TauCetiRoadmap.ComplexKahlerGeometry

§8.2 (K8.NilpotentCentralReduction): for a simply connected real nilpotent Lie group with a
discrete uniform lattice `Γ`, the rational Lie form `𝔤_ℚ = span_ℚ(log Γ)` and a Γ-adapted Mal'cev
basis; used in 2.6 only.

## Provenance

This roadmap was extracted from a Lean development of Hindman's finite sums-and-products
theorem, part of whose code is derived from openai/math (Apache-2.0, commit `adc7f124`). That
source works with `ℚ`-Lie algebras, lattices sandwiched between grids and log-height complexity
budgets, and contains:

- rational filtered nilmanifolds (the weak-basis definition of 2.1), compactness of the quotient
  and closedness and discreteness of the real lattice;
- polynomial orbits as the BCH group of adapted vector-valued polynomials (1.3), with evaluation
  homomorphisms, translates and substitutions;
- right-invariant metrics on the real BCH group and the induced quotient metric, Lipschitz
  algebra, McShane-type extensions and Lipschitz partitions of unity on nilmanifolds;
- niltests (a polynomial orbit with a bounded Lipschitz observable), their products, pullbacks,
  basepoint normalisation and vertical-frequency bookkeeping, and nilsequence expansions on
  `ZMod N` evaluated at the representatives `ZMod.val`.

This roadmap replaces the Riemannian metric by the Green–Tao metric, works over `ℝ` with
Mal'cev presentations so that Green–Tao and Leng–Sah–Sawhney's notion of complexity is matched,
adds the abstract Lazard–Leibman theory of Layer 0, horizontal Taylor coefficients, rational
points, nilcharacters and the vertical decompositions, and generalises from single-variable
degree filtrations to weighted, multidegree and degree–rank filtrations throughout. The source is
not prescriptive.

## References

- [GT] B. Green and T. Tao, *The quantitative behaviour of polynomial orbits on nilmanifolds*,
  Ann. of Math. 175 (2012) 465–540, arXiv:0709.3562: Definitions 1.5, 1.8, 1.10, 1.11, 1.17,
  2.1–2.6, 3.3–3.5, 6.1, 6.3; Lemma 3.7; Propositions 6.2, 6.5; Lemmas 6.4, 6.7; Corollary 6.8;
  Appendix A (Definition A.7, Lemma A.8, Propositions A.9, A.10, Lemmas A.2–A.5, A.11, A.12,
  A.14–A.17).
- [GTZ] B. Green, T. Tao and T. Ziegler, *An inverse theorem for the Gowers U^{s+1}[N]-norm*,
  Ann. of Math. 176 (2012) 1231–1372, arXiv:1009.3998: Definitions 6.1, 6.7, 6.8, 6.17–6.19, 9.6;
  Examples 6.3, 6.11, 6.13, 6.14; Appendix B (Definitions B.1, B.2, Theorem B.3, Corollaries B.4,
  B.5, B.7, Proposition B.6, Lemma B.9); Appendix E (Lemmas E.1, E.5).
- [LSS] J. Leng, A. Sah and M. Sawhney, *Quasipolynomial bounds on the inverse theorem for the
  Gowers U^{s+1}[N]-norm*, arXiv:2402.17994: Theorem 1.2, Definitions 2.15, 2.16, 3.4, 3.5, 3.8.
- M. Lazard, *Sur les groupes nilpotents et les anneaux de Lie*, Ann. Sci. École Norm. Sup. (3) 71
  (1954) 101–190.
- A. Leibman, *Polynomial mappings of groups*, Israel J. Math. 129 (2002) 29–60.
- L. J. Corwin and F. P. Greenleaf, *Representations of nilpotent Lie groups and their
  applications, Part I*, Cambridge University Press 1990, Chapter 5 (rational structures and
  Mal'cev bases).
- OpenAI, openai/math at commit `adc7f124` (Apache-2.0): the formalization summarised under
  Provenance.
