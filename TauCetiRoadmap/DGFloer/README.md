# Roadmap: Morse and Floer homology with DG local coefficients

Classical Morse and Floer homology count only the zero- and one-dimensional spaces of connecting
trajectories. Barraud and Cornea observed that the compactified trajectory spaces of *every*
dimension, evaluated into a space of paths, assemble into a Maurer--Cartan element over the
cubical chains on a loop space. Twisting by that element gives Morse and Floer complexes with
coefficients in any differential graded module over `C_*(ΩB)`: a *DG local system*. The basic
source of such systems is Hurewicz fibrations over `B`, and in that case the twisted Morse complex
computes the homology of the total space. Barraud--Damian--Humilière--Oancea turned this into a
full homological package, first for Morse theory on manifolds and on the free loop space, then for
Hamiltonian Floer theory and symplectic homology. They proved a Viterbo isomorphism with DG
coefficients for cotangent bundles. They used it to prove almost existence of contractible closed
characteristics in `T*Q` whenever `Q` is not aspherical in a suitable sense, and finiteness of the
`π₁`-sensitive Hofer--Zehnder capacity of `D*Q` for a large class of manifolds `Q`.

This roadmap builds that package. Its first layers are reusable well beyond symplectic geometry:
- cubical singular chains;
- a few general facts of algebraic topology that no other roadmap builds;
- path and mapping spaces;
- DG local systems and the algebra of twisting cocycles.

The Floer layers sit on the analytic tower of the [Heegaard Floer roadmap](../HeegaardFloer/README.md)
and add the one Floer theory that roadmap does not build, Hamiltonian Floer homology of periodic
orbits.

Suggested homes:

| Layers | Home |
| --- | --- |
| 0 | `TauCeti/AlgebraicTopology/Cubical/` |
| 1 | `TauCeti/AlgebraicTopology/` and `TauCeti/Geometry/Manifold/`, beside the material they extend |
| 2 | `TauCeti/Topology/PathSpace/` and `TauCeti/Topology/MappingSpace/` |
| 3--4 | `TauCeti/AlgebraicTopology/DGLocalSystem/` |
| 5 | `TauCeti/Geometry/Manifold/Morse/DG/` |
| 6--11 | `TauCeti/Geometry/Symplectic/Hamiltonian/` and `TauCeti/Geometry/Symplectic/Floer/` |

## Scope boundary

In scope: every numbered statement of the source paper
([arXiv:2404.07953](https://arxiv.org/abs/2404.07953)), except the four listed below. The
[source coverage](#source-coverage) section assigns each of them to a layer.

Out of scope, so nobody mistakes them for later stages:

- **Conjecture 1.2** (every closed hypersurface in `T*Q` has the contractible almost existence
  property when `Q` is not a `K(π,1)`). It is open.
- **Corollary F.** It consumes the Ginzburg--Niche theorem on uniquely ergodic Hamiltonian
  structures, which nothing here builds.
- **The Cayley plane** in Proposition 6.39. It needs the octonionic projective plane as a
  Riemannian manifold. The quaternionic half of Proposition 6.39 is in scope.
- **The two appeals to classification results:**
  - Lemma 6.35, which reads `π_{n−1}(SO(n))` off tables and uses Bott periodicity;
  - the implication "a compact connected Lie group other than a torus is not a `K(π,1)`" used in
    Proposition 6.31.

  Proposition 6.34 is proved here by the source's second proof, which needs neither result.
  Proposition 6.31 is stated for compact connected Lie groups that are not a `K(π,1)`.

Also out of scope:
- chain-level higher structures, meaning `A∞` refinements of the DG Floer maps, products, and the
  BV and loop-product structures on either side of the Viterbo isomorphism;
- Floer homotopy theory;
- Lagrangian Floer theory with DG coefficients.

## Ownership and dependencies

This roadmap consumes, and does not rebuild:

- **[Heegaard Floer](../HeegaardFloer/README.md).**
  - Lane M: Morse–Smale pairs, compactified trajectory spaces with their corner structure and
    gluing, and the Morse complex over `𝔽₂` and `ℤ`.
  - Lane F0: Fredholm theory and Sard–Smale.
  - Lane F1: the Cauchy–Riemann package, including totally real boundary conditions, Riemann–Roch
    and the Robbin–Salamon index.
  - Lane F2: symplectic manifolds, almost complex structures, `J`-holomorphic maps, energy,
    compactness, transversality and gluing.
  - The manifold orientation and degree API. The differential geometry roadmap (Layers 2 and 10)
    also proposes to own it. This roadmap depends only on its homological characterization
    `f_*[S] = deg(f) · [Q]` from Stage 6 of the algebraic topology roadmap, so it is unaffected by
    which of the two owns it.
- **[Algebraic topology](../AlgebraicTopology/README.md).**
  - Stage 2: relative singular homology and local coefficient systems.
  - Stage 4: CW pairs, cellular approximation and cofibrations.
  - Stage 5: Eilenberg--Zilber, the Künneth theorems, the Serre-fibration carrier, and the homology
    Serre spectral sequence over CW bases.
  - Stage 6: fundamental classes, the orientation local system, cap products, Poincaré and
    Poincaré--Lefschetz duality.
  - Stage 8: absolute and relative Hurewicz in degrees `≥ 2`, and Whitehead.
- **[DG and A-infinity](../DGAInfinity/README.md).**
  - Layer 1: DG algebras, right DG modules, restriction of scalars, tensor products.
  - Layer 4: Maurer--Cartan elements in the strictly upper-triangular regime.
  - Layer 5: one-sided twisted complexes and derived tensor products.
- **[Geometric topology](../GeometricTopology/README.md).**
  - Layer 1: manifolds with boundary, collars, tubular neighbourhoods, connected sum.
  - Layer 3: `Diff(M)` as a topological group with the `C^∞` topology, the smooth-families map,
    and the inclusion `O(n+1) → Diff(Sⁿ)`.
  - Layer 7: Riemannian structures.
- **[Universal covers](../../Completed/UniversalCovers/README.md).** Covering spaces, and induced
  maps on homotopy groups.
- **[Hamiltonian systems](../HamiltonianSystems/README.md)** (proposed in #480, not yet merged; the link resolves once it is). Layers 1--2: Hamiltonian vector
  fields, the Poisson bracket, conservation of energy, symplectomorphisms and their action on
  Hamiltonian vector fields and integral curves.
- **[Differential geometry](../DifferentialGeometry/README.md)** (proposed in #178, not yet merged; the link resolves once it is).
  - Layers 0--1: smooth differential forms on manifolds, pullback, the exterior derivative
    `mextDeriv`, the Cartan calculus (interior product, Lie derivative, Cartan's formula).
  - Layer 3: flows of vector fields.
  - Tau Ceti's `SmoothTwoForm` migrates onto its generic form carrier (its item 0.4), and this
    roadmap uses the migrated carrier.
- **[Homotopy spheres](../HomotopySpheres/README.md)** (proposed in #284, not yet merged; the link resolves once it is).
  - Stage 3A: pointed compactly generated spaces, based loop spaces, and the suspension--loop
    adjunction, with the comparison homeomorphisms to ordinary spaces.
  - Stage 5: the Pontryagin--Thom collapse map of a framed submanifold, built from a chosen tubular
    neighbourhood and normal framing.

This roadmap owns everything else it states. In particular it owns:
- cubical singular chains and their comparison with simplicial singular chains;
- `H₁ ≅ π₁ᵃᵇ`, CW approximation, and homology invariance under weak equivalences;
- the spectral sequence of a bounded-below exhaustive filtered complex;
- Serre classes;
- the Pontryagin--Thom collapse for framed submanifolds of an arbitrary closed ambient manifold,
  extending the Euclidean-ambient construction of the homotopy spheres roadmap;
- local triviality of `Diff(M) → M`;
- Stiefel manifolds, `CPᵈ` and `HPᵈ`, and Morse--Bott theory of the energy functional on their
  based loop spaces;
- Moore path and loop spaces, Hurewicz fibrations with transitive lifting functions, and mapping
  spaces out of spheres;
- DG local systems;
- the Barraud--Cornea construction;
- DG Morse and DG Floer homology;
- time-dependent Hamiltonian flows and their 1-periodic orbits, Liouville domains, and the cotangent
  bundle of a manifold with its canonical Liouville form;
- Hamiltonian Floer and symplectic homology;
- the Viterbo isomorphism;
- symplectic capacities;
- the almost existence property.

Three of these touch other roadmaps and are coordination points:

- **The filtered-complex spectral sequence.** The algebraic topology roadmap builds its Serre
  spectral sequence from a skeletal filtration. Once the generic construction of Layer 1 exists,
  that roadmap is expected to consume it.
- **The cotangent bundle of a manifold.** Lane F3 of the Heegaard Floer roadmap takes its cotangent
  examples from here.
- **The Pontryagin--Thom collapse.** Layer 1 builds it with the same data as the homotopy spheres
  roadmap: a chosen tubular neighbourhood and normal framing, with independence as a theorem. It
  agrees with that roadmap's collapse when the ambient manifold is a sphere.

## Standing conventions

- **Cubical chains throughout.** All chains in this roadmap are *normalized cubical singular
  chains*, following the source and BDHO.
  - A singular `n`-cube is a continuous map `Iⁿ → X`. It is degenerate when it does not depend on
    at least one coordinate (Massey's convention, which is BDHO §5.2's). The chain group is free on
    all cubes modulo the degenerate ones.
  - Serre's convention, which only asks independence of the last coordinate, is not used: it is
    not closed under the cross product.
  - The cross product `Iᵖ × I^q = I^{p+q}` is strictly associative and strictly unital. So
    `C_*(ΩB)` is a DG algebra under Moore concatenation with no Eilenberg--Zilber correction, and
    fundamental chains of products of trajectory spaces are cross products.
  - Every homological input from the algebraic topology roadmap is transported through the
    comparison of Layer 0, which is proved once and then used through named maps.
- **Grading bridge.** The source uses homological grading. The DG roadmap is cohomological, with
  right modules primary.
  - Every DG object here is a cochain object through `C^{-n} = C_n`. A homological differential of
    degree `−1` is a cohomological differential of degree `+1` with the same sign, and parity is
    unchanged.
  - The source's formulas are stated in homological notation through one named equivalence.
  - The sign comparison of the twisting equation with the DG roadmap's `(MC)` is proved once
    (acceptance criterion 2).
- **Moore loops.** `ΩB` is the space of Moore loops `γ : [0, L] → B` with `L ≥ 0`. The comparison
  with Mathlib's unit-interval loops is a homotopy equivalence of `H`-spaces, proved once.
- **Mapping-space topology.** Path, loop and mapping spaces carry Mathlib's compact-open topology on
  `C(X, Y)`. Every mapping space used here has a compact Hausdorff source, so the exponential law
  holds without compact generation. The homotopy spheres roadmap forms loop spaces in compactly
  generated spaces. Its comparison homeomorphism for compact Hausdorff sources identifies the two,
  and is used whenever a result is transported between the roadmaps.
- **Coefficients.** The algebraic Layers 0, 3 and 4 work over an arbitrary commutative ring. The
  geometric Layers 5 and 7--9 are built over `𝔽₂` first. Integer coefficients, with the source's
  orientation conventions of §3.1, form a separate milestone inside each of those layers. Every
  `𝔽₂` theorem is stated so the ring can be generalized without restating the geometry.
- **Floer grading.** The degree of a nondegenerate 1-periodic orbit is its Conley--Zehnder index.
  It is normalized so that for a `C²`-small autonomous Morse Hamiltonian on a closed `2n`-manifold,
  `FH_*(H) ≅ H_{*+n}(X)`.
- **Hamiltonian sign.** Hamiltonian vector fields are those of the Hamiltonian systems roadmap,
  `ι_{X_H} ω = dH`. The source's §3.2 uses `ω(X_H, ·) = −dH`, which is the vector field of `−H`
  in that convention. The bridge `X^{source}_H = X_{−H}` is proved once, and every statement
  quoted from the source is transported through it. Action functionals, Conley--Zehnder indices
  and action filtrations are stated in the source's normalization after this substitution, so
  `FH_*(H) ≅ H_{*+n}(X)` keeps its form.
- **Hypotheses stay unbundled**, as in the Heegaard Floer roadmap: nondegeneracy, regularity of
  `J`, admissibility at infinity, asphericity and atoroidality are separate named hypotheses.
- **Maps are specified, not merely existent.** Continuation maps, direct and shriek maps, the
  Viterbo transfer and the Viterbo map are constructed from explicit data. Their independence of
  choices is a theorem about specified chain homotopies, never a quotient taken silently.

## Inventory

Mathlib provides:
- singular homology and its homotopy invariance;
- cubical homotopy groups (`HomotopyGroup`);
- the compact-open topology on `C(X, Y)`;
- homological complexes, homotopies, `SpectralObject`;
- manifolds with corners, integral curves and flows;
- `LieGroup`, `Matrix.orthogonalGroup`, quaternions;
- `Monotone.ae_differentiableAt`.

Tau Ceti provides:
- `IsDGAlgebra`, `IsDGRightModule`, `DGRightModuleCat`, restriction of scalars along `DGAlgHom`;
- the loop-space shift `pathLoopSpaceMulEquiv : π_m(Ω X) ≃* π_{m+1}(X)`;
- `IsAspherical` and `IsEilenbergMacLaneSpaceOne`;
- twisted singular homology and `LocalCoefficientSystem`;
- `cotangentSymplecticForm` and `cotangentLiouvilleForm` on the model space;
- `SmoothAlmostComplexStructure` and `IsPseudoholomorphic`;
- the Morse lemma, the Morse index, negative-gradient flows;
- finite-dimensional Sard and Sard–Smale.

None of the following exist in Mathlib, in Tau Ceti, or on another roadmap. They are built here:
- cubical chains;
- `H₁ ≅ π₁ᵃᵇ`;
- CW approximation;
- the filtered-complex spectral sequence;
- Serre classes;
- the Pontryagin--Thom collapse in a non-Euclidean ambient manifold;
- Stiefel manifolds;
- `CPᵈ` and `HPᵈ` as manifolds.

---

## Layer 0: cubical singular chains

1. Singular cubes, faces and degeneracies, and the normalized cubical chain complex
   `C^□_*(X; A)` over a commutative ring `A`. Functoriality, relative chains of pairs, and the
   augmentation.
2. The cross product `C^□_p(X) ⊗ C^□_q(Y) → C^□_{p+q}(X × Y)`: strictly associative, strictly
   unital, satisfying the Leibniz rule with the Koszul sign. For a topological monoid `G` with
   strict unit, `C^□_*(G)` is a DG algebra under the product induced by multiplication.
3. The comparison with simplicial singular chains is a natural chain homotopy equivalence, built by
   acyclic models on cubes and simplices. It is compatible with cross products up to a specified
   natural chain homotopy, through Eilenberg--Zilber, and with relative chains. Consequences, each
   derived through the comparison and not re-proved:
   - homotopy invariance;
   - the long exact sequence of a pair;
   - excision;
   - the Künneth theorems;
   - cubical local coefficients;
   - the Serre spectral sequence.
4. Fundamental chains: a compact oriented topological manifold with corners whose boundary is a
   union of products of lower-dimensional ones has a fundamental chain rel boundary in
   `C^□_*`. Its boundary is the signed sum of the cross products of the fundamental chains of the
   faces. This is the chain-level input of every representing chain system in Layers 5 and 8.
   - The only homological fact used is that the connecting map `H_n(M, ∂M) → H_{n−1}(∂M)` sends
     the fundamental class rel boundary to the fundamental class of the boundary.
   - So topological manifolds suffice: no smooth structure on the strata is needed anywhere in this
     roadmap, and the moduli spaces need only be produced as topological manifolds with corners.
5. Source: Massey, *Singular Homology Theory*, Chapters II and VII; Serre, *Homologie singulière
   des espaces fibrés*, Chapter II; BDHO, Chapter 5 and Appendix; Barraud--Cornea, Appendix A.

## Layer 1: topological prerequisites

These are general facts that the later layers use, which no other roadmap builds.

1. **Hurewicz in degree one.** For a path-connected space, `π₁(X)ᵃᵇ ≅ H₁(X; ℤ)` naturally. This
   extends Stage 8 of the algebraic topology roadmap, which starts in degree two. The source uses
   it for `H₁(Ω²Q) ≅ π₃(Q)` in Proposition 5.11.
2. **Weak equivalences and CW approximation.**
   - Every space has a CW approximation, natural up to homotopy.
   - A weak homotopy equivalence induces isomorphisms on singular homology with local
     coefficients.
   - As a corollary, the Serre spectral sequence over an arbitrary path-connected base, by pulling
     back along a CW approximation. The source applies it over `Ω₀Q`, `Ω²B` and `Y`.
3. **The spectral sequence of a filtered complex.** For a bounded-below, exhaustive, increasing
   filtration of a chain complex over a ring: the spectral sequence with
   `E¹_{p,q} = H_{p+q}(F_p/F_{p−1})`, its strong convergence, and naturality under filtered maps.
   It is built as an instance of Mathlib's `SpectralObject`.
4. **Serre classes.** Classes of abelian groups: torsion groups, `dᵐ`-torsion groups, and groups
   `G` with `G ⊗ R = 0` for `R = ℚ` or `R = ℤ/2`. Hurewicz modulo a class for simply connected
   spaces (Serre 1953, Theorem 1; the source's Theorem 5.12).
5. **Pontryagin--Thom collapse.** For a closed codimension-`k` submanifold of a closed manifold
   with a framed normal bundle, the collapse map onto `S^k`, determined by a chosen tubular
   neighbourhood (from geometric topology) and the framing. The construction is the one of the
   homotopy spheres roadmap's Stage 5, with an arbitrary closed ambient manifold in place of
   `ℝ^{n+k}`, and agrees with it for spherical ambient manifolds. Independence of the choices, its
   effect on fundamental classes, and its compatibility with shriek maps.
6. **Diffeomorphism groups.** For a closed manifold `M`, evaluation at a point
   `Diff(M) → M` is a locally trivial fibre bundle (Palais). The proof uses a smooth family of
   compactly supported diffeomorphisms moving the basepoint, fed into the smooth-families map of
   geometric topology's Layer 3.
7. **Homogeneous examples.**
   - Stiefel manifolds of orthonormal `2`-frames.
   - `CPᵈ` and `HPᵈ` as smooth manifolds, as homogeneous spaces of `U(d+1)` and `Sp(d+1)`, with
     their homogeneous metrics. Projective lines are totally geodesic round spheres.
   - `G/H` for a compact Lie group `G` and a closed subgroup `H`, with `G → G/H` a principal
     bundle.
   - Three pointwise orthonormal vector fields on `S^{4k−1}`, from quaternionic multiplication.
8. **Degrees of explicit maps**, computed by counting regular preimages: the map
   `T¹S^{n−1} × S¹ → S^{n−1} × S^{n−1}` of the proof of Proposition 6.17, and the rotation map
   `T¹_p Sⁿ × S¹ → Sⁿ` of the second proof of Proposition 6.34.
9. Source: Hatcher, *Algebraic Topology*, §§2.A, 4.1, 4.J; McCleary, *A User's Guide to Spectral
   Sequences*, Chapter 2; Serre, *Groupes d'homotopie et classes de groupes abéliens*; Palais,
   *Local triviality of the restriction map for embeddings*; Milnor--Stasheff, Chapter 5.

## Layer 2: path spaces, mapping spaces, and their fibrations

1. Moore paths `P_{A→B} X` from `A` to `B`, with length and the compact-open topology on the
   stopped path.
   - Concatenation is continuous and strictly associative with strict units, so `ΩX` is a
     topological monoid.
   - The free loop space `𝓛X` and its component `𝓛₀X` of contractible loops.
   - Constant loops `X ↪ 𝓛₀X`.
   - Loops of length `≤ L`, and the deformation retraction onto unit-speed loops (the source's
     Lemma 4.5).
2. Hurewicz fibrations, with transitive lifting functions `E ×_B P B → P E` that preserve
   concatenation.
   - Every Hurewicz fibration is a Serre fibration in the algebraic topology roadmap's sense.
   - The endpoint evaluation `P_{A→X} X → X` is a Hurewicz fibration. So is evaluation
     `C(K, X) → C(L, X)` along a closed cofibration `L ⊆ K` of compact Hausdorff spaces.
   - Applying `Ω` or `Ω²` to a Hurewicz fibration gives a Hurewicz fibration.
   - A locally trivial bundle over a paracompact base is a Hurewicz fibration.
3. The canonical homeomorphisms
   - `P_{⋆→Q} 𝓛₀Q ≅ Map_*(S², Q)`;
   - `P_{Q→Q} 𝓛₀Q ≅ Map(S², Q)`;
   - `Map_*(S^k, X) ≅ Ω^k X`.

   Also:
   - `π_j(Ω^k X) ≅ π_{j+k}(X)`, by iterating `pathLoopSpaceMulEquiv`;
   - the adjunction `Ω²X → Map(S¹, ΩX)` and the induced degree-raising map
     `β_* : H_*(Ω²X) → H_{*+1}(ΩX)`;
   - the section of `Map_*(S², Q) → Map(S², Q) → Q` by constant spheres;
   - the homeomorphism `G × Ω²G ≅ Map(S², G)` for a topological group `G`.
4. Source: the source paper §§5.2, 6.3, 6.4; Whitehead, *Elements of Homotopy Theory*,
   Chapter I.

## Layer 3: DG local systems

1. The augmented DG algebra `C_*(ΩB)` (Moore loops, cubical chains, cross product), and its
   functoriality along based maps.
   - A **DG local system** on `B` is a right DG module over `C_*(ΩB)`, in the DG roadmap's sense
     through the grading bridge (the source's Definition 1.8).
   - Pullback along `f : B' → B` is restriction of scalars along `C_*(Ωf)`.
2. A Hurewicz fibration `F → E → B` with a transitive lifting function gives a holonomy action
   `F × ΩB → F`, hence a DG local system `C_*(F)`. Different lifting functions give
   quasi-isomorphic DG local systems, through a specified quasi-isomorphism.
3. Classical local systems are DG local systems concentrated in degree zero. They correspond,
   naturally, to Tau Ceti's `LocalCoefficientSystem`, through `H₀(ΩB) ≅ ℤ[π₁(B)]`.
4. **Twisting by a rank-one local system `L`.** The DG algebra map `Φ^L` (the source's
   Lemma 2.1), the twisted cocycle `m^L_{x,y}`, and the isomorphism of twisted complexes
   `𝓕 ⊗ L`-coefficients with `m^L`-twisted `𝓕`-coefficients (Proposition 2.2). Also
   `H_q(𝓕 ⊗ L) ≅ H_q(𝓕) ⊗ L`.
5. Source: BDHO Chapters 2 and 7; the source paper §§1.4 and 2.3.

## Layer 4: twisting cocycles and the twisted complex

This layer is pure algebra over a DG algebra `R`. It consumes the DG roadmap's Layers 1, 4 and 5.

1. **Twisting cocycles** (the source's Definition 1.9). A twisting cocycle on a finite set `P`
   graded by `ind : P → ℤ` is a family `m_{x,y} ∈ R_{ind x − ind y − 1}` satisfying
   `∂m_{x,y} = Σ_z (−1)^{ind x − ind z} m_{x,z} m_{z,y}`.
   It is strictly upper-triangular for the order by `ind`. Prove that it is exactly a one-sided
   twisted complex of shifted free rank-one right `R`-modules, with shifts given by `ind`.
2. For a DG local system `𝓕`, the twisted complex `𝓕 ⊗ ⟨P⟩` with
   `D(α ⊗ x) = ∂α ⊗ x + (−1)^{|α|} Σ_y α·m_{x,y} ⊗ y`, and `D² = 0`.
3. **Continuation cocycles** (Definition 1.10) and the chain maps they induce. **Parametrized
   cocycles** (Definition 1.11) and the chain homotopy `Ψ¹ − Ψ⁰ = D⁻h + hD⁺`. Composition of
   continuation cocycles. Homologous twisting cocycles give chain homotopy equivalent twisted
   complexes, through a specified equivalence.
4. **The index filtration** `F_p = ⊕_{ind x ≤ p} 𝓕 ⊗ ⟨x⟩` (the source's Definition 3.38) and its
   spectral sequence, from Layer 1 item 3.
   - The `E²` page is the homology of the classical complex with local coefficients `H_q(𝓕)`.
   - Continuation maps induce morphisms of spectral sequences.
5. For the Brown universal twisting cocycle of a CW structure, identify the twisted homology with
   `Tor^{C_*(ΩB)}(𝓕, A)`, through the DG roadmap's derived tensor product.
6. Source: the source paper §1.4; BDHO Chapters 3--4.

## Layer 5: Morse homology with DG coefficients

This layer consumes Lane M of the Heegaard Floer roadmap for moduli spaces, compactness, gluing and
corner structures.

1. **Representing chain systems.** Fundamental chains rel boundary (Layer 0, item 4) of the
   compactified trajectory spaces of every dimension, coherent with the boundary product
   decomposition. They exist, and any two are homologous through a specified family. This holds
   over `𝔽₂`, and over `ℤ` with the orientation conventions.
2. **The Barraud--Cornea cocycle.**
   - Choose an embedded tree joining the critical points to the basepoint, and a homotopy inverse
     of the collapse map.
   - Evaluate the representing chains into Moore paths, then into `C_*(ΩB)`. The result is a
     twisting cocycle (Layer 4).
   - Its twisted homology is independent of all choices up to specified continuation isomorphisms.
3. **DG Morse homology** `H_*(B; 𝓕)` on closed manifolds, and on compact manifolds with boundary in
   the relative version. It has direct maps `f_*` and shriek maps `f_!`.
4. **Fibration theorem.** For a Hurewicz fibration `F → E → B`:
   - `H_*(B; C_*(F)) ≅ H_*(E)`;
   - the index spectral sequence is isomorphic to the Serre spectral sequence from `E²` on;
   - direct and shriek maps correspond to the maps induced by maps of total spaces and by the
     Umkehr maps of pulled-back fibrations.
5. **Classes living over the fundamental class.**
   - The definition (the source's Definition 2.3) and its chain-level characterization
     (Proposition 2.5).
   - For fibrations, the characterization by the column `E^∞_{n,*}` (Proposition 2.6), and the
     identification of the shriek map to a point with `H_*(E) → H_*(E, E|_{Y_{n−1}}) ≅ H_{*−n}(F)`
     (Lemma 2.9).
   - Naturality of shriek maps under maps of fibrations (Proposition 2.12, Lemma 2.14), and the
     criterion `σ_*[F] ≠ 0 ⇒ σ_*[E]` lives over the fundamental class (Corollary 2.13).
6. **Free loop space.** DG Morse homology of `𝓛₀Q` and `𝓛Q` for a closed manifold `Q`, through
   the finite-dimensional approximations by broken geodesics and the colimit over them.
7. **Morse--Bott energy on `CPᵈ` and `HPᵈ`.** For the homogeneous metric, the energy functional on
   the finite-dimensional approximations of `Ω_p` is Morse--Bott:
   - the critical manifolds are the constant loop and the iterated great circles;
   - their indices are those computed by Bott and Ziller;
   - the functional is perfect, which identifies `H_{2d}(Ω CPᵈ)` and `H_{4d+2}(Ω HPᵈ)` with `ℤ`,
     with an explicit generator.

   The Morse--Bott complex is built here on top of Lane M.

   **Open alternative, not in the literature.** One could instead compute these groups from the
   path-loop fibration `Ω_p → P_p → CPᵈ` (and over `HPᵈ`), through the fibration theorem (item 4;
   BDHO Theorem 7.2) and the index spectral sequence (BDHO §4.2). This would avoid Morse--Bott
   theory and Ziller's computations. It has not been carried out, and it is not known whether it
   yields the explicit generator that Propositions 6.38 and 6.39 need. A contributor who completes
   it may replace the Morse--Bott route, and should record the change here.
8. Source: BDHO Chapters 5--13; the source paper §§2.1--2.4 and 4.3--4.4; Bott, *The stable
   homotopy of the classical groups*, §§1--3; Ziller, *The free loop space of globally symmetric
   spaces*.

## Layer 6: Hamiltonian dynamics, Liouville domains, and capacities

This layer consumes symplectic manifolds and almost complex structures from Lane F2.1 of the
Heegaard Floer roadmap, and Hamiltonian vector fields, the Poisson bracket and symplectomorphisms
from Layers 1--2 of the Hamiltonian systems roadmap. It adds the time-dependent and
dynamical material that roadmap leaves out: periodic orbits, action functionals, Liouville
domains, capacities, and almost existence.

1. Time-dependent Hamiltonian flows, built on the Hamiltonian vector fields of the Hamiltonian
   systems roadmap; 1-periodic orbits and nondegeneracy. Symplectically aspherical and atoroidal manifolds. The action functional on
   `𝓛₀X` (aspherical) and on `𝓛X` (atoroidal).
2. Liouville domains, their completions, Hamiltonians linear at infinity, and exact codimension-zero
   embeddings.
3. **Cotangent bundles.**
   - The cotangent bundle `T*Q` of a smooth manifold, with canonical Liouville form `λ = p dq` as
     a smooth 1-form of the differential geometry roadmap, and `ω = mextDeriv λ`. On the model
     space it agrees with Tau Ceti's `cotangentLiouvilleForm` and `cotangentSymplecticForm`.
   - The unit disc and sphere bundles `D*Q` and `S*Q` of a Riemannian metric. `D*Q` is a Liouville
     domain.
   - Exact magnetic forms: the fibre translation by a 1-form `σ` is a symplectomorphism
     `(T*Q, ω + π*dσ) ≅ (T*Q, ω)`. This proves Corollary D once Theorems A--C land.
4. **Hypersurfaces.**
   - Characteristic foliations of regular hypersurfaces. Closed characteristics correspond to
     periodic orbits of any defining Hamiltonian, up to reparametrization.
   - Liouville vector fields (`ι_Z ω = λ`, equivalently `L_Z ω = ω` by Cartan's formula), contact
     type and restricted contact type.
   - The Liouville-flow argument that proves Corollary E from Theorems A--C, using the flows of the
     differential geometry roadmap's Layer 3.
5. **Almost existence and capacities.**
   - The contractible almost existence property (the source's Definition 1.1).
   - The relative capacity `c°_HZ(V, Z)` (Definition 5.3) and the `π₁`-sensitive Hofer--Zehnder
     capacity (Definition 6.1).
   - Proposition 6.3 (Hofer--Zehnder, Struwe): finite `c°_HZ(W)` implies contractible almost
     existence in `W`. The proof is the monotonicity argument through
     `Monotone.ae_differentiableAt`, including its relative version near a hypersurface.
6. Source: Hofer--Zehnder, *Symplectic Invariants and Hamiltonian Dynamics*, Chapters 1 and 4;
   McDuff--Salamon, *Introduction to Symplectic Topology*, Chapters 3 and 12; the source paper §1.2.

## Layer 7: classical Hamiltonian Floer homology and symplectic homology

This layer consumes Lanes F0--F2 of the Heegaard Floer roadmap. Floer cylinders have domain
`ℝ × S¹` and no boundary. Half-cylinders with boundary on the zero section use Lane F1's totally
real boundary conditions.

1. Floer cylinders, the energy identity, and the Conley--Zehnder index through the Robbin--Salamon
   index. Asphericity rules out sphere bubbling in `𝓛₀X`, and atoroidality does the same in all of
   `𝓛X`.
2. Compactness, transversality for generic `J`, and gluing for the spaces of Floer cylinders, with
   the corner structure of the compactifications in every dimension. The source's §3.2 and
   Barraud--Cornea Appendix A fix the regularity: topological manifolds with corners. By Layer 0
   item 4 this is all that is consumed. Smoothness of the strata is welcome but not required.
3. **Orientations over `ℤ`.**
   - Coherent orientations through determinant lines of stabilized Cauchy--Riemann operators.
   - The gluing sign `(−1)^{dim V₂ · ind D₁}` (the source's Lemma 3.1).
   - The boundary-orientation comparison on `𝓜(x,z) × 𝓜(z,y)` (Proposition 3.3).
4. **The Floer complex.**
   - The complex itself, continuation maps and homotopies.
   - The action filtration: monotone homotopies preserve it, and general homotopies shift it by at
     most the Hofer-norm bound.
   - `FH_*(X) ≅ H_{*+n}(X)` for closed aspherical `X`.
5. **Symplectic homology** `SH_*(W)` of a Liouville domain, as a direct limit over slopes, with
   classical local coefficients.
   - The zero-energy and positive-energy parts and the long exact sequence between them.
   - The Viterbo transfer `ι_!` for exact codimension-zero embeddings.
6. Source: Salamon, *Lectures on Floer homology*; Audin--Damian, Chapters 6--11; Seidel, *A biased
   view of symplectic cohomology*; Abouzaid, *Symplectic cohomology and Viterbo's theorem*,
   Sections 1--4.

## Layer 8: the DG Floer toolset

1. **Representing chain systems for Floer moduli spaces.** Existence (the source's Proposition 3.4,
   Definition 3.5) and uniqueness up to homology (Proposition 3.6).
2. **The Barraud--Cornea twisting cocycle** in `C_*(Ω𝓛X)`: Definition 3.7, the twisting equation
   of Proposition 3.8, uniqueness up to homology of Proposition 3.9.
3. **The DG Floer complex** (Definition 3.12) and its independence of `(J, Ξ)` up to chain homotopy
   equivalence (Proposition 3.13).
4. **Continuation.**
   - Representing chain systems for continuation moduli spaces (Proposition 3.14,
     Definition 3.15) and their uniqueness (Proposition 3.16).
   - Continuation cocycles: Definition 3.17, Propositions 3.18 and 3.19.
   - The continuation map (Definition 3.21) and its filtration estimate (Proposition 3.22),
     including the functions that correct the action along continuation cylinders.
   - The monotone and Hofer-norm corollaries (Corollaries 3.24 and 3.25).
   - Uniqueness up to homotopy (Proposition 3.26).
   - The identity (Proposition 3.27, Corollary 3.28) and composition (Proposition 3.29).
5. **Homotopies.**
   - Representing chain systems for parametrized moduli spaces (Proposition 3.30).
   - Parametrized cocycles (Definition 3.31, Proposition 3.32).
   - The chain homotopy between continuation maps (Definition 3.35).
6. **Closed manifolds.**
   - Continuation maps are homotopy equivalences (Proposition 3.36).
   - `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` in the contractible component (Theorem 3.37).
   - The canonical filtration (Definition 3.38) and the spectral sequence with
     `E² = FH_*(H; H_q(𝓕))` (Theorem 3.39).
   - Theorem J: for a Hurewicz fibration `F → E → 𝓛₀X`, `FH_*(H; C_*(F)) ≅ H_{*+n}(E|_X)`,
     compatibly with the Serre spectral sequence.
7. **Symplectic homology** `SH_*(W; 𝓕)` with DG coefficients for a Liouville domain.
   - The zero-energy identification `SH^{=0}_*(W; 𝓕) ≅ H_{*+n}(W, ∂W; i_W^*𝓕)`
     (Proposition 3.44), which defines `i_{W*}`.
   - The long exact sequence (Proposition 3.45).
   - The Viterbo transfer (Proposition 3.46).
   - The spectral sequence (Theorem 3.49).
8. Source: the source paper §§3.3--3.7.

## Layer 9: the Viterbo isomorphism

1. The local system `η` on `𝓛Q`, and the canonical grading of Floer homology of `T*Q` (the source's
   §§4.1--4.2).
2. **Classical Viterbo with local coefficients.** For every classical local system `L` on `𝓛Q`,
   `SH_*(T*Q; Π*L) ≅ H_*(𝓛Q; L ⊗ η)`. The proof is by hybrid Floer-to-Morse moduli spaces in the
   finite-dimensional approximation (Abbondandolo--Schwarz, as organized in Abouzaid).
3. **Theorem K.** For a DG local system `𝓕` on `𝓛Q` with `H_*(𝓕)` bounded below,
   `SH_*(T*Q; Π*𝓕) ≅ H_*(𝓛Q; 𝓕 ⊗ η)`. The steps, in the source's numbering:
   - the half-cylinder moduli spaces `𝓜(x)` and their dimension and orientation lines
     (Proposition 4.6);
   - their representing chains `s_x` (Proposition 4.7) and the equation `∂m_x = Σ m^η_{x,y} m_y`
     (Proposition 4.9);
   - the hybrid moduli spaces `𝓑(x; y)` (Proposition 4.10), their representing chains
     (Proposition 4.11), evaluation maps (Proposition 4.13) and the equation for `b_{x,y}`
     (Proposition 4.14);
   - the finite-dimensional reduction (Lemma 4.15);
   - the chain map `Ψ̃^r` (Proposition 4.16).

   The map is an isomorphism by comparison of index spectral sequences, whose `E²` map is item 2.
4. The zero-energy part of Theorem K (Proposition 4.1), and the transfer of DG local systems from
   `𝓛Q` to `𝓛T*Q` (Corollary 4.17).
5. Source: the source paper §4; Abbondandolo--Schwarz, *On the Floer homology of cotangent bundles*
   and its corrigendum; Abouzaid, op. cit., Sections 5--8.

## Layer 10: the criteria and their applications to cotangent bundles

1. **Theorem L (= Theorem 5.1)**, through:
   - the relative capacity bound (Proposition 5.5);
   - the fast-orbit lemma (Lemma 5.7);
   - the spectral invariants `ρ(·, σ)` and their properties (Proposition 5.8).
2. **Theorem M (= Theorem 6.4)**, through the capacity bound `c°_HZ(W) ≤ c(α)` (Proposition 6.6).
   The cotangent form of Theorem M is Proposition 6.7.
3. **The cotangent criterion** (Proposition 5.9).
4. **The kernel of `i_{Q*}`.**
   - `Ω²Q` has the homology of a point if and only if `Q` is a `K(π,1)` (Lemma 3.41).
   - Proposition 5.11: the kernel of `i_{Q*}` contains an infinite cyclic group, a copy of
     `π_k(Q)`, or a class that is not `d`-torsion, according to the first nonvanishing higher
     homotopy group.
   - `ker π_{U!}` is `d`-torsion (Proposition 5.13).
5. **Theorems A, B, C** in their general forms (Theorems 5.10, 5.14, 5.15), with the degree
   hypotheses stated homologically: `deg(π ∘ φ)` by `(π ∘ φ)_*[S] = d · [Q]` over `ℤ`, and the mod-2
   degree by the same equation with `𝔽₂`-fundamental classes from the algebraic topology
   roadmap's Stage 6. **Corollaries D and E**, from
   Layer 6. The `𝔽₂` stage of Layers 5 and 7--9 is enough for Theorem C.
6. Source: the source paper §§5, 6.1--6.2.

## Layer 11: manifolds abundant with 2-spheres, and knotted hypersurfaces

1. **Abundance** (Definitions 1.7 and 6.11), **Theorem H** (= Theorem 6.12), and stability under
   products (Proposition 6.13).
2. **Fibered families of 2-spheres** (Definition 6.14, Proposition 6.15).
   - Even spheres: the Pontryagin ring `H_*(ΩSⁿ)` as a polynomial ring on the class of the DG
     Morse cocycle (Proposition 6.18, proved as in the source through Layer 5), and nonvanishing of
     the Stiefel class in `H_{2n−3}(Ω²Sⁿ)` (Proposition 6.17).
   - Spheres `S^{4k−1}`: the class in `H_{n−2}(Ω²Sⁿ) ≅ ℤ` is a generator (Proposition 6.21).
   - Sphere bundles over highly connected bases (Proposition 6.23).
3. **Covering by diffeomorphisms** (Definitions 6.26 and 6.32, over geometric topology's `Diff(M)`).
   - Abundance of manifolds covered, or `ℓ`-covered, by diffeomorphisms (Propositions 6.29
     and 6.33).
   - Compact connected Lie groups that are not a `K(π,1)` (Proposition 6.31 in that form).
   - Odd spheres, by the source's second proof (Proposition 6.34).
4. **Homogeneous spaces** (Proposition 6.36), including `S² = SO(3)/SO(2)`.
5. **Projective spaces.** `CPᵈ` (Proposition 6.38) and `HPᵈ` (Proposition 6.39 without the Cayley
   plane), from Layer 5 item 7. These give **Theorem I** within the scope boundary.
6. **Knotted hypersurfaces.** **Theorem G** (= Theorem 7.1), through Proposition 7.5 and
   Lemmas 7.6 and 7.7, using the Pontryagin--Thom collapse of Layer 1.
7. Source: the source paper §§6.3--6.4 and §7.

## Acceptance criteria

1. **Cubical comparison.** The cubical and simplicial homology of `S¹` and of a point agree through
   the comparison map. The cross product of the fundamental chains of `I` and `I` is the
   fundamental chain of `I²`, on the nose.
2. **Sign audit.** The twisting equation of Layer 4 is the DG roadmap's `(MC)` under the grading
   bridge and the shift identification of its Layer 5. This is checked on a three-generator example
   with `m_{x,z}m_{z,y} ≠ 0`.
3. **Classical recovery.** A DG local system concentrated in degree zero gives back the Morse
   complex with classical local coefficients, naturally in the choices.
4. **Fibration theorem on examples.**
   - The path-loop fibration over `Sⁿ`: `H_*(Sⁿ; C_*(ΩSⁿ)) ≅ H_*(pt)`.
   - The Hopf fibration `S¹ → S³ → S²`: gives `H_*(S³)`.
   - The trivial fibration: recovers Künneth.
5. **Mapping spaces.**
   - `π₀ Map_*(S², S²) ≅ ℤ`.
   - The kernel of `i_{S²*}` contains `ℤ` in degree zero.
   - `Ω²Tⁿ` has contractible components.
   - `H₁(Ω²S³) ≅ ℤ`, through Layer 1 item 1.
6. **Floer.** `FH_*(H) ≅ H_{*+n}(X)` for a `C²`-small Morse Hamiltonian on a closed aspherical
   `X`. Theorem J for the trivial fibration recovers it with coefficients.
7. **Viterbo on `E²`.** For `Q = S¹`, both sides of Theorem K with `𝓕 = C_*(Ω𝓛S¹)` are computed
   and the `E²` pages agree.
8. **End to end.**
   - For `Q = S²` and a bounded domain `U ⊆ T*S²` containing the zero section, `∂U` has the
     contractible almost existence property.
   - `c°_HZ(D*Sⁿ) < ∞` for every `n ≥ 2`.
   - `c°_HZ(D*SU(2)) < ∞`.

## Source coverage

This section is provenance, not specification: it records where each numbered statement of the
source paper lands, so a reviewer can check that nothing is missing. Numbers follow the revised
version (TeX source of 13 May 2026, compiled).

| Source statements | Layer and item |
| --- | --- |
| Def 1.1 | 6.5 |
| Conj 1.2 | out of scope |
| Thm A, B, C | 10.5 (Thms 5.10, 5.14, 5.15) |
| Cor D, E | 6.3, 6.4, 10.5 |
| Cor F | out of scope |
| Thm G | 11.6 (Thm 7.1) |
| Def 1.7, Thm H | 11.1 (Def 6.11, Thm 6.12) |
| Thm I | 11.2--11.5, without `CaP²` |
| Def 1.8 | 3.1 |
| Defs 1.9--1.11 | 4.1, 4.3 |
| Thm J | 8.6 |
| Thm K | 9.3 |
| Thm L | 10.1 (Thm 5.1) |
| Thm M | 10.2 (Thm 6.4) |
| Lem 2.1, Prop 2.2 | 3.4 |
| Def 2.3, Props 2.5, 2.6, Lem 2.9, Prop 2.12, Cor 2.13, Lem 2.14 | 5.5 |
| Lem 3.1, Prop 3.3 | 7.3 |
| Props 3.4, 3.6, Def 3.5 | 8.1 |
| Def 3.7, Props 3.8, 3.9 | 8.2 |
| Def 3.12, Prop 3.13 | 8.3 |
| Props 3.14, 3.16, Defs 3.15, 3.17, 3.21, Props 3.18, 3.19, 3.22, Cors 3.24, 3.25, Props 3.26, 3.27, Cor 3.28, Prop 3.29 | 8.4 |
| Prop 3.30, Def 3.31, Prop 3.32, Def 3.35 | 8.5 |
| Prop 3.36, Thm 3.37, Def 3.38, Thm 3.39 | 8.6 (filtration also 4.4) |
| Lem 3.41 | 10.4 |
| Props 3.44--3.46, Thm 3.49 | 8.7 |
| Prop 4.1, Cor 4.17 | 9.4 |
| Lem 4.5 | 2.1 |
| Props 4.6, 4.7, 4.9--4.11, 4.13, 4.14, Lem 4.15, Prop 4.16 | 9.3 |
| Thm 5.1, Prop 5.5, Lem 5.7, Prop 5.8 | 10.1 |
| Def 5.3 | 6.5 |
| Prop 5.9 | 10.3 |
| Thm 5.10, Thm 5.14, Thm 5.15 | 10.5 |
| Prop 5.11, Prop 5.13 | 10.4 |
| Thm 5.12 | 1.4 |
| Def 6.1, Prop 6.3 | 6.5 |
| Thm 6.4, Props 6.6, 6.7 | 10.2 |
| Def 6.11, Thm 6.12, Prop 6.13 | 11.1 |
| Def 6.14, Props 6.15, 6.17, 6.18, 6.21, 6.23 | 11.2 (degree computation 1.8) |
| Defs 6.26, 6.32, Props 6.29, 6.33 | 11.3 (evaluation fibration 1.6) |
| Prop 6.31 | 11.3, for non-aspherical groups |
| Prop 6.34 | 11.3, second proof (degree computation 1.8) |
| Lem 6.35 | out of scope (not needed by the second proof of 6.34) |
| Prop 6.36 | 11.4 |
| Props 6.38, 6.39 | 11.5 (Morse--Bott input 5.7), without `CaP²` |
| Thm 7.1, Prop 7.5, Lems 7.6, 7.7 | 11.6 (collapse 1.5) |

## Prior formalization

The proposer has formalized Audin--Damian, *Morse Theory and Floer Homology*, in Lean 4 on Mathlib
`v4.34.1`: [t4v1/damian_formalizare](https://github.com/t4v1/damian_formalizare), about 50 000
lines across all sixteen chapters. One `sorry` remains, the Arnold conjecture on the torus. The
spaces of trajectories enter as explicit hypotheses, because there are no submanifolds with
tubular neighbourhoods to build them from. So the Morse and Floer complexes satisfy `∂ ∘ ∂ = 0`
*given* the broken-trajectory counts, and the moduli-space work of Lane M and Layer 7 item 2 is
not done there.

Material that is proved there and absent from Tau Ceti, and that this roadmap can port:

| There | Here |
| --- | --- |
| `Part2/CauchyPompeiu.lean`, `CauchyHolder.lean`, `FloerRegularity.lean`, `Ch6.lean`: Cauchy and Beurling transforms, Calderón--Zygmund and Schauder estimates on the Hölder scale, elliptic regularity of the Floer equation (`contDiff_of_isFloerSolution`), energy and gradient bounds, convergence at the ends, compactness for bounded energy (`compactness_of_energy_bounded`), on `ℝ²ⁿ` and the torus | Layer 7 items 1--2, flat case; a Hölder-scale alternative to the Sobolev route of Lanes F0--F1 |
| `Part2/Rho*.lean`, `Maslov*.lean`, `Ch7.lean`: `ρ : Sp(2n) → S¹` with all its properties (`exists_isRho`), Maslov index of symplectic paths | Layer 7 item 1, the Conley--Zehnder index |
| `Part2/Darboux.lean`, `Ch5.lean` (`darboux`): Darboux by Moser's method | Layer 6 and the HamiltonianSystems roadmap |
| `Part1/Ch3.lean`, `Ch4.lean`: algebra of the Morse complex from abstract trajectory counts, Künneth, duality | Layer 5 items 1--3, algebraic part |

The Morse lemma and Sard's theorem are formalized there too, but Tau Ceti already has them, so they
are not ported. Porting is ordinary Tau Ceti work: one claimed item at a time, adapted to Tau Ceti's
Mathlib and conventions.

## References

- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Floer homology with DG coefficients.
  Applications to cotangent bundles*, [arXiv:2404.07953](https://arxiv.org/abs/2404.07953): the
  source paper.
- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Morse homology with differential graded
  coefficients*, Progress in Mathematics 360, Birkhäuser, 2025 (BDHO): Layers 0 and 3--5.
- J.-F. Barraud, O. Cornea, *Lagrangian intersections and the Serre spectral sequence*, Ann. of
  Math. 166 (2007), including Appendix A on corner structures; *Quantization of the Serre
  spectral sequence*, J. Symplectic Geom. 5 (2007).
- W. S. Massey, *Singular Homology Theory*, GTM 70, Springer, 1980: cubical singular chains.
- J.-P. Serre, *Homologie singulière des espaces fibrés. Applications*, Ann. of Math. 54 (1951);
  *Groupes d'homotopie et classes de groupes abéliens*, Ann. of Math. 58 (1953).
- R. Palais, *Local triviality of the restriction map for embeddings*, Comment. Math. Helv. 34
  (1960).
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959); W. Ziller,
  *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977).
- M. Audin, M. Damian, *Morse Theory and Floer Homology*, Universitext, Springer, 2014.
- D. Salamon, *Lectures on Floer homology*, IAS/Park City Math. Ser. 7 (1999).
- M. Abouzaid, *Symplectic cohomology and Viterbo's theorem*, in *Free loop spaces in geometry and
  topology*, IRMA Lect. Math. Theor. Phys. 24 (2015).
- A. Abbondandolo, M. Schwarz, *On the Floer homology of cotangent bundles*, Comm. Pure Appl. Math.
  59 (2006), and corrigendum.
- H. Hofer, E. Zehnder, *Symplectic Invariants and Hamiltonian Dynamics*, Birkhäuser, 1994;
  M. Struwe, Bol. Soc. Brasil. Mat. 20 (1990).
- K. Irie, *Hofer--Zehnder capacity of unit disk cotangent bundles and the loop product*, JEMS 16
  (2014); P. Albers, U. Frauenfelder, A. Oancea, Math. Ann. 367 (2017).

## How to drive it

The material splits into three largely independent parts:
1. **Floer analysis**, whose only output is the manifold-with-corners structure of the moduli
   spaces (Lane M and Lanes F0--F2 of the Heegaard Floer roadmap, Layer 7 item 2). This analysis
   is carried out in Barraud--Cornea.
2. **The algebraic definition** of DG Morse and Floer homology from those moduli spaces
   (Layers 0--5 and 8). It consumes only the output of part 1, as a black box. Layers 0--4 and the
   topological hypotheses of the applications do not depend on part 1 at all.
3. **The Viterbo isomorphism** (Layer 9) between DG Floer homology and DG Morse homology of the
   free loop space, a DG version of Abouzaid's proof.

Layers 0--4 start immediately. They depend only on material that exists or is scheduled in the
algebraic topology, geometric topology and DG roadmaps, and each is useful on its own. Layer 6
starts in parallel with them, alongside Lane F2.1.

The purely topological inputs to the applications depend only on Layers 0--3 and the algebraic
topology roadmap:
- Layer 10 item 4;
- the homotopy-theoretic parts of Layer 11, namely items 2--4 and the `Ω²` computations of item 6.

They can land before any Floer theory, stated as the topological hypotheses of Theorems A--I.

Layer 5 follows Lane M of the Heegaard Floer roadmap, and is the first place where the
Barraud--Cornea idea is used on real moduli spaces. Layer 7 follows Lanes F0--F2 and is this
roadmap's analytic headline. Layers 8--10 follow it, and Layer 11 item 5 needs Layer 5 item 7.
