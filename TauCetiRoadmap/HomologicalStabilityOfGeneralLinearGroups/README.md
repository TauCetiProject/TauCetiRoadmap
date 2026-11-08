# Roadmap: homological stability of general linear groups

**Summary.** Build the complex of unimodular frames of `Rⁿ` over a commutative ring `R` (Maazen's
complex of partial bases, in van der Kallen's form): an `n × k` matrix with a left inverse is a
unimodular `k`-frame, the frames form an augmented semi-simplicial chain complex with an action of
`GL_n(R)`, and under Bass's stable range condition `SR_(sdim+2)` this complex is
`(n − 2 − sdim)`-acyclic (Layer 1). The groups `GL_n(R)` act on these complexes and on their affine
and transversal variants with stabilisers of the same shape; the resulting spectral sequences, with
`E¹` the homology of stabilisers, give van der Kallen's theorem: with `e = max(1, sdim)`, the
stabilization `g ↦ diag(g, 1)` induces a surjection `H_m(GL_n(R); ℤ) → H_m(GL_(n+1)(R); ℤ)` for
`n ≥ 2m + e − 1` and a bijection for `n ≥ 2m + e`, and the same holds for the elementary subgroups
`E_n(R)`. Its end theorems on Mathlib's hypotheses are the cases of a commutative noetherian ring of
Krull dimension at most `d` (`sdim = d`) and of a ring whose quotient by its Jacobson radical is
semisimple (`sdim = 0`); for a local ring with infinite residue field, Nesterenko and Suslin's
range: the stabilization is onto on `H_m` for `m ≤ n` and injective for `m < n`; and the comparison
with `GL(R)` and with Quillen's K-groups, `π_m(BGL_n(R)⁺) ≅ K_m(R)` for `m ≥ 1` and
`n ≥ max(3, 2m + e + 1)` (Layer 2). Layer 3 treats twisted coefficients: van der Kallen's stability
for strongly central coefficient systems of finite degree, after Dwyer, with end theorem the
stability of `H_m(GL_n(R); Rⁿ)`, onto for `n ≥ 2m + sdim + 1` and bijective for `n ≥ 2m + sdim + 3`.

Suggested home: `TauCeti/RepresentationTheory/Homological/GroupHomology/Stability/`.

## Scope and ownership

**Owned here.** Unimodular frames over a commutative ring, the augmented complex of unimodular
frames with its faces, its augmentation and its `GL_n(R)`-action, and its acyclicity under Bass's
stable range condition (Layer 1); the groups `G_n^(P,Q)` of van der Kallen, their actions on the
complexes of frames and the transitivity of these actions, the spectral sequence of such an action
with `E¹` the homology of stabilisers, van der Kallen's stability theorem for `GL_n(R)` and `E_n(R)`
with its specializations, Nesterenko and Suslin's stability range for local rings with infinite
residue field, and the comparison of the stable range with `GL(R)`, with `BGL_n(R)⁺` and with
`K_m(R)` (Layer 2); coefficient systems in van der Kallen's sense, their degree, the relative
homology of a pair of groups with coefficients, and stability with coefficients in a strongly
central coefficient system of finite degree (Layer 3). A search of the roadmaps on main, of the open
pull requests and of the maintainers' packages for homological stability, stable rank, unimodular
sequences or frames, partial bases, van der Kallen, Maazen, Charney, Nesterenko, Dwyer and twisted
coefficients finds no other owner of these statements: AlgebraicKTheory (Layer 4) owns stable range
and the stability of `K₁`, not of homology; ArithmeticKTheory §3.2 states rank-filtration bounds and
says that they are not homological stability bounds for `GL_m`;
InverseGaloisAndArithmeticFundamentalGroupsPartII owns homological stability for Hurwitz spaces and
MotivicStructuresInModuliOfCurves §3.4 for mapping class groups, for other families of groups.

**Left to AlgebraicKTheory.** Bass's stable range condition `HasStableRangeLE R s` and its
equivalent forms (AlgebraicKTheory 4.1), Bass's bound for commutative noetherian rings
`hasStableRangeLE_of_ringKrullDim_le` and stable range one for semilocal rings
`hasStableRangeLE_one_of_isSemisimpleRing` (AlgebraicKTheory 4.2), the stability theorems for `K₁`
(AlgebraicKTheory 4.1), the elementary subgroups `elementary n` (AlgebraicKTheory 1.1),
`elementary_le_commutator` (AlgebraicKTheory 1.3) and the stable groups `GL(R) ⊇ E(R)`
(AlgebraicKTheory 1.2). This roadmap states its theorems on `SR_(sdim+2)`, which is
`HasStableRangeLE R (sdim + 1)`, and restates none of these.

**Left to K3BlochGroups.** Group-module hyperhomology `H_*(G, C)` of a bounded-below complex of
`G`-modules, with its filtration spectral sequence `E¹_(p,q) = H_q(G, C_p)` and its identification
with `H_*(G, ℤ)` when `C` is an acyclic resolution (K3BlochGroups 4.1); the complex of independent
frames over a field (K3BlochGroups 4.2); Suslin's stability for infinite fields,
`generalLinear_homology_stable`, with the Milnor K-theory quotient `H_n(GL_n(F))/H_n(GL_(n−1)(F))`
(K3BlochGroups 4.5–4.8); and stability for the symmetric groups, `symmetricGroup_homology_stable`:
`H_i(Σ_n; ℤ) → H_i(Σ_(n+1); ℤ)` is bijective for `n ≥ 2i`, Nakaoka's range, with Kerz's complex of
injective words (K3BlochGroups 4.0 and 4.15). Its `generalLinearStabilization` is the field case of
`stabilization` here. Layer 2 consumes the hyperhomology of 4.1 and records the field and
symmetric-group theorems among its Examples.

**Left to StableHomotopyKTheory and GeneralAlgebraicKTheory.** Classifying spaces and the comparison
of their homology with group homology (StableHomotopyKTheory 1.30 and 1.32), the plus construction
with respect to a perfect normal subgroup and its universal property (StableHomotopyKTheory
3.25–3.27), the H-space `BGL(R)⁺` (StableHomotopyKTheory 4.14), and the identification
`π_m(BGL(R)⁺) ≅ K_m(R)` for `m ≥ 1` (GeneralAlgebraicKTheory 3.2 and 3.12).

**Supplied by Mathlib and consumed by name.** Matrices and `Matrix.GeneralLinearGroup` with its
action on rectangular matrices, block matrices and reindexing, finitely supported functions,
integral representations, restriction along a group homomorphism, group homology with its
functoriality and Shapiro's lemma, Krull dimension, noetherian, semisimple and local rings.

**Out of scope.** Noncommutative rings (van der Kallen's theorems hold for associative rings
satisfying `SR_(sdim+2)`, with `Rⁿ` the right module of columns; every ring here is commutative);
the homotopical form of the connectivity of the posets of unimodular sequences, which the stability
arguments do not use (the homological form of Layer 1 is what they use); the Milnor K-theory
quotient `H_n(GL_n(A), GL_(n−1)(A); ℤ) ≅ K_n^M(A)` for local rings `A` that are not fields, since no
roadmap defines Milnor K-theory of a ring that is not a field (for fields it is K3BlochGroups
4.5–4.8 on K2SymbolsBrauer's `MilnorK`); the finer descriptions of the relative groups beyond the
ranges here, such as those of Galatius, Kupers and Randal-Williams; and the general frameworks of
Hatcher–Wahl and Randal-Williams–Wahl for families of groups with a homogeneous category, which
cover automorphism groups beyond `GL_n` and are not needed for the theorems here.

## Conventions

1. **Columns and frames.** `Rⁿ` is the module of column vectors, the `n × 1` matrices, and
   `GL_n(R)` acts on `n × k` matrices by left multiplication (Mathlib's action of
   `Matrix.GeneralLinearGroup`). A unimodular `k`-frame is an `n × k` matrix `A` with a left
   inverse `B A = 1`: its columns form a basis of a free direct summand of `Rⁿ`, which is van der
   Kallen's unimodular sequence (van der Kallen 1980, 2.4). For `k = 1` this is Mathlib's
   `Module.IsUnimodular`. Witness: over `ℤ`, the columns `(1, 0)` and `(1, 1)` form a frame (left
   inverse `[[1, −1], [0, 1]]`), the columns `(1, 0)` and `(0, 2)` are linearly independent and
   form no frame (`det = 2` is not a unit).
2. **Stabilization.** `stabilization R n` sends `g` to `diag(g, 1)`: `g` is the upper left block
   and the new coordinate is the last one; on column vectors the matching inclusion
   `Rⁿ → Rⁿ⁺¹` puts `0` in the last coordinate, and `diag(g, 1)(v; 0) = (g v; 0)`. Witness: over
   `ℚ`, `(2) ↦ diag(2, 1)`, with inverse `diag(1/2, 1)`, determinant `2`.
3. **Stable range.** Bass's condition `SR_N` says that every unimodular row of length `N` can be
   shortened; it is AlgebraicKTheory's `HasStableRangeLE R (N − 1)`. Following van der Kallen
   (1980, 2.2), `sdim ≥ 0` is an integer with `SR_(sdim+2)(R)` and `e = max(1, sdim)`. Witnesses
   (AlgebraicKTheory 4.1–4.2): a field has `SR₂` (`sdim = 0`, `e = 1`); `ℤ` fails `SR₂` (the
   row `(2, 5)`) and has `SR₃` (`sdim = 1`, `e = 1`); `ℤ[x]`, of Krull dimension `2`, has `SR₄`
   (`sdim = 2`, `e = 2`).
4. **Degrees and acyclicity.** The frames of length `j + 1` span the chains of degree `j`, the
   augmentation is in degree `−1`, and the boundary is the alternating sum of the faces, the face
   `i` deleting column `i` with sign `(−1)ⁱ`. A complex is `k`-acyclic when its reduced homology
   vanishes in every degree `j ≤ k`; `(−1)`-acyclic means nonempty (van der Kallen 1980, 2.9).
   Witness: over `𝔽₂` with `n = 2` the augmented chain groups have ranks `1, 3, 6` and the
   reduced homology is `0, 0, ℤ⁴` in degrees `−1, 0, 1`: the complex is `0`-acyclic, as Layer 1
   predicts for `n − 2 − sdim = 0`, and not `1`-acyclic.
5. **Homology.** Group homology is Mathlib's `groupHomology`, with integral trivial coefficients
   unless a representation is displayed. Relative groups `H_m(G', G; M', M)` along
   `(f, φ) : (G, M) → (G', M')` are the homology of the mapping cone of the induced map of
   inhomogeneous chains, with the long exact sequence
   `H_m(G; M) → H_m(G'; M') → H_m(G', G; M', M) → H_(m−1)(G; M)` (van der Kallen 1980, 3.8 and
   3.10). Witness: for `G = G'` and `φ = id` all relative groups vanish.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Matrices: `Matrix`, `Matrix.GeneralLinearGroup` with its `DistribMulAction` on
  `Matrix n m R`, `Matrix.submatrix`, `Matrix.fromBlocks`, `Matrix.fromBlocks_multiply`,
  `Matrix.fromBlocks_one`, `Matrix.reindexRingEquiv`, `finSumFinEquiv`, `Fin.succAbove`,
  `Fin.lastCases`, `Units.map`.
- Chains: `Finsupp`, `Finsupp.single`, `Finsupp.linearCombination`, `LinearMap.ker`,
  `LinearMap.range`, `Module.IsUnimodular`.
- Group homology: `Rep`, `Rep.trivial`, `Rep.res`, `Rep.ofDistribMulAction`, `groupHomology`,
  `groupHomology.map`, `groupHomology.chainsMap`, `groupHomology.indIso` (Shapiro's lemma).
- Rings: `IsNoetherianRing`, `ringKrullDim`, `IsSemisimpleRing`, `Ring.jacobson`, `IsLocalRing`,
  `IsLocalRing.ResidueField`.

**From Tau Ceti.** Nothing is consumed.

**From AlgebraicKTheory.** 1.1 (`elementary n`, the subgroup `E_n(R)`), 1.2 (`GL(R)` and `E(R)` as
colimits under `g ↦ diag(g, 1)`), 1.3 (`elementary_le_commutator`: `E_n(R)` is perfect for `n ≥ 3`),
4.1 (`HasStableRangeLE`, its monotonicity and the `K₁` stability theorems `surjective_stability` and
`injective_stability`), 4.2 (`hasStableRangeLE_of_ringKrullDim_le`,
`hasStableRangeLE_one_of_isSemisimpleRing`).

**From K3BlochGroups.** 4.1 (group-module hyperhomology and its spectral sequence
`E¹_(p,q) = H_q(G, C_p)`, with the identification with `H_*(G, ℤ)` for acyclic `C`), 4.2 (the
complex of independent frames over a field) for the Examples of Layer 1, 4.8
(`generalLinear_homology_stable`) and 4.15 (`symmetricGroup_homology_stable`) for the Examples of
Layer 2.

**From StableHomotopyKTheory.** 1.30 and 1.32 (`H_*(BG) ≅ H_*(G)`), 3.25–3.27 (the plus construction
with respect to a perfect normal subgroup, its universal property and functoriality), 4.14
(`BGL(R)⁺` and its H-space structure).

**From GeneralAlgebraicKTheory.** 3.2 and 3.12 (`K_m(R) ≅ π_m(BGL(R)⁺)` for `m ≥ 1`).

## How to read the build

Layer 1 is linear algebra and chain complexes on Mathlib alone: unimodular frames, their faces and
their complex, and its acyclicity, proved by van der Kallen's induction from Bass's stable range
condition (AlgebraicKTheory 4.1), with its instances through Bass's bounds (AlgebraicKTheory 4.2).
Layer 2 lets the groups `G_n^(P,Q)` act on the complexes of Layer 1 and on their affine and
transversal variants, builds the spectral sequence of each action from K3BlochGroups' hyperhomology
and Shapiro's lemma, proves van der Kallen's theorem by induction on the degree, adds the local
rings with infinite residue field, and passes to `GL(R)` and to K-theory through the plus
construction. Layer 3 repeats the argument of Layer 2 with coefficient systems and relative groups.

## Layer 1: unimodular frames and their complex

### 1.1 Unimodular frames

Define `UnimodularFrame R n k`, the `n × k` matrices over `R` with a left inverse, and its faces
`UnimodularFrame.face i`, deleting column `i` of a frame of length `k + 1`: the rows `i.succAbove`
of a left inverse form a left inverse of the face. `GL_n(R)` acts on frames by left multiplication,
the action commutes with faces, and a ring map `R → S` sends frames to frames (van der Kallen 1980,
2.4, p. 273, where a unimodular sequence is a basis of a free direct summand). A frame of length `k`
exists only if `k ≤ n` or `R` is the zero ring, and over a nonzero ring its columns are pairwise
distinct, so frames are van der Kallen's sequences of distinct elements.
*Needs:* Mathlib `Matrix`, `Matrix.submatrix`, `Fin.succAbove`, `Matrix.GeneralLinearGroup`.

**Checks.**

- For `k = 1`, `A` is a frame exactly when the vector `A` is `Module.IsUnimodular`: a left
  inverse is a linear form with value `1`. Over `ℤ` the vector `(2, 3)` is a frame
  (`−1·2 + 1·3 = 1`), `(2, 4)` is not.
- Left-invertibility is stronger than linear independence: over `ℤ` the columns `(1, 0)` and
  `(0, 2)` are independent and form no frame, since a left inverse of this square matrix would be
  an inverse and its determinant is `2`; a definition by linear independence would accept them.
- Over a field a `k`-frame is a sequence of `k` linearly independent vectors, so over `𝔽₂` there
  are `3` frames of length `1` and `6` of length `2` in `𝔽₂²`, and `|GL₃(𝔽₂)| = 168` frames of
  length `3` in `𝔽₂³`; over `ℤ/4` there are `12` unimodular vectors in `(ℤ/4)²`, the `16` vectors
  less the `4` with both coordinates even.
- Over the zero ring every matrix is a frame and there is one frame of each length, also for
  `k > n`; over a nonzero ring the `0 × 1` matrix is no frame, so `Rⁿ` with `n = 0` has none.

### 1.2 The complex of unimodular frames

Define `frameBoundary R n k`, from the free abelian group on frames of length `k + 2` to that on
frames of length `k + 1`, `A ↦ Σᵢ (−1)ⁱ A.face i`, and `frameAugmentation R n`, sending every frame
of length one to `1`. Prove `∂ ∘ ∂ = 0`, `ε ∘ ∂ = 0`, and that both are `GL_n(R)`-equivariant, so
that the frames form an augmented complex of `ℤ[GL_n(R)]`-modules whose chains of degree `j` are the
permutation modules on frames of length `j + 1`. Its homology is that of van der Kallen's poset
`O(Rⁿ) ∩ U` of unimodular sequences ordered by refinement, whose realization is the barycentric
subdivision of the semi-simplicial set of frames (van der Kallen 1980, 2.3–2.4, pp. 273–274).
*Needs:* 1.1; Mathlib `Finsupp`, `Finsupp.linearCombination`, `Finsupp.single`.

**Checks.**

- `∂(A) = A.face 0 − A.face 1` on a frame of length two: for the standard frame `(e₁, e₂)` this is
  `(e₂) − (e₁)`, and its augmentation is `0`; the unsigned sum of faces fails `ε ∘ ∂ = 0`.
- Over `𝔽₂` and `n = 2` the chain groups have ranks `1, 3, 6` and the reduced homology is `ℤ⁴` in
  degree `1` and zero elsewhere (Euler characteristic `−1 + 3 − 6 = −4`); over `𝔽₃` the ranks
  are `1, 8, 48` and the top group has rank `41`; over `ℤ/4` they are `1, 12, 96` with top rank
  `85`.
- Over `𝔽₂` and `n = 3` the ranks are `1, 7, 42, 168` and the reduced homology is zero in degrees
  `−1, 0, 1` and `ℤ¹³²` in degree `2`: the bound `n − 2` of 1.3 for fields is attained, since the
  top degree `n − 1` is nonzero.
- Over the zero ring every chain group is `ℤ` and the boundaries alternate between `0` and the
  identity, so the augmented complex is acyclic in every degree.

### 1.3 Acyclicity under the stable range condition

Prove that if `R` satisfies `SR_(sdim+2)`, that is `HasStableRangeLE R (sdim + 1)`, then the
augmented complex of unimodular frames in `Rⁿ` is `(n − 2 − sdim)`-acyclic (van der Kallen 1980,
Theorem 2.6(i) with `δ = 0`, p. 274; it is stated there as `(n − 2 − sdim)`-connectedness of the
poset, whose homological form is what 2.1 uses). Route: van der Kallen's induction (1980, 2.9–2.18,
pp. 275–278), which proves the four parts of his Theorem 2.6 simultaneously, including the affine
and transversal variants of 2.1: deformation retractions of subposets onto posets with suprema
(Lemma 2.11), the acyclicity of links (Lemma 2.12), and a change of coordinates by `SR_(sdim+2)`
that makes a first coordinate a unit (2.18).
*Needs:* 1.2; AlgebraicKTheory 4.1 (`HasStableRangeLE`).

**Checks.**

- For a field (`sdim = 0`) and `n = 2` the complex is `0`-acyclic, as computed in 1.2 over `𝔽₂`
  and `𝔽₃`: any two distinct nonzero vectors of `𝔽₂²` form a frame, so the graph of frames of
  length one and two is complete and connected.
- For `n = sdim + 1` only nonemptiness is claimed, and `e₁` is a unimodular vector.
- The ring `𝔽₂ × 𝔽₂` is semisimple and has `SR₂` (`sdim = 0`); for `n = 1` the claim is
  nonemptiness only, and `(1, 1)` is a unimodular vector. For the affine variant of 2.1 over this
  ring the bound is attained: van der Kallen's Remark 2.7.3 (p. 274) notes that `O(R + e₂) ∩ U`
  is nonempty and not connected.

### 1.4 Noetherian and semilocal rings

Prove `frameComplex_acyclic_of_ringKrullDim_le`: for a commutative noetherian ring of Krull
dimension at most `d`, the augmented complex of unimodular frames in `Rⁿ` is `(n − 2 − d)`-acyclic;
in the form stated, the augmentation is onto for `n ≥ d + 1`, the reduced homology vanishes in
degree `0` for `n ≥ d + 2` and in degree `k + 1` for `n ≥ k + 1 + d + 2`. Prove
`frameComplex_acyclic_of_isSemisimpleRing`: if `R ⧸ Ring.jacobson R` is semisimple, the complex is
`(n − 2)`-acyclic. Route: 1.3 with `sdim = d` by Bass's bound `hasStableRangeLE_of_ringKrullDim_le`
(van der Kallen's standard example, 1980, 2.2, p. 273), and with `sdim = 0` by
`hasStableRangeLE_one_of_isSemisimpleRing`.
*Needs:* 1.2, 1.3; AlgebraicKTheory 4.2; Mathlib `IsNoetherianRing`, `ringKrullDim`,
`IsSemisimpleRing`, `Ring.jacobson`.

**Checks.**

- Over `ℤ` (`d = 1`) and `n = 3` the complex is `0`-acyclic; for instance the unimodular vectors
  `(2, 3, 0)` and `(1, 0, 0)` are joined through `(0, 0, 1)`, which forms a frame with each of
  them (with `(1, 1, 0)`, the first pair completes to a basis of determinant `1`).
- Over `ℤ/4`, local and hence semilocal, and `n = 2` the reduced homology vanishes in degrees
  `−1, 0` (computed in 1.2) and is `ℤ⁸⁵` in degree `1`.
- The zero ring has Krull dimension `⊥ ≤ d` for every `d`; its complex is acyclic (1.2), as the
  statement requires for every `n`.

### Examples

- For a field the theorem says that the frames of `Fⁿ`, the ordered independent sequences, form
  an `(n − 2)`-acyclic complex. K3BlochGroups 4.2 uses the related complex of sequences in
  `Fⁿ ⊕ Fᵐ` whose projections to `Fⁿ` are independent.
- For a Dedekind domain (`d = 1`) the complex is `(n − 3)`-acyclic; for `ℤ` these are Maazen's
  complexes of partial bases of `ℤⁿ`.

### Dependencies

Mathlib, and AlgebraicKTheory 4.1–4.2 for 1.3–1.4. Within the layer, each target uses the
previous ones.

## Layer 2: stability with constant coefficients

### 2.1 Frames as `GL_n(R)`-sets

For finite sets `P, Q` with `P ∪ Q = [1, t]`, let `G_n^(P,Q)` be the subgroup of `GL_n(R)` of
matrices fixing the columns `e_j`, `j ∈ P`, and the rows `e_i*`, `i ∈ Q` (van der Kallen 1980, 3.2,
p. 278); `G_n^(∅,∅) = GL_n(R)`, and `G_n^(P,Q)` is isomorphic to `GL_(n−t)(R)` when
`P = Q = [1, t]`. Prove, under `SR_(sdim+2)`, van der Kallen's Examples 3.5 (pp. 279–280): each
`G_n^(P,Q)` acts on a complex of frames of one of the four kinds (frames in a free summand, in an
affine subspace, of row vectors, of mixed type), that complex is `d`-acyclic with
`d = n − t − 2 − sdim` (1.3 and its affine and transversal variants, van der Kallen 1980, Theorem
2.6(i)–(iv)), the action is transitive on frames of each length `k + 1 ≤ d + 2`, and the stabiliser
of the standard frame of length `k + 1` is a group `G_n^(P',Q')` with `|P' ∪ Q'| = t + k + 1`.
*Needs:* 1.1–1.3; AlgebraicKTheory 4.1; Mathlib `Matrix.GeneralLinearGroup`.

**Checks.**

- For `t = 0` and `k = 0`, transitivity on unimodular vectors of `Rⁿ` is the completion of a
  unimodular vector to a basis; over a field it holds for every `n ≥ 1` and the stabiliser of
  `e₁` is the affine group `{(1 *; 0 *)}`, which for `n = 2` over `𝔽₂` has order `2`.
- Over `ℤ` (`sdim = 1`) and `n = 2`, `d = −1`, so only `k + 1 ≤ 1` is claimed: `GL₂(ℤ)` is
  transitive on unimodular vectors, and the stabiliser of `e₁` is `{(1 b; 0 ±1)}`.
- The stabiliser of `(e₁, …, e_n)` in `GL_n(R)` is trivial: `G_n^([1,n],∅) = 1`, which ends the
  induction.

### 2.2 The spectral sequence

For `G = G_n^(P,Q)` acting on its `d`-acyclic complex of frames `C` (2.1) and a `G`-module `M`,
construct the first-quadrant spectral sequence `E(P, Q; n)` with `E¹_(0,s) = H_s(G, M)`,
`E¹_(r,s) = H_s(Stab_G(σ_(r−1)), M)` for `1 ≤ r ≤ d + ε + 1`, where `σ_(r−1)` is the standard frame
of length `r` and `ε` is `0` when `G` is a square group and `1` otherwise, converging to zero (the
columns `r > d + ε + 1` are not described); the differential `E¹_(1,s) → E¹_(0,s)` is induced by the
inclusion `Stab_G(σ₀) → G`, and for `r ≥ 1` the differential `E¹_(r+1,s) → E¹_(r,s)` is zero for `r`
odd and the map induced by `Stab_G(σ_r) → Stab_G(σ_(r−1))` for `r` even (van der Kallen 1980,
Proposition 3.7, p. 280, and Lemma 4.5, p. 285). Route: the hyperhomology spectral sequence of
K3BlochGroups 4.1 for the augmented complex `C` truncated above degree `d + ε`, which vanishes in
the acyclic range; the chains of degree `r − 1` are a permutation module with one orbit (2.1), so
Shapiro's lemma `groupHomology.indIso` identifies `H_s(G, C_(r−1) ⊗ M)` with
`H_s(Stab_G(σ_(r−1)), M)`; the faces of `σ_r` are carried to `σ_(r−1)` by elements centralising
`Stab_G(σ_r)`, so the alternating sum of the `r + 1` face maps is the inclusion map or zero by the
parity of `r` (van der Kallen 1980, 4.3–4.5).
*Needs:* 2.1; K3BlochGroups 4.1; Mathlib `groupHomology`, `groupHomology.indIso`.

**Checks.**

- `E¹_(1,0) → E¹_(0,0)` is `ℤ → ℤ`, the identity of `H₀`, since `G` is transitive on frames of
  length one: the abutment vanishes in degree `0`.
- For `GL₂(𝔽₂)`, a square group with `d = 0` and `ε = 0`, the described columns are `r = 0, 1`:
  `E¹_(0,1) = H₁(GL₂(𝔽₂)) = ℤ/2` and `E¹_(1,1) = H₁(Stab(e₁)) = ℤ/2`, the stabiliser being
  generated by the transvection `(1 1; 0 1)`, an odd permutation of the three nonzero vectors, so
  the differential `E¹_(1,1) → E¹_(0,1)` is onto.
- Acyclicity is what makes the abutment vanish: for `n = 1` over `𝔽₃` (`d = −1`) the two frames
  of length one span chains whose reduced `H₀` is `ℤ`, and `GL₁(𝔽₃)` acting on them gives no
  vanishing in degree `0`.

### 2.3 Van der Kallen's theorem

Prove: if `R` satisfies `SR_(sdim+2)` and `e = max(1, sdim)`, the stabilization induces maps
`H_m(GL_n(R); ℤ) → H_m(GL_(n+1)(R); ℤ)` and `H_m(E_n(R); ℤ) → H_m(E_(n+1)(R); ℤ)` that are onto for
`n ≥ 2m + e − 1` and bijective for `n ≥ 2m + e`, for every `m ≥ 0` (van der Kallen 1980, Theorem
4.11, p. 289). Route: van der Kallen's Theorem 4.8 (p. 287) for all the groups `G_n^(P,Q)` with
`Sq(G_n^(P,Q))` of size at least `2m + e − 1`, by induction on `m` through the spectral sequences of
2.2 (pp. 287–288); for `E_n(R)` the case `XL(R) = E(R)` of the same argument, with injective
stability for `K₁` (AlgebraicKTheory 4.1) to identify `G_n^(∅,∅) ∩ E(R)` with `E_n(R)` for
`n ≥ sdim + 2`.
*Needs:* 2.1, 2.2; AlgebraicKTheory 1.1 (`elementary n`), 4.1 (`HasStableRangeLE`,
`injective_stability`).

**Checks.**

- `m = 0`: both sides are `ℤ` and the map is the identity, for every `n ≥ 0`.
- `m = 1` over `𝔽₂` (`e = 1`): `H₁(GL₁(𝔽₂)) = 0`, `H₁(GL₂(𝔽₂)) = H₁(𝔖₃) = ℤ/2` and
  `H₁(GL₃(𝔽₂)) = 0`, `GL₃(𝔽₂)` being simple of order `168`. The map for `n = 1` is not onto and
  for `n = 2` is onto and not injective, so both bounds `n ≥ 2m` and `n ≥ 2m + 1` are attained.
- `m = 1` over `ℤ` (`sdim = 1`, `e = 1`): `GL₂(ℤ)` has abelianization `(ℤ/2)²` and `GL_n(ℤ)` has
  abelianization `ℤ/2` (the determinant) for `n ≥ 3`, `SL_n(ℤ)` being perfect there; the map
  `H₁(GL₂(ℤ)) → H₁(GL₃(ℤ))` is onto and not injective, `H₁(GL₃(ℤ)) → H₁(GL₄(ℤ))` is
  bijective.

### 2.4 Noetherian and semilocal rings

Define `stabilization R n : GL_n(R) →* GL_(n+1)(R)`, `g ↦ diag(g, 1)` (Convention 2). Prove
`homology_stabilization_of_ringKrullDim_le`: for a commutative noetherian ring of Krull dimension at
most `d` and `e = max 1 d`, the map `groupHomology.map (stabilization R n) φ m` with `φ` the
identity of `ℤ` is onto for `n ≥ 2m + e − 1` and bijective for `n ≥ 2m + e`. Prove
`homology_stabilization_of_isSemisimpleRing`: if `R ⧸ Ring.jacobson R` is semisimple, it is onto for
`n ≥ 2m` and bijective for `n ≥ 2m + 1`. Route: 2.3 with AlgebraicKTheory 4.2, as in 1.4.
*Needs:* 2.3; AlgebraicKTheory 4.2; Mathlib `Matrix.fromBlocks`, `Matrix.reindexRingEquiv`,
`finSumFinEquiv`, `Units.map`, `Rep.trivial`, `Rep.res`, `groupHomology.map`.

**Checks.**

- `stabilization R 0` sends the empty matrix to `(1)`, and over `ℚ` `stabilization ℚ 1` sends
  `(2)` to `diag(2, 1)`, with determinant `2`; putting `g` in the lower right block instead would
  conjugate the image by a permutation and change the inclusion `Rⁿ → Rⁿ⁺¹` of Layer 3.
- For `ℤ[x]` (`d = 2`, `e = 2`) the theorem gives bijectivity on `H₁` from `n ≥ 4`, while for
  `ℤ` (`d = 1`) it gives it from `n ≥ 3`: the bound grows with `d` only from `d = 2` on.
- The zero ring has `GL_n = 1` for every `n`, and every map in the statement is the identity of
  `ℤ` or of `0`.

### 2.5 Local rings with infinite residue field

Prove `homology_stabilization_of_infinite_residueField`: for a local ring `R` whose residue field is
infinite, the stabilization is onto on `H_m(−; ℤ)` for `m ≤ n` and injective for `m < n`. Its
content is the vanishing of the relative groups `H_m(GL_(n+1)(R), GL_n(R); ℤ)` for `m ≤ n`
(Nesterenko–Suslin 1989, Theorems 2.7 and 3.25; restated as Galatius–Kupers–Randal-Williams, Theorem
9.4), with the exact sequence of Convention 5. Route: Nesterenko and Suslin's argument, which
extends to local rings with infinite residue field Suslin's proof for infinite fields (K3BlochGroups
4.2–4.8), through the spectral sequence of 2.2 for frames in general position.
*Needs:* 2.2; K3BlochGroups 4.1; Mathlib `IsLocalRing`, `IsLocalRing.ResidueField`.

**Checks.**

- The hypothesis on the residue field is needed, not only an infinite ring: for `ℤ_(2)`, local
  with residue field `𝔽₂`, the composite `GL₁(ℤ_(2)) → GL₂(ℤ_(2)) → GL₂(𝔽₂) ≅ 𝔖₃` is trivial,
  since `GL₁(𝔽₂) = 1`, while `H₁(GL₂(ℤ_(2))) → H₁(𝔖₃) = ℤ/2` is onto, so
  `H₁(GL₁(ℤ_(2))) → H₁(GL₂(ℤ_(2)))` is not onto, although `m = n = 1`.
- For `𝔽₂` itself, injectivity at `m = 1 < n = 2` fails: `ℤ/2 → H₁(GL₃(𝔽₂)) = 0` (2.3, Checks).
- For an infinite field `F`, `m = n = 1`: `H₁(GL₁(F)) = Fˣ → H₁(GL₂(F)) = Fˣ` is the identity
  through the determinant, onto as claimed (and injective, which K3BlochGroups 4.8 proves).

### 2.6 The stable groups and K-theory

Prove: under `SR_(sdim+2)`, with `e = max(1, sdim)`, `H_m(GL_n(R); ℤ) → H_m(GL(R); ℤ)` is onto for
`n ≥ 2m + e − 1` and bijective for `n ≥ 2m + e`; for `m ≥ 1`, `π_m(BGL_n(R)⁺) → π_m(BGL_(n+1)(R)⁺)`
is onto for `n ≥ max(3, 2m + e − 1)` and injective for `n ≥ 2m + e + 1`, where `BGL_n(R)⁺` is the
plus construction with respect to the normal closure of the perfect group `E_n(R)`, `n ≥ 3` (van der
Kallen 1980, Corollary 4.12, p. 289); hence `π_m(BGL_n(R)⁺) → K_m(R)` is bijective for
`n ≥ max(3, 2m + e + 1)`. Route: homology commutes with the colimit `GL(R)` of AlgebraicKTheory 1.2,
so 2.3 gives the first claim; for the second, `BE_n(R)⁺` is the universal cover of `BGL_n(R)⁺` and
`H_*(BE_n(R)⁺) = H_*(E_n(R))`, so 2.3 for `E_n(R)` and the relative Hurewicz theorem give it (van
der Kallen 1980, proof of Corollary 4.12); for the last claim, the mapping telescope of the
`BGL_n(R)⁺` is a plus construction of `BGL(R)` (StableHomotopyKTheory 3.25), its homotopy groups are
the colimits of the `π_m(BGL_n(R)⁺)`, and `K_m(R) ≅ π_m(BGL(R)⁺)`.
*Needs:* 2.3; AlgebraicKTheory 1.2, 1.3 (`elementary_le_commutator`); StableHomotopyKTheory 1.30,
1.32, 3.25–3.27, 4.14; GeneralAlgebraicKTheory 3.2, 3.12.

**Checks.**

- For `m = 1`, `π₁(BGL_n(R)⁺)` is `GL_n(R)` modulo the normal closure of `E_n(R)`, and the claim
  gives `K₁(R)` for `n ≥ e + 3`, inside AlgebraicKTheory 4.1's range `n ≥ sdim + 2` for
  `GL_n(R)/E_n(R) ≅ K₁(R)`.
- `n ≥ 3` is needed: `E₂(𝔽₂) = GL₂(𝔽₂) ≅ 𝔖₃` is not perfect, so `BGL₂(𝔽₂)⁺` with respect to it
  is not defined.
- For `ℤ` and `m = 2`, `K₂(ℤ) = ℤ/2` is `π₂(BGL_n(ℤ)⁺)` for `n ≥ 6`.

### Examples

- Infinite fields: Suslin's range `H_i(GL_n(F)) ≅ H_i(GL_(n+1)(F))` for `i ≤ n`
  (K3BlochGroups 4.8, `generalLinear_homology_stable`) improves on 2.3, which gives
  bijectivity for `n ≥ 2i + 1`; 2.5 recovers its surjective half and its injectivity for `i < n`.
- Symmetric groups: Nakaoka's range, `H_i(Σ_n) ≅ H_i(Σ_(n+1))` for `n ≥ 2i` (K3BlochGroups 4.15,
  `symmetricGroup_homology_stable`), is the range of 2.3 for `e = 0`, the "field with one
  element": its proof is that of 2.2–2.3 for the complex of injective words, whose stabilisers are
  again symmetric groups. The inclusion of permutation matrices `Σ_n → GL_n(R)` commutes with the
  stabilizations.

### Dependencies

Layer 1; AlgebraicKTheory 1.1–1.3 and 4.1–4.2; K3BlochGroups 4.1 (and 4.8, 4.15 for the
Examples); StableHomotopyKTheory 1.30, 1.32, 3.25–3.27, 4.14 and GeneralAlgebraicKTheory 3.2,
3.12 for 2.6. Within the layer, 2.2 uses 2.1, 2.3 uses 2.1–2.2, 2.4 and 2.6 use 2.3, and 2.5
uses 2.2.

## Layer 3: twisted coefficients

### 3.1 Coefficient systems

Define, after Dwyer and van der Kallen (1980, 5.2–5.5, pp. 290–291), a coefficient system
`ρ = (ρ_n, F_n)`: `GL_n(R)`-modules `ρ_n` with maps `F_n : ρ_n → ρ_(n+1)` linear along the
stabilization; central when the image of `ρ_n` in `ρ_(n+2)` is fixed by `s_(n+2)`, where
`s_n(e_i) = e_i` for `i ≤ n − 2`, `s_n(e_(n−1)) = e_n`, `s_n(e_n) = e_(n−1)` (the choice `γ = 1` of
van der Kallen 1980, 5.2, available for `GL`); strongly central when that image is also fixed by the
elementary matrix `e_(n+1,n+2)`; the shifted system `Σρ` (restriction along the lower inclusion),
the map `τ : ρ → Σρ`, and the degree: `ρ` has degree `< 0` when it is zero, and degree `k ≥ 0` when
`Σρ` splits as `τ(ρ) ⊕ coker τ` with `coker τ` strongly central of degree `k − 1`. Define the
relative groups `Rel_m^n(ρ) = H_m(GL_(n+1)(R), GL_n(R); ρ_(n+1), ρ_n)` (Convention 5).
*Needs:* 2.4 (`stabilization`); Mathlib `Rep`, `Rep.res`, `groupHomology.chainsMap`.

**Checks.**

- A constant system (`ρ_n = A` with trivial action, `F_n = id`) is strongly central of degree
  `0`: `Σρ = ρ` and `coker τ = 0`, of degree `−1`.
- The standard system `ρ_n = Rⁿ`, with `F_n` the inclusion of Convention 2, is strongly central:
  the image of `Rⁿ` in `Rⁿ⁺²` is spanned by `e₁, …, e_n`, fixed by `s_(n+2)` and by
  `e_(n+1,n+2)`, which moves only `e_(n+2)`. It has degree `1`: `(Σρ)_n = Rⁿ⁺¹` with `GL_n(R)`
  acting on the last `n` coordinates splits as `Re₁ ⊕ τ(Rⁿ)`, and `Re₁` is constant (van der
  Kallen 1980, 5.5).
- The system `ρ_n = Rⁿ` with `F_n = 0`, over `R ≠ 0`, is central and has no degree: `τ` is zero,
  so `Σρ` never splits off a copy of `ρ` through `τ`.

### 3.2 Stability for strongly central systems

Prove: if `R` satisfies `SR_(sdim+2)` and `ρ` is strongly central of degree `k`, then
`Rel_m^n(ρ) = 0` for `n ≥ 2m + sdim + k`; hence `H_m(GL_n(R); ρ_n) → H_m(GL_(n+1)(R); ρ_(n+1))` is
onto for `n ≥ 2m + sdim + k` and bijective for `n ≥ 2m + sdim + k + 2` (van der Kallen 1980, Theorem
5.6, p. 291, with the exact sequence of Convention 5). Route: induction on `k` and `m` through the
spectral sequences of 2.2 with coefficients and the map `τ` (van der Kallen 1980, 5.12, p. 292,
after the argument of 5.8–5.11 for Theorem 5.7).
*Needs:* 2.2, 2.3, 3.1; AlgebraicKTheory 4.1.

**Checks.**

- For a constant system (`k = 0`) the bound `n ≥ 2m + sdim` for surjectivity equals that of 2.3,
  `n ≥ 2m + e − 1`, when `sdim = 0`, and is one weaker when `sdim ≥ 1`.
- `m = 0`: `Rel_0^n(ρ) = coker(ρ_n → (ρ_(n+1))_(GL_(n+1)))` on coinvariants; for `ρ = Rⁿ` and
  `n ≥ 1` the coinvariants of `Rⁿ⁺¹` vanish (`e₁ = (e_(12) − 1)e₂`), so `Rel_0^n = 0` from
  `n ≥ 1`, within the claimed `n ≥ sdim + 1`.
- Degree matters: for `ρ_n = Rⁿ ⊗ Rⁿ` (degree `2`, van der Kallen 1980, 5.5) the bound is one
  more than for `Rⁿ`.

### 3.3 The standard representation

Define `standardRep R n`, the integral representation of `GL_n(R)` on `n × 1` matrices by left
multiplication (`Rep.ofDistribMulAction`). Prove `twistedHomology_stabilization_of_ringKrullDim_le`:
for a commutative noetherian ring of Krull dimension at most `d`, with
`φ : standardRep R n ⟶ Rep.res (stabilization R n) (standardRep R (n + 1))` the inclusion of the
first `n` coordinates, the map `H_m(GL_n(R); Rⁿ) → H_m(GL_(n+1)(R); Rⁿ⁺¹)` is onto for
`n ≥ 2m + d + 1` and bijective for `n ≥ 2m + d + 3`. Prove
`twistedHomology_stabilization_of_isSemisimpleRing`: if `R ⧸ Ring.jacobson R` is semisimple, onto
for `n ≥ 2m + 1` and bijective for `n ≥ 2m + 3`. Route: 3.2 for the standard system (3.1, Checks)
with `k = 1`, and AlgebraicKTheory 4.2.
*Needs:* 3.1, 3.2; AlgebraicKTheory 4.2; Mathlib `Rep.ofDistribMulAction`, `Fin.lastCases`.

**Checks.**

- `m = 0` over `𝔽₂`: `H₀(GL₁(𝔽₂); 𝔽₂) = 𝔽₂`, since `GL₁(𝔽₂) = 1`, and
  `H₀(GL₂(𝔽₂); 𝔽₂²) = 0` (the coinvariants of 3.2, Checks): the map `𝔽₂ → 0` is onto and not
  injective at `n = 1`, outside the bijective range `n ≥ 3`.
- `m = 0` over `ℤ` (`d = 1`): `H₀(GL₁(ℤ); ℤ) = ℤ/(−1 − 1) = ℤ/2` maps onto `H₀(GL₂(ℤ); ℤ²) = 0`
  at `n = 1`, not in the claimed range `n ≥ 2` for surjectivity, and indeed onto.
- The coefficient map must be the inclusion `v ↦ (v; 0)`: the map `v ↦ (0; v)`, putting `v` in
  the last `n` coordinates, is not `GL_n(R)`-linear along `diag(g, 1)` for `n ≥ 2`, so no `φ`
  with that formula exists.

### Examples

- For a field `F` with at least three elements the groups `H_m(GL_n(F); Fⁿ)` vanish, `n ≥ 1`: a
  central scalar `λ ≠ 1` acts on them trivially, as an inner automorphism, and as multiplication
  by the unit `λ`, so `λ − 1` kills them. Over `𝔽₂` there is no such scalar and
  `H₀(GL₁(𝔽₂); 𝔽₂) = 𝔽₂` (3.3, Checks).
- Dwyer's theorem (Dwyer 1980) is the case of a principal ideal domain, with a qualitative
  range.

### Dependencies

Layers 1–2; AlgebraicKTheory 4.1–4.2. Within the layer, 3.2 uses 3.1 and 3.3 uses 3.1–3.2.

## Downstream consumers

No roadmap on main or in the open pull requests cites HomologicalStabilityOfGeneralLinearGroups.
ArithmeticKTheory §3.2 states rank-filtration bounds for `GL_m` of rings of integers and says
that they are not homological stability bounds; K3BlochGroups (Layer 4) proves the
infinite-field and symmetric-group ranges it needs and is a supplier here, not a consumer.

## Research context

Quillen showed, in unpublished work, that `H_m(GL_n(F)) → H_m(GL_(n+1)(F))` is bijective for
`n ≥ m + 1` over fields `F ≠ 𝔽₂`, by the spectral sequence of the action on a highly connected
complex of unimodular sequences; he proved the connectivity for local rings and conjectured it for
finite-dimensional noetherian rings. Maazen proved stability for subrings of `ℚ` and for the
symmetric groups in Nakaoka's range by the same method, Charney for Dedekind domains with split
buildings, and van der Kallen the conjecture, with the ranges of Layer 2 (van der Kallen 1980,
§§1.5–1.7, pp. 271–272). The optimal ranges remain open in general: for infinite fields the
injectivity of `H_n(GL_(n−1)(F)) → H_n(GL_n(F))` is a question of Suslin, and the `E∞`-cellular
methods of Galatius, Kupers and Randal-Williams describe the relative groups beyond the line of 2.5.
Quillen's notebooks 1971-11 (pp. 58–62), 1972-2 (pp. 16–26 and 38–43) and 1973-3 (pp. 5–10) (Clay
Mathematics Institute) work on these questions.

## References

- W. van der Kallen, « Homology stability for linear groups », *Invent. Math.* 60 (1980), no. 3,
  269–295. doi:10.1007/BF01390018. GDZ: PPN356556735_0060.
- Yu. P. Nesterenko, A. A. Suslin, « Homology of the full linear group over a local ring, and
  Milnor's K-theory », *Izv. Akad. Nauk SSSR Ser. Mat.* 53 (1989), no. 1, 121–146; English
  translation *Math. USSR-Izv.* 34 (1990), no. 1, 121–145. doi:10.1070/IM1990v034n01ABEH000610.
- S. Galatius, A. Kupers, O. Randal-Williams, « E∞-cells and general linear groups of infinite
  fields », to appear in *Duke Math. J.*; arXiv:2005.05620 (version 3), Theorem 9.4.
- W. G. Dwyer, « Twisted homological stability for general linear groups », *Ann. of Math.* (2)
  111 (1980), no. 2, 239–251. doi:10.2307/1971200.
- A. A. Suslin, « Homology of GL_n, characteristic classes and Milnor K-theory », in *Algebraic
  K-theory, number theory, geometry and analysis* (Bielefeld, 1982), Lecture Notes in Math. 1046,
  Springer, 1984, 357–375. doi:10.1007/BFb0072031.
- R. Charney, « Homology stability for GL_n of a Dedekind domain », *Invent. Math.* 56 (1980),
  no. 1, 1–17. doi:10.1007/BF01403153.
- M. Nakaoka, « Decomposition theorem for homology groups of symmetric groups », *Ann. of Math.*
  (2) 71 (1960), 16–42. doi:10.2307/1969878.
- H. Bass, *Algebraic K-Theory*, W. A. Benjamin, New York, 1968, Chapter V. Zbl 0174.30302.
- A. Hatcher, N. Wahl, « Stabilization for mapping class groups of 3-manifolds », *Duke Math. J.*
  155 (2010), no. 2, 205–269. doi:10.1215/00127094-2010-055. arXiv:0709.2173.
- O. Randal-Williams, N. Wahl, « Homological stability for automorphism groups », *Adv. Math.* 318
  (2017), 534–626. doi:10.1016/j.aim.2017.07.022. arXiv:1409.3541.
