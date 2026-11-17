# Roadmap: dimer models and lozenge tilings

**Summary.** This roadmap builds two-dimensional lattice statistical mechanics in Tau Ceti, with the
dimer model on the hexagonal lattice (equivalently, lozenge tilings of the triangular lattice) as
its worked case. It starts from Mathlib's simple graphs, perfect matchings, placed tiles, product
spaces, weak convergence of probability measures, curve integrals and determinants, and from Tau
Ceti's characterisation of ergodic countable-group actions as extreme invariant measures. It builds
the triangular lattice with its faces, lozenges and dual hexagonal graph; tilings of regions as
perfect matchings; height functions, a combinatorial simple connectivity with a bridge to Mathlib's
`IsSimplyConnected`, the lattice of height functions, flips and Thurston's tileability criterion;
Kasteleyn's theorem and Kenyon's determinantal local statistics on finite simply connected regions;
Gibbs specifications on configuration spaces with a proper action of a countable group, and the
dimer specification on any locally finite periodic graph, with the face property and the
extreme-point characterisation of ergodic Gibbs measures; slopes; the classification of ergodic
Gibbs measures on the boundary of the slope triangle; torus tilings and the four-determinant
Kasteleyn formula on the torus; and the explicit determinantal kernel of an ergodic Gibbs measure of
every interior slope, identified with Okounkov–Reshetikhin's incomplete beta kernel and, along a
row, with the discrete sine kernel. The end theorems are: tilings are perfect matchings of the dual
graph (1.5); plane tilings are height functions (2.5); flip connectivity (2.8) and Thurston's
criterion (2.9); Kasteleyn's theorem and the local statistics formula (3.2, 3.3); the face and
ergodicity theorem for translation-invariant Gibbs measures (4.6, 5.3, with its lozenge instance in
5.4); the classification on the edges of the slope triangle, with two distinct ergodic Gibbs
measures of every non-corner edge slope (6.3); every torus limit is a translation-invariant Gibbs
measure of the prescribed slope (7.3); the torus partition function as a signed sum of four
determinants (8.3); existence of an ergodic Gibbs measure of every slope (9.5); existence,
uniqueness and ergodicity of the incomplete beta process of every complex slope (9.7); and
convergence of local statistics of tilings of growing regions to Gibbs measures (10.2).

The README is definitive; `Suggested.lean` is the roadmap's acceptance test and states the
headline theorems named in this document, each with `sorry`, with the simple definitions they
need. Suggested homes: `TauCeti/Combinatorics/Tiling/Lozenge/`
(Layers 1–3, 7–8), `TauCeti/Probability/Gibbs/` (Layers 4–5), `TauCeti/Probability/Dimer/`
(Layers 6, 9, 10).

## Scope and ownership

This roadmap owns:

- the triangular lattice on `ℤ × ℤ`, its edges, faces, colours, lozenges and lozenge types, its
  translations and its rotation of order three; the dual hexagonal graph; regions (arbitrary
  sets of faces), their interior and boundary edges and boundary vertices; tilings and free
  tilings of regions; the comparison of tilings with Mathlib's perfect matchings (Layer 1);
- integer edge cochains on regions, combinatorial simple connectivity, its bridge from
  topological simple connectivity of the union of faces in `ℝ²`, height functions of plane
  tilings and of tilings of regions, boundary heights, the distributive lattice of height
  functions, flips, flip connectivity and Thurston's criterion (Layer 2);
- Kasteleyn matrices of finite regions with positive edge weights, Kasteleyn's theorem for
  finite simply connected regions and the determinantal formula for lozenge correlations
  (Layer 3);
- tail σ-algebras of product spaces over a countable index set with a proper action of a
  countable group, identified along an enumeration with Tau Ceti's `tailProcess`, the theorem
  that invariant events are almost surely tail events, tail triviality and ergodicity of Bernoulli
  product measures under such actions, the weak topology on probability measures of a
  finite-alphabet subshift, Gibbs specifications and their Gibbs measures, the stability of the
  Gibbs property under tail-measurable densities, the face property of the invariant Gibbs
  measures, and their weak closedness (Layer 4);
- perfect-matching configuration spaces of locally finite countable graphs with a proper action
  of a countable group, the weighted dimer specification, its cylinder-identity form, and the
  lozenge instance on the hexagonal graph (Layer 5);
- slopes of translation-invariant measures on plane tilings, the corners and the edges of the
  slope triangle (Layer 6); torus tilings, height changes and torus measures (Layer 7);
  Kasteleyn theory on the torus (Layer 8); the infinite inverse Kasteleyn kernel, Riemann-sum
  limits on good tori, the resulting ergodic Gibbs measures, the incomplete beta kernel and the
  discrete sine kernel (Layer 9); local-statistics convergence of measures on tilings of growing
  regions (Layer 10).

It does not own, and does not restate:

- simple graphs, `SimpleGraph.induce`, subgraphs and `SimpleGraph.Subgraph.IsPerfectMatching`;
  product topologies and σ-algebras, the σ-algebras `MeasureTheory.cylinderEvents Δ` generated by
  the coordinates in a set `Δ`, the ring `MeasureTheory.measurableCylinders` of measurable
  cylinders and its generation of the product σ-algebra, `MeasureTheory.ProbabilityMeasure` with
  its weak topology, compactness of probability measures on a compact space, the portmanteau
  implications and the π-system convergence criterion; Markov kernels measurable for a
  sub-σ-algebra, their composition, properness of a single kernel
  (`ProbabilityTheory.Kernel.IsProper`) and invariance of a measure under a kernel
  (`ProbabilityTheory.Kernel.Invariant`); closed shift-invariant subsets of `G → A` indexed by the
  acting monoid `G` itself (`SymbolicDynamics.FullShift.MulSubshift`); Kolmogorov's zero-one law;
  `ErgodicSMul`; conditional expectation; determinants and inverses; the lifting criterion through
  covering maps; the Riemann–Lebesgue lemma; curve integrals of 1-forms along paths — all in
  Mathlib (exact names under the supplier contracts);
- Mathlib's language of placed tiles, `DiscreteTiling.Prototile`, `DiscreteTiling.Protoset` and
  `DiscreteTiling.PlacedTile` (`Mathlib/Combinatorics/Tiling/Tile.lean`), which at the pin
  describes single copies of prototiles under a group action and has no notion of a tiling; 1.4
  identifies the lozenges with the placed tiles of the protoset of the three lozenges, and a
  tiling is encoded here by the set of inner edges of its lozenges, the perfect-matching form of
  1.5;
- the characterisation of ergodic invariant probability measures of a countable group action as
  extreme points of the invariant probability measures, `ErgodicSMul.iff_mem_extremePoints`,
  the convex set `TauCeti.MeasureTheory.invariantMeasuresOfMeasureUnivEq`, and the test of
  ergodicity on exactly invariant events,
  `TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` — already in Tau Ceti; this
  roadmap applies them and adds the Gibbs-specific face property;
- contour integrals along piecewise `C¹` curves, winding numbers and the homology form of Cauchy's
  theorem, `TauCeti.Contour.homologyCauchyTheorem` — already in Tau Ceti, built by the completed
  ContourIntegration roadmap (Layer 3, the global homological Cauchy theorem); 9.6 applies them;
- the tail σ-algebra of an ℕ-indexed process, `TauCeti.Probability.tailProcess`, with its normal
  form as the intersection of the future σ-algebras — already in Tau Ceti; the tail σ-algebra of
  4.1 differs in being indexed by an arbitrary countable set carrying a proper action of a
  countable group, under which it is equivariant, and for an infinite index set it equals
  `tailProcess` of the coordinate process along any enumeration;
- the Bernoulli shift of an infinite discrete group `Γ` on `S^Γ`, for a finite `S` with at least
  two positive weights, with its measure preservation, ergodicity and the null fixed-point sets of
  its non-identity elements, which VonNeumannAlgebras owns (Layer 8, target
  V8.BernoulliArbitraryDiscrete), and its extension to a general nontrivial standard base for a
  countably infinite `Γ`, which FactorRigidity §8.3 builds, and the Bernoulli action of a
  countable discrete group `G` on `G → α` for any measurable `α` and probability law, with its
  mixing for infinite `G`, which ClassicalErgodicTheory §0.3 (item 2) and §1.4 (item 2) build;
  4.3 is a kept variant that differs in taking a countable `Γ` acting properly on any countable
  index set `I` (the edges of the hexagonal graph under `ℤ²` among them), any measurable alphabet
  and any law `ν`, point masses included, and in proving tail triviality by Kolmogorov's zero-one
  law;
- Jacobi's complementary-minor identity, which expresses a minor of a square matrix with
  invertible determinant through the complementary minor of its inverse,
  `Matrix.det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv` —
  already in Tau Ceti; 3.3 and 8.4 apply it to the restricted Leibniz sums of Kasteleyn
  matrices (Conventions);
- the finite triangular array `Δₙ = {(x,y,z) ∈ ℕ³ : x+y+z = n}` with its unit rhombi and hives,
  which TensorProductCombinatorics §1.1 owns for tensor-product multiplicities: it is a finite
  barycentric carrier for concave functions, not the infinite lattice with its dual graph used
  here, and no target here needs a comparison;
- determinantal point processes on continuous spaces and the continuous sine kernel, which
  RandomMatrices §8.3–8.4 owns; the discrete sine kernel of 9.7 is the lattice counterpart and
  is stated here only as a kernel of a measure on tilings;
- the perfect-matching theory of finite bipartite multigraphs of GraphConnectivityAndFlows §§6.7
  and 6.9, and Tau Ceti's perfect matchings of a finite type as fixed-point-free involutions,
  `TauCeti.IsPerfectMatching` (`TauCeti/Combinatorics/Enumerative/PerfectMatching.lean`), neither
  of which is used: matchings here are Mathlib's perfect matchings of simple graphs, finite or
  infinite;
- the Gibbs states of finite quantum systems, `Matrix.gibbsState`
  (`TauCeti/Analysis/CStarAlgebra/Action/Gibbs.lean`), the KMS states of a matrix Hamiltonian:
  a different object from the classical Gibbs measures of a specification built here, and not
  used;
- the Gibbs measures of an equilibrium state in Bowen's sense, `IsGibbsMeasure T φ μ` of
  ClassicalErgodicTheory §8.4 (two-sided bounds on the masses of Bowen balls for a potential of a
  single map), a different notion from the Gibbs measures of a specification of 4.5, and the
  invariant Radon probabilities of a single continuous map of a compact Hausdorff space, closed
  and convex, of ClassicalErgodicTheory §5.1; the weak closedness of 4.6(c) is the
  countable-group form on a finite-alphabet subshift, where the invariant probability measures
  are the intersection over `γ ∈ Γ` of the closed sets of measures fixed by the homeomorphism
  `ω ↦ γω`;
- the incomplete Beta function `B_x(a,b)` of SpecialFunctionsEiLiErfIncompleteGamma Layer 15, a
  real integral over `[0,x]` with exponents `a, b > 0`: the incomplete beta kernel of 9.6
  integrates integer powers of `z` and `1 − z` along a path in `ℂ ∖ {0,1}` between complex
  conjugate endpoints, and is not a value of it.

Outside this roadmap, and the subject of its Part II (DimerModelsAndLozengeTilingsPartII):
Sheffield's uniqueness of the ergodic Gibbs measure of each interior slope and the consequent
convergence of the fixed-height-change torus measures; the specific free energy, surface tension
and the Cohn–Kenyon–Propp variational principle with limit shapes; the continuum objects of
Aggarwal's universality theorem (admissible functions, the entropy functional and its maximiser,
convergence of domains); amoebae and the frozen–liquid–gaseous classification for general
periodic weights; general periodic bipartite planar graphs, the planar Kasteleyn theorem and
domino tilings. No ergodic theorem (Birkhoff or mean ergodic theorem for `ℤ²`) and no ergodic
decomposition is used: ergodicity enters only as triviality of invariant events.

## Conventions

All conventions below are fixed.

- **Lattice.** Vertices are `ℤ × ℤ`. The positive directions are `e₁ = (1,0)`, `e₂ = (0,1)`,
  `e₃ = (1,1)`. An edge is a pair `(v,k)` with `v ∈ ℤ²` and `k ∈ {1,2,3}`, the segment from `v`
  to `v + e_k`; every edge of the triangular lattice 𝕋 has exactly one such name (carrier
  `TriEdge`, with fields `v : ℤ × ℤ` and `k : Fin 3`). The direction `k ∈ {1,2,3}` is stored as
  the index `k − 1 ∈ {0,1,2}` of `Fin 3`, and `latticeDir` lists `e₁, e₂, e₃` in that order, so
  the README's edge `(v,3)` is the Lean term `⟨v, 2⟩`; `TriEdge.target` is the endpoint
  `v + e_k`. This is the lattice of Aggarwal's Section 1.2 (aggarwal2023 lines 324–336), drawn on
  `ℤ²` rather than with angles π/3.
- **Faces and colours.** The faces are the white faces `W(v) = {v, v+e₁, v+e₃}` and the black
  faces `B(v) = {v, v+e₂, v+e₃}` (carrier `TriFace`, with fields `v` and `isWhite : Bool`; its
  edge set is `TriFace.edges`, a `Finset TriEdge`). The edges of `W(v)` are `(v,1)`,
  `(v+e₁,2)`, `(v,3)`; those of `B(v)` are `(v,2)`, `(v+e₂,1)`, `(v,3)`. Consequently `(v,1)` lies
  in `W(v)` and `B(v−e₂)`, `(v,2)` in `B(v)` and `W(v−e₁)`, and `(v,3)` in `W(v)` and `B(v)`.
- **Lozenges.** A lozenge is the union of the two faces containing an edge, its inner edge; its
  type is the direction of the inner edge. Type 1 is `W(v) ∪ B(v−e₂)`, with vertices
  `v−e₂, v, v+e₁, v+e₃`; type 2 is `W(v−e₁) ∪ B(v)`; type 3 is the unit square `W(v) ∪ B(v)`.
  These are Aggarwal's types 1, 2, 3 (aggarwal2023 lines 343–361). The white face `W(v)` is
  matched across `(v,1)`, `(v+e₁,2)`, `(v,3)` to `B(v−e₂)`, `B(v+e₁)`, `B(v)` respectively.
- **Regions and tilings.** A region is any set `R` of faces, finite or infinite. A tiling of `R`
  is a set `M` of edges each lying in two faces of `R`, such that every face of `R` contains
  exactly one edge of `M` (`IsTiling R M`, for `R : Set TriFace` and `M : Set TriEdge`); a free
  tiling drops the first condition and only asks `M` to consist of edges of faces of `R`. The
  lozenges of a free tiling may overlap in a face outside `R` (1.4, Checks). For a region
  `Faces(V)` of 1.3 they cannot: a face outside it has a vertex outside `V` and hence at most one
  edge in `E(R)`, so the lozenges are disjoint, each has one or two faces in `R`, and the free
  tilings are Aggarwal's, tilings of `R` whose lozenges may each stick out of `R` by a single face
  (aggarwal2023 lines 380–383). A plane tiling is a tiling of the set of all faces,
  `IsTiling Set.univ M`; `𝔈(𝕋)` is the set of plane tilings and `𝔈(R)` the set of tilings of `R`.
  A finite region is written `R : Finset TriFace` where matrices indexed by its faces are formed.
- **Configurations.** A configuration is a function `ω : TriEdge → Bool`, identified with its edge
  set `{e | ω e = true}`; it carries the product topology and the product σ-algebra of the
  discrete `Bool`, and measures on tilings are measures on `TriEdge → Bool`. The cylinder of `ω`
  on a finite set `E` of edges is `{η | ∀ e ∈ E, η e = ω e}`; the cylinders generate the
  σ-algebra and are clopen.
- **Heights.** The neutral increment of an edge is `c₀(v,k) = 0` for `k = 1, 2` and `c₀(v,3) = 1`
  (`neutralIncrement`).
  The height function `H_M` of a plane tiling `M` satisfies `H_M(0) = 0`,
  `H_M(v+e₁) − H_M(v) = [(v,1) ∈ M]`, `H_M(v+e₂) − H_M(v) = [(v,2) ∈ M]` and
  `H_M(v+e₃) − H_M(v) = 1 − [(v,3) ∈ M]`; across an edge outside `M` the increment is neutral.
  This is aggarwal2023 lines 395–398. Witness: the all-type-1 tiling `M₁` has `H(x,y) = x`, the
  all-type-2 tiling `M₂` has `H = y`, the all-type-3 tiling `M₃` has `H = 0`. Gorin's height
  (gorin2021 lines 447–453: positive directions `(1,0)`, `(0,1)`, `(−1,−1)`, increment `+1` along
  a lozenge side and `−2` across a lozenge) is `h_G(x,y) = x + y − 3H(x,y)`; for `M₃` it is
  `x + y`, which rises by `1` along `e₁` and drops by `2` along `−e₃`, across the inner edge of
  each square.
- **Translations and rotation.** `ℤ²` acts additively: `τ_w M = {(v+w,k) : (v,k) ∈ M}`, and on
  measures by push-forward. On `TriEdge` the action is `w +ᵥ (v,k) = (w + v, k)`; on
  configurations it is Mathlib's `arrowAddAction`, `(w +ᵥ ω) e = ω (−w +ᵥ e)`, whose edge set is
  `τ_w` of the edge set of `ω`. Translation invariance of a measure is Mathlib's
  `VAddInvariantMeasure (ℤ × ℤ) (TriEdge → Bool)` and ergodicity is `ErgodicVAdd`. Aggarwal's
  `S_w` translates by `−w` (aggarwal2023 lines 416–418); translation invariance is the same
  notion. The rotation `ρ(x,y) = (−y, x−y)` has order three, maps white faces to white faces and
  edge directions `1 ↦ 2 ↦ 3 ↦ 1`; heights transform by
  `H_{ρM}(w) = H_M(ρ⁻¹w) + w₁`, where `w₁` is the first coordinate of `w`; witness: `ρM₁ = M₂`
  and `H_{M₁}(ρ⁻¹w) + w₁ = (w₂ − w₁) + w₁ = w₂`.
- **Slopes.** For a translation-invariant probability measure μ on `𝔈(𝕋)` the slope is
  `(s,t) = (μ{(0,1) ∈ M}, μ{(0,2) ∈ M})`, the expected height increments along `e₁` and `e₂`
  (aggarwal2023 lines 421–431); `s`, `t`, `1 − s − t` are the densities of lozenges of types 1,
  2, 3. `𝒯 = {(s,t) : s > 0, t > 0, s + t < 1}` and `𝒯̄` is its closure. Witness: the point
  masses at `M₁`, `M₂`, `M₃` have slopes `(1,0)`, `(0,1)`, `(0,0)`. The Lean function `slope`
  evaluates the two probabilities with `Measure.real` for every measure on configurations; it is
  read as a slope only on translation-invariant probability measures.
- **Weights.** An edge weight is a function `w : TriEdge → ℝ`; it is positive when all its values
  are. A finite set `M` of edges has weight `∏_{e∈M} w(e)`. Type weights `(w₁,w₂,w₃)` give every
  edge of direction `k` the weight `w_k`. Probabilities (Layer 3, 8.4, Layer 9) use positive
  weights; the algebraic identities 8.1–8.3 hold for every real periodic weight.
- **Kasteleyn matrices.** For a finite region `R`, `K_R = kasteleynMatrix R w` has rows the white
  faces `whiteFaces R` and columns the black faces `blackFaces R`, entry `w(e)` when the two faces
  share the edge `e` and `0` otherwise (the sum of `w` over their common edges, of which there is
  at most one). A determinant is taken after composing with a bijection `σ` from black to white
  faces, as `det ((kasteleynMatrix R w).submatrix id σ.symm)`; its absolute value and the inverse
  `K_R⁻¹(g, f) = ((kasteleynMatrix R w).submatrix id σ.symm)⁻¹ (σ g) f` (rows black, columns white)
  do not depend on `σ`.
- **Restricted Leibniz sums.** Let `A` be a square matrix over a commutative ring whose rows `I`
  and columns `J` are finite types, with a fixed bijection `β : J → I` (for a Kasteleyn matrix the
  bijection of the previous item; for the twisted matrices `K_{ab}` the common indexing of white
  and black faces by the fundamental domain). A bijection `σ : I → J` has sign `sgn(β ∘ σ)`, and
  `det A` is the determinant of the square matrix `(i,i') ↦ A(i, β⁻¹ i')`. For distinct rows
  `i₁, …, i_k` and distinct columns `j₁, …, j_k` the restricted Leibniz sum is
  `Λ_A(i;j) = Σ_{σ(i_l) = j_l} sgn(σ) ∏_{i ∉ {i_l}} A(i, σ i)`: the terms of the Leibniz expansion
  of `det A` that send every `i_l` to `j_l`, each without its factors `A(i_l, j_l)`. Fixing one
  such `σ₀` and writing `σ = σ₀ ∘ ρ`, with `ρ` a permutation of the rows outside `{i_l}`, shows
  that `Λ_A(i;j)` is `sgn(σ₀)` times the determinant of the complementary minor
  `(i,i') ↦ A(i, σ₀ i')`, `i, i' ∉ {i_l}`. For `k = 0`, `Λ_A = det A`; changing `β` multiplies
  `det A` and every `Λ_A(i;j)` by the same sign. Witness: `A = [[1,2,0],[0,1,3],[4,0,1]]` indexed
  by `{0,1,2}`, `β` the identity, `(i₁,i₂) = (0,2)`, `(j₁,j₂) = (1,0)`: the only admissible `σ` is
  the 3-cycle `0 ↦ 1 ↦ 2 ↦ 0`, of sign `+1`, so `Λ_A = A(1,2) = 3`; the complementary minor is the
  same `1 × 1` matrix `[3]`. With `det A = 25` and `25 A⁻¹ = [[1,−2,6],[12,1,−3],[−4,8,1]]`,
  `det[(A⁻¹)(j_l, i_m)] = det[[12,−3],[1,6]]/625 = 3/25`, so `det A · 3/25 = 3 = Λ_A`, the form in
  which 3.3 and 8.4 use Tau Ceti's complementary-minor identity.
- **Torus.** For `n₁, n₂ ≥ 1` the torus tilings are the plane tilings invariant under
  `n₁ℤ × n₂ℤ`. The height change is `(h₁,h₂)` with `H_M(v + (n₁,0)) − H_M(v) = h₁` and
  `H_M(v + (0,n₂)) − H_M(v) = h₂`. A torus lozenge is an `L`-orbit of plane edges, so it keeps its
  direction (its type); the three torus lozenges at `W(v)` are the orbits of `(v,3)`, `(v,1)` and
  `(v+e₁,2)`, joining `W(v)` to `B(v)`, `B(v−e₂)` and `B(v+e₁)` modulo `L`. For `(a,b) ∈ {0,1}²` the
  signed weight of a torus lozenge is its weight, multiplied by `(−1)^a` for a type-2 lozenge
  crossing the vertical seam (`W(v)`–`B(v+e₁)` with `v` in the last column) and by `(−1)^b` for a
  type-1 lozenge crossing the horizontal seam (`W(v)`–`B(v−e₂)` with `v` in the first row). The
  twisted Kasteleyn matrix `K_{ab}` indexes rows and columns by the fundamental domain
  `[0,n₁) × [0,n₂)` (white `W(v)` and black `B(v)` both by `v`, the Lean index type being
  `Fin n₁ × Fin n₂` with its modular addition and `a, b : Fin 2`), and its entry at
  `(W(u), B(u'))` is the sum of the signed weights of the torus lozenges joining `W(u)` to `B(u')`
  modulo `L` (`twistedKasteleyn n₁ n₂ w a b`). The weight of a torus lozenge is `w` at its
  representative edge: `w(u,3)`, `w(u,1)` and `w(u+e₁,2)` for the lozenges at `W(u)`, the last
  equal to `w` at the representative in the fundamental domain by periodicity. For
  `n₁, n₂ ≥ 2` the three black neighbours of a white face are distinct and each entry has at most
  one summand; for `n₁ = 1` (types 2 and 3) or `n₂ = 1` (types 1 and 3) different lozenges share an
  entry, and on the `1 × 1` torus all three do. This is gorin2021 Definition 3.9 (lines 1452–1457),
  whose signs are attached to edges, in these coordinates.
- **Kernels.** For type weights `w = (w₁,w₂,w₃)` put `P̂_w(θ,φ) = w₃ + w₂e^{iθ} + w₁e^{−iφ}`; `w` is
  liquid when the strict triangle inequalities hold. For liquid `w` and `d ∈ ℤ²`,
  `G_w(d) = (4π²)⁻¹ ∬_{[0,2π]²} e^{i(d₁θ + d₂φ)} / P̂_w(θ,φ) dθ dφ`, and the infinite inverse Kasteleyn
  matrix is `K⁻¹_∞(B(v'), W(v)) = G_w(v' − v)`. Witness for `w = (1,1,1)`: `G(0) = 1/3` and
  `G(0,−2) = √3/(2π) − 1/3`.
- **Complex slope and incomplete beta kernel.** For `(s,t) ∈ 𝒯` put
  `ξ(s,t) = e^{πis} sin(πt) / sin(π(1−s−t))`, the apex of the triangle on `[0,1]` with angles
  `πs` at `0` and `πt` at `1`; `(s,t) ↦ ξ` is a bijection `𝒯 → ℍ` (aggarwal2023 lines 505–507).
  The sine weights of `(s,t) ∈ 𝒯` are the type weights `w(s,t) = (sin πs, sin πt, sin π(1−s−t))`.
  By the law of sines they are `sin π(1−s−t)` times the sides `|1−ξ|`, `|ξ|`, `1` of the triangle
  `0, 1, ξ`, opposite its angles `πs`, `πt`, `π(1−s−t)`; so they are positive and liquid (strict
  triangle inequalities), and the angle `θ_k` of 9.1 opposite `w_k` is `πs`, `πt`, `π(1−s−t)` for
  `k = 1, 2, 3`. Witness: `w(1/3,1/3) = (√3/2, √3/2, √3/2)`, and `w(0.3,0.45) ≈ (0.8090, 0.9877,
  0.7071)` with `w₂/w₃ ≈ 1.3968 = |ξ|` and `w₁/w₃ ≈ 1.1441 = |1−ξ|`.
  `X(M) = {v : (v,1) ∈ M}` is the set of type-1 positions (aggarwal2023 Definition 1.2, lines
  463–464: the centre of the type-1 lozenge with inner edge `(v,1)` is `v + (1/2, 0)`). For
  `v_j = (x_j,y_j)`, `K_ξ(v₁;v₂) = (2πi)⁻¹ ∫_{ξ̄}^{ξ} (1−z)^{y₁−y₂} z^{x₂−x₁−1} dz` along a path in
  `ℂ ∖ {0,1}` crossing the real axis once, in `(0,1)` when `y₁ ≥ y₂` and in `(−∞,0)` when
  `y₁ < y₂` (aggarwal2023 Definition 1.3, lines 472–476; okounkov-reshetikhin2003 Definition 4,
  lines 965–968). The integrand is single-valued with poles only at `0` and `1`, so the value
  depends only on the side of crossing; the polygonal paths `ξ̄ → 1/2 → ξ` and `ξ̄ → −1 → ξ` are
  the defining representatives (`incompleteBetaKernel ξ v₁ v₂`: with `f` the integrand and `c` the
  crossing point `1/2` or `−1`, the sum of Mathlib's curve integrals `curveIntegral` of the 1-form
  `f(z) dz` along `Path.segment ξ̄ c` and `Path.segment c ξ`, where `curveIntegral_segment`
  parametrises a segment `[a, b]` by `a + t(b − a)`, `t ∈ [0,1]`; integer powers are `zpow`).
  Witness: `K_ξ(v;v) = arg(ξ)/π = s`.
- **Sizes and real numbers.** Probabilities are real numbers in `[0,1]`; all divisions are real.
  Natural-number subtraction does not occur: height changes satisfy `n₂h₁ + n₁h₂ ≤ n₁n₂`, and
  `n₁n₂ − n₂h₁ − n₁h₂` is computed in `ℤ`.

## Exact supplier contracts

### From Mathlib

At the Mathlib revision pinned in `lake-manifest.json`.

- `SimpleGraph`, `SimpleGraph.induce` (`Mathlib/Combinatorics/SimpleGraph/Maps.lean`, an abbrev
  giving the induced graph on a subtype), `SimpleGraph.LocallyFinite`
  (`Mathlib/Combinatorics/SimpleGraph/Finite.lean`), `SimpleGraph.Subgraph`,
  `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.Subgraph.IsPerfectMatching` and
  `SimpleGraph.Subgraph.isPerfectMatching_iff` (`Mathlib/Combinatorics/SimpleGraph/Matching.lean`:
  a perfect matching is a spanning subgraph in which every vertex has exactly one neighbour).
- `Pi.topologicalSpace` (`Mathlib/Topology/Constructions.lean`), `Function.compactSpace` and
  `Pi.compactSpace` (`Mathlib/Topology/Compactness/Compact.lean`); `MeasurableSpace.pi`
  (`Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean`); `MeasureTheory.Measure.infinitePi`
  (`Mathlib/Probability/ProductMeasure.lean`, for a family of probability measures), with
  `MeasureTheory.Measure.infinitePi_map_piCongrLeft` (the same file, line 494: for probability
  measures `μ i` on measurable spaces `X i` and `e : α ≃ ι`, the push-forward of
  `infinitePi (fun a => μ (e a))` along `MeasurableEquiv.piCongrLeft X e`, which sends `f` to the
  function with value `f a` at `e a`, is `infinitePi μ`; for a constant family and `e` the
  bijection `i ↦ γi` of `I`, this is invariance of `ν^{⊗I}` under `(γω)(i) = ω(γ⁻¹i)`);
  `ProbabilityTheory.iIndepFun_infinitePi` (`Mathlib/Probability/Independence/InfinitePi.lean`,
  line 124: for probability measures `P i` and measurable maps `f i` on the factors, the functions
  `ω ↦ f i (ω i)` are independent under `infinitePi P`);
  `ProbabilityTheory.iIndepFun.precomp` and `ProbabilityTheory.iIndepFun_iff_iIndep`
  (`Mathlib/Probability/Independence/Basic.lean`, lines 323 and 231: an independent family stays
  independent along an injective reindexing, and independence of functions is independence of the
  σ-algebras they generate). 4.3 uses them to feed the coordinates along an enumeration
  `e : ℕ ≃ I` to the zero-one law.
- `Pi.borelSpace` (`Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean`, line 645: for a
  countable index type and factors that are second-countable Borel spaces, the product σ-algebra
  is the Borel σ-algebra of the product topology; a factor whose σ-algebra is not its Borel
  σ-algebra is not covered); `DiscreteMeasurableSpace`
  (`Mathlib/MeasureTheory/MeasurableSpace/Defs.lean`: every subset is measurable) and
  `DiscreteMeasurableSpace.toBorelSpace` (the same Borel file: a space with the discrete topology
  and the discrete σ-algebra is a Borel space); `Subtype.borelSpace` (the same Borel file: a subset
  of a Borel space, with the subspace topology and the trace σ-algebra, is a Borel space);
  `Bool.instMeasurableSpace` (defined as `⊤`,
  `Mathlib/MeasureTheory/MeasurableSpace/Instances.lean`) and `Bool.borelSpace`. These are the
  Borel structures of 4.4–4.6 and Layers 5–10.
- `MeasureTheory.ProbabilityMeasure` and its weak topology
  (`Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`: the topology instance is stated for an
  `OpensMeasurableSpace`); the instance `CompactSpace (ProbabilityMeasure E)` for a compact
  Hausdorff Borel space `E` (`Mathlib/MeasureTheory/Measure/Prokhorov.lean`, line 176);
  `MeasureTheory.ProbabilityMeasure.tendsto_measure_of_isClopen_of_tendsto` and
  `IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem`
  (`Mathlib/MeasureTheory/Measure/Portmanteau.lean`: the first needs `OpensMeasurableSpace` and
  `HasOuterApproxClosed`, which Mathlib provides for every pseudo-metrisable space in
  `Mathlib/MeasureTheory/Measure/HasOuterApproxClosed.lean`; the second needs
  `OpensMeasurableSpace`, second countability, a π-system of measurable sets containing
  arbitrarily small neighbourhoods of every point, and a countably generated filter).
- `MeasureTheory.cylinderEvents` (`Mathlib/MeasureTheory/Constructions/Cylinders.lean`, line 409:
  the σ-algebra on a product generated by the coordinates in a set `Δ`), with
  `MeasureTheory.cylinderEvents_mono` and `MeasureTheory.cylinderEvents_le_pi` (lines 415 and 418:
  monotone in `Δ` and below the product σ-algebra); `MeasureTheory.Filtration.cylinderEventsCompl`
  (`Mathlib/Probability/Process/Filtration.lean`, line 534: the σ-algebras `cylinderEvents Λᶜ`,
  `Λ` finite, as a family decreasing in `Λ`). Mathlib does not form their intersection.
- `MeasureTheory.measurableCylinders` (the same cylinders file, line 275: the sets
  `cylinder s B` with `s` a finite set of indices and `B` a measurable subset of the product over
  `s`), `MeasureTheory.isPiSystem_measurableCylinders`,
  `MeasureTheory.univ_mem_measurableCylinders` and `MeasureTheory.generateFrom_measurableCylinders`
  (lines 335, 345 and 366: a π-system containing the whole space and generating
  `MeasurableSpace.pi`), and `MeasureTheory.isSetRing_measurableCylinders`
  (`Mathlib/MeasureTheory/Constructions/ProjectiveFamilyContent.lean`, line 57: a ring of sets);
  `IsPiSystem.comap` (`Mathlib/MeasureTheory/PiSystem.lean`, line 106), so that the traces of the
  measurable cylinders on a subset form a π-system.
- `MeasureTheory.exists_measure_symmDiff_lt_of_generateFrom_isSetRing`
  (`Mathlib/MeasureTheory/Measure/MeasuredSets.lean`, line 86): for a finite measure, a ring of
  sets `C` generating the σ-algebra and a countable subfamily of `C` whose union has null
  complement, every measurable set is approximated by members of `C` in the measure of the
  symmetric difference. 4.2 and 9.4 take for `C` the measurable cylinders and for the subfamily
  `{univ}` (`MeasureTheory.univ_mem_measurableCylinders`).
- `ProbabilityTheory.Kernel`, with the notation `Kernel[𝓑, 𝓧] X X` for a kernel measurable for
  `𝓑` on its source and for `𝓧` on its target, and `ProbabilityTheory.IsMarkovKernel`
  (`Mathlib/Probability/Kernel/Defs.lean`, lines 55, 70 and 138); `ProbabilityTheory.Kernel.comp`,
  written `η ∘ₖ κ`, which applies `κ` first: `(η ∘ₖ κ) a = (κ a).bind η`
  (`Mathlib/Probability/Kernel/Composition/Comp.lean`, line 50); `ProbabilityTheory.Kernel.comap`
  (`Mathlib/Probability/Kernel/Composition/MapComap.lean`, line 152) along the identity, with
  `measurable_id''` (`Mathlib/MeasureTheory/MeasurableSpace/Basic.lean`, line 233), which reads a
  kernel measurable for `𝓑 ≤ 𝓧` on its source as a kernel for `𝓧`;
  `ProbabilityTheory.Kernel.IsProper` (`Mathlib/Probability/Kernel/Proper.lean`, line 47) with
  `ProbabilityTheory.Kernel.isProper_iff_inter_eq_indicator_mul` (line 57: for `𝓑 ≤ 𝓧`,
  properness is `π x (A ∩ B) = 1_B(x) · π x A` for `A ∈ 𝓧` and `B ∈ 𝓑`) and
  `ProbabilityTheory.Kernel.IsProper.setLIntegral_eq_comp` (line 73: for `𝓑 ≤ 𝓧`, `A ∈ 𝓧` and
  `B ∈ 𝓑`, `∫⁻_B π(·)(A) dμ = (μ.bind π)(A ∩ B)`); `ProbabilityTheory.Kernel.Invariant`
  (`Mathlib/Probability/Kernel/Invariance.lean`, line 39: `μ.bind κ = μ`, for a kernel with one
  σ-algebra on source and target).
- `SymbolicDynamics.FullShift.MulSubshift` and its additive form
  `SymbolicDynamics.FullShift.Subshift` (`Mathlib/Dynamics/SymbolicDynamics/Basic.lean`, lines 253
  and 233: a closed subset of `G → A` mapped into itself by every `mulShift g`, where
  `(mulShift g x)(h) = x(g * h)`, line 150), with `SymbolicDynamics.FullShift.isOpen_cylinder`
  and `SymbolicDynamics.FullShift.isClosed_cylinder` (lines 214 and 219). Its index set is the
  monoid `G` itself and its cylinders are indexed by finite subsets of `G`; Layers 4–10 need index
  sets with several orbits (the edges of the hexagonal graph under `ℤ²`), which it does not cover.
- `ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup` and its sequential form
  `ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`
  (`Mathlib/Probability/Independence/ZeroOne.lean`, lines 229 and 290: Kolmogorov's zero-one law
  along a filter and a directed family of index sets, and for an event measurable with respect to
  `limsup s atTop` when the σ-algebras `s n` are independent under the measure).
- `ErgodicSMul`, `ErgodicVAdd` (`Mathlib/Dynamics/Ergodic/Action/Basic.lean`: ergodicity tests
  almost invariant measurable sets); `MeasureTheory.SMulInvariantMeasure`
  (`Mathlib/MeasureTheory/Group/Defs.lean`); `Set.extremePoints`, `IsExtreme`
  (`Mathlib/Analysis/Convex/Extreme.lean`).
- `MeasureTheory.condExp` (`Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`).
- `Matrix.det`, `Matrix.det_apply` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: the
  Leibniz expansion), `Matrix.inv` (`Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`:
  the inverse of a matrix whose determinant is not a unit is `0`), `Equiv.Perm.sign`
  (`Mathlib/GroupTheory/Perm/Sign.lean`).
- `IsSimplyConnected` and `SimplyConnectedSpace`
  (`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean`: a set is simply connected
  when its subtype is, which includes nonemptiness and path-connectedness);
  `LocallyPathConnectedSpace` (`Mathlib/Topology/Connected/LocallyPathConnected.lean`);
  `IsCoveringMap.existsUnique_continuousMap_lifts` (`Mathlib/Topology/Homotopy/Lifting.lean`:
  unique lifts of maps from simply connected, locally path-connected spaces);
  `AddCircle.isCoveringMap_coe` (`Mathlib/Topology/Covering/AddCircle.lean`); `convexHull`.
- `tendsto_integral_exp_inner_smul_cocompact` (`Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean`:
  Riemann–Lebesgue on a finite-dimensional inner product space; integrability is not assumed and
  the non-integrable case is vacuous); `intervalIntegral`, `Complex.arg`.
- `curveIntegral`, written `∫ᶜ x in γ, ω x`
  (`Mathlib/MeasureTheory/Integral/CurveIntegral/Basic.lean`, line 125: the integral of a 1-form `ω : E → E →L[𝕜] F` along a path `γ`, the interval integral of
  `ω(γ t)(γ' t)` over `[0,1]`, and `0` when that function is not integrable), with
  `curveIntegral_segment` (line 306: along `Path.segment a b` it is
  `∫₀¹ ω(a + t(b − a))(b − a) dt`, with no integrability hypothesis) and `curveIntegral_trans`
  (line 277: additivity along a concatenation of two paths on which `ω` is curve integrable);
  `Path.segment` (`Mathlib/Analysis/Convex/PathConnected.lean`, line 39). These are the curve
  integrals of 9.6.
- `circleIntegral`, written `∮ z in C(c, R), f z`
  (`Mathlib/MeasureTheory/Integral/CircleIntegral.lean`, line 435: the interval integral over
  `[0, 2π]` of `deriv (circleMap c R) θ • f (circleMap c R θ)`), with `deriv_circleMap` (line 130:
  the derivative is `circleMap 0 R θ · i`), `circleIntegral.integral_sub_zpow_of_ne` (line 615: the
  circle integral of `(z − w)^n` vanishes for every integer `n ≠ −1` and every `w`) and
  `circleIntegral.integral_sub_inv_of_mem_ball` (line 748: the circle integral of `(z − w)⁻¹` is
  `2πi` for `w` in the open disc); `DiffContOnCl.circleIntegral_eq_zero`
  (`Mathlib/Analysis/Complex/CauchyIntegral.lean`, line 479: the circle integral of a function
  complex differentiable on the open disc and continuous on its closure vanishes). These evaluate
  the inner integrals of 9.1.
- `DiscreteTiling.Prototile`, `DiscreteTiling.Protoset` and `DiscreteTiling.PlacedTile`
  (`Mathlib/Combinatorics/Tiling/Tile.lean`, lines 79, 110 and 142: a prototile is a set of points
  of `X` with a subgroup of its stabilizer in the acting group `G`, a protoset an indexed family of
  prototiles, and a placed tile a prototile index with a coset of its symmetries, read as the
  image of the prototile under a representative). The acting group is multiplicative; 1.4 uses
  `Multiplicative (ℤ × ℤ)` acting on faces by translation.
- The carriers of the statements of `Suggested.lean`: `SimpleGraph.fromRel`
  (`Mathlib/Combinatorics/SimpleGraph/Basic.lean`, line 135: `u ~ v` iff `u ≠ v` and the relation
  holds in one of the two orders), `SimpleGraph.edgeSet`; the automorphisms `G ≃g G`, a group by
  the instance on relation isomorphisms (`Mathlib/Algebra/Order/Group/End.lean`, line 73: the
  product `f * g` is `g` followed by `f`), and `SimpleGraph.Iso.mapEdgeSet`
  (`Mathlib/Combinatorics/SimpleGraph/Maps.lean`, line 669: the bijection of edge sets induced by an
  isomorphism); `SimpleGraph.toSubgraph`
  (`Mathlib/Combinatorics/SimpleGraph/Subgraph.lean`, line 574: a spanning subgraph from a graph
  below `G`), `SimpleGraph.Walk.darts` (`Mathlib/Combinatorics/SimpleGraph/Walk/Basic.lean`, line
  123) and `SimpleGraph.Reachable`; `Set.BijOn` (`Mathlib/Data/Set/Operations.lean`, line 318);
  `Relation.ReflTransGen` (`Mathlib/Logic/Relation.lean`, line 374); `arrowAddAction`
  (`Mathlib/Algebra/Group/Action/Basic.lean`, line 101: `(g +ᵥ F) a = F (−g +ᵥ a)`, a definition and
  not an instance, installed here as the action of `ℤ²` on configurations);
  `MeasureTheory.VAddInvariantMeasure` (`Mathlib/MeasureTheory/Group/Defs.lean`, line 51),
  `ErgodicVAdd` (`Mathlib/Dynamics/Ergodic/Action/Basic.lean`, line 31: invariance and every almost
  invariant measurable set null or conull), `Ergodic` and `MeasureTheory.MeasurePreserving`
  (`Mathlib/Dynamics/Ergodic/Ergodic.lean`, line 49, and `MeasurePreserving.lean`, line 44);
  `ProbabilityTheory.uniformOn` (`Mathlib/Probability/UniformOn.lean`, line 60: the counting measure
  conditioned on a set, a probability measure when the set is finite and nonempty and `0` when it is
  infinite); `MeasureTheory.Measure.real` (`Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean`,
  line 102: `(μ s).toReal`); `MeasureTheory.Measure.bind`
  (`Mathlib/MeasureTheory/Measure/GiryMonad.lean`, line 235); `MeasurableSpace.comap_mono`
  (`Mathlib/MeasureTheory/MeasurableSpace/Basic.lean`, line 121); `finsum` and `finprod`
  (`Mathlib/Algebra/BigOperators/Finprod.lean`: the sum or product over the support when it is
  finite and `0` or `1` otherwise; every support used here is finite); `Matrix.submatrix`
  (`Mathlib/LinearAlgebra/Matrix/Defs.lean`, line 457); `IsExtreme`
  (`Mathlib/Analysis/Convex/Extreme.lean`, line 63: `B ⊆ A`, and a point of `B` in an open segment
  of `A` has its endpoints in `B`, which for measures with `ℝ≥0∞`-scalars is the face property).

At that pin Mathlib has no lattice tilings, no height functions, no Kasteleyn matrices, no Gibbs
specifications and no tail σ-algebra of a product space (the tail σ-algebra appears only as
`limsup` of a sequence of σ-algebras in the zero-one law, and the exterior σ-algebras
`cylinderEvents Λᶜ` of finite sets are not intersected). Properness of a single kernel and
invariance of a measure under one kernel are Mathlib's; a specification, a consistent family of
proper kernels indexed by the finite sets, and its Gibbs measures are not. Its subshifts are
indexed by the acting monoid only.

### From Tau Ceti

At the Tau Ceti revision pinned in `lake-manifest.json`.

- `TauCeti.MeasureTheory.invariantMeasuresOfMeasureUnivEq`, its convexity lemma, and
  `ErgodicSMul.iff_mem_extremePoints` (`TauCeti/MeasureTheory/Group/ErgodicExtreme.lean`): for a
  countable group acting measurably (`[Group G] [Countable G] [MulAction G X]
  [MeasurableConstSMul G X]`) an invariant probability measure is ergodic iff it is an extreme
  point, in `ℝ≥0∞`-convexity of measures, of the invariant measures of mass one. The statements
  are multiplicative only; the additive action of `ℤ²` is used through `Multiplicative (ℤ × ℤ)`.
- `TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` and
  `TauCeti.MeasureTheory.exists_smul_invariant_ae_eq`
  (`TauCeti/MeasureTheory/Group/CountableAction.lean`, lines 68 and 53, for a countable group
  acting measurably): an almost invariant measurable event is almost equal to an exactly invariant
  one, with no hypothesis on the measure (used in 4.6(b)); and, for a measure with
  `[SMulInvariantMeasure G X μ]`, the action is ergodic iff every measurable, exactly invariant
  event is null or conull. Its reverse implication is the criterion used in 4.3, 5.3 and 9.4: for
  an invariant probability measure, exactly invariant events of probability `0` or `1` give
  ergodicity.
- `TauCeti.MeasureTheory.isExtreme_setOf_measure_eq_zero`
  (`TauCeti/MeasureTheory/Measure/Face.lean`): measures vanishing on a fixed set form a face.
- `TauCeti.Probability.tailFamily`, `TauCeti.Probability.tailProcess` and
  `TauCeti.Probability.tailProcess_eq_iInf_tailFamily`
  (`TauCeti/Probability/Process/Tail/Basic.lean`, lines 42, 47 and 64): for a process
  `X : (k : ℕ) → Ω → β k`, the future σ-algebra generated by the `X k` with `n ≤ k`, the tail
  σ-algebra `limsup (fun k => MeasurableSpace.comap (X k) _) atTop`, and its normal form
  `⨅ n, tailFamily X n`. Target 4.1 identifies its tail σ-algebra with `tailProcess` of the
  coordinate process along an enumeration of the index set. The `ℕ × ℕ`-indexed variant
  `TauCeti.Probability.arrayTail` (`TauCeti/Probability/Process/Array/Tail/Basic.lean`,
  line 43) is not used.
- `Matrix.det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv`
  (`TauCeti/LinearAlgebra/Matrix/Determinant/ComplementaryMinor.lean`, line 160), Jacobi's
  complementary-minor identity: for a square matrix `A` over a commutative ring, indexed by a
  finite type `n` with decidable equality, with `IsUnit A.det`, a splitting `e : m ⊕ p ≃ n` of the
  index type into finite types and permutations `σ`, `τ` of `n`, the minor of `A` on the rows
  `τ(e(inr ·))` and the columns `σ(e(inr ·))` equals `sgn σ · sgn τ · det A` times the minor of
  `A⁻¹` on the rows `σ(e(inl ·))` and the columns `τ(e(inl ·))`. Over `ℝ` the hypothesis is
  `det A ≠ 0`. 3.3 and 8.4 use it with `m` indexing the selected rows, `τ` the identity and `σ`
  sending each selected row to its selected column (read through `β`), so that the left side is
  the complementary minor of a restricted Leibniz sum (Conventions) and the two factors `sgn σ`
  cancel. The adjugate form `Matrix.det_mul_det_submatrix_adjugate`
  (`TauCeti/LinearAlgebra/Matrix/Determinant/Jacobi.lean`, line 54), stated for `Fin n` with
  increasing enumerations, is not used.

- `TauCeti.Contour.homologyCauchyTheorem` (`TauCeti/Analysis/Contour/HomologyCauchy.lean`, line
  108): for an open `Ω ⊆ ℂ`, a closed curve `γ : ℝ → ℂ` on `[a, b]` that is piecewise `C¹`
  (`TauCeti.IsPiecewiseC1On`, `TauCeti/Analysis/Calculus/ContDiff/PiecewiseC1On.lean`, line 91),
  lies in `Ω` and is null-homologous in `Ω`, and `f` holomorphic on `Ω`, the contour integral
  `∫ t in a..b, γ'(t) • f(γ t)` vanishes; `TauCeti.Contour.IsNullHomologous`
  (`TauCeti/Analysis/Contour/Winding/Number/Basic.lean`, line 147) is the vanishing of
  `TauCeti.Contour.windingNumber` (line 76 of the same file) about every point outside `Ω`.
  `TauCeti.Contour.intervalIntegral_deriv_smul_segment_eq_curveIntegral`
  (`TauCeti/Analysis/Contour/Primitive.lean`, line 129): the contour integral along an affinely
  parametrised segment from `z` to `w` is Mathlib's curve integral of the 1-form
  `ContinuousLinearMap.toSpanSingleton ℂ (f x)` along `Path.segment z w`, which is the 1-form of
  `incompleteBetaKernel`. 9.6 uses them for the independence of the kernel from the path.

Tau Ceti has, at that pin, the invariant σ-algebra and mean ergodic projection for one map
(`TauCeti/Probability/Ergodic/`) and one-sided shift ergodicity of i.i.d. laws
(`MeasureTheory.Measure.ergodic_shift_infinitePi_const`,
`TauCeti/Probability/Ergodic/BernoulliShift.lean`); neither is needed, since the two-sided and
proper-action statements of Layer 4 are proved directly. Its tail σ-algebras are indexed by `ℕ`
or `ℕ × ℕ` and carry no group action. It has no dimers, height functions or Gibbs measures.

### From other roadmaps

None. The roadmaps named under Scope and ownership own neighbouring objects; no target here
consumes them.

## How to read the build

Layer 1 fixes the lattice, the dual graph, regions and tilings, and proves that tilings are perfect
matchings. Layer 2 builds edge cochains, simple connectivity and height functions, and from them the
lattice of height functions, flips and Thurston's criterion. Layer 3 proves Kasteleyn's theorem on
finite simply connected regions from flip connectivity, and the local statistics formula from it and
Tau Ceti's complementary-minor identity. Layer 4 is abstract: product spaces with a proper action,
tail events, Bernoulli measures, the weak topology, specifications and the face property. Layer 5
instantiates Layer 4 for perfect matchings of periodic graphs and for lozenge tilings. Layer 6
introduces slopes and settles the boundary of the slope triangle by hand. Layer 7 builds torus
tilings and shows that torus limits are translation-invariant Gibbs measures of the prescribed
slope. Layer 8 is Kasteleyn theory on the torus. Layer 9 passes to the limit on good tori, obtains
the determinantal ergodic Gibbs measure of every interior slope and identifies its kernel with the
incomplete beta kernel. Layer 10 defines local-statistics convergence for tilings of growing regions
and proves that limits of uniform measures are Gibbs. Layer 4 depends on no earlier layer, and Layer
5 uses Layers 1–2 only in its lozenge instance 5.4, so Layers 1–3 and Layers 4–5.3 may be built in
parallel.

## Layer 1: the triangular lattice and lozenge tilings

### 1.1 Vertices, edges, faces and symmetries

Define the direction vectors `latticeDir`, the edge carrier `TriEdge` with its endpoint
`TriEdge.target`, and the face carrier `TriFace` with the colour of a face, its three vertices and
its three edges `TriFace.edges`, as in the conventions (aggarwal2023 lines 324–337; gorin2021
lines 405–420). Define the translation action of `ℤ²` on vertices, edges (the instance
`w +ᵥ (v,k) = (w + v, k)`), faces and configurations (Mathlib's `arrowAddAction`), and the rotation
`ρ(x,y) = (−y, x−y)`. *Needs:* Mathlib's `ℤ × ℤ`, `Fin 3`, `Finset` and `arrowAddAction`.

API:

- Every edge lies in exactly two faces, one white and one black, as listed in the conventions;
  every face has exactly three edges, one of each direction.
- The translation action on edges is an additive action, and on configurations the edge set of
  `w +ᵥ ω` is the translate by `w` of the edge set of `ω`.
- Two distinct faces share at most one edge; faces sharing an edge have opposite colours.
- Exactly six faces contain a given vertex `v`: `W(v)`, `W(v−e₁)`, `W(v−e₃)`, `B(v)`, `B(v−e₂)`,
  `B(v−e₃)`.
- Translations act freely and preserve colours and directions; `ρ` has order three, preserves
  colours, sends the direction-`k` edges to direction `k+1` (mod 3) and commutes with translations
  up to the linear map `ρ` on the translation vector.

**Checks.**

- `W(0) = {(0,0),(1,0),(1,1)}` has edges `(0,1)`, `(e₁,2)`, `(0,3)` and `B(0) = {(0,0),(0,1),(1,1)}`
  has edges `(0,2)`, `(e₂,1)`, `(0,3)`: they share exactly `(0,3)`.
- The edge `(0,1)` lies in `W(0)` and in `B(−e₂) = {(0,−1),(0,0),(1,0)}`; attaching it to `B(0)`
  instead fails, since `(1,0) ∉ B(0)`.
- `ρ(W(0)) = {(0,0),(0,1),(−1,0)} = W(−e₁)`, `ρ³ = id`, `ρ(e₁) = e₂`, `ρ(e₂) = −e₃`,
  `ρ(e₃) = −e₁`. The reflection `(x,y) ↦ (y,x)` exchanges directions 1 and 2 but maps `W(0)` to
  `B(0)`: it reverses colours, and is not used as a symmetry of the coloured lattice.

### 1.2 The dual hexagonal graph

Define `hexGraph : SimpleGraph TriFace`, two faces being adjacent when they are distinct and share
an edge, as `SimpleGraph.fromRel` of the relation "some edge lies in both" (gorin2021 lines
690–700; kenyon2009 Section 1.1, lines 95–113). *Needs:* 1.1; Mathlib `SimpleGraph`,
`SimpleGraph.fromRel`, `SimpleGraph.LocallyFinite`.

API:

- `W(v)` is adjacent exactly to `B(v)`, `B(v−e₂)` and `B(v+e₁)`, across `(v,3)`, `(v,1)` and
  `(v+e₁,2)`; the graph is 3-regular, hence locally finite, and bipartite with the white and black
  faces as parts.
- Adjacent faces share a unique edge, and the map from adjacent pairs to shared edges is a
  bijection from the edge set of `hexGraph` onto `TriEdge`.
- Translations and `ρ` act by graph automorphisms; the six faces at a vertex form a 6-cycle of
  `hexGraph`.

**Checks.**

- The neighbours of `W(0)` are `B(0)`, `B(−e₂)`, `B(e₁)`; `W(0)` and `B(1,−1)` meet only in the
  vertex `(1,0)` and are not adjacent.
- The faces at the origin form the cycle `W(0) – B(0) – W(−e₁) – B(−e₃) – W(−e₃) – B(−e₂) – W(0)`,
  through the edges `(0,3)`, `(0,2)`, `((−1,0),1)`, `((−1,−1),3)`, `((0,−1),2)`, `(0,1)`.
- Declaring faces adjacent when they share a vertex would make `W(0)` adjacent to `B(1,−1)` and to
  `W(e₁)` and create odd cycles; the shared-edge definition is bipartite.

### 1.3 Regions

For a set `R` of faces define its vertices `V(R)`, its edges `E(R) = regionEdges R` (edges of
faces of `R`), its interior edges `E°(R)` (both faces in `R`), its boundary edges
`E∂(R) = boundaryEdges R` (edges of `R` lying in a face outside `R`, so exactly one of their two
faces is in `R`), its boundary vertices `∂R = boundaryVertices R` (endpoints of boundary edges),
its boundary graph (vertices `∂R`, edges `E∂(R)`), its edge graph `regionGraph R`, the simple graph
on `ℤ × ℤ` whose edges are the segments of `E(R)` (vertices outside `V(R)` are isolated),
connectedness (any two vertices of `V(R)` are reachable from each other in `regionGraph R`) and
the union of faces `F(R) ⊆ ℝ²`, the union of the convex hulls of the faces under `ℤ² ⊆ ℝ²`. For a
set `V` of vertices define the region `Faces(V)` of faces with all three vertices in `V`, which is
Aggarwal's induced-subgraph convention (aggarwal2023 lines 338–341). *Needs:* 1.1; Mathlib
`SimpleGraph.fromRel`, `SimpleGraph.Reachable`, `convexHull`.

API:

- `V(R)` is the set of endpoints of the edges of `R`; the edges of `regionGraph R` are exactly
  the unordered pairs `{v, v + e_k}` with `(v,k) ∈ E(R)`.
- For finite `R`, `3|R| = 2|E°(R)| + |E∂(R)|`.
- A vertex of `V(R)` is not in `∂R` exactly when all six faces at it lie in `R`.
- Translations and `ρ` act on regions compatibly with all the constructions above.
- For `V` such that every vertex of `V` lies in a face of `Faces(V)`, Aggarwal's boundary (the
  vertices of `V` adjacent to a vertex outside `V`) equals `∂(Faces(V))`.

**Checks.**

- `R = {W(0)}`: `E°(R) = ∅`, three boundary edges, `∂R = {(0,0),(1,0),(1,1)}`, and
  `3 = 2·0 + 3`.
- The unit hexagon `R₆` (the six faces at the origin): the six edges at `0` are interior, the six
  outer edges are boundary, `∂R₆` is the six neighbours of `0`, `V(R₆) ∖ ∂R₆ = {0}`, and
  `18 = 2·6 + 6`.
- `Faces({(0,0),(1,0),(1,1),(0,1)}) = {W(0), B(0)}`, while `Faces({(0,0),(1,0)}) = ∅` although the
  induced subgraph on these two vertices has an edge: tilings live on sets of faces, and a vertex
  set is used only through `Faces`.

### 1.4 Tilings

Define `IsTiling R M`, free tilings and plane tilings (`IsTiling Set.univ M`) as in the
conventions (aggarwal2023 lines 342–364, and lines 380–383 for free tilings of the regions
`Faces(V)`; gorin2021 lines 690–702). *Needs:* 1.3; Mathlib `DiscreteTiling.Protoset`,
`DiscreteTiling.PlacedTile`, `Multiplicative`.

API:

- Every tiling is a free tiling; the lozenges of a tiling partition `R`; a finite tileable region
  has `|R| = 2|M|` and as many white as black faces.
- The restriction of a plane tiling to the edges of `R` is a free tiling of `R`; a free tiling of
  `R` is a tiling exactly when it contains no boundary edge.
- Translations and `ρ` map tilings of `R` to tilings of the image region.
- Lozenges are Mathlib's placed tiles: for the protoset of the three prototiles
  `{W(0), B(−e₂)}`, `{W(−e₁), B(0)}` and `{W(0), B(0)}` (the lozenges of the edges `(0,1)`,
  `(0,2)`, `(0,3)`), each with trivial symmetries, under `Multiplicative (ℤ × ℤ)` acting on faces
  by translation, the map sending `(v,k)` to the placed tile of index `k` at `v` is a bijection
  from `TriEdge` onto `DiscreteTiling.PlacedTile` whose underlying set of faces is the lozenge of
  `(v,k)`; and a set `M` of edges is a tiling of `R` exactly when the placed tiles of its edges lie
  in `R`, are pairwise disjoint and cover `R`.

**Checks.**

- Placed tiles: the tiling `T_a` of the unit hexagon is the family of placed tiles of indices `3`,
  `1`, `2` at `0`, `(−1,0)`, `(0,−1)`, with face sets `{W(0), B(0)}`, `{W(−e₁), B(−e₃)}`,
  `{W(−e₃), B(−e₂)}`, which partition `R₆`; the placed tiles of `(0,1)` and `(0,3)` share `W(0)`,
  so no tiling contains both edges; and a translation fixes no placed tile (it acts freely on
  faces), so the trivial symmetry group is the whole stabilizer of each prototile.

- The unit hexagon has exactly two tilings, `T_a = {(0,3), ((−1,0),1), ((0,−1),2)}` and
  `T_b = {(0,1), (0,2), ((−1,−1),3)}`, each with one lozenge of each type.
- `{W(0)}` has no tiling and three free tilings, one for each edge of `W(0)`.
- `M₁`, `M₂`, `M₃` (all edges of one direction) are plane tilings; `M₁ ∪ M₃` is not, since `W(0)`
  contains two of its edges.
- `R = {W(0), W(−e₁)}` and `M = {(0,3), (0,2)}`: `W(0)` contains only `(0,3)` and `W(−e₁)` only
  `(0,2)`, so `M` is a free tiling, but its lozenges `W(0) ∪ B(0)` and `W(−e₁) ∪ B(0)` share the
  face `B(0) ∉ R`. `R` is not of the form `Faces(V)`, since the three vertices of `B(0)` lie in
  `V(R)`; its height function normalised by `H(0) = 0` is `0` at `0`, `e₁`, `e₃`, `−e₁` and `1` at
  `e₂`, as 2.6 asserts for the simply connected wedge `R`.

### 1.5 Tilings are perfect matchings

Define `tilingSubgraph R M`, the spanning subgraph of `SimpleGraph.induce R hexGraph` whose edges
are the pairs of faces of `R` sharing an edge of `M` (Mathlib `SimpleGraph.toSubgraph` of the graph
of that relation, which lies below `SimpleGraph.induce R hexGraph`). For every region `R`, finite or
infinite, `tilingSubgraph R` is a bijection from `𝔈(R)` onto the perfect matchings (Mathlib
`SimpleGraph.Subgraph.IsPerfectMatching`) of `SimpleGraph.induce R hexGraph`, in the sense of
`Set.BijOn`; for `R` the set of all faces this identifies `𝔈(𝕋)` with the perfect matchings of
`hexGraph` (`tilingSubgraph_bijOn`; aggarwal2023 lines 342–364; gorin2021 lines 698–702; kenyon2009
lines 96–113). Injectivity uses that two distinct faces share at most one edge and that every edge
of a tiling has both faces in `R`. *Needs:* 1.2, 1.4; Mathlib `SimpleGraph.induce`,
`SimpleGraph.toSubgraph`, `SimpleGraph.Subgraph.IsPerfectMatching`,
`SimpleGraph.Subgraph.isPerfectMatching_iff`, `Set.BijOn`.

API:

- Two faces of `R` are adjacent in `tilingSubgraph R M` exactly when they are distinct and some
  edge of `M` lies in both; every face of `R` is a vertex of it, and it grows with `M`.
- Only the interior edges of `M` count: `tilingSubgraph R M = tilingSubgraph R (M ∩ E°(R))`. So
  `tilingSubgraph R` is not injective on free tilings (the three free tilings of `{W(0)}` all give
  the subgraph with no edges), and 1.5 restricts it to tilings, which lie in `E°(R)`.

**Checks.**

- `R = ∅`: the empty tiling corresponds to the empty perfect matching of the empty graph.
- `R = {W(0)}`: neither side has an element.
- Unit hexagon: two tilings, and `SimpleGraph.induce R₆ hexGraph` is a 6-cycle with exactly two
  perfect matchings.

### 1.6 Row tilings

For `ε ∈ {0,1}^ℤ` define the row tiling `M_ε = {((x,y),1) : ε_x = 1} ∪ {((x,y),3) : ε_x = 0}`:
the column `x` of the plane is filled with the type-1 lozenges `W(x,y) ∪ B(x,y−1)` when `ε_x = 1`
and with the unit squares `W(x,y) ∪ B(x,y)` when `ε_x = 0`, so `ε` is read along any row. Write
`σ` for the shift `(σε)_x = ε_{x−1}` of `{0,1}^ℤ`. These are the tilings whose laws realise the
slopes on the edge `t = 0` of the slope triangle, all of them extreme slopes in the sense of
gorin2021 lines 4638–4642 (kenyon2009 Exercise 13, line 891). *Needs:* 1.4.

API:

- `M_ε` is a plane tiling: `W(x,y)` contains `((x,y),1)` or `((x,y),3)` and `B(x,y)` contains
  `((x,y+1),1)` or `((x,y),3)`, according as `ε_x = 1` or `0`, and no other edge of the face.
- `M_ε` contains no edge of direction 2, hence no lozenge of type 2; `ε ↦ M_ε` is injective, with
  `ε_x = [((x,0),1) ∈ M_ε]`, and continuous for the product topologies on `{0,1}^ℤ` and
  `TriEdge → Bool`, each edge's membership depending on one coordinate of `ε`.
- `τ_{e₂} M_ε = M_ε` and `τ_{e₁} M_ε = M_{σε}`; the constant sequences `ε ≡ 1` and `ε ≡ 0` give
  `M₁` and `M₃`.

**Checks.**

- `ε ≡ 1` gives `M₁` and `ε ≡ 0` gives `M₃`; no `ε` gives `M₂`, whose edges all have direction 2.
- `ε = 1_{[0,∞)}`: `W(−1,0)` contains `((−1,0),3)` and `W(0,0)` contains `((0,0),1)`;
  `τ_{e₁} M_ε = M_{1_{[1,∞)}}` differs from `M_ε` at `((0,0),1)`, while `τ_{e₂}` fixes `M_ε`.
- Reading `ε` along a column instead, `{((x,y),1) : ε_y = 1} ∪ {((x,y),3) : ε_y = 0}`, is not a
  tiling for `ε = 1_{{0}}`: `B(x,0)` would have to contain `((x,1),1)`, absent since `ε_1 = 0`, or
  `((x,0),3)`, absent since `ε_0 = 1`.

### Examples

The three frozen tilings `M₁`, `M₂`, `M₃`; the row tilings `M_ε` of 1.6, with
`M_{1_{[0,∞)}}` as the non-periodic specimen; the unit hexagon `R₆` with its tilings `T_a` and
`T_b`.

### Dependencies

Mathlib `SimpleGraph`, `SimpleGraph.fromRel`, `SimpleGraph.induce`, `SimpleGraph.toSubgraph`,
`SimpleGraph.Subgraph.IsPerfectMatching`, `SimpleGraph.Reachable`, `arrowAddAction`, `Set.BijOn`,
`convexHull`, `DiscreteTiling.Protoset`, `DiscreteTiling.PlacedTile`. No earlier layer.

## Layer 2: height functions, simple connectivity and Thurston's criterion

### 2.1 Edge cochains and simple connectivity

An edge cochain is a function `c : TriEdge → ℤ`, read as the increment from `v` to `v + e_k`. It is
closed on `R` (`IsClosedOn R c`) when, for every face of `R`, `c(v,1) + c(v+e₁,2) = c(v,3)` (for
`W(v)`) and `c(v,2) + c(v+e₂,1) = c(v,3)` (for `B(v)`); it is exact on `R` when some
`g : ℤ × ℤ → ℤ` has `c(u,k) = g(u+e_k) − g(u)` for every `(u,k) ∈ E(R)` (only the values of `g`
on `V(R)` matter). Define `IsSimplyConnectedRegion R`: `R` is nonempty, the initial vertices of
any two edges of `R` are reachable from each other in `regionGraph R` (which is connectedness of
`(V(R), E(R))`), and every cochain closed on `R` is exact on `R`. This is the combinatorial
form of the simple connectivity of `F(R)` in aggarwal2023 lines 338–341; the consistency of local
height rules it encodes is gorin2021 lines 454–457 and kos2006 lines 177–181. *Needs:* 1.3.

API:

- Exact cochains are closed; a primitive on a connected region is unique up to an additive
  constant.
- Simple connectivity is invariant under translations and `ρ`.
- Shelling: if `R` is simply connected and a face `f ∉ R` meets `F(R)` in exactly one edge whose
  opposite vertex is not in `V(R)`, or in exactly two edges of `f`, then `R ∪ {f}` is simply
  connected.

**Checks.**

- `{W(0)}` is simply connected: a cochain closed on `W(0)` has primitive `g(0) = 0`,
  `g(e₁) = c(0,1)`, `g(e₃) = c(0,3)`, consistent because `c(0,1) + c(e₁,2) = c(0,3)`.
- The ring `R_ring` of the twelve faces other than `W(0)` that meet `W(0)` (they are
  `W(−1,0)`, `W(−1,−1)`, `W(0,−1)`, `W(1,0)`, `W(1,1)`, `W(0,1)` and `B(0,0)`, `B(0,−1)`,
  `B(−1,−1)`, `B(1,−1)`, `B(1,0)`, `B(1,1)`) is connected but not simply connected: the cochain
  equal to `1` on `(e₁,2)`, `1` on the edges crossed by the path of faces
  `B(1,0), W(1,0), B(2,0), W(2,0), …` and `0` elsewhere is closed on `R_ring` and sums to
  `c(0,1) + c(e₁,2) − c(0,3) = 1` around the boundary of `W(0)`, whose three edges lie in
  `E(R_ring)`.
- The unit hexagon is simply connected by shelling in the order `W(0)`, `B(0)`, `W(−e₁)`,
  `B(−e₃)`, `W(−e₃)` (one new edge and vertex each time) and `B(−e₂)` (two edges).

### 2.2 The plane is simply connected

Every cochain closed on the set of all faces is exact; the primitive vanishing at `0` is obtained
by summing along `e₁` and then `e₂`, the two face relations giving
`c(v,1) + c(v+e₁,2) = c(v,2) + c(v+e₂,1)` on every unit square (gorin2021 lines 454–457).
*Needs:* 2.1.

**Checks.**

- The neutral cochain `c₀` is not closed: on `W(v)` it gives `0 + 0 ≠ 1`.
- For the cochain of `M₁` (value `1` on direction-1 edges, `1` on direction-3 edges, `0`
  otherwise) the primitive is `x`; for that of `M₃` it is `0`.
- On the set of all faces minus `W(0)` the cochain of 2.1's second Check is closed and not exact,
  so 2.2 needs every face.

### 2.3 Holes obstruct simple connectivity

If `R` is nonempty and `Q` is a nonempty finite set of faces outside `R` such that every face
sharing an edge with a face of `Q` lies in `Q ∪ R`, then `R` is not simply connected. The witness
is the dual-path cochain of a path of faces from a face of `Q` to infinity: it is closed off the
starting face, and its sum over the boundary chain of `Q`, a cycle of edges of `R`, is `±1`
(kenyon2009 lines 360–367 for the flow–height duality). Consequently, for finite simply connected
`R` the complement of `R` is connected through shared edges: for finite `R` the complement has
exactly one infinite component, and any other would be such a `Q`. *Needs:* 2.1, 2.2.

**Checks.**

- `R_ring` with `Q = {W(0)}` satisfies the hypothesis.
- The five faces at the origin other than `W(0)` with `Q = {W(0)}` do not: `B(e₁)` shares the edge
  `(e₁,2)` with `W(0)` and lies in neither set; that region is simply connected (it is the
  hexagon's shelling stopped after five faces, reordered).
- For `R = ∅` the conclusion is vacuous, since simple connectivity includes nonemptiness.

### 2.4 From topological to combinatorial simple connectivity

If `F(R) ⊆ ℝ²` satisfies Mathlib's `IsSimplyConnected`, then `IsSimplyConnectedRegion R`. Route:
`F(R)` is locally path-connected (a locally finite union of closed triangles); a cochain closed on
`R` defines a continuous map `F(R) → ℝ/ℤ` that vanishes at vertices, is `t ↦ t·c(e)` along each
edge and is affine on each triangle after lifting the vertex values `0`, `c(e)`, `c(e) + c(e')` to
`ℝ`; it lifts through `ℝ → ℝ/ℤ`, and the lift restricted to vertices is an integer primitive.
Path-connectedness of `F(R)` gives connectedness of `R`, since triangles of the lattice meet only
in shared vertices or edges. Thus for every domain in Aggarwal's sense, an induced subgraph with
vertex set `V` whose union of faces `F(Faces(V))` is simply connected (aggarwal2023 lines
338–341), the region `Faces(V)` of 1.3 is simply connected here.
*Needs:* 2.1; Mathlib `IsSimplyConnected`, `LocallyPathConnectedSpace`,
`IsCoveringMap.existsUnique_continuousMap_lifts`, `AddCircle.isCoveringMap_coe`.

**Checks.**

- `R = {W(0)}`: `F(R)` is a closed triangle, convex, hence simply connected, as is `R`.
- `W(0)` and `B(1,1)` meet in the single vertex `(1,1)`: `F(R)` is a wedge of two triangles,
  simply connected, and closed cochains on the two faces glue at `(1,1)`.
- For `R_ring`, `F(R)` is not simply connected; 2.4 gives nothing and 2.3 shows that `R_ring` is
  not simply connected either.

### 2.5 Heights of plane tilings

Define `IsHeightFunction H` for `H : ℤ × ℤ → ℤ`: its increments along `e₁`, `e₂`, `e₃` lie in
`{0,1}`; and `tilingOfHeight H`, the set of edges whose increment is not the neutral one,
`{(v,k) : H(v+e_k) − H(v) = 1 − c₀(k)}`, that is
`{(v,1) : H(v+e₁) − H(v) = 1} ∪ {(v,2) : H(v+e₂) − H(v) = 1} ∪ {(v,3) : H(v+e₃) = H(v)}`. For
every plane tiling `M` there is a unique `H_M : ℤ² → ℤ` with `H_M(0) = 0` and the increments of
the conventions; `H_M` is a height function, and `tilingOfHeight` is a bijection, in the sense of
`Set.BijOn`, from the height functions vanishing at `0` onto `𝔈(𝕋)`, with inverse `M ↦ H_M`
(`tilingOfHeight_bijOn`; aggarwal2023 lines 384–399; gorin2021 lines 447–458; kenyon2009
Section 2.2, lines 353–385). The image of a height function is a plane tiling because round
`W(v)` the increments `a = H(v+e₁) − H(v)`, `b = H(v+e₃) − H(v+e₁)` and `a + b = H(v+e₃) − H(v)`
all lie in `{0,1}`, so `(a, b, a+b)` is one of `(0,0,0)`, `(1,0,1)`, `(0,1,1)` and exactly one
edge of `W(v)` is selected, and likewise round `B(v)`; surjectivity is 2.2 applied to the
cochain of `M`. *Needs:* 1.4, 2.2; Mathlib `Set.BijOn`.

API:

- Translation: `H_{τ_w M}(v) = H_M(v − w) − H_M(−w)`; rotation: `H_{ρM}(w) = H_M(ρ⁻¹w) + w₁`.
- Lipschitz bound: `H_M(u + (a,b)) − H_M(u) ≤ max(a, b, 0)` for all `u` and `(a,b)`.
- Gorin's height is `x + y − 3H_M`.

**Checks.**

- `H_{M₁} = x`, `H_{M₂} = y`, `H_{M₃} = 0`, and for the row tiling `H_{M_ε}(x,y) = Σ_{0≤i<x} ε_i`
  for `x ≥ 0` and `−Σ_{x≤i<0} ε_i` for `x < 0`, independent of `y`; for the alternating
  `ε_x = [x odd]` this is `⌊x/2⌋`.
- `H(x,y) = ⌊(x+y)/2⌋` is a height function; its tiling has no type-3 lozenge, since
  `H(v+e₃) − H(v) = 1` everywhere.
- `H(x,y) = x + y` is not a height function: its increment along `e₃` is `2`.

### 2.6 Heights on regions

A height function on `R` is `H : V(R) → ℤ` with `H(v) − H(u) ∈ {0,1}` for every positively
oriented edge `u → v` of `E(R)`. For simply connected `R`, `v₀ ∈ V(R)` and `m ∈ ℤ`, free tilings of
`R` correspond bijectively to height functions on `R` with `H(v₀) = m` (the increments are those of
the conventions on `E(R)`), and tilings correspond to the height functions whose increment along
every boundary edge is neutral (aggarwal2023 lines 380–401, for the regions `Faces(V)`; gorin2021
lines 511–514). Restricting
a plane tiling commutes with restricting its height function. *Needs:* 1.4, 2.1.

**Checks.**

- `R = {W(0)}`, `H(0) = 0`: the free tilings `{(0,1)}`, `{(e₁,2)}`, `{(0,3)}` have
  `(H(e₁), H(e₃)) = (1,1)`, `(0,1)`, `(0,0)`, which are all the height functions; none is a
  tiling, because neutral boundary increments would force `H(e₁) = 0 = H(e₃)` and `H(e₃) = 1`.
- On `R_ring` the tiling `T = {(0,2), ((1,1),1), ((0,−1),3), ((−1,−1),3), ((1,0),1), ((1,1),2)}`
  has increments `0`, `0`, `1` along `(0,1)`, `(e₁,2)`, `(0,3)`, which sum to `−1` around `W(0)`:
  `T` has no height function, so simple connectivity cannot be dropped.
- On the unit hexagon, normalised by `H(1,0) = 0`: `T_a` and `T_b` both give `H = 0` at `(1,0)`,
  `(0,1)`, `(1,1)` and `H = −1` at `(−1,0)`, `(0,−1)`, `(−1,−1)`, while `H(0) = 0` for `T_a`
  (because `(0,1) ∉ T_a`) and `H(0) = −1` for `T_b` (because `(0,1) ∈ T_b`).

### 2.7 Boundary heights

If `R` is finite and simply connected, its boundary graph is connected. Route: the complement of
`R` is connected (2.3); a function on `∂R` constant along boundary edges extends to a cochain on
the plane that is closed (zero on faces outside `R`, the coboundary of an extension on `R`), hence
exact (2.2), and comparing primitives on the two connected closures shows the function constant.
If the boundary graph of `R` is connected and `M`, `M'` are tilings of `R` whose height cochains
are exact on `R` (for simply connected `R`, every tiling, by 2.6), their height functions agree
on `∂R` once normalised at a common boundary vertex: along a boundary edge, which lies in neither
tiling, the increment of either height function is the neutral `c₀`, so its restriction to `∂R`
is determined by `c₀`, the connectedness of the boundary graph and the normalisation. The
boundary height `h_R` therefore depends only on `R` (aggarwal2023 lines 403–407; gorin2021 lines
511–514). *Needs:* 2.2, 2.3, 2.6.

**Checks.**

- Unit hexagon: integrating `c₀` round the outer hexagon from `h(1,0) = 0` gives `h = 0` at
  `(1,0)`, `(1,1)`, `(0,1)` and `h = −1` at `(−1,0)`, `(−1,−1)`, `(0,−1)` (the two diagonal boundary
  edges carry the increments), consistently round the loop, and both tilings induce it.
- The strip `R_strip` of all faces between `y = 0` and `y = 1` is simply connected, its boundary
  graph has two components (the two lines), and the tilings `M₃|R_strip` (type 3) and
  `M₂|R_strip` (type 2) have boundary heights, normalised by `h(0,0) = 0`, equal to `0` and `1` on
  the line `y = 1`: connectedness of the boundary cannot be dropped for infinite regions.
- `W(0)` and `B(1,1)` meeting at a vertex: the region is finite and simply connected with
  connected boundary graph, as 2.7 asserts, and no boundary height exists (each triangle's
  boundary is inconsistent), so the region is untileable although it has one face of each colour.
- Exactness cannot be dropped: `R_ring` minus `W(−e₃)` and `B(−e₃)` has connected boundary graph
  (the inner triangle `0, e₁, e₃` meets the outer boundary at `0` through the boundary edge
  `((−1,0),1)`), its dual graph is a path of ten faces with the unique tiling `T ∖ {((−1,−1),3)}`
  (`T` as in 2.6), and that tiling's cochain sums to `−1` round `W(0)`, a loop of edges of the
  region: the tiling has no height function at all, and no `h : ∂R → ℤ` has increments `c₀` along
  the boundary edges `(0,1)`, `(e₁,2)`, `(0,3)`.

### 2.8 The lattice of height functions and flips

The pointwise minimum and maximum of two height functions on `R` are height functions: along a
positively oriented edge both functions are nondecreasing and rise by at most one, hence so do
their minimum and maximum (gorin2021 footnote 1, lines 765–769, for the pointwise maximum of its
heights `x + y − 3H` (2.5), which is the minimum here; cohn-kenyon-propp2001 Section 1.4, lines
404–423, proves the corresponding statement for domino height functions, whose values are fixed
modulo 4, by a different argument). For finite simply connected tileable `R` with boundary height
`h = h_R`, the height functions with boundary values `h` have a least element
`H_min(v) = max_{u∈∂R}(h(u) − ρ_R(v,u))` and a greatest `H_max(v) = min_{u∈∂R}(h(u) + ρ_R(u,v))`,
where `ρ_R(u,v)` is the least number of positively oriented steps of an edge path from `u` to `v`
in `E(R)`. A flip at an interior vertex `v` lowers
`H(v)` by one where allowed, that is when `H(v+e_k) = H(v) = H(v−e_k) + 1` for `k = 1,2,3`;
equivalently it replaces the edges `(v,3)`, `(v−e₁,1)`, `(v−e₂,2)` of `M` by `(v,1)`, `(v,2)`,
`(v−e₃,3)`. If `H ≠ H_min`, a flip is available at a vertex `v` where `H − H_min` is maximal,
chosen first with `H(v)` maximal and then with `v₁ + v₂` minimal, and the flipped function stays
`≥ H_min`. Define `IsFlip M M'`: for some vertex `v`, `M` contains the three edges `(v,3)`,
`(v−e₁,1)`, `(v−e₂,2)` and `M'` is obtained by replacing them with `(v,1)`, `(v,2)`, `(v−e₃,3)`, or
the reverse. Hence any two tilings of a finite simply connected region are joined by finitely many
flips, `Relation.ReflTransGen IsFlip M M'` (`flip_connected`; a flip applied to a tiling of `R`
is again a tiling of `R`, since the six faces round `v` all lie in `R`), and all tilings of such a
region have the same number of lozenges of each type (gorin2021 lines 756–782 and footnote 1,
lines 765–769; kenyon2009 lines 537–550). *Needs:* 2.6, 2.7; Mathlib `Relation.ReflTransGen`.

API:

- If `IsFlip M M'` at the vertex `v` and `M` contains at most one edge of each of the six faces
  round `v`, then `IsFlip M' M`, and `M` and `M'` differ exactly in the six edges at `v` named in
  the definition: `M'` loses one lozenge of each type and gains one of each type. If moreover `M`
  is a tiling of a region `R` containing those six faces, so is `M'`.
- For such tilings of a simply connected `R`, the height functions of `M` and `M'` on `R`,
  normalised at a common vertex other than `v`, differ only at `v`, by one: exchanging `(v,3)`,
  `(v−e₁,1)`, `(v−e₂,2)` for `(v,1)`, `(v,2)`, `(v−e₃,3)` lowers `H(v)` by one, and the reverse
  exchange raises it by one.

**Checks.**

- Unit hexagon: `T_a` admits the flip at `0` and becomes `T_b`; `T_a` is `H_max`, `T_b` is `H_min`,
  and `H_max(0) − H_min(0) = 1`; both have one lozenge of each type.
- The flip changes `W(0)–B(0)`, `W(−e₁)–B(−e₃)`, `W(−e₃)–B(−e₂)` into `W(0)–B(−e₂)`,
  `W(−e₁)–B(0)`, `W(−e₃)–B(−e₃)`: a 3-cycle of the black partners.
- On the 2 × 2 torus (Layer 7) the two tilings with height change `(1,0)` have no type-2 lozenge,
  admit no flip and differ: flip connectivity is a statement about simply connected regions.

### 2.9 Thurston's criterion

Define `positiveSteps p` for a walk `p` in `regionGraph R`: the number of its darts that go from a
vertex `u` to `u + e_k` for some `k`. The oriented distance `ρ_R(u,v)` of 2.8 is the least value of
`positiveSteps` over the walks from `u` to `v`, so `h(v) − h(u) ≤ ρ_R(u,v)` says
`h(v) − h(u) ≤ positiveSteps p` for every such walk `p`.

Let `R` be finite and connected. If there is `h : ∂R → ℤ` with `h(v) − h(u) = c₀(u,k)` along every
boundary edge `(u,k)` (with `v = u + e_k`) and `h(v) − h(u) ≤ ρ_R(u,v)` for all `u, v ∈ ∂R`, then
`R` has a tiling whose height cochain is exact, namely that of
`H(v) = min_{u∈∂R}(h(u) + ρ_R(u,v))`; conversely such a tiling yields such an `h`. If `R` is
moreover simply connected, every tiling has an exact height cochain (2.6), so `R` is tileable iff
such an `h` exists; with `h` a function on `ℤ × ℤ` read on `∂R`, this is
`thurston_tileable_iff` (gorin2021 Theorem 1.4, lines 521–526, with its proof, and Corollary 1.5,
line 613; thurston1990). Gorin states the criterion for his height `h_G = x + y − 3h` and his
oriented distance along the directions `(1,0)`, `(0,1)`, `(−1,−1)`; both forms characterise
tileability of simply connected regions, so they are equivalent. *Needs:* 2.6, 2.8; Mathlib
`SimpleGraph.Walk.darts`.

API:

- Every dart of `regionGraph R` goes from some `u` to `u + e_k` or to `u − e_k`, and
  `positiveSteps` counts the darts of the first kind; it is `0` on a walk with no darts.
- It is additive under concatenation of walks, and `positiveSteps p` plus `positiveSteps` of the
  reversed walk is the length of `p`.
- For a height function `H` on `R` (2.6) and a walk `p` in `regionGraph R` from `u ∈ V(R)` to `v`,
  `H(v) − H(u) ≤ positiveSteps p`: `H` rises by at most `1` along a positive step and does not rise
  along the other steps.

**Checks.**

- The closed walk `0 → e₁ → e₃ → 0` in `regionGraph {W(0)}` has `2` positive steps and its reverse
  has `1`, adding up to the length `3`; counting every dart would give `3` both ways.
- The one-dart walk `0 → e₃` has `1` positive step, and `H_{M₁} = x` rises by `1` along it. With
  Gorin's positive directions `(1,0)`, `(0,1)`, `(−1,−1)` the step `0 → e₃` would be negative and
  count `0`, and the bound `H(v) − H(u) ≤ positiveSteps p` would fail for the plane tiling `M₁`.
- In the unit hexagon the walk `(−1,0) → 0 → (1,0)` has `2` positive steps, and the boundary height
  of 2.7 rises by `1` from `(−1,0)` to `(1,0)`. Counting instead the darts from `u + e_k` to `u`
  would give `0` for this walk, and the criterion would then reject the unit hexagon, which is
  tileable.
- Unit hexagon: `h` exists and the inequalities hold; `R` is tileable.
- `R = {W(0)}` or a single black face: no `h` exists, since round the triangle `c₀` sums to
  `0 + 0 − 1 ≠ 0`.
- `R₆' = {W(0,0), B(1,0), W(1,0), W(1,1), B(1,1), B(2,1)}` is simply connected (shelling), has three
  faces of each colour and a consistent boundary height (`h = 0` at `(0,0)`, `(1,0)`, `(2,0)`,
  `(2,1)` and `h = 1` at `(3,2)`, `(2,2)`, `(1,2)`, `(1,1)`), but
  `h(1,1) − h(2,1) = 1 > 0 = ρ_R((2,1),(1,1))`, the step `(2,1) → (1,1)` along the interior edge
  `((1,1),1)` being negative; indeed `W(0,0)` and `W(1,0)` are both adjacent only to `B(1,0)` in
  `R₆'`, so it has no tiling.

### 2.10 Finite changes preserve lozenge counts

If two plane tilings `M`, `M'` differ on finitely many edges, then for each direction `k` the sets
`M ∖ M'` and `M' ∖ M` contain equally many edges of direction `k`; the difference `H_M − H_{M'}`,
normalised to vanish far away, has finite support, and the counts are telescoping sums of its
increments (kenyon2009 lines 869–878; kos2006 lines 239–256 for gauge and magnetic changes).
*Needs:* 2.5.

**Checks.**

- `T_a ∖ T_b = {(0,3), ((−1,0),1), ((0,−1),2)}` and `T_b ∖ T_a = {(0,1), (0,2), ((−1,−1),3)}`: one
  edge of each direction on each side.
- `M₁` and `M₃` differ on infinitely many edges and have type-1 densities `1` and `0`.
- Row tilings `M_ε`, `M_ε'` with `ε`, `ε'` differing at one coordinate differ along a whole column
  of edges, and 2.10 says nothing about them.

### Examples

The unit hexagon with `T_a`, `T_b`, its flip and its boundary height; `R_ring` with its two tilings
(Layer 3); `R₆'`, balanced and untileable; the strip `R_strip`.

### Dependencies

Layer 1; Mathlib `IsSimplyConnected`, `LocallyPathConnectedSpace`,
`IsCoveringMap.existsUnique_continuousMap_lifts`, `AddCircle.isCoveringMap_coe`, `Set.BijOn`,
`Relation.ReflTransGen`, `SimpleGraph.Walk.darts`.

## Layer 3: Kasteleyn theory on finite simply connected regions

### 3.1 Kasteleyn matrices and Boltzmann measures

For a finite region `R : Finset TriFace` and an edge weight `w`, define its white and black faces
`whiteFaces R` and `blackFaces R`, the Kasteleyn matrix `kasteleynMatrix R w`, a
`Matrix (whiteFaces R) (blackFaces R) ℝ` (rows the white faces of `R`, columns the black faces,
entry `w(e)` for faces sharing `e`, else `0`), the partition function
`partitionFunction R w = Σ_{M ∈ 𝔈(R)} ∏_{e∈M} w(e)` (a `finsum` over the finitely many tilings of
`R`, each a finite set of edges, for any region `R : Set TriFace`), and, when it is positive, the
Boltzmann probability measure on `𝔈(R)` with masses proportional to the weights (gorin2021 lines
1199–1215; kenyon2009 Sections 3.1 and 3.4, lines 428–503). *Needs:* 1.4, 1.5; Mathlib
`Matrix.det`, `Matrix.submatrix`, `finsum`, `finprod`.

API:

- Each row and each column has at most three nonzero entries; the matrix is square exactly when
  `R` has as many white as black faces, and otherwise `R` has no tiling.
- For bijections `e, e'` from black to white faces, the determinants of the two square matrices
  differ by the sign of a permutation; the inverse, as a matrix with rows black and columns white,
  does not depend on the bijection.
- Translations and `ρ` act compatibly (with translated or rotated weights).

**Checks.**

- Unit hexagon, rows `W(0)`, `W(−e₁)`, `W(−e₃)`, columns `B(0)`, `B(−e₃)`, `B(−e₂)`, unit weights:
  `[[1,0,1],[1,1,0],[0,1,1]]`, determinant `2`; exchanging the first two columns gives `−2`
  (gorin2021 lines 722–744), so only the absolute value is intrinsic.
- With type weights `(a,b,c)` the matrix is `[[c,0,a],[b,a,0],[0,c,b]]` with determinant `2abc`,
  the sum of the weights `abc` of `T_a` and of `T_b`.
- `R = {W(0)}`: one row, no column, partition function `0`.

### 3.2 Kasteleyn's theorem

For a finite simply connected region `R` with as many white as black faces and a positive edge
weight `w`, all nonzero terms of the Leibniz expansion of the (square) Kasteleyn matrix have the
same sign, so `|det| = partitionFunction R w`; with unit weights `|det|` is the number of tilings.
In Lean the balance is the existence of a bijection `σ : blackFaces R ≃ whiteFaces R`, and the
statement is `partitionFunction R w = |det ((kasteleynMatrix R w).submatrix id σ.symm)|` for every
such `σ` (`partitionFunction_eq_abs_det`; gorin2021 Theorem 2.1, lines 714–717, Theorem 3.1, lines
1218–1219; kenyon2009 Theorem 2, line 504, with the honeycomb proof of lines 537–550; kenyon1997
Theorem 2, lines 184–186). Route: a flip changes the matching bijection by a 3-cycle, which is
even, and multiplies the term by a positive factor; flips connect all tilings (2.8). *Needs:* 2.8,
3.1; Mathlib `Matrix.det_apply`, `Equiv.Perm.sign`.

**Checks.**

- Unit hexagon: `2` and `2abc`, as in 3.1.
- `R₆'` (2.9) is simply connected and balanced; its matrix, rows `W(0,0)`, `W(1,0)`, `W(1,1)`,
  columns `B(1,0)`, `B(1,1)`, `B(2,1)`, is `[[1,0,0],[1,0,0],[1,1,1]]`, of determinant `0`, and it
  has no tiling.
- `R_ring` (2.1) is not simply connected: its dual graph is the 12-cycle
  `W(−1,−1) – B(0,−1) – W(0,−1) – B(1,−1) – W(1,0) – B(1,0) – W(1,1) – B(1,1) – W(0,1) – B(0,0) –
  W(−1,0) – B(−1,−1)`, it has exactly the two tilings `T` (2.6) and
  `T' = {((−1,0),1), ((0,−1),2), ((1,−1),2), ((1,0),3), ((1,1),3), ((0,1),1)}`, whose matching
  bijections differ by a 6-cycle (odd), so with unit weights the determinant is `0` while the
  partition function is `2`.

### 3.3 Local statistics on finite regions

For a finite simply connected region `R` with positive partition function, a positive weight `w` and
pairwise distinct pairs `(f_i, g_i)` of a white and a black face of `R`, the Boltzmann probability
that every `f_i` is matched to `g_i` is `∏ K(f_i, g_i) · det[K⁻¹(g_i, f_j)]_{i,j}`, without absolute
value (`lozenge_correlation_eq_det`; gorin2021 Theorem 3.5, lines 1281–1288, and its proof, lines
1294–1352; kenyon2009 Corollary 3, lines 557–565; kenyon1997 Theorem 6, lines 362–373). In Lean
the pairs are `f : Fin n → whiteFaces R` and `g : Fin n → blackFaces R` with `i ↦ (f i, g i)`
injective, "matched" means that some edge of the tiling lies in both faces, the probability is the
`finsum` of the weights of the tilings in the event divided by `partitionFunction R w`, and
`K⁻¹(g, f) = ((kasteleynMatrix R w).submatrix id σ.symm)⁻¹ (σ g) f` for any bijection
`σ : blackFaces R ≃ whiteFaces R`; tileability is a hypothesis, since a balanced simply connected
region can be untileable (`R₆'` of 2.9). Route: `R`
is tileable, so `K = K_R` is square (3.1); by 3.2 all nonzero terms of its Leibniz expansion have
the sign `ε` of `det K`, and `ε det K = partitionFunction R w > 0`. The tilings in the event are the
bijections `σ` with nonzero term and `σ(f_i) = g_i`, so the event's weight is
`ε ∏ K(f_i, g_i) · Λ_K(f;g)`, with `Λ_K` the restricted Leibniz sum of the Conventions. If a white
or a black face repeats among the pairs, the event is empty and `[K⁻¹(g_i, f_j)]` has two equal
columns or rows. Otherwise Tau Ceti's
`Matrix.det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv`,
applied to the square matrix `(f,f') ↦ K(f, β⁻¹ f')` with the splitting that lists `f₁, …, f_k`
first, `τ` the identity and `σ = β ∘ σ₀` for a bijection `σ₀` with `σ₀(f_i) = g_i`, evaluates the
complementary minor of `Λ_K(f;g)` and gives `Λ_K(f;g) = det K · det[K⁻¹(g_i, f_j)]`; dividing the
event's weight by `ε det K` gives the formula. *Needs:* 3.2; Tau Ceti
`Matrix.det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv`; Mathlib
`Matrix.det_apply`, `Matrix.inv`, `Equiv.Perm.sign`.

**Checks.**

- Unit hexagon, unit weights: `K⁻¹` has `K⁻¹(B(0),W(0)) = 1/2`, `K⁻¹(B(0),W(−e₁)) = 1/2`,
  `K⁻¹(B(−e₃),W(0)) = −1/2`, `K⁻¹(B(−e₃),W(−e₁)) = 1/2`; the probability of `W(0)–B(0)` is `1/2`,
  and that of `W(0)–B(0)` together with `W(−e₁)–B(−e₃)` is
  `det[[1/2,1/2],[−1/2,1/2]] = 1/2`, the mass of `T_a`.
- The pairs `W(0)–B(0)` and `W(−e₁)–B(0)` share `B(0)`: the determinant has two equal rows and the
  probability is `0`.
- With type weights `(a,b,c)` on the hexagon both tilings have weight `abc` and the probability of
  `W(0)–B(0)` stays `c · K⁻¹(B(0),W(0)) = c · (ab)/(2abc) = 1/2`.
- Normalisation of the route on the unit hexagon, `β` sending the listed columns to the listed
  rows in order: for the pairs `W(0)–B(0)` and `W(−e₁)–B(−e₃)` the only admissible bijection also
  sends `W(−e₃)` to `B(−e₂)`, with sign `+1`, so `Λ_K = K(W(−e₃),B(−e₂)) = 1`, and
  `det K · det[[1/2,1/2],[−1/2,1/2]] = 2 · 1/2 = 1` agrees; dropping the factor `det K` would give
  `1/2 ≠ 1`, and the event's weight `ε · 1 · Λ_K = 1` over `ε det K = 2` is the probability `1/2`.

### Examples

The unit hexagon (determinant `2`, probability `1/2`), `R₆'` (determinant `0`), `R_ring` (the
negative control for simple connectivity).

### Dependencies

Layers 1–2; Tau Ceti's complementary-minor identity; Mathlib determinants and inverses.

## Layer 4: Gibbs specifications on configuration spaces

Throughout this layer `Γ` is a countable infinite group acting on a countable set `I`, and the
action is proper: for finite `F, F' ⊆ I` only finitely many `γ ∈ Γ` have `γF ∩ F' ≠ ∅`. `S` is a
measurable space, `Ω = I → S` carries the product σ-algebra, and `Γ` acts on `Ω` by
`(γω)(i) = ω(γ⁻¹i)`. Where subshifts enter (4.4–4.6), `S` also carries a topology, `Ω` the product
topology, and a subset `X ⊆ Ω` the subspace topology and the trace σ-algebra. A closed
`Γ`-invariant `X ⊆ Ω` is called a subshift. For `I = Γ` acting on itself by left
multiplication it is the carrier of Mathlib's `SymbolicDynamics.FullShift.MulSubshift S Γ`
(additively `SymbolicDynamics.FullShift.Subshift`): `(γω)(h) = ω(γ⁻¹h)` is `mulShift γ⁻¹ ω`, and as
`γ` runs over `Γ` so does `γ⁻¹`, so invariance under the action is Mathlib's condition. Witness on
`ℤ`: the action of `1` moves the indicator of `{0}` to the indicator of `{1}`, which is
`shift (−1)` of it, while `shift 1` gives the indicator of `{−1}`. For the index sets of Layers
5–10 (edges of a graph, with several `Γ`-orbits) Mathlib has no carrier. For the weak topology
of 4.4, for quasilocality in 4.5 and for the closedness statement 4.6(c), `S` is moreover finite
and carries both the discrete topology and the discrete σ-algebra (every subset measurable,
Mathlib `DiscreteMeasurableSpace`); specifications, Gibbs measures and the face property
4.6(a)–(b) put no hypothesis on `S`. Such an `S` is a Borel space
(`DiscreteMeasurableSpace.toBorelSpace`), so is `Ω` (`Pi.borelSpace`: `I` is countable and the
finite discrete `S` is second-countable), and so is `X` (`Subtype.borelSpace`): the product
σ-algebra of `Ω` and its trace on `X` are the Borel σ-algebras. The discrete topology alone does
not force this; with the trivial σ-algebra on `{0,1}` the product σ-algebra is trivial (4.4,
Checks). `Bool`, the alphabet of Layers 5–10,
carries both discrete structures natively (`Bool.instMeasurableSpace` is `⊤`; `Bool.borelSpace`).

### 4.1 Outside and tail σ-algebras

For `Λ ⊆ I` let `𝓕_{Λᶜ}` be the σ-algebra generated by the coordinates outside `Λ`, Mathlib's
`MeasureTheory.cylinderEvents Λᶜ`; the tail σ-algebra is `𝓣 = ⋂_{Λ finite} 𝓕_{Λᶜ}`
(sheffield2005 lines 1341–1344), the infimum of the family
`MeasureTheory.Filtration.cylinderEventsCompl`. Cylinder events are the members of
`MeasureTheory.measurableCylinders (fun _ : I => S)`, the sets `cylinder s B` with `s ⊆ I` finite
and `B` a measurable subset of `s → S`; when `S` carries the discrete σ-algebra these are all the
events depending on finitely many coordinates. *Needs:* Mathlib `MeasurableSpace.pi`,
`MeasureTheory.cylinderEvents`, `MeasureTheory.Filtration.cylinderEventsCompl`,
`MeasureTheory.measurableCylinders`; Tau Ceti `TauCeti.Probability.tailProcess`,
`TauCeti.Probability.tailProcess_eq_iInf_tailFamily`.

API:

- `𝓣` is a sub-σ-algebra; tail events are invariant under any change of finitely many
  coordinates; `𝓣` is mapped to itself by the action.
- The action carries `𝓕_{Λᶜ}` onto `𝓕_{(γΛ)ᶜ}`: an event depending only on the coordinates
  outside `Λ` is moved by `γ` to one depending only on the coordinates outside `γΛ`. With
  Mathlib's `MeasureTheory.cylinderEvents_mono` and `MeasureTheory.cylinderEvents_le_pi`,
  `𝓣 ≤ 𝓕_{Δᶜ} ≤ 𝓕_{Λᶜ} ≤ MeasurableSpace.pi` for finite `Λ ⊆ Δ`; the last inequality, traced on
  `X`, is the hypothesis `𝓑 ≤ 𝓧` of Mathlib's proper-kernel lemmas in 4.5.
- For `I` infinite (which properness forces unless `I = ∅`) and any enumeration `e : ℕ ≃ I`,
  `𝓣` equals `TauCeti.Probability.tailProcess (fun k ω => ω (e k))`, the tail σ-algebra of the
  coordinate process read along `e`: by `tailProcess_eq_iInf_tailFamily` the latter is
  `⋂_n 𝓕_{e([0,n))ᶜ}`, and every finite `Λ` lies in some `e([0,n))`. So `𝓣` is a σ-algebra of the
  form `limsup s atTop`, the one Mathlib's
  `ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop` consumes, and it does not
  depend on the enumeration.

**Checks.**

- `I = ℤ`, `S = {0,1}`: the event that `ω` has infinitely many ones lies in `𝓣` and in
  `tailProcess` along any enumeration of `ℤ`; the cylinder event `ω(0) = 1` lies in neither.
- `I` finite: `𝓣` is trivial, taking `Λ = I`.
- `Γ = ℤ` acting trivially on `I = {pt}` is not proper; for it the invariant event `ω(pt) = 1` has
  measure `1/2` under `(δ₀ + δ₁)/2` and is not almost surely equal to a tail event, so 4.2 needs
  properness.

### 4.2 Invariant events are almost surely tail events

If μ is a `Γ`-invariant probability measure on `Ω` and `A` is a measurable event with `γA = A` for
all `γ`, there is a tail event `T` with `μ(A Δ T) = 0`. Route: approximate `A` by cylinder events
`C_k` with `μ(A Δ C_k) < 2^{−k}`, translate `C_k` by `γ_k` so that it depends only on coordinates
outside the `k`-th set of an exhaustion of `I`, and take `T = limsup γ_kC_k`. This is the
ingredient of the face theorem georgii2011 Theorem 14.15, restated as sheffield2005 Lemma 3.2.2
(lines 1367–1371); the approximation is Mathlib's. *Needs:* 4.1; Mathlib
`MeasureTheory.exists_measure_symmDiff_lt_of_generateFrom_isSetRing`, applied to the ring of
measurable cylinders (`MeasureTheory.isSetRing_measurableCylinders`), which generates the product
σ-algebra (`MeasureTheory.generateFrom_measurableCylinders`), with the covering subfamily `{univ}`
(`MeasureTheory.univ_mem_measurableCylinders`).

**Checks.**

- For `Γ = ℤ` acting on `ℤ` by translation and the invariant event "the density of ones exists and
  equals `1/2`", `T` may be taken equal to it: it is already a tail event.
- For the trivial group (finite, excluded) acting on `I = {pt}` the conclusion fails as in 4.1.
- For the point mass at the constant configuration every event is almost surely trivial and the
  statement holds with `T ∈ {∅, Ω}`.

### 4.3 Bernoulli product measures

For a probability measure `ν` on `S`, the product `ν^{⊗I}` (Mathlib `Measure.infinitePi`) is
`Γ`-invariant and trivial on `𝓣` (Kolmogorov's zero-one law), hence `ErgodicSMul Γ Ω ν^{⊗I}` by
4.2 (ergodicity as triviality of invariant events: sheffield2005 Lemma 3.2.1, lines 1352–1360).
Route for tail triviality: read the coordinates along an enumeration of `I`, under which they are
independent with law `ν`, and apply the sequential zero-one law to `𝓣 = tailProcess` (4.1).
For `I = Γ` acting on itself and `S` finite with at least two positive weights, the ergodicity
conclusion is that of VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (Scope and ownership); the
route here does not use it.
*Needs:* 4.1, 4.2; Mathlib `Measure.infinitePi`,
`MeasureTheory.Measure.infinitePi_map_piCongrLeft` (invariance),
`ProbabilityTheory.iIndepFun_infinitePi`, `ProbabilityTheory.iIndepFun.precomp`,
`ProbabilityTheory.iIndepFun_iff_iIndep` (independence of the coordinates along `e`),
`ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`, `ErgodicSMul`; Tau Ceti
`TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` (reverse implication).

**Checks.**

- `I = Γ = ℤ`, `ν` the uniform law on `{0,1}`: the two-sided Bernoulli shift is ergodic; this
  case is also covered by VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (two positive weights).
- `ν = δ_a`: the product is the point mass at the constant configuration, ergodic; this case is
  excluded from V8.BernoulliArbitraryDiscrete, which asks for two positive weights.
- `(Bern(1/3)^{⊗ℤ} + Bern(2/3)^{⊗ℤ})/2` is shift-invariant and not ergodic (the event "the
  density of ones is `1/3`" has measure `1/2`): the product structure is used.

### 4.4 The weak topology on a finite-alphabet subshift

Define `Subshift Γ I S`: a set of configurations in `I → S` that is closed for the product topology
and contains `i ↦ ω(γ⁻¹ • i)` whenever it contains `ω`. A subshift is used as the type of its
configurations, with the subspace topology, the trace σ-algebra (Mathlib's subtype σ-algebra of
`MeasurableSpace.pi`) and the action `(γ • ω)(i) = ω(γ⁻¹ • i)` of `Γ`. Mathlib's
`SymbolicDynamics.FullShift.MulSubshift` is the case `I = Γ` described above; `Subshift` differs in
allowing an index set with several orbits.

Let `S` be finite with the discrete topology and the discrete σ-algebra, and `X ⊆ Ω` closed and
`Γ`-invariant, with the subspace topology and the trace σ-algebra. Then `X` is a compact
metrisable Borel space, the traces on `X` of cylinder events are clopen and measurable, `𝔓(X)`
(Mathlib `ProbabilityMeasure X`) is compact, `Γ` acts on `𝔓(X)` by affine homeomorphisms, and
`μ_n → μ` iff `μ_n(C) → μ(C)` for every cylinder event `C`.
For `S = Bool` the correlation functions `ρ_F(μ) = μ{ω : ω = 1 on F}`, `F ⊆ I` finite, determine
`μ`, and convergence of all of them is weak convergence (gorin2021 Definition 13.1 and Lemma 13.2,
lines 4509–4519; aggarwal2023 lines 412–418). *Needs:* 4.1; Mathlib `Function.compactSpace`,
`DiscreteMeasurableSpace.toBorelSpace`, `Pi.borelSpace`, `Subtype.borelSpace`, the compact-space
instance of `ProbabilityMeasure`,
`ProbabilityMeasure.tendsto_measure_of_isClopen_of_tendsto`,
`IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem`, applied to the traces on `X` of the
measurable cylinders, a π-system by `MeasureTheory.isPiSystem_measurableCylinders` and
`IsPiSystem.comap`.

API:

- For every `S`, finite or not, the action on a subshift is a group action, and each
  `ω ↦ γ • ω` is a homeomorphism and is measurable (each coordinate of `γ • ω` is a coordinate of
  `ω`), so the action is `MeasurableConstSMul`, as Tau Ceti's `ErgodicSMul.iff_mem_extremePoints`
  requires.
- For `I = Γ` acting on itself by left multiplication, a subshift is the same as a closed set
  invariant under Mathlib's `mulShift`, through `(γ • ω) = mulShift γ⁻¹ ω`.
- On a compact metrisable `X`, weak convergence of probability measures is convergence of the
  masses of the traces of cylinder events, and for `S = Bool` convergence of all correlation
  functions.

**Checks.**

- `I = ℤ`, `S = Bool`: the point masses at the indicators of `[n, ∞)` converge to the point mass
  at the zero configuration, since every cylinder event eventually sees only zeros.
- `Bern(1/2)^{⊗ℤ}` and `(δ_0 + δ_1)/2` (all zeros, all ones) have the same one-point function
  `1/2` and two-point functions `1/4` and `1/2` at `{0,1}`: one-point functions do not determine
  the measure.
- The set of finitely supported configurations is not closed, and the point masses at the
  indicators of `[0,n]` converge to the point mass at the indicator of `[0,∞)`: closedness of `X`
  is needed for the limit to stay in `𝔓(X)`.
- The discrete σ-algebra on `S` is needed, not only the discrete topology: take `Γ = I = ℤ` with
  the shift, `S = {0,1}` with the discrete topology but the trivial σ-algebra `{∅, S}`, and
  `X = {0̄, 1̄}`. The product σ-algebra of `Ω` is `{∅, Ω}`, so its trace on `X` has 2 sets while
  the Borel σ-algebra of the discrete two-point space `X` has 4; the clopen set
  `{1̄} = X ∩ {ω(0) = 1}` is not measurable, the Borel-factor hypothesis of `Pi.borelSpace` and the
  `OpensMeasurableSpace` hypothesis of the weak topology fail, and the only probability measure on
  `X` gives `X` mass 1, so `δ_{0̄} = δ_{1̄}`. With the discrete σ-algebra the trace and the Borel
  σ-algebra both have the 4 sets `∅, {0̄}, {1̄}, X`, and `(δ_{0̄} + δ_{1̄})/2` gives `{1̄}` mass
  `1/2`.

### 4.5 Specifications and Gibbs measures

Write `𝓕_X` for the trace σ-algebra on `X` and `𝓕_{Λᶜ,X} ≤ 𝓕_X` for the trace of `𝓕_{Λᶜ}`
(`Subshift.exterior X Λ`, the comap along the inclusion of `MeasureTheory.cylinderEvents Λᶜ`; the
inequality is `MeasurableSpace.comap_mono` of `MeasureTheory.cylinderEvents_le_pi`). A specification
on `X` (the structure `Specification X`, whose fields are the kernels, their Markov property, their
properness and their consistency) is a family `γ = (γ_Λ)`, indexed by finite `Λ ⊆ I`, of Mathlib
kernels `γ_Λ : Kernel[𝓕_{Λᶜ,X}, 𝓕_X] X X`, so that `ω ↦ γ_Λ(C|ω)` is `𝓕_{Λᶜ,X}`-measurable for every
`C ∈ 𝓕_X`, each an `IsMarkovKernel` and `ProbabilityTheory.Kernel.IsProper` (by
`isProper_iff_inter_eq_indicator_mul`, `γ_Λ(C ∩ B|ω) = 1_B(ω) γ_Λ(C|ω)` for `C ∈ 𝓕_X` and
`B ∈ 𝓕_{Λᶜ,X}`), and consistent: `γ_Λ ∘ₖ γ_Δ = γ_Δ` for `Λ ⊆ Δ`, with `γ_Λ` read as a kernel for
`𝓕_X` on its source through `Kernel.comap` along the identity. Mathlib's `∘ₖ` applies its right
factor first, so this is `γ_Δ γ_Λ = γ_Δ` in the left-to-right notation for products of kernels,
`∫ γ_Δ(dω'|ω) γ_Λ(C|ω') = γ_Δ(C|ω)`. A measure μ on `X` satisfies `Specification.IsGibbs γ μ` when
`μ.bind γ_Λ = μ` for every finite `Λ`, which is `Kernel.Invariant` of `γ_Λ` read as a kernel for
`𝓕_X`; a Gibbs measure is a probability measure with this property (sheffield2005 Section 1.1.2,
lines 303–342). The specification is `Γ`-equivariant when
`γ_{γ'Λ}(γ'C|γ'ω) = γ_Λ(C|ω)`, stated as: the push-forward of `γ_Λ(·|ω)` by `γ'` is
`γ_{γ'Λ}(·|γ'ω)`, with `γ'Λ` the image `Finset`; it is quasilocal when `ω ↦ γ_Λ(C|ω)` is continuous
on `X` for every cylinder event `C`. Write `Specification.gibbsInvariant γ` for the invariant Gibbs
measures, the members of Tau Ceti's `TauCeti.MeasureTheory.invariantMeasuresOfMeasureUnivEq Γ X 1`
that are Gibbs. Properness of each kernel is Mathlib's notion; the consistent family and its Gibbs
measures are this target's. The shape is that of the specifications of the GibbsMeasure project
(gibbsmeasure lines 34–63, file `GibbsMeasure/Specification.lean`), which live on the full
product `S → E`, with kernels `Kernel[cylinderEvents Λᶜ] (S → E) (S → E)` and the same
consistency equation `(γ Λ₁).comap id _ ∘ₖ γ Λ₂ = γ Λ₂` for `Λ₁ ⊆ Λ₂`; this target differs in
living on a subshift `X` and in making the Markov property and properness fields of the structure,
and that project's Gibbs predicate, stated through conditional expectations (gibbsmeasure lines
163–171), is equivalent to `Specification.IsGibbs` for probability measures and proper Markov
kernels by the first API item below.
*Needs:* 4.1; Mathlib `ProbabilityTheory.Kernel`,
`MeasureTheory.Measure.bind`, `MeasurableSpace.comap_mono`, `ProbabilityTheory.IsMarkovKernel`,
`ProbabilityTheory.Kernel.comp`, `ProbabilityTheory.Kernel.comap`, `measurable_id''`,
`ProbabilityTheory.Kernel.IsProper`, `ProbabilityTheory.Kernel.isProper_iff_inter_eq_indicator_mul`,
`ProbabilityTheory.Kernel.IsProper.setLIntegral_eq_comp`, `ProbabilityTheory.Kernel.Invariant`,
`MeasureTheory.cylinderEvents_le_pi`, `MeasureTheory.condExp`.

API:

- μ is Gibbs iff for every finite `Λ` and measurable `C`, `γ_Λ(C|·)` is a version of the conditional
  expectation of `1_C` given `𝓕_{Λᶜ,X}` (Mathlib `condExp`): by
  `IsProper.setLIntegral_eq_comp`, `∫_B γ_Λ(C|·) dμ = (μ.bind γ_Λ)(C ∩ B)` for `B ∈ 𝓕_{Λᶜ,X}`, and
  `B = X` gives the converse.
- The Gibbs measures `𝒢(γ)` form a convex set.
- For `Γ`-equivariant `γ`, `𝒢(γ)` is `Γ`-invariant. For every `γ`, write `𝒢_inv(γ)` for the
  invariant elements of `𝒢(γ)` and `𝔓_inv(X)` for the invariant probability measures.

**Checks.**

- On the closed shift-invariant subshift `X₀ = {0̄, 1̄}` of the two constant configurations of
  `{0,1}^ℤ`, `{0,1}` with its discrete σ-algebra, any coordinate outside a finite `Λ` determines
  the configuration, so the trace of `𝓕_{Λᶜ}` on `X₀` is the full σ-algebra; the identity
  specification `γ_Λ(·|ω) = δ_ω` is then a Markov kernel for `𝓕_{Λᶜ,X₀}`, proper
  (`δ_ω(C ∩ B) = 1_B(ω) δ_ω(C)` at all sixteen pairs of subsets `C, B` of `X₀`) and consistent
  (`δ ∘ₖ δ = δ`), and every probability measure on `X₀` is Gibbs for it.
- The identity kernels on all of `{0,1}^ℤ` are not a specification: they form a Markov kernel for
  the full σ-algebra on the source (Mathlib `ProbabilityTheory.Kernel.id`), and the properness
  identity `δ_ω(C ∩ B) = 1_B(ω) δ_ω(C)` holds for every `B`, but for `Λ = {0}` and
  `C = {ω(0) = 1}` two configurations differing only at `0` have the same exterior while
  `γ_Λ(C|·)` takes the values `0` and `1`, so they are not a kernel for `𝓕_{Λᶜ}` on the source
  (under `Bern(1/2)^{⊗ℤ}` the conditional expectation of `1_C` given `𝓕_{Λᶜ}` is `1/2`, not
  `1_C`). The source σ-algebra of the kernel type, not properness, excludes them.
- The independent specification `γ_Λ(·|ω) = ν^{⊗Λ} ⊗ δ_{ω|Λᶜ}` on `X = Ω` has `ν^{⊗I}` as its
  only Gibbs measure: `μ.bind γ_{{i}} = μ` makes the coordinate `i` independent of the others with
  law `ν`. Properness needs `B` exterior: for `ν = Bern(1/2)`, `Λ = {0}`, `C = {ω(0) = 1}` and the
  exterior event `B = {ω(1) = 1}`, both sides of the properness identity are `1_B(ω)/2`; for
  `B = C`, which is not exterior, at `ω(0) = 0` the left side is `1/2` and the right side `0`.
- Kernels `γ_{{i}}` independent with law `ν` and `γ_{{i,j}}` independent with law `ν' ≠ ν` violate
  consistency, and no measure is Gibbs for both. The order of composition matters: for
  `ν = Bern(1/2)`, `ν' = Bern(1/3)`, `i = 0`, `j = 1`, the composite `γ_{{0}} ∘ₖ γ_{{0,1}}`
  (resample `{0,1}` by `ν'`, then `0` by `ν`) gives `{ω(0) = 1}` probability `1/2`, while
  `γ_{{0,1}}` gives `1/3`, so consistency fails; the reversed composite `γ_{{0,1}} ∘ₖ γ_{{0}}`
  equals `γ_{{0,1}}` here and for every proper family with `Λ ⊆ Δ`, because a proper `γ_Λ`
  integrates the `𝓕_{Δᶜ}`-measurable, hence `𝓕_{Λᶜ}`-measurable, function `γ_Δ(C|·)` to its value
  at `ω`. Reading `∘ₖ` the other way would make consistency vacuous.

### 4.6 The face property and closedness

(a) If μ is Gibbs for `γ` and `ν` is a probability measure with `ν = f·μ` for a `𝓣`-measurable
`f ≥ 0`, then `ν` is Gibbs. (b) For every specification `γ`, equivariant or not, `𝒢_inv(γ)` is a
face of `𝔓_inv(X)`: if a convex combination with positive weights of invariant probability
measures is Gibbs, both are Gibbs; in Lean, `IsExtreme ℝ≥0∞` of `Specification.gibbsInvariant γ`
in Tau Ceti's
`TauCeti.MeasureTheory.invariantMeasuresOfMeasureUnivEq Γ X 1` (`gibbsInvariant_isExtreme`).
Hence an element of `𝒢_inv(γ)` is extreme in `𝒢_inv(γ)` iff it is extreme in `𝔓_inv(X)` iff it is
ergodic, `ErgodicSMul Γ X μ` (`gibbsInvariant_extreme_iff_ergodic`), and conditioning an element of
`𝒢_inv(γ)` on an invariant event of positive measure stays in `𝒢_inv(γ)`. Both Lean statements
carry the standing hypotheses of the layer explicitly: `Γ` countable and infinite, `I` countable,
and properness as the finiteness of `{γ : ∃ i ∈ F, γ • i ∈ F'}` for all finite `F`, `F'`; they put
no hypothesis on the alphabet `S` beyond its topology and σ-algebra, since the inputs of (a) and
(b) that involve `S`, namely 4.2, the measurability of the action (4.4) and the properness of the
kernels, hold for every `S` (sheffield2005 states Lemma 3.2.2 for the spin spaces `ℝ^m` and `ℤ^m`,
lines 256–263). (c) If `S` is finite with its discrete topology and σ-algebra and `γ` is
quasilocal, `𝒢(γ)`, `𝔓_inv(X)` and `𝒢_inv(γ)` are weakly closed, hence compact (sheffield2005
Lemma 3.2.2, lines 1367–1371; georgii2011 Theorem 14.15; gorin2021 Lemma 13.7 and its
proof, lines 4561–4582; kos2006 lines 195–202; kenyon2009 Section 5.1, lines 799–809). Route for
(b): the densities of the two measures with respect to their combination are almost surely
invariant, so each of their level sets is almost equal to an exactly invariant event (Tau Ceti
`TauCeti.MeasureTheory.exists_smul_invariant_ae_eq`), hence almost surely equal to the trace of a
tail event by 4.2, applied to the push-forward of the measure to `Ω` (invariant, because `X` is):
an invariant event `A = X ∩ A'` of `X` makes `A'` almost invariant for the push-forward, so neither
closedness nor measurability of `X` in `Ω` is used; the densities therefore have tail-measurable
versions, and (a) applies; the ergodicity statement is Tau Ceti's
`ErgodicSMul.iff_mem_extremePoints`. No step uses equivariance of `γ`, only the invariance of the
two measures and the properness of the action (sheffield2005 works with translation-invariant
potentials, line 354); equivariance is what makes `𝒢(γ)` itself
`Γ`-invariant (4.5). *Needs:* 4.2, 4.4, 4.5; Tau Ceti
`TauCeti.MeasureTheory.exists_smul_invariant_ae_eq`, `ErgodicSMul.iff_mem_extremePoints`,
`TauCeti.MeasureTheory.invariantMeasuresOfMeasureUnivEq`.

**Checks.**

- For the identity specification of 4.5 on `X₀ = {0̄, 1̄}` with the shift, both points are fixed,
  `𝒢_inv = 𝔓_inv` is the segment from `δ_{0̄}` to `δ_{1̄}`, and the face statement holds trivially;
  its extreme points `δ_{0̄}`, `δ_{1̄}` are the ergodic elements, while the midpoint gives the
  invariant event `{1̄}` measure `1/2`.
- For the independent specification of a law `ν` on `S`, with `Γ = I = ℤ` and `X = Ω`,
  `𝒢_inv = {ν^{⊗ℤ}}`, a one-point face of `𝔓_inv`, and `ν^{⊗ℤ}` is ergodic (4.3). This includes
  an infinite alphabet, `S = ℤ` with the geometric law `ν{n} = 2^{−n−1}` on `n ≥ 0`, outside the
  finite-alphabet setting of 4.4 and covered by (b) as stated.
- A non-discrete σ-algebra on `S`: for `S = {0,1}` with the discrete topology, the trivial
  σ-algebra and `X = {0̄, 1̄}` (4.4, Checks), the trace σ-algebra on `X` is `{∅, X}`, so `X` has a
  single probability measure; it is invariant, Gibbs for the only specification and ergodic,
  `𝔓_inv(X)` and `𝒢_inv(γ)` are that one point, and (b) holds. What fails there is the setting of
  (c): the clopen set `{1̄}` is not measurable.
- The tail hypothesis of (a) is needed: for the independent specification with `ν = Bern(1/2)`,
  the density `f(ω) = 2·1_{ω(0)=1}` is not tail-measurable and `f·Bern(1/2)^{⊗ℤ}` (coordinate `0`
  equal to `1` almost surely) is not Gibbs. The same example shows that (b) uses the invariance of
  the two measures: `Bern(1/2)^{⊗ℤ}` is the midpoint of `f·Bern(1/2)^{⊗ℤ}` and
  `(2 − f)·Bern(1/2)^{⊗ℤ}`, which are neither invariant nor Gibbs.
- A specification that is not equivariant: for `Γ = I = ℤ` with the shift, `S = {0,1}` and the
  independent kernels with law `δ₁` at the site `0` and `Bern(1/2)` at every other site, the only
  Gibbs measure gives `{ω(0) = 1}` mass `1` and `{ω(1) = 1}` mass `1/2`, so it is not invariant,
  `𝒢_inv(γ) = ∅`, and the empty set is a face of `𝔓_inv(X)`, as (b) asserts.

### Examples

Two-sided Bernoulli shifts (4.3); the identity specification on the subshift of constant
configurations and the independent specification (4.5).

### Dependencies

Mathlib product spaces, the exterior σ-algebras `cylinderEvents` and the ring of measurable
cylinders, the Borel structure of a discrete finite alphabet and its products and subspaces, weak
topology, portmanteau, zero-one law, Markov kernels with their composition, properness and
invariance, conditional expectation; Tau Ceti `TauCeti.Probability.tailProcess`,
`ErgodicSMul.iff_mem_extremePoints`, `TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant`,
`TauCeti.MeasureTheory.exists_smul_invariant_ae_eq`. No earlier layer.

## Layer 5: dimer models on periodic graphs

Throughout, `G` is a locally finite simple graph on a countable vertex type with an action of a
countable infinite group `Γ` by graph automorphisms whose induced action on the edge set is proper
(for `Γ = ℤ²` acting freely with finitely many vertex orbits this holds), and `w` is a positive
edge weight.

### 5.1 The configuration space of perfect matchings

Define `𝔛(G)` as the set of `ω : G.edgeSet → Bool` such that every vertex lies in exactly one edge
`e` with `ω e = true` (`IsDimerConfiguration G ω`, the dimer configurations); it is the set of
indicators of edge sets of perfect matchings (Mathlib `SimpleGraph.Subgraph.IsPerfectMatching` of
the spanning subgraph with those edges) (kenyon2009 lines 96–100; gorin2021 lines 4494–4501).
*Needs:* 4.4; Mathlib `SimpleGraph.Subgraph.IsPerfectMatching`, `SimpleGraph.LocallyFinite`.

API:

- `𝔛(G)` is closed, hence compact and metrisable, and `Γ`-invariant; `Γ` acts by homeomorphisms.
- The correspondence with Mathlib's perfect matchings is a bijection.
- For a finite set `F` of edges and `ω ∈ 𝔛(G)`, the completion set
  `Ω_F(ω) = {ω' ∈ 𝔛(G) : ω' = ω off F}` is finite and contains `ω`. Its set of restrictions
  `{ω'|_F : ω' ∈ Ω_F(ω)}` is the set of `η : F → Bool` such that every endpoint of an edge of `F`
  lies in exactly one edge that is either in `F` with value `true` under `η` or outside `F` with
  value `true` under `ω`; it therefore depends only on `ω` on the finitely many edges outside `F`
  sharing a vertex with an edge of `F`, and `Ω_F(ω)` is obtained by gluing these restrictions to
  the fixed exterior `ω|_{Fᶜ}`.

**Checks.**

- `G = ℤ` with nearest-neighbour edges and `Γ = 2ℤ`: `𝔛(G)` has exactly two points, the even and
  the odd edges. For `F = ∅` both restriction sets are `{∅}`, while the completion sets are the
  two different singletons: the completion set itself is not determined by `ω` near `F`, only its
  restrictions to `F` are.
- Local finiteness is needed for closedness (a statement about the graph alone, without a group
  action): on the vertices `c, d, x_n, y_n` (`n ≥ 1`) with edges `c x_n`, `d y_n`, `x_n y_n`, the
  perfect matchings `M_k = {c x_k, d y_k} ∪ {x_n y_n : n ≠ k}` converge coordinatewise to
  `{x_n y_n : n ≥ 1}`, which leaves `c` and `d` uncovered.
- The unit hexagon cycle `C₆`, a finite graph (5.1 and 5.2 do not use `Γ`): two points, matching
  1.5.

### 5.2 The dimer specification

For finite `F` define `γ^w_F(·|ω)` on `𝔛(G)` as the probability measure on `Ω_F(ω)` with masses
proportional to `∏_{e ∈ ω'∩F} w(e)` (kos2006 Section 2.2.1, lines 195–202; kenyon2009 Section 5.1,
lines 781–809; gorin2021 Definition 13.4, lines 4534–4537). Define `IsDimerGibbs G w μ` for a
measure μ on `G.edgeSet → Bool`: μ is a probability measure, the configurations outside `𝔛(G)` are
μ-null, and the cylinder identities of the API below hold, with `w(ω ∩ F)` the product of `w` over
the edges of `F` of value `true` under `ω`, entering as `ENNReal.ofReal` of that real product (exact
for positive `w`). It holds iff μ is the push-forward along the inclusion of a Gibbs measure of
`γ^w`. *Needs:* 4.5, 5.1; Mathlib `SimpleGraph.edgeSet`, `ENNReal.ofReal`.

API:

- `γ^w` is a proper, consistent, quasilocal specification on `𝔛(G)`; it is `Γ`-equivariant when
  `w` is `Γ`-invariant; for `w ≡ 1` it is uniform on completion sets. Quasilocality comes from the
  restriction sets of 5.1: for a cylinder event `C` on a finite edge set `E`, `γ^w_F(C|ω)` is a sum
  over the restriction set of `ω` at `F`, so it depends only on `ω` on `E ∖ F` and on the edges
  outside `F` sharing a vertex with an edge of `F`, and is locally constant.
- Cylinder identities: μ is Gibbs iff for every finite `F`, all `ω, ω' ∈ 𝔛(G)` agreeing off `F`,
  and every finite `E` containing `F` and the edges sharing a vertex with `F`,
  `w(ω' ∩ F) · μ[ω]_E = w(ω ∩ F) · μ[ω']_E`, where `[ω]_E` is the cylinder of configurations
  agreeing with `ω` on `E`; this needs no conditional probability.
- Gorin's vertex form: for every finite vertex set `Λ`, conditionally on the configuration outside
  `Λ` and on all vertices of `Λ` being matched inside `Λ`, the law inside is the Boltzmann law.
- Gauge invariance: replacing `w(uv)` by `w(uv)·g(u)·g(v)` for positive `g` leaves `γ^w`
  unchanged.

**Checks.**

- On `ℤ` with nearest-neighbour edges every completion set is a singleton, so every probability
  measure on `𝔛(G)`, for example `(δ_even + δ_odd)/2`, is Gibbs.
- On the finite cycle `C₆`, taking `F` all six edges, the only Gibbs measure is the Boltzmann
  measure; with unit weights it gives each matching mass `1/2`.
- A gauge transformation changes the weights of the two matchings of `C₆` by the same factor
  `∏_v g(v)`, so it does not change the Boltzmann measure; weights are not determined by the
  specification.
- Direction of the weights in `IsDimerGibbs`: on `C₆` with edges `e_i = {i, i+1}`, matchings
  `M_a = {e₀, e₂, e₄}` and `M_b = {e₁, e₃, e₅}`, `w(e₀) = 2` and `w = 1` elsewhere, the identity
  with `F = E` the six edges, `ω = M_a` and `ω' = M_b` reads `1 · μ{M_a} = 2 · μ{M_b}`, so
  `μ{M_a} = 2/3`, the Boltzmann value `w(M_a)/(w(M_a) + w(M_b))`; the reversed reading
  `w(ω ∩ F) · μ[ω]_E = w(ω' ∩ F) · μ[ω']_E` would give `1/3`.
- On `ℤ` with nearest-neighbour edges the point mass at the configuration with no edge has mass
  one and satisfies every cylinder identity (two dimer configurations agreeing off a finite set are
  equal), but leaves every vertex uncovered: only the null clause of `IsDimerGibbs` excludes it.

### 5.3 Gibbs, translation-invariant and ergodic dimer measures

For every positive `w`, invariant or not: the Gibbs measures `𝒢`, the invariant measures `𝔓_inv`
and the invariant Gibbs measures `𝒢_inv` of `γ^w` are weakly closed convex subsets of `𝔓(𝔛(G))`,
hence compact; `𝒢_inv` is a face of `𝔓_inv`; an element of `𝒢_inv` is ergodic iff it is extreme in
`𝒢_inv` iff it is extreme in `𝔓_inv`, iff every invariant event has measure `0` or `1`;
conditioning on an invariant event of positive measure stays in `𝒢_inv` (gorin2021 Definitions
13.4–13.6 and Lemma 13.7, lines 4534–4582; aggarwal2023 lines 413–420; kos2006 lines 195–202;
kenyon2009 lines 825–835; sheffield2005 Lemmas 3.2.1–3.2.2, lines 1352–1371). For `Γ`-invariant
`w`, `𝒢` is moreover `Γ`-invariant (4.5, 5.2). In Lean `Γ` acts through a homomorphism
`τ : Γ →* (G ≃g G)` into Mathlib's group of graph automorphisms, on edges by
`SimpleGraph.Iso.mapEdgeSet` and on configurations by `(g • ω)(e) = ω(τ(g⁻¹) e)`, properness being
the finiteness of `{g : ∃ e ∈ F, τ(g) e ∈ F'}` for all finite edge sets `F`, `F'`; the face
statement is that the `Γ`-invariant measures μ on `G.edgeSet → Bool` with `IsDimerGibbs G w μ`
form a face, `IsExtreme ℝ≥0∞`, of the `Γ`-invariant probability measures on `G.edgeSet → Bool`
(`dimerGibbsInvariant_isExtreme`, for `G` locally finite on a countable vertex type, `Γ` countable
and infinite, and `w` positive). Route: 4.6(b) for the subshift `𝔛(G)` and the specification
`γ^w`, transported through the inclusion of `𝔛(G)` by the cylinder identities of 5.2; the
invariant probability measures concentrated on `𝔛(G)` form a face of all invariant probability
measures (Tau Ceti `TauCeti.MeasureTheory.isExtreme_setOf_measure_eq_zero`), and a face of a face is
a face. Closedness is 4.6(c), `γ^w` being quasilocal by 5.2; the ergodicity equivalences follow from
the face property, Tau Ceti's `ErgodicSMul.iff_mem_extremePoints` (extreme in `𝔓_inv` iff ergodic)
and `TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` (ergodic iff every exactly
invariant event has measure `0` or `1`). Its statement for `hexGraph` is 5.4. *Needs:* 4.6, 5.2;
Mathlib `SimpleGraph.Iso.mapEdgeSet`, `IsExtreme`; Tau Ceti
`TauCeti.MeasureTheory.isExtreme_setOf_measure_eq_zero`, `ErgodicSMul.iff_mem_extremePoints`,
`TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant`.

**Checks.**

- On `ℤ` with `Γ = 2ℤ`: `𝒢_inv` is the segment between `δ_even` and `δ_odd`, both invariant under
  `2ℤ` and ergodic, and the midpoint is not ergodic (the event "the edge `{0,1}` is present" is
  `2ℤ`-invariant of measure `1/2`).
- Gorin's Definition 13.6 calls ergodic the extreme points of `𝒢_inv`, and Kenyon's Section 5.3 the
  invariant Gibbs measures with trivial invariant events; 5.3 shows the two agree.
- Gibbs measures need not be invariant: on `ℤ` with `Γ = ℤ` (translation by one, swapping even and
  odd), `δ_even` is Gibbs and not invariant.
- The group must be infinite: the trivial group acts properly on the finite cycle `C₆`, the only
  Gibbs measure for unit weights is `(δ_{M_a} + δ_{M_b})/2` (5.2), and it is the midpoint of the
  invariant probability measures `δ_{M_a}` and `δ_{M_b}`, which are not Gibbs; so the face
  statement fails for a finite `Γ`.

### 5.4 The lozenge instance

`hexGraph` is locally finite and countable, and `ℤ²` acts on it freely by colour-preserving
translations, properly on edges. Through 1.5 and 1.2, `𝔈(𝕋)` is `𝔛(hexGraph)` with the edge set
of `hexGraph` identified with `TriEdge`, the action is `τ`, and `𝔓(𝕋)` denotes
`𝔓(𝔛(hexGraph))`; push-forward along the inclusion identifies it with the probability measures on
`TriEdge → Bool` concentrated on `𝔈(𝕋)`. The uniform specification is written `γ^unif` and its
Gibbs measures are the Gibbs measures on lozenge tilings. For type weights `(w₁,w₂,w₃)` the
specification `γ^w` equals `γ^unif` (by 2.10, two tilings agreeing off a finite set have equal
type counts there) (aggarwal2023 lines 412–420; kenyon2009 lines 869–878).

Define `IsLozengeGibbs μ` for a measure μ on `TriEdge → Bool` in the cylinder form of 5.2: μ is a
probability measure, the configurations that are not plane tilings are μ-null, and for every
finite set `F` of edges, all plane tilings `ω`, `ω'` agreeing off `F`, and every finite `E`
containing every edge of every face that contains an edge of `F` (the edges of `hexGraph` sharing
a vertex with an edge of `F`, `F` included), the cylinders of `ω` and `ω'` on `E` have equal mass
(gorin2021 Definition 13.4, lines 4534–4537; kenyon2009 lines 781–809). Define
`lozengeGibbsInvariant`, the lozenge Gibbs measures that are `VAddInvariantMeasure (ℤ × ℤ)`. The
lozenge instance of 5.3 is: `lozengeGibbsInvariant` is a face, `IsExtreme ℝ≥0∞`, of the
translation-invariant probability measures on `TriEdge → Bool`
(`lozengeGibbsInvariant_isExtreme`), and an element of it is extreme in it iff it is
`ErgodicVAdd (ℤ × ℤ)` (`lozengeGibbs_extreme_iff_ergodic`) (sheffield2005 Lemma 3.2.2, lines
1367–1371, for the face property and the equivalence; georgii2011 Theorem 14.15; gorin2021
Definition 13.6 and Lemma 13.7, lines 4556–4582, and kenyon2009 lines 825–835, for the two notions
of ergodicity). Route: apply `dimerGibbsInvariant_isExtreme` (5.3) to `hexGraph`, `w ≡ 1` and
`Multiplicative (ℤ × ℤ)` acting by translations, and transport it along the bijection of 1.2
between the edge set of `hexGraph` and `TriEdge`, under which `IsDimerGibbs hexGraph 1` is
`IsLozengeGibbs` (the edges of `hexGraph` sharing a vertex with the edge that corresponds to `e`
correspond to the edges of the two faces containing `e`) and invariance under the translations
`τ` is `VAddInvariantMeasure (ℤ × ℤ)`; Tau Ceti's multiplicative ergodicity statements are applied
to `Multiplicative (ℤ × ℤ)`. *Needs:* 1.2, 1.5, 2.10, 5.2, 5.3; Mathlib `VAddInvariantMeasure`,
`ErgodicVAdd`, `IsExtreme`; Tau Ceti `ErgodicSMul.iff_mem_extremePoints`.

API:

- `IsLozengeGibbs μ` holds iff μ is the push-forward along the inclusion of a Gibbs measure of
  `γ^unif` on `𝔛(hexGraph)` (the cylinder identities of 5.2 with `w ≡ 1`), and then also of every
  `γ^w` with type weights.
- `IsLozengeGibbs` is preserved by convex combinations, by translations and by `ρ`, and by
  limits of cylinder probabilities (4.4, 5.3).
- A translation-invariant μ lies in `lozengeGibbsInvariant` iff its transport to `𝔛(hexGraph)` lies
  in `𝒢_inv(γ^unif)`, and ergodicity under `ℤ²` is the same on both sides.

**Checks.**

- The point mass at the empty configuration satisfies every cylinder identity (for `F ≠ ∅` the
  window `E` contains the three edges of a face, on which a plane tiling has an edge, so neither
  cylinder contains the empty configuration and both have mass `0`; for `F = ∅`, `ω = ω'`) and is a
  probability measure, but it gives full mass to a configuration that is not a plane tiling:
  the concentration clause is what excludes it.
- `2δ_{M₃}` satisfies the cylinder identities and is concentrated on `𝔈(𝕋)`, but has mass `2`:
  the probability clause is needed for the face statement, whose ambient set has mass one.
- The three frozen tilings are fixed by every translation; their point masses are invariant and
  Gibbs, since their completion sets are singletons (6.3).
- `(δ_{M₁} + δ_{M₂} + δ_{M₃})/3` is in `𝒢_inv` and not ergodic (gorin2021 Exercises 13.3 and
  13.9, lines 4520–4526 and 4583–4585).
- With type weights `(a,b,c)`, the two tilings of the unit hexagon have equal weights `abc`, so the
  weighted and uniform completion laws agree on that window.

### Examples

Matchings of `ℤ` (two configurations, every measure Gibbs); `C₆`; the frozen lozenge tilings.

### Dependencies

Layer 4; Mathlib `SimpleGraph.Iso.mapEdgeSet`, `IsExtreme` and Tau Ceti
`TauCeti.MeasureTheory.isExtreme_setOf_measure_eq_zero`, `ErgodicSMul.iff_mem_extremePoints`,
`TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` (5.3); for 5.4 also 1.2, 1.5 and
2.10, and Mathlib `VAddInvariantMeasure`, `ErgodicVAdd`.

## Layer 6: slopes and the boundary of the slope triangle

### 6.1 The slope

For μ ∈ `𝔓_inv(𝕋)` define `slope μ = (μ{(0,1) ∈ M}, μ{(0,2) ∈ M})` (aggarwal2023 lines 421–431;
gorin2021 Definition 13.10 and Remark 13.11, lines 4590–4627; kos2006 lines 203–205; kenyon2009
lines 829–832). In Lean `slope μ` is the pair of `Measure.real` masses of the configurations
containing the edges `⟨0, 0⟩` and `⟨0, 1⟩`, defined for every measure on `TriEdge → Bool`. From
here on `𝒢_inv` for lozenge tilings is `lozengeGibbsInvariant`. *Needs:* 2.5, 5.4; Mathlib
`MeasureTheory.Measure.real`.

API:

- With `slope μ = (s,t)`, every face lies in a lozenge of type 1, 2, 3 with probabilities `s`, `t`,
  `1 − s − t`, independent of the face; hence `slope μ ∈ 𝒯̄` (aggarwal2023 lines 453–456).
- `E_μ[H_M(x,y)] = sx + ty` for all `(x,y)`, the integrand being bounded by `|x| + |y|` (kos2006
  line 204).
- `slope` is affine and weakly continuous on `𝔓_inv(𝕋)` (it evaluates clopen cylinder events);
  `slope(ρ_*μ) = (1 − s − t, s)`.
- For every `(s,t)`, the fibre `{μ ∈ 𝒢_inv : slope μ = (s,t)}` is compact and convex.

**Checks.**

- `δ_{M₁}`, `δ_{M₂}`, `δ_{M₃}` have slopes `(1,0)`, `(0,1)`, `(0,0)`, and `ρ_*δ_{M₁} = δ_{M₂}`
  matches `(1 − 1 − 0, 1) = (0,1)`.
- `(δ_{M₁} + δ_{M₂} + δ_{M₃})/3` has slope `(1/3, 1/3)`.
- For `ε` distributed as `Bern(s)^{⊗ℤ}`, the row tiling `M_ε` has law of slope `(s, 0)`; the
  face `W(0)` lies in a type-3 lozenge with probability `1 − s`.

### 6.2 The corners

For μ ∈ `𝔓_inv(𝕋)`: `slope μ = (1,0)` iff `μ = δ_{M₁}`; `(0,1)` iff `δ_{M₂}`; `(0,0)` iff
`δ_{M₃}`. Each of these point masses is an ergodic Gibbs measure (gorin2021 Exercises 13.3 and
13.9, lines 4520–4526 and 4583–4585; kenyon2009 Exercise 13, line 891). Route: slope `(1,0)` puts
every direction-1 edge in `M` almost surely, and `M₁` is the only plane tiling containing them all. *Needs:* 6.1.

**Checks.**

- `δ_{M₁}` has slope `(1,0)`; a mixture `(δ_{M₁} + δ_{M₂})/2` has slope `(1/2, 1/2)`, not a corner.
- A non-invariant measure, the point mass at `M_ε` with `ε = 1_{[0,∞)}`, has `μ{(0,1) ∈ M} = 1` but
  is not `δ_{M₁}`: invariance is used.
- The fibre over each corner is a single point, hence a face of `𝒢_inv`.

### 6.3 The edges of the slope triangle

Let `Φ₂` be the set of plane tilings with no lozenge of type 2. (a) `M ↦ ε(M)`,
`ε(M)_x = [((x,0),1) ∈ M]`, is a homeomorphism `Φ₂ → {0,1}^ℤ` with inverse `ε ↦ M_ε`; it turns
`τ_{e₁}` into the shift and `τ_{e₂}` into the identity. (b) If `M ∈ Φ₂` and `M'` is a plane tiling
with `M Δ M'` finite, then `M' = M`: the height of `M'` agrees with that of `M` far away and is
nondecreasing along each vertical line, on which `H_M` is constant. (c) Every probability measure on
`𝔈(𝕋)` concentrated on `Φ₂` is Gibbs. (d) A translation-invariant μ has slope `(s,0)` iff
`μ(Φ₂) = 1` and `μ{(0,1) ∈ M} = s`. (e) `μ ↦ ε_*μ` is an affine homeomorphism from the invariant
Gibbs measures of slope `(s,0)` onto the shift-invariant probability measures `ν` on `{0,1}^ℤ` with
`ν{ε₀ = 1} = s`, and μ is ergodic under `ℤ²` iff `ε_*μ` is ergodic under the shift. In Lean the code
is `rowCode ω = (x ↦ ω ((x,0),1))` on all configurations, the shift is `σ ε = (x ↦ ε (x − 1))`, and
(d)–(e) for `0 ≤ s ≤ 1` are `slopeEdge_ergodicGibbs_equiv`: the push-forward along `rowCode` is a
bijection (`Set.BijOn`) from the members of `lozengeGibbsInvariant` of slope `(s,0)` onto the
probability measures `ν` on `ℤ → Bool` for which `σ` is `MeasurePreserving` and
`ν{ε | ε 0 = true} = s`, and μ is `ErgodicVAdd (ℤ × ℤ)` iff `σ` is `Ergodic` for the push-forward of
μ along `rowCode`; affinity and continuity are API. (f) For `0 < s < 1`, `Bern(s)^{⊗ℤ}` and the
phase-randomised block measure `β_s = (β + σ_*β)/2` (where `β` makes the pairs `(ε_{2k}, ε_{2k+1})`
independent, equal to `(1,1)` with probability `s` and `(0,0)` otherwise) are distinct ergodic
shift-invariant measures of density `s`; so there are at least two ergodic Gibbs measures of slope
`(s,0)`, and by `ρ` the same holds at the non-corner points of the edges `s = 0` and `s + t = 1`
(`two_ergodicGibbs_of_slopeEdge`, stated on the three open edges, whose points are extreme slopes
in the sense of gorin2021 lines 4638–4642; sheffield2005 Theorem 9.5.1, lines 6195–6198; kenyon2009
Exercise 13, line 891). Route for the ergodicity of
`β_s`: `β` is a Bernoulli measure for the square of the shift (4.3), and a shift-invariant event `A`
has `β_s(A) = β(A) ∈ {0,1}`. *Needs:* 1.6, 2.5, 4.3, 5.3, 5.4, 6.1; Mathlib
`MeasureTheory.MeasurePreserving`, `Ergodic`, `ErgodicVAdd`, `Set.BijOn`.

API:

- `rowCode` is continuous and measurable for the product structures, each value being one
  coordinate of `ω`, and `rowCode (M_ε) = ε` for the row tilings of 1.6.
- `rowCode (e₁ +ᵥ ω) = σ (rowCode ω)` for every configuration `ω`; for `ω ∈ Φ₂` also
  `rowCode (e₂ +ᵥ ω) = rowCode ω`, and on `Φ₂` it is the homeomorphism of (a).

**Checks.**

- `P(ε₀ = ε₁ = 1)` is `s²` under `Bern(s)^{⊗ℤ}` and `(s + s²)/2` under `β_s`; at `s = 1/2` these
  are `1/4` and `3/8`, and they agree only at `s ∈ {0,1}`.
- The corners are the degenerate cases: at `s = 1`, the invariant probability measures
  concentrated on `Φ₂` with slope `(1,0)` form the singleton `{δ_{M₁}}` (the mixture
  `(δ_{M₁} + δ_{M₃})/2` is concentrated on `Φ₂` but has slope `(1/2, 0)`), and the only
  shift-invariant measure of density `1` is the point mass at the all-ones sequence.
- The row tiling with `ε = 1_{[0,∞)}` lies in `Φ₂`, its point mass is Gibbs by (c) and is not
  translation-invariant: Gibbs measures concentrated on `Φ₂` need not be invariant.
- `rowCode` sends `M₁` to the constant sequence `true` and both `M₂` and `M₃` to the constant
  `false`: it is not injective on plane tilings, which is why (a) restricts it to `Φ₂`, which
  contains `M₃` but not `M₂`.
- Shift direction: for `ε = 1_{[0,∞)}`, `e₁ +ᵥ M_ε = M_{1_{[1,∞)}}` (1.6), whose code `1_{[1,∞)}`
  is `σε`, since `(σε)(x) = ε(x − 1)`; the opposite shift `x ↦ ε(x + 1)` would give `1_{[−1,∞)}`.

### 6.4 Extreme points of slope fibres

The measure `ν₃ = (δ_{M₁} + δ_{M₂} + δ_{M₃})/3` is an extreme point of the slope fibre over
`(1/3, 1/3)` in `𝒢_inv` and is not ergodic: any invariant Gibbs measure absolutely continuous with
respect to `ν₃` is `Σ a_k δ_{M_k}`, of slope `(a₁, a₂)`, and slope `(1/3,1/3)` forces
`a = (1/3,1/3,1/3)`. Likewise `Σ a_k δ_{M_k}` with `a = (s, t, 1 − s − t)` lies in the fibre over
any non-corner slope `(s,t)` and is a proper combination of measures outside it, so no fibre over a
non-corner slope is a face of `𝒢_inv`, and the existence of an ergodic Gibbs measure of a given
slope does not follow from Krein–Milman on the fibre; 9.5 proves it with the explicit kernel. (This corrects the argument of
kenyon2009 lines 860–866, which deduces ergodicity of fibre elements from extremality in the
fibre.) *Needs:* 5.3, 6.1.

**Checks.**

- `ν₃` is in `𝒢_inv` (5.4) with slope `(1/3, 1/3)`, and the invariant event "`M = M₁`" has measure
  `1/3`.
- At a corner the fibre is a point (6.2), which is a face, so the phenomenon is specific to
  non-corner slopes.
- On the edge `t = 0`, the average of the point masses at `M_ε` and `M_{σε}` for the alternating
  sequence `ε` is invariant, Gibbs by 6.3(c), of slope `(1/2, 0)`, and ergodic by 6.3(e), the shift
  acting transitively on the two-point orbit.

### Examples

Frozen measures, Bernoulli rows, block rows, `ν₃`.

### Dependencies

Layers 1 (the row tilings of 1.6), 2, 4, 5.

## Layer 7: torus tilings and torus limits

### 7.1 Torus tilings and height changes

For `n₁, n₂ ≥ 1` let `L = n₁ℤ × n₂ℤ`; the torus tilings are the `L`-invariant plane tilings
(for `n₁, n₂ ≥ 2`, the perfect matchings of the quotient of `hexGraph` by `L`, a simple graph whose
white faces have three distinct neighbours; for `n₁ = 1` or `n₂ = 1` the quotient has multiple
edges and only the periodic description is used); in Lean `IsTorusTiling n₁ n₂ M` is
`IsTiling Set.univ M` together with invariance of `M` under translation by `(n₁,0)` and `(0,n₂)`.
Their height change `(h₁,h₂)` is defined in the conventions (kos2006 lines 187–192; kenyon2009
lines 665–690; gorin2021 Section 3.3, lines 1353–1392); `heightChange n₁ n₂ M` is the pair of
counts of the first API item taken on the segments `[0,n₁) × {0}` and `{0} × [0,n₂)`, the number
of `x ∈ [0,n₁)` with `((x,0),1) ∈ M` and of `y ∈ [0,n₂)` with `((0,y),2) ∈ M`. *Needs:* 1.5, 2.5.

API:

- `h₁` is the number of type-1 lozenges on any horizontal segment of length `n₁`, and `h₂` the
  number of type-2 lozenges on any vertical segment of length `n₂`.
- Per fundamental domain there are `n₂h₁` lozenges of type 1, `n₁h₂` of type 2 and
  `n₁n₂ − n₂h₁ − n₁h₂` of type 3 (kenyon2009 Lemma 4, lines 682–690, for `n₁ = n₂`).
- The attainable height changes are exactly the `(a,b) ∈ ℕ²` with `n₂a + n₁b ≤ n₁n₂`, each
  realised by the floor tiling `H(x,y) = ⌊(n₂ax + n₁by)/(n₁n₂)⌋` (kenyon2009 lines 845–857).

**Checks.**

- `n₁ = n₂ = 1`: exactly three torus tilings, one of each type, with height changes `(1,0)`,
  `(0,1)`, `(0,0)`.
- `n₁ = n₂ = 2`, `(a,b) = (1,1)`: the floor tiling `⌊(x+y)/2⌋` has increment `1` along every `e₃`,
  so no type-3 lozenge, matching `4 − 2 − 2 = 0`.
- `(a,b) = (2,1)` on the 2 × 2 torus violates `2a + 2b ≤ 4` and is not attained.

### 7.2 Torus measures

For attainable `(a,b)` let `μ^{(a,b)}_{n₁,n₂}` be the uniform measure on torus tilings with height
change `(a,b)`; for `(s,t) ∈ 𝒯̄` let `μ^{s,t}_n = μ^{(⌊ns⌋,⌊nt⌋)}_{n,n}`, defined because
`⌊ns⌋ + ⌊nt⌋ ≤ n`; for type weights `w` let `μ^w_{n₁,n₂}` be the Boltzmann measure on all torus
tilings. All are viewed in `𝔓(𝕋)` (kos2006 Section 2.2.2, lines 206–213; kenyon2009 lines
860–863). In Lean `torusMeasure n s t` is Mathlib's `ProbabilityTheory.uniformOn` of the
configurations that are `n × n` torus tilings with `heightChange` equal to `(⌊ns⌋₊, ⌊nt⌋₊)`, a
probability measure for `n ≥ 1` and `(s,t) ∈ 𝒯̄`, the set being finite and nonempty (the floor
tiling of 7.1 lies in it). *Needs:* 7.1; Mathlib `ProbabilityTheory.uniformOn`.

API:

- Each is invariant under all of `ℤ²`.
- `slope μ^{(a,b)}_{n₁,n₂} = (a/n₁, b/n₂)`.

**Checks.**

- `μ^{0,0}_1 = δ_{M₃}`.
- `n = 2`, `(s,t) = (1/2, 0)`: height change `(1,0)`, two torus tilings (row tilings with `ε` of
  period two), each of mass `1/2`, slope `(1/2, 0)`.
- On the 2 × 2 torus with unit type weights, `μ^w_{2,2}` is uniform on the nine torus tilings
  (8.3), and its slope is `(1/3, 1/3)` by symmetry under `ρ`.

### 7.3 Torus limits are translation-invariant Gibbs measures

Every weak limit point of `(μ^{s,t}_n)_n` lies in `𝒢_inv` and has slope `(s,t)`; every weak limit
point of `μ^w_{n₁(k),n₂(k)}` with `n₁(k), n₂(k) → ∞` lies in `𝒢_inv`. Hence for every
`(s,t) ∈ 𝒯̄` the fibre of `𝒢_inv` over `(s,t)` is nonempty, compact and convex (kenyon2009
Section 5.4, lines 844–866; kos2006 Theorem 2.1, lines 215–220, whose existence half this is,
without the ergodicity of the limit; gorin2021 Section 13.4, lines 4689–4694, for the weighted
torus computation of its Theorem 4.11 read as a local limit). The uniform statement is
`torusLimit_mem_gibbsInvariant_slope`: for `(s,t) ∈ 𝒯̄`, a strictly increasing `φ : ℕ → ℕ` and a
measure ν such that `torusMeasure (φ k) s t` of every cylinder converges to its ν-mass, ν lies in
`lozengeGibbsInvariant` and `slope ν = (s,t)`. On the compact metrisable space `TriEdge → Bool`
the weak limit points of a sequence of probability measures are exactly these subsequential
cylinder limits (4.4), and the limit has mass one (take the empty cylinder). Route: the cylinder
identities of 5.2 hold exactly for windows that embed in the torus, because a change inside such a
window does not change the height change; they pass to weak limits; the slope is continuous.
Ergodicity of these limits is not asserted (6.4); for the weighted tori it follows from 9.4 along
good sizes. *Needs:* 4.4, 5.3, 5.4, 6.1, 7.2; Mathlib compactness of `ProbabilityMeasure`.

**Checks.**

- `(s,t) = (0,0)`: every `μ^{0,0}_n` is `δ_{M₃}`.
- `(s,t) = (1/2, 0)`: `μ^{1/2,0}_{2m}` is the law of the row tiling of a uniformly random sequence
  of period `2m` with `m` ones per period; a pattern on `k` fixed sites with `j` ones has
  probability `C(2m−k, m−j)/C(2m, m) → 2^{−k}`, so the sequence converges to the Bernoulli row
  measure, an ergodic Gibbs measure of slope `(1/2, 0)` (6.3).
- For `n = 3` and `(s,t) = (1/3, 1/3)` the measure `μ^{1/3,1/3}_3` has height change `(1,1)` and
  slope exactly `(1/3,1/3)`.

### Examples

The 1 × 1 and 2 × 2 tori; row tilings of period two.

### Dependencies

Layers 1, 2, 4 (the weak topology of 4.4, for 7.3), 5, 6; Mathlib `ProbabilityTheory.uniformOn`
and the compactness of `ProbabilityMeasure`.

## Layer 8: Kasteleyn theory on the torus

### 8.1 Twisted Kasteleyn matrices

For `n₁, n₂ ≥ 1`, an `L`-periodic real edge weight `w` and `(a,b) ∈ {0,1}²`, define `K_{ab}` as
in the conventions: a square matrix indexed by `[0,n₁) × [0,n₂)`, with rows the white faces and
columns the black faces of the fundamental domain (`twistedKasteleyn n₁ n₂ w a b`, indexed by
`Fin n₁ × Fin n₂`, with `n₁, n₂` nonzero as `NeZero` instances; gorin2021 Definition 3.9, lines
1452–1457; kenyon1997 Section 4.1, lines 380–390). Define the torus partition function
`torusPartitionFunction n₁ n₂ w`, the `finsum` over the torus tilings of the product of `w` over
their edges `(v,k)` with `v ∈ [0,n₁) × [0,n₂)`, one for each white face of the fundamental domain.
Positivity of `w` is not used in 8.1–8.3, which are polynomial identities in the weights.
*Needs:* 7.1; Mathlib `Matrix.det`, `finsum`, `finprod`; the Lean core class `NeZero`.

API:

- The row of `W(v)` receives three edge contributions, the signed weights `w₃`, `±w₁`, `±w₂` (for
  type weights) of its torus lozenges of types 3, 1, 2, at the columns `v`, `v − e₂`, `v + e₁` taken
  modulo `L`; contributions whose columns coincide are added, so an entry may vanish although its
  summands do not.
- For type weights, `K_{ab}` commutes with the twisted translations of the torus.
- Leibniz expansion: expanding every entry into its edge contributions, `det K_{ab}` is a signed
  sum, over torus tilings, of their weights.
- For `n₁, n₂ ≥ 1` a torus tiling is determined by its edges `(v,k)` with `v ∈ [0,n₁) × [0,n₂)`,
  so there are finitely many; `torusPartitionFunction n₁ n₂ w` is a finite sum, a polynomial in
  the values of `w` on those edges, and at `w ≡ 1` it is the number of torus tilings.

**Checks.**

- `n₁ = n₂ = 1`: `K_{ab} = w₃ + (−1)^b w₁ + (−1)^a w₂`, a 1 × 1 matrix whose single entry adds the
  three edge contributions, every lozenge of type 1 crossing the horizontal seam and every lozenge
  of type 2 the vertical one; at type weights `(1,1,2)`, `K₁₁ = 2 − 1 − 1 = 0` although its three
  summands are nonzero.
- `n₁ = n₂ = 2`, unit weights: `det K₀₀ = −3`, `det K₁₀ = det K₀₁ = det K₁₁ = 5` (by 8.5).
- Reversing the convention for which seam carries `a` exchanges `K₁₀` and `K₀₁`: on the 1 × 2 torus
  (`n₁ = 1`, `n₂ = 2`) with unit weights `det K₁₀ = −1` and `det K₀₁ = 5`, so the convention is
  pinned; there `det K₀₀ = 3`, `det K₁₁ = 1`, `ε₁₀ = −1`, and 8.3 gives `(3 + 5 + 1 + 1)/2 = 5`
  tilings (height changes `(0,0)`, `(1,0)`, `(0,2)` once each and `(0,1)` twice).

### 8.2 The sign of a torus tiling

The term of a torus tiling `M` with height change `(h₁,h₂)` in `det K_{ab}`, expanded into edge
contributions (8.1), has sign
`(−1)^{h₁h₂ + (n₂+1+b)h₁ + (n₁+1+a)h₂}`, the all-type-3 tiling having sign `+1` (kenyon2009 Lemma 5,
lines 698–717; gorin2021 Propositions 3.7–3.8 and the proof of Theorem 3.10, lines 1416–1504).
Route: the matching bijection of `M` relative to the all-type-3 tiling is the permutation
`v ↦ v + δ(v)` of the torus with `δ(v) ∈ {0, −e₂, e₁}`; the orbits of its lift to `ℤ²` are
monotone staircase paths, totally ordered because two disjoint staircases cannot cross (the
difference of their `x + y` values at equal `x − y` is even and changes by `0` or `±2`); hence all
non-trivial cycles have the same primitive winding `(k₁,k₂)`, their number is `gcd(h₁,h₂)`, and
the lengths sum to `n₁h₂ + n₂h₁`; the twists contribute `(−1)^{ah₂ + bh₁}`; and
`(−1)^{gcd(h₁,h₂)} = (−1)^{h₁h₂ + h₁ + h₂}`. *Needs:* 7.1, 8.1; Mathlib `Equiv.Perm.sign`.

**Checks.**

- `n₁ = n₂ = 1`: the type-1 tiling has `(h₁,h₂) = (1,0)` and sign `(−1)^b`, the type-2 tiling sign
  `(−1)^a`, matching the entries of 8.1.
- `n₁ = n₂ = 2`, the floor tiling of height change `(1,1)`: the permutation is the 4-cycle
  `(0,0) → (1,0) → (1,1) → (0,1) → (0,0)`, with one type-2 lozenge on the vertical seam and one
  type-1 lozenge on the horizontal seam, so for `a = b = 0` the sign is `−1`, as the formula gives.
- Summing signs over the nine tilings of the 2 × 2 torus (counts `1, 2, 2, 1, 1, 2` for height
  changes `(0,0), (1,0), (0,1), (2,0), (0,2), (1,1)`, signs `+, −, −, +, +, −` for `a = b = 0`)
  gives `1 − 2 − 2 + 1 + 1 − 2 = −3 = det K₀₀`.

### 8.3 The torus partition function

`Σ_M ∏_{e∈M} w(e) = (ε₀₀ det K₀₀ + ε₀₁ det K₀₁ + ε₁₀ det K₁₀ + ε₁₁ det K₁₁)/2`, the sum over torus
tilings, with `ε_{ab} = −1` exactly when `(a,b) ≡ (n₁,n₂)` modulo `2` and `+1` otherwise,
for every `L`-periodic real edge weight `w`, the left side being `torusPartitionFunction n₁ n₂ w`
(`torus_partitionFunction_eq`; gorin2021 Theorem 3.10 and table (3.4), lines 1458–1472; kenyon2009
equation (3), line 724, for `n` odd; kenyon1997 Lemma 7, lines 392–396; kos2006 Theorem 4.2
context, lines 657–666). The sources state it for positive weights; both sides are polynomials in
the values of `w` on the fundamental domain, and the identity holds term by term. Route: by 8.2,
for every height change the four signs weighted by `ε_{ab}` sum to `2`, a check over the parities
of `h₁`, `h₂`, `n₁`, `n₂`. *Needs:* 8.2.

**Checks.**

- `n₁ = n₂ = 1`, odd parities, `ε₁₁ = −1`:
  `((w₃+w₁+w₂) + (w₃−w₁+w₂) + (w₃+w₁−w₂) − (w₃−w₁−w₂))/2 = w₁ + w₂ + w₃`.
- `n₁ = n₂ = 2`, unit weights, `ε₀₀ = −1`: `(3 + 5 + 5 + 5)/2 = 9`, the number of tilings counted in
  8.2.
- Using `ε₀₀ = −1` on the 1 × 1 torus would give `(−(w₃+w₁+w₂) + (w₃−w₁+w₂) + (w₃+w₁−w₂) +
  (w₃−w₁−w₂))/2 = w₃ − w₁ − w₂`, wrong: the signs depend on the parities of `n₁`, `n₂`.
- A signed periodic weight on the 1 × 2 torus: all weights `1` except `w((0,0),3) = −1`. The five
  torus tilings have weights `1, 1, 1, −1, −1`, so the left side is `1`; the matrices are
  `K₀₀ = [[0,1],[1,2]]`, `K₀₁ = [[0,−1],[1,2]]`, `K₁₀ = [[−2,1],[1,0]]`, `K₁₁ = [[−2,−1],[1,0]]`
  (rows and columns `(0,0)`, `(0,1)`), with determinants `−1, 1, −1, 1`, and with `ε₁₀ = −1` the
  right side is `(−1 + 1 + 1 + 1)/2 = 1`.

### 8.4 Torus correlations

For pairwise distinct torus lozenges `ℓ₁, …, ℓ_k`, with `ℓ_i` joining `W(u_i)` to `B(v_i)` and of
signed weight `κ_{ab}(ℓ_i)` (8.1), the Boltzmann probability that all occur is
`(2Z)⁻¹ Σ_{ab} ε_{ab} ∏_i κ_{ab}(ℓ_i) · c_{ab}`. Here `c_{ab} = 0` when two of the `ℓ_i` share a
white or a black face; otherwise `c_{ab} = Λ_{K_{ab}}(u;v)` is the restricted Leibniz sum of the
Conventions, the signed complementary minor of `K_{ab}`: the sum over bijections `σ` from the white
to the black faces of the fundamental domain with `σ(u_i) = v_i` of
`sgn(σ) ∏_{u ∉ {u_i}} K_{ab}(u, σu)`, where `sgn(σ)` is the sign of `σ` read as a permutation of
`[0,n₁) × [0,n₂)`. When `det K_{ab} ≠ 0`, `c_{ab} = det K_{ab} · det[K_{ab}⁻¹(v_i, u_j)]` with this
convention, the determinant having two equal rows or columns when a face repeats (gorin2021
Theorem 4.10, lines 1847–1850; kos2006 Theorem 4.2, lines 658–666; kenyon1997 Lemma 8, lines
401–406). The coefficients `ε_{ab} det K_{ab}/(2Z)` have absolute value at most `1/2` and sum to
`1`. Route: expanding the entries into edge contributions, the tilings containing all `ℓ_i`
contribute `∏_i κ_{ab}(ℓ_i) · c_{ab}` to `det K_{ab}`, and the sign identity of 8.3 holds tiling by
tiling. When `det K_{ab} ≠ 0` and the faces are distinct, Tau Ceti's
`Matrix.det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv`, applied to
`K_{ab}` with the splitting that lists `u₁, …, u_k` first, `τ` the identity and `σ` a permutation
with `σ(u_i) = v_i`, evaluates the complementary minor of `Λ_{K_{ab}}(u;v)` and gives the inverse
form. *Needs:* 8.1, 8.3; Tau Ceti
`Matrix.det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv`; Mathlib
`Matrix.det_apply`, `Matrix.inv`, `Equiv.Perm.sign`.

**Checks.**

- `n₁ = n₂ = 1`, the lozenge of type 3: `∏ κ_{ab} = w₃` and `c_{ab} = 1`, so the formula gives
  `w₃(1 + 1 + 1 − 1)/(2(w₁ + w₂ + w₃)) = w₃/(w₁ + w₂ + w₃)`, `1/3` at unit weights; using the
  aggregated entry `K_{ab}` in place of `κ_{ab}` would give `(3 + 1 + 1 + 1)/6 = 1` at unit weights.
- The bound `|det K_{ab}| ≤ Z` (a signed sum of the same weights) gives `|ε_{ab} det K_{ab}/(2Z)| ≤ 1/2`;
  on the 2 × 2 torus the coefficients are `3/18, 5/18, 5/18, 5/18`, summing to `1`.
- On the 1 × 1 torus the lozenges of types 1 and 3 share both `W(0)` and `B(0)`: `c_{ab} = 0` and the
  probability is `0`. Without the convention the complementary sum would be `1` and the formula
  would give `w₁w₃(1 − 1 + 1 + 1)/(2Z) = w₁w₃/(w₁ + w₂ + w₃)`, `1/3` at unit weights.
- `n₁ = n₂ = 2`, the type-3 lozenge at `W(0)`: at unit weights `(c₀₀, c₀₁, c₁₀, c₁₁) = (−1, 1, 1, 3)`,
  each equal to `det K_{ab} · K_{ab}⁻¹(B(0),W(0))` with determinants `−3, 5, 5, 5`, and
  `(−(−1) + 1 + 1 + 3)/18 = 1/3`, the type-3 density. At type weights `(w₁,w₂,w₃) = (2,3,5)`:
  `det K₀₀ = 0` (the eigenvalue `5 − 3 − 2` of 8.5) while `c₀₀ = 60`, and
  `(c₀₁, c₁₀, c₁₁) = (100, 150, 190)` with determinants `544, 1044, 1300`, so `Z = 1444` and the
  probability is `5(−60 + 100 + 150 + 190)/2888 = 25/38`, the share of the nine tilings' weight
  carried by those containing that lozenge; reading `c₀₀` through Mathlib's inverse, which is `0`
  for a singular matrix, would give `5(100 + 150 + 190)/2888 = 275/361`.

### 8.5 Fourier diagonalisation

For type weights, the twisted characters `v ↦ z^{v₁} w^{v₂}` with `z^{n₁} = (−1)^a`,
`w^{n₂} = (−1)^b` diagonalise `K_{ab}` with eigenvalue `w₃ + w₂z + w₁w⁻¹`, so
`det K_{ab} = ∏_{z,w} (w₃ + w₂z + w₁w⁻¹)`, and when this is nonzero
`K_{ab}⁻¹(B(v'), W(v)) = (n₁n₂)⁻¹ Σ_{z,w} z^{v'₁−v₁} w^{v'₂−v₂} / (w₃ + w₂z + w₁w⁻¹)` for `v, v'` in the
fundamental domain (gorin2021 Claims 4.1–4.2, lines 1545–1600, and (4.8), line 1895; kenyon2009
Section 4.3, lines 729–763; kos2006 lines 668–679). *Needs:* 8.1.

**Checks.**

- `n₁ = n₂ = 1`: the single character `z = (−1)^a`, `w = (−1)^b` gives `w₃ + (−1)^a w₂ + (−1)^b w₁`,
  the 1 × 1 matrix of 8.1.
- `n₁ = n₂ = 2`, unit weights, `a = b = 0`: `z, w ∈ {±1}` give eigenvalues `3, 1, 1, −1`, product
  `−3`; for `a = 1, b = 0`, `z ∈ {±i}` gives `(2+i)(2−i)·(i)(−i) = 5`.
- Uniform weights, `n₁ = n₂ = 3`, `a = b = 0`: at `z = w = e^{2πi/3}` the eigenvalue is
  `1 + e^{2πi/3} + e^{−2πi/3} = 0`, so `det K₀₀ = 0` although the partition function is positive;
  this is why 8.4 is stated with complementary minors.

### Examples

The 1 × 1 and 2 × 2 tori with all four determinants.

### Dependencies

Layer 7; Tau Ceti's complementary-minor identity; Mathlib determinants and inverses.

## Layer 9: the explicit kernel and ergodic Gibbs measures of interior slopes

### 9.1 The characteristic function and the infinite inverse Kasteleyn kernel

For type weights `w` define `P̂_w` and, for liquid `w`, the kernel `G_w` as in the conventions
(gorin2021 Theorem 4.11, lines 1853–1871; kenyon2009 Section 6.1, lines 958–975; kos2006 Theorem
4.3, lines 714–727). *Needs:* 8.5; Mathlib `intervalIntegral`,
`tendsto_integral_exp_inner_smul_cocompact`, `circleIntegral`, `deriv_circleMap`,
`circleIntegral.integral_sub_zpow_of_ne`, `circleIntegral.integral_sub_inv_of_mem_ball`,
`DiffContOnCl.circleIntegral_eq_zero`.

API:

- For liquid `w`, `P̂_w` vanishes at exactly two points `(θ₀,φ₀)` and `(−θ₀,−φ₀)` of the torus
  `(ℝ/2πℤ)²`, with `θ₀, φ₀ ∉ πℤ`, and its real Jacobian is invertible there; `1/P̂_w` is
  integrable (kenyon2009 footnote 5, lines 978–980; kos2006 lines 728–740).
- Inverse identities: `Σ_{v'} K(W(u), B(v')) G_w(v' − v) = [u = v]` and
  `Σ_u G_w(v' − u) K(W(u), B(v'')) = [v' = v'']`, each sum having at most three nonzero terms.
- Decay: `G_w(d) → 0` as `|d| → ∞` (Riemann–Lebesgue applied to the integrable function
  `1_{[0,2π]²}/P̂_w` on `ℝ²`).
- Inner integrals: for `a ∈ ℂ`, `r > 0` with `|a| ≠ r` and `n ∈ ℤ`,
  `(2π)⁻¹ ∫₀^{2π} e^{inθ} / (a + r e^{iθ}) dθ` is `[|a| > r] (−r)^{−n} a^{n−1}` for `n ≤ 0` and
  `[|a| < r] (−a)^{n−1} r^{−n}` for `n ≥ 1`. Route: by `deriv_circleMap` it is `(2πi)⁻¹` times the
  circle integral of `z^{n−1}/(a + rz)` over `|z| = 1`; partial fractions in `z` and `z + a/r`
  reduce it to `circleIntegral.integral_sub_zpow_of_ne`, to
  `circleIntegral.integral_sub_inv_of_mem_ball` for the pole `0` and, when `|a| < r`, the pole
  `−a/r`, and to `DiffContOnCl.circleIntegral_eq_zero` for `−a/r` when `|a| > r`. With `r = w₂`,
  `a = w₃ + w₁e^{−iφ}` and `n = d₁` it is the `θ`-integral of `G_w(d)`; with `r = w₁`,
  `a = w₃ + w₂e^{iθ}` and `n = −d₂`, after `φ ↦ −φ`, it is the `φ`-integral.
- Angles: `w₁G_w(−e₂) = θ₁/π`, `w₂G_w(e₁) = θ₂/π`, `w₃G_w(0) = θ₃/π`, where `θ_k` is the angle
  opposite the side `w_k` in the triangle with sides `w₁, w₂, w₃` (gorin2021 Theorem 6.1, lines
  2256–2279; kenyon2009 lines 976–1007). Along a row, `w₁G_w((m,−1)) = (−1)^m sin(θ₁m)/(πm)` for
  `m ≠ 0`, obtained by integrating `φ` first: the inner integral is `1/w₁` on the arc
  `|w₃ + w₂e^{iθ}| < w₁`, of half-width `θ₁` about `π`, and `0` off it.

**Checks.**

- `w = (1,1,1)`: zeros at `±(2π/3, 2π/3)`; `G(0) = 1/3`, so each type has density `1/3`; and
  `G(0,−2) = √3/(2π) − 1/3`, by integrating `θ` first over `cos φ > −1/2`.
- `w = (1,1,3)` is not liquid: `|P̂_w| ≥ 1`, the geometric expansion of `1/P̂_w` has constant term
  `1/3`, so `w₃G(0) = 1`, the frozen all-type-3 value (gorin2021 Exercise 6.2, lines 2281–2286).
- `w = (1,1,2)` is degenerate: `P̂_w` has the single zero `(π, π)`, where both partial derivatives
  are imaginary, so the real Jacobian is singular; such weights are excluded from "liquid".

### 9.2 Good torus sizes and Riemann sums

For `θ ∈ ℝ` let `W_θ = {n ≥ 1 : |θ − πj/n| > n^{−3/2} for every j ∈ ℤ}`. (a) If `θ ∉ πℤ`, then for
all large `n`, `n ∈ W_θ` or `n + 1 ∈ W_θ`. (b) Let `w` be liquid with zero `(θ₀,φ₀)`, and let
`n₁(k) ∈ W_{θ₀}` and `n₂(k)` tend to infinity with `n₁(k)/n₂(k)` and `n₂(k)/n₁(k)` bounded. For each
`(a,b)` and `d ∈ ℤ²`, the twisted Riemann sums
`(n₁n₂)⁻¹ Σ_{z^{n₁}=(−1)^a, w^{n₂}=(−1)^b} z^{d₁}w^{d₂}/(w₃ + w₂z + w₁w⁻¹)` converge to `G_w(d)`; in
particular `det K_{ab} ≠ 0` along the sequence. Route: grid points lie at distance more than
`n₁^{−3/2}` from both zeros; split the sum near the zeros, where `|P̂_w|` is at least a constant
times the distance, from the rest, where the integrand is smooth (gorin2021 Lemma 4.7 and the
following argument, lines 1748–1806; kos2006 lines 691–708; kenyon2009 lines 945–952).
Gorin's Lemma 4.7 asserts `n` or `n + 2`; that fails for `θ = π/2`, where every even `n` has
`j = n/2`, so (a) uses `n + 1`. *Needs:* 8.5, 9.1.

**Checks.**

- `W_{π/2}` contains no even `n` and contains every odd `n ≥ 2`: for odd `n` the nearest `πj/n`
  is at distance `π/(2n) > n^{−3/2}`.
- `θ = 2π/3`: `3 ∉ W_θ` (`j = 2`), and `4 ∈ W_θ`, since `min_j |2π/3 − πj/4| = π/12 > 1/8`.
- On the 3 × 3 torus with uniform weights the grid of `(a,b) = (0,0)` hits the zero (8.5), and
  indeed `3 ∉ W_{2π/3}`.
- How large `n` must be in (a) depends on `θ`: for `θ = 0.1` both `188` and `189` lie outside
  `W_θ`, since `j = 6` gives `|θ − 6π/188| ≈ 2.64·10⁻⁴ < 188^{−3/2} ≈ 3.88·10⁻⁴` and
  `|θ − 6π/189| ≈ 2.67·10⁻⁴ < 189^{−3/2} ≈ 3.85·10⁻⁴`. Two consecutive failures `n`, `n + 1` give
  integers `j, j'` with `|j(n + 1) − j'n| ≤ 2(n + 1)/(π√n)`, and since `j = θn/π + O(n^{−1/2})`
  this puts `θ/π` within `O(n^{−1/2})` of the integer `j' − j`: the threshold grows as `θ`
  approaches `πℤ`.

### 9.3 The determinantal Gibbs measure of liquid weights

For liquid `w` there is a unique `μ^w ∈ 𝔓(𝕋)` such that, for pairwise distinct lozenges
`ℓ_i = (W(u_i), B(v_i))`, `μ^w{ℓ₁, …, ℓ_k ∈ M} = ∏ w(ℓ_i) · det[G_w(v_i − u_j)]`; it is the weak
limit of `μ^w_{n₁(k),n₂(k)}` along every sequence of 9.2(b); it lies in `𝒢_inv`; and its slope is
`(θ₁/π, θ₂/π)` (gorin2021 Theorem 4.11 and Corollary 13.14, lines 1853–1871 and 4695–4723; kos2006
Theorem 4.3, lines 714–725; kenyon2009 lines 958–975; kenyon1997 Section 4). Route: place the
window inside the fundamental domain, away from the seams, use 8.4 and 9.2 (the coefficients are
bounded and sum to `1`, and every term converges to the same limit), identify the limit by its
correlation functions (4.4), and use 7.3 and 9.1. *Needs:* 4.4, 7.3, 8.4, 9.1, 9.2.

**Checks.**

- `w = (1,1,1)`: slope `(1/3, 1/3)`; the probability of type-1 lozenges at `(0,0)` and `(0,1)` is
  `det[[G(0,−1), G(0,−2)],[G(0,0), G(0,−1)]] = 1/9 − (1/3)(√3/(2π) − 1/3) = 2/9 − √3/(6π) ≈ 0.130`.
- One lozenge: the formula gives the densities `θ_k/π` of 9.1, which sum to `1`.
- Two lozenges sharing a face: two equal rows or columns, probability `0`.

### 9.4 Mixing and ergodicity

For liquid `w`, `μ^w(A ∩ τ_d B) → μ^w(A) μ^w(B)` as `|d| → ∞` for all measurable `A`, `B`; hence
`μ^w` is ergodic under `ℤ²` and under the subgroup `ℤd₀` for every `d₀ ≠ 0` (kenyon1997 abstract
and lines 85–93, mixing for the lozenge measure; kos2006 lines 732–735; kenyon2009 Section 6.2,
lines 1011–1036). Route: for inclusion events the correlation is a block determinant whose
off-diagonal blocks tend to `0` (9.1); inclusion–exclusion gives all cylinder events; cylinder
events approximate measurable ones (Mathlib's approximation by the ring of measurable cylinders,
as in 4.2, applied to the push-forward of `μ^w` to the full product); an invariant event `A`
then has `μ(A) = μ(A)²`, and Tau Ceti's criterion turns this into ergodicity. *Needs:* 4.4, 9.1,
9.3; Mathlib `MeasureTheory.exists_measure_symmDiff_lt_of_generateFrom_isSetRing`,
`MeasureTheory.isSetRing_measurableCylinders`, `MeasureTheory.generateFrom_measurableCylinders`,
`MeasureTheory.univ_mem_measurableCylinders`; Tau Ceti
`TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` (reverse implication).

**Checks.**

- For the type-3 lozenges at `0` and at `d`, the covariance is `−w₃² G_w(d) G_w(−d)`, which tends to
  `0`.
- The frozen point masses are mixing trivially.
- `ν₃` (6.4) is not mixing: `ν₃({M = M₁} ∩ τ_d{M = M₁}) = 1/3 ≠ 1/9`.

### 9.5 Ergodic Gibbs measures of every slope

For every `(s,t) ∈ 𝒯̄` there is an ergodic translation-invariant Gibbs measure on `𝔈(𝕋)` of slope
`(s,t)`, a member of `lozengeGibbsInvariant` that is `ErgodicVAdd (ℤ × ℤ)` with `slope μ = (s,t)`
(`exists_ergodicGibbs_of_slope`; kos2006 Theorem 2.1, existence part, lines 215–220;
kenyon2009 lines 836–843; gorin2021 Corollary 6.3, lines 2287–2298). Route: the corners by 6.2,
the edges by 6.3, and interior slopes by `μ^w` for the sine weights `w = w(s,t)` of the
conventions, which are liquid with angles `πs`, `πt`, `π(1−s−t)` opposite their sides, so that
`μ^w` has slope `(s,t)` (9.3, 9.4). *Needs:* 6.2, 6.3, 9.3, 9.4.

**Checks.**

- `(1/3, 1/3)`: `w = (√3/2, √3/2, √3/2)`, a multiple of the uniform weights, with the same measure.
- `(1/2, 1/4)`: `w = (1, √2/2, √2/2)` and `1 < √2`, so `w` is liquid.
- `(1/2, 0)`: the sine formula gives `(1, 0, 1)`, which is not positive; edge slopes need 6.3.

### 9.6 The complex slope and the incomplete beta kernel

Define `ξ(s,t)`, `X(M)` and `incompleteBetaKernel ξ v₁ v₂ = K_ξ(v₁;v₂)` as in the conventions, with
the polygonal defining paths (aggarwal2023 Definitions 1.2–1.3, lines 463–476;
okounkov-reshetikhin2003 Definition 4, lines 965–968): with `f(z) = (1−z)^{y₁−y₂} z^{x₂−x₁−1}` and
`c = 1/2` when `y₁ ≥ y₂`, `c = −1` otherwise, `K_ξ(v₁;v₂)` is `(2πi)⁻¹` times the sum of the
curve integrals of the 1-form `f(z) dz` along `Path.segment ξ̄ c` and `Path.segment c ξ` (Mathlib
`curveIntegral`), which by `curveIntegral_segment` is
`∫₀¹ f(ξ̄ + t(c − ξ̄))(c − ξ̄) dt + ∫₀¹ f(c + t(ξ − c))(ξ − c) dt`. The definition is total; it is
the contour integral of the conventions when `ξ` is in the upper half-plane, the two segments then
avoiding `0` and `1`, and it is then also the curve integral along the concatenated path
(`curveIntegral_trans`, `f` being continuous on both segments). *Needs:* Mathlib `curveIntegral`,
`Path.segment`, `curveIntegral_segment`, `curveIntegral_trans`, `Complex.arg`; Tau Ceti
`TauCeti.Contour.homologyCauchyTheorem`, `TauCeti.Contour.IsNullHomologous`,
`TauCeti.Contour.windingNumber`,
`TauCeti.Contour.intervalIntegral_deriv_smul_segment_eq_curveIntegral`.

API:

- `ξ` is a bijection from `𝒯` onto the upper half-plane with inverse
  `ξ ↦ (arg ξ / π, −arg(1 − ξ) / π)`: `πs` and `πt` are the angles at `0` and `1` of the triangle
  `0, 1, ξ`, and `|ξ| = sin(πt)/sin(π(1−s−t)) = w₂/w₃`, `|1 − ξ| = sin(πs)/sin(π(1−s−t)) = w₁/w₃`
  for the sine weights `w = w(s,t)` (Conventions) is the law of sines.
- `K_ξ(v₁;v₂)` depends only on `v₂ − v₁` and on the side of crossing, and the contour integral of
  `f(z) dz` along any piecewise `C¹` path in `ℂ ∖ {0,1}` from `ξ̄` to `ξ` meeting the real axis in
  a single point of the prescribed side, `(0,1)` or `(−∞,0)`, gives the same value. Route: that
  path followed by the reversed defining polygon is a closed piecewise `C¹` curve meeting the real
  axis only on that side, so its winding numbers about `0` and `1` vanish and it is
  null-homologous in `ℂ ∖ {0,1}` (Tau Ceti `TauCeti.Contour.IsNullHomologous`); `f` is
  holomorphic there, so its contour integral round the curve vanishes by the homology form of
  Cauchy's theorem, Tau Ceti `TauCeti.Contour.homologyCauchyTheorem`; and
  `TauCeti.Contour.intervalIntegral_deriv_smul_segment_eq_curveIntegral` identifies the contour
  integrals along the two segments with the curve integrals of the definition.
- `K_ξ(v;v) = s`; along a row, `K_ξ((x,y);(x+m,y)) = |ξ|^m sin(πsm)/(πm)` for `m ≠ 0`.

**Checks.**

- Diagonal: `(2πi)⁻¹ ∫ z^{−1} dz` across `(0,1)` is `arg ξ/π = s`; across `(−∞,0)` it would be
  `−(1 − s)`, so the side of crossing matters.
- Vertical neighbours `v₁ = (0,0)`, `v₂ = (0,1)`: `K_ξ(v₁;v₂) = −(1 − s − t)` (crossing `(−∞,0)`)
  and `K_ξ(v₂;v₁) = s − Im ξ/π` (crossing `(0,1)`); for `s = t = 1/3`, `ξ = e^{πi/3}` and these are
  `−1/3` and `1/3 − √3/(2π)`.
- `s = t = 1/3`: `ξ = e^{πi/3}`, `|ξ| = 1`, and the row kernel is the discrete sine kernel itself.

### 9.7 The incomplete beta process

Let `ξ` be in the upper half-plane, `(s,t)` its slope and `w = w(s,t)` its sine weights
(Conventions). (a) For all
`v_i = (x_i,y_i)` and `v_j = (x_j,y_j)` in `ℤ²`,
`w₁G_w(v_i − v_j − e₂) = (−1)^{(x_i−x_j)+(y_i−y_j)} |ξ|^{x_j−x_i} |1−ξ|^{y_i−y_j} K_ξ(v_j;v_i)`,
with `|ξ| = w₂/w₃` and `|1−ξ| = w₁/w₃` by the law of sines (9.6); it is obtained by evaluating the
`φ`-integral of `G_w` by residues, with the inner integrals of 9.1 (okounkov-reshetikhin2003
equation (36), lines 1076–1083; gorin2021 lines 4744–4755). The factor is `κ(v_i)/κ(v_j)` for
`κ(x,y) = (−1)^{x+y} |ξ|^{−x} |1−ξ|^{y}`, so for pairwise distinct `v₁, …, v_m` the matrix
`[w₁G_w(v_i − v_j − e₂)]` is the conjugate of the transpose of `[K_ξ(v_i;v_j)]` by the diagonal
matrix of `κ`, and `det[w₁G_w(v_i − v_j − e₂)] = det[K_ξ(v_i;v_j)]`. (b) Hence `μ_ξ = μ^w` satisfies
`μ_ξ{v₁, …, v_m ∈ X(M)} = det[K_ξ(v_i;v_j)]` (aggarwal2023 equation (1.2), lines 491–505;
okounkov-reshetikhin2003 Theorem 2, lines 993–1006). (c) `μ_ξ` is the unique probability measure on
`𝔈(𝕋)` with this property. (d) `μ_ξ` is an ergodic translation-invariant Gibbs measure of slope
`(s,t)` (aggarwal2023 lines 505–507). (e) Along a row,
`μ_ξ{(x₁,y), …, (x_m,y) ∈ X(M)} = det[S_s(x_i − x_j)]` with `S_s(m) = sin(πsm)/(πm)` and
`S_s(0) = s`, the discrete sine kernel; by `ρ` the same holds for types 2 and 3 along the rotated
lines with `t` and `1 − s − t` (gorin2021 Corollary 13.16 and Remark 13.17, lines 4762–4786). (f)
`μ_ξ`-almost surely every row contains infinitely many type-1 lozenges, and on the tilings in which
no two consecutive rows lack type-1 lozenges `M` is a measurable function of `X(M)`.
`incompleteBetaProcess_exists_unique` states (b)–(d) for `ξ` with `0 < Im ξ`: there is a measure μ
in `lozengeGibbsInvariant`, `ErgodicVAdd (ℤ × ℤ)`, with `slope μ = (arg ξ/π, −arg(1−ξ)/π)` and
`μ{ω : ω(v_i,1) = true for all i}` equal, as a complex number, to `det[K_ξ(v_i;v_j)]` for every
injective `v : Fin m → ℤ × ℤ`, and every probability measure on configurations that is concentrated
on plane tilings and has these correlations equals μ. Route for (c): two measures with (1.2) give
`X` the same law (4.4); under it rows are almost surely nonempty, by ergodicity of `μ_ξ` under `ℤe₁`
(9.4) and density `s > 0`; and between rows `y` and `y + 1` the vertical increments are determined
as soon as one of the two rows has a type-1 lozenge. Aggarwal's remark that a plane tiling is
determined by `X(M)` whenever `X(M) ≠ ∅` (aggarwal2023 lines 465–467) is false; (f) is the correct
statement. *Needs:* 4.4, 9.1, 9.3, 9.4, 9.6.

**Checks.**

- `ξ = e^{πi/3}`: the two-point value of type-1 lozenges at `(0,0)` and `(0,1)` is
  `s² − K_ξ(v₁;v₂)K_ξ(v₂;v₁) = 1/9 + (1/3)(1/3 − √3/(2π)) = 2/9 − √3/(6π)`, equal to the value of 9.3
  computed from `G`; here `|ξ| = |1−ξ| = 1`, which holds for `ξ = e^{πi/3}` alone, and the
  entrywise identity reduces to the conjugation `κ(x,y) = (−1)^{x+y}`: `G(0,−2) = −K_ξ(v₂;v₁)` and
  `G(0,0) = −K_ξ(v₁;v₂)`.
- Slope `(0.3, 0.45)`: `w ≈ (0.8090, 0.9877, 0.7071)`, `|ξ| = w₂/w₃ ≈ 1.3968`,
  `|1−ξ| = w₁/w₃ ≈ 1.1441`, and the ratios `w₁G_w(0,−2) / K_ξ((0,1);(0,0)) ≈ −0.8740 = −1/|1−ξ|`,
  `w₁G_w(−2,−1) / K_ξ((2,0);(0,0)) ≈ 1.9511 = |ξ|²` and
  `w₁G_w(−1,−2) / K_ξ((1,1);(0,0)) ≈ 1.2209 = |ξ|/|1−ξ|` are the factors of (a), none of them
  `±1`; the vertical pair `(0,0), (0,1)` has `det[w₁G_w] = det[K_ξ] ≈ 0.0751` and the triple
  `(0,0), (1,2), (−1,1)` has both determinants `≈ 0.0342`.
- Row, `s = 1/2`: two adjacent type-1 lozenges have probability `1/4 − 1/π² ≈ 0.149 < 1/4`.
- The plane tilings with heights `H = 1_{x>0}` on rows `y ≤ 0` and, on rows `y ≥ 1`, either `H = 1`
  or `H = y`, are different and have the same `X(M) = {(0,y) : y ≤ 0}`: rows `1, 2, …` lack type-1
  lozenges, which is excluded by (f).

### Examples

The uniform kernel (`ξ = e^{πi/3}`) with the values `1/3` and `√3/(2π) − 1/3`; the discrete sine
kernel at `s = 1/2`.

### Dependencies

Layers 4–8; Mathlib `intervalIntegral`, `tendsto_integral_exp_inner_smul_cocompact`,
`circleIntegral`, `deriv_circleMap`, `circleIntegral.integral_sub_zpow_of_ne`,
`circleIntegral.integral_sub_inv_of_mem_ball` and `DiffContOnCl.circleIntegral_eq_zero` (9.1), the
approximation by measurable cylinders of 4.2 (9.4), `curveIntegral`, `Path.segment`,
`curveIntegral_segment` and `curveIntegral_trans` (9.6); Tau Ceti
`TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` (9.4) and the contour integrals of
the Tau Ceti supplier contracts (9.6).

## Layer 10: local statistics of tilings of growing regions

### 10.1 Local convergence

For regions `R_N`, finite or infinite, probability measures `μ_N` on `TriEdge → Bool` concentrated
on `𝔈(R_N)` (a closed set: each face of `R_N` and each edge outside `E°(R_N)` imposes a clopen
condition) and vertices `v_N`, say that the local statistics of `μ_N` around `v_N` converge to
μ ∈ `𝔓(TriEdge → Bool)` when `τ_{−v_N *} μ_N → μ` weakly; by 4.4 this means that for every finite
set `E₀` of edges and every `σ ⊆ E₀`,
`μ_N{M : (M − v_N) ∩ E₀ = σ} → μ{M : M ∩ E₀ = σ}`, which is Aggarwal's convergence "in
distribution" of `S_{v_N} μ_N` (aggarwal2023 lines 568–580; gorin2021 Section 13.2, lines
4530–4541; kenyon2009 lines 786–793). This cylinder form is the definition used:
`LocalConvergence μ v ν` says that for every finite `E` and every pattern `σ : TriEdge → Bool`,
`μ_N{ω : ω(v_N +ᵥ e) = σ(e) for e ∈ E}` tends to `ν{ω : ω(e) = σ(e) for e ∈ E}`; it is stated for
arbitrary measures, and when the `μ_N` are probability measures the empty cylinder makes ν one.
*Needs:* 4.4, 5.4.

API:

- The cylinder criterion and the criterion by correlation functions (4.4).
- Compatibility with translations: shifting all `v_N` by a fixed vector shifts the limit.
- Subsequential limits always exist (compactness).

**Checks.**

- `R_N` the set of all faces (an infinite region), `μ_N = μ ∈ 𝔓(𝕋)` and `v_N = 0`: the limit is μ;
  for `μ = δ_{M₃}` every type-3 edge has limiting probability `1`.
- `R_N = R₆ + v_N` (translated unit hexagons) with uniform `μ_N`: the limit is
  `(δ_{T_a} + δ_{T_b})/2`, which is not concentrated on `𝔈(𝕋)`: without exhaustion the limit is not
  a plane tiling measure.
- Translating by `+v_N` instead of `−v_N` makes the window recede: for `R_N = R₆ + v_N` with
  `|v_N| → ∞` the limit is the point mass at the empty configuration (for `v_N = 0` both
  conventions give the hexagon law, which is why `|v_N| → ∞` is part of this Check).

### 10.2 Limits of uniform measures are Gibbs

(a) Limits are unique. (b) If every `R_N` is the set of all faces, local convergence with
`v_N = 0` is weak convergence in `𝔓(𝕋)`. (c) If every face lies in `R_N − v_N` for all large `N`,
every limit is concentrated on `𝔈(𝕋)`. (d) If moreover each `R_N` is finite and tileable and `μ_N`
is the uniform measure on `𝔈(R_N)`, every limit is a Gibbs measure. In Lean (c) and (d) are
`localLimit_isLozengeGibbs`: for `R : ℕ → Finset TriFace` with every `R N` tileable, `v : ℕ → ℤ × ℤ`
such that every face `f` satisfies `f + v_N ∈ R N` for all large `N`, and ν with
`LocalConvergence` of the measures `ProbabilityTheory.uniformOn {ω : {e | ω e = true} ∈ 𝔈(R N)}`
around `v` to ν, `IsLozengeGibbs ν` (aggarwal2023 lines 413–415 and 568–580; gorin2021 lines
4538–4541; kenyon2009 lines 786–809).
Route: the cylinder identities of 5.2 hold for the uniform measure on `𝔈(R_N)` for windows inside
`R_N`, and pass to the limit. Limits need not be translation-invariant: proving invariance, and
identifying the limit as `μ_{ξ(s,t)}`, is the content of Aggarwal's universality theorem.
*Needs:* 5.2, 5.4, 10.1; Mathlib `ProbabilityTheory.uniformOn`.

**Checks.**

- `R_N` the union of the lozenges of the row tiling `M_ε`, `ε = 1_{[0,∞)}`, inside the box
  `[−N,N]²`: by 6.3(b) its only tiling is the restriction of `M_ε`, so the limit around `0` is
  `δ_{M_ε}`, Gibbs and not translation-invariant.
- Regions on which `M₃` restricts to the only tiling (unions of squares in a box) give the limit
  `δ_{M₃}`, of slope `(0,0)`.
- Uniformity is used in (d): the plane tiling `M_c` with height `min(0, x, y)` admits a flip at `0`
  (`H(e_k) = 0 = H(−e_k) + 1` for `k = 1,2,3`), the point masses at its restrictions to the unions of
  its lozenges inside `[−N,N]²` converge to `δ_{M_c}`, and `δ_{M_c}` is not Gibbs, since its
  completion set at the hexagon around `0` has two elements and only one carries mass.

### 10.3 The lattice side of Aggarwal's universality theorem

The lattice objects in the statement of aggarwal2023 Theorem 1.5 (lines 572–580) are defined here:
finite simply connected tileable domains (1.3, 2.1, with 2.4 for Aggarwal's topological
convention), their boundary height functions (2.7), uniform measures on tilings (10.2), shifts and
local convergence (10.1), and `μ_{s,t} = μ_{ξ(s,t)}` (9.7), the ergodic Gibbs measure of slope
`(s,t)` with the kernel of (1.2). The continuum objects (admissible functions, the entropy
functional and its maximiser, convergence of domains) and the uniqueness of the ergodic Gibbs
measure of slope `(s,t)`, which makes "the" measure of slope `(s,t)` meaningful, belong to the
Part II of this roadmap. *Needs:* 2.4, 2.7, 9.7, 10.2.

**Checks.**

- Aggarwal's `A × B × C` hexagon (aggarwal2023 Example 1.1, lines 370–375) is a finite region whose
  union of faces is a convex hexagon, simply connected by 2.4.
- Its boundary graph is a single closed curve, so its boundary height is determined (2.7).
- For `A = B = C = 1` its vertices are `(0,0), (1,0), (0,1), (1,2), (2,2), (2,1)`, centred at
  `(1,1)`: it is the translate `R₆ + (1,1)` of the unit hexagon, with two tilings, the translates of
  `T_a` and `T_b`; it is not `R₆` itself, which is centred at `0`.

### Examples

Translated hexagons; forced regions with a unique tiling.

### Dependencies

Layers 4, 5, 9 (for 10.3), and 2.

## Downstream consumers

- **DimerModelsAndLozengeTilingsPartII**, the Part II of this roadmap: Sheffield's uniqueness of the
  ergodic Gibbs measure of each interior slope and the convergence `μ^{s,t}_n → μ_{ξ(s,t)}`; the
  surface tension and the variational principle; limit shapes; the statement and proof of Aggarwal's
  universality theorem; general periodic weights and amoebae. It consumes Layers 2, 5–7, 9 and 10
  verbatim.
- A roadmap on discrete determinantal point processes takes 3.3, 9.3 and 9.7 as its first examples
  of determinantal laws on countable sets.
- Lattice spin systems with a finite single-site space (Ising-type models) consume Layer 4: the
  tail lemma, Bernoulli ergodicity, specifications, the face property and closedness.
- Random surfaces and Gaussian free field fluctuations of lozenge tilings (kenyon2009 Section 6.3;
  gorin2021 Lectures 11–12) consume Layers 2 and 9.

## Worked examples

- The unit hexagon `R₆`: tilings `T_a`, `T_b`; boundary height `0, 0, 0, −1, −1, −1`; flip at `0`;
  Kasteleyn determinant `2` (`2abc` with type weights); edge probability `1/2`.
- The ring `R_ring`: not simply connected, two tilings with winding `−1`, determinant `0`.
- `R₆'`: simply connected, balanced, Thurston's inequality fails at `((2,1),(1,1))`, determinant `0`.
- The 2 × 2 torus: nine tilings; `det K₀₀ = −3`, the other three determinants `5`.
- The uniform measure `μ^{(1,1,1)} = μ_{e^{πi/3}}`: densities `1/3`; vertical type-1 pair
  `2/9 − √3/(6π)`.

## References

- [aggarwal2023] A. Aggarwal, *Universality for lozenge tiling local statistics*, Ann. of Math.
  198 (2023); read as arXiv:1907.09991v4 and cited in that version's numbering (Definitions 1.2–1.3,
  equation (1.2), Theorem 1.5). Lines 322–407 (lattice, tilings, heights), 408–507 (Gibbs measures,
  slope, the incomplete beta kernel), 568–580 (Theorem 1.5).
- [sheffield2005] S. Sheffield, *Random surfaces*, Astérisque 304 (2005); read as
  arXiv:math/0304049v3. Section 1.1.2 (lines 303–342), Section 3.2, Lemmas 3.2.1–3.2.2 (lines
  1341–1371), Theorem 9.1.1 (lines 5443–5445, Part II), Theorem 9.5.1 (lines 6195–6198).
- [kos2006] R. Kenyon, A. Okounkov, S. Sheffield, *Dimers and amoebae*, Ann. of Math. 163 (2006);
  read as arXiv:math-ph/0311005v1. Section 2 (lines 158–256), Theorem 2.1 (lines 215–220),
  Theorems 4.2–4.3 (lines 652–727).
- [kenyon2009] R. Kenyon, *Lectures on dimers*, IAS/Park City Math. Ser. 16 (2009); read as
  arXiv:0910.3129v1. Sections 1.1, 2.2, 3.3–3.5, 4.2–4.3, 5.1–5.5, 6.1–6.2 (lines 95–1036).
- [okounkov-reshetikhin2003] A. Okounkov, N. Reshetikhin, *Correlation function of Schur process
  with application to local geometry of a random 3-dimensional Young diagram*, J. Amer. Math. Soc.
  16 (2003); read as arXiv:math/0107056v3. Definition 4 (lines 965–968), Theorem 2 (lines
  993–1006), equation (36) (lines 1076–1083).
- [kenyon1997] R. Kenyon, *Local statistics of lattice dimers*, Ann. Inst. H. Poincaré Probab.
  Statist. 33 (1997), 591–618 (Numdam). Theorem 2 (lines 184–197), Theorem 6 (lines 362–373),
  Lemmas 7–8 (lines 392–406), the mixing statement of the introduction (lines 85–93).
- [gorin2021] V. Gorin, *Lectures on random lozenge tilings*, Cambridge Stud. Adv. Math. 193
  (2021); read from the author's pre-publication copy, lecture and theorem numbers as printed.
  Theorem 1.4 and Corollary 1.5 (lines 521–613), Theorem 2.1 (lines 714–782), Theorems 3.1, 3.5,
  3.10 (lines 1218–1504), Theorems 4.3–4.11 (lines 1603–1898), Theorem 6.1 (lines 2256–2298),
  Lecture 13 (lines 4491–4786).
- [cohn-kenyon-propp2001] H. Cohn, R. Kenyon, J. Propp, *A variational principle for domino
  tilings*, J. Amer. Math. Soc. 14 (2001); read as arXiv:math/0008220v3. Section 1.4, lines
  404–423 (the lattice of domino height functions), cited in 2.8 for the domino counterpart of the
  lattice of height functions; Theorem 1.1 belongs to Part II.
- [thurston1990] W. P. Thurston, *Conway's tiling groups*, Amer. Math. Monthly 97 (1990), 757–773;
  cited by bibliographic data for 2.9, the statement and proof used being gorin2021 Theorem 1.4.
- [gibbsmeasure] Y. Dillies, M. Cipollina, the GibbsMeasure project, a Lean formalisation of
  specifications and Gibbs measures following georgii2011 (Apache 2.0),
  `github.com/YaelDillies/gibbs-measure` at commit `fffe01e3a5d783fbe95b629cd34b97d50939b42b`, file
  `GibbsMeasure/Specification.lean`: the consistency predicate and the structure of a
  specification (lines 34–63), the Gibbs predicate and its kernel-invariance form (lines
  163–171); cited in 4.5 for the shape of a specification.
- [georgii2011] H.-O. Georgii, *Gibbs measures and phase transitions*, 2nd ed., de Gruyter (2011);
  cited by bibliographic data, Theorem 14.15, for 4.2, 4.6 and 5.4, whose statement is restated in
  sheffield2005 Lemma 3.2.2.
