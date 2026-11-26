# Roadmap: Stein function algebras — characters, automatic holomorphy, and Cousin II

**Summary.** Let `X` be a Stein manifold and `O(X)` the complex algebra of its global holomorphic
functions. This roadmap proves that `X` is recovered from `O(X)` together with the Gelfand
topology on its character space. Every unital complex-algebra homomorphism `O(X) → ℂ` is
evaluation at a unique point of `X`; for Stein `X` and `Y`, every unital complex-algebra
homomorphism `O(Y) → O(X)` is composition with a unique holomorphic map `X → Y`. It proves the
general Remmert–Narasimhan embedding theorem on which these statements rest: a Stein manifold of
complex dimension `n` embeds properly and holomorphically into `ℂ^N` with `N ≤ 2n + 1`. It also proves the multiplicative Cousin problem (Cousin II) on Stein
manifolds: a Cousin II datum is solvable exactly when the first Chern class of its associated
holomorphic line bundle vanishes.

The hard analytic input is built elsewhere. RealAnalyticGeometry supplies the Stein criterion,
Oka–Weil approximation, Cartan's theorems A and B for coherent analytic sheaves, the scalar Cousin I
splitting, and the proper holomorphic embedding of the Stein tube of a real-analytic manifold.
ComplexKahlerGeometry supplies Oka coherence and Noetherian holomorphic germs, and the holomorphic
exponential sequence, the Picard group `H¹(X, O^*)` and the integral first Chern class.
ComplexManifolds supplies holomorphic line bundles, their cocycles, and the divisor dictionary.
ComplexComparisonPartII supplies Remmert's proper-image theorem and the Remmert–Stein extension
theorem; its subject is distinct from the Remmert–Narasimhan embedding proved here.

The layers are numbered SF0–SF5. SF0 fixes the Stein predicate, the holomorphic hull and their basic
API. SF1 proves the embedding. SF2 proves the character theorem, first for `ℂ^N` by Hadamard's
lemma and then for a Stein `X` by embedding it and applying Cartan's theorems A and B to the ideal
sheaf. SF3 proves automatic holomorphy and the full faithfulness of the global-section functor. SF4
proves the Cousin II criterion through the exponential sequence. SF5 draws the reconstruction
consequences: the character space of `O(X)` with its Gelfand topology, algebra isomorphisms versus
biholomorphisms, and the automorphism group.

## How to read the build

A target is a numbered statement in a layer, cited as §k.n. Its proof route follows in the same
subsection, and the layer's *Dependencies* paragraph names the targets and the exact supplier
results it consumes. A statement that Tau Ceti proves is not restated as a target. The Lean
prototypes in `Suggested.lean` are suggested forms of the headline targets, not an exhaustive
checklist.

## Conventions

1. **Complex manifolds.** A complex manifold is Hausdorff, second countable, finite-dimensional and
   without boundary, modelled on `Fin n → ℂ` with the model `𝓘(ℂ, Fin n → ℂ)`. Complex dimension
   and model dimension agree. A holomorphic map is a `C^ω` map for these models; `MDifferentiable`
   and `mfderiv` are Mathlib's manifold-differentiable predicate and derivative.

2. **Stein manifolds.** A complex manifold `X` is *Stein* when it is holomorphically convex, global
   holomorphic functions separate its points, and at every point some global holomorphic map to
   the model has injective differential. The holomorphic hull of a set `K ⊆ X` is the set of points
   at which every global holomorphic function satisfies every modulus bound it satisfies on `K`.
   On compact `K` this is the usual condition `|f(x)| ≤ sup_K |f|`. Layer SF0 fixes this predicate
   and proves its basic API.

3. **The function algebra.** `O(X)` is the complex algebra of global sections of the holomorphic
   structure sheaf of `X`; for an open `U ⊆ X`, `O(U)` is the algebra of holomorphic functions on
   `U`. The unit group is `O(X)^*`. A *character* of `O(X)` is a unital complex-algebra homomorphism
   `O(X) → ℂ`; `ev_x` is evaluation at `x`. The algebra `O(X)` is commutative and contains `ℂ` as
   the constant functions.

4. **Embeddings.** A *proper holomorphic embedding* is a holomorphic map that is injective, whose
   differential is injective at every point, and which is proper (the preimage of every compact set
   is compact). Equivalently, it is a closed holomorphic embedding. A *closed complex submanifold*
   of `ℂ^N` is the image of such a map; the map is a biholomorphism onto its image.

5. **Cousin II data.** A Cousin II datum on an open cover `(U_i)` is a family of meromorphic
   functions `f_i` on `U_i` whose ratios `f_i / f_j` are holomorphic and nowhere zero on
   `U_i ∩ U_j`. It is solvable when there is a global meromorphic function `f` with `f / f_i`
   holomorphic and nowhere zero on each `U_i`. The ratios `c_{ij} = f_i / f_j` are a multiplicative
   cocycle in `O^*`; conversely every such cocycle comes from meromorphic data, so the
   sheaf-theoretic cocycle formulation and the meromorphic formulation are equivalent. The roadmap
   states the targets in the cocycle formulation and translates them when meromorphic language is
   clearer.

6. **The first Chern class.** On a complex manifold `X`, the exponential sequence
   `0 → ℤ → O → O^* → 1` has connecting map `H¹(X, O^*) → H²(X, ℤ)`. The image of the class of a
   holomorphic line bundle is its integral first Chern class. ComplexKahlerGeometry K4.P owns the
   sequence, the identification `Pic(X) ≅ H¹(X, O^*)`, and this Chern-class identification; this
   roadmap consumes them and does not restate them.

7. **Owned elsewhere.** Cartan's theorems A and B, Oka coherence, the Stein criterion, Oka–Weil
   approximation, Cousin I, the holomorphic exponential sequence, the first Chern class, Remmert's
   proper-image theorem and the Remmert–Stein extension theorem are owned by the roadmaps named in
   the supplier contracts. They are used here as black boxes with their stated hypotheses. The
   Remmert–Narasimhan embedding theorem of SF1 is not Remmert's proper-image theorem: it embeds a
   Stein manifold in an affine space, whereas Remmert's theorem concerns images of proper
   holomorphic maps of analytic spaces.

8. **Automatic holomorphy is algebraic.** SF3 assumes no continuity of the algebra homomorphism
   `O(Y) → O(X)` and no topological vector-space structure on `O(X)` or `O(Y)`. This is the content
   of the word *automatic*: the holomorphic map is produced by the algebra structure alone.

## Layer 0 (SF0): Stein manifolds and the holomorphic hull

### 0.1 The holomorphic hull

**Definition 0.1** (holomorphic hull). Let `X` be a complex manifold modelled on `E`. The
holomorphic hull of a set `K ⊆ X` is

`hull(K) = {x ∈ X : for every holomorphic f : X → ℂ and every B ∈ ℝ, if |f(y)| ≤ B for all y ∈ K,
then |f(x)| ≤ B}`.

The empty set has empty hull: the constant function `1` is bounded by `0` on the empty set.

**Lemma 0.2** (compact hulls). If `K` is compact, then `x ∈ hull(K)` if and only if
`|f(x)| ≤ sup_{y ∈ K} |f(y)|` for every global holomorphic `f`. In particular the hull of a
compact set is closed, and the hull operation is monotone and idempotent.

**Proof.** For the forward direction, apply the defining bound with `B = sup_K |f|`, which is
attained because `K` is compact and `f` is continuous. For the reverse direction, a bound `B` on
`K` is at least the supremum, so the supremum inequality implies the defining inequality. The hull
is an intersection of closed sets `{x : |f(x)| ≤ B}`, hence closed. Monotonicity and idempotence
are immediate from the definition. ∎

### 0.2 The Stein predicate

**Definition 0.3** (Stein manifold). A complex manifold `X` is *Stein* when

1. it is holomorphically convex: the holomorphic hull of every compact subset of `X` is compact;
2. global holomorphic functions separate points: for distinct `x, y ∈ X` there is a global
   holomorphic `f` with `f(x) ≠ f(y)`;
3. global holomorphic maps separate tangent directions: at every `x ∈ X` there is a global
   holomorphic map `F : X → E` to the model space whose derivative at `x` is injective.

The three conditions are the standard definition (Hörmander, *An Introduction to Complex Analysis
in Several Variables*, Definition 5.1.3; Demailly, *Complex Analytic and Differential Geometry*,
Chapter I, §6). The third condition is stated with one map to the model; for a manifold of complex
dimension `n`, its `n` components are global holomorphic functions whose differentials span the
cotangent space at `x`.

**Proposition 0.4** (basic API). Let `X` be a Stein manifold.

1. `X` is Hausdorff.
2. `ℂ^n` is Stein; indeed every finite-dimensional complex normed space is isomorphic to `ℂ^n`
   and is Stein.
3. A complex manifold of dimension zero is Stein.
4. A compact Stein manifold without boundary is finite.
5. For distinct points `x, y` there is a global holomorphic function separating them; for every
   `x` there is a global holomorphic map to the model with injective derivative at `x`.
6. The holomorphic hull of a compact set is compact and contains the set.

**Proof.** (1) Separation of points by continuous functions gives the Hausdorff property. (2) Hahn–
Banach produces continuous linear functionals separating points and bounding the hull inside a
closed ball; the identity is a global coordinate. (3) Every function is holomorphic, so the hull of
a set is the set itself. (4) The maximum principle makes every global holomorphic function on a
compact complex manifold locally constant, so separation of points forces the manifold to be
finite. (5) and (6) restate the definition and Lemma 0.2. ∎

**Relation to Tau Ceti.** Tau Ceti's `TauCeti.IsSteinManifold` in
`TauCeti/Geometry/Manifold/Complex/Stein.lean` is this predicate, with
`TauCeti.mholomorphicHull` for Definition 0.1 and the basic API of Proposition 0.4, including
`TauCeti.IsSteinManifold.t2Space`, `.self` for `ℂ^n`, `.of_subsingleton` and
`.finite_of_compactSpace`. If the class is present, SF0 is discharged by importing it; the
statements below use its API and do not restate the proofs.

### Checks

- On `ℂ^n`, the hull of the closed unit ball is itself, and the hull of the unit sphere is the
  closed unit ball. The function `z ↦ z_1` shows that the hull of a point is the point.
- `ℂ^* = ℂ ∖ {0}` is Stein: it is a domain in `ℂ`, and the function `z ↦ z` separates points while
  `z ↦ 1/z` is holomorphic on the whole space and unbounded near `0`. The hull of the unit circle
  is the unit circle itself: for a point `x` in the hull, the bound from the function `z` is
  `|x| ≤ 1` and the bound from `1/z` is `|1/x| ≤ 1`, hence `|x| = 1`. Thus no point with
  `|x| ≠ 1` lies in the hull, while the maximum modulus principle puts the circle itself in the
  hull. The missing point `0` is outside the ambient manifold, and the hull is compact.
- `ℂ^n ∖ {0}` for `n ≥ 2` is **not** Stein. By Hartogs' extension theorem every holomorphic
  function on the punctured ball extends across `0`, so the hull of the unit sphere is the punctured
  closed ball, which is not compact: the sequence `z_k = (1/k, 0, …, 0)` has no convergent
  subsequence in `ℂ^n ∖ {0}`. This is the standard Hartogs phenomenon and the reason the Stein
  hypothesis cannot be dropped in SF2 and SF4.
- A compact Stein manifold is finite; the Riemann sphere `ℙ^1` is not Stein. The affine quadric
  `{(x, y, z) ∈ ℂ^3 : x^2 + y^2 + z^2 = 1}` is a closed complex submanifold of `ℂ^3`, hence Stein;
  it is homotopy equivalent to the `2`-sphere and has `H^2 = ℤ`, which SF4 uses to exhibit a
  non-solvable Cousin II datum on a Stein manifold.

### Dependencies

Mathlib's `MDifferentiable`, `mfderiv`, `IsCompact`, `ProperSpace`, `sSup` and the maximum
principle for compact complex manifolds. Tau Ceti's `TauCeti.IsSteinManifold`,
`TauCeti.mholomorphicHull` and their API, if present; otherwise the definitions and proofs above
are the targets of SF0. RealAnalyticGeometry R3.1 supplies the converse Stein criterion, that a
strictly plurisubharmonic exhaustion makes a complex manifold Stein; SF1 uses it to know that the
manifolds it embeds satisfy Definition 0.3.

## Layer 1 (SF1): The Remmert–Narasimhan embedding

### 1.1 The embedding theorem

**Theorem 1.1** (Remmert–Narasimhan). Let `X` be a Stein manifold of complex dimension `n`. There
are an integer `N ≤ 2n + 1` and a holomorphic map `f : X → ℂ^N` that is injective, whose
differential is injective at every point of `X`, and which is proper. For `n = 0`, `X` is a
countable discrete space and `N = 1`; a proper enumeration `X → ℂ` is the embedding. For `n ≥ 1`,
the target dimension `2n + 1` is the one of Narasimhan's theorem.

**Proof route.** The construction is the one of RealAnalyticGeometry R4.1, stated there for the
Stein tube of a real-analytic manifold. Its steps use only the Stein axioms of Definition 0.3 and
the approximation theorems of R3.1, not the tube's ambient real-analytic geometry:

1. Put the compact-open topology on the space of holomorphic maps `X → ℂ^n`, prove it is a complete
   metrizable locally convex space, and use Baire's theorem to produce Bishop's almost proper maps.
2. Build a polyhedral exhaustion `P_j ⋐ P_{j+1}` of `X` by compact sets that are finite unions of
   special analytic polyhedra, with a map `h` sending each `P_j` properly onto a polydisc of radius
   `a_j`, where `a_j → ∞`.
3. Prove the buffered compact-component approximation lemma: for `b_j` with
   `a_{j-1} < b_j < a_j`, the set `Q_j = closure(P_{j+1}) ∩ {‖h‖_∞ ≤ b_j}` is compact, open and
   closed in `{‖h‖_∞ ≤ b_j}`, and is `O(X)`-convex. Oka–Weil approximation on `Q_j` lets one
   prescribe `h` on `A_j = P_j ∩ Q_j` and a coordinate of modulus `> j` on `L_j = Q_j ∖ P_j`.
4. Prove global one-jet transversality and off-diagonal two-point transversality by finite-jet
   interpolation, parametric Sard, and a countable intersection of open dense conditions. On the
   locus where `dh` has corank `k`, the failure of injectivity of `dg` on `ker dh` has codimension
   `n + 2 − k`, which exceeds the dimension `n − k²` of the corank-`k` locus by
   `k² − k + 2 > 0`; this is the dimension count behind the immersion condition.
5. Choose summable future errors below the growth margins, the immersion margins and the
   pair-separation margins. The limit `g` is holomorphic, injective and immersive, and
   `(h, g) : X → ℂ^{n + (n+1)} = ℂ^{2n+1}` is proper: on `closure(P_{j+1}) ∖ P_j` either
   `‖h‖_∞ > b_j` or `|g_1| > j`, so the preimage of a compact set stays in a fixed `P_j`.

The special geometry of the tube enters R4.1 only through the existence of the strictly
plurisubharmonic exhaustion and the polyhedral exhaustion. A general Stein manifold has both by
R3.1's converse Stein criterion and Oka–Weil theory, so the same construction applies with `T`
replaced by `X`. The general statement is also the one of Forstnerič's survey, §2.1, Theorem 2.1
and Proposition 2.2; the roadmap's target is the general statement, and R4.1 owns the detailed
construction for the tube.

**Lemma 1.2** (inverse function theorem on complex manifolds). Let `f : X → Y` be a holomorphic map
of complex manifolds and `x ∈ X`. If `mfderiv f x` is a continuous linear equivalence, then there
are open neighbourhoods `U` of `x` and `V` of `f(x)` such that `f|_U : U → V` is a biholomorphism.

**Proof.** In preferred charts the statement is the inverse function theorem for holomorphic maps
between open subsets of `ℂ^n`: a `C^ω` map with invertible derivative has a `C^ω` local inverse.
Mathlib proves the normed-space inverse function theorem and the analytic inverse; the manifold
statement is the chart reduction. ∎

**Lemma 1.3** (proper injective immersion). Let `f : X → Y` be a holomorphic map of complex
manifolds that is injective, proper, and whose differential is injective at every point. Then `f`
is a closed smooth embedding, its image is a closed complex submanifold of `Y`, and `f` is a
biholomorphism onto its image.

**Proof.** In local coordinates, an injective differential is a linear injection `ℂ^n → ℂ^N`.
After a linear change of the target chart, `f` is the standard inclusion of an open subset of
`ℂ^n` into `ℂ^n × ℂ^{N-n}`; this is the immersion theorem, proved from the inverse function theorem
in the product chart, or from Lemma 1.2 applied to the projection onto the first `n` coordinates.
Hence `f` is a local embedding and its image is locally a complex submanifold. Injectivity makes
`f` a topological embedding onto its image, and properness makes the image closed. The inverse on
the image is holomorphic because it is locally the inverse of the biholomorphisms supplied by
Lemma 1.2. ∎

**Corollary 1.4** (closed embeddings). Let `f : X → ℂ^N` be as in Theorem 1.1. Then `f` is a closed
embedding, its image is a closed complex submanifold of `ℂ^N`, and `f` is a biholomorphism onto
its image. In particular every Stein manifold is biholomorphic to a closed complex submanifold of
an affine space.

**Proof.** Theorem 1.1 gives injectivity, properness and injective differentials; apply Lemma 1.3
with `Y = ℂ^N`. ∎

### 1.2 The ideal sheaf and Cartan's theorems on `ℂ^N`

**Lemma 1.5** (ideal sheaf of a closed submanifold). Let `X ⊆ ℂ^N` be a closed complex submanifold
and `I_X` its ideal sheaf in `O_{ℂ^N}`. Then:

1. `I_X` is a coherent analytic sheaf;
2. `H^q(ℂ^N, I_X) = 0` for every `q > 0`;
3. the restriction map `O(ℂ^N) → O(X)` is surjective, with kernel the global sections of `I_X`,
   so `O(X) ≅ O(ℂ^N) / I_X(ℂ^N)`;
4. for every `a ∈ ℂ^N ∖ X` there is a global holomorphic `f` with `f|_X = 0` and `f(a) ≠ 0`.

**Proof.** (1) is Oka coherence for the ideal sheaf of a closed complex submanifold
(ComplexKahlerGeometry K3.4). (2) is Cartan's theorem B on the Stein manifold `ℂ^N`
(RealAnalyticGeometry R3.2). (3) is the long exact sequence of
`0 → I_X → O_{ℂ^N} → O_X → 0`, using (2) in degree one. (4) At `a ∉ X` the stalk of `I_X` is the
whole local ring `O_{ℂ^N,a}`; Cartan's theorem A (R3.2) says the global sections generate this
stalk, so some global section has nonzero germ at `a`. ∎

Part (4) is the only place where theorem A, rather than theorem B, is used in SF2. It is what
forces the point produced by a character to lie on `X`, and it is false for a non-Stein ambient
manifold: on `ℂ^n ∖ {0}` with `n ≥ 2`, the ideal of the missing point is not globally generated
because every holomorphic function extends across it.

### Checks

- `ℂ^n` embeds as the identity in `ℂ^n`, with `N = n ≤ 2n + 1`.
- `ℂ^*` embeds properly in `ℂ^2` by `z ↦ (z, 1/z)`, with `N = 2 ≤ 3`. The identity inclusion
  `ℂ^* ⊆ ℂ` is not proper: the preimage of a compact interval containing `0` is not compact.
- A finite discrete space embeds properly in `ℂ` by an enumeration, with `N = 1 = 2·0 + 1`.
- The affine quadric `x^2 + y^2 + z^2 = 1` is already a closed complex submanifold of `ℂ^3`, so the
  identity is a proper embedding with `N = 3 ≤ 5`; Theorem 1.1 gives the same conclusion with a
  possibly different embedding.
- A compact complex manifold of positive dimension, such as `ℙ^1`, admits no proper holomorphic
  embedding into any `ℂ^N`: a proper map from a compact space has compact image, and a compact
  complex submanifold of positive dimension in `ℂ^N` is impossible by the maximum principle. This
  is consistent with `ℙ^1` not being Stein.
- The graph of an entire function `g : ℂ → ℂ` is a closed complex submanifold of `ℂ^2` and is
  Stein; the identity embedding has `N = 2 ≤ 5`.

### Dependencies

RealAnalyticGeometry R3.1 (the converse Stein criterion, Oka–Weil approximation, separation of
points and tangents, finite-jet interpolation), R3.2 (Cartan's theorems A and B), R4.1 (the
proper holomorphic embedding of the Stein tube and its construction); ComplexKahlerGeometry K3.4
(Oka coherence and the coherence of ideal sheaves); Mathlib's Sard theorem, the compact-open
topology on spaces of holomorphic maps, Baire's theorem, the inverse function theorem in normed
spaces, the chart calculus, `IsImmersion`, `IsSmoothEmbedding` and `IsProperMap`; Tau Ceti's
`TauCeti.IsSteinManifold`, `TauCeti.mholomorphicHull`, `MDifferentiable`, `mfderiv` and
`ContMDiff`. Lemmas 1.2 and 1.3 are targets: Mathlib's `LocalDiffeomorph.lean` records the
manifold inverse function theorem as a TODO and has no proper-immersion theorem, so the chart
reductions are stated and proved here rather than cited. The embedding theorem itself is not in
Tau Ceti and is the target of SF1.

## Layer 2 (SF2): Characters of the algebra of holomorphic functions

### 2.1 The Euclidean case

**Lemma 2.0** (Hadamard division). Let `f` be holomorphic on an open polydisc centred at
`a ∈ ℂ^N`. There are holomorphic functions `g_1, …, g_N` on the polydisc with
`f(z) - f(a) = Σ_{j=1}^N (z_j - a_j) g_j(z)`.

**Proof.** For `z` in the polydisc, the segment `a + t(z - a)`, `0 ≤ t ≤ 1`, stays in the
polydisc by convexity. The fundamental theorem of calculus gives

`f(z) - f(a) = ∫_0^1 (d/dt) f(a + t(z - a)) dt = Σ_j (z_j - a_j) ∫_0^1 (∂_j f)(a + t(z - a)) dt`.

Differentiation under the integral shows that each `g_j` is holomorphic. ∎

The proof is the mean-value formula with a holomorphic parameter integral; it is a target of SF2,
not a black box.

**Lemma 2.1** (characters of `O(ℂ^N)`). Every unital complex-algebra homomorphism
`φ : O(ℂ^N) → ℂ` is evaluation at a unique point `a ∈ ℂ^N`.

**Proof.** Let `z_1, …, z_N` be the coordinate functions and put `a = (φ(z_1), …, φ(z_N))`. For
`f ∈ O(ℂ^N)`, Hadamard's lemma gives holomorphic functions `g_j` with

`f(z) - f(a) = Σ_{j=1}^N (z_j - a_j) g_j(z)`,

namely `g_j(z) = ∫_0^1 (∂_j f)(a + t(z - a)) dt`. When `f` is entire, the `g_j` are entire, so
`φ` applies to them. Applying `φ` and using `φ(z_j) = a_j` gives
`φ(f) - f(a) = Σ φ(z_j - a_j) φ(g_j) = 0`. Hence `φ = ev_a`. If `ev_a = ev_b`, the coordinate
functions give `a = b`. For `N = 0`, `O(ℂ^0) = ℂ` and the unique character is evaluation at the
unique point. ∎

The proof uses no continuity of `φ` and no power-series expansion of `f`; Hadamard's lemma is the
finite-dimensional mean-value formula with a holomorphic parameter integral.

### 2.2 The character theorem on a Stein manifold

**Theorem 2.2** (characters are evaluations). Let `X` be a Stein manifold of complex dimension `n`
and `φ : O(X) → ℂ` a unital complex-algebra homomorphism. Then there is a unique `x ∈ X` with
`φ = ev_x`.

**Proof.** By Theorem 1.1, choose a proper holomorphic embedding `ι : X → ℂ^N` with `N ≤ 2n + 1`.
Write `ι_j = z_j ∘ ι` for its coordinate functions. By Lemma 1.5(3), the restriction
`ρ : O(ℂ^N) → O(X)` is surjective. Then `ψ = φ ∘ ρ : O(ℂ^N) → ℂ` is a character, so by Lemma 2.1
there is a unique `a ∈ ℂ^N` with `ψ = ev_a`.

We show `a ∈ ι(X)`. Suppose not. By Lemma 1.5(4), there is `F ∈ O(ℂ^N)` with `F|_{ι(X)} = 0` and
`F(a) ≠ 0`. Then `ρ(F) = 0`, so `ψ(F) = φ(0) = 0`, but `ψ(F) = F(a) ≠ 0`, a contradiction. Hence
`a = ι(x)` for a unique `x ∈ X`. For `h ∈ O(X)`, choose `F ∈ O(ℂ^N)` with `ρ(F) = h`; then
`φ(h) = ψ(F) = F(a) = h(x)`, so `φ = ev_x`. If `ev_x = ev_y`, separation of points (Definition 0.3)
gives `x = y`. ∎

The proof uses theorem A only in the form of Lemma 1.5(4). Without it, the point `a` could lie in
the complement of `X`; the Hartogs phenomenon on `ℂ^n ∖ {0}` is exactly the failure of that lemma
and of the theorem.

### 2.3 The character space

**Corollary 2.3** (evaluation is a bijection). For a Stein manifold `X`, the map
`X → Char(O(X))`, `x ↦ ev_x`, is a bijection. The kernel of `ev_x` is a maximal ideal of `O(X)` of
codimension one, and every codimension-one maximal ideal is of this form.

The full maximal ideal space of `O(X)` need not be exhausted by the evaluation ideals. For
`X = ℂ`, the ring `O(ℂ)` of entire functions has maximal ideals containing the ideal of functions
that vanish on a sequence with no accumulation point; a maximal ideal containing that ideal and
coming from a nonprincipal ultrafilter on the sequence is not `{f : f(a) = 0}` for any `a ∈ ℂ`,
and its quotient is a proper field extension of `ℂ`. The roadmap therefore works with the
*character space* `Char(O(X))`, not with the full maximal ideal spectrum. The intersection of all
maximal ideals is still zero, because a nonzero holomorphic function is nonzero at some point.

### Checks

- `X = ℂ`: the characters of `O(ℂ)` are the evaluations `ev_a`; Hadamard's lemma is the classical
  division `f(z) - f(a) = (z - a) g(z)`. The extra maximal ideals of `O(ℂ)` described above show
  that the character space is strictly smaller than the full maximal ideal space.
- `X = ℂ^*`: the characters are `ev_a` for `a ≠ 0`. There is no character at `0`, because `1/z` is
  holomorphic on `ℂ^*` and has no finite value at `0`; an algebra homomorphism would have to send
  `1/z` to a complex number `c` with `c · 0 = 1`, which is impossible.
- `X = ℂ^n ∖ {0}` with `n ≥ 2`: this space is not Stein. By Hartogs' extension theorem,
  `O(ℂ^n ∖ {0}) = O(ℂ^n)`, so the characters are `ev_a` for every `a ∈ ℂ^n`, including the missing
  point `0`. The evaluation map `X → Char(O(X))` is therefore not surjective. This is the standard
  example that shows the Stein hypothesis in Theorem 2.2 cannot be dropped.
- `X = ℙ^1`: `O(ℙ^1) = ℂ`, so `Char(O(ℙ^1))` is a singleton, while `X` has many points; evaluation
  is not injective.
- A finite Stein manifold has `O(X) = ℂ^X`; its characters are exactly the evaluations at its
  points.

### Dependencies

SF1 (Theorem 1.1, Lemmas 1.2, 1.3 and 1.5), Lemma 2.0, RealAnalyticGeometry R3.2 (Cartan's
theorems A and B), ComplexKahlerGeometry K3.4 (coherence of ideal sheaves), Mathlib's analytic
calculus and differentiation under the integral; Tau Ceti's
`TauCeti.holomorphicStructureSheaf`, `TauCeti.ofContMDiff`, `TauCeti.evalHom`, `TauCeti.eval`
and `TauCeti.germ_evalHom` for the structure sheaf and its stalk evaluation. The character theorem
itself is the target of SF2.

## Layer 3 (SF3): Automatic holomorphy

### 3.1 Pullback of holomorphic functions

**Definition 3.1** (pullback). Let `f : X → Y` be a holomorphic map of complex manifolds. The
pullback `f^* : O(Y) → O(X)` is `f^*(h) = h ∘ f`. It is a unital complex-algebra homomorphism,
`id^* = id`, and `(g ∘ f)^* = f^* ∘ g^*` for composable holomorphic maps. On the structure sheaves
this is Tau Ceti's precomposition morphism `homOfContMDiff`; on global sections it is `precomp`.

### 3.2 The automatic holomorphy theorem

**Theorem 3.2** (automatic holomorphy). Let `X` be a complex manifold and `Y` a Stein manifold.
For every unital complex-algebra homomorphism `φ : O(Y) → O(X)` there is a unique holomorphic map
`f : X → Y` with `φ = f^*`.

The source `X` need not be Stein; only the target is. No continuity of `φ` is assumed.

**Proof.** For `x ∈ X`, the composite `ev_x ∘ φ : O(Y) → ℂ` is a character of `O(Y)`. By Theorem
2.2 there is a unique point `f(x) ∈ Y` with `ev_x ∘ φ = ev_{f(x)}`. For every `h ∈ O(Y)` and every
`x ∈ X`,

`(h ∘ f)(x) = h(f(x)) = ev_{f(x)}(h) = (ev_x ∘ φ)(h) = φ(h)(x)`,

so `h ∘ f = φ(h)` as functions on `X`.

It remains to prove that `f` is holomorphic. By Theorem 1.1, choose a proper holomorphic embedding
`F : Y → ℂ^N`. Each component `F_j` lies in `O(Y)`, so `F_j ∘ f = φ(F_j) ∈ O(X)`; hence
`F ∘ f : X → ℂ^N` is holomorphic and takes values in the closed complex submanifold `F(Y)`. By
Lemma 1.3, `F` is a biholomorphism onto its image, so `F^{-1} : F(Y) → Y` is holomorphic. Since
`f = F^{-1} ∘ (F ∘ f)`, `f` is holomorphic. Finally, if `f` and `g` both induce `φ`, then
`h ∘ f = h ∘ g` for every `h ∈ O(Y)`; separation of points gives `f = g`. ∎

The proof uses the proper embedding of `Y` supplied by Theorem 1.1; the embedding theorem rests on
the third Stein axiom. The character theorem of SF2 supplies the point `f(x)`, and the proper
embedding supplies the holomorphy of the resulting map.

### 3.3 Full faithfulness of the global-section functor

**Corollary 3.3** (full faithfulness). Let `X` and `Y` be Stein manifolds. The map

`Hom(X, Y) → Hom_{ℂ-Alg}(O(Y), O(X)),  f ↦ f^*`

is a bijection.

**Proof.** Surjectivity is Theorem 3.2. For injectivity, if `f^* = g^*`, then `h ∘ f = h ∘ g` for
every `h ∈ O(Y)`; separation of points gives `f(x) = g(x)` for every `x`, hence `f = g`. ∎

**Corollary 3.4** (algebra isomorphisms are biholomorphisms). Let `X` and `Y` be Stein manifolds.
Every unital complex-algebra isomorphism `e : O(Y) ≃ₐ[ℂ] O(X)` is `f^*` for a unique biholomorphism
`f : X → Y`. Conversely every biholomorphism induces such an algebra isomorphism. In particular
`X` and `Y` are biholomorphic if and only if `O(X)` and `O(Y)` are isomorphic complex algebras.

**Proof.** Apply Theorem 3.2 to `e` to get `f : X → Y` with `e = f^*`, and to `e^{-1}` to get
`g : Y → X` with `e^{-1} = g^*`. Then `(g ∘ f)^* = f^* ∘ g^* = e ∘ e^{-1} = id_{O(X)}` and
`id_X^* = id_{O(X)}`; Corollary 3.3 gives `g ∘ f = id_X`. Similarly `f ∘ g = id_Y`. The converse is
Definition 3.1. ∎

### Checks

- `X = Y = ℂ`: every complex-algebra endomorphism of `O(ℂ)` is `f ↦ f ∘ g` for a unique entire
  function `g`. The automorphisms are exactly `f ↦ f ∘ (az + b)` with `a ≠ 0`, because the
  biholomorphisms of `ℂ` are the affine maps `z ↦ az + b`.
- `X = ℂ`, `Y = ℂ^*`: the inclusion `ℂ^* → ℂ` induces the restriction `O(ℂ) → O(ℂ^*)`, which is
  injective and not surjective; it is one of the maps classified by Theorem 3.2. The algebra
  automorphism `h ↦ h ∘ (1/z)` of `O(ℂ^*)` is induced by the biholomorphism `z ↦ 1/z`.
- `Y = ℙ^1` is not Stein and `O(ℙ^1) = ℂ`. The only unital algebra homomorphism
  `O(ℙ^1) → O(X)` is the constant map `1 ↦ 1`, and every constant map `X → ℙ^1` induces it.
  Existence holds but uniqueness fails, so the Stein hypothesis on the target is essential.
- `X = ℙ^1`, `Y = ℂ`: `O(ℂ) → O(ℙ^1) = ℂ` is a character of `O(ℂ)`, hence evaluation at a unique
  `a ∈ ℂ`; the induced map `ℙ^1 → ℂ` is the constant map at `a`. This shows that the source need
  not be Stein; the holomorphic map exists and is unique.
- A non-Stein source can have `O(X)` not separating points, as for `ℙ^1`; Theorem 3.2 does not
  need separation on the source, because the point `f(x)` is produced by characters of `O(Y)` and
  uniqueness is tested against `O(Y)`.

### Dependencies

SF1 (Theorem 1.1, Lemma 1.3), SF2 (Theorem 2.2); Mathlib's `AlgHom`, `AlgEquiv` and `ContMDiff`;
Tau Ceti's `TauCeti.holomorphicStructureSheaf`, its precomposition morphism `homOfContMDiff` and
the section-level `precomp`, and `TauCeti.evalHom`. The automatic holomorphy theorem and its
corollaries are the targets of SF3.

## Layer 4 (SF4): Cousin II and the first Chern class

### 4.1 Cousin II data

**Definition 4.1** (multiplicative cocycle). Let `X` be a complex manifold and `(U_i)_{i ∈ I}` an
open cover. A Cousin II datum on the cover is a family

`c_{ij} ∈ O^*(U_i ∩ U_j)`

satisfying the cocycle identity `c_{ij} c_{jk} = c_{ik}` on `U_i ∩ U_j ∩ U_k`, with
`c_{ii} = 1` and `c_{ji} = c_{ij}^{-1}`.

**Definition 4.2** (solvability). A Cousin II datum `c` is solvable when there are
`h_i ∈ O^*(U_i)` with `c_{ij} = h_i / h_j` on `U_i ∩ U_j`. Equivalently, the class of `c` in the
Čech cohomology group `H¹(X, O^*)` is the identity.

**Lemma 4.3** (meromorphic translation). Cousin II data are exactly the ratios of meromorphic
functions: given meromorphic `f_i` on `U_i` with `f_i / f_j ∈ O^*(U_i ∩ U_j)`, the ratios
`c_{ij} = f_i / f_j` form a Cousin II datum; conversely, for a Cousin II datum and a fixed index
`i_0`, the meromorphic functions `f_i = c_{i i_0}` on `U_i` have ratios `c_{ij}` and glue to a
global meromorphic function exactly when the datum is solvable. The proof is the standard Cartier
divisor dictionary: a meromorphic function is locally a quotient of holomorphic functions, and the
ratios of two local representatives are holomorphic and nowhere zero.

The sheaf-theoretic formulation is the one used in the targets, because Tau Ceti's meromorphic
function theory on manifolds is not part of this roadmap.

### 4.2 The exponential sequence

On a complex manifold `X`, the exponential map `exp(2πi ·)` gives a short exact sequence of
sheaves of abelian groups

`0 → ℤ_X → O_X → O_X^* → 1`,

where `ℤ_X` is the constant sheaf and `O_X^*` is the sheaf of units of the structure sheaf. It is
exact because a nowhere-zero holomorphic function has a holomorphic logarithm on a simply
connected neighbourhood of every point. The associated long exact sequence contains the connecting
map

`δ : H¹(X, O_X^*) → H²(X, ℤ)`.

ComplexKahlerGeometry K4.P owns the sequence, the identification `Pic(X) ≅ H¹(X, O_X^*)` between
holomorphic line bundles and multiplicative cocycles, and the identification of `δ` with the
integral first Chern class of the underlying line bundle. This roadmap consumes those results and
does not restate them.

### 4.3 The Cousin II criterion on Stein manifolds

**Theorem 4.4** (Cousin II). Let `X` be a Stein manifold and `c` a Cousin II datum on `X`, with
associated holomorphic line bundle `L_c` and first Chern class `c_1(L_c) ∈ H²(X, ℤ)`. Then `c` is
solvable if and only if `c_1(L_c) = 0`.

**Proof.** The long exact sequence of the exponential sequence reads

`H¹(X, O_X) → H¹(X, O_X^*) → H²(X, ℤ) → H²(X, O_X)`.

By Cartan's theorem B on the Stein manifold `X` (RealAnalyticGeometry R3.2), both `H¹(X, O_X)` and
`H²(X, O_X)` vanish. Hence `δ` is an isomorphism. A Cousin II datum is solvable exactly when its
class in `H¹(X, O_X^*)` is the identity, which is exactly when `δ` of that class is zero, that is,
when `c_1(L_c) = 0`. ∎

**Corollary 4.5** (the exponential isomorphism). On a Stein manifold `X`, the connecting map
`δ : H¹(X, O_X^*) → H²(X, ℤ)` is an isomorphism. In particular the group of holomorphic line
bundles on `X` is `H²(X, ℤ)`.

The corollary does not say that every line bundle on a Stein manifold is trivial: a Stein manifold
can have nonzero `H²(X, ℤ)`. It says that the holomorphic and topological classifications agree,
with the first Chern class as the complete invariant.

### 4.4 Relation to Cousin I

Cousin I is the additive problem: for holomorphic `f_{ij}` on `U_i ∩ U_j` with
`f_{ij} + f_{jk} = f_{ik}`, find holomorphic `h_i` with `f_{ij} = h_j - h_i`. On a Stein manifold
this is always solvable; it is the additive form of Cartan's theorem B for the structure sheaf, and
RealAnalyticGeometry R3.2 owns the scalar Cousin I splitting. Cousin II is the multiplicative
problem; it is not always solvable, and the exponential sequence turns its obstruction into the
first Chern class. This roadmap does not restate Cousin I.

### Checks

- `X = ℂ^n` is contractible, so `H²(ℂ^n, ℤ) = 0`; every Cousin II datum on `ℂ^n` is solvable. In
  particular the divisor `[0]` on `ℂ` is principal, solved by the global meromorphic function `z`.
- `X = ℂ^*` has the homotopy type of the circle, so `H²(ℂ^*, ℤ) = 0`; every Cousin II datum on
  `ℂ^*` is solvable. The divisor `[1]` is principal, solved by `z - 1`; the point `0` is not in the
  manifold, so it defines no divisor there.
- `X = ℙ^1` is not Stein. The Cousin II datum with two charts and ratio `z` is the line bundle
  `O(1)`, whose first Chern class is nonzero; it is not solvable. The criterion of Theorem 4.4 is
  an equivalence on Stein manifolds, not a claim that every Cousin II datum on every manifold is
  solvable.
- The affine quadric `x^2 + y^2 + z^2 = 1` is a Stein surface with `H² = ℤ`. A generator of
  `H²` gives a nontrivial holomorphic line bundle, hence a Cousin II datum with nonzero first Chern
  class and no global meromorphic solution. This is the first example in the roadmap of a Stein
  manifold on which Cousin II is not universally solvable.
- On a general complex manifold, `c_1(L) = 0` is necessary but not sufficient for solvability: the
  image of `H¹(X, O_X)` in `H¹(X, O_X^*)` can be nonzero, and a line bundle with zero first Chern
  class need not be holomorphically trivial. The Stein hypothesis removes this image because
  `H¹(X, O_X) = 0`.

### Dependencies

ComplexKahlerGeometry K4.P (the holomorphic exponential sequence, `Pic(X) ≅ H¹(X, O_X^*)`, the
integral first Chern class and its identification with the connecting map); RealAnalyticGeometry
R3.2 (Cartan's theorem B for `O_X`, and the Cousin I splitting, cited but not restated);
ComplexManifolds §7.3 (holomorphic line bundles, cocycles, the triviality criterion through a
nowhere-zero section, and the divisor dictionary); SF0 for the Stein predicate. Tau Ceti's
`TauCeti.holomorphicStructureSheaf` supplies `O_X`; the unit sheaf, the Picard group and the
exponential sequence are K4.P targets and are not restated here. The Lean interface for this layer
is therefore stated against the K4.P API, and `Suggested.lean` does not duplicate it.

## Layer 5 (SF5): The function-algebra functor and reconstruction

### 5.1 The functor

Let `SteinManifold` be the category whose objects are Stein manifolds and whose morphisms are
holomorphic maps. The global-section construction is a contravariant functor

`O : SteinManifold^{op} → ℂ-Alg,  X ↦ O(X),  f ↦ f^*`,

with the functoriality of Definition 3.1. Corollary 3.3 says that `O` is fully faithful.

### 5.2 The character space and the Gelfand topology

**Definition 5.1** (character space). The character space `Char(O(X))` is the set of unital
complex-algebra homomorphisms `O(X) → ℂ`. Its *Gelfand topology* is the initial topology for the
evaluation maps `φ ↦ φ(f)`, `f ∈ O(X)`: a subbasic open set is
`{φ : |φ(f) - φ_0(f)| < ε}` for `f ∈ O(X)`, `φ_0 ∈ Char(O(X))` and `ε > 0`.

**Theorem 5.2** (reconstruction of the manifold). For a Stein manifold `X`, the evaluation map
`X → Char(O(X))`, `x ↦ ev_x`, is a homeomorphism for the Gelfand topology.

**Proof.** Theorem 2.2 gives bijectivity. Continuity is the continuity of the holomorphic functions
`f : X → ℂ`. For openness, let `U ⊆ X` be open and `x ∈ U`. By Definition 0.3(3), choose a global
holomorphic `F : X → ℂ^n` with `mfderiv F x` injective. By Lemma 1.2, `F` is a local biholomorphism
at `x`; shrinking, `F` maps a neighbourhood `V ⊆ U` of `x` homeomorphically onto a polydisc around
`F(x)`. A polydisc is an intersection of the sets `{y : |F_j(y) - c_j| < ε}`, and each is the
preimage under evaluation of a Gelfand-open set. Hence the image of `V` is an intersection of
Gelfand-open sets, and therefore open. Thus `V`, and therefore `U`, is a union of Gelfand-open
sets, and the evaluation map is open. ∎

The Gelfand topology is not the Zariski topology. The Zariski topology on `Char(O(X))` has basic
open sets `{φ : φ(f) ≠ 0}`; it is coarser than the Gelfand topology, and the evaluation map is
continuous but not a homeomorphism for it. For `X = ℂ`, a bounded disc is open in the usual
(Gelfand) topology but is not a union of complements of zero sets of entire functions, so the
Zariski topology is strictly coarser. The roadmap reconstructs the manifold with the Gelfand
topology and does not identify the full maximal ideal spectrum with `X`.

### 5.3 Reconstruction consequences

**Corollary 5.3** (algebra isomorphisms). For Stein manifolds `X` and `Y`, `X` and `Y` are
biholomorphic if and only if `O(X)` and `O(Y)` are isomorphic complex algebras. Every algebra
isomorphism is `f^*` for a unique biholomorphism `f : X → Y`.

**Proof.** Corollary 3.4. ∎

**Corollary 5.4** (automorphisms). For a Stein manifold `X`, the group of biholomorphisms of `X`
is isomorphic to the group of unital complex-algebra automorphisms of `O(X)`, by `f ↦ f^*`.

**Proof.** Corollary 3.3 applied to `X = Y`, together with the fact that `f ↦ f^*` preserves
composition and identities. ∎

### 5.4 What is not claimed

- Not every complex algebra is `O(X)` for a Stein manifold, and this roadmap does not characterize
  the essential image of `O`. That characterization is the theory of Stein algebras, which is a
  separate subject.
- The full maximal ideal space of `O(X)` can be strictly larger than `X`; only the character space
  with the Gelfand topology is reconstructed.
- The functor `O` is not essentially surjective and is not an equivalence onto all complex
  algebras.
- For a non-Stein target `Y`, Theorem 3.2 can fail (uniqueness fails for `Y = ℙ^1`); for a
  non-Stein source `X` and a Stein target `Y`, it still holds.

### Checks

- `X = ℂ`: `Char(O(ℂ))` with the Gelfand topology is `ℂ` with its usual topology. The Zariski
  topology is strictly coarser: the unit disc is not a union of complements of zero sets of
  entire functions.
- `X = ℂ^*`: `Char(O(ℂ^*))` is `ℂ^*`, and the Gelfand topology is the subspace topology. The
  automorphism `z ↦ 1/z` corresponds to the algebra automorphism `h ↦ h ∘ (1/z)`.
- `X` a finite set: `O(X) = ℂ^X`, and `Char(O(X))` is `X` with the discrete topology. The
  automorphism group is the symmetric group on `X`, matching Corollary 5.4.
- `X = ℂ^n ∖ {0}` with `n ≥ 2`: not Stein; `O(X) = O(ℂ^n)`, so `Char(O(X)) = ℂ^n` while `X` is
  missing `0`. The evaluation map is not surjective, so Theorem 5.2 fails without Stein.
- `X = ℙ^1`: `O(X) = ℂ`, so `Char(O(X))` is a singleton and the evaluation map is not injective.

### Dependencies

SF1–SF3; Mathlib's `AlgHom`, `AlgEquiv`, the initial topology and `TopologicalSpace`; Tau Ceti's
`TauCeti.holomorphicStructureSheaf` and `TauCeti.evalHom`. Theorem 5.2, Corollaries 5.3 and 5.4 are
the targets of SF5.

## Downstream consumers

**Toposify's holomorphic Dubuc topos.** Toposify's Milestone H7 uses complex manifolds as a site
model for the holomorphic Dubuc topos. For an open stage `U`, the algebra
`HolOn U / vanishingOnIdeal U` is isomorphic to the sections `Γ(U, O)` of the holomorphic
structure sheaf; this is the local comparison proved in
`Toposify/Holomorphic/Manifold/StructureSheaf.lean`. A general Stein stage is a zero locus `Z(I)`;
when `Z(I)` is a Stein manifold, Theorem 2.2 is the model statement that the characters of its
algebra of holomorphic functions are the points of `Z(I)`. The internal spectrum and the internal
logic of the topos are not part of this roadmap; SF2 supplies the ordinary points that the
internal theory refines.

**Stein algebra theory.** The character theorem and automatic holomorphy are the affine model for
Stein algebras: they say that the Stein manifold is recovered from its algebra of holomorphic
functions, and that algebra homomorphisms are holomorphic maps. The full characterization of the
essential image of `O` (which complex algebras are algebras of holomorphic functions on a Stein
manifold) is outside this roadmap.

## Scope and ownership

**This roadmap owns:**

- the Stein predicate, the holomorphic hull and their basic API (SF0), including the Hausdorff
  property, the Stein property of `ℂ^n` and of zero-dimensional manifolds, and the finiteness of
  compact Stein manifolds;
- the general Remmert–Narasimhan embedding theorem for an arbitrary Stein manifold (SF1, Theorem
  1.1), the manifold inverse function theorem and the proper-injective-immersion theorem used to
  turn it into a closed embedding (Lemmas 1.2 and 1.3), and the closed-submanifold consequences for
  the ideal sheaf (Lemma 1.5), which organize the Cartan input for SF2;
- Hadamard division (Lemma 2.0), the Euclidean character lemma (Lemma 2.1), the character theorem
  for Stein manifolds (Theorem 2.2), and the character-space corollary (Corollary 2.3);
- automatic holomorphy (Theorem 3.2), full faithfulness of the global-section functor (Corollary
  3.3), and the algebra-isomorphism/biholomorphism correspondence (Corollary 3.4);
- the Cousin II dictionary (Lemma 4.3), the Cousin II criterion on Stein manifolds (Theorem 4.4)
  and the exponential isomorphism corollary (Corollary 4.5), consuming the K4.P exponential
  sequence and first Chern class;
- the Gelfand reconstruction theorem (Theorem 5.2), the reconstruction consequences for algebra
  isomorphisms and automorphisms (Corollaries 5.3 and 5.4), and the distinction between the
  Gelfand and Zariski topologies on the character space.

**Owned elsewhere and consumed here:**

- RealAnalyticGeometry R3.1 (§3.1) owns the weighted `∂̄` theorem, the Stein criterion
  `isStein_of_strictlyPlurisubharmonic_exhaustion`, Oka–Weil approximation, finite-jet
  interpolation, and separation of points and tangents. SF1 uses these to know that a general
  Stein manifold has the polyhedral exhaustion and approximation properties needed for the
  embedding construction.
- RealAnalyticGeometry R3.2 (§3.2) owns the coherent module calculus, Cartan's theorems A and B
  (`nonempty_generatingSections_of_isStein`, `subsingleton_sheafH_of_isStein`), compact generation
  and the scalar Cousin I splitting. SF2 uses theorem A at a point outside the embedded manifold
  and theorem B for the ideal sheaf; SF4 uses theorem B for `O_X` in degrees one and two.
- RealAnalyticGeometry R4.1 (§4.1) owns the proper holomorphic embedding of the Stein tube of a
  real-analytic manifold and the detailed Forstnerič construction. SF1 owns the general Stein
  statement and cites R4.1 for the construction; it does not reprove the tube case.
- ComplexKahlerGeometry K3.4 (§3.4) owns Oka coherence, Noetherian holomorphic germs, local
  parametrization and the coherence of ideal sheaves. SF1 uses the coherence of the ideal sheaf of
  a closed complex submanifold of `ℂ^N`.
- ComplexKahlerGeometry K4.P (§4.5) owns the holomorphic exponential sequence, the identification
  `Pic(X) ≅ H¹(X, O_X^*)`, the integral first Chern class and its identification with the
  connecting map. SF4 consumes these and does not restate them.
- ComplexManifolds §7.3 owns holomorphic line bundles, their cocycles, the triviality criterion
  through a nowhere-zero holomorphic section, and the divisor dictionary. SF4 uses this dictionary
  for the meromorphic translation of Cousin II.
- ComplexComparisonPartII C4.1 (§4.1) owns Remmert's proper-image theorem and the Remmert–Stein
  extension theorem. These are not used in the proofs of this roadmap; C4.1 is cited to keep the
  Remmert–Narasimhan embedding distinct from Remmert's proper-image theorem.

**Explicitly not in scope:**

- Cartan's theorems A and B, Oka coherence, the Stein criterion, Oka–Weil approximation and
  Cousin I: owned by RealAnalyticGeometry R3.1–R3.2 and ComplexKahlerGeometry K3.4.
- Remmert's proper-image theorem and the Remmert–Stein extension theorem: owned by
  ComplexComparisonPartII C4.1.
- The Oka principle for holomorphic bundles and Grauert's theorem on the classification of
  bundles: owned by ComplexKahlerGeometry K4.P and not restated here.
- A general theory of meromorphic functions on complex manifolds, meromorphic sheaves and their
  resolutions: the roadmap uses only the Cartier divisor dictionary needed to translate Cousin II.
- The full maximal ideal spectrum of `O(X)` and the characterization of Stein algebras: only the
  character space with the Gelfand topology is reconstructed.
- Sharp embedding dimensions below `2n + 1`, the Eliashberg–Gromov h-principle, and embedding
  theorems for non-Stein manifolds: not claimed.
- The internal logic and internal spectrum of the holomorphic Dubuc topos: owned by Toposify.

## Exact supplier contracts

### From Mathlib

- `MDifferentiable`, `mfderiv`, `ContMDiff`, `ContMDiffAt`, `IsImmersion`, `IsSmoothEmbedding`,
  `IsProperMap`, `IsEmbedding`, `Topology.IsOpenEmbedding`.
- `HasStrictFDerivAt.localInverse`, `HasStrictFDerivAt.to_localInverse` and the inverse function
  theorem for `C^ω` maps between open subsets of normed spaces, for Lemma 1.2.
- `AnalyticAt`, `HasFPowerSeriesAt`, differentiation under the integral and the convexity of
  polydiscs, for Lemma 2.0.
- `TopCat.Sheaf`, `CommRingCat`, `AlgHom`, `AlgEquiv`, `Units`, `Module.Finrank`, `IsCompact`,
  `ProperSpace`, `sSup`, `TopologicalSpace.Opens` and the initial topology, throughout.

### From Tau Ceti

- `TauCeti.holomorphicStructureSheaf`, `TauCeti.ofContMDiff`, `TauCeti.evalHom`, `TauCeti.eval`,
  `TauCeti.germ_evalHom`, `TauCeti.homOfContMDiff` and `TauCeti.precomp`: the structure sheaf, its
  sections, its stalk evaluation and its precomposition morphism.
- `TauCeti.IsSteinManifold`, `TauCeti.mholomorphicHull` and the API
  `TauCeti.IsSteinManifold.t2Space`, `.self`, `.of_subsingleton`, `.finite_of_compactSpace`,
  `.exists_mdifferentiable_apply_ne`, `.exists_mdifferentiable_injective_mfderiv`: the Stein
  predicate of SF0, when the declaration is present. If it is not present, SF0 supplies it.
- `TauCeti.contMDiffAt_modelSpace_omega_iff_analyticAt`: the bridge between `C^ω` maps and analytic
  maps in the model space, used to read sections of the structure sheaf as holomorphic functions.

### From TauCetiRoadmap.RealAnalyticGeometry

- R3.1 (§3.1): `isStein_of_strictlyPlurisubharmonic_exhaustion`; Oka–Weil approximation on
  `O(X)`-convex compact sets; finite-jet interpolation; separation of points and tangents; the
  converse Stein criterion and the strictly plurisubharmonic exhaustion of the tube. SF1 uses these
  to replace the tube `T` of R4.1 by an arbitrary Stein manifold `X`.
- R3.2 (§3.2): `nonempty_generatingSections_of_isStein` (Cartan's theorem A),
  `subsingleton_sheafH_of_isStein` (Cartan's theorem B), the coherent module calculus and the
  scalar Cousin I splitting. SF2 uses theorem A at a point outside the embedded manifold and
  theorem B for the ideal sheaf; SF4 uses theorem B for `O_X` in degrees one and two.
- R4.1 (§4.1): the proper holomorphic embedding of the Stein tube of a real-analytic manifold, the
  Bishop almost-proper maps, the polyhedral exhaustion, the buffered compact-component
  approximation, the one-jet and two-point transversality, and the summable-error construction.
  SF1 exports the general Stein statement and cites this construction.

### From TauCetiRoadmap.ComplexKahlerGeometry

- K3.4 (§3.4): Oka coherence, Noetherian holomorphic germs, local parametrization, and the
  coherence of the ideal sheaf of a closed complex submanifold. SF1 uses the last item in
  Lemma 1.5.
- K4.P (§4.5): the holomorphic exponential sequence `0 → ℤ → O → O^* → 1`, the identification
  `Pic(X) ≅ H¹(X, O_X^*)`, the integral first Chern class and its identification with the
  connecting map. SF4 consumes all of these.

### From TauCetiRoadmap.ComplexManifolds

- §7.3: holomorphic line bundles, their cocycles and coboundaries, the triviality criterion through
  a nowhere-zero holomorphic section, and the divisor dictionary. SF4 uses this dictionary for the
  meromorphic translation of Cousin II.

### From TauCetiRoadmap.ComplexComparisonPartII

- C4.1 (§4.1): Remmert's proper-image theorem `remmertProperImage` and the Remmert–Stein extension
  theorem `remmertSteinExtension`. These are not used in the proofs of this roadmap; C4.1 is cited
  to keep the Remmert–Narasimhan embedding distinct from Remmert's proper-image theorem.

## References

- H. Remmert, “Sur les espaces analytiques holomorphiquement séparables et holomorphiquement
  convexes”, *C. R. Acad. Sci. Paris* 243 (1956), 118–121: the embedding of a Stein space into an
  affine space.
- R. Narasimhan, “Imbedding of holomorphically complete complex spaces”, *Amer. J. Math.* 82
  (1960), 917–934: the proper holomorphic embedding of a Stein manifold of dimension `n` into
  `ℂ^{2n+1}`.
- E. Bishop, “Mappings of partially analytic spaces”, *Amer. J. Math.* 83 (1961), 209–242: an
  alternative proof of the embedding theorem and the almost-proper map method.
- F. Forstnerič, “Holomorphic embeddings and immersions of Stein manifolds: a survey”,
  [arXiv:1709.05630](https://arxiv.org/abs/1709.05630), §2.1, Theorem 2.1 and Proposition 2.2: the
  construction, the target dimension `2n + 1`, the Bishop polyhedral shells and the fixed-target
  transversality used in SF1.
- L. Hörmander, *An Introduction to Complex Analysis in Several Variables*, 3rd edition,
  North-Holland Mathematical Library 7 (1990), Definition 5.1.3 and Chapter VII, (7.2.2),
  (7.2.4), (7.2.7), (7.2.8), (7.2.9) and (7.4.3): the Stein definition, Cartan's theorems A and B,
  and the compact-generation and approximation results supplied by R3.1–R3.2.
- H. Grauert and R. Remmert, *Coherent Analytic Sheaves*, Grundlehren der mathematischen
  Wissenschaften 265, Springer (1984), Chapters V–VI: Stein spaces, Stein algebras, the character
  space, and the Cousin problems.
- R. C. Gunning and H. Rossi, *Analytic Functions of Several Complex Variables*, Prentice-Hall
  (1965), Chapter VI: Stein algebras, the algebra `O(X)`, its spectrum, and Cartan's theorems.
- J.-P. Demailly, [*Complex Analytic and Differential Geometry*](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf),
  Chapter I, §6 (Stein spaces and holomorphic convexity); Chapter V, (8.2), p. 264, (9.2) and
  (9.5), pp. 264–265, and Chapter VI, §9.1, (9.1), p. 314 (the exponential sequence, the Picard
  group and the first Chern class); Chapter II, §8 (Remmert's proper-image theorem and the
  Remmert–Stein extension, cited for the distinction).
- O. Forster, *Lectures on Riemann Surfaces*, Graduate Texts in Mathematics 81, Springer (1981),
  §§26–30: Cousin I and II on Riemann surfaces, holomorphic line bundles, divisors and the
  exponential sequence in the one-variable case.
- H. Cartan, “Idéaux et modules de fonctions analytiques de variables complexes”, *Bull. Soc.
  Math. France* 78 (1950), 29–64, and “Faisceaux analytiques cohérents”, *Ann. Inst. Fourier* 6
  (1955), 39–64: Theorems A and B and coherent analytic sheaves.
- K. Oka, “Sur les fonctions analytiques de plusieurs variables”, especially the coherence theorems
  of the 1950s: Oka coherence, supplied by ComplexKahlerGeometry K3.4.
- H. Grauert, “On Levi's problem and the imbedding of real-analytic manifolds”, *Annals of
  Mathematics* (2) 68 (1958), 460–472: the Stein criterion, the strictly plurisubharmonic tube and
  the real-analytic embedding, supplied by R3.1 and R4.1.
