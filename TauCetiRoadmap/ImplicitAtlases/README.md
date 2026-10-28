# Roadmap: implicit atlases and rational virtual fundamental classes

**Summary.** This roadmap builds a topological implicit-atlas engine on compact Hausdorff spaces, following Pardon's algebraic approach to virtual fundamental cycles. From finite-group equivariant thickenings, obstruction representations and coordinate-change maps (Layer 1) it constructs deformation-to-the-normal-cone spaces and virtual cochain complexes (Layer 2), the virtual orientation sheaf of a locally orientable atlas and the comparison of virtual cohomology with Čech cohomology (Layer 3), the global relative obstruction trace and the rational virtual fundamental class as a functional on degree-d Čech cohomology (Layer 4). The end theorems are: finite-subatlas independence of that functional; its boundary, cobordism, refinement, pushforward and regular-manifold normalization laws, and its agreement with the compactly supported Euler pairing for a smooth section (Layer 5); the stratified quasi-isomorphism for cell-like stratified atlases and the product formula on arbitrary compact Hausdorff products (Layer 6); and the identity between the virtual class of a transverse fiber product over a manifold and the virtual class of the product evaluated on a supported Gysin image (Layer 7).

## Scope and ownership

This roadmap owns:

- finite-index group products, obstruction sums, integral orientation lines of real vector spaces and their sign conventions, finite-group invariant chains and the independent-parity adapters used by the engine, together with the sheaf theory on locally compact Hausdorff spaces that the engine runs on: K-sheaves and homotopy K-sheaves, Čech cohomology with sheaf coefficients on compact Hausdorff spaces, pure homotopy K-sheaves, extension by zero and finite quotients, manifold orientation sheaves with closed-subset duality, and finite interval diagrams with pure gluing (Layer 0);
- topological implicit atlases with and without boundary, their smooth enhancement, subatlases, restrictions and reindexing (Layer 1);
- deformation spaces, partial and global virtual cochain complexes and their interval diagrams (Layer 2);
- local orientability, the virtual orientation sheaf, partial and global purity and the virtual/Čech comparison (Layer 3);
- the obstruction complex, the global relative trace and the rational virtual fundamental class with finite-subatlas independence (Layer 4);
- the boundary exact triangle, boundary and cobordism laws, refinement invariance, functional pushforward, finite-CW realization, regular-manifold normalization and the Euler comparison (Layer 5);
- cell-like stratified atlases, their normal lines and restricted atlases, the stratified virtual complex, product atlases and the compact Čech external product (Layer 6);
- transverse fiber-product atlases over a manifold, the supported Gysin map and the fiber-product identity (Layer 7).

What it builds on, and does not plan again:

- **AlgebraicTopology.** Relative singular chains and local coefficients (Stage 2), subdivision, excision and Mayer–Vietoris (Stage 3), cochains, cup and cap products and the Eilenberg–Zilber comparison (Stage 6).
- **CharacteristicClasses.** The constant-coefficient Čech/singular comparison on paracompact Hausdorff spaces of CW type (§C1.2b) and the Thom class of an oriented vector bundle (§C2, item 1).
- **DGAInfinity, Layer 0.** Signed graded tensor and Koszul-sign conventions for complexes.
- **AbelianSchemesAndArithmeticModuliPartII, §B2.9.** Invariance of domain in equal real dimension: a continuous injection from an open subset of ℝ^m to ℝ^m is an open embedding, and its consequence for boundaryless topological manifolds. Layer 6 consumes it and proves only the cell-like-stratum consequences.

The engine takes an implicit atlas as input. It does not construct nodal curve domains, stable maps, analytic obstruction spaces, Fredholm operators, gluing maps or compactifications: the application roadmaps (AnalyticStableMaps, GromovWittenTheory, SymplecticFieldTheory, DGFloer, HamiltonianFloerOperations) construct their atlases and witnesses. Smooth orbifold geometry, weighted orbifold Poincaré duality and orbifold integration belong to Orbifolds; ineffective finite groups already occur in the atlas data and in the rational invariant chains, so the engine has no Orbifolds input. The source's lift of the virtual class to Steenrod homology (Pardon, Definition 5.4.2, p. 46) is outside this roadmap: the public class is the rational dual-Čech functional, and it is never identified with singular homology of a possibly wild compact space.

## Conventions

| Item | Convention |
| --- | --- |
| Base | Compact Hausdorff X, with a specified closed subset ∂X in the boundary version |
| Virtual dimension | Integer d, never a natural-number truncation |
| Indexing | Finite subsets I of an index type A; products and sums retain their index bijections |
| Groups | Γ_I = ∏_(α∈I) Γ_α with every Γ_α finite |
| Obstructions | E_I = ⊕_(α∈I) E_α, a finite-dimensional real representation of Γ_I of dimension m_I |
| Coefficients | The principal class is over ℚ; chain and sheaf constructions are also stated over a commutative ring R in which every relevant group order is a unit |
| Chains | Native ordinary singular simplicial chains, relative quotients and local coefficients; zero in negative homological degrees |
| Complexes | Cochain degree q ∈ ℤ, differential of degree +1; native shift `C[k]^q = C^(q+k)` with differential `(−1)^k d` |
| Parity | The source differential is odd; the independent parity τ = σ − q of §0.5 is retained, not only the native cochain sign |
| Orientation hypothesis | Every statement involving the virtual orientation sheaf, the Čech comparison, the virtual class or its laws assumes the atlas is locally orientable (§3.1); Layers 1 and 2 and the chain-level constructions do not |
| Class | A functional on degree-d Čech cohomology with coefficients in the virtual orientation sheaf, relative to the boundary where present |
| Naturality | Dual pullback along continuous maps with stated coefficient data; no atlas-to-atlas degree formula |

Signs are read in ℤ/2: an exponent such as d(q − d) with d negative is reduced modulo 2, never computed after `Int.toNat`.

## Exact supplier contracts

### From Mathlib (commit f6090c7)

- `TopPair` and `TopPair.ofSubset` (Mathlib/Topology/Category/TopPair.lean): a pair is an embedding A → X; the subset constructor gives the pair (X, A) for A ⊆ X. No compactness, Hausdorffness or nonemptiness is part of the structure. Used for (D, D∖Z_K) in Layer 2 and (E, E∖0) in Layer 0 and Layer 4.
- `Representation`, `Representation.invariants`, `GroupAlgebra.average`, `Representation.averageMap` and `Representation.isProj_averageMap` (Mathlib/RepresentationTheory/Invariants.lean): fixed vectors of a representation and the averaging projection, which requires the group order to be invertible in the ground ring. Used in §0.3.
- `CochainComplex.shiftFunctor` (Mathlib/Algebra/Homology/HomotopyCategory/Shift.lean): the shift `K[n]^i = K^(i+n)` with differential multiplied by `(−1)^n`. Used for every reindexing comparison in Layer 2, Layer 4 and Layer 7.
- `CategoryTheory.cechComplexFunctor` (Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean): the Čech complex of a presheaf on a fixed cover. Used in §0.7 on a fixed cover and through §0.7 in §6.5.
- `TopCat.Sheaf` (Mathlib/Topology/Sheaves/Sheaf.lean), `TopCat.Presheaf.stalk` (Mathlib/Topology/Sheaves/Stalks.lean), `TopCat.Sheaf.pushforward` and `TopCat.Sheaf.pullback` (Mathlib/Topology/Sheaves/Functors.lean): sheaves on a topological space, stalks, and pushforward and pullback along a continuous map. Mathlib has no extension by zero, no K-sheaves and no colimit-over-covers Čech cohomology; §0.6–§0.9 construct them.
- `TopologicalSpace.Compacts`: compact subsets, the index category of K-presheaves in Layer 2 and Layer 3.
- `ModuleCat`, `TopCat`, `Module.finrank`, `EuclideanSpace` and `Topology.IsOpenEmbedding`: the carriers of coefficients, spaces, obstruction dimensions, local models and open embeddings.

### From Tau Ceti (commit 358314d)

- `TopPair.singularChainComplexFunctor` (TauCeti/AlgebraicTopology/Singular/Relative.lean): relative singular chains of a pair with coefficients in an object of a preadditive category, in natural-number homological degrees. It carries no orientation twist, group action or reindexing. Used in §0.4.
- `TopPair.twistedChainComplex` (TauCeti/AlgebraicTopology/Singular/Twisted/Relative.lean): relative chains with coefficients in a local system on the ambient space, as the cokernel of the subspace chain map. Used for the orientation-dual coefficients of Layer 2 and Layer 4.
- `TopCat.eilenbergZilberHomotopyEquiv` (TauCeti/AlgebraicTopology/Singular/EilenbergZilber.lean): the absolute Alexander–Whitney/shuffle homotopy equivalence with coefficient tensors. Relative, twisted and invariant versions are constructed in §0.4.
- `TauCeti.koszulBraidingSummand` (TauCeti/Algebra/Homology/Monoidal/Braiding.lean): the Koszul factor `(−1)^(pq)` on the degree-(p, q) summand. It does not carry the independent parity; §0.5 adds it.

### From TauCetiRoadmap.AlgebraicTopology

- Stage 2: relative singular chains, homology of pairs and local coefficient systems. Used in §0.2 and §0.4.
- Stage 3: subdivision, excision and binary Mayer–Vietoris with local coefficients. Used in §3.2.
- Stage 6: cochains, cup and cap products, the Eilenberg–Zilber comparison and manifold orientation and duality on its carriers. Used in §0.4, §5.5 and §7.3.

### From TauCetiRoadmap.CharacteristicClasses

- §C1.2b: the Čech/singular comparison with constant coefficients on paracompact Hausdorff spaces of CW type. Used in §5.5.
- §C2, item 1: the Thom class of an oriented real vector bundle with its naturality and uniqueness. Used for the diagonal Thom class in §7.3 and the Euler pairing in §5.6.

### From TauCetiRoadmap.DGAInfinity

- Layer 0: signed graded tensor products and Koszul signs. Used in §0.5 and §6.4.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII

- §B2.9: for every m ≥ 0, a continuous injective map from an open U ⊆ ℝ^m to ℝ^m is an open embedding; a continuous injection between boundaryless topological m-manifolds is an open embedding. Used in §6.2.

## How to read the build

Layer 0 fixes the coefficient, orientation-line, invariant and parity conventions and builds the sheaf theory the engine runs on: K-sheaves, Čech cohomology on compact Hausdorff spaces, purity, extension by zero and finite quotients, manifold duality for closed subsets and finite interval diagrams with pure gluing. Layer 1 states the atlas axioms on topological data only. Layer 2 builds deformation spaces from the atlas and their chain complexes; nothing there needs an orientation hypothesis. Layer 3 introduces local orientability, constructs the virtual orientation sheaf and proves that the virtual complex computes Čech cohomology with coefficients in it. Layer 4 defines the global relative trace and composes it with the Layer 3 comparison to obtain the virtual class, then proves it is independent of the finite subatlas. Layer 5 proves the standard laws of that class. Layer 6 adds cell-like strata and products; Layer 7 constructs fiber-product atlases and identifies the virtual class of a fiber product with a supported Gysin pairing. Every layer after Layer 0 is built only from earlier layers and the suppliers above.

## Layer 0: Coefficients, local orientations, sheaf cohomology and chain interfaces (V0)

### 0.1 Finite-index groups and obstruction sums

Define, for a finite subset I of the index type A, the group Γ_I = ∏_(α∈I) Γ_α and the real representation E_I = ⊕_(α∈I) E_α, with the projections Γ_J → Γ_I and inclusions E_I → E_J for I ⊆ J, and their identifications under disjoint union, injective reindexing and permutation of I. Fix the finite-dimensional topology on each E_α; a chosen norm is only a model and changes neither orientations nor any construction below. No differentiability of a thickening or a transition map is required.

- For I = ∅ the group is trivial and E_∅ = 0.
- For disjoint I and J the identifications Γ_(I⊔J) ≅ Γ_I × Γ_J and E_(I⊔J) ≅ E_I ⊕ E_J are compatible with projections and inclusions and are associative and unital.
- A bijection of finite index sets induces group and representation isomorphisms, and composites of bijections induce composites.

**Checks.**

- For I = ∅: Γ_∅ has one element and m_∅ = 0; a definition that omits the empty index set loses the manifold atlas of §1.1.
- For Γ_α = ℤ/2 and Γ_β = ℤ/3: Γ_(α,β) has order 6, and the normalization weights of §2.2 use this product order, not the order 3 of the largest factor.
- For E_α = E_β = ℝ, the identification E_(α,β) ≅ E_(β,α) is the coordinate swap, of determinant −1; its effect on orientation lines is −1 (§0.2), which an index-unordered direct sum would not record.

*Needs:* Mathlib `Representation`, `Module.finrank`.

### 0.2 Orientation lines of real vector spaces

Define the integral orientation line of a finite-dimensional real vector space E of dimension m as `o_E = H_m(E, E∖0; ℤ)`, its scalar extension to R and its dual, and the action of a real linear automorphism by the sign of its determinant (Pardon, Definition 4.1.1, p. 34). Its independent parity is m mod 2. Construct the ordered direct-sum, tensor, dual and permutation comparisons, using AlgebraicTopology Stage 2 generators and scalar extension of local homology classes. For a rank-one integral line use the canonical pairing `o_E ⊗ o_E^∨ → ℤ` after forgetting parity. On each regular topological manifold construct the orientation sheaf/local-system dictionary, including `j_*` of the interior orientation and `j_!` for the relative version at a boundary; a boundary point's absolute local top homology is zero and is not identified with its orientation fiber.

- `o_E` is free of rank one, and a linear automorphism acts by the sign of its determinant.
- The ordered identification `o_(E⊕F) ≅ o_E ⊗ o_F` is natural in isomorphisms and associative; exchanging the summands acts by `(−1)^(dim E · dim F)`.
- Scalar extension and dual commute with these identifications.

**Checks.**

- For E = 0: `o_0 = H_0(0, ∅; ℤ) = ℤ` with the point class as generator, and the only automorphism acts by +1.
- For E = ℝ: the reflection x ↦ −x acts on `o_ℝ = H_1(ℝ, ℝ∖0) ≅ ℤ` by −1 and the scaling x ↦ 2x acts by +1; a model acting by the determinant itself would give 2.
- For E = ℝ ⊕ ℝ: exchanging the two odd factors of `o_ℝ ⊗ o_ℝ` acts by −1, while −id on ℝ² acts by +1 and −id on ℝ³ acts by −1.

*Needs:* AlgebraicTopology Stage 2; §0.10 for the manifold dictionary.

### 0.3 Finite-group invariants

Use Mathlib's `Representation.invariants` and averaging `Representation.averageMap` when |Γ| is invertible in R. Prove that invariants commute with the exact chain constructions used here and retain scalar-change maps. For relative simplicial chains with rank-one sign coefficients construct the orbit-basis description: each orbit contributes the sign-invariant part of a rank-one module, which is the coefficient module when the stabilizer acts trivially and zero otherwise. Over ℚ every chain term is a vector space; state which later arguments use only projectivity and which use the orbit basis. No argument with noninvertible isotropy order enters the rational trace.

- With |Γ| invertible, invariants form an exact functor and the averaging map is a projection onto them.
- Invariants commute with finite direct sums, cones, filtered colimits and scalar change.
- The invariants of a rank-one sign representation are the whole module if the sign is trivial and zero otherwise, when 2 is invertible.

**Checks.**

- ℤ/2 acting on ℚ by −1 has invariants 0; acting trivially it has invariants ℚ.
- Over 𝔽₂, the sequence `0 → 𝔽₂ → 𝔽₂[ℤ/2] → 𝔽₂ → 0` with trivial outer actions has invariants `𝔽₂ → 𝔽₂·(1+g) → 𝔽₂`, and the last map sends 1+g to 1+1 = 0; exactness fails, so invertibility of |Γ| is needed.
- For ℤ/2 acting on two singular 0-simplices by exchanging them, with sign coefficients, the invariants are ℚ; for a fixed 0-simplex whose stabilizer acts by −1 they are 0.

*Needs:* Mathlib `Representation.invariants`, `Representation.averageMap`, `Representation.isProj_averageMap`.

### 0.4 Relative chains and product adapters

Reuse Tau Ceti's `TopPair.singularChainComplexFunctor` and `TopPair.twistedChainComplex` as the quotient by subspace chains, extending the homological index by zero below 0 before integer reindexing. Construct the coefficient, pair-map, cone and finite-group adapters. Use the simplicial shuffle map with its signed symmetry and associativity, and construct its relative, local-coefficient and invariant versions on the pairs below, comparing with `TopCat.eilenbergZilberHomotopyEquiv`. Every strict identity used to define an interval diagram is proved on this chain model; an abstract monoidal derived equivalence is not a strict chain map.

- The relative shuffle map is a chain map on pairs `(X, A) × (Y, B) → (X × Y, A × Y ∪ X × B)`, associative and unital, with symmetry sign `(−1)^(pq)` on degrees (p, q).
- Twisted and invariant versions are natural in coefficient morphisms and equivariant maps.

**Checks.**

- `C_*(X, ∅) = C_*(X)` and `C_*(X, X) = 0`.
- For (ℝ, ℝ∖0): H_1 = ℤ and H_0 = 0, since ℝ∖0 has two components and ℝ one.
- The shuffle product of two 1-simplices followed by the factor swap differs from the swapped product by −1.

*Needs:* Tau Ceti `TopPair.singularChainComplexFunctor`, `TopPair.twistedChainComplex`, `TopCat.eilenbergZilberHomotopyEquiv`; AlgebraicTopology Stages 2 and 6.

### 0.5 Parity normalization

Define a complex with independent parity as a ℤ-graded complex whose terms also carry a ℤ/2-grading, with odd differential of degree +1 and even chain maps; the ℤ/2-grading is often, but not always, the degree mod 2, and the independent parity is τ = σ − q mod 2 (Pardon, Convention A.0.3, p. 114). Tensor products use the super sign: the symmetry sends a ⊗ b to (−1)^(|a||b|) b ⊗ a in parity, and (f ⊗ g)(a ⊗ b) = (−1)^(|g||a|) f(a) ⊗ g(b). Apply this normalization to these relative chains, orientation factors, shifts and boundary cones. Every integer sign exponent is read in ℤ/2, including for negative virtual dimension. State each tensor order, retaining the orientation lines of the nonnegative deformation parameters. A pure virtual complex of dimension d has orientation parity d; the obstruction-relative complex after reindexing by m has parity 0 in its homology. The reindexing/shift comparison is constructed in §4.2.

- The conjugation sign comparing super and native tensor differentials is `(−1)^(τ_A r)` on an A-component of parity τ_A and a B-component of degree r.
- Raw reindexing and native shift by k differ by an explicit sign and by the parity change Π^k.

**Checks.**

- For τ_A = 1 and r = 1 the conjugation sign is −1; for τ_A = 0 it is +1.
- ℚ concentrated in degree 0, shifted by `CochainComplex.shiftFunctor` with n = 1, sits in degree −1 with differential multiplied by −1.
- For d = −1 the orientation parity is odd: (−1)^d = −1 in ℤ/2, whereas `Int.toNat` would give exponent 0 and sign +1.

*Needs:* DGAInfinity Layer 0; Mathlib `CochainComplex.shiftFunctor`; Tau Ceti `TauCeti.koszulBraidingSummand`.

### 0.6 K-sheaves and homotopy K-sheaves

Throughout §0.6–§0.11 a space is locally compact Hausdorff (Pardon, Convention A.0.1, p. 113); compact Hausdorff bases and the deformation spaces of Layer 2 are examples. Define a K-presheaf of R-modules on X as a contravariant functor on `TopologicalSpace.Compacts X`, the empty compact set included, with stalk F_p = F({p}) (Pardon, Definitions A.1.1–A.1.2, p. 114). A K-sheaf is a K-presheaf with F(∅) = 0, with `0 → F(K₁ ∪ K₂) → F(K₁) ⊕ F(K₂) → F(K₁ ∩ K₂)` exact for all compact K₁, K₂, and with F(K) the colimit of F(K') over the compact neighbourhoods K' of K (Pardon, Definition A.1.4, p. 114). Define the restriction from presheaves on opens to K-presheaves by the colimit over open neighbourhoods, and the reverse functor by the limit over compact subsets of an open set (Pardon, Definition A.1.6, p. 114); these are the compact/open indexing functors used in Layers 2 and 3. A homotopy K-sheaf is a complex of K-presheaves with F(∅) acyclic, the total complex `[F(K₁ ∪ K₂) → F(K₁) ⊕ F(K₂) → F(K₁ ∩ K₂)]` acyclic for all compact K₁, K₂, and F(K) → colim F(K') a quasi-isomorphism over compact neighbourhoods K' of K (Pardon, Definition A.2.5, p. 117).

- The two indexing functors restrict to inverse equivalences between sheaves (in Mathlib's `TopCat.Sheaf`) and K-sheaves on X (Pardon, Lemma A.1.8, p. 115).
- Pushforward along a proper map preserves K-sheaves and homotopy K-sheaves and commutes with the equivalence (Pardon, Lemma A.3.3 and Definition A.3.4, pp. 118–119); restriction along an injective map preserves homotopy K-sheaves (Pardon, Definition A.3.6, p. 119).
- The total complex of a finite sequence of homotopy K-sheaves whose adjacent maps compose to zero, in particular a mapping cone, is a homotopy K-sheaf (Pardon, Lemma A.2.11, p. 118).
- If a homotopy K-sheaf F has H^i F = 0 for i < i₀, then H^(i₀) F is a K-sheaf (Pardon, Lemma A.2.12, p. 118).
- For every topological space Y the relative singular chains K ↦ C_*(Y, Y∖K) on closed subsets satisfy the three axioms: C_*(Y, Y) is acyclic, the Mayer–Vietoris total complex for two closed sets is acyclic, and the colimit over a filtered decreasing family of closed sets maps quasi-isomorphically to the intersection (Pardon, Lemma A.6.3, p. 126).

**Checks.**

- On X = {a, b} with the discrete topology, K ↦ (ℤ if K ≠ ∅, 0 if K = ∅), with identity restrictions, fails the exactness axiom for K₁ = {a}, K₂ = {b}: F(K₁ ∪ K₂) = ℤ maps diagonally to the kernel ℤ ⊕ ℤ of the map to F(∅) = 0 and is not onto; the locally constant functions K ↦ ℤ^(π₀ K) give ℤ² and satisfy it.
- On X = ℝ, K ↦ {all functions K → ℤ} satisfies the first two axioms but not the third at K = {0}: the colimit over compact neighbourhoods is the module of germs at 0 of arbitrary functions, which maps onto F({0}) = ℤ with nonzero kernel (the germ of the indicator function of ℚ ∖ {0} is nonzero and has value 0 at 0).
- On X = ℝ, K ↦ H_1(ℝ, ℝ∖K) has values ℤ at {0}, ℤ at [0, 1] and ℤ² at {0, 1} (ℝ ∖ {0, 1} has three components), consistent with the exact sequence `0 → ℤ² → ℤ ⊕ ℤ → 0` for K₁ = {0}, K₂ = {1}.

*Needs:* Mathlib `TopologicalSpace.Compacts`, `TopCat.Sheaf`, `TopCat.Presheaf.stalk`, `TopCat.Sheaf.pushforward`; Tau Ceti `TopPair.singularChainComplexFunctor`.

### 0.7 Čech cohomology on compact Hausdorff spaces

For a sheaf F of R-modules on X define Ȟ^•(X; F) as the colimit over open covers of the cohomology of the Čech complex, with refinements as transition maps, Ȟ^•_K(X; F) with supports in a compact K by replacing F(U) with the kernel of F(U) → F(U∖K), and Ȟ^•_c(X; F) as the colimit over K (Pardon, Definition A.4.3, p. 119). On a fixed cover use Mathlib's `CategoryTheory.cechComplexFunctor`; orient each Čech simplex through its orientation line, so that the differential is defined without a vertex order. For a complex of K-presheaves on compact X define Ȟ^• as the colimit over finite compact covers of the total Čech complex (Pardon, Definition A.4.10, p. 121). Define pullback along a continuous map, and along a proper map for compact supports (Pardon, Definitions A.4.6, p. 120, and A.4.21, p. 124).

- Different refinement maps between two covers induce the same map on Čech cohomology (Pardon, Remark A.4.1, p. 119).
- On compact X, finite open covers compute Ȟ^• and Ȟ^•_c = Ȟ^• (Pardon, Lemmas A.4.4–A.4.5, p. 120); for a sheaf, the open-cover and compact-cover definitions agree through the equivalence of §0.6 (Pardon, Lemma A.4.11, p. 122).
- A quasi-isomorphism of complexes of K-presheaves induces an isomorphism on Ȟ^•, and a bounded-below complex has the convergent Čech hypercohomology spectral sequence (Pardon, Lemmas A.4.12–A.4.13, p. 122).
- For a complex satisfying the first two homotopy K-sheaf axioms the map H^•F(X) → Ȟ^•(X; F) is an isomorphism, and for a K-presheaf satisfying the first two K-sheaf axioms F(X) → Ȟ^0(X; F) is an isomorphism (Pardon, Proposition A.4.14, p. 122; Lemma A.4.15, p. 123).
- For complexes satisfying the third homotopy K-sheaf axiom with homology vanishing in sufficiently negative degrees, a map that is a quasi-isomorphism on all stalks induces an isomorphism on Ȟ^•; for two such homotopy K-sheaves, a map is a quasi-isomorphism if and only if it is one on all stalks (Pardon, Proposition A.4.18 and Corollary A.4.19, p. 123).
- A sequence `0 → F → G → H → 0` of K-presheaves satisfying the third K-sheaf axiom and exact on stalks induces a long exact sequence on Ȟ^• (Pardon, Lemma A.4.20, p. 124).

**Checks.**

- For S¹ covered by two open arcs whose intersection has two components, the Čech complex with constant coefficients ℤ is `ℤ² → ℤ²`, (a, b) ↦ (b − a, b − a), so Ȟ^0 = ℤ and Ȟ^1 = ℤ; the one-set cover {S¹} gives Ȟ^1 = 0, so a definition by one fixed cover rather than the colimit is wrong.
- For the Warsaw circle W, Ȟ^1(W; ℤ) = ℤ while singular H^1(W; ℤ) = 0 (W is path connected with trivial singular homology in positive degrees); a definition by singular cochains would lose the class that Layer 4 pairs against.
- For X = ∅ the empty cover is final and Ȟ^•(∅; F) = 0 (Pardon, Remark A.4.2, p. 119), in agreement with the Layer 4 class of the empty atlas.

*Needs:* §0.6; Mathlib `CategoryTheory.cechComplexFunctor`, `TopCat.Sheaf.pullback`.

### 0.8 Pure homotopy K-sheaves

Call a homotopy K-sheaf F pure if its stalk cohomology H^i(F_p) vanishes for i ≠ 0 and every p, and if every point has an open neighbourhood U and an integer N with H^i F(K) = 0 for all compact K ⊆ U and i ≤ N (Pardon, Definition A.5.1, p. 124).

- A pure homotopy K-sheaf has H^i F = 0 for all i < 0, and H^0 F is a K-sheaf (Pardon, Lemma A.5.3, p. 124).
- For a pure homotopy K-sheaf on compact X there is a canonical isomorphism `H^•F(X) ≅ Ȟ^•(X; H^0 F)`; for a finite sequence of pure homotopy K-sheaves with adjacent composites zero, the cohomology of the total complex of global sections is the Čech hypercohomology of the corresponding sequence of H^0 sheaves, each shifted by its position (Pardon, Proposition A.5.4, pp. 124–125).
- If X = U ∪ Z with U open and Z closed and the restrictions of a homotopy K-sheaf to U and to Z are pure, then it is pure (Pardon, Lemma A.5.5, p. 125).

**Checks.**

- On X = [0, 1] ⊆ ℝ, F(K) = C_(1−•)(ℝ, ℝ∖K) is pure with stalks ℤ in degree 0, and H^•F(X) = H_(1−•)(ℝ, ℝ∖[0, 1]) is ℤ in degree 0, matching Ȟ^0([0, 1]; o_ℝ) = ℤ and Ȟ^(q>0) = 0.
- The constant K-sheaf ℤ placed in degree 1 has stalk cohomology in degree 1 and is not pure; the purity formula would predict H^1 = Ȟ^1(X; 0) = 0, whereas on X a point its global sections have H^1 = ℤ.
- On a finite discrete X with n points, a pure F has H^0 F(X) equal to the direct sum of the n stalk cohomologies and H^(q≠0) F(X) = 0, since Ȟ^(q>0) of a finite discrete space vanishes.

*Needs:* §0.6, §0.7.

### 0.9 Extension by zero, finite fibers and finite quotients

For an open inclusion j : U → X define j_! F as the subsheaf of j_* F of sections vanishing near X∖U, and use Mathlib's `TopCat.Sheaf.pullback` for f^* (Pardon, Definition A.3.5, p. 119). Define support enlargement Ȟ^•_K → Ȟ^•_(K') for compact K ⊆ K'.

- For an open inclusion j : U → X there is a natural isomorphism `Ȟ^•_c(U; F) ≅ Ȟ^•_c(X; j_! F)` (Pardon, Lemma A.4.7, p. 120).
- For a proper map f with finite fibers, pullback `Ȟ^•(Y; f_* F) → Ȟ^•(X; F)` and its compactly supported version are isomorphisms (Pardon, Lemma A.4.8, p. 121).
- For a finite group Γ acting on X, not necessarily freely or effectively, with quotient π : X → X/Γ, and a sheaf F of modules over R with |Γ| invertible in R, the maps `Ȟ^•(X/Γ; F) → Ȟ^•(X/Γ; (π_* π^* F)^Γ) → Ȟ^•(X/Γ; π_* π^* F)^Γ → Ȟ^•(X; π^* F)^Γ` are isomorphisms, and likewise with compact supports (Pardon, Lemma A.4.9, p. 121).

**Checks.**

- For j : (0, 1) → [0, 1], Ȟ^•([0, 1]; j_! ℤ) = Ȟ^•_c((0, 1); ℤ) is ℤ in degree 1 and zero otherwise, while Ȟ^•([0, 1]; j_* ℤ) is ℤ in degree 0: j_! and j_* are not interchangeable.
- For ℤ/2 acting on S¹ by the reflection (x, y) ↦ (x, −y), the quotient is an interval with Ȟ^1 = 0, and the reflection acts on Ȟ^1(S¹; ℚ) = ℚ by −1, so the invariants are 0; for the antipodal action the quotient is a circle and the invariants are ℚ.
- Over ℤ, where 2 is not invertible, the antipodal double cover S¹ → S¹ pulls Ȟ^1(S¹; ℤ) = ℤ back by multiplication by 2 onto the invariants ℤ, with cokernel ℤ/2: the invertibility hypothesis is needed.

*Needs:* §0.7; §0.3; Mathlib `TopCat.Sheaf.pushforward`, `TopCat.Sheaf.pullback`.

### 0.10 Local orientations and closed-subset duality

For a topological manifold M of dimension n, with no second countability or paracompactness assumed (Pardon, Convention A.6.1, p. 125), define the orientation sheaf o_M as the sheaf whose K-sections are H_n(M, M∖K), of parity n (Pardon, Definition A.6.2, p. 126). For M with boundary, inclusion j of the interior and i of the boundary, define `o_M = j_* o_(M∖∂M)` and `o_(M rel∂) = j_! o_(M∖∂M)`.

- o_M and o_(M rel∂) on the interior are locally isomorphic to the constant sheaf ℤ, and `0 → o_(M rel∂) → o_M → i_* o_(∂M) → 0`, whose last map is the boundary map of the pair (M, ∂M), is exact on stalks (Pardon, Definition A.6.2, p. 126).
- For compact K ⊆ M, H_q(M, M∖K) = 0 for q > n, uniformly in K. Route: Mayer–Vietoris induction over compact convex pieces of charts (Hatcher, Lemma 3.27(b), p. 236) with the half-space model added, where H∖K is contractible for a compact convex K meeting the boundary hyperplane.
- For a closed subset i : Z → M and a closed tamely embedded codimension-0 submanifold with boundary N ⊆ ∂M, with j : M° ∪ N° → M, there is a canonical isomorphism `H^•[C_(n−1−•)(N, N∖Z) → C_(n−•)(M, M∖Z)] ≅ Ȟ^•_c(Z; i^* j_! j^* o_M)`, and for N = ∅ `H_(n−•)(M, M∖Z) ≅ Ȟ^•_c(Z; i^* o_(M rel∂))` (Pardon, Lemma A.6.4, p. 127). The route is §0.6 Lemma A.6.3, purity (§0.8) on the one-point compactification of Z and §0.9.

**Checks.**

- For M = ℝ and Z = {0}: H_(1−q)(ℝ, ℝ∖0) is ℤ at q = 0, and Ȟ^0_c(point; ℤ) = ℤ; for Z = ℝ: H_(1−q)(ℝ) is ℤ at q = 1, and Ȟ^1_c(ℝ; ℤ) = ℤ.
- For M = Z = [0, ∞) and N = ∅: H_(1−q)([0, ∞)) is ℤ at q = 1 and Ȟ^1_c([0, ∞); o_(M rel∂)) = Ȟ^1_c((0, ∞); ℤ) = ℤ, whereas Ȟ^•_c([0, ∞); o_M) = 0 in every degree: o_M in place of o_(M rel∂) is wrong.
- For M = [0, ∞) and K = {0}: H_q(M, M∖0) = 0 for all q, so the boundary stalk of o_M is not the absolute local homology there; the stalk ℤ of o_M at 0 comes from j_*.

*Needs:* §0.6, §0.8, §0.9; AlgebraicTopology Stage 2.

### 0.11 Finite interval diagrams and pure gluing

For a finite poset S define an interval diagram as complexes A_(s,t) for s ≤ t with compatible maps A_(s,t) → A_(s',t') for s ≤ s' ≤ t' ≤ t (Pardon, Definition A.7.1, p. 128), and its total as `⊕_(p≥0) ⊕_(s₀<…<s_p) A_(s₀,s_p)^(•+p)` with differential the internal one plus the alternating sum of the maps deleting one s_i (Pardon, Definition A.7.2, p. 128), each flag weighted by the orientation line of its simplex and normalized by §0.5. For posets S and T define the product total map from the tensor product of the totals to the total of the tensor diagram over S × T through the simplicial subdivision of the product of nerves (Pardon, Definition A.7.5, p. 128).

- If S has a unique maximal element s_top and every map A_(s,t) → A_(s,t') is a quasi-isomorphism, then A_(s_top,s_top) → total is a quasi-isomorphism (Pardon, Lemma A.7.3, p. 128).
- A compatible family of quasi-isomorphisms of interval diagrams induces a quasi-isomorphism of totals (Pardon, Lemma A.7.4, p. 128).
- The product total map is a quasi-isomorphism, by the subdivision of the product of nerves (Pardon, Definition A.7.5 and footnote 46, p. 128).
- The total of an interval diagram of homotopy K-sheaves is a homotopy K-sheaf (Pardon, Lemma A.8.1, p. 129).
- Pure gluing: for a finite set A, an open cover {U_I} of X indexed by subsets of A with U_I ∩ U_K ⊆ U_J for I ⊆ J ⊆ K and U_I ∩ U_I' ⊆ U_(I∪I'), a sheaf G, and an interval diagram of pure homotopy K-sheaves F_IJ over the subsets of A with compatible isomorphisms `(j_IJ)_! (j_IJ)^* G ≅ H^0 F_IJ`, where j_IJ is the inclusion of U_I ∩ U_J, the total is pure with a canonical isomorphism G ≅ H^0 (Pardon, Lemma A.8.2, p. 129).

**Checks.**

- For S = {0 < 1} with A_00 = A_11 = A_01 = ℚ and identity maps, the total is `ℚ → ℚ ⊕ ℚ`, x ↦ (−x, x) in the deletion order (delete s₀ with sign +, s₁ with sign −), with cohomology ℚ in degree 0, as the terminal-object statement requires.
- For the same S with zero maps, the cohomology is ℚ² in degree 0 and ℚ in degree −1, so the quasi-isomorphism hypothesis of the terminal-object statement cannot be dropped.
- For A = ∅ the cover is the single set U_∅ = X, the total is F_∅∅ and pure gluing reduces to G ≅ H^0 F_∅∅.

*Needs:* §0.5, §0.6, §0.8, §0.9; DGAInfinity Layer 0.

### Examples

The orientation line of ℝ with its reflection, the swap of two odd lines, the 𝔽₂ failure of exact invariants, and the parity of a negative virtual dimension are the sign witnesses that every later layer reuses.

### Dependencies

AlgebraicTopology Stages 2 and 6; DGAInfinity Layer 0; Mathlib and Tau Ceti as listed.

## Layer 1: Topological implicit atlases (V1)

### 1.1 Implicit atlases

Define an implicit atlas of virtual dimension d ∈ ℤ on a compact Hausdorff space X, indexed by A (Pardon, Definition 3.1.1, pp. 31–32). For every α ∈ A give a finite group Γ_α and a finite-dimensional real representation E_α. For every finite I ⊆ A give a Hausdorff Γ_I-space X_I, an identification X_∅ ≅ X, continuous Γ_α-equivariant functions s_α : X_I → E_α for α ∈ I (other factors acting trivially on E_α), and a Γ_I-invariant open regular locus X_I^reg. Write s_J on X_K for the tuple of components when J ⊆ K. The regular locus is part of the data; X_I outside it need not be a manifold. For I ⊆ J give a Γ_I-invariant open U_IJ ⊆ X_I and a Γ_J-equivariant continuous map

`ψ_IJ : Z_IJ = {x ∈ X_J : s_(J∖I)(x) = 0} → U_IJ`,

where Γ_J acts on U_IJ through Γ_J → Γ_I, retaining the source subtype, its inclusion into X_J and its map into X_I in compositions. Require:

- ψ_II = id; for I ⊆ J ⊆ K, ψ_IJ ∘ ψ_JK = ψ_IK on the common zero-fiber domain, with the domain identifications proved.
- s_I ∘ ψ_IJ = s_I on Z_IJ.
- U_IJ₁ ∩ U_IJ₂ = U_I,(J₁∪J₂) and U_II = X_I.
- ψ_IJ⁻¹(U_IK) = U_JK ∩ Z_IJ for I ⊆ J ⊆ K, as subsets of X_J.
- ψ_IJ induces a homeomorphism Z_IJ/Γ_(J∖I) ≅ U_IJ; outside the regular locus the quotient need not be free.
- ψ_IJ⁻¹(X_I^reg) ⊆ X_J^reg, and Γ_(J∖I) acts freely on that preimage.
- Over ψ_IJ⁻¹(X_I^reg) the map s_(J∖I) : X_J → E_(J∖I) is locally a topological product projection: after identifying E_(J∖I) with ℝ^(m_(J∖I)) there are neighborhoods and homeomorphisms in which it is (u, v) ↦ v with u in an open subset of ℝ^(d+m_I).
- The regular footprints `V_I = ψ_∅I({x ∈ X_I^reg : s_I(x) = 0})` cover X over all finite I.

API:

- The footprints V_I are open, by the quotient and regular-locus axioms.
- A nonempty regular coordinate neighborhood in X_I has a natural dimension n with (n : ℤ) = d + m_I; if d + m_I < 0 then X_I^reg is empty, while X_I and X need not be.
- For I = J the product model recovers regular manifold charts of dimension d + m_I, and coordinate changes preserve the topological local orientation system through the identifications of normal directions with E_(J∖I).

**Checks.**

- With A = ∅ and X a compact topological d-manifold, X_∅^reg = X is an atlas with no charts, and V_∅ = X covers.
- With X = {0}, d = 0, X_α = E_α = ℝ, trivial Γ_α, s_α(x) = xⁿ, X_∅^reg = ∅ and X_α^reg = ℝ: Z_∅α = {0} ≅ X, V_α = {0} = X, and the freeness and product conditions over the empty preimage hold vacuously (Pardon, Example 2.3.2, p. 20).
- With d = −2 and m_α = 1, the equation n = −1 has no natural solution, so X_α^reg = ∅ and X ≠ ∅ admits no atlas with index set {α}; with d = −1 and m_α = 1, n = 0 is allowed, and X = X_α = {pt}, E_α = ℝ, s_α = 0, X_∅^reg = ∅, X_α^reg = X_α is an atlas on a nonempty space of negative virtual dimension.
- With X = X_α = {pt}, d = 0, E_α = 0 and Γ_α = ℤ/2 acting trivially, X_∅^reg = ∅ gives an atlas (the ineffective point of §4.3), but X_∅^reg = X violates freeness of Γ_α on ψ_∅α⁻¹(X_∅^reg).
- The reflection atlas: X = {0}, d = 0, X_α = E_α = ℝ, s_α(x) = x², Γ_α = ℤ/2 acting on X_α by x ↦ −x and trivially on E_α, X_∅^reg = ∅, X_α^reg = ℝ. Every axiom holds (Z_∅α/Γ_α = {0} = X; V_α = X). This atlas is not locally orientable (§3.1).

*Needs:* Mathlib `TopCat`, `Representation`, `EuclideanSpace`; §0.1.

### 1.2 Boundary atlases

Define an implicit atlas with boundary on (X, ∂X), ∂X closed (Pardon, Definition 3.2.1, p. 33): Γ_I-invariant closed subsets ∂X_I, identified with ∂X at I = ∅, with ψ_IJ⁻¹(∂X_I) = Z_IJ ∩ ∂X_J; the first factor of the local product model may be a half-space of dimension d + m_I, with ∂X_J^reg the boundary in that model. Define the restriction to the boundary, of dimension d − 1 with the same groups and obstruction representations (Pardon, Definition 3.2.3, p. 33), and prove every restricted axiom. Products with corner faces are handled by the cell-like stratified version of Layer 6, not by a smooth-corners assumption.

- The boundary restriction is an implicit atlas of dimension d − 1 on ∂X.
- Regular charts of dimension 0 have empty boundary.

**Checks.**

- X = [0, 1], d = 1, ∂X = {0, 1}, A = ∅: the boundary restriction is the manifold atlas of dimension 0 on two points.
- X = [0, 1] with ∂X = ∅ specified is not a boundaryless atlas, since no open subset of ℝ¹ models a neighborhood of 0 in [0, 1]; the specified boundary is required data, not the topological frontier of X in itself, which is empty.
- A regular chart of dimension 0 has empty boundary, so an atlas of dimension d = 0 with all m_I = 0 has ∂X = ∅.

*Needs:* §1.1.

### 1.3 Smooth enhancement

Define a smooth enhancement of an implicit atlas (Pardon, Definition 3.1.3, p. 32): smooth structures on every X_I^reg, smooth group actions and s_I there, smooth extra-obstruction submersions over ψ_IJ⁻¹(X_I^reg), and footprint maps that are local diffeomorphisms on ψ_IJ⁻¹(X_I^reg) ∩ {s_(J∖I) = 0}. No smooth structure on all of X_I is imposed, and forgetting the enhancement returns the topological atlas. Every result through Layer 6 uses only the topological atlas.

- Forgetting a smooth enhancement is the identity on topological data.
- A smooth enhancement induces the topological product models of §1.1 by the submersion theorem.

**Checks.**

- s_α(x) = xⁿ on X_α = ℝ with the standard smooth structure is a smooth enhancement of the atlas of §1.1 Example 2.3.2.
- s_α(x) = x^(1/3) on ℝ with X_α^reg = ℝ is a topological atlas; it is not smooth for the standard structure at 0, but it is smooth for the structure pulled back along x ↦ x³, so the enhancement is data, not a property of the topological atlas.
- With A = ∅ and X a compact smooth manifold the enhancement is the smooth structure of X, and two exotic smooth structures on one topological manifold give two enhancements of one topological atlas.

*Needs:* §1.1.

### 1.4 Subatlases, restrictions and reindexing

Restrict an atlas to a subset of A when the restricted footprints still cover X. Compactness supplies a finite subatlas: finitely many V_I cover, and the union of their index sets is finite. Construct empty-base, injective relabelling and disjoint-copy adapters with their group and obstruction identifications. Reindexing along noninjective maps of index sets needs the finite-sets-over-A variant with repeated indices (Pardon, Remark 3.1.5, pp. 32–33); construct its data and coherence before using such a map.

- Every implicit atlas on compact X has a finite subatlas.
- Injective relabelling preserves every axiom and composes.

**Checks.**

- The manifold atlas restricted to ∅ remains an atlas because X_∅^reg = X.
- The atlas of Example 2.3.2 restricted to ∅ is not an atlas: V_∅ = ∅ does not cover X = {0}.
- Sending two indices α, β to one index γ needs X_(γ,γ)-type data with repeated indices; the finite-subset definition supplies none, so this reindexing is not available.

*Needs:* §1.1.

### Examples

The manifold atlas, the single-chart atlases s(x) = xⁿ on ℝ and s(z) = zⁿ on ℂ, the ineffective ℤ/2 point, and the reflection atlas s(x) = x² of §1.1 are the test inputs for every later layer.

### Dependencies

Layer 0; Mathlib `TopCat`, `Representation`, `EuclideanSpace`.

## Layer 2: Deformation spaces and virtual cochain complexes (V2)

### 2.1 Deformation spaces

Fix a finite subatlas B. For I ⊆ J ⊆ B define the deformation space D_(I,J,B) of triples (e, t, x) with e ∈ E_B, t ∈ ℝ^B_≥0 and x ∈ X_J^reg such that t_α = 0 for α ∈ B∖I, s_α(x) = t_α e_α for α ∈ J, and ψ_TJ(x) ∈ X_T^reg for T = {α ∈ B : t_α > 0} ⊆ I (Pardon, Definition 4.2.1, p. 35). The equations force s_(J∖T)(x) = 0, so ψ_TJ(x) is defined. Give D the subspace topology and the Γ_B action. The physical boundary piece ∂ₓD is x ∈ ∂X_J^reg. For a closed K ⊆ X let Z_K ⊆ D be e = 0 and ψ_∅J(x) ∈ K. Work with the relative pair (D, D∖Z_K), not with chains on K. Construct the maps

`D_(I,J,B) × E_(B'∖B) → D_(I',J',B')`

for I ⊆ I' ⊆ J' ⊆ J ⊆ B ⊆ B', with new t-coordinates zero, the evident obstruction coordinates and x ↦ ψ_J'J(x).

- Z_K is closed in D; it need not be compact or locally contractible.
- These maps respect equations, regular loci, group actions, support pairs and composition; their B = B' case gives the interval arrows of §2.3, and B ⊆ B' gives the subatlas comparison of §4.3.
- D is a topological manifold with boundary and corners of dimension d + m_B + |I|; the faces t_α = 0 and ∂ₓD form its boundary, and ∂ₓD is a closed tame codimension-0 boundary piece. At a two-face corner use a quadrant-to-half-plane homeomorphism that records which ray is the physical face.
- The orientation line of D is identified, in this order, with `o_(X_J^reg) ⊗ o_(E_B) ⊗ o_(E_J)^∨ ⊗ o_ℝ^(⊗I)`, with every permutation and normal-boundary sign computed from the local product charts.

**Checks.**

- For B = I = J = ∅: D = X_∅^reg and Z_K = K ∩ X_∅^reg.
- For B = I = J = {α}, X_α = ℝ, s_α(x) = x, trivial Γ_α, d = 0: D = {(e, t, x) : x = t e, t ≥ 0} ≅ ℝ × ℝ_≥0 by (e, t), of dimension 0 + 1 + 1 = 2, and Z_X = {(0, t, 0) : t ≥ 0} is a closed noncompact half-line.
- For B = J = {α}, I = ∅ and X_∅^reg = ∅: the condition ψ_∅α(x) ∈ X_∅^reg is never satisfied, so D_(∅,α,α) = ∅.

*Needs:* §1.1, §1.2; §0.10 for the tame-pair statements.

### 2.2 Partial virtual complexes

For q ∈ ℤ define the relative partial complex (Pardon, Definition 4.2.5, p. 36)

`R_IJ(K)^q = C_(d+m_B−q)(D_(I,J,B), D_(I,J,B)∖Z_K; o_(E_B)^∨)^(Γ_B)`.

Let N_IJ(K)^q use ∂ₓD with homological index d + m_B − 1 − q and support Z_K ∩ ∂ₓD, and define the absolute partial complex as the cone with q-th term R_IJ(K)^q ⊕ N_IJ(K)^q and differential (b, a) ↦ (∂b + i_*a, −∂a). Compare it with the native cochain cone of the boundary chain map, including the shift-differential correction and the normal orientation line. For K ⊆ L the pair inclusion gives R_IJ(L) → R_IJ(K), making these complexes of K-presheaves.

- K ↦ R_IJ(K) and the absolute cone are complexes of K-presheaves, with the restriction (4.2.6) from the relative to the absolute complex.
- The interval arrow (I, J) → (I', J') for I ⊆ I' ⊆ J' ⊆ J is the induced chain map multiplied by `|Γ_(J∖J')|⁻¹` (Pardon, Definition 4.2.6, p. 36); identities and composites are strict.
- The boundary atlas's complex has virtual dimension d − 1, and its comparison with the native shift includes the shift sign and the normal line.

**Checks.**

- For B = ∅ and a compact d-manifold X: R_∅∅(K)^q = C_(d−q)(X, X∖K), and for K a point of the interior H^0 = ℤ and H^q = 0 for q ≠ 0.
- For the chart s_α(x) = x of §2.1: D∖Z_X has the two contractible components e > 0 and e < 0 and D is contractible, so H_1(D, D∖Z_X) = ℤ and H_2 = 0; with index 1 − q this is H^0 = ℤ and H^q = 0 otherwise.
- An interval arrow with |Γ_(J∖J')| = 2 carries weight 1/2, and the weights multiply along composites because |Γ_(J∖J')| · |Γ_(J'∖I)| = |Γ_(J∖I)|; a uniform weight w = 1/|Γ_B| ≠ 1 on every arrow is not compatible with composition, since a composite of two arrows would carry w² while the direct arrow carries w.

*Needs:* §2.1; §0.3, §0.4; Tau Ceti `TopPair.twistedChainComplex`.

### 2.3 The virtual cochain complex

Apply the finite interval/flag total of §0.11 on the poset of subsets of B to obtain C_vir(K; B) and C_vir(K rel∂; B) (Pardon, Definition 4.2.6, p. 36, with the homotopy colimit of Definition A.7.2, p. 128). Preserve the deletion and super-to-native sign conventions, endpoint maps and finite filtrations. Define H_vir by native cohomology. The notation C_vir(K; B) at a proper compact K ⊆ X does not assert that B is an atlas on K. For every comparison B ⊆ B' and every product map, state the reindexed shuffle chain map conjugated by the §0.5 sign `(−1)^(τ r)` with the actual degree r, and prove the squares with the inclusion of the smaller atlas and its support maps commute. The induced map on H^0 of a finite quotient is the plain pullback, as in Pardon, Lemma A.4.9, p. 121; the normalization sits on the chain arrows only.

- C_vir(−; B) and C_vir(− rel∂; B) are complexes of K-presheaves, with restriction, coefficient change, finite sums, cones and homotopies.
- There is no ordinary-colimit replacement for the flag total: the flag total is a finite direct sum with flag length p in cochain degree −p and parity p.

**Checks.**

- For B = ∅: C_vir(K rel∂; ∅) = C_(d−•)(X, X∖K) (Pardon, equation (5.2.4), p. 43).
- For B = {α}: the pairs I ⊆ J ⊆ B are (∅, ∅), (∅, α), (α, α), and the flags of subsets are ∅, {α} and ∅ ≺ {α}; the flag total is the (∅, ∅) and (α, α) complexes in flag length 0 plus the (∅, α) complex in flag length 1, shifted to cochain degree −1, glued by the arrows (∅, α) → (∅, ∅) and (∅, α) → (α, α) (Pardon, Definition A.7.2, p. 128). A total that also placed the (∅, α) complex in flag length 0 would have Euler characteristic changed by twice that complex's.
- For X = ∅ every deformation space is empty and C_vir(X; B) = 0.

*Needs:* §2.2; §0.5; §0.11; Mathlib `CochainComplex.shiftFunctor`.

### Examples

The single chart s(x) = x on ℝ gives a deformation half-plane whose relative homology is ℤ in the degree corresponding to q = 0; for s(x) = x² with trivial group, D = {x² = t e} has the same Z, and the complex is built identically.

### Dependencies

Layers 0 and 1; Tau Ceti `TopPair.twistedChainComplex`.

## Layer 3: Orientation sheaf, partial purity and global Čech comparison (V3)

### 3.1 Local orientability and the virtual orientation sheaf

Define an atlas to be locally orientable when for every finite I and every regular zero x ∈ X_I^reg ∩ s_I⁻¹(0), the stabilizer (Γ_I)_x acts trivially on `(o_(X_I^reg))_x ⊗ o_(E_I)^∨` (Pardon, Definition 4.1.2, p. 34). This action is always by a sign, and the condition does not depend on R. For a locally orientable atlas construct the rank-one locally constant virtual orientation sheaf o_(X,A) on X with Γ_I-equivariant identifications `ψ_∅I^* o_(X,A) ≅ o_(X_I^reg) ⊗ o_(E_I)^∨` over the regular zero set, compatible with ψ_IJ (Pardon, Definition 4.1.3, p. 35). Set o_(X rel∂) = j_! j^* o_X for the interior inclusion j : X∖∂X → X, and construct the boundary normal-line identification and its parity.

- For a locally orientable atlas, o_(X,A) exists and is unique up to unique isomorphism compatible with the identifications; it commutes with coefficient extension and with restriction to subatlases and open shrinkings.
- Its independent parity is d. A global orientation is a trivialization of o_X, which local orientability does not supply.
- Local orientability is preserved by subatlases, chart shrinkings and disjoint unions (Pardon, Lemma 5.2.3, p. 42), and by restriction to the boundary, because the stabilizer of a boundary point preserves the inward side of a half-space model and so acts trivially on the normal line.
- Without local orientability no rank-one sheaf with these identifications exists, and nothing below replaces it by the invariant subsheaf.

**Checks.**

- The reflection atlas of §1.1 (s(x) = x², Γ = ℤ/2 reflecting X_α = ℝ, trivial on E_α = ℝ) is not locally orientable: at 0 the stabilizer acts on `o_ℝ ⊗ o_ℝ^∨` by (−1)(+1) = −1. An identification with a pulled-back line would identify the trivial representation of (Γ)_0 on ℚ with the sign representation, whose invariants have dimensions 1 and 0.
- With Γ acting trivially on X_α instead, the stabilizer acts by +1, and with Γ reflecting both X_α and E_α and s(x) = x it acts by (−1)(−1) = +1; both atlases are locally orientable.
- For the manifold atlas on the real projective plane (A = ∅), o_X is the nontrivial orientation local system: the atlas is locally orientable without a global orientation.
- At a boundary point of X = [0, 1] the stalk of o_(X rel∂) = j_! j^* o_X is 0, whereas `j_*` would give ℤ.

*Needs:* §0.2, §0.10, §1.1, §1.2.

### 3.2 Partial purity

Prove that the relative and absolute partial complexes are homotopy K-sheaves, using open-complement Mayer–Vietoris, closed-support continuity by compact simplex images, finite-group exactness and the cone stability of §0.6. Prove the weak local lower bound q ≤ −|I| − 2 for the displayed reindexing from the manifold bound of §0.10 in ambient dimension d + m_B + |I|; the finite poset and flag length give a uniform bound before purity is applied, and the bound is not derived from the duality theorem it serves. For a locally orientable atlas, apply the closed-subset duality of §0.10 to D and ∂ₓD, reduce through compactly supported cohomology in the |I| positive deformation directions and their fundamental generator, and then through the finite quotient descent of §0.9 on ψ_∅J, to obtain for j_IJ : V_I ∩ V_J → X

`H^0(R_IJ) = (j_IJ! j_IJ^* o_(X rel∂))^K`, and `H^0 = (j_IJ! j_IJ^* o_X)^K` for the absolute cone, where `(−)^K` is the K-sheaf of §0.6,

with vanishing higher singleton cohomology (Pardon, Lemma 4.3.1, pp. 37–38; Lemma 4.3.2, p. 38). Construct the suspension isomorphism `H_c^(q+k)(Y × ℝ^k; p⁻¹F ⊗ o_ℝ^(⊗k)) ≅ H_c^q(Y; F)` for every locally compact Hausdorff Y and sheaf F: for k = 1 compactify Y to Y⁺, use the pair `(Y⁺ × [−1, 1], (Y⁺ × {−1, 1}) ∪ ({∞} × [−1, 1]))`, the interval comparison of pulled-back sheaves and the relative long exact sequence, and iterate over the ordered factors.

- The partial complexes are homotopy K-sheaves for every finite atlas, with the uniform lower bound.
- For a locally orientable atlas they are pure, with the displayed H^0, and the identifications commute with the weighted interval arrows by a local generator calculation (Pardon, proof of Proposition 4.3.3, p. 38).
- The suspension isomorphism is natural in Y and F and sends the ordered orientation generator to 1.

**Checks.**

- For the chart s_α(x) = x of §2.1, H^0(R_αα) = ℤ = o_X at the point X, matching §2.2.
- For K disjoint from V_I ∩ V_J, H^0(R_IJ)(K) = 0.
- For Y = pt and k = 1: H_c^1(ℝ) = ℤ and H_c^0(ℝ) = 0, so the suspension shifts degree by exactly 1.

*Needs:* §2.2, §3.1; §0.6, §0.9, §0.10; AlgebraicTopology Stage 3.

### 3.3 Footprint conditions

Derive from the atlas axioms that V_I ∩ V_K ⊆ V_J for I ⊆ J ⊆ K and V_I ∩ V_J ⊆ V_(I∪J) (Pardon, proof of Proposition 4.3.3, p. 38).

- Both inclusions hold for every implicit atlas.

**Checks.**

- For the manifold atlas only I = ∅ occurs and both inclusions are equalities.
- Add to the manifold atlas one chart α with X_α = X × ℝ, s_α the projection to ℝ, trivial Γ_α and U_∅α = X: then V_∅ = V_α = X, and the inclusions read X ⊆ X.
- In the same atlas with X_∅^reg = ∅ instead, V_∅ = ∅ and V_α = X, so V_∅ ∩ V_α = ∅ ⊊ V_α: the first inclusion is strict, and a definition demanding equality would reject a valid atlas.

*Needs:* §1.1.

### 3.4 Global purity and the Čech comparison

For a finite locally orientable atlas apply the pure gluing of §0.11 to the weighted interval diagram over the open cover {V_I} to obtain pure global K-complexes with H^0 equal to o_X and o_(X rel∂), and the canonical isomorphisms (Pardon, Proposition 4.3.3, p. 38; Theorem 4.3.4, p. 39)

`H_vir^q(X; B) ≅ Čech^q(X; o_X)`, `H_vir^q(X rel∂; B) ≅ Čech^q(X; o_(X rel∂))`.

For I = J construct the local comparison from E_(B∖I) × X_I^reg with its support pairs and show it gives the same generator and duality map; this diagonal calculation controls the finite-subatlas and boundary comparisons.

- The comparisons are natural for the diagram maps and compatible with the partial comparisons of §3.2.
- They commute with coefficient extension and with the subatlas maps of §4.3.

**Checks.**

- For the manifold atlas on a compact d-manifold, `H_vir^q(X; ∅) = H_(d−q)(X)` and the comparison is Poincaré duality with `Čech^q(X; o_X)`.
- For X = {0} with s(x) = x on ℝ: H_vir^0 = ℚ = Čech^0(pt; ℚ) and all other groups vanish.
- For the reflection atlas of §1.1 the comparison is not asserted: its rational H_vir^0 at the point is the invariant part of the sign representation, which is 0, while any rank-one coefficient sheaf on a point has Čech^0 = ℚ.

*Needs:* §3.1, §3.2, §3.3; §0.7, §0.8, §0.11.

### Examples

For the manifold atlas, Layer 3 recovers Poincaré duality with the orientation sheaf; for the single charts xⁿ and zⁿ it identifies H_vir with Čech cohomology of a point.

### Dependencies

Layers 0–2; AlgebraicTopology Stage 3.

## Layer 4: Global obstruction trace and the rational virtual class (V4)

### 4.1 The obstruction complex

Define `B_B^k = C_(m_B−k)(E_B, E_B∖0; o_(E_B)^∨)^(Γ_B)` with the singular boundary as differential (Pardon, Definition 4.2.4, p. 36). Prove H^0(B_B) ≅ R canonically by the ordered orientation pairing and H^k = 0 for k ≠ 0. The generator [E_B] is invariant even when Γ_B reverses the orientation of E_B, because the dual coefficient compensates; averaging is not its definition.

- H^•(B_B) is R in degree 0 with generator [E_B], including for B = ∅.
- For B ⊆ B', the product with [E_(B'∖B)] is compatible with the identifications of obstruction sums.

**Checks.**

- For B = ∅: B^0 = C_0(0, ∅) = R with generator the point.
- For E_B = ℝ with ℤ/2 acting by −1: the action on `H_1(ℝ, ℝ∖0)` is −1 and on `o_ℝ^∨` is −1, so the invariants are ℚ; without the dual twist the invariants would be 0.
- For E_B = ℝ² with ℤ/2 acting by −id the action is +1 on both factors, and H^0 = ℚ.

*Needs:* §0.2, §0.3, §0.4.

### 4.2 The global relative trace

Construct a chain map from the global relative virtual complex to `T_B^q = C_(d+m_B−q)(E_B, E_B∖0; o_(E_B)^∨)^(Γ_B)` (Pardon, equation (4.2.12), p. 36, defined on the global object only, footnote 17, p. 34). On the interval object (I, J) use the weighted obstruction pushforward `|Γ_J|⁻¹ · pr_e*`, and zero on positive flag lengths. Pardon's (4.2.12) takes the unweighted pushforward on the flag-length-0 part; with the arrows of §2.2 weighted by `|Γ_(J∖J')|⁻¹`, the unweighted family is not a cocone, and the weights here repair this: for J' ⊆ J the identity `|Γ_J'|⁻¹ · |Γ_(J∖J')|⁻¹ = |Γ_J|⁻¹` makes the weighted family compatible, which cancels the flag-boundary term. The pair map exists because Z_X = e⁻¹(0); for a proper K ⊆ X a point with e = 0 over X∖K lies outside Z_K but maps to 0, so there is no such map, and the absolute boundary cone has no trace either. Compare T_B with the native shift `B_B[−d]` by the degreewise sign `(−1)^(d(q−d))` on T_B^q, and construct the independent-parity change Π^d through §0.5.

- The weighted pushforward is a chain map from the global relative virtual complex to T_B.
- The reindexing comparison sends the degree-d generator to the degree-0 generator of B_B.
- No trace is defined on C_vir(K rel∂; B) for K ≠ X or on the absolute complex.

**Checks.**

- For one chart with Γ_α = ℤ/2 acting trivially on X_α = {pt} and E_α = 0, the weighted pushforward multiplies by 1/2; the unweighted map would give 1.
- For d = 1 and q = 2 the reindexing sign is (−1)^(1·1) = −1, and for q = d it is +1.
- For the chart s_α(x) = x on X = {0} and K = ∅: Z_∅ = ∅, so the pair is (D, D), and a map of pairs to (E_B, E_B∖0) would have to send D into E_B∖0; the points (0, t, 0) of D have e = 0, so no map of pairs exists.

*Needs:* §2.3, §4.1; §0.5.

### 4.3 The virtual class and finite-subatlas independence

For a locally orientable atlas with finite subatlas B, let κ_B : H_vir^d(X rel∂; B) ≅ Čech^d(X; o_(X rel∂)) be the comparison of §3.4, τ_B : H_vir^d(X rel∂; B) → H^0(B_B) the map induced by the trace and reindexing, and ε_B : H^0(B_B) ≅ ℚ the evaluation [E_B] ↦ 1. Define the virtual class as the functional `Φ_B = ε_B ∘ τ_B ∘ κ_B⁻¹ : Čech^d(X; o_(X rel∂)) → ℚ` (Pardon, Definition 5.1.1, p. 41). For B ⊆ B' construct the chain comparison

`C_vir(− rel∂; B) ⊗ B_(B'∖B) → C_vir(− rel∂; B')`

and its absolute version through the deformation-space maps, the shuffle map and the product total of §0.11 (Pardon, Definition 4.2.7, p. 37), with the same weights |Γ_(J∖J')|⁻¹ on the interval arrows. Prove compatibility with the Čech comparison and the trace before passing to cohomology, and identity, composition, finite union and reindexing laws.

- For finite subatlases B ⊆ B' of one locally orientable atlas, Φ_B = Φ_B'; hence Φ is independent of the finite subatlas, since any two lie in their union (Pardon, Definition 5.1.1 and Lemma 5.2.1, pp. 41–42).
- The class is a functional on cohomology; no canonical chain-level functional to ℚ is asserted, and an internal chain-level representative must come with its splitting and its independence up to homotopy.
- Scalar change on the chain diagrams is constructed; any cohomology-level scalar-extension isomorphism retains its flatness hypotheses.
- The empty space has class zero, and negative virtual dimension gives zero because negative Čech cohomology vanishes, also on a nonempty base.
- Independence compares subatlases of one atlas, not unrelated atlases on the same space.

**Checks.**

- For s(x) = xⁿ on ℝ (§1.1) the class is 1 for n odd and 0 for n even; for s(z) = zⁿ on ℂ it is n (Pardon, Example 2.3.2, p. 20). The three atlases have the same base {0}, so a theorem of independence of the atlas on a fixed zero set would be false.
- For the ineffective ℤ/2 point of §1.1 the class is 1/2 (Pardon, §2.3.3, p. 20); inserting a second factor 1/|Γ| into the quotient pullback on H^0 would give 1/4, and omitting the trace weight would give 1.
- For the atlas X = X_α = {pt}, d = −1, E_α = ℝ of §1.1 the class is the zero functional on Čech^(−1) = 0, although X ≠ ∅.

*Needs:* §3.4, §4.2; §0.11.

### Examples

For the manifold atlas the class is the fundamental class (§5.6); for zⁿ on ℂ the class is n, the local multiplicity of the zero.

### Dependencies

Layers 0–3.

## Layer 5: Boundary, refinement, pushforward and normalization (V5)

Throughout this layer atlases are locally orientable.

### 5.1 The boundary exact triangle

Construct the boundary-atlas/absolute/relative exact triangle of virtual complexes and its comparison with the Čech long exact sequence of `0 → o_(X rel∂) → o_X → i_* o_(∂X) → 0` (Pardon, Proposition 4.4.2, pp. 39–40). The last map is odd; its even form uses the normal line o_ℝ or the parity change Π, and the boundary complex is compared through the shifted cone and minus differential of §2.2. Use the local I = J calculation for the first two squares and the total-complex comparison of §0.8 (Proposition A.5.4 for finite sequences) for the connecting square.

- The two long exact sequences are isomorphic through the comparisons of §3.4, including the connecting square with its normal-line parity.

**Checks.**

- For the manifold atlas on X = [0, 1]: Čech^0(X; o_(X rel∂)) = 0, Čech^1(X; o_(X rel∂)) = ℚ, Čech^0(∂X) = ℚ², and the connecting map ℚ² → ℚ is (a, b) ↦ b − a with outward-first boundary orientation.
- For X with ∂X = ∅ the triangle degenerates to the identity of o_X.
- For the opposite (inward-first) normal convention the connecting map is (a, b) ↦ a − b; the convention is fixed by this value.

*Needs:* §3.4, §1.2; §0.8.

### 5.2 Boundary law and cobordism

Prove that the dual connecting map sends the class of X to the class of ∂X, with outward-first orientation, and that pushforward along ∂X → X annihilates the boundary class (Pardon, Lemmas 5.2.4 and 5.2.5, pp. 42–43). For an oriented compact cobordism W with ∂W identified with (−X₀) ⊔ X₁, compatible boundary atlas identifications or specified refinement witnesses, virtual dimension d + 1 and a continuous F : W → Y extending the endpoint maps, deduce that the pushed-forward degree-d functionals of X₀ and X₁ on Y agree. A cylinder concordance is an atlas on X × [0, 1] restricting to the two endpoint atlases; it is not inferred from a path of local section functions, and no transversality of an analytic parameter family is supplied.

- `δ^∨[X]^vir = [∂X]^vir` and `(∂X → X)_*[∂X]^vir = 0`.
- Compatible cobordisms and concordances give equal pushed-forward functionals.

**Checks.**

- For X = [0, 1]: [∂X] evaluates (a, b) ∈ Čech^0({0, 1}) to b − a, and its pushforward to a point is −1 + 1 = 0.
- For W = X × [0, 1] the two ends give the same class, and reversing the orientation of one end gives the negative.
- The family s_t(x) = x³ + t x, t ∈ [0, 1], on ℝ × [0, 1] has zero set {0} × [0, 1] and is a concordance from the atlas x³ to the atlas x³ + x, both of class 1; s(x) = x² and s(x) = x have classes 0 and 1, so no concordance joins them.

*Needs:* §5.1, §4.3.

### 5.3 Refinements, shrinkings and disjoint unions

Construct atlas isomorphisms and reindexings, subatlas inclusions that retain covering, and chart shrinkings by open X_I', U_IJ', X_I^reg' with every restricted axiom verified (Pardon, Lemmas 5.2.1–5.2.2, p. 42), and the disjoint union atlas (Pardon, Lemma 5.2.3, p. 42). Prove the resulting chain maps commute with the trace and orientation comparisons. A refinement is given by such embeddings, restrictions, isomorphisms or common refinements with their orientation comparisons; there is no independence from arbitrary atlas data on a fixed zero set.

- The class is invariant under isomorphisms, subatlases, shrinkings and finite zigzags of these through a common ambient atlas.
- `[X ⊔ Y]^vir = [X]^vir ⊕ [Y]^vir`.

**Checks.**

- Shrinking X_α = ℝ to (−1, 1) in Example 2.3.2 leaves the class unchanged (1 for odd n).
- Shrinking X_α to (1, 2) removes the zero, so the footprints no longer cover and the result is not an atlas.
- The disjoint union of two copies of the zⁿ atlas has class (n, n) on Čech^0 of two points.

*Needs:* §4.3, §1.4.

### 5.4 Pushforward

For every continuous f : X → Y construct dual pullback on Čech cohomology with a specified coefficient map `f⁻¹F → o_(X rel∂)`, or a relative-pair comparison, and prove identity, composition, finite disjoint union and naturality of the functional. In the oriented boundaryless rational case this gives f_*[X]^vir as a functional on Čech^d(Y; ℚ). The source is compact, so no properness hypothesis is hidden; this is pushforward of a functional, not a statement that f relates two atlases.

- f_* is functorial and additive on disjoint unions.

**Checks.**

- For X = S¹ (manifold atlas) and Y = pt, f_*[S¹] is a functional on Čech^1(pt) = 0, hence zero.
- For the zⁿ atlas and any f : {0} → Y, f_*[X](1) = n on Čech^0.
- For the identity map f_* is the identity on functionals.

*Needs:* §4.3; §0.7.

### 5.5 Finite-CW realization

For the oriented rational functional of §5.4, if Y is a finite CW complex, or is given a finite-CW homotopy comparison with its cohomology maps, and Y is paracompact Hausdorff under the hypotheses of CharacteristicClasses §C1.2b, combine the Čech/singular comparison, the finite-dimensional rational universal coefficient theorem and the evaluation pairing to realize the functional as a unique class in H_d(Y; ℚ). A general coefficient sheaf on Y needs its own local-coefficient comparison. Finite domination is not finite CW type, source singular homology is not identified with dual Čech cohomology on a wild compact X, and coarse orbifold comparisons supply no weighted Poincaré duality.

- The realization is unique and natural for maps of finite CW targets and homotopies.

**Checks.**

- For Y = pt the realization of the zⁿ class is n ∈ H_0(pt; ℚ).
- For the Warsaw circle W (compact, not CW), Čech^1(W; ℚ) = ℚ while singular H_1(W; ℚ) = 0; a functional on Čech^1 need not come from a singular class on W, and the realization is stated only on the target.
- For Y = S¹ and f : S¹ → S¹ of degree k, the realization of f_*[S¹] is k times the fundamental class.

*Needs:* §5.4; CharacteristicClasses §C1.2b; AlgebraicTopology Stage 6.

### 5.6 Regular-manifold normalization and the Euler comparison

If the empty-index regular footprint is all of X, replace the atlas by its empty subatlas and recover the pairing with the ordinary fundamental class, relative to the boundary where present, with its orientation coefficients (Pardon, Lemma 5.2.6, p. 43). Construct the zero-set atlas of a smooth finite-rank bundle section on a boundaryless smooth manifold with compact zero set from finite local obstruction maps and the surjective-linearization locus (Pardon, Definition 5.3.1, p. 44), and prove that its virtual class agrees with the compactly supported Euler/Thom pairing (Pardon, Proposition 5.3.4, p. 45, where o_X = o_B ⊗ o_E^∨ makes the atlas locally orientable). The comparison uses a transverse final section obtained from the original by a compactly supported perturbation and a compact-zero homotopy: choose finitely many frame sections with compactly supported cutoffs spanning each fiber near the zero set; the universal section over the coefficient space is transverse, Sard's theorem applied to its projection gives an arbitrarily small regular parameter, and the straight-line homotopy is supported in a fixed relatively compact neighborhood, so its zero locus is compact. In the boundary version a product collar is supplied on which the section is pulled back from its boundary restriction, that restriction is transverse, and perturbations are supported away from a smaller collar. Without boundary transversality no transverse final section fixed on the boundary is asserted. This construction uses its smooth bundle hypotheses and is not an input of the topological engine.

- If X_∅^reg = X, the class is the fundamental class of the compact manifold X.
- For a smooth section with compact zero set, the class of its zero-set atlas equals the compactly supported Euler pairing.

**Checks.**

- The section s(θ) = sin θ of the trivial line bundle on S¹ has zeros at 0 and π with local signs +1 and −1, and Euler number 0 = 1 − 1.
- For the tangent bundle of S² any transverse vector field has signed zero count 2.
- The section s(x) = x of the trivial line bundle on ℝ has compact zero set {0} and compactly supported Euler pairing 1; a compactly supported section is not transverse on the open set where it vanishes, which is why transversality is required of the final section only.

*Needs:* §4.3, §5.2, §5.3; CharacteristicClasses §C2 item 1.

### Examples

The interval [0, 1] tests the boundary triangle, the boundary law and its sign; the concordance x³ + t x tests cobordism invariance; sin θ on S¹ tests the Euler comparison.

### Dependencies

Layers 0–4; CharacteristicClasses §C1.2b and §C2; AlgebraicTopology Stage 6.

## Layer 6: Cell-like strata and products (V6)

### 6.1 Cell-like stratified atlases

Define an implicit atlas with boundary and cell-like stratification on (X, ∂X) → (S, ∂S), for a finite poset S with dim : S → ℤ and a downward-closed ∂S with inverse image ∂X (Pardon, Definitions 6.1.1–6.1.2, p. 47, and Definition 6.1.6, p. 48). For every finite I supply a Γ_I-invariant stratification (X_I, ∂X_I) → (S, ∂S) of the whole thickening, restricting to the given one on X_∅ ≅ X. Require the zero-fiber compatibility: for I ⊆ J the restriction of the stratification of X_J to Z_IJ is the pullback of that of X_I along ψ_IJ (Definition 6.1.6, axiom (i), p. 48). Over the regular locus require the stratification to be pulled back from a cell-like stratification of the first factor of every product model, for s ↦ dim(s) + m_I, with (M^≤s, M^<s) a manifold/boundary pair of dimension dim(s) + m_I; a negative dim(s) + m_I forces that regular closure to be empty. Retain every face incidence.

- The regular local-model condition does not imply the zero-fiber compatibility.
- The corner face poset of ℝ_≥0^k is cell-like (Pardon, Example 6.1.4, p. 47).

**Checks.**

- Take d = 0, trivial groups, one index α, X = {−1, +1}, X_α = E_α = ℝ, s_α(x) = x² − 1, X_∅^reg = ∅, X_α^reg = ℝ, and two incomparable strata a, b of dimension 0, one for each point of X. Stratifying all of X_α by a is cell-like on the regular locus, but no regular chart covers the base stratum b = {+1}. Under zero-fiber compatibility this atlas admits no stratification, since a lower semicontinuous map from the connected space ℝ to {a, b} is constant; replacing X_α by ℝ∖{0} with (−∞, 0) in a and (0, ∞) in b satisfies every axiom.
- The quadrant ℝ_≥0² stratified by its four faces is cell-like; collapsing the two edges into one codimension-1 stratum gives the closed stratum ({0} × ℝ_≥0) ∪ (ℝ_≥0 × {0}), homeomorphic to a line with the origin as an interior point, so that stratum and the origin do not form a manifold with its boundary and the stratification is not cell-like.
- The interval [0, 1] stratified by {0} < (0, 1) > {1}, with dimensions 0, 1, 0, is cell-like.

*Needs:* §1.1, §1.2.

### 6.2 Normal lines, local consequences and restricted atlases

Supply integral rank-one graded normal lines o_s, odd incidence maps for codimension 1, and Γ_I-equivariant sheaf isomorphisms `o_((X_I^reg)^≤s) ⊗ o_s ≅ o_(X_I^reg)` over (X_I^reg)^≤s, with Γ_I acting trivially on o_s, that commute with ψ_IJ on regular zero fibers and with the incidence square (Pardon, Definition 6.1.6 and diagram (6.1.1), p. 48). The parity of o_s is that of the normal dimension. From invariance of domain (AbelianSchemesAndArithmeticModuliPartII, §B2.9) derive the local consequences for nonempty strata (Pardon, Lemma 6.1.5, p. 47): dimension bounds, openness of top strata, one incident top side at a physical boundary face and two at an interior codimension-1 face. Construct the codimension-2 cancellation from these geometric normal maps. Construct the restricted atlases: on ∂X → ∂S with empty boundary, every orientation line tensored with o_ℝ and dimension d − 1; and for each s ∈ S on (X^≤s, X^<s) → (S^≤s, S^<s) with thickenings X_I^≤s, domains U_IJ ∩ X_I^≤s, regular loci X_I^reg ∩ X_I^≤s, orientation lines tensored with o_s^∨ and dimension dim(s) (Pardon, Definition 6.1.6, p. 48). The zero-fiber compatibility gives ψ_IJ⁻¹(X_I^≤s) = Z_IJ ∩ X_J^≤s, hence the restricted coordinate changes and quotient homeomorphisms; the cell-like models give the restricted product projections; and a regular zero y ∈ X_I with ψ_∅I(y) ∈ X^≤s lies in X_I^≤s, so the restricted footprints cover X^≤s.

- Every restricted atlas satisfies the Layer 1 axioms in its stated dimension.
- If the stratified atlas is locally orientable, so is every restricted atlas, by the equivariance of the normal-line identifications, and its orientation sheaf is identified with the tensored line compatibly with ψ_IJ and the incidences.
- Incidence signs satisfy the codimension-2 cancellation; arbitrary signs do not.

**Checks.**

- In [0, 1] with three strata the boundary faces {0} and {1} each have one incident top side, while in ℝ stratified by {0} < (−∞, 0), (0, ∞) the face {0} has two.
- In the quadrant ℝ_≥0², the two paths from the origin through the two edges to the open face carry opposite composite incidence signs, so their sum is 0.
- Γ = ℤ/2 reflecting ℝ, with both half-lines in one stratum t and {0} in s, acts on the normal line of {0} by −1, so no equivariant identification with trivial action on o_s exists; the equivariance requirement excludes this datum, whose restricted atlas on s would not be locally orientable.

*Needs:* §6.1, §3.1; AbelianSchemesAndArithmeticModuliPartII §B2.9.

### 6.3 The stratified virtual complex

Form the finite stratified virtual complex `⊕_s C_vir(K ∩ X^≤s rel∂; A|≤s) ⊗ o_s`, with differential the internal one plus the degree +1 pushforward on each codimension-1 incidence tensored with its odd normal map (Pardon, Definition 6.2.2, pp. 49–50). Construct the §0.5 normalization and prove d² = 0. Construct the map to the unstratified complex by summing the dimension-d terms and the physical boundary dimension-(d − 1) terms with the normal identifications.

- For a finite locally orientable stratified atlas this map is a quasi-isomorphism compatible with the sheaf identifications and restrictions (Pardon, Proposition 6.2.3, p. 50), proved by a finite dimension filtration, homotopy K-descent and local generator cycles across incident strata.

**Checks.**

- For S = {pt} the stratified complex is C_vir itself and the map is the identity.
- For [0, 1] with three strata, the complex is `C_vir([0,1] rel∂) ⊕ C_vir({0}) ⊗ o ⊕ C_vir({1}) ⊗ o` with the two incidence maps, and its cohomology is that of C_vir([0, 1]).
- Equality of Euler characteristics alone does not give the quasi-isomorphism: a complex ℚ → ℚ with zero differential and one with the identity have equal Euler characteristic and different cohomology.

*Needs:* §6.2, §4.3; §0.5, §0.8.

### 6.4 Product atlases

Construct product atlases on X₁ × X₂ indexed by A₁ ⊔ A₂, with products of thickenings, obstruction sums, group products, products of regular loci and product charts (Pardon, Definition 6.3.1, pp. 50–51). The product boundary is the union of the two boundaries with its cell-like face refinement; for stratified factors stratify by S₁ × S₂ with dimension dim(s₁) + dim(s₂), and prove the zero-fiber compatibility and normal-line identifications from those of the factors. Construct the product virtual chain map by relative shuffle and the product total of §0.11, with order and parity signs (Pardon, Definition 6.3.2, p. 51).

- The product of implicit atlases is an implicit atlas of dimension d₁ + d₂; the product of locally orientable atlases is locally orientable, because (Γ_I × Γ_J)_(x,y) = (Γ_I)_x × (Γ_J)_y acts on the tensor product factorwise; and `p₁⁻¹o₁ ⊗ p₂⁻¹o₂ ≅ o_(X₁×X₂)` by the local diagonal calculation.
- The product chain map is associative, unital, compatible with finite subatlases and with the global traces and ordered obstruction generators.

**Checks.**

- The product of the zⁿ and z^m atlases on {0} has class nm.
- The product of the ineffective ℤ/2 point with itself has group ℤ/2 × ℤ/2 and class 1/4.
- The product of two manifold atlases on [0, 1] has boundary the four edges with the corner stratification of the square.

*Needs:* §4.3, §6.1, §6.2; §0.11.

### 6.5 Čech external product and the product class

Construct the compact rational Čech external product for virtual orientation lines, their rational trivializations and boundary-relative versions on arbitrary compact Hausdorff X₁, X₂. At a finite open cover use the normalized ordered-nerve cochain model, a bounded finite-rank complex over ℚ, retaining repeated cover sets and raw refinement maps. For a rank-one orientation local system L use its orientation double cover with deck group ℤ/2, finite equivariant covers refining evenly covered neighborhoods with disjoint sheet translates, and the sign-isotypic part of the lifted nerve complexes; prove the comparison with the sheaf Čech model after the cofinal cover colimit by finite closed shrinkings, local constancy and common refinements, combined with exact sign-isotypic descent. For a closed boundary use finite relative nerve pairs and the pair long exact sequence. Prove that finite rectangular covers are cofinal among finite covers of X₁ × X₂, and on each pair of finite models prove the rational Künneth quasi-isomorphism by shuffle and Alexander–Whitney with the deck action. Finite-dimensionality is used only for the finite-nerve complexes; invariants are exact over ℚ and commute with filtered colimits, and tensor products commute with them. Construct the presheaf external tensor-to-sheafification map on rectangles and its map of finite Čech/pure-K double complexes, and prove it intertwines the Layer 3 comparison and the shuffle signs.

- `Čech^•(X₁ × X₂; o₁ ⊠ o₂) ≅ Čech^•(X₁; o₁) ⊗ Čech^•(X₂; o₂)` over ℚ for arbitrary compact Hausdorff spaces, without finite-dimensionality of the Čech groups.
- For locally orientable atlases on X₁ and X₂, under this isomorphism the product functional that multiplies Φ₁ and Φ₂ on the (d₁, d₂) summand and is zero on the others equals the class of the product atlas; it is associative and unital, compatible with finite subatlases, and the factor swap acts by the cohomological and virtual-orientation Koszul signs.

**Checks.**

- For X₁ = X₂ = S¹: Čech^1(S¹ × S¹; ℚ) = ℚ², the sum of the (1, 0) and (0, 1) summands.
- For the Warsaw circle W and a point: Čech^1(W × pt) = Čech^1(W) = ℚ, although singular H^1(W) = 0, so a singular Künneth theorem would give the wrong answer.
- For d₁ = d₂ = 1 the factor swap X₁ × X₂ → X₂ × X₁ changes the product class on a (1, 1) class a ⊠ b by (−1)^(1·1) = −1.

*Needs:* §6.4, §3.4; §0.7; AlgebraicTopology Stage 6.

### Examples

The square [0, 1]² as a product of two interval atlases tests the corner stratification and the boundary law on a product; the two-point stratified atlas of §6.1 tests the zero-fiber compatibility.

### Dependencies

Layers 0–5; AlgebraicTopology Stage 6; AbelianSchemesAndArithmeticModuliPartII §B2.9.

## Layer 7: Transverse fiber products and application interfaces (V7)

The boundary, refinement, finite-union and product laws above follow Pardon's §§4–6. The fiber-product identity of this layer is a construction of this roadmap; Pardon states it as a desired property that the paper does not prove (§5 introduction, p. 40).

### 7.1 Fiber-product atlases

Take locally orientable boundaryless atlases on compact X and Y, a Hausdorff smooth manifold M of dimension n with an orientation/normal system, tubular model, Thom class and normal convention for the diagonal, continuous f : X → M, g : Y → M, and Γ-invariant f_I : X_I → M, g_J : Y_J → M commuting with ψ on zero fibers. For each (I, J) let `F_IJ = X_I^reg ×_M Y_J^reg` and supply a Γ_I × Γ_J-invariant open W_IJ ⊆ F_IJ, with inverse-image compatibility under the product coordinate changes and induced quotient maps; W_IJ is the regular part of the fiber atlas. At each w' ∈ W_(I',J') in the coordinate-change zero-fiber domain require a joint chart on an open neighborhood O of w' in the ambient product X_(I')^reg × Y_(J')^reg, with O ∩ (fiber) ⊆ W_(I',J') and image in the tubular neighborhood, in which

`(s_(I'∖I), s_(J'∖J), ν_Δ ∘ (f_(I') × g_(J')))`

is the projection to the extra-obstruction and diagonal-normal coordinates, the rest being an open subset of a Euclidean model; imposing ν_Δ = 0 gives the regular fiber chart. Include group-translated charts, quotient identifications, normal-frame changes and orientation order. The covering of Z = X ×_M Y by the images of the regular zeros in W_IJ is a separate supplied witness.

- Z with the subspace topology is compact Hausdorff, and the matching fiber products with groups Γ_I × Γ_J and obstructions E_I ⊕ E_J form an implicit atlas of dimension d_X + d_Y − n with ordered orientation `o_X ⊗ o_Y ⊗ o_M^∨`.
- This atlas is locally orientable: the stabilizer acts on the diagonal-normal line trivially, because ν_Δ ∘ (f_I × g_J) is Γ-invariant, and on the remaining factors as for X and Y.
- The regular chart has dimension d_X + d_Y − n + m_I + m_J, and the Layer 1 negative-dimension rule applies to that integer, not to d_X + d_Y − n.

**Checks.**

- X = S¹ and Y = pt with regular empty-index atlases, M = ℝ, f(θ) = sin θ, g = 0: Z = {0, π}, d_Z = 1 + 0 − 1 = 0 and W = F.
- f(θ) = 1 − cos θ and g = 0 meet tangentially at θ = 0: ν_Δ ∘ (f × g) = 1 − cos θ is not a coordinate projection near 0, so no joint chart exists there.
- For d_X = d_Y = 0, n = 1 and m_I = 1, the virtual dimension is −1 while the regular chart dimension is 0, so W_IJ need not be empty.

*Needs:* §1.1, §3.1, §6.4.

### 7.2 The deformation-pair inclusion

Form the inclusion of global relative deformation pairs `ι : D^Z_(I,J,B) → D^(X×Y)_(I,J,B)` induced by the joint models. Its support condition is `D^Z ∖ e⁻¹(0) ⊆ D^(X×Y) ∖ e⁻¹(0)`; it uses the same groups and interval weights and commutes with interval arrows and with pr_e. On the raw reindexing it is a chain map with unshifted boundary; to compare with the native shift by n insert in degree q the sign `(−1)^(n(q−d_Z))`, where d_Z = d_X + d_Y − n, and include the normal-line parity of `o_M^∨` separately.

- ι is a chain map of global relative virtual complexes after the stated sign, preserving the degree-d_Z generator and commuting with the traces.

**Checks.**

- For n = 1 and q = d_Z + 1 the inserted sign is −1; for q = d_Z it is +1.
- For n = 0 (M a point) ι is the identity of the product deformation pair.
- In the example of §7.1 with B = ∅: D^Z = Z = {0, π} and D^P = S¹, and ι is the inclusion C_(0−q)(Z) → C_(1−q')(S¹) with q' = q + 1, so it raises cochain degree by n = 1.

*Needs:* §7.1, §4.2, §6.4.

### 7.3 The supported Gysin map and the fiber-product identity

Put P = X × Y, h = f × g : P → M × M and i : Z → P, so that Z = h⁻¹(Δ). After the Layer 3 comparisons, H(ι_*) has type `Čech^q(Z; o_Z) → Čech^(q+n)(P; o_P)` and acts on arbitrary classes on Z. Construct the supported Gysin map i_!:

- Diagonal Thom data: choose a paracompact Hausdorff neighborhood N of f(pr_X(Z)) in M covered by finitely many bundle charts, take the Thom class τ_Δ of the diagonal over N (CharacteristicClasses §C2 item 1) with its supported Čech pullback, prove independence of N under cofinal shrinking, and identify the relative generator with the Thom generator by the normal chart.
- Coefficients: L = pr_X⁻¹ f⁻¹ o_M on P and F = o_P ⊗ L^∨; the ordered orientation of Z gives i⁻¹F ≅ o_Z.
- Supported class: u = h^* τ_Δ ∈ Čech^n(P, P∖Z; L), with image ū ∈ Čech^n(P; L).
- Extension in P: prove `colim_U Čech^q(U; F) ≅ Čech^q(Z; i⁻¹F)` over open U ⊇ Z (P is compact Hausdorff and Z closed), so each a ∈ Čech^q(Z; o_Z) comes from some a_U.
- Definition: i_!(a) is the image of a_U ⌣ u|_U ∈ Čech^(q+n)(U, U∖Z; o_P), paired by L^∨ ⊗ L → ℤ in the recorded order, under excision and forgetting support; it is independent of U and a_U.

API:

- i_! is natural in coefficients, satisfies `i_!(a ⌣ i^*b) = (−1)^(n·deg b) i_!(a) ⌣ b` for b ∈ Čech(P; ℚ), and `i_!(i^*b) = b ⌣ ū` for b ∈ Čech^q(P; F); the last formula fixes i_! only on the image of i^*.
- i_! = H(ι_*) in every degree through finite Čech/virtual-complex comparisons, proved by a map of finite Čech double complexes compatible with positive-degree cup products; a stalk-H^0 calculation does not suffice, since the degree-n Thom map vanishes on stalk H^0.
- For a ∈ Čech^(d_Z)(Z; o_Z), `Φ_Z(a) = Φ_P(i_!(a))`, from the trace square: ι commutes with pr_e, both traces land in the same obstruction pair, and the interval weights agree.
- Boundary and face cases follow only after their relative joint models and boundary signs are constructed.

**Checks.**

- In the example of §7.1 orient S¹ by increasing θ and the diagonal normal by ν(x, y) = x − y. Then i_!(1, 0) = η and i_!(0, 1) = −η, where η ∈ H¹(S¹; ℚ) is the orientation generator, because sin θ is increasing at 0 and decreasing at π; the opposite normal ν(x, y) = y − x negates both values.
- In the same example ū = 0, since it is pulled back from H¹(ℝ²) = 0; defining H(ι_*) as cup product with ū would give 0 ≠ i_!(1, 0). The class (1, 0) is not restricted from any neighborhood of f(Z) = {0} in M, but it is restricted from two disjoint arcs around Z in S¹, which is why a extends in P.
- In the same example i^*(1) = (1, 1) and i_!(1, 1) = η − η = 0 = 1 ⌣ ū, as `i_!(i^*b) = b ⌣ ū` requires.

*Needs:* §7.1, §7.2, §3.4, §4.3; §0.7; CharacteristicClasses §C2 item 1; AlgebraicTopology Stage 6.

### 7.4 Application interface

The engine's input is a compact Hausdorff base or pair, a complete Layer 1 atlas with its local orientability and orientation data, the comparison, refinement or concordance witnesses for auxiliary choices, and the product or fiber-product data of §6.4 and §7.1 when those laws are used. Application roadmaps construct these inputs; the generic theorems supply none of their analytic regularity, finite-dimensional reduction, gluing, compactness or evaluation continuity, and no application proof is an input of Layers 0–6 or §7.1–§7.3. Gromov–Witten splitting, divisor, unit and forgetful axioms need further compatible application diagrams and orbifold weight normalizations.

- The interface is the data above, with no additional hypotheses.

**Checks.**

- The manifold atlas of a compact oriented manifold is a valid input with no auxiliary witnesses, and its class is the fundamental class (§5.6).
- An atlas that is not locally orientable, such as the reflection atlas of §1.1, is rejected by the interface before any orientation-dependent law is applied.
- Two atlases on one base with no refinement or concordance witness, such as xⁿ for n = 1 and n = 2, are not compared by the interface, and their classes 1 and 0 differ.

*Needs:* Layers 1–6; §§7.1–7.3.

### Examples

Two transverse zeros of sin θ on S¹ over ℝ give a nonzero supported Gysin map although the absolute pulled-back diagonal class vanishes.

### Dependencies

Layers 0–6; CharacteristicClasses §C2; AlgebraicTopology Stage 6.

## Downstream consumers

AnalyticStableMaps, GromovWittenTheory, SymplecticFieldTheory, DGFloer and HamiltonianFloerOperations consume Layers 0–6 (labelled V0–V6) as the generic virtual-class engine; GromovWittenTheory and HamiltonianFloerOperations also consume the fiber-product identity of §7.3. ComplexCurveModuli refers to the division of labour of §7.4.

## References

- [Pardon] J. Pardon, *An algebraic approach to virtual fundamental cycles on moduli spaces of pseudo-holomorphic curves*, Geometry & Topology 20 (2016), arXiv:1309.2370v6. Page numbers above are the printed pages of arXiv v6. Cited for: Remark 2.1.5, p. 14 (specified equivalence of atlases); Example 2.3.2, p. 20 and §2.3.3, p. 20 (single-chart weights); Definitions 3.1.1, 3.1.3, Remark 3.1.5, pp. 31–33; Definitions 3.2.1, 3.2.3, p. 33; Definitions 4.1.1–4.1.3, pp. 34–35, with footnote 17, p. 34; Definitions 4.2.1, 4.2.4–4.2.7, pp. 35–37; Lemmas 4.3.1–4.3.2, Proposition 4.3.3 and Theorem 4.3.4, pp. 37–39; Proposition 4.4.2, pp. 39–40; §5 introduction, p. 40; Definition 5.1.1 and Lemmas 5.2.1–5.2.6, pp. 41–43; Definition 5.3.1 and Proposition 5.3.4, pp. 44–45; Definition 5.4.2, p. 46; Definitions 6.1.1–6.1.6, Example 6.1.4 and Lemma 6.1.5, pp. 47–48; Definition 6.2.2 and Proposition 6.2.3, pp. 49–50; Definitions 6.3.1–6.3.2, pp. 50–51; Conventions A.0.1 and A.0.3, pp. 113–114; Definitions A.1.1–A.1.6 and Lemma A.1.8, pp. 114–115; Definition A.2.5 and Lemmas A.2.11–A.2.12, pp. 117–118; Lemma A.3.3 and Definitions A.3.4–A.3.6, pp. 118–119; Remarks A.4.1–A.4.2 and Definition A.4.3, p. 119; Lemmas A.4.4–A.4.5 and Definition A.4.6, p. 120; Lemmas A.4.7–A.4.9 and Definition A.4.10, pp. 120–121; Lemmas A.4.11–A.4.13 and Proposition A.4.14, p. 122; Lemma A.4.15, Proposition A.4.18 and Corollary A.4.19, p. 123; Lemma A.4.20 and Definition A.4.21, p. 124; Definition A.5.1, Lemma A.5.3 and Proposition A.5.4, pp. 124–125; Lemma A.5.5, p. 125; Convention A.6.1, Definition A.6.2 and Lemma A.6.3, pp. 125–126; Lemma A.6.4, p. 127; Definitions A.7.1, A.7.2, A.7.5, Lemmas A.7.3–A.7.4 and footnote 46, p. 128; Lemmas A.8.1–A.8.2, p. 129.
- [Hatcher] A. Hatcher, *Algebraic Topology*, Cambridge University Press, 2002, author's online edition. Cited for: Lemma 3.27(b), p. 236 (vanishing of local homology above the dimension, §0.10).
